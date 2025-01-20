@interface ATXMailContextResponse
+ (BOOL)supportsSecureCoding;
- (ATXMailContextResponse)initWithCoder:(id)a3;
- (ATXMailContextResponse)initWithMailSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 mailFeatureDictionary:(id)a5;
- (NSDictionary)mailFeatureDictionary;
- (double)importanceConfidenceScore;
- (int)mailSenderImportance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMailContextResponse

- (ATXMailContextResponse)initWithMailSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 mailFeatureDictionary:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXMailContextResponse;
  v10 = [(ATXMailContextResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_mailSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_mailFeatureDictionary, a5);
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
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXMailContextResponse mailSenderImportance](self, "mailSenderImportance"), @"mailSenderImportance");
  [(ATXMailContextResponse *)self importanceConfidenceScore];
  objc_msgSend(v4, "encodeDouble:forKey:", @"importanceConfidenceScore");
  id v5 = [(ATXMailContextResponse *)self mailFeatureDictionary];
  [v4 encodeObject:v5 forKey:@"mailFeatureDictionary"];
}

- (ATXMailContextResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"mailSenderImportance"];
  [v4 decodeDoubleForKey:@"importanceConfidenceScore"];
  double v7 = v6;
  uint64_t v8 = objc_opt_class();
  id v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"mailFeatureDictionary"];

  v10 = [(ATXMailContextResponse *)self initWithMailSenderImportance:v5 importanceConfidenceScore:v9 mailFeatureDictionary:v7];
  return v10;
}

- (int)mailSenderImportance
{
  return self->_mailSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)mailFeatureDictionary
{
  return self->_mailFeatureDictionary;
}

- (void).cxx_destruct
{
}

@end