@interface VSBinder
- (BOOL)isEstablishmentProhibited;
- (NSCountedSet)currentlyChangingBindings;
- (NSMutableDictionary)establishedBindings;
- (VSBinder)init;
- (VSBinder)initWithBoundObject:(id)a3;
- (id)_infoForBinding:(id)a3;
- (id)boundObject;
- (id)valueForBinding:(id)a3;
- (void)dealloc;
- (void)establishBinding:(id)a3 withInfo:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentlyChangingBindings:(id)a3;
- (void)setEstablishedBindings:(id)a3;
- (void)setEstablishmentProhibited:(BOOL)a3;
- (void)setValue:(id)a3 forBinding:(id)a4;
- (void)tearDownBinding:(id)a3;
@end

@implementation VSBinder

- (VSBinder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSBinder)initWithBoundObject:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The boundObject parameter must not be nil."];
  }
  v11.receiver = self;
  v11.super_class = (Class)VSBinder;
  v5 = [(VSBinder *)&v11 init];
  if (v5)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    currentlyChangingBindings = v5->_currentlyChangingBindings;
    v5->_currentlyChangingBindings = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    establishedBindings = v5->_establishedBindings;
    v5->_establishedBindings = v8;

    objc_storeWeak(&v5->_boundObject, v4);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v2->_establishmentProhibited = 1;
  v3 = [(NSMutableDictionary *)v2->_establishedBindings allKeys];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [(VSBinder *)v2 tearDownBinding:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = v2;
  v9.super_class = (Class)VSBinder;
  [(VSBinder *)&v9 dealloc];
}

- (id)_infoForBinding:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  id v5 = [(VSBinder *)self establishedBindings];
  uint64_t v6 = [v5 objectForKey:v4];
  uint64_t v7 = +[VSOptional optionalWithObject:v6];

  return v7;
}

- (void)establishBinding:(id)a3 withInfo:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v15)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
    if (v6) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The bindingInfo parameter must not be nil."];
LABEL_3:
  [v6 requireExpectedConcurrency];
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (![(VSBinder *)v7 isEstablishmentProhibited])
  {
    uint64_t v8 = [(VSBinder *)v7 _infoForBinding:v15];
    objc_super v9 = [v8 object];

    if (v9) {
      [(VSBinder *)v7 tearDownBinding:v15];
    }
    long long v10 = [(VSBinder *)v7 establishedBindings];
    long long v11 = (void *)MEMORY[0x1E0173AA0]([v10 setObject:v6 forKey:v15]);
    long long v12 = [v6 weakObservedObject];
    if (v12)
    {
      long long v13 = [v6 keyPath];
      [v12 addObserver:v7 forKeyPath:v13 options:12 context:v15];
      v14 = objc_msgSend(v12, "vs_unbinderCreatingIfNeeded:", 1);
      [v14 binder:v7 didEstablishBinding:v15];
    }
    else
    {
      [v10 removeObjectForKey:v15];
    }
  }
  objc_sync_exit(v7);
}

- (void)tearDownBinding:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(VSBinder *)v5 _infoForBinding:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__VSBinder_tearDownBinding___block_invoke;
  v8[3] = &unk_1E6BD37F8;
  v8[4] = v5;
  id v7 = v4;
  id v9 = v7;
  [v6 conditionallyUnwrapObject:v8 otherwise:&__block_literal_global_27];

  objc_sync_exit(v5);
}

void __28__VSBinder_tearDownBinding___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 requireExpectedConcurrency];
  id v4 = [v3 unsafeObservedObject];
  id v5 = [v3 keyPath];
  [v4 removeObserver:*(void *)(a1 + 32) forKeyPath:v5 context:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) establishedBindings];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v17 = v5;
  id v7 = intermediaryKeyPathsForKeyPath(v5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [v4 valueForKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * v11)];
        long long v13 = (void *)MEMORY[0x1E0173AA0]();
        v14 = objc_msgSend(v12, "vs_unbinderCreatingIfNeeded:", 0);
        [v14 binder:*(void *)(a1 + 32) didTearDownBinding:*(void *)(a1 + 40)];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v15 = (void *)MEMORY[0x1E0173AA0]();
  v16 = objc_msgSend(v4, "vs_unbinderCreatingIfNeeded:", 0);
  [v16 binder:*(void *)(a1 + 32) didTearDownBinding:*(void *)(a1 + 40)];
}

