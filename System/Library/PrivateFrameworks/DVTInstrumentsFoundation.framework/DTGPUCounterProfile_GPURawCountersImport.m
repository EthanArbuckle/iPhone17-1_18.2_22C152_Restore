@interface DTGPUCounterProfile_GPURawCountersImport
+ (id)create:(id)a3;
- (BOOL)_validateAndConfigureRawCounters;
- (BOOL)isAPS;
- (BOOL)prepare;
- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUCounterProfile_GPURawCountersImport)initWithImportAPSDataPath:(id)a3;
- (id)counterProfileForHost;
- (id)ringBufferCounts;
- (id)sampleSizes;
- (void)sampleAPS:(id)a3;
- (void)stop;
@end

@implementation DTGPUCounterProfile_GPURawCountersImport

+ (id)create:(id)a3
{
  id v3 = a3;
  v4 = [[DTGPUCounterProfile_GPURawCountersImport alloc] initWithImportAPSDataPath:v3];

  return v4;
}

- (DTGPUCounterProfile_GPURawCountersImport)initWithImportAPSDataPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTGPUCounterProfile_GPURawCountersImport;
  v5 = [(DTGPUCounterProfile *)&v11 initWithProfile:13 device:0];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    uint64_t v7 = +[DTGPUAPSDataContainer fromData:v6 error:0];
    if (!v7)
    {

      v9 = 0;
      goto LABEL_6;
    }
    container = v5->_container;
    v5->_container = (DTGPUAPSDataContainer *)v7;
  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (BOOL)prepare
{
  return MEMORY[0x270F9A6D0](self, sel__validateAndConfigureRawCounters);
}

- (BOOL)_validateAndConfigureRawCounters
{
  return 1;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  return 1;
}

- (void)stop
{
  self->_sampled = 0;
}

- (void)sampleAPS:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_sampled)
  {
    container = self->_container;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2308941CC;
    v11[3] = &unk_264B8DF40;
    id v7 = v4;
    id v12 = v7;
    [(DTGPUAPSDataContainer *)container enumerateUSCData:v11];
    v8 = self->_container;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_23089426C;
    v9[3] = &unk_264B8DF68;
    id v10 = v7;
    [(DTGPUAPSDataContainer *)v8 enumerateRDEData:v9];
    self->_sampled = 1;
  }
}

- (id)counterProfileForHost
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(DTGPUAPSDataContainer *)self->_container config];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)sampleSizes
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(DTGPUAPSDataContainer *)self->_container config];
  v5 = [v4 objectForKeyedSubscript:@"RDERawCounters"];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [NSNumber numberWithUnsignedInteger:[*(id *)(*((void *)&v15 + 1) + 8 * i) count]];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v10 = NSNumber;
  objc_super v11 = [(DTGPUAPSDataContainer *)self->_container config];
  id v12 = [v11 objectForKeyedSubscript:@"APSRawCounters"];
  v13 = [v10 numberWithUnsignedInteger:[v12 count]];
  [v3 addObject:v13];

  return v3;
}

- (id)ringBufferCounts
{
  id v3 = objc_opt_new();
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v5 = [(DTGPUAPSDataContainer *)self->_container numRDEs];
    container = self->_container;
    if (i >= v5) {
      break;
    }
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:-[DTGPUAPSDataContainer numBuffersAtRDEIndex:](container, "numBuffersAtRDEIndex:", i)];
    [v3 addObject:v7];
  }
  v8 = [NSNumber numberWithUnsignedInteger:-[DTGPUAPSDataContainer numUSCs](container, "numUSCs")];
  [v3 addObject:v8];

  return v3;
}

- (BOOL)isAPS
{
  return 1;
}

- (void).cxx_destruct
{
}

@end