@interface AXAuditObjectTransportManager
+ (id)sharedManager;
- (AXAuditObjectTransportManager)init;
- (BOOL)enforceSecureTransport;
- (BOOL)validateSupportedConnectionSecureTransport:(id)a3;
- (NSMutableArray)_transportInfoEncodeOnly;
- (NSMutableDictionary)_keyToTransportInfo;
- (id)_transportInfoEncodeOnlyForObject:(id)a3;
- (id)_transportInfoForObject:(id)a3;
- (id)arrayForTransportArray:(id)a3 expectedClass:(Class)a4;
- (id)objectForTransportDictionary:(id)a3 expectedClass:(Class)a4;
- (id)transportArrayForArray:(id)a3;
- (id)transportDictionaryForObject:(id)a3;
- (void)_registerKnownClasses;
- (void)_validateTransportObjectIfNeeded:(id)a3;
- (void)registerTransportInfoMasquerade:(id)a3 encodeOnly:(BOOL)a4;
- (void)registerTransportInfoPropertyBased:(id)a3;
- (void)registerTransportableClass:(Class)a3;
- (void)setEnforceSecureTransport:(BOOL)a3;
- (void)set_keyToTransportInfo:(id)a3;
- (void)set_transportInfoEncodeOnly:(id)a3;
@end

@implementation AXAuditObjectTransportManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__AXAuditObjectTransportManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, block);
  }
  v2 = (void *)sharedManager_instance_0;

  return v2;
}

uint64_t __46__AXAuditObjectTransportManager_sharedManager__block_invoke()
{
  sharedManager_instance_0 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXAuditObjectTransportManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditObjectTransportManager;
  v2 = [(AXAuditObjectTransportManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keyToTransportInfo = v2->__keyToTransportInfo;
    v2->__keyToTransportInfo = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    transportInfoEncodeOnly = v2->__transportInfoEncodeOnly;
    v2->__transportInfoEncodeOnly = (NSMutableArray *)v5;

    [(AXAuditObjectTransportManager *)v2 _registerKnownClasses];
  }
  return v2;
}

- (void)_registerKnownClasses
{
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  [(AXAuditObjectTransportManager *)self registerTransportableClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();

  [(AXAuditObjectTransportManager *)self registerTransportableClass:v3];
}

- (void)registerTransportableClass:(Class)a3
{
}

- (id)transportDictionaryForObject:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v5 setObject:AuditTransportObjectTypePassthrough forKeyedSubscript:AuditTransportObjectTypeKey];
      [v5 setObject:v4 forKeyedSubscript:AuditTransportValueKey];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (objc_class *)MEMORY[0x263F089B8];
        id v8 = v4;
        id v9 = [v7 alloc];
        v10 = [v8 string];
        v11 = (void *)[v9 initWithString:v10];

        v12 = [v8 string];
        uint64_t v13 = [v12 length];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __62__AXAuditObjectTransportManager_transportDictionaryForObject___block_invoke;
        v49[3] = &unk_26520CE90;
        v49[4] = self;
        id v50 = v11;
        id v14 = v11;
        objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 2, v49);

        [v5 setObject:AuditTransportObjectTypePassthrough forKeyedSubscript:AuditTransportObjectTypeKey];
        v15 = (void *)[v14 copy];
        [v5 setObject:v15 forKeyedSubscript:AuditTransportValueKey];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = objc_opt_new();
          id v17 = v4;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v52 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v46 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = [(AXAuditObjectTransportManager *)self transportDictionaryForObject:*(void *)(*((void *)&v45 + 1) + 8 * i)];
                if (v22) {
                  [v16 addObject:v22];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v52 count:16];
            }
            while (v19);
          }
          [v5 setObject:AuditTransportObjectTypePassthrough forKeyedSubscript:AuditTransportObjectTypeKey];
          [v5 setObject:v16 forKeyedSubscript:AuditTransportValueKey];
        }
        else
        {
          CFTypeID v23 = CFGetTypeID(v4);
          if (v23 == CGColorGetTypeID())
          {
            [v5 setObject:AuditTransportObjectTypePassthrough forKeyedSubscript:AuditTransportObjectTypeKey];
            v16 = [MEMORY[0x263F1C550] colorWithCGColor:v4];
            [v5 setObject:v16 forKeyedSubscript:AuditTransportValueKey];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = objc_opt_new();
              id v24 = v4;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v51 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v42;
                do
                {
                  uint64_t v28 = 0;
                  uint64_t v40 = v26;
                  do
                  {
                    if (*(void *)v42 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * v28);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v30 = v27;
                      id v31 = v24;
                      v32 = [v24 objectForKey:v29];
                      v33 = [(AXAuditObjectTransportManager *)self transportDictionaryForObject:v32];
                      if (v33) {
                        [v38 setObject:v33 forKey:v29];
                      }

                      id v24 = v31;
                      uint64_t v27 = v30;
                      uint64_t v26 = v40;
                    }
                    ++v28;
                  }
                  while (v26 != v28);
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v51 count:16];
                }
                while (v26);
              }
              objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey, v38);
              v16 = v39;
              [v5 setObject:v39 forKeyedSubscript:AuditTransportValueKey];
            }
            else
            {
              v16 = [(AXAuditObjectTransportManager *)self _transportInfoForObject:v4];
              if (!v16)
              {
                v16 = [(AXAuditObjectTransportManager *)self _transportInfoEncodeOnlyForObject:v4];
              }
              v34 = [v16 transportKey];
              [v5 setObject:v34 forKeyedSubscript:AuditTransportObjectTypeKey];

              if (v16)
              {
                v35 = [v16 createTransportObjectBlock];
                v36 = ((void (**)(void, id))v35)[2](v35, v4);

                v37 = [(AXAuditObjectTransportManager *)self transportDictionaryForObject:v36];
                [v5 setObject:v37 forKeyedSubscript:AuditTransportValueKey];
              }
            }
          }
        }
      }
    }
    [(AXAuditObjectTransportManager *)self _validateTransportObjectIfNeeded:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __62__AXAuditObjectTransportManager_transportDictionaryForObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) transportDictionaryForObject:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);
  }
}

