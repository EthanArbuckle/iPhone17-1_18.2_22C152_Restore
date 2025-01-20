@interface CameraSettingsBaseController
+ (CAMCaptureCapabilities)capabilities;
+ (NSNumberFormatter)integerFormatter;
+ (void)allowMultilineTitlesForSpecifiers:(id)a3;
- (BOOL)_didAppearAtLeastOnce;
- (void)reloadSpecifiers;
- (void)set_didAppearAtLeastOnce:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CameraSettingsBaseController

+ (CAMCaptureCapabilities)capabilities
{
  if (qword_2A290 != -1) {
    dispatch_once(&qword_2A290, &stru_205E0);
  }
  if (byte_2A298)
  {
    if (qword_2A2A0 != -1) {
      dispatch_once(&qword_2A2A0, &stru_20600);
    }
    v2 = &qword_2A2A8;
  }
  else
  {
    if (qword_2A2B0 != -1) {
      dispatch_once(&qword_2A2B0, &stru_20620);
    }
    v2 = &qword_2A2B8;
  }
  id v3 = (id)*v2;

  return (CAMCaptureCapabilities *)v3;
}

- (void)reloadSpecifiers
{
  byte_2A298 = +[CAMCaptureCapabilities isCameraAppInstalled];
  v3.receiver = self;
  v3.super_class = (Class)CameraSettingsBaseController;
  [(CameraSettingsBaseController *)&v3 reloadSpecifiers];
}

- (void)viewDidLoad
{
  byte_2A298 = +[CAMCaptureCapabilities isCameraAppInstalled];
  v3.receiver = self;
  v3.super_class = (Class)CameraSettingsBaseController;
  [(CameraSettingsBaseController *)&v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraSettingsBaseController;
  [(CameraSettingsBaseController *)&v4 viewWillAppear:a3];
  if ([(CameraSettingsBaseController *)self _didAppearAtLeastOnce]) {
    [(CameraSettingsBaseController *)self reloadSpecifiers];
  }
  [(CameraSettingsBaseController *)self set_didAppearAtLeastOnce:1];
}

+ (void)allowMultilineTitlesForSpecifiers:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = PSAllowMultilineTitleKey;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setProperty:&__kCFBooleanTrue forKey:v7];
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (NSNumberFormatter)integerFormatter
{
  if (qword_2A2C0 != -1) {
    dispatch_once(&qword_2A2C0, &stru_20640);
  }
  v2 = (void *)qword_2A2C8;

  return (NSNumberFormatter *)v2;
}

- (BOOL)_didAppearAtLeastOnce
{
  return self->__didAppearAtLeastOnce;
}

- (void)set_didAppearAtLeastOnce:(BOOL)a3
{
  self->__didAppearAtLeastOnce = a3;
}

@end