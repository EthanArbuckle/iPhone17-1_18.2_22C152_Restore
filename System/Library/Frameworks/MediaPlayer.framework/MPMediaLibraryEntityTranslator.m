@interface MPMediaLibraryEntityTranslator
+ (id)_translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4 create:(BOOL)a5 transient:(BOOL)a6;
+ (id)translatorForMPModelClass:(Class)a3;
+ (id)translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4;
+ (id)translatorForTransientMPModelClass:(Class)a3;
- (BOOL)isTransient;
- (Class)MPModelClass;
- (Class)classForRelationshipKey:(id)a3;
- (id)_cachedMediaLibraryUniqueIdentifierForKey:(id)a3;
- (id)_objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 baseTranslator:(id)a6 prependKeyPath:(id)a7 context:(id)a8;
- (id)_propertyTranslatorForKeyPath:(id)a3;
- (id)_valueForKeyPath:(id)a3 forPropertyCache:(const void *)a4 context:(id)a5;
- (id)allowedItemPredicatesBlock;
- (id)entityQueryBlock;
- (id)identifiersForPropertyCache:(const void *)a3 context:(id)a4;
- (id)objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 context:(id)a6;
- (shared_ptr<mlcore::EntityQuery>)entityQueryForPropertySet:(id)a3 sortDescriptors:(id)a4 context:(id)a5 view:(id)a6;
- (shared_ptr<mlcore::PropertiesQuery>)propertiesQueryForPropertySet:(id)a3 scopedContainers:(id)a4 allowedItemIdentifiers:(id)a5 view:(id)a6;
- (shared_ptr<std::unordered_map<std::string,)_propertyMapForKeyPath:(id)a3 includePropertiesToSort:(BOOL)a4;
- (unordered_map<std::string,)propertiesToFetchForPropertyKey:()std:()std:(std:(mlcore:(MPMediaLibraryEntityTranslator *)self :(SEL)a3 ModelPropertyBase *>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>;
- (vector<mlcore::ModelPropertyBase)MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self;
- (vector<mlcore::ModelPropertyBase)_MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self withForeignPropertyBase:(SEL)a3;
- (vector<mlcore::SortDescriptor,)MLCoreSortDescriptorsForModelSortDescriptors:(MPMediaLibraryEntityTranslator *)self;
- (vector<std::shared_ptr<mlcore::Predicate>,)MLCorePredicateForModelPropertyFilters:(MPMediaLibraryEntityTranslator *)self;
- (void)_propertyForKeyPath:(id)a3;
- (void)entityClass;
- (void)mapIdentifierMLProperties:(const void *)a3 identifierCreationBlock:(id)a4;
- (void)mapPropertyKey:(id)a3 toMLProperty:(void *)a4;
- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 filterTransformer:(id)a7 valueTransformer:(id)a8;
- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 valueTransformer:(id)a7;
- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 valueTransformer:(id)a5;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6 relationshipValidationProperties:(const void *)a7 isValidRelationshipHandler:(id)a8;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 usingForeignPropertyBase:(void *)a5;
- (void)setAllowedItemPredicatesBlock:(id)a3;
- (void)setEntityQueryBlock:(id)a3;
@end

@implementation MPMediaLibraryEntityTranslator

- (void)mapPropertyKey:(id)a3 toMLProperty:(void *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "property");
  v11 = a4;
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, (unsigned __int8 *)v9, 1);
  [(MPMediaLibraryEntityTranslator *)self mapPropertyKey:v6 withPropertiesToFetch:__p valueTransformer:&__block_literal_global_52996];
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)__p[2]);
  v7 = __p[0];
  __p[0] = 0;
  if (v7) {
    operator delete(v7);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 filterTransformer:(id)a7 valueTransformer:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  propertiesToTranslators = self->_propertiesToTranslators;
  if (!propertiesToTranslators)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = self->_propertiesToTranslators;
    self->_propertiesToTranslators = v19;

    propertiesToTranslators = self->_propertiesToTranslators;
  }
  v21 = [(NSMutableDictionary *)propertiesToTranslators objectForKeyedSubscript:v14];
  if (!v21)
  {
    v21 = objc_alloc_init(_MPMediaLibraryEntityPropertyTranslator);
    [(NSMutableDictionary *)self->_propertiesToTranslators setObject:v21 forKey:v14];
  }
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v24, (uint64_t)a4);
  [(_MPMediaLibraryEntityPropertyTranslator *)v21 setPropertiesToFetchMap:&v24];
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v22, (uint64_t)a5);
  [(_MPMediaLibraryEntityPropertyTranslator *)v21 setPropertiesToSortMap:&v22];
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  [(_MPMediaLibraryEntityPropertyTranslator *)v21 setSortTransformer:v15];
  [(_MPMediaLibraryEntityPropertyTranslator *)v21 setValueTransformer:v17];
  [(_MPMediaLibraryEntityPropertyTranslator *)v21 setFilterTransformer:v16];
}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 valueTransformer:(id)a5
{
  id v9 = a3;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)id v16 = 0u;
  int v17 = 1065353216;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__MPMediaLibraryEntityTranslator_mapPropertyKey_withPropertiesToFetch_valueTransformer___block_invoke;
  v12[3] = &unk_1E57F9378;
  id v13 = v9;
  SEL v14 = a2;
  v12[4] = self;
  id v10 = v9;
  [(MPMediaLibraryEntityTranslator *)self mapPropertyKey:v10 withPropertiesToFetch:a4 propertiesToSort:__p sortTransformer:v12 valueTransformer:a5];
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v16[0]);
  v11 = __p[0];
  __p[0] = 0;
  if (v11) {
    operator delete(v11);
  }
}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 valueTransformer:(id)a7
{
}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__151;
  v37 = __Block_byref_object_dispose__152;
  id v38 = [*(id *)(a1 + 32) properties];
  v4 = [*(id *)(a1 + 32) relationships];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_153;
  v32[3] = &unk_1E57F9440;
  v32[4] = &v33;
  [v4 enumerateKeysAndObjectsUsingBlock:v32];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)v34[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v9 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:v8];
        if (!v9)
        {
          v19 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v13 = *(void *)(a1 + 72);
          SEL v14 = *(void **)(a1 + 40);
          id v15 = NSStringFromClass((Class)[v14 MPModelClass]);
          [v19 handleFailureInMethod:v13, v14, @"MPMediaLibraryEntityTranslator.mm", 606, @"Property mapping missing for %@:%@", v15, v8 object file lineNumber description];
        }
        id v10 = *(void **)(a1 + 48);
        v11 = [*(id *)(a1 + 56) arrayByAddingObject:v8];
        uint64_t v12 = [v10 _valueForKeyPath:v11 forPropertyCache:*(void *)(a1 + 80) context:*(void *)(a1 + 64)];

        [v3 setValue:v12 forModelKey:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v5);
  }

  id v16 = [*(id *)(a1 + 32) relationships];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_2;
  v21[3] = &unk_1E57F9468;
  uint64_t v17 = *(void *)(a1 + 72);
  v21[4] = *(void *)(a1 + 40);
  uint64_t v26 = v17;
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 64);
  long long v27 = *(_OWORD *)(a1 + 80);
  id v18 = v3;
  id v25 = v18;
  [v16 enumerateKeysAndObjectsUsingBlock:v21];

  _Block_object_dispose(&v33, 8);
}

void __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = *(void *)(a1 + 72);
    id v24 = *(void **)(a1 + 32);
    id v25 = NSStringFromClass((Class)[v24 MPModelClass]);
    [v22 handleFailureInMethod:v23, v24, @"MPMediaLibraryEntityTranslator.mm", 613, @"Relationship mapping missing for %@:%@", v25, v5 object file lineNumber description];
  }
  uint64_t v8 = [*(id *)(a1 + 40) arrayByAddingObject:v5];
  if ([v7 transient])
  {
    int v9 = 1;
  }
  else
  {
    id v10 = *(void **)(a1 + 48);
    v11 = objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    uint64_t v12 = (ModelPropertyBase *)[v10 _propertyForKeyPath:v11];

    [v7 relationshipValidationProperties];
    std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)v29, (uint64_t)__p);
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
    }
    _MPMLGetForeignPropertyMap((uint64_t)&__p, v12, (uint64_t)v29);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)v29, (uint64_t *)&__p);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v28);
    uint64_t v13 = __p;
    __p = 0;
    if (v13) {
      operator delete(v13);
    }
    SEL v14 = [v7 validRelationshipHandler];
    int v9 = ((uint64_t (**)(void, void, void **, void))v14)[2](v14, *(void *)(a1 + 56), v29, *(void *)(a1 + 80));

    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v29[2]);
    id v15 = v29[0];
    v29[0] = 0;
    if (v15) {
      operator delete(v15);
    }
  }
  id v16 = [v7 entityTranslator];
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = [*(id *)(a1 + 32) MPModelClass];
  if (v18 != objc_opt_class())
  {
    if (!v9)
    {
      v21 = 0;
      id v20 = v17;
      goto LABEL_18;
    }
    uint64_t v19 = *(void *)(a1 + 88);
    id v20 = v17;
    goto LABEL_16;
  }

  id v20 = v16;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v19 = [v20 entityClass];
  if (v19 == *(void *)(a1 + 88))
  {
LABEL_16:
    v21 = [v16 _objectForPropertySet:v6 entityClass:v19 propertyCache:*(void *)(a1 + 80) baseTranslator:v20 prependKeyPath:v8 context:*(void *)(a1 + 56)];
    goto LABEL_18;
  }
  v21 = 0;
LABEL_18:
  [*(id *)(a1 + 64) setValue:v21 forModelKey:v5];
}

