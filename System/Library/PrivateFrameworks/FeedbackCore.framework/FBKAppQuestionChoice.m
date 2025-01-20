@interface FBKAppQuestionChoice
+ (NSString)otherAppChoiceValue;
- (FBKInstalledApp)app;
- (void)setApp:(id)a3;
@end

@implementation FBKAppQuestionChoice

- (FBKInstalledApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (NSString)otherAppChoiceValue
{
  v2 = (void *)sub_22A4B3418();

  return (NSString *)v2;
}

@end