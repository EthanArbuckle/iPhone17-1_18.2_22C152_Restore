@interface _EXItemProviderCopyingLoadOperator
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)destinationProcessAuditToken;
- (NSDictionary)loadedItems;
- (NSItemProvider)itemProvider;
- (_EXItemProviderCopyingLoadOperator)initWithCoder:(id)a3;
- (_EXItemProviderCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4;
- (id)_loadItemsForTypeIdentifiers:(id)a3 auditToken:(id *)a4 itemProvider:(id)a5;
- (id)_sandboxedResourceForItemIfNeeded:(id)a3 auditToken:(id *)a4 error:(id *)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6;
- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5;
- (void)setDestinationProcessAuditToken:(id *)a3;
- (void)setItemProvider:(id)a3;
- (void)setLoadedItems:(id)a3;
@end

@implementation _EXItemProviderCopyingLoadOperator

- (_EXItemProviderCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4
{
  id v6 = a3;
  v7 = [(_EXItemProviderCopyingLoadOperator *)self init];
  v8 = v7;
  if (v7)
  {
    [(_EXItemProviderCopyingLoadOperator *)v7 setItemProvider:v6];
    long long v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    [(_EXItemProviderCopyingLoadOperator *)v8 setDestinationProcessAuditToken:v12];
    v10 = v8;
  }

  return v8;
}

- (void)dealloc
{
  [(_EXItemProviderCopyingLoadOperator *)self setItemProvider:0];
  [(_EXItemProviderCopyingLoadOperator *)self setLoadedItems:0];
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderCopyingLoadOperator;
  [(_EXItemProviderCopyingLoadOperator *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderCopyingLoadOperator)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderCopyingLoadOperator *)self init];
  if (v5)
  {
    id v6 = [v4 allowedClasses];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"loadedItems"];
    [(_EXItemProviderCopyingLoadOperator *)v5 setLoadedItems:v7];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderCopyingLoadOperator *)self itemProvider];
  id v6 = [v5 registeredTypeIdentifiers];
  long long v7 = *(_OWORD *)&self->_destinationProcessAuditToken.val[4];
  v9[0] = *(_OWORD *)self->_destinationProcessAuditToken.val;
  v9[1] = v7;
  v8 = [(_EXItemProviderCopyingLoadOperator *)self _loadItemsForTypeIdentifiers:v6 auditToken:v9 itemProvider:v5];
  if (v8) {
    [v4 encodeObject:v8 forKey:@"loadedItems"];
  }
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  v14 = (void (**)(id, void *, void *))a4;
  id v8 = a3;
  long long v9 = [(_EXItemProviderCopyingLoadOperator *)self loadedItems];
  v10 = [v9 objectForKeyedSubscript:v8];

  v11 = [v10 objectForKeyedSubscript:@"item"];
  v12 = [v10 objectForKeyedSubscript:@"error"];
  if (!v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v11 resourceURL];

      v11 = (void *)v13;
    }
  }
  v14[2](v14, v11, v12);
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
}

- (id)_loadItemsForTypeIdentifiers:(id)a3 auditToken:(id *)a4 itemProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke;
  v14[3] = &unk_1E573D9A0;
  id v10 = v9;
  id v15 = v10;
  v16 = self;
  long long v11 = *(_OWORD *)&a4->var0[4];
  long long v18 = *(_OWORD *)a4->var0;
  long long v19 = v11;
  v17 = &v20;
  [v8 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v12;
}

- (id)_sandboxedResourceForItemIfNeeded:(id)a3 auditToken:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isFileURL])
  {
    id v8 = [_EXItemProviderSandboxedResource alloc];
    long long v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    id v10 = [(_EXItemProviderSandboxedResource *)v8 initWithContentsOfURL:v7 auditToken:v12 error:a5];
  }
  else
  {
    id v10 = 0;
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

- (NSDictionary)loadedItems
{
  return self->_loadedItems;
}

- (void)setLoadedItems:(id)a3
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
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_destinationProcessAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_destinationProcessAuditToken.val = v3;
}

- (void).cxx_destruct
{
}

@end