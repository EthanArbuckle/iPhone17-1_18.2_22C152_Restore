@interface ATXActivitySuggestion
- (ATXActivity)activity;
- (ATXActivitySuggestion)initWithActivity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXActivitySuggestion:(id)a3;
- (NSArray)triggers;
- (NSString)suggestionUUID;
- (NSString)uuidString;
- (unint64_t)hash;
- (unint64_t)location;
@end

@implementation ATXActivitySuggestion

- (ATXActivitySuggestion)initWithActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActivitySuggestion;
  v6 = [(ATXActivitySuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_activity, a3);
  }

  return v7;
}

- (NSString)uuidString
{
  return [(ATXActivity *)self->_activity modeUUID];
}

- (unint64_t)location
{
  return [(ATXActivity *)self->_activity location];
}

- (NSArray)triggers
{
  return [(ATXActivity *)self->_activity triggers];
}

- (NSString)suggestionUUID
{
  return [(ATXActivity *)self->_activity suggestionUUID];
}

- (unint64_t)hash
{
  return [(ATXActivity *)self->_activity hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXActivitySuggestion *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActivitySuggestion *)self isEqualToATXActivitySuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXActivitySuggestion:(id)a3
{
  activity = self->_activity;
  v4 = [a3 activity];
  LOBYTE(activity) = [(ATXActivity *)activity isEqual:v4];

  return (char)activity;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
}

@end