- (id)objectForTransportDictionary:(id)a3 expectedClass:(Class)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(AXAuditObjectTransportManager *)self _validateTransportObjectIfNeeded:v6];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_48;
  }
  id v8 = [v6 objectForKeyedSubscript:AuditTransportObjectTypeKey];
  if ([v8 isEqualToString:AuditTransportObjectTypePassthrough])
  {
    id v9 = [v6 objectForKeyedSubscript:AuditTransportValueKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v41 = v8;
      long long v42 = a4;
      id v40 = v6;
      long long v43 = v9;
      id v10 = v9;
      v11 = objc_opt_new();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v12, "objectForKey:", v17, v40);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [(AXAuditObjectTransportManager *)self objectForTransportDictionary:v18 expectedClass:0];

              uint64_t v18 = (void *)v19;
            }
            if (v18) {
              [v11 setObject:v18 forKey:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v14);
      }

      id v6 = v40;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = (objc_class *)MEMORY[0x263F089B8];
        long long v43 = v9;
        id v26 = v9;
        id v27 = [v25 alloc];
        uint64_t v28 = [v26 string];
        uint64_t v29 = (void *)[v27 initWithString:v28];

        uint64_t v30 = [v26 string];
        uint64_t v31 = [v30 length];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __76__AXAuditObjectTransportManager_objectForTransportDictionary_expectedClass___block_invoke;
        v48[3] = &unk_26520CE90;
        v48[4] = self;
        id v49 = v29;
        id v12 = v29;
        objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", 0, v31, 2, v48);

        v11 = (void *)[v12 copy];
        goto LABEL_25;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v7 = v9;
      if ((isKindOfClass & 1) == 0)
      {
LABEL_26:

        if (!a4) {
          goto LABEL_47;
        }
        goto LABEL_43;
      }
      long long v42 = a4;
      long long v43 = v9;
      long long v41 = v8;
      v11 = objc_opt_new();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = v7;
      uint64_t v33 = [v12 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v12);
            }
            id v37 = *(id *)(*((void *)&v44 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v38 = [(AXAuditObjectTransportManager *)self objectForTransportDictionary:v37 expectedClass:0];

              id v37 = (id)v38;
            }
            if (v37) {
              [v11 addObject:v37];
            }
          }
          uint64_t v34 = [v12 countByEnumeratingWithState:&v44 objects:v54 count:16];
        }
        while (v34);
      }
    }
    id v8 = v41;
    a4 = v42;
