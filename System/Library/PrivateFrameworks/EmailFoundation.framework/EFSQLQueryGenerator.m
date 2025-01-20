@interface EFSQLQueryGenerator
+ (id)_createStatementForPredicate:(id)a3 propertyMapper:(id)a4 tablesUsed:(id)a5;
+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5;
+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5 groupBy:(id)a6 groupByTable:(id)a7;
+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 propertyMapper:(id)a7 protectedDataAvailable:(BOOL)a8;
+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyMapper:(id)a6 protectedDataAvailable:(BOOL)a7;
@end

@implementation EFSQLQueryGenerator

+ (id)_createStatementForPredicate:(id)a3 propertyMapper:(id)a4 tablesUsed:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v69 = a4;
  id v61 = a5;
  v59 = v7;
  if (objc_msgSend(v7, "ef_matchesEverything"))
  {
    v60 = 0;
  }
  else if (objc_msgSend(v7, "ef_matchesNothing"))
  {
    v60 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    v8 = [v7 predicateNodeFromPropertyMapper:v69 addingTablesUsed:v61];
    v60 = [v8 sqlExpressable];
  }
  v9 = [v69 mainTable];
  uint64_t v10 = [v9 name];

  v64 = (void *)v10;
  [v61 removeObject:v10];
  v70 = objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [v61 allObjects];
  id v67 = (id)[obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v76;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v76 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v75 + 1) + 8 * (void)v11);
        if (([v70 containsObject:v12] & 1) == 0)
        {
          v13 = [v69 tableRelationships];
          uint64_t v14 = [v13 objectForKeyedSubscript:v12];

          if (v14)
          {
            i = (void *)v14;
            goto LABEL_15;
          }
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2, a1, @"EFSQLQueryGenerator.m", 155, @"Query references table %@ without a table relationship", v12 object file lineNumber description];
          for (i = 0; ; i = v29)
          {

LABEL_15:
            v17 = [i sourceColumn];
            v18 = [v17 table];
            v19 = [v18 name];
            char v20 = [v19 isEqualToString:v64];

            if (v20) {
              break;
            }
            _ef_log_EFSQLQueryGenerator();
            v21 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = objc_msgSend(i, "ef_publicDescription");
              *(_DWORD *)buf = 138543362;
              v81 = v22;
              _os_log_impl(&dword_1B5A59000, v21, OS_LOG_TYPE_INFO, "Current tableRelationship %{public}@", buf, 0xCu);
            }
            if (!i)
            {
              v33 = [MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"EFSQLQueryGenerator.m", 159, @"No existing table relationship exists to the main table", v12);
            }
            v23 = [i sourceColumn];
            v24 = [v23 table];
            v16 = [v24 name];

            if ([v70 containsObject:v16])
            {

              break;
            }
            [v70 addObject:v16];
            v25 = [v69 tableRelationships];
            v26 = [i sourceColumn];
            v27 = [v26 table];
            v28 = [v27 name];
            v29 = [v25 objectForKeyedSubscript:v28];

            _ef_log_EFSQLQueryGenerator();
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = objc_msgSend(v29, "ef_publicDescription");
              v32 = [v69 tableRelationships];
              *(_DWORD *)buf = 138543618;
              v81 = v31;
              __int16 v82 = 2112;
              v83 = v32;
              _os_log_impl(&dword_1B5A59000, v30, OS_LOG_TYPE_INFO, "Iterating into tableRelationship: %{public}@ tableRelationships: %@", buf, 0x16u);
            }
            if (!v29)
            {
              v34 = [MEMORY[0x1E4F28B00] currentHandler];
              [v34 handleFailureInMethod:a2, a1, @"EFSQLQueryGenerator.m", 170, @"Query references table %@ without a table relationship", v12 object file lineNumber description];
            }
          }
          [v70 addObject:v12];
        }
        v11 = (char *)v11 + 1;
      }
      while (v67 != v11);
      uint64_t v35 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      id v67 = (id)v35;
    }
    while (v35);
  }

  v68 = [[EFSQLSelectStatement alloc] initWithTable:v64];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obja = v70;
  uint64_t v36 = [obja countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v36)
  {
    uint64_t v66 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v72 != v66) {
          objc_enumerationMutation(obja);
        }
        uint64_t v38 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        v39 = [v69 tableRelationships];
        v40 = [v39 objectForKeyedSubscript:v38];

        v41 = [v40 sourceColumn];
        v42 = [v41 columnExpressionWithFullName];

        v43 = [v40 tableAlias];
        v44 = v43;
        if (v43)
        {
          id v45 = v43;
        }
        else
        {
          v46 = [v40 destinationColumn];
          v47 = [v46 table];
          id v45 = [v47 name];
        }
        v48 = [EFSQLColumnExpression alloc];
        v49 = [v40 destinationColumn];
        v50 = [v49 name];
        v51 = [(EFSQLColumnExpression *)v48 initWithName:v50 table:v45];

        v52 = [v42 equalTo:v51];
        if ([v40 useLeftOuterJoin])
        {
          v53 = [v40 tableAlias];
          id v54 = [(EFSQLSelectStatement *)v68 leftOuterJoin:v38 alias:v53 on:v52];
        }
        else
        {
          v53 = [v40 tableAlias];
          id v55 = [(EFSQLSelectStatement *)v68 join:v38 alias:v53 on:v52];
        }
      }
      uint64_t v36 = [obja countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v36);
  }

  [(EFSQLSelectStatement *)v68 setWhere:v60];
  return v68;
}

