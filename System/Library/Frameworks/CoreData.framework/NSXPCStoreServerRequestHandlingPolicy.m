@interface NSXPCStoreServerRequestHandlingPolicy
+ (void)initialize;
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3;
- (id)_coreProcessFetchRequest:(void *)a3 fromClientWithContext:(void *)a4 error:;
- (id)allowableClassesForClientWithContext:(id)a3;
- (id)prefetchRelationships:(void *)a3 forFetch:(void *)a4 sourceOIDs:(void *)a5 fromClientWithContext:;
- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6;
- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (void)processObtainRequest:(void *)a3 inContext:(void *)a4 error:;
@end

@implementation NSXPCStoreServerRequestHandlingPolicy

id __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) resultType] == 4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    id v2 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [*(id *)(a1 + 48) executeFetchRequest:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 72) + 8) + 40]);
    uint64_t v3 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) resultType];
    if (v3) {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v2, 0, 0);
    }
    else {
      uint64_t v4 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v4;
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:](*(NSError **)(a1 + 40), *(void **)(a1 + 32), 0, *(void *)(a1 + 48), (NSError **)(*(void *)(*(void *)(a1 + 72) + 8)+ 40));
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
}

id __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) newValuesForObjectWithID:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _snapshot];
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return v2;
}

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return a3 != 0;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  return (id)NSSet_EmptySet;
}

- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6
{
  v74[2] = *MEMORY[0x1E4F143B8];
  id v72 = 0;
  id v71 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (!self)
  {
    v51 = 0;
    goto LABEL_42;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v12 = [a4 entity];
  if (v12)
  {
    if ((*(unsigned char *)(v12 + 120) & 4) != 0)
    {
      uint64_t v13 = *(void *)(v12 + 72);
    }
    else
    {
      do
      {
        uint64_t v13 = v12;
        uint64_t v12 = [(id)v12 superentity];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:v13 fromClientWithContext:a5];
  if (!v14)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134092 userInfo:0];
LABEL_15:
    v16 = (void *)v18;
    v15 = 0;
    goto LABEL_19;
  }
  v15 = objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "existingObjectWithID:error:", a4, 0);
  if (!v15)
  {
    if (+[NSXPCStoreServer debugDefault]) {
      _NSCoreDataLog(8, @"Source object %@ does not exist for relationship fault.", v19, v20, v21, v22, v23, v24, (uint64_t)a4);
    }
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134093 userInfo:0];
    goto LABEL_15;
  }
  if ([v14 evaluateWithObject:v15])
  {
    v16 = 0;
    int v17 = 1;
    goto LABEL_20;
  }
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"Source object does not match restricting predicate, so returning an error", v25, v26, v27, v28, v29, v30, v69);
  }
  v16 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134093 userInfo:0];
LABEL_19:
  int v17 = 0;
LABEL_20:
  id v31 = v16;
  id v32 = v15;
  [v11 drain];
  if (v16) {
    id v72 = v16;
  }
  id v33 = v16;
  if (!v17) {
    goto LABEL_41;
  }
  id v34 = v15;
  if (!v34) {
    goto LABEL_41;
  }
  v70 = (void *)[a5 managedObjectContext];
  id v35 = -[NSEntityDescription _relationshipNamed:]((void *)[a4 entity], (uint64_t)a3);
  v36 = v35;
  if (v35)
  {
    uint64_t v37 = [v35 destinationEntity];
    uint64_t v38 = v37;
    if (v37)
    {
      if ((*(unsigned char *)(v37 + 120) & 4) != 0)
      {
        uint64_t v39 = *(void *)(v37 + 72);
      }
      else
      {
        do
        {
          uint64_t v39 = v37;
          uint64_t v37 = [(id)v37 superentity];
        }
        while (v37);
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    id v43 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:v39 fromClientWithContext:a5];
    if (v43)
    {
      if ((id)[MEMORY[0x1E4F28F60] predicateWithValue:1] == v43)
      {
        v57 = (void *)[v34 valueForKey:a3];
        if (v57)
        {
          uint64_t v58 = [v57 valueForKey:@"objectID"];
          goto LABEL_70;
        }
        if ([v36 isToMany])
        {
LABEL_51:
          uint64_t v58 = [MEMORY[0x1E4F1C978] array];
          goto LABEL_70;
        }
      }
      else
      {
        if ((id)[MEMORY[0x1E4F28F60] predicateWithValue:0] != v43)
        {
          v44 = (void *)[v36 inverseRelationship];
          v45 = objc_alloc_init(NSFetchRequest);
          [(NSFetchRequest *)v45 setResultType:1];
          [(NSFetchRequest *)v45 setIncludesPropertyValues:0];
          if (v44)
          {
            int v46 = [v44 isToMany];
            v47 = (void *)MEMORY[0x1E4F28F60];
            if (v46)
            {
              v48 = (void *)[v44 name];
              v49 = @"%@ IN %K";
              id v50 = a4;
              a4 = v48;
            }
            else
            {
              id v50 = (id)[v44 name];
              v49 = @"%K == %@";
            }
            uint64_t v65 = objc_msgSend(v47, "predicateWithFormat:", v49, v50, a4);
            uint64_t v66 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v65, v43, 0);
            uint64_t v67 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v66];
            [(NSFetchRequest *)v45 setEntity:v38];
            [(NSFetchRequest *)v45 setPredicate:v67];
          }
          else
          {
            if (a5) {
              v59 = (void *)*((void *)a5 + 4);
            }
            else {
              v59 = 0;
            }
            v60 = (void *)[v59 newValueForRelationship:v36 forObjectWithID:a4 withContext:v70 error:&v72];
            if (!v60 || (void *)[MEMORY[0x1E4F1CA98] null] == v60)
            {
              id v64 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:v38 fromClientWithContext:a5];
            }
            else
            {
              if ([v36 isToMany]) {
                v61 = @"self IN %@";
              }
              else {
                v61 = @"self == %@";
              }
              uint64_t v62 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v61, v60);
              uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v62, v43, 0);
              id v64 = (id)[MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v63];
            }
            id v68 = v64;
            [(NSFetchRequest *)v45 setEntity:v38];
            [(NSFetchRequest *)v45 setPredicate:v68];
          }
          [(NSFetchRequest *)v45 setResultType:1];
          v51 = (void *)[v70 executeFetchRequest:v45 error:&v72];
          if ([v36 isToMany]) {
            goto LABEL_71;
          }
          if ([v51 count]) {
            uint64_t v58 = [v51 lastObject];
          }
          else {
            uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
          }
LABEL_70:
          v51 = (void *)v58;
LABEL_71:
          LODWORD(self) = 1;
          goto LABEL_42;
        }
        if ([v36 isToMany]) {
          goto LABEL_51;
        }
      }
      uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_70;
    }
    if (a6)
    {
      v42 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134092 userInfo:0];
      goto LABEL_40;
    }
LABEL_41:
    v51 = 0;
    LODWORD(self) = 0;
    goto LABEL_42;
  }
  if (!a6) {
    goto LABEL_41;
  }
  v40 = (void *)MEMORY[0x1E4F28C58];
  v73[0] = @"relationship name";
  v73[1] = @"objectID";
  v74[0] = a3;
  v74[1] = a4;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:2];
  v42 = (void *)[v40 errorWithDomain:*MEMORY[0x1E4F281F8] code:134094 userInfo:v41];
