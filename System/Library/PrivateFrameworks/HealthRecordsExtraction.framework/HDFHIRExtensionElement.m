@interface HDFHIRExtensionElement
+ (id)FHIRExtensionElementWithJSONObject:(id)a3 error:(id *)a4;
+ (id)FHIRExtensionElementsFromJSONExtensionObject:(id)a3 error:(id *)a4;
- (HDFHIRExtensionElement)init;
- (HDFHIRExtensionElement)initWithJSONDictionary:(id)a3 URI:(id)a4 value:(id)a5;
- (NSCopying)value;
- (NSDictionary)JSONDictionary;
- (NSString)URI;
@end

@implementation HDFHIRExtensionElement

- (HDFHIRExtensionElement)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDFHIRExtensionElement)initWithJSONDictionary:(id)a3 URI:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDFHIRExtensionElement.m", 23, @"Invalid parameter not satisfying: %@", @"[JSONDictionary isKindOfClass:[NSDictionary class]]" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HDFHIRExtensionElement;
  v12 = [(HDFHIRExtensionElement *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    JSONDictionary = v12->_JSONDictionary;
    v12->_JSONDictionary = (NSDictionary *)v13;

    uint64_t v15 = [v10 copy];
    URI = v12->_URI;
    v12->_URI = (NSString *)v15;

    uint64_t v17 = [v11 copyWithZone:0];
    value = v12->_value;
    v12->_value = (NSCopying *)v17;
  }
  return v12;
}

+ (id)FHIRExtensionElementWithJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    v7 = HKSafeObject();
    v8 = v7;
    if (v7)
    {
      id v9 = objc_msgSend(v7, "hk_safeStringForKeyPath:error:", @"url", a4);
      if (v9)
      {
        id v10 = [v8 allKeys];
        id v11 = objc_msgSend(v10, "hk_firstObjectPassingTest:", &__block_literal_global_5);

        v12 = [v8 objectForKeyedSubscript:v11];
        uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithJSONDictionary:v8 URI:v9 value:v12];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"nil JSON object");
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __67__HDFHIRExtensionElement_FHIRExtensionElementWithJSONObject_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"value"];
}

+ (id)FHIRExtensionElementsFromJSONExtensionObject:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"nil JSON object");
    id v22 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  id v6 = HKSafeObject();
  v7 = v6;
  if (!v6)
  {
    id v22 = 0;
    goto LABEL_33;
  }
  if (![v6 count])
  {
    id v22 = (id)MEMORY[0x263EFFA68];
    goto LABEL_33;
  }
  v27 = a4;
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v28 = v7;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v32;
  uint64_t v13 = (os_log_t *)MEMORY[0x263F09908];
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * v14);
      id v30 = 0;
      v16 = +[HDFHIRExtensionElement FHIRExtensionElementWithJSONObject:error:](HDFHIRExtensionElement, "FHIRExtensionElementWithJSONObject:error:", v15, &v30, v27);
      id v17 = v30;
      if (v16)
      {
        v18 = v8;
        id v19 = v16;
        goto LABEL_14;
      }
      _HKInitializeLogging();
      os_log_t v20 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        if (!v17) {
          goto LABEL_15;
        }
LABEL_13:
        v18 = v29;
        id v19 = v17;
LABEL_14:
        [v18 addObject:v19];
        goto LABEL_15;
      }
      +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:(uint64_t)v17 error:&v36];
      if (v17) {
        goto LABEL_13;
      }
LABEL_15:

      ++v14;
    }
    while (v11 != v14);
    uint64_t v21 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    uint64_t v11 = v21;
  }
  while (v21);
LABEL_20:

  if ([v8 count])
  {
    id v22 = v8;
    v7 = v28;
    v23 = v29;
  }
  else
  {
    v23 = v29;
    if ([v29 count])
    {
      id v24 = [v29 firstObject];
      v25 = v24;
      v7 = v28;
      if (v24)
      {
        if (v27) {
          id *v27 = v24;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v22 = 0;
    }
    else
    {
      id v22 = 0;
      v7 = v28;
    }
  }

LABEL_33:
LABEL_34:

  return v22;
}

- (NSString)URI
{
  return self->_URI;
}

- (NSCopying)value
{
  return self->_value;
}

- (NSDictionary)JSONDictionary
{
  return self->_JSONDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONDictionary, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

+ (void)FHIRExtensionElementsFromJSONExtensionObject:(uint64_t)a3 error:(void *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  v7 = HKSensitiveLogItem();
  *(_DWORD *)a1 = 138412290;
  *a4 = v7;
  _os_log_error_impl(&dword_232E63000, v6, OS_LOG_TYPE_ERROR, "Invalid extension element: %@", a1, 0xCu);
}

@end