+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5
{
  v5 = [a1 countStatementForPredicate:a3 propertyMapper:a4 distinctBy:a5 groupBy:0 groupByTable:0];
  return v5;
}

+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5 groupBy:(id)a6 groupByTable:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_opt_new();
  v18 = v17;
  if (v16) {
    [v17 addObject:v16];
  }
  v19 = [a1 _createStatementForPredicate:v12 propertyMapper:v13 tablesUsed:v18];
  if (v14) {
    +[EFSQLAggregateFunction countDistinct:v14];
  }
  else {
  char v20 = +[EFSQLAggregateFunction count:0];
  }
  [v19 addResult:v20 alias:0];

  if (v15)
  {
    [v19 addResultColumn:v15 fromTable:v16];
    [v19 groupByColumn:v15 fromTable:v16];
  }

  return v19;
}

void ___ef_log_EFSQLQueryGenerator_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFSQLQueryGenerator");
  v1 = (void *)_ef_log_EFSQLQueryGenerator_log;
  _ef_log_EFSQLQueryGenerator_log = (uint64_t)v0;
}

+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyMapper:(id)a6 protectedDataAvailable:(BOOL)a7
{
  id v7 = [a1 selectStatementForReturnObjectKeypaths:a3 predicate:a4 sortDescriptors:a5 limit:0 propertyMapper:a6 protectedDataAvailable:a7];
  return v7;
}

