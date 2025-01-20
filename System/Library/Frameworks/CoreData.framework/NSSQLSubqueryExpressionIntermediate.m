@interface NSSQLSubqueryExpressionIntermediate
- (BOOL)_isKeypathScopedToSubquery:(BOOL)result;
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSSQLSubqueryExpressionIntermediate)initWithExpression:(id)a3 trailingKeypath:(id)a4 inScope:(id)a5;
- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)fetchIntermediateForKeypathExpression:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntityForKeypathExpression:(id)a3;
- (uint64_t)canDoDirectJoinGivenPredicate:(void *)a1;
- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3;
- (void)_promoteJoinsForSubqueryScopedKeypaths;
- (void)_setVariableColumn:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSSQLSubqueryExpressionIntermediate

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "operand"), "isEqual:", -[NSExpression variableExpression](self->super._expression, "variableExpression")))
  {
    if ([a3 expressionType] == 3) {
      v5 = (void *)[a3 keyPath];
    }
    else {
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
    }
    uint64_t v6 = [v5 componentsSeparatedByString:@"."];
    keypathsToPromote = self->_keypathsToPromote;
    if (!keypathsToPromote)
    {
      keypathsToPromote = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_keypathsToPromote = keypathsToPromote;
    }
    [(NSMutableArray *)keypathsToPromote addObject:v6];
  }
  scope = self->super.super._scope;

  [(NSSQLIntermediate *)scope _promoteJoinsForSubqueryScopedKeypath:a3];
}

