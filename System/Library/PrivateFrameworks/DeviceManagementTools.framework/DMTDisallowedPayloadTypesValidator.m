@interface DMTDisallowedPayloadTypesValidator
- (BOOL)validateProfile:(id)a3 error:(id *)a4;
- (NSSet)disallowedPayloadTypes;
- (void)setDisallowedPayloadTypes:(id)a3;
@end

@implementation DMTDisallowedPayloadTypesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(DMTDisallowedPayloadTypesValidator *)self disallowedPayloadTypes];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = objc_msgSend(v6, "payloads", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v13 type];
        int v15 = [v7 containsObject:v14];

        if (v15)
        {
          if (a4)
          {
            v24[0] = @"PayloadContent";
            v23[0] = @"kDMTInvalidConfigurationProfileValueErrorKey";
            v23[1] = @"PayloadType";
            v16 = [v13 type];
            v24[1] = v16;
            v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
            DMTErrorWithCodeAndUserInfo(77, v17);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            LOBYTE(a4) = 0;
          }
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (NSSet)disallowedPayloadTypes
{
  return self->_disallowedPayloadTypes;
}

- (void)setDisallowedPayloadTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end