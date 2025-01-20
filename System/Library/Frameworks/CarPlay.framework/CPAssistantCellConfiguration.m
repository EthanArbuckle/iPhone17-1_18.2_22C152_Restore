@interface CPAssistantCellConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (CPAssistantCellActionType)assistantAction;
- (CPAssistantCellConfiguration)initWithCoder:(id)a3;
- (CPAssistantCellConfiguration)initWithPosition:(CPAssistantCellPosition)position visibility:(CPAssistantCellVisibility)visibility assistantAction:(CPAssistantCellActionType)assistantAction;
- (CPAssistantCellPosition)position;
- (CPAssistantCellVisibility)visibility;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPAssistantCellConfiguration

- (CPAssistantCellConfiguration)initWithPosition:(CPAssistantCellPosition)position visibility:(CPAssistantCellVisibility)visibility assistantAction:(CPAssistantCellActionType)assistantAction
{
  v9.receiver = self;
  v9.super_class = (Class)CPAssistantCellConfiguration;
  result = [(CPAssistantCellConfiguration *)&v9 init];
  if (result)
  {
    result->_position = position;
    result->_visibility = visibility;
    result->_assistantAction = assistantAction;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPAssistantCellConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CPAssistantCellConfiguration *)self isEqualToConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  int64_t position = self->_position;
  if (position == [v4 position]
    && (int64_t visibility = self->_visibility, visibility == [v4 visibility]))
  {
    int64_t assistantAction = self->_assistantAction;
    BOOL v8 = assistantAction == [v4 assistantAction];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAssistantCellConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPAssistantCellConfiguration;
  BOOL v5 = [(CPAssistantCellConfiguration *)&v7 init];
  if (v5)
  {
    v5->_int64_t position = [v4 decodeIntegerForKey:@"kCPAssistantCellConfigurationPositionKey"];
    v5->_int64_t visibility = [v4 decodeIntegerForKey:@"kCPAssistantCellConfigurationVisibilityKey"];
    v5->_int64_t assistantAction = [v4 decodeIntegerForKey:@"kCPAssistantCellConfigurationIntentKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration position](self, "position"), @"kCPAssistantCellConfigurationPositionKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration visibility](self, "visibility"), @"kCPAssistantCellConfigurationVisibilityKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration assistantAction](self, "assistantAction"), @"kCPAssistantCellConfigurationIntentKey");
}

- (CPAssistantCellPosition)position
{
  return self->_position;
}

- (CPAssistantCellVisibility)visibility
{
  return self->_visibility;
}

- (CPAssistantCellActionType)assistantAction
{
  return self->_assistantAction;
}

@end