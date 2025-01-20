@interface MPStoreLibraryPersonalizationCollectionDataSource
+ (id)_completePersonalizedObjectWithLibraryObject:(id)a3 personalizationProperties:(id)a4 overrideLibraryAddedStatus:(int64_t)a5;
+ (id)_lightweightPersonalizedLyricsWithUnpersonalizedLyrics:(id)a3 libraryLyrics:(id)a4 identifiers:(id)a5 personalizationProperties:(id)a6;
+ (id)_lightweightPersonalizedObjectWithUnpersonalizedObject:(id)a3 libraryObject:(id)a4 personalizationProperties:(id)a5 overrideLibraryAddedStatus:(int64_t)a6;
+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 identifiers:(id)a4 personalizationProperties:(id)a5;
+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 libraryPlaybackPosition:(id)a4 personalizationProperties:(id)a5;
+ (id)_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:(id)a3 libraryAsset:(id)a4 personalizationProperties:(id)a5;
- (MPMediaLibraryView)libraryView;
- (MPPropertySet)itemProperties;
- (MPPropertySet)sectionProperties;
- (MPSectionedCollection)unpersonalizedContentDescriptors;
- (MPStoreLibraryPersonalizationCollectionDataSource)init;
- (NSDictionary)itemIndexPathToOverridePropertySet;
- (NSMapTable)relativeModelClassToMappingResponse;
- (NSMutableDictionary)sectionToLibraryAddedOverride;
- (id).cxx_construct;
- (id)_libraryObjectWithRelativeModelClass:(Class)a3 identifierSet:(id)a4 propertySet:(id)a5;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (shared_ptr<mlcore::EntityCache>)_entityCacheForEntityClass:(void *)a3 propertiesToFetch:(vector<mlcore:(std::allocator<mlcore::ModelPropertyBase *>> *)a4 :ModelPropertyBase *);
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)setItemIndexPathToOverridePropertySet:(id)a3;
- (void)setItemProperties:(id)a3;
- (void)setLibraryView:(id)a3;
- (void)setRelativeModelClassToMappingResponse:(id)a3;
- (void)setSectionProperties:(id)a3;
- (void)setSectionToLibraryAddedOverride:(id)a3;
- (void)setUnpersonalizedContentDescriptors:(id)a3;
@end

@implementation MPStoreLibraryPersonalizationCollectionDataSource

- (id)_libraryObjectWithRelativeModelClass:(Class)a3 identifierSet:(id)a4 propertySet:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 library];
  uint64_t v11 = [v10 persistentID];

  v12 = 0;
  if (v9 && v11)
  {
    v13 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:a3];
    uint64_t v14 = [v13 entityClass];
    if (v13)
    {
      [v13 MLCorePropertiesForPropertySet:v9];
    }
    else
    {
      __p = 0;
      uint64_t v25 = 0;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v45 = 0;
    uint64_t v46 = 0;
    v44 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v44, __p, v25, (v25 - (uint64_t)__p) >> 3);
    [(MPStoreLibraryPersonalizationCollectionDataSource *)self _entityCacheForEntityClass:v14 propertiesToFetch:&v44];
    if (v44)
    {
      v45 = v44;
      operator delete(v44);
    }
    *(_OWORD *)&v32[8] = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v35 = 1065353216;
    *(_OWORD *)&v37[8] = 0u;
    v31[0] = 1065353216;
    *(_OWORD *)&v31[1] = 0u;
    *(_OWORD *)v32 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    *(_DWORD *)&v32[16] = 1065353216;
    long long v36 = 0u;
    *(_OWORD *)v37 = 0u;
    *(_DWORD *)&v37[16] = 1065353216;
    long long v39 = 0u;
    long long v38 = 0u;
    uint64_t v40 = 1065353216;
    uint64_t v28 = MEMORY[0x1E4F76A90] + 16;
    uint64_t v41 = MEMORY[0x1E4F76A90] + 56;
    (*(void (**)(mlcore::Entity **__return_ptr))(*(void *)v26 + 24))(&v42);
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v28);
    +[MPMediaLibrary logDatabaseAccess];
    if (v42)
    {
      v16 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
      v17 = [(MPMediaLibraryView *)self->_libraryView library];
      [(MPMediaLibraryEntityTranslationContext *)v16 setMediaLibrary:v17];

      v18 = +[MPModelKind kindWithModelClass:a3];
      [(MPMediaLibraryEntityTranslationContext *)v16 setModelKind:v18];

      if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
      {
        v19 = [(MPMediaLibraryView *)self->_libraryView library];
        v20 = [v19 userIdentity];
        v21 = [v20 accountDSID];
        [(MPMediaLibraryEntityTranslationContext *)v16 setPersonID:v21];
      }
      uint64_t v22 = (*(uint64_t (**)(mlcore::Entity *))(*(void *)v42 + 48))(v42);
      v12 = [v13 objectForPropertySet:v9 entityClass:v22 propertyCache:mlcore::Entity::propertyCache(v42) context:v16];
    }
    else
    {
      v12 = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if (v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v43);
    }
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
    }
    if (__p) {
      operator delete(__p);
    }
  }

  return v12;
}

- (void)setSectionProperties:(id)a3
{
}

- (void)setLibraryView:(id)a3
{
}

- (void)setItemProperties:(id)a3
{
}

- (void)setItemIndexPathToOverridePropertySet:(id)a3
{
}

