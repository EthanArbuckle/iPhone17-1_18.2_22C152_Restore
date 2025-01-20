@interface FavoriteItem_Mailbox
+ (BOOL)_defaultShouldSync;
- (BOOL)acceptsMessageTransfers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisible;
- (BOOL)originalPushState;
- (FavoriteItem_Mailbox)initWithDictionary:(id)a3;
- (FavoriteItem_Mailbox)initWithMailbox:(id)a3;
- (MFMailboxUid)mailbox;
- (id)account;
- (id)analyticsKey;
- (id)criterion;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemID;
- (id)itemUUID;
- (id)parentItemID;
- (id)representingMailbox;
- (id)syncKey;
- (id)syncValue;
- (unint64_t)hash;
- (void)_postNotification;
- (void)setMailbox:(id)a3;
- (void)setOriginalPushState:(BOOL)a3;
- (void)wasAddedToCollection:(id)a3;
- (void)wasChangedExternally;
- (void)wasRemovedFromCollecion:(id)a3;
@end

@implementation FavoriteItem_Mailbox

+ (BOOL)_defaultShouldSync
{
  return 1;
}

- (FavoriteItem_Mailbox)initWithMailbox:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_Mailbox;
  v6 = [(FavoriteItem *)&v16 initWithType:2];
  if (v6)
  {
    uint64_t v7 = [v5 representedAccount];
    account = v6->_account;
    v6->_account = (MailAccount *)v7;

    objc_storeStrong((id *)&v6->_mailbox, a3);
    v6->_mailboxType = (int64_t)[(MFMailboxUid *)v6->_mailbox mailboxType];
    v9 = [v5 accountRelativePath];
    v10 = (NSString *)[v9 copy];
    accountRelativePath = v6->_accountRelativePath;
    v6->_accountRelativePath = v10;

    v12 = [(MFMailboxUid *)v6->_mailbox displayName];
    v13 = (NSString *)[v12 copy];
    displayName = v6->_displayName;
    v6->_displayName = v13;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FavoriteItem_Mailbox *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    uint64_t v7 = sub_1000166B0(self->_account);
    v8 = [v6 account];
    v9 = sub_1000166B0(v8);

    if ([v7 isEqualToString:v9]) {
      unsigned __int8 v10 = [v6[16] isEqualToString:self->_accountRelativePath];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_accountRelativePath hash];
}

- (FavoriteItem_Mailbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FavoriteItem_Mailbox;
  id v5 = [(FavoriteItem *)&v19 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"primaryEmail"];
    if (!v6
      || (+[MailAccount accountContainingEmailAddress:v6 includingInactive:1], uint64_t v7 = objc_claimAutoreleasedReturnValue(), account = v5->_account, v5->_account = (MailAccount *)v7, account, !v5->_account))
    {

      v17 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"mailboxPath"];
    accountRelativePath = v5->_accountRelativePath;
    v5->_accountRelativePath = (NSString *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"name"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    v13 = [v4 objectForKeyedSubscript:@"mailboxType"];
    v5->_mailboxType = (int64_t)[v13 integerValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"syncKey"];
    syncKey = v5->super._syncKey;
    v5->super._syncKey = (NSString *)v14;

    objc_super v16 = [v4 objectForKey:@"originalPushState"];

    if (v16) {
      v5->_originalPushState = 1;
    }
  }
  v17 = v5;
LABEL_9:

  return v17;
}