LABEL_40:
  v51 = 0;
  LODWORD(self) = 0;
  id v72 = v42;
LABEL_42:
  id v52 = v51;
  id v53 = v72;
  [v71 drain];
  id v54 = v72;
  if (a6 && v72) {
    *a6 = v72;
  }
  id v55 = v54;
  if (self) {
    return v51;
  }
  else {
    return 0;
  }
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v48 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v10 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", [a3 entity], a4);
  id v11 = v10;
  if (v10)
  {
    if ((id)qword_1EB270548 == v10)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1ED7E2770, 0);
    }
    else
    {
      if ((id)_MergedGlobals_65 != v10)
      {
        uint64_t v12 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v12, "setEntity:", [a3 entity]);
        uint64_t v13 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
        uint64_t v14 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a3];
        uint64_t v15 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v13 rightExpression:v14 modifier:0 type:4 options:0];
        v16 = (void *)MEMORY[0x1E4F28BA0];
        -[NSFetchRequest setPredicate:](v12, "setPredicate:", objc_msgSend(MEMORY[0x1E4F28BA0], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v15, v11, 0)));
        id v17 = -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:](self, v12, a4, &v48);
        int v18 = 1;
        goto LABEL_30;
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      if (self)
      {
        uint64_t v21 = (void *)[a4 managedObjectContext];
        uint64_t v22 = (void *)[v21 persistentStoreCoordinator];
        if (a4) {
          uint64_t v23 = *((void *)a4 + 4);
        }
        else {
          uint64_t v23 = 0;
        }
        uint64_t v62 = 0;
        uint64_t v63 = &v62;
        uint64_t v64 = 0x3052000000;
        uint64_t v65 = __Block_byref_object_copy__1;
        uint64_t v66 = __Block_byref_object_dispose__1;
        uint64_t v67 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x3052000000;
        v59 = __Block_byref_object_copy__1;
        v60 = __Block_byref_object_dispose__1;
        uint64_t v61 = 0;
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x3052000000;
        id v53 = __Block_byref_object_copy__1;
        id v54 = __Block_byref_object_dispose__1;
        uint64_t v55 = 0;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke;
        v49[3] = &unk_1E544B7F0;
        v49[4] = v23;
        v49[5] = a3;
        v49[6] = v21;
        v49[7] = &v62;
        v49[8] = &v50;
        v49[9] = &v56;
        [v22 performBlockAndWait:v49];
        id v24 = (id)v51[5];
        if (v63[5])
        {
          uint64_t v25 = (void *)[MEMORY[0x1E4F1CA48] array];
          uint64_t v26 = objc_msgSend((id)objc_msgSend(a3, "entity"), "_propertyRangesByType");
          uint64_t v33 = v26;
          uint64_t v34 = *(void *)(v26 + 56);
          if (v34)
          {
            uint64_t v35 = *(void *)(v26 + 48);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v35, v27, v28, v29, v30, v31, v32);
              uint64_t v37 = v36;
              if (!v36) {
                uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
              }
              [v25 addObject:v37];
              LODWORD(v35) = v35 + 1;
              --v34;
            }
            while (v34);
          }
          uint64_t v38 = *(void *)(v33 + 104);
          if (v38)
          {
            uint64_t v39 = *(void *)(v33 + 96);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v39, v27, v28, v29, v30, v31, v32);
              uint64_t v41 = v40;
              if (!v40) {
                uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
              }
              [v25 addObject:v41];
              LODWORD(v39) = v39 + 1;
              --v38;
            }
            while (v38);
          }
          objc_msgSend(v25, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", *(int *)(v57[5] + 12)));
        }
        else
        {
          uint64_t v25 = 0;
        }
        if (v51[5]) {
          id v48 = (id)v51[5];
        }

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);
      }
      else
      {
        uint64_t v25 = 0;
      }
      uint64_t v19 = objc_msgSend(v20, "arrayWithObjects:", &unk_1ED7E2770, v25, 0);
    }
    id v17 = (id)v19;
    int v18 = 0;
    v16 = (void *)v19;
    goto LABEL_30;
  }
  id v17 = 0;
  int v18 = 0;
  v16 = 0;
  if (a5) {
    id v48 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134092 userInfo:0];
  }
LABEL_30:
  id v42 = v17;
  id v43 = v48;
  if (a5 && v48) {
    *a5 = v48;
  }
  [v9 drain];
  id v44 = v48;
  id v45 = 0;
  id v46 = v17;
  if (v18) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1ED7E2788, v17, 0);
  }
  return v16;
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  v142[16] = *(id *)MEMORY[0x1E4F143B8];
  switch([a3 requestType])
  {
    case 1:
      if (!self) {
        return 0;
      }
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel");
      uint64_t v9 = [a3 entityName];
      if (v8) {
        uint64_t v10 = [*(id *)(v8 + 32) objectForKey:v9];
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:v10 fromClientWithContext:a4];
      if (!v11)
      {
        if (a5) {
          *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134092 userInfo:0];
        }
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Process fetch request aborting (predicate is nil)", v69, v70, v71, v72, v73, v74, v118);
        }
        return 0;
      }
      id v12 = v11;
      if ([(id)qword_1EB270548 isEqual:v11])
      {
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Process fetch request returning no results (predicate is false)", v13, v14, v15, v16, v17, v18, v118);
        }
        uint64_t v19 = (void *)MEMORY[0x1E4F1C978];
        return (id)[v19 array];
      }
      else
      {
        if (([(id)_MergedGlobals_65 isEqual:v12] & 1) == 0)
        {
          uint64_t v96 = [a3 predicate];
          if (v96)
          {
            uint64_t v97 = objc_msgSend(MEMORY[0x1E4F28BA0], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v96, v12, 0));
            id v98 = a3;
          }
          else
          {
            id v98 = a3;
            uint64_t v97 = (uint64_t)v12;
          }
          [v98 setPredicate:v97];
        }
        return -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:](self, a3, a4, a5);
      }
    case 2:
      if (!self) {
        return 0;
      }
      id v140 = 0;
      id v120 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      id v131 = (id)[MEMORY[0x1E4F1CA60] dictionary];
      v119 = (void *)[a4 managedObjectContext];
      id v129 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v33, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects"));
      objc_msgSend(v33, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "updatedObjects"), "allObjects"));
      objc_msgSend(v33, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "lockedObjects"), "allObjects"));
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id obj = v33;
      uint64_t v34 = 0;
      uint64_t v35 = [v33 countByEnumeratingWithState:&v136 objects:v142 count:16];
      if (!v35) {
        goto LABEL_89;
      }
      uint64_t v36 = *(void *)v137;
      uint64_t v122 = *MEMORY[0x1E4F281F8];
      do
      {
        v124 = v34;
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v137 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void **)(*((void *)&v136 + 1) + 8 * v37);
          uint64_t v39 = (void *)MEMORY[0x18C127630]();
          uint64_t v40 = (void *)[v38 objectID];
          uint64_t v41 = [v40 entity];
          if (v41)
          {
            if ((*(unsigned char *)(v41 + 120) & 4) != 0)
            {
              id v42 = *(void **)(v41 + 72);
            }
            else
            {
              do
              {
                id v42 = (void *)v41;
                uint64_t v41 = [(id)v41 superentity];
              }
              while (v41);
            }
          }
          else
          {
            id v42 = 0;
          }
          uint64_t v43 = [v42 name];
          id v44 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingWritePredicateForEntity:v42 fromClientWithContext:a4];
          id v45 = v44;
          if (v44)
          {
            if (([v44 evaluateWithObject:v38] & 1) == 0)
            {
              if (![v129 count]) {
                objc_msgSend(v129, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), @"NSAffectedObjectsErrorKey");
              }
              objc_msgSend((id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"), "addObject:", v38);
            }
            id v46 = (id)[v131 objectForKey:v43];
            if (!v46)
            {
              id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v131 setObject:v46 forKey:v43];
            }
            [v46 addObject:v40];
          }
          else
          {
            if (a5) {
              id v140 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v122 code:134092 userInfo:0];
            }
            v128 = (void *)[NSNumber numberWithBool:0];
            v124 = v128;
          }
          if (!v45)
          {
            uint64_t v58 = v124;
            v57 = obj;
            goto LABEL_160;
          }
          ++v37;
        }
        while (v37 != v35);
        uint64_t v47 = [obj countByEnumeratingWithState:&v136 objects:v142 count:16];
        uint64_t v35 = v47;
        uint64_t v34 = v124;
      }
      while (v47);