- (void)_propertyForKeyPath:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21 = self;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    SEL v20 = a2;
    uint64_t v8 = 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v23;
    p_isa = (id *)&v21->super.isa;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [p_isa[2] objectForKeyedSubscript:v13];

        uint64_t v8 = (void *)v14;
        if (!v14)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          id v17 = NSStringFromClass((Class)[p_isa MPModelClass]);
          [v19 handleFailureInMethod:v20, v21, @"MPMediaLibraryEntityTranslator.mm", 517, @"Relationship mapping missing for %@:%@", v17, v13 object file lineNumber description];
        }
        uint64_t v15 = [v8 entityTranslator];

        p_isa = (id *)v15;
        if (([v8 transient] & 1) == 0)
        {
          if (v9) {
            uint64_t Property = MPMediaLibraryGetProperty(v9, (ModelPropertyBase *)[v8 foreignPropertyBase]);
          }
          else {
            uint64_t Property = [v8 foreignPropertyBase];
          }
          int v9 = (ModelPropertyBase *)Property;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);

    v21 = (MPMediaLibraryEntityTranslator *)v15;
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_valueForKeyPath:(id)a3 forPropertyCache:(const void *)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(MPMediaLibraryEntityTranslator *)self _propertyTranslatorForKeyPath:v9];
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v16 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 573, @"Property mapping missing for %@:%@", v17, v9 object file lineNumber description];
  }
  uint64_t v12 = [v11 valueTransformer];

  if (v12)
  {
    [(MPMediaLibraryEntityTranslator *)self _propertyMapForKeyPath:v9 includePropertiesToSort:0];
    uint64_t v13 = [v11 valueTransformer];
    uint64_t v14 = ((void (**)(void, id, uint64_t, const void *))v13)[2](v13, v10, v18, a4);

    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_propertyTranslatorForKeyPath:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    propertiesToTranslators = self->_propertiesToTranslators;
    id v6 = [v4 lastObject];
    uint64_t v7 = [(NSMutableDictionary *)propertiesToTranslators objectForKeyedSubscript:v6];
  }
  else
  {
    relationshipsToTranslators = self->_relationshipsToTranslators;
    id v9 = [v4 firstObject];
    id v6 = [(NSMutableDictionary *)relationshipsToTranslators objectForKeyedSubscript:v9];

    id v10 = [v6 entityTranslator];
    v11 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    uint64_t v7 = [v10 _propertyTranslatorForKeyPath:v11];
  }

  return v7;
}

+ (id)_translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4 create:(BOOL)a5 transient:(BOOL)a6
{
  BOOL v7 = a5;
  if (a3)
  {
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1) {
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_320_53010);
    }
    v11 = (void *)MPModelToTranslatorDictionary;
    uint64_t v12 = NSStringFromClass(a3);
    uint64_t v13 = [v11 objectForKey:v12];
    goto LABEL_9;
  }
  if (a4)
  {
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1) {
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_320_53010);
    }
    uint64_t v14 = (void *)MLEntityClassToTranslatorDictionary;
    uint64_t v12 = _MPMLKeyForEntityClass((uint64_t)a4);
    uint64_t v13 = [v14 objectForKey:v12];
LABEL_9:
    uint64_t v15 = (id *)v13;

    id v16 = v15;
    if (v15) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  id v16 = 0;
LABEL_10:
  if (v7)
  {
    if (a4) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = a6;
    }
    if (!a3 || !v17) {
      __assert_rtn("+[MPMediaLibraryEntityTranslator _translatorForMPModelClass:mlcoreEntityClass:create:transient:]", "MPMediaLibraryEntityTranslator.mm", 162, "MPModelClass && (entityClass || transient)");
    }
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1) {
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_320_53010);
    }
    id v16 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v16 + 4, a3);
    v16[5] = a4;
    *((unsigned char *)v16 + 24) = a6;
    uint64_t v18 = (void *)MPModelToTranslatorDictionary;
    uint64_t v19 = NSStringFromClass(a3);
    [v18 setObject:v16 forKey:v19];

    if (a4)
    {
      SEL v20 = (void *)MLEntityClassToTranslatorDictionary;
      v21 = _MPMLKeyForEntityClass((uint64_t)a4);
      [v20 setObject:v16 forKey:v21];
    }
  }
LABEL_20:

  return v16;
}

+ (id)translatorForMPModelClass:(Class)a3
{
  if (MPMLCoreInitialize(void)::onceToken != -1) {
    dispatch_once(&MPMLCoreInitialize(void)::onceToken, &__block_literal_global_48557);
  }

  return (id)[a1 _translatorForMPModelClass:a3 mlcoreEntityClass:0 create:0 transient:0];
}

- (shared_ptr<std::unordered_map<std::string,)_propertyMapForKeyPath:(id)a3 includePropertiesToSort:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v8 = v4;
  v46[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((unint64_t)[v9 count] >= 2)
  {
    v46[0] = @"MPModelRelationshipPlaylistEntrySong";
    v46[1] = @"MPModelRelationshipPlaylistEntryTVEpisode";
    v46[2] = @"MPModelRelationshipPlaylistEntryMovie";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
    int v12 = [v10 containsObject:v11];

    if (v12)
    {
      uint64_t v13 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      v45[0] = @"MPModelPropertySongArtwork";
      v45[1] = @"MPModelPropertyTVEpisodeArtwork";
      v45[2] = @"MPModelPropertyMovieArtwork";
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
      uint64_t v15 = [v9 lastObject];
      int v16 = [v14 containsObject:v15];

      if (v16)
      {
        BOOL v17 = [v13[1] objectForKeyedSubscript:@"_MPModelPropertyPlaylistEntryArtwork"];
        uint64_t v18 = v17;
        if (v17)
        {
          [v17 propertiesToFetchMap];
          if (v39) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v39);
          }
          if (v38) {
            goto LABEL_8;
          }
        }
        else
        {
          v34 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v35 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
          [v34 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 543, @"Property mapping missing for %@:%@", v35, @"_MPModelPropertyPlaylistEntryArtwork" object file lineNumber description];
        }
        v36 = [MEMORY[0x1E4F28B00] currentHandler];
        v37 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
        [v36 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 544, @"Property translator mapping missing for %@:%@", v37, @"_MPModelPropertyPlaylistEntryArtwork" object file lineNumber description];

        if (!v18)
        {
          *uint64_t v8 = 0;
          v8[1] = 0;
          goto LABEL_9;
        }
LABEL_8:
        [v18 propertiesToFetchMap];
LABEL_9:

        goto LABEL_30;
      }
    }
  }
  uint64_t v19 = [(MPMediaLibraryEntityTranslator *)self _propertyTranslatorForKeyPath:v9];
  uint64_t v13 = v19;
  if (v19)
  {
    [v19 propertiesToFetchMap];
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v33 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v32 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 551, @"Property mapping missing for %@:%@", v33, v9 object file lineNumber description];

    *uint64_t v8 = 0;
    v8[1] = 0;
    if (!v5)
    {
LABEL_13:
      if ((unint64_t)[v9 count] < 2) {
        goto LABEL_30;
      }
    }
  }
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v38, *v8);
  if (v5)
  {
    [v13 propertiesToSortMap];
    std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, v41);
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
    }
    SEL v20 = (unsigned __int8 *)v44;
    if (v44)
    {
      do
      {
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,mlcore::ModelPropertyBase *> const&>((uint64_t)&v38, v20 + 16, (uint64_t)(v20 + 16));
        SEL v20 = *(unsigned __int8 **)v20;
      }
      while (v20);
      v21 = (void **)v44;
    }
    else
    {
      v21 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v21);
    long long v22 = __p[0];
    __p[0] = 0;
    if (v22) {
      operator delete(v22);
    }
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    long long v23 = objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
    long long v24 = [(MPMediaLibraryEntityTranslator *)self _propertyForKeyPath:v23];

    _MPMLGetForeignPropertyMap((uint64_t)__p, v24, (uint64_t)&v38);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)&v38, (uint64_t *)__p);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v44);
    long long v25 = __p[0];
    __p[0] = 0;
    if (v25) {
      operator delete(v25);
    }
  }
  uint64_t v26 = operator new(0x40uLL);
  v26[1] = 0;
  v26[2] = 0;
  *uint64_t v26 = &unk_1EE673668;
  *(void *)&long long v27 = std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)(v26 + 3), (uint64_t)&v38);
  *((void *)&v27 + 1) = v26;
  long long v28 = (std::__shared_weak_count *)v8[1];
  *(_OWORD *)uint64_t v8 = v27;
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v40);
  long long v29 = v38;
  id v38 = 0;
  if (v29) {
    operator delete(v29);
  }
LABEL_30:

  result.__cntrl_ = v31;
  result.__ptr_ = v30;
  return result;
}

- (Class)MPModelClass
{
  return self->_MPModelClass;
}

BOOL __101__MPMediaLibraryEntityTranslator_mapRelationshipKey_toModelClass_transient_usingForeignPropertyBase___block_invoke(uint64_t a1, void *a2, uint64_t a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "joinProperty");
  uint64_t v13 = __p;
  BOOL v7 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v13);
  uint64_t v8 = MPMediaLibraryPropertyCacheValueForProperty(v7[5], a4);
  uint64_t v9 = [v8 longLongValue];

  if (v12 < 0) {
    operator delete(__p[0]);
  }

  return v9 != 0;
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6
{
  BOOL v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  std::string::basic_string[abi:ne180100]<0>(v13, "joinProperty");
  uint64_t v15 = a6;
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, (unsigned __int8 *)v13, 1);
  [(MPMediaLibraryEntityTranslator *)self mapRelationshipKey:v10 toModelClass:a4 transient:v7 usingForeignPropertyBase:a6 relationshipValidationProperties:__p isValidRelationshipHandler:&__block_literal_global_102_52988];
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)__p[2]);
  v11 = __p[0];
  __p[0] = 0;
  if (v11) {
    operator delete(v11);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6 relationshipValidationProperties:(const void *)a7 isValidRelationshipHandler:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  if (!self->_relationshipsToTranslators)
  {
    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationshipsToTranslators = self->_relationshipsToTranslators;
    self->_relationshipsToTranslators = v16;
  }
  uint64_t v18 = objc_alloc_init(_MPMediaLibraryEntityRelationshipTranslator);
  [(NSMutableDictionary *)self->_relationshipsToTranslators setObject:v18 forKeyedSubscript:v14];
  [(_MPMediaLibraryEntityRelationshipTranslator *)v18 setTransient:v11];
  [(_MPMediaLibraryEntityRelationshipTranslator *)v18 setRelationshipModelClass:a4];
  [(_MPMediaLibraryEntityRelationshipTranslator *)v18 setForeignPropertyBase:a6];
  [(_MPMediaLibraryEntityRelationshipTranslator *)v18 setValidRelationshipHandler:v15];
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v19, (uint64_t)a7);
  [(_MPMediaLibraryEntityRelationshipTranslator *)v18 setRelationshipValidationProperties:&v19];
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

