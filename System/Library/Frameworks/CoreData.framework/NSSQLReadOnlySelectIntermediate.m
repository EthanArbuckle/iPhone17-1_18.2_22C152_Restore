@interface NSSQLReadOnlySelectIntermediate
- (BOOL)onlyFetchesAggregates;
- (NSSQLReadOnlySelectIntermediate)initWithScope:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)resolveVariableExpression:(id)a3 inContext:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLReadOnlySelectIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  id v3 = a3;
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  NSUInteger v7 = [(NSArray *)self->super._fetchColumns count];
  *(&self->super._isCount + 1) = 1;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->super._fetchColumns, "count"));
  v9 = [(NSSQLIntermediate *)self fetchIntermediate];
  NSUInteger v103 = v7;
  uint64_t v98 = (uint64_t)v9;
  if (!v9 || !v9[9])
  {
    if (!v7)
    {
      char v15 = 1;
LABEL_37:
      char v100 = 1;
      goto LABEL_38;
    }
    uint64_t v16 = 0;
    while (1)
    {
      id v17 = [(NSArray *)self->super._fetchColumns objectAtIndex:v16];
      if ([v17 _propertyType] != 5) {
        goto LABEL_27;
      }
      v12 = (void *)[v17 expression];
      uint64_t v18 = [v12 expressionType];
      if (v18 == 3) {
        goto LABEL_28;
      }
      if (v18 == 4)
      {
        if (sel_valueForKey_ == (char *)[v12 selector]
          || sel_valueForKeyPath_ == (char *)[v12 selector])
        {
LABEL_28:
          uint64_t v19 = [v12 _mapKVCOperatorsToFunctionsInContext:v3];
          if ([v3 objectForKey:@"NSUnderlyingException"])
          {
LABEL_161:
            [v3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't generate select target token for expression: %@", v12), 0), @"NSUnderlyingException" forKey];
            return 0;
          }
          if (v19)
          {
            id v17 = (id)[v17 copy];
            [v17 setExpression:v19];
          }
          else
          {
            *(&self->super._isCount + 1) = 0;
          }
          NSUInteger v7 = v103;
          goto LABEL_33;
        }
        if (!+[NSSQLFunctionExpressionIntermediate functionIsAcceptableAsAggregate:]((uint64_t)NSSQLFunctionExpressionIntermediate, v12))LABEL_27:*(&self->super._isCount + 1) = 0; {
      }
        }
LABEL_33:
      [v8 addObject:v17];
      if (v7 == ++v16)
      {
        char v15 = 0;
        goto LABEL_37;
      }
    }
  }
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v11 = [(NSArray *)self->super._fetchColumns objectAtIndex:i];
      if ([v11 _propertyType] == 5)
      {
        v12 = (void *)[v11 expression];
        uint64_t v13 = [v12 expressionType];
        if (v13 == 3
          || v13 == 4
          && (sel_valueForKey_ == (char *)[v12 selector]
           || sel_valueForKeyPath_ == (char *)[v12 selector]))
        {
          uint64_t v14 = [v12 _mapKVCOperatorsToFunctionsInContext:v3];
          if ([v3 objectForKey:@"NSUnderlyingException"]) {
            goto LABEL_161;
          }
          if (v14)
          {
            id v11 = (id)[v11 copy];
            [v11 setExpression:v14];
          }
          NSUInteger v7 = v103;
        }
      }
      [v8 addObject:v11];
    }
    char v15 = 0;
    char v100 = 0;
  }
  else
  {
    char v100 = 0;
    char v15 = 1;
  }
