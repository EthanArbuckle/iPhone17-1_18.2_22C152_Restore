@interface MediaLibraryHelper
- (BOOL)iTunesRadioEnabled;
- (BOOL)showAudioBooks;
- (BOOL)showMusic;
- (BOOL)showPodcasts;
- (MediaLibraryHelper)init;
- (int)getFilteredMediaTypesMask:(int)a3;
- (void)_updateITunesRadioEnabled;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)handleAppInstall:(id)a3;
- (void)handleAppUninstall:(id)a3;
@end

@implementation MediaLibraryHelper

- (void)_updateITunesRadioEnabled
{
  int AppIntegerValue = __iTunesRadioEnabledOverride___overrideRadioAvailable;
  if (__iTunesRadioEnabledOverride___overrideRadioAvailable == -1)
  {
    int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0);
    __iTunesRadioEnabledOverride___overrideRadioAvailable = AppIntegerValue;
    if (AppIntegerValue) {
      goto LABEL_3;
    }
  }
  else if (__iTunesRadioEnabledOverride___overrideRadioAvailable)
  {
LABEL_3:
    if (AppIntegerValue == -1)
    {
      int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0);
      __iTunesRadioEnabledOverride___overrideRadioAvailable = AppIntegerValue;
    }
    self->_iTunesRadioEnabled = AppIntegerValue == 1;
    return;
  }
  if (self->_showMusic)
  {
    id v4 = [MEMORY[0x263F12198] defaultRadioLibrary];
    self->_iTunesRadioEnabled = [v4 isEnabled];
  }
  else
  {
    self->_iTunesRadioEnabled = 0;
  }
}

- (BOOL)iTunesRadioEnabled
{
  return self->_iTunesRadioEnabled;
}

- (MediaLibraryHelper)init
{
  v11.receiver = self;
  v11.super_class = (Class)MediaLibraryHelper;
  v2 = [(MediaLibraryHelper *)&v11 init];
  if (!v2) {
    return v2;
  }
  char v3 = __mediaLibraryAccessOverride___MLAccessOverride;
  if (__mediaLibraryAccessOverride___MLAccessOverride == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0);
    char v3 = AppBooleanValue;
    __mediaLibraryAccessOverride___MLAccessOverride = AppBooleanValue;
    if ((AppBooleanValue & 1) == 0) {
      goto LABEL_4;
    }
LABEL_6:
    char v4 = 1;
    goto LABEL_7;
  }
  if (__mediaLibraryAccessOverride___MLAccessOverride) {
    goto LABEL_6;
  }
LABEL_4:
  char v4 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
LABEL_7:
  v2->_showMusic = v4;
  if ((v3 & 2) != 0) {
    char v6 = 1;
  }
  else {
    char v6 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
  }
  v2->_showPodcasts = v6;
  if ((v3 & 4) != 0) {
    char v7 = 1;
  }
  else {
    char v7 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
  }
  v2->_showAudioBooks = v7;
  [(MediaLibraryHelper *)v2 _updateITunesRadioEnabled];
  v8 = objc_alloc_init(WorkspaceObserver);
  workspaceObserver = v2->_workspaceObserver;
  v2->_workspaceObserver = v8;

  [(WorkspaceObserver *)v2->_workspaceObserver setDelegate:v2];
  [(WorkspaceObserver *)v2->_workspaceObserver startObserving];
  return v2;
}

- (void)dealloc
{
  [(WorkspaceObserver *)self->_workspaceObserver stopObserving];
  [(WorkspaceObserver *)self->_workspaceObserver setDelegate:0];
  workspaceObserver = self->_workspaceObserver;
  self->_workspaceObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)MediaLibraryHelper;
  [(MediaLibraryHelper *)&v4 dealloc];
}

- (void)handleAppInstall:(id)a3
{
  id v15 = a3;
  objc_super v4 = [v15 applicationIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.Music"];

  if (v5)
  {
    BOOL showMusic = self->_showMusic;
    self->_BOOL showMusic = 1;
    if (showMusic) {
      goto LABEL_10;
    }
    char v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:kMediaLibraryMusicAppInstalledNotification object:0];

    goto LABEL_9;
  }
  v8 = [v15 applicationIdentifier];
  char v9 = [v8 isEqualToString:@"com.apple.podcasts"];

  if (v9)
  {
    BOOL showPodcasts = self->_showPodcasts;
    self->_BOOL showPodcasts = 1;
    if (showPodcasts) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_super v11 = [v15 applicationIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.iBooks"];

  if (v12)
  {
    BOOL showAudioBooks = self->_showAudioBooks;
    self->_BOOL showAudioBooks = 1;
    if (!showAudioBooks)
    {
LABEL_9:
      v14 = [MEMORY[0x263F08A00] defaultCenter];
      [v14 postNotificationName:kMediaLibraryNeedFilterChange object:0];
    }
  }
LABEL_10:
}

- (void)handleAppUninstall:(id)a3
{
  id v4 = a3;
  unsigned int AppBooleanValue = __mediaLibraryAccessOverride___MLAccessOverride;
  id v17 = v4;
  if (__mediaLibraryAccessOverride___MLAccessOverride == -1)
  {
    unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0);
    id v4 = v17;
    __mediaLibraryAccessOverride___MLAccessOverride = AppBooleanValue;
  }
  char v6 = [v4 applicationIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.Music"];

  if (v7)
  {
    BOOL showMusic = self->_showMusic;
    self->_BOOL showMusic = AppBooleanValue & 1;
    if ((AppBooleanValue & 1) == showMusic) {
      goto LABEL_12;
    }
    char v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:kMediaLibraryMusicAppUninstalledNotification object:0];

LABEL_11:
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 postNotificationName:kMediaLibraryNeedFilterChange object:0];

    goto LABEL_12;
  }
  v10 = [v17 applicationIdentifier];
  char v11 = [v10 isEqualToString:@"com.apple.podcasts"];

  if (v11)
  {
    int showPodcasts = self->_showPodcasts;
    int v13 = (AppBooleanValue >> 1) & 1;
    self->_int showPodcasts = (AppBooleanValue & 2) != 0;
  }
  else
  {
    v14 = [v17 applicationIdentifier];
    int v15 = [v14 isEqualToString:@"com.apple.iBooks"];

    if (!v15) {
      goto LABEL_12;
    }
    int showPodcasts = self->_showAudioBooks;
    int v13 = (AppBooleanValue >> 2) & 1;
    self->_BOOL showAudioBooks = (AppBooleanValue & 4) != 0;
  }
  if (v13 != showPodcasts) {
    goto LABEL_11;
  }
LABEL_12:
}

- (int)getFilteredMediaTypesMask:(int)a3
{
  if (a3) {
    int v3 = a3;
  }
  else {
    int v3 = 3327;
  }
  if (!self->_showMusic) {
    v3 &= 0xFFFFF7FE;
  }
  if (!self->_showPodcasts) {
    v3 &= 0xFFFFFBFD;
  }
  if (self->_showAudioBooks) {
    return v3;
  }
  else {
    return v3 & 0xFFFFFFFB;
  }
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MediaLibraryHelper *)self handleAppInstall:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MediaLibraryHelper *)self handleAppUninstall:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MediaLibraryHelper *)self handleAppUninstall:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)showMusic
{
  return self->_showMusic;
}

- (BOOL)showPodcasts
{
  return self->_showPodcasts;
}

- (BOOL)showAudioBooks
{
  return self->_showAudioBooks;
}

- (void).cxx_destruct
{
}

@end