- (id)generateSQLStringInContext:(id)a3
{
  id v3 = a3;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if (![(NSSQLIntermediate *)self isIndexScoped])
  {
    trailingKeypath = self->_trailingKeypath;
    if (trailingKeypath)
    {
      v12 = (void *)[(NSExpression *)trailingKeypath predicateFormat];
      uint64_t v13 = [v12 rangeOfString:@".@"];
      if (v13 != [v12 rangeOfString:@".@" options:4])
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        uint64_t v16 = [NSString stringWithFormat:@"Unsupported subquery (too many functions): %@", self->super._expression];
LABEL_7:
        v8 = (__CFString *)v16;
        v9 = v14;
        uint64_t v10 = v15;
        uint64_t v7 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      v12 = 0;
    }
    if (([(NSSQLIntermediate *)self isTargetColumnsScoped]
       || [(NSSQLIntermediate *)self isUpdateScoped])
      && !self->_trailingKeypath
      && ([v12 hasSuffix:@".@count"] & 1) == 0
      && ([v12 hasSuffix:@".@min"] & 1) == 0
      && ([v12 hasSuffix:@".@max"] & 1) == 0
      && ([v12 hasSuffix:@".@sum"] & 1) == 0
      && ([v12 hasSuffix:@".@avg"] & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = [NSString stringWithFormat:@"Unsupported subquery (non-aggregate not allowed in select or update column): %@", self->super._expression];
      goto LABEL_7;
    }
    self->_fetchIntermediate = [[NSSQLFetchIntermediate alloc] initWithScope:self];
    id v19 = [(NSExpression *)self->super._expression collection];
    if (([(id)objc_opt_class() isSimpleKeypath:v19] & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v19))
    {
      [v3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported subquery collection type (%@)", v19), 0), @"NSUnderlyingException" forKey];
      goto LABEL_139;
    }
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", @".");
    if ((unint64_t)[v20 count] < 2) {
      uint64_t v21 = [MEMORY[0x1E4F1C978] array];
    }
    else {
      uint64_t v21 = objc_msgSend(v20, "subarrayWithRange:", 1, objc_msgSend(v20, "count") - 1);
    }
    v147 = (void *)v21;
    v22 = [(NSSQLIntermediate *)self->super.super._scope governingEntityForKeypathExpression:v19];
    self->_selectFromEntity = v22;
    BOOL v23 = [(NSSQLIntermediate *)self isUpdateColumnsScoped];
    scope = self->super.super._scope;
    if (v23)
    {
      id v25 = [(NSSQLIntermediate *)scope governingAlias];
      if (v25) {
        goto LABEL_30;
      }
      uint64_t v26 = [(NSSQLEntity *)v22 tableName];
    }
    else
    {
      uint64_t v26 = [(NSSQLIntermediate *)scope governingAliasForKeypathExpression:v19];
    }
    id v25 = (id)v26;
LABEL_30:
    id v144 = v19;
    uint64_t v27 = [v20 objectAtIndex:0];
    if (v22)
    {
      v28 = (void *)[(NSMutableDictionary *)v22->_properties objectForKey:v27];
      v29 = (void *)[v3 valueForKey:@"explicitRestrictingEntityQualifier"];
      if (v28) {
        goto LABEL_38;
      }
    }
    else
    {
      v29 = (void *)[v3 valueForKey:@"explicitRestrictingEntityQualifier"];
    }
    v30 = v29;
    if ([v29 count])
    {
      uint64_t v31 = [v30 lastObject];
      uint64_t v32 = [v20 objectAtIndex:0];
      if (v31) {
        v28 = (void *)[*(id *)(v31 + 40) objectForKey:v32];
      }
      else {
        v28 = 0;
      }
      [v30 removeLastObject];
    }
    else
    {
      v28 = 0;
    }
LABEL_38:
    v33 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"aliasGenerator"), "generateTableAlias");
    self->_selectEntityAlias = v33;
    self->_variableAlias = v33;
    self->_governingEntityForVariable = self->_selectFromEntity;
    int v34 = [v28 propertyType];
    [(NSSQLStatementIntermediate *)self->_fetchIntermediate setGoverningAlias:self->_selectEntityAlias];
    switch(v34)
    {
      case 7:
        char v148 = 1;
        v35 = (NSSQLEntity *)[v28 destinationEntity];
        self->_selectFromEntity = v35;
        self->_governingEntityForVariable = v35;
        v36 = (void *)[v25 mutableCopy];
        [v36 appendString:@"."];
        objc_msgSend(v36, "appendString:", objc_msgSend((id)objc_msgSend(v28, "foreignKey"), "columnName"));
        [v36 appendString:@" = "];
        [v36 appendString:self->_selectEntityAlias];
        [v36 appendString:@"."];
        selectFromEntity = self->_selectFromEntity;
        if (selectFromEntity) {
          primaryKey = selectFromEntity->_primaryKey;
        }
        else {
          primaryKey = 0;
        }
        objc_msgSend(v36, "appendString:", -[NSSQLColumn columnName](primaryKey, "columnName"));
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v36);

        break;
      case 9:
        char v148 = 0;
        v69 = (NSSQLEntity *)[v28 destinationEntity];
        self->_selectFromEntity = v69;
        self->_governingEntityForVariable = v69;
        if (v28) {
          v44 = (__CFString *)v28[7];
        }
        else {
          v44 = 0;
        }
        v70 = (void *)[v25 mutableCopy];
        [v70 appendString:@"."];
        if (v22) {
          v71 = v22->_primaryKey;
        }
        else {
          v71 = 0;
        }
        objc_msgSend(v70, "appendString:", -[NSSQLColumn columnName](v71, "columnName"));
        [v70 appendString:@" = "];
        [v70 appendString:self->_selectEntityAlias];
        [v70 appendString:@"."];
        [v70 appendString:-[NSSQLManyToMany inverseColumnName](v44)];
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v70);

        if (self->_onlyTrailIsCount && self->_subqueryHasTruePredicate)
        {
          v72 = (NSMutableString *)objc_msgSend((id)objc_msgSend(v28, "correlationTableName"), "mutableCopy");
          self->_selectFromCorrelationTarget = v72;
          [(NSMutableString *)v72 appendString:@" "];
          [(NSMutableString *)self->_selectFromCorrelationTarget appendString:self->_selectEntityAlias];
          goto LABEL_52;
        }
        v77 = (NSMutableString *)objc_msgSend((id)objc_msgSend(v28, "correlationTableName"), "mutableCopy");
        self->_selectFromCorrelationTarget = v77;
        [(NSMutableString *)v77 appendString:@" "];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:self->_selectEntityAlias];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@" JOIN "];
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", objc_msgSend((id)objc_msgSend(v28, "destinationEntity"), "tableName"));
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@" "];
        v78 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"aliasGenerator"), "generateTableAlias");
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:v78];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@" ON "];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:self->_selectEntityAlias];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@"."];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:[(__CFString *)v44 columnName]];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@" = "];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:v78];
        [(NSMutableString *)self->_selectFromCorrelationTarget appendString:@"."];
        selectFromCorrelationTarget = self->_selectFromCorrelationTarget;
        v80 = (void *)[v28 destinationEntity];
        if (v80) {
          v80 = (void *)v80[16];
        }
        -[NSMutableString appendString:](selectFromCorrelationTarget, "appendString:", [v80 columnName]);

        self->_selectEntityAlias = v78;
        self->_variableAlias = self->_selectEntityAlias;
        break;
      case 8:
        char v148 = 0;
        v40 = (NSSQLEntity *)[v28 destinationEntity];
        self->_selectFromEntity = v40;
        self->_governingEntityForVariable = v40;
        if (v28) {
          v41 = (void *)v28[7];
        }
        else {
          v41 = 0;
        }
        v42 = (void *)[v25 mutableCopy];
        [v42 appendString:@"."];
        if (v22) {
          v43 = v22->_primaryKey;
        }
        else {
          v43 = 0;
        }
        objc_msgSend(v42, "appendString:", -[NSSQLColumn columnName](v43, "columnName"));
        [v42 appendString:@" = "];
        [v42 appendString:self->_selectEntityAlias];
        [v42 appendString:@"."];
        objc_msgSend(v42, "appendString:", objc_msgSend((id)objc_msgSend(v41, "foreignKey"), "columnName"));
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v42);

        uint64_t v39 = [v28 destinationEntity];
        if (v39) {
          goto LABEL_51;
        }
        goto LABEL_226;
      default:
        [v3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't have a non-relationship collection element in a subquery%@", self->super._expression), 0), @"NSUnderlyingException" forKey];
        goto LABEL_139;
    }
    uint64_t v39 = [v28 destinationEntity];
    if (v39)
    {
LABEL_51:
      v44 = *(__CFString **)(v39 + 128);
LABEL_52:
      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v44);
      [(NSSQLStatementIntermediate *)self->_fetchIntermediate setGoverningEntity:self->_selectFromEntity];
      v45 = self->_trailingKeypath;
      if (v45) {
        v46 = [(NSString *)[(NSExpression *)v45 keyPath] componentsSeparatedByString:@"."];
      }
      else {
        v46 = 0;
      }
      if (objc_msgSend(-[NSArray objectAtIndex:](v46, "objectAtIndex:", 0), "isEqualToString:", &stru_1ED787880))v46 = -[NSArray subarrayWithRange:](v46, "subarrayWithRange:", 1, -[NSArray count](v46, "count") - 1); {
      if (!self->_hasTrailingFunction)
      }
        goto LABEL_62;
      if ([(NSArray *)v46 count] >= 2)
      {
        [v147 count];
LABEL_66:
        id v48 = (id)[v147 mutableCopy];
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        uint64_t v49 = [(NSArray *)v46 countByEnumeratingWithState:&v149 objects:v153 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v150;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v150 != v51) {
                objc_enumerationMutation(v46);
              }
              v53 = *(void **)(*((void *)&v149 + 1) + 8 * i);
              if (([v53 hasPrefix:@"@"] & 1) == 0) {
                [v48 addObject:v53];
              }
            }
            uint64_t v50 = [(NSArray *)v46 countByEnumeratingWithState:&v149 objects:v153 count:16];
          }
          while (v50);
        }
        uint64_t v54 = [v147 count];
        uint64_t v55 = v54 - 1;
        uint64_t v56 = [v48 count];
        unint64_t v57 = v56;
        uint64_t v145 = v56 - 1;
        uint64_t v146 = v54;
        if (!v56)
        {
          v64 = 0;
          char v59 = 0;
          goto LABEL_114;
        }
        v143 = v3;
        uint64_t v58 = 0;
        char v59 = 0;
        char v60 = 0;
        v61 = self->_selectFromEntity;
        BOOL v142 = v56 == v54;
        while (1)
        {
          uint64_t v62 = [v48 objectAtIndex:v58];
          if (!v61) {
            break;
          }
          v63 = (NSSQLColumn *)[(NSMutableDictionary *)v61->_properties objectForKey:v62];
          if (!v63) {
            break;
          }
          v64 = v63;
          int v65 = [(NSSQLProperty *)v63 propertyType];
          if ((v65 - 7) > 2)
          {
            if (v145 != v58)
            {
              v73 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v74 = *MEMORY[0x1E4F1C3C8];
              uint64_t v75 = [NSString stringWithFormat:@"Bad collection keypath in subquery %@ (attribute in non-terminal position)", self->super._expression, v141];
              goto LABEL_112;
            }
            v59 |= v57 == v146;
            char v60 = 1;
          }
          else
          {
            if (!(((v65 & 0xFE) != 8) | v148 & 1))
            {
              v73 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v74 = *MEMORY[0x1E4F1C3C8];
              uint64_t v75 = [NSString stringWithFormat:@"Only allowed one toMany/manyToMany relationship in subquery expression collection (%@)", self->super._expression, v141];
              goto LABEL_112;
            }
            v148 &= (v65 & 0xFE) != 8;
            v61 = (NSSQLEntity *)[(NSSQLColumn *)v64 destinationEntity];
          }
          if (v55 == v58)
          {
            if (v59)
            {
              self->_governingEntityForVariable = v61;
              v66 = self;
              v67 = (NSSQLPrimaryKey *)v64;
            }
            else
            {
              v68 = (NSSQLEntity *)[(NSSQLColumn *)v64 destinationEntity];
              self->_governingEntityForVariable = v68;
              if (v68) {
                v67 = v68->_primaryKey;
              }
              else {
                v67 = 0;
              }
              v66 = self;
            }
            -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)v66, v67);
          }
          if (v57 == ++v58)
          {
            if (v60)
            {
              self->_targetColumn = v64;
              id v3 = v143;
              if (v57 > 1)
              {

                self->_variableAlias = 0;
                int v76 = 1;
                goto LABEL_120;
              }
              char v83 = 1;
LABEL_117:

              self->_variableAlias = 0;
              if (!v57 || (v83 & 1) != 0) {
                goto LABEL_137;
              }
              int v76 = 0;
LABEL_120:
              if ([(NSSQLIntermediate *)self isUpdateColumnsScoped])
              {
                [v3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported subquery with multiple joins in update columns %@", v144), 0), @"NSUnderlyingException" forKey];
                goto LABEL_139;
              }
              uint64_t v84 = [v3 objectForKey:@"subqueryCollectionContext"];
              [v3 setObject:self forKey:@"subqueryCollectionContext"];
              id v85 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v48, (uint64_t)self->_selectFromEntity, self->_selectEntityAlias, self, (uint64_t)self->_fetchIntermediate, v3);
              if (v84) {
                [v3 setObject:v84 forKey:@"subqueryCollectionContext"];
              }
              else {
                [v3 removeObjectForKey:@"subqueryCollectionContext"];
              }
              if ([v3 objectForKey:@"NSUnderlyingException"])
              {

                goto LABEL_139;
              }
              if (!v85)
              {
LABEL_137:
                id v85 = 0;
                self->_variableAlias = self->_selectEntityAlias;
                selectEntityAlias = (objc_class *)self->_selectEntityAlias;
                v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetAlias;
                goto LABEL_138;
              }
              if (v142)
              {
                v86 = v147;
                if (v59) {
                  v86 = objc_msgSend(v147, "subarrayWithRange:", 0, v55);
                }
                uint64_t v87 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v86);
                uint64_t v88 = v87;
                if (v87)
                {
                  if (v76)
                  {
                    v89 = *(void **)(v87 + 32);
                    goto LABEL_134;
                  }
                  uint64_t v126 = *(void *)(v87 + 16);
                  if (v126 && *(unsigned char *)(v126 + 24) == 9)
                  {
                    if (-[NSSQLSubqueryExpressionIntermediate canDoDirectJoinGivenPredicate:](self, (uint64_t)[(NSExpression *)self->super._expression predicate]))
                    {
                      *(unsigned char *)(v88 + 56) = 1;
                      v127 = (NSString *)*(id *)(v88 + 40);
                      self->_variableAlias = v127;
                      self->_targetAlias = v127;
                      v128 = objc_alloc_init(NSSQLColumn);
                      v129 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v126);
                      -[NSSQLColumn _setColumnName:]((uint64_t)v128, v129);
                      if (v128) {
                        *(_WORD *)&v128->super._flags |= 1u;
                      }
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v128);

LABEL_221:
                      v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                      selectEntityAlias = (objc_class *)self->_variableColumn;
                    }
                    else
                    {
                      v138 = (NSString *)*(id *)(v88 + 32);
                      self->_variableAlias = v138;
                      self->_targetAlias = v138;
                      uint64_t v139 = [*(id *)(v88 + 16) destinationEntity];
                      if (v139) {
                        v140 = *(void **)(v139 + 128);
                      }
                      else {
                        v140 = 0;
                      }
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v140);
                      v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                      selectEntityAlias = (objc_class *)self->_variableColumn;
                    }
LABEL_138:
                    *(Class *)((char *)&self->super.super.super.isa + *v95) = selectEntityAlias;

LABEL_139:
                    if ([v3 objectForKey:@"NSUnderlyingException"])
                    {
LABEL_140:

                      v17 = 0;
                      self->_fetchIntermediate = 0;
                      return v17;
                    }
                    v96 = [(NSExpression *)self->super._expression predicate];
                    if (v96)
                    {
                      v97 = v96;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v98 = [[NSSQLSimpleWhereIntermediate alloc] initWithPredicate:[(NSExpression *)self->super._expression predicate] inScope:self];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v98 = [[NSSQLCompoundWhereIntermediate alloc] initWithPredicate:[(NSExpression *)self->super._expression predicate] inScope:self inContext:v3];
                          if (!v98) {
                            goto LABEL_140;
                          }
                        }
                        else
                        {
                          if ((NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithValue:1] != v97)
                          {

                            self->_fetchIntermediate = 0;
                            objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unknown predicate type", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", self->super._expression, @"subquery")), @"NSUnderlyingException");
                          }
                          v98 = 0;
                        }
                      }
                      if ([v3 objectForKey:@"NSUnderlyingException"])
                      {

                        return 0;
                      }
                      -[NSSQLStatementIntermediate setWhereIntermediate:]((uint64_t)self->_fetchIntermediate, v98);
                    }
                    v99 = self->_trailingKeypath;
                    if (!v99)
                    {
                      variableColumn = self->_variableColumn;
                      goto LABEL_183;
                    }
                    v100 = [(NSString *)[(NSExpression *)v99 keyPath] componentsSeparatedByString:@"."];
                    if (objc_msgSend(-[NSArray objectAtIndex:](v100, "objectAtIndex:", 0), "isEqual:", &stru_1ED787880))
                    {
                      v100 = (NSArray *)(id)[(NSArray *)v100 mutableCopy];
                      [(NSArray *)v100 removeObjectAtIndex:0];
                    }
                    uint64_t v101 = [(NSArray *)v100 objectAtIndex:[(NSArray *)v100 count] - 1];
                    if (self->_hasTrailingFunction)
                    {
                      v102 = (void *)v101;
                      if ([@"@count" isEqual:v101])
                      {
                        variableColumn = objc_alloc_init(NSSQLColumn);
                        if ([(NSSQLIntermediate *)self isUpdateColumnsScoped]) {
                          v104 = (void *)[NSString stringWithFormat:@"COUNT(%@)", -[NSSQLColumn columnName](self->_targetColumn, "columnName"), v141];
                        }
                        else {
                          v104 = (void *)[NSString stringWithFormat:@"COUNT(%@.%@)", self->_targetAlias, -[NSSQLColumn columnName](self->_targetColumn, "columnName")];
                        }
                        -[NSSQLColumn _setColumnName:]((uint64_t)variableColumn, v104);
                        if (!variableColumn)
                        {
LABEL_183:
                          v111 = self->_selectFromCorrelationTarget;
                          v112 = [NSSQLSelectIntermediate alloc];
                          v113 = self->_selectEntityAlias;
                          if (v111) {
                            uint64_t v114 = -[NSSQLSelectIntermediate initForCorrelationTarget:alias:fetchColumns:inScope:](v112, "initForCorrelationTarget:alias:fetchColumns:inScope:", self->_selectFromCorrelationTarget, v113, [MEMORY[0x1E4F1C978] arrayWithObject:variableColumn], self);
                          }
                          else {
                            uint64_t v114 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:](v112, "initWithEntity:alias:fetchColumns:inScope:", self->_selectFromEntity, v113, [MEMORY[0x1E4F1C978] arrayWithObject:variableColumn], self);
                          }
                          v115 = (unsigned char *)v114;
                          -[NSSQLSelectIntermediate setColumnAlias:](v114, self->_variableAlias);
                          if (v115) {
                            v115[48] = self->_useDistinct;
                          }
                          -[NSSQLFetchIntermediate setSelectIntermediate:]((uint64_t)self->_fetchIntermediate, v115);

LABEL_189:
                          id v116 = [(NSSQLFetchIntermediate *)self->_fetchIntermediate generateSQLStringInContext:v3];
                          if (v116)
                          {
                            v117 = v116;
                            v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
                            [v17 appendString:v117];
                            [v17 appendString:@""]);

                            return v17;
                          }
                          return 0;
                        }
