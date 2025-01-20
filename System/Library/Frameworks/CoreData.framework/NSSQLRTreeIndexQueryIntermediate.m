@interface NSSQLRTreeIndexQueryIntermediate
- (id)generateSQLStringInContext:(id)a3;
- (id)initForIndexNamed:(id)a3 onEntity:(id)a4 properties:(id)a5 ranges:(id)a6 inScope:(id)a7;
- (uint64_t)_validateCollection:(void *)a3 context:;
- (uint64_t)_validateExpression:(void *)a3 context:;
- (void)dealloc;
@end

@implementation NSSQLRTreeIndexQueryIntermediate

- (id)initForIndexNamed:(id)a3 onEntity:(id)a4 properties:(id)a5 ranges:(id)a6 inScope:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)NSSQLRTreeIndexQueryIntermediate;
  v11 = [(NSSQLIntermediate *)&v13 initWithScope:a7];
  if (v11)
  {
    v11->_indexName = (NSExpression *)a3;
    v11->_entity = (NSSQLEntity *)a4;
    v11->_properties = (NSArray *)a5;
    v11->_ranges = (NSArray *)a6;
  }
  return v11;
}

- (void)dealloc
{
  self->_indexName = 0;
  self->_entity = 0;

  self->_properties = 0;
  self->_ranges = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLRTreeIndexQueryIntermediate;
  [(NSSQLRTreeIndexQueryIntermediate *)&v3 dealloc];
}

- (uint64_t)_validateCollection:(void *)a3 context:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 isNSArray])
    {
      if ([a2 count] == 2) {
        return 1;
      }
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS for rtree query (array should have 2 elements) %@", a2];
      v14[0] = @"entity";
      uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v14[1] = @"properties";
      v15[0] = v13;
      v15[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = v15;
      v12 = v14;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS for rtree query (should be an array but isn't) %@", a2];
      v16[0] = @"entity";
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v16[1] = @"properties";
      v17[0] = v9;
      v17[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = v17;
      v12 = v16;
    }
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2)), @"NSUnderlyingException");
    return 0;
  }
  return result;
}

