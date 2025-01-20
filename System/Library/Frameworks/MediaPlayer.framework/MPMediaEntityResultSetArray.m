@interface MPMediaEntityResultSetArray
- (BOOL)isQueryResultSetInvalidated;
- (MPMediaEntityResultSetArray)initWithResultSet:(id)a3 queryCriteria:(id)a4 entityType:(int64_t)a5 library:(id)a6;
- (MPMediaLibraryResultSet)resultSet;
- (id)objectAtIndex:(unint64_t)a3;
- (id)sectionInfo;
- (unint64_t)count;
@end

@implementation MPMediaEntityResultSetArray

void __45__MPMediaEntityResultSetArray_objectAtIndex___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) persistentIDAtIndex:a1[6]];
  uint64_t v3 = a1[4];
  if (!*(void *)(v3 + 40))
  {
    unint64_t v4 = [*(id *)(v3 + 8) count];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    uint64_t v6 = a1[4];
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (v4)
    {
      unsigned int v8 = 1;
      do
      {
        v9 = *(void **)(a1[4] + 40);
        v10 = [MEMORY[0x1E4F1CA98] null];
        [v9 addObject:v10];
      }
      while (v4 > v8++);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  v12 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
  v13 = [MEMORY[0x1E4F1CA98] null];

  if (v12 == v13)
  {
    int v14 = [*(id *)(a1[4] + 16) isSubclassOfClass:objc_opt_class()];
    uint64_t v15 = a1[4];
    if (v14)
    {
      if ([*(id *)(v15 + 56) groupingType] != 6)
      {
        v19 = +[MPMediaItem persistentIDPropertyForGroupingType:](MPMediaItem, "persistentIDPropertyForGroupingType:", [*(id *)(a1[4] + 56) groupingType]);
        v20 = [NSNumber numberWithUnsignedLongLong:v2];
        v21 = +[MPMediaPropertyPredicate predicateWithValue:v20 forProperty:v19];

        v18 = (void *)[*(id *)(a1[4] + 56) copy];
        [v18 addFilterPredicate:v21];
        [v18 setGroupingType:0];
        [v18 setOrderingProperties:0];
        [v18 setEntityLimit:0];
        v22 = [[MPMediaQuery alloc] initWithCriteria:v18 library:WeakRetained];
        v23 = objc_msgSend(objc_alloc(*(Class *)(a1[4] + 16)), "initWithIdentifier:itemsQuery:grouping:", v2, v22, objc_msgSend(*(id *)(a1[4] + 56), "groupingType"));
        [*(id *)(a1[4] + 40) setObject:v23 atIndexedSubscript:a1[6]];

        goto LABEL_14;
      }
      uint64_t v16 = [WeakRetained playlistWithPersistentID:v2];
    }
    else
    {
      uint64_t v17 = *(void *)(v15 + 16);
      if (v17 != objc_opt_class())
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], *(void *)(a1[4] + 16));
      }
      uint64_t v16 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:v2 library:WeakRetained];
    }
    v18 = (void *)v16;
    [*(id *)(a1[4] + 40) setObject:v16 atIndexedSubscript:a1[6]];
LABEL_14:
  }
  uint64_t v24 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
  uint64_t v25 = *(void *)(a1[5] + 8);
  v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;
}

- (unint64_t)count
{
  return [(MPMediaLibraryResultSet *)self->_resultSet count];
}

- (MPMediaEntityResultSetArray)initWithResultSet:(id)a3 queryCriteria:(id)a4 entityType:(int64_t)a5 library:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MPMediaEntityResultSetArray;
  int v14 = [(MPMediaEntityResultSetArray *)&v31 init];
  uint64_t v15 = v14;
  if (v14)
  {
    p_resultSet = (id *)&v14->_resultSet;
    objc_storeStrong((id *)&v14->_resultSet, a3);
    id v17 = v12;
    v18 = v17;
    if (a5) {
      [v17 groupingType];
    }
    id v19 = (id)objc_opt_class();

    v15->_entityClass = (Class)v19;
    objc_storeWeak((id *)&v15->_library, v13);
    objc_storeStrong((id *)&v15->_queryCriteria, a4);
    v20 = objc_alloc_init(MPMediaQueryMutableSectionInfo);
    id v21 = *p_resultSet;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __82__MPMediaEntityResultSetArray_initWithResultSet_queryCriteria_entityType_library___block_invoke;
    v29[3] = &unk_1E57F15B0;
    v22 = v20;
    v30 = v22;
    [v21 enumerateSectionHeadersUsingBlock:v29];
    v23 = [*p_resultSet sectionIndexTitles];
    [(MPMediaQuerySectionInfo *)v22 setSectionIndexTitles:v23];

    sectionInfo = v15->_sectionInfo;
    v15->_sectionInfo = &v22->super;
    uint64_t v25 = v22;

    v15->_revision = [*p_resultSet localRevision];
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.mediaplayer.ResultSetEntities", 0);
    entitiesQueue = v15->_entitiesQueue;
    v15->_entitiesQueue = (OS_dispatch_queue *)v26;
  }
  return v15;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__21447;
  id v11 = __Block_byref_object_dispose__21448;
  id v12 = 0;
  entitiesQueue = self->_entitiesQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MPMediaEntityResultSetArray_objectAtIndex___block_invoke;
  v6[3] = &unk_1E57F3998;
  v6[6] = a3;
  v6[7] = a2;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(entitiesQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __82__MPMediaEntityResultSetArray_initWithResultSet_queryCriteria_entityType_library___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) addSectionWithHeaderTitle:a3 sectionIndexTitleIndex:a4 count:a2];
}

- (id)sectionInfo
{
  return self->_sectionInfo;
}

- (MPMediaLibraryResultSet)resultSet
{
  return self->_resultSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCriteria, 0);
  objc_storeStrong((id *)&self->_entitiesQueue, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_destroyWeak((id *)&self->_library);

  objc_storeStrong((id *)&self->_resultSet, 0);
}

- (BOOL)isQueryResultSetInvalidated
{
  [(MPMediaLibraryResultSet *)self->_resultSet updateToLibraryCurrentRevision];
  int64_t revision = self->_revision;
  return revision != [(MPMediaLibraryResultSet *)self->_resultSet localRevision];
}

@end