id __62__MPMediaLibraryEntityTranslator_mapPropertyKey_toMLProperty___block_invoke(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "property");
  BOOL v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

MPIdentifierSet *__84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 modelKind];
  if ([v7 isMultiQuery])
  {
    uint64_t v9 = +[MPModelGenericObjectKind identityKind];

    uint64_t v8 = (void *)v9;
  }
  id v10 = *(void **)(a1 + 32);
  char v11 = [v7 mediaLibrary];
  char v12 = [v11 uniqueIdentifier];
  uint64_t v13 = [v10 _cachedMediaLibraryUniqueIdentifierForKey:v12];

  id v14 = [MPIdentifierSet alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke_2;
  v18[3] = &unk_1E57F9308;
  id v20 = *(id *)(a1 + 40);
  id v15 = v7;
  id v19 = v15;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v16 = [(MPIdentifierSet *)v14 initWithSource:v13 modelKind:v8 block:v18];

  return v16;
}

- (id)_cachedMediaLibraryUniqueIdentifierForKey:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::lock);
  id v4 = [(id)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers objectForKeyedSubscript:v3];
  if (!v4)
  {
    if (!-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      id v6 = (void *)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers;
      -[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers = v5;
    }
    id v4 = [@"Library-" stringByAppendingString:v3];
    [(id)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers setObject:v4 forKeyedSubscript:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::lock);

  return v4;
}

- (void)entityClass
{
  return self->_entityClass;
}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_153(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = a2;
  id v7 = a3;
  if (v16 == @"MPModelRelationshipPlaylistEntrySong")
  {
    id v10 = [v7 properties];
    char v11 = [v10 containsObject:@"MPModelPropertySongArtwork"];
    goto LABEL_8;
  }
  if (v16 == @"MPModelRelationshipPlaylistEntryTVEpisode")
  {
    id v10 = [v7 properties];
    char v11 = [v10 containsObject:@"MPModelPropertyTVEpisodeArtwork"];
LABEL_8:
    char v12 = v11;

    if ((v12 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v16 == @"MPModelRelationshipPlaylistEntryMovie")
  {
    uint64_t v8 = [v7 properties];
    int v9 = [v8 containsObject:@"MPModelPropertyMovieArtwork"];

    if (v9)
    {
LABEL_9:
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObject:@"_MPModelPropertyPlaylistEntryArtwork"];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }
LABEL_10:
}

- (shared_ptr<mlcore::EntityQuery>)entityQueryForPropertySet:(id)a3 sortDescriptors:(id)a4 context:(id)a5 view:(id)a6
{
  uint64_t v99 = v6;
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  id v97 = a4;
  id v98 = a5;
  id v11 = a6;
  entityQueryBlocuint64_t k = (void (**)(id, id, _OWORD *))self->_entityQueryBlock;
  v95 = v11;
  if (!entityQueryBlock)
  {
    v89 = [MEMORY[0x1E4F28B00] currentHandler];
    v90 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v89 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 306, @"No entityQueryBlock was mapped for %@", v90 object file lineNumber description];

    entityQueryBlocuint64_t k = (void (**)(id, id, _OWORD *))self->_entityQueryBlock;
    id v11 = v95;
  }
  if (v11)
  {
    [v11 mlCoreView];
    long long v13 = v118;
  }
  else
  {
    long long v13 = 0uLL;
  }
  long long v150 = v13;
  long long v118 = 0uLL;
  entityQueryBlock[2](entityQueryBlock, v98, &v150);
  if (*((void *)&v150 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v150 + 1));
  }
  uint64_t v14 = +[MPPropertySet emptyPropertySet];
  [(MPMediaLibraryEntityTranslator *)self MLCorePropertiesForPropertySet:v14];

  uint64_t v147 = 0;
  __p = 0;
  v146 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v148, (uint64_t)v149, (v149 - (unsigned char *)v148) >> 3);
  mlcore::EntityQuery::setIdentityPropertiesToFetch();
  if (__p)
  {
    v146 = __p;
    operator delete(__p);
  }
  if (!*(void *)v99)
  {
    v91 = [MEMORY[0x1E4F28B00] currentHandler];
    v92 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v91 handleFailureInMethod:a2, self, @"MPMediaLibraryEntityTranslator.mm", 311, @"%@ entityQueryBlock did not return a query.", v92 object file lineNumber description];
  }
  id v15 = [(MPMediaLibraryEntityTranslator *)self MPModelClass];
  if (v15 != (objc_class *)objc_opt_class())
  {
    [(MPMediaLibraryEntityTranslator *)self MLCorePropertiesForPropertySet:v96];
    v115 = 0;
    uint64_t v116 = 0;
    v114 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v114, (const void *)v118, *((uint64_t *)&v118 + 1), (uint64_t)(*((void *)&v118 + 1) - v118) >> 3);
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (v114)
    {
      v115 = v114;
      operator delete(v114);
    }
    [(MPMediaLibraryEntityTranslator *)self MLCoreSortDescriptorsForModelSortDescriptors:v97];
    if (v152 != v151) {
      mlcore::PropertiesQuery::setSortDescriptors();
    }
    uint64_t v16 = [v98 propertyFilters];
    [(MPMediaLibraryEntityTranslator *)self MLCorePredicateForModelPropertyFilters:v16];

    if (v129 != v128)
    {
      mlcore::Query::predicate((uint64_t *)&v113, *(mlcore::Query **)v99);
      BOOL v17 = v129;
      if ((unint64_t)v129 >= v130)
      {
        uint64_t v81 = (v129 - v128) >> 4;
        if ((unint64_t)(v81 + 1) >> 60) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v82 = (uint64_t)(v130 - (void)v128) >> 3;
        if (v82 <= v81 + 1) {
          unint64_t v82 = v81 + 1;
        }
        if (v130 - (unint64_t)v128 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v83 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v83 = v82;
        }
        v141 = (void (*)(uint64_t))&v130;
        v84 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v83);
        v85 = (void ***)&v84[2 * v81];
        v137 = (void ***)v84;
        v138 = v85;
        v140 = (__n128 (*)(__n128 *, __n128 *))&v84[2 * v86];
        *(_OWORD *)v85 = v113;
        long long v113 = 0uLL;
        uint64_t v139 = (uint64_t)(v85 + 2);
        std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v128, &v137);
        uint64_t v18 = v129;
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v137);
        v129 = v18;
        if (*((void *)&v113 + 1))
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v113 + 1));
          uint64_t v18 = v129;
        }
      }
      else
      {
        *(_OWORD *)v129 = v113;
        uint64_t v18 = v17 + 16;
        v129 = v18;
      }
      memset(v111, 0, sizeof(v111));
      std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v111, v128, v18, (v18 - v128) >> 4);
      mlcore::CreateAndPredicate();
      mlcore::Query::setPredicate();
      if (v112) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v112);
      }
      v137 = (void ***)v111;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
    }
    v137 = (void ***)&v128;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
    v137 = &v151;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
    if ((void)v118)
    {
      *((void *)&v118 + 1) = v118;
      operator delete((void *)v118);
    }
    goto LABEL_112;
  }
  v137 = 0;
  v138 = (void ***)&v137;
  uint64_t v139 = 0x4012000000;
  v140 = __Block_byref_object_copy__52932;
  v141 = __Block_byref_object_dispose__52933;
  v142 = &unk_1956C748F;
  id v19 = *(std::__shared_weak_count **)(v99 + 8);
  v143 = *(mlcore::Query **)v99;
  v144 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v93 = [v98 modelKind];
  id v20 = [v96 relationships];
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke;
  v131[3] = &unk_1E57F93C0;
  SEL v136 = a2;
  v131[4] = self;
  v135 = (void ***)&v137;
  id v132 = v95;
  id v21 = v98;
  id v133 = v21;
  id v94 = v93;
  id v134 = v94;
  [v20 enumerateKeysAndObjectsUsingBlock:v131];

  [v21 setModelKind:v94];
  v128 = 0;
  v129 = 0;
  unint64_t v130 = 0;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id obj = v97;
  uint64_t v22 = [obj countByEnumeratingWithState:&v124 objects:v156 count:16];
  if (v22)
  {
    uint64_t v105 = *(void *)v125;
    v103 = self;
    do
    {
      uint64_t v23 = 0;
      uint64_t v107 = v22;
      do
      {
        if (*(void *)v125 != v105) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v124 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v80 = [MEMORY[0x1E4F28B00] currentHandler];
          [v80 handleFailureInMethod:a2 object:self file:@"MPMediaLibraryEntityTranslator.mm" lineNumber:339 description:@"MPModelGenericObject can only be sorted by MPMulitSortDescriptor."];
        }
        *(void *)&long long v118 = 0;
        *((void *)&v118 + 1) = &v118;
        uint64_t v119 = 0x4812000000;
        v120 = __Block_byref_object_copy__121;
        v121 = __Block_byref_object_dispose__122;
        v122 = &unk_1956C748F;
        memset(v123, 0, 24);
        long long v25 = [v24 relatedProperties];
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke_124;
        v117[3] = &unk_1E57F93E8;
        v117[4] = self;
        v117[5] = v24;
        v117[6] = &v118;
        v117[7] = a2;
        [v25 enumerateKeysAndObjectsUsingBlock:v117];

        uint64_t v108 = v23;
        uint64_t v27 = *(void *)(*((void *)&v118 + 1) + 48);
        uint64_t v26 = *(void *)(*((void *)&v118 + 1) + 56);
        uint64_t v28 = v26 - v27;
        if (v26 - v27 >= 1)
        {
          uint64_t v29 = v28 / 56;
          long long v30 = v128;
          long long v31 = v129;
          uint64_t v32 = (v129 - v128) / 56;
          uint64_t v33 = &v128[56 * v32];
          if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v130 - (void)v129) >> 3) >= v28 / 56)
          {
            uint64_t v37 = v129 - v33;
            if (0x6DB6DB6DB6DB6DB7 * ((v129 - v33) >> 3) >= v29)
            {
              uint64_t k = v27 + 56 * v29;
              uint64_t v41 = v129;
            }
            else
            {
              uint64_t k = v27 + 8 * ((v129 - v33) >> 3);
              if (k == v26)
              {
                uint64_t v41 = v129;
              }
              else
              {
                uint64_t v100 = v129 - v33;
                v101 = v128;
                uint64_t v109 = (v129 - v128) / 56;
                uint64_t v39 = v27 + 8 * ((v129 - v33) >> 3);
                uint64_t v40 = 0;
                do
                {
                  *(void *)&v31[v40] = MEMORY[0x1E4F76AA0] + 16;
                  std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v31[v40 + 8], v39 + v40 + 8);
                  *(_DWORD *)&v31[v40 + 48] = *(_DWORD *)(v39 + v40 + 48);
                  v40 += 56;
                }
                while (v39 + v40 != v26);
                uint64_t v41 = &v31[v40];
                self = v103;
                uint64_t k = v39;
                uint64_t v32 = v109;
                uint64_t v37 = v100;
                long long v30 = v101;
              }
              v129 = v41;
              if (v37 < 1) {
                goto LABEL_95;
              }
            }
            v53 = &v33[56 * v29];
            v54 = &v41[-56 * v29];
            v55 = v41;
            uint64_t v110 = k;
            if (v54 < v31)
            {
              uint64_t v56 = 0;
              v102 = v53;
              v57 = &v30[56 * v32 + 8 * ((v41 - v53) >> 3)];
              do
              {
                *(void *)&v41[v56] = MEMORY[0x1E4F76AA0] + 16;
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table((uint64_t)&v41[v56 + 8], (uint64_t *)&v57[v56 + 8]);
                *(_DWORD *)&v41[v56 + 48] = *(_DWORD *)&v57[v56 + 48];
                v56 += 56;
              }
              while (&v57[v56] < v31);
              v55 = &v41[v56];
              self = v103;
              uint64_t k = v110;
              v53 = v102;
            }
            v129 = v55;
            if (v41 != v53)
            {
              do
              {
                if (*((void *)v41 - 3))
                {
                  v58 = (void *)*((void *)v41 - 4);
                  if (v58)
                  {
                    do
                    {
                      v59 = (void *)*v58;
                      operator delete(v58);
                      v58 = v59;
                    }
                    while (v59);
                  }
                  *((void *)v41 - 4) = 0;
                  uint64_t v60 = *((void *)v41 - 5);
                  if (v60)
                  {
                    for (uint64_t i = 0; i != v60; ++i)
                      *(void *)(*((void *)v41 - 6) + 8 * i) = 0;
                  }
                  *((void *)v41 - 3) = 0;
                }
                uint64_t v62 = *((void *)v54 - 6);
                *((void *)v54 - 6) = 0;
                v63 = (void *)*((void *)v41 - 6);
                *((void *)v41 - 6) = v62;
                if (v63) {
                  operator delete(v63);
                }
                uint64_t v64 = *((void *)v54 - 4);
                uint64_t v65 = *((void *)v54 - 5);
                *((void *)v41 - 4) = v64;
                v66 = v41 - 32;
                *((void *)v41 - 5) = v65;
                *((void *)v54 - 5) = 0;
                uint64_t v67 = *((void *)v54 - 3);
                *((void *)v66 + 1) = v67;
                *((_DWORD *)v66 + 4) = *((_DWORD *)v54 - 4);
                if (v67)
                {
                  unint64_t v68 = *(void *)(v64 + 8);
                  unint64_t v69 = *((void *)v41 - 5);
                  if ((v69 & (v69 - 1)) != 0)
                  {
                    if (v68 >= v69) {
                      v68 %= v69;
                    }
                  }
                  else
                  {
                    v68 &= v69 - 1;
                  }
                  *(void *)(*((void *)v41 - 6) + 8 * v68) = v66;
                  *((void *)v54 - 4) = 0;
                  *((void *)v54 - 3) = 0;
                }
                *((_DWORD *)v41 - 2) = *((_DWORD *)v54 - 2);
                v41 -= 56;
                v54 -= 56;
              }
              while (v54 != v33);
            }
            while (v27 != k)
            {
              if (v33 != (char *)v27)
              {
                *((_DWORD *)v33 + 10) = *(_DWORD *)(v27 + 40);
                v70 = *(void **)(v27 + 24);
                uint64_t v71 = *((void *)v33 + 2);
                if (!v71) {
                  goto LABEL_88;
                }
                for (uint64_t j = 0; j != v71; *(void *)(*((void *)v33 + 1) + 8 * j++) = 0)
                  ;
                v73 = (void *)*((void *)v33 + 3);
                *((void *)v33 + 3) = 0;
                *((void *)v33 + 4) = 0;
                if (v73)
                {
                  while (v70)
                  {
                    v73[2] = v70[2];
                    v73[3] = v70[3];
                    v74 = (void *)*v73;
                    std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__node_insert_multi((uint64_t)(v33 + 8), v73);
                    v70 = (void *)*v70;
                    v73 = v74;
                    if (!v74) {
                      goto LABEL_88;
                    }
                  }
                  uint64_t k = v110;
                  do
                  {
                    v79 = (void *)*v73;
                    operator delete(v73);
                    v73 = v79;
                  }
                  while (v79);
                }
                else
                {
LABEL_88:
                  for (uint64_t k = v110; v70; v70 = (void *)*v70)
                  {
                    v75 = operator new(0x20uLL);
                    *(void *)v75 = 0;
                    v75[1] = *((_OWORD *)v70 + 1);
                    unint64_t v76 = *((void *)v75 + 2);
                    unint64_t v77 = HIDWORD(v76);
                    unint64_t v78 = 0x9DDFEA08EB382D69 * (((8 * v76) + 8) ^ HIDWORD(v76));
                    *((void *)v75 + 1) = 0x9DDFEA08EB382D69
                                         * ((0x9DDFEA08EB382D69 * (v77 ^ (v78 >> 47) ^ v78)) ^ ((0x9DDFEA08EB382D69
                                                                                                 * (v77 ^ (v78 >> 47) ^ v78)) >> 47));
                    std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__node_insert_multi((uint64_t)(v33 + 8), v75);
                  }
                }
              }
              *((_DWORD *)v33 + 12) = *(_DWORD *)(v27 + 48);
              v27 += 56;
              v33 += 56;
            }
          }
          else
          {
            unint64_t v34 = v32 + v29;
            if ((unint64_t)(v32 + v29) > 0x492492492492492) {
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            }
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v130 - (void)v128) >> 3) > v34) {
              unint64_t v34 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v130 - (void)v128) >> 3);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v130 - (void)v128) >> 3)) >= 0x249249249249249) {
              unint64_t v35 = 0x492492492492492;
            }
            else {
              unint64_t v35 = v34;
            }
            v155 = &v130;
            if (v35) {
              unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::MultiSortDescriptor>>(v35);
            }
            else {
              uint64_t v36 = 0;
            }
            unint64_t v42 = 0;
            v43 = (void **)(v35 + 56 * v32);
            v151 = (void **)v35;
            v152 = v43;
            v153 = (char *)v43;
            unint64_t v154 = v35 + 56 * v36;
            uint64_t v44 = 56 * v29;
            v45 = (char *)&v43[(unint64_t)v44 / 8];
            do
            {
              v43[v42 / 8] = (void *)(MEMORY[0x1E4F76AA0] + 16);
              std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v43[v42 / 8 + 1], v27 + v42 + 8);
              LODWORD(v43[v42 / 8 + 6]) = *(_DWORD *)(v27 + v42 + 48);
              v42 += 56;
            }
            while (v44 != v42);
            v153 = (char *)&v43[(unint64_t)v44 / 8];
            v46 = v152;
            v47 = v128;
            if (v128 != v33)
            {
              uint64_t v48 = 0;
              do
              {
                v46[v48 - 7] = (void *)(MEMORY[0x1E4F76AA0] + 16);
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table((uint64_t)&v46[v48 - 6], (uint64_t *)&v33[v48 * 8 - 48]);
                LODWORD(v46[v48 - 1]) = *(_DWORD *)&v33[v48 * 8 - 8];
                v48 -= 7;
              }
              while (&v33[v48 * 8] != v47);
              v46 = (void **)((char *)v46 + v48 * 8);
              v45 = v153;
              self = v103;
            }
            v152 = v46;
            v49 = v129;
            if (v129 != v33)
            {
              uint64_t v50 = 0;
              do
              {
                *(void *)&v45[v50] = MEMORY[0x1E4F76AA0] + 16;
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table((uint64_t)&v45[v50 + 8], (uint64_t *)&v33[v50 + 8]);
                *(_DWORD *)&v45[v50 + 48] = *(_DWORD *)&v33[v50 + 48];
                v50 += 56;
              }
              while (&v33[v50] != v49);
              v45 += v50;
              v46 = v152;
              uint64_t v33 = v129;
            }
            v51 = (void **)v128;
            unint64_t v52 = v130;
            v128 = (char *)v46;
            v129 = v45;
            unint64_t v130 = v154;
            v153 = v33;
            unint64_t v154 = v52;
            v152 = v51;
            v151 = v51;
            std::__split_buffer<mlcore::MultiSortDescriptor>::~__split_buffer((uint64_t)&v151);
          }
        }
