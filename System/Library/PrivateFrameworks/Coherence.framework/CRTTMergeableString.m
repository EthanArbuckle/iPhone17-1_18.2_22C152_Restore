@interface CRTTMergeableString
- (BOOL)canDeltaMerge:(id)a3;
- (BOOL)canMergeString:(id)a3;
- (BOOL)deltaMerge:(id)a3;
- (BOOL)graphIsEqual:(id)a3;
- (BOOL)hasAllIDsIn:(void *)a3;
- (BOOL)hasDeltaTo:(id)a3 compareElements:(id)a4;
- (BOOL)isEmptyCRDT;
- (BOOL)isEqual:(id)a3;
- (BOOL)needToFinalizeTimestamps;
- (BOOL)saveSubstrings:(void *)a3 encoder:(id)a4 error:(id *)a5;
- (BOOL)saveToEncoder:(id)a3 error:(id *)a4;
- (CRTTMergeableString)initWithDecoder:(id)a3 error:(id *)a4;
- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4;
- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4 createInitialNodes:(BOOL)a5;
- (NSObject)context;
- (NSUUID)uuid;
- (ObjCReplica)addedByReplica;
- (ObjCVersion)addedByVersion;
- (ObjCVersion)version;
- (TopoReplica)replica;
- (id).cxx_construct;
- (id)attributedString;
- (id)characterRangesForIDRange:(TopoIDRange *)a3;
- (id)characterRangesForMergeableRange:(id)a3;
- (id)characterRangesForSelection:(id)a3;
- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4;
- (id)copyRenamedIfAvailable:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dotDescription:(unint64_t)a3;
- (id)fullyRenamed:(id)a3;
- (id)mergeableIndexForCharacterIndex:(int64_t)a3 affinity:(unint64_t)a4;
- (id)objcReplica;
- (id)renamed:(id)a3;
- (id)renamedIfAvailable;
- (id)replicaUUIDForCharacterAtIndex:(unint64_t)a3;
- (id)selectionForCharacterRanges:(id)a3;
- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4;
- (id)temporaryConcurrentNames;
- (id)temporaryNamesExcludingSelf:(BOOL)a3;
- (id)undoCommandToChangeFrom:(id)a3 unedited:(id)a4;
- (id)undoCommandToChangeTo:(id)a3 unedited:(id)a4;
- (int64_t)addedByLocalCounter;
- (int64_t)localCounter;
- (int64_t)renameGeneration;
- (int64_t)substringCount;
- (unint64_t)_characterIndexForIndex:(id)a3;
- (unint64_t)characterIndexForIndex:(id)a3;
- (unint64_t)length;
- (unint64_t)mergeWithString:(id)a3 optimized:(BOOL)a4;
- (void)_apply:(id)a3 alwaysApply:(BOOL)a4;
- (void)_updateCache;
- (void)addNewAddedByFor:(void *)a3;
- (void)apply:(id)a3 skipRetain:(BOOL)a4 alwaysApply:(BOOL)a5;
- (void)applyRenamesAndRetainOrRelease:(id)a3 context:(id)a4;
- (void)applyTimestampRenames:(id)a3;
- (void)beginEditing;
- (void)coalesce;
- (void)compareTo:(id)a3 merge:(id)a4 add:(id)a5;
- (void)dealloc;
- (void)deleteAllSubstrings;
- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4;
- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4;
- (void)deltaTo:(id)a3 edited:(id)a4 unedited:(id)a5;
- (void)endEditing;
- (void)endNode;
- (void)enumerateIndexes:(id)a3;
- (void)enumerateSubstrings:(id)a3;
- (void)finalizeTimestamps:(id)a3;
- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4;
- (void)getSubstringBeforeTopoID:(TopoID *)a3;
- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4;
- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4;
- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5;
- (void)insertAtIndex:(int64_t)a3 length:(int64_t)a4 getStorage:(id)a5;
- (void)insertStorageLength:(int64_t)a3 after:(void *)a4 before:(void *)a5 getStorage:(id)a6;
- (void)invalidateCache;
- (void)orderedSubstrings;
- (void)removeAll;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceStorageInRange:(_NSRange)a3 withStorage:(id)a4;
- (void)setAddedByLocalCounter:(int64_t)a3;
- (void)setAddedByVersion:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setContext:(id)a3;
- (void)setEndNode:(void *)a3;
- (void)setLocalCounter:(int64_t)a3;
- (void)setRenameGeneration:(int64_t)a3;
- (void)setStartNode:(void *)a3;
- (void)setVersion:(id)a3;
- (void)sortSplitNodes;
- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4;
- (void)startNode;
- (void)stealReplicaFrom:(id)a3;
- (void)traverseUnordered:(id)a3;
- (void)undeleteSubstrings:(void *)a3;
- (void)updateAttributedStringAfterMerge;
- (void)updateSubstringIndexes;
- (void)useRenameIfAvailable;
@end

@implementation CRTTMergeableString

- (BOOL)saveToEncoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(CRTTMergeableString *)self saveSubstrings:[(CRTTMergeableString *)self orderedSubstrings] encoder:v6 error:a4];

  return (char)a4;
}

- (id).cxx_construct
{
  self->_orderedSubstrings.__begin_ = 0;
  self->_orderedSubstrings.__end_ = 0;
  self->_orderedSubstrings.__end_cap_.__value_ = 0;
  self->_replica.index = 0;
  uuid_clear(self->_replica.uuid);
  return self;
}

- (id)fullyRenamed:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = v5;
  id v7 = v6[6];
  v8 = v6;
  if (v7)
  {
    v8 = (id *)v7;
  }
  v9 = [v8 temporaryNamesExcludingSelf:0];
  v10 = v8;
  v11 = v10;
  if (([v9 isEmpty] & 1) == 0)
  {
    v12 = (void *)[v10 copyRenamedIfAvailable:0];

    v13 = [v6 version];
    v14 = +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v9, [v13 maxCounter], v4);

    [v12 apply:v14 skipRetain:1 alwaysApply:0];
    +[CRGlobalContextObjC releaseObjCSequence:v9];

    v11 = (id *)v12;
  }
  if (v11 != v6) {
    objc_storeStrong(v6 + 6, v11);
  }
  [v11 setContext:v4];

  objc_sync_exit(v6);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedByReplica, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_addedByVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_renamedString, 0);
  begin = self->_orderedSubstrings.__begin_;
  if (begin)
  {
    self->_orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
}

- (BOOL)saveSubstrings:(void *)a3 encoder:(id)a4 error:(id *)a5
{
  v23 = a5;
  id v6 = a4;
  memset(v28, 0, sizeof(v28));
  int v29 = 1065353216;
  id v7 = *(uint64_t **)a3;
  v8 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    int v9 = 0;
    do
    {
      uint64_t v27 = *v7;
      v30 = &v27;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v28, &v27, (uint64_t)&std::piecewise_construct, &v30)+ 6) = v9++;
      ++v7;
    }
    while (v7 != v8);
    v10 = *(uint64_t **)a3;
    v26 = (uint64_t *)*((void *)a3 + 1);
    if (*(uint64_t **)a3 != v26)
    {
      do
      {
        uint64_t v11 = *v10;
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*v10];
        [v6 setCharWithId:v12 clock:*(unsigned int *)(v11 + 20)];
        [v6 setWithLength:*(unsigned int *)(v11 + 24)];
        uint64_t v13 = *(void *)(v11 + 32);
        uint64_t v14 = *(void *)(v11 + 40);
        while (v13 != v14)
        {
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v13];
          [v6 addAddedById:v15 clock:*(unsigned int *)(v13 + 20)];

          v13 += 24;
        }
        v17 = *(uint64_t **)(v11 + 56);
        v16 = *(uint64_t **)(v11 + 64);
        while (v17 != v16)
        {
          uint64_t v27 = 0;
          uint64_t v27 = *v17;
          v30 = &v27;
          objc_msgSend(v6, "addChildWithId:", *((unsigned int *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v28, &v27, (uint64_t)&std::piecewise_construct, &v30)+ 6), v23);
          ++v17;
        }
        [v6 finishSubstring];

        ++v10;
      }
      while (v10 != v26);
    }
  }
  v18 = [(CRTTMergeableString *)self attributedString];
  [v6 setStorage:v18 error:v24];

  if (v24 && *v24)
  {
    BOOL v19 = 0;
  }
  else
  {
    v20 = [(CRTTMergeableString *)self version];
    [v6 setWithVersion:v20];

    v21 = [(CRTTMergeableString *)self addedByVersion];
    [v6 setWithAddedByVersion:v21];

    BOOL v19 = 1;
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v28);

  return v19;
}

- (id)attributedString
{
  return self->_attributedString;
}

void *__42__CRTTMergeableString_deleteAllSubstrings__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __35__CRTTMergeableString__updateCache__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[2];
  unint64_t v5 = v3[3];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = v3[1];
    uint64_t v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v5 - v7;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v3 + 3), v11);
    }
    else {
      v12 = 0;
    }
    uint64_t v13 = &v12[8 * v8];
    uint64_t v14 = &v12[8 * v11];
    *(void *)uint64_t v13 = a2;
    id v6 = v13 + 8;
    v16 = (char *)v3[1];
    v15 = (char *)v3[2];
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)v3[1];
    }
    v3[1] = v13;
    v3[2] = v6;
    v3[3] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *id v4 = a2;
    id v6 = v4 + 1;
  }
  v3[2] = v6;
}

- (void)dealloc
{
  uint64_t v3 = [(CRTTMergeableString *)self temporaryNamesExcludingSelf:0];
  +[CRGlobalContextObjC releaseObjCSequence:v3];

  [(CRTTMergeableString *)self deleteAllSubstrings];
  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableString;
  [(CRTTMergeableString *)&v4 dealloc];
}

- (id)temporaryNamesExcludingSelf:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21 = objc_alloc_init(ObjCRenameSequence);
  unint64_t v5 = objc_alloc_init(ObjCVersion);
  id v6 = [(CRTTMergeableString *)self orderedSubstrings];
  uint64_t v7 = *v6;
  v20 = v6[1];
  if (*v6 != v20)
  {
    do
    {
      uint64_t v8 = (unsigned __int8 *)*v7;
      int v9 = *((_DWORD *)*v7 + 4);
      if (v9 && (!v3 || v9 != self->_replica.index || uuid_compare(*v7, self->_replica.uuid)))
      {
        uint64_t v10 = TopoReplica::objc((TopoReplica *)v8);
        -[ObjCRenameSequence addWithReplica:range:](v21, "addWithReplica:range:", v10, *((unsigned int *)v8 + 5), *((unsigned int *)v8 + 6));
      }
      uint64_t v12 = *((void *)v8 + 4);
      uint64_t v11 = *((void *)v8 + 5);
      while (v12 != v11)
      {
        if (*(_DWORD *)(v12 + 16))
        {
          if (!v3
            || (TopoReplica::TopoReplica(&v22, self->_addedByReplica), *(_DWORD *)(v12 + 16) != v22.index)
            || uuid_compare((const unsigned __int8 *)v12, v22.uuid))
          {
            uint64_t v13 = TopoReplica::objc((TopoReplica *)v12);
            uint64_t v14 = *(unsigned int *)(v12 + 20);
            uint64_t v15 = *((unsigned int *)v8 + 6);
            -[ObjCRenameSequence addAddedByReplica:range:](v21, "addAddedByReplica:range:", v13, v14, v15);
            -[ObjCVersion insertWithRange:replica:](v5, "insertWithRange:replica:", v14, v15, v13);
          }
        }
        v12 += 24;
      }
      ++v7;
    }
    while (v7 != v20);
  }
  v16 = [(CRTTMergeableString *)self addedByVersion];
  if (v3)
  {
    [(CRTTMergeableString *)self replica];
    uint64_t v17 = TopoReplica::objc(&v22);
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = [v16 temporaryComponentsWithExcluding:v17];
  if (v3) {

  }
  [v18 subtract:v5];
  [(ObjCRenameSequence *)v21 addAddedByVersion:v18];

  return v21;
}

- (void)orderedSubstrings
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_cacheInvalid) {
    [(CRTTMergeableString *)v2 _updateCache];
  }
  objc_sync_exit(v2);

  return &v2->_orderedSubstrings;
}

- (void)deleteAllSubstrings
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x5812000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  memset(v13, 0, sizeof(v13));
  uint64_t v14 = 0;
  int v15 = 1065353216;
  startNode = self->_startNode;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CRTTMergeableString_deleteAllSubstrings__block_invoke;
  v7[3] = &unk_1E64C1740;
  v7[4] = &v8;
  traverseUnordered((uint64_t)startNode, v7);
  for (i = (void *)v9[8]; i; i = (void *)*i)
  {
    objc_super v4 = (void *)i[2];
    if (v4)
    {
      unint64_t v5 = (void *)v4[7];
      if (v5)
      {
        v4[8] = v5;
        operator delete(v5);
      }
      id v6 = (void *)v4[4];
      if (v6)
      {
        v4[5] = v6;
        operator delete(v6);
      }
      MEMORY[0x1C8781440](v4, 0x10A0C409FE6E197);
    }
  }
  _Block_object_dispose(&v8, 8);
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v13 + 8);
}

- (void)_updateCache
{
  p_orderedSubstrings = &self->_orderedSubstrings;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
  self->_cacheInvalid = 0;
  startNode = self->_startNode;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CRTTMergeableString__updateCache__block_invoke;
  v5[3] = &unk_1E64C17E0;
  v5[4] = self;
  traverseIterative((uint64_t)startNode, v5);
  if (((char *)self->_orderedSubstrings.__end_ - (char *)self->_orderedSubstrings.__begin_) >> 2 < (unint64_t)(self->_orderedSubstrings.__end_cap_.__value_ - self->_orderedSubstrings.__begin_)) {
    std::vector<TopoSubstring *>::shrink_to_fit((uint64_t)p_orderedSubstrings);
  }
}

- (CRTTMergeableString)initWithDecoder:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [(CRTTMergeableString *)self initWithStorage:0 uuid:v6 createInitialNodes:0];

  if (!v7) {
    goto LABEL_30;
  }
  uint64_t v8 = [v32 storageWithError:a4];
  [(CRTTMergeableString *)v7 setAttributedString:v8];

  int v9 = [(CRTTMergeableString *)v7 attributedString];

  if (v9)
  {
    uint64_t v10 = +[CRGlobalContextObjC objCRenames];
    -[CRTTMergeableString setRenameGeneration:](v7, "setRenameGeneration:", [v10 generation]);

    [(CRTTMergeableString *)v7 invalidateCache];
    __p = 0;
    v40 = 0;
    uint64_t v30 = [v32 substringCount];
    uint64_t v41 = 0;
    std::vector<TopoSubstring *>::reserve(&__p, v30);
    if (v30) {
      operator new();
    }
    uint64_t v11 = objc_msgSend(v32, "versionWithError:", a4, v30);
    [(CRTTMergeableString *)v7 setVersion:v11];

    uint64_t v12 = [v32 addedByVersionWithError:a4];
    [(CRTTMergeableString *)v7 setAddedByVersion:v12];

    uint64_t v13 = [(CRTTMergeableString *)v7 version];
    if (!v13
      || ([(CRTTMergeableString *)v7 addedByVersion],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v15 = v14 == 0,
          v14,
          v13,
          v15))
    {
      char v26 = 1;
      BOOL v25 = 1;
    }
    else
    {
      v16 = [(CRTTMergeableString *)v7 version];
      uint64_t v17 = [v16 sortedUUIDs];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v18);
            }
            TopoReplica v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v23 = [MEMORY[0x1E4F29128] CRTTZero];
            LOBYTE(v22) = [v22 isEqual:v23];

            if (v22)
            {

              uint64_t v33 = 0;
              uint64_t v34 = 0;
              goto LABEL_20;
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      uint64_t v33 = 0;
      uint64_t v34 = 0;
      v24 = [(CRTTMergeableString *)v7 attributedString];
      BOOL v25 = decodeSubstrings(v31, [v24 length], v32, (uint64_t *)&__p, &v34, &v33, (uint64_t)a4);

      if (!v34 || !v33)
      {
LABEL_20:
        NSLog(&cfstr_CorruptMergeab_2.isa);
        BOOL v25 = 0;
      }
      -[CRTTMergeableString setStartNode:](v7, "setStartNode:");
      [(CRTTMergeableString *)v7 setEndNode:v33];
      if (!v25) {
        [(CRTTMergeableString *)v7 setStartNode:0];
      }

      char v26 = 0;
    }
    if (__p)
    {
      v40 = __p;
      operator delete(__p);
    }
    if ((v26 & 1) == 0)
    {
      if (!v25)
      {
        v28 = 0;
LABEL_31:
        uint64_t v27 = v28;
        goto LABEL_32;
      }
LABEL_30:
      v28 = v7;
      goto LABEL_31;
    }
  }
  uint64_t v27 = 0;
LABEL_32:

  return v27;
}

- (ObjCVersion)version
{
  return self->_version;
}

- (ObjCVersion)addedByVersion
{
  return self->_addedByVersion;
}

- (void)setVersion:(id)a3
{
}

