@interface DMTAllowedPayloadTypesValidator
- (BOOL)validateProfile:(id)a3 error:(id *)a4;
- (NSSet)allowedPayloadTypes;
- (NSSet)requireAllPayloadTypes;
- (void)setAllowedPayloadTypes:(id)a3;
- (void)setRequireAllPayloadTypes:(id)a3;
@end

@implementation DMTAllowedPayloadTypesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(DMTAllowedPayloadTypesValidator *)self allowedPayloadTypes];
  v8 = [(DMTAllowedPayloadTypesValidator *)self requireAllPayloadTypes];
  v9 = (void *)[v8 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = objc_msgSend(v6, "payloads", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) type];
        if (([v7 containsObject:v15] & 1) == 0 && (objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
        {
          if (a4)
          {
            v26[0] = @"kDMTInvalidConfigurationProfileValueErrorKey";
            v26[1] = @"PayloadType";
            v27[0] = @"PayloadContent";
            v27[1] = v15;
            v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
            DMTErrorWithCodeAndUserInfo(77, v18);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          BOOL v17 = 0;
          goto LABEL_16;
        }
        [v9 removeObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [v9 count];
  BOOL v17 = 1;
  if (a4 && v16)
  {
    v25[0] = @"PayloadContent";
    v24[0] = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v24[1] = @"PayloadType";
    v10 = [v9 anyObject];
    v25[1] = v10;
    v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    DMTErrorWithCodeAndUserInfo(76, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  }
  return v17;
}

- (NSSet)allowedPayloadTypes
{
  return self->_allowedPayloadTypes;
}

- (void)setAllowedPayloadTypes:(id)a3
{
}

- (NSSet)requireAllPayloadTypes
{
  return self->_requireAllPayloadTypes;
}

- (void)setRequireAllPayloadTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requireAllPayloadTypes, 0);
  objc_storeStrong((id *)&self->_allowedPayloadTypes, 0);
}

@end