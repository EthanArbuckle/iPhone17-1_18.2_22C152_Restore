@interface CSVoiceTriggerInfo
+ (id)sharedInstance;
- (CSVoiceTriggerInfo)init;
- (int64_t)firstPassRunningMode;
- (void)setFirstPassRunningMode:(int64_t)a3;
@end

@implementation CSVoiceTriggerInfo

- (void)setFirstPassRunningMode:(int64_t)a3
{
  self->_firstPassRunningMode = a3;
}

- (int64_t)firstPassRunningMode
{
  return self->_firstPassRunningMode;
}

- (CSVoiceTriggerInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerInfo;
  result = [(CSVoiceTriggerInfo *)&v3 init];
  if (result) {
    result->_firstPassRunningMode = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9007 != -1) {
    dispatch_once(&sharedInstance_onceToken_9007, &__block_literal_global_9008);
  }
  v2 = (void *)sharedInstance_sharedInstance_9009;
  return v2;
}

uint64_t __36__CSVoiceTriggerInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_9009 = objc_alloc_init(CSVoiceTriggerInfo);
  return MEMORY[0x1F41817F8]();
}

@end