@interface _NSSQLEntityMigrationDescription
- (NSSQLEntity)sourceEntity;
- (id)description;
- (uint64_t)_generateSQLValueMappingsWithMigrationContext:(uint64_t)result;
- (uint64_t)_populateSQLValuesForDestinationToOne:(void *)a3 fromSourceToOne:;
- (uint64_t)addedManyToManys;
- (uint64_t)nextPropertyTransform;
- (uint64_t)removedManyToManys;
- (uint64_t)transformedManyToManys;
- (void)dealloc;
- (void)initWithEntityMapping:(void *)a3 sourceEntity:(void *)a4 destinationEntity:;
- (void)validateCloudKitEntityMigration;
@end

@implementation _NSSQLEntityMigrationDescription

- (void)initWithEntityMapping:(void *)a3 sourceEntity:(void *)a4 destinationEntity:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)_NSSQLEntityMigrationDescription;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[5] = a3;
    v7[4] = a4;
    *((_DWORD *)v7 + 12) = [a2 mappingType] - 2;
  }
  return v7;
}

- (void)dealloc
{
  self->_entityMapping = 0;
  self->_srcEntity = 0;

  self->_dstEntity = 0;
  self->_sqlValuesByColumnName = 0;

  self->_addedManyToManys = 0;
  self->_removedManyToManys = 0;

  self->_transformedManyToManys = 0;
  self->_processedTransforms = 0;

  self->_pendingTransforms = 0;
  self->_sourceEntitiesByToOneWithNewEntityKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLEntityMigrationDescription;
  [(_NSSQLEntityMigrationDescription *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLEntityMigrationDescription;
  return (id)[NSString stringWithFormat:@"%@ : %@ -> %@", -[_NSSQLEntityMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_srcEntity, "name"), -[NSSQLEntity name](self->_dstEntity, "name")];
}

- (uint64_t)_generateSQLValueMappingsWithMigrationContext:(uint64_t)result
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  objc_super v3 = -[NSEntityMapping _mappingsByName](*(void **)(result + 8));
  *(void *)(v2 + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(v3, "count"));
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = (id)[v3 allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v99 objects:v108 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v100;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v100 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v99 + 1) + 8 * v7);
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        if (v8) {
          objc_super v9 = *(void **)(v8 + 24);
        }
        else {
          objc_super v9 = 0;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v107 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v96;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v96 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v95 + 1) + 8 * i);
              if (v14 && *(void *)(v14 + 24))
              {
                v15 = *(void **)(v2 + 88);
                if (!v15)
                {
                  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
                  *(void *)(v2 + 88) = v15;
                }
              }
              else
              {
                v15 = *(void **)(v2 + 80);
              }
              [v15 addObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v95 objects:v107 count:16];
          }
          while (v11);
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v16 = [obj countByEnumeratingWithState:&v99 objects:v108 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }
  v17 = *(void **)(v2 + 80);
  if (!*(void *)(v2 + 16)) {
    *(void *)(v2 + 16) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", 2 * objc_msgSend(v17, "count"));
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obja = (id)[v17 countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (!obja) {
    goto LABEL_88;
  }
  uint64_t v91 = *(void *)v104;
  id v89 = v17;
  do
  {
    v18 = 0;
    do
    {
      if (*(void *)v104 != v91) {
        objc_enumerationMutation(v89);
      }
      uint64_t v19 = *(void *)(*((void *)&v103 + 1) + 8 * (void)v18);
      uint64_t v20 = *(void *)(v2 + 32);
      if (v19)
      {
        uint64_t v21 = *(void *)(v19 + 16);
        if (!v20) {
          goto LABEL_82;
        }
      }
      else
      {
        uint64_t v21 = 0;
        if (!v20)
        {
LABEL_82:
          if ((objc_msgSend(0, "isToMany", v21) & 1) == 0) {
            goto LABEL_117;
          }
          goto LABEL_79;
        }
      }
      v22 = (unsigned __int8 *)[*(id *)(v20 + 40) objectForKey:v21];
      if (!v22) {
        goto LABEL_82;
      }
      v23 = v22;
      int v24 = v22[24];
      if (v24 == 1)
      {
        v26 = 0;
        v25 = 0;
        v27 = 0;
      }
      else
      {
        if (v24 != 7)
        {
          if (([v22 isToMany] & 1) == 0 && v23[24] != 9)
          {
LABEL_117:
            v79 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v80 = *MEMORY[0x1E4F1C3B8];
            uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:@"transform"];
            v82 = @"Unrecognized destination property type in transform";
            goto LABEL_122;
          }
          goto LABEL_79;
        }
        v22 = (unsigned __int8 *)[v22 foreignKey];
        v25 = (void *)*((void *)v23 + 9);
        v26 = (void *)*((void *)v23 + 10);
        v27 = v22;
      }
      uint64_t v28 = [v22 columnName];
      if (v19) {
        v29 = *(void **)(v19 + 8);
      }
      else {
        v29 = 0;
      }
      uint64_t v30 = [v29 expressionType];
      if (v30 == 4)
      {
        if (objc_msgSend(@"_prependExternalBlobToken:", "isEqual:", objc_msgSend(v29, "function")))
        {
          if (v23[24] == 1)
          {
            uint64_t v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "arguments"), "objectAtIndex:", 0), "keyPath");
            uint64_t v37 = *(void *)(v2 + 40);
            if (v37) {
              v38 = (void *)[*(id *)(v37 + 40) objectForKey:v36];
            }
            else {
              v38 = 0;
            }
            v39 = *(void **)(v2 + 16);
            uint64_t v40 = [NSString stringWithFormat:@"NSCoreDataPrependExternalReferenceMarker(length(%@), %@)", objc_msgSend(v38, "columnName"), objc_msgSend(v38, "columnName")];
            v41 = v39;
LABEL_63:
            [v41 setObject:v40 forKey:v28];
            goto LABEL_79;
          }
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3B8];
          uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:@"transform"];
          v82 = @"Invalid source property type in transform";
        }
        else
        {
LABEL_115:
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3B8];
          uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:@"transform"];
          v82 = @"Unsupported value expression type in transform";
        }
