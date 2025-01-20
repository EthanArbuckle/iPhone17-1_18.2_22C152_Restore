@interface NSPersistentHistoryResult
+ (_NSPersistentHistoryChange)_changeFromResult:(uint64_t)a3 withTransaction:;
+ (_NSPersistentHistoryTransaction)_transactionFromResult:(void *)a3 withChanges:;
+ (id)_processResult:(id)a3 forRequest:(id)a4 withProvider:(id)a5;
- (NSPersistentHistoryResult)initWithResultType:(int64_t)a3 andResult:(id)a4;
- (NSPersistentHistoryResult)initWithSubresults:(id)a3;
- (NSPersistentHistoryResultType)resultType;
- (id)description;
- (id)result;
- (void)dealloc;
@end

@implementation NSPersistentHistoryResult

+ (id)_processResult:(id)a3 forRequest:(id)a4 withProvider:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x18C127630](a1, a2);
  if ([a4 resultType] == 2 || objc_msgSend(a4, "resultType") == 6 || !objc_msgSend(a4, "resultType"))
  {
    v26 = (_PFBatchHistoryFaultingArray *)[a3 firstObject];
LABEL_22:
    a3 = v26;
    goto LABEL_23;
  }
  if ([a4 resultType] != 1)
  {
    if (![a3 isNSArray])
    {
      a3 = 0;
      goto LABEL_23;
    }
    if ([a4 fetchBatchSize])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [a3 description];
        goto LABEL_23;
      }
      v26 = [[_PFBatchHistoryFaultingArray alloc] initWithPFBatchFaultingArray:a3];
      goto LABEL_22;
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([a4 resultType] == 5 && objc_msgSend(a3, "count") == 2)
    {
      v30 = (void *)[a3 objectAtIndexedSubscript:0];
      v31 = (void *)[a3 objectAtIndexedSubscript:1];
      v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v30, "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v57 = v30;
      uint64_t v60 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v60)
      {
        id v55 = v29;
        id v50 = a4;
        v52 = v8;
        unint64_t v33 = 0;
        obuint64_t j = *(id *)v66;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            unint64_t v35 = v33;
            if (*(id *)v66 != obj) {
              objc_enumerationMutation(v57);
            }
            v36 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            v37 = (void *)MEMORY[0x18C127630]();
            v38 = (void *)[MEMORY[0x1E4F1CA48] array];
            v39 = +[NSPersistentHistoryResult _transactionFromResult:withChanges:]((uint64_t)NSPersistentHistoryResult, v36, v38);
            uint64_t v40 = [(_NSPersistentHistoryTransaction *)v39 transactionNumber];
            if ([v31 count] > (unint64_t)v33)
            {
              unint64_t v33 = v33;
              while (1)
              {
                v41 = (void *)[v31 objectAtIndexedSubscript:v33];
                if (objc_msgSend((id)objc_msgSend(v41, "objectForKey:", @"TRANSACTIONID"), "_referenceData64") != v40) {
                  break;
                }
                v42 = +[NSPersistentHistoryResult _changeFromResult:withTransaction:]((uint64_t)NSPersistentHistoryResult, v41, (uint64_t)v39);
                [v38 addObject:v42];

                unint64_t v33 = (v35 + 1);
                unint64_t v35 = v33;
                if ([v31 count] <= v33) {
                  goto LABEL_42;
                }
              }
            }
            unint64_t v33 = v35;
LABEL_42:
            [v32 addObject:v39];
          }
          uint64_t v60 = [v57 countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v60);
        a4 = v50;
        v8 = v52;
        id v29 = v55;
      }
LABEL_58:

      a3 = v32;
      goto LABEL_23;
    }
    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v43 = [a3 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (!v43) {
      goto LABEL_58;
    }
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v62;
LABEL_48:
    uint64_t v46 = 0;
    while (1)
    {
      if (*(void *)v62 != v45) {
        objc_enumerationMutation(a3);
      }
      v47 = *(void **)(*((void *)&v61 + 1) + 8 * v46);
      if ([a4 resultType] == 3) {
        break;
      }
      if ([a4 resultType] == 4)
      {
        v48 = +[NSPersistentHistoryResult _changeFromResult:withTransaction:]((uint64_t)NSPersistentHistoryResult, v47, 0);
        goto LABEL_55;
      }
LABEL_56:
      if (v44 == ++v46)
      {
        uint64_t v44 = [a3 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (!v44) {
          goto LABEL_58;
        }
        goto LABEL_48;
      }
    }
    v48 = +[NSPersistentHistoryResult _transactionFromResult:withChanges:]((uint64_t)NSPersistentHistoryResult, v47, 0);
LABEL_55:
    v49 = v48;
    [v32 addObject:v48];

    goto LABEL_56;
  }
  v51 = v8;
  id v56 = (id)[MEMORY[0x1E4F1CA80] set];
  v54 = (void *)[MEMORY[0x1E4F1CA80] set];
  v53 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v59 = *(void *)v70;
  do
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      if (*(void *)v70 != v59) {
        objc_enumerationMutation(a3);
      }
      v12 = *(void **)(*((void *)&v69 + 1) + 8 * j);
      v13 = (void *)MEMORY[0x18C127630]();
      v14 = objc_msgSend(a5, "newObjectIDForEntity:pk:", objc_msgSend((id)objc_msgSend(a5, "model"), "entityForID:", (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"ENTITY"), "intValue")), (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"ENTITYPK"), "intValue"));
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"CHANGETYPE"), "unsignedIntegerValue");
      switch(v15)
      {
        case 2:
          v22 = v53;
          goto LABEL_16;
        case 1:
          v22 = v54;
          goto LABEL_16;
        case 0:
          v22 = v56;
LABEL_16:
          [v22 addObject:v14];
          goto LABEL_18;
      }
      _NSCoreDataLog(1, @"error: unexpected type of change : %lu", v16, v17, v18, v19, v20, v21, v15);