LABEL_182:
                        *(_WORD *)&variableColumn->super._flags &= ~1u;
                        goto LABEL_183;
                      }
                      if ((objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"supportedKVCAggregates"), "containsObject:", v102) & 1) != 0|| objc_msgSend(v102, "isEqual:", @"@total"))
                      {
                        if ([(NSSQLProperty *)self->_targetColumn propertyType] == 1)
                        {
                          if ([v102 characterAtIndex:1] == 97) {
                            v107 = @"AVG";
                          }
                          else {
                            v107 = (__CFString *)objc_msgSend((id)objc_msgSend(v102, "substringFromIndex:", 1), "uppercaseString");
                          }
                          variableColumn = objc_alloc_init(NSSQLColumn);
                          v105 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1ED787880];
                          [v105 appendString:v107];
                          objc_msgSend(v105, "appendString:", @"(");
                          if (![(NSSQLIntermediate *)self isUpdateColumnsScoped])
                          {
                            [v105 appendString:self->_targetAlias];
                            [v105 appendString:@"."];
                          }
                          objc_msgSend(v105, "appendString:", -[NSSQLColumn columnName](self->_targetColumn, "columnName"));
                          v106 = @" ");
                          goto LABEL_181;
                        }
                        v108 = (void *)MEMORY[0x1E4F1CA00];
                        uint64_t v109 = *MEMORY[0x1E4F1C3C8];
                        uint64_t v110 = [NSString stringWithFormat:@"Aggregate functions need to work on attributes: %@", self->super._expression, v141];
                      }
                      else
                      {
                        v108 = (void *)MEMORY[0x1E4F1CA00];
                        uint64_t v109 = *MEMORY[0x1E4F1C3C8];
                        uint64_t v110 = [NSString stringWithFormat:@"Unsupported KVC function in trailing keypath %@, %@", self->super._expression, self->_trailingKeypath];
                      }
                      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v108, "exceptionWithName:reason:userInfo:", v109, v110, 0), @"NSUnderlyingException");
                      goto LABEL_189;
                    }
                    variableColumn = objc_alloc_init(NSSQLColumn);
                    v105 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1ED787880];
                    if (![(NSSQLIntermediate *)self isUpdateColumnsScoped])
                    {
                      [v105 appendString:self->_targetAlias];
                      [v105 appendString:@"."];
                    }
                    v106 = [(NSSQLColumn *)self->_targetColumn columnName];