LABEL_89:

      v125 = v34;
      v81 = objc_alloc_init(NSFetchRequest);
      v82 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
      [(NSManagedObjectContext *)v82 setUndoManager:0];
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v82, "setPersistentStoreCoordinator:", [v119 persistentStoreCoordinator]);
      id obja = (id)objc_msgSend((id)objc_msgSend(v119, "persistentStoreCoordinator"), "managedObjectModel");
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      uint64_t v83 = [v131 countByEnumeratingWithState:&v132 objects:v141 count:16];
      if (!v83) {
        goto LABEL_118;
      }
      uint64_t v123 = *(void *)v133;
      uint64_t v121 = *MEMORY[0x1E4F281F8];
      while (1)
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v133 != v123) {
            objc_enumerationMutation(v131);
          }
          uint64_t v85 = *(void *)(*((void *)&v132 + 1) + 8 * i);
          v86 = (void *)MEMORY[0x18C127630]();
          uint64_t v87 = objc_msgSend((id)objc_msgSend(obja, "entitiesByName"), "objectForKey:", v85);
          [(NSFetchRequest *)v81 setEntity:v87];
          v88 = (void *)[v131 objectForKey:v85];
          id v89 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:v87 fromClientWithContext:a4];
          if (v89)
          {
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 0), "isEqual:", v89))
            {
              if (![v129 count]) {
                objc_msgSend(v129, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), @"NSAffectedObjectsErrorKey");
              }
              objc_msgSend((id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"), "addObjectsFromArray:", v88);
            }
            else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 1), "isEqual:", v89))
            {
              goto LABEL_111;
            }
            if ([v88 count]) {
              uint64_t v91 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v88];
            }
            else {
              uint64_t v91 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
            }
            uint64_t v92 = v91;
            uint64_t v93 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v89];
            uint64_t v118 = v92;
            -[NSFetchRequest setPredicate:](v81, "setPredicate:", objc_msgSend(MEMORY[0x1E4F28BA0], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v93)));
            v94 = [(NSManagedObjectContext *)v82 executeFetchRequest:v81 error:&v140];
            if (v94)
            {
              if ([(NSArray *)v94 count])
              {
                if (![v129 count]) {
                  objc_msgSend(v129, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), @"NSAffectedObjectsErrorKey");
                }
                objc_msgSend((id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"), "addObjectsFromArray:", v88);
              }
LABEL_111:
              int v90 = 1;
              goto LABEL_115;
            }
            if (a5) {
              id v140 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v121 code:134030 userInfo:0];
            }
            int v90 = 0;
            v128 = (void *)[NSNumber numberWithBool:0];
            v125 = v128;
          }
          else
          {
            if (a5) {
              id v140 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v121 code:134092 userInfo:0];
            }
            int v90 = 0;
            v128 = (void *)[NSNumber numberWithBool:0];
          }
LABEL_115:
          if (!v90)
          {
            v57 = 0;
            uint64_t v58 = v125;
            goto LABEL_160;
          }
        }
        uint64_t v83 = [v131 countByEnumeratingWithState:&v132 objects:v141 count:16];
        if (!v83)
        {
LABEL_118:
          uint64_t v58 = v125;
          if ([v129 count])
          {
            if (a5) {
              id v140 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v129];
            }
            uint64_t v95 = [NSNumber numberWithBool:0];
LABEL_159:
            v57 = 0;
            uint64_t v58 = (void *)v95;
            v128 = (void *)v95;
          }
          else
          {
            if (+[NSXPCStoreServer debugDefault])
            {
              _NSCoreDataLog(8, @"Saving.", v107, v108, v109, v110, v111, v112, v118);
              NSLog((NSString *)@"\tInserted = %@", [v119 insertedObjects]);
              NSLog((NSString *)@"\tUpdated = %@", [v119 updatedObjects]);
              NSLog((NSString *)@"\tDeleted = %@", [v119 deletedObjects]);
            }
            if ([v119 save:&v140])
            {
              uint64_t v95 = [NSNumber numberWithBool:1];
              goto LABEL_159;
            }
            v57 = 0;
            v128 = v125;
          }
LABEL_160:

          id v113 = v58;
          id v114 = v140;
          [v120 drain];
          id v115 = v58;
          id v116 = v140;
          if (a5 && v140) {
            *a5 = v140;
          }
          id v117 = v116;
          return v128;
        }
      }
    case 5:
      if (!self) {
        return 0;
      }
      v142[0] = 0;
      uint64_t v21 = (void *)MEMORY[0x18C127630]();
      uint64_t v22 = (void *)[a4 managedObjectContext];
      [a3 _resolveEntityWithContext:v22];
      uint64_t v23 = [a3 entity];
      if (v23)
      {
        if ((*(unsigned char *)(v23 + 120) & 4) != 0)
        {
          uint64_t v24 = *(void *)(v23 + 72);
        }
        else
        {
          do
          {
            uint64_t v24 = v23;
            uint64_t v23 = [(id)v23 superentity];
          }
          while (v23);
        }
      }
      else
      {
        uint64_t v24 = 0;
      }
      id v59 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingWritePredicateForEntity:v24 fromClientWithContext:a4];
      if (v59)
      {
        if ((id)[MEMORY[0x1E4F28F60] predicateWithValue:0] != v59)
        {
          v60 = (void *)[v22 executeRequest:a3 error:v142];
          id v61 = v142[0];
          goto LABEL_136;
        }
        if (a5)
        {
          uint64_t v66 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v67 = *MEMORY[0x1E4F281F8];
          uint64_t v68 = 134030;
          goto LABEL_128;
        }
      }
      else if (a5)
      {
        uint64_t v66 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = *MEMORY[0x1E4F281F8];
        uint64_t v68 = 134092;
LABEL_128:
        id v61 = (id)[v66 errorWithDomain:v67 code:v68 userInfo:0];
        v60 = 0;
        v142[0] = v61;
        goto LABEL_136;
      }
      id v61 = 0;
      v60 = 0;