LABEL_18:
    }
    uint64_t v10 = [a3 countByEnumeratingWithState:&v69 objects:v77 count:16];
  }
  while (v10);
LABEL_20:
  [v56 minusSet:v53];
  [v54 minusSet:v53];
  [v54 minusSet:v56];
  v23 = (void *)[v56 copy];
  v24 = (void *)[v54 copy];
  v25 = (void *)[v53 copy];
  v75[0] = @"inserted_objectIDs";
  v75[1] = @"updated_objectIDs";
  v76[0] = v23;
  v76[1] = v24;
  v75[2] = @"deleted_objectIDs";
  v76[2] = v25;
  a3 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];

  v8 = v51;
LABEL_23:
  v27 = -[NSPersistentHistoryResult initWithResultType:andResult:]([NSPersistentHistoryResult alloc], "initWithResultType:andResult:", [a4 resultType], a3);
  return v27;
}

- (NSPersistentHistoryResult)initWithResultType:(int64_t)a3 andResult:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSPersistentHistoryResult;
  v6 = [(NSPersistentHistoryResult *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_resultType = a3;
    v6->_aggregatedResult = a4;
  }
  return v7;
}

+ (_NSPersistentHistoryChange)_changeFromResult:(uint64_t)a3 withTransaction:
{
  self;
  v5 = -[_NSPersistentHistoryChange initWithDictionary:andChangeObjectID:]([_NSPersistentHistoryChange alloc], "initWithDictionary:andChangeObjectID:", a2, [a2 objectForKey:@"self"]);
  [(_NSPersistentHistoryChange *)v5 _setTransaction:a3];
  return v5;
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  self->_aggregatedResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentHistoryResult;
  [(NSPersistentHistoryResult *)&v3 dealloc];
}

+ (_NSPersistentHistoryTransaction)_transactionFromResult:(void *)a3 withChanges:
{
  self;
  v5 = -[_NSPersistentHistoryTransaction initWithDictionary:andObjectID:]([_NSPersistentHistoryTransaction alloc], "initWithDictionary:andObjectID:", a2, [a2 objectForKey:@"self"]);
  -[_NSPersistentHistoryTransaction _setChanges:](v5, a3);
  return v5;
}

- (NSPersistentHistoryResult)initWithSubresults:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)NSPersistentHistoryResult;
  v4 = [(NSPersistentHistoryResult *)&v76 init];
  if (!v4) {
    return v4;
  }
  if ([a3 count])
  {
    uint64_t resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v4->_uint64_t resultType = resultType;
  }
  else
  {
    uint64_t resultType = v4->_resultType;
  }
  switch(resultType)
  {
    case 0:
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v27 = [a3 countByEnumeratingWithState:&v72 objects:v93 count:16];
      if (!v27)
      {
        uint64_t v30 = 1;
        goto LABEL_50;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v73;
      LOBYTE(v30) = 1;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v73 != v29) {
            objc_enumerationMutation(a3);
          }
          v32 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          int64_t v33 = v4->_resultType;
          if (v33 != [v32 resultType])
          {
            v52 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v53 = *MEMORY[0x1E4F1C3B8];
            v91 = @"Results";
            id v92 = a3;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            id v55 = @"Mismatched result types during aggregation of history status results";
            goto LABEL_57;
          }
          if (v30) {
            uint64_t v30 = objc_msgSend((id)objc_msgSend(v32, "result"), "BOOLValue");
          }
          else {
            uint64_t v30 = 0;
          }
        }
        uint64_t v28 = [a3 countByEnumeratingWithState:&v72 objects:v93 count:16];
      }
      while (v28);
LABEL_50:
      uint64_t v50 = [NSNumber numberWithBool:v30];