- (id)dictionaryRepresentation
{
  v17.receiver = self;
  v17.super_class = (Class)FavoriteItem_Mailbox;
  v3 = [(FavoriteItem *)&v17 dictionaryRepresentation];
  id v4 = [(MailAccount *)self->_account firstEmailAddress];
  if (v4)
  {
    [v3 setObject:v4 forKey:@"primaryEmail"];
    [v3 setObject:self->_accountRelativePath forKey:@"mailboxPath"];
    id v5 = [(FavoriteItem_Mailbox *)self displayName];
    [v3 setObject:v5 forKey:@"name"];

    mailbox = self->_mailbox;
    if (mailbox) {
      id mailboxType = [(MFMailboxUid *)mailbox mailboxType];
    }
    else {
      id mailboxType = self->_mailboxType;
    }
    uint64_t v9 = +[NSNumber numberWithInteger:mailboxType];
    [v3 setObject:v9 forKey:@"mailboxType"];

    unsigned __int8 v10 = [(FavoriteItem_Mailbox *)self syncKey];
    [v3 setObject:v10 forKey:@"syncKey"];

    if ([(FavoriteItem_Mailbox *)self originalPushState])
    {
      [(FavoriteItem_Mailbox *)self originalPushState];
      uint64_t v11 = NSStringFromBOOL();
      [v3 setObject:v11 forKey:@"originalPushState"];
    }
  }
  else
  {
    v8 = +[FavoriteItem log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      accountRelativePath = self->_accountRelativePath;
      uint64_t v14 = [(FavoriteItem_Mailbox *)self displayName];
      v15 = self->_mailbox;
      objc_super v16 = [(FavoriteItem_Mailbox *)self syncKey];
      *(_DWORD *)buf = 138413058;
      objc_super v19 = accountRelativePath;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "(NOT A CRASH) FavoriteItem_Mailbox dictionaryRepresentation primary==nil accountRelativePath:%@ displayName:%@ mailbox:%@ sync:%@", buf, 0x2Au);
    }
    [v3 removeAllObjects];
  }

  return v3;
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
    id v5 = [(FavoriteItem_Mailbox *)self itemUUID];
    v6 = +[NSString stringWithFormat:@"%@-%@", collectionID, v5];
    uint64_t v7 = self->super._itemID;
    self->super._itemID = v6;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (id)itemUUID
{
  itemUUID = self->super._itemUUID;
  if (!itemUUID)
  {
    id v4 = [(FavoriteItem_Mailbox *)self representingMailbox];
    id v5 = [v4 uniqueId];
    v6 = self->super._itemUUID;
    self->super._itemUUID = v5;

    itemUUID = self->super._itemUUID;
  }

  return itemUUID;
}

- (id)parentItemID
{
  v2 = [(FavoriteItem_Mailbox *)self account];
  v3 = [v2 uniqueID];

  return v3;
}

- (id)displayName
{
  if (self->_mailbox)
  {
    v2 = [(MFMailboxUid *)self->_mailbox displayName];
  }
  else
  {
    v2 = self->_displayName;
  }

  return v2;
}

- (BOOL)isVisible
{
  return [(MailAccount *)self->_account isEnabledForDataclass:kAccountDataclassMail];
}

- (id)criterion
{
  v2 = [(FavoriteItem_Mailbox *)self representingMailbox];
  v3 = +[MFMessageCriterion criterionForMailbox:v2];

  return v3;
}

- (id)account
{
  return self->_account;
}

- (id)representingMailbox
{
  mailbox = self->_mailbox;
  if (!mailbox)
  {
    unsigned int v4 = [(MailAccount *)self->_account isEnabledForDataclass:kAccountDataclassMail];
    if (v4)
    {
      unsigned int v5 = +[MFMailboxUid isStandardizedMailboxUidType:self->_mailboxType];
      account = self->_account;
      if (v5) {
        [(MailAccount *)account mailboxUidOfType:self->_mailboxType createIfNeeded:0];
      }
      else {
      uint64_t v7 = [(MailAccount *)account mailboxUidForRelativePath:self->_accountRelativePath create:0];
      }
      v8 = self->_mailbox;
      self->_mailbox = v7;
    }
    mailbox = self->_mailbox;
    if (!mailbox)
    {
      uint64_t v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int64_t mailboxType = self->_mailboxType;
        uint64_t v11 = [(MailAccount *)self->_account ef_publicDescription];
        int v13 = 138413058;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        int64_t v16 = mailboxType;
        __int16 v17 = 2048;
        uint64_t v18 = v4;
        __int16 v19 = 2112;
        __int16 v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Favorites %@ Could not find representingMailbox mailboxType:%ld accountIsEnabled:%ld account:%@", (uint8_t *)&v13, 0x2Au);
      }
      mailbox = self->_mailbox;
    }
  }

  return mailbox;
}

