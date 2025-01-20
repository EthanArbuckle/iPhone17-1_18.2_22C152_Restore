@interface ATXSettingsActionsClientResponse
+ (BOOL)supportsSecureCoding;
- (ATXSettingsActionsClientResponse)initWithActions:(id)a3;
- (ATXSettingsActionsClientResponse)initWithCoder:(id)a3;
- (NSArray)actions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSettingsActionsClientResponse

- (void).cxx_destruct
{
}

- (NSArray)actions
{
  return self->_actions;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXSettingsActionsClientResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v7 = [(ATXSettingsActionsClientResponse *)self initWithActions:v6];

  return v7;
}

- (ATXSettingsActionsClientResponse)initWithActions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsClientResponse;
  v5 = [(ATXSettingsActionsClientResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;
  }
  return v5;
}

@end