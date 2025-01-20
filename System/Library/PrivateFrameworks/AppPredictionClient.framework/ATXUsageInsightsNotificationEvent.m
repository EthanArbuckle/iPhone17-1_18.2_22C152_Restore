@interface ATXUsageInsightsNotificationEvent
+ (BOOL)supportsSecureCoding;
- (ATXUsageInsightsNotificationEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 eventTime:(id)a5 contactIDs:(id)a6 isGroupMessage:(BOOL)a7 deliveryType:(int)a8;
- (ATXUsageInsightsNotificationEvent)initWithCoder:(id)a3;
- (BOOL)isGroupMessage;
- (NSArray)contactIDs;
- (NSDate)eventTime;
- (NSString)bundleID;
- (int)deliveryType;
- (unint64_t)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUsageInsightsNotificationEvent

- (ATXUsageInsightsNotificationEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 eventTime:(id)a5 contactIDs:(id)a6 isGroupMessage:(BOOL)a7 deliveryType:(int)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ATXUsageInsightsNotificationEvent;
  v17 = [(ATXUsageInsightsNotificationEvent *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    bundleID = v17->_bundleID;
    v17->_bundleID = (NSString *)v18;

    v17->_category = a4;
    objc_storeStrong((id *)&v17->_eventTime, a5);
    uint64_t v20 = [v16 copy];
    contactIDs = v17->_contactIDs;
    v17->_contactIDs = (NSArray *)v20;

    v17->_isGroupMessage = a7;
    v17->_deliveryType = a8;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(ATXUsageInsightsNotificationEvent *)self bundleID];
  [v7 encodeObject:v4 forKey:@"bundleID"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXUsageInsightsNotificationEvent category](self, "category"), @"category");
  v5 = [(ATXUsageInsightsNotificationEvent *)self eventTime];
  [v7 encodeObject:v5 forKey:@"eventTime"];

  v6 = [(ATXUsageInsightsNotificationEvent *)self contactIDs];
  [v7 encodeObject:v6 forKey:@"contactIDs"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXUsageInsightsNotificationEvent isGroupMessage](self, "isGroupMessage"), @"isGroupMessage");
  objc_msgSend(v7, "encodeInt32:forKey:", -[ATXUsageInsightsNotificationEvent deliveryType](self, "deliveryType"), @"deliveryType");
}

- (ATXUsageInsightsNotificationEvent)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"category"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventTime"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contactIDs"];

  uint64_t v12 = [v4 decodeBoolForKey:@"isGroupMessage"];
  uint64_t v13 = [v4 decodeInt32ForKey:@"deliveryType"];

  id v14 = [(ATXUsageInsightsNotificationEvent *)self initWithBundleID:v5 category:v6 eventTime:v7 contactIDs:v11 isGroupMessage:v12 deliveryType:v13];
  return v14;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSDate)eventTime
{
  return self->_eventTime;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (int)deliveryType
{
  return self->_deliveryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end