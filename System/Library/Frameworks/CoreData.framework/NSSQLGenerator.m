@interface NSSQLGenerator
+ (void)initialize;
- (NSSQLGenerator)initWithPersistentStore:(id)a3;
- (id)initializeContextForRequest:(int)a3 ignoreInheritance:(uint64_t)a4 nestingLevel:;
- (uint64_t)newSQLStatementForRequest:(int)a3 ignoreInheritance:(int)a4 countOnly:(uint64_t)a5 nestingLevel:(int)a6 nestIsWhereScoped:(uint64_t)a7 requestContext:;
- (uint64_t)newSQLStatmentForBinaryIndex:(uint64_t)a3 inStore:;
- (void)generateGroupByIntermediatesForProperties:(uint64_t)a1 inContext:(void *)a2;
- (void)generateHavingIntermediateForPredicate:(uint64_t)a1 inContext:(void *)a2;
- (void)generateIntermediateForLimit:(uint64_t)a1 inContext:(void *)a2;
- (void)generateIntermediateForOffset:(uint64_t)a1 inContext:(void *)a2;
- (void)generateOrderIntermediateInContext:(void *)a1;
- (void)generateSelectIntermediateInContext:(void *)a1;
- (void)generateWhereIntermediatesInContext:(void *)a1;
@end

@implementation NSSQLGenerator

- (id)initializeContextForRequest:(int)a3 ignoreInheritance:(uint64_t)a4 nestingLevel:
{
  v8 = (void *)MEMORY[0x18C127630]();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:a2 forKey:@"storeRequest"];
  [v9 setObject:*(void *)(a1 + 8) forKey:@"persistentStore"];
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]);
  if (v10) {
    [v9 setObject:v10 forKey:@"entity"];
  }
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a4), @"nestingLevel");
  [v9 setObject:supportedFunctions forKey:@"supportedKVCAggregates"];
  v11 = [[NSSQLAliasGenerator alloc] initWithNestingLevel:a4];
  [v9 setObject:v11 forKey:@"aliasGenerator"];

  if (a3)
  {
    uint64_t v12 = [a2 predicate];
  }
  else
  {
    v13 = (void *)[v9 objectForKey:@"storeRequest"];
    v14 = (void *)[v13 predicate];
    uint64_t v15 = [v9 objectForKey:@"entity"];
    uint64_t v16 = v15;
    BOOL v18 = v15 && (v17 = *(void **)(v15 + 152)) != 0 && [v17 count] != 0;
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"ignoreInheritance"), "BOOLValue")) {
      int v19 = 0;
    }
    else {
      int v19 = [v13 includesSubentities];
    }
    if (!v16 || *(void *)(v16 + 160) || ((v19 | !v18) & 1) == 0)
    {
      int v20 = v18 & v19;
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F28DA0]) initWithObject:@"_ent"];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28D98]) initWithKeyPath:v21];

      id v23 = objc_alloc(NSNumber);
      if (v20 == 1)
      {
        if (v16) {
          uint64_t v24 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v24 = 0;
        }
        v25 = (void *)[v23 initWithUnsignedInt:v24];
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v25];

        uint64_t v27 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v22 rightExpression:v26 modifier:0 type:3 options:0];
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F28DA0]) initWithObject:@"_ent"];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F28D98]) initWithKeyPath:v28];

        id v30 = objc_alloc(NSNumber);
        if (v16) {
          uint64_t v31 = *(unsigned int *)(v16 + 188);
        }
        else {
          uint64_t v31 = 0;
        }
        v32 = (void *)[v30 initWithUnsignedInt:v31];
        v33 = (void *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v32];

        uint64_t v34 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v29 rightExpression:v33 modifier:0 type:1 options:0];
        id v35 = objc_alloc(MEMORY[0x1E4F1C978]);
        if (v14) {
          uint64_t v36 = objc_msgSend(v35, "initWithObjects:", v14, v27, v34, 0);
        }
        else {
          uint64_t v36 = objc_msgSend(v35, "initWithObjects:", v27, v34, 0, v52);
        }
        v43 = (void *)v36;
        v14 = (void *)[MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v36];

        v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v27, v34, 0);
        uint64_t v40 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v44];
      }
      else
      {
        if (v16) {
          uint64_t v37 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v37 = 0;
        }
        v38 = (void *)[v23 initWithUnsignedInt:v37];
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v38];

        uint64_t v40 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v22 rightExpression:v39 modifier:0 type:4 options:0];
        id v41 = objc_alloc(MEMORY[0x1E4F1C978]);
        if (v14) {
          uint64_t v42 = objc_msgSend(v41, "initWithObjects:", v14, v40, 0);
        }
        else {
          uint64_t v42 = objc_msgSend(v41, "initWithObjects:", v40, 0, v51);
        }
        v44 = (void *)v42;
        v14 = (void *)[MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v42];
      }

      [v9 setObject:v40 forKey:@"restrictingEntityPredicate"];
    }
    uint64_t v12 = [v14 minimalFormInContext:v9];
  }
  v45 = (void *)v12;
  if (![v9 objectForKey:@"NSUnderlyingException"]
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v45) & 1) == 0
    && v45)
  {
    v46 = (void *)MEMORY[0x18C127630]();
    v47 = objc_alloc_init(NSSQLPredicateAnalyser);
    [v9 setObject:v47 forKey:@"informationGatherer"];
    [v45 acceptVisitor:v47 flags:1];
    [v9 setObject:v45 forKey:@"predicate"];
  }
  if (![v9 objectForKey:@"NSUnderlyingException"])
  {
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v9 setObject:v48 forKey:@"bindVars"];

    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v9 setObject:v49 forKey:@"selectBindVars"];
  }
  return v9;
}

