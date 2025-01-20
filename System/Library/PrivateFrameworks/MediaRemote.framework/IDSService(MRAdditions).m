@interface IDSService(MRAdditions)
+ (__CFString)mr_companionServiceName;
+ (__CFString)mr_serviceName;
+ (id)mr_sharedIDSCompanionService;
+ (id)mr_sharedIDSService;
@end

@implementation IDSService(MRAdditions)

+ (id)mr_sharedIDSCompanionService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__IDSService_MRAdditions__mr_sharedIDSCompanionService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mr_sharedIDSCompanionService_onceToken != -1) {
    dispatch_once(&mr_sharedIDSCompanionService_onceToken, block);
  }
  v1 = (void *)mr_sharedIDSCompanionService___service;

  return v1;
}

+ (__CFString)mr_companionServiceName
{
  return @"com.apple.private.alloy.mediaremote.v2";
}

+ (id)mr_sharedIDSService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__IDSService_MRAdditions__mr_sharedIDSService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mr_sharedIDSService_onceToken != -1) {
    dispatch_once(&mr_sharedIDSService_onceToken, block);
  }
  v1 = (void *)mr_sharedIDSService___service;

  return v1;
}

+ (__CFString)mr_serviceName
{
  return @"com.apple.private.alloy.avconference.avctester";
}

@end