LABEL_38:
  uint64_t v20 = [v3 objectForKey:@"keypathExpressionDestinationRelationship"];
  uint64_t v21 = [v3 objectForKey:@"entity"];
  v22 = objc_alloc_init(NSSQLEntity);
  [(NSSQLEntity *)v22 copyValuesForReadOnlyFetch:v21];
  [v3 setObject:v22 forKey:@"fabricatedSQLEntityForReadOnlyFetch"];
  uint64_t v96 = (uint64_t)v22;

  uint64_t v94 = v20;
  if (v21) {
    v99 = *(void **)(v21 + 40);
  }
  else {
    v99 = 0;
  }
  v97 = (void *)v21;
  id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
  v5 = v23;
  if (!*(&self->super._isCount + 1) && self->super._useDistinct) {
    [v23 appendString:@"DISTINCT "];
  }
  if (v15)
  {
LABEL_44:
    v24 = v3;
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v26 = [v8 countByEnumeratingWithState:&v104 objects:v127 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v105;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v105 != v27) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((void *)&v104 + 1) + 8 * j), "name"));
        }
        uint64_t v26 = [v8 countByEnumeratingWithState:&v104 objects:v127 count:16];
      }
      while (v26);
    }
    char v29 = -[NSSQLEntity addPropertiesForReadOnlyFetch:keys:context:](v96, v101, (uint64_t)v25, v24);

    if ((v29 & 1) == 0)
    {

      return 0;
    }
    [v5 appendString:@" FROM "];
    objc_msgSend(v5, "appendString:", -[NSSQLEntity tableName](self->super._entity, "tableName"));
    [v5 appendString:@" "];
    [v5 appendString:self->super._entityAlias];
    [v5 appendString:@" "];
    [v24 removeObjectForKey:@"keypathExpressionDestinationRelationship"];
    if (v94) {
      [v24 setObject:v94 forKey:@"keypathExpressionDestinationRelationship"];
    }
    return v5;
  }
  uint64_t v30 = 0;
  v102 = v3;
  while (1)
  {
    [v3 removeObjectForKey:@"keypathExpressionDestinationRelationship"];
    if (v30) {
      [v5 appendString:@", "];
    }
    v31 = (NSPropertyDescription *)[v8 objectAtIndex:v30];
    v32 = [(NSArray *)self->super._fetchColumns objectAtIndex:v30];
    uint64_t v33 = [(NSPropertyDescription *)v31 _propertyType];
    if ([(NSPropertyDescription *)v31 _isAttribute])
    {
      if ((v100 & 1) == 0
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:](v98, [(NSPropertyDescription *)v31 name]) & 1) == 0)
      {
        if (v5) {

        }
LABEL_168:
        v81 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v82 = [NSString stringWithFormat:@"SELECT clauses in queries with GROUP BY components can only contain properties named in the GROUP BY or aggregate functions (%@ is not in the GROUP BY)", v31];
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v81, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v82, 0), @"NSUnderlyingException");
        return 0;
      }
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v120 = __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke;
      v121 = &unk_1E544E3C8;
      v122 = v99;
      v123 = v31;
      v124 = v5;
      v125 = self;
      id v126 = v101;
      uint64_t v113 = 0;
      v114 = &v113;
      uint64_t v115 = 0x3052000000;
      v116 = __Block_byref_object_copy__32;
      v117 = __Block_byref_object_dispose__32;
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke_51;
      v112[3] = &unk_1E544E3F0;
      v112[5] = v119;
      v112[6] = &v113;
      v112[4] = v5;
      v118 = v112;
      if ([(NSPropertyDescription *)v31 attributeType] == 2100)
      {
        (*(void (**)(void))(v114[5] + 16))();
        objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 1, &stru_1ED787880);
      }
      else
      {
        if (v31 && [(NSPropertyDescription *)v31 superCompositeAttribute]) {
          uint64_t v40 = [(NSPropertyDescription *)v31 _qualifiedName];
        }
        else {
          uint64_t v40 = [(NSPropertyDescription *)v31 name];
        }
        v120((uint64_t)v119, v40);
      }
      _Block_object_dispose(&v113, 8);
      goto LABEL_141;
    }
    if (v33 != 5)
    {
      if (v33 != 4)
      {

        v79 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v80 = [NSString stringWithFormat:@"Unsupported value passed to valuesToFetch: (%@) not supported", v31];
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v79, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v80, 0), @"NSUnderlyingException");

        return 0;
      }
      if ((v100 & 1) == 0
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:](v98, [(NSPropertyDescription *)v31 name]) & 1) == 0)
      {
        if (v5) {

        }
        goto LABEL_168;
      }
      uint64_t v34 = objc_msgSend(v99, "objectForKey:", -[NSPropertyDescription name](v31, "name"));
      v35 = objc_alloc_init(NSSQLToOne);
      v36 = v35;
      if (v35) {
        v35->super.super._propertyDescription = v31;
      }
      [(NSSQLToOne *)v35 copyValuesForReadOnlyFetch:v34];
      uint64_t v37 = [(NSSQLRelationship *)v36 destinationEntity];
      if (v37)
      {
        v38 = *(void **)(v37 + 152);
        if (v38)
        {
          if ([v38 count])
          {
            [v5 appendString:self->super._columnAlias];
            [v5 appendString:@"."];
            if (v36) {
              foreignEntityKey = v36->_foreignEntityKey;
            }
            else {
              foreignEntityKey = 0;
            }
            objc_msgSend(v5, "appendString:", -[NSSQLColumn columnName](foreignEntityKey, "columnName"));
            [v5 appendString:@", "];
          }
        }
      }
      goto LABEL_140;
    }
    v41 = (void *)[(NSPropertyDescription *)v31 expression];
    uint64_t v42 = [v41 expressionType];
    if (!v42) {
      break;
    }
    if (v42 == 1)
    {
      v43 = [[NSSQLToOne alloc] initForReadOnlyFetchWithEntity:v97 propertyDescription:v31];
      v36 = v43;
      if (v43)
      {
        v43->super.super._propertyDescription = v31;
        if (![v102 objectForKey:@"nestedWhereSelect"])
        {
          v44 = v36->_foreignEntityKey;
          goto LABEL_82;
        }
      }
      else if (![v102 objectForKey:@"nestedWhereSelect"])
      {
        v44 = 0;
LABEL_82:
        if (v97 && (v97[20] || (v68 = (void *)v97[19]) != 0 && [v68 count]))
        {
          [v5 appendString:self->super._columnAlias];
          [v5 appendString:@"."];
          objc_msgSend(v5, "appendString:", -[NSSQLColumn columnName](v44, "columnName"));
        }
        else
        {
          if (v44) {
            columnValue = v44->_columnValue;
          }
          else {
            columnValue = 0;
          }
          objc_msgSend(v5, "appendFormat:", @"%u", -[NSNumber unsignedIntValue](columnValue, "unsignedIntValue"));
        }
        [v5 appendString:@", "];
      }
LABEL_140:
      [v5 appendString:self->super._columnAlias];
      [v5 appendString:@"."];
      objc_msgSend(v5, "appendString:", -[NSSQLToOne columnName](v36, "columnName"));
      [v101 addObject:v36];

      goto LABEL_141;
    }
    if ((unint64_t)(v42 - 3) > 1)
    {
      if (v42 == 20)
      {
        v58 = [(NSSQLExpressionIntermediate *)[NSSQLTernaryExpressionIntermediate alloc] initWithExpression:v41 allowToMany:0 inScope:self];
        id v59 = [(NSSQLTernaryExpressionIntermediate *)v58 generateSQLStringInContext:v102];

        if (!v59)
        {

          if (![v102 objectForKey:@"NSUnderlyingException"])
          {
            v89 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v90 = [NSString stringWithFormat:@"Can't generate SQL for ternary expression: %@", v41];
            objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v89, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v90, 0), @"NSUnderlyingException");
          }
          return 0;
        }
        [v5 appendString:v59];

        v60 = [[NSSQLAttribute alloc] initForReadOnlyFetchWithExpression:v31];
        v57 = v60;
        if (v60) {
          v60[1] = v32;
        }
      }
      else
      {
        if (v42 != 50
          || ([v41 isCountOnlyRequest] & 1) == 0
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") != 4)
        {

          v85 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v86 = [NSString stringWithFormat:@"Currently unsupported (%@), try again later", v31];
          objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v85, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v86, 0), @"NSUnderlyingException");

          return 0;
        }
        v55 = (void *)-[NSSQLIntermediate _generateSQLForFetchExpression:allowToMany:inContext:](self, v41, 1, v102);
        if (!v55)
        {

          if (![v102 objectForKey:@"NSUnderlyingException"])
          {
            v91 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v92 = [NSString stringWithFormat:@"Can't generate select target token for fetch request expression: %@", v41];
            objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v91, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v92, 0), @"NSUnderlyingException");
          }
          return 0;
        }
        [v5 appendString:v55];

        v56 = [[NSSQLAttribute alloc] initForReadOnlyFetchWithExpression:v31];
        v57 = v56;
        if (v56) {
          v56[1] = v32;
        }
      }
      goto LABEL_133;
    }
    if (sel_inverseOrderKey_ == (char *)[v41 selector])
    {
      objc_msgSend(v5, "appendString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "arguments"), "objectAtIndex:", 0), "constantValue"));
      v67 = [[NSSQLAttribute alloc] initForReadOnlyFetchWithExpression:v31];
      v57 = v67;
      if (v67) {
        v67[1] = v32;
      }
LABEL_133:
      [v101 addObject:v57];

      goto LABEL_141;
    }
    if (([(id)objc_opt_class() isSimpleKeypath:v41] & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v41))
    {
      v50 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:v41 allowToMany:0 inScope:self];
    }
    else if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((BOOL)self, v41))
    {
      v50 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", [v41 operand], objc_msgSend((id)objc_msgSend(v41, "arguments"), "objectAtIndex:", 0), self);
    }
    else
    {
      v50 = [(NSSQLExpressionIntermediate *)[NSSQLFunctionExpressionIntermediate alloc] initWithExpression:v41 allowToMany:0 inScope:self];
    }
    v51 = v50;
    id v52 = [(NSSQLKeypathExpressionIntermediate *)v50 generateSQLStringInContext:v102];
    if (!v52)
    {

      if (![v102 objectForKey:@"NSUnderlyingException"])
      {
        v87 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v88 = [NSString stringWithFormat:@"Can't generate select target token for expression: %@", v41];
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v87, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v88, 0), @"NSUnderlyingException");
      }
      return 0;
    }
    [v5 appendString:v52];

    uint64_t v53 = [v102 objectForKey:@"keypathExpressionDestinationRelationship"];
    if (v53 && [(NSPropertyDescription *)v31 expressionResultType] == 2000)
    {
      v54 = objc_alloc_init(NSSQLToOne);
      [(NSSQLToOne *)v54 copyValuesForReadOnlyFetch:v53];
      if (v54) {
        v54->super.super._propertyDescription = v32;
      }
      [v101 addObject:v54];
    }
    else
    {
      v61 = [[NSSQLAttribute alloc] initForReadOnlyFetchWithExpression:v31];
      v93 = v61;
      if (v61) {
        v61[1] = v32;
      }
      objc_msgSend(v101, "addObject:");
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      obuint64_t j = (id)objc_msgSend((id)objc_msgSend(v102, "objectForKeyedSubscript:", @"storeRequest"), "sortDescriptors");
      uint64_t v62 = [obj countByEnumeratingWithState:&v108 objects:v128 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v109;
        while (2)
        {
          for (uint64_t k = 0; k != v62; ++k)
          {
            if (*(void *)v109 != v63) {
              objc_enumerationMutation(obj);
            }
            v65 = *(void **)(*((void *)&v108 + 1) + 8 * k);
            v66 = [(NSPropertyDescription *)v31 name];
            if (-[NSString isEqualToString:](v66, "isEqualToString:", [v65 key]))
            {
              if (v97) {
                v71 = (void *)v97[5];
              }
              else {
                v71 = 0;
              }
              if ([v71 objectForKeyedSubscript:v66])
              {
                _NSCoreDataLog(2, @"Sort descriptor key \"%@\" may refer to a modelled property or an expression; the modelled property will be used.",
                  v72,
                  v73,
                  v74,
                  v75,
                  v76,
                  v77,
                  (uint64_t)v66);
              }
              else
              {
                v78 = (void *)-[NSSQLAliasGenerator generateVariableAlias]([v102 objectForKey:@"aliasGenerator"]);
                [(NSMutableDictionary *)self->_variableToAliasMappings setObject:v78 forKey:v31];
                -[NSSQLColumn _setColumnName:]((uint64_t)v93, v78);
              }
              goto LABEL_153;
            }
          }
          uint64_t v62 = [obj countByEnumeratingWithState:&v108 objects:v128 count:16];
          if (v62) {
            continue;
          }
          break;
        }
      }
LABEL_153:
    }