LABEL_181:
                    [v105 appendString:v106];
                    -[NSSQLColumn _setColumnName:]((uint64_t)variableColumn, v105);

                    if (!variableColumn) {
                      goto LABEL_183;
                    }
                    goto LABEL_182;
                  }
                  v135 = *(void **)(v87 + 32);
LABEL_217:
                  v136 = v135;
                  self->_variableAlias = v136;
                  self->_targetAlias = v136;
                  if (v88)
                  {
                    uint64_t v137 = [*(id *)(v88 + 16) destinationEntity];
                    if (v137)
                    {
                      v93 = *(void **)(v137 + 128);
                      goto LABEL_220;
                    }
                    goto LABEL_244;
                  }
                }
                else
                {
                  v135 = 0;
                  v89 = 0;
                  if ((v76 & 1) == 0) {
                    goto LABEL_217;
                  }
LABEL_134:
                  v90 = v89;
                  self->_variableAlias = v90;
                  self->_targetAlias = v90;
                  if (v88)
                  {
                    uint64_t v91 = [*(id *)(v88 + 16) destinationEntity];
                    uint64_t v92 = [v147 lastObject];
                    if (v91)
                    {
                      v93 = (void *)[*(id *)(v91 + 40) objectForKey:v92];
LABEL_220:
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v93);
                      goto LABEL_221;
                    }
LABEL_244:
                    v93 = 0;
                    goto LABEL_220;
                  }
                  [v147 lastObject];
                }
                v93 = 0;
                goto LABEL_220;
              }
              if (v146)
              {
                uint64_t v118 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v147);
                if (v118)
                {
                  uint64_t v119 = v118;
                  uint64_t v120 = [*(id *)(v118 + 16) destinationEntity];
                  if (v120) {
                    v121 = *(void **)(v120 + 128);
                  }
                  else {
                    v121 = 0;
                  }
                  -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v121);
                  v122 = *(void **)(v119 + 32);
                }
                else
                {
                  -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, 0);
                  v122 = 0;
                }
                self->_variableAlias = (NSString *)v122;
                v123 = v48;
                if (v76) {
                  v123 = objc_msgSend(v48, "subarrayWithRange:", 0, v145);
                }
                uint64_t v124 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v123);
                if (v124)
                {
                  self->_targetAlias = *(NSString **)(v124 + 32);
                  v125 = *(void **)(v124 + 16);
                  goto LABEL_210;
                }
