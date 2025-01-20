@interface FavoriteItem_VIPMailbox
- (BOOL)isEqual:(id)a3;
- (EMVIP)VIP;
- (FavoriteItem_VIPMailbox)initWithDictionary:(id)a3;
- (FavoriteItem_VIPMailbox)initWithVIP:(id)a3;
- (id)additionalPredicate;
- (id)analyticsKey;
- (id)countQueryPredicate;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)mailboxScope;
- (id)persistentIDForMigration;
- (id)serverCountMailboxScope;
- (unint64_t)hash;
@end

@implementation FavoriteItem_VIPMailbox

- (FavoriteItem_VIPMailbox)initWithVIP:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_VIPMailbox;
  v6 = [(FavoriteItem *)&v9 initWithType:5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_VIP, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FavoriteItem_VIPMailbox *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(FavoriteItem_VIPMailbox *)self VIP];
    v7 = [v6 identifier];
    v8 = [(FavoriteItem_VIPMailbox *)v5 VIP];
    objc_super v9 = [v8 identifier];
    unsigned __int8 v10 = [v7 isEqualToString:v9];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(FavoriteItem_VIPMailbox *)self VIP];
  v3 = [v2 identifier];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (FavoriteItem_VIPMailbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_VIPMailbox;
  id v5 = [(FavoriteItem *)&v16 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = +[MFMailMessageLibrary defaultInstance];
  v7 = [v6 persistence];
  v8 = [v7 vipManager];

  objc_super v9 = [v4 objectForKey:@"VIPIdentifier"];
  unsigned __int8 v10 = [v9 stringValue];

  uint64_t v11 = [v8 vipWithIdentifier:v10];
  VIP = v5->_VIP;
  v5->_VIP = (EMVIP *)v11;

  v13 = v5->_VIP;
  if (!v13) {
    v14 = 0;
  }
  else {
LABEL_3:
  }
    v14 = v5;

  return v14;
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem_VIPMailbox;
  v3 = [(FavoriteItem *)&v7 dictionaryRepresentation];
  id v4 = [(FavoriteItem_VIPMailbox *)self VIP];
  id v5 = [v4 identifier];
  [v3 setObject:v5 forKey:@"VIPIdentifier"];

  return v3;
}

- (id)persistentIDForMigration
{
  v2 = [(FavoriteItem_VIPMailbox *)self VIP];
  v3 = [v2 identifier];
  id v4 = +[NSString stringWithFormat:@"VIPMailbox-%@", v3];

  return v4;
}

- (id)displayName
{
  v2 = [(FavoriteItem_VIPMailbox *)self VIP];
  v3 = [v2 displayName];

  return v3;
}

- (id)countQueryPredicate
{
  v3 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  id v4 = [(FavoriteItem_VIPMailbox *)self mailboxScope];
  id v5 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v4];

  v6 = [(FavoriteItem_VIPMailbox *)self additionalPredicate];
  v10[0] = v6;
  v10[1] = v3;
  v10[2] = v5;
  objc_super v7 = +[NSArray arrayWithObjects:v10 count:3];
  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  return v8;
}

- (id)mailboxScope
{
  return +[EMMailboxScope mailboxScopeForMailboxType:7 forExclusion:0];
}

- (id)serverCountMailboxScope
{
  return 0;
}

- (id)additionalPredicate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  additionalPredicate = self->_additionalPredicate;
  if (!additionalPredicate)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = [(FavoriteItem_VIPMailbox *)self VIP];
    objc_super v7 = [v6 emailAddresses];

    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = +[EMMessageListItemPredicates predicateForMessagesWithSender:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v12 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];
    p_additionalPredicate = &self->_additionalPredicate;
    v14 = *p_additionalPredicate;
    *p_additionalPredicate = (NSPredicate *)v12;

    additionalPredicate = *p_additionalPredicate;
  }
  v15 = additionalPredicate;
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (id)analyticsKey
{
  return @"VIP";
}

- (EMVIP)VIP
{
  return (EMVIP *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicate, 0);

  objc_storeStrong((id *)&self->_VIP, 0);
}

@end