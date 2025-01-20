@interface NSSQLConstantValueIntermediate
- (BOOL)_addBindVarForConstId:(uint64_t)a3 ofType:(void *)a4 inContext:;
- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4 context:(id)a5;
- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 ofType:(unsigned __int8)a4 inScope:(id)a5 context:(id)a6;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLConstantValueIntermediate

- (BOOL)_addBindVarForConstId:(uint64_t)a3 ofType:(void *)a4 inContext:
{
  if (a1)
  {
    if ([a1 isTargetColumnsScoped]) {
      v8 = @"selectBindVars";
    }
    else {
      v8 = @"bindVars";
    }
    v9 = (void *)[a4 objectForKey:v8];
    self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription((void *)[a4 objectForKey:@"persistentStore"], a2);
      if (v10) {
        uint64_t v11 = *(int *)(v10 + 184);
      }
      else {
        uint64_t v11 = 0;
      }
      a2 = (void *)[NSNumber numberWithInteger:v11];
    }
    objc_opt_class();
    v12 = [[NSSQLBindVariable alloc] initWithValue:a2 sqlType:a3 propertyDescription:0 allowCoercion:(objc_opt_isKindOfClass() & 1) == 0];
    [v9 addObject:v12];
  }
  return a1 != 0;
}

- (id)generateSQLStringInContext:(id)a3
{
  v78[4] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x18C127630](self, a2);
  if ([(NSSQLIntermediate *)self isIndexScoped])
  {
    if (!self->_constantValue
      || (uint64_t v6 = [MEMORY[0x1E4F1CA98] null], v7 = self->_constantValue, (id)v6 == v7))
    {
      uint64_t v10 = @"nil";
    }
    else
    {
      int v8 = [v7 isNSNumber];
      id constantValue = self->_constantValue;
      if (v8)
      {
        uint64_t v10 = (__CFString *)[constantValue description];
      }
      else if ([constantValue isNSString])
      {
        uint64_t v10 = (__CFString *)[NSString stringWithFormat:@"'%@'", self->_constantValue];
      }
      else if ([self->_constantValue isNSDate])
      {
        v38 = NSString;
        [self->_constantValue timeIntervalSinceReferenceDate];
        uint64_t v10 = (__CFString *)objc_msgSend(v38, "stringWithFormat:", @"%f", v39);
      }
      else
      {
        uint64_t v40 = *MEMORY[0x1E4F1C3C8];
        id v41 = self->_constantValue;
        v75 = @"valueSpecified";
        id v76 = v41;
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v40, @"Can't specify non string/number/date value as part of index", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1)), @"NSUnderlyingException");
        uint64_t v10 = 0;
      }
    }
    goto LABEL_94;
  }
  uint64_t type = self->_type;
  v12 = self->_constantValue;
  if (!self->_type)
  {
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v12 objectID];
        if (!v15) {
          goto LABEL_24;
        }
LABEL_17:
        if (([v15 isTemporaryID] & 1) == 0
          && (uint64_t v16 = [v15 persistentStore],
              v16 == [a3 objectForKey:@"persistentStore"]))
        {
          if ([(NSSQLIntermediate *)self isTargetColumnsScoped]) {
            v42 = @"selectBindVars";
          }
          else {
            v42 = @"bindVars";
          }
          v18 = (void *)[a3 objectForKey:v42];
          if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"generatePairs"), "BOOLValue"))
          {
            uint64_t v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"persistentStore"), "model");
            if (v43) {
              v44 = *(void **)(v43 + 24);
            }
            else {
              v44 = 0;
            }
            uint64_t v45 = objc_msgSend(v44, "objectForKey:", objc_msgSend(v15, "entityName"));
            v46 = [NSSQLBindVariable alloc];
            if (v45) {
              uint64_t v47 = *(unsigned int *)(v45 + 184);
            }
            else {
              uint64_t v47 = 0;
            }
            v48 = [(NSSQLBindVariable *)v46 initWithInt64:v47 sqlType:2];
            [v18 addObject:v48];
          }
          v20 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", [v15 _referenceData64], 2);
        }
        else
        {
          if ([(NSSQLIntermediate *)self isTargetColumnsScoped]) {
            v17 = @"selectBindVars";
          }
          else {
            v17 = @"bindVars";
          }
          v18 = (void *)[a3 objectForKey:v17];
          v19 = [NSSQLBindVariable alloc];
          v20 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v19, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithLongLong:0], 2, 0);
        }
        v21 = v20;
        [v18 addObject:v20];

        BOOL v22 = 1;
        goto LABEL_87;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = v12;
        goto LABEL_17;
      }
    }
