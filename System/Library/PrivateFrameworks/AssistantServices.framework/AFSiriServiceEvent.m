@interface AFSiriServiceEvent
- (AFSiriServiceEvent)initWithDomain:(id)a3 identifier:(id)a4 command:(id)a5;
- (AFSiriServiceEvent)initWithMetadata:(id)a3 identifier:(id)a4;
@end

@implementation AFSiriServiceEvent

- (AFSiriServiceEvent)initWithMetadata:(id)a3 identifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (initWithMetadata_identifier__onceToken != -1) {
      dispatch_once(&initWithMetadata_identifier__onceToken, &__block_literal_global_6974);
    }
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [v6 allKeys];
    v10 = [v8 setWithArray:v9];

    if (([v10 isSubsetOfSet:initWithMetadata_identifier__knownKeys] & 1) == 0)
    {
      uint64_t v20 = AFSiriLogContextEvent;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[AFSiriServiceEvent initWithMetadata:identifier:]";
        __int16 v35 = 2112;
        v36 = v10;
        v16 = "%s Unsupported metadata in {%@}";
        v17 = v20;
        uint32_t v18 = 22;
        goto LABEL_26;
      }
LABEL_11:
      v19 = 0;
      v21 = self;
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v11 = [v6 objectForKey:@"dismissalReason"];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v6 objectForKey:@"dismissalReason"];
      uint64_t v14 = [v13 integerValue];

      if ((int)v14 >= 54)
      {
        uint64_t v15 = AFSiriLogContextEvent;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[AFSiriServiceEvent initWithMetadata:identifier:]";
          __int16 v35 = 1024;
          LODWORD(v36) = v14;
          v16 = "%s Unsupported BMSiriServiceDismissalReason %u";
          v17 = v15;
          uint32_t v18 = 18;
LABEL_26:
          _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    v21 = [v6 objectForKey:@"unintended"];
    uint64_t v22 = [v6 objectForKey:@"requestSource"];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = [v6 objectForKey:@"requestSource"];
      uint64_t v25 = [v24 integerValue];

      if ((int)v25 >= 45)
      {
        v26 = AFSiriLogContextEvent;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[AFSiriServiceEvent initWithMetadata:identifier:]";
          __int16 v35 = 1024;
          LODWORD(v36) = v25;
          _os_log_error_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_ERROR, "%s Unsupported BMSiriServiceRequestSource %u", buf, 0x12u);
        }
        v19 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    id v27 = objc_alloc((Class)getBMSiriServiceClass());
    v28 = [v6 objectForKey:@"domain"];
    v29 = (void *)[v27 initWithDismissalReason:v14 unintended:v21 requestSource:v25 identifier:v7 domain:v28 command:0];

    if (v29)
    {
      v32.receiver = self;
      v32.super_class = (Class)AFSiriServiceEvent;
      v30 = [(AFEvent *)&v32 initWithBMEvent:v29];
    }
    else
    {

      v30 = 0;
    }
    self = v30;

    v19 = self;
LABEL_22:

    goto LABEL_23;
  }

  v19 = 0;
LABEL_24:

  return v19;
}

void __50__AFSiriServiceEvent_initWithMetadata_identifier___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"dismissalReason";
  v4[1] = @"requestSource";
  v4[2] = @"unintended";
  v4[3] = @"domain";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithMetadata_identifier__knownKeys;
  initWithMetadata_identifier__knownKeys = v2;
}

- (AFSiriServiceEvent)initWithDomain:(id)a3 identifier:(id)a4 command:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)getBMSiriServiceClass()) initWithDismissalReason:0 unintended:0 requestSource:0 identifier:v9 domain:v10 command:v8];

  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)AFSiriServiceEvent;
    v12 = [(AFEvent *)&v14 initWithBMEvent:v11];
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

@end