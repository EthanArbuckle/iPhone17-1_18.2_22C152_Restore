@interface CalCalendarMigrationPublicationInfo
- (BOOL)automaticallyPublishChanges;
- (BOOL)filterAlarms;
- (BOOL)filterAttachments;
- (BOOL)filterTitleAndNotes;
- (CalCalendarMigrationPublicationInfo)initWithPublishedURL:(id)a3 calendarDirectory:(id)a4 calendarUUID:(id)a5;
- (NSDate)refreshDate;
- (NSString)accountIdentifier;
- (NSString)calendarUUID;
- (NSString)password;
- (NSString)username;
- (NSURL)calendarDirectory;
- (NSURL)publishedURL;
- (id)dictionaryForAccountProperties;
- (void)setAccountIdentifier:(id)a3;
- (void)setAutomaticallyPublishChanges:(BOOL)a3;
- (void)setCalendarUUID:(id)a3;
- (void)setFilterAlarms:(BOOL)a3;
- (void)setFilterAttachments:(BOOL)a3;
- (void)setFilterTitleAndNotes:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPublishedURL:(id)a3;
- (void)setRefreshDate:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation CalCalendarMigrationPublicationInfo

- (CalCalendarMigrationPublicationInfo)initWithPublishedURL:(id)a3 calendarDirectory:(id)a4 calendarUUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalCalendarMigrationPublicationInfo;
  v12 = [(CalCalendarMigrationPublicationInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publishedURL, a3);
    objc_storeStrong((id *)&v13->_calendarDirectory, a4);
    objc_storeStrong((id *)&v13->_calendarUUID, a5);
  }

  return v13;
}

- (id)dictionaryForAccountProperties
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(NSURL *)self->_publishedURL lastPathComponent];
  v5 = [v4 stringByDeletingPathExtension];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F30258]];
  }
  v6 = [(NSURL *)self->_publishedURL scheme];
  BOOL v7 = [v6 caseInsensitiveCompare:@"http"] != 0;
  v8 = [NSNumber numberWithBool:v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F30128]];

  id v9 = [(NSURL *)self->_publishedURL absoluteString];
  if ([v9 hasPrefix:@"http://"])
  {
    uint64_t v10 = 7;
  }
  else
  {
    if (![v9 hasPrefix:@"https://"]) {
      goto LABEL_8;
    }
    uint64_t v10 = 8;
  }
  uint64_t v11 = [v9 substringFromIndex:v10];

  id v9 = (void *)v11;
LABEL_8:
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F30120]];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationPublicationInfo automaticallyPublishChanges](self, "automaticallyPublishChanges"));
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x263F30250]];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterAlarms](self, "filterAlarms"));
  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F30260]];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterAttachments](self, "filterAttachments"));
  [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F30268]];

  objc_super v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterTitleAndNotes](self, "filterTitleAndNotes"));
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x263F30278]];

  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F30270]];
  v16 = [(CalCalendarMigrationPublicationInfo *)self calendarUUID];
  [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x263F30280]];

  return v3;
}

- (NSURL)calendarDirectory
{
  return self->_calendarDirectory;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
}

- (NSString)calendarUUID
{
  return self->_calendarUUID;
}

- (void)setCalendarUUID:(id)a3
{
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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (void)setRefreshDate:(id)a3
{
}

- (BOOL)automaticallyPublishChanges
{
  return self->_automaticallyPublishChanges;
}

- (void)setAutomaticallyPublishChanges:(BOOL)a3
{
  self->_automaticallyPublishChanges = a3;
}

- (BOOL)filterAlarms
{
  return self->_filterAlarms;
}

- (void)setFilterAlarms:(BOOL)a3
{
  self->_filterAlarms = a3;
}

- (BOOL)filterAttachments
{
  return self->_filterAttachments;
}

- (void)setFilterAttachments:(BOOL)a3
{
  self->_filterAttachments = a3;
}

- (BOOL)filterTitleAndNotes
{
  return self->_filterTitleAndNotes;
}

- (void)setFilterTitleAndNotes:(BOOL)a3
{
  self->_filterTitleAndNotes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_calendarUUID, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
  objc_storeStrong((id *)&self->_calendarDirectory, 0);
}

@end