- (void)setStartNode:(void *)a3
{
  self->_startNode = a3;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (void)setEndNode:(void *)a3
{
  self->_endNode = a3;
}

- (void)setAttributedString:(id)a3
{
}

- (void)setAddedByVersion:(id)a3
{
}

- (void)invalidateCache
{
  self->_cacheInvalid = 1;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
}

- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4 createInitialNodes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  {
    -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:]::timestampMixUUID = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1B034831-9253-4675-A9D0-969AF8C447A3"];
  }
  v23.receiver = self;
  v23.super_class = (Class)CRTTMergeableString;
  uint64_t v11 = [(CRTTMergeableString *)&v23 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a4);
    id v13 = +[CRGlobalContextObjC newObjCReplicaFor:v12->_uuid];
    uint64_t v14 = [v13 uuid];
    TopoReplica::TopoReplica(&__src, v14, [v13 index]);
    v12->_replica = __src;

    BOOL v15 = -[NSUUID CRTTxorWith:](v12->_uuid, "CRTTxorWith:", -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:]::timestampMixUUID);
    v16 = +[CRGlobalContextObjC newObjCReplicaFor:v15];
    addedByReplica = v12->_addedByReplica;
    v12->_addedByReplica = v16;

    if (v5) {
      operator new();
    }
    id v18 = objc_alloc_init(ObjCVersion);
    version = v12->_version;
    v12->_version = v18;

    uint64_t v20 = objc_alloc_init(ObjCVersion);
    addedByVersion = v12->_addedByVersion;
    v12->_addedByVersion = v20;

    v12->_cacheInvalid = 1;
    objc_storeStrong(&v12->_attributedString, a3);
  }
  return v12;
}

- (void)setContext:(id)a3
{
}

- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4
{
  return [(CRTTMergeableString *)self initWithStorage:a3 uuid:a4 createInitialNodes:1];
}

- (void)stealReplicaFrom:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&replicaLock);
  unsigned int index = self->_replica.index;
  long long v6 = *(_OWORD *)self->_replica.uuid;
  unsigned int v7 = *((_DWORD *)v4 + 40);
  *(_OWORD *)self->_replica.uuid = *((_OWORD *)v4 + 9);
  self->_replica.unsigned int index = v7;
  *((_OWORD *)v4 + 9) = v6;
  *((_DWORD *)v4 + 40) = index;
  addedByReplica = self->_addedByReplica;
  self->_addedByReplica = 0;
  id v9 = (ObjCReplica *)*((void *)v4 + 13);
  *((void *)v4 + 13) = 0;
  id v10 = self->_addedByReplica;
  self->_addedByReplica = v9;

  uint64_t v11 = (void *)*((void *)v4 + 13);
  *((void *)v4 + 13) = addedByReplica;

  int64_t localCounter = self->_localCounter;
  self->_int64_t localCounter = *((void *)v4 + 12);
  *((void *)v4 + 12) = localCounter;
  int64_t addedByLocalCounter = self->_addedByLocalCounter;
  self->_int64_t addedByLocalCounter = *((void *)v4 + 14);
  *((void *)v4 + 14) = addedByLocalCounter;

  os_unfair_lock_unlock((os_unfair_lock_t)&replicaLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(CRTTMergeableString *)self copyRenamedIfAvailable:1];
}

- (id)copyRenamedIfAvailable:(BOOL)a3
{
  BOOL v5 = [(CRTTMergeableString *)self attributedString];
  if ([v5 length]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [(ObjCVersion *)self->_version isEmpty];
  }

  if (a3)
  {
    unsigned int v7 = [(CRTTMergeableString *)self renamedIfAvailable];
  }
  else
  {
    unsigned int v7 = self;
  }
  uint64_t v19 = v7;
  uint64_t v8 = [CRTTMergeableString alloc];
  id v9 = [(CRTTMergeableString *)v19 attributedString];
  id v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = [(CRTTMergeableString *)v19 uuid];
  uint64_t v12 = [(CRTTMergeableString *)v8 initWithStorage:v10 uuid:v11 createInitialNodes:v6];

  [(CRTTMergeableString *)v12 setRenameGeneration:[(CRTTMergeableString *)v19 renameGeneration]];
  if (!v6)
  {
    [(CRTTMergeableString *)v12 stealReplicaFrom:self];
    id v13 = [(CRTTMergeableString *)v19 version];
    uint64_t v14 = (void *)[v13 copy];
    [(CRTTMergeableString *)v12 setVersion:v14];

    BOOL v15 = [(CRTTMergeableString *)v19 addedByVersion];
    v16 = (void *)[v15 copy];
    [(CRTTMergeableString *)v12 setAddedByVersion:v16];

    uint64_t v17 = [(CRTTMergeableString *)v12 orderedSubstrings];
    v17[1] = *v17;
    operator new();
  }

  return v12;
}

- (id)objcReplica
{
  return TopoReplica::objc(&self->_replica);
}

- (unint64_t)length
{
  v2 = [(CRTTMergeableString *)self attributedString];
  unint64_t v3 = [v2 length];

  return v3;
}

- (void)replaceStorageInRange:(_NSRange)a3 withStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  [(CRTTMergeableString *)self beginEditing];
  -[CRTTMergeableString removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
  uint64_t v8 = [v7 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CRTTMergeableString_replaceStorageInRange_withStorage___block_invoke;
  v10[3] = &unk_1E64C1768;
  id v9 = v7;
  id v11 = v9;
  [(CRTTMergeableString *)self insertAtIndex:location length:v8 getStorage:v10];
  [(CRTTMergeableString *)self endEditing];
}

id __57__CRTTMergeableString_replaceStorageInRange_withStorage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  if (length)
  {
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    BOOL v6 = operator new(0x10uLL);
    uint64_t v8 = v6 + 2;
    id v9 = v6 + 2;
    *BOOL v6 = location;
    v6[1] = length;
    __p = v6;
    -[CRTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &v10, location, length);
    [(CRTTMergeableString *)self deleteSubstrings:&v10 withCharacterRanges:&__p];
    if (__p)
    {
      uint64_t v8 = __p;
      operator delete(__p);
    }
    if (v10)
    {
      id v11 = v10;
      operator delete(v10);
    }
  }
}

- (void)removeAll
{
  if ([(CRTTMergeableString *)self length])
  {
    [(CRTTMergeableString *)self useRenameIfAvailable];
    unint64_t v3 = [(CRTTMergeableString *)self length];
    id v4 = operator new(0x10uLL);
    BOOL v6 = v4 + 2;
    id v7 = v4 + 2;
    *id v4 = 0;
    v4[1] = v3;
    __p = v4;
    [(CRTTMergeableString *)self deleteSubstrings:[(CRTTMergeableString *)self orderedSubstrings] withCharacterRanges:&__p];
    if (__p)
    {
      BOOL v6 = __p;
      operator delete(__p);
    }
  }
}

- (void)insertAtIndex:(int64_t)a3 length:(int64_t)a4 getStorage:(id)a5
{
  id v20 = a5;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  if (a4 >= 1)
  {
    if (a3)
    {
      if ([(CRTTMergeableString *)self length] == a3)
      {
        uint64_t v8 = [(CRTTMergeableString *)self orderedSubstrings];
        uint64_t v9 = ((uint64_t)(v8[1] - *v8) >> 3) - 2;
        do
        {
          uint64_t v10 = v9;
          startNode = *(void **)(*(void *)[(CRTTMergeableString *)self orderedSubstrings] + 8 * v9);
          if (*((void *)startNode + 5) != *((void *)startNode + 4)) {
            break;
          }
          uint64_t v9 = v10 - 1;
        }
        while (startNode != self->_startNode);
        uint64_t v12 = [(CRTTMergeableString *)self orderedSubstrings];
        uint64_t v13 = v10 + 1;
      }
      else
      {
        uint64_t v14 = CRTTBoundedCheckedCastNSUIntegerToUInt32(a3);
        for (uint64_t i = 0; ; ++i)
        {
          startNode = *(void **)(*(void *)[(CRTTMergeableString *)self orderedSubstrings] + 8 * i);
          if (*((void *)startNode + 5) != *((void *)startNode + 4))
          {
            unsigned int v16 = *((_DWORD *)startNode + 6);
            BOOL v17 = v14 >= v16;
            uint64_t v18 = v14 - v16;
            if (!v17)
            {
              uint64_t v19 = [(CRTTMergeableString *)self splitTopoSubstring:startNode atIndex:v14];
              [(CRTTMergeableString *)self invalidateCache];
              goto LABEL_17;
            }
            uint64_t v14 = v18;
            if (!v18) {
              break;
            }
          }
        }
        uint64_t v12 = [(CRTTMergeableString *)self orderedSubstrings];
        uint64_t v13 = i + 1;
      }
    }
    else
    {
      startNode = self->_startNode;
      uint64_t v12 = [(CRTTMergeableString *)self orderedSubstrings];
      uint64_t v13 = 1;
    }
    uint64_t v19 = *(void **)(*v12 + 8 * v13);
LABEL_17:
    [(CRTTMergeableString *)self insertStorageLength:a4 after:startNode before:v19 getStorage:v20];
  }
}

- (void)beginEditing
{
}

- (void)endEditing
{
  unint64_t editCount = self->_editCount;
  if (editCount)
  {
    unint64_t v3 = editCount - 1;
    self->_unint64_t editCount = v3;
    if (!v3) {
      [(CRTTMergeableString *)self coalesce];
    }
  }
}

- (id)replicaUUIDForCharacterAtIndex:(unint64_t)a3
{
  id v4 = [(CRTTMergeableString *)self orderedSubstrings];
  BOOL v5 = *v4;
  BOOL v6 = v4[1];
  if (*v4 != v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *v5;
      if (*(void *)(*v5 + 40) == *(void *)(*v5 + 32))
      {
        unint64_t v10 = v7;
      }
      else
      {
        unint64_t v9 = *(unsigned int *)(v8 + 24);
        unint64_t v10 = v7 + v9;
        BOOL v11 = a3 >= v7;
        unint64_t v12 = a3 - v7;
        if (v11 && v12 < v9)
        {
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
          goto LABEL_11;
        }
      }
      ++v5;
      unint64_t v7 = v10;
    }
    while (v5 != v6);
  }
  uint64_t v13 = 0;
LABEL_11:
  return v13;
}

- (id)selectionForCharacterRanges:(id)a3
{
  unint64_t v3 = [(CRTTMergeableString *)self selectionForCharacterRanges:a3 selectionAffinity:0];
  return v3;
}

- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47 = objc_alloc_init(CRTTMergeableStringSelection);
  [(CRTTMergeableStringSelection *)v47 setSelectionAffinity:a4];
  if (![v6 count]) {
    goto LABEL_47;
  }
  unint64_t v7 = [(CRTTMergeableString *)self orderedSubstrings];
  v45 = v7[1];
  v46 = *v7;
  if (*v7 == v45) {
    goto LABEL_47;
  }
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  BOOL v10 = 1;
  do
  {
    BOOL v11 = *v46;
    if (*((void *)*v46 + 5) == *((void *)*v46 + 4)) {
      goto LABEL_46;
    }
    while (1)
    {
      unint64_t v12 = [v6 objectAtIndexedSubscript:v9];
      uint64_t v13 = [v12 rangeValue];
      uint64_t v15 = v14;

      if (v10) {
        break;
      }
      int v20 = v13 + v15;
      if (v8 + (unint64_t)*((unsigned int *)v11 + 6) <= v13 + v15 - 1)
      {
        BOOL v10 = 0;
        goto LABEL_44;
      }
      long long v50 = *v11;
      int v21 = *((_DWORD *)v11 + 5);
      LODWORD(index) = *((_DWORD *)v11 + 4);
      uint64_t v22 = *(void *)([(CRTTMergeableStringSelection *)v47 selectionRanges] + 8);
      *(_OWORD *)(v22 - 24) = v50;
      *(_DWORD *)(v22 - 8) = index;
      *(_DWORD *)(v22 - 4) = v21 + v20 + ~v8;
      uint64_t v23 = 1;
      BOOL v10 = 1;
LABEL_40:
      v9 += v23;
      if (v9 >= [v6 count]) {
        goto LABEL_44;
      }
    }
    BOOL v10 = v15 == 0;
    if (v15 | a4) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v13 == 0;
    }
    uint64_t v17 = !v16;
    if (a4 || v8 != v13)
    {
      BOOL isStartNode = 0;
      BOOL isEndNode = 0;
      if (a4 == 1 && v8 == v13)
      {
        BOOL isEndNode = TopoSubstring::isEndNode((TopoSubstring *)v11);
        BOOL isStartNode = 0;
      }
    }
    else
    {
      BOOL isStartNode = TopoSubstring::isStartNode((TopoSubstring *)v11);
      BOOL isEndNode = 0;
    }
    unint64_t v24 = v13 - v17;
    if (v8 + (unint64_t)*((unsigned int *)v11 + 6) > v24 || isEndNode || isStartNode)
    {
      long long v52 = *v11;
      int v25 = *((_DWORD *)v11 + 5);
      int v53 = *((_DWORD *)v11 + 4);
      char v26 = [MEMORY[0x1E4F29128] CRTTZero];
      TopoReplica::TopoReplica(&v48, v26, 0);
      int v49 = 0;
      long long v50 = *(_OWORD *)v48.uuid;
      uint64_t index = v48.index;

      uint64_t v27 = [(CRTTMergeableStringSelection *)v47 selectionRanges];
      int v28 = v25 + v24 - v8;
      int v29 = (char *)v27[2];
      uint64_t v30 = (char *)v27[1];
      if (v30 >= v29)
      {
        unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (unsigned char *)*v27) >> 4);
        unint64_t v33 = v32 + 1;
        if (v32 + 1 > 0x555555555555555) {
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v29 - (unsigned char *)*v27) >> 4);
        if (2 * v34 > v33) {
          unint64_t v33 = 2 * v34;
        }
        if (v34 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v35 = 0x555555555555555;
        }
        else {
          unint64_t v35 = v33;
        }
        if (v35) {
          long long v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<minIdPathData,TopoSubstring *>>>((uint64_t)(v27 + 2), v35);
        }
        else {
          long long v36 = 0;
        }
        long long v37 = &v36[48 * v32];
        int v38 = v53;
        *(_OWORD *)long long v37 = v52;
        *((_DWORD *)v37 + 4) = v38;
        *((_DWORD *)v37 + 5) = v28;
        *(_OWORD *)(v37 + 24) = v50;
        *((void *)v37 + 5) = index;
        v40 = (char *)*v27;
        v39 = (char *)v27[1];
        uint64_t v41 = v37;
        if (v39 != *v27)
        {
          do
          {
            long long v42 = *((_OWORD *)v39 - 3);
            long long v43 = *((_OWORD *)v39 - 1);
            *((_OWORD *)v41 - 2) = *((_OWORD *)v39 - 2);
            *((_OWORD *)v41 - 1) = v43;
            *((_OWORD *)v41 - 3) = v42;
            v41 -= 48;
            v39 -= 48;
          }
          while (v39 != v40);
          v39 = (char *)*v27;
        }
        unsigned int v31 = v37 + 48;
        *uint64_t v27 = v41;
        v27[1] = v37 + 48;
        v27[2] = &v36[48 * v35];
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        *(_OWORD *)uint64_t v30 = v52;
        *((_DWORD *)v30 + 4) = v53;
        *((_DWORD *)v30 + 5) = v28;
        *(_OWORD *)(v30 + 24) = v50;
        *((void *)v30 + 5) = index;
        unsigned int v31 = v30 + 48;
      }
      uint64_t v23 = v15 == 0;
      v27[1] = v31;
      goto LABEL_40;
    }
    BOOL v10 = 1;
LABEL_44:
    if (v9 >= [v6 count]) {
      break;
    }
    v8 += *((unsigned int *)v11 + 6);
LABEL_46:
    ++v46;
  }
  while (v46 != v45);
LABEL_47:

  return v47;
}

- (id)characterRangesForSelection:(id)a3
{
  unint64_t v3 = [(CRTTMergeableString *)self characterRangesForSelection:a3 selectedSubstringsBlock:0];
  return v3;
}

- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(id, uint64_t, void, NSUInteger))a4;
  uint64_t v8 = (void *)[v6 selectionRanges];
  if (v8[1] == *v8)
  {
    uint64_t v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, 0);
    v39[0] = v30;
    id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

    goto LABEL_38;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v9 = [(CRTTMergeableString *)self orderedSubstrings];
  BOOL v10 = (void *)*v9;
  unint64_t v33 = (void *)v9[1];
  if ((void *)*v9 == v33) {
    goto LABEL_38;
  }
  NSUInteger v11 = 0;
  unint64_t v12 = 0;
  LOBYTE(v13) = 1;
  do
  {
    unint64_t v34 = v10;
    uint64_t v14 = *v10;
    do
    {
      uint64_t v15 = (long long *)(*(void *)[v6 selectionRanges] + 48 * v12);
      long long v16 = *v15;
      long long v17 = v15[2];
      long long v37 = v15[1];
      long long v38 = v17;
      *(_OWORD *)uu2 = v16;
      if ((v13 & 1) == 0)
      {
        if (!TopoIDRange::contains((TopoIDRange *)v14, (const TopoID *)((char *)&v37 + 8))) {
          break;
        }
        NSUInteger v22 = v11;
        if (*(void *)(v14 + 40) != *(void *)(v14 + 32)) {
          NSUInteger v22 = v11 + (HIDWORD(v38) - *(_DWORD *)(v14 + 20) + 1);
        }
        uint64_t v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v4, v22 - v4);
        [v35 addObject:v23];

        ++v12;
        if (v7) {
          v7[2](v7, v14, 0, v22 - v11);
        }
        goto LABEL_24;
      }
      if (!TopoIDRange::contains((TopoIDRange *)v14, (const TopoID *)uu2)
        && (*(void *)(v14 + 16) != (void)v37 || uuid_compare((const unsigned __int8 *)v14, uu2)))
      {
        break;
      }
      NSUInteger v4 = v11;
      if (*(void *)(v14 + 40) != *(void *)(v14 + 32)) {
        NSUInteger v4 = v11 + (DWORD1(v37) - *(_DWORD *)(v14 + 20));
      }
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)&v37 + 8];
      uint64_t v19 = [MEMORY[0x1E4F29128] CRTTZero];
      int v20 = [v18 isEqual:v19];
      if (HIDWORD(v38)) {
        int v13 = 0;
      }
      else {
        int v13 = v20;
      }

      if (!v13) {
        goto LABEL_25;
      }
      if (*(void *)(v14 + 40) != *(void *)(v14 + 32) && ![v6 selectionAffinity]) {
        v4 += !TopoSubstring::isStartNode((TopoSubstring *)v14);
      }
      int v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v4, 0);
      [v35 addObject:v21];

      ++v12;