LABEL_136:
      id v99 = v61;
      id v100 = v60;
      id v101 = v142[0];
      if (a5 && v142[0]) {
        *a5 = v142[0];
      }
      goto LABEL_149;
    case 6:
      if (!self) {
        return 0;
      }
      v142[0] = 0;
      id v48 = (void *)MEMORY[0x18C127630]();
      v49 = (void *)[a4 managedObjectContext];
      [a3 _resolveEntityWithContext:v49];
      uint64_t v50 = [a3 entity];
      if (v50)
      {
        if ((*(unsigned char *)(v50 + 120) & 4) != 0)
        {
          uint64_t v51 = *(void *)(v50 + 72);
        }
        else
        {
          do
          {
            uint64_t v51 = v50;
            uint64_t v50 = [(id)v50 superentity];
          }
          while (v50);
        }
      }
      else
      {
        uint64_t v51 = 0;
      }
      id v62 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingWritePredicateForEntity:v51 fromClientWithContext:a4];
      if (v62)
      {
        if ((id)[MEMORY[0x1E4F28F60] predicateWithValue:0] != v62)
        {
          v60 = (void *)[v49 executeRequest:a3 error:v142];
          id v63 = v142[0];
          goto LABEL_141;
        }
        if (a5)
        {
          v75 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v76 = *MEMORY[0x1E4F281F8];
          uint64_t v77 = 134030;
          goto LABEL_131;
        }
      }
      else if (a5)
      {
        v75 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F281F8];
        uint64_t v77 = 134092;
LABEL_131:
        id v63 = (id)[v75 errorWithDomain:v76 code:v77 userInfo:0];
        v60 = 0;
        v142[0] = v63;
        goto LABEL_141;
      }
      id v63 = 0;
      v60 = 0;
LABEL_141:
      id v102 = v63;
      id v103 = v60;
      id v101 = v142[0];
      if (a5 && v142[0]) {
        *a5 = v142[0];
      }
      goto LABEL_149;
    case 7:
      if (!self) {
        return 0;
      }
      v142[0] = 0;
      uint64_t v52 = (void *)MEMORY[0x18C127630]();
      id v53 = (void *)[a3 fetchRequest];
      id v54 = (void *)[a4 managedObjectContext];
      [v53 _resolveEntityWithContext:v54];
      uint64_t v55 = [v53 entity];
      if (v55)
      {
        if ((*(unsigned char *)(v55 + 120) & 4) != 0)
        {
          uint64_t v56 = *(void *)(v55 + 72);
        }
        else
        {
          do
          {
            uint64_t v56 = v55;
            uint64_t v55 = [(id)v55 superentity];
          }
          while (v55);
        }
      }
      else
      {
        uint64_t v56 = 0;
      }
      id v64 = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingWritePredicateForEntity:v56 fromClientWithContext:a4];
      if (v64)
      {
        if ((id)[MEMORY[0x1E4F28F60] predicateWithValue:0] != v64)
        {
          v60 = (void *)[v54 executeRequest:a3 error:v142];
          id v65 = v142[0];
          goto LABEL_146;
        }
        if (a5)
        {
          v78 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v79 = *MEMORY[0x1E4F281F8];
          uint64_t v80 = 134030;
          goto LABEL_134;
        }
      }
      else if (a5)
      {
        v78 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = *MEMORY[0x1E4F281F8];
        uint64_t v80 = 134092;
LABEL_134:
        id v65 = (id)[v78 errorWithDomain:v79 code:v80 userInfo:0];
        v60 = 0;
        v142[0] = v65;
        goto LABEL_146;
      }
      id v65 = 0;
      v60 = 0;
LABEL_146:
      id v104 = v65;
      id v105 = v60;
      id v101 = v142[0];
      if (a5 && v142[0]) {
        *a5 = v142[0];
      }
LABEL_149:
      id v106 = v101;
      return v60;
    case 8:
      if (!self) {
        return 0;
      }
      v142[0] = 0;
      uint64_t v25 = (void *)MEMORY[0x18C127630]();
      uint64_t v26 = objc_msgSend((id)objc_msgSend(a4, "managedObjectContext"), "executeRequest:error:", a3, v142);
      id v27 = v26;
      id v28 = v142[0];
      id v29 = v142[0];
      if (a5 && v142[0]) {
        *a5 = v142[0];
      }
      id v30 = v29;
      return v26;
    default:
      if (!a5) {
        return 0;
      }
      uint64_t v31 = [a3 description];
      if (v31) {
        uint64_t v32 = (__CFString *)v31;
      }
      else {
        uint64_t v32 = @"Request description was nil.";
      }
      v128 = 0;
      *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v32, @"Request"));
      return v128;
  }
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_65;
}

- (id)_coreProcessFetchRequest:(void *)a3 fromClientWithContext:(void *)a4 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v79 = 0;
  uint64_t v80 = &v79;
  uint64_t v81 = 0x3052000000;
  v82 = __Block_byref_object_copy__1;
  uint64_t v83 = __Block_byref_object_dispose__1;
  uint64_t v84 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x3052000000;
  uint64_t v76 = __Block_byref_object_copy__1;
  uint64_t v77 = __Block_byref_object_dispose__1;
  uint64_t v78 = 0;
  id v52 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v8 = (void *)[a3 managedObjectContext];
  [a2 _resolveEntityWithContext:v8];
  if ([a2 resultType])
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count") != 0;
    uint64_t v20 = (void *)[a2 relationshipKeyPathsForPrefetching];
    if (v20)
    {
      id v21 = +[_PFRoutines _coalescedPrefetchKeypaths:]((uint64_t)_PFRoutines, v20);
      if ([v21 count]) {
        uint64_t v10 = v21;
      }
      else {
        uint64_t v10 = 0;
      }
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Coalesced prefetch keypaths to : %@", v22, v23, v24, v25, v26, v27, (uint64_t)v10);
      }
      goto LABEL_5;
    }
  }
  uint64_t v10 = 0;
