@interface CPUIAssistantCellConfiguration
+ (id)configurationWithText:(id)a3;
- (NSString)text;
- (void)setText:(id)a3;
@end

@implementation CPUIAssistantCellConfiguration

+ (id)configurationWithText:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setText:v3];

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end