- (MPStoreLibraryPersonalizationCollectionDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationCollectionDataSource;
  result = [(MPStoreLibraryPersonalizationCollectionDataSource *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 isEqualToString:@"MPModelPropertyAlbumLibraryAdded"])
        {
          uint64_t v9 = *(void *)(a1 + 48);
          if (v9 == 1)
          {
            uint64_t v10 = 1;
          }
          else if (v9 == 2)
          {
            uint64_t v10 = 0;
          }
          else
          {
            uint64_t v10 = [*(id *)(a1 + 40) isLibraryAdded];
          }
          [v3 setLibraryAdded:v10];
        }
        if ([v8 isEqualToString:@"MPModelPropertyAlbumIsFavorite"]) {
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        }
        if ([v8 isEqualToString:@"MPModelPropertyAlbumIsDisliked"])
        {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumKeepLocalEnableState"])
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumKeepLocalManagedStatus"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumKeepLocalManagedStatusReason"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumKeepLocalConstraints"])
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumLibraryAddEligible"])
        {
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_10;
          v11[3] = &unk_1E57F9F98;
          id v12 = v3;
          id v13 = *(id *)(a1 + 40);
          +[MPModelObject performWithoutEnforcement:v11];
        }
        else if ([v8 isEqualToString:@"MPModelPropertyAlbumIsStoreRedownloadable"])
        {
          objc_msgSend(v3, "setStoreRedownloadable:", objc_msgSend(*(id *)(a1 + 40), "isStoreRedownloadable"));
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_10(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if ([v2 isLibraryAddEligible]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 40) isLibraryAddEligible];
  }

  return [v2 setLibraryAddEligible:v3];
}

- (unint64_t)numberOfSections
{
  return [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors numberOfSections];
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors numberOfItemsInSection:a3];
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors itemAtIndexPath:v4];
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v8 = v5;
    v53 = [v8 model];
    long long v15 = [v53 relativeModelObjectForStoreLibraryPersonalization];
    uint64_t v16 = objc_opt_class();
    if (v16)
    {
      long long v17 = [v15 identifiers];
      if (v17)
      {
        v52 = [(NSMapTable *)self->_relativeModelClassToMappingResponse objectForKey:v16];
        v18 = [v52 libraryIdentifierSetForIdentifierSet:v17];
        uint64_t v19 = v18;
        if (v18)
        {
          v20 = [v18 unionSet:v17];
          v21 = v20;
          if (v20)
          {
            id v22 = v20;
          }
          else
          {
            uint64_t v40 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218754;
              v61 = self;
              __int16 v62 = 2114;
              id v63 = v4;
              __int16 v64 = 2114;
              v65 = v19;
              __int16 v66 = 2114;
              v67 = v17;
              _os_log_impl(&dword_1952E8000, v40, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [libraryIdentifiers unionSet: failed] indexPath=%{public}@ libraryIdentifiers=%{public}@ originalIdentifiers=%{public}@", buf, 0x2Au);
            }

            uint64_t v41 = (void *)MEMORY[0x1E4F77950];
            v58[0] = v4;
            v57[0] = @"indexPath";
            v57[1] = @"libraryIdentifiers";
            uint64_t v42 = [v19 description];
            v50 = (void *)v42;
            v51 = v41;
            if (v42) {
              v43 = (__CFString *)v42;
            }
            else {
              v43 = @"@";
            }
            v58[1] = v43;
            v57[2] = @"originalIdentifiers";
            uint64_t v44 = [v17 description];
            v45 = (void *)v44;
            if (v44) {
              uint64_t v46 = (__CFString *)v44;
            }
            else {
              uint64_t v46 = @"@";
            }
            v58[2] = v46;
            v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
            v59 = v47;
            v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
            [v51 snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug" context:@"-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (libraryIdentifiers unionSet: failed)" triggerThresholdValues:0 events:v48 completion:0];

            id v22 = +[MPIdentifierSet emptyIdentifierSet];
          }
          id v7 = v22;
        }
        else
        {
          id v7 = v17;
        }
      }
      else
      {
        long long v30 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v61 = self;
          __int16 v62 = 2114;
          id v63 = v4;
          __int16 v64 = 2114;
          v65 = v15;
          _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [effectiveOriginalObject has no identifiers] indexPath=%{public}@ effectiveOriginalObject=%{public}@", buf, 0x20u);
        }

        v31 = (void *)MEMORY[0x1E4F77950];
        v69[0] = v4;
        v68[0] = @"indexPath";
        v68[1] = @"originalObject";
        uint64_t v32 = [v53 description];
        long long v33 = (void *)v32;
        if (v32) {
          long long v34 = (__CFString *)v32;
        }
        else {
          long long v34 = @"@";
        }
        v69[1] = v34;
        v68[2] = @"effectiveOriginalObject";
        uint64_t v35 = [v15 description];
        long long v36 = (void *)v35;
        if (v35) {
          v37 = (__CFString *)v35;
        }
        else {
          v37 = @"@";
        }
        v69[2] = v37;
        long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
        v70 = v38;
        long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
        [v31 snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug" context:@"-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (effectiveOriginalObject has no identifiers)" triggerThresholdValues:0 events:v39 completion:0];

        id v7 = +[MPIdentifierSet emptyIdentifierSet];
      }
    }
    else
    {
      id v7 = [v53 identifiers];
      if (!v7)
      {
        v23 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v61 = self;
          __int16 v62 = 2114;
          id v63 = v4;
          __int16 v64 = 2114;
          v65 = v53;
          _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [originalObject has no identifiers] indexPath=%{public}@ originalObject=%{public}@", buf, 0x20u);
        }

        v24 = (void *)MEMORY[0x1E4F77950];
        v54[0] = @"indexPath";
        v54[1] = @"originalObject";
        v55[0] = v4;
        uint64_t v25 = [v53 description];
        uint64_t v26 = (void *)v25;
        v27 = @"@";
        if (v25) {
          v27 = (__CFString *)v25;
        }
        v55[1] = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
        v56 = v28;
        long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        [v24 snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug" context:@"-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (originalObject has no identifiers)" triggerThresholdValues:0 events:v29 completion:0];

        id v7 = +[MPIdentifierSet emptyIdentifierSet];
      }
    }
  }
  else
  {
    id v7 = [v5 identifiers];
    if (v7) {
      goto LABEL_45;
    }
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v71[0] = @"indexPath";
    v71[1] = @"possibleObject";
    v72[0] = v4;
    uint64_t v9 = [v5 description];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = @"@";
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    v72[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
    [v8 addObject:v12];

    if (!v5)
    {
      id v13 = [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors description];
      [v8 addObject:v13];
    }
    long long v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v61 = self;
      __int16 v62 = 2114;
      id v63 = v4;
      __int16 v64 = 2114;
      v65 = v5;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [unpersonalizedContentDescriptors did not contain MPStoreLibraryPersonalizationContentDescriptor] indexPath=%{public}@ possibleObject=%{public}@", buf, 0x20u);
    }

    [MEMORY[0x1E4F77950] snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug" context:@"-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (unpersonalizedContentDescriptors did not contain MPStoreLibraryPersonalizationContentDescriptor)" triggerThresholdValues:0 events:v8 completion:0];
    id v7 = +[MPIdentifierSet emptyIdentifierSet];
  }

LABEL_45:

  return v7;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors itemAtIndexPath:v4];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  uint64_t v9 = v8;
  id v10 = v8;
  if (v6 == v7)
  {
    id v11 = [v8 model];
    id v12 = [v11 relativeModelObjectForStoreLibraryPersonalization];
    id v13 = objc_opt_class();
    id v10 = v11;
    if (!v13)
    {
LABEL_30:

      goto LABEL_31;
    }
    v47 = [(NSMapTable *)self->_relativeModelClassToMappingResponse objectForKey:v13];
    long long v14 = [v12 identifiers];
    long long v15 = [v47 libraryIdentifierSetForIdentifierSet:v14];
    uint64_t v16 = v15;
    if (v15)
    {
      id v46 = v15;
    }
    else
    {
      id v46 = [v12 identifiers];
    }

    long long v17 = [(NSDictionary *)self->_itemIndexPathToOverridePropertySet objectForKey:v4];
    itemProperties = v17;
    if (!v17) {
      itemProperties = self->_itemProperties;
    }
    uint64_t v19 = itemProperties;

    uint64_t v20 = [v9 personalizationStyle];
    if ((unint64_t)(v20 - 1) < 2)
    {
      uint64_t v42 = v12;
      v43 = v19;
      v27 = [v11 personalizationScopedPropertiesForProperties:v19];
      uint64_t v28 = v27;
      if (!v27)
      {
        uint64_t v28 = +[MPPropertySet emptyPropertySet];
      }
      long long v29 = +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:v13];
      uint64_t v41 = [v28 propertySetByIntersectingWithPropertySet:v29];

      if (!v27) {
      id v12 = v42;
      }
      long long v30 = [v13 requiredStoreLibraryPersonalizationProperties];
      v31 = v30;
      if (v30)
      {
        id v32 = v30;
      }
      else
      {
        id v32 = +[MPPropertySet emptyPropertySet];
      }
      long long v34 = v32;

      uint64_t v44 = v34;
      uint64_t v35 = [v34 propertySetByCombiningWithPropertySet:v41];

      long long v36 = (void *)v35;
      v45 = (void *)v35;
      v37 = +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:v13 requestedProperties:v35];
      v23 = [v36 propertySetByCombiningWithPropertySet:v37];

      id v25 = [(MPStoreLibraryPersonalizationCollectionDataSource *)self _libraryObjectWithRelativeModelClass:v13 identifierSet:v46 propertySet:v23];
      uint64_t v26 = [(id)objc_opt_class() _lightweightPersonalizedObjectWithUnpersonalizedObject:v42 libraryObject:v25 personalizationProperties:v23 overrideLibraryAddedStatus:0];
      if (v26 == v42)
      {
        uint64_t v26 = v42;
        id v10 = v11;
      }
      else
      {
        long long v38 = [v11 objectWithStoreLibraryPersonalizationRelativeModelObject:v26];
        long long v39 = v38;
        id v10 = v11;
        if (v38)
        {
          id v10 = v38;
        }
      }
    }
    else
    {
      id v10 = v11;
      if ((unint64_t)(v20 - 3) >= 2)
      {
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v21 = [v11 personalizationScopedPropertiesForProperties:v19];
      uint64_t v22 = [(MPStoreLibraryPersonalizationCollectionDataSource *)self _libraryObjectWithRelativeModelClass:v13 identifierSet:v46 propertySet:v21];
      v45 = (void *)v21;
      if (!v22)
      {
        long long v33 = 0;
        id v10 = v11;
LABEL_28:

        goto LABEL_29;
      }
      v23 = [(id)objc_opt_class() _completePersonalizedObjectWithLibraryObject:v22 personalizationProperties:v21 overrideLibraryAddedStatus:0];
      v24 = [v11 objectWithStoreLibraryPersonalizationRelativeModelObject:v23];
      uint64_t v44 = (void *)v22;
      if (!v24)
      {
        id v25 = 0;
        id v10 = v11;
        goto LABEL_27;
      }
      v43 = v19;
      id v25 = v24;
      uint64_t v26 = v11;
      id v10 = v25;
    }

    uint64_t v19 = v43;
LABEL_27:

    long long v33 = v44;
    goto LABEL_28;
  }
