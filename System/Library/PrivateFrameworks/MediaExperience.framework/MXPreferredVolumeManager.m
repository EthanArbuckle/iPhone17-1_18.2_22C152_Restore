@interface MXPreferredVolumeManager
+ (id)sharedInstance;
- (MXPreferredVolumeManager)init;
- (void)dealloc;
- (void)postNotification:(id)a3 category:(id)a4 mode:(id)a5 volume:(float)a6 rampUpwardDuration:(float)a7 rampDownwardDuration:(float)a8 silenceVolumeHUD:(BOOL)a9 reason:(id)a10 refCon:(id)a11 sequenceNumber:(int64_t)a12;
@end

@implementation MXPreferredVolumeManager

- (void)postNotification:(id)a3 category:(id)a4 mode:(id)a5 volume:(float)a6 rampUpwardDuration:(float)a7 rampDownwardDuration:(float)a8 silenceVolumeHUD:(BOOL)a9 reason:(id)a10 refCon:(id)a11 sequenceNumber:(int64_t)a12
{
  BOOL v14 = a9;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23 = v22;
  v29 = 0;
  id v30 = 0;
  v28 = 0;
  if (a4) {
    [v22 setObject:a4 forKey:@"AudioCategory"];
  }
  PVMCopyCurrentCategoryAndMode((CFTypeRef *)&v29, &v28);
  MappedCategoryWithModeAppended = pvmGetMappedCategoryWithModeAppended(v29, v28);
  pvmCreateSeparateCategoryAndModeStrings(MappedCategoryWithModeAppended, &v30, 0);
  if (v30) {
    [v23 setObject:v30 forKey:@"ActiveAudioCategory"];
  }

  if (a5) {
    [v23 setObject:a5 forKey:@"AudioMode"];
  }
  *(float *)&double v25 = a6;
  objc_msgSend(v23, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v25), @"Volume");
  if (MX_FeatureFlags_IsAdaptiveVolumeControlEnabled())
  {
    *(float *)&double v26 = a7;
    objc_msgSend(v23, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v26), @"RampUpwardDuration");
    *(float *)&double v27 = a8;
    objc_msgSend(v23, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v27), @"RampDownwardDuration");
    objc_msgSend(v23, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v14), @"SilenceVolumeHUD");
  }
  if (a10) {
    [v23 setObject:a10 forKey:@"Reason"];
  }
  if (a11) {
    [v23 setObject:a11 forKey:@"RefCon"];
  }
  if (a12) {
    objc_msgSend(v23, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", a12), @"SequenceNumber");
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", a3, self, v23);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_61);
  }
  return (id)sharedInstance_sSharedInstance_9;
}

MXPreferredVolumeManager *__42__MXPreferredVolumeManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXPreferredVolumeManager);
  sharedInstance_sSharedInstance_9 = (uint64_t)result;
  return result;
}

- (MXPreferredVolumeManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)MXPreferredVolumeManager;
  return [(MXPreferredVolumeManager *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MXPreferredVolumeManager;
  [(MXPreferredVolumeManager *)&v2 dealloc];
}

@end