LABEL_122:
        v85 = v79;
        uint64_t v86 = v80;
LABEL_123:
        objc_exception_throw((id)[v85 exceptionWithName:v86 reason:v82 userInfo:v81]);
      }
      if (v30 == 3)
      {
        uint64_t v42 = *(void *)(v2 + 40);
        uint64_t v43 = [v29 keyPath];
        if (v42) {
          v44 = (void *)[*(id *)(v42 + 40) objectForKey:v43];
        }
        else {
          v44 = 0;
        }
        if (a2
          && -[_NSSQLiteStoreMigrator enforceCloudKitConstraintsForEntity:](a2, (void *)[v23 entity])&& !objc_msgSend((id)objc_msgSend(v44, "name"), "isEqualToString:", objc_msgSend(v23, "name")))
        {
          uint64_t v87 = [NSString stringWithFormat:@"Properties cannot be renamed in stores that are used with CloudKit. Cannot rename '%@.%@' to '%@.%@'.", objc_msgSend(*(id *)(v2 + 40), "name"), objc_msgSend(v44, "name"), objc_msgSend(*(id *)(v2 + 32), "name"), objc_msgSend(v23, "name")];
          id v88 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134110, v87, 0);
          objc_exception_throw(v88);
        }
        int v45 = v23[24];
        if (v45 != 7)
        {
          if (v45 != 1)
          {
            v79 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v80 = *MEMORY[0x1E4F1C3B8];
            uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:@"transform"];
            v82 = @"Unrecognized source property type in transform";
            goto LABEL_122;
          }
          v46 = *(void **)(v2 + 16);
          uint64_t v40 = [v44 columnName];
          v41 = v46;
          goto LABEL_63;
        }
        uint64_t v55 = v2;
        v56 = v23;
        v54 = v44;
        goto LABEL_73;
      }
      if (v30) {
        goto LABEL_115;
      }
      int v31 = v23[24];
      if (v31 != 7)
      {
        if (v31 != 1)
        {
          v79 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v80 = *MEMORY[0x1E4F1C3B8];
          uint64_t v81 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v19, @"transform", v23, @"property", 0);
          v82 = @"Invalid constant expression type for property type in transform";
          goto LABEL_122;
        }
        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", [v29 constantValue], objc_msgSend(v23, "sqlType"), 0);
        v33 = *(void **)(v2 + 16);
        v34 = v32;
        uint64_t v35 = v28;
        goto LABEL_78;
      }
      uint64_t v47 = objc_msgSend((id)objc_msgSend(v23, "propertyDescription"), "inverseRelationship");
      if (v47)
      {
        v48 = (void *)v47;
        v49 = (id *)objc_msgSend((id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](a2, objc_msgSend(v23, "destinationEntity")), "sourceEntity");
        v50 = objc_msgSend((id)objc_msgSend(v49, "entityDescription"), "_propertyWithRenamingIdentifier:", objc_msgSend(v48, "renamingIdentifier"));
        if (v50)
        {
          v51 = v50;
          if (![v50 inverseRelationship])
          {
            uint64_t v52 = [v51 name];
            if (v49)
            {
              uint64_t v53 = [v49[5] objectForKey:v52];
              if (v53)
              {
                v54 = *(unsigned char **)(v53 + 56);
                if (v54)
                {
                  if (v54[24] == 7)
                  {
                    uint64_t v55 = v2;
                    v56 = v23;
LABEL_73:
                    -[_NSSQLEntityMigrationDescription _populateSQLValuesForDestinationToOne:fromSourceToOne:](v55, v56, v54);
                    goto LABEL_79;
                  }
                }
              }
            }
          }
        }
      }
      v57 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v27 sqlType], 0);
      [*(id *)(v2 + 16) setObject:v57 forKey:v28];

      if (v25)
      {
        v58 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v25 sqlType], 0);
        objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v58, objc_msgSend(v25, "columnName"));
      }
      if (v26)
      {
        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v26 sqlType], 0);
        v59 = *(void **)(v2 + 16);
        uint64_t v35 = [v26 columnName];
        v33 = v59;
        v34 = v32;