LABEL_25:

    id v7 = v11;
    id v9 = v43;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length])
  {
    uint64_t v20 = [(AXAuditObjectTransportManager *)self _keyToTransportInfo];
    v21 = [v20 objectForKeyedSubscript:v8];

    if (v21)
    {
      v22 = [v6 objectForKeyedSubscript:AuditTransportValueKey];
      CFTypeID v23 = [(AXAuditObjectTransportManager *)self objectForTransportDictionary:v22 expectedClass:0];

      id v24 = [v21 createLocalObjectBlock];
      ((void (**)(void, void *))v24)[2](v24, v23);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }

    if (!a4) {
      goto LABEL_47;
    }
LABEL_43:
    if (!v7 || (objc_opt_isKindOfClass() & 1) != 0) {
      goto LABEL_47;
    }
  }
  id v7 = 0;
LABEL_47:

LABEL_48:

  return v7;
}

void __76__AXAuditObjectTransportManager_objectForTransportDictionary_expectedClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectForTransportDictionary:v8 expectedClass:objc_opt_class()];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v9, a3, a4);
  }
}

- (id)transportArrayForArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[AXAuditObjectTransportManager transportDictionaryForObject:](self, "transportDictionaryForObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(AXAuditObjectTransportManager *)self _validateTransportObjectIfNeeded:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)arrayForTransportArray:(id)a3 expectedClass:(Class)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(AXAuditObjectTransportManager *)self _validateTransportObjectIfNeeded:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
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
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = -[AXAuditObjectTransportManager objectForTransportDictionary:expectedClass:](self, "objectForTransportDictionary:expectedClass:", v13, a4, (void)v16);
            if (v14) {
              [v7 addObject:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_transportInfoEncodeOnlyForObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(AXAuditObjectTransportManager *)self _transportInfoEncodeOnly];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 canEncodeObjectBlock];
        int v11 = ((uint64_t (**)(void, id))v10)[2](v10, v4);

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_transportInfoForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXAuditObjectTransportManager *)self _keyToTransportInfo];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      int v11 = [v10 canEncodeObjectBlock];
      char v12 = ((uint64_t (**)(void, id))v11)[2](v11, v4);

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)registerTransportInfoMasquerade:(id)a3 encodeOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 masqueradeAsClass];
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  [(AXAuditObjectTransportManager *)self _keyToTransportInfo];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  int v11 = v9;
  if (!v10)
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v12 = v10;
  long long v17 = self;
  uint64_t v13 = *(void *)v19;
LABEL_4:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v19 != v13) {
      objc_enumerationMutation(v9);
    }
    int v11 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v14)];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend((id)objc_msgSend(v11, "masqueradeAsClass"), "isEqual:", v8) & 1) != 0)
        {

          if (!v11) {
            goto LABEL_23;
          }
LABEL_20:
          long long v15 = [v11 transportKey];
          [v6 setTransportKey:v15];
          [v6 setMasqueradeTransportInfo:v11];
          long long v16 = [(AXAuditObjectTransportManager *)v17 _transportInfoEncodeOnly];
          [v16 addObject:v6];

LABEL_21:
          goto LABEL_22;
        }
      }
      goto LABEL_13;
    }
    if (objc_msgSend((id)objc_msgSend(v11, "entryClass"), "isEqual:", v8)) {
      break;
    }