LABEL_24:
      LOBYTE(v13) = 1;
LABEL_25:
      unint64_t v24 = (void *)[v6 selectionRanges];
    }
    while (v12 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24[1] - *v24) >> 4));
    int v25 = (void *)[v6 selectionRanges];
    if (v12 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25[1] - *v25) >> 4)) {
      break;
    }
    if (!((v7 == 0) | v13 & 1))
    {
      if (*(void *)(v14 + 40) == *(void *)(v14 + 32)) {
        NSUInteger v26 = 0;
      }
      else {
        NSUInteger v26 = *(unsigned int *)(v14 + 24);
      }
      NSUInteger v27 = *(unsigned int *)(v14 + 84);
      v42.NSUInteger length = [(CRTTMergeableString *)self length] - v4;
      v41.NSUInteger location = v27;
      v41.NSUInteger length = v26;
      v42.NSUInteger location = v4;
      NSRange v28 = NSIntersectionRange(v41, v42);
      v7[2](v7, v14, v28.location, v28.length);
    }
    uint64_t v29 = *(void *)(v14 + 40) == *(void *)(v14 + 32) ? 0 : *(unsigned int *)(v14 + 24);
    v11 += v29;
    BOOL v10 = v34 + 1;
  }
  while (v34 + 1 != v33);
LABEL_38:

  return v35;
}

- (id)characterRangesForMergeableRange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4) {
    [v4 range];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  uint64_t v6 = [v5 renameGeneration];
  if (v6 == [(CRTTMergeableString *)self renameGeneration])
  {
    v27[0] = *(_OWORD *)v33;
    *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)&v33[12];
    id v7 = [(CRTTMergeableString *)self characterRangesForIDRange:v27];
    goto LABEL_12;
  }
  uint64_t v8 = +[CRGlobalContextObjC objCRenames];
  unint64_t v9 = [(CRTTMergeableString *)self renamed:v8];
  if (!*(_DWORD *)&v33[16]) {
    goto LABEL_10;
  }
  BOOL v10 = TopoReplica::objc((TopoReplica *)v33);
  NSUInteger v11 = objc_msgSend(v8, "renamedWithRange:replica:", *(unsigned int *)&v33[20], *(unsigned int *)&v33[24], v10);
  if (![v11 rangeCount])
  {

LABEL_10:
    v28[0] = *(_OWORD *)v33;
    *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)&v33[12];
    id v7 = [v9 characterRangesForIDRange:v28];
    goto LABEL_11;
  }
  NSUInteger v22 = v10;
  int v21 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", *(unsigned int *)&v33[20], *(unsigned int *)&v33[24]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = *(unsigned int *)&v33[20];
  uint64_t v13 = *(unsigned int *)&v33[24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke;
  v23[3] = &unk_1E64C1790;
  id v15 = v21;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v17 = v9;
  id v26 = v17;
  objc_msgSend(v11, "enumerateRangesIn::", v14, v13, v23);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke_2;
  v29[3] = &unk_1E64C17B8;
  v32[0] = *(_OWORD *)v33;
  *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)&v33[12];
  id v18 = v16;
  id v30 = v18;
  id v31 = v17;
  [v15 enumerateRangesUsingBlock:v29];
  uint64_t v19 = v31;
  id v7 = v18;

LABEL_11:
LABEL_12:

  return v7;
}

uint64_t __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = a4;
  if ((a5 & 0x8000000000000000) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
    TopoReplica::TopoReplica(&v18, v9, 0);
    long long v14 = *(_OWORD *)v18.uuid;
    NSUInteger v11 = *(void **)(a1 + 40);
    BOOL v10 = *(void **)(a1 + 48);
    unsigned int index = v18.index;
    int v16 = a5;
    int v17 = a3;
    id v12 = [v10 characterRangesForIDRange:&v14];
    [v11 addObjectsFromArray:v12];
  }
  return 0;
}

void __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)(a1 + 48);
  int v3 = *(_DWORD *)(a1 + 64);
  BOOL v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  int v8 = v3;
  int v9 = a2;
  int v10 = a3;
  uint64_t v6 = [v4 characterRangesForIDRange:&v7];
  [v5 addObjectsFromArray:v6];
}

- (id)characterRangesForIDRange:(TopoIDRange *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(CRTTMergeableString *)self orderedSubstrings];
  long long v7 = *v6;
  int v8 = v6[1];
  if (*v6 != v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = *v7;
      long long v11 = **v7;
      *(_OWORD *)&v19.charID.replica.uuid[12] = *(long long *)((char *)*v7 + 12);
      *(_OWORD *)v19.charID.replica.uuid = v11;
      int v21 = 0;
      uint64_t v22 = 0;
      int v20 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v20, *((const void **)v10 + 4), *((void *)v10 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v10 + 5) - *((void *)v10 + 4)) >> 3));
      __p = 0;
      id v24 = 0;
      int v26 = 0;
      uint64_t v25 = 0;
      int v27 = *((_DWORD *)v10 + 21);
      id v12 = v20;
      if (v21 == v20)
      {
        int v14 = 3;
        if (!v20) {
          goto LABEL_13;
        }
      }
      else
      {
        TopoIDRange::intersection(&v19, a3, (uint64_t)v16);
        if (v18)
        {
          uint64_t v13 = [MEMORY[0x1E4F29238] valueWithRange:v17 + v27 - v19.charID.clock];
          [v5 addObject:v13];

          v9 += v18;
          int v14 = 2 * (v9 >= a3->length);
        }
        else
        {
          int v14 = 3;
        }
        if (__p)
        {
          id v24 = __p;
          operator delete(__p);
        }
        id v12 = v20;
        if (!v20) {
          goto LABEL_13;
        }
      }
      int v21 = v12;
      operator delete(v12);
LABEL_13:
      if ((v14 == 3 || !v14) && ++v7 != v8) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)isEmptyCRDT
{
  v2 = [(CRTTMergeableString *)self version];
  char v3 = [v2 isEmpty];

  return v3;
}

- (void)addNewAddedByFor:(void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [(CRTTMergeableString *)self addedByVersion];
  objc_msgSend(v5, "insertWithRange:replica:", self->_addedByLocalCounter, *((unsigned int *)a3 + 6), self->_addedByReplica);

  uint64_t v6 = [(CRTTMergeableString *)self addedByReplica];
  TopoReplica::TopoReplica(&v8, v6);
  int64_t addedByLocalCounter = self->_addedByLocalCounter;
  v9.replica = v8;
  v9.clock = addedByLocalCounter;
  TopoSubstring::addAddedBy((TopoSubstring *)a3, &v9);

  self->_addedByLocalCounter += *((unsigned int *)a3 + 6);
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t v6 = *(void *)a3;
  uint64_t v7 = *((void *)a3 + 1);
  while (v6 != v7)
  {
    uint64_t v8 = *(void *)(*(void *)v6 + 32);
    if (*(void *)(*(void *)v6 + 40) != v8) {
      *(void *)(*(void *)v6 + 40) = v8;
    }
    v6 += 8;
  }
  TopoID v9 = (long long *)*((void *)a4 + 1);
  unint64_t v10 = 126 - 2 * __clz(((uint64_t)v9 - *(void *)a4) >> 4);
  if (v9 == *(long long **)a4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  std::__introsort<std::_ClassicAlgPolicy,[(CRTTMergeableString *)*(void *)a4 deleteSubstrings:v11 withCharacterRanges:1];
  uint64_t v13 = *(uint64_t **)a4;
  id v12 = (uint64_t *)*((void *)a4 + 1);
  while (v13 != v12)
  {
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    v13 += 2;
    objc_msgSend(self->_attributedString, "cr_removeObjectsInRange:", v14, v15);
  }
  int v16 = [(CRTTMergeableString *)self addedByVersion];
  objc_msgSend(v16, "insertWithRange:replica:", self->_addedByLocalCounter, 1, self->_addedByReplica);

  ++self->_addedByLocalCounter;
  [(CRTTMergeableString *)self coalesce];
  [(CRTTMergeableString *)self updateSubstringIndexes];
}

- (void)insertStorageLength:(int64_t)a3 after:(void *)a4 before:(void *)a5 getStorage:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  if (a3 >= 1) {
    operator new();
  }
}

- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = [(CRTTMergeableString *)self orderedSubstrings];
  -[CRTTMergeableString getSubstrings:inOrderedSubstrings:forCharacterRange:](self, "getSubstrings:inOrderedSubstrings:forCharacterRange:", a3, v8, location, length);
}

- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5
{
  if (!a5.length) {
    return;
  }
  id v7 = *(char **)a4;
  if (*(void *)a4 == *((void *)a4 + 1)) {
    goto LABEL_66;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = 0;
  NSUInteger v12 = a5.location + a5.length;
  v57 = (char *)a3 + 16;
  while (1)
  {
    uint64_t v13 = *(void *)v7;
    if (*(void *)(*(void *)v7 + 40) == *(void *)(*(void *)v7 + 32))
    {
      NSUInteger v14 = v11;
      goto LABEL_46;
    }
    NSUInteger v14 = v11 + *(unsigned int *)(v13 + 24);
    if (v14 > location) {
      break;
    }
LABEL_46:
    v7 += 8;
    NSUInteger v11 = v14;
    if (v7 == *((char **)a4 + 1)) {
      goto LABEL_66;
    }
  }
  NSUInteger v15 = v12 - v11;
  if (v12 <= v11) {
    goto LABEL_66;
  }
  BOOL v16 = location >= v11;
  NSUInteger v17 = location - v11;
  if (v17 != 0 && v16)
  {
    v59 = 0;
    v59 = [(CRTTMergeableString *)self splitTopoSubstring:v13 atIndex:CRTTBoundedCheckedCastNSUIntegerToUInt32(v17)];
    id v7 = std::vector<TopoSubstring *>::insert((uint64_t)a4, v7 + 8, (char *)&v59);
    TopoIDRange v19 = (void *)*((void *)a3 + 1);
    unint64_t v18 = *((void *)a3 + 2);
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v24 = ((uint64_t)v19 - *(void *)a3) >> 3;
      if ((unint64_t)(v24 + 1) >> 61) {
        goto LABEL_68;
      }
      uint64_t v25 = v18 - *(void *)a3;
      uint64_t v26 = v25 >> 2;
      if (v25 >> 2 <= (unint64_t)(v24 + 1)) {
        uint64_t v26 = v24 + 1;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v26;
      }
      if (v27) {
        uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v27);
      }
      else {
        uint64_t v28 = 0;
      }
      uint64_t v34 = &v28[8 * v24];
      *(void *)uint64_t v34 = v59;
      int v20 = v34 + 8;
      long long v36 = *(char **)a3;
      id v35 = (char *)*((void *)a3 + 1);
      if (v35 != *(char **)a3)
      {
        do
        {
          uint64_t v37 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v34 - 1) = v37;
          v34 -= 8;
        }
        while (v35 != v36);
        id v35 = *(char **)a3;
      }
      *(void *)a3 = v34;
      *((void *)a3 + 1) = v20;
      *((void *)a3 + 2) = &v28[8 * v27];
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      *TopoIDRange v19 = v59;
      int v20 = v19 + 1;
    }
    *((void *)a3 + 1) = v20;
    if (v12 < v14)
    {
      v58 = [(CRTTMergeableString *)self splitTopoSubstring:v59 atIndex:CRTTBoundedCheckedCastNSUIntegerToUInt32(length)];
      v45 = v7 + 8;
      v46 = &v58;
      goto LABEL_65;
    }
    goto LABEL_46;
  }
  if (v14 <= v12)
  {
    uint64_t v22 = (uint64_t *)*((void *)a3 + 1);
    unint64_t v21 = *((void *)a3 + 2);
    if ((unint64_t)v22 >= v21)
    {
      uint64_t v29 = ((uint64_t)v22 - *(void *)a3) >> 3;
      if ((unint64_t)(v29 + 1) >> 61) {
        goto LABEL_68;
      }
      uint64_t v30 = v21 - *(void *)a3;
      uint64_t v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
        uint64_t v31 = v29 + 1;
      }
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      if (v32) {
        unint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v32);
      }
      else {
        unint64_t v33 = 0;
      }
      long long v38 = &v33[8 * v29];
      *(void *)long long v38 = v13;
      uint64_t v23 = v38 + 8;
      v40 = *(char **)a3;
      v39 = (char *)*((void *)a3 + 1);
      if (v39 != *(char **)a3)
      {
        do
        {
          uint64_t v41 = *((void *)v39 - 1);
          v39 -= 8;
          *((void *)v38 - 1) = v41;
          v38 -= 8;
        }
        while (v39 != v40);
        v39 = *(char **)a3;
      }
      *(void *)a3 = v38;
      *((void *)a3 + 1) = v23;
      *((void *)a3 + 2) = &v33[8 * v32];
      if (v39) {
        operator delete(v39);
      }
    }
    else
    {
      *uint64_t v22 = v13;
      uint64_t v23 = v22 + 1;
    }
    *((void *)a3 + 1) = v23;
    goto LABEL_46;
  }
  v59 = [(CRTTMergeableString *)self splitTopoSubstring:v13 atIndex:CRTTBoundedCheckedCastNSUIntegerToUInt32(v15)];
  long long v43 = (uint64_t *)*((void *)a3 + 1);
  unint64_t v42 = *((void *)a3 + 2);
  if ((unint64_t)v43 >= v42)
  {
    uint64_t v47 = ((uint64_t)v43 - *(void *)a3) >> 3;
    if ((unint64_t)(v47 + 1) >> 61) {
LABEL_68:
    }
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    uint64_t v48 = v42 - *(void *)a3;
    uint64_t v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1)) {
      uint64_t v49 = v47 + 1;
    }
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v50 = v49;
    }
    if (v50) {
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v50);
    }
    else {
      v51 = 0;
    }
    long long v52 = &v51[8 * v47];
    int v53 = &v51[8 * v50];
    *(void *)long long v52 = v13;
    v44 = v52 + 8;
    v55 = *(char **)a3;
    uint64_t v54 = (char *)*((void *)a3 + 1);
    if (v54 != *(char **)a3)
    {
      do
      {
        uint64_t v56 = *((void *)v54 - 1);
        v54 -= 8;
        *((void *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      uint64_t v54 = *(char **)a3;
    }
    *(void *)a3 = v52;
    *((void *)a3 + 1) = v44;
    *((void *)a3 + 2) = v53;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    *long long v43 = v13;
    v44 = v43 + 1;
  }
  *((void *)a3 + 1) = v44;
  v45 = v7 + 8;
  v46 = &v59;
LABEL_65:
  std::vector<TopoSubstring *>::insert((uint64_t)a4, v45, (char *)v46);
LABEL_66:
  [(CRTTMergeableString *)self invalidateCache];
}

- (void)getSubstringBeforeTopoID:(TopoID *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  startNode = self->_startNode;
  uint64_t v6 = [(CRTTMergeableString *)self orderedSubstrings];
  id v7 = (long long **)*v6;
  uint64_t v8 = (long long **)v6[1];
  while (1)
  {
    if (v7 == v8) {
      return 0;
    }
    TopoID v9 = *v7;
    long long v10 = **v7;
    *(_OWORD *)&uu2[12] = *(long long *)((char *)*v7 + 12);
    *(_OWORD *)uu2 = v10;
    if (a3->replica.index == *(_DWORD *)&uu2[16] && !uuid_compare(a3->replica.uuid, uu2))
    {
      if (*(_DWORD *)&uu2[20] == a3->clock) {
        return startNode;
      }
      if (TopoID::operator>((uint64_t)a3, (uint64_t)uu2))
      {
        long long v12 = *(_OWORD *)uu2;
        int v13 = *(_DWORD *)&uu2[16];
        int v14 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
        if (TopoID::operator<((uint64_t)a3, (uint64_t)&v12)) {
          break;
        }
      }
    }
    if (*((void *)v9 + 5) != *((void *)v9 + 4)) {
      startNode = v9;
    }
    ++v7;
  }
  if (*((void *)v9 + 5) != *((void *)v9 + 4))
  {
    [(CRTTMergeableString *)self splitTopoSubstring:v9 atIndex:a3->clock - *(_DWORD *)&uu2[20]];
    [(CRTTMergeableString *)self invalidateCache];
    return v9;
  }
  return startNode;
}

- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a4->length)
  {
    id v7 = [(CRTTMergeableString *)self orderedSubstrings];
    uint64_t v8 = *v7;
    TopoID v9 = v7[1];
    if (*v7 != v9)
    {
      char v10 = 0;
      while (1)
      {
        NSUInteger v11 = *v8;
        long long v12 = **v8;
        *(_OWORD *)&uu2[12] = *(long long *)((char *)*v8 + 12);
        *(_OWORD *)uu2 = v12;
        if (a4->charID.replica.index != *(_DWORD *)&uu2[16]) {
          goto LABEL_59;
        }
        if (uuid_compare(a4->charID.replica.uuid, uu2)) {
          goto LABEL_59;
        }
        *(_OWORD *)uu1 = *(_OWORD *)uu2;
        unsigned int v51 = *(_DWORD *)&uu2[16];
        int v52 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
        if (TopoID::operator<=(uu1, a4->charID.replica.uuid)) {
          goto LABEL_59;
        }
        long long v47 = *(_OWORD *)a4->charID.replica.uuid;
        unsigned int v13 = a4->length + a4->charID.clock;
        unsigned int index = a4->charID.replica.index;
        int v49 = v13;
        if (TopoID::operator>=(uu2, (unsigned __int8 *)&v47)) {
          goto LABEL_59;
        }
        unsigned int clock = a4->charID.clock;
        if (clock <= *(_DWORD *)&uu2[20])
        {
          *(_OWORD *)uu1 = *(_OWORD *)uu2;
          unsigned int v51 = *(_DWORD *)&uu2[16];
          int v52 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
          long long v47 = *(_OWORD *)a4->charID.replica.uuid;
          int v23 = a4->length + clock;
          unsigned int index = a4->charID.replica.index;
          int v49 = v23;
          if (!TopoID::operator>((uint64_t)uu1, (uint64_t)&v47))
          {
            unint64_t v27 = (long long **)*((void *)a3 + 1);
            unint64_t v26 = *((void *)a3 + 2);
            if ((unint64_t)v27 >= v26)
            {
              uint64_t v29 = ((uint64_t)v27 - *(void *)a3) >> 3;
              if ((unint64_t)(v29 + 1) >> 61) {
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v30 = v26 - *(void *)a3;
              uint64_t v31 = v30 >> 2;
              if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
                uint64_t v31 = v29 + 1;
              }
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v32 = v31;
              }
              if (v32) {
                unint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v32);
              }
              else {
                unint64_t v33 = 0;
              }
              uint64_t v41 = &v33[8 * v29];
              *(void *)uint64_t v41 = v11;
              uint64_t v28 = v41 + 8;
              long long v43 = *(char **)a3;
              unint64_t v42 = (char *)*((void *)a3 + 1);
              if (v42 != *(char **)a3)
              {
                do
                {
                  uint64_t v44 = *((void *)v42 - 1);
                  v42 -= 8;
                  *((void *)v41 - 1) = v44;
                  v41 -= 8;
                }
                while (v42 != v43);
                unint64_t v42 = *(char **)a3;
              }
              *(void *)a3 = v41;
              *((void *)a3 + 1) = v28;
              *((void *)a3 + 2) = &v33[8 * v32];
              if (v42) {
                operator delete(v42);
              }
            }
            else
            {
              *unint64_t v27 = v11;
              uint64_t v28 = v27 + 1;
            }
            *((void *)a3 + 1) = v28;
            goto LABEL_59;
          }
          [(CRTTMergeableString *)self splitTopoSubstring:v11 atIndex:a4->length + a4->charID.clock - *(_DWORD *)&uu2[20]];
          NSUInteger v17 = (long long **)*((void *)a3 + 1);
          unint64_t v24 = *((void *)a3 + 2);
          if ((unint64_t)v17 >= v24)
          {
            uint64_t v34 = ((uint64_t)v17 - *(void *)a3) >> 3;
            if ((unint64_t)(v34 + 1) >> 61) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v35 = v24 - *(void *)a3;
            uint64_t v36 = v35 >> 2;
            if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
              uint64_t v36 = v34 + 1;
            }
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v36;
            }
            if (v21) {
              uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v21);
            }
            else {
              uint64_t v22 = 0;
            }
            uint64_t v37 = &v22[8 * v34];
            *(void *)uint64_t v37 = v11;
            uint64_t v25 = v37 + 8;
            v45 = *(char **)a3;
            long long v38 = (char *)*((void *)a3 + 1);
            if (v38 != *(char **)a3)
            {
              do
              {
                uint64_t v46 = *((void *)v38 - 1);
                v38 -= 8;
                *((void *)v37 - 1) = v46;
                v37 -= 8;
              }
              while (v38 != v45);
LABEL_55:
              long long v38 = *(char **)a3;
            }