LABEL_95:
        _Block_object_dispose(&v118, 8);
        v151 = (void **)v123;
        std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v151);
        uint64_t v23 = v108 + 1;
      }
      while (v108 + 1 != v107);
      uint64_t v22 = [obj countByEnumeratingWithState:&v124 objects:v156 count:16];
    }
    while (v22);
  }

  mlcore::MultiEntityQuery::setMultiSortDescriptors();
  *(void *)&long long v118 = &v128;
  std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v118);

  _Block_object_dispose(&v137, 8);
  if (v144) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v144);
  }
LABEL_112:
  if ([v98 sortUsingAllowedEntityIdentifiers])
  {
    long long v118 = 0uLL;
    uint64_t v119 = 0;
    mlcore::PropertiesQuery::setSortDescriptors();
    v137 = (void ***)&v118;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
  }
  if (v148)
  {
    v149 = v148;
    operator delete(v148);
  }

  result.__cntrl_ = v88;
  result.__ptr_ = v87;
  return result;
}

void __90__MPMediaLibraryEntityTranslator__MLCorePropertiesForPropertySet_withForeignPropertyBase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  if (!v7)
  {
    uint64_t v8 = (void *)[*(id *)(a1 + 32) MPModelClass];
    int v9 = NSString;
    id v10 = NSStringFromClass((Class)[*(id *)(a1 + 32) MPModelClass]);
    id v11 = [v9 stringWithFormat:@"MediaLibrary relationship mapping missing for %@:%@", v10, v5];
    MPModelPropertyMappingMissing(v8, v5, v11);
  }
  if (v5 == @"MPModelRelationshipPlaylistEntrySong"
    || v5 == @"MPModelRelationshipPlaylistEntryMovie"
    || v5 == @"MPModelRelationshipPlaylistEntryTVEpisode")
  {
    char v12 = (void *)[v6 mutableCopy];
    [v12 removeProperty:@"MPModelPropertySongArtwork"];
    [v12 removeProperty:@"MPModelPropertyMovieArtwork"];
    [v12 removeProperty:@"MPModelPropertyTVEpisodeArtwork"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

    id v6 = v12;
  }
  [v7 relationshipValidationProperties];
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)v30, (uint64_t)__p);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  _MPMLGetForeignPropertyMap((uint64_t)&__p, *(ModelPropertyBase **)(a1 + 56), (uint64_t)v30);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)v30, (uint64_t *)&__p);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v29);
  long long v13 = __p;
  __p = 0;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = v31;
  if (v31)
  {
    do
    {
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>((float *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), v14[5], v14[5]);
      uint64_t v14 = (void *)*v14;
    }
    while (v14);
  }
  if ([v7 transient])
  {
    id v15 = [v7 entityTranslator];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 _MLCorePropertiesForPropertySet:v6 withForeignPropertyBase:*(void *)(a1 + 56)];
    }
    else
    {
      __p = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }

    id v21 = (unint64_t *)__p;
    uint64_t v22 = v28;
    if (__p != v28)
    {
      uint64_t v23 = (float *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
      do
      {
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v23, *v21, *v21);
        ++v21;
      }
      while (v21 != (unint64_t *)v22);
LABEL_29:
      id v21 = (unint64_t *)__p;
    }
  }
  else
  {
    uint64_t Property = (ModelPropertyBase *)[v7 foreignPropertyBase];
    uint64_t v18 = *(ModelPropertyBase **)(a1 + 56);
    if (v18) {
      uint64_t Property = (ModelPropertyBase *)MPMediaLibraryGetProperty(v18, Property);
    }
    id v19 = [v7 entityTranslator];
    id v20 = v19;
    if (v19)
    {
      [v19 _MLCorePropertiesForPropertySet:v6 withForeignPropertyBase:Property];
    }
    else
    {
      __p = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }

    id v21 = (unint64_t *)__p;
    long long v24 = v28;
    if (__p != v28)
    {
      long long v25 = (float *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
      do
      {
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v25, *v21, *v21);
        ++v21;
      }
      while (v21 != (unint64_t *)v24);
      goto LABEL_29;
    }
  }
  if (v21)
  {
    uint64_t v28 = (std::__shared_weak_count *)v21;
    operator delete(v21);
  }
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v31);
  uint64_t v26 = v30[0];
  v30[0] = 0;
  if (v26) {
    operator delete(v26);
  }
}

