@interface NSUserDefaults(Email)
+ (BOOL)em_defaultExistsForKey:()Email;
+ (id)em_userDefaults;
+ (uint64_t)_em_linesOfPreviewShouldReset:()Email;
+ (uint64_t)em_linesOfPreview;
+ (uint64_t)em_lockdownModeEnabled;
+ (uint64_t)em_resetLinesOfPreview;
+ (void)em_migrateDefault:()Email;
- (BOOL)shouldPresentRemoteContentOptionsSheet;
- (uint64_t)enableMailTrackingProtection:()Email;
- (uint64_t)preferredGroupedSenderGrouping;
- (uint64_t)setPreferredGroupedSenderGrouping:()Email;
- (uint64_t)shouldPresentAttachmentsInFullScreen;
- (uint64_t)shouldPresentRemoteContentAlert;
@end

@implementation NSUserDefaults(Email)

+ (uint64_t)em_linesOfPreview
{
  return objc_msgSend(a1, "_em_linesOfPreviewShouldReset:", 0);
}

+ (uint64_t)_em_linesOfPreviewShouldReset:()Email
{
  uint64_t result = _em_linesOfPreviewShouldReset__linesOfPreview;
  if (_em_linesOfPreviewShouldReset__linesOfPreview < 0 || a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v5 = [v4 objectForKey:@"LinesOfPreview"];

    if (v5)
    {
      unsigned int v6 = [v5 intValue];
      _em_linesOfPreviewShouldReset__linesOfPreview = (int)v6;
      if ((v6 & 0x80000000) != 0)
      {
        uint64_t v7 = 0;
      }
      else
      {
        if (v6 < 6)
        {
LABEL_10:

          return _em_linesOfPreviewShouldReset__linesOfPreview;
        }
        uint64_t v7 = 5;
      }
    }
    else
    {
      uint64_t v7 = 2;
    }
    _em_linesOfPreviewShouldReset__linesOfPreview = v7;
    goto LABEL_10;
  }
  return result;
}

+ (BOOL)em_defaultExistsForKey:()Email
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v5 = [v4 objectForKey:v3];

  return v5 != 0;
}

+ (id)em_userDefaults
{
  if (em_userDefaults_onceToken != -1) {
    dispatch_once(&em_userDefaults_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)em_userDefaults_userDefaults;
  return v0;
}

+ (void)em_migrateDefault:()Email
{
  id v7 = a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v3 valueForKey:v7];

  if (!v5)
  {
    unsigned int v6 = [v4 valueForKey:v7];
    if (v6)
    {
      [v3 setObject:v6 forKey:v7];
      [v4 removeObjectForKey:v7];
    }
  }
}

+ (uint64_t)em_lockdownModeEnabled
{
  if (em_lockdownModeEnabled_onceToken != -1) {
    dispatch_once(&em_lockdownModeEnabled_onceToken, &__block_literal_global_364);
  }
  return em_lockdownModeEnabled_lockdownModeEnabled;
}

- (BOOL)shouldPresentRemoteContentOptionsSheet
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v1 = [v0 integerForKey:@"LoadRemoteContent-v2"];

  return (v1 & 3) == 0;
}

- (uint64_t)shouldPresentRemoteContentAlert
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v1 = [v0 objectForKey:@"RemoteContentAlertDate"];

  v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = objc_msgSend(v1, "ef_isEarlierThanDate:", v2);

  return v3;
}

- (uint64_t)enableMailTrackingProtection:()Email
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 9;
  }
  return [a1 setInteger:v3 forKey:@"LoadRemoteContent-v2"];
}

+ (uint64_t)em_resetLinesOfPreview
{
  return objc_msgSend(a1, "_em_linesOfPreviewShouldReset:", 1);
}

- (uint64_t)setPreferredGroupedSenderGrouping:()Email
{
  return [a1 setInteger:a3 forKey:@"PreferredGroupedSenderGroupingLogic"];
}

- (uint64_t)preferredGroupedSenderGrouping
{
  char v1 = [a1 objectForKey:@"PreferredGroupedSenderGroupingLogic"];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)shouldPresentAttachmentsInFullScreen
{
  id v1 = [a1 objectForKey:@"_EMPresentAttachmentInFullScreen"];
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([v1 BOOLValue]) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end