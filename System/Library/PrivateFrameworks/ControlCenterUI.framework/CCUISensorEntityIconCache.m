@interface CCUISensorEntityIconCache
+ (CGSize)iconSize;
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (id)_imageInBundle:(id)a3 named:(id)a4 needsTreatment:(BOOL)a5;
- (id)_init;
- (id)_keyboardSettingsIcon;
- (id)continuityCaptureIconForExtensionIdentifier:(id)a3;
- (id)imageForEntity:(id)a3;
- (void)preheatImageForSensorEntity:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CCUISensorEntityIconCache

id __57__CCUISensorEntityIconCache_preheatImageForSensorEntity___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) imageForEntity:*(void *)(a1 + 40)];
}

- (id)imageForEntity:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() iconSize];
  double v6 = v5;
  double v8 = v7;
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v6, v8, v11);
  if (([v4 isGenericLocationSystemServiceEntity] & 1) != 0
    || [v4 isSetupApp])
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F6F248]) initWithType:@"com.apple.graphic-icon.gear"];
LABEL_4:
    v14 = (void *)v13;
    id v15 = objc_alloc(MEMORY[0x1E4FB1818]);
    v16 = [v14 prepareImageForDescriptor:v12];
    uint64_t v17 = [v16 CGImage];
    [v12 scale];
    v18 = objc_msgSend(v15, "initWithCGImage:scale:orientation:", v17, 0);

LABEL_5:
    goto LABEL_6;
  }
  if ([v4 isSiriAndDictationEntity])
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:@"com.apple.siri"];
    goto LABEL_4;
  }
  if ([v4 isWalletSpecialEntity])
  {
    uint64_t v20 = CCUIIconImageForApplicationIdentifier((void *)*MEMORY[0x1E4F5ADC8], v6, v8);
  }
  else
  {
    if (![v4 isKeyboardCameraEntity])
    {
      int v21 = [v4 isContinuityCaptureExtension];
      v22 = [v4 bundleIdentifier];
      v14 = v22;
      if (v21) {
        [(CCUISensorEntityIconCache *)self continuityCaptureIconForExtensionIdentifier:v22];
      }
      else {
      v18 = CCUIIconImageForApplicationIdentifier(v22, v6, v8);
      }
      goto LABEL_5;
    }
    uint64_t v20 = [(CCUISensorEntityIconCache *)self _keyboardSettingsIcon];
  }
  v18 = (void *)v20;
LABEL_6:

  return v18;
}

+ (CGSize)iconSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_10);
  }
  double v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (void)preheatImageForSensorEntity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CCUISensorEntityIconCache_preheatImageForSensorEntity___block_invoke;
  v7[3] = &unk_1E6A89968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __43__CCUISensorEntityIconCache_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = [[CCUISensorEntityIconCache alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)CCUISensorEntityIconCache;
  double v2 = [(CCUISensorEntityIconCache *)&v7 init];
  if (v2)
  {
    double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ControlCenter.sensorEntityIconCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)_imageInBundle:(id)a3 named:(id)a4 needsTreatment:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
  double v10 = [MEMORY[0x1E4FB1818] imageNamed:v8 inBundle:v9];
  if (v10)
  {
    double v11 = v10;
    if (v5)
    {
      id v12 = v10;
      uint64_t v13 = [v12 CGImage];
      [(id)objc_opt_class() iconSize];
      double v11 = CCUIIconImageForUntreatedImage(v13, v14, v15);
    }
  }
  else
  {
    v16 = *MEMORY[0x1E4F5AD88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD88], OS_LOG_TYPE_FAULT)) {
      -[CCUISensorEntityIconCache _imageInBundle:named:needsTreatment:]((uint64_t)v8, (uint64_t)v7, v16);
    }
    double v11 = 0;
  }

  return v11;
}

- (id)continuityCaptureIconForExtensionIdentifier:(id)a3
{
  dispatch_queue_t v4 = (objc_class *)MEMORY[0x1E4F223A0];
  id v5 = a3;
  uint64_t v10 = 0;
  id v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 error:&v10];

  id v7 = [v6 URL];
  id v8 = [(CCUISensorEntityIconCache *)self _imageInBundle:v7 named:@"AppIcon" needsTreatment:1];

  return v8;
}

- (id)_keyboardSettingsIcon
{
  double v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/PreferenceBundles/AccessibilitySettings.bundle"];
  dispatch_queue_t v4 = [(CCUISensorEntityIconCache *)self _imageInBundle:v3 named:@"Keyboards" needsTreatment:1];

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_imageInBundle:(uint64_t)a1 named:(uint64_t)a2 needsTreatment:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D7B17000, log, OS_LOG_TYPE_FAULT, "could not lookup image %@ in bundle %@", (uint8_t *)&v3, 0x16u);
}

@end