@interface DTKTraceTapConfig
+ (void)initialize;
- (BOOL)bufferSizeOverrideClamping;
- (BOOL)canUseRawKtraceFile;
- (DTKTraceTapConfig)init;
- (NSDictionary)providerOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sessionHandler;
- (id)stackshotHandler;
- (int)_addTriggerConfig:(id)a3;
- (int)addTriggerConfig:(id)a3;
- (unint64_t)bufferSizeOverride;
- (unint64_t)collectionInterval;
- (unint64_t)triggerConfigCount;
- (unsigned)kdebugTriggerIndex;
- (unsigned)recordingPriority;
- (void)enumerateTriggerConfigs:(id)a3;
- (void)setBufferSizeOverride:(unint64_t)a3;
- (void)setBufferSizeOverrideClamping:(BOOL)a3;
- (void)setCanUseRawKtraceFile:(BOOL)a3;
- (void)setCollectionInterval:(unint64_t)a3;
- (void)setKdebugTriggerIndex:(unsigned int)a3;
- (void)setProviderOptions:(id)a3;
- (void)setRecordingPriority:(unsigned __int8)a3;
- (void)setSessionHandler:(id)a3;
- (void)setStackshotHandler:(id)a3;
@end

@implementation DTKTraceTapConfig

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x263F08928];
    uint64_t v3 = objc_opt_class();
    [v2 setClass:v3 forClassName:@"DTCoreProfileTapMessage"];
  }
}

- (DTKTraceTapConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTKTraceTapConfig;
  v2 = [(DTTapConfig *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_kdebugTriggerIndex = -1;
    [(DTTapConfig *)v2 setBufferMode:0];
    [(DTTapConfig *)v3 setPollingInterval:500000000];
    v4 = [MEMORY[0x263EFF980] array];
    [(DTTapConfig *)v3 _setSerializableObject:v4 forKey:@"tc"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DTKTraceTapConfig;
  v4 = [(DTTapConfig *)&v12 copyWithZone:a3];
  v4[20] = self->_kdebugTriggerIndex;
  uint64_t v5 = [self->_sessionHandler copy];
  objc_super v6 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v5;

  uint64_t v7 = [self->_stackshotHandler copy];
  v8 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v7;

  v9 = [(DTKTraceTapConfig *)self providerOptions];
  v10 = (void *)[v9 copy];
  [v4 setProviderOptions:v10];

  return v4;
}

- (void)setRecordingPriority:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 != 10 && a3 != 100)
  {
    NSLog(&cfstr_UnsupportedRec.isa, a2, a3);
    uint64_t v3 = 10;
  }
  id v5 = (id)[objc_alloc(NSNumber) initWithInt:v3];
  [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"rp"];
}

- (void)setCanUseRawKtraceFile:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"curkt"];
}

- (BOOL)canUseRawKtraceFile
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"curkt"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unsigned)recordingPriority
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"rp"];
  char v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 intValue];
  }
  else {
    unsigned __int8 v4 = 10;
  }

  return v4;
}

- (unint64_t)bufferSizeOverride
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"bso"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setBufferSizeOverride:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"bso"];
}

- (BOOL)bufferSizeOverrideClamping
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"bsoc"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBufferSizeOverrideClamping:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"bsoc"];
}

- (NSDictionary)providerOptions
{
  return (NSDictionary *)[(DTTapConfig *)self _getSerializableObjectForKey:@"po"];
}

- (void)setProviderOptions:(id)a3
{
}

- (unint64_t)collectionInterval
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"kco"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setCollectionInterval:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"kco"];
}

- (void)setSessionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id sessionHandler = self->_sessionHandler;
  self->_id sessionHandler = v4;
}

- (void)enumerateTriggerConfigs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(DTTapConfig *)self _getSerializableObjectForKey:@"tc"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = objc_opt_new();
        [v11 _SetTriggerDict:v10];
        v4[2](v4, v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (unint64_t)triggerConfigCount
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"tc"];
  unint64_t v3 = [v2 count];

  return v3;
}

- (int)_addTriggerConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(DTTapConfig *)self _getSerializableObjectForKey:@"tc"];
  uint64_t v6 = [v4 _GetTriggerDict];
  [v5 addObject:v6];

  unsigned int v7 = [v5 count] - 1;
  if ([v4 kind] == 3)
  {
    if (self->_kdebugTriggerIndex != -1) {
      sub_23093E6CC();
    }
    self->_kdebugTriggerIndex = v7;
  }

  return v7;
}

- (int)addTriggerConfig:(id)a3
{
  return MEMORY[0x270F9A6D0](self, sel__addTriggerConfig_);
}

- (id)sessionHandler
{
  return self->_sessionHandler;
}

- (id)stackshotHandler
{
  return self->_stackshotHandler;
}

- (void)setStackshotHandler:(id)a3
{
}

- (unsigned)kdebugTriggerIndex
{
  return self->_kdebugTriggerIndex;
}

- (void)setKdebugTriggerIndex:(unsigned int)a3
{
  self->_kdebugTriggerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stackshotHandler, 0);
  objc_storeStrong(&self->_sessionHandler, 0);
}

@end