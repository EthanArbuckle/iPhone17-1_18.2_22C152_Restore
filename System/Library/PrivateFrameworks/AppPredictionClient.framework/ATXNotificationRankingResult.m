@interface ATXNotificationRankingResult
+ (BOOL)supportsSecureCoding;
- (ATXNotificationRankingResult)initWithCoder:(id)a3;
- (ATXNotificationRankingResult)initWithnotificationRankingSections:(id)a3;
- (NSArray)notificationRankingSections;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationRankingResult

- (ATXNotificationRankingResult)initWithnotificationRankingSections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationRankingResult;
  v5 = [(ATXNotificationRankingResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    notificationRankingSections = v5->_notificationRankingSections;
    v5->_notificationRankingSections = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXNotificationRankingResult)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F93B90];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v5 setWithArray:v7];
  objc_super v9 = __atxlog_handle_notification_categorization();
  v10 = objc_msgSend(v4, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, @"notificationRankingSections", v6, 1, @"error", -1, v9, v14[0]);

  v11 = [v6 error];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = [(ATXNotificationRankingResult *)self initWithnotificationRankingSections:v10];
    v12 = self;
  }

  return v12;
}

- (NSArray)notificationRankingSections
{
  return self->_notificationRankingSections;
}

- (void).cxx_destruct
{
}

@end