LABEL_31:

  return v10;
}

+ (id)_lightweightPersonalizedObjectWithUnpersonalizedObject:(id)a3 libraryObject:(id)a4 personalizationProperties:(id)a5 overrideLibraryAddedStatus:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  v75 = v12;
  v77 = [v13 identifiers];
  v76 = [v12 properties];
  v78 = [v12 relationships];
  long long v14 = objc_opt_class();
  if ([v14 isSubclassOfClass:objc_opt_class()])
  {
    id v15 = v13;
    if (v11)
    {
      id v16 = v11;
      long long v17 = [v16 identifiers];
      uint64_t v18 = [v17 unionSet:v77];
      uint64_t v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = (void *)v18;
      }
      else {
        uint64_t v20 = v77;
      }
      id v21 = v20;

      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke;
      v110[3] = &unk_1E57F22F0;
      id v111 = v76;
      int64_t v115 = a6;
      id v22 = v16;
      id v112 = v22;
      id v113 = v78;
      id v116 = a1;
      id v23 = v15;
      id v114 = v23;
      v24 = (void *)[v23 copyWithIdentifiers:v21 block:v110];

      id v15 = v23;
    }
    else
    {
      id v22 = [v78 objectForKey:@"MPModelRelationshipSongPlaybackPosition"];
      v24 = v15;
      if (v22)
      {
        if ([v15 hasLoadedValueForKey:@"MPModelRelationshipSongPlaybackPosition"])
        {
          long long v38 = [v15 playbackPosition];
        }
        else
        {
          long long v38 = 0;
        }
        if (![v38 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"]|| (v24 = v15, objc_msgSend(v38, "shouldRememberBookmarkTime")))
        {
          v52 = [v15 identifiers];
          v53 = [a1 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v38 identifiers:v52 personalizationProperties:v22];

          v24 = v15;
          if (v38 != v53)
          {
            v54 = [v15 identifiers];
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2;
            v108[3] = &unk_1E57F2318;
            id v109 = v53;
            v24 = (void *)[v15 copyWithIdentifiers:v54 block:v108];
          }
        }
      }
      v55 = [v78 objectForKey:@"MPModelRelationshipSongLyrics"];
      if (v55)
      {
        if ([v15 hasLoadedValueForKey:@"MPModelRelationshipSongLyrics"])
        {
          v56 = [v15 lyrics];
        }
        else
        {
          v56 = 0;
        }
        v57 = [v56 identifiers];
        v58 = (void *)[v56 copyWithIdentifiers:v57 block:&__block_literal_global_23597];

        v59 = [v15 identifiers];
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4;
        v106[3] = &unk_1E57F2318;
        id v60 = v58;
        id v107 = v60;
        uint64_t v61 = [v15 copyWithIdentifiers:v59 block:v106];

        v24 = (void *)v61;
        id v11 = 0;
      }
    }
    goto LABEL_71;
  }
  if ([v14 isSubclassOfClass:objc_opt_class()])
  {
    id v15 = v13;
    if (v11)
    {
      id v25 = v11;
      uint64_t v26 = [v25 identifiers];
      uint64_t v27 = [v26 unionSet:v77];
      uint64_t v28 = (void *)v27;
      if (v27) {
        long long v29 = (void *)v27;
      }
      else {
        long long v29 = v77;
      }
      id v30 = v29;

      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5;
      v100[3] = &unk_1E57F2360;
      id v101 = v76;
      int64_t v104 = a6;
      id v22 = v25;
      id v102 = v22;
      id v103 = v78;
      id v105 = a1;
      v24 = (void *)[v15 copyWithIdentifiers:v30 block:v100];

      v31 = v101;
LABEL_19:

      goto LABEL_71;
    }
    id v22 = [v78 objectForKey:@"MPModelRelationshipTVEpisodePlaybackPosition"];
    if (v22)
    {
      if ([v15 hasLoadedValueForKey:@"MPModelRelationshipTVEpisodePlaybackPosition"])
      {
        v45 = [v15 playbackPosition];
      }
      else
      {
        v45 = 0;
      }
      if ([v45 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"])
      {
        v24 = v15;
        if (![v45 shouldRememberBookmarkTime]) {
          goto LABEL_70;
        }
      }
      v68 = [v15 identifiers];
      v69 = [a1 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v45 identifiers:v68 personalizationProperties:v22];

      v24 = v15;
      if (v45 == v69)
      {
LABEL_69:

LABEL_70:
        goto LABEL_71;
      }
      v70 = [v15 identifiers];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6;
      v98[3] = &unk_1E57F2388;
      id v99 = v69;
      v24 = (void *)[v15 copyWithIdentifiers:v70 block:v98];

      v71 = v99;
LABEL_68:

      goto LABEL_69;
    }
    goto LABEL_52;
  }
  if ([v14 isSubclassOfClass:objc_opt_class()])
  {
    id v15 = v13;
    if (v11)
    {
      id v32 = v11;
      long long v33 = [v32 identifiers];
      uint64_t v34 = [v33 unionSet:v77];
      uint64_t v35 = (void *)v34;
      if (v34) {
        long long v36 = (void *)v34;
      }
      else {
        long long v36 = v77;
      }
      id v37 = v36;

      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_7;
      v92[3] = &unk_1E57F23B0;
      id v93 = v76;
      int64_t v96 = a6;
      id v22 = v32;
      id v94 = v22;
      id v95 = v78;
      id v97 = a1;
      v24 = (void *)[v15 copyWithIdentifiers:v37 block:v92];

      v31 = v93;
      goto LABEL_19;
    }
    id v22 = [v78 objectForKey:@"MPModelRelationshipMoviePlaybackPosition"];
    if (v22)
    {
      if ([v15 hasLoadedValueForKey:@"MPModelRelationshipMoviePlaybackPosition"])
      {
        v45 = [v15 playbackPosition];
      }
      else
      {
        v45 = 0;
      }
      if ([v45 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"])
      {
        v24 = v15;
        if (![v45 shouldRememberBookmarkTime]) {
          goto LABEL_70;
        }
      }
      v72 = [v15 identifiers];
      v69 = [a1 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v45 identifiers:v72 personalizationProperties:v22];

      v24 = v15;
      if (v45 == v69) {
        goto LABEL_69;
      }
      v73 = [v15 identifiers];
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_8;
      v90[3] = &unk_1E57F23D8;
      id v91 = v69;
      v24 = (void *)[v15 copyWithIdentifiers:v73 block:v90];

      v71 = v91;
      goto LABEL_68;
    }
LABEL_52:
    v24 = v15;
    goto LABEL_71;
  }
  if ([v14 isSubclassOfClass:objc_opt_class()])
  {
    id v39 = v11;
    uint64_t v40 = [v39 identifiers];
    uint64_t v41 = [v40 unionSet:v77];
    uint64_t v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = v77;
    }
    id v44 = v43;

    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_9;
    v86[3] = &unk_1E57F2400;
    id v87 = v76;
    int64_t v89 = a6;
    id v15 = v39;
    id v88 = v15;
    v24 = (void *)[v13 copyWithIdentifiers:v44 block:v86];

    id v22 = v87;
  }
  else if ([v14 isSubclassOfClass:objc_opt_class()])
  {
    id v46 = v11;
    v47 = [v46 identifiers];
    uint64_t v48 = [v47 unionSet:v77];
    v49 = (void *)v48;
    if (v48) {
      v50 = (void *)v48;
    }
    else {
      v50 = v77;
    }
    id v51 = v50;

    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_11;
    v82[3] = &unk_1E57F2428;
    id v83 = v76;
    int64_t v85 = a6;
    id v15 = v46;
    id v84 = v15;
    v24 = (void *)[v13 copyWithIdentifiers:v51 block:v82];

    id v22 = v83;
  }
  else
  {
    v24 = v13;
    if (![v14 isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_72;
    }
    id v62 = v11;
    id v63 = [v62 identifiers];
    uint64_t v64 = [v63 unionSet:v77];
    v65 = (void *)v64;
    if (v64) {
      __int16 v66 = (void *)v64;
    }
    else {
      __int16 v66 = v77;
    }
    id v67 = v66;

    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_12;
    v79[3] = &unk_1E57F8890;
    id v80 = v76;
    id v15 = v62;
    id v81 = v15;
    v24 = (void *)[v13 copyWithIdentifiers:v67 block:v79];

    id v22 = v80;
  }
LABEL_71:

LABEL_72:

  return v24;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void)setUnpersonalizedContentDescriptors:(id)a3
{
}

- (void)setSectionToLibraryAddedOverride:(id)a3
{
}

- (void)setRelativeModelClassToMappingResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionToLibraryAddedOverride, 0);
  objc_storeStrong((id *)&self->_relativeModelClassToMappingResponse, 0);
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_itemIndexPathToOverridePropertySet, 0);
  objc_storeStrong((id *)&self->_sectionProperties, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  begin = (char *)self->_entityCaches.__begin_;
  if (begin)
  {
    end = (char *)self->_entityCaches.__end_;
    uint64_t v5 = self->_entityCaches.__begin_;
    if (end != begin)
    {
      do
      {
        uint64_t v6 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        end -= 16;
      }
      while (end != begin);
      uint64_t v5 = self->_entityCaches.__begin_;
    }
    self->_entityCaches.__end_ = begin;
    operator delete(v5);
  }
}

- (NSMutableDictionary)sectionToLibraryAddedOverride
{
  return self->_sectionToLibraryAddedOverride;
}

- (NSMapTable)relativeModelClassToMappingResponse
{
  return self->_relativeModelClassToMappingResponse;
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (NSDictionary)itemIndexPathToOverridePropertySet
{
  return self->_itemIndexPathToOverridePropertySet;
}

- (MPPropertySet)sectionProperties
{
  return self->_sectionProperties;
}

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (shared_ptr<mlcore::EntityCache>)_entityCacheForEntityClass:(void *)a3 propertiesToFetch:(vector<mlcore:(std::allocator<mlcore::ModelPropertyBase *>> *)a4 :ModelPropertyBase *)
{
  id v8 = v4;
  os_unfair_lock_assert_owner(&self->_lock);
  begin = (mlcore::EntityCache **)self->_entityCaches.__begin_;
  end = (mlcore::EntityCache **)self->_entityCaches.__end_;
  if (begin == end)
  {
LABEL_9:
    libraryView = self->_libraryView;
    if (libraryView) {
      [(MPMediaLibraryView *)libraryView mlCoreView];
    }
    else {
      long long v33 = 0uLL;
    }
    std::allocate_shared[abi:ne180100]<mlcore::EntityCache,std::allocator<mlcore::EntityCache>,std::shared_ptr<mlcore::DeviceLibraryView>,void>(v8, &v33);
    if (*((void *)&v33 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v33 + 1));
    }
    uint64_t v18 = *v8;
    mlcore::EntityCache::setCacheDisabled(*v8);
    __p = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, a4->var0, (uint64_t)a4->var1, a4->var1 - a4->var0);
    (*(void (**)(mlcore::EntityCache *, void **, void *))(*(void *)v18 + 16))(v18, &__p, a3);
    id v15 = (std::__shared_weak_count *)__p;
    if (__p)
    {
      uint64_t v35 = __p;
      operator delete(__p);
    }
    uint64_t v20 = (char *)self->_entityCaches.__end_;
    value = (char *)self->_entityCaches.__end_cap_.__value_;
    if (v20 < value)
    {
      id v21 = v8[1];
      *(void *)uint64_t v20 = v18;
      *((void *)v20 + 1) = v21;
      if (v21) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v21 + 1, 1uLL, memory_order_relaxed);
      }
      id v22 = (std::__shared_count *)(v20 + 16);
      self->_entityCaches.__end_ = v20 + 16;
      goto LABEL_38;
    }
    id v23 = self->_entityCaches.__begin_;
    uint64_t v24 = (v20 - v23) >> 4;
    unint64_t v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 60) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v26 = value - v23;
    if (v26 >> 3 > v25) {
      unint64_t v25 = v26 >> 3;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    id v15 = (std::__shared_weak_count *)operator new(16 * v27);
    uint64_t v28 = (std::__shared_weak_count *)((char *)v15 + 16 * v24);
    std::__shared_count v29 = *(std::__shared_count *)v8;
    *uint64_t v28 = *(std::__shared_count *)v8;
    if (v29.__shared_owners_)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v29.__shared_owners_ + 8), 1uLL, memory_order_relaxed);
      id v23 = self->_entityCaches.__begin_;
      uint64_t v20 = (char *)self->_entityCaches.__end_;
    }
    id v30 = (std::__shared_weak_count *)((char *)v15 + 16 * v27);
    id v22 = v28 + 1;
    if (v20 == v23)
    {
      self->_entityCaches.__begin_ = v28;
      self->_entityCaches.__end_ = v22;
      self->_entityCaches.__end_cap_.__value_ = v30;
      if (!v23) {
        goto LABEL_38;
      }
    }
    else
    {
      do
      {
        std::__shared_count v31 = (std::__shared_count)*((_OWORD *)v20 - 1);
        v20 -= 16;
        v28[-1] = v31;
        --v28;
        *(void *)uint64_t v20 = 0;
        *((void *)v20 + 1) = 0;
      }
      while (v20 != v23);
      id v32 = self->_entityCaches.__begin_;
      id v23 = self->_entityCaches.__end_;
      self->_entityCaches.__begin_ = v28;
      self->_entityCaches.__end_ = v22;
      self->_entityCaches.__end_cap_.__value_ = v30;
      if (v23 != v32)
      {
        do
        {
          id v15 = (std::__shared_weak_count *)*((void *)v23 - 1);
          if (v15) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v15);
          }
          v23 -= 16;
        }
        while (v23 != v32);
        id v23 = v32;
      }
      if (!v23) {
        goto LABEL_38;
      }
    }
    operator delete(v23);