LABEL_5:
  [a2 setRelationshipKeyPathsForPrefetching:0];
  char v11 = [a2 includesPropertyValues];
  if (v10) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0 && [v10 count]) {
    [a2 setIncludesPropertyValues:1];
  }
  uint64_t v13 = (void *)[v8 persistentStoreCoordinator];
  uint64_t v14 = v13;
  if (a3) {
    uint64_t v15 = a3[4];
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke;
  v68[3] = &unk_1E544B7A0;
  v68[4] = a2;
  v68[5] = v15;
  v68[8] = &v79;
  v68[9] = &v73;
  v68[10] = &v69;
  v68[6] = v8;
  v68[7] = a1;
  [v13 performBlockAndWait:v68];
  id v16 = (id)v80[5];
  id v17 = (id)v74[5];
  if (v80[5])
  {
    uint64_t v62 = 0;
    id v63 = &v62;
    uint64_t v64 = 0x3052000000;
    id v65 = __Block_byref_object_copy__1;
    uint64_t v66 = __Block_byref_object_dispose__1;
    uint64_t v67 = 0;
    if (v10)
    {
      if (!v9) {
        [a2 setResultType:1];
      }
      id v18 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x3052000000;
      id v59 = __Block_byref_object_copy__1;
      v60 = __Block_byref_object_dispose__1;
      uint64_t v61 = 0;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2;
      v54[3] = &unk_1E544B7C8;
      BOOL v55 = v9;
      v54[6] = &v56;
      v54[7] = &v79;
      v54[4] = a2;
      v54[5] = v15;
      v54[8] = &v62;
      [v14 performBlockAndWait:v54];
      id v19 = -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:](a1, v10, a2, (void *)v57[5], a3);

      [v18 drain];
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      id v19 = 0;
    }
    if (!*((unsigned char *)v70 + 24))
    {
      uint64_t v35 = (void *)v80[5];
      [a2 resultType];
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v35, v19, 0);
      v80[5] = v36;
    }
    if (v63[5])
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3;
      v53[3] = &unk_1E544B4A8;
      v53[4] = v15;
      v53[5] = &v62;
      [v14 performBlockAndWait:v53];
    }
    if (+[NSXPCStoreServer debugDefault])
    {
      uint64_t v37 = [(id)v80[5] count];
      _NSCoreDataLog(8, @"Process fetch request got %d results.", v38, v39, v40, v41, v42, v43, v37);
    }
    _Block_object_dispose(&v62, 8);
    int v34 = 0;
  }
  else
  {
    if (+[NSXPCStoreServer debugDefault]) {
      _NSCoreDataLog(8, @"Process fetch request got nil result (check system log for details).", v28, v29, v30, v31, v32, v33, v51);
    }
    int v34 = 1;
  }
  _Block_object_dispose(&v69, 8);
  id v44 = (id)v80[5];
  id v45 = (id)v74[5];
  if (a4)
  {
    uint64_t v46 = v74[5];
    if (v46) {
      *a4 = v46;
    }
  }
  [v52 drain];
  id v47 = 0;
  id v48 = (id)v74[5];
  if (v34) {
    id v49 = 0;
  }
  else {
    id v49 = (id)v80[5];
  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  return v49;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_65 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    qword_1EB270548 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  return 1;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_65;
}

- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id result = [(NSXPCStoreServerRequestHandlingPolicy *)self restrictingReadPredicateForEntity:a3 fromClientWithContext:a4];
  if (result)
  {
    if ((id)qword_1EB270548 != result && _MergedGlobals_65 != (void)result) {
      return (id)_MergedGlobals_65;
    }
  }
  return result;
}

void __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(NSFetchRequest **)(a1 + 32), 0, *(NSPersistentStore **)(a1 + 40), 0, (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 0);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "valueAtIndex:", 0));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v2;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(void *)(*(void *)(a1 + 56) + 8)+ 40), *(NSFetchRequest **)(a1 + 32), 0, *(NSPersistentStore **)(a1 + 40), 0, (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40), 0);
    uint64_t v8 = *(void **)(a1 + 40);
    BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    -[NSSQLCore _cacheRows:](v8, v9);
  }
}