- (uint64_t)_validateExpression:(void *)a3 context:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 expressionType])
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS  element for rtree query (should be a constant value) %@", a2];
      v10[0] = @"entity";
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v10[1] = @"properties";
      v11[0] = v9;
      v11[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, v10, 2)), @"NSUnderlyingException");
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)generateSQLStringInContext:(id)a3
{
  v99[2] = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  NSUInteger v5 = [(NSArray *)self->_properties count];
  if (v5 != [(NSArray *)self->_ranges count])
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    properties = self->_properties;
    v98[0] = @"properties";
    v98[1] = @"ranges";
    ranges = self->_ranges;
    v99[0] = properties;
    v99[1] = ranges;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
    v11 = @"Mismatch between number of properties and number of ranges for rtree query";
LABEL_7:
    v16 = v12;
    uint64_t v17 = v13;
    goto LABEL_56;
  }
  indexName = self->_indexName;
  if (indexName)
  {
    uint64_t v7 = [(NSExpression *)indexName expressionType];
    indexName = self->_indexName;
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      v96 = @"indexNameExpression";
      v97 = indexName;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      v11 = @"Invalid index name expression (should be a constant value)";
LABEL_55:
      v16 = v8;
      uint64_t v17 = v9;
      goto LABEL_56;
    }
  }
  id v18 = [(NSExpression *)indexName constantValue];
  if (([v18 isNSString] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v94 = @"indexName";
    id v95 = v18;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    v11 = @"Invalid index name (should be a string)";
    goto LABEL_55;
  }
  v19 = -[NSSQLAliasGenerator initWithNestingLevel:]([NSSQLAliasGenerator alloc], "initWithNestingLevel:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"nestingLevel"), "integerValue") + 1);
  uint64_t v70 = [(NSSQLAliasGenerator *)v19 generateTableAlias];

  v69 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (![(NSArray *)self->_properties count])
  {
    id v73 = 0;
    v74 = 0;
LABEL_59:
    uint64_t v52 = [v69 componentsJoinedByString:@" AND "];
    return (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ IN (SELECT %@.Z_PK FROM %@ %@ WHERE (%@))", v73, v70, v74, v70, v52];
  }
  id v73 = 0;
  v74 = 0;
  uint64_t v20 = 0;
  uint64_t v68 = (uint64_t)v18;
  while (1)
  {
    id v21 = [(NSArray *)self->_properties objectAtIndex:v20];
    id v22 = [(NSArray *)self->_ranges objectAtIndex:v20];
    if (([(id)objc_opt_class() isSimpleKeypath:v21] & 1) == 0)
    {
      v53 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v54 = *MEMORY[0x1E4F1C3C8];
      uint64_t v55 = [NSString stringWithFormat:@"Invalid LHS for rtree query %@", v21];
      v92[0] = @"entity";
      uint64_t v56 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v92[1] = @"properties";
      v93[0] = v56;
      v93[1] = [(NSArray *)self->_properties valueForKey:@"name"];
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v93;
      v59 = v92;
      goto LABEL_70;
    }
    if (![(NSSQLIntermediate *)self keypathExpressionIsSafeLHSForIn:v21])
    {
      v53 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v54 = *MEMORY[0x1E4F1C3C8];
      uint64_t v55 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported predicate; can't generate SQL for %@",
              v21);
      v60 = self->_properties;
      v90[0] = @"properties";
      v90[1] = @"ranges";
      v61 = self->_ranges;
      v91[0] = v60;
      v91[1] = v61;
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v91;
      v59 = v90;
      goto LABEL_70;
    }
    if (!v73)
    {
      v23 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:v21 allowToMany:0 inScope:self->super._scope];
      v24 = v23;
      if (v23) {
        *(&v23->super._allowToMany + 1) = 1;
      }
      id v25 = [(NSSQLKeypathExpressionIntermediate *)v23 generateSQLStringInContext:a3];

      id v73 = v25;
      if (!v25) {
        break;
      }
    }
    uint64_t v71 = v20;
    if ([v21 expressionType]) {
      v26 = (void *)[v21 keyPath];
    }
    else {
      v26 = (void *)[v21 constantValue];
    }
    v27 = v26;
    v28 = (void *)[v26 componentsSeparatedByString:@"."];
    entity = self->_entity;
    id v72 = v22;
    if ([v28 count] == 1)
    {
      v30 = self->_entity;
      if (v30)
      {
        v31 = (void *)[(NSMutableDictionary *)v30->_properties objectForKey:v27];
        goto LABEL_38;
      }
LABEL_37:
      v31 = 0;
      goto LABEL_38;
    }
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v32 = [v28 countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (!v32) {
      goto LABEL_37;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v76;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v76 != v34) {
          objc_enumerationMutation(v28);
        }
        if (entity) {
          v31 = (void *)[(NSMutableDictionary *)entity->_properties objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * v35)];
        }
        else {
          v31 = 0;
        }
        if ([v31 propertyType] != 1) {
          entity = (NSSQLEntity *)[v31 destinationEntity];
        }
        ++v35;
      }
      while (v33 != v35);
      uint64_t v36 = [v28 countByEnumeratingWithState:&v75 objects:v87 count:16];
      uint64_t v33 = v36;
    }
    while (v36);