LABEL_38:
    self->_entityCaches.__end_ = v22;
    goto LABEL_44;
  }
  while (1)
  {
    id v11 = (std::__shared_weak_count *)begin[1];
    *id v8 = *begin;
    v8[1] = (mlcore::EntityCache *)v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v13 = mlcore::EntityCache::propertiesToFetchForEntityClass();
    id v12 = *(const void **)v13;
    size_t v14 = *(void *)(v13 + 8) - *(void *)v13;
    if (v14 == (char *)a4->var1 - (char *)a4->var0)
    {
      id v15 = (std::__shared_weak_count *)memcmp(v12, a4->var0, v14);
      if (!v15) {
        break;
      }
    }
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    begin += 2;
    if (begin == end) {
      goto LABEL_9;
    }
  }
LABEL_44:
  result.var1 = v16;
  result.var0 = (EntityCache *)v15;
  return result;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  size_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__23517;
  long long v17 = __Block_byref_object_dispose__23518;
  id v18 = 0;
  unpersonalizedContentDescriptors = self->_unpersonalizedContentDescriptors;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__MPStoreLibraryPersonalizationCollectionDataSource_indexPathForItemWithIdentifiersIntersectingSet___block_invoke;
  v9[3] = &unk_1E57F22A0;
  id v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  [(MPSectionedCollection *)unpersonalizedContentDescriptors enumerateItemsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __100__MPStoreLibraryPersonalizationCollectionDataSource_indexPathForItemWithIdentifiersIntersectingSet___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v21 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    id v9 = [v21 model];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = 0;
      goto LABEL_15;
    }
    id v9 = v21;
  }
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 identifiers];
    int v12 = [v11 intersectsSet:a1[4]];

    if (v12)
    {
      uint64_t v13 = *(void *)(a1[6] + 8);
      id v14 = v7;
      uint64_t v15 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }
    else
    {
      uint64_t v15 = [v10 relativeModelObjectForStoreLibraryPersonalization];
      uint64_t v16 = objc_opt_class();
      if (v16)
      {
        long long v17 = [*(id *)(a1[5] + 80) objectForKey:v16];
        id v18 = [v15 identifiers];
        uint64_t v19 = [v17 libraryIdentifierSetForIdentifierSet:v18];
        uint64_t v20 = [v19 unionSet:v18];
        if ([v20 intersectsSet:a1[4]]) {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
        }
      }
    }

    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      *a4 = 1;
    }
  }