- (vector<mlcore::ModelPropertyBase)_MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self withForeignPropertyBase:(SEL)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v69 = 0;
  v70 = (float *)&v69;
  uint64_t v71 = 0x5812000000;
  v72 = __Block_byref_object_copy__155;
  id v50 = a4;
  memset(v74, 0, sizeof(v74));
  v73 = __Block_byref_object_dispose__156;
  uint64_t v75 = 0;
  int v76 = 1065353216;
  id v6 = [v50 properties];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 setByAddingObject:@"_default"];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"_default"];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        long long v13 = [(NSMutableDictionary *)self->_propertiesToTranslators objectForKeyedSubscript:v12];
        uint64_t v14 = v13;
        if (!v13)
        {
          uint64_t v16 = [(MPMediaLibraryEntityTranslator *)self MPModelClass];
          BOOL v17 = NSString;
          uint64_t v18 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
          id v19 = [v17 stringWithFormat:@"MediaLibrary property mapping missing for %@:%@", v18, v12];
          MPModelPropertyMappingMissing(v16, v12, v19);

LABEL_15:
          id v20 = [(MPMediaLibraryEntityTranslator *)self MPModelClass];
          id v21 = NSString;
          uint64_t v22 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
          uint64_t v23 = [v21 stringWithFormat:@"MediaLibrary property translator mapping missing for %@:%@", v22, v12];
          MPModelPropertyMappingMissing(v20, v12, v23);

          goto LABEL_16;
        }
        [v13 propertiesToFetchMap];
        id v15 = v62;
        if (v63) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v63);
        }
        if (!v15) {
          goto LABEL_15;
        }
LABEL_16:
        [v14 propertiesToFetchMap];
        std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v62, (uint64_t)__p);
        if (v60) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v60);
        }
        _MPMLGetForeignPropertyMap((uint64_t)&__p, (ModelPropertyBase *)a5, (uint64_t)&v62);
        long long v24 = v61;
        if (v61)
        {
          do
          {
            std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v70 + 12, v24[5], v24[5]);
            long long v24 = (void *)*v24;
          }
          while (v24);
          long long v25 = (void **)v61;
        }
        else
        {
          long long v25 = 0;
        }
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v25);
        uint64_t v26 = __p;
        __p = 0;
        if (v26) {
          operator delete(v26);
        }
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v64);
        uint64_t v27 = v62;
        uint64_t v62 = 0;
        if (v27) {
          operator delete(v27);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v9);
  }

  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v28 = [v50 relationships];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __90__MPMediaLibraryEntityTranslator__MLCorePropertiesForPropertySet_withForeignPropertyBase___block_invoke;
  v54[3] = &unk_1E57F94B8;
  v54[4] = self;
  v54[5] = &v55;
  v54[6] = &v69;
  v54[7] = a5;
  [v28 enumerateKeysAndObjectsUsingBlock:v54];

  if (*((unsigned char *)v56 + 24))
  {
    uint64_t v29 = [(NSMutableDictionary *)self->_propertiesToTranslators objectForKeyedSubscript:@"_MPModelPropertyPlaylistEntryArtwork"];
    long long v30 = v29;
    if (v29)
    {
      [v29 propertiesToFetchMap];
      long long v31 = v62;
      if (v63) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v63);
      }
      if (v31) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v32 = [(MPMediaLibraryEntityTranslator *)self MPModelClass];
      uint64_t v33 = NSString;
      unint64_t v34 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
      unint64_t v35 = [v33 stringWithFormat:@"MediaLibrary property mapping missing for %@:%@", v34, @"_MPModelPropertyPlaylistEntryArtwork"];
      MPModelPropertyMappingMissing(v32, @"_MPModelPropertyPlaylistEntryArtwork", v35);
    }
    uint64_t v36 = [(MPMediaLibraryEntityTranslator *)self MPModelClass];
    uint64_t v37 = NSString;
    id v38 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    uint64_t v39 = [v37 stringWithFormat:@"MediaLibrary property translator mapping missing for %@:%@", v38, @"_MPModelPropertyPlaylistEntryArtwork"];
    MPModelPropertyMappingMissing(v36, @"_MPModelPropertyPlaylistEntryArtwork", v39);

LABEL_36:
    [v30 propertiesToFetchMap];
    std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v62, (uint64_t)__p);
    if (v60) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v60);
    }
    _MPMLGetForeignPropertyMap((uint64_t)&__p, (ModelPropertyBase *)a5, (uint64_t)&v62);
    uint64_t v40 = v61;
    if (v61)
    {
      do
      {
        if (*((char *)v40 + 39) < 0) {
          std::string::__init_copy_ctor_external(&v53, (const std::string::value_type *)v40[2], v40[3]);
        }
        else {
          std::string v53 = *(std::string *)(v40 + 2);
        }
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v70 + 12, v40[5], v40[5]);
        if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v53.__r_.__value_.__l.__data_);
        }
        uint64_t v40 = (void *)*v40;
      }
      while (v40);
      uint64_t v41 = (void **)v61;
    }
    else
    {
      uint64_t v41 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v41);
    unint64_t v42 = __p;
    __p = 0;
    if (v42) {
      operator delete(v42);
    }
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v64);
    v43 = v62;
    uint64_t v62 = 0;
    if (v43) {
      operator delete(v43);
    }
  }
  uint64_t v44 = (void *)*((void *)v70 + 8);
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (v44)
  {
    unint64_t v45 = 0;
    v46 = v44;
    do
    {
      ++v45;
      v46 = (void *)*v46;
    }
    while (v46);
    std::vector<mlcore::ModelPropertyBase *>::__vallocate[abi:ne180100](retstr, v45);
    var1 = retstr->var1;
    do
    {
      *var1++ = (ModelPropertyBase *)v44[2];
      uint64_t v44 = (void *)*v44;
    }
    while (v44);
    retstr->var1 = var1;
  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v69, 8);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v74[8]);

  return result;
}

- (vector<mlcore::ModelPropertyBase)MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self
{
  return [(MPMediaLibraryEntityTranslator *)self _MLCorePropertiesForPropertySet:a4 withForeignPropertyBase:0];
}

