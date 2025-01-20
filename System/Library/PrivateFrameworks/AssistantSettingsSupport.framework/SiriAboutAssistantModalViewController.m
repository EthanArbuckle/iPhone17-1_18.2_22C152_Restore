@interface SiriAboutAssistantModalViewController
- (SiriAboutAssistantModalViewController)init;
@end

@implementation SiriAboutAssistantModalViewController

- (SiriAboutAssistantModalViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = @"AssistantShared";
  v5 = [v3 localizedStringForKey:@"ASSISTANT_ABOUT_TITLE" value:&stru_26D2AB140 table:@"AssistantShared"];

  uint64_t v6 = objc_opt_class();
  if (MGGetSInt32Answer() == 2)
  {
    v7 = [@"ASSISTANT_ABOUT_TEXT" stringByAppendingString:@"_SIDE_BUTTON"];
    uint64_t v6 = objc_opt_class();
    v4 = @"AssistantSettings-D22";
  }
  else
  {
    v7 = @"ASSISTANT_ABOUT_TEXT";
  }
  v8 = [MEMORY[0x263F086E0] bundleForClass:v6];
  v9 = [v8 localizedStringForKey:v7 value:&stru_26D2AB140 table:v4];

  v12.receiver = self;
  v12.super_class = (Class)SiriAboutAssistantModalViewController;
  v10 = [(SiriModalTextViewController *)&v12 initWithTitleText:v5 andBodyText:v9];

  return v10;
}

@end