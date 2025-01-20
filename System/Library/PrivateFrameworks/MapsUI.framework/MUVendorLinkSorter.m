@interface MUVendorLinkSorter
- (MUVendorLinkSorter)initWithViewModels:(id)a3;
- (id)_sortViewModelsAlphabetically:(id)a3;
- (id)sortedViewModelsForParameters:(id)a3;
@end

@implementation MUVendorLinkSorter

- (MUVendorLinkSorter)initWithViewModels:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUVendorLinkSorter;
  v6 = [(MUVendorLinkSorter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModels, a3);
  }

  return v7;
}

- (id)sortedViewModelsForParameters:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  obuint64_t j = [v25 preferredOrdering];
  if ([obj count])
  {
    v3 = [v25 preferredOrdering];

    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v4)
    {
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v7 = self->_viewModels;
          uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v40;
            while (2)
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v40 != v9) {
                  objc_enumerationMutation(v7);
                }
                v11 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                v12 = [v11 partnerId];
                int v13 = [v12 isEqualToString:v6];

                if (v13)
                {
                  [v27 addObject:v11];
                  goto LABEL_17;
                }
              }
              uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v49 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v4);
    }

    v14 = (void *)[v27 copy];
  }
  else
  {
    id v27 = (id)[(NSArray *)self->_viewModels mutableCopy];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__4;
    v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    v15 = [v25 winningAdamId];
    BOOL v16 = [v15 length] == 0;

    if (!v16)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __52__MUVendorLinkSorter_sortedViewModelsForParameters___block_invoke;
      v30[3] = &unk_1E5750138;
      id v17 = v25;
      id v31 = v17;
      v32 = &v33;
      unint64_t v18 = [v27 indexOfObjectPassingTest:v30];
      if (v18 >= [v27 count])
      {
        if (qword_1EB4F71A8 != -1) {
          dispatch_once(&qword_1EB4F71A8, &__block_literal_global_42);
        }
        v19 = (id)_MergedGlobals_124;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [v17 winningAdamId];
          *(_DWORD *)buf = 138412290;
          v48 = v20;
          _os_log_impl(&dword_1931EA000, v19, OS_LOG_TYPE_ERROR, "Could not remove winning adam id @%@", buf, 0xCu);
        }
      }
      else
      {
        [v27 removeObjectAtIndex:v18];
      }
    }
    if ([v25 sortAlphabetically])
    {
      v21 = (void *)[v27 copy];
      v22 = [(MUVendorLinkSorter *)self _sortViewModelsAlphabetically:v21];
    }
    else
    {
      v22 = (void *)[v27 copy];
    }
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_viewModels, "count"));
    objc_msgSend(v23, "_mapsui_addObjectIfNotNil:", v34[5]);
    [v23 addObjectsFromArray:v22];
    v14 = (void *)[v23 copy];

    _Block_object_dispose(&v33, 8);
  }

  return v14;
}

uint64_t __52__MUVendorLinkSorter_sortedViewModelsForParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 appAdamId];
  uint64_t v9 = [*(id *)(a1 + 32) winningAdamId];
  uint64_t v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

  return v10;
}

- (id)_sortViewModelsAlphabetically:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_24];
}

uint64_t __52__MUVendorLinkSorter__sortViewModelsAlphabetically___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 providerName];
  uint64_t v6 = [v4 providerName];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

- (void).cxx_destruct
{
}

@end