- (uint64_t)newSQLStatementForRequest:(int)a3 ignoreInheritance:(int)a4 countOnly:(uint64_t)a5 nestingLevel:(int)a6 nestIsWhereScoped:(uint64_t)a7 requestContext:
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v14 = [a2 requestType];
  uint64_t v15 = (void *)MEMORY[0x18C127630]();
  if (v14 != 1)
  {
    id v17 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, 0, 0);
    goto LABEL_19;
  }
  id v16 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, a3, a5);
  id v17 = v16;
  if (a6) {
    [v16 setValue:MEMORY[0x1E4F1CC38] forKey:@"nestedWhereSelect"];
  }
  BOOL v18 = objc_msgSend((id)objc_msgSend(a2, "havingPredicate"), "minimalFormInContext:", v17);
  if (![v17 objectForKey:@"NSUnderlyingException"]
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v18) & 1) == 0
    && v18)
  {
    int v19 = objc_alloc_init(NSSQLPredicateAnalyser);
    [v17 setObject:v19 forKey:@"havingPredicateAnalyser"];

    [v18 acceptVisitor:v19 flags:1];
    [v17 setObject:v18 forKey:@"havingPredicate"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a7 && (uint64_t v20 = *(void *)(a7 + 216)) != 0)
    {
      [v17 setObject:v20 forKey:@"substitutionVariables"];
      uint64_t v21 = MEMORY[0x1E4F1CC38];
      v22 = @"duringPrefetching";
    }
    else
    {
      if (![a2 substitutionVariables]) {
        goto LABEL_17;
      }
      uint64_t v21 = [a2 substitutionVariables];
      v22 = @"substitutionVariables";
    }
    [v17 setObject:v21 forKey:v22];
LABEL_17:
    if ([v17 objectForKey:@"substitutionVariables"])
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v17 setObject:v23 forKey:@"subOrder"];

      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v17 setObject:v24 forKey:@"columnSubOrder"];
    }
  }
