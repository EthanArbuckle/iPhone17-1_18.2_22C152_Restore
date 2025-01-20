@interface NSSQLUpdateColumnsIntermediate
- (BOOL)isUpdateColumnsScoped;
- (NSDictionary)propertiesToUpdate;
- (NSSQLConstantValueIntermediate)_generateSQLForAttributeUpdate:(uint64_t)a3 value:(void *)a4 inContext:;
- (NSSQLUpdateColumnsIntermediate)initWithPropertiesToUpdate:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAliasForKeypathExpression:(id)a3;
- (void)dealloc;
- (void)setPropertiesToUpdate:(id)a3;
@end

@implementation NSSQLUpdateColumnsIntermediate

- (NSSQLUpdateColumnsIntermediate)initWithPropertiesToUpdate:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLUpdateColumnsIntermediate;
  v5 = [(NSSQLIntermediate *)&v7 initWithScope:a4];
  if (v5) {
    v5->_propertiesToUpdate = (NSDictionary *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_propertiesToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLUpdateColumnsIntermediate;
  [(NSSQLUpdateColumnsIntermediate *)&v3 dealloc];
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v6 = (id *)[a3 objectForKey:@"entity"];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  obj = self->_propertiesToUpdate;
  uint64_t v100 = [(NSDictionary *)obj countByEnumeratingWithState:&v102 objects:v107 count:16];
  if (!v100) {
    goto LABEL_103;
  }
  uint64_t v7 = 0;
  v98 = self;
  uint64_t v99 = *(void *)v103;
  id v95 = v5;
  do
  {
    uint64_t v8 = 0;
    uint64_t v92 = v100 + v7;
    do
    {
      if (*(void *)v103 != v99) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v102 + 1) + 8 * v8);
      if (v7) {
        [v5 appendString:@", "];
      }
      id v10 = [(NSDictionary *)self->_propertiesToUpdate objectForKey:v9];
      uint64_t v11 = [v9 _propertyType];
      uint64_t v12 = [v9 _qualifiedName];
      if (!v6 || (v13 = (id *)[v6[5] objectForKey:v12]) == 0)
      {
        v63 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v64 = *MEMORY[0x1E4F1C3C8];
        id v65 = a3;
        uint64_t v66 = [NSString stringWithFormat:@"Can't find property %@ on entity %@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
        goto LABEL_111;
      }
      v14 = v13;
      int v15 = [v13 propertyType];
      if (v15 == 1)
      {
        if (objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "_propertyType") == 6)
        {
          v63 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v64 = *MEMORY[0x1E4F1C3C8];
          id v65 = a3;
          uint64_t v66 = [NSString stringWithFormat:@"Invalid property for update (can't batch update derived attributes) %@/%@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
          goto LABEL_111;
        }
      }
      else if (v15 != 7)
      {
        v63 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v64 = *MEMORY[0x1E4F1C3C8];
        id v65 = a3;
        uint64_t v66 = [NSString stringWithFormat:@"Invalid property for update (not an attribute or a to one) %@/%@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
LABEL_111:
        uint64_t v67 = [v63 exceptionWithName:v64 reason:v66 userInfo:0];
        id v68 = v65;
        goto LABEL_136;
      }
      uint64_t v16 = [v10 expressionType];
      if (v16 > 9)
      {
        if (v16 == 10) {
          goto LABEL_30;
        }
        if (v16 == 13)
        {
          id v97 = v10;
          v33 = [[NSSQLSubqueryExpressionIntermediate alloc] initWithExpression:v10 trailingKeypath:0 inScope:self];
          id v34 = [(NSSQLSubqueryExpressionIntermediate *)v33 generateSQLStringInContext:a3];

          if (!v34)
          {
            id v10 = v97;
            if (![a3 objectForKey:@"NSUnderlyingException"])
            {
              v76 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v77 = *MEMORY[0x1E4F1C3C8];
              uint64_t v78 = [NSString stringWithFormat:@"Unable to generate sql for update expression %@", v97, v89];
              goto LABEL_131;
            }
            goto LABEL_133;
          }
          v17 = (NSSQLConstantValueIntermediate *)objc_msgSend((id)objc_msgSend(v14, "columnName"), "mutableCopy");
          [(NSSQLConstantValueIntermediate *)v17 appendString:@" = "];
          [(NSSQLConstantValueIntermediate *)v17 appendString:v34];

          id v10 = v97;
          goto LABEL_45;
        }
        if (v16 != 50)
        {
LABEL_112:
          v69 = (void *)MEMORY[0x1E4F1CA00];
          id v70 = v10;
          uint64_t v71 = *MEMORY[0x1E4F1C3C8];
          uint64_t v72 = [NSString stringWithFormat:@"Invalid expression (%@) in propertiesToUpdate", v70];
          goto LABEL_135;
        }
        v20 = (void *)[v10 expressionValueWithObject:0 context:0];
        if (!v20)
        {
          v69 = (void *)MEMORY[0x1E4F1CA00];
          id v74 = v10;
          uint64_t v71 = *MEMORY[0x1E4F1C3C8];
          uint64_t v72 = [NSString stringWithFormat:@"Fetch request expression evaluation (%@) failed", v74];
          goto LABEL_135;
        }
        v21 = v20;
        if (![v20 isNSArray]) {
          goto LABEL_93;
        }
        uint64_t v22 = [v21 count];
        if (v22)
        {
          if (v22 != 1) {
            goto LABEL_148;
          }
          v21 = (void *)[v21 lastObject];
          objc_opt_class();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = (void *)[v21 objectID];
            goto LABEL_79;
          }
          objc_opt_class();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_79:
            self = v98;
LABEL_93:
            if (v11 == 4)
            {
              id v97 = v10;
              v76 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v77 = *MEMORY[0x1E4F1C3C8];
              uint64_t v78 = [NSString stringWithFormat:@"Can't generate new column values for %@ - incompatible destination: %@", objc_msgSend(v14, "name"), v21];
              goto LABEL_131;
            }
            v30 = self;
            v31 = v14;
            uint64_t v32 = (uint64_t)v21;
            goto LABEL_95;
          }
          self = v98;
          if ([v21 isNSDictionary] && objc_msgSend(v21, "count"))
          {
            if ([v21 count] != 1)
            {
LABEL_148:
              v69 = (void *)MEMORY[0x1E4F1CA00];
              id v88 = v10;
              uint64_t v71 = *MEMORY[0x1E4F1C3C8];
              uint64_t v72 = [NSString stringWithFormat:@"Invalid fetch expression (%@) in propertiesToUpdate - fetch has multiple results", v88];
              goto LABEL_135;
            }
            memset(v101, 0, sizeof(v101));
            if ([v21 countByEnumeratingWithState:v101 objects:v106 count:16])
            {
              v21 = (void *)[v21 objectForKey:**((void **)&v101[0] + 1)];
              goto LABEL_93;
            }
          }
        }
        v21 = 0;
        goto LABEL_93;
      }
      if (v16)
      {
        if (v16 != 3)
        {
          if (v16 != 4) {
            goto LABEL_112;
          }
          if (v11 == 4)
          {
            v69 = (void *)MEMORY[0x1E4F1CA00];
            id v73 = v10;
            uint64_t v71 = *MEMORY[0x1E4F1C3C8];
            uint64_t v72 = [NSString stringWithFormat:@"Invalid value expression (%@) in propertiesToUpdate : what does it mean to update a relationship to the result of a function?", v73];
            goto LABEL_135;
          }
          v17 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ ", objc_msgSend(v14, "columnName")];
          id v18 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v10, 0, a3);
          if (!v18)
          {
            if (![a3 objectForKey:@"NSUnderlyingException"]) {
              [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Fetch request expression evaluation (%@) failed", v10), 0), @"NSUnderlyingException" forKey];
            }

LABEL_137:
            return 0;
          }
          v19 = v18;
          [(NSSQLConstantValueIntermediate *)v17 appendFormat:@" = %@", v18];

LABEL_45:
          self = v98;
          if (!v17) {
            goto LABEL_133;
          }
          goto LABEL_96;
        }
LABEL_30:
        id v97 = v10;
        v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", @".");
        if ([v23 count] != 1)
        {
          v93 = v6;
          id v94 = a3;
          v35 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"entity"), "entityDescription");
          uint64_t v91 = [v23 count];
          unint64_t v36 = v91 - 1;
          char v90 = objc_msgSend((id)objc_msgSend(v23, "lastObject"), "hasPrefix:", @"@");
          uint64_t v37 = 0;
          int v38 = 0;
          while (1)
          {
            v39 = (void *)[v23 objectAtIndex:v37];
            if (!v35) {
              break;
            }
            v40 = objc_msgSend((id)objc_msgSend(v35, "propertiesByName"), "objectForKey:", v39);
            if (!v40) {
              break;
            }
            v41 = v40;
            if ([v40 _isAttribute])
            {
              if (v36 == v37) {
                goto LABEL_64;
              }
              char v43 = v90;
              if (v91 - 2 != v37) {
                char v43 = 0;
              }
              if (v43) {
                goto LABEL_64;
              }
              v87 = @"Can't generate SQL for keypath %@ : invalid attribute name location";
LABEL_106:
              a3 = v94;
              id v5 = v95;
LABEL_107:
              [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", v87, objc_msgSend(v23, "componentsJoinedByString:", @".", 0), @"NSUnderlyingException" forKey];
              id v10 = v97;
              goto LABEL_108;
            }
            if ([v41 _isRelationship])
            {
              v35 = (void *)[v41 destinationEntity];
              int v42 = [v41 isToMany];
              if (v42 & v38)
              {
                v87 = @"Can't generate SQL for keypath %@ : multiple to many keypath components";
                goto LABEL_106;
              }
              v38 |= v42;
            }
            if (++v37 > v36) {
              goto LABEL_64;
            }
          }
          if (![v39 hasPrefix:@"@"])
          {
            a3 = v94;
            id v5 = v95;
            v87 = @"Can't generate SQL for keypath %@ : invalid keypath";
            goto LABEL_107;
          }
          if (v36 != v37)
          {
            v87 = @"Can't generate SQL for keypath %@ : invalid location of keypath aggregate function";
            goto LABEL_106;
          }
LABEL_64:
          v44 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:objc_msgSend(NSString, "stringWithFormat:", @".%@", objc_msgSend(v23, "lastObject"))];
          uint64_t v45 = objc_msgSend((id)objc_msgSend(v23, "subarrayWithRange:", 0, objc_msgSend(v23, "count") - 1), "componentsJoinedByString:", @".");
          uint64_t v46 = [(NSSQLIntermediate *)v98->super._scope governingAlias];
          a3 = v94;
          if (!v46) {
            uint64_t v46 = -[NSSQLAliasGenerator generateVariableAlias]([v94 objectForKey:@"aliasGenerator"]);
          }
          v47 = (void *)MEMORY[0x1E4F28C68];
          uint64_t v48 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v45];
          v49 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", objc_msgSend(v47, "expressionForSubquery:usingIteratorVariable:predicate:", v48, v46, objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 1)), v44, v98);

          id v50 = [(NSSQLSubqueryExpressionIntermediate *)v49 generateSQLStringInContext:v94];
          v6 = v93;
          if (v50)
          {
            v17 = (NSSQLConstantValueIntermediate *)objc_msgSend((id)objc_msgSend(v14, "columnName"), "mutableCopy");
            [(NSSQLConstantValueIntermediate *)v17 appendString:@" = "];
            [(NSSQLConstantValueIntermediate *)v17 appendString:v50];

            id v5 = v95;
            goto LABEL_68;
          }
          id v5 = v95;
          id v10 = v97;
          if (![v94 objectForKey:@"NSUnderlyingException"])
          {
            v87 = @"Can't generate SQL for keypath %@ : unexpected problem";
            goto LABEL_107;
          }
LABEL_108:
          if (![a3 objectForKey:@"NSUnderlyingException"])
          {
            v59 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v60 = *MEMORY[0x1E4F1C3C8];
            uint64_t v61 = [NSString stringWithFormat:@"Unable to generate sql for components %@", v23];
            uint64_t v62 = v60;
            id v10 = v97;
            objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v59, "exceptionWithName:reason:userInfo:", v62, v61, 0), @"NSUnderlyingException");
          }
          goto LABEL_129;
        }
        uint64_t v24 = [v23 lastObject];
        int v25 = [v14 propertyType];
        uint64_t v26 = [v14 entity];
        if (v26) {
          v27 = (void *)[*(id *)(v26 + 40) objectForKey:v24];
        }
        else {
          v27 = 0;
        }
        int v28 = [v27 propertyType];
        if (v28 != 1 && v28 != 7)
        {
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3C8];
          uint64_t v81 = [NSString stringWithFormat:@"Invalid keypath for update (not an attribute or a to one) %@", objc_msgSend(v14, "name"), v89];
