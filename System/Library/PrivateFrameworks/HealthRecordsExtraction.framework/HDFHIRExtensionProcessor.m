@interface HDFHIRExtensionProcessor
+ (BOOL)isSupportedModifierExtension:(id)a3;
+ (id)extensionsForURL:(id)a3 inJSONDictionary:(id)a4 error:(id *)a5;
- (HDFHIRExtensionProcessor)init;
- (HDFHIRExtensionProcessor)initWithResource:(id)a3;
- (HDFHIRResourceObject)resource;
- (NSArray)collectedUnsupportedModifierExtensions;
- (NSMutableArray)collectingUnsupportedModifierExtensions;
- (id)findUnsupportedModifierExtensions:(id *)a3;
- (int64_t)visitor:(id)a3 willVisitArray:(id)a4;
- (void)setCollectedUnsupportedModifierExtensions:(id)a3;
- (void)setCollectingUnsupportedModifierExtensions:(id)a3;
@end

@implementation HDFHIRExtensionProcessor

- (HDFHIRExtensionProcessor)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDFHIRExtensionProcessor)initWithResource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDFHIRExtensionProcessor;
  v5 = [(HDFHIRExtensionProcessor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    resource = v5->_resource;
    v5->_resource = (HDFHIRResourceObject *)v6;
  }
  return v5;
}

+ (id)extensionsForURL:(id)a3 inJSONDictionary:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HDFHIRExtensionProcessor.m", 47, @"Invalid parameter not satisfying: %@", @"[JSONDictionary isKindOfClass:[NSDictionary class]]" object file lineNumber description];
  }
  id v20 = 0;
  v11 = objc_msgSend(v10, "hk_safeArrayIfExistsForKeyPath:error:", @"extension", &v20);
  id v12 = v20;
  v13 = v12;
  if (v11)
  {
    v14 = +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:v11 error:a5];
    if (v14)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __68__HDFHIRExtensionProcessor_extensionsForURL_inJSONDictionary_error___block_invoke;
      v18[3] = &unk_264BD9AA0;
      id v19 = v9;
      v15 = objc_msgSend(v14, "hk_filter:", v18);
    }
    else
    {
      v15 = 0;
    }
  }
  else if (v12)
  {
    if (a5)
    {
      v15 = 0;
      *a5 = v12;
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x263EFFA68];
  }

  return v15;
}

uint64_t __68__HDFHIRExtensionProcessor_extensionsForURL_inJSONDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 URI];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)findUnsupportedModifierExtensions:(id *)a3
{
  v5 = (void *)MEMORY[0x263F0A468];
  uint64_t v6 = [(HDFHIRResourceObject *)self->_resource JSONObject];
  v7 = [v5 visitorWithJSONObject:v6 delegate:self error:a3];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(HDFHIRExtensionProcessor *)self setCollectingUnsupportedModifierExtensions:v8];

    [v7 traverseJSONObject];
    id v9 = (void *)[(NSMutableArray *)self->_collectingUnsupportedModifierExtensions copy];
    [(HDFHIRExtensionProcessor *)self setCollectingUnsupportedModifierExtensions:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int64_t)visitor:(id)a3 willVisitArray:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!self->_collectingUnsupportedModifierExtensions)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"HDFHIRExtensionProcessor.m" lineNumber:88 description:@"not properly set up to use a JSON visitor"];
  }
  id v9 = [v7 lastKeyPathComponent];
  int v10 = [v9 isEqualToString:@"modifierExtension"];

  if (v10)
  {
    id v40 = 0;
    v11 = +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:v8 error:&v40];
    id v12 = v40;
    v13 = v12;
    if (v11)
    {
      id v31 = v12;
      id v33 = v8;
      id v34 = v7;
      v35 = [v7 allKeyPathComponents];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v32 = v11;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v37;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * v19);
            if (([(id)objc_opt_class() isSupportedModifierExtension:v20] & 1) == 0)
            {
              v21 = [NSNumber numberWithUnsignedInteger:v17 + v19];
              v22 = [v21 description];
              v23 = [v35 arrayByAddingObject:v22];

              v24 = [HDFHIRExtensionElementResult alloc];
              v25 = [v23 componentsJoinedByString:@"."];
              v26 = [(HDFHIRExtensionElementResult *)v24 initWithExtensionElement:v20 keyPath:v25 isModifierExtension:1];

              [(NSMutableArray *)self->_collectingUnsupportedModifierExtensions addObject:v26];
            }
            ++v19;
          }
          while (v16 != v19);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
          v17 += v19;
        }
        while (v16);
      }

      id v8 = v33;
      id v7 = v34;
      v13 = v31;
      v11 = v32;
    }
    else
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HDFHIRExtensionProcessor visitor:willVisitArray:](v28);
      }
    }

    int64_t v27 = 2;
  }
  else
  {
    int64_t v27 = 1;
  }

  return v27;
}

+ (BOOL)isSupportedModifierExtension:(id)a3
{
  return 0;
}

- (HDFHIRResourceObject)resource
{
  return self->_resource;
}

- (NSArray)collectedUnsupportedModifierExtensions
{
  return self->_collectedUnsupportedModifierExtensions;
}

- (void)setCollectedUnsupportedModifierExtensions:(id)a3
{
}

- (NSMutableArray)collectingUnsupportedModifierExtensions
{
  return self->_collectingUnsupportedModifierExtensions;
}

- (void)setCollectingUnsupportedModifierExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectingUnsupportedModifierExtensions, 0);
  objc_storeStrong((id *)&self->_collectedUnsupportedModifierExtensions, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (void)visitor:(void *)a1 willVisitArray:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_232E63000, v1, OS_LOG_TYPE_ERROR, "Unable to instantiate extensions: %@", (uint8_t *)&v3, 0xCu);
}

@end