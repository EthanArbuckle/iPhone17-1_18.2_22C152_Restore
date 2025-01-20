@interface APCCodecInfo
+ (BOOL)isSupportedCodecCapability:(id)a3;
+ (BOOL)isSupportedCodecConfiguration:(id)a3;
+ (Class)configurationClassForName:(id)a3;
+ (id)supportedConfigurationClasses;
+ (id)supportedDecoders;
+ (id)supportedEncoders;
@end

@implementation APCCodecInfo

+ (id)supportedDecoders
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(EchoCodecCapability);
  v3 = objc_alloc_init(NullCodecCapability);
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)supportedEncoders
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(EchoCodecCapability);
  v3 = objc_alloc_init(NullCodecCapability);
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)supportedConfigurationClasses
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];

  return v2;
}

+ (Class)configurationClassForName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = +[APCCodecInfo supportedConfigurationClasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(objc_class **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_alloc_init(v8);
        v10 = [v9 algorithmName];
        char v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          v12 = v8;

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if ([v3 isEqualToString:@"default"])
  {
    objc_opt_class();
    v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

+ (BOOL)isSupportedCodecCapability:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

+ (BOOL)isSupportedCodecConfiguration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

@end