LABEL_141:
    uint64_t v70 = [(NSMutableDictionary *)self->_variableToAliasMappings objectForKey:v31];
    if (v70) {
      [v5 appendFormat:@" AS %@", v70];
    }
    ++v30;
    id v3 = v102;
    if (v30 == v103) {
      goto LABEL_44;
    }
  }
  v45 = (void *)[v41 constantValue];
  if (([v45 isNSArray] & 1) == 0
    && ([v45 isNSSet] & 1) == 0
    && ([v45 isNSOrderedSet] & 1) == 0
    && ![v45 isNSDictionary])
  {
    v46 = [[NSSQLConstantValueIntermediate alloc] initWithConstantValue:v45 inScope:self context:v102];
    id v47 = [(NSSQLConstantValueIntermediate *)v46 generateSQLStringInContext:v102];

    if (!v47)
    {
      if (v5) {

      }
      if (![v102 objectForKey:@"NSUnderlyingException"])
      {
        v83 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v84 = [NSString stringWithFormat:@"Can't generate select target token for constant: %@", v45];
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v83, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v84, 0), @"NSUnderlyingException");
      }
      return 0;
    }
    [v5 appendString:v47];

    v48 = [[NSSQLAttribute alloc] initForReadOnlyFetchWithExpression:v31];
    v49 = v48;
    if (v48) {
      v48[1] = v31;
    }
    [v101 addObject:v48];

    goto LABEL_141;
  }
  if (v5) {

  }
  [v102 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Constant select targets must be values, not collections", 0), @"NSUnderlyingException" forKey];
  return 0;
}