LABEL_56:
            *(void *)a3 = v37;
            *((void *)a3 + 1) = v25;
            *((void *)a3 + 2) = &v22[8 * v21];
            if (v38) {
              operator delete(v38);
            }
            goto LABEL_58;
          }
        }
        else
        {
          NSUInteger v11 = [(CRTTMergeableString *)self splitTopoSubstring:v11 atIndex:clock - *(_DWORD *)&uu2[20]];
          unsigned int v15 = a4->length + a4->charID.clock;
          unsigned int v51 = a4->charID.replica.index;
          int v52 = v15;
          *(_OWORD *)uu1 = *(_OWORD *)a4->charID.replica.uuid;
          long long v47 = *(_OWORD *)uu2;
          unsigned int index = *(_DWORD *)&uu2[16];
          int v49 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
          if (TopoID::operator<((uint64_t)uu1, (uint64_t)&v47)) {
            [(CRTTMergeableString *)self splitTopoSubstring:v11 atIndex:a4->length];
          }
          NSUInteger v17 = (long long **)*((void *)a3 + 1);
          unint64_t v16 = *((void *)a3 + 2);
          if ((unint64_t)v17 >= v16)
          {
            uint64_t v18 = ((uint64_t)v17 - *(void *)a3) >> 3;
            if ((unint64_t)(v18 + 1) >> 61) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v19 = v16 - *(void *)a3;
            uint64_t v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
              uint64_t v20 = v18 + 1;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v21);
            }
            else {
              uint64_t v22 = 0;
            }
            uint64_t v37 = &v22[8 * v18];
            *(void *)uint64_t v37 = v11;
            uint64_t v25 = v37 + 8;
            v39 = *(char **)a3;
            long long v38 = (char *)*((void *)a3 + 1);
            if (v38 != *(char **)a3)
            {
              do
              {
                uint64_t v40 = *((void *)v38 - 1);
                v38 -= 8;
                *((void *)v37 - 1) = v40;
                v37 -= 8;
              }
              while (v38 != v39);
              goto LABEL_55;
            }
            goto LABEL_56;
          }
        }
        void *v17 = v11;
        uint64_t v25 = v17 + 1;
LABEL_58:
        *((void *)a3 + 1) = v25;
        char v10 = 1;
LABEL_59:
        if (++v8 == v9)
        {
          if (v10) {
            [(CRTTMergeableString *)self invalidateCache];
          }
          return;
        }
      }
    }
  }
}

- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4
{
  std::vector<_NSRange>::reserve((void **)a3, (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  long long v28 = 0u;
  long long v29 = 0u;
  int v30 = 1065353216;
  id v7 = *(void **)a4;
  uint64_t v8 = (void *)*((void *)a4 + 1);
  while (v7 != v8)
  {
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v28, v7, v7);
    ++v7;
  }
  TopoID v9 = [(CRTTMergeableString *)self orderedSubstrings];
  char v10 = *v9;
  NSUInteger v11 = v9[1];
  if (*v9 != v11)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v27 = *v10;
      unsigned int v13 = std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(&v28, &v27);
      int v14 = v13;
      if (*(void *)(v27 + 40) == *(void *)(v27 + 32))
      {
        uint64_t v15 = 0;
        if (!v13) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v15 = *(unsigned int *)(v27 + 24);
        if (!v13) {
          goto LABEL_28;
        }
      }
      NSUInteger v17 = (void *)*((void *)a3 + 1);
      unint64_t v16 = *((void *)a3 + 2);
      if ((unint64_t)v17 >= v16)
      {
        uint64_t v19 = *(void **)a3;
        uint64_t v20 = ((uint64_t)v17 - *(void *)a3) >> 4;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60) {
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v22 = v16 - (void)v19;
        if (v22 >> 3 > v21) {
          unint64_t v21 = v22 >> 3;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)a3 + 16, v23);
          uint64_t v19 = *(void **)a3;
          NSUInteger v17 = (void *)*((void *)a3 + 1);
        }
        else
        {
          unint64_t v24 = 0;
        }
        uint64_t v25 = &v24[16 * v20];
        *(void *)uint64_t v25 = v12;
        *((void *)v25 + 1) = v15;
        unint64_t v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 16;
            v17 -= 2;
          }
          while (v17 != v19);
          uint64_t v19 = *(void **)a3;
        }
        uint64_t v18 = v25 + 16;
        *(void *)a3 = v26;
        *((void *)a3 + 1) = v25 + 16;
        *((void *)a3 + 2) = &v24[16 * v23];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        void *v17 = v12;
        v17[1] = v15;
        uint64_t v18 = v17 + 2;
      }
      *((void *)a3 + 1) = v18;
      if (*((void *)&v29 + 1) == 1) {
        break;
      }
      std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(&v28, v14);
LABEL_28:
      v12 += v15;
      ++v10;
    }
    while (v10 != v11);
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v28);
}

- (void)enumerateIndexes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, unint64_t, void *, void, unint64_t))a3;
  id v5 = [(CRTTMergeableString *)self orderedSubstrings];
  uint64_t v6 = *v5;
  id v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      uint64_t v8 = (long long *)*v6;
      if (*(void *)(*v6 + 40) != *(void *)(*v6 + 32))
      {
        unsigned int v10 = *((_DWORD *)v8 + 4);
        unsigned int v9 = *((_DWORD *)v8 + 5);
        long long v14 = *v8;
        unsigned int v15 = v10;
        unsigned int v16 = v9;
        if (*((_DWORD *)v8 + 6))
        {
          unint64_t v11 = 0;
          do
          {
            uint64_t v12 = *((unsigned int *)v8 + 21);
            unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v14];
            v4[2](v4, v11 + v12, v13, v15, v11 + v16);

            ++v11;
          }
          while (v11 < *((unsigned int *)v8 + 6));
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
}

- (id)mergeableIndexForCharacterIndex:(int64_t)a3 affinity:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v31 = 0;
  uuid_clear(uu);
  int v32 = 0;
  *(_OWORD *)unint64_t v33 = 0u;
  *(_OWORD *)__p = 0u;
  long long v35 = 0u;
  int v36 = 0;
  unsigned int v37 = a3;
  id v7 = *(void **)[(CRTTMergeableString *)self orderedSubstrings];
  uint64_t v8 = *(void **)([(CRTTMergeableString *)self orderedSubstrings] + 8);
  if (v8 != v7)
  {
    unint64_t v9 = v8 - v7;
    do
    {
      unint64_t v10 = v9 >> 1;
      unint64_t v11 = &v7[v9 >> 1];
      uint64_t v13 = *v11;
      uint64_t v12 = v11 + 1;
      v9 += ~(v9 >> 1);
      if (*(_DWORD *)(v13 + 84) < v37) {
        id v7 = v12;
      }
      else {
        unint64_t v9 = v10;
      }
    }
    while (v9);
  }
  if (v7 == v8)
  {
    unsigned int v16 = 0;
  }
  else
  {
    if (*(unsigned int *)(*v7 + 84) <= a3) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = -1;
    }
    uint64_t i = (TopoSubstring **)&v7[v14];
    if (a4)
    {
      while (!TopoSubstring::isEndNode(*i) && *((void *)*i + 5) == *((void *)*i + 4))
        ++i;
    }
    else if (*((unsigned int *)*i + 21) >= a3)
    {
      for (uint64_t i = &i[TopoSubstring::isStartNode(*i) - 1]; ; --i)
      {
        BOOL isStartNode = TopoSubstring::isStartNode(*i);
        uint64_t v18 = *i;
        if (isStartNode || *((void *)v18 + 5) != *((void *)v18 + 4)) {
          break;
        }
      }
      int v19 = *((_DWORD *)v18 + 6);
      int v20 = *((_DWORD *)v18 + 21);
      if (v19) {
        LODWORD(a3) = v19 + v20 - 1;
      }
      else {
        LODWORD(a3) = v20;
      }
    }
    else
    {
      LODWORD(a3) = a3 - 1;
    }
    unint64_t v21 = [CRTTMergeableStringIndex alloc];
    int v22 = *((_DWORD *)*i + 21);
    int v24 = *((_DWORD *)*i + 4);
    int v23 = *((_DWORD *)*i + 5);
    long long v28 = *(_OWORD *)*i;
    LODWORD(v29) = v24;
    HIDWORD(v29) = a3 - v22 + v23;
    int64_t v25 = [(CRTTMergeableString *)self renameGeneration];
    unint64_t v26 = [(CRTTMergeableString *)self version];
    unsigned int v16 = -[CRTTMergeableStringIndex initWithTopoID:affinity:renameGeneration:maxCounter:](v21, "initWithTopoID:affinity:renameGeneration:maxCounter:", &v28, a4, v25, [v26 maxCounter]);
  }
  if (__p[1])
  {
    *(void **)&long long v35 = __p[1];
    operator delete(__p[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  return v16;
}

- (unint64_t)_characterIndexForIndex:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 index];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  uint64_t v6 = [(CRTTMergeableString *)self orderedSubstrings];
  id v7 = (TopoIDRange **)*v6;
  uint64_t v8 = (TopoIDRange **)v6[1];
  while (1)
  {
    if (v7 == v8) {
      goto LABEL_15;
    }
    unint64_t v9 = *v7;
    if (TopoIDRange::contains(*v7, &v15)
      || *(void *)&v9->charID.replica.index == *(void *)&v15.replica.index
      && !uuid_compare(v9->charID.replica.uuid, v15.replica.uuid))
    {
      break;
    }
    ++v7;
  }
  if (*(void *)&v9[1].charID.replica.uuid[12] == *(void *)&v9[1].charID.replica.uuid[4])
  {
    if ([v5 affinity] == 2)
    {
LABEL_15:
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    }
    unint64_t v13 = *(unsigned int *)v9[3].charID.replica.uuid;
  }
  else
  {
    int v10 = *(_DWORD *)v9[3].charID.replica.uuid;
    unsigned int clock = v15.clock;
    unsigned int v12 = v9->charID.clock;
    if ([v5 affinity]) {
      unint64_t v13 = clock + v10 - v12;
    }
    else {
      unint64_t v13 = clock + v10 - v12 + 1;
    }
  }
LABEL_16:

  return v13;
}

- (unint64_t)characterIndexForIndex:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CRTTMergeableString *)self renameGeneration];
  if (v5 == [v4 renameGeneration])
  {
    unint64_t v6 = [(CRTTMergeableString *)self _characterIndexForIndex:v4];
  }
  else
  {
    id v7 = +[CRGlobalContextObjC objCRenames];
    uint64_t v8 = [(CRTTMergeableString *)self renamed:v7];
    unint64_t v9 = [v4 renamed:v7];
    unint64_t v6 = [v8 _characterIndexForIndex:v9];
  }
  return v6;
}

- (void)enumerateSubstrings:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, unsigned char *))a3;
  int64_t v5 = [(CRTTMergeableString *)self orderedSubstrings];
  unint64_t v6 = *v5;
  id v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      uint64_t v8 = (long long *)*v6;
      if (*(void *)(*v6 + 40) != *(void *)(*v6 + 32))
      {
        uint64_t v9 = *((unsigned int *)v8 + 6);
        if (v9)
        {
          uint64_t v10 = *((unsigned int *)v8 + 21);
          long long v11 = *v8;
          *(_OWORD *)&v12[12] = *(long long *)((char *)v8 + 12);
          *(_OWORD *)unsigned int v12 = v11;
          v4[2](v4, v10, v9, v12);
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
}

- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4
{
}

- (int64_t)substringCount
{
  v2 = [(CRTTMergeableString *)self orderedSubstrings];
  return (uint64_t)(v2[1] - *v2) >> 3;
}

- (void)updateAttributedStringAfterMerge
{
  char v3 = objc_msgSend(self->_attributedString, "cr_emptyCopy");
  id v4 = [(CRTTMergeableString *)self orderedSubstrings];
  int64_t v5 = (uint64_t *)*v4;
  unint64_t v6 = (uint64_t *)v4[1];
  while (v5 != v6)
  {
    uint64_t v7 = *v5;
    uint64_t v8 = [v3 length];
    if (*(void *)(v7 + 40) != *(void *)(v7 + 32)) {
      objc_msgSend(v3, "cr_appendStorage:fromRange:", self->_attributedString, *(unsigned int *)(v7 + 84), *(unsigned int *)(v7 + 24));
    }
    *(_DWORD *)(v7 + 84) = CRTTBoundedCheckedCastNSUIntegerToUInt32(v8);
    ++v5;
  }
  id attributedString = self->_attributedString;
  self->_id attributedString = v3;
}

- (void)updateSubstringIndexes
{
  v2 = [(CRTTMergeableString *)self orderedSubstrings];
  char v3 = *v2;
  id v4 = v2[1];
  if (*v2 != v4)
  {
    int v5 = 0;
    do
    {
      uint64_t v6 = *v3;
      *(_DWORD *)(v6 + 84) = v5;
      if (*(void *)(v6 + 40) != *(void *)(v6 + 32)) {
        v5 += *(_DWORD *)(v6 + 24);
      }
      ++v3;
    }
    while (v3 != v4);
  }
}

- (void)coalesce
{
  if (!self->_editCount)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x5812000000;
    long long v11 = __Block_byref_object_copy_;
    unsigned int v12 = __Block_byref_object_dispose_;
    memset(v13, 0, sizeof(v13));
    uint64_t v14 = 0;
    int v15 = 1065353216;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__CRTTMergeableString_coalesce__block_invoke;
    v7[3] = &unk_1E64C1808;
    v7[4] = self;
    void v7[5] = &v8;
    [(CRTTMergeableString *)self traverseUnordered:v7];
    if (v9[9])
    {
      for (uint64_t i = (void *)v9[8]; i; uint64_t i = (void *)*i)
      {
        id v4 = (void *)i[2];
        if (v4)
        {
          int v5 = (void *)v4[7];
          if (v5)
          {
            v4[8] = v5;
            operator delete(v5);
          }
          uint64_t v6 = (void *)v4[4];
          if (v6)
          {
            v4[5] = v6;
            operator delete(v6);
          }
          MEMORY[0x1C8781440](v4, 0x10A0C409FE6E197);
        }
      }
      [(CRTTMergeableString *)self invalidateCache];
    }
    _Block_object_dispose(&v8, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v13 + 8);
  }
}

