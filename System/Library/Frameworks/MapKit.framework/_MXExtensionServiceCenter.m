@interface _MXExtensionServiceCenter
- (NSDictionary)containingAppProxies;
- (NSDictionary)extensions;
- (NSDictionary)mapsExtensions;
- (_MXExtensionProvider)extensionProvider;
- (_MXExtensionServiceCenter)initWithExtensionProvider:(id)a3;
- (id)_extensionWithIdentifier:(id)a3;
- (id)_siblingExtensionsWithContainingAppIdentifer:(id)a3;
- (id)allExtensions;
- (void)_clearExtensions;
- (void)receivedExtensions:(id)a3 error:(id)a4;
- (void)setContainingAppProxies:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setMapsExtensions:(id)a3;
@end

@implementation _MXExtensionServiceCenter

- (void)receivedExtensions:(id)a3 error:(id)a4
{
  id v5 = a3;
  v6 = [(_MXExtensionServiceCenter *)self mapsExtensions];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __54___MXExtensionServiceCenter_receivedExtensions_error___block_invoke;
  v15 = &unk_1E54BB870;
  id v16 = v7;
  id v17 = v6;
  v18 = self;
  id v19 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [v5 enumerateObjectsUsingBlock:&v12];

  -[_MXExtensionServiceCenter setExtensions:](self, "setExtensions:", v11, v12, v13, v14, v15);
  [(_MXExtensionServiceCenter *)self setMapsExtensions:v9];
  [(_MXExtensionServiceCenter *)self setContainingAppProxies:0];
}

- (void)setMapsExtensions:(id)a3
{
  v4 = (void *)[a3 copy];
  extlock = self->_extlock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___MXExtensionServiceCenter_setMapsExtensions___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(extlock, v7);
}

- (void)setExtensions:(id)a3
{
  v4 = (void *)[a3 copy];
  extlock = self->_extlock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43___MXExtensionServiceCenter_setExtensions___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(extlock, v7);
}

- (void)setContainingAppProxies:(id)a3
{
  v4 = (void *)[a3 copy];
  extlock = self->_extlock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___MXExtensionServiceCenter_setContainingAppProxies___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(extlock, v7);
}

- (id)allExtensions
{
  v2 = [(_MXExtensionServiceCenter *)self mapsExtensions];
  v3 = [v2 allValues];

  return v3;
}

- (NSDictionary)mapsExtensions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  id v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___MXExtensionServiceCenter_mapsExtensions__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (_MXExtensionServiceCenter)initWithExtensionProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MXExtensionServiceCenter;
  id v5 = [(_MXExtensionServiceCenter *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionProvider, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.maps._MXExtensionServiceCenter.extension", v7);
    extlock = v6->_extlock;
    v6->_extlock = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (id)_extensionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_MXExtensionServiceCenter *)self extensions];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_clearExtensions
{
}

- (id)_siblingExtensionsWithContainingAppIdentifer:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(_MXExtensionServiceCenter *)self containingAppProxies];

    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      v7 = [(_MXExtensionServiceCenter *)self allExtensions];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __74___MXExtensionServiceCenter__siblingExtensionsWithContainingAppIdentifer___block_invoke;
      v20 = &unk_1E54BB898;
      id v21 = v6;
      id v8 = v6;
      [v7 enumerateObjectsUsingBlock:&v17];

      -[_MXExtensionServiceCenter setContainingAppProxies:](self, "setContainingAppProxies:", v8, v17, v18, v19, v20);
    }
    id v9 = [(_MXExtensionServiceCenter *)self containingAppProxies];
    id v10 = [v9 objectForKeyedSubscript:v4];

    if (v10)
    {
      v22[0] = @"kExtensionUI";
      objc_super v11 = [v10 extensionUIIdentifiers];
      uint64_t v12 = (void *)[v11 copy];
      v23[0] = v12;
      v22[1] = @"kExtensionNonUI";
      uint64_t v13 = [v10 extensionNonUIIdentifiers];
      v14 = (void *)[v13 copy];
      v23[1] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDictionary)extensions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  id v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___MXExtensionServiceCenter_extensions__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (NSDictionary)containingAppProxies
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  id v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___MXExtensionServiceCenter_containingAppProxies__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (_MXExtensionProvider)extensionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);

  return (_MXExtensionProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_containingAppProxies, 0);
  objc_storeStrong((id *)&self->_mapsExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_extlock, 0);
}

@end