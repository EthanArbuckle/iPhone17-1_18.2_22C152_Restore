@interface ATXSenderImportanceSuggestionThreshold
- (ATXSenderImportanceSuggestionThreshold)init;
- (double)mailSenderImportanceThreshold;
- (double)messageSenderImportanceThreshold;
- (double)notificationSenderImportanceThreshold;
@end

@implementation ATXSenderImportanceSuggestionThreshold

- (ATXSenderImportanceSuggestionThreshold)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXSenderImportanceSuggestionThreshold;
  v2 = [(ATXSenderImportanceSuggestionThreshold *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXSenderImportanceSuggestionThreshold" ofType:@"plist" specifiedABGroup:0];
    senderImportanceSuggestionThreshold = v2->_senderImportanceSuggestionThreshold;
    v2->_senderImportanceSuggestionThreshold = (NSDictionary *)v3;
  }
  return v2;
}

- (double)mailSenderImportanceThreshold
{
  v2 = [(NSDictionary *)self->_senderImportanceSuggestionThreshold objectForKeyedSubscript:@"mailSenderImportanceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)messageSenderImportanceThreshold
{
  v2 = [(NSDictionary *)self->_senderImportanceSuggestionThreshold objectForKeyedSubscript:@"messageSenderImportanceThreshold"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 0.5;
  }

  return v4;
}

- (double)notificationSenderImportanceThreshold
{
  v2 = [(NSDictionary *)self->_senderImportanceSuggestionThreshold objectForKeyedSubscript:@"notificationSenderImportanceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end