LABEL_128:
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v79, "exceptionWithName:reason:userInfo:", v80, v81, 0), @"NSUnderlyingException");
          id v10 = v97;
LABEL_129:
          if (![a3 objectForKey:@"NSUnderlyingException"])
          {
            v76 = (void *)MEMORY[0x1E4F1CA00];
            id v82 = v10;
            uint64_t v77 = *MEMORY[0x1E4F1C3C8];
            uint64_t v78 = [NSString stringWithFormat:@"Invalid keypath expression (%@) in propertiesToUpdate - joins unsupported here", v82, v89];
LABEL_131:
            uint64_t v83 = [v76 exceptionWithName:v77 reason:v78 userInfo:0];
LABEL_132:
            [a3 setObject:v83 forKey:@"NSUnderlyingException"];
            id v10 = v97;
          }
LABEL_133:
          if ([a3 objectForKey:@"NSUnderlyingException"]) {
            goto LABEL_137;
          }
          v69 = (void *)MEMORY[0x1E4F1CA00];
          id v84 = v10;
          uint64_t v71 = *MEMORY[0x1E4F1C3C8];
          uint64_t v72 = [NSString stringWithFormat:@"Can't generate new column value from expression %@", v84];
LABEL_135:
          uint64_t v67 = [v69 exceptionWithName:v71 reason:v72 userInfo:0];
          id v68 = a3;