uint64_t __31__CRTTMergeableString_coalesce__block_invoke(uint64_t result, TopoIDRange *this)
{
  if (*(TopoIDRange **)(*(void *)(result + 32) + 120) != this)
  {
    char v3 = *(const TopoIDRange ***)this[2].charID.replica.uuid;
    id v4 = (char *)&this[2];
    if (*(void *)&this[2].charID.replica.uuid[8] - (void)v3 == 8)
    {
      uint64_t v5 = result;
      do
      {
        uint64_t v8 = 0;
        uint64_t v6 = *v3;
        uint64_t v8 = (TopoIDRange *)v6;
        if (v6[2].length != 1) {
          break;
        }
        result = TopoSubstring::isSequentialWith((TopoSubstring *)this, v6);
        if (!result) {
          break;
        }
        uint64_t v7 = (TopoSubstring *)this;
        if (v8 != this)
        {
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(v4, *(char **)v8[2].charID.replica.uuid, *(void *)&v8[2].charID.replica.uuid[8], (uint64_t)(*(void *)&v8[2].charID.replica.uuid[8] - *(void *)v8[2].charID.replica.uuid) >> 3);
          uint64_t v7 = (TopoSubstring *)v8;
        }
        this->length += *((_DWORD *)v7 + 6);
        result = (uint64_t)std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(*(void *)(v5 + 40) + 8) + 48, &v8, &v8);
        char v3 = *(const TopoIDRange ***)this[2].charID.replica.uuid;
      }
      while (*(void *)&this[2].charID.replica.uuid[8] - (void)v3 == 8);
    }
  }
  return result;
}

- (BOOL)canMergeString:(id)a3
{
  return 1;
}

- (BOOL)hasDeltaTo:(id)a3 compareElements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(CRTTMergeableString *)self renameGeneration];
  if (v8 != [v6 renameGeneration])
  {
    uint64_t v16 = +[CRGlobalContextObjC objCRenames];
    uint64_t v17 = [(CRTTMergeableString *)self renamed:v16];
    uint64_t v18 = [v6 renamed:v16];
    char v15 = [v17 hasDeltaTo:v18 compareElements:v7];

    goto LABEL_6;
  }
  uint64_t v9 = [(CRTTMergeableString *)self version];
  uint64_t v10 = [v6 version];
  char v11 = [v9 hasDeltaTo:v10];

  if ((v11 & 1) == 0)
  {
    unsigned int v12 = [(CRTTMergeableString *)self addedByVersion];
    uint64_t v13 = [v6 addedByVersion];
    char v14 = [v12 hasDeltaTo:v13];

    if ((v14 & 1) == 0)
    {
      if (v7)
      {
        uint64_t v20 = [v6 orderedSubstrings];
        v31[0] = 0;
        v31[1] = 0;
        int v30 = (uint64_t *)v31;
        unint64_t v21 = [(CRTTMergeableString *)self orderedSubstrings];
        int v22 = *v21;
        int v23 = v21[1];
        while (v22 != v23)
        {
          uint64_t v24 = *v22;
          *(void *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](&v30, (_OWORD *)*v22++) = v24;
        }
        int64_t v25 = *(uint64_t **)v20;
        if (*(void *)v20 != *(void *)(v20 + 8))
        {
          uint64_t v26 = MEMORY[0x1E4F143A8];
          while (1)
          {
            v28[0] = v26;
            v28[1] = 3221225472;
            _OWORD v28[2] = __50__CRTTMergeableString_hasDeltaTo_compareElements___block_invoke;
            v28[3] = &unk_1E64C1830;
            id v29 = v7;
            int v27 = compareSubstring(v28, *v25, (uint64_t)&v30);

            if (v27) {
              break;
            }
            if (++v25 == *(uint64_t **)(v20 + 8)) {
              goto LABEL_15;
            }
          }
          std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v31[0]);
          goto LABEL_4;
        }
LABEL_15:
        std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v31[0]);
      }
      char v15 = 0;
      goto LABEL_6;
    }
  }
LABEL_4:
  char v15 = 1;
LABEL_6:

  return v15;
}

uint64_t __50__CRTTMergeableString_hasDeltaTo_compareElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return 0;
  }
}

- (unint64_t)mergeWithString:(id)a3 optimized:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  id v7 = [(CRTTMergeableString *)self version];
  v45 = (void *)[v7 copy];

  int64_t v8 = [(CRTTMergeableString *)self addedByVersion];
  uint64_t v46 = (void *)[v8 copy];

  int64_t v9 = [(CRTTMergeableString *)self renameGeneration];
  if (v9 != [v6 renameGeneration])
  {
    uint64_t v10 = +[CRGlobalContextObjC objCRenames];
    uint64_t v11 = [v6 renamed:v10];

    [(CRTTMergeableString *)self apply:v10 skipRetain:1 alwaysApply:0];
    id v6 = (id)v11;
  }
  long long v47 = v6;
  if (!v4) {
    goto LABEL_6;
  }
  unsigned int v12 = [(CRTTMergeableString *)self version];
  uint64_t v13 = [v6 version];
  uint64_t v14 = [v12 compareTo:v13];

  char v15 = [(CRTTMergeableString *)self addedByVersion];
  uint64_t v16 = [v6 addedByVersion];
  unint64_t v17 = [v15 compareTo:v16] | v14;

  if (v17 < 3)
  {
    unint64_t v18 = qword_1C449AA80[v17];
  }
  else
  {
LABEL_6:
    int v19 = (void *)[v6 orderedSubstrings];
    uint64_t v54 = 0;
    v55 = (uint64_t **)&v54;
    uint64_t v56 = 0x4812000000;
    v57 = __Block_byref_object_copy__18;
    v58 = __Block_byref_object_dispose__19;
    v59 = &unk_1C44F329A;
    v61[0] = 0;
    v61[1] = 0;
    v60 = v61;
    uint64_t v20 = [(CRTTMergeableString *)self orderedSubstrings];
    unint64_t v21 = *v20;
    int v22 = v20[1];
    while (v21 != v22)
    {
      uint64_t v23 = *v21;
      *(void *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](v55 + 6, (_OWORD *)*v21++) = v23;
    }
    uint64_t v24 = v19[1];
    if (v24 != *v19)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      do
      {
        v51[0] = v25;
        v51[1] = 3221225472;
        v51[2] = __49__CRTTMergeableString_mergeWithString_optimized___block_invoke;
        v51[3] = &unk_1E64C1858;
        v51[4] = self;
        id v52 = v47;
        int v53 = &v54;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __49__CRTTMergeableString_mergeWithString_optimized___block_invoke_2;
        v48[3] = &unk_1E64C1880;
        v48[4] = self;
        id v49 = v52;
        unint64_t v50 = &v54;
        uint64_t v26 = *(void *)(v24 - 8);
        v24 -= 8;
        mergeSubstring(v51, v48, v26, (uint64_t)(v55 + 6), 0, 1u);
      }
      while (v24 != *v19);
    }
    int v27 = [(CRTTMergeableString *)self version];
    long long v28 = [v47 version];
    [v27 merge:v28];

    id v29 = [(CRTTMergeableString *)self addedByVersion];
    int v30 = [v47 addedByVersion];
    [v29 merge:v30];

    int v31 = [(CRTTMergeableString *)self version];
    int v32 = TopoReplica::objc(&self->_replica);
    if (v47) {
      [v47 replica];
    }
    else {
      memset(&v62, 0, sizeof(v62));
    }
    unint64_t v33 = TopoReplica::objc(&v62);
    +[CRGlobalContextObjC retainOrReleaseWithInitial:v45 current:v31 forReplica:v32 copyingFrom:v33];

    uint64_t v34 = [(CRTTMergeableString *)self addedByVersion];
    long long v35 = [(CRTTMergeableString *)self addedByReplica];
    int v36 = [v47 addedByReplica];
    +[CRGlobalContextObjC retainOrReleaseWithInitial:v46 current:v34 forReplica:v35 copyingFrom:v36];

    unsigned int v37 = [(CRTTMergeableString *)self context];
    BOOL v38 = v37 == 0;

    if (v38)
    {
      v39 = [v47 context];
      [(CRTTMergeableString *)self setContext:v39];
    }
    uint64_t v40 = [(CRTTMergeableString *)self temporaryConcurrentNames];
    if (([v40 isEmpty] & 1) == 0)
    {
      [(CRTTMergeableString *)self invalidateCache];
      uint64_t v41 = [(CRTTMergeableString *)self context];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        id v43 = +[CRContext newTransientContextObjC];
      }
      else
      {
        id v43 = [(CRTTMergeableString *)self context];
      }
      [(CRTTMergeableString *)self applyRenamesAndRetainOrRelease:v40 context:v43];
    }
    [(CRTTMergeableString *)self sortSplitNodes];
    [(CRTTMergeableString *)self invalidateCache];
    [(CRTTMergeableString *)self updateAttributedStringAfterMerge];
    [(CRTTMergeableString *)self coalesce];

    _Block_object_dispose(&v54, 8);
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v61[0]);
    unint64_t v18 = 3;
  }

  return v18;
}

void __49__CRTTMergeableString_mergeWithString_optimized___block_invoke(uint64_t a1, uint64_t a2, const TopoSubstring *a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(id *)(a1 + 32);
  id v7 = v5;
  int64_t v8 = v7;
  if (*(_DWORD *)(a2 + 24))
  {
    uint64_t v10 = *(void *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v11 = [v7 addedByVersion];
    TopoSubstring::removeAddsNotIn((TopoSubstring *)a2, a3, v11);

    unsigned int v12 = [v14 addedByVersion];
    TopoSubstring::addAddsIn((TopoSubstring *)a2, a3, v12);

    uint64_t v13 = [v8 attributedString];
    mergeStringData(v14, v9 == v10, a2, (uint64_t)a3, v13, 0);
  }
  mergeAddChildren(a2, (uint64_t)a3, v6 + 48);
}

void __49__CRTTMergeableString_mergeWithString_optimized___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) attributedString];
  mergeAddNewSubstring(v1, v2);
}

- (BOOL)canDeltaMerge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRTTMergeableString *)self version];
  uint64_t v6 = [(CRTTMergeableString *)self addedByVersion];
  if (([v5 hasTemporaryComponents] & 1) != 0 || objc_msgSend(v6, "hasTemporaryComponents"))
  {
    id v7 = +[CRGlobalContextObjC objCRenames];
    int64_t v8 = (void *)[v5 copy];

    uint64_t v9 = (void *)[v6 copy];
    [v8 apply:v7];
    [v9 apply:v7];

    uint64_t v5 = v8;
    uint64_t v6 = v9;
  }
  uint64_t v10 = [v4 fromVersion];
  if ([v5 hasDeltaTo:v10])
  {
    char v11 = 0;
  }
  else
  {
    unsigned int v12 = [v4 fromAddedByVersion];
    char v13 = [v6 hasDeltaTo:v12];

    char v11 = v13 ^ 1;
  }

  return v11;
}

- (BOOL)deltaMerge:(id)a3
{
  id v26 = a3;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  uint64_t v4 = [(CRTTMergeableString *)self renameGeneration];
  if (v4 < [v26 renameGeneration]
    && [(CRTTMergeableString *)self needToFinalizeTimestamps])
  {
    uint64_t v5 = +[CRGlobalContextObjC objCRenames];
    [(CRTTMergeableString *)self apply:v5 skipRetain:0 alwaysApply:0];
  }
  int64_t v6 = [(CRTTMergeableString *)self renameGeneration];
  uint64_t v7 = [v26 renameGeneration];
  if (v6 <= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  [(CRTTMergeableString *)self setRenameGeneration:v8];
  BOOL v9 = [(CRTTMergeableString *)self canDeltaMerge:v26];
  if (v9)
  {
    uint64_t v10 = (void *)[v26 orderedSubstrings];
    uint64_t v33 = 0;
    uint64_t v34 = (uint64_t **)&v33;
    uint64_t v35 = 0x4812000000;
    int v36 = __Block_byref_object_copy__18;
    unsigned int v37 = __Block_byref_object_dispose__19;
    BOOL v38 = &unk_1C44F329A;
    v40[0] = 0;
    v40[1] = 0;
    v39 = v40;
    char v11 = [(CRTTMergeableString *)self orderedSubstrings];
    unsigned int v12 = *v11;
    char v13 = v11[1];
    while (v12 != v13)
    {
      uint64_t v14 = *v12;
      *(void *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](v34 + 6, (_OWORD *)*v12++) = v14;
    }
    uint64_t v15 = v10[1];
    if (v15 != *v10)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      do
      {
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __34__CRTTMergeableString_deltaMerge___block_invoke;
        v30[3] = &unk_1E64C1858;
        v30[4] = self;
        id v31 = v26;
        int v32 = &v33;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        _OWORD v27[2] = __34__CRTTMergeableString_deltaMerge___block_invoke_2;
        v27[3] = &unk_1E64C1880;
        v27[4] = self;
        id v28 = v31;
        id v29 = &v33;
        uint64_t v17 = *(void *)(v15 - 8);
        v15 -= 8;
        mergeSubstring(v30, v27, v17, (uint64_t)(v34 + 6), 0, 1u);
      }
      while (v15 != *v10);
    }
    unint64_t v18 = [(CRTTMergeableString *)self version];
    int v19 = [v26 version];
    [v18 merge:v19];

    uint64_t v20 = [(CRTTMergeableString *)self addedByVersion];
    unint64_t v21 = [v26 addedByVersion];
    [v20 merge:v21];

    int v22 = [(CRTTMergeableString *)self temporaryConcurrentNames];
    if (([v22 isEmpty] & 1) == 0)
    {
      [(CRTTMergeableString *)self invalidateCache];
      uint64_t v23 = [(CRTTMergeableString *)self context];

      if (v23)
      {
        id v24 = [(CRTTMergeableString *)self context];
      }
      else
      {
        id v24 = +[CRContext newTransientContextObjC];
      }
      [(CRTTMergeableString *)self applyRenamesAndRetainOrRelease:v22 context:v24];
    }
    [(CRTTMergeableString *)self sortSplitNodes];
    [(CRTTMergeableString *)self invalidateCache];
    [(CRTTMergeableString *)self updateAttributedStringAfterMerge];
    [(CRTTMergeableString *)self coalesce];

    _Block_object_dispose(&v33, 8);
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v40[0]);
  }

  return v9;
}

void __34__CRTTMergeableString_deltaMerge___block_invoke(uint64_t a1, uint64_t a2, const TopoSubstring *a3)
{
  int64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) attributedString];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = v6;
  id v13 = v7;
  if (*(_DWORD *)(a2 + 24))
  {
    uint64_t v11 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    TopoSubstring::removeDeltaAddsNotIn((TopoSubstring *)a2, a3);
    unsigned int v12 = [v9 addedByVersion];
    TopoSubstring::addAddsIn((TopoSubstring *)a2, a3, v12);

    mergeStringData(v9, v10 == v11, a2, (uint64_t)a3, v13, 1);
  }
  mergeAddChildren(a2, (uint64_t)a3, v8 + 48);
}

void __34__CRTTMergeableString_deltaMerge___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) attributedString];
  mergeAddNewSubstring(v1, v2);
}