LABEL_78:
        [v33 setObject:v34 forKey:v35];
      }
LABEL_79:
      v18 = (char *)v18 + 1;
    }
    while (obja != v18);
    uint64_t v60 = [v89 countByEnumeratingWithState:&v103 objects:v111 count:16];
    id obja = (id)v60;
  }
  while (v60);
LABEL_88:
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v61 = (void *)-[NSSQLEntity properties](*(void *)(v2 + 32));
  result = [v61 countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (result)
  {
    uint64_t v62 = result;
    uint64_t v63 = *(void *)v104;
    id objb = v61;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v104 != v63) {
          objc_enumerationMutation(v61);
        }
        uint64_t v65 = *(void *)(*((void *)&v103 + 1) + 8 * v64);
        if (v65 && *(unsigned char *)(v65 + 24) == 7 && *(unsigned char *)(v65 + 88))
        {
          v66 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * v64) foreignKey];
          v67 = *(void **)(v65 + 56);
          v68 = (void *)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](a2, (void *)[v67 entity]);
          v69 = v68;
          if (v68) {
            v68 = (void *)v68[1];
          }
          v70 = (void *)[v68 userInfo];
          if (objc_msgSend((id)objc_msgSend(v70, "objectForKey:", _NSInferredMappedPropertiesKey), "containsObject:", objc_msgSend(v67, "name")))
          {
            if (v67) {
              v71 = (void *)[v67 propertyDescription];
            }
            else {
              v71 = 0;
            }
            v72 = (void *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:]([v69 sourceEntity], objc_msgSend(v71, "renamingIdentifier"));
            if (![v72 isToMany])
            {
              v83 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v84 = *MEMORY[0x1E4F1C3B8];
              v109[0] = @"sourceRelationship";
              v109[1] = @"destinationRelationship";
              v110[0] = v72;
              v110[1] = v65;
              uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
              v82 = @"Unsupported relationship migration: A to-one's inverse to-many source must be a to-many";
              v85 = v83;
              uint64_t v86 = v84;
              goto LABEL_123;
            }
            if (v72) {
              v73 = (void *)v72[7];
            }
            else {
              v73 = 0;
            }
            -[_NSSQLEntityMigrationDescription _populateSQLValuesForDestinationToOne:fromSourceToOne:](v2, (void *)v65, v73);
          }
          else
          {
            v74 = *(void **)(v65 + 72);
            v75 = *(void **)(v65 + 80);
            v76 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v66 sqlType], 0);
            objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v76, objc_msgSend(v66, "columnName"));

            if (v74)
            {
              v77 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v74 sqlType], 0);
              objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v77, objc_msgSend(v74, "columnName"));
            }
            v61 = objb;
            if (v75)
            {
              v78 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v75 sqlType], 0);
              objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v78, objc_msgSend(v75, "columnName"));
            }
          }
        }
        ++v64;
      }
      while (v62 != v64);
      result = [v61 countByEnumeratingWithState:&v103 objects:v111 count:16];
      uint64_t v62 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_populateSQLValuesForDestinationToOne:(void *)a3 fromSourceToOne:
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", objc_msgSend((id)objc_msgSend(a3, "foreignKey"), "columnName"), objc_msgSend((id)objc_msgSend(a2, "foreignKey"), "columnName"));
  if (!a2) {
    return result;
  }
  uint64_t v7 = (void *)a2[9];
  uint64_t v8 = (void *)a2[10];
  if (!v7) {
    goto LABEL_11;
  }
  if (a3)
  {
    objc_super v9 = (void *)a3[9];
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 16);
      uint64_t v11 = [v9 columnName];
      uint64_t v12 = [v7 columnName];
      v13 = v10;
      uint64_t v14 = v11;