LABEL_236:
                v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                self->_targetAlias = 0;
                if (v76)
                {
                  [v48 lastObject];
                  selectEntityAlias = 0;
                  v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                }
                else
                {
                  selectEntityAlias = 0;
                }
                goto LABEL_138;
              }
              v130 = v48;
              if (v76) {
                v130 = objc_msgSend(v48, "subarrayWithRange:", 0, v145);
              }
              uint64_t v131 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v130);
              self->_variableAlias = self->_selectEntityAlias;
              if (!v131) {
                goto LABEL_236;
              }
              self->_targetAlias = *(NSString **)(v131 + 32);
              v125 = *(void **)(v131 + 16);
LABEL_210:
              uint64_t v132 = [v125 destinationEntity];
              uint64_t v133 = v132;
              if (v76)
              {
                uint64_t v134 = [v48 lastObject];
                if (v133)
                {
                  selectEntityAlias = (objc_class *)[*(id *)(v133 + 40) objectForKey:v134];
LABEL_215:
                  v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                  goto LABEL_138;
                }
              }
              else if (v132)
              {
                selectEntityAlias = *(objc_class **)(v132 + 128);
                goto LABEL_215;
              }
              selectEntityAlias = 0;
              goto LABEL_215;
            }
            id v3 = v143;