- (id)undoCommandToChangeFrom:(id)a3 unedited:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [v6 undoCommandToChangeTo:self unedited:v7];
  }
  else
  {
    id v34 = v7;
    uint64_t v10 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
    uint64_t v11 = [(CRTTMergeableString *)self orderedSubstrings];
    unsigned int v12 = (long long **)*v11;
    id v13 = (long long **)v11[1];
    if ((long long **)*v11 != v13)
    {
      do
      {
        uint64_t v14 = *v12;
        if (*((_DWORD *)*v12 + 6))
        {
          uint64_t v15 = [(CRTTMergeableStringUndoEditCommand *)v10 deleteRanges];
          unint64_t v16 = (unint64_t)v15[2];
          uint64_t v17 = v15[1];
          if ((unint64_t)v17 >= v16)
          {
            uint64_t v20 = 0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (unsigned char *)*v15) >> 2);
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) > 0x924924924924924) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v16 - (void)*v15) >> 2);
            if (2 * v22 > v21) {
              unint64_t v21 = 2 * v22;
            }
            if (v22 >= 0x492492492492492) {
              unint64_t v23 = 0x924924924924924;
            }
            else {
              unint64_t v23 = v21;
            }
            if (v23) {
              id v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v15 + 2), v23);
            }
            else {
              id v24 = 0;
            }
            uint64_t v25 = &v24[28 * v20];
            long long v26 = *v14;
            *(_OWORD *)(v25 + 12) = *(long long *)((char *)v14 + 12);
            *(_OWORD *)uint64_t v25 = v26;
            id v28 = (char *)*v15;
            int v27 = (char *)v15[1];
            id v29 = v25;
            if (v27 != *v15)
            {
              do
              {
                long long v30 = *(_OWORD *)(v27 - 28);
                *(v29 - 1) = *((_OWORD *)v27 - 1);
                *(_OWORD *)((char *)v29 - 28) = v30;
                id v29 = (_OWORD *)((char *)v29 - 28);
                v27 -= 28;
              }
              while (v27 != v28);
              int v27 = (char *)*v15;
            }
            int v19 = v25 + 28;
            void *v15 = v29;
            v15[1] = v25 + 28;
            v15[2] = &v24[28 * v23];
            if (v27) {
              operator delete(v27);
            }
          }
          else
          {
            long long v18 = *v14;
            *(_OWORD *)((char *)v17 + 12) = *(long long *)((char *)v14 + 12);
            _OWORD *v17 = v18;
            int v19 = (char *)v17 + 28;
          }
          v15[1] = v19;
        }
        ++v12;
      }
      while (v12 != v13);
    }
    id v31 = [(CRTTMergeableStringUndoEditCommand *)v10 deleteRanges];
    if (v31[1] == *v31) {
      int v32 = 0;
    }
    else {
      int v32 = v10;
    }
    id v9 = v32;

    uint64_t v8 = v34;
  }

  return v9;
}

- (void)compareTo:(id)a3 merge:(id)a4 add:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(CRTTMergeableString *)self renameGeneration];
  if (v11 == [v8 renameGeneration])
  {
    uint64_t v12 = [v8 orderedSubstrings];
    __p = 0;
    long long v30 = 0;
    uint64_t v31 = 0;
    v28[0] = 0;
    v28[1] = 0;
    id v13 = [(CRTTMergeableString *)self orderedSubstrings];
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    while (v14 != v15)
    {
      uint64_t v16 = *v14;
      *(void *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](&v27, (_OWORD *)*v14++) = v16;
    }
    uint64_t v20 = *(uint64_t **)v12;
    unint64_t v21 = *(uint64_t **)(v12 + 8);
    if (v20 != v21)
    {
      do
        mergeSubstring(v9, v10, *v20++, (uint64_t)&v27, (uint64_t)&__p, 0);
      while (v20 != v21);
      unint64_t v22 = __p;
      unint64_t v23 = v30;
      while (v22 != v23)
      {
        id v24 = (void *)*v22;
        if (*v22)
        {
          uint64_t v25 = (void *)v24[7];
          if (v25)
          {
            v24[8] = v25;
            operator delete(v25);
          }
          long long v26 = (void *)v24[4];
          if (v26)
          {
            v24[5] = v26;
            operator delete(v26);
          }
          MEMORY[0x1C8781440](v24, 0x10A0C409FE6E197);
        }
        ++v22;
      }
    }
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v28[0]);
    if (__p)
    {
      long long v30 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v17 = +[CRGlobalContextObjC objCRenames];
    long long v18 = [v8 renamed:v17];
    int v19 = [(CRTTMergeableString *)self renamed:v17];
    [v19 compareTo:v18 merge:v9 add:v10];
  }
}

- (id)undoCommandToChangeTo:(id)a3 unedited:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke;
  v18[3] = &unk_1E64C18A8;
  int v19 = v8;
  uint64_t v20 = self;
  id v9 = v7;
  id v22 = v9;
  id v10 = v6;
  id v21 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke_2;
  v16[3] = &unk_1E64C17E0;
  int64_t v11 = v19;
  uint64_t v17 = v11;
  [(CRTTMergeableString *)self compareTo:v10 merge:v18 add:v16];
  [(CRTTMergeableStringUndoEditCommand *)v11 retainTemporaryIDs];
  uint64_t v12 = [(CRTTMergeableStringUndoEditCommand *)v11 deleteRanges];
  if (v12[1] == *v12
    && (id v13 = [(CRTTMergeableStringUndoEditCommand *)v11 insertStrings], v13[1] == *v13))
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = v11;
  }

  return v14;
}

void __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(a2 + 24)) {
    return;
  }
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  if (*((void *)a3 + 5) != *((void *)a3 + 4))
  {
    if (v6 == v7)
    {
      id v8 = (void **)[*(id *)(a1 + 32) deleteRanges];
      id v9 = v8[1];
      unint64_t v10 = (unint64_t)v8[2];
      if ((unint64_t)v9 >= v10)
      {
        uint64_t v34 = 0x6DB6DB6DB6DB6DB7 * (((char *)v9 - (unsigned char *)*v8) >> 2);
        unint64_t v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) > 0x924924924924924) {
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v36 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - (void)*v8) >> 2);
        if (2 * v36 > v35) {
          unint64_t v35 = 2 * v36;
        }
        if (v36 >= 0x492492492492492) {
          unint64_t v37 = 0x924924924924924;
        }
        else {
          unint64_t v37 = v35;
        }
        if (v37) {
          BOOL v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v8 + 2), v37);
        }
        else {
          BOOL v38 = 0;
        }
        id v52 = &v38[28 * v34];
        int v53 = &v38[28 * v37];
        long long v54 = *a3;
        *(_OWORD *)(v52 + 12) = *(long long *)((char *)a3 + 12);
        *(_OWORD *)id v52 = v54;
        uint64_t v12 = v52 + 28;
        uint64_t v56 = (char *)*v8;
        v55 = (char *)v8[1];
        if (v55 != *v8)
        {
          do
          {
            long long v57 = *(_OWORD *)(v55 - 28);
            *((_OWORD *)v52 - 1) = *((_OWORD *)v55 - 1);
            *(_OWORD *)(v52 - 28) = v57;
            v52 -= 28;
            v55 -= 28;
          }
          while (v55 != v56);
          v55 = (char *)*v8;
        }
        CRTTMergeableStringUndoEditCommand *v8 = v52;
        v8[1] = v12;
        v8[2] = v53;
        if (v55) {
          operator delete(v55);
        }
      }
      else
      {
        long long v11 = *a3;
        *(_OWORD *)((char *)v9 + 12) = *(long long *)((char *)a3 + 12);
        _OWORD *v9 = v11;
        uint64_t v12 = (char *)v9 + 28;
      }
      v8[1] = v12;
      return;
    }
    goto LABEL_12;
  }
  if (v6 == v7)
  {
LABEL_12:
    uint64_t v23 = *(void *)(a1 + 56);
    if (v23)
    {
      id v24 = [CRTTMergeableStringRange alloc];
      v60[0] = *a3;
      *(_OWORD *)((char *)v60 + 12) = *(long long *)((char *)a3 + 12);
      uint64_t v25 = [*(id *)(a1 + 40) renameGeneration];
      long long v26 = [*(id *)(a1 + 40) version];
      uint64_t v27 = [v26 maxCounter];

      id v28 = [*(id *)(a1 + 48) version];
      uint64_t v29 = [v28 maxCounter];

      if (v27 <= v29) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = v27;
      }
      uint64_t v31 = [(CRTTMergeableStringRange *)v24 initWithTopoIDRange:v60 renameGeneration:v25 maxCounter:v30];
      if (*((void *)a3 + 5) == *((void *)a3 + 4)) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = *((unsigned int *)a3 + 6);
      }
      if (*(void *)(a2 + 40) == *(void *)(a2 + 32)) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = *(unsigned int *)(a2 + 24);
      }
      (*(void (**)(uint64_t, CRTTMergeableStringRange *, void, uint64_t, void, uint64_t))(v23 + 16))(v23, v31, *((unsigned int *)a3 + 21), v32, *(unsigned int *)(a2 + 84), v33);
    }
    return;
  }
  id v13 = (char **)[*(id *)(a1 + 32) insertStrings];
  uint64_t v14 = [*(id *)(a1 + 40) attributedString];
  uint64_t v15 = v14;
  if (*(void *)(a2 + 40) == *(void *)(a2 + 32)) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = *(unsigned int *)(a2 + 24);
  }
  uint64_t v17 = objc_msgSend(v14, "cr_storageFromRange:", *(unsigned int *)(a2 + 84), v16);
  v61[0] = *a3;
  *(_OWORD *)((char *)v61 + 12) = *(long long *)((char *)a3 + 12);
  unint64_t v18 = (unint64_t)v13[2];
  unint64_t v19 = (unint64_t)v13[1];
  if (v19 >= v18)
  {
    unint64_t v39 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (void)*v13) >> 3);
    unint64_t v40 = v39 + 1;
    if (v39 + 1 > 0x666666666666666) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v41 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - (void)*v13) >> 3);
    if (2 * v41 > v40) {
      unint64_t v40 = 2 * v41;
    }
    if (v41 >= 0x333333333333333) {
      unint64_t v42 = 0x666666666666666;
    }
    else {
      unint64_t v42 = v40;
    }
    v59[4] = v13 + 2;
    id v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v13 + 2), v42);
    v45 = &v43[40 * v39];
    *(_OWORD *)(v45 + 12) = *(_OWORD *)((char *)v61 + 12);
    *(_OWORD *)v45 = v61[0];
    *((void *)v45 + 4) = v17;
    long long v47 = *v13;
    uint64_t v46 = v13[1];
    if (v46 == *v13)
    {
      unsigned int v51 = v13[1];
      uint64_t v48 = &v43[40 * v39];
    }
    else
    {
      uint64_t v48 = &v43[40 * v39];
      do
      {
        long long v49 = *(_OWORD *)(v46 - 40);
        *(_OWORD *)(v48 - 28) = *(_OWORD *)(v46 - 28);
        *(_OWORD *)(v48 - 40) = v49;
        uint64_t v50 = *((void *)v46 - 1);
        *((void *)v46 - 1) = 0;
        *((void *)v48 - 1) = v50;
        v48 -= 40;
        v46 -= 40;
      }
      while (v46 != v47);
      unsigned int v51 = *v13;
      uint64_t v46 = v13[1];
    }
    id v22 = v45 + 40;
    void *v13 = v48;
    v59[0] = v51;
    v59[1] = v51;
    v13[1] = v45 + 40;
    v59[2] = v46;
    v58 = v13[2];
    _OWORD v13[2] = &v43[40 * v44];
    v59[3] = v58;
    std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v59);
  }
  else
  {
    long long v20 = *a3;
    uint64_t v21 = *((void *)a3 + 2);
    *(_DWORD *)(v19 + 24) = *((_DWORD *)a3 + 6);
    *(void *)(v19 + 16) = v21;
    *(_OWORD *)unint64_t v19 = v20;
    *(void *)(v19 + 32) = v17;
    id v22 = (char *)(v19 + 40);
  }
  v13[1] = v22;
}

void __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke_2(uint64_t a1, long long *a2)
{
  if (*((void *)a2 + 5) != *((void *)a2 + 4))
  {
    char v3 = (void **)[*(id *)(a1 + 32) deleteRanges];
    uint64_t v4 = v3[1];
    unint64_t v5 = (unint64_t)v3[2];
    if ((unint64_t)v4 >= v5)
    {
      uint64_t v8 = 0x6DB6DB6DB6DB6DB7 * (((char *)v4 - (unsigned char *)*v3) >> 2);
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) > 0x924924924924924) {
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v10 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5 - (void)*v3) >> 2);
      if (2 * v10 > v9) {
        unint64_t v9 = 2 * v10;
      }
      if (v10 >= 0x492492492492492) {
        unint64_t v11 = 0x924924924924924;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11) {
        uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v3 + 2), v11);
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = &v12[28 * v8];
      uint64_t v14 = &v12[28 * v11];
      long long v15 = *a2;
      *(_OWORD *)(v13 + 12) = *(long long *)((char *)a2 + 12);
      *(_OWORD *)id v13 = v15;
      uint64_t v7 = v13 + 28;
      uint64_t v17 = (char *)*v3;
      uint64_t v16 = (char *)v3[1];
      if (v16 != *v3)
      {
        do
        {
          long long v18 = *(_OWORD *)(v16 - 28);
          *((_OWORD *)v13 - 1) = *((_OWORD *)v16 - 1);
          *(_OWORD *)(v13 - 28) = v18;
          v13 -= 28;
          v16 -= 28;
        }
        while (v16 != v17);
        uint64_t v16 = (char *)*v3;
      }
      *char v3 = v13;
      v3[1] = v7;
      v3[2] = v14;
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      long long v6 = *a2;
      *(_OWORD *)((char *)v4 + 12) = *(long long *)((char *)a2 + 12);
      *uint64_t v4 = v6;
      uint64_t v7 = (char *)v4 + 28;
    }
    v3[1] = v7;
  }
}

- (void)deltaTo:(id)a3 edited:(id)a4 unedited:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 0;
  uint64_t v52 = 0;
  int v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v46 = 0;
  long long v47 = &v46;
  uint64_t v48 = 0x4012000000;
  long long v49 = __Block_byref_object_copy__25;
  uint64_t v50 = __Block_byref_object_dispose__26;
  unsigned int v51 = &unk_1C44F329A;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  unint64_t v39 = __Block_byref_object_copy__28;
  unint64_t v40 = __Block_byref_object_dispose__29;
  id v41 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke;
  aBlock[3] = &unk_1E64C18D0;
  uint64_t v32 = &v42;
  uint64_t v33 = &v46;
  uint64_t v34 = &v52;
  id v11 = v9;
  id v31 = v11;
  unint64_t v35 = &v36;
  id v12 = v8;
  id v30 = v12;
  id v13 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_2;
  v20[3] = &unk_1E64C18F8;
  id v21 = v13;
  id v24 = v56;
  id v14 = v10;
  id v22 = v14;
  uint64_t v25 = &v42;
  id v15 = v11;
  id v23 = v15;
  long long v26 = &v46;
  uint64_t v27 = &v52;
  id v28 = &v36;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_3;
  v17[3] = &unk_1E64C1920;
  id v16 = v21;
  id v18 = v16;
  unint64_t v19 = v56;
  [(CRTTMergeableString *)self compareTo:v12 merge:v20 add:v17];
  if (*((unsigned char *)v43 + 24)) {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))v15 + 2))(v15, v47[6], v47[7], v53[3], v37[5]);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);
}

void __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || a2 > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56)
          + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48)
          + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ((*(void (**)(void))(*(void *)(a1 + 40) + 16))(),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0) == 0))
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)(v12 + 48) = a2;
    *(void *)(v12 + 56) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  if (a4 < 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) += a3;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a4;
    if (a4)
    {
      id v15 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v16 = [*(id *)(a1 + 32) attributedString];
      id v20 = v16;
      if (v15)
      {
        objc_msgSend(v15, "cr_appendStorage:fromRange:", v16, a5, a6);
      }
      else
      {
        uint64_t v17 = objc_msgSend(v16, "cr_storageFromRange:", a5, a6);
        uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
        unint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;
      }
    }
  }
}

uint64_t __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    long long v6 = (void *)result;
    uint64_t v8 = *(void *)(a3 + 32);
    uint64_t v7 = *(void *)(a3 + 40);
    uint64_t v10 = *(void *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 40);
    if (v7 == v8)
    {
      if (v9 != v10)
      {
        uint64_t v13 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
        return v13();
      }
    }
    else
    {
      if (v9 == v10)
      {
        result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
      }
      else
      {
        result = *(void *)(result + 40);
        if (result)
        {
          if (*(unsigned char *)(*(void *)(v6[8] + 8) + 24))
          {
            (*(void (**)(void))(v6[6] + 16))();
            *(unsigned char *)(*(void *)(v6[8] + 8) + 24) = 0;
            result = v6[5];
            uint64_t v8 = *(void *)(a3 + 32);
            uint64_t v7 = *(void *)(a3 + 40);
            uint64_t v10 = *(void *)(a2 + 32);
            uint64_t v9 = *(void *)(a2 + 40);
            unsigned int v3 = *(_DWORD *)(a2 + 24);
          }
          if (v7 == v8) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = *(unsigned int *)(a3 + 24);
          }
          if (v9 == v10) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = v3;
          }
          result = (*(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t))(result + 16))(result, *(unsigned int *)(a3 + 84), v11, *(unsigned int *)(a2 + 84), v12);
        }
      }
      *(void *)(*(void *)(v6[7] + 8) + 24) += *(unsigned int *)(a3 + 24);
    }
  }
  return result;
}

uint64_t __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 40) != *(void *)(a2 + 32))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(unsigned int *)(a2 + 24);
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) += v3;
  }
  return result;
}

- (void)sortSplitNodes
{
  v2[5] = *MEMORY[0x1E4F143B8];
  minIdPath((long long *)self->_startNode, 0, (uint64_t)v2);
}

- (void)traverseUnordered:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  long long v6 = [(CRTTMergeableString *)self attributedString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p = '%@'>", v5, self, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id attributedString = self->_attributedString;
  long long v6 = [v4 attributedString];
  LOBYTE(attributedString) = [attributedString isEqual:v6];

  BOOL v7 = (attributedString & 1) != 0 && [(CRTTMergeableString *)self graphIsEqual:v4];
  return v7;
}

