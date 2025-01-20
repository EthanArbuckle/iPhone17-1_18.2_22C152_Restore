@interface FavoriteItem_Account
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpandable;
- (BOOL)isExpandableInEditMode;
- (BOOL)isVisible;
- (FavoriteItem_Account)initWithAccount:(id)a3;
- (FavoriteItem_Account)initWithDictionary:(id)a3;
- (id)account;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemID;
- (id)persistentIDForMigration;
- (id)representingMailbox;
- (unint64_t)hash;
@end

@implementation FavoriteItem_Account

- (FavoriteItem_Account)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_Account;
  v6 = [(FavoriteItem *)&v9 initWithType:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    [(FavoriteItem *)v7 setExpanded:1];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FavoriteItem_Account *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = v6[13];
    v8 = [(MailAccount *)self->_account uniqueID];
    objc_super v9 = [v7 uniqueID];
    if ([v8 isEqualToString:v9])
    {
      v10 = [(FavoriteItem_Account *)self itemID];
      v11 = [v6 itemID];
      unsigned __int8 v12 = [v10 isEqualToString:v11];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(MailAccount *)self->_account uniqueID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (FavoriteItem_Account)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FavoriteItem_Account;
  id v5 = [(FavoriteItem *)&v12 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 objectForKey:@"uniqueID"];
  if (v6)
  {
    uint64_t v7 = +[MailAccount accountWithUniqueId:v6];
    account = v5->_account;
    v5->_account = (MailAccount *)v7;
  }
  objc_super v9 = v5->_account;

  if (!v9) {
    v10 = 0;
  }
  else {
LABEL_5:
  }
    v10 = v5;

  return v10;
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem_Account;
  id v3 = [(FavoriteItem *)&v7 dictionaryRepresentation];
  id v4 = [(MailAccount *)self->_account uniqueID];
  if (v4)
  {
    [v3 setObject:v4 forKey:@"uniqueID"];
  }
  else
  {
    id v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000C0594((uint64_t)self, v5);
    }

    [v3 removeAllObjects];
  }

  return v3;
}

- (id)itemID
{
  id v3 = [(MailAccount *)self->_account uniqueID];
  id v4 = [(FavoriteItem_Account *)self displayName];
  id v5 = +[EFPrivacy partiallyRedactedStringForString:v4];
  v6 = +[NSString stringWithFormat:@"%@-%@", v3, v5];

  return v6;
}

- (id)displayName
{
  return [(MailAccount *)self->_account displayName];
}

- (BOOL)isVisible
{
  return [(MailAccount *)self->_account isEnabledForDataclass:kAccountDataclassMail];
}

- (id)account
{
  return self->_account;
}

- (id)representingMailbox
{
  return [(MailAccount *)self->_account primaryMailboxUid];
}

- (id)persistentIDForMigration
{
  return [(MailAccount *)self->_account uniqueID];
}

- (BOOL)isExpandable
{
  return 1;
}

- (BOOL)isExpandableInEditMode
{
  return 1;
}

- (void).cxx_destruct
{
}

@end