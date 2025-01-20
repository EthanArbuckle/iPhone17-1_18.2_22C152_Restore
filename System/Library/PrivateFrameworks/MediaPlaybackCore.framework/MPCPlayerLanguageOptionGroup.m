@interface MPCPlayerLanguageOptionGroup
- (BOOL)allowEmptySelection;
- (MPCPlayerLanguageOptionGroup)initWithLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4 response:(id)a5;
- (MPCPlayerResponse)response;
- (MPNowPlayingInfoLanguageOption)selectedOption;
- (NSArray)options;
- (NSString)localizedTitle;
- (id)changeRequestForOptionAtIndex:(unint64_t)a3;
- (id)localizedTitleForOptionAtIndex:(unint64_t)a3;
- (unint64_t)indexOfSelectedOption;
- (unint64_t)numberOfOptions;
@end

@implementation MPCPlayerLanguageOptionGroup

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_response);

  objc_storeStrong((id *)&self->_options, 0);
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

- (BOOL)allowEmptySelection
{
  return self->_allowEmptySelection;
}

- (NSArray)options
{
  return self->_options;
}

- (id)changeRequestForOptionAtIndex:(unint64_t)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  BOOL allowEmptySelection = self->_allowEmptySelection;
  options = self->_options;
  if (a3 || !allowEmptySelection)
  {
    v7 = [(NSArray *)options objectAtIndexedSubscript:a3 - allowEmptySelection];
    self->_currentIndex = a3 - self->_allowEmptySelection;
    uint64_t v8 = 27;
  }
  else
  {
    v7 = [(NSArray *)options objectAtIndexedSubscript:self->_currentIndex];
    self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = 28;
  }
  v9 = (void *)[v7 copyExternalRepresentation];
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v11 = [MPCPlayerCommandRequest alloc];
    uint64_t v18 = *MEMORY[0x263F54CF0];
    v19[0] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v13 = [WeakRetained controller];
    v14 = [WeakRetained request];
    v15 = [v14 label];
    v16 = [(MPCPlayerCommandRequest *)v11 initWithMediaRemoteCommand:v8 options:v12 controller:v13 label:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)localizedTitleForOptionAtIndex:(unint64_t)a3
{
  if (!a3 && self->_allowEmptySelection)
  {
    v3 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"LANGUAGE_OPTIONS_EMPTY_SELECTION_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
LABEL_7:
    v6 = (void *)v4;
    goto LABEL_8;
  }
  v3 = [(NSArray *)self->_options objectAtIndexedSubscript:a3 - self->_allowEmptySelection];
  v5 = [v3 displayName];
  if (v5)
  {

LABEL_6:
    uint64_t v4 = [v3 displayName];
    goto LABEL_7;
  }
  if (([v3 isAutomaticLegibleLanguageOption] & 1) == 0
    && ![v3 isAutomaticAudibleLanguageOption])
  {
    goto LABEL_6;
  }
  uint64_t v8 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
  v6 = [v8 localizedStringForKey:@"LANGUAGE_OPTIONS_AUTO_SELECTION_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];

LABEL_8:

  return v6;
}

- (MPNowPlayingInfoLanguageOption)selectedOption
{
  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:");
  }

  return (MPNowPlayingInfoLanguageOption *)v2;
}

- (unint64_t)indexOfSelectedOption
{
  unint64_t currentIndex = self->_currentIndex;
  BOOL allowEmptySelection = self->_allowEmptySelection;
  if (currentIndex != 0x7FFFFFFFFFFFFFFFLL) {
    return currentIndex + allowEmptySelection;
  }
  unint64_t result = 0;
  BOOL v5 = allowEmptySelection;
  BOOL allowEmptySelection = 0;
  if (!v5) {
    return currentIndex + allowEmptySelection;
  }
  return result;
}

- (unint64_t)numberOfOptions
{
  return [(NSArray *)self->_options count] + self->_allowEmptySelection;
}

- (NSString)localizedTitle
{
  v2 = [(NSArray *)self->_options firstObject];
  uint64_t v3 = [v2 languageOptionType];

  if (v3 == 1)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
    BOOL v5 = v4;
    v6 = @"LANGUAGE_OPTIONS_SUBTITLE_SECTION_TITLE";
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
    BOOL v5 = v4;
    v6 = @"LANGUAGE_OPTIONS_AUDIO_SECTION_TITLE";
  }
  v2 = [v4 localizedStringForKey:v6 value:&stru_26CBCA930 table:@"MediaPlaybackCore"];

LABEL_6:

  return (NSString *)v2;
}

- (MPCPlayerLanguageOptionGroup)initWithLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlayerLanguageOptionGroup;
  v11 = [(MPCPlayerLanguageOptionGroup *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_response, v10);
    v12->_unint64_t currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12->_BOOL allowEmptySelection = [v8 allowEmptySelection];
    uint64_t v13 = [v8 languageOptions];
    options = v12->_options;
    v12->_options = (NSArray *)v13;

    v15 = v12->_options;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __93__MPCPlayerLanguageOptionGroup_initWithLanguageOptionGroups_currentLanguageOptions_response___block_invoke;
    v17[3] = &unk_2643C5288;
    id v18 = v9;
    v12->_unint64_t currentIndex = [(NSArray *)v15 indexOfObjectPassingTest:v17];
  }
  return v12;
}

uint64_t __93__MPCPlayerLanguageOptionGroup_initWithLanguageOptionGroups_currentLanguageOptions_response___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "isEqualToLanguageOption:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

@end