LABEL_15:
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  id v4 = [(MPSectionedCollection *)self->_unpersonalizedContentDescriptors sectionAtIndex:a3];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [v4 model];
    uint64_t v8 = [v7 relativeModelObjectForStoreLibraryPersonalization];
    uint64_t v9 = objc_opt_class();
    if (v9)
    {
      id v10 = [(NSMapTable *)self->_relativeModelClassToMappingResponse objectForKey:v9];
      id v11 = [v8 identifiers];
      int v12 = [v10 libraryIdentifierSetForIdentifierSet:v11];

      uint64_t v13 = [v8 identifiers];
      id v14 = [v12 unionSet:v13];
      uint64_t v15 = v14;
      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        id v16 = [v8 identifiers];
      }
      id v6 = v16;
    }
    else
    {
      long long v17 = [v8 identifiers];
      if (v17)
      {
        id v10 = v17;
        id v6 = v10;
      }
      else
      {
        id v6 = [v7 identifiers];
        id v10 = 0;
      }
    }
  }
  else
  {
    id v6 = [v4 identifiers];
  }

  return v6;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[MPSectionedCollection sectionAtIndex:](self->_unpersonalizedContentDescriptors, "sectionAtIndex:");
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  uint64_t v9 = v8;
  id v10 = v8;
  if (v6 == v7)
  {
    id v11 = [v8 model];
    int v12 = [v11 relativeModelObjectForStoreLibraryPersonalization];
    uint64_t v13 = objc_opt_class();
    id v10 = v11;
    if (!v13)
    {
LABEL_30:

      goto LABEL_31;
    }
    v45 = [(NSMapTable *)self->_relativeModelClassToMappingResponse objectForKey:v13];
    id v14 = [v12 identifiers];
    id v46 = [v45 libraryIdentifierSetForIdentifierSet:v14];

    sectionToLibraryAddedOverride = self->_sectionToLibraryAddedOverride;
    id v16 = [NSNumber numberWithUnsignedInteger:a3];
    long long v17 = [(NSMutableDictionary *)sectionToLibraryAddedOverride objectForKey:v16];

    id v44 = v17;
    if (v17)
    {
      int v18 = [v17 BOOLValue];
      uint64_t v19 = 1;
      if (!v18) {
        uint64_t v19 = 2;
      }
      uint64_t v43 = v19;
    }
    else
    {
      uint64_t v43 = 0;
    }
    uint64_t v20 = [v9 personalizationStyle];
    if ((unint64_t)(v20 - 3) < 2)
    {
      uint64_t v28 = [v11 personalizationScopedPropertiesForProperties:self->_sectionProperties];
      uint64_t v29 = [(MPStoreLibraryPersonalizationCollectionDataSource *)self _libraryObjectWithRelativeModelClass:v13 identifierSet:v46 propertySet:v28];
      if (!v29)
      {
        uint64_t v34 = 0;
        id v10 = v11;
LABEL_28:

        goto LABEL_29;
      }
      id v30 = [(id)objc_opt_class() _completePersonalizedObjectWithLibraryObject:v29 personalizationProperties:v28 overrideLibraryAddedStatus:v43];
      std::__shared_count v31 = [v11 objectWithStoreLibraryPersonalizationRelativeModelObject:v30];
      uint64_t v42 = (void *)v29;
      if (!v31)
      {
        id v32 = 0;
        id v10 = v11;
        goto LABEL_27;
      }
      id v32 = v31;
      long long v33 = v11;
      id v10 = v32;
    }
    else
    {
      id v10 = v11;
      if ((unint64_t)(v20 - 1) > 1)
      {
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v41 = v12;
      id v21 = [v11 personalizationScopedPropertiesForProperties:self->_sectionProperties];
      id v22 = v21;
      if (!v21)
      {
        id v22 = +[MPPropertySet emptyPropertySet];
      }
      id v23 = +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:v13];
      uint64_t v24 = [v22 propertySetByIntersectingWithPropertySet:v23];

      if (!v21) {
      unint64_t v25 = [v13 requiredStoreLibraryPersonalizationProperties];
      }
      uint64_t v26 = v25;
      int v12 = v41;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        id v27 = +[MPPropertySet emptyPropertySet];
      }
      id v35 = v27;

      uint64_t v42 = v35;
      uint64_t v36 = [v24 propertySetByCombiningWithPropertySet:v35];

      uint64_t v28 = v36;
      id v37 = +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:v13 requestedProperties:v36];
      id v30 = [v36 propertySetByCombiningWithPropertySet:v37];

      id v32 = [(MPStoreLibraryPersonalizationCollectionDataSource *)self _libraryObjectWithRelativeModelClass:v13 identifierSet:v46 propertySet:v30];
      long long v33 = [(id)objc_opt_class() _lightweightPersonalizedObjectWithUnpersonalizedObject:v41 libraryObject:v32 personalizationProperties:v30 overrideLibraryAddedStatus:v43];
      if (v33 == v41)
      {
        long long v33 = v41;
        id v10 = v11;
      }
      else
      {
        long long v38 = [v11 objectWithStoreLibraryPersonalizationRelativeModelObject:v33];
        id v39 = v38;
        id v10 = v11;
        if (v38)
        {
          id v10 = v38;
        }
      }
    }

