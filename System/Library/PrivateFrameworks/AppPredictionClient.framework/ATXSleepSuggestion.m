@interface ATXSleepSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXSleepSuggestion)initWithCoder:(id)a3;
- (ATXSleepSuggestion)initWithOccurence:(id)a3;
- (ATXSleepSuggestionOccurrence)occurrence;
- (void)encodeWithCoder:(id)a3;
- (void)setOccurrence:(id)a3;
@end

@implementation ATXSleepSuggestion

- (ATXSleepSuggestion)initWithOccurence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSleepSuggestion;
  v6 = [(ATXSleepSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_occurrence, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXSleepSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSleepSuggestion;
  id v5 = [(ATXSleepSuggestion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"occurrence"];
    occurrence = v5->_occurrence;
    v5->_occurrence = (ATXSleepSuggestionOccurrence *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSleepSuggestionOccurrence)occurrence
{
  return self->_occurrence;
}

- (void)setOccurrence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end