LABEL_114:
            uint64_t v81 = [(NSSQLColumn *)v64 destinationEntity];
            if (v81) {
              v82 = *(NSSQLColumn **)(v81 + 128);
            }
            else {
              v82 = 0;
            }
            char v83 = 0;
            self->_targetColumn = v82;
            BOOL v142 = v57 == v146;
            goto LABEL_117;
          }
        }
        v73 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v74 = *MEMORY[0x1E4F1C3C8];
        uint64_t v75 = [NSString stringWithFormat:@"Bad collection keypath (%@) can't find property named (%@) ", self->super._expression, v62];
LABEL_112:
        id v3 = v143;
        objc_msgSend(v143, "setObject:forKey:", objc_msgSend(v73, "exceptionWithName:reason:userInfo:", v74, v75, 0), @"NSUnderlyingException");
        goto LABEL_139;
      }
      if (self->_hasTrailingFunction) {
        BOOL v47 = 0;
      }
      else {
LABEL_62:
      }
        BOOL v47 = [(NSArray *)v46 count] != 0;
      if (![v147 count] && !v47)
      {
        self->_targetAlias = self->_variableAlias;
        self->_targetColumn = self->_variableColumn;
        goto LABEL_139;
      }
      goto LABEL_66;
    }
LABEL_226:
    v44 = 0;
    goto LABEL_52;
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:self->super._expression forKey:@"expression"];
  v8 = @"Subquery expressions not allowed in indexes";
  v9 = v5;
  uint64_t v10 = v6;