- (id)valueForBinding:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(VSBinder *)v5 _infoForBinding:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__VSBinder_valueForBinding___block_invoke;
  v9[3] = &unk_1E6BD3820;
  v9[4] = &v10;
  [v6 conditionallyUnwrapObject:v9];

  objc_sync_exit(v5);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __28__VSBinder_valueForBinding___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 value];

  return MEMORY[0x1F41817F8]();
}

- (void)setValue:(id)a3 forBinding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(VSBinder *)v8 currentlyChangingBindings];
  [v9 addObject:v7];
  uint64_t v10 = [(VSBinder *)v8 _infoForBinding:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__VSBinder_setValue_forBinding___block_invoke;
  v12[3] = &unk_1E6BD3848;
  id v11 = v6;
  id v13 = v11;
  [v10 conditionallyUnwrapObject:v12];

  [v9 removeObject:v7];
  objc_sync_exit(v8);
}

uint64_t __32__VSBinder_setValue_forBinding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v31 = a4;
  id v30 = a5;
  if (v10)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keyPathOrNil parameter must not be nil."];
    if (a6) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The context parameter must not be nil."];
LABEL_3:
  id v11 = a6;
  uint64_t v12 = self;
  objc_sync_enter(v12);
  v32 = v11;
  id v13 = [(VSBinder *)v12 _infoForBinding:v11];
  [v13 conditionallyUnwrapObject:&__block_literal_global_24];
  v29 = v10;

  objc_sync_exit(v12);
  v14 = [v30 objectForKey:*MEMORY[0x1E4F284D8]];
  int v15 = [v14 BOOLValue];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (!v10) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The keyPathOrNil parameter must not be nil.", 0);
  }
  v16 = intermediaryKeyPathsForKeyPath(v29);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(v31, "valueForKeyPath:", *(void *)(*((void *)&v33 + 1) + 8 * i), v29);
        long long v21 = (void *)MEMORY[0x1E0173AA0]();
        v22 = objc_msgSend(v20, "vs_unbinderCreatingIfNeeded:", v15 ^ 1u);
        uint64_t v23 = v22;
        if (v15) {
          [v22 binder:v12 didTearDownBinding:v32];
        }
        else {
          [v22 binder:v12 didEstablishBinding:v32];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  v24 = v12;
  objc_sync_enter(v24);
  v25 = [(VSBinder *)v24 currentlyChangingBindings];
  int v26 = [v25 containsObject:v32];

  if (((v26 | v15) & 1) == 0)
  {
    v27 = [(VSBinder *)v24 valueForBinding:v32];
    v28 = [(VSBinder *)v24 boundObject];
    [v28 setValue:v27 forKey:v32];
  }
  objc_sync_exit(v24);
}

uint64_t __59__VSBinder_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 requireExpectedConcurrency];
}

- (id)boundObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_boundObject);

  return WeakRetained;
}

- (BOOL)isEstablishmentProhibited
{
  return self->_establishmentProhibited;
}

- (void)setEstablishmentProhibited:(BOOL)a3
{
  self->_establishmentProhibited = a3;
}

- (NSCountedSet)currentlyChangingBindings
{
  return self->_currentlyChangingBindings;
}

- (void)setCurrentlyChangingBindings:(id)a3
{
}

- (NSMutableDictionary)establishedBindings
{
  return self->_establishedBindings;
}

- (void)setEstablishedBindings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_establishedBindings, 0);
  objc_storeStrong((id *)&self->_currentlyChangingBindings, 0);

  objc_destroyWeak(&self->_boundObject);
}

@end