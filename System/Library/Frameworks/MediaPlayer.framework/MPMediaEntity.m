@interface MPMediaEntity
+ (BOOL)canFilterByProperty:(NSString *)property;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MIPMultiverseIdentifier)multiverseIdentifier;
- (MPMediaEntity)initWithCoder:(id)a3;
- (MPMediaEntity)initWithMultiverseIdentifier:(id)a3 library:(id)a4;
- (MPMediaEntityPersistentID)persistentID;
- (MPMediaItem)representativeItem;
- (MPMediaLibrary)mediaLibrary;
- (NSString)_tokenBinaryIdentifierAsString;
- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4;
- (id)genericModelObjectWithRequestedProperties:(id)a3;
- (id)valueForProperty:(NSString *)property;
- (id)valuesForProperties:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void *)block;
@end

@implementation MPMediaEntity

+ (BOOL)canFilterByProperty:(NSString *)property
{
  v3 = property;
  if ([(NSString *)v3 isEqualToString:@"persistentID"]
    || [(NSString *)v3 isEqualToString:@"entityRevision"]
    || [(NSString *)v3 isEqualToString:@"keepLocal"]
    || [(NSString *)v3 isEqualToString:@"keepLocalStatus"]
    || [(NSString *)v3 isEqualToString:@"keepLocalStatusReason"]
    || [(NSString *)v3 isEqualToString:@"keepLocalConstraints"])
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [(NSString *)v3 isEqualToString:@"fileSize"];
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(MPMediaEntity *)self valueForProperty:@"persistentID"],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = [v4 valueForProperty:@"persistentID"];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MPMediaEntity;
    unsigned __int8 v8 = [(MPMediaEntity *)&v10 isEqual:v4];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tokenBinaryIdentifierAsString, 0);

  objc_storeStrong((id *)&self->_multiverseIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)genericModelObjectWithRequestedProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MPModelGenericObject alloc];
  v6 = +[MPIdentifierSet emptyIdentifierSet];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__MPMediaEntity_NewMP__genericModelObjectWithRequestedProperties___block_invoke;
  v10[3] = &unk_1E57EFF48;
  id v7 = v4;
  id v11 = v7;
  v12 = self;
  unsigned __int8 v8 = [(MPModelObject *)v5 initWithIdentifiers:v6 block:v10];

  return v8;
}

void __66__MPMediaEntity_NewMP__genericModelObjectWithRequestedProperties___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) relationships];
  v6 = [v5 objectForKey:@"MPModelRelationshipGenericSong"];
  id v7 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  unsigned __int8 v8 = [*(id *)(a1 + 40) mediaLibrary];
  v9 = v8;
  if (!v8)
  {
    v2 = [MEMORY[0x1E4FB87B8] activeAccount];
    v9 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v2];
  }
  [(MPMediaLibraryEntityTranslationContext *)v7 setMediaLibrary:v9];
  if (!v8)
  {
  }
  objc_super v10 = [*(id *)(a1 + 40) mediaLibrary];
  id v11 = [v10 userIdentity];
  v12 = [v11 accountDSID];
  [(MPMediaLibraryEntityTranslationContext *)v7 setPersonID:v12];

  [(MPMediaLibraryEntityTranslationContext *)v7 setFilteringOptions:65540];
  v13 = [MPMediaLibraryView alloc];
  v14 = [(MPMediaLibraryEntityTranslationContext *)v7 mediaLibrary];
  v15 = [(MPMediaLibraryView *)v13 initWithLibrary:v14 filteringOptions:[(MPMediaLibraryEntityTranslationContext *)v7 filteringOptions]];

  if (v15)
  {
    [(MPMediaLibraryView *)v15 mlCoreView];
    long long v16 = *(_OWORD *)v29;
  }
  else
  {
    long long v16 = 0uLL;
  }
  long long v139 = v16;
  mlcore::EntityCache::EntityCache();
  if (*((void *)&v139 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v139 + 1));
  }
  if (!v6) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([*(id *)(a1 + 40) mediaType] & 1) == 0)
  {
    [v4 setSong:0];
LABEL_14:
    char v17 = 0;
    goto LABEL_15;
  }
  v20 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
  [*(id *)(a1 + 40) persistentID];
  if (v20)
  {
    [v20 MLCorePropertiesForPropertySet:v6];
  }
  else
  {
    v137 = 0;
    __p = 0;
    uint64_t v138 = 0;
  }
  [v20 entityClass];
  mlcore::EntityCache::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v137 = __p;
    operator delete(__p);
  }
  [v20 entityClass];
  uint64_t v124 = 1065353216;
  *(_OWORD *)&v126[8] = 0u;
  *(_OWORD *)&v131[8] = 0u;
  uint64_t v129 = 1065353216;
  long long v123 = 0u;
  long long v122 = 0u;
  long long v125 = 0u;
  *(_OWORD *)v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  *(_DWORD *)&v126[16] = 1065353216;
  *(_OWORD *)v131 = 0u;
  long long v130 = 0u;
  *(_DWORD *)&v131[16] = 1065353216;
  long long v133 = 0u;
  long long v132 = 0u;
  uint64_t v134 = 1065353216;
  uint64_t v121 = MEMORY[0x1E4F76A90] + 16;
  uint64_t v135 = MEMORY[0x1E4F76A90] + 56;
  mlcore::EntityCache::entityForClassAndPersistentID();
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v121);
  +[MPMediaLibrary logDatabaseAccess];
  [v4 setSong:0];

  char v17 = 1;