LABEL_8:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, v7), @"NSUnderlyingException");
  return 0;
}

- (void)_setVariableColumn:(uint64_t)a1
{
  if (*(void **)(a1 + 88) != a2)
  {
    id v4 = a2;

    *(void *)(a1 + 88) = a2;
  }
}

- (NSSQLSubqueryExpressionIntermediate)initWithExpression:(id)a3 trailingKeypath:(id)a4 inScope:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  uint64_t v7 = [(NSSQLExpressionIntermediate *)&v11 initWithExpression:a3 allowToMany:0 inScope:a5];
  if (v7)
  {
    v7->_trailingKeypath = (NSExpression *)a4;
    if (a4)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "constantValue"), "rangeOfString:", @"@") != 0x7FFFFFFFFFFFFFFFLL) {
        v7->_hasTrailingFunction = 1;
      }
      int v8 = objc_msgSend((id)objc_msgSend(a4, "constantValue"), "hasSuffix:", @"@count");
      v7->_isCount = v8;
      if (v8)
      {
        v7->_onlyTrailIsCount = objc_msgSend((id)objc_msgSend(a4, "constantValue"), "isEqualToString:", @".@count");
        uint64_t v9 = [MEMORY[0x1E4F29068] defaultInstance];
        v7->_subqueryHasTruePredicate = v9 == [a3 predicate];
      }
    }
    v7->_variableExpression = (NSExpression *)[a3 variableExpression];
    v7->_useDistinct = 0;
  }
  return v7;
}

