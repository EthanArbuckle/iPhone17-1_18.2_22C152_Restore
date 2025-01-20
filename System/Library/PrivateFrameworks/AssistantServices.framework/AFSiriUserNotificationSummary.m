@interface AFSiriUserNotificationSummary
+ (BOOL)supportsSecureCoding;
- (AFSiriUserNotificationSummary)initWithCoder:(id)a3;
- (AFSiriUserNotificationSummary)initWithSummary:(id)a3 summaryType:(int64_t)a4 error:(id)a5;
- (NSError)error;
- (NSString)summary;
- (id)description;
- (int64_t)summaryType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriUserNotificationSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)summaryType
{
  return self->_summaryType;
}

- (NSString)summary
{
  return self->_summary;
}

- (AFSiriUserNotificationSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summary"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"summaryType"];
  v7 = [v4 decodeObjectForKey:@"error"];

  v8 = [(AFSiriUserNotificationSummary *)self initWithSummary:v5 summaryType:v6 error:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AFSiriUserNotificationSummary *)self summary];
  [v4 encodeObject:v5 forKey:@"summary"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AFSiriUserNotificationSummary summaryType](self, "summaryType"), @"summaryType");
  id v6 = [(AFSiriUserNotificationSummary *)self error];
  [v4 encodeObject:v6 forKey:@"error"];
}

- (id)description
{
  v3 = NSString;
  summary = self->_summary;
  unint64_t summaryType = self->_summaryType;
  if (summaryType > 2) {
    id v6 = @"(unknown)";
  }
  else {
    id v6 = off_1E59280E0[summaryType];
  }
  v7 = v6;
  v8 = [v3 stringWithFormat:@"AFSiriUserNotificationSummary<summary: %@ summaryType: %@, error: %@>", summary, v7, self->_error];

  return v8;
}

- (AFSiriUserNotificationSummary)initWithSummary:(id)a3 summaryType:(int64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AFSiriUserNotificationSummary;
  v11 = [(AFSiriUserNotificationSummary *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_summary, a3);
    v12->_unint64_t summaryType = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end