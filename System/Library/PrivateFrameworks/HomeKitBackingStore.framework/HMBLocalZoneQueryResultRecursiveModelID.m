@interface HMBLocalZoneQueryResultRecursiveModelID
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalZoneQueryResultRecursiveModelID)initWithLocalZone:(id)a3 modelID:(id)a4;
- (NSMutableOrderedSet)modelStack;
- (NSMutableSet)returnedModels;
- (NSUUID)parentModelID;
- (id)nextObject;
- (int)parentModelIDOffset;
- (void)setParentModelID:(id)a3;
@end

@implementation HMBLocalZoneQueryResultRecursiveModelID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedModels, 0);
  objc_storeStrong((id *)&self->_modelStack, 0);
  objc_storeStrong((id *)&self->_parentModelID, 0);
}

- (NSMutableSet)returnedModels
{
  return self->_returnedModels;
}

- (NSMutableOrderedSet)modelStack
{
  return self->_modelStack;
}

- (void)setParentModelID:(id)a3
{
}

- (NSUUID)parentModelID
{
  return self->_parentModelID;
}

- (int)parentModelIDOffset
{
  return self->_parentModelIDOffset;
}

- (id)nextObject
{
  while (1)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMBLocalZoneQueryResultRecursiveModelID;
    v3 = [(HMBSQLQueryIterator *)&v14 nextObject];
    if (v3) {
      break;
    }
    v8 = [(HMBLocalZoneQueryResultRecursiveModelID *)self modelStack];
    v4 = (void *)[v8 count];

    if (!v4) {
      goto LABEL_8;
    }
    v9 = [(HMBLocalZoneQueryResultRecursiveModelID *)self modelStack];
    v5 = [v9 objectAtIndex:0];

    v10 = [(HMBLocalZoneQueryResultRecursiveModelID *)self modelStack];
    [v10 removeObjectAtIndex:0];

    [(HMBLocalZoneQueryResultRecursiveModelID *)self setParentModelID:v5];
    [(HMBSQLQueryIterator *)self setCurrentSequence:&unk_1F2C4CA50];
    [(HMBSQLQueryIterator *)self setCachedResults:0];
LABEL_6:
  }
  v4 = v3;
  v5 = [v3 hmbModelID];
  v6 = [(HMBLocalZoneQueryResultRecursiveModelID *)self returnedModels];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {

    goto LABEL_6;
  }
  v11 = [(HMBLocalZoneQueryResultRecursiveModelID *)self modelStack];
  [v11 addObject:v5];

  v12 = [(HMBLocalZoneQueryResultRecursiveModelID *)self returnedModels];
  [v12 addObject:v5];

LABEL_8:
  return v4;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7 = [(HMBLocalZoneQueryResult *)self zoneRowBindOffset];
  v8 = [(HMBLocalZoneQueryResult *)self localZone];
  hmbBindIntSQLite3(a3, v7, [v8 zoneRow], a4);

  int v9 = [(HMBLocalZoneQueryResultRecursiveModelID *)self parentModelIDOffset];
  v10 = [(HMBLocalZoneQueryResultRecursiveModelID *)self parentModelID];
  hmbBindUUIDSQLite3(a3, v9, v10, a4);

  return 1;
}

- (HMBLocalZoneQueryResultRecursiveModelID)initWithLocalZone:(id)a3 modelID:(id)a4
{
  NSMutableSet *returnedModels;
  void *v23;
  void *v24;
  HMBLocalZoneQueryResultRecursiveModelID *result;
  id v26;
  objc_super v27;
  void v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  id v6 = a3;
  id v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3968;
  v33 = __Block_byref_object_dispose__3969;
  v34 = 0;
  v8 = [v6 sql];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__HMBLocalZoneQueryResultRecursiveModelID_initWithLocalZone_modelID___block_invoke;
  v28[3] = &unk_1E69EACB8;
  v28[4] = &v29;
  id v9 = (id)[v8 sqlBlockWithActivity:0 block:v28];

  uint64_t v10 = v30[5];
  unint64_t v11 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  v27.receiver = self;
  v27.super_class = (Class)HMBLocalZoneQueryResultRecursiveModelID;
  v12 = [(HMBLocalZoneQueryResult *)&v27 initWithLocalZone:v6 statement:v10 initialSequence:&unk_1F2C4CA50 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v11];
  if (!v12) {
    goto LABEL_9;
  }
  v26 = 0;
  v13 = [v6 fetchRecordRowWithModelID:v7 returning:2 error:&v26];
  id v14 = v26;
  v15 = [MEMORY[0x1E4F1CA48] array];
  [(HMBSQLQueryIterator *)v12 setCachedResults:v15];

  if (v13)
  {
    uint64_t v16 = [v13 modelID];
    parentModelID = v12->_parentModelID;
    v12->_parentModelID = (NSUUID *)v16;

    v18 = [(HMBSQLQueryIterator *)v12 cachedResults];
    [v18 addObject:v13];
  }
  else if (v14)
  {
    [(HMBSQLQueryIterator *)v12 setError:v14];
    goto LABEL_8;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA70] orderedSet];
  modelStack = v12->_modelStack;
  v12->_modelStack = (NSMutableOrderedSet *)v19;

  uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
  returnedModels = v12->_returnedModels;
  v12->_returnedModels = (NSMutableSet *)v21;

  v23 = [(id)v30[5] arguments];
  v24 = objc_msgSend(v23, "hmf_numberForKey:", @"_parent_uuid");

  if (v24)
  {
    v12->_parentModelIDOffset = [v24 intValue];

LABEL_8:
LABEL_9:
    _Block_object_dispose(&v29, 8);

    return v12;
  }
  result = (HMBLocalZoneQueryResultRecursiveModelID *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __69__HMBLocalZoneQueryResultRecursiveModelID_initWithLocalZone_modelID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordParentModelIDRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end