- (BOOL)graphIsEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CRTTMergeableString *)self renameGeneration];
  if (v5 == [v4 renameGeneration])
  {
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 1;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x5812000000;
    uint64_t v36 = __Block_byref_object_copy__35;
    memset(v38, 0, sizeof(v38));
    unint64_t v37 = __Block_byref_object_dispose__36;
    uint64_t v39 = 0;
    int v40 = 1065353216;
    [(CRTTMergeableString *)self coalesce];
    [v4 coalesce];
    long long v6 = [(CRTTMergeableString *)self version];
    BOOL v7 = [v4 version];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0) {
      goto LABEL_29;
    }
    uint64_t v9 = [(CRTTMergeableString *)self addedByVersion];
    uint64_t v10 = [v4 addedByVersion];
    char v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0) {
      goto LABEL_29;
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    _OWORD v32[2] = __36__CRTTMergeableString_graphIsEqual___block_invoke;
    v32[3] = &unk_1E64C1740;
    v32[4] = &v33;
    [(CRTTMergeableString *)self traverseUnordered:v32];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __36__CRTTMergeableString_graphIsEqual___block_invoke_2;
    v31[3] = &unk_1E64C1948;
    v31[4] = &v33;
    v31[5] = &v41;
    [v4 traverseUnordered:v31];
    uint64_t v12 = v42;
    if (*((unsigned char *)v42 + 24))
    {
      uint64_t v13 = v34 + 8;
      do
      {
        uint64_t v13 = (void *)*v13;
        char v14 = v13 == 0;
        if (!v13) {
          break;
        }
        id v15 = (void *)v13[5];
        id v16 = (void *)v13[6];
        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17 || (v18 = v15[4], uint64_t v19 = v15[5], v20 = v16[4], v19 - v18 != v16[5] - v20))
        {
LABEL_33:
          char v14 = 0;
          *((unsigned char *)v12 + 24) = 0;
          break;
        }
        while (v18 != v19)
        {
          if (*(_DWORD *)(v18 + 20) != *(_DWORD *)(v20 + 20)
            || *(_DWORD *)(v18 + 16) != *(_DWORD *)(v20 + 16)
            || uuid_compare((const unsigned __int8 *)v18, (const unsigned __int8 *)v20))
          {
            goto LABEL_32;
          }
          v18 += 24;
          v20 += 24;
        }
        uint64_t v22 = v15[7];
        uint64_t v21 = v15[8];
        unint64_t v23 = (v21 - v22) >> 3;
        if (v23 != (uint64_t)(v16[8] - v16[7]) >> 3)
        {
LABEL_32:
          uint64_t v12 = v42;
          goto LABEL_33;
        }
        if (v21 != v22)
        {
          uint64_t v24 = 0;
          if (v23 <= 1) {
            uint64_t v25 = 1;
          }
          else {
            uint64_t v25 = (v21 - v22) >> 3;
          }
          while (1)
          {
            long long v26 = *(const unsigned __int8 **)(v15[7] + 8 * v24);
            if (uuid_compare(v26, v26)) {
              break;
            }
            if (v25 == ++v24) {
              goto LABEL_26;
            }
          }
          *((unsigned char *)v42 + 24) = 0;
        }
LABEL_26:
        uint64_t v12 = v42;
      }
      while (*((unsigned char *)v42 + 24));
    }
    else
    {
LABEL_29:
      char v14 = 0;
    }
    _Block_object_dispose(&v33, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v38[8]);
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v27 = +[CRGlobalContextObjC objCRenames];
    id v28 = [(CRTTMergeableString *)self renamed:v27];
    uint64_t v29 = [v4 renamed:v27];
    char v14 = [v28 graphIsEqual:v29];
  }
  return v14;
}

void *__36__CRTTMergeableString_graphIsEqual___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  BOOL v7 = a2;
  *((void *)std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v4, (uint64_t)a2, (uint64_t)&std::piecewise_construct, &v7)+ 5) = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  BOOL v7 = a2;
  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v5, (uint64_t)a2, (uint64_t)&std::piecewise_construct, &v7);
  result[6] = 0;
  return result;
}

uint64_t *__36__CRTTMergeableString_graphIsEqual___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::find<TopoID>((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), a2);
  if (result)
  {
    result[6] = a2;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)dotDescription:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v5, "appendFormat:", @"subgraph cluster_%ld%p_%ld {\n  rankdir=\"LR\";\n", a3, self, a3);
  uint64_t v34 = self;
  long long v6 = [(CRTTMergeableString *)self attributedString];
  BOOL v7 = [v6 description];

  id v31 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

  [(CRTTMergeableString *)self replica];
  char v8 = TopoReplica::toString((TopoReplica *)v35);
  [v5 appendFormat:@"  label=\"%@_%ld version=(%@) addedBy=(%@)    '%@'\"\n", v8, a3, v34->_version, v34->_addedByVersion, v31];

  [v5 appendFormat:@"  color=lightgrey;\n"];
  uint64_t v9 = [(CRTTMergeableString *)self orderedSubstrings];
  uint64_t v10 = *v9;
  uint64_t v32 = v9[1];
  if (*v9 != v32)
  {
    do
    {
      char v11 = *v10;
      if (v34->_startNode == *v10)
      {
        id v16 = @"  N%ld%p [label=\"Start\"];\n";
      }
      else
      {
        if (v34->_endNode != v11)
        {
          if (v11[5] == v11[4])
          {
            uint64_t v33 = &stru_1F1FA37D8;
          }
          else
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v12 = NSString;
              uint64_t v13 = [v34->_attributedString string];
              char v14 = v13;
              if (v11[5] == v11[4]) {
                uint64_t v15 = 0;
              }
              else {
                uint64_t v15 = *((unsigned int *)v11 + 6);
              }
              uint64_t v18 = objc_msgSend(v13, "substringWithRange:", *((unsigned int *)v11 + 21), v15);
              uint64_t v33 = [v12 stringWithFormat:@"%@", v18];

              goto LABEL_19;
            }
            objc_opt_class();
            uint64_t v33 = @"?";
            if (objc_opt_isKindOfClass())
            {
              if (v11[5] == v11[4]) {
                uint64_t v17 = 0;
              }
              else {
                uint64_t v17 = *((unsigned int *)v11 + 6);
              }
              uint64_t v19 = NSString;
              char v14 = objc_msgSend(v34->_attributedString, "substringWithRange:", *((unsigned int *)v11 + 21), v17);
              uint64_t v33 = [v19 stringWithFormat:@"%@", v14];
LABEL_19:
            }
          }
          id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          uint64_t v21 = (long long *)v11[4];
          uint64_t v22 = (long long *)v11[5];
          while (v21 != v22)
          {
            long long v23 = *v21;
            *(void *)&v35[16] = *((void *)v21 + 2);
            *(_OWORD *)uint64_t v35 = v23;
            uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v35];
            uint64_t v25 = [v24 CRTTShortDescription];
            [v20 appendFormat:@"%@.%d,%d ", v25, *(unsigned int *)&v35[16], *(unsigned int *)&v35[20]];

            uint64_t v21 = (long long *)((char *)v21 + 24);
          }
          long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v11];
          uint64_t v27 = [v26 CRTTShortDescription];
          objc_msgSend(v5, "appendFormat:", @"  N%ld%p [label=\"%@ %@.%d,%d-%u (%@)\"];\n",
            a3,
            v11,
            v33,
            v27,
            *((unsigned int *)v11 + 4),
            *((unsigned int *)v11 + 5),
            (*((_DWORD *)v11 + 5) + *((_DWORD *)v11 + 6) - 1),
            v20);

          goto LABEL_24;
        }
        id v16 = @"  N%ld%p [label=\"End\"];\n";
      }
      objc_msgSend(v5, "appendFormat:", v16, a3, v11);
LABEL_24:
      id v28 = (void *)v11[7];
      uint64_t v29 = (void *)v11[8];
      while (v28 != v29)
        objc_msgSend(v5, "appendFormat:", @"  N%ld%p -> N%ld%p;\n", a3, v11, a3, *v28++);
      ++v10;
    }
    while (v10 != v32);
  }
  [v5 appendString:@"}\n"];

  return v5;
}

- (void)useRenameIfAvailable
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_renamedString)
  {
    [(CRTTMergeableString *)obj deleteAllSubstrings];
    renamedString = obj->_renamedString;
    obj->_startNode = renamedString->_startNode;
    obj->_endNode = renamedString->_endNode;
    objc_storeStrong((id *)&obj->_version, renamedString->_version);
    objc_storeStrong((id *)&obj->_addedByVersion, obj->_renamedString->_addedByVersion);
    obj->_renameGeneration = [(CRTTMergeableString *)obj->_renamedString renameGeneration];
    obj->_renamedString->_startNode = 0;
    obj->_renamedString->_orderedSubstrings.__end_ = obj->_renamedString->_orderedSubstrings.__begin_;
    uint64_t v3 = obj->_renamedString;
    obj->_renamedString = 0;

    [(CRTTMergeableString *)obj invalidateCache];
  }
  objc_sync_exit(obj);
}

- (void)apply:(id)a3 skipRetain:(BOOL)a4 alwaysApply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v17 = v8;
  if (v6)
  {
    [(CRTTMergeableString *)self _apply:v8 alwaysApply:v5];
  }
  else
  {
    uint64_t v9 = [(CRTTMergeableString *)self version];
    uint64_t v10 = (void *)[v9 copy];

    char v11 = [(CRTTMergeableString *)self addedByVersion];
    uint64_t v12 = (void *)[v11 copy];

    [(CRTTMergeableString *)self _apply:v17 alwaysApply:v5];
    uint64_t v13 = [(CRTTMergeableString *)self version];
    char v14 = TopoReplica::objc(&self->_replica);
    +[CRGlobalContextObjC retainOrReleaseWithInitial:v10 current:v13 forReplica:v14];

    uint64_t v15 = [(CRTTMergeableString *)self addedByVersion];
    id v16 = [(CRTTMergeableString *)self addedByReplica];
    +[CRGlobalContextObjC retainOrReleaseWithInitial:v12 current:v15 forReplica:v16];
  }
}

- (void)_apply:(id)a3 alwaysApply:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(CRTTMergeableString *)self renameGeneration];
  if (v7 < [v6 generation] || a4)
  {
    id v8 = [(CRTTMergeableString *)self orderedSubstrings];
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    if (*v8 != v10)
    {
      do
      {
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x2020000000;
        uint64_t v11 = *v9;
        v18[3] = v11;
        if (*(_DWORD *)(v11 + 16))
        {
          uint64_t v12 = TopoReplica::objc((TopoReplica *)v11);
          uint64_t v13 = objc_msgSend(v6, "renamedWithRange:replica:", *(unsigned int *)(v11 + 20), *(unsigned int *)(v11 + 24), v12);
          uint64_t v14 = *(unsigned int *)(v11 + 20);
          uint64_t v15 = *(unsigned int *)(v11 + 24);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __42__CRTTMergeableString__apply_alwaysApply___block_invoke;
          v17[3] = &unk_1E64C1970;
          void v17[4] = self;
          v17[5] = v18;
          objc_msgSend(v13, "enumerateRangesIn::", v14, v15, v17);
        }
        _Block_object_dispose(v18, 8);
        ++v9;
      }
      while (v9 != v10);
    }
    [(CRTTMergeableString *)self invalidateCache];
    if (!a4) {
      -[CRTTMergeableString setRenameGeneration:](self, "setRenameGeneration:", [v6 generation]);
    }
    id v16 = [(CRTTMergeableString *)self version];
    [v16 apply:v6];

    [(CRTTMergeableString *)self applyTimestampRenames:v6];
    [(CRTTMergeableString *)self coalesce];
  }
}

uint64_t __42__CRTTMergeableString__apply_alwaysApply___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a3 >= *(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 24))
  {
    uint64_t v9 = 0;
    if (a5 < 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "splitTopoSubstring:atIndex:");
  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_5:
    TopoReplica::TopoReplica(&v13, v8, 0);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    unsigned int index = v13.index;
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v13.uuid;
    *(_DWORD *)(v10 + 16) = index;
    *(_DWORD *)(v10 + 20) = a5;
  }
LABEL_6:
  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }

  return 0;
}

- (void)applyTimestampRenames:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRTTMergeableString *)self orderedSubstrings];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3812000000;
  long long v26 = __Block_byref_object_copy__82;
  uint64_t v27 = __Block_byref_object_dispose__83;
  id v28 = &unk_1C44F329A;
  uint64_t v6 = *v5;
  uint64_t v29 = v6;
  while (v6 != v5[1])
  {
    uint64_t v7 = *(void *)v6;
    uint64_t v8 = *(void *)(*(void *)v6 + 32);
    uint64_t v9 = *(void *)(*(void *)v6 + 40);
    if (v8 != v9)
    {
      char v10 = 0;
      do
      {
        if (*(_DWORD *)(v8 + 16))
        {
          uint64_t v11 = TopoReplica::objc((TopoReplica *)v8);
          uint64_t v12 = *(unsigned int *)(v8 + 20);
          uint64_t v13 = *(unsigned int *)(v7 + 24);
          uint64_t v14 = objc_msgSend(v4, "renamedWithRange:replica:", v12, v13, v11);
          uint64_t v15 = objc_msgSend(v14, "rangeCountIn:", v12, v13);
          if (v15 == 1)
          {
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __45__CRTTMergeableString_applyTimestampRenames___block_invoke;
            v22[3] = &__block_descriptor_40_e34_B40__0__NSRange_QQ_8__NSUUID_24q32l;
            v22[4] = v8;
            objc_msgSend(v14, "enumerateRangesIn::", v12, v13, v22);
          }
          else if (v15 >= 2)
          {
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __45__CRTTMergeableString_applyTimestampRenames___block_invoke_2;
            v21[3] = &unk_1E64C19B8;
            v21[4] = &v23;
            v21[5] = v7;
            v21[6] = v5;
            objc_msgSend(v14, "enumerateRangesIn::", v12, v13, v21);

            uint64_t v6 = v24[6];
            goto LABEL_16;
          }

          char v10 = 1;
        }
        v8 += 24;
      }
      while (v8 != v9);
      if (v10)
      {
        unint64_t v16 = *(void *)(v7 + 32);
        id v17 = *(__n128 **)(v7 + 40);
        unint64_t v18 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v17 - v16) >> 3));
        if (v17 == (__n128 *)v16) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = v18;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,TopoID *,false>(v16, v17, (uint64_t)v30, v19, 1);
      }
    }
    uint64_t v6 = v24[6] + 8;
    v24[6] = v6;
LABEL_16:
    ;
  }
  _Block_object_dispose(&v23, 8);
  id v20 = [(CRTTMergeableString *)self addedByVersion];
  [v20 apply:v4];
}

uint64_t __45__CRTTMergeableString_applyTimestampRenames___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a4;
  if ((a5 & 0x8000000000000000) == 0)
  {
    TopoReplica::TopoReplica(&v11, v7, 0);
    uint64_t v8 = *(void *)(a1 + 32);
    unsigned int index = v11.index;
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v11.uuid;
    *(_DWORD *)(v8 + 16) = index;
    *(_DWORD *)(v8 + 20) = a5;
  }

  return 1;
}

void __45__CRTTMergeableString_applyTimestampRenames___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 40);
  if (a3 < *(unsigned int *)(v7 + 24)) {
    TopoSubstring::splitAt((TopoSubstring *)v7);
  }
  __assert_rtn("-[CRTTMergeableString applyTimestampRenames:]_block_invoke_2", "TTMergeableString.mm", 2553, "0");
}

- (id)renamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRTTMergeableString *)self renameGeneration];
  if (v5 >= [v4 generation] && (objc_msgSend(v4, "hasLocalRenames") & 1) == 0)
  {
    char v10 = self;
    goto LABEL_14;
  }
  id v6 = self;
  objc_sync_enter(v6);
  renamedString = v6->_renamedString;
  if (!renamedString)
  {
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [(CRTTMergeableString *)renamedString renameGeneration];
  if (v8 < [v4 generation])
  {
    uint64_t v9 = v6->_renamedString;
LABEL_9:
    if (v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v6;
    }
    uint64_t v13 = [(CRTTMergeableString *)v12 copyRenamedIfAvailable:0];
    [(CRTTMergeableString *)v13 apply:v4 skipRetain:0 alwaysApply:0];
    uint64_t v14 = v6->_renamedString;
    v6->_renamedString = v13;
    uint64_t v15 = v13;

    char v10 = v6->_renamedString;
    goto LABEL_13;
  }
  char v11 = [v4 hasLocalRenames];
  uint64_t v9 = v6->_renamedString;
  if (v11) {
    goto LABEL_9;
  }
  char v10 = v9;
LABEL_13:
  objc_sync_exit(v6);

LABEL_14:
  return v10;
}

- (id)temporaryConcurrentNames
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(ObjCRenameSequence);
  startNode = (long long *)self->_startNode;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CRTTMergeableString_temporaryConcurrentNames__block_invoke;
  v7[3] = &unk_1E64C19E0;
  uint64_t v5 = v3;
  uint64_t v8 = v5;
  minIdPath(startNode, v7, (uint64_t)v9);

  return v5;
}

void __47__CRTTMergeableString_temporaryConcurrentNames__block_invoke(uint64_t a1, TopoReplica *this)
{
  uint64_t v2 = *(void **)(a1 + 32);
  TopoReplica::objc(this);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addWithReplica:range:");
}

- (id)renamedIfAvailable
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  renamedString = v2->_renamedString;
  if (!renamedString) {
    renamedString = v2;
  }
  id v4 = renamedString;
  objc_sync_exit(v2);

  return v4;
}

- (void)applyRenamesAndRetainOrRelease:(id)a3 context:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (([v10 isEmpty] & 1) == 0)
  {
    uint64_t v7 = [(CRTTMergeableString *)self version];
    uint64_t v8 = +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v10, [v7 maxCounter], v6);

    [(CRTTMergeableString *)self apply:v8 skipRetain:0 alwaysApply:1];
    uint64_t v9 = +[CRGlobalContextObjC objCRenames];
    [(CRTTMergeableString *)self apply:v9 skipRetain:0 alwaysApply:0];

    [(CRTTMergeableString *)self setContext:v6];
  }
}

