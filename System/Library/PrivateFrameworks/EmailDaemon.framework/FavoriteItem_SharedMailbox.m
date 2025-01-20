@interface FavoriteItem_SharedMailbox
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObserving;
- (EFCancelable)observationToken;
- (EFCancelable)unreadCountToken;
- (FavoriteItem_SharedMailbox)initWithDictionary:(id)a3;
- (FavoriteItem_SharedMailbox)initWithSourceType:(unint64_t)a3;
- (id)analyticsKey;
- (id)badgeCountString;
- (id)countQueryPredicate;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemURLString;
- (id)mailboxScope;
- (id)persistentIDForMigration;
- (id)serverCountMailboxScope;
- (unint64_t)hash;
- (unint64_t)sourceType;
- (void)dealloc;
- (void)setIsObserving:(BOOL)a3;
- (void)setObservationToken:(id)a3;
- (void)setUnreadCountToken:(id)a3;
@end

@implementation FavoriteItem_SharedMailbox

- (FavoriteItem_SharedMailbox)initWithSourceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_SharedMailbox;
  result = [(FavoriteItem *)&v5 initWithType:5];
  if (result) {
    result->_sourceType = a3;
  }
  return result;
}

- (void)dealloc
{
  [(FavoriteItem_SharedMailbox *)self setUnreadCountToken:0];
  v3.receiver = self;
  v3.super_class = (Class)FavoriteItem_SharedMailbox;
  [(FavoriteItem_SharedMailbox *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FavoriteItem_SharedMailbox *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_sourceType == v5->_sourceType;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_sourceType;
}

- (FavoriteItem_SharedMailbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_SharedMailbox;
  objc_super v5 = [(FavoriteItem *)&v9 initWithDictionary:v4];
  if (v5
    && ([v4 objectForKey:@"sourceType"],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v5->_sourceType = (unint64_t)[v6 integerValue],
        v6,
        v5->_sourceType > 0x1A))
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)FavoriteItem_SharedMailbox;
  objc_super v3 = [(FavoriteItem *)&v6 dictionaryRepresentation];
  id v4 = +[NSNumber numberWithInteger:self->_sourceType];
  [v3 setObject:v4 forKey:@"sourceType"];

  return v3;
}

- (id)persistentIDForMigration
{
  return +[NSString stringWithFormat:@"SharedMailbox-%i", self->_sourceType];
}

- (id)itemURLString
{
  return +[NSString stringWithFormat:@"favoriteitem://sharedmailbox/%i", self->_sourceType];
}

- (void)setUnreadCountToken:(id)a3
{
  objc_super v5 = (EFCancelable *)a3;
  p_unreadCountToken = &self->_unreadCountToken;
  unreadCountToken = self->_unreadCountToken;
  if (unreadCountToken != v5)
  {
    [(EFCancelable *)unreadCountToken cancel];
    if (*p_unreadCountToken)
    {
      v8 = +[FavoriteItem log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (id)objc_opt_class();
        v10 = [(FavoriteItem_SharedMailbox *)self displayName];
        v11 = *p_unreadCountToken;
        int v13 = 138543874;
        id v14 = v9;
        __int16 v15 = 2114;
        v16 = v10;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ - Cancel token:%{public}@", (uint8_t *)&v13, 0x20u);
      }
      v12 = +[NSNotificationCenter defaultCenter];
      [v12 removeObserver:self];

      [(FavoriteItem_SharedMailbox *)self setIsObserving:0];
    }
    objc_storeStrong((id *)&self->_unreadCountToken, a3);
  }
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  unint64_t v2 = [(FavoriteItem_SharedMailbox *)self sourceType];
  objc_super v3 = &stru_10013ED08;
  switch(v2)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
      MFLookupLocalizedString();
      objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v3;
}

- (id)badgeCountString
{
  unint64_t v4 = [(FavoriteItem_SharedMailbox *)self sourceType];
  if (v4 <= 0x1A)
  {
    if (((1 << v4) & 0x2FF800C) != 0)
    {
      objc_super v5 = +[NSBundle bundleWithIdentifier:@"com.apple.Message"];
      objc_super v6 = [v5 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_10013ED08 table:@"Main"];
      v7 = [(FavoriteItem *)self badgeCount];
      uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v7 integerValue]);
    }
    else
    {
      if (((1 << v4) & 0x40001F3) == 0) {
        goto LABEL_7;
      }
      objc_super v5 = +[NSBundle bundleWithIdentifier:@"com.apple.Message"];
      objc_super v6 = [v5 localizedStringForKey:@"UNREAD_COUNT_FORMAT%1$lu" value:&stru_10013ED08 table:@"Main"];
      v7 = [(FavoriteItem *)self badgeCount];
      uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v7 integerValue]);
    }
    unint64_t v2 = (void *)v8;
  }
