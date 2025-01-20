@interface MPChangeLanguageOptionCommandEvent
- (MPChangeLanguageOptionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPChangeLanguageOptionSetting)setting;
- (MPNowPlayingInfoLanguageOption)languageOption;
@end

@implementation MPChangeLanguageOptionCommandEvent

- (void).cxx_destruct
{
}

- (MPChangeLanguageOptionSetting)setting
{
  return self->_setting;
}

- (MPNowPlayingInfoLanguageOption)languageOption
{
  return self->_languageOption;
}

- (MPChangeLanguageOptionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPChangeLanguageOptionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v19 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F776D0]];
    if (v10)
    {
      uint64_t v11 = MRLanguageOptionCreateFromExternalRepresentation();
      if (v11)
      {
        v12 = (const void *)v11;
        v13 = [[MPNowPlayingInfoLanguageOption alloc] initWithMRLanguageOption:v11];
        languageOption = v9->_languageOption;
        v9->_languageOption = v13;

        CFRelease(v12);
      }
    }
    v15 = [v8 objectForKey:*MEMORY[0x1E4F77658]];
    int v16 = [v15 intValue];

    uint64_t v17 = 2 * (v16 == 2);
    if (v16 == 1) {
      uint64_t v17 = 1;
    }
    v9->_setting = v17;
  }
  return v9;
}

@end