- (vector<mlcore::SortDescriptor,)MLCoreSortDescriptorsForModelSortDescriptors:(MPMediaLibraryEntityTranslator *)self
{
  void (**v15)(void *__return_ptr);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SortDescriptor *var0;
  SortDescriptor *var1;
  int64_t v21;
  SortDescriptor *v22;
  SortDescriptor *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SortDescriptor *v29;
  uint64_t v30;
  SortDescriptor *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  SortDescriptor *v40;
  uint64_t v41;
  SortDescriptor *v42;
  uint64_t v43;
  SortDescriptor *v44;
  uint64_t v45;
  uint64_t v46;
  SortDescriptor *v47;
  SortDescriptor *v48;
  SortDescriptor *v49;
  SortDescriptor *v50;
  void (**v51)(SortDescriptor *);
  BOOL v52;
  char *v53;
  SortDescriptor *v54;
  SortDescriptor *v55;
  uint64_t v56;
  SortDescriptor *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  vector<mlcore::SortDescriptor, std::allocator<mlcore::SortDescriptor>> *result;
  id obj;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  void **v80;
  void *v81;
  unsigned char v82[128];
  uint64_t v83;

  unint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  int v76 = 0u;
  unint64_t v77 = 0u;
  uint64_t v78 = 0u;
  v79 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v7)
  {
    v72 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v77 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 keyPath];
        }
        else
        {
          id v11 = [v9 key];
          uint64_t v81 = v11;
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
        }
        if (![v10 count])
        {
          long long v65 = [MEMORY[0x1E4F28B00] currentHandler];
          [v65 handleFailureInMethod:a3 object:self file:@"MPMediaLibraryEntityTranslator.mm" lineNumber:431 description:@"Sort descriptor must have at least one key."];
        }
        char v12 = [(MPMediaLibraryEntityTranslator *)self _propertyTranslatorForKeyPath:v10];
        if (!v12)
        {
          long long v66 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v67 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
          [v66 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 434, @"Property mapping missing for %@:%@", v67, v10 object file lineNumber description];
        }
        long long v13 = [v12 sortTransformer];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          long long v68 = [MEMORY[0x1E4F28B00] currentHandler];
          [v68 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 435, @"Sort descriptor missing transformer: %@", v9 object file lineNumber description];
        }
        [(MPMediaLibraryEntityTranslator *)self _propertyMapForKeyPath:v10 includePropertiesToSort:1];
        id v15 = [v12 sortTransformer];
        v15[2](&v73);

        BOOL v17 = v73;
        uint64_t v16 = v74;
        if (v74 - v73 >= 1)
        {
          uint64_t v18 = (v74 - v73) / 24;
          var0 = retstr->var0;
          var1 = retstr->var1;
          id v21 = (var1 - retstr->var0) / 24;
          uint64_t v22 = (SortDescriptor *)((char *)retstr->var0 + 24 * v21);
          uint64_t v23 = retstr->var2.var0;
          if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((v23 - var1) >> 3)) >= v18)
          {
            if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((var1 - v22) >> 3)) >= v18)
            {
              uint64_t v28 = v73 + 24 * v18;
              long long v31 = retstr->var1;
            }
            else
            {
              uint64_t v28 = v73 + 8 * ((var1 - v22) >> 3);
              if (v28 == v74)
              {
                long long v31 = retstr->var1;
              }
              else
              {
                uint64_t v29 = retstr->var1;
                long long v30 = v73 + 8 * ((var1 - v22) >> 3);
                long long v31 = v29;
                do
                {
                  *(void *)long long v31 = MEMORY[0x1E4F76A98] + 16;
                  uint64_t v32 = *(void *)(v30 + 8);
                  *((_DWORD *)v31 + 4) = *(_DWORD *)(v30 + 16);
                  *((void *)v31 + 1) = v32;
                  v30 += 24;
                  long long v31 = (SortDescriptor *)((char *)v31 + 24);
                  uint64_t v29 = (SortDescriptor *)((char *)v29 + 24);
                }
                while (v30 != v16);
              }
              retstr->var1 = v31;
              if (var1 - v22 < 1) {
                goto LABEL_58;
              }
            }
            std::string v53 = (char *)v31 - 24 * v18;
            v54 = v31;
            if (v53 < (char *)var1)
            {
              uint64_t v55 = v31;
              v54 = v31;
              do
              {
                *(void *)v54 = MEMORY[0x1E4F76A98] + 16;
                uint64_t v56 = *((void *)v53 + 1);
                *((_DWORD *)v54 + 4) = *((_DWORD *)v53 + 4);
                *((void *)v54 + 1) = v56;
                v53 += 24;
                v54 = (SortDescriptor *)((char *)v54 + 24);
                uint64_t v55 = (SortDescriptor *)((char *)v55 + 24);
              }
              while (v53 < (char *)var1);
            }
            uint64_t v57 = (SortDescriptor *)((char *)v22 + 24 * v18);
            retstr->var1 = v54;
            if (v31 != v57)
            {
              char v58 = 0xAAAAAAAAAAAAAAABLL * ((v31 - v57) >> 3);
              v59 = (char *)v31 - 16;
              uint64_t v60 = (uint64_t)var0 + 24 * v21 - 16;
              v61 = 24 * v58;
              do
              {
                uint64_t v62 = *(void *)(v60 + v61);
                *((_DWORD *)v59 + 2) = *(_DWORD *)(v60 + v61 + 8);
                *(void *)v59 = v62;
                v59 -= 24;
                v61 -= 24;
              }
              while (v61);
            }
            if (v28 != v17)
            {
              v63 = (uint64_t)var0 + 24 * v21 + 8;
              do
              {
                uint64_t v64 = *(void *)(v17 + 8);
                *(_DWORD *)(v63 + 8) = *(_DWORD *)(v17 + 16);
                *(void *)v63 = v64;
                v63 += 24;
                v17 += 24;
              }
              while (v17 != v28);
            }
          }
          else
          {
            if ((unint64_t)(v21 + v18) > 0xAAAAAAAAAAAAAAALL) {
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            }
            long long v24 = 0xAAAAAAAAAAAAAAABLL * ((v23 - var0) >> 3);
            long long v25 = 2 * v24;
            if (2 * v24 <= v21 + v18) {
              long long v25 = v21 + v18;
            }
            if (v24 >= 0x555555555555555) {
              uint64_t v26 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              uint64_t v26 = v25;
            }
            if (v26) {
              uint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v26);
            }
            else {
              uint64_t v27 = 0;
            }
            uint64_t v33 = v26 + 24 * v21;
            unint64_t v34 = 24 * v21;
            unint64_t v35 = v33 + 24 * v18;
            uint64_t v36 = (uint64_t *)(v17 + 8);
            uint64_t v37 = v33;
            id v38 = v33;
            do
            {
              *(void *)id v38 = MEMORY[0x1E4F76A98] + 16;
              uint64_t v39 = *v36;
              *(_DWORD *)(v38 + 16) = *((_DWORD *)v36 + 2);
              *(void *)(v38 + 8) = v39;
              v37 += 24;
              v36 += 3;
              v38 += 24;
            }
            while (v38 != v35);
            uint64_t v40 = retstr->var0;
            if (retstr->var0 != v22)
            {
              uint64_t v41 = v26 + v34 - 24;
              unint64_t v42 = v22;
              do
              {
                *(void *)(v33 - 24) = MEMORY[0x1E4F76A98] + 16;
                v33 -= 24;
                v43 = *((void *)v42 - 2);
                *(_DWORD *)(v33 + 16) = *((_DWORD *)v42 - 2);
                *(void *)(v33 + 8) = v43;
                v41 -= 24;
                unint64_t v42 = (SortDescriptor *)((char *)v42 - 24);
              }
              while (v42 != v40);
            }
            uint64_t v44 = retstr->var1;
            if (v44 != v22)
            {
              unint64_t v45 = v26 + v34 + 24 * v18;
              do
              {
                *(void *)unint64_t v35 = MEMORY[0x1E4F76A98] + 16;
                v46 = *((void *)v22 + 1);
                *(_DWORD *)(v35 + 16) = *((_DWORD *)v22 + 4);
                *(void *)(v35 + 8) = v46;
                uint64_t v22 = (SortDescriptor *)((char *)v22 + 24);
                v35 += 24;
                v45 += 24;
              }
              while (v22 != v44);
              uint64_t v22 = retstr->var1;
            }
            v47 = retstr->var0;
            retstr->var0 = (SortDescriptor *)v33;
            retstr->var1 = (SortDescriptor *)v35;
            retstr->var2.var0 = (SortDescriptor *)(v26 + 24 * v27);
            if (v22 != v47)
            {
              uint64_t v48 = (SortDescriptor *)((char *)v22 - 24);
              v49 = v48;
              id v50 = v48;
              do
              {
                v51 = *(void (***)(SortDescriptor *))v50;
                id v50 = (SortDescriptor *)((char *)v50 - 24);
                (*v51)(v49);
                uint64_t v48 = (SortDescriptor *)((char *)v48 - 24);
                unint64_t v52 = v49 == v47;
                v49 = v50;
              }
              while (!v52);
            }
            if (v47) {
              operator delete(v47);
            }
          }
        }
LABEL_58:
        v80 = (void **)&v73;
        std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v80);
        if (v75) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v75);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v7);
  }

  return result;
}