LABEL_19:
  v25 = (void *)[v17 objectForKey:@"NSUnderlyingException"];
  if ([v17 objectForKey:@"NSUnderlyingException"])
  {
    id v106 = v25;

    objc_exception_throw(v25);
  }
  uint64_t v26 = -[NSSQLiteAdapter newStatementWithEntity:]([*(id *)(a1 + 8) adapter], objc_msgSend(v17, "objectForKey:", @"entity"));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C90], "defaultInstance"), "isEqual:", objc_msgSend(v17, "objectForKey:", @"predicate")))goto LABEL_128; {
  if (v14 == 8 || v14 == 1)
  }
  {
    uint64_t v27 = (void *)[v17 objectForKey:@"storeRequest"];
    uint64_t v28 = [v17 objectForKey:@"informationGatherer"];
    uint64_t v29 = [v17 objectForKey:@"havingPredicateAnalyser"];
    if (v28) {
      id v30 = *(void **)(v28 + 24);
    }
    else {
      id v30 = 0;
    }
    if ([v30 count] || (!v29 ? (uint64_t v31 = 0) : (uint64_t v31 = *(void **)(v29 + 24)), objc_msgSend(v31, "count")))
    {
      if (v28) {
        v32 = *(void **)(v28 + 24);
      }
      else {
        v32 = 0;
      }
      uint64_t v33 = [v32 count];
      uint64_t v34 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v35 = *MEMORY[0x1E4F1C3C8];
      uint64_t v36 = NSString;
      if (v33) {
        uint64_t v37 = objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"storeRequest"), "predicate");
      }
      else {
        uint64_t v37 = [v17 objectForKey:@"havingPredicate"];
      }
      [v17 setObject:objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, objc_msgSend(v36, "stringWithFormat:", @"Unsupported predicate %@", v37), 0), @"NSUnderlyingException" forKey];
      goto LABEL_109;
    }
    if (a4 && !objc_msgSend((id)objc_msgSend(v27, "propertiesToFetch"), "count")) {
      v71 = off_1E544B070;
    }
    else {
      v71 = off_1E544B078;
    }
    v70 = (NSSQLFetchDictionaryCountIntermediate *)objc_msgSend(objc_alloc(*v71), "initWithEntity:alias:inScope:", objc_msgSend(v17, "objectForKey:", @"entity"), objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"aliasGenerator"), "generateTableAlias"), 0);
    [v17 setObject:v70 forKey:@"outerFetch"];

    -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
    if ([v17 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_108;
    }
    uint64_t v72 = [v27 propertiesToGroupBy];
    uint64_t v73 = [v17 objectForKey:@"havingPredicate"];
    uint64_t v74 = v73;
    if (!v72 && v73)
    {
      v75 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v76 = *MEMORY[0x1E4F1C3C8];
      v77 = @"Invalid fetch request: HAVING with no GROUP BY";
LABEL_107:
      objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v75, "exceptionWithName:reason:userInfo:", v76, v77, 0), @"NSUnderlyingException");
      goto LABEL_108;
    }
    if (v72)
    {
      if ([v27 resultType] != 2)
      {
        v75 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v76 = *MEMORY[0x1E4F1C3C8];
        v77 = @"Invalid fetch request: GROUP BY requires NSDictionaryResultType";
        goto LABEL_107;
      }
      -[NSSQLGenerator generateGroupByIntermediatesForProperties:inContext:](v72, v17);
      if (!v70) {
        goto LABEL_108;
      }
      if (!v70[1].super.super.super.isa) {
        goto LABEL_108;
      }
      if (v74)
      {
        -[NSSQLGenerator generateHavingIntermediateForPredicate:inContext:](v74, v17);
        if (!v70[1].super.super._scope || [v17 objectForKey:@"NSUnderlyingException"]) {
          goto LABEL_108;
        }
      }
    }
    -[NSSQLGenerator generateSelectIntermediateInContext:](v17);
    if ([(NSSQLFetchDictionaryCountIntermediate *)v70 selectIntermediate])
    {
      -[NSSQLGenerator generateOrderIntermediateInContext:](v17);
      v78 = (void *)[v17 valueForKey:@"substitutionVariables"];
      if ([v27 fetchLimit]
        || [v78 valueForKey:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"])
      {
        -[NSSQLGenerator generateIntermediateForLimit:inContext:]([v27 fetchLimit], v17);
      }
      if ([v27 fetchOffset]
        || [v78 valueForKey:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"])
      {
        if (!v70 || !v70->super._limitClause) {
          -[NSSQLGenerator generateIntermediateForLimit:inContext:](0, v17);
        }
        -[NSSQLGenerator generateIntermediateForOffset:inContext:]([v27 fetchOffset], v17);
      }
      if (a4 && objc_msgSend((id)objc_msgSend(v27, "propertiesToFetch"), "count"))
      {
        if (v70) {
          LOBYTE(v70[1].super._correlationToken) = 1;
        }
        v70 = [[NSSQLFetchDictionaryCountIntermediate alloc] initWithFetchIntermediate:v70 inScope:0];
      }
      goto LABEL_110;
    }
LABEL_108:
    [v17 removeObjectForKey:@"outerFetch"];
    goto LABEL_109;
  }
  uint64_t v38 = [v17 objectForKey:@"entity"];
  if ([v17 objectForKey:@"outerFetch"])
  {
    [v17 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported nested update inside of %@", objc_msgSend(v17, "objectForKey:", @"outerFetch", 0), @"NSUnderlyingException" forKey];
LABEL_109:
    v70 = 0;
    goto LABEL_110;
  }
  v39 = -[NSSQLUpdateIntermediate initWithEntity:alias:inScope:]([NSSQLUpdateIntermediate alloc], "initWithEntity:alias:inScope:", v38, objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"aliasGenerator"), "generateTableAlias"), 0);
  [v17 setObject:v39 forKey:@"outerFetch"];

  -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
  if ([v17 objectForKey:@"NSUnderlyingException"]) {
    goto LABEL_108;
  }
  v111 = (NSSQLFetchDictionaryCountIntermediate *)v39;
  uint64_t v40 = (void *)[v17 objectForKey:@"storeRequest"];
  uint64_t v110 = [v17 objectForKey:@"outerFetch"];
  id v41 = (void *)[v40 propertiesToUpdate];
  keyCallBacks.version = *MEMORY[0x1E4F1D530];
  keyCallBacks.retain = 0;
  *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
  uint64_t v42 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 40);
  keyCallBacks.release = 0;
  keyCallBacks.hash = v42;
  CFIndex v43 = *MEMORY[0x1E4F1D540];
  *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
  v44 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D540] + 24);
  valueCallBacks.version = v43;
  valueCallBacks.copyDescription = v44;
  valueCallBacks.equal = 0;
  CFAllocatorRef v45 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, &valueCallBacks);
  v46 = CFDictionaryCreateMutable(v45, 0, &keyCallBacks, &valueCallBacks);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v47 = [v41 countByEnumeratingWithState:&v133 objects:v141 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v134 != v49) {
          objc_enumerationMutation(v41);
        }
        CFDictionarySetValue(v46, *(const void **)(*((void *)&v133 + 1) + 8 * i), (const void *)[v41 objectForKey:*(void *)(*((void *)&v133 + 1) + 8 * i)]);
      }
      uint64_t v48 = [v41 countByEnumeratingWithState:&v133 objects:v141 count:16];
    }
    while (v48);
  }
  uint64_t v112 = v26;
  v113 = v15;
  id v115 = v17;
  if (CFDictionaryGetCount(v46) >= 1)
  {
    unint64_t v51 = 0x1E4F28000uLL;
    do
    {
      context = (void *)MEMORY[0x18C127630]();
      uint64_t v52 = (void *)+[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v46);
      Value = (void *)CFDictionaryGetValue(v46, v52);
      if ([v52 attributeType] == 2100)
      {
        v54 = (void *)[Value constantValue];
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v122 = [v54 countByEnumeratingWithState:&v129 objects:v140 count:16];
        if (v122)
        {
          v55 = 0;
          v120 = v52;
          uint64_t v121 = *(void *)v130;
          v119 = v54;
          do
          {
            for (uint64_t j = 0; j != v122; ++j)
            {
              v124 = v55;
              if (*(void *)v130 != v121) {
                objc_enumerationMutation(v54);
              }
              uint64_t v57 = *(void *)(*((void *)&v129 + 1) + 8 * j);
              v58 = (void *)MEMORY[0x18C127630]();
              v59 = (const void *)[v54 objectForKey:v57];
              long long v125 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              v60 = (void *)[v52 elements];
              uint64_t v61 = [v60 countByEnumeratingWithState:&v125 objects:v139 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                v123 = v58;
                unint64_t v63 = v51;
                v64 = v46;
                uint64_t v65 = *(void *)v126;
                while (2)
                {
                  for (uint64_t k = 0; k != v62; ++k)
                  {
                    if (*(void *)v126 != v65) {
                      objc_enumerationMutation(v60);
                    }
                    v67 = *(void **)(*((void *)&v125 + 1) + 8 * k);
                    if (objc_msgSend((id)objc_msgSend(v67, "name"), "isEqualToString:", v57))
                    {
                      v55 = v67;
                      v46 = v64;
                      unint64_t v51 = v63;
                      v54 = v119;
                      uint64_t v52 = v120;
                      goto LABEL_63;
                    }
                  }
                  uint64_t v62 = [v60 countByEnumeratingWithState:&v125 objects:v139 count:16];
                  if (v62) {
                    continue;
                  }
                  break;
                }
                v46 = v64;
                unint64_t v51 = v63;
                v54 = v119;
                uint64_t v52 = v120;
                v55 = v124;
LABEL_63:
                v58 = v123;
              }
              else
              {
                v55 = v124;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CFDictionarySetValue(v46, v55, v59);
              }
              else
              {
                v68 = (void *)[objc_alloc(*(Class *)(v51 + 3008)) initWithObject:v59];
                CFDictionarySetValue(v46, v55, v68);
              }
            }
            uint64_t v122 = [v54 countByEnumeratingWithState:&v129 objects:v140 count:16];
          }
          while (v122);
        }
      }
      else
      {
        CFDictionarySetValue(theDict, v52, Value);
      }
      CFDictionaryRemoveValue(v46, v52);
    }
    while (CFDictionaryGetCount(v46) > 0);
  }
  CFRelease(v46);
  v69 = [[NSSQLUpdateColumnsIntermediate alloc] initWithPropertiesToUpdate:theDict inScope:v110];
  -[NSSQLUpdateIntermediate setUpdateColumnsIntermediate:](v110, v69);

  CFRelease(theDict);
  uint64_t v15 = v113;
  id v17 = v115;
  v70 = v111;
  uint64_t v26 = v112;
  if (!v111 || !v111->_realFetch) {
    goto LABEL_108;
  }