+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 propertyMapper:(id)a7 protectedDataAvailable:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v72 = a4;
  id v71 = a5;
  id v80 = a7;
  id v14 = _ef_log_EFSQLQueryGenerator();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v112 = obj;
    _os_log_impl(&dword_1B5A59000, v14, OS_LOG_TYPE_INFO, "selectStatementForReturnObjectKeypaths called for %@", buf, 0xCu);
  }

  id v15 = a1;
  v79 = objc_opt_new();
  uint64_t v70 = [obj count];
  if (!v70)
  {
    id v16 = [v80 mainTable];
    v17 = [v16 name];

    v18 = [v80 keyPathMappers];
    [v18 allKeys];
    if (v8) {
      uint64_t v19 = {;
    }

      obuint64_t j = (id)v19;
    }
    else {
      char v20 = {;
    }
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke;
      v103[3] = &unk_1E6123480;
      id v104 = v80;
      id v105 = v17;
      uint64_t v21 = objc_msgSend(v20, "ef_filter:", v103);

      v18 = v104;
      obuint64_t j = (id)v21;
    }
  }
  long long v78 = objc_opt_new();
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obja = obj;
  uint64_t v22 = [obja countByEnumeratingWithState:&v99 objects:v110 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v100 != v23) {
          objc_enumerationMutation(obja);
        }
        uint64_t v25 = *(void *)(*((void *)&v99 + 1) + 8 * i);
        v26 = [v80 keyPathMappers];
        v27 = [v26 objectForKeyedSubscript:v25];

        if (!v27)
        {
          v30 = [MEMORY[0x1E4F28B00] currentHandler];
          [v30 handleFailureInMethod:a2, v15, @"EFSQLQueryGenerator.m", 56, @"Asked to select keyPath %@ without mapper", v25 object file lineNumber description];
        }
        v28 = [v27 selectResultExpression];

        if (v28)
        {
          objc_msgSend(v78, "ef_addObjectIfAbsent:", v27);
          v29 = [v27 tableName];
          [v79 addObject:v29];
        }
      }
      uint64_t v22 = [obja countByEnumeratingWithState:&v99 objects:v110 count:16];
    }
    while (v22);
  }

  long long v77 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v74 = v71;
  uint64_t v31 = [v74 countByEnumeratingWithState:&v95 objects:v109 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v96 != v32) {
          objc_enumerationMutation(v74);
        }
        v34 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        uint64_t v35 = [v80 keyPathMappers];
        uint64_t v36 = [v34 key];
        v37 = [v35 objectForKeyedSubscript:v36];

        if (v37)
        {
          uint64_t v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v34, "ascending"));
          v39 = +[EFPair pairWithFirst:v37 second:v38];

          objc_msgSend(v77, "ef_addObjectIfAbsentAccordingToEquals:", v39);
          v40 = [v37 tableName];
          [v79 addObject:v40];
        }
      }
      uint64_t v31 = [v74 countByEnumeratingWithState:&v95 objects:v109 count:16];
    }
    while (v31);
  }

  v41 = [v15 _createStatementForPredicate:v72 propertyMapper:v80 tablesUsed:v79];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v73 = v77;
  uint64_t v42 = [v73 countByEnumeratingWithState:&v91 objects:v108 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v92;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v92 != v43) {
          objc_enumerationMutation(v73);
        }
        id v45 = *(void **)(*((void *)&v91 + 1) + 8 * k);
        v46 = [v45 first];
        v47 = [v46 selectResultAlias];
        if (v47)
        {
          v48 = [v46 selectResultAlias];
          v49 = +[EFSQLColumnExpression column:v48];
        }
        else
        {
          v49 = [v46 selectResultExpression];
        }

        v50 = [v45 second];
        objc_msgSend(v41, "orderBy:ascending:", v49, objc_msgSend(v50, "BOOLValue"));
      }
      uint64_t v42 = [v73 countByEnumeratingWithState:&v91 objects:v108 count:16];
    }
    while (v42);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v51 = v78;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v87 objects:v107 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v88;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v88 != v53) {
          objc_enumerationMutation(v51);
        }
        id v55 = *(void **)(*((void *)&v87 + 1) + 8 * m);
        v56 = [v55 selectResultExpression];

        if (v56)
        {
          v57 = [v55 selectResultExpression];
          v58 = [v55 selectResultAlias];
          [v41 addResult:v57 alias:v58];
        }
      }
      uint64_t v52 = [v51 countByEnumeratingWithState:&v87 objects:v107 count:16];
    }
    while (v52);
  }

  if (!v70)
  {
    v59 = [v80 mainTable];
    v60 = [v59 name];

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v61 = [v80 additionalColumns];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v83 objects:v106 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v84;
      do
      {
        for (uint64_t n = 0; n != v62; ++n)
        {
          if (*(void *)v84 != v63) {
            objc_enumerationMutation(v61);
          }
          [v41 addResultColumn:*(void *)(*((void *)&v83 + 1) + 8 * n) fromTable:v60];
        }
        uint64_t v62 = [v61 countByEnumeratingWithState:&v83 objects:v106 count:16];
      }
      while (v62);
    }

    uint64_t v65 = [v80 additionalSelectExpressions];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke_2;
    v81[3] = &unk_1E61234A8;
    id v82 = v41;
    [v65 enumerateKeysAndObjectsUsingBlock:v81];
  }
  if (a6 >= 1) {
    objc_msgSend(v41, "setLimit:");
  }
  _ef_log_EFSQLQueryGenerator();
  uint64_t v66 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    id v67 = [v41 queryString];
    *(_DWORD *)buf = 138412290;
    id v112 = v67;
    _os_log_impl(&dword_1B5A59000, v66, OS_LOG_TYPE_INFO, "selectStatementForReturnObjectKeypaths returning: %@", buf, 0xCu);
  }
  return v41;
}

uint64_t __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) keyPathMappers];
  v5 = [v4 objectForKeyedSubscript:v3];

  v6 = [v5 tableName];
  id v7 = v6;
  if (v6 && ([v6 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) tableRelationships];
    uint64_t v10 = [v9 objectForKeyedSubscript:v7];
    uint64_t v8 = [v10 isProtectedTable] ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addResult:a3 alias:a2];
}

+ (void)_createStatementForPredicate:(void *)a1 propertyMapper:(uint8_t *)buf tablesUsed:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Exception occurred when mapping predicate:\n%{public}@", buf, 0xCu);
}

@end