LABEL_24:
    uint64_t v23 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:](objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"persistentStore"), "adapter"), v12);
    id v24 = [(NSSQLIntermediate *)self->super._scope _lastScopedItem];
    if (!v24) {
      goto LABEL_77;
    }
    v25 = v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(id)objc_opt_class() isSimpleKeypath:v25] & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v25))
    {
      goto LABEL_77;
    }
    v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v25, "arguments"), "objectAtIndex:", 0), "constantValue");
    v27 = [(NSSQLIntermediate *)self governingEntityForKeypathExpression:v25];
    v28 = (void *)[v26 componentsSeparatedByString:@"."];
    uint64_t v29 = [v28 count];
    unsigned int v74 = v23;
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = [v28 objectAtIndex:0];
      if (v27)
      {
        uint64_t v32 = 1;
        while (1)
        {
          v33 = (unsigned __int8 *)[v27[5] objectForKey:v31];
          if (!v33) {
            break;
          }
          v34 = v33;
          int v35 = v33[24];
          BOOL v37 = v30 != v32 && v35 == 7;
          if (v35 == 9 || v37 || [v33 isToMany]) {
            v27 = (id *)[v34 destinationEntity];
          }
          if (v30 == v32) {
            goto LABEL_61;
          }
          uint64_t v31 = [v28 objectAtIndex:v32++];
          if (!v27) {
            goto LABEL_44;
          }
        }
        if ([@"entity" isEqual:v31])
        {
          v34 = (unsigned __int8 *)v27[17];
          goto LABEL_61;
        }
      }
      else
      {
LABEL_44:
        [@"entity" isEqual:v31];
      }
    }
    v34 = 0;
LABEL_61:
    unsigned int v49 = [v34 propertyType];
    if (v49 <= 9)
    {
      if (((1 << v49) & 0x38C) != 0)
      {
        uint64_t v50 = 2;
LABEL_64:
        if ((void *)[MEMORY[0x1E4F1CA98] null] == v12) {
          v12 = 0;
        }
        if (v50)
        {
          if (v50 == 7 && v74 == 8)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v51 = NSNumber;
              [v12 timeIntervalSinceReferenceDate];
              v12 = objc_msgSend(v51, "numberWithDouble:");
            }
            uint64_t v23 = 7;
          }
          else
          {
            uint64_t v23 = v50;
          }
        }
        else
        {
          uint64_t v23 = v74;
        }
LABEL_77:
        v52 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"explicitRestrictingEntityQualifier"), "lastObject");
        if ([v52 isEqual:MEMORY[0x1E4F1CC38]])
        {
          v53 = (void *)[a3 valueForKey:@"persistentStore"];
          v54 = (void *)[v53 model];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v55 = _sqlEntityForEntityDescription((uint64_t)v54, v12);
            if (!v55) {
              goto LABEL_85;
            }
            goto LABEL_84;
          }
          if ([v12 isNSString])
          {
            v56 = (void *)[v54 entityNamed:v12];
            if (!v56)
            {
              if (v54) {
                v63 = (void *)v54[3];
              }
              else {
                v63 = 0;
              }
              uint64_t v64 = [v63 allKeys];
              v65 = (void *)MEMORY[0x1E4F1CBF0];
              if (v64) {
                uint64_t v66 = v64;
              }
              else {
                uint64_t v66 = MEMORY[0x1E4F1CBF0];
              }
              uint64_t v67 = [v53 identifier];
              if (v67) {
                v68 = (__CFString *)v67;
              }
              else {
                v68 = @"no store ID";
              }
              uint64_t v69 = [v53 configurationName];
              if (v69) {
                v70 = (__CFString *)v69;
              }
              else {
                v70 = @"no config";
              }
              v71 = objc_msgSend((id)objc_msgSend(v54, "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v53, "configurationName"));
              if (v71) {
                v65 = (void *)[v71 valueForKey:@"name"];
              }
              v77[0] = @"KnownEntities";
              v77[1] = @"StoreID";
              v78[0] = v66;
              v78[1] = v68;
              v77[2] = @"Configuration";
              v77[3] = @"ConfigurationEntities";
              v78[2] = v70;
              v78[3] = v65;
              uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:4];
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v54, "managedObjectModel"), "entitiesByName"), "valueForKey:", v12)|| (objc_msgSend(v65, "containsObject:", v12) & 1) != 0|| (uint64_t v73 = objc_msgSend(NSString, "stringWithFormat:", @"\"%@\" is not in current configuration - %@.", v12, v70)) == 0)
              {
                uint64_t v73 = [NSString stringWithFormat:@"\"%@\" is not a valid entity name.", v73, v12];
              }
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], v73, v72), @"NSUnderlyingException");
              BOOL v22 = 0;
              goto LABEL_87;
            }
            uint64_t v55 = (uint64_t)v56;
            v12 = (void *)[v56 entityDescription];
