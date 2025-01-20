@interface ATXNotificationEntityFeatures
- (ATXNotificationEntityFeatures)init;
- (NSMutableArray)secondsToEngagement;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setSecondsToEngagement:(id)a3;
@end

@implementation ATXNotificationEntityFeatures

- (ATXNotificationEntityFeatures)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationEntityFeatures;
  v2 = [(ATXNotificationEntityFeatures *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    secondsToEngagement = v2->_secondsToEngagement;
    v2->_secondsToEngagement = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationEntityFeatures;
  v5 = [(ATXNotificationEntityFeatures *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"secondsToEngagement"];
    secondsToEngagement = v5->_secondsToEngagement;
    v5->_secondsToEngagement = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)jsonRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  secondsToEngagement = self->_secondsToEngagement;
  v5 = @"secondsToEngagement";
  v6[0] = secondsToEngagement;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (NSMutableArray)secondsToEngagement
{
  return self->_secondsToEngagement;
}

- (void)setSecondsToEngagement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end