- (void)dealloc
{
  self->_trailingKeypath = 0;
  self->_selectFromEntity = 0;
  self->_variableExpression = 0;
  self->_governingEntityForVariable = 0;

  self->_selectFromCorrelationTarget = 0;
  self->_fetchIntermediate = 0;

  self->_selectEntityAlias = 0;
  self->_variableAlias = 0;

  self->_variableColumn = 0;
  self->_keypathsToPromote = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  [(NSSQLSubqueryExpressionIntermediate *)&v3 dealloc];
}

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  keypathsToPromote = self->_keypathsToPromote;
  uint64_t v4 = [(NSMutableArray *)keypathsToPromote countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(keypathsToPromote);
        }
        -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, *(void **)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v5 = [(NSMutableArray *)keypathsToPromote countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSSQLIntermediate *)self->super.super._scope _promoteJoinsForSubqueryScopedKeypaths];
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_fetchIntermediate;
  }
  scope = self->super.super._scope;

  return [(NSSQLIntermediate *)scope fetchIntermediateForKeypathExpression:a3];
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_variableAlias;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  return [(NSSQLIntermediate *)&v6 governingAliasForKeypathExpression:a3];
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_governingEntityForVariable;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  return [(NSSQLIntermediate *)&v6 governingEntityForKeypathExpression:a3];
}

- (BOOL)_isKeypathScopedToSubquery:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    return [a2 expressionType] == 4
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2
        && (sel_valueForKey_ == (char *)[a2 selector]
         || sel_valueForKeyPath_ == (char *)[a2 selector])
        && (objc_msgSend((id)objc_msgSend(a2, "operand"), "isEqual:", *(void *)(v3 + 40)) & 1) != 0;
  }
  return result;
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  if (objc_msgSend(a3, "isEqual:", -[NSExpression variableExpression](self->super._expression, "variableExpression")))
  {
    long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" "];
    [v9 appendString:self->_variableAlias];
    [v9 appendString:@"."];
    objc_msgSend(v9, "appendString:", -[NSSQLColumn columnName](self->_variableColumn, "columnName"));
    return v9;
  }
  else
  {
    scope = self->super.super._scope;
    return [(NSSQLIntermediate *)scope _generateSQLForVariableExpression:a3 allowToMany:v6 inContext:a5];
  }
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3))
  {
    uint64_t v5 = [(NSSQLSubqueryExpressionIntermediate *)self governingEntityForKeypathExpression:a3];
    if ([a3 expressionType] == 3) {
      BOOL v6 = (void *)[a3 keyPath];
    }
    else {
      BOOL v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
    }
    long long v8 = (void *)[v6 componentsSeparatedByString:@"."];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        if (!v5) {
          return 1;
        }
        v14 = (unsigned __int8 *)[v5[5] objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
        if (!v14) {
          return 1;
        }
        uint64_t v15 = v14;
        if ([v14 isToMany]) {
          break;
        }
        int v16 = v15[24];
        if (v16 == 7)
        {
          uint64_t v5 = (id *)[v15 destinationEntity];
        }
        else
        {
          if (v16 == 9) {
            break;
          }
          uint64_t v5 = 0;
        }
LABEL_20:
        if (v10 == ++v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL result = 1;
          if (v10) {
            goto LABEL_8;
          }
          return result;
        }
      }
      uint64_t v17 = [v15 destinationEntity];
      if (v11) {
        return 0;
      }
      uint64_t v5 = (id *)v17;
      uint64_t v11 = 1;
      goto LABEL_20;
    }
    return 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
    return [(NSSQLIntermediate *)&v18 keypathExpressionIsSafeLHSForIn:a3];
  }
}

- (uint64_t)canDoDirectJoinGivenPredicate:(void *)a1
{
  uint64_t v4 = [NSSQLSubqueryExpressionIntermediatePredicateVisitor alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NSSQLSubqueryExpressionIntermediatePredicateVisitor;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel_init);
    if (v5)
    {
      v5[1] = a1;
      *((unsigned char *)v5 + 16) = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 checkPredicate:a2];

  return v6;
}

@end