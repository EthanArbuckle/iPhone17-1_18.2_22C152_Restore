@interface ASDAppEvent
+ (BOOL)supportsSecureCoding;
- (ASDAppEvent)initWithCoder:(id)a3;
- (BOOL)hasBeenPosted;
- (BOOL)isBeta;
- (BOOL)isClip;
- (NSArray)foregroundUsageEvents;
- (NSDate)date;
- (NSNumber)eventTime;
- (NSNumber)evid;
- (NSNumber)itemID;
- (NSNumber)startTime;
- (NSNumber)storefront;
- (NSString)accountID;
- (NSString)appPlatform;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)cohort;
- (NSString)deviceVendorID;
- (NSString)itemName;
- (NSString)shortVersion;
- (NSString)weekStartDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)count;
- (int64_t)duration;
- (int64_t)eventSubtype;
- (int64_t)eventType;
- (int64_t)foregroundUsage;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAppPlatform:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCohort:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setDeviceVendorID:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setEventSubtype:(int64_t)a3;
- (void)setEventTime:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setEvid:(id)a3;
- (void)setForegroundUsage:(int64_t)a3;
- (void)setForegroundUsageEvents:(id)a3;
- (void)setHasBeenPosted:(BOOL)a3;
- (void)setIsBeta:(BOOL)a3;
- (void)setIsClip:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setShortVersion:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setWeekStartDate:(id)a3;
@end

@implementation ASDAppEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDAppEvent allocWithZone:](ASDAppEvent, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_accountID copyWithZone:a3];
  [(ASDAppEvent *)v5 setAccountID:v6];

  v7 = (void *)[(NSString *)self->_bundleID copyWithZone:a3];
  [(ASDAppEvent *)v5 setBundleID:v7];

  v8 = (void *)[(NSString *)self->_bundleVersion copyWithZone:a3];
  [(ASDAppEvent *)v5 setBundleVersion:v8];

  [(ASDAppEvent *)v5 setCount:self->_count];
  v9 = (void *)[(NSString *)self->_cohort copyWithZone:a3];
  [(ASDAppEvent *)v5 setCohort:v9];

  v10 = (void *)[(NSDate *)self->_date copyWithZone:a3];
  [(ASDAppEvent *)v5 setDate:v10];

  v11 = (void *)[(NSString *)self->_deviceVendorID copyWithZone:a3];
  [(ASDAppEvent *)v5 setDeviceVendorID:v11];

  [(ASDAppEvent *)v5 setDuration:self->_duration];
  [(ASDAppEvent *)v5 setEventSubtype:self->_eventSubtype];
  v12 = (void *)[(NSNumber *)self->_eventTime copyWithZone:a3];
  [(ASDAppEvent *)v5 setEventTime:v12];

  [(ASDAppEvent *)v5 setEventType:self->_eventType];
  v13 = (void *)[(NSNumber *)self->_evid copyWithZone:a3];
  [(ASDAppEvent *)v5 setEvid:v13];

  [(ASDAppEvent *)v5 setForegroundUsage:self->_foregroundUsage];
  v14 = (void *)[(NSArray *)self->_foregroundUsageEvents copyWithZone:a3];
  [(ASDAppEvent *)v5 setForegroundUsageEvents:v14];

  [(ASDAppEvent *)v5 setHasBeenPosted:self->_hasBeenPosted];
  v15 = (void *)[(NSString *)self->_appPlatform copyWithZone:a3];
  [(ASDAppEvent *)v5 setAppPlatform:v15];

  [(ASDAppEvent *)v5 setIsBeta:self->_isBeta];
  [(ASDAppEvent *)v5 setIsClip:self->_isClip];
  v16 = (void *)[(NSNumber *)self->_itemID copyWithZone:a3];
  [(ASDAppEvent *)v5 setItemID:v16];

  v17 = (void *)[(NSString *)self->_itemName copyWithZone:a3];
  [(ASDAppEvent *)v5 setItemName:v17];

  v18 = (void *)[(NSNumber *)self->_startTime copyWithZone:a3];
  [(ASDAppEvent *)v5 setStartTime:v18];

  v19 = (void *)[(NSString *)self->_shortVersion copyWithZone:a3];
  [(ASDAppEvent *)v5 setShortVersion:v19];

  v20 = (void *)[(NSNumber *)self->_storefront copyWithZone:a3];
  [(ASDAppEvent *)v5 setStorefront:v20];

  v21 = (void *)[(NSString *)self->_weekStartDate copyWithZone:a3];
  [(ASDAppEvent *)v5 setWeekStartDate:v21];

  return v5;
}

