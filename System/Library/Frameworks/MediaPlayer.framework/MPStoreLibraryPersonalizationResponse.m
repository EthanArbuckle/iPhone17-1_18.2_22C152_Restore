@interface MPStoreLibraryPersonalizationResponse
- (MPModelResponse)libraryResponse;
- (MPSectionedCollection)representedObjectResults;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (void)dealloc;
- (void)setLibraryResponse:(id)a3;
- (void)setRepresentedObjectResults:(id)a3;
@end

@implementation MPStoreLibraryPersonalizationResponse

- (MPSectionedCollection)representedObjectResults
{
  return self->_representedObjectResults;
}

- (void)setRepresentedObjectResults:(id)a3
{
}

- (void)setLibraryResponse:(id)a3
{
  v5 = (MPModelResponse *)a3;
  p_libraryResponse = &self->_libraryResponse;
  libraryResponse = self->_libraryResponse;
  v10 = v5;
  if (libraryResponse != v5)
  {
    if (libraryResponse)
    {
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"MPModelResponseDidInvalidateNotification" object:*p_libraryResponse];
    }
    objc_storeStrong((id *)&self->_libraryResponse, a3);
    if (*p_libraryResponse)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__libraryResponseDidInvalidateNotification_ name:@"MPModelResponseDidInvalidateNotification" object:*p_libraryResponse];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryResponse, 0);

  objc_storeStrong((id *)&self->_representedObjectResults, 0);
}

- (void)dealloc
{
  if (self->_libraryResponse)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"MPModelResponseDidInvalidateNotification" object:self->_libraryResponse];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPStoreLibraryPersonalizationResponse;
  [(MPStoreLibraryPersonalizationResponse *)&v4 dealloc];
}

- (MPModelResponse)libraryResponse
{
  return self->_libraryResponse;
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(MPModelResponse *)self results];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v8 = objc_alloc_init(MPLibraryAddStatusObserver);
  v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x4812000000;
  v35 = __Block_byref_object_copy__39506;
  v36 = __Block_byref_object_dispose__39507;
  v37 = &unk_1956C748F;
  v39 = 0;
  uint64_t v40 = 0;
  __p = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke;
  v27[3] = &unk_1E57F6170;
  v10 = v8;
  v28 = v10;
  id v11 = v9;
  id v29 = v11;
  v30 = &v41;
  v31 = &v32;
  [v7 enumerateItemsUsingBlock:v27];
  v12 = [v7 sectionAtIndex:a3];
  if (objc_opt_respondsToSelector()) {
    uint64_t v13 = [v12 keepLocalEnableState];
  }
  else {
    uint64_t v13 = 0;
  }
  if (v33[7] != v33[6])
  {
    v14 = objc_alloc_init(MPModelLibraryKeepLocalStatusRequestOperation);
    v15 = [MEMORY[0x1E4FB87B8] activeAccount];
    uint64_t v16 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v15];

    [(MPModelLibraryKeepLocalStatusRequestOperation *)v14 setLibraryView:v16];
    [(MPModelLibraryKeepLocalStatusRequestOperation *)v14 setEnableState:v13];
    v17 = [NSNumber numberWithInteger:v42[3]];
    [(MPModelLibraryKeepLocalStatusRequestOperation *)v14 setRedownloadableItemCount:v17];

    v18 = (mlcore *)MEMORY[0x19971D490]();
    mlcore::ItemPropertyPersistentID(v18);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
  }
  v19 = (void *)MEMORY[0x1E4F28B48];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2;
  v22[3] = &unk_1E57F6198;
  id v24 = v6;
  v25 = &v41;
  uint64_t v26 = v13;
  id v23 = v12;
  v20 = [v19 blockOperationWithBlock:v22];

  _Block_object_dispose(&v32, 8);
  if (__p)
  {
    v39 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v41, 8);
  return v20;
}

void __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v40 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v40 flattenedGenericObject];
    uint64_t v7 = [v6 anyObject];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v6 = v40;
    uint64_t v9 = [v6 type];
    switch(v9)
    {
      case 1:
        uint64_t v7 = [v6 song];
        break;
      case 2:
        uint64_t v7 = [v6 tvEpisode];
        break;
      case 3:
        uint64_t v7 = [v6 movie];
        break;
      default:
        id v8 = v6;
        goto LABEL_4;
    }
  }
  id v8 = (id)v7;

LABEL_4:
  id v40 = v8;
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = v40;
    id v11 = [v10 storeAsset];
    char v12 = [v11 isRedownloadable];

    uint64_t v13 = [v10 identifiers];
    v14 = [v13 library];
    uint64_t v15 = [v14 persistentID];

    id v16 = v40;
    if ((v12 & 1) == 0) {
      goto LABEL_40;
    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "configureWithModelObject:");
    unint64_t v17 = [*(id *)(a1 + 32) currentStatus] - 1;
    id v16 = v40;
    id v10 = v40;
    if (v17 <= 2)
    {
      v18 = *(void **)(a1 + 40);
      v19 = [v40 identifiers];
      LOBYTE(v18) = [v18 containsObject:v19];

      if ((v18 & 1) == 0)
      {
        v20 = *(void **)(a1 + 40);
        v21 = [v40 identifiers];
        [v20 addObject:v21];

        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      id v16 = v40;
      id v10 = v40;
      if (v15)
      {
        v22 = *(void **)(*(void *)(a1 + 56) + 8);
        id v24 = (uint64_t *)v22[7];
        unint64_t v23 = v22[8];
        if ((unint64_t)v24 >= v23)
        {
          v30 = (uint64_t *)v22[6];
          uint64_t v31 = v24 - v30;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 61) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v33 = v23 - (void)v30;
          if (v33 >> 2 > v32) {
            unint64_t v32 = v33 >> 2;
          }
          BOOL v34 = (unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v34) {
            unint64_t v35 = v32;
          }
          if (v35)
          {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v35);
            v30 = (uint64_t *)v22[6];
            id v24 = (uint64_t *)v22[7];
          }
          else
          {
            uint64_t v36 = 0;
          }
          v37 = (uint64_t *)(v35 + 8 * v31);
          unint64_t v38 = v35 + 8 * v36;
          uint64_t *v37 = v15;
          v25 = v37 + 1;
          while (v24 != v30)
          {
            uint64_t v39 = *--v24;
            *--v37 = v39;
          }
          v22[6] = v37;
          v22[7] = v25;
          v22[8] = v38;
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          *id v24 = v15;
          v25 = v24 + 1;
        }
        v22[7] = v25;
        id v16 = v40;
        id v10 = v40;
      }
    }
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    id v16 = v40;
    goto LABEL_40;
  }
  id v10 = v40;
  uint64_t v26 = [v10 storeAsset];
  int v27 = [v26 isRedownloadable];

  v28 = [v10 identifiers];
  id v29 = [v28 library];
  uint64_t v15 = [v29 persistentID];

  id v16 = v40;
  if (v27) {
    goto LABEL_13;
  }
LABEL_40:
  id v41 = v16;
}

void __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2(void *a1)
{
  if (a1[5])
  {
    v2 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v2 setEnableState:a1[7]];
    [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v2 setRedownloadableItemCount:*(void *)(*(void *)(a1[6] + 8) + 24)];
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v2 setIdentifyingModelObject:a1[4]];
    (*(void (**)(void))(a1[5] + 16))();
  }
}

@end