LABEL_38:
    if ([v31 propertyType] != 1)
    {
      v53 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v54 = *MEMORY[0x1E4F1C3C8];
      uint64_t v55 = [NSString stringWithFormat:@"Invalid ranged property (relationship?!?) %@", v21];
      v85[0] = @"entity";
      uint64_t v62 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v85[1] = @"properties";
      v86[0] = v62;
      v86[1] = [(NSArray *)self->_properties valueForKey:@"name"];
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v86;
      v59 = v85;
      goto LABEL_70;
    }
    uint64_t v37 = -[NSSQLEntity rtreeIndexForIndexNamed:]((uint64_t)entity, v68);
    if (!v37)
    {
      if (v68) {
        v63 = (__CFString *)[NSString stringWithFormat:@"(no index found for name %@)", v68];
      }
      else {
        v63 = @"(no index name specified, multiple indices available)";
      }
      v53 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v54 = *MEMORY[0x1E4F1C3C8];
      uint64_t v55 = [NSString stringWithFormat:@"Can't find index for rtree query %@", v63];
      v83[0] = @"entity";
      uint64_t v67 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v83[1] = @"properties";
      v84[0] = v67;
      v84[1] = [(NSArray *)self->_properties valueForKey:@"name"];
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v84;
      v59 = v83;
      goto LABEL_70;
    }
    v38 = v74;
    if (v74)
    {
      v39 = v72;
      if (([v74 isEqual:*(void *)(v37 + 48)] & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3B8];
        v81[0] = @"entity";
        uint64_t v64 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
        v81[1] = @"properties";
        v82[0] = v64;
        v82[1] = [(NSArray *)self->_properties valueForKey:@"name"];
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
        v11 = @"Can't generate SQL; crosscheck failed";
        goto LABEL_7;
      }
    }
    else
    {
      v38 = *(void **)(v37 + 48);
      v39 = v72;
    }
    uint64_t v40 = [v39 expressionType];
    v74 = v38;
    if (v40 == 14)
    {
      v44 = (void *)[v39 collection];
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateCollection:context:]((uint64_t)self, v44, a3)) {
        return 0;
      }
      v45 = (void *)[v44 firstObject];
      v46 = (void *)[v44 lastObject];
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateExpression:context:]((uint64_t)self, v45, a3)
        || !-[NSSQLRTreeIndexQueryIntermediate _validateExpression:context:]((uint64_t)self, v46, a3))
      {
        return 0;
      }
      uint64_t v42 = [v45 constantValue];
      uint64_t v43 = [v46 constantValue];
    }
    else
    {
      if (v40)
      {
        v53 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v54 = *MEMORY[0x1E4F1C3C8];
        uint64_t v55 = [NSString stringWithFormat:@"Invalid RHS for rtree query %@", v39];
        v79[0] = @"entity";
        uint64_t v65 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
        v79[1] = @"properties";
        v80[0] = v65;
        v80[1] = [(NSArray *)self->_properties valueForKey:@"name"];
        v57 = (void *)MEMORY[0x1E4F1C9E8];
        v58 = v80;
        v59 = v79;
        goto LABEL_70;
      }
      v41 = (void *)[v39 constantValue];
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateCollection:context:]((uint64_t)self, v41, a3)) {
        return 0;
      }
      uint64_t v42 = [v41 firstObject];
      uint64_t v43 = [v41 lastObject];
    }
    uint64_t v47 = v43;
    v48 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v42, (uint64_t)a3);
    v49 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v47, (uint64_t)a3);
    uint64_t v50 = [NSString stringWithFormat:@"%@ <= %@.%@_MIN AND %@.%@_MAX <= %@", v48, v70, objc_msgSend(v31, "columnName"), v70, objc_msgSend(v31, "columnName"), v49];

    [v69 addObject:v50];
    uint64_t v20 = v71 + 1;
    if (v71 + 1 >= [(NSArray *)self->_properties count]) {
      goto LABEL_59;
    }
  }
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  v53 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v54 = *MEMORY[0x1E4F1C3C8];
  uint64_t v55 = [NSString stringWithFormat:@"Unable to generate SQL for keypath %@", v21];
  v88[0] = @"entity";
  uint64_t v66 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
  v88[1] = @"properties";
  v89[0] = v66;
  v89[1] = [(NSArray *)self->_properties valueForKey:@"name"];
  v57 = (void *)MEMORY[0x1E4F1C9E8];
  v58 = v89;
  v59 = v88;
LABEL_70:
  uint64_t v10 = [v57 dictionaryWithObjects:v58 forKeys:v59 count:2];
  v16 = v53;
  uint64_t v17 = v54;
  v11 = (__CFString *)v55;
LABEL_56:
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v11, v10), @"NSUnderlyingException");
  return 0;
}

@end