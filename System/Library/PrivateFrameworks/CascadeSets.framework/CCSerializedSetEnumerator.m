@interface CCSerializedSetEnumerator
- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5;
- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6;
- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 usingBlock:(id)a5;
- (CCSerializedSetEnumerator)init;
- (CCSerializedSetEnumerator)initWithSerializedSetData:(id)a3;
- (CCSerializedSetEnumerator)initWithSerializedSets:(id)a3;
- (id)allSets:(id *)a3;
- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4;
- (id)allSetsWithOptions:(unsigned __int16)a3 error:(id *)a4;
- (id)allSetsWithOptions:(unsigned __int16)a3 itemType:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation CCSerializedSetEnumerator

- (CCSerializedSetEnumerator)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSerializedSetEnumerator)initWithSerializedSetData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSerializedSetEnumerator;
  v6 = [(CCSerializedSetEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serializedSetData, a3);
  }

  return v7;
}

- (CCSerializedSetEnumerator)initWithSerializedSets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSerializedSetEnumerator;
  v6 = [(CCSerializedSetEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serializedSets, a3);
  }

  return v7;
}

- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4
{
  return [(CCSerializedSetEnumerator *)self enumerateAllSets:a3 withOptions:0 itemType:(unsigned __int16)CCTypeIdentifierUnknown usingBlock:a4];
}

- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 usingBlock:(id)a5
{
  return [(CCSerializedSetEnumerator *)self enumerateAllSets:a3 withOptions:a4 itemType:(unsigned __int16)CCTypeIdentifierUnknown usingBlock:a5];
}

- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5
{
  return [(CCSerializedSetEnumerator *)self enumerateAllSets:a3 withOptions:0 itemType:a4 usingBlock:a5];
}

- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6
{
  int v6 = a5;
  char v38 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  v37 = (void (**)(id, void *))a6;
  int v36 = v6;
  if (self->_serializedSetData)
  {
    objc_super v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_serializedSetData, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obj = self->_serializedSetData;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = [[CCSerializedSet alloc] initWithData:*(void *)(*((void *)&v45 + 1) + 8 * i) error:a3];
          if (!v14)
          {
            BOOL v33 = 0;
            goto LABEL_37;
          }
          v15 = v14;
          [(NSArray *)v9 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v11);
    }

    serializedSets = self->_serializedSets;
    self->_serializedSets = v9;

    int v6 = v36;
  }
  objc_super v9 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
  int v40 = [MEMORY[0x263F29E78] currentPersonaIsDefault];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = self->_serializedSets;
  uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (!v17) {
    goto LABEL_35;
  }
  uint64_t v19 = v17;
  uint64_t v20 = *(void *)v42;
  *(void *)&long long v18 = 138412546;
  long long v35 = v18;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v42 != v20) {
        objc_enumerationMutation(obj);
      }
      v22 = *(NSArray **)(*((void *)&v41 + 1) + 8 * v21);
      v23 = (void *)MEMORY[0x24C5B1100]();
      if (v9)
      {
        if (v40)
        {
          v24 = [(NSArray *)v22 personaIdentifier];

          if (v24)
          {
            v25 = __biome_log_for_category();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v35;
              v50 = v9;
              __int16 v51 = 2112;
              v52 = v22;
              v26 = v25;
              v27 = "Current persona is default (%@) Skipping serialized set with a nonnull persona: %@";
              goto LABEL_33;
            }
            goto LABEL_29;
          }
        }
        uint64_t v28 = [(NSArray *)v22 personaIdentifier];
        if (v28)
        {
          v29 = (void *)v28;
          v30 = [(NSArray *)v22 personaIdentifier];
          char v31 = [v30 isEqual:v9];

          int v6 = v36;
          if ((v31 & 1) == 0)
          {
            v25 = __biome_log_for_category();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v35;
              v50 = v22;
              __int16 v51 = 2112;
              v52 = v9;
              v26 = v25;
              v27 = "Skipping serialized set: %@ mismatched to current persona: %@";
LABEL_33:
              _os_log_debug_impl(&dword_249B92000, v26, OS_LOG_TYPE_DEBUG, v27, buf, 0x16u);
            }
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      if (((unsigned __int16)CCTypeIdentifierUnknown == v6 || [(NSArray *)v22 itemType] == v6)
        && ((v38 & 1) == 0 || ([(NSArray *)v22 options] & 1) != 0))
      {
        v37[2](v37, v22);
      }
LABEL_30:
      ++v21;
    }
    while (v19 != v21);
    uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    uint64_t v19 = v32;
  }
  while (v32);
LABEL_35:
  BOOL v33 = 1;
LABEL_37:

  return v33;
}

- (id)allSets:(id *)a3
{
  return [(CCSerializedSetEnumerator *)self allSetsWithOptions:0 itemType:(unsigned __int16)CCTypeIdentifierUnknown error:a3];
}

- (id)allSetsWithOptions:(unsigned __int16)a3 error:(id *)a4
{
  return [(CCSerializedSetEnumerator *)self allSetsWithOptions:a3 itemType:(unsigned __int16)CCTypeIdentifierUnknown error:a4];
}

- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4
{
  return [(CCSerializedSetEnumerator *)self allSetsWithOptions:0 itemType:a3 error:a4];
}

- (id)allSetsWithOptions:(unsigned __int16)a3 itemType:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__CCSerializedSetEnumerator_allSetsWithOptions_itemType_error___block_invoke;
  v13[3] = &unk_265279C98;
  id v10 = v9;
  id v14 = v10;
  LODWORD(a5) = [(CCSerializedSetEnumerator *)self enumerateAllSets:a5 withOptions:v7 itemType:v6 usingBlock:v13];

  if (a5) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

uint64_t __63__CCSerializedSetEnumerator_allSetsWithOptions_itemType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedSets, 0);

  objc_storeStrong((id *)&self->_serializedSetData, 0);
}

@end