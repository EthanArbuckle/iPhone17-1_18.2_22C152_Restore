@interface DTSysmonTapMessageHandler
- (id)messageReceived:(id)a3;
@end

@implementation DTSysmonTapMessageHandler

- (id)messageReceived:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DTSysmonTapMessageHandler;
  v5 = [(DTTapMessageHandler *)&v29 messageReceived:v4];
  if (!v4 || v5)
  {
    id v12 = v5;
    goto LABEL_19;
  }
  v6 = [(DTTapMessageHandler *)self config];
  uint64_t v28 = 0;
  id v7 = v4;
  uint64_t v8 = [v7 getBufferWithReturnedLength:&v28];
  if (!v8)
  {
    v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v13 = [v7 objectWithAllowedClasses:v14];

    if (v13)
    {
      int v15 = [v13 kind];
      v16 = 0;
      if (v15 <= 6)
      {
        if (v15)
        {
          if (v15 == 5)
          {
            v16 = objc_opt_new();
            [v16 setTapVersion:self->_tapVersion];
            [v16 setFinalMemo:1];
          }
        }
        else
        {
          v16 = 0;
          self->_tapVersion = [v13 tapVersion];
        }
        goto LABEL_17;
      }
      if (v15 != 7)
      {
        if (v15 == 1024)
        {
          v16 = objc_opt_new();
          [v16 setTapVersion:self->_tapVersion];
          v27 = (void *)MEMORY[0x263F08928];
          v17 = (void *)MEMORY[0x263EFFA08];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = objc_opt_class();
          v22 = [v17 setWithObjects:v18, v19, v20, v21, nil];
          v23 = [v27 unarchivedObjectOfClasses:v22 fromData:self->_nextSampleData error:0];
          [v16 setSamples:v23];

          [v16 setSupportsPeek:1];
          nextSampleData = self->_nextSampleData;
          self->_nextSampleData = 0;
        }
        goto LABEL_17;
      }
      v25 = [v13 runningMetadata];
      [v6 _runningMetadataChanged:v25];
    }
    v16 = 0;
LABEL_17:
    id v12 = v16;
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
  v11 = (NSData *)[v10 initWithBytes:v9 length:v28];
  id v12 = 0;
  v13 = self->_nextSampleData;
  self->_nextSampleData = v11;
LABEL_18:

LABEL_19:
  return v12;
}

- (void).cxx_destruct
{
}

@end