@interface DMTConfigurationProfile
+ (id)configurationProfileWithData:(id)a3 error:(id *)a4;
+ (id)configurationProfileWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)validateWithValidators:(id)a3 error:(id *)a4;
- (DMTConfigurationProfile)initWithDictionary:(id)a3 error:(id *)a4;
- (NSArray)payloads;
- (NSDictionary)payloadsByType;
- (NSDictionary)payloadsByUUID;
- (id)payloadsOfType:(id)a3;
- (id)payloadsOfTypes:(id)a3;
@end

@implementation DMTConfigurationProfile

+ (id)configurationProfileWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFDataGetTypeID())
    {
      uint64_t v9 = ExtractSignedData(v7);
      v10 = (void *)v9;
      if (v9) {
        v11 = (void *)v9;
      }
      else {
        v11 = v7;
      }
      id v12 = v11;

      v13 = [MEMORY[0x263F08AC0] propertyListWithData:v12 options:0 format:0 error:a4];

      if (v13)
      {
        v14 = [a1 configurationProfileWithDictionary:v13 error:a4];
      }
      else
      {
        v14 = 0;
      }

      goto LABEL_16;
    }
    if (a4)
    {
      v15 = &unk_26E1158E0;
      uint64_t v16 = 71;
      goto LABEL_12;
    }
  }
  else if (a4)
  {
    v15 = &unk_26E1158B8;
    uint64_t v16 = 70;
LABEL_12:
    DMTErrorWithCodeAndUserInfo(v16, v15);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)configurationProfileWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFDictionaryGetTypeID())
    {
      uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithDictionary:v7 error:a4];
      goto LABEL_10;
    }
    if (a4)
    {
      v10 = &unk_26E115930;
      uint64_t v11 = 71;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v10 = &unk_26E115908;
    uint64_t v11 = 70;
LABEL_8:
    DMTErrorWithCodeAndUserInfo(v11, v10);
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (NSDictionary)payloadsByType
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  payloadsByType = self->_payloadsByType;
  if (!payloadsByType)
  {
    v4 = [(DMTConfigurationProfile *)self payloads];
    v5 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v12 = [v11 type];
          v13 = [v5 objectForKeyedSubscript:v12];
          v14 = v13;
          if (v13)
          {
            [v13 addObject:v11];
          }
          else
          {
            v15 = [MEMORY[0x263EFF980] arrayWithObject:v11];
            [v5 setObject:v15 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    uint64_t v16 = (NSDictionary *)[v5 copy];
    v17 = self->_payloadsByType;
    self->_payloadsByType = v16;

    payloadsByType = self->_payloadsByType;
  }
  return payloadsByType;
}

- (NSDictionary)payloadsByUUID
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  payloadsByUUID = self->_payloadsByUUID;
  if (!payloadsByUUID)
  {
    v4 = [(DMTConfigurationProfile *)self payloads];
    v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "uuid", (void)v16);
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    v13 = (NSDictionary *)[v5 copy];
    v14 = self->_payloadsByUUID;
    self->_payloadsByUUID = v13;

    payloadsByUUID = self->_payloadsByUUID;
  }
  return payloadsByUUID;
}

- (id)payloadsOfType:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(DMTConfigurationProfile *)self payloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 type];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)payloadsOfTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(DMTConfigurationProfile *)self payloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 type];
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)validateWithValidators:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "validateProfile:error:", self, a4, (void)v13))
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (DMTConfigurationProfile)initWithDictionary:(id)a3 error:(id *)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DMTConfigurationProfile;
  uint64_t v7 = [(DMTConfigurationPrimitive *)&v31 initWithDictionary:v6 error:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(DMTConfigurationPrimitive *)v7 type];
    char v10 = [v9 isEqualToString:@"Configuration"];

    if (v10)
    {
      BOOL v11 = DMTValidateProfileArray(v6, @"PayloadContent", 0, a4);
      id v12 = v11;
      if (!v11) {
        goto LABEL_23;
      }
      uint64_t v13 = [v11 count];
      if (v13)
      {
        long long v14 = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = v12;
        uint64_t v15 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          id v26 = v6;
          long long v17 = 0;
          uint64_t v18 = *(void *)v28;
          while (2)
          {
            uint64_t v19 = 0;
            uint64_t v20 = v17;
            do
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v12);
              }
              long long v17 = +[DMTConfigurationPayloadBase concretePayloadWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * v19) error:a4];

              if (!v17)
              {

                v23 = 0;
                id v6 = v26;
                goto LABEL_20;
              }
              [v14 addObject:v17];
              ++v19;
              uint64_t v20 = v17;
            }
            while (v16 != v19);
            uint64_t v16 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
            if (v16) {
              continue;
            }
            break;
          }

          id v6 = v26;
        }

        uint64_t v21 = [v14 copy];
        payloads = v8->_payloads;
        v8->_payloads = (NSArray *)v21;

        v23 = v8;
        goto LABEL_20;
      }
      if (!a4)
      {
LABEL_23:
        v23 = 0;
        goto LABEL_24;
      }
      v33 = @"kDMTInvalidConfigurationProfileValueErrorKey";
      v34 = @"PayloadContent";
      long long v14 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v24 = 74;
LABEL_17:
      DMTErrorWithCodeAndUserInfo(v24, v14);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_24:
      goto LABEL_25;
    }
    if (a4)
    {
      v35[1] = @"PayloadType";
      v36[0] = @"PayloadType";
      v35[0] = @"kDMTInvalidConfigurationProfileValueErrorKey";
      id v12 = [(DMTConfigurationPrimitive *)v8 type];
      v36[1] = v12;
      long long v14 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      uint64_t v24 = 72;
      goto LABEL_17;
    }
  }
  v23 = 0;
LABEL_25:

  return v23;
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsByUUID, 0);
  objc_storeStrong((id *)&self->_payloadsByType, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
}

@end