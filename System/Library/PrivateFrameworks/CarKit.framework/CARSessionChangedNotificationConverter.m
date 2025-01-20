@interface CARSessionChangedNotificationConverter
+ (id)sharedInstance;
- (CARSessionChangedNotificationConverter)init;
- (void)dealloc;
- (void)init;
@end

@implementation CARSessionChangedNotificationConverter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CARSessionChangedNotificationConverter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __56__CARSessionChangedNotificationConverter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (CARSessionChangedNotificationConverter)init
{
  v7.receiver = self;
  v7.super_class = (Class)CARSessionChangedNotificationConverter;
  v2 = [(CARSessionChangedNotificationConverter *)&v7 init];
  if (v2)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    int v3 = CMNotificationCenterAddListener();
    if (v3)
    {
      int v4 = v3;
      v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(CARSessionChangedNotificationConverter *)v4 init];
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  v3.receiver = self;
  v3.super_class = (Class)CARSessionChangedNotificationConverter;
  [(CARSessionChangedNotificationConverter *)&v3 dealloc];
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "failed to register with CMNotificationCenter, error %d", (uint8_t *)v2, 8u);
}

@end