LABEL_136:
          [v68 setObject:v67 forKey:@"NSUnderlyingException"];
          goto LABEL_137;
        }
        if (v25 != v28)
        {
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3C8];
          uint64_t v81 = [NSString stringWithFormat:@"Attempting to insert a relationship value into an attribute or vice versa is not supported %@/%@", objc_msgSend(v14, "name"), objc_msgSend(v27, "name")];
          goto LABEL_128;
        }
        if (objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "_propertyType") != 4)
        {
          v17 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ = %@", objc_msgSend(v14, "columnName"), objc_msgSend(v27, "columnName")];
LABEL_68:
          id v10 = v97;
LABEL_85:
          self = v98;
          if (!v17) {
            goto LABEL_129;
          }
          goto LABEL_96;
        }
        if (v14[9])
        {
          if (!v27 || !v27[9]) {
            goto LABEL_124;
          }
        }
        else if (v27 && v27[9])
        {
LABEL_124:
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3C8];
          uint64_t v81 = [NSString stringWithFormat:@"Can't generate new column values for destination - incompatible entity foreign key state: %@", v14, v89];
          goto LABEL_128;
        }
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription"), "_subentitiesIncludes:", objc_msgSend((id)objc_msgSend(v27, "destinationEntity"), "entityDescription")) & 1) == 0)goto LABEL_124; {
        v17 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ = %@", objc_msgSend(v14, "columnName"), objc_msgSend(v27, "columnName")];
        }
        uint64_t v51 = objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription");
        uint64_t v52 = v51;
        if (v51)
        {
          id v10 = v97;
          if (![*(id *)(v51 + 144) count])
          {
            if ((*(unsigned char *)(v52 + 120) & 4) != 0)
            {
              v54 = *(void **)(v52 + 72);
            }
            else
            {
              v53 = (void *)v52;
              do
              {
                v54 = v53;
                v53 = (void *)[v53 superentity];
              }
              while (v53);
            }
LABEL_81:
            BOOL v55 = v54 == (void *)v52;
            id v10 = v97;
            if (v55) {
              goto LABEL_85;
            }
          }
        }
        else
        {
          id v10 = v97;
          if (![0 count])
          {
            v54 = 0;
            goto LABEL_81;
          }
        }
        uint64_t v56 = [v14[9] columnName];
        if (v27) {
          v57 = (void *)v27[9];
        }
        else {
          v57 = 0;
        }
        -[NSSQLConstantValueIntermediate appendFormat:](v17, "appendFormat:", @", %@ = %@", v56, [v57 columnName]);
        id v5 = v95;
        goto LABEL_85;
      }
      v29 = (void *)[v10 constantValue];
      if (v11 == 4)
      {
        objc_opt_class();
        id v97 = v10;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v75 = [v29 objectID];
        }
        else
        {
          objc_opt_class();
          uint64_t v75 = (uint64_t)v29;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v75 = 0;
            if ((void *)[MEMORY[0x1E4F1CA98] null] == v29) {
              v29 = 0;
            }
          }
        }
        uint64_t v86 = *MEMORY[0x1E4F1C3C8];
        if (!v75 && v29)
        {
          [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v86, objc_msgSend(NSString, "stringWithFormat:", @"Invalid new constant value %@ for %@ (not a managed object)", v10, v9), 0), @"NSUnderlyingException" forKey];

          return 0;
        }
        uint64_t v83 = [MEMORY[0x1E4F1CA00] exceptionWithName:v86, objc_msgSend(NSString, "stringWithFormat:", @"Can't generate new column values for %@ - incompatible destination: %@", objc_msgSend(v14, "name"), v75), 0 reason userInfo];
        goto LABEL_132;
      }
      v30 = v98;
      v31 = v14;
      uint64_t v32 = (uint64_t)v29;
      self = v98;