- (id)prefetchRelationships:(void *)a3 forFetch:(void *)a4 sourceOIDs:(void *)a5 fromClientWithContext:
{
  v237[1] = *MEMORY[0x1E4F143B8];
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"Prefetching keypaths %@, for fetch %@, sources %@", v8, v9, v10, v11, v12, v13, (uint64_t)a2);
  }
  id obj = a2;
  id result = (id)[a4 count];
  if (result)
  {
    id result = (id)[a2 count];
    if (result)
    {
      id v147 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v139 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v154 = (void *)[a3 entity];
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      uint64_t v141 = [a2 countByEnumeratingWithState:&v178 objects:v235 count:16];
      if (!v141) {
        goto LABEL_136;
      }
      uint64_t v140 = *(void *)v179;
      while (1)
      {
        for (uint64_t i = 0; i != v141; ++i)
        {
          if (*(void *)v179 != v140) {
            objc_enumerationMutation(obj);
          }
          uint64_t v165 = *(void *)(*((void *)&v178 + 1) + 8 * i);
          context = (void *)MEMORY[0x18C127630]();
          uint64_t v15 = (void *)[obj objectForKey:v165];
          if ([v15 count]) {
            uint64_t v16 = (uint64_t)v15;
          }
          else {
            uint64_t v16 = 0;
          }
          uint64_t v146 = v16;
          if (+[NSXPCStoreServer debugDefault]) {
            _NSCoreDataLog(8, @"Prefetching %@, subkeypaths = %@", v17, v18, v19, v20, v21, v22, v165);
          }
          id v159 = (id)[MEMORY[0x1E4F1CA60] dictionary];
          if (v154 && objc_msgSend((id)objc_msgSend(v154, "propertiesByName"), "objectForKey:", v165))
          {
            objc_msgSend(v159, "setObject:forKey:", a4, objc_msgSend(v154, "name"));
          }
          else
          {
            if (!objc_msgSend((id)objc_msgSend(v154, "subentitiesByName"), "count")) {
              goto LABEL_134;
            }
            v125 = objc_msgSend((id)objc_msgSend(v154, "subentities"), "mutableCopy");
            id v156 = (id)[MEMORY[0x1E4F1CA48] array];
            while ([v125 count])
            {
              v126 = (void *)[v125 objectAtIndex:0];
              [v125 removeObjectAtIndex:0];
              if (objc_msgSend((id)objc_msgSend(v126, "relationshipsByName"), "objectForKey:", v165))
              {
                [v156 addObject:v126];
              }
              else if (objc_msgSend((id)objc_msgSend(v126, "subentitiesByName"), "count"))
              {
                objc_msgSend(v125, "addObjectsFromArray:", objc_msgSend(v126, "subentities"));
              }
            }

            if ([v156 count])
            {
              long long v176 = 0u;
              long long v177 = 0u;
              long long v174 = 0u;
              long long v175 = 0u;
              uint64_t v161 = [v156 countByEnumeratingWithState:&v174 objects:v234 count:16];
              if (v161)
              {
                v127 = 0;
                uint64_t v158 = *(void *)v175;
                do
                {
                  uint64_t v128 = 0;
                  do
                  {
                    if (*(void *)v175 != v158)
                    {
                      uint64_t v129 = v128;
                      objc_enumerationMutation(v156);
                      uint64_t v128 = v129;
                    }
                    uint64_t v164 = v128;
                    v130 = *(void **)(*((void *)&v174 + 1) + 8 * v128);
                    id v131 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v172 = 0u;
                    long long v173 = 0u;
                    long long v170 = 0u;
                    long long v171 = 0u;
                    uint64_t v132 = [a4 countByEnumeratingWithState:&v170 objects:v233 count:16];
                    if (v132)
                    {
                      uint64_t v133 = *(void *)v171;
                      do
                      {
                        for (uint64_t j = 0; j != v132; ++j)
                        {
                          if (*(void *)v171 != v133) {
                            objc_enumerationMutation(a4);
                          }
                          long long v135 = *(void **)(*((void *)&v170 + 1) + 8 * j);
                          long long v136 = (void *)[v135 entity];
                          long long v137 = v136;
                          BOOL v138 = v136 == v130 || v136 == v127;
                          if (v138 || [v136 isKindOfEntity:v130])
                          {
                            [v131 addObject:v135];
                            if (v137 != v130) {
                              v127 = v137;
                            }
                          }
                        }
                        uint64_t v132 = [a4 countByEnumeratingWithState:&v170 objects:v233 count:16];
                      }
                      while (v132);
                    }
                    if ([v131 count]) {
                      objc_msgSend(v159, "setObject:forKey:", v131, objc_msgSend(v130, "name"));
                    }

                    uint64_t v128 = v164 + 1;
                  }
                  while (v164 + 1 != v161);
                  uint64_t v161 = [v156 countByEnumeratingWithState:&v174 objects:v234 count:16];
                }
                while (v161);
              }
            }
          }
          if ([v159 count])
          {
            long long v168 = 0u;
            long long v169 = 0u;
            long long v166 = 0u;
            long long v167 = 0u;
            uint64_t v157 = [v159 countByEnumeratingWithState:&v166 objects:v232 count:16];
            if (v157)
            {
              uint64_t v153 = *(void *)v167;
              do
              {
                uint64_t v23 = 0;
                do
                {
                  if (*(void *)v167 != v153) {
                    objc_enumerationMutation(v159);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v166 + 1) + 8 * v23);
                  uint64_t v25 = (void *)MEMORY[0x18C127630]();
                  uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v154, "managedObjectModel"), "entitiesByName"), "objectForKey:", v24);
                  if (v26)
                  {
                    uint64_t v27 = (void *)[v159 objectForKey:v24];
                    v163 = (void *)[a5 managedObjectContext];
                    v151 = (void *)[v163 persistentStoreCoordinator];
                    if (a5 && (uint64_t v28 = (void *)a5[4]) != 0)
                    {
                      uint64_t v148 = v28[6];
                      uint64_t v150 = a5[4];
                      uint64_t v29 = _sqlCoreLookupSQLEntityForEntityDescription(v28, v26);
                      uint64_t v30 = v29;
                      if (v29)
                      {
                        uint64_t v160 = [*(id *)(v29 + 40) objectForKey:v165];
                        char v155 = 0;
LABEL_29:
                        id v31 = -[NSEntityDescription _relationshipNamed:](v26, v165);
                        if (!v160 || !v31 || ![v27 count])
                        {
                          id v53 = (void *)MEMORY[0x1E4F1C978];
                          uint64_t v54 = [v26 name];
                          uint64_t v55 = objc_msgSend(v53, "arrayWithObjects:", v165, v54, NSArray_EmptyArray, 0);
                          goto LABEL_95;
                        }
                        uint64_t v32 = *(unsigned char **)(v160 + 56);
                        uint64_t v226 = 0;
                        v227 = &v226;
                        uint64_t v228 = 0x3052000000;
                        v229 = __Block_byref_object_copy__1;
                        v230 = __Block_byref_object_dispose__1;
                        uint64_t v231 = 0;
                        uint64_t v220 = 0;
                        v221 = &v220;
                        uint64_t v222 = 0x3052000000;
                        v223 = __Block_byref_object_copy__1;
                        v224 = __Block_byref_object_dispose__1;
                        uint64_t v225 = 0;
                        uint64_t v214 = 0;
                        v215 = &v214;
                        uint64_t v216 = 0x3052000000;
                        v217 = __Block_byref_object_copy__1;
                        v218 = __Block_byref_object_dispose__1;
                        id v219 = 0;
                        id v219 = (id)NSArray_EmptyArray;
                        uint64_t v208 = 0;
                        v209 = &v208;
                        uint64_t v210 = 0x3052000000;
                        v211 = __Block_byref_object_copy__1;
                        v212 = __Block_byref_object_dispose__1;
                        uint64_t v213 = 0;
                        v152 = v26;
                        if (v32 && v32[24] == 7)
                        {
                          if (+[NSXPCStoreServer debugDefault])
                          {
                            uint64_t v33 = [v32 name];
                            _NSCoreDataLog(8, @"Prefetching inverse to-one relationship \"%@\".", v34, v35, v36, v37, v38, v39, v33);
                          }
                          uint64_t v40 = [a5 inverseIsToOnePrefetchRequestForRelationshipNamed:v165 onEntity:v26];
                          v227[5] = v40;
                          v236 = @"destinations";
                          v237[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v27];
                          uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v237 forKeys:&v236 count:1];
LABEL_37:
                          v221[5] = v41;

                          v209[5] = 0;
                          uint64_t v201 = 0;
                          v202 = &v201;
                          uint64_t v203 = 0x3052000000;
                          v204 = __Block_byref_object_copy__1;
                          v205 = __Block_byref_object_dispose__1;
                          uint64_t v206 = 0;
                          uint64_t v195 = 0;
                          v196 = &v195;
                          uint64_t v197 = 0x3052000000;
                          v198 = __Block_byref_object_copy__1;
                          v199 = __Block_byref_object_dispose__1;
                          uint64_t v200 = 0;
                          uint64_t v189 = 0;
                          v190 = &v189;
                          uint64_t v191 = 0x3052000000;
                          v192 = __Block_byref_object_copy__1;
                          v193 = __Block_byref_object_dispose__1;
                          uint64_t v194 = 0;
                          uint64_t v185 = 0;
                          v186 = &v185;
                          uint64_t v187 = 0x2020000000;
                          char v188 = 0;
                          uint64_t v42 = (void *)v227[5];
                          if (!v42) {
                            goto LABEL_40;
                          }
                          uint64_t v43 = objc_msgSend(a1, "restrictingReadPredicateForEntity:fromClientWithContext:", objc_msgSend(v42, "entity"), a5);
                          if (_MergedGlobals_65 != v43)
                          {
                            v227[5] = 0;
                            goto LABEL_40;
                          }
                          if (v227[5])
                          {
                            v184[0] = MEMORY[0x1E4F143A8];
                            v184[1] = 3221225472;
                            v184[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2;
                            v184[3] = &unk_1E544B840;
                            v184[10] = &v226;
                            v184[11] = &v201;
                            v184[4] = v150;
                            v184[5] = v163;
                            v184[12] = &v220;
                            v184[13] = &v208;
                            v184[14] = &v195;
                            v184[15] = &v189;
                            v184[6] = v146;
                            v184[7] = v165;
                            v184[16] = &v214;
                            v184[17] = &v185;
                            v184[8] = v148;
                            v184[9] = v26;
                            [v151 performBlockAndWait:v184];
                            if (+[NSXPCStoreServer debugDefault])
                            {
                              uint64_t v106 = [v26 name];
                              [(id)v202[5] length];
                              _NSCoreDataLog(8, @"Prefetched for source entity %@, key '%@'.  Got data with length %lu.", v107, v108, v109, v110, v111, v112, v106);
                            }
                            id v44 = v202;
                            if (*((unsigned char *)v186 + 24))
                            {

                              v202[5] = 0;
                              v82 = (void *)MEMORY[0x1E4F1C978];
                              uint64_t v83 = [v26 name];
                              goto LABEL_85;
                            }
                          }
                          else
                          {
LABEL_40:
                            id v44 = v202;
                          }
                          if (v44[5])
                          {
                            if (v146)
                            {
                              if (+[NSXPCStoreServer debugDefault]) {
                                _NSCoreDataLog(8, @"Recursively prefetching subkeys %@ of fetch %@ using OIDs %@ for objects %@", v45, v46, v47, v48, v49, v50, v146);
                              }
                              uint64_t v51 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, (void *)v209[5]);
                              uint64_t v52 = -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:](a1, v146, v227[5], v51, a5);
                            }
                            else
                            {
                              uint64_t v52 = 0;
                            }

                            if (+[NSXPCStoreServer debugDefault])
                            {
                              uint64_t v113 = [v26 name];
                              _NSCoreDataLog(8, @"Done prefetching for %@, %@", v114, v115, v116, v117, v118, v119, v113);
                            }
                            id v120 = (void *)MEMORY[0x1E4F1C978];
                            uint64_t v121 = [v26 name];
                            uint64_t v55 = objc_msgSend(v120, "arrayWithObjects:", v165, v121, v215[5], v202[5], v52, 0);

                            if (v190[5])
                            {
                              v182[0] = MEMORY[0x1E4F143A8];
                              v182[1] = 3221225472;
                              v182[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_106;
                              v182[3] = &unk_1E544B4A8;
                              v182[4] = v150;
                              v182[5] = &v189;
                              [v151 performBlockAndWait:v182];
                            }
                          }
                          else
                          {

                            if (v190[5])
                            {
                              v183[0] = MEMORY[0x1E4F143A8];
                              v183[1] = 3221225472;
                              v183[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_95;
                              v183[3] = &unk_1E544B4A8;
                              v183[4] = v150;
                              v183[5] = &v189;
                              [v151 performBlockAndWait:v183];
                            }
                            v82 = (void *)MEMORY[0x1E4F1C978];
                            uint64_t v83 = [v26 name];
LABEL_85:
                            uint64_t v55 = objc_msgSend(v82, "arrayWithObjects:", v165, v83, NSArray_EmptyArray, 0);
                          }
                          _Block_object_dispose(&v185, 8);
                          _Block_object_dispose(&v189, 8);
                          _Block_object_dispose(&v195, 8);
                          _Block_object_dispose(&v201, 8);
LABEL_94:
                          _Block_object_dispose(&v208, 8);
                          _Block_object_dispose(&v214, 8);
                          _Block_object_dispose(&v220, 8);
                          _Block_object_dispose(&v226, 8);
LABEL_95:
                          [v147 addObject:v55];
                          goto LABEL_96;
                        }
                        int v56 = *(unsigned __int8 *)(v160 + 24);
                        if (v56 != 7)
                        {
                          if (v56 == 9)
                          {
                            v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DA0]), "initWithObject:", objc_msgSend(*(id *)(v160 + 56), "name"));
                            uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F28D98]) initWithKeyPath:v57];

                            uint64_t v59 = [v27 objectAtIndex:0];
                            v60 = (void *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v59];
                            uint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v60 rightExpression:v58 modifier:0 type:10 options:0];

                            uint64_t v62 = objc_alloc_init(NSFetchRequest);
                            -[NSFetchRequest setEntity:](v62, "setEntity:", objc_msgSend((id)objc_msgSend((id)v160, "destinationEntity"), "entityDescription"));
                            [(NSFetchRequest *)v62 setPredicate:v61];

                            id v63 = v62;
                            v215[5] = 0;
                            v207[0] = MEMORY[0x1E4F143A8];
                            v207[1] = 3221225472;
                            v207[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke;
                            v207[3] = &unk_1E544B818;
                            v207[4] = v150;
                            v207[5] = v62;
                            v207[7] = &v214;
                            v207[6] = v27;
                            [v151 performBlockAndWait:v207];
                            if (+[NSXPCStoreServer debugDefault])
                            {
                              uint64_t v64 = [(id)v160 name];
                              [(id)v215[5] count];
                              _NSCoreDataLog(8, @"Prefetched for many-to-many relationship \"%@\".  Got %lu rows", v65, v66, v67, v68, v69, v70, v64);
                              _NSCoreDataLog(8, @"Which means oidSets %@", v71, v72, v73, v74, v75, v76, v215[5]);
                            }
                            unint64_t v77 = [(id)v215[5] count];
                            uint64_t v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v77 + 256];
                            v209[5] = (uint64_t)v78;
                            if (v77)
                            {
                              for (unint64_t k = 0; k < v77; k += 2)
                              {
                                uint64_t v80 = [(id)v215[5] objectAtIndex:k + 1];
                                [(id)v209[5] addObjectsFromArray:v80];
                              }
                              uint64_t v78 = (void *)v209[5];
                            }
                            if ([v78 count])
                            {
                              uint64_t v81 = [a5 manyToManyPrefetchRequestsForRelationshipNamed:v165 onEntity:v26];
                              v227[5] = v81;
                              v236 = @"mtmObjects";
                              v237[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v209[5]];
                              uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v237 forKeys:&v236 count:1];
                              goto LABEL_37;
                            }
                            goto LABEL_92;
                          }

                          uint64_t v95 = (void *)MEMORY[0x1E4F1C978];
                          uint64_t v96 = [v26 name];
                          uint64_t v97 = objc_msgSend(v95, "arrayWithObjects:", v165, v96, NSArray_EmptyArray, 0);