- (BOOL)needToFinalizeTimestamps
{
  id v3 = [(CRTTMergeableString *)self orderedSubstrings];
  for (uint64_t i = (uint64_t *)*v3; i != (uint64_t *)v3[1]; ++i)
  {
    uint64_t v5 = *i;
    if (*(_DWORD *)(*i + 16)) {
      return 1;
    }
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)(v5 + 40);
    while (v6 != v7)
    {
      if (*(_DWORD *)(v6 + 16)) {
        return 1;
      }
      v6 += 24;
    }
  }
  uint64_t v9 = [(CRTTMergeableString *)self addedByVersion];
  char v8 = [v9 hasTemporaryComponents];

  return v8;
}

- (void)finalizeTimestamps:(id)a3
{
  id v7 = a3;
  [(CRTTMergeableString *)self useRenameIfAvailable];
  id v4 = [(CRTTMergeableString *)self temporaryNamesExcludingSelf:0];
  uint64_t v5 = [(CRTTMergeableString *)self version];
  uint64_t v6 = +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v4, [v5 maxCounter], v7);

  [(CRTTMergeableString *)self apply:v6 skipRetain:0 alwaysApply:0];
  [(CRTTMergeableString *)self setContext:v7];
}

- (NSObject)context
{
  return self->_context;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TopoReplica)replica
{
  *retstr = *(TopoReplica *)((char *)self + 144);
  return self;
}

- (int64_t)localCounter
{
  return self->_localCounter;
}

- (void)setLocalCounter:(int64_t)a3
{
  self->_int64_t localCounter = a3;
}

- (ObjCReplica)addedByReplica
{
  return self->_addedByReplica;
}

- (int64_t)addedByLocalCounter
{
  return self->_addedByLocalCounter;
}

- (void)setAddedByLocalCounter:(int64_t)a3
{
  self->_int64_t addedByLocalCounter = a3;
}

- (void)startNode
{
  return self->_startNode;
}

- (void)endNode
{
  return self->_endNode;
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4
{
  while (2)
  {
    unint64_t v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          uint64_t v11 = (uint64_t)a2 - v10;
          unint64_t v12 = (uint64_t)((uint64_t)a2 - v10) >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                unint64_t v34 = *((void *)a2 - 2);
                uint64_t v33 = a2 - 1;
                if (*(void *)v10 < v34)
                {
                  long long v87 = *(_OWORD *)v10;
                  *(_OWORD *)unint64_t v10 = *v33;
                  *uint64_t v33 = v87;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)v10, (unint64_t *)(v10 + 16), (unint64_t *)a2 - 2);
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(CRTTMergeableString *)(long long *)v10 deleteSubstrings:(unint64_t *)(v10 + 32) withCharacterRanges:a2 - 1];
                break;
              case 5uLL:
                uint64_t v35 = (long long *)(v10 + 16);
                uint64_t v36 = (long long *)(v10 + 32);
                unint64_t v37 = (long long *)(v10 + 48);
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(CRTTMergeableString *)(long long *)v10 deleteSubstrings:(unint64_t *)(v10 + 32) withCharacterRanges:(_OWORD *)(v10 + 48)];
                unint64_t v39 = *((void *)a2 - 2);
                uint64_t v38 = a2 - 1;
                if (*(void *)(v10 + 48) < v39)
                {
                  long long v40 = *v37;
                  *unint64_t v37 = *v38;
                  *uint64_t v38 = v40;
                  if (*(void *)v36 < *(void *)v37)
                  {
                    long long v41 = *v36;
                    *uint64_t v36 = *v37;
                    *unint64_t v37 = v41;
                    if (*(void *)v35 < *(void *)v36)
                    {
                      long long v42 = *v35;
                      *uint64_t v35 = *v36;
                      *uint64_t v36 = v42;
                      if (*(void *)v10 < *(void *)(v10 + 16))
                      {
                        long long v88 = *(_OWORD *)v10;
                        *(_OWORD *)unint64_t v10 = *v35;
                        *uint64_t v35 = v88;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 383)
          {
            uint64_t v43 = (long long *)(v10 + 16);
            BOOL v45 = (long long *)v10 == a2 || v43 == a2;
            if (a4)
            {
              if (!v45)
              {
                uint64_t v46 = 0;
                long long v47 = (unint64_t *)v10;
                do
                {
                  uint64_t v48 = v43;
                  unint64_t v49 = v47[2];
                  if (*v47 < v49)
                  {
                    unint64_t v50 = v47[3];
                    uint64_t v51 = v46;
                    while (1)
                    {
                      *(_OWORD *)(v10 + v51 + 16) = *(_OWORD *)(v10 + v51);
                      if (!v51) {
                        break;
                      }
                      unint64_t v52 = *(void *)(v10 + v51 - 16);
                      v51 -= 16;
                      if (v52 >= v49)
                      {
                        int v53 = (void *)(v10 + v51 + 16);
                        goto LABEL_81;
                      }
                    }
                    int v53 = (void *)v10;
LABEL_81:
                    *int v53 = v49;
                    v53[1] = v50;
                  }
                  uint64_t v43 = v48 + 1;
                  v46 += 16;
                  long long v47 = (unint64_t *)v48;
                }
                while (v48 + 1 != a2);
              }
            }
            else if (!v45)
            {
              do
              {
                unint64_t v79 = (unint64_t)v43;
                unint64_t v80 = *(void *)(a1 + 16);
                if (*(void *)a1 < v80)
                {
                  uint64_t v81 = *(void *)(a1 + 24);
                  unint64_t v82 = v79;
                  do
                  {
                    *(_OWORD *)unint64_t v82 = *(_OWORD *)(v82 - 16);
                    unint64_t v83 = *(void *)(v82 - 32);
                    v82 -= 16;
                  }
                  while (v83 < v80);
                  *(void *)unint64_t v82 = v80;
                  *(void *)(v82 + 8) = v81;
                }
                uint64_t v43 = (long long *)(v79 + 16);
                a1 = v79;
              }
              while ((long long *)(v79 + 16) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((long long *)v10 != a2)
            {
              int64_t v54 = (v12 - 2) >> 1;
              int64_t v55 = v54;
              do
              {
                int64_t v56 = v55;
                if (v54 >= v55)
                {
                  uint64_t v57 = (2 * v55) | 1;
                  v58 = (unint64_t *)(v10 + 16 * v57);
                  unint64_t v59 = *v58;
                  if (2 * v56 + 2 < (uint64_t)v12 && v58[2] < v59)
                  {
                    unint64_t v59 = v58[2];
                    v58 += 2;
                    uint64_t v57 = 2 * v56 + 2;
                  }
                  v60 = (long long *)(v10 + 16 * v56);
                  long long v61 = *v60;
                  unint64_t v62 = *(void *)v60;
                  if (*(void *)v60 >= v59)
                  {
                    do
                    {
                      uint64_t v63 = (long long *)v58;
                      long long *v60 = *(_OWORD *)v58;
                      if (v54 < v57) {
                        break;
                      }
                      uint64_t v64 = (2 * v57) | 1;
                      v58 = (unint64_t *)(v10 + 16 * v64);
                      uint64_t v57 = 2 * v57 + 2;
                      unint64_t v65 = *v58;
                      if (v57 < (uint64_t)v12)
                      {
                        if (v58[2] >= v65)
                        {
                          uint64_t v57 = v64;
                        }
                        else
                        {
                          unint64_t v65 = v58[2];
                          v58 += 2;
                        }
                      }
                      else
                      {
                        uint64_t v57 = v64;
                      }
                      v60 = v63;
                    }
                    while (v62 >= v65);
                    *uint64_t v63 = v61;
                  }
                }
                int64_t v55 = v56 - 1;
              }
              while (v56);
              uint64_t v66 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v67 = 0;
                long long v89 = *(_OWORD *)v10;
                v68 = (_OWORD *)v10;
                do
                {
                  v69 = &v68[v67 + 1];
                  uint64_t v70 = (2 * v67) | 1;
                  uint64_t v71 = 2 * v67 + 2;
                  if (v71 < v66 && *((void *)v69 + 2) < *(void *)v69)
                  {
                    ++v69;
                    uint64_t v70 = v71;
                  }
                  _OWORD *v68 = *v69;
                  v68 = v69;
                  uint64_t v67 = v70;
                }
                while (v70 <= (uint64_t)((unint64_t)(v66 - 2) >> 1));
                if (v69 == --a2)
                {
                  long long *v69 = v89;
                }
                else
                {
                  long long *v69 = *a2;
                  *a2 = v89;
                  uint64_t v72 = (uint64_t)v69 - v10 + 16;
                  if (v72 >= 17)
                  {
                    unint64_t v73 = (((unint64_t)v72 >> 4) - 2) >> 1;
                    v74 = (long long *)(v10 + 16 * v73);
                    unint64_t v75 = *(void *)v69;
                    if (*(void *)v69 < *(void *)v74)
                    {
                      uint64_t v76 = *((void *)v69 + 1);
                      do
                      {
                        v77 = v74;
                        long long *v69 = *v74;
                        if (!v73) {
                          break;
                        }
                        unint64_t v73 = (v73 - 1) >> 1;
                        v74 = (long long *)(v10 + 16 * v73);
                        v69 = v77;
                      }
                      while (v75 < *(void *)v74);
                      *(void *)v77 = v75;
                      *((void *)v77 + 1) = v76;
                    }
                  }
                }
              }
              while (v66-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          uint64_t v14 = (unint64_t *)(v10 + 16 * (v12 >> 1));
          if ((unint64_t)v11 >= 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)a1, (unint64_t *)(a1 + 16 * (v12 >> 1)), (unint64_t *)a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 16), v14 - 2, (unint64_t *)a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 32), (unint64_t *)(a1 + 16 + 16 * v13), (unint64_t *)a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)v14 - 1, v14, (unint64_t *)(a1 + 16 + 16 * v13));
            long long v84 = *(_OWORD *)a1;
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(_OWORD *)uint64_t v14 = v84;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 16 * (v12 >> 1)), (unint64_t *)a1, (unint64_t *)a2 - 2);
          }
          --a3;
          unint64_t v15 = *(void *)a1;
          if (a4) {
            break;
          }
          uint64_t v16 = *(void *)(a1 + 8);
          if (v15 < *(void *)(a1 - 16)) {
            goto LABEL_12;
          }
          if (*((void *)a2 - 2) >= v15)
          {
            unint64_t v28 = a1 + 16;
            do
            {
              unint64_t v10 = v28;
              if (v28 >= (unint64_t)a2) {
                break;
              }
              v28 += 16;
            }
            while (*(void *)v10 >= v15);
          }
          else
          {
            unint64_t v10 = a1;
            do
            {
              unint64_t v27 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v27 >= v15);
          }
          uint64_t v29 = a2;
          if (v10 < (unint64_t)a2)
          {
            uint64_t v29 = a2;
            do
              unint64_t v30 = *((void *)v29-- - 2);
            while (v30 < v15);
          }
          while (v10 < (unint64_t)v29)
          {
            long long v86 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *v29;
            *uint64_t v29 = v86;
            do
            {
              unint64_t v31 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v31 >= v15);
            do
              unint64_t v32 = *((void *)v29-- - 2);
            while (v32 < v15);
          }
          BOOL v4 = v10 - 16 >= a1;
          BOOL v5 = v10 - 16 == a1;
          if (v10 - 16 != a1) {
            *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
          }
          a4 = 0;
          *(void *)(v10 - 16) = v15;
          *(void *)(v10 - 8) = v16;
        }
        uint64_t v16 = *(void *)(a1 + 8);
LABEL_12:
        uint64_t v17 = 0;
        do
        {
          unint64_t v18 = *(void *)(a1 + v17 + 16);
          v17 += 16;
        }
        while (v15 < v18);
        unint64_t v19 = a1 + v17;
        id v20 = a2;
        if (v17 == 16)
        {
          id v20 = a2;
          do
          {
            if (v19 >= (unint64_t)v20) {
              break;
            }
            unint64_t v22 = *((void *)v20-- - 2);
          }
          while (v15 >= v22);
        }
        else
        {
          do
            unint64_t v21 = *((void *)v20-- - 2);
          while (v15 >= v21);
        }
        unint64_t v10 = a1 + v17;
        if (v19 < (unint64_t)v20)
        {
          uint64_t v23 = v20;
          do
          {
            long long v85 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *v23;
            long long *v23 = v85;
            do
            {
              unint64_t v24 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v15 < v24);
            do
              unint64_t v25 = *((void *)v23-- - 2);
            while (v15 >= v25);
          }
          while (v10 < (unint64_t)v23);
        }
        if (v10 - 16 != a1) {
          *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
        }
        *(void *)(v10 - 16) = v15;
        *(void *)(v10 - 8) = v16;
        if (v19 >= (unint64_t)v20) {
          break;
        }
LABEL_31:
        std::__introsort<std::_ClassicAlgPolicy,[(CRTTMergeableString *)a1 deleteSubstrings:a3 withCharacterRanges:a4 & 1];
        a4 = 0;
      }
      BOOL v26 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>(a1, (_OWORD *)(v10 - 16));
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>(v10, a2))
      {
        break;
      }
      if (!v26) {
        goto LABEL_31;
      }
    }
    a2 = (long long *)(v10 - 16);
    if (!v26) {
      continue;
    }
    break;
  }
}

- (BOOL)hasAllIDsIn:(void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  int v21 = 1065353216;
  BOOL v4 = *(long long **)a3;
  BOOL v5 = (long long *)*((void *)a3 + 1);
  if (*(long long **)a3 != v5)
  {
    do
    {
      long long v6 = *v4;
      *(_OWORD *)&v23[12] = *(long long *)((char *)v4 + 12);
      *(_OWORD *)uint64_t v23 = v6;
      id v24 = *((id *)v4 + 4);
      if (v24)
      {
        id v7 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::find<TopoReplica>(&v19, (uint64_t)v23);
        if (v7)
        {
          objc_msgSend((id)v7[5], "addIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24]);
        }
        else
        {
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24], v19, (void)v20);
          unint64_t v22 = (long long *)v23;
          uint64_t v9 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::__emplace_unique_key_args<TopoReplica,std::piecewise_construct_t const&,std::tuple<TopoReplica const&>,std::tuple<>>((uint64_t)&v19, (uint64_t)v23, (uint64_t)&std::piecewise_construct, &v22);
          unint64_t v10 = (void *)v9[5];
          v9[5] = v8;
        }
      }

      BOOL v4 = (long long *)((char *)v4 + 40);
    }
    while (v4 != v5);
  }
  uint64_t v11 = [(CRTTMergeableString *)self orderedSubstrings];
  unint64_t v12 = (long long **)*v11;
  unint64_t v13 = (long long **)v11[1];
  while (v12 != v13)
  {
    long long v14 = **v12;
    *(_OWORD *)&v23[12] = *(long long *)((char *)*v12 + 12);
    *(_OWORD *)uint64_t v23 = v14;
    unint64_t v15 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::find<TopoReplica>(&v19, (uint64_t)v23);
    uint64_t v16 = v15;
    if (v15)
    {
      objc_msgSend((id)v15[5], "removeIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24]);
      if (![(id)v16[5] count]) {
        std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::erase(&v19, v16);
      }
    }
    ++v12;
  }
  BOOL v17 = *((void *)&v20 + 1) == 0;
  std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::~__hash_table((uint64_t)&v19);
  return v17;
}

- (void)undeleteSubstrings:(void *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = *(long long **)a3;
  BOOL v4 = (long long *)*((void *)a3 + 1);
  if (*(long long **)a3 != v4)
  {
    do
    {
      long long v22 = *v3;
      *((void *)&v6 + 1) = *((void *)&v22 + 1);
      int v23 = *((_DWORD *)v3 + 4);
      *(void *)&long long v6 = *(void *)((char *)v3 + 20);
      long long v15 = v6;
      id v7 = *((id *)v3 + 4);
      if (v7)
      {
        __p = 0;
        BOOL v17 = 0;
        uint64_t v18 = 0;
        long long v19 = v22;
        int v20 = v23;
        uint64_t v21 = v15;
        [(CRTTMergeableString *)self getSubstrings:&__p forTopoIDRange:&v19];
        uint64_t v8 = (char *)__p;
        uint64_t v9 = v17;
        if (v17 != __p)
        {
          do
          {
            uint64_t v11 = *((void *)v9 - 1);
            v9 -= 8;
            unint64_t v10 = (_DWORD *)v11;
            if (*(void *)(v11 + 40) == *(void *)(v11 + 32))
            {
              int v13 = v10[5];
              uint64_t v12 = v10[6];
              long long v14 = [(CRTTMergeableString *)self attributedString];
              objc_msgSend(v14, "cr_replaceStorageInRange:withStorage:fromRange:", v10[21], 0, v7, (v13 - v15), v12);

              [(CRTTMergeableString *)self addNewAddedByFor:v10];
              uint64_t v8 = (char *)__p;
            }
          }
          while (v9 != v8);
        }
        [(CRTTMergeableString *)self updateSubstringIndexes];
        if (__p)
        {
          BOOL v17 = (char *)__p;
          operator delete(__p);
        }
      }

      id v3 = (long long *)((char *)v3 + 40);
    }
    while (v3 != v4);
  }
}

@end