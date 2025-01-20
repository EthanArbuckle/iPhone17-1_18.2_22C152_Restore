@interface ATXMessageContextResponse
+ (BOOL)supportsSecureCoding;
- (ATXMessageContextResponse)initWithCoder:(id)a3;
- (ATXMessageContextResponse)initWithMessageSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 messageFeatureDictionary:(id)a5;
- (NSDictionary)messageFeatureDictionary;
- (double)importanceConfidenceScore;
- (int)messageSenderImportance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMessageContextResponse

- (ATXMessageContextResponse)initWithMessageSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 messageFeatureDictionary:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXMessageContextResponse;
  v10 = [(ATXMessageContextResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_messageSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_messageFeatureDictionary, a5);
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
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXMessageContextResponse messageSenderImportance](self, "messageSenderImportance"), @"messageSenderImportance");
  [(ATXMessageContextResponse *)self importanceConfidenceScore];
  objc_msgSend(v4, "encodeDouble:forKey:", @"importanceConfidenceScore");
  id v5 = [(ATXMessageContextResponse *)self messageFeatureDictionary];
  [v4 encodeObject:v5 forKey:@"messageFeatureDictionary"];
}

- (ATXMessageContextResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"messageSenderImportance"];
  [v4 decodeDoubleForKey:@"importanceConfidenceScore"];
  double v7 = v6;
  uint64_t v8 = objc_opt_class();
  id v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"messageFeatureDictionary"];

  v10 = [(ATXMessageContextResponse *)self initWithMessageSenderImportance:v5 importanceConfidenceScore:v9 messageFeatureDictionary:v7];
  return v10;
}

- (int)messageSenderImportance
{
  return self->_messageSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)messageFeatureDictionary
{
  return self->_messageFeatureDictionary;
}

- (void).cxx_destruct
{
}

@end