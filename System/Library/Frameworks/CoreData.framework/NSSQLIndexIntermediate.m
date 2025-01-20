@interface NSSQLIndexIntermediate
- (BOOL)isIndexExpressionScoped;
- (BOOL)isIndexScoped;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingEntity;
- (id)initForIndex:(id)a3 withScope:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLIndexIntermediate

- (id)initForIndex:(id)a3 withScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLIndexIntermediate;
  v5 = [(NSSQLIntermediate *)&v7 initWithScope:a4];
  if (v5) {
    v5->_index = (NSSQLBinaryIndex *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_index = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLIndexIntermediate;
  [(NSSQLIndexIntermediate *)&v3 dealloc];
}

- (BOOL)isIndexScoped
{
  return 1;
}

- (BOOL)isIndexExpressionScoped
{
  return self->_isHandlingExpressions;
}

- (id)governingEntity
{
  return [(NSSQLIndex *)self->_index sqlEntity];
}

- (id)generateSQLStringInContext:(id)a3
{
  v87[1] = *MEMORY[0x1E4F143B8];
  v5 = [(NSSQLIndex *)self->_index sqlEntity];
  id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
  if ([(NSSQLIndex *)self->_index isUnique]) {
    objc_super v7 = @"UNIQUE ";
  }
  else {
    objc_super v7 = &stru_1ED787880;
  }
  v8 = objc_msgSend(v6, "initWithFormat:", @"CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("), v7, -[NSSQLEntity name](v5, "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self->_index, "indexDescription"), "name"), -[NSSQLEntity tableName](v5, "tableName");
  obj = [(NSFetchIndexDescription *)[(NSSQLIndex *)self->_index indexDescription] elements];
  v60 = self;
  self->_isHandlingExpressions = 1;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (!v9) {
    goto LABEL_58;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v62;
  uint64_t v58 = *MEMORY[0x1E4F1C3C8];
  while (2)
  {
    uint64_t v13 = 0;
LABEL_7:
    if (*(void *)v62 != v12) {
      objc_enumerationMutation(obj);
    }
    v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
    v15 = (void *)[v14 property];
    switch([v15 _propertyType])
    {
      case 2:
      case 6:
      case 7:
        goto LABEL_10;
      case 4:
        if (![v15 isToMany])
        {
          uint64_t v16 = [v15 name];
          if (!v16) {
LABEL_10:
          }
            uint64_t v16 = [v15 _qualifiedName];
          v17 = [NSSQLKeypathExpressionIntermediate alloc];
          uint64_t v18 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v16];
          v19 = v17;
LABEL_12:
          v20 = [(NSSQLExpressionIntermediate *)v19 initWithExpression:v18 allowToMany:0 inScope:v60];
          id v21 = [(NSSQLKeypathExpressionIntermediate *)v20 generateSQLStringInContext:a3];

LABEL_13:
          if (!v21) {
            goto LABEL_54;
          }
          if ([v14 isAscending]) {
            v22 = @"ASC";
          }
          else {
            v22 = @"DESC";
          }
          if (v11) {
            [v8 appendString:@", "];
          }
          [v8 appendFormat:@"%@ COLLATE BINARY %@", v21, v22];

          ++v13;
          char v11 = 1;
          if (v10 == v13)
          {
            uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v77 count:16];
            uint64_t v10 = v41;
            if (!v41) {
              goto LABEL_57;
            }
            continue;
          }
          goto LABEL_7;
        }
        v42 = (void *)MEMORY[0x1E4F1CA00];
        v75 = @"relationship";
        v76 = v15;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        v44 = @"Indexes cannot contain to many relationships";
LABEL_53:
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v58, v44, v43), @"NSUnderlyingException");

        v8 = 0;
LABEL_54:
        if (![a3 objectForKey:@"NSUnderlyingException"])
        {
          v71 = @"property";
          v72 = v15;
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v58, @"SQL generation failure for property", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1)), @"NSUnderlyingException");
        }

        v8 = 0;
        if (v11)
        {
LABEL_57:
          [v8 appendString:@""]);
          goto LABEL_61;
        }
LABEL_58:
        if (![a3 objectForKey:@"NSUnderlyingException"])
        {
          v45 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v46 = *MEMORY[0x1E4F1C3C8];
          v69 = @"indexDescription";
          uint64_t v70 = [(NSSQLIndex *)v60->_index indexDescription];
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v45, "exceptionWithName:reason:userInfo:", v46, @"SQL generation failure for index", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1)), @"NSUnderlyingException");
        }

        v8 = 0;
