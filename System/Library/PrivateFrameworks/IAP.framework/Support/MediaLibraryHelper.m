@interface MediaLibraryHelper
- (BOOL)iTunesRadioEnabled;
- (BOOL)showAudioBooks;
- (BOOL)showMusic;
- (BOOL)showPodcasts;
- (BOOL)showiTunesU;
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
  int AppIntegerValue = dword_10013BA38;
  if (dword_10013BA38 == -1)
  {
    int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0);
    dword_10013BA38 = AppIntegerValue;
    if (AppIntegerValue) {
      goto LABEL_3;
    }
  }
  else if (dword_10013BA38)
  {
LABEL_3:
    if (AppIntegerValue == -1)
    {
      int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0);
      dword_10013BA38 = AppIntegerValue;
    }
    unsigned __int8 v4 = AppIntegerValue == 1;
    goto LABEL_11;
  }
  if (self->_showMusic < 2u)
  {
    if (self->_showMusic) {
      unsigned __int8 v4 = objc_msgSend(+[MPRadioLibrary defaultRadioLibrary](MPRadioLibrary, "defaultRadioLibrary"), "isEnabled");
    }
    else {
      unsigned __int8 v4 = 0;
    }
LABEL_11:
    self->_iTunesRadioEnabled = v4;
    return;
  }
  __break(0x550Au);
}

- (BOOL)iTunesRadioEnabled
{
  BOOL result = [(MediaLibraryHelper *)self _updateITunesRadioEnabled];
  unsigned int iTunesRadioEnabled = self->_iTunesRadioEnabled;
  if (iTunesRadioEnabled < 2) {
    return iTunesRadioEnabled != 0;
  }
  __break(0x550Au);
  return result;
}

- (MediaLibraryHelper)init
{
  v11.receiver = self;
  v11.super_class = (Class)MediaLibraryHelper;
  v2 = [(MediaLibraryHelper *)&v11 init];
  if (!v2) {
    return v2;
  }
  char v3 = dword_10013BA3C;
  if (dword_10013BA3C == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0);
    char v3 = AppBooleanValue;
    dword_10013BA3C = AppBooleanValue;
    if ((AppBooleanValue & 1) == 0) {
      goto LABEL_4;
    }
  }
  else if ((dword_10013BA3C & 1) == 0)
  {
LABEL_4:
    unsigned __int8 v4 = sub_1000F1A60((uint64_t)"com.apple.Music");
    goto LABEL_7;
  }
  unsigned __int8 v4 = 1;