LABEL_110:
  v79 = (void *)[v17 objectForKey:@"NSUnderlyingException"];
  if (v79) {
    goto LABEL_142;
  }
  uint64_t v80 = [(NSSQLFetchDictionaryCountIntermediate *)v70 generateSQLStringInContext:v17];
  if (!v80)
  {
    v79 = (void *)[v17 objectForKey:@"NSUnderlyingException"];
    if (!v79)
    {
LABEL_128:
      if (v26) {
        *(unsigned char *)(v26 + 40) = 1;
      }
      uint64_t v99 = [NSString stringWithFormat:@"SELECT 0 FROM %@ WHERE 0 = 1", objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"entity", "tableName")];
      if (v26)
      {
        v100 = (void *)v99;
        v101 = *(void **)(v26 + 32);
        if (v101 != (void *)v99)
        {

          *(void *)(v26 + 32) = [v100 copy];
        }
      }
      goto LABEL_138;
    }
LABEL_142:
    v107 = v79;
    id v108 = v79;

    id v109 = v107;
    objc_exception_throw(v107);
  }
  v81 = (void *)v80;
  if (v26)
  {
    v82 = *(void **)(v26 + 32);
    if (v82 != (void *)v80)
    {

      *(void *)(v26 + 32) = [v81 copy];
    }
  }
  -[NSSQLiteStatement setBindIntarrays:](v26, (void *)[v17 objectForKey:@"bindIntarrays"]);
  v83 = (void *)[v17 objectForKey:@"selectBindVars"];
  objc_msgSend(v83, "addObjectsFromArray:", objc_msgSend(v17, "objectForKey:", @"bindVars"));
  uint64_t v84 = [v83 count];
  if (v84)
  {
    uint64_t v85 = v84;
    for (uint64_t m = 0; m != v85; ++m)
      objc_msgSend((id)objc_msgSend(v83, "objectAtIndex:", m), "setIndex:", m);
  }
  -[NSSQLiteAdapter _useModel:](v26, v83);
  if ([v17 objectForKey:@"fabricatedSQLEntityForReadOnlyFetch"]) {
    -[NSSQLiteStatement cacheFakeEntityForFetch:](v26, (void *)[v17 objectForKey:@"fabricatedSQLEntityForReadOnlyFetch"]);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_138;
  }
  v87 = objc_alloc_init(NSCachedFetchRequestInfo);
  v88 = (void *)[v17 valueForKey:@"columnSubOrder"];
  unint64_t v89 = [v88 count];
  v90 = (void *)[v17 valueForKey:@"subOrder"];
  v92 = v90;
  if (v88 && v89 >= 2)
  {
    v114 = v15;
    id v116 = v17;
    uint64_t v93 = [v90 count];
    if (v93)
    {
      unint64_t v94 = v93;
      unint64_t v95 = 0;
      unint64_t v96 = v89 >> 1;
      do
      {
        v97 = (void *)MEMORY[0x18C127630]();
        v98 = (void *)[v92 objectAtIndex:v95 + 1];
        objc_msgSend(v92, "replaceObjectAtIndex:withObject:", v95 + 1, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v98, "integerValue") + v96));
        v95 += 2;
      }
      while (v95 < v94);
    }
    [v88 addObjectsFromArray:v92];
    uint64_t v15 = v114;
    id v17 = v116;
  }
  else
  {
    v88 = v90;
  }
  if (!v87)
  {
    [v17 valueForKey:@"bindIntarraysSubstitutionOrder"];
    if (!v26) {
      goto LABEL_137;
    }
    goto LABEL_136;
  }
  objc_setProperty_nonatomic(v87, v91, v88, 8);
  v102 = (void *)[v17 valueForKey:@"bindIntarraysSubstitutionOrder"];
  objc_setProperty_nonatomic(v87, v103, v102, 16);
  if (v26) {
LABEL_136:
  }
    objc_setProperty_nonatomic((id)v26, v104, v87, 56);