- (id)description
{
  bundleID = self->_bundleID;
  bundleVersion = self->_bundleVersion;
  evid = self->_evid;
  itemID = self->_itemID;
  eventTime = self->_eventTime;
  int64_t eventType = self->_eventType;
  if (eventTime) {
    [NSString stringWithFormat:@"{ bundleID: %@ bundleVersion: %@ itemID: %@ evid: %@ eventType: %ld startTime: %@ eventTime: %@ }", bundleID, bundleVersion, itemID, evid, eventType, self->_startTime, eventTime];
  }
  else {
  v8 = [NSString stringWithFormat:@"{ bundleID: %@ bundleVersion: %@ itemID: %@ evid: %@ eventType: %ld subtype: %ld count: %ld }", bundleID, bundleVersion, itemID, evid, eventType, self->_eventSubtype, self->_count];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDAppEvent *)self accountID];
  [v4 encodeObject:v5 forKey:@"accountID"];

  v6 = [(ASDAppEvent *)self appPlatform];
  [v4 encodeObject:v6 forKey:@"appPlatform"];

  v7 = [(ASDAppEvent *)self bundleID];
  [v4 encodeObject:v7 forKey:@"bundleID"];

  v8 = [(ASDAppEvent *)self bundleVersion];
  [v4 encodeObject:v8 forKey:@"bundleVersion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent count](self, "count"), @"count");
  v9 = [(ASDAppEvent *)self cohort];
  [v4 encodeObject:v9 forKey:@"cohort"];

  v10 = [(ASDAppEvent *)self date];
  [v4 encodeObject:v10 forKey:@"date"];

  v11 = [(ASDAppEvent *)self deviceVendorID];
  [v4 encodeObject:v11 forKey:@"deviceVendorID"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDAppEvent duration](self, "duration"), @"duration");
  v12 = [(ASDAppEvent *)self eventTime];
  [v4 encodeObject:v12 forKey:@"launchEnd"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent eventType](self, "eventType"), @"eventType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent eventSubtype](self, "eventSubtype"), @"eventSubtype");
  v13 = [(ASDAppEvent *)self evid];
  [v4 encodeObject:v13 forKey:@"evid"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDAppEvent foregroundUsage](self, "foregroundUsage"), @"foregroundUsage");
  v14 = [(ASDAppEvent *)self foregroundUsageEvents];
  [v4 encodeObject:v14 forKey:@"foregroundUsageEvents"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent hasBeenPosted](self, "hasBeenPosted"), @"hasBeenPosted");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent isBeta](self, "isBeta"), @"isBeta");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent isClip](self, "isClip"), @"isClip");
  v15 = [(ASDAppEvent *)self itemID];
  [v4 encodeObject:v15 forKey:@"itemID"];

  v16 = [(ASDAppEvent *)self itemName];
  [v4 encodeObject:v16 forKey:@"itemName"];

  v17 = [(ASDAppEvent *)self startTime];
  [v4 encodeObject:v17 forKey:@"launchTime"];

  v18 = [(ASDAppEvent *)self shortVersion];
  [v4 encodeObject:v18 forKey:@"shortVersion"];

  v19 = [(ASDAppEvent *)self storefront];
  [v4 encodeObject:v19 forKey:@"storefront"];

  id v20 = [(ASDAppEvent *)self weekStartDate];
  [v4 encodeObject:v20 forKey:@"weekStartDate"];
}

- (ASDAppEvent)initWithCoder:(id)a3
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDAppEvent;
  v5 = [(ASDAppEvent *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appPlatform"];
    appPlatform = v5->_appPlatform;
    v5->_appPlatform = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v12;

    v5->_count = [v4 decodeIntegerForKey:@"count"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cohort"];
    cohort = v5->_cohort;
    v5->_cohort = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceVendorID"];
    deviceVendorID = v5->_deviceVendorID;
    v5->_deviceVendorID = (NSString *)v18;

    v5->_duration = [v4 decodeInt64ForKey:@"duration"];
    v5->_eventSubtype = [v4 decodeIntegerForKey:@"eventSubtype"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchEnd"];
    eventTime = v5->_eventTime;
    v5->_eventTime = (NSNumber *)v20;

    v5->_int64_t eventType = [v4 decodeIntegerForKey:@"eventType"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"evid"];
    evid = v5->_evid;
    v5->_evid = (NSNumber *)v22;

    v5->_foregroundUsage = [v4 decodeInt64ForKey:@"foregroundUsage"];
    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    v43[3] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    v26 = [v24 setWithArray:v25];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"foregroundUsageEvents"];
    foregroundUsageEvents = v5->_foregroundUsageEvents;
    v5->_foregroundUsageEvents = (NSArray *)v27;

    v5->_hasBeenPosted = [v4 decodeBoolForKey:@"hasBeenPosted"];
    v5->_isBeta = [v4 decodeBoolForKey:@"isBeta"];
    v5->_isClip = [v4 decodeBoolForKey:@"isClip"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchTime"];
    startTime = v5->_startTime;
    v5->_startTime = (NSNumber *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortVersion"];
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefront = v5->_storefront;
    v5->_storefront = (NSNumber *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weekStartDate"];
    weekStartDate = v5->_weekStartDate;
    v5->_weekStartDate = (NSString *)v39;
  }
  return v5;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)appPlatform
{
  return self->_appPlatform;
}

- (void)setAppPlatform:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)cohort
{
  return self->_cohort;
}

- (void)setCohort:(id)a3
{
}

- (NSString)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(id)a3
{
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (int64_t)foregroundUsage
{
  return self->_foregroundUsage;
}

- (void)setForegroundUsage:(int64_t)a3
{
  self->_foregroundUsage = a3;
}

- (NSArray)foregroundUsageEvents
{
  return self->_foregroundUsageEvents;
}

- (void)setForegroundUsageEvents:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)eventSubtype
{
  return self->_eventSubtype;
}

- (void)setEventSubtype:(int64_t)a3
{
  self->_eventSubtype = a3;
}

- (NSNumber)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_int64_t eventType = a3;
}

- (NSNumber)evid
{
  return self->_evid;
}

- (void)setEvid:(id)a3
{
}

- (BOOL)hasBeenPosted
{
  return self->_hasBeenPosted;
}

- (void)setHasBeenPosted:(BOOL)a3
{
  self->_hasBeenPosted = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_isClip = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSString)weekStartDate
{
  return self->_weekStartDate;
}

- (void)setWeekStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekStartDate, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_foregroundUsageEvents, 0);
  objc_storeStrong((id *)&self->_deviceVendorID, 0);
  objc_storeStrong((id *)&self->_cohort, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appPlatform, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end