@interface MFNanoBridgeSettingsAccountSpecificMailbox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithAccountUniqueIdentifier:(id)a3 mailboxURL:(id)a4;
- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithCoder:(id)a3;
- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithMailboxUid:(id)a3 account:(id)a4;
- (NSString)accountUniqueIdentifier;
- (NSString)mailboxId;
- (NSURL)mailboxURL;
- (id)_mailboxUid;
- (id)displayName;
- (id)icon;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)level;
- (unint64_t)mailboxFilterType;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateCachedData;
@end

@implementation MFNanoBridgeSettingsAccountSpecificMailbox

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithMailboxUid:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v8 = [v7 account];
  }
  v9 = [v8 uniqueID];
  v10 = [v7 URLString];
  v11 = +[NSURL URLWithString:v10];
  v12 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self initWithAccountUniqueIdentifier:v9 mailboxURL:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailboxUid, a3);
    v12->_type = (int64_t)[(MFMailboxUid *)v12->_mailboxUid type];
  }

  return v12;
}

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithAccountUniqueIdentifier:(id)a3 mailboxURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  id v8 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    accountUniqueIdentifier = v8->_accountUniqueIdentifier;
    v8->_accountUniqueIdentifier = v9;

    objc_storeStrong((id *)&v8->_mailboxURL, a4);
  }

  return v8;
}

- (unint64_t)mailboxFilterType
{
  return 1;
}

- (void)invalidateCachedData
{
  self->_mailboxUid = 0;
  _objc_release_x1();
}

- (int64_t)type
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  id v3 = [v2 type];

  return (int64_t)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_accountUniqueIdentifier forKey:@"kNSCodingKeyAccount"];
  [v5 encodeObject:self->_mailboxURL forKey:@"kNSCodingKeyURL"];
  v4 = +[NSNumber numberWithInteger:self->_type];
  [v5 encodeObject:v4 forKey:@"kNSCodingKeyType"];
}

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  id v5 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccount"];
    accountUniqueIdentifier = v5->_accountUniqueIdentifier;
    v5->_accountUniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyURL"];
    mailboxURL = v5->_mailboxURL;
    v5->_mailboxURL = (NSURL *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyType"];
    v5->_type = (int64_t)[v10 unsignedIntegerValue];
  }
  return v5;
}

- (id)displayName
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 displayNameUsingSpecialNames];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)icon
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  id v3 = v2;
  if (v2)
  {
    id v4 = +[MFMailboxUid shorcutIconNameForMailboxType:](MFMailboxUid, "shorcutIconNameForMailboxType:", [v2 mailboxType]);
    if (v4)
    {
      id v5 = +[UIImage mf_systemImageNamed:v4 forView:7];
      uint64_t v6 = off_407A8[0]();
      id v7 = [v5 imageWithTintColor:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)level
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  id v3 = v2;
  if (v2)
  {
    if ([v2 mailboxType]) {
      signed int v4 = 0;
    }
    else {
      signed int v4 = [v3 level];
    }
    unint64_t v5 = v4;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isValid
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self mailboxURL];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  if ([(MFNanoBridgeSettingsMailbox *)&v9 isEqual:v4])
  {
    unint64_t v5 = [v4 mailboxURL];
    if ([v5 isEqual:self->_mailboxURL])
    {
      uint64_t v6 = [v4 accountUniqueIdentifier];
      unsigned __int8 v7 = [v6 isEqualToString:self->_accountUniqueIdentifier];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)mailboxId
{
  v2 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)self _mailboxUid];
  id v3 = objc_msgSend(v2, "nano_mailboxId");

  return (NSString *)v3;
}

- (id)_mailboxUid
{
  mailboxUid = self->_mailboxUid;
  if (!mailboxUid)
  {
    id v4 = +[MailAccount accountWithUniqueId:self->_accountUniqueIdentifier];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || ![v4 isActive])
    {
      unsigned __int8 v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_24688((uint64_t)self->_accountUniqueIdentifier, (char)[v4 isActive], v21, v7);
      }
    }
    else
    {
      if (self->_type == 7)
      {
        unint64_t v5 = [v4 mailboxUidOfType:7 createIfNeeded:0];
        uint64_t v6 = self->_mailboxUid;
        self->_mailboxUid = v5;
      }
      else
      {
        p_mailboxURL = &self->_mailboxURL;
        v10 = [(NSURL *)self->_mailboxURL absoluteString];
        v11 = [v4 mailboxUidForURL:v10];
        objc_super v12 = self->_mailboxUid;
        self->_mailboxUid = v11;

        if (!self->_mailboxUid)
        {
          v13 = [(NSURL *)*p_mailboxURL absoluteString];
          v14 = [v4 URLStringFromLegacyURLString:v13];

          v15 = [v4 mailboxUidForURL:v14];
          v16 = self->_mailboxUid;
          self->_mailboxUid = v15;

          if (self->_mailboxUid)
          {
            v17 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v14];
            v18 = *p_mailboxURL;
            *p_mailboxURL = v17;
          }
          else
          {
            v19 = MFLogGeneral();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_246E4((uint64_t *)&self->_mailboxURL, v19);
            }
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![(MFMailboxUid *)self->_mailboxUid type]) {
        id v20 = [v4 primaryMailboxUid];
      }
    }

    mailboxUid = self->_mailboxUid;
  }

  return mailboxUid;
}

- (NSString)accountUniqueIdentifier
{
  return self->_accountUniqueIdentifier;
}

- (NSURL)mailboxURL
{
  return self->_mailboxURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxURL, 0);

  objc_storeStrong((id *)&self->_mailboxUid, 0);
}

@end