LABEL_27:
    uint64_t v34 = v42;
    goto LABEL_28;
  }
LABEL_31:

  return v10;
}

+ (id)_completePersonalizedObjectWithLibraryObject:(id)a3 personalizationProperties:(id)a4 overrideLibraryAddedStatus:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = [v8 properties];
  id v11 = objc_opt_class();
  if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    id v12 = v9;
    uint64_t v13 = [v12 identifiers];
    id v14 = v37;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke;
    v37[3] = &unk_1E57F2450;
    v37[4] = v10;
    int64_t v39 = a5;
    id v38 = v12;
    uint64_t v15 = [v38 copyWithIdentifiers:v13 block:v37];
  }
  else if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    id v16 = v9;
    uint64_t v13 = [v16 identifiers];
    id v14 = v34;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2;
    v34[3] = &unk_1E57F2478;
    v34[4] = v10;
    int64_t v36 = a5;
    id v35 = v16;
    uint64_t v15 = [v35 copyWithIdentifiers:v13 block:v34];
  }
  else if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    id v17 = v9;
    uint64_t v13 = [v17 identifiers];
    id v14 = v31;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3;
    void v31[3] = &unk_1E57F24A0;
    v31[4] = v10;
    int64_t v33 = a5;
    id v32 = v17;
    uint64_t v15 = [v32 copyWithIdentifiers:v13 block:v31];
  }
  else if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    id v18 = v9;
    uint64_t v13 = [v18 identifiers];
    id v14 = v28;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4;
    v28[3] = &unk_1E57F2400;
    v28[4] = v10;
    int64_t v30 = a5;
    id v29 = v18;
    uint64_t v15 = [v29 copyWithIdentifiers:v13 block:v28];
  }
  else if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    id v19 = v9;
    uint64_t v13 = [v19 identifiers];
    id v14 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5;
    v25[3] = &unk_1E57F2428;
    v25[4] = v10;
    int64_t v27 = a5;
    id v26 = v19;
    uint64_t v15 = [v26 copyWithIdentifiers:v13 block:v25];
  }
  else
  {
    uint64_t v20 = v9;
    if (![v11 isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_14;
    }
    id v21 = v9;
    uint64_t v13 = [v21 identifiers];
    id v14 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6;
    v23[3] = &unk_1E57F8890;
    v23[4] = v10;
    id v24 = v21;
    uint64_t v15 = [v24 copyWithIdentifiers:v13 block:v23];
  }
  uint64_t v20 = (void *)v15;

LABEL_14:

  return v20;
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertySongLibraryAdded"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else if (v3 == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) isLibraryAdded];
    }
    [v5 setLibraryAdded:v4];
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertySongIsFavorite"]) {
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertySongIsDisliked"]) {
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
  }
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyTVEpisodeLibraryAdded"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else if (v3 == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) isLibraryAdded];
    }
    [v5 setLibraryAdded:v4];
  }
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyMovieLibraryAdded"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else if (v3 == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) isLibraryAdded];
    }
    [v5 setLibraryAdded:v4];
  }
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyAlbumLibraryAdded"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else if (v3 == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) isLibraryAdded];
    }
    [v5 setLibraryAdded:v4];
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyAlbumIsFavorite"]) {
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyAlbumIsDisliked"]) {
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
  }
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyPlaylistLibraryAdded"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else if (v3 == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) isLibraryAdded];
    }
    [v5 setLibraryAdded:v4];
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyPlaylistIsFavorite"]) {
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyPlaylistIsDisliked"]) {
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
  }
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyArtistIsFavorite"]) {
    objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyArtistIsDisliked"]) {
    objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
  }
  if ([*(id *)(a1 + 32) containsObject:@"MPModelPropertyArtistLibraryAdded"]) {
    objc_msgSend(v3, "setLibraryAdded:", objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded"));
  }
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 64);
        if (v8 == 1)
        {
          uint64_t v9 = 1;
        }
        else if (v8 == 2)
        {
          uint64_t v9 = 0;
        }
        else
        {
          uint64_t v9 = [*(id *)(a1 + 40) isLibraryAdded];
        }
        if ([v7 isEqualToString:@"MPModelPropertySongIsFavorite"]) {
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        }
        if ([v7 isEqualToString:@"MPModelPropertySongIsDisliked"]) {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        if ([v7 isEqualToString:@"MPModelPropertySongLibraryAdded"])
        {
          [v3 setLibraryAdded:v9];
        }
        else if ([v7 isEqualToString:@"MPModelPropertySongKeepLocalEnableState"])
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if ([v7 isEqualToString:@"MPModelPropertySongKeepLocalManagedStatus"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if ([v7 isEqualToString:@"MPModelPropertySongKeepLocalManagedStatusReason"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if ([v7 isEqualToString:@"MPModelPropertySongKeepLocalConstraints"])
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
        else if ([v7 isEqualToString:@"MPModelPropertySongUserRating"])
        {
          if (([*(id *)(a1 + 40) hasCloudSyncSource] | v9) == 1)
          {
            [*(id *)(a1 + 40) userRating];
            objc_msgSend(v3, "setUserRating:");
          }
        }
        else
        {
          int v10 = [v7 isEqualToString:@"MPModelPropertySongCloudStatus"];
          id v11 = *(void **)(a1 + 40);
          if (v10)
          {
            objc_msgSend(v3, "setCloudStatus:", objc_msgSend(v11, "cloudStatus"));
          }
          else if ([v11 hasCloudSyncSource] {
                 && [v7 isEqualToString:@"MPModelPropertySongLibraryAddEligible"])
          }
          {
            if ([*(id *)(a1 + 40) isLibraryAddEligible]) {
              uint64_t v12 = 1;
            }
            else {
              uint64_t v12 = [v3 isLibraryAddEligible];
            }
            [v3 setLibraryAddEligible:v12];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v4);
  }

  uint64_t v13 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipSongLocalFileAsset"];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) localFileAsset];
    [v3 setLocalFileAsset:v15];
  }
  id v16 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipSongPlaybackPosition"];
  if (v16)
  {
    if ([v3 hasLoadedValueForKey:@"MPModelRelationshipSongPlaybackPosition"])
    {
      id v17 = [v3 playbackPosition];
    }
    else
    {
      id v17 = 0;
    }
    id v18 = *(void **)(a1 + 72);
    id v19 = [*(id *)(a1 + 40) playbackPosition];
    uint64_t v20 = [v18 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v17 libraryPlaybackPosition:v19 personalizationProperties:v16];
    [v3 setPlaybackPosition:v20];
  }
  id v21 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipSongLyrics"];
  if (v21)
  {
    if ([*(id *)(a1 + 56) hasLoadedValueForKey:@"MPModelRelationshipSongLyrics"])
    {
      id v22 = [*(id *)(a1 + 56) lyrics];
    }
    else
    {
      id v22 = 0;
    }
    id v23 = *(void **)(a1 + 72);
    id v24 = [*(id *)(a1 + 40) lyrics];
    unint64_t v25 = [*(id *)(a1 + 56) identifiers];
    id v26 = [v23 _lightweightPersonalizedLyricsWithUnpersonalizedLyrics:v22 libraryLyrics:v24 identifiers:v25 personalizationProperties:v21];
    [v3 setLyrics:v26];
  }
  if ([*(id *)(a1 + 40) hasCloudSyncSource])
  {
    int64_t v27 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipSongStoreAsset"];
    if (v27)
    {
      if ([v3 hasLoadedValueForKey:@"MPModelRelationshipSongStoreAsset"])
      {
        uint64_t v28 = [v3 storeAsset];
      }
      else
      {
        uint64_t v28 = 0;
      }
      id v29 = *(void **)(a1 + 72);
      int64_t v30 = [*(id *)(a1 + 40) storeAsset];
      std::__shared_count v31 = [v29 _lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:v28 libraryAsset:v30 personalizationProperties:v27];
      [v3 setStoreAsset:v31];
    }
  }
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPlaybackPosition:*(void *)(a1 + 32)];
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setLyrics:*(void *)(a1 + 32)];
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyTVEpisodeLibraryAdded", (void)v28))
        {
          uint64_t v9 = *(void *)(a1 + 56);
          if (v9 == 1)
          {
            uint64_t v10 = 1;
          }
          else if (v9 == 2)
          {
            uint64_t v10 = 0;
          }
          else
          {
            uint64_t v10 = [*(id *)(a1 + 40) isLibraryAdded];
          }
          [v3 setLibraryAdded:v10];
        }
        else if ([v8 isEqualToString:@"MPModelPropertyTVEpisodeKeepLocalEnableState"])
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyTVEpisodeKeepLocalManagedStatus"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else
        {
          int v11 = [v8 isEqualToString:@"MPModelPropertyTVEpisodeKeepLocalConstraints"];
          uint64_t v12 = *(void **)(a1 + 40);
          if (v11)
          {
            objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(v12, "keepLocalConstraints"));
          }
          else if ([v12 hasCloudSyncSource] {
                 && [v8 isEqualToString:@"MPModelPropertyTVEpisodeLibraryAddEligible"])
          }
          {
            if ([*(id *)(a1 + 40) isLibraryAddEligible]) {
              uint64_t v13 = 1;
            }
            else {
              uint64_t v13 = [v3 isLibraryAddEligible];
            }
            [v3 setLibraryAddEligible:v13];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }

  uint64_t v15 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipTVEpisodeLocalFileAsset"];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    id v17 = [*(id *)(a1 + 40) localFileAsset];
    [v3 setLocalFileAsset:v17];
  }
  id v18 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"MPModelRelationshipTVEpisodePlaybackPosition", (void)v28);
  if (v18)
  {
    if ([v3 hasLoadedValueForKey:@"MPModelRelationshipTVEpisodePlaybackPosition"])
    {
      id v19 = [v3 playbackPosition];
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v20 = *(void **)(a1 + 64);
    id v21 = [*(id *)(a1 + 40) playbackPosition];
    id v22 = [v20 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v19 libraryPlaybackPosition:v21 personalizationProperties:v18];
    [v3 setPlaybackPosition:v22];
  }
  if ([*(id *)(a1 + 40) hasCloudSyncSource])
  {
    id v23 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipTVEpisodeStoreAsset"];
    if (v23)
    {
      id v24 = *(void **)(a1 + 64);
      unint64_t v25 = [v3 storeAsset];
      id v26 = [*(id *)(a1 + 40) storeAsset];
      int64_t v27 = [v24 _lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:v25 libraryAsset:v26 personalizationProperties:v23];
      [v3 setStoreAsset:v27];
    }
  }
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setPlaybackPosition:*(void *)(a1 + 32)];
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyMovieLibraryAdded", (void)v28))
        {
          uint64_t v9 = *(void *)(a1 + 56);
          if (v9 == 1)
          {
            uint64_t v10 = 1;
          }
          else if (v9 == 2)
          {
            uint64_t v10 = 0;
          }
          else
          {
            uint64_t v10 = [*(id *)(a1 + 40) isLibraryAdded];
          }
          [v3 setLibraryAdded:v10];
        }
        else if ([v8 isEqualToString:@"MPModelPropertyMovieKeepLocalEnableState"])
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyMovieKeepLocalManagedStatus"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyMovieKeepLocalManagedStatusReason"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else
        {
          int v11 = [v8 isEqualToString:@"MPModelPropertyMovieKeepLocalConstraints"];
          uint64_t v12 = *(void **)(a1 + 40);
          if (v11)
          {
            objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(v12, "keepLocalConstraints"));
          }
          else if ([v12 hasCloudSyncSource] {
                 && [v8 isEqualToString:@"MPModelPropertyMovieLibraryAddEligible"])
          }
          {
            if ([*(id *)(a1 + 40) isLibraryAddEligible]) {
              uint64_t v13 = 1;
            }
            else {
              uint64_t v13 = [v3 isLibraryAddEligible];
            }
            [v3 setLibraryAddEligible:v13];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }

  uint64_t v15 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipMovieLocalFileAsset"];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    id v17 = [*(id *)(a1 + 40) localFileAsset];
    [v3 setLocalFileAsset:v17];
  }
  id v18 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"MPModelRelationshipMoviePlaybackPosition", (void)v28);
  if (v18)
  {
    if ([v3 hasLoadedValueForKey:@"MPModelRelationshipMoviePlaybackPosition"])
    {
      id v19 = [v3 playbackPosition];
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v20 = *(void **)(a1 + 64);
    id v21 = [*(id *)(a1 + 40) playbackPosition];
    id v22 = [v20 _lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:v19 libraryPlaybackPosition:v21 personalizationProperties:v18];
    [v3 setPlaybackPosition:v22];
  }
  if ([*(id *)(a1 + 40) hasCloudSyncSource])
  {
    id v23 = [*(id *)(a1 + 48) objectForKey:@"MPModelRelationshipMovieStoreAsset"];
    if (v23)
    {
      id v24 = *(void **)(a1 + 64);
      unint64_t v25 = [v3 storeAsset];
      id v26 = [*(id *)(a1 + 40) storeAsset];
      int64_t v27 = [v24 _lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:v25 libraryAsset:v26 personalizationProperties:v23];
      [v3 setStoreAsset:v27];
    }
  }
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 setPlaybackPosition:*(void *)(a1 + 32)];
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyPlaylistLibraryAdded", (void)v11))
        {
          uint64_t v9 = *(void *)(a1 + 48);
          if (v9 == 1)
          {
            uint64_t v10 = 1;
          }
          else if (v9 == 2)
          {
            uint64_t v10 = 0;
          }
          else
          {
            uint64_t v10 = [*(id *)(a1 + 40) isLibraryAdded];
          }
          [v3 setLibraryAdded:v10];
        }
        if ([v8 isEqualToString:@"MPModelPropertyPlaylistIsFavorite"]) {
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        }
        if ([v8 isEqualToString:@"MPModelPropertyPlaylistIsDisliked"])
        {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaylistKeepLocalEnableState"])
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaylistKeepLocalManagedStatus"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaylistKeepLocalManagedStatusReason"])
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaylistKeepLocalConstraints"])
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyArtistIsFavorite", (void)v9)) {
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        }
        if ([v8 isEqualToString:@"MPModelPropertyArtistIsDisliked"]) {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        if ([v8 isEqualToString:@"MPModelPropertyArtistLibraryAdded"]) {
          objc_msgSend(v3, "setLibraryAdded:", objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded"));
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setHasLibraryLyrics:0];
}

+ (id)_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:(id)a3 libraryAsset:(id)a4 personalizationProperties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v9 properties];
  long long v11 = [v7 identifiers];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __150__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedStoreAssetWithUnpersonalizedAsset_libraryAsset_personalizationProperties___block_invoke;
  v17[3] = &unk_1E57F22C8;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  uint64_t v15 = (void *)[v14 copyWithIdentifiers:v11 block:v17];

  return v15;
}