LABEL_137:

LABEL_138:
  return v26;
}

- (void)generateWhereIntermediatesInContext:(void *)a1
{
  uint64_t v2 = [a1 objectForKey:@"outerFetch"];
  uint64_t v3 = [a1 objectForKey:@"predicate"];
  if (!v3) {
    return;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[NSSQLSimpleWhereIntermediate alloc] initWithPredicate:v4 inScope:v2];
    id v9 = v5;
    uint64_t v6 = v2;
LABEL_7:
    -[NSSQLStatementIntermediate setWhereIntermediate:](v6, v5);

    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [[NSSQLCompoundWhereIntermediate alloc] initWithPredicate:v4 inScope:v2 inContext:a1];
    if (!v7) {
      return;
    }
    v5 = (NSSQLSimpleWhereIntermediate *)v7;
    uint64_t v6 = v2;
    id v9 = v5;
    goto LABEL_7;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unknown predicate type for predicate: %@", v4), 0 reason userInfo];

  [a1 setObject:v8 forKey:@"NSUnderlyingException"];
}

- (void)generateOrderIntermediateInContext:(void *)a1
{
  uint64_t v2 = (void *)[a1 objectForKey:@"storeRequest"];
  if ([v2 sortDescriptors])
  {
    uint64_t v3 = [a1 objectForKey:@"outerFetch"];
    uint64_t v4 = -[NSSQLOrderIntermediate initWithSortDescriptors:inScope:]([NSSQLOrderIntermediate alloc], "initWithSortDescriptors:inScope:", [v2 sortDescriptors], v3);
    -[NSSQLStatementIntermediate setOrderIntermediate:](v3, v4);
  }
}