LABEL_95:
      v17 = -[NSSQLUpdateColumnsIntermediate _generateSQLForAttributeUpdate:value:inContext:]((uint64_t)v30, v31, v32, a3);
      if (!v17) {
        goto LABEL_133;
      }
LABEL_96:
      ++v7;
      [v5 appendString:v17];

      ++v8;
    }
    while (v8 != v100);
    uint64_t v58 = [(NSDictionary *)obj countByEnumeratingWithState:&v102 objects:v107 count:16];
    uint64_t v7 = v92;
    uint64_t v100 = v58;
  }
  while (v58);
LABEL_103:
  [v5 appendString:@", Z_OPT = (Z_OPT + 1) "];
  return v5;
}

- (NSSQLConstantValueIntermediate)_generateSQLForAttributeUpdate:(uint64_t)a3 value:(void *)a4 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ ", objc_msgSend(a2, "columnName")];
  v9 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:ofType:inScope:context:", a3, [a2 sqlType], a1, a4);
  uint64_t v10 = [(NSSQLConstantValueIntermediate *)v9 generateSQLStringInContext:a4];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    [(NSSQLConstantValueIntermediate *)v8 appendFormat:@"= %@", v10];
  }
  else
  {
    if (![a4 objectForKey:@"NSUnderlyingException"]) {
      [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't generate new column value from value: %@", a3), 0), @"NSUnderlyingException" forKey];
    }

    v9 = v8;
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isUpdateColumnsScoped
{
  return 1;
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return &stru_1ED787880;
}

- (NSDictionary)propertiesToUpdate
{
  return self->_propertiesToUpdate;
}

- (void)setPropertiesToUpdate:(id)a3
{
}

@end