@interface FPSupport_VideoRangeSingleton
+ (id)sharedFPSupportSingleton;
- (FPSupport_VideoRangeSingleton)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postNotification;
@end

@implementation FPSupport_VideoRangeSingleton

+ (id)sharedFPSupportSingleton
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FPSupport_VideoRangeSingleton_sharedFPSupportSingleton__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = a1;
  if (sharedFPSupportSingleton_onceToken != -1) {
    dispatch_once(&sharedFPSupportSingleton_onceToken, block);
  }
  return (id)sharedFPSupportSingleton_gSharedFPSupport;
}

- (void)postNotification
{
}

- (FPSupport_VideoRangeSingleton)init
{
  v4.receiver = self;
  v4.super_class = (Class)FPSupport_VideoRangeSingleton;
  v2 = [(FPSupport_VideoRangeSingleton *)&v4 init];
  if (v2)
  {
    v2->_notificationQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.fpsupport.displayChangedNotificationQueue", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "addObserver:forKeyPath:options:context:", v2, @"currentMode", 3, 0);
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)FPSupport_VideoRangeSingleton;
  [(FPSupport_VideoRangeSingleton *)&v2 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"currentMode"])
  {
    notificationQ = self->_notificationQ;
    dispatch_async(notificationQ, &__block_literal_global_83);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)FPSupport_VideoRangeSingleton;
    [(FPSupport_VideoRangeSingleton *)&v12 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

@end