LABEL_7:

  return v2;
}

- (id)countQueryPredicate
{
  unint64_t v3 = [(FavoriteItem_SharedMailbox *)self sourceType];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  objc_super v5 = 0;
  uint64_t v6 = 1;
  switch(v3)
  {
    case 1uLL:
      int v7 = 1;
      uint64_t v8 = +[EMMessageListItemPredicates predicateForIsVIP:1];
      goto LABEL_19;
    case 2uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForFlaggedMessages];
      goto LABEL_18;
    case 3uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForUnreadMessages];
      goto LABEL_18;
    case 4uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForIncludesMeMessages];
      goto LABEL_10;
    case 5uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForMessagesWithAttachments];
      goto LABEL_10;
    case 6uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForNotifyMessages];
      goto LABEL_10;
    case 7uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForTodayMessages];
      goto LABEL_10;
    case 8uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForMuteMessages];
LABEL_10:
      int v7 = 1;
      goto LABEL_19;
    case 0x10uLL:
      goto LABEL_17;
    case 0x11uLL:
      uint64_t v6 = 0;
      goto LABEL_17;
    case 0x12uLL:
      uint64_t v6 = 5;
      goto LABEL_17;
    case 0x13uLL:
      uint64_t v6 = 4;
      goto LABEL_17;
    case 0x14uLL:
      uint64_t v6 = 2;
      goto LABEL_17;
    case 0x15uLL:
      uint64_t v6 = 3;
      goto LABEL_17;
    case 0x16uLL:
      uint64_t v6 = 6;
LABEL_17:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForFlagColor:v6];
LABEL_18:
      int v7 = 0;
LABEL_19:
      id v9 = (void *)v8;
      [v4 addObject:v8];
      if (v7)
      {
        v10 = +[EMMessageListItemPredicates predicateForUnreadMessages];
        [v4 addObject:v10];
      }
      v11 = [(FavoriteItem_SharedMailbox *)self mailboxScope];
      v12 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v11];
      [v4 addObject:v12];

      objc_super v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

      break;
    default:
      break;
  }

  return v5;
}

- (id)mailboxScope
{
  unint64_t v2 = [(FavoriteItem_SharedMailbox *)self sourceType];
  unint64_t v3 = +[EMMailboxScope mailboxScopeForMailboxTypes:&off_100146520 forExclusion:1];
  uint64_t v4 = +[EMMailboxScope mailboxScopeForMailboxType:7 forExclusion:0];
  objc_super v5 = (void *)v4;
  id v6 = 0;
  if (v2 <= 0x16)
  {
    if (((1 << v2) & 0x7F0144) != 0)
    {
      int v7 = v3;
    }
    else
    {
      int v7 = (void *)v4;
      if (((1 << v2) & 0xBA) == 0) {
        goto LABEL_6;
      }
    }
    id v6 = v7;
  }
LABEL_6:

  return v6;
}

- (id)serverCountMailboxScope
{
  if ((id)[(FavoriteItem_SharedMailbox *)self sourceType] == (id)3)
  {
    unint64_t v3 = [(FavoriteItem_SharedMailbox *)self mailboxScope];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)analyticsKey
{
  unint64_t v2 = [(FavoriteItem_SharedMailbox *)self sourceType] - 1;
  if (v2 <= 0x15 && ((0x3F80FFu >> v2) & 1) != 0)
  {
    unint64_t v3 = +[NSString stringWithFormat:@"Smart_%@", off_10013A428[v2]];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (EFCancelable)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);

  objc_storeStrong((id *)&self->_unreadCountToken, 0);
}

@end