@interface _EXCopyingLoadOperator
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)destinationProcessAuditToken;
- (NSDictionary)items;
- (NSItemProvider)itemProvider;
- (_EXCopyingLoadOperator)initWithCoder:(id)a3;
- (_EXCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4;
- (id)_sandboxedResourceForItemIfNeeded:(id)a3 auditToken:(id *)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6;
- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5;
- (void)setDestinationProcessAuditToken:(id *)a3;
- (void)setItemProvider:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation _EXCopyingLoadOperator

- (_EXCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4
{
  id v6 = a3;
  v7 = [(_EXLoadOperator *)self _init];
  v8 = v7;
  if (v7)
  {
    [(_EXCopyingLoadOperator *)v7 setItemProvider:v6];
    long long v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    [(_EXCopyingLoadOperator *)v8 setDestinationProcessAuditToken:v12];
    v10 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXCopyingLoadOperator)initWithCoder:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_EXCopyingLoadOperator;
  v5 = [(_EXLoadOperator *)&v28 _init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codedData"];
    if (v6)
    {
      id v27 = 0;
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v27];
      id v8 = v27;
    }
    else
    {
      v7 = 0;
      id v8 = 0;
    }
    long long v9 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    v11 = [v9 setWithArray:v10];
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"items"];

    if (v12)
    {
      id v21 = v8;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = objc_msgSend(v13, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i), v21, v22, (void)v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v18 setEncodedPayload:v7];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v15);
      }

      [(_EXCopyingLoadOperator *)v5 setItems:v13];
      id v8 = v21;
      id v6 = v22;
    }
    v19 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v33 = objc_opt_new();
  [(_EXCopyingLoadOperator *)self itemProvider];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v32 = long long v44 = 0u;
  obuint64_t j = [v32 registeredTypeIdentifiers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    uint64_t v7 = *MEMORY[0x1E4F284B8];
    uint64_t v8 = *MEMORY[0x1E4F284B0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        uint64_t v46 = v7;
        uint64_t v47 = v8;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __42___EXCopyingLoadOperator_encodeWithCoder___block_invoke;
        v38[3] = &unk_1E573D7A0;
        v38[4] = self;
        v38[5] = v10;
        id v39 = v33;
        dispatch_semaphore_t v40 = v11;
        id v13 = v11;
        [v32 loadItemForTypeIdentifier:v10 options:v12 completionHandler:v38];
        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v5);
  }

  uint64_t v14 = v33;
  uint64_t v15 = v30;
  if ([v33 count])
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = v33;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(v17, "objectForKeyedSubscript:", *(void *)(*((void *)&v34 + 1) + 8 * j), v30);
          long long v23 = [v22 payload];
          long long v24 = [v22 payloadIdentifier];
          long long v25 = v24;
          if (v23) {
            BOOL v26 = v24 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          if (!v26)
          {
            id v27 = [v24 UUIDString];
            [v16 encodeObject:v23 forKey:v27];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v19);
    }

    objc_super v28 = [v16 encodedData];
    if (v28)
    {
      v29 = (void *)[v17 copy];
      [v15 encodeObject:v29 forKey:@"items"];

      [v15 encodeObject:v28 forKey:@"codedData"];
    }

    uint64_t v14 = v33;
  }
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  uint64_t v20 = (void (**)(id, void *, void *))a4;
  id v9 = a3;
  uint64_t v10 = [(_EXCopyingLoadOperator *)self items];
  dispatch_semaphore_t v11 = [v10 objectForKeyedSubscript:v9];

  v12 = +[_EXDefaults sharedInstance];
  id v13 = [v12 plistTypes];
  LODWORD(a5) = [v13 containsObject:a5];

  uint64_t v14 = +[_EXDefaults sharedInstance];
  uint64_t v15 = v14;
  if (a5) {
    [v14 plistAndValueTypes];
  }
  else {
  uint64_t v16 = [v14 itemProviderTypes];
  }
  id v17 = [v11 payloadOfClasses:v16];

  uint64_t v18 = [v11 error];
  if (!v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v17 resourceURL];

      id v17 = (void *)v19;
    }
  }
  v20[2](v20, v17, v18);
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
}

- (id)_sandboxedResourceForItemIfNeeded:(id)a3 auditToken:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isFileURL])
  {
    uint64_t v8 = [_EXItemProviderSandboxedResource alloc];
    long long v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    uint64_t v10 = [(_EXItemProviderSandboxedResource *)v8 initWithContentsOfURL:v7 auditToken:v12 error:a5];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  self->_itemProvider = (NSItemProvider *)a3;
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)destinationProcessAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setDestinationProcessAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_destinationProcessAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_destinationProcessAuditToken.val[4] = v3;
}

- (void).cxx_destruct
{
}

@end