LABEL_13:

    if (v12 == ++v14)
    {
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        goto LABEL_4;
      }
      int v11 = v9;
      goto LABEL_22;
    }
  }

  if (v11)
  {
    if (v4) {
      goto LABEL_20;
    }
    long long v15 = [v11 transportKey];
    [v6 setTransportKey:v15];
    [v6 setMasqueradeTransportInfo:v11];
    [v9 setObject:v6 forKey:v15];
    goto LABEL_21;
  }
LABEL_23:

LABEL_24:
}

- (void)registerTransportInfoPropertyBased:(id)a3
{
  id v4 = a3;
  id v6 = [v4 transportKey];
  id v5 = [(AXAuditObjectTransportManager *)self _keyToTransportInfo];
  [v5 setObject:v4 forKey:v6];
}

- (void)_validateTransportObjectIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(AXAuditObjectTransportManager *)self enforceSecureTransport]) {
    [(AXAuditObjectTransportManager *)self validateSupportedConnectionSecureTransport:v4];
  }
}

- (BOOL)validateSupportedConnectionSecureTransport:(id)a3
{
  v43[8] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    v43[3] = objc_opt_class();
    v43[4] = objc_opt_class();
    v43[5] = objc_opt_class();
    v43[6] = objc_opt_class();
    v43[7] = objc_opt_class();
    [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:8];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_opt_isKindOfClass())
          {

            BOOL v13 = 1;
            goto LABEL_41;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v9);
            }
            if (![(AXAuditObjectTransportManager *)self validateSupportedConnectionSecureTransport:*(void *)(*((void *)&v32 + 1) + 8 * j)])
            {
              BOOL v13 = 0;
              goto LABEL_34;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      BOOL v13 = 1;
LABEL_34:
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v4;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (uint64_t k = 0; k != v15; ++k)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * k);
              if ([(AXAuditObjectTransportManager *)self validateSupportedConnectionSecureTransport:v18])
              {
                long long v19 = [v14 objectForKey:v18];
                BOOL v20 = [(AXAuditObjectTransportManager *)self validateSupportedConnectionSecureTransport:v19];

                if (v20) {
                  continue;
                }
              }
              BOOL v13 = 0;
              goto LABEL_40;
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
            BOOL v13 = 1;
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          BOOL v13 = 1;
        }
LABEL_40:
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = 0;
          uint64_t v25 = &v24;
          uint64_t v26 = 0x2020000000;
          char v27 = 0;
          uint64_t v21 = [v4 length];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __76__AXAuditObjectTransportManager_validateSupportedConnectionSecureTransport___block_invoke;
          v23[3] = &unk_26520CEB8;
          v23[4] = self;
          v23[5] = &v24;
          objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v21, 0, v23);
          BOOL v13 = *((unsigned char *)v25 + 24) == 0;
          _Block_object_dispose(&v24, 8);
        }
        else
        {
          BOOL v13 = 0;
        }
      }
    }
LABEL_41:
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

uint64_t __76__AXAuditObjectTransportManager_validateSupportedConnectionSecureTransport___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) validateSupportedConnectionSecureTransport:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)enforceSecureTransport
{
  return self->_enforceSecureTransport;
}

- (void)setEnforceSecureTransport:(BOOL)a3
{
  self->_enforceSecureTransport = a3;
}

- (NSMutableDictionary)_keyToTransportInfo
{
  return self->__keyToTransportInfo;
}

- (void)set_keyToTransportInfo:(id)a3
{
}

- (NSMutableArray)_transportInfoEncodeOnly
{
  return self->__transportInfoEncodeOnly;
}

- (void)set_transportInfoEncodeOnly:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transportInfoEncodeOnly, 0);

  objc_storeStrong((id *)&self->__keyToTransportInfo, 0);
}

@end