LABEL_7:
  v2->_showMusic = v4;
  if ((v3 & 2) != 0) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = sub_1000F1A60((uint64_t)"com.apple.podcasts");
  }
  v2->_BOOL showPodcasts = v6;
  if ((v3 & 4) != 0) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = sub_1000F1A60((uint64_t)"com.apple.iBooks");
  }
  v2->_BOOL showAudioBooks = v7;
  if ((v3 & 8) != 0) {
    BOOL result = (MediaLibraryHelper *)1;
  }
  else {
    BOOL result = (MediaLibraryHelper *)sub_1000F1A60((uint64_t)"com.apple.itunesu");
  }
  v2->_showiTunesU = (char)result;
  if (v2->_showMusic >= 2u
    || (BOOL showPodcasts = v2->_showPodcasts, showPodcasts > 1)
    || (BOOL showAudioBooks = v2->_showAudioBooks, showAudioBooks > 1))
  {
    __break(0x550Au);
  }
  else
  {
    NSLog(@"MediaLibraryHelper init: M=%d P=%d B=%d U=%d", v2->_showMusic, showPodcasts, showAudioBooks, result);
    [(MediaLibraryHelper *)v2 _updateITunesRadioEnabled];
    BOOL result = objc_alloc_init(IAPWorkspaceObserver);
    if ((((int)v2 + 8) & 7) == 0)
    {
      v2->_workspaceObserver = (IAPWorkspaceObserver *)result;
      [(MediaLibraryHelper *)result setDelegate:v2];
      [(IAPWorkspaceObserver *)v2->_workspaceObserver startObserving];
      return v2;
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((int)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    [(IAPWorkspaceObserver *)self->_workspaceObserver stopObserving];
    [(IAPWorkspaceObserver *)self->_workspaceObserver setDelegate:0];

    self->_workspaceObserver = 0;
    v3.receiver = self;
    v3.super_class = (Class)MediaLibraryHelper;
    [(MediaLibraryHelper *)&v3 dealloc];
  }
}

- (void)handleAppInstall:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.Music"))
  {
    if (objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.podcasts"))
    {
      unsigned int showPodcasts = self->_showPodcasts;
      if (showPodcasts > 1) {
        goto LABEL_26;
      }
      BOOL v7 = 0;
      self->_unsigned int showPodcasts = 1;
    }
    else if (objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.iBooks"))
    {
      unsigned int showPodcasts = self->_showAudioBooks;
      if (showPodcasts > 1) {
        goto LABEL_26;
      }
      BOOL v7 = 0;
      self->_BOOL showAudioBooks = 1;
    }
    else
    {
      if (!objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.itunesu"))
      {
        BOOL v6 = 0;
        BOOL v7 = 0;
        goto LABEL_14;
      }
      unsigned int showPodcasts = self->_showiTunesU;
      if (showPodcasts > 1)
      {
LABEL_26:
        __break(0x550Au);
        return;
      }
      BOOL v7 = 0;
      self->_BOOL showiTunesU = 1;
    }
    BOOL v6 = showPodcasts == 0;
    goto LABEL_14;
  }
  unsigned int showMusic = self->_showMusic;
  if (showMusic >= 2) {
    goto LABEL_26;
  }
  self->_unsigned int showMusic = 1;
  BOOL v6 = showMusic == 0;
  BOOL v7 = v6;
LABEL_14:
  BOOL v9 = self->_showMusic;
  if (v9 > 1) {
    goto LABEL_26;
  }
  BOOL v10 = self->_showPodcasts;
  if (v10 > 1) {
    goto LABEL_26;
  }
  if (self->_showAudioBooks > 1u) {
    goto LABEL_26;
  }
  BOOL showiTunesU = self->_showiTunesU;
  if (showiTunesU > 1) {
    goto LABEL_26;
  }
  NSLog(@"MediaLibraryHelper handleAppInstall: M=%d P=%d B=%d U=%d sendMusicNotification=%d sendNotification=%d", v9, v10, self->_showAudioBooks, showiTunesU, v7, v6);
  if (v7)
  {
    v12 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v12 postNotificationName:off_10013B9C8 object:0];
  }
  if (v6)
  {
    v13 = +[NSNotificationCenter defaultCenter];
    v14 = off_10013B9C0;
    [(NSNotificationCenter *)v13 postNotificationName:v14 object:0];
  }
}

- (void)handleAppUninstall:(id)a3
{
  unsigned int AppBooleanValue = dword_10013BA3C;
  if (dword_10013BA3C == -1)
  {
    unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0);
    dword_10013BA3C = AppBooleanValue;
  }
  if (!objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.Music"))
  {
    if (objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.podcasts"))
    {
      unsigned int showPodcasts = self->_showPodcasts;
      if (showPodcasts > 1) {
        goto LABEL_28;
      }
      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 1) & 1;
      self->_unsigned int showPodcasts = (AppBooleanValue & 2) != 0;
    }
    else if (objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.iBooks"))
    {
      unsigned int showPodcasts = self->_showAudioBooks;
      if (showPodcasts > 1) {
        goto LABEL_28;
      }
      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 2) & 1;
      self->_BOOL showAudioBooks = (AppBooleanValue & 4) != 0;
    }
    else
    {
      if (!objc_msgSend(objc_msgSend(a3, "applicationIdentifier"), "isEqualToString:", @"com.apple.itunesu"))
      {
        BOOL v8 = 0;
        BOOL v9 = 0;
        goto LABEL_16;
      }
      unsigned int showPodcasts = self->_showiTunesU;
      if (showPodcasts > 1)
      {
LABEL_28:
        __break(0x550Au);
        return;
      }
      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 3) & 1;
      self->_BOOL showiTunesU = (AppBooleanValue & 8) != 0;
    }
    BOOL v8 = v11 != showPodcasts;
    goto LABEL_16;
  }
  unsigned int showMusic = self->_showMusic;
  if (showMusic >= 2) {
    goto LABEL_28;
  }
  int v7 = AppBooleanValue & 1;
  self->_unsigned int showMusic = AppBooleanValue & 1;
  BOOL v8 = v7 != showMusic;
  BOOL v9 = v8;
LABEL_16:
  BOOL v12 = self->_showMusic;
  if (v12 > 1) {
    goto LABEL_28;
  }
  BOOL v13 = self->_showPodcasts;
  if (v13 > 1) {
    goto LABEL_28;
  }
  if (self->_showAudioBooks > 1u) {
    goto LABEL_28;
  }
  BOOL showiTunesU = self->_showiTunesU;
  if (showiTunesU > 1) {
    goto LABEL_28;
  }
  NSLog(@"MediaLibraryHelper handleAppUninstall: M=%d P=%d B=%d U=%d sendMusicNotification=%d sendNotification=%d", v12, v13, self->_showAudioBooks, showiTunesU, v9, v8);
  if (v9)
  {
    v15 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v15 postNotificationName:off_10013B9D0 object:0];
  }
  if (v8)
  {
    v16 = +[NSNotificationCenter defaultCenter];
    v17 = off_10013B9C0;
    [(NSNotificationCenter *)v16 postNotificationName:v17 object:0];
  }
}

- (int)getFilteredMediaTypesMask:(int)a3
{
  if (self->_showMusic >= 2u
    || self->_showPodcasts > 1u
    || self->_showAudioBooks > 1u
    || self->_showiTunesU > 1u)
  {
    __break(0x550Au);
  }
  else
  {
    if (a3) {
      int v3 = a3;
    }
    else {
      int v3 = 7423;
    }
    if (self->_showMusic) {
      unsigned int v4 = v3;
    }
    else {
      unsigned int v4 = v3 & 0xFFFFF7FE;
    }
    if (!self->_showPodcasts) {
      v4 &= 0xFFFFFBFD;
    }
    if (!self->_showAudioBooks) {
      v4 &= ~4u;
    }
    if (self->_showiTunesU) {
      LODWORD(self) = v4;
    }
    else {
      LODWORD(self) = v4 & 0xFFFFEFF7;
    }
  }
  return (int)self;
}

- (void)applicationsDidInstall:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MediaLibraryHelper *)self handleAppInstall:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MediaLibraryHelper *)self handleAppUninstall:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MediaLibraryHelper *)self handleAppUninstall:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (BOOL)showiTunesU
{
  return self->_showiTunesU;
}

@end