- (void)generateSelectIntermediateInContext:(void *)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[a1 objectForKey:@"outerFetch"];
  uint64_t v3 = (void *)[a1 objectForKey:@"entity"];
  uint64_t v4 = (void *)[a1 objectForKey:@"storeRequest"];
  uint64_t v5 = [v4 resultType];
  int v6 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"nestingLevel"), "unsignedIntValue");
  if (objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "count")) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 2;
  }
  int v8 = v7;
  if (!v6)
  {
    if (v8)
    {
      BOOL v18 = objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "mutableCopy");
      if ([v18 count])
      {
        if (!v5)
        {
          uint64_t v47 = v3;
          uint64_t v48 = v2;
          uint64_t v19 = [v18 count];
          if (v19 - 1 >= 0)
          {
            uint64_t v20 = v19;
            do
            {
              if (objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", --v20), "isTransient")) {
                [v18 removeObjectAtIndex:v20];
              }
            }
            while (v20 > 0);
          }
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v21 = [v18 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v50;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v50 != v23) {
                  objc_enumerationMutation(v18);
                }
                v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                unint64_t v26 = [v25 _propertyType];
                if (v26 > 7 || ((1 << v26) & 0xD4) == 0)
                {
                  [a1 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Bad fetch request (NSManagedObjectResultType not compatible with contents of propertiesToFetch - property %@)", objc_msgSend(v25, "name")), 0), @"NSUnderlyingException" forKey];

                  return;
                }
              }
              uint64_t v22 = [v18 countByEnumeratingWithState:&v49 objects:v57 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
          uint64_t v28 = objc_alloc_init(NSExpressionDescription);
          [(NSPropertyDescription *)v28 setName:@"ZZ_PK"];
          -[NSExpressionDescription setExpression:](v28, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
          [(NSExpressionDescription *)v28 setExpressionResultType:2000];
          [v18 insertObject:v28 atIndex:0];

          uint64_t v3 = v47;
          uint64_t v2 = v48;
        }
LABEL_72:
        id v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLReadOnlySelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, [v2 governingAlias], v18, v2);

        if (![v4 returnsDistinctResults] || v5 != 2) {
          goto LABEL_90;
        }
        goto LABEL_74;
      }

      BOOL v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "entity"), "attributesByName"), "allValues"), "mutableCopy");
      [v18 sortUsingFunction:_comparePropertiesByName context:0];
      uint64_t v40 = [v18 count];
      if (v40 - 1 < 0) {
        goto LABEL_72;
      }
      uint64_t v41 = v40;
      while (1)
      {
        uint64_t v42 = (void *)[v18 objectAtIndex:--v41];
        if (([v42 isTransient] & 1) == 0)
        {
          if (!v42 || [v42 attributeType] != 2100) {
            goto LABEL_71;
          }
          objc_msgSend(v18, "addObjectsFromArray:", objc_msgSend(v42, "_flattenElements:", objc_msgSend(v42, "elements")));
        }
        [v18 removeObjectAtIndex:v41];
LABEL_71:
        if (v41 <= 0) {
          goto LABEL_72;
        }
      }
    }
    if (([v4 includesPropertyValues] & 1) == 0)
    {
      uint64_t v37 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      id v38 = v37;
      if (v3)
      {
        [v37 insertObject:v3[17] atIndex:0];
        uint64_t v39 = v3[16];
      }
      else
      {
        [v37 insertObject:0 atIndex:0];
        uint64_t v39 = 0;
      }
      [v38 insertObject:v39 atIndex:1];
      if (!v3) {
        goto LABEL_86;
      }
      goto LABEL_83;
    }
    if ([v4 includesSubentities])
    {
      if (v3)
      {
        v32 = (void *)v3[19];
        if (v32 && [v32 count])
        {
          uint64_t v33 = v3;
          while (v33)
          {
            uint64_t v34 = v33;
            uint64_t v33 = (void *)v33[21];
            if (v33 == v34) {
              goto LABEL_82;
            }
          }
          goto LABEL_92;
        }
LABEL_78:
        id v38 = (id)v3[10];
        if (v38)
        {
LABEL_83:
          if (v3[20] || (v44 = (void *)v3[19]) != 0 && [v44 count])
          {
LABEL_89:
            id v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLSelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, [v2 governingAlias], v38, v2);
            goto LABEL_90;
          }
LABEL_86:
          id v38 = (id)[v38 mutableCopy];
          CFAllocatorRef v45 = [[NSSQLColumn alloc] initWithColumnName:@"0" sqlType:1];
          v46 = v45;
          if (v45) {
            *(_WORD *)&v45->super._flags &= ~1u;
          }
          [v38 replaceObjectAtIndex:0 withObject:v45];

          goto LABEL_89;
        }
        CFIndex v43 = v3;
        while (v43)
        {
          uint64_t v34 = v43;
          CFIndex v43 = (void *)v43[21];
          if (v43 == v34)
          {
LABEL_82:
            id v38 = (id)v34[9];
            goto LABEL_83;
          }
        }
LABEL_92:
        id v38 = 0;
        goto LABEL_83;
      }
    }
    else if (v3)
    {
      goto LABEL_78;
    }
    id v38 = 0;
    goto LABEL_86;
  }
  if (!v8)
  {
    if (v3) {
      uint64_t v29 = v3[16];
    }
    else {
      uint64_t v29 = 0;
    }
    id v30 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLSelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, [v2 governingAlias], objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v29), v2);
    id v17 = (NSSQLReadOnlySelectIntermediate *)v30;
    if (v5 != 4 || !v30) {
      goto LABEL_90;
    }
    uint64_t v31 = &OBJC_IVAR___NSSQLSelectIntermediate__isCount;
    goto LABEL_76;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "count");
  if (v9 == 1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v11 = (void *)[v4 propertiesToFetch];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          if (([v16 isTransient] & 1) == 0) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v13);
    }
    id v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLReadOnlySelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, [v2 governingAlias], v10, v2);
    if (![v4 returnsDistinctResults]) {
      goto LABEL_90;
    }