LABEL_84:
            v57 = (void *)[a3 valueForKey:@"explicitRestrictingEntityQualifier"];
            objc_msgSend(v57, "replaceObjectAtIndex:withObject:", objc_msgSend(v57, "indexOfObject:", v52), v55);
          }
        }
LABEL_85:
        v13 = self;
        v14 = v12;
        uint64_t type = v23;
        goto LABEL_86;
      }
      if (v49 == 1)
      {
        uint64_t v50 = [v34 sqlType];
        if (v50 == 15)
        {
          v12 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v12, (void *)[v34 propertyDescription]);
          uint64_t v23 = 10;
          goto LABEL_77;
        }
        goto LABEL_64;
      }
      if (v49 == 5)
      {
        uint64_t v50 = 1;
        goto LABEL_64;
      }
    }
    uint64_t v50 = 0;
    goto LABEL_64;
  }
  v13 = self;
  v14 = self->_constantValue;
LABEL_86:
  BOOL v22 = -[NSSQLConstantValueIntermediate _addBindVarForConstId:ofType:inContext:](v13, v14, type, a3);
LABEL_87:
  int v58 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"generatePairs"), "BOOLValue");
  v59 = @"(?, ?)";
  if (!v22) {
    v59 = 0;
  }
  v60 = @"?";
  if (!v22) {
    v60 = 0;
  }
  if (v58) {
    uint64_t v10 = v59;
  }
  else {
    uint64_t v10 = v60;
  }
LABEL_94:
  v61 = (void *)[(__CFString *)v10 mutableCopy];
  return v61;
}

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4 context:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NSSQLConstantValueIntermediate;
  int v8 = [(NSSQLIntermediate *)&v12 initWithScope:a4];
  if (v8)
  {
    v8->_id constantValue = a3;
    v8->_uint64_t type = 0;
    self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = _sqlCoreLookupSQLEntityForEntityDescription((void *)[a5 objectForKey:@"persistentStore"], a3);
      uint64_t v10 = [a5 objectForKey:@"entitySpecificationKeypath"];
      if (v10) {
        objc_msgSend(a4, "setDisambiguatingEntity:withKeypath:hasToMany:", v9, v10, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"entitySpecificationKeypathContainsToMany"), "BOOLValue"));
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  self->_id constantValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLConstantValueIntermediate;
  [(NSSQLConstantValueIntermediate *)&v3 dealloc];
}

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 ofType:(unsigned __int8)a4 inScope:(id)a5 context:(id)a6
{
  uint64_t v10 = [(NSSQLConstantValueIntermediate *)self initWithConstantValue:a3 inScope:a5 context:a6];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_uint64_t type = a4;
    self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = _sqlCoreLookupSQLEntityForEntityDescription((void *)[a6 objectForKey:@"persistentStore"], a3);
      uint64_t v13 = [a6 objectForKey:@"entitySpecificationKeypath"];
      if (v13) {
        objc_msgSend(a5, "setDisambiguatingEntity:withKeypath:hasToMany:", v12, v13, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", @"entitySpecificationKeypathContainsToMany"), "BOOLValue"));
      }
    }
  }
  return v11;
}

@end