- (vector<std::shared_ptr<mlcore::Predicate>,)MLCorePredicateForModelPropertyFilters:(MPMediaLibraryEntityTranslator *)self
{
  void (**v14)(void *__return_ptr);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  MPMediaLibraryEntityTranslator *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  int64x2_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  vector<std::shared_ptr<mlcore::Predicate>, std::allocator<std::shared_ptr<mlcore::Predicate>>> *result;
  id obj;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *p_var2;
  uint64_t v50;
  uint64_t *v51;
  void *v52;
  std::__shared_weak_count *v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  char *v59;
  long long v60;
  char *v61;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *v62;
  char *v63;
  int64x2_t v64;
  char *v65;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *v66;
  unsigned char v67[128];
  uint64_t v68;

  long long v68 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v51 = (uint64_t *)retstr;
  uint64_t v55 = 0u;
  uint64_t v56 = 0u;
  uint64_t v57 = 0u;
  char v58 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v7)
  {
    p_var2 = &retstr->var2;
    id v50 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v10 = [v9 keys];
        unint64_t v52 = [v9 value];
        [v9 comparisonType];
        id v11 = [(MPMediaLibraryEntityTranslator *)self _propertyTranslatorForKeyPath:v10];
        if (!v11)
        {
          v43 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v44 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
          [v43 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 454, @"Property mapping missing for %@:%@", v44, v10 object file lineNumber description];
        }
        char v12 = [v11 filterTransformer];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          unint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
          [v45 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 455, @"Property filter transformer missing for property filter: %@", v9 object file lineNumber description];
        }
        [(MPMediaLibraryEntityTranslator *)self _propertyMapForKeyPath:v10 includePropertiesToSort:0];
        BOOL v14 = [v11 filterTransformer];
        ((void (**)(long long *__return_ptr))v14)[2](&v54);

        id v15 = v7;
        uint64_t v16 = *v51;
        BOOL v17 = (void *)v51[1];
        uint64_t v18 = (uint64_t)v17 - *v51;
        id v19 = v18 >> 4;
        id v20 = v51[2];
        if ((unint64_t)v17 < v20)
        {
          uint64_t v27 = *((void *)&v54 + 1);
          *(_OWORD *)BOOL v17 = v54;
          uint64_t v7 = v15;
          if (v27) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
          }
          v51[1] = (uint64_t)(v17 + 2);
        }
        else
        {
          id v21 = self;
          uint64_t v22 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 60) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = v20 - v16;
          long long v24 = v23 >> 3;
          if (v23 >> 3 <= (unint64_t)v22) {
            long long v24 = v19 + 1;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
            long long v25 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            long long v25 = v24;
          }
          uint64_t v62 = p_var2;
          if (v25) {
            long long v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v28 = (void *)(v25 + 16 * v19);
          v59 = (char *)v25;
          *(void *)&uint64_t v60 = v28;
          *((void *)&v60 + 1) = v28;
          v61 = (char *)(v25 + 16 * v26);
          if (v19 == v26)
          {
            if (v18 < 1)
            {
              if ((void *)v16 == v17) {
                long long v30 = 1;
              }
              else {
                long long v30 = v18 >> 3;
              }
              long long v66 = p_var2;
              long long v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v30);
              uint64_t v33 = v60;
              unint64_t v34 = *((void *)&v60 + 1) - v60;
              if (*((void *)&v60 + 1) == (void)v60)
              {
                uint64_t v39 = vdupq_n_s64(v60);
                uint64_t v36 = (unint64_t)&v31[16 * (v30 >> 2)];
              }
              else
              {
                unint64_t v35 = v34 >> 4;
                uint64_t v36 = (unint64_t)&v31[16 * (v30 >> 2) + (v34 & 0xFFFFFFFFFFFFFFF0)];
                uint64_t v37 = 16 * v35;
                id v38 = &v31[16 * (v30 >> 2)];
                do
                {
                  *(_OWORD *)id v38 = *(_OWORD *)v33;
                  v38 += 16;
                  *(void *)uint64_t v33 = 0;
                  *(void *)(v33 + 8) = 0;
                  v33 += 16;
                  v37 -= 16;
                }
                while (v37);
                uint64_t v39 = (int64x2_t)v60;
              }
              uint64_t v40 = v59;
              uint64_t v41 = v61;
              v59 = v31;
              *(void *)&uint64_t v60 = &v31[16 * (v30 >> 2)];
              uint64_t v64 = v39;
              *((void *)&v60 + 1) = v36;
              v61 = &v31[16 * v32];
              v63 = v40;
              long long v65 = v41;
              std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v63);
              uint64_t v28 = (void *)*((void *)&v60 + 1);
            }
            else
            {
              if (v22 >= 0) {
                uint64_t v29 = v19 + 1;
              }
              else {
                uint64_t v29 = v19 + 2;
              }
              v28 -= 2 * (v29 >> 1);
              *(void *)&uint64_t v60 = v28;
              *((void *)&v60 + 1) = v28;
            }
          }
          *uint64_t v28 = v54;
          unint64_t v42 = *((void *)&v54 + 1);
          v28[1] = *((void *)&v54 + 1);
          if (v42)
          {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v42 + 8), 1uLL, memory_order_relaxed);
            uint64_t v28 = (void *)*((void *)&v60 + 1);
          }
          *((void *)&v60 + 1) = v28 + 2;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer(v51, &v59, v17);
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v59);
          self = v21;
          uint64_t v7 = v15;
        }
        if (*((void *)&v54 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v54 + 1));
        }
        if (v53) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v53);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v7);
  }

  return result;
}

- (id)objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 context:(id)a6
{
  id v6 = [(MPMediaLibraryEntityTranslator *)self _objectForPropertySet:a3 entityClass:a4 propertyCache:a5 baseTranslator:self prependKeyPath:MEMORY[0x1E4F1CBF0] context:a6];

  return v6;
}

- (id)_objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 baseTranslator:(id)a6 prependKeyPath:(id)a7 context:(id)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (*((void *)a5 + 19) + *((void *)a5 + 24) + *((void *)a5 + 14) + *((void *)a5 + 9) + *((void *)a5 + 4))
  {
    id v20 = [v17 arrayByAddingObject:@"_default"];
    id v21 = [v16 _valueForKeyPath:v20 forPropertyCache:a5 context:v18];

    id v22 = objc_alloc([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke;
    v24[3] = &unk_1E57F9490;
    id v25 = v15;
    uint64_t v26 = self;
    SEL v30 = a2;
    id v27 = v16;
    id v28 = v17;
    long long v31 = a5;
    id v29 = v18;
    uint64_t v32 = a4;
    id v19 = (void *)[v22 initWithIdentifiers:v21 block:v24];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)identifiersForPropertyCache:(const void *)a3 context:(id)a4
{
  id v4 = [(MPMediaLibraryEntityTranslator *)self _valueForKeyPath:&unk_1EE6EE2E8 forPropertyCache:a3 context:a4];

  return v4;
}

- (void)mapIdentifierMLProperties:(const void *)a3 identifierCreationBlock:(id)a4
{
  id v6 = a4;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)char v12 = 0u;
  int v13 = 1065353216;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke;
  v9[3] = &unk_1E57F9330;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [(MPMediaLibraryEntityTranslator *)self mapPropertyKey:@"_default" withPropertiesToFetch:a3 propertiesToSort:__p sortTransformer:0 valueTransformer:v9];
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v12[0]);
  uint64_t v8 = __p[0];
  __p[0] = 0;
  if (v8) {
    operator delete(v8);
  }
}

+ (id)translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4
{
  return (id)[a1 _translatorForMPModelClass:a3 mlcoreEntityClass:a4 create:1 transient:0];
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 usingForeignPropertyBase:(void *)a5
{
}

- (void)setEntityQueryBlock:(id)a3
{
}

- (void)setAllowedItemPredicatesBlock:(id)a3
{
}

+ (id)translatorForTransientMPModelClass:(Class)a3
{
  return (id)[a1 _translatorForMPModelClass:a3 mlcoreEntityClass:0 create:1 transient:1];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entityQueryBlock, 0);
  objc_storeStrong(&self->_allowedItemPredicatesBlock, 0);
  objc_storeStrong((id *)&self->_MPModelClass, 0);
  objc_storeStrong((id *)&self->_relationshipsToTranslators, 0);

  objc_storeStrong((id *)&self->_propertiesToTranslators, 0);
}

- (id)entityQueryBlock
{
  return self->_entityQueryBlock;
}

- (id)allowedItemPredicatesBlock
{
  return self->_allowedItemPredicatesBlock;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (unordered_map<std::string,)propertiesToFetchForPropertyKey:()std:()std:(std:(mlcore:(MPMediaLibraryEntityTranslator *)self :(SEL)a3 ModelPropertyBase *>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_propertiesToTranslators objectForKeyedSubscript:v7];
  uint64_t v9 = v8;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    char v12 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v11 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 474, @"Property mapping missing for %@:%@", v12, v7 object file lineNumber description];

LABEL_9:
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v14 = NSStringFromClass([(MPMediaLibraryEntityTranslator *)self MPModelClass]);
    [v13 handleFailureInMethod:a3, self, @"MPMediaLibraryEntityTranslator.mm", 475, @"Property translator mapping missing for %@:%@", v14, v7 object file lineNumber description];

    goto LABEL_5;
  }
  [v8 propertiesToFetchMap];
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (!v15) {
    goto LABEL_9;
  }
LABEL_5:
  [v9 propertiesToFetchMap];
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)retstr, v15);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  return result;
}

- (Class)classForRelationshipKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_relationshipsToTranslators objectForKeyedSubscript:a3];
  id v4 = [v3 relationshipModelClass];

  return (Class)v4;
}

- (shared_ptr<mlcore::PropertiesQuery>)propertiesQueryForPropertySet:(id)a3 scopedContainers:(id)a4 allowedItemIdentifiers:(id)a5 view:(id)a6
{
  void (**allowedItemPredicatesBlock)(_OWORD *__return_ptr);
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void *entityClass;
  PropertiesQuery *v34;
  __shared_weak_count *v35;
  char *v36;
  char *v37;
  void v38[5];
  void *__p;
  void *v40;
  void v41[3];
  _OWORD v42[2];
  long long v43;
  char *v44;
  char *v45;
  void *v46;
  shared_ptr<mlcore::PropertiesQuery> result;

  id v11 = v6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  v38[0] = 0;
  if ([v14 count])
  {
    allowedItemPredicatesBlocuint64_t k = (void (**)(_OWORD *__return_ptr))self->_allowedItemPredicatesBlock;
    if (allowedItemPredicatesBlock)
    {
      allowedItemPredicatesBlock[2](v42);
      id v17 = *(uint64_t **)&v42[0];
      if ((uint64_t)(*((void *)&v42[0] + 1) - *(void *)&v42[0]) >= 1)
      {
        id v18 = (uint64_t)(*((void *)&v42[0] + 1) - *(void *)&v42[0]) >> 4;
        id v19 = v37;
        if (v18 <= (uint64_t)(v38[0] - (void)v37) >> 4)
        {
          if (v18 <= 0)
          {
            id v25 = *(void *)&v42[0] + 16 * v18;
            std::vector<std::shared_ptr<mlcore::Predicate>>::__move_range((uint64_t)&v36, (uint64_t)v37, (unint64_t)v37, &v37[16 * v18]);
            for (; v17 != (uint64_t *)v25; v19 += 16)
            {
              id v27 = *v17;
              uint64_t v26 = v17[1];
              if (v26) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 8), 1uLL, memory_order_relaxed);
              }
              id v28 = (std::__shared_weak_count *)*((void *)v19 + 1);
              *(void *)id v19 = v27;
              *((void *)v19 + 1) = v26;
              if (v28) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v28);
              }
              v17 += 2;
            }
          }
          else
          {
            uint64_t v37 = (char *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)v38, *(void **)&v42[0], *((void **)&v42[0] + 1), v37);
          }
        }
        else
        {
          id v20 = (v37 - v36) >> 4;
          if ((unint64_t)(v20 + v18) >> 60) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          id v21 = (uint64_t)(v38[0] - (void)v36) >> 3;
          if (v21 <= v20 + v18) {
            id v21 = v20 + v18;
          }
          id v22 = 0xFFFFFFFFFFFFFFFLL;
          if (v38[0] - (void)v36 < 0x7FFFFFFFFFFFFFF0uLL) {
            id v22 = v21;
          }
          v46 = v38;
          if (v22)
          {
            uint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v22);
          }
          else
          {
            uint64_t v23 = 0;
            long long v24 = 0;
          }
          id v29 = &v23[16 * v20];
          *(void *)&v43 = v23;
          *((void *)&v43 + 1) = v29;
          unint64_t v45 = &v23[16 * v24];
          SEL v30 = &v29[16 * v18];
          do
          {
            *(void *)id v29 = *v17;
            long long v31 = v17[1];
            *((void *)v29 + 1) = v31;
            if (v31) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 8), 1uLL, memory_order_relaxed);
            }
            v29 += 16;
            v17 += 2;
          }
          while (v29 != v30);
          uint64_t v44 = v30;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v36, &v43, v19);
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v43);
        }
      }
      *(void *)&v43 = v42;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
    }
  }
  memset(v41, 0, sizeof(v41));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v41, v36, v37, (v37 - v36) >> 4);
  mlcore::CreateAndPredicate();
  uint64_t v32 = (char *)operator new(0x80uLL);
  *(_OWORD *)(v32 + 8) = 0u;
  *(void *)uint64_t v32 = &unk_1EE6732B0;
  entityClass = self->_entityClass;
  v43 = v42[0];
  v42[0] = 0u;
  MEMORY[0x19971BFD0](v32 + 24, entityClass, &v43);
  if (*((void *)&v43 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v43 + 1));
  }
  void *v11 = v32 + 24;
  v11[1] = v32;
  if (*((void *)&v42[0] + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v42[0] + 1));
  }
  *(void *)&v43 = v41;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
  [(MPMediaLibraryEntityTranslator *)self MLCorePropertiesForPropertySet:v12];
  mlcore::PropertiesQuery::setPropertiesToFetch();
  if (__p)
  {
    uint64_t v40 = __p;
    operator delete(__p);
  }
  *(void *)&v43 = &v36;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);

  result.var1 = v35;
  result.var0 = v34;
  return result;
}

