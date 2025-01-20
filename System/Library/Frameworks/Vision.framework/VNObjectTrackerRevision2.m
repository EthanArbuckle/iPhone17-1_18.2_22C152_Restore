@interface VNObjectTrackerRevision2
+ (NSString)rpnTrackerInitModelName;
+ (NSString)rpnTrackerTrackModelName;
+ (id)rpnInitQueue;
+ (id)rpnTrackQueue;
+ (id)rpnTrackerInitProcessingQueueName;
+ (id)rpnTrackerTrackProcessingQueueName;
+ (id)serializeRPNInitializationQueue;
+ (id)serializeRPNTrackingQueue;
+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4;
- (VNObjectTrackerRevision2)initWithOptions:(id)a3 error:(id *)a4;
@end

@implementation VNObjectTrackerRevision2

- (VNObjectTrackerRevision2)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VNObjectTrackerRevision2;
  v7 = [(VNTracker *)&v36 initWithOptions:v6 error:a4];
  if (v7)
  {
    uint64_t v35 = 0;
    if (+[VNValidationUtilities getNSUIntegerValue:&v35 forKey:@"VNTrackingOption_InputImageMaxWidth" inOptions:v6 error:a4])
    {
      uint64_t v34 = 0;
      if (+[VNValidationUtilities getNSUIntegerValue:&v34 forKey:@"VNTrackingOption_InputImageMaxHeight" inOptions:v6 error:a4])
      {
        id v33 = 0;
        BOOL v8 = +[VNValidationUtilities getOptionalObject:&v33 ofClass:objc_opt_class() forKey:@"VNTrackerOption_RPNEspressoResources" inOptions:v6 error:a4];
        v9 = (id *)v33;
        if (v8)
        {
          v10 = objc_opt_class();
          int v20 = 0;
          v19[0] = &unk_1EF7523F0;
          v19[1] = 0;
          uint64_t v24 = [v10 rpnInitQueue];

          uint64_t v28 = [v10 rpnTrackQueue];

          uint64_t v29 = [v10 serializeRPNInitializationQueue];

          uint64_t v30 = [v10 serializeRPNTrackingQueue];

          int v31 = v35;
          int v32 = v34;
          v11 = -[VNRPNTrackerEspressoResources rpnInitEspressoResources](v9);
          uint64_t v21 = [v11 network];
          uint64_t v22 = v12;

          v13 = -[VNRPNTrackerEspressoResources rpnInitEspressoResources](v9);
          uint64_t v23 = [v13 plan];

          v14 = -[VNRPNTrackerEspressoResources rpnTrackEspressoResources](v9);
          uint64_t v25 = [v14 network];
          uint64_t v26 = v15;

          v16 = -[VNRPNTrackerEspressoResources rpnTrackEspressoResources](v9);
          uint64_t v27 = [v16 plan];

          uint64_t v17 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNTrackingOption_TrackingLevel" inOptions:v6 error:a4];
          if (v17)
          {
            [(VNTracker *)v7 _createTrackerWithLevel:v17 options:v19 error:a4];
            std::shared_ptr<vision::mod::ObjectTrackerAbstract>::reset[abi:ne180100]<vision::mod::ObjectTrackerAbstract,void>();
          }

          vision::mod::RPNTrackerOptions::~RPNTrackerOptions(v19);
        }
      }
    }
  }

  return 0;
}

+ (id)serializeRPNTrackingQueue
{
  if (+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::onceToken != -1) {
    dispatch_once(&+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::onceToken, &__block_literal_global_43);
  }
  v2 = (void *)+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue;

  return v2;
}

void __53__VNObjectTrackerRevision2_serializeRPNTrackingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.VN.serializeRPNTrackingQueue", v2);
  v1 = (void *)+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue;
  +[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue = (uint64_t)v0;
}

+ (id)serializeRPNInitializationQueue
{
  if (+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::onceToken != -1) {
    dispatch_once(&+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::onceToken, &__block_literal_global_5231);
  }
  v2 = (void *)+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue;

  return v2;
}

void __59__VNObjectTrackerRevision2_serializeRPNInitializationQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.VN.serializeRPNInitializationQueue", v2);
  v1 = (void *)+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue;
  +[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue = (uint64_t)v0;
}

+ (id)rpnTrackQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VNObjectTrackerRevision2_rpnTrackQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNObjectTrackerRevision2 rpnTrackQueue]::onceToken != -1) {
    dispatch_once(&+[VNObjectTrackerRevision2 rpnTrackQueue]::onceToken, block);
  }
  v2 = (void *)+[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue;

  return v2;
}

void __41__VNObjectTrackerRevision2_rpnTrackQueue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) rpnTrackerTrackProcessingQueueName];
  v1 = (const char *)[v5 UTF8String];
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create(v1, v2);
  v4 = (void *)+[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue;
  +[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue = (uint64_t)v3;
}

+ (id)rpnInitQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VNObjectTrackerRevision2_rpnInitQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNObjectTrackerRevision2 rpnInitQueue]::onceToken != -1) {
    dispatch_once(&+[VNObjectTrackerRevision2 rpnInitQueue]::onceToken, block);
  }
  v2 = (void *)+[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue;

  return v2;
}

void __40__VNObjectTrackerRevision2_rpnInitQueue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) rpnTrackerInitProcessingQueueName];
  v1 = (const char *)[v5 UTF8String];
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create(v1, v2);
  v4 = (void *)+[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue;
  +[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue = (uint64_t)v3;
}

+ (NSString)rpnTrackerTrackModelName
{
  return (NSString *)@"rpn_track_v5.espresso";
}

+ (NSString)rpnTrackerInitModelName
{
  return (NSString *)@"rpn_template_v5.espresso";
}

+ (id)rpnTrackerTrackProcessingQueueName
{
  return @"com.apple.Tracker.rpnTrackQueuee";
}

+ (id)rpnTrackerInitProcessingQueueName
{
  return @"com.apple.Tracker.rpnInitQueue";
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  v4 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];

  return v4;
}

@end