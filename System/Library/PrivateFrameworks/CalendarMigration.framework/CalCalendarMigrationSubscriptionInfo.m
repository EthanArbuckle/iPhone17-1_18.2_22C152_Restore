@interface CalCalendarMigrationSubscriptionInfo
- (BOOL)disableAlarms;
- (BOOL)filterAlarms;
- (BOOL)filterAttachments;
- (BOOL)insecureConnectionApproved;
- (BOOL)isManagedByServer;
- (CalCalendarMigrationSubscriptionInfo)initWithCalendarDirectory:(id)a3 subscriptionURL:(id)a4 username:(id)a5 principalUid:(id)a6;
- (NSString)calDAVPath;
- (NSString)password;
- (NSString)principalUid;
- (NSString)subscriptionURL;
- (NSString)subscriptionURLWithUsername;
- (NSString)title;
- (NSString)username;
- (NSURL)calendarDirectory;
- (double)refreshInterval;
- (id)_dictionaryForAccountProperties;
- (id)dictionaryForParentAccountProperties;
- (void)setCalDAVPath:(id)a3;
- (void)setDisableAlarms:(BOOL)a3;
- (void)setFilterAlarms:(BOOL)a3;
- (void)setFilterAttachments:(BOOL)a3;
- (void)setInsecureConnectionApproved:(BOOL)a3;
- (void)setIsManagedByServer:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setRefreshInterval:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation CalCalendarMigrationSubscriptionInfo

- (CalCalendarMigrationSubscriptionInfo)initWithCalendarDirectory:(id)a3 subscriptionURL:(id)a4 username:(id)a5 principalUid:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CalCalendarMigrationSubscriptionInfo;
  v15 = [(CalCalendarMigrationSubscriptionInfo *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_calendarDirectory, a3);
    objc_storeStrong((id *)&v16->_subscriptionURL, a4);
    if (v13)
    {
      v17 = [NSURL URLWithString:v12];
      v18 = v17;
      if (v17)
      {
        v19 = [v17 CDVURLWithUser:v13];
        uint64_t v20 = [v19 absoluteString];
        subscriptionURLWithUsername = v16->_subscriptionURLWithUsername;
        v16->_subscriptionURLWithUsername = (NSString *)v20;
      }
    }
    if (!v16->_subscriptionURLWithUsername) {
      objc_storeStrong((id *)&v16->_subscriptionURLWithUsername, v16->_subscriptionURL);
    }
    objc_storeStrong((id *)&v16->_principalUid, a6);
  }

  return v16;
}

- (id)_dictionaryForAccountProperties
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(CalCalendarMigrationSubscriptionInfo *)self subscriptionURL];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F302C8]];
  v5 = [(CalCalendarMigrationSubscriptionInfo *)self title];

  if (v5)
  {
    v6 = [(CalCalendarMigrationSubscriptionInfo *)self title];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F302D0]];
  }
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo filterAlarms](self, "filterAlarms"));
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F30290]];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F302C0]];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo filterAttachments](self, "filterAttachments"));
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F30298]];

  v9 = NSNumber;
  [(CalCalendarMigrationSubscriptionInfo *)self refreshInterval];
  id v11 = [v9 numberWithInt:(int)v10];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x263F302B8]];

  if ([(CalCalendarMigrationSubscriptionInfo *)self isManagedByServer]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F302B0]];
  }
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo insecureConnectionApproved](self, "insecureConnectionApproved"));
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x263F302A8]];

  if ((unint64_t)[v4 length] >= 5
    && !objc_msgSend(v4, "compare:options:range:", @"ftp://", 1, 0, 5))
  {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F302E0]];
  }
  BOOL v13 = (unint64_t)[v4 length] >= 8
     && objc_msgSend(v4, "compare:options:range:", @"https://", 1, 0, 8) == 0;
  id v14 = [NSNumber numberWithBool:v13];
  [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F30128]];

  v15 = (void *)MEMORY[0x263F30078];
  v16 = [(CalCalendarMigrationSubscriptionInfo *)self subscriptionURL];
  v17 = [v15 hostStringFromURLString:v16];

  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x263F30120]];
  }
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F302D8]];

  return v3;
}

- (id)dictionaryForParentAccountProperties
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(CalCalendarMigrationSubscriptionInfo *)self _dictionaryForAccountProperties];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F302C8], *MEMORY[0x263F302D0], *MEMORY[0x263F30290], *MEMORY[0x263F302B8], *MEMORY[0x263F30298], 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [v2 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (([v3 containsObject:v9] & 1) == 0) {
          [v2 removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (NSURL)calendarDirectory
{
  return self->_calendarDirectory;
}

- (NSString)principalUid
{
  return self->_principalUid;
}

- (NSString)subscriptionURL
{
  return self->_subscriptionURL;
}

- (NSString)subscriptionURLWithUsername
{
  return self->_subscriptionURLWithUsername;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isManagedByServer
{
  return self->_isManagedByServer;
}

- (void)setIsManagedByServer:(BOOL)a3
{
  self->_isManagedByServer = a3;
}

- (BOOL)insecureConnectionApproved
{
  return self->_insecureConnectionApproved;
}

- (void)setInsecureConnectionApproved:(BOOL)a3
{
  self->_insecureConnectionApproved = a3;
}

- (NSString)calDAVPath
{
  return self->_calDAVPath;
}

- (void)setCalDAVPath:(id)a3
{
}

- (BOOL)filterAlarms
{
  return self->_filterAlarms;
}

- (void)setFilterAlarms:(BOOL)a3
{
  self->_filterAlarms = a3;
}

- (BOOL)disableAlarms
{
  return self->_disableAlarms;
}

- (void)setDisableAlarms:(BOOL)a3
{
  self->_disableAlarms = a3;
}

- (BOOL)filterAttachments
{
  return self->_filterAttachments;
}

- (void)setFilterAttachments:(BOOL)a3
{
  self->_filterAttachments = a3;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_calDAVPath, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subscriptionURLWithUsername, 0);
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_principalUid, 0);
  objc_storeStrong((id *)&self->_calendarDirectory, 0);
}

@end