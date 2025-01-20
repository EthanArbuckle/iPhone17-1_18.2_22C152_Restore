@interface SGRadarSuggestionBase
- (SGRadarSuggestionBase)initWithSourceMessageId:(id)a3;
- (SGSuggestionDelegate)suggestionDelegate;
- (id)primaryActionTitle;
- (id)realtimeSuggestion;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionDismissAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (id)suggestionsSecondTitle;
- (int64_t)suggestionActionButtonType;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation SGRadarSuggestionBase

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_sourceMessageId, 0);
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionDelegate);
  return (SGSuggestionDelegate *)WeakRetained;
}

- (id)primaryActionTitle
{
  if (_currentContext) {
    return @"File a Radar";
  }
  else {
    return @"File";
  }
}

- (id)realtimeSuggestion
{
  return 0;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  if ([a3 count])
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    v4 = [v3 localizedStringForKey:@"SuggestionsBannerMultipleSuggestionsTitleFormat" value:&stru_1F0ED27A8 table:0];
  }
  else
  {
    v4 = &stru_1F0ED27A8;
  }
  return v4;
}

- (id)suggestionCategoryTitle
{
  return @"Radars";
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = [v3 objectAtIndexedSubscript:0];
      v6 = [v5 suggestionTitle];
    }
    else
    {
      v6 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu radars", v4);
    }
  }
  else
  {
    v6 = &stru_1F0ED27A8;
  }

  return v6;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = @"1 radar";
  }
  else if ((unint64_t)[v3 count] < 2)
  {
    uint64_t v4 = @"No radars";
  }
  else
  {
    uint64_t v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu radars", objc_msgSend(v3, "count"));
  }

  return v4;
}

- (id)suggestionCategoryImage
{
  return 0;
}

- (id)suggestionCategoryId
{
  v2 = @"com.apple.suggestions.SGRadarSuggestion";
  return @"com.apple.suggestions.SGRadarSuggestion";
}

- (int64_t)suggestionActionButtonType
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 6;

  return 4 * v3;
}

- (id)suggestionDismissAction
{
  return 0;
}

- (id)suggestionsSecondTitle
{
  return &stru_1F0ED27A8;
}

- (id)suggestionSubtitle
{
  return @"An exception has occurred\nPlease file a radar for analysis";
}

- (id)suggestionTitle
{
  return @"Siri Found in Apps [Internal]";
}

- (SGRadarSuggestionBase)initWithSourceMessageId:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGRadarSuggestionBase;
  v6 = [(SGRadarSuggestionBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceMessageId, a3);
  }

  return v7;
}

@end