LABEL_93:
                          uint64_t v55 = v97;
                          goto LABEL_94;
                        }
                        uint64_t v149 = [v27 count];
                        uint64_t v84 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v149];
                        v209[5] = v84;
                        if (!v149)
                        {
LABEL_76:
                          if (+[NSXPCStoreServer debugDefault])
                          {
                            uint64_t v98 = [(id)v160 name];
                            [(id)v209[5] count];
                            _NSCoreDataLog(8, @"Prefetched for one-to-many relationship \"%@\".  Got %lu rows", v99, v100, v101, v102, v103, v104, v98);
                          }
                          if ([(id)v209[5] count])
                          {
                            uint64_t v105 = [a5 manyToOnePrefetchRequestForRelationshipNamed:v165 onEntity:v26];
                            v227[5] = v105;
                            v236 = @"objects";
                            v237[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v209[5]];
                            uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v237 forKeys:&v236 count:1];
                            goto LABEL_37;
                          }
LABEL_92:

                          uint64_t v122 = (void *)MEMORY[0x1E4F1C978];
                          uint64_t v123 = [v26 name];
                          uint64_t v97 = objc_msgSend(v122, "arrayWithObjects:", v165, v123, NSArray_EmptyArray, 0);
                          goto LABEL_93;
                        }
                        uint64_t v85 = 0;
                        while (2)
                        {
                          v86 = (void *)MEMORY[0x18C127630]();
                          uint64_t v87 = [v27 objectAtIndex:v85];
                          v88 = v25;
                          uint64_t v89 = v23;
                          uint64_t v201 = 0;
                          int v90 = (void *)[v163 objectRegisteredForID:v87];
                          if (v90)
                          {
                            unsigned int v91 = [(id)v160 slot];
                            if (v155) {
                              uint64_t v92 = 0;
                            }
                            else {
                              uint64_t v92 = *(void *)(v30 + 192);
                            }
                            uint64_t v93 = (void *)[v90 entity];
                            unint64_t v94 = v92 + v91;
                            uint64_t v26 = v152;
                            if (v93 != v152)
                            {
                              unint64_t v94 = [v93 _offsetRelationshipIndex:v94 fromSuperEntity:v152 andIsToMany:0];
                              uint64_t v26 = v152;
                            }
                            if ((_PF_InternalToOneRelationshipForeignKeyCache((unsigned int *)v90, v94, &v201) & 1) == 0
                              || !v201)
                            {
LABEL_72:
                              ++v85;
                              uint64_t v23 = v89;
                              uint64_t v25 = v88;
                              if (v149 == v85) {
                                goto LABEL_76;
                              }
                              continue;
                            }
                          }
                          else
                          {
                            uint64_t v201 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v163, "existingObjectWithID:error:", v87, 0), "primitiveValueForKey:", v165), "objectID");
                            if (!v201) {
                              goto LABEL_72;
                            }
                          }
                          break;
                        }
                        objc_msgSend((id)v209[5], "addObject:");
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      uint64_t v30 = 0;
                      uint64_t v150 = 0;
                      uint64_t v148 = 0;
                    }
                    uint64_t v160 = 0;
                    char v155 = 1;
                    goto LABEL_29;
                  }