LABEL_51:
      v4->_aggregatedResult = (id)v50;
      return v4;
    case 1:
      uint64_t v59 = (void *)[MEMORY[0x1E4F1CA80] set];
      v34 = (void *)[MEMORY[0x1E4F1CA80] set];
      unint64_t v35 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      uint64_t v36 = [a3 countByEnumeratingWithState:&v64 objects:v87 count:16];
      if (!v36) {
        goto LABEL_46;
      }
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v65;
      while (1)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v65 != v38) {
            objc_enumerationMutation(a3);
          }
          uint64_t v40 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          int64_t v41 = v4->_resultType;
          if (v41 != [v40 resultType])
          {
            v52 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v53 = *MEMORY[0x1E4F1C3B8];
            v85 = @"Results";
            id v86 = a3;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
            id v55 = @"Mismatched result types during aggregation of history object IDs results";
LABEL_57:
            objc_exception_throw((id)[v52 exceptionWithName:v53 reason:v55 userInfo:v54]);
          }
          v42 = (void *)[v40 result];
          if (v42)
          {
            uint64_t v43 = v42;
            objc_msgSend(v59, "unionSet:", objc_msgSend(v42, "objectForKey:", @"inserted_objectIDs"));
            objc_msgSend(v34, "unionSet:", objc_msgSend(v43, "objectForKey:", @"updated_objectIDs"));
            objc_msgSend(v35, "unionSet:", objc_msgSend(v43, "objectForKey:", @"deleted_objectIDs"));
          }
        }
        uint64_t v37 = [a3 countByEnumeratingWithState:&v64 objects:v87 count:16];
        if (!v37)
        {
LABEL_46:
          [v59 minusSet:v35];
          [v34 minusSet:v35];
          [v34 minusSet:v59];
          uint64_t v44 = (void *)[v59 copy];
          uint64_t v45 = (void *)[v34 copy];
          uint64_t v46 = (void *)[v35 copy];
          id v47 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          v84[0] = v44;
          v84[1] = v45;
          v84[2] = v46;
          uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
          v83[0] = @"inserted_objectIDs";
          v83[1] = @"updated_objectIDs";
          v83[2] = @"deleted_objectIDs";
          uint64_t v49 = objc_msgSend(v47, "initWithObjects:forKeys:", v48, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v83, 3));

          v4->_aggregatedResult = (id)v49;
          return v4;
        }
      }
    case 2:
    case 6:
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v68 objects:v90 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v69;
        do
        {
          for (uint64_t k = 0; k != v13; ++k)
          {
            if (*(void *)v69 != v15) {
              objc_enumerationMutation(a3);
            }
            uint64_t v17 = *(void **)(*((void *)&v68 + 1) + 8 * k);
            int64_t v18 = v4->_resultType;
            if (v18 != [v17 resultType])
            {
              v52 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v53 = *MEMORY[0x1E4F1C3B8];
              v88 = @"Results";
              id v89 = a3;
              uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
              id v55 = @"Mismatched result types during aggregation of history count results";
              goto LABEL_57;
            }
            v14 += objc_msgSend((id)objc_msgSend(v17, "result"), "integerValue");
          }
          uint64_t v13 = [a3 countByEnumeratingWithState:&v68 objects:v90 count:16];
        }
        while (v13);
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v50 = [objc_alloc(NSNumber) initWithInteger:v14];
      goto LABEL_51;
    case 3:
    case 5:
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v20 = [a3 countByEnumeratingWithState:&v60 objects:v80 count:16];
      if (!v20) {
        goto LABEL_23;
      }
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v61;
      while (1)
      {
        for (uint64_t m = 0; m != v21; ++m)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(a3);
          }
          v24 = *(void **)(*((void *)&v60 + 1) + 8 * m);
          int64_t v25 = v4->_resultType;
          if (v25 != [v24 resultType])
          {
            v52 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v53 = *MEMORY[0x1E4F1C3B8];
            uint64_t v78 = @"Results";
            id v79 = a3;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
            id v55 = @"Mismatched result types during aggregation of history results";
            goto LABEL_57;
          }
          objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(v24, "result"));
        }
        uint64_t v21 = [a3 countByEnumeratingWithState:&v60 objects:v80 count:16];
        if (!v21)
        {
LABEL_23:
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:1];
          v77 = v26;
          v4->_aggregatedResult = (id)objc_msgSend(v19, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v77, 1));

          return v4;
        }
      }
    case 4:
      _NSCoreDataLog(1, @"History Change Request failed NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores", v5, v6, v7, v8, v9, v10, v58);
      uint64_t v56 = *MEMORY[0x1E4F1C3B8];
      v81 = @"Results";
      id v82 = a3;
      id v57 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v56, 134091, @"NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores", (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1]);
      objc_exception_throw(v57);
    default:
      return v4;
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%s <%p> with @property result: %@", class_getName(v4), self, self->_aggregatedResult];
}

- (NSPersistentHistoryResultType)resultType
{
  return self->_resultType;
}

@end