@interface MSPSenderVirtualMinimalStrategy
- (MSPSenderVirtualMinimalStrategy)initWithGroupSession:(id)a3;
- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4;
@end

@implementation MSPSenderVirtualMinimalStrategy

- (MSPSenderVirtualMinimalStrategy)initWithGroupSession:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F64860] sharedPlatform];
  int v6 = [v5 isInternalInstall];

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)MSPSenderVirtualMinimalStrategy;
    v7 = [(MSPSenderMinimalStrategy *)&v10 initWithGroupSession:v4];
    if (v7) {
      v7->super.super.super._loggingOnly = 1;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v14 = MSPSharedTripVirtualReceiverHandleGetReceiverCapabilities(v13);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13, (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v7 copy];
  v6[2](v6, v15);
}

@end