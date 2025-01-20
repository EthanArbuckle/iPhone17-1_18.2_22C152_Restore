@interface CalCalendarMigrationCalDAVPrincipal
- (BOOL)_anyCalendarUserAddressIsEquivalentToURL:(id)a3;
- (BOOL)addressIsAccountOwner:(id)a3;
- (BOOL)addressURLIsAccountOwner:(id)a3;
- (BOOL)isDelegate;
- (BOOL)isExpandPropertyReportSupported;
- (BOOL)isWritable;
- (CalCalendarMigrationCalDAVPrincipal)initWithUid:(id)a3;
- (NSArray)preferredCalendarUserAddresses;
- (NSDictionary)pushTransports;
- (NSString)defaultCalendarPath;
- (NSString)fullName;
- (NSString)homePath;
- (NSString)homePushKey;
- (NSString)inboxPath;
- (NSString)login;
- (NSString)notificationCollectionPath;
- (NSString)outboxPath;
- (NSString)ownerUid;
- (NSString)principalPath;
- (NSString)uid;
- (NSURL)principalURL;
- (id)_absoluteURLStringWithBaseComponents:(id)a3 andPath:(id)a4;
- (id)_packedPreferredCalendarUserAddresses;
- (id)dictionaryForAccountProperties;
- (void)dictionaryForAccountProperties;
- (void)setDefaultCalendarPath:(id)a3;
- (void)setDelegate:(BOOL)a3;
- (void)setExpandPropertyReportSupported:(BOOL)a3;
- (void)setFullName:(id)a3;
- (void)setHomePath:(id)a3;
- (void)setHomePushKey:(id)a3;
- (void)setInboxPath:(id)a3;
- (void)setLogin:(id)a3;
- (void)setNotificationCollectionPath:(id)a3;
- (void)setOutboxPath:(id)a3;
- (void)setOwnerUid:(id)a3;
- (void)setPreferredCalendarUserAddresses:(id)a3;
- (void)setPrincipalURL:(id)a3;
- (void)setPushTransports:(id)a3;
- (void)setWritable:(BOOL)a3;
@end

@implementation CalCalendarMigrationCalDAVPrincipal

- (CalCalendarMigrationCalDAVPrincipal)initWithUid:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalCalendarMigrationCalDAVPrincipal;
  v5 = [(CalCalendarMigrationCalDAVPrincipal *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uid = v5->_uid;
    v5->_uid = (NSString *)v6;
  }
  return v5;
}

- (id)dictionaryForAccountProperties
{
  v3 = [(CalCalendarMigrationCalDAVPrincipal *)self principalURL];

  if (v3)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = [(CalCalendarMigrationCalDAVPrincipal *)self uid];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F30208]];

    uint64_t v6 = (void *)MEMORY[0x263F08BA0];
    v7 = [(CalCalendarMigrationCalDAVPrincipal *)self principalURL];
    v8 = [v6 componentsWithURL:v7 resolvingAgainstBaseURL:0];

    v29 = [v8 path];
    [v8 setQuery:0];
    [v8 setFragment:0];
    objc_super v9 = [(CalCalendarMigrationCalDAVPrincipal *)self login];
    [v8 setUser:v9];

    [v4 setObject:v29 forKeyedSubscript:*MEMORY[0x263F30200]];
    v10 = [(CalCalendarMigrationCalDAVPrincipal *)self homePath];
    v11 = [(CalCalendarMigrationCalDAVPrincipal *)self _absoluteURLStringWithBaseComponents:v8 andPath:v10];

    [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F30170]];
    v12 = [(CalCalendarMigrationCalDAVPrincipal *)self defaultCalendarPath];
    v13 = [(CalCalendarMigrationCalDAVPrincipal *)self _absoluteURLStringWithBaseComponents:v8 andPath:v12];

    [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x263F301B8]];
    v14 = [(CalCalendarMigrationCalDAVPrincipal *)self inboxPath];
    v15 = [(CalCalendarMigrationCalDAVPrincipal *)self _absoluteURLStringWithBaseComponents:v8 andPath:v14];

    [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x263F30188]];
    v16 = [(CalCalendarMigrationCalDAVPrincipal *)self outboxPath];
    v17 = [(CalCalendarMigrationCalDAVPrincipal *)self _absoluteURLStringWithBaseComponents:v8 andPath:v16];

    [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x263F301A0]];
    v18 = [(CalCalendarMigrationCalDAVPrincipal *)self notificationCollectionPath];
    v19 = [(CalCalendarMigrationCalDAVPrincipal *)self _absoluteURLStringWithBaseComponents:v8 andPath:v18];

    [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x263F301E8]];
    v20 = [(CalCalendarMigrationCalDAVPrincipal *)self fullName];
    [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x263F301C0]];

    v21 = [(CalCalendarMigrationCalDAVPrincipal *)self homePushKey];
    [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x263F301A8]];

    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationCalDAVPrincipal isWritable](self, "isWritable"));
    [v4 setObject:v22 forKeyedSubscript:*MEMORY[0x263F301E0]];

    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationCalDAVPrincipal isDelegate](self, "isDelegate"));
    [v4 setObject:v23 forKeyedSubscript:*MEMORY[0x263F301C8]];

    v24 = [(CalCalendarMigrationCalDAVPrincipal *)self _packedPreferredCalendarUserAddresses];
    [v4 setObject:v24 forKeyedSubscript:*MEMORY[0x263F301F0]];

    v25 = [(CalCalendarMigrationCalDAVPrincipal *)self pushTransports];
    [v4 setObject:v25 forKeyedSubscript:*MEMORY[0x263F30210]];

    v26 = (void *)[v4 copy];
  }
  else
  {
    v27 = +[CalMigrationLog calendar];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(CalCalendarMigrationCalDAVPrincipal *)self dictionaryForAccountProperties];
    }

    v26 = 0;
  }
  return v26;
}