LABEL_10:
      uint64_t result = [v13 setObject:v14 forKey:v12];
LABEL_11:
      if (!v8) {
        return result;
      }
      goto LABEL_12;
    }
  }
  uint64_t v15 = [a3 destinationEntity];
  if (v15) {
    uint64_t v16 = *(unsigned int *)(v15 + 184);
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", v16, [v7 sqlType]);
  objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v17, objc_msgSend(v7, "columnName"));

  uint64_t v18 = [a3 destinationEntity];
  uint64_t v19 = *(void **)(a1 + 24);
  if (v19)
  {
    uint64_t v12 = [a2 name];
    v13 = v19;
    uint64_t v14 = v18;
    goto LABEL_10;
  }
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v18, objc_msgSend(a2, "name"), 0);
  *(void *)(a1 + 24) = result;
  if (!v8) {
    return result;
  }
LABEL_12:
  if (!a3)
  {
    uint64_t v21 = *(void **)(a1 + 16);
    goto LABEL_14;
  }
  uint64_t v20 = (void *)a3[10];
  uint64_t v21 = *(void **)(a1 + 16);
  if (!v20) {
LABEL_14:
  }
    uint64_t v20 = (void *)[a3 foreignKey];
  uint64_t v22 = [v20 columnName];
  uint64_t v23 = [v8 columnName];

  return [v21 setObject:v22 forKey:v23];
}

- (uint64_t)addedManyToManys
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 56))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredAddedPropertiesKey];
      *(void *)(v1 + 56) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && [*(id *)(*((void *)&v10 + 1) + 8 * v8) entity] == *(void *)(v1 + 32))
            {
              if (objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name"))) {
                [*(id *)(v1 + 56) addObject:v9];
              }
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
    return *(void *)(v1 + 56);
  }
  return result;
}