LABEL_15:
  v18 = [v5 objectForKey:@"MPModelRelationshipGenericPlaylist"];

  if (v18)
  {
    if ((v17 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [v4 setPlaylist:0];
    }
    else
    {
      v19 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      [*(id *)(a1 + 40) persistentID];
      if (v19)
      {
        [v19 MLCorePropertiesForPropertySet:v18];
      }
      else
      {
        v119 = 0;
        v118 = 0;
        uint64_t v120 = 0;
      }
      [v19 entityClass];
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v118)
      {
        v119 = v118;
        operator delete(v118);
      }
      [v19 entityClass];
      uint64_t v106 = 1065353216;
      *(_OWORD *)&v108[8] = 0u;
      *(_OWORD *)&v113[8] = 0u;
      uint64_t v111 = 1065353216;
      long long v105 = 0u;
      long long v104 = 0u;
      long long v107 = 0u;
      *(_OWORD *)v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      *(_DWORD *)&v108[16] = 1065353216;
      *(_OWORD *)v113 = 0u;
      long long v112 = 0u;
      *(_DWORD *)&v113[16] = 1065353216;
      long long v115 = 0u;
      long long v114 = 0u;
      uint64_t v116 = 1065353216;
      uint64_t v103 = MEMORY[0x1E4F76A90] + 16;
      uint64_t v117 = MEMORY[0x1E4F76A90] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v103);
      +[MPMediaLibrary logDatabaseAccess];
      [v4 setPlaylist:0];

      char v17 = 1;
    }
  }
  v21 = [v5 objectForKey:@"MPModelRelationshipGenericAlbum"];

  if (v21)
  {
    if ((v17 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [*(id *)(a1 + 40) groupingType] == 1)
    {
      v22 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      [*(id *)(a1 + 40) persistentID];
      if (v22)
      {
        [v22 MLCorePropertiesForPropertySet:v21];
      }
      else
      {
        v101 = 0;
        v100 = 0;
        uint64_t v102 = 0;
      }
      [v22 entityClass];
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v100)
      {
        v101 = v100;
        operator delete(v100);
      }
      [v22 entityClass];
      uint64_t v88 = 1065353216;
      *(_OWORD *)&v90[8] = 0u;
      *(_OWORD *)&v95[8] = 0u;
      uint64_t v93 = 1065353216;
      long long v87 = 0u;
      long long v86 = 0u;
      long long v89 = 0u;
      *(_OWORD *)v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      *(_DWORD *)&v90[16] = 1065353216;
      long long v94 = 0u;
      *(_OWORD *)v95 = 0u;
      *(_DWORD *)&v95[16] = 1065353216;
      long long v97 = 0u;
      long long v96 = 0u;
      uint64_t v98 = 1065353216;
      uint64_t v85 = MEMORY[0x1E4F76A90] + 16;
      uint64_t v99 = MEMORY[0x1E4F76A90] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v85);
      +[MPMediaLibrary logDatabaseAccess];
      [v4 setAlbum:0];

      char v17 = 1;
    }
    else
    {
      [v4 setAlbum:0];
    }
  }
  v23 = [v5 objectForKey:@"MPModelRelationshipGenericArtist"];

  if (v23)
  {
    if ((v17 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [*(id *)(a1 + 40) groupingType] == 2)
    {
      v24 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      [*(id *)(a1 + 40) persistentID];
      if (v24)
      {
        [v24 MLCorePropertiesForPropertySet:v23];
      }
      else
      {
        v83 = 0;
        v82 = 0;
        uint64_t v84 = 0;
      }
      [v24 entityClass];
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v82)
      {
        v83 = v82;
        operator delete(v82);
      }
      [v24 entityClass];
      uint64_t v70 = 1065353216;
      *(_OWORD *)&v72[8] = 0u;
      *(_OWORD *)&v77[8] = 0u;
      uint64_t v75 = 1065353216;
      long long v69 = 0u;
      long long v68 = 0u;
      long long v71 = 0u;
      *(_OWORD *)v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      *(_DWORD *)&v72[16] = 1065353216;
      long long v76 = 0u;
      *(_OWORD *)v77 = 0u;
      *(_DWORD *)&v77[16] = 1065353216;
      long long v79 = 0u;
      long long v78 = 0u;
      uint64_t v80 = 1065353216;
      uint64_t v67 = MEMORY[0x1E4F76A90] + 16;
      uint64_t v81 = MEMORY[0x1E4F76A90] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v67);
      +[MPMediaLibrary logDatabaseAccess];
      [v4 setArtist:0];

      char v17 = 1;
    }
    else
    {
      [v4 setArtist:0];
    }
  }
  v25 = [v5 objectForKey:@"MPModelRelationshipGenericTVEpisode"];

  if (v25)
  {
    if ((v17 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [*(id *)(a1 + 40) mediaType] == 512)
    {
      v26 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      [*(id *)(a1 + 40) persistentID];
      if (v26)
      {
        [v26 MLCorePropertiesForPropertySet:v25];
      }
      else
      {
        v64 = 0;
        v65 = 0;
        uint64_t v66 = 0;
      }
      [v26 entityClass];
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v64)
      {
        v65 = v64;
        operator delete(v64);
      }
      [v26 entityClass];
      uint64_t v52 = 1065353216;
      *(_OWORD *)&v54[8] = 0u;
      *(_OWORD *)&v59[8] = 0u;
      uint64_t v57 = 1065353216;
      long long v51 = 0u;
      long long v50 = 0u;
      long long v53 = 0u;
      *(_OWORD *)v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      *(_DWORD *)&v54[16] = 1065353216;
      long long v58 = 0u;
      *(_OWORD *)v59 = 0u;
      *(_DWORD *)&v59[16] = 1065353216;
      long long v61 = 0u;
      long long v60 = 0u;
      uint64_t v62 = 1065353216;
      uint64_t v49 = MEMORY[0x1E4F76A90] + 16;
      uint64_t v63 = MEMORY[0x1E4F76A90] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v49);
      +[MPMediaLibrary logDatabaseAccess];
      [v4 setTvEpisode:0];

      char v17 = 1;
    }
    else
    {
      [v4 setTvEpisode:0];
    }
  }
  v27 = [v5 objectForKey:@"MPModelRelationshipGenericMovie"];

  if (v27)
  {
    if ((v17 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [*(id *)(a1 + 40) mediaType] == 256)
    {
      v28 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
      [*(id *)(a1 + 40) persistentID];
      if (v28)
      {
        [v28 MLCorePropertiesForPropertySet:v27];
      }
      else
      {
        v46 = 0;
        v47 = 0;
        uint64_t v48 = 0;
      }
      [v28 entityClass];
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v46)
      {
        v47 = v46;
        operator delete(v46);
      }
      [v28 entityClass];
      *(_OWORD *)&v41[8] = 0u;
      uint64_t v39 = 1065353216;
      long long v32 = 0u;
      long long v31 = 0u;
      uint64_t v33 = 1065353216;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v36 = 1065353216;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v40 = 0u;
      *(_OWORD *)v41 = 0u;
      *(_DWORD *)&v41[16] = 1065353216;
      long long v43 = 0u;
      long long v42 = 0u;
      uint64_t v44 = 1065353216;
      uint64_t v30 = MEMORY[0x1E4F76A90] + 16;
      uint64_t v45 = MEMORY[0x1E4F76A90] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v30);
      +[MPMediaLibrary logDatabaseAccess];
      [v4 setMovie:0];
    }
    else
    {
      [v4 setMovie:0];
    }
  }
  MEMORY[0x19971BD20](v140);
}