void __150__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedStoreAssetWithUnpersonalizedAsset_libraryAsset_personalizationProperties___block_invoke(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyStoreAssetEndpointType", (void)v11))
        {
          objc_msgSend(v3, "setEndpointType:", objc_msgSend(a1[5], "endpointType"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyStoreAssetRedownloadParameters"])
        {
          id v9 = [a1[5] redownloadParameters];
          [v3 setRedownloadParameters:v9];
        }
        else if ([v8 isEqualToString:@"MPModelPropertyStoreAssetAccountIdentifier"])
        {
          objc_msgSend(v3, "setAccountIdentifier:", objc_msgSend(a1[5], "accountIdentifier"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyStoreAssetShouldReportPlayEvents"])
        {
          objc_msgSend(v3, "setShouldReportPlayEvents:", objc_msgSend(a1[5], "shouldReportPlayEvents"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyStoreAssetRedownloadable"])
        {
          if ([a1[5] isRedownloadable]) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = [a1[6] isRedownloadable];
          }
          [v3 setRedownloadable:v10];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

+ (id)_lightweightPersonalizedLyricsWithUnpersonalizedLyrics:(id)a3 libraryLyrics:(id)a4 identifiers:(id)a5 personalizationProperties:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  long long v11 = [v8 identifiers];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __160__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedLyricsWithUnpersonalizedLyrics_libraryLyrics_identifiers_personalizationProperties___block_invoke;
  v16[3] = &unk_1E57F8908;
  id v12 = v10;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  long long v14 = (void *)[v8 copyWithIdentifiers:v11 block:v16];

  return v14;
}

void __160__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedLyricsWithUnpersonalizedLyrics_libraryLyrics_identifiers_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) properties];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "isEqualToString:", @"MPModelPropertyLyricsHasLibraryLyrics", (void)v8))objc_msgSend(v3, "setHasLibraryLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLibraryLyrics")); {
        ++v7;
        }
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 identifiers:(id)a4 personalizationProperties:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if ([v6 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"]&& (objc_msgSend(v6, "storeUbiquitousIdentifier"), (long long v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v9 = [v7 properties];
    long long v10 = +[MPUbiquitousPlaybackPositionController sharedUbiquitousPlaybackPositionController];
    long long v11 = [v10 playbackPositionForLocalEntityIdentifier:v8];

    if (v11)
    {
      id v12 = [v6 identifiers];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __166__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_identifiers_personalizationProperties___block_invoke;
      v15[3] = &unk_1E57F32A0;
      id v16 = v9;
      id v17 = v11;
      id v13 = (id)[v6 copyWithIdentifiers:v12 block:v15];
    }
    else
    {
      id v13 = v6;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

void __166__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_identifiers_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyPlaybackPositionBookmarkTime", (void)v11))
        {
          [*(id *)(a1 + 40) bookmarkTime];
          [v3 setBookmarkTime:v9 / 1000.0];
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaybackPositionHasBeenPlayed"])
        {
          objc_msgSend(v3, "setHasBeenPlayed:", objc_msgSend(*(id *)(a1 + 40), "hasBeenPlayed"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaybackPositionUserPlayCount"])
        {
          objc_msgSend(v3, "setUserPlayCount:", objc_msgSend(*(id *)(a1 + 40), "userPlayCount"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"])
        {
          long long v10 = [*(id *)(a1 + 40) ubiquitousIdentifier];
          [v3 setStoreUbiquitousIdentifier:v10];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 libraryPlaybackPosition:(id)a4 personalizationProperties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v9 properties];
  long long v11 = [v7 identifiers];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __178__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_libraryPlaybackPosition_personalizationProperties___block_invoke;
  v16[3] = &unk_1E57F32A0;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  long long v14 = (void *)[v7 copyWithIdentifiers:v11 block:v16];

  return v14;
}

void __178__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_libraryPlaybackPosition_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"MPModelPropertyPlaybackPositionBookmarkTime", (void)v9))
        {
          [*(id *)(a1 + 40) bookmarkTime];
          objc_msgSend(v3, "setBookmarkTime:");
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaybackPositionHasBeenPlayed"])
        {
          objc_msgSend(v3, "setHasBeenPlayed:", objc_msgSend(*(id *)(a1 + 40), "hasBeenPlayed"));
        }
        else if ([v8 isEqualToString:@"MPModelPropertyPlaybackPositionUserPlayCount"])
        {
          objc_msgSend(v3, "setUserPlayCount:", objc_msgSend(*(id *)(a1 + 40), "userPlayCount"));
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end