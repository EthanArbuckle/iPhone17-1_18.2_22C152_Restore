@interface NTKUltraCubeUserState
+ (id)userState;
- (BOOL)hasUserEverAddedFaceToLibrary;
- (id)_init;
- (void)_userDidAddFaceToLibrary:(id)a3;
@end

@implementation NTKUltraCubeUserState

+ (id)userState
{
  if (qword_58EB0 != -1) {
    dispatch_once(&qword_58EB0, &stru_491E0);
  }
  v2 = (void *)qword_58EA8;

  return v2;
}

- (BOOL)hasUserEverAddedFaceToLibrary
{
  return self->_hasUserEverAddedFaceToLibrary;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKUltraCubeUserState;
  v2 = [(NTKUltraCubeUserState *)&v9 init];
  if (v2)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UltraFaceWasAddedToLibrary", NTKFacePreferencesDomain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v4 = AppBooleanValue == 0;
    }
    else {
      BOOL v4 = 1;
    }
    char v5 = !v4;
    v2->_hasUserEverAddedFaceToLibrary = v5;
    if (v4)
    {
      v6 = +[NSNotificationCenter defaultCenter];
      [v6 addObserver:v2 selector:"_userDidAddFaceToLibrary:" name:NTKCFaceDetailViewControllerDidAddFace object:0];
    }
  }
  return v2;
}

- (void)_userDidAddFaceToLibrary:(id)a3
{
  BOOL v4 = [a3 object];
  if (!self->_hasUserEverAddedFaceToLibrary)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_hasUserEverAddedFaceToLibrary = 1;
      char v5 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        v8 = "-[NTKUltraCubeUserState _userDidAddFaceToLibrary:]";
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: a face was added to the library", (uint8_t *)&v7, 0xCu);
      }

      CFPreferencesSetAppValue(@"UltraFaceWasAddedToLibrary", kCFBooleanTrue, NTKFacePreferencesDomain);
      v6 = +[NSNotificationCenter defaultCenter];
      [v6 removeObserver:self];
    }
  }
}

@end