- (NSString)_tokenBinaryIdentifierAsString
{
  return self->__tokenBinaryIdentifierAsString;
}

- (MIPMultiverseIdentifier)multiverseIdentifier
{
  return self->_multiverseIdentifier;
}

- (MPMediaLibrary)mediaLibrary
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaEntity.m" lineNumber:128 description:@"subclass must implement"];

  return 0;
}

- (unint64_t)hash
{
  v3 = [(MPMediaEntity *)self valueForProperty:@"persistentID"];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 unsignedLongLongValue];
    unint64_t v6 = v5 ^ HIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaEntity;
    unint64_t v6 = [(MPMediaEntity *)&v8 hash];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"MPMediaEntity.m" lineNumber:92 description:@"subclass must implement"];
}

- (MPMediaEntity)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MPMediaEntity.m" lineNumber:87 description:@"subclass must implement"];

  return 0;
}

- (MPMediaEntity)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"MPMediaEntity.m" lineNumber:82 description:@"subclass must implement"];

  return 0;
}

- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void *)block
{
  id v6 = block;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MPMediaEntity_enumerateValuesForProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E57F21E8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(NSSet *)properties enumerateObjectsUsingBlock:v8];
}

void __57__MPMediaEntity_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForProperty:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4
{
  return 0;
}

- (id)valuesForProperties:(id)a3
{
  return 0;
}

- (id)valueForProperty:(NSString *)property
{
  return 0;
}

- (MPMediaItem)representativeItem
{
  return 0;
}

- (MPMediaEntityPersistentID)persistentID
{
  v2 = [(MPMediaEntity *)self valueForProperty:@"persistentID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

@end