@interface SiriAboutSearchSuggestionsModalViewController
- (SiriAboutSearchSuggestionsModalViewController)init;
@end

@implementation SiriAboutSearchSuggestionsModalViewController

- (SiriAboutSearchSuggestionsModalViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ASSISTANT_SEARCH_SUGGESTIONS_PRIVACY_TITLE" value:&stru_26D2AB140 table:@"AssistantShared"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"ASSISTANT_SEARCH_SUGGESTIONS_PRIVACY_TEXT" value:&stru_26D2AB140 table:@"AssistantShared"];

  v9.receiver = self;
  v9.super_class = (Class)SiriAboutSearchSuggestionsModalViewController;
  v7 = [(SiriModalTextViewController *)&v9 initWithTitleText:v4 andBodyText:v6];

  return v7;
}

@end