- (NSString)principalPath
{
  v2 = (void *)MEMORY[0x263F08BA0];
  v3 = [(CalCalendarMigrationCalDAVPrincipal *)self principalURL];
  id v4 = [v2 componentsWithURL:v3 resolvingAgainstBaseURL:0];

  v5 = [v4 path];

  return (NSString *)v5;
}

- (id)_absoluteURLStringWithBaseComponents:(id)a3 andPath:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    id v5 = a3;
    [v5 setPath:v4];
    uint64_t v6 = [v5 URL];

    id v4 = [v6 absoluteString];
  }
  return v4;
}

- (id)_packedPreferredCalendarUserAddresses
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(CalCalendarMigrationCalDAVPrincipal *)self preferredCalendarUserAddresses];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263EFF980];
    id v5 = [(CalCalendarMigrationCalDAVPrincipal *)self preferredCalendarUserAddresses];
    v3 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(CalCalendarMigrationCalDAVPrincipal *)self preferredCalendarUserAddresses];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [MEMORY[0x263F2FAF0] packCalDAVUserAdress:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v3;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [NSURL URLWithString:v4];
    if (v5
      && [(CalCalendarMigrationCalDAVPrincipal *)self _anyCalendarUserAddressIsEquivalentToURL:v5])
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v7 = NSURL;
      uint64_t v8 = [NSString stringWithFormat:@"mailto:%@", v4];
      uint64_t v9 = [v7 URLWithString:v8];

      if (v9
        && [(CalCalendarMigrationCalDAVPrincipal *)self _anyCalendarUserAddressIsEquivalentToURL:v9])
      {
        BOOL v6 = 1;
      }
      else
      {
        v10 = NSURL;
        v11 = [NSString stringWithFormat:@"tel:%@", v4];
        v12 = [v10 URLWithString:v11];

        BOOL v6 = v12
          && [(CalCalendarMigrationCalDAVPrincipal *)self _anyCalendarUserAddressIsEquivalentToURL:v12];
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  id v4 = [a3 absoluteString];
  LOBYTE(self) = [(CalCalendarMigrationCalDAVPrincipal *)self addressIsAccountOwner:v4];

  return (char)self;
}

- (BOOL)_anyCalendarUserAddressIsEquivalentToURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CalCalendarMigrationCalDAVPrincipal *)self preferredCalendarUserAddresses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isSameAsUserAddressURL:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)ownerUid
{
  return self->_ownerUid;
}

- (void)setOwnerUid:(id)a3
{
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)homePushKey
{
  return self->_homePushKey;
}

- (void)setHomePushKey:(id)a3
{
}

- (NSString)homePath
{
  return self->_homePath;
}

- (void)setHomePath:(id)a3
{
}

- (NSString)defaultCalendarPath
{
  return self->_defaultCalendarPath;
}

- (void)setDefaultCalendarPath:(id)a3
{
}

- (NSString)inboxPath
{
  return self->_inboxPath;
}

- (void)setInboxPath:(id)a3
{
}

- (NSString)outboxPath
{
  return self->_outboxPath;
}

- (void)setOutboxPath:(id)a3
{
}

- (NSString)notificationCollectionPath
{
  return self->_notificationCollectionPath;
}

- (void)setNotificationCollectionPath:(id)a3
{
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (void)setWritable:(BOOL)a3
{
  self->_writable = a3;
}

- (BOOL)isDelegate
{
  return self->_delegate;
}

- (void)setDelegate:(BOOL)a3
{
  self->_delegate = a3;
}

- (BOOL)isExpandPropertyReportSupported
{
  return self->_expandPropertyReportSupported;
}

- (void)setExpandPropertyReportSupported:(BOOL)a3
{
  self->_expandPropertyReportSupported = a3;
}

- (NSArray)preferredCalendarUserAddresses
{
  return self->_preferredCalendarUserAddresses;
}

- (void)setPreferredCalendarUserAddresses:(id)a3
{
}

- (NSDictionary)pushTransports
{
  return self->_pushTransports;
}

- (void)setPushTransports:(id)a3
{
}

- (NSString)login
{
  return self->_login;
}

- (void)setLogin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_login, 0);
  objc_storeStrong((id *)&self->_pushTransports, 0);
  objc_storeStrong((id *)&self->_preferredCalendarUserAddresses, 0);
  objc_storeStrong((id *)&self->_notificationCollectionPath, 0);
  objc_storeStrong((id *)&self->_outboxPath, 0);
  objc_storeStrong((id *)&self->_inboxPath, 0);
  objc_storeStrong((id *)&self->_defaultCalendarPath, 0);
  objc_storeStrong((id *)&self->_homePath, 0);
  objc_storeStrong((id *)&self->_homePushKey, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_ownerUid, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

- (void)dictionaryForAccountProperties
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 uid];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_22133F000, a2, OS_LOG_TYPE_ERROR, "Cannot create dictionary for CalDAVPrincipal %{public}@ because it has no principal URL", (uint8_t *)&v4, 0xCu);
}

@end