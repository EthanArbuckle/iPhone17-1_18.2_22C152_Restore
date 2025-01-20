@interface FavoriteItem_Inbox
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)acceptsMessageTransfers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisible;
- (FavoriteItem_Inbox)initWithAccount:(id)a3;
- (FavoriteItem_Inbox)initWithDictionary:(id)a3;
- (id)account;
- (id)analyticsKey;
- (id)criterion;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemID;
- (id)parentItemID;
- (id)persistentIDForMigration;
- (id)representingMailbox;
- (id)uniqueIDAndDisplayName;
- (unint64_t)hash;
@end

@implementation FavoriteItem_Inbox

- (FavoriteItem_Inbox)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_Inbox;
  v6 = [(FavoriteItem *)&v9 initWithType:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FavoriteItem_Inbox *)a3;
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
      v10 = [(FavoriteItem_Inbox *)self uniqueIDAndDisplayName];
      v11 = [v6 uniqueIDAndDisplayName];
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

- (FavoriteItem_Inbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FavoriteItem_Inbox;
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
  v7.super_class = (Class)FavoriteItem_Inbox;
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
      sub_1000C060C((uint64_t)self, v5);
    }

    [v3 removeAllObjects];
  }

  return v3;
}

- (id)uniqueIDAndDisplayName
{
  uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  if (!uniqueIDAndDisplayName)
  {
    id v4 = [(FavoriteItem_Inbox *)self representingMailbox];
    id v5 = [v4 uniqueId];
    v6 = [(FavoriteItem_Inbox *)self displayName];
    objc_super v7 = +[EFPrivacy partiallyRedactedStringForString:v6];
    v8 = +[NSString stringWithFormat:@"%@-%@", v5, v7];
    objc_super v9 = self->_uniqueIDAndDisplayName;
    self->_uniqueIDAndDisplayName = v8;

    uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  }

  return uniqueIDAndDisplayName;
}

- (id)itemID
{
  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID) {
      CFStringRef collectionID = (const __CFString *)self->super._collectionID;
    }
    else {
      CFStringRef collectionID = &stru_10013ED08;
    }
    id v5 = [(FavoriteItem_Inbox *)self uniqueIDAndDisplayName];
    v6 = +[NSString stringWithFormat:@"%@-%@", collectionID, v5];
    objc_super v7 = self->super._itemID;
    self->super._itemID = v6;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (id)parentItemID
{
  v2 = [(FavoriteItem_Inbox *)self account];
  id v3 = [v2 uniqueID];

  return v3;
}

- (BOOL)_displayNameShouldBeRedacted
{
  v2 = +[DaemonAppController sharedController];
  id v3 = [v2 accountsProvider];
  unsigned __int8 v4 = [v3 isDisplayingMultipleAccounts];

  return v4;
}

- (id)displayName
{
  id v3 = +[DaemonAppController sharedController];
  unsigned __int8 v4 = [v3 accountsProvider];
  unsigned int v5 = [v4 isDisplayingMultipleAccounts];

  if (v5) {
    [(MailAccount *)self->_account displayName];
  }
  else {
  v6 = +[MFMailboxUid specialNameForType:7];
  }

  return v6;
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

- (BOOL)acceptsMessageTransfers
{
  return 1;
}

- (id)criterion
{
  v2 = [(FavoriteItem_Inbox *)self representingMailbox];
  id v3 = +[MFMessageCriterion criterionForMailbox:v2];

  return v3;
}

- (id)persistentIDForMigration
{
  return [(MailAccount *)self->_account uniqueID];
}

- (id)analyticsKey
{
  return (id)NSStringFromMailboxUidType();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDAndDisplayName, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end