LABEL_96:
                  ++v23;
                }
                while (v23 != v157);
                uint64_t v124 = [v159 countByEnumeratingWithState:&v166 objects:v232 count:16];
                uint64_t v157 = v124;
              }
              while (v124);
            }
          }
LABEL_134:
        }
        uint64_t v141 = [obj countByEnumeratingWithState:&v178 objects:v235 count:16];
        if (!v141)
        {
LABEL_136:
          [v139 drain];
          return v147;
        }
      }
    }
  }
  return result;
}

void *__94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

id __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke(uint64_t a1)
{
  id result = -[NSSQLCore newObjectIDSetsForToManyPrefetchingRequest:andSourceObjectIDs:orderColumnName:](*(void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), 0);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

void __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"Decoding prefetched rows for fetch %@", v2, v3, v4, v5, v6, v7, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:](*(NSError **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 80) + 8)+ 40), *(void **)(*(void *)(*(void *)(a1 + 96) + 8)+ 40), *(void *)(a1 + 40), 0);
  if ([*(id *)(a1 + 48) count])
  {

    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(void *)(*(void *)(a1 + 88) + 8)+ 40), *(NSFetchRequest **)(*(void *)(*(void *)(a1 + 80) + 8)+ 40), 0, *(NSPersistentStore **)(a1 + 32), *(NSManagedObjectContext **)(a1 + 40), (void *)(*(void *)(*(void *)(a1 + 120) + 8)+ 40), 0);
    -[NSSQLCore _cacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40));
    if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)) {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) = v8;
    if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
    {
      if (+[NSXPCStoreServer debugDefault])
      {
        uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) entity];
        _NSCoreDataLog(8, @"Prefetched %@/%@ and got %@", v10, v11, v12, v13, v14, v15, v9);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40))
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17)
        {
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v19) {
                objc_enumerationMutation(v16);
              }
              _PFFaultHandlerFulfillFault(*(void *)(a1 + 64), *(void *)(*((void *)&v28 + 1) + 8 * i), *(void *)(a1 + 40), (void *)[*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) objectAtIndex:v18 + i], 0);
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
            v18 += i;
          }
          while (v17);
        }
      }
    }
    else
    {
      if (+[NSXPCStoreServer debugDefault])
      {
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) entity];
        _NSCoreDataLog(8, @"Prefetched %@/%@ and got no results, stopping now", v22, v23, v24, v25, v26, v27, v21);
      }

      -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 1;
    }
  }
}

void *__141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_95(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void *__141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_106(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)processObtainRequest:(void *)a3 inContext:(void *)a4 error:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v39 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  context = (void *)MEMORY[0x18C127630]();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = a2;
  uint64_t v38 = [a2 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v38)
  {
    id v5 = 0;
    uint64_t v36 = *(void *)v43;
    uint64_t v35 = *MEMORY[0x1E4F281F8];
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v42 + 1) + 8 * v6);
        uint64_t v8 = (void *)[obj objectForKey:v7];
        id v50 = 0;
        id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        uint64_t v10 = (void *)[a3 managedObjectContext];
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "persistentStoreCoordinator"), "managedObjectModel");
        if (!v11)
        {
          uint64_t v13 = 0;
LABEL_38:
          uint64_t v14 = 0;
          goto LABEL_13;
        }
        uint64_t v12 = [*(id *)(v11 + 32) objectForKey:v7];
        uint64_t v13 = v12;
        if (!v12) {
          goto LABEL_38;
        }
        if ((*(unsigned char *)(v12 + 120) & 4) != 0)
        {
          uint64_t v14 = *(void *)(v12 + 72);
        }
        else
        {
          do
          {
            uint64_t v14 = v12;
            uint64_t v12 = [(id)v12 superentity];
          }
          while (v12);
        }
LABEL_13:
        uint64_t v15 = [a1 restrictingWritePredicateForEntity:v14 fromClientWithContext:a3];
        if (!v15)
        {
          uint64_t v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:v35 code:134092 userInfo:0];
LABEL_28:
          uint64_t v23 = 0;
          char v25 = 0;
          id v50 = v24;
          goto LABEL_31;
        }
        if ([MEMORY[0x1E4F28F60] predicateWithValue:0] == v15)
        {
          uint64_t v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:v35 code:134030 userInfo:0];
          goto LABEL_28;
        }
        uint64_t v16 = [v8 unsignedIntegerValue];
        for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); v16; --v16)
        {
          uint64_t v18 = [[NSManagedObject alloc] initWithEntity:v13 insertIntoManagedObjectContext:v10];
          [i addObject:v18];
        }
        if ([v10 obtainPermanentIDsForObjects:i error:&v50])
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v20 = [i countByEnumeratingWithState:&v46 objects:v52 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v47 != v21) {
                  objc_enumerationMutation(i);
                }
                objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "objectID"));
              }
              uint64_t v20 = [i countByEnumeratingWithState:&v46 objects:v52 count:16];
            }
            while (v20);
          }
          uint64_t v23 = v19;
        }
        else
        {
          uint64_t v23 = 0;
        }

        char v25 = 1;
LABEL_31:
        id v26 = v50;
        [v9 drain];
        if (v50) {
          id v5 = v50;
        }
        id v27 = v50;
        if ((v25 & 1) == 0 || (id v28 = v23) == 0)
        {
          uint64_t v39 = 0;
          goto LABEL_43;
        }
        [v39 setValue:v28 forKey:v7];
        ++v6;
      }
      while (v6 != v38);
      uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
      uint64_t v38 = v29;
      if (!v29) {
        goto LABEL_43;
      }
    }
  }
  id v5 = 0;
LABEL_43:
  id v30 = v5;
  id v31 = v5;
  if (a4 && v5) {
    *a4 = v5;
  }
  return v39;
}

@end