- (uint64_t)removedManyToManys
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 64))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredRemovedPropertiesKey];
      *(void *)(v1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(v1 + 40), "manyToManyRelationships", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && [*(id *)(*((void *)&v10 + 1) + 8 * v8) entity] == *(void *)(v1 + 40))
            {
              if (objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name"))) {
                [*(id *)(v1 + 64) addObject:v9];
              }
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
    return *(void *)(v1 + 64);
  }
  return result;
}

- (uint64_t)transformedManyToManys
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 72))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredMappedPropertiesKey];
      *(void *)(v1 + 72) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
            if (v9
              && v9[8]
              && [*(id *)(*((void *)&v11 + 1) + 8 * v8) entity] == *(void *)(v1 + 32)
              && objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name")))
            {
              long long v10 = (__CFString *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](*(void *)(v1 + 40), objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier"));
              if ((-[NSSQLManyToMany isTableSchemaEqual:]((uint64_t)v9, v10) & 1) == 0) {
                [*(id *)(v1 + 72) addObject:v9];
              }
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
    return *(void *)(v1 + 72);
  }
  return result;
}

- (uint64_t)nextPropertyTransform
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v2 = *(void **)(a1 + 88);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
          if (v7) {
            uint64_t v8 = *(void *)(v7 + 24);
          }
          else {
            uint64_t v8 = 0;
          }
          if ([*(id *)(a1 + 80) containsObject:v8])
          {
            [*(id *)(a1 + 80) addObject:v7];
            [*(id *)(a1 + 88) removeObject:v7];
            return v7;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v9 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v4 = v9;
      }
      while (v9);
    }
    if ([*(id *)(a1 + 88) count]) {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Entity mapping includes property transform with unresolved prerequisite", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *(void *)(a1 + 88), @"pendingTransforms")));
    }
  }
  return 0;
}

- (void)validateCloudKitEntityMigration
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = (void *)-[_NSSQLEntityMigrationDescription transformedManyToManys]((uint64_t)self);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * v7) propertyDescription];
        }
        else {
          uint64_t v9 = 0;
        }
        if (objc_msgSend((id)objc_msgSend(v9, "renamingIdentifier"), "length"))
        {
          if (v8)
          {
            long long v10 = objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "name");
            long long v11 = (void *)[v8 propertyDescription];
          }
          else
          {
            long long v10 = (void *)[0 name];
            long long v11 = 0;
          }
          if ((objc_msgSend(v10, "isEqualToString:", objc_msgSend(v11, "renamingIdentifier")) & 1) == 0)
          {
            long long v13 = NSString;
            if (v8)
            {
              uint64_t v14 = objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "renamingIdentifier");
              uint64_t v15 = (void *)[v8 propertyDescription];
            }
            else
            {
              uint64_t v14 = [0 renamingIdentifier];
              uint64_t v15 = 0;
            }
            uint64_t v20 = [v15 name];
            uint64_t v16 = [v13 stringWithFormat:@"CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new relationships.", v14, v20, (void)v22];
LABEL_22:
            id v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134110, v16, 0);
            objc_exception_throw(v17);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v5 = v12;
    }
    while (v12);
  }
  if ((objc_msgSend(-[NSSQLEntity name](self->_srcEntity, "name"), "isEqualToString:", -[NSSQLEntity name](self->_dstEntity, "name")) & 1) == 0)
  {
    uint64_t v18 = NSString;
    id v19 = [(NSSQLEntity *)self->_srcEntity name];
    id v21 = [(NSSQLEntity *)self->_dstEntity name];
    uint64_t v16 = [v18 stringWithFormat:@"CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new records.", v19, v21, (void)v22];
    goto LABEL_22;
  }
}

- (NSSQLEntity)sourceEntity
{
  return self->_srcEntity;
}

@end