LABEL_61:
        v60->_isHandlingExpressions = 0;
        uint64_t v47 = [(NSFetchIndexDescription *)[(NSSQLIndex *)v60->_index indexDescription] partialIndexPredicate];
        if (v8)
        {
          uint64_t v48 = v47;
          if (v47)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v49 = [[NSSQLCompoundWhereIntermediate alloc] initWithPredicate:v48 inScope:v60 inContext:a3];
              goto LABEL_67;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v52 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v53 = *MEMORY[0x1E4F1C3C8];
              v67 = @"predicate";
              uint64_t v68 = [(NSFetchIndexDescription *)[(NSSQLIndex *)v60->_index indexDescription] partialIndexPredicate];
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v52, "exceptionWithName:reason:userInfo:", v53, @"SQL generation failure for index with predicate (1)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1)), @"NSUnderlyingException");
              return 0;
            }
            v49 = [[NSSQLSimpleWhereIntermediate alloc] initWithPredicate:v48 inScope:v60];
LABEL_67:
            v50 = v49;
            if (v49)
            {
              id v51 = [(NSSQLCompoundWhereIntermediate *)v49 generateSQLStringInContext:a3];

              if (v51)
              {
                [v8 appendFormat:@" WHERE %@", v51];

                return v8;
              }
              if (![a3 objectForKey:@"NSUnderlyingException"])
              {
                v54 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v55 = *MEMORY[0x1E4F1C3C8];
                v65 = @"predicate";
                uint64_t v66 = [(NSFetchIndexDescription *)[(NSSQLIndex *)v60->_index indexDescription] partialIndexPredicate];
                objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v54, "exceptionWithName:reason:userInfo:", v55, @"SQL generation failure for index with predicate (2)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1)), @"NSUnderlyingException");
              }

              return 0;
            }
          }
        }
        return v8;
      case 5:
        v23 = (void *)[v15 expression];
        uint64_t v24 = [v23 expressionType];
        switch(v24)
        {
          case 4:
            v26 = NSSQLFunctionExpressionIntermediate;
LABEL_30:
            v19 = (NSSQLKeypathExpressionIntermediate *)[v26 alloc];
            uint64_t v18 = (uint64_t)v23;
            goto LABEL_12;
          case 3:
            v27 = (void *)[v23 keyPath];
            [v27 rangeOfString:@"."];
            if (v28)
            {
              v29 = (void *)MEMORY[0x1E4F1CA00];
              v86 = @"expression";
              v87[0] = v23;
              uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
              v31 = v29;
              uint64_t v32 = v58;
              v33 = @"Joins not supported in index";
            }
            else
            {
              id v35 = [(NSSQLEntity *)[(NSSQLIndex *)v60->_index sqlEntity] entityDescription];
              if (v35
                && (v36 = objc_msgSend((id)objc_msgSend(v35, "propertiesByName"), "objectForKey:", v27)) != 0)
              {
                v37 = v36;
                unint64_t v57 = [v36 _propertyType];
                if ([v37 _propertyType] == 4 && objc_msgSend(v37, "isToMany"))
                {
                  v38 = (void *)MEMORY[0x1E4F1CA00];
                  v82 = @"property";
                  v83 = v37;
                  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
                  v31 = v38;
                  uint64_t v32 = v58;
                  v33 = @"Indexes cannot contain to many relationships";
                }
                else
                {
                  if (v57 <= 7 && ((1 << v57) & 0xD4) != 0)
                  {
                    v26 = NSSQLKeypathExpressionIntermediate;
                    goto LABEL_30;
                  }
                  v40 = (void *)MEMORY[0x1E4F1CA00];
                  v80 = @"property";
                  v81 = v37;
                  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                  v31 = v40;
                  uint64_t v32 = v58;
                  v33 = @"Indexes can only contain attribute/relationship properties";
                }
              }
              else
              {
                if (![@"entity" caseInsensitiveCompare:v27])
                {
                  v25 = @"Z_ENT";
                  goto LABEL_28;
                }
                if (![@"self" caseInsensitiveCompare:v27])
                {
LABEL_27:
                  v25 = @"Z_PK";
LABEL_28:
                  id v21 = (id)[(__CFString *)v25 mutableCopy];
                  goto LABEL_13;
                }
                v39 = (void *)MEMORY[0x1E4F1CA00];
                v84 = @"expression";
                v85 = v23;
                uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
                v31 = v39;
                uint64_t v32 = v58;
                v33 = @"Can't find property for keypath";
              }
            }
            break;
          case 1:
            goto LABEL_27;
          default:
            v34 = (void *)MEMORY[0x1E4F1CA00];
            v78 = @"expression";
            v79 = v23;
            uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
            v31 = v34;
            uint64_t v32 = v58;
            v33 = @"Unsupported expression type in index";
            break;
        }
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, v33, v30), @"NSUnderlyingException");
        id v21 = 0;
        goto LABEL_13;
      default:
        v42 = (void *)MEMORY[0x1E4F1CA00];
        v73 = @"property";
        v74 = v15;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        v44 = @"Unsupported property in index";
        goto LABEL_53;
    }
  }
}

@end