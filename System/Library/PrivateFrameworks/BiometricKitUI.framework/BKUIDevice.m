@interface BKUIDevice
+ (id)sharedInstance;
- (BKUIDevice)init;
- (BOOL)isD10;
- (BOOL)isD32Sized;
- (BOOL)isD33;
- (BOOL)isIPad2;
- (BOOL)isMini;
- (BOOL)isN69;
- (BOOL)isN84;
- (BOOL)isPad;
- (BOOL)isPad6;
- (BOOL)isPad7;
- (BOOL)isZoomEnabled;
- (BOOL)isiPad21;
- (int)mainScreenClass;
- (void)setIsPad:(BOOL)a3;
- (void)setMainScreenClass:(int)a3;
@end

@implementation BKUIDevice

- (BKUIDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIDevice;
  v2 = [(BKUIDevice *)&v5 init];
  if (v2)
  {
    v2->_mainScreenClass = MGGetSInt32Answer();
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    v2->_isPad = [v3 userInterfaceIdiom] == 1;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_environment;

  return v2;
}

uint64_t __28__BKUIDevice_sharedInstance__block_invoke()
{
  sharedInstance_environment = objc_alloc_init(BKUIDevice);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isiPad21
{
  return self->_mainScreenClass == 21;
}

- (BOOL)isIPad2
{
  return self->_mainScreenClass == 4;
}

- (BOOL)isPad6
{
  return self->_mainScreenClass == 11;
}

- (BOOL)isPad7
{
  return self->_mainScreenClass == 14;
}

- (BOOL)isMini
{
  return self->_mainScreenClass == 7;
}

- (BOOL)isD10
{
  return self->_mainScreenClass == 8;
}

- (BOOL)isN69
{
  return self->_mainScreenClass == 5;
}

- (BOOL)isN84
{
  return self->_mainScreenClass == 19;
}

- (BOOL)isD33
{
  if (self->_mainScreenClass != 18) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  if (v3 == 414.0)
  {
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 bounds];
    BOOL v6 = v5 == 896.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isD32Sized
{
  int mainScreenClass = self->_mainScreenClass;
  if (mainScreenClass == 18 || mainScreenClass == 15) {
    return ![(BKUIDevice *)self isD33];
  }
  else {
    return 0;
  }
}

- (BOOL)isZoomEnabled
{
  if (!DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary) {
    DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F9A9F8] defaultController];
  double v3 = [v2 currentDisplayZoomMode];
  BOOL v4 = [v3 displayZoomOption] == 1;

  return v4;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (void)setMainScreenClass:(int)a3
{
  self->_int mainScreenClass = a3;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

@end