LABEL_74:
    if (!v17)
    {
LABEL_90:
      -[NSSQLFetchIntermediate setSelectIntermediate:]((uint64_t)v2, v17);

      return;
    }
    uint64_t v31 = &OBJC_IVAR___NSSQLSelectIntermediate__useDistinct;
LABEL_76:
    *((unsigned char *)&v17->super.super.super.isa + *v31) = 1;
    goto LABEL_90;
  }
  uint64_t v35 = @"Too many";
  if (!v9) {
    uint64_t v35 = @"Too few";
  }
  uint64_t v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Bad NSFetchRequestExpression (%@ propertiesToFetch)", v35), 0 reason userInfo];

  [a1 setValue:v36 forKey:@"NSUnderlyingException"];
}

- (void)generateIntermediateForLimit:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = [[NSSQLLimitIntermediate alloc] initWithLimit:a1 inScope:v3];
  -[NSSQLStatementIntermediate setLimitIntermediate:](v3, v4);
}

- (NSSQLGenerator)initWithPersistentStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLGenerator;
  result = [(NSSQLGenerator *)&v5 init];
  if (result) {
    result->_persistentStore = (NSSQLCore *)a3;
  }
  return result;
}

- (void)generateGroupByIntermediatesForProperties:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = [[NSSQLGroupByIntermediate alloc] initWithProperties:a1 inScope:v3];
  -[NSSQLFetchIntermediate setGroupByIntermediate:](v3, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    self;
    self;
    supportedFunctions = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"@min", @"@max", @"@sum", @"@avg", 0);
  }
}