void __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v24 = *(void *)(a1 + 72);
    id v25 = *(void **)(a1 + 32);
    uint64_t v26 = NSStringFromClass((Class)[v25 MPModelClass]);
    [v23 handleFailureInMethod:v24, v25, @"MPMediaLibraryEntityTranslator.mm", 320, @"Relationship mapping missing for %@:%@", v26, v5 object file lineNumber description];
  }
  uint64_t v8 = [v7 entityTranslator];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 MLCorePropertiesForPropertySet:v6];
    id v10 = v40;
    uint64_t v11 = v41;
  }
  else
  {
    uint64_t v11 = 0;
    id v10 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
  }
  id v38 = 0;
  uint64_t v39 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v10, v11, (v11 - (uint64_t)v10) >> 3);
  [v9 entityClass];
  mlcore::MultiEntityQuery::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    id v38 = __p;
    operator delete(__p);
  }
  id v12 = (void *)[*(id *)(a1 + 40) copy];
  id v13 = v12;
  if (v12)
  {
    [v12 mlCoreView];
    id v15 = v35;
    id v14 = v36;
    if (v36)
    {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
      char v16 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v15 = 0;
    id v14 = 0;
    unint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  char v16 = 1;
LABEL_13:

  id v17 = [*(id *)(a1 + 56) relationshipKinds];
  id v18 = [v17 objectForKeyedSubscript:v5];
  [*(id *)(a1 + 48) setModelKind:v18];

  uint64_t v19 = [v9 entityQueryBlock];
  id v20 = (void *)v19;
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v33 = v15;
  unint64_t v34 = v14;
  if ((v16 & 1) == 0) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(mlcore::Query **__return_ptr, uint64_t, uint64_t, mlcore::Query **))(v19 + 16))(&v35, v19, v21, &v33);
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }

  long long v31 = v15;
  uint64_t v32 = v14;
  if ((v16 & 1) == 0) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v9 entityClass];
  mlcore::MultiEntityQuery::setViewForEntityClass();
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  mlcore::Query::predicate(&v29, v35);
  uint64_t v22 = v29;
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (v22)
  {
    mlcore::Query::predicate(&v27, v35);
    [v9 entityClass];
    mlcore::MultiEntityQuery::setPredicateForEntityClass();
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  if ((v16 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v40)
  {
    uint64_t v41 = (uint64_t)v40;
    operator delete(v40);
  }
}

void __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  if (!v7)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v33 = *(void *)(a1 + 56);
    unint64_t v34 = *(void **)(a1 + 32);
    unint64_t v35 = NSStringFromClass((Class)[v34 MPModelClass]);
    [v32 handleFailureInMethod:v33, v34, @"MPMediaLibraryEntityTranslator.mm", 344, @"Relationship mapping missing for %@:%@", v35, v5 object file lineNumber description];

    id v7 = 0;
  }
  uint64_t v8 = [v7 entityTranslator];
  v52[0] = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", v6, objc_msgSend(*(id *)(a1 + 40), "ascending"));
  uint64_t v41 = (void *)v52[0];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  if (v8)
  {
    [v8 MLCoreSortDescriptorsForModelSortDescriptors:v9];
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
  }

  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
  uint64_t v12 = v49;
  if (v10 == v11)
  {
    uint64_t v13 = v50;
    if (v49 == v50)
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
    }
    else
    {
      uint64_t v37 = v7;
      id v39 = v5;
      uint64_t v14 = MEMORY[0x1E4F76A98] + 16;
      do
      {
        v47[0] = v14;
        uint64_t v15 = *(void *)(v12 + 8);
        int v48 = *(_DWORD *)(v12 + 16);
        v47[1] = v15;
        mlcore::SortDescriptor::ordering((mlcore::SortDescriptor *)v47);
        mlcore::MultiSortDescriptor::MultiSortDescriptor();
        char v16 = *(int64x2_t **)(*(void *)(a1 + 48) + 8);
        id v17 = v16 + 3;
        unint64_t v18 = v16[3].u64[1];
        if (v18 >= v16[4].i64[0])
        {
          uint64_t v19 = std::vector<mlcore::MultiSortDescriptor>::__push_back_slow_path<mlcore::MultiSortDescriptor const&>(v17, (uint64_t)&v44);
        }
        else
        {
          std::vector<mlcore::MultiSortDescriptor>::__construct_one_at_end[abi:ne180100]<mlcore::MultiSortDescriptor const&>((uint64_t)v17, (uint64_t)&v44);
          uint64_t v19 = v18 + 56;
        }
        v16[3].i64[1] = v19;
        mlcore::MultiSortDescriptor::MultiSortDescriptor();
        id v20 = *(int64x2_t **)(*(void *)(a1 + 48) + 8);
        uint64_t v21 = v20 + 3;
        unint64_t v22 = v20[3].u64[1];
        if (v22 >= v20[4].i64[0])
        {
          uint64_t v23 = std::vector<mlcore::MultiSortDescriptor>::__push_back_slow_path<mlcore::MultiSortDescriptor const&>(v21, (uint64_t)&v42);
        }
        else
        {
          std::vector<mlcore::MultiSortDescriptor>::__construct_one_at_end[abi:ne180100]<mlcore::MultiSortDescriptor const&>((uint64_t)v21, (uint64_t)&v42);
          uint64_t v23 = v22 + 56;
        }
        v20[3].i64[1] = v23;
        uint64_t v42 = MEMORY[0x1E4F76AA0] + 16;
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v43);
        uint64_t v44 = (void **)(MEMORY[0x1E4F76AA0] + 16);
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v45);
        v12 += 24;
      }
      while (v12 != v13);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
      uint64_t v12 = v49;
      id v5 = v39;
      id v7 = v37;
    }
  }
  uint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((v10 - v11) >> 3);
  uint64_t v25 = v50;
  if (v24 != 0xAAAAAAAAAAAAAAABLL * ((v50 - v12) >> 3) + 1)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPMediaLibraryEntityTranslator.mm" lineNumber:360 description:@"All relatedProperties must have the same number of core sort descriptors."];

    uint64_t v12 = v49;
    uint64_t v25 = v50;
  }
  if (v25 != v12)
  {
    id v38 = v6;
    id v40 = v5;
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    id v28 = (void **)(MEMORY[0x1E4F76A98] + 16);
    uint64_t v29 = 8;
    do
    {
      uint64_t v44 = v28;
      uint64_t v30 = *(void *)(v12 + v29);
      int v46 = *(_DWORD *)(v12 + v29 + 8);
      uint64_t v45 = v30;
      mlcore::SortDescriptor::property((mlcore::SortDescriptor *)&v44);
      [v8 entityClass];
      mlcore::MultiSortDescriptor::setPropertyForEntityClass();
      ++v27;
      uint64_t v12 = v49;
      v26 += 56;
      v29 += 24;
    }
    while (v27 < 0xAAAAAAAAAAAAAAABLL * ((v50 - v49) >> 3));
    id v6 = v38;
    id v5 = v40;
  }
  uint64_t v31 = [v8 entityClass];
  (*(void (**)(uint64_t))(*(void *)v31 + 112))(v31);
  [v8 entityClass];
  mlcore::MultiSortDescriptor::setPropertyForEntityClass();
  uint64_t v44 = (void **)&v49;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v44);
}

void __88__MPMediaLibraryEntityTranslator_mapPropertyKey_withPropertiesToFetch_valueTransformer___block_invoke(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  id v7 = a3;
  if (*(void *)(a2 + 24) != 1)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6], a1[4], @"MPMediaLibraryEntityTranslator.mm", 233, @"Sorting by %@ is ambiguous, please define sortTransformer.", a1[5] object file lineNumber description];
  }
  objc_msgSend(v7, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  mlcore::SortDescriptor::SortDescriptor();
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v8 = operator new(0x18uLL);
  a4[2] = v8 + 3;
  *uint64_t v8 = MEMORY[0x1E4F76A98] + 16;
  v8[1] = v10;
  *((_DWORD *)v8 + 4) = v11;
  *a4 = v8;
  a4[1] = v8 + 3;
}

@end