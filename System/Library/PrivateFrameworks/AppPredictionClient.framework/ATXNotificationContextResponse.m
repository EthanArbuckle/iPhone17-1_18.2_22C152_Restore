@interface ATXNotificationContextResponse
+ (BOOL)supportsSecureCoding;
- (ATXNotificationContextResponse)initWithCoder:(id)a3;
- (ATXNotificationContextResponse)initWithNotificationSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 notificationFeatureDictionary:(id)a5;
- (NSDictionary)notificationFeatureDictionary;
- (double)importanceConfidenceScore;
- (int)notificationSenderImportance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationContextResponse

- (ATXNotificationContextResponse)initWithNotificationSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 notificationFeatureDictionary:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationContextResponse;
  v10 = [(ATXNotificationContextResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_notificationSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_notificationFeatureDictionary, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXNotificationContextResponse notificationSenderImportance](self, "notificationSenderImportance"), @"notificationSenderImportance");
  [(ATXNotificationContextResponse *)self importanceConfidenceScore];
  objc_msgSend(v4, "encodeDouble:forKey:", @"importanceConfidenceScore");
  id v5 = [(ATXNotificationContextResponse *)self notificationFeatureDictionary];
  [v4 encodeObject:v5 forKey:@"notificationFeatureDictionary"];
}

- (ATXNotificationContextResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"notificationSenderImportance"];
  [v4 decodeDoubleForKey:@"importanceConfidenceScore"];
  double v7 = v6;
  uint64_t v8 = objc_opt_class();
  id v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"notificationFeatureDictionary"];

  v10 = [(ATXNotificationContextResponse *)self initWithNotificationSenderImportance:v5 importanceConfidenceScore:v9 notificationFeatureDictionary:v7];
  return v10;
}

- (int)notificationSenderImportance
{
  return self->_notificationSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)notificationFeatureDictionary
{
  return self->_notificationFeatureDictionary;
}

- (void).cxx_destruct
{
}

@end