- (BOOL)acceptsMessageTransfers
{
  v2 = [(FavoriteItem_Mailbox *)self representingMailbox];
  unsigned __int8 v3 = +[MFMailboxUid typeIsValidTransferDestination:](MFMailboxUid, "typeIsValidTransferDestination:", [v2 mailboxType]);

  return v3;
}

- (id)syncKey
{
  syncKey = self->super._syncKey;
  if (!syncKey)
  {
    unsigned int v4 = +[NSString ef_UUID];
    unsigned int v5 = self->super._syncKey;
    self->super._syncKey = v4;

    syncKey = self->super._syncKey;
  }

  return syncKey;
}

- (id)syncValue
{
  unsigned __int8 v3 = [(FavoriteItem_Mailbox *)self dictionaryRepresentation];
  unsigned int v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  unsigned int v5 = [(MailAccount *)self->_account username];
  v6 = [(MailAccount *)self->_account hostname];
  uint64_t v7 = +[NSString stringWithFormat:@"%@@%@", v5, v6];

  v8 = [v7 lowercaseString];
  [v4 setObject:v8 forKey:@"usernameHostInfo"];

  [v4 removeObjectForKey:@"selected"];
  [v4 removeObjectForKey:@"originalPushState"];

  return v4;
}

- (void)wasAddedToCollection:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_Mailbox;
  [(FavoriteItem *)&v16 wasAddedToCollection:v4];
  if ([v4 isMailboxesCollection])
  {
    unsigned int v5 = [(FavoriteItem_Mailbox *)self representingMailbox];
    if (v5)
    {
      v6 = [(FavoriteItem_Mailbox *)self account];
      uint64_t v7 = [v6 pushedMailboxUids];
      id v8 = [v7 containsObject:v5];

      [(FavoriteItem_Mailbox *)self setOriginalPushState:v8];
      if ((v8 & 1) == 0)
      {
        uint64_t v9 = sub_10001742C();
        unsigned __int8 v10 = _NSConcreteStackBlock;
        uint64_t v11 = 3221225472;
        v12 = sub_100017480;
        int v13 = &unk_100139C20;
        uint64_t v14 = self;
        id v15 = v5;
        dispatch_async(v9, &v10);
      }
    }
    [(FavoriteItem_Mailbox *)self _postNotification];
  }
}

- (void)wasRemovedFromCollecion:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_Mailbox;
  [(FavoriteItem *)&v16 wasRemovedFromCollecion:v4];
  if ([v4 isMailboxesCollection])
  {
    unsigned int v5 = [(FavoriteItem_Mailbox *)self representingMailbox];
    if (v5)
    {
      v6 = [(FavoriteItem_Mailbox *)self account];
      uint64_t v7 = [v6 pushedMailboxUids];
      unsigned int v8 = [v7 containsObject:v5];

      if (v8)
      {
        if (![(FavoriteItem_Mailbox *)self originalPushState])
        {
          uint64_t v9 = sub_10001742C();
          unsigned __int8 v10 = _NSConcreteStackBlock;
          uint64_t v11 = 3221225472;
          v12 = sub_100017698;
          int v13 = &unk_100139C20;
          uint64_t v14 = self;
          id v15 = v5;
          dispatch_async(v9, &v10);
        }
      }
    }
    [(FavoriteItem_Mailbox *)self _postNotification];
  }
}

- (void)wasChangedExternally
{
  unsigned __int8 v3 = [(MFMailboxUid *)self->_mailbox accountRelativePath];
  accountRelativePath = self->_accountRelativePath;
  self->_accountRelativePath = v3;

  [(FavoriteItem_Mailbox *)self _postNotification];
}

- (void)_postNotification
{
  unsigned __int8 v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001781C;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)analyticsKey
{
  return (id)NSStringFromMailboxUidType();
}

- (BOOL)originalPushState
{
  return self->_originalPushState;
}

- (void)setOriginalPushState:(BOOL)a3
{
  self->_originalPushState = a3;
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMailbox:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountRelativePath, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_mailbox, 0);
}

@end