void __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:a2];
  id v5 = [(NSSQLColumn *)[NSSQLAttribute alloc] initForReadOnlyFetching];
  [v5 copyValuesForReadOnlyFetch:v3];
  v4 = v5;
  if (v5)
  {
    *((void *)v5 + 1) = *(void *)(a1 + 40);
    if (*((_WORD *)v5 + 16))
    {
      [*(id *)(a1 + 48) appendString:*(void *)(*(void *)(a1 + 56) + 56)];
      [*(id *)(a1 + 48) appendString:@"."];
      v4 = v5;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "appendString:", objc_msgSend(v4, "columnName"));
  [*(id *)(a1 + 64) addObject:v5];
}

- (NSSQLReadOnlySelectIntermediate)initWithScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLReadOnlySelectIntermediate;
  uint64_t v3 = [(NSSQLIntermediate *)&v5 initWithScope:a3];
  if (v3)
  {
    *(void *)&v3->_onlyFetchesAggregates = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_variableToAliasMappings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (BOOL)onlyFetchesAggregates
{
  return *(&self->super._isCount + 1);
}

- (void)dealloc
{
  *(void *)&self->_onlyFetchesAggregates = 0;
  self->_variableToAliasMappings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLReadOnlySelectIntermediate;
  [(NSSQLSelectIntermediate *)&v3 dealloc];
}

- (id)resolveVariableExpression:(id)a3 inContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = (void *)[a4 objectForKey:@"storeRequest"];
  v8 = (void *)[*(id *)&self->_onlyFetchesAggregates objectForKey:a3];
  if (v8)
  {
    return (id)[v8 mutableCopy];
  }
  else
  {
    uint64_t v10 = [a3 variable];
    id v11 = (void *)[v7 propertiesToFetch];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
LABEL_7:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if ([v16 _propertyType] == 5
          && (objc_msgSend((id)objc_msgSend(v16, "name"), "isEqual:", v10) & 1) != 0)
        {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v13) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
      id v17 = (void *)-[NSSQLAliasGenerator generateVariableAlias]([a4 objectForKey:@"aliasGenerator"]);
      [*(id *)&self->_onlyFetchesAggregates setObject:v17 forKey:a3];
      [(NSMutableDictionary *)self->_variableToAliasMappings setObject:v17 forKey:v16];
      id result = (id)[v17 mutableCopy];
      if (result) {
        return result;
      }
    }
LABEL_16:
    if (![a4 objectForKey:@"NSUnderlyingException"]) {
      [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unable to resolve variable expression: %@", a3), 0), @"NSUnderlyingException" forKey];
    }
    return 0;
  }
}

uint64_t __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke_51(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = objc_msgSend(a2, "elements", 0);
    uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
          ++v8;
        }
        while (v6 != v8);
        uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      (*(void (**)(void, uint64_t))(a1[5] + 16))(a1[5], [a2 _qualifiedName]);
      v9 = (void *)a1[4];
      return [v9 appendString:@", "];
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

@end