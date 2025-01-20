@interface CLKSensitiveUIMonitor
+ (id)sharedMonitor;
- (BOOL)_isVendorRelease;
- (BOOL)considersUISensitivitySensitive:(int64_t)a3;
- (BOOL)isSensitiveUIEnabled;
- (BOOL)shouldHideForSensitivity:(int64_t)a3;
@end

@implementation CLKSensitiveUIMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CLKSensitiveUIMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, block);
  }
  v2 = (void *)sharedMonitor_monitor;

  return v2;
}

uint64_t __38__CLKSensitiveUIMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (BOOL)_isVendorRelease
{
  if (_isVendorRelease_onceToken != -1) {
    dispatch_once(&_isVendorRelease_onceToken, &__block_literal_global_10);
  }
  return _isVendorRelease___isVendorRelease;
}

void __41__CLKSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0 = (id)MGGetStringAnswer();
  _isVendorRelease___isVendorRelease = [@"Vendor" isEqualToString:v0];
}

- (BOOL)isSensitiveUIEnabled
{
  return 1;
}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return ((unint64_t)a3 >= 0xD || ((0x1FFDu >> a3) & 1) == 0)
      && [(CLKSensitiveUIMonitor *)self _isVendorRelease];
}

- (BOOL)considersUISensitivitySensitive:(int64_t)a3
{
  return a3 == 1;
}

@end