- (void)generateIntermediateForOffset:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = [[NSSQLOffsetIntermediate alloc] initWithOffset:a1 inScope:v3];
  -[NSSQLFetchIntermediate setOffsetIntermediate:](v3, v4);
}

- (void)generateHavingIntermediateForPredicate:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v4 = [a2 objectForKey:@"outerFetch"];
  objc_super v5 = [[NSSQLHavingIntermediate alloc] initWithPredicate:a1 inScope:v4 inContext:a2];
  -[NSSQLFetchIntermediate setHavingIntermediate:](v4, v5);
}

- (uint64_t)newSQLStatmentForBinaryIndex:(uint64_t)a3 inStore:
{
  uint64_t v3 = a1;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a2, "sqlEntity"), @"entity");
    [v7 setObject:a3 forKey:@"persistentStore"];
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "indexDescription"), "partialIndexPredicate"), "minimalFormInContext:", v7);
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    if (v8 && v9 != v8) {
      [v7 setObject:v8 forKey:@"predicate"];
    }
    uint64_t v10 = (void *)[v7 objectForKey:@"NSUnderlyingException"];
    if ([v7 objectForKey:@"NSUnderlyingException"])
    {
      _NSCoreDataLog(2, @"Unable to generate index for %@", v11, v12, v13, v14, v15, v16, (uint64_t)a2);
      uint64_t v17 = [v10 reason];
      [v10 userInfo];
      _NSCoreDataLog(2, @"Reason: %@, %@", v18, v19, v20, v21, v22, v23, v17);
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C90], "defaultInstance"), "isEqual:", objc_msgSend(v7, "objectForKey:", @"predicate")))
    {
      _NSCoreDataLog(2, @"Unable to generate index for %@", v24, v25, v26, v27, v28, v29, (uint64_t)a2);
      _NSCoreDataLog(2, @"Reason: predicate always evaluates to false", v30, v31, v32, v33, v34, v35, v54);
    }
    else
    {
      uint64_t v3 = -[NSSQLiteAdapter newStatementWithEntity:]([*(id *)(v3 + 8) adapter], objc_msgSend(v7, "objectForKey:", @"entity"));
      id v37 = [[NSSQLIndexIntermediate alloc] initForIndex:a2 withScope:0];
      id v38 = (void *)[v37 generateSQLStringInContext:v7];

      uint64_t v39 = (void *)[v7 objectForKey:@"NSUnderlyingException"];
      if (![v7 objectForKey:@"NSUnderlyingException"])
      {
        if (v3)
        {
          long long v53 = *(void **)(v3 + 32);
          if (v53 != v38)
          {

            *(void *)(v3 + 32) = [v38 copy];
          }
        }

        goto LABEL_10;
      }
      _NSCoreDataLog(2, @"Unable to generate index for %@", v40, v41, v42, v43, v44, v45, (uint64_t)a2);
      uint64_t v46 = [v39 reason];
      [v39 userInfo];
      _NSCoreDataLog(2, @"Reason: %@, %@", v47, v48, v49, v50, v51, v52, v46);
    }
    uint64_t v3 = 0;
LABEL_10:

    [v6 drain];
  }
  return v3;
}

@end