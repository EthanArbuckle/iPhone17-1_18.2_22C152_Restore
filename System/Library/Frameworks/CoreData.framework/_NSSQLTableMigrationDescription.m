@interface _NSSQLTableMigrationDescription
- (NSSQLEntity)rootEntity;
- (id)_sourceRootEntity;
- (id)createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:(uint64_t)a3 migrationContext:;
- (id)createFEKUpdateStatementsForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2;
- (id)description;
- (uint64_t)_doAttributesHaveChangesRequiringCopyForMigration:(uint64_t)a3 withContext:;
- (uint64_t)_doRelationshipsHaveChangesRequiringCopyForMigration:(uint64_t)a3 inContext:;
- (uint64_t)_ownSourceRootTableNeedsRenameInMigrationContext:(uint64_t)a1;
- (uint64_t)_transformedManyToManys;
- (uint64_t)addEntityMigrationDescription:(uint64_t)result;
- (uint64_t)appendStatementsToCompleteMigration:(uint64_t)a3 migrationContext:;
- (uint64_t)appendStatementsToCreateOrDropTables:(uint64_t)a3 migrationContext:;
- (uint64_t)appendStatementsToRenameTables:(uint64_t)a3 migrationContext:;
- (uint64_t)createUpdateStatementForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2;
- (uint64_t)newCloudKitMetadataUpdateStatements:(uint64_t)a1;
- (uint64_t)newCopyAndInsertStatementForToOne:(void *)a1 toManyToMany:(__CFString *)a2 fromTableName:(uint64_t)a3 invertColumns:(int)a4 migrationContext:(uint64_t)a5;
- (void)_determineSchemaTransformationComplexityInMigrationContext:(id *)a1;
- (void)_retainedRemovedSubEntitiesOfEntity:(uint64_t)a1;
- (void)_sourceRootTableNameInMigrationContext:(uint64_t)a1;
- (void)_tempNameForTableName:(uint64_t)a1;
- (void)appendDefaultValueStatementsToCompleteMigration:(uint64_t)a3 migrationContext:;
- (void)appendStatementsToPerformMigration:(uint64_t)a3 migrationContext:;
- (void)createInsertStatementForEntityMigration:(uint64_t)a3 migrationContext:;
- (void)dealloc;
- (void)initWithRootEntity:(int)a3 migrationType:;
@end

@implementation _NSSQLTableMigrationDescription

- (void)initWithRootEntity:(int)a3 migrationType:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)_NSSQLTableMigrationDescription;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    *((_DWORD *)v5 + 6) = a3;
    v5[8] = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
    v5[12] = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    v5[14] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5[15] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5[16] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5[17] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5[22] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v5;
}

- (void)dealloc
{
  self->_rootEntity = 0;
  self->_sourceRootEntity = 0;

  self->_migrationByEntity = 0;
  self->_addedEntityMigrations = 0;

  self->_removedEntityMigrations = 0;
  self->_copiedEntityMigrations = 0;

  self->_transformedEntityMigrations = 0;
  self->_addedManyToManys = 0;

  self->_removedManyToManys = 0;
  self->_transformedManyToManys = 0;

  self->_tempTableNames = 0;
  self->_hasComplexSchemaTransformations = 0;

  self->_addedColumnSet = 0;
  self->_renamedTableSet = 0;

  self->_renamedColumnSet = 0;
  self->_renamedMTMSet = 0;

  self->_delayedDropColumnSet = 0;
  self->_raisedColumnSet = 0;

  self->_droppedEntitySet = 0;
  self->_collapsedEntitySet = 0;

  self->_columnsUpgradedToMandatory = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLTableMigrationDescription;
  [(_NSSQLTableMigrationDescription *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLTableMigrationDescription;
  return (id)[NSString stringWithFormat:@"%@ : %@ ", -[_NSSQLTableMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_rootEntity, "name")];
}

- (uint64_t)addEntityMigrationDescription:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      if (*(_DWORD *)(a2 + 48) == 1) {
        v4 = (void *)[(id)a2 sourceEntity];
      }
      else {
        v4 = *(void **)(a2 + 32);
      }
      objc_msgSend(*(id *)(v3 + 64), "setObject:forKey:", a2, objc_msgSend(v4, "name"));
      if (*(unsigned char *)(a2 + 96) && !*(void *)(v3 + 104)) {
        *(void *)(v3 + 104) = (id)[NSNumber numberWithBool:1];
      }
      switch(*(_DWORD *)(a2 + 48))
      {
        case 0:
          goto LABEL_10;
        case 1:
          v5 = *(void **)(v3 + 40);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
            *(void *)(v3 + 40) = v5;
          }
          goto LABEL_18;
        case 2:
          v5 = *(void **)(v3 + 48);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
            *(void *)(v3 + 48) = v5;
          }
          goto LABEL_18;
        case 3:
          v5 = *(void **)(v3 + 56);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
            *(void *)(v3 + 56) = v5;
          }
          goto LABEL_18;
        default:
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Unrecognized entity migration type", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a2, @"entityMigration")));
      }
    }
    objc_msgSend(*(id *)(result + 64), "setObject:forKey:", 0, objc_msgSend(0, "name"));
LABEL_10:
    v5 = *(void **)(v3 + 32);
    if (!v5)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
      *(void *)(v3 + 32) = v5;
    }
LABEL_18:
    return [v5 addObject:a2];
  }
  return result;
}

- (uint64_t)_doAttributesHaveChangesRequiringCopyForMigration:(uint64_t)a3 withContext:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a2) {
    v4 = (void *)a2[4];
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = [a2 sourceEntity];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  if (v4) {
    v4 = -[NSSQLEntity entitySpecificPropertiesPassing:]((uint64_t)v4, (uint64_t)&__block_literal_global_18_0);
  }
  uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier");
      if (objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace")) {
        uint64_t v10 = [NSString stringWithFormat:@"%@.%@", objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace"), v10];
      }
      v11 = (unsigned char *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v5, v10);
      if (v11)
      {
        v12 = v9;
LABEL_18:
        int v14 = [v11 propertyType];
        if (v14 != [v12 propertyType]) {
          return 1;
        }
        int v15 = objc_msgSend((id)objc_msgSend(v11, "columnName"), "isEqual:", objc_msgSend(v12, "columnName"));
        if ((v15 & 1) == 0)
        {
          if (!v12) {
            return 1;
          }
          uint64_t result = 1;
          if (!v11 || v12[24] != 1 || v11[24] != 1) {
            return result;
          }
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "renamingIdentifier")))return 1; {
          v17 = *(void **)(a1 + 128);
          }
          v36[0] = v11;
          v36[1] = v12;
          objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v36, 2));
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "userInfo"), "objectForKey:", @"NSMigrationAllowTypeTransformation"))
        {
          int v18 = 0;
        }
        else
        {
          int v18 = v15;
        }
        if (v18 == 1
          && !objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "_isSchemaEqual:", objc_msgSend(v12, "propertyDescription")))
        {
          return 1;
        }
        if (v15
          && objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "isOptional")
          && (objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "isOptional") & 1) == 0)
        {
          id v19 = *(id *)(a1 + 168);
          if (!v19)
          {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            *(void *)(a1 + 168) = v19;
          }
          [v19 addObject:v12];
        }
        continue;
      }
      v12 = -[NSSQLEntity subhierarchyColumnMatching:](v5, v9);
      if (v12)
      {
        id v13 = *(id *)(a1 + 144);
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          *(void *)(a1 + 144) = v13;
        }
        [v13 addObject:v12];
        goto LABEL_18;
      }
      if (a3)
      {
        v20 = *(void **)(a3 + 48);
        if (v20)
        {
          uint64_t v26 = 0;
          v27 = &v26;
          uint64_t v28 = 0x3052000000;
          v29 = __Block_byref_object_copy__34;
          v30 = __Block_byref_object_dispose__34;
          uint64_t v31 = 0;
          id v21 = -[NSSQLiteConnection fetchTableCreationSQL](v20);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __97___NSSQLTableMigrationDescription__doAttributesHaveChangesRequiringCopyForMigration_withContext___block_invoke;
          v25[3] = &unk_1E544E658;
          v25[4] = v5;
          v25[5] = &v26;
          [v21 enumerateObjectsUsingBlock:v25];
          v22 = (void *)v27[5];
          if (!v22
          {
            _Block_object_dispose(&v26, 8);
            return 1;
          }
          _Block_object_dispose(&v26, 8);
        }
      }
      [*(id *)(a1 + 112) addObject:v9];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    uint64_t result = 0;
    if (v6) {
      continue;
    }
    return result;
  }
}

- (uint64_t)_doRelationshipsHaveChangesRequiringCopyForMigration:(uint64_t)a3 inContext:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v4 = a2[4];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [a2 sourceEntity];
  if (a3) {
    uint64_t v6 = *(void **)(a3 + 32);
  }
  else {
    uint64_t v6 = 0;
  }
  int v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "sqlCore"), "options"), "objectForKey:", @"NSPersistentStoreDeferredLightweightMigrationOptionKey"), "BOOLValue");
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  if (v4) {
    uint64_t v7 = -[NSSQLEntity entitySpecificPropertiesPassing:](v4, (uint64_t)&__block_literal_global_16);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t result = [v7 countByEnumeratingWithState:&v60 objects:v69 count:16];
  uint64_t v9 = a1;
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v55 = a3;
    uint64_t v59 = *(void *)v61;
    v57 = v7;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v61 != v59) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v60 + 1) + 8 * v11);
        uint64_t v13 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v5, objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "renamingIdentifier"));
        if (!v13)
        {
          if ([(id)v12 propertyType] != 7)
          {
            if (!v12) {
              goto LABEL_79;
            }
            goto LABEL_38;
          }
          if (!v12) {
            goto LABEL_79;
          }
          if (!*(unsigned char *)(v12 + 88)) {
            goto LABEL_38;
          }
          uint64_t v31 = [(id)v12 name];
          if (!v5 || (uint64_t v13 = [*(id *)(v5 + 40) objectForKey:v31]) == 0)
          {
            long long v32 = *(void **)(v12 + 56);
            uint64_t v33 = objc_msgSend((id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](v55, objc_msgSend(v32, "sourceEntity")), "sourceEntity");
            uint64_t v34 = objc_msgSend((id)objc_msgSend(v32, "propertyDescription"), "renamingIdentifier");
            uint64_t v35 = v33;
            uint64_t v7 = v57;
            uint64_t v36 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v35, v34);
            if (v36 && *(void *)(v36 + 56)) {
              return 1;
            }
LABEL_38:
            if (*(unsigned char *)(v12 + 24) == 7)
            {
              objc_msgSend(*(id *)(v9 + 112), "addObject:", objc_msgSend((id)v12, "foreignKey"));
              if (*(void *)(v12 + 72)) {
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
              }
              if (*(void *)(v12 + 80)) {
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
              }
            }
            goto LABEL_79;
          }
        }
        int v14 = [(id)v13 propertyType];
        if (v14 != [(id)v12 propertyType]) {
          return 1;
        }
        uint64_t v15 = [(id)v12 destinationEntity];
        uint64_t v16 = [(id)v13 destinationEntity];
        if (v14 == 7)
        {
          uint64_t v17 = v16;
          if (objc_msgSend((id)objc_msgSend((id)v13, "propertyDescription"), "isOptional")
            && !objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "isOptional"))
          {
            return 1;
          }
          int v18 = (void *)[(id)v13 foreignKey];
          uint64_t v19 = [(id)v12 foreignKey];
          if (v18)
          {
            v20 = (void *)v19;
            if (v19)
            {
              uint64_t v21 = [v18 columnName];
              uint64_t v22 = [v20 columnName];
              v23 = (void *)v21;
              uint64_t v9 = a1;
              if (([v23 isEqual:v22] & 1) == 0)
              {
                v24 = *(void **)(a1 + 128);
                v68[0] = v18;
                v68[1] = v20;
                uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
                uint64_t v26 = v24;
                uint64_t v9 = a1;
                [v26 addObject:v25];
              }
            }
          }
          if (v15 && *(_DWORD *)(v15 + 188) != *(_DWORD *)(v15 + 184))
          {
            if (v17) {
              v37 = *(void **)(v17 + 152);
            }
            else {
              v37 = 0;
            }
            if (![v37 count])
            {
              if (v12) {
                uint64_t v29 = *(void *)(v12 + 72);
              }
              else {
                uint64_t v29 = 0;
              }
              v30 = *(void **)(v9 + 112);
              goto LABEL_55;
            }
            if (v12)
            {
              uint64_t v38 = *(void *)(v13 + 72);
              if (v38)
              {
                v39 = *(void **)(v12 + 72);
                if (v39)
                {
                  uint64_t v40 = [*(id *)(v13 + 72) columnName];
                  uint64_t v41 = [v39 columnName];
                  v42 = (void *)v40;
                  uint64_t v9 = a1;
                  if (([v42 isEqual:v41] & 1) == 0)
                  {
                    v43 = *(void **)(a1 + 128);
                    v66[0] = v38;
                    v66[1] = v39;
                    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
                    v45 = v43;
                    uint64_t v9 = a1;
                    [v45 addObject:v44];
                  }
                }
              }
              v46 = *(void **)(v13 + 80);
              goto LABEL_57;
            }
            BOOL v49 = 0;
            v48 = 0;
            v46 = *(void **)(v13 + 80);
          }
          else
          {
            if (v17 && *(_DWORD *)(v17 + 188) != *(_DWORD *)(v17 + 184))
            {
              int v27 = v56;
              if (!*(void *)(v13 + 72)) {
                int v27 = 0;
              }
              if (v27 != 1) {
                return 1;
              }
              uint64_t v28 = *(void **)(v9 + 176);
              uint64_t v67 = *(void *)(v13 + 72);
              uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
              v30 = v28;
LABEL_55:
              [v30 addObject:v29];
            }
            v46 = *(void **)(v13 + 80);
            if (v12)
            {
LABEL_57:
              char v47 = 0;
              v48 = *(void **)(v12 + 80);
              BOOL v49 = v48 != 0;
              if (!v46 && v48)
              {
                [*(id *)(v9 + 112) addObject:v48];
LABEL_75:
                if (*(unsigned char *)(v12 + 88))
                {
                  uint64_t v7 = v57;
                  if (!*(unsigned char *)(v13 + 88)) {
                    return 1;
                  }
                  goto LABEL_79;
                }
LABEL_78:
                uint64_t v7 = v57;
                if (*(unsigned char *)(v13 + 88)) {
                  return 1;
                }
                goto LABEL_79;
              }
LABEL_64:
              if (!v46 || v48)
              {
                char v54 = !v49;
                if (!v46) {
                  char v54 = 1;
                }
                if ((v54 & 1) == 0
                  && (objc_msgSend((id)objc_msgSend(v46, "columnName"), "isEqual:", objc_msgSend(v48, "columnName")) & 1) == 0)
                {
                  v50 = *(void **)(v9 + 128);
                  v64[0] = v46;
                  v64[1] = v48;
                  v51 = (void *)MEMORY[0x1E4F1C978];
                  v52 = (void **)v64;
                  uint64_t v53 = 2;
                  goto LABEL_73;
                }
              }
              else
              {
                if (!v56) {
                  return 1;
                }
                v50 = *(void **)(v9 + 176);
                v65 = v46;
                v51 = (void *)MEMORY[0x1E4F1C978];
                v52 = &v65;
                uint64_t v53 = 1;
LABEL_73:
                objc_msgSend(v50, "addObject:", objc_msgSend(v51, "arrayWithObjects:count:", v52, v53));
              }
              if ((v47 & 1) == 0) {
                goto LABEL_75;
              }
              goto LABEL_78;
            }
            BOOL v49 = 0;
            v48 = 0;
          }
          char v47 = 1;
          goto LABEL_64;
        }
LABEL_79:
        ++v11;
      }
      while (v10 != v11);
      uint64_t result = [v7 countByEnumeratingWithState:&v60 objects:v69 count:16];
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

- (void)_determineSchemaTransformationComplexityInMigrationContext:(id *)a1
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (a1[13]) {
    return;
  }
  if ((objc_msgSend((id)objc_msgSend(a1[1], "tableName"), "isEqualToString:", objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity]((uint64_t)a1), "tableName")) & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[1], "entityDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a1[2], "entityDescription"), "renamingIdentifier")))
    {
      uint64_t v51 = [objc_alloc(NSNumber) initWithBool:1];
      goto LABEL_100;
    }
    id v3 = a1[15];
    int8x16_t v91 = vextq_s8(*(int8x16_t *)(a1 + 1), *(int8x16_t *)(a1 + 1), 8uLL);
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v91, 2));
  }
  if (![a1[5] count]
    || [a1[4] count]
    || [a1[7] count]
    || [a1[6] count])
  {
    a1[19] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    a1[20] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v4 = a1[5];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v81;
LABEL_11:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v81 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v80 + 1) + 8 * v7) sourceEntity];
        uint64_t v9 = (void *)v8;
        uint64_t v10 = v8 ? -[NSSQLEntity entitySpecificPropertiesPassing:](v8, (uint64_t)&__block_literal_global_15) : 0;
        if ([v10 count]) {
          break;
        }
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "userInfo"), "objectForKey:", @"NSEntityRenamingShouldRebaseKey");
        if (!v11
          || (v12 = objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", v11), uint64_t v13 = a1 + 20, (v12 & 1) == 0))
        {
          uint64_t v13 = a1 + 19;
        }
        [*v13 addObject:v9];
        if (v5 == ++v7)
        {
          uint64_t v14 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
          uint64_t v5 = v14;
          if (v14) {
            goto LABEL_11;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      if (![a1[4] count]
        || [a1[5] count]
        || [a1[7] count]
        || [a1[6] count])
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        obuint64_t j = a1[4];
        uint64_t v15 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v15)
        {
          uint64_t v57 = *(void *)v77;
          do
          {
            uint64_t v16 = 0;
            uint64_t v59 = v15;
            do
            {
              if (*(void *)v77 != v57) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void *)(*((void *)&v76 + 1) + 8 * v16);
              if (v17)
              {
                uint64_t v18 = *(void *)(v17 + 32);
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                if (v18) {
                  uint64_t v19 = -[NSSQLEntity entitySpecificPropertiesPassing:](v18, (uint64_t)&__block_literal_global_15);
                }
                else {
                  uint64_t v19 = 0;
                }
              }
              else
              {
                uint64_t v19 = 0;
                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v88 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v73;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v73 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                    if (v23)
                    {
                      int v24 = *(unsigned __int8 *)(v23 + 24);
                      if (v24 == 1) {
                        goto LABEL_47;
                      }
                      if (v24 == 7)
                      {
                        objc_msgSend(a1[14], "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "foreignKey"));
                        if (*(void *)(v23 + 72)) {
                          objc_msgSend(a1[14], "addObject:");
                        }
                        uint64_t v23 = *(void *)(v23 + 80);
                        if (v23) {
LABEL_47:
                        }
                          [a1[14] addObject:v23];
                      }
                    }
                  }
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v88 count:16];
                }
                while (v20);
              }
              ++v16;
            }
            while (v16 != v59);
            uint64_t v25 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
            uint64_t v15 = v25;
          }
          while (v25);
        }
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v26 = a1[6];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v87 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v69;
          while (2)
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v69 != v28) {
                objc_enumerationMutation(v26);
              }
              v30 = *(void **)(*((void *)&v68 + 1) + 8 * j);
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]((uint64_t)a1, v30, a2)|| -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]((uint64_t)a1, v30, a2))
              {
                uint64_t v51 = [objc_alloc(NSNumber) initWithBool:1];
                goto LABEL_100;
              }
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v87 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v31 = a1[7];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v64 objects:v86 count:16];
        if (v32)
        {
          uint64_t v53 = v32;
          id v33 = *(id *)v65;
          uint64_t v34 = &__block_literal_global_15;
          id obja = *(id *)v65;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(id *)v65 != v33) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v64 + 1) + 8 * v35);
              if (v36) {
                uint64_t v37 = v36[4];
              }
              else {
                uint64_t v37 = 0;
              }
              uint64_t v38 = [*(id *)(*((void *)&v64 + 1) + 8 * v35) sourceEntity];
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              uint64_t v58 = v35;
              v39 = v34;
              if (v38) {
                uint64_t v40 = -[NSSQLEntity entitySpecificPropertiesPassing:](v38, (uint64_t)v34);
              }
              else {
                uint64_t v40 = 0;
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v85 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v61;
                v52 = v31;
                do
                {
                  uint64_t v43 = 0;
                  do
                  {
                    if (*(void *)v61 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v44 = *(unsigned char **)(*((void *)&v60 + 1) + 8 * v43);
                    if (!-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v37, objc_msgSend((id)objc_msgSend(v44, "propertyDescription", v52), "renamingIdentifier")))
                    {
                      if (a2) {
                        v45 = *(void **)(a2 + 32);
                      }
                      else {
                        v45 = 0;
                      }
                      int v46 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "sqlCore"), "options"), "objectForKey:", @"NSPersistentStoreDeferredLightweightMigrationOptionKey"), "BOOLValue") ^ 1;
                      if (!v44) {
                        LOBYTE(v46) = 1;
                      }
                      if ((v46 & 1) != 0 || v44[24] != 1) {
                        goto LABEL_121;
                      }
                      id v47 = a1[22];
                      v84 = v44;
                      objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v84, 1));
                    }
                    ++v43;
                  }
                  while (v41 != v43);
                  uint64_t v48 = [v40 countByEnumeratingWithState:&v60 objects:v85 count:16];
                  uint64_t v41 = v48;
                  id v31 = v52;
                }
                while (v48);
              }
              uint64_t v34 = v39;
              id v33 = obja;
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]((uint64_t)a1, v36, a2)|| -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]((uint64_t)a1, v36, a2))
              {
LABEL_121:
                uint64_t v51 = [objc_alloc(NSNumber) initWithBool:1];
                goto LABEL_100;
              }
              uint64_t v35 = v58 + 1;
            }
            while (v58 + 1 != v53);
            uint64_t v49 = [v31 countByEnumeratingWithState:&v64 objects:v86 count:16];
            char v50 = 1;
            uint64_t v53 = v49;
          }
          while (v49);
        }
        else
        {
          char v50 = 1;
        }
        goto LABEL_101;
      }
    }
    uint64_t v51 = [objc_alloc(NSNumber) initWithBool:1];
  }
  else
  {
    uint64_t v51 = [objc_alloc(NSNumber) initWithBool:1];
  }
LABEL_100:
  char v50 = 0;
  a1[13] = (id)v51;
LABEL_101:
  if (([a1[13] BOOLValue] & 1) != 0
    || ![a1[19] count]
    && ![a1[14] count]
    && ![a1[15] count]
    && ![a1[16] count]
    && ![a1[21] count]
    && ![a1[18] count]
    && ![a1[20] count]
    && ![a1[22] count])
  {

    a1[19] = 0;
    a1[14] = 0;

    a1[15] = 0;
    a1[16] = 0;

    a1[21] = 0;
    a1[18] = 0;

    a1[20] = 0;
    a1[22] = 0;
  }
  if ((v50 & 1) != 0 && !a1[13]) {
    a1[13] = (id)[objc_alloc(NSNumber) initWithBool:0];
  }
}

- (id)_sourceRootEntity
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id result = *(id *)(a1 + 16);
  if (!result)
  {
    id v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend(*(id *)(a1 + 8), "name")), "sourceEntity");
    if (!v3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v4 = *(void **)(a1 + 64);
      id v3 = (void *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3)
      {
        uint64_t v5 = (uint64_t)v3;
        uint64_t v6 = *(void *)v9;
LABEL_7:
        uint64_t v7 = 0;
        while (1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          id v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7)), "sourceEntity");
          if (v3) {
            break;
          }
          if (v5 == ++v7)
          {
            uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
            id v3 = 0;
            if (v5) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
    id result = (id)[v3 rootEntity];
    *(void *)(a1 + 16) = result;
  }
  return result;
}

- (uint64_t)_ownSourceRootTableNeedsRenameInMigrationContext:(uint64_t)a1
{
  if (*(_DWORD *)(a1 + 24) < 2u) {
    return 0;
  }
  id v4 = *(void **)(a1 + 104);
  if (!v4)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a2);
    id v4 = *(void **)(a1 + 104);
  }

  return [v4 BOOLValue];
}

- (void)_sourceRootTableNameInMigrationContext:(uint64_t)a1
{
  do
  {
    if (!a1) {
      return 0;
    }
    uint64_t v3 = a1;
    id v4 = -[_NSSQLTableMigrationDescription _sourceRootEntity](a1);
    a1 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v4);
  }
  while (a1 != v3);
  uint64_t v5 = [v4 tableName];
  if (!-[_NSSQLTableMigrationDescription _ownSourceRootTableNeedsRenameInMigrationContext:](v3, a2)) {
    return (void *)v5;
  }

  return -[_NSSQLTableMigrationDescription _tempNameForTableName:](v3, v5);
}

- (void)_tempNameForTableName:(uint64_t)a1
{
  id v4 = (void *)[*(id *)(a1 + 96) objectForKey:a2];
  if (!v4)
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"_T_%@", a2];
    [*(id *)(a1 + 96) setObject:v4 forKey:a2];
  }
  return v4;
}

- (uint64_t)appendStatementsToRenameTables:(uint64_t)a3 migrationContext:
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if (a3) {
      v103 = *(NSSQLiteStatement **)(a3 + 32);
    }
    else {
      v103 = 0;
    }
    id v6 = -[_NSSQLTableMigrationDescription _sourceRootEntity](result);
    uint64_t v99 = v5;
    if (-[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a3, v6) == v5)
    {
      if (-[_NSSQLTableMigrationDescription _ownSourceRootTableNeedsRenameInMigrationContext:](v5, a3))
      {
        uint64_t v47 = [-[_NSSQLTableMigrationDescription _sourceRootEntity](v5) tableName];
        uint64_t v48 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](v5, v47);
        uint64_t v49 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, v47, (uint64_t)v48);
        [a2 addObject:v49];

        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        char v50 = *(void **)(v5 + 56);
        uint64_t v51 = [v50 countByEnumeratingWithState:&v132 objects:v148 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v133;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v133 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * i), "sourceEntity"), "rootEntity");
              if (([v55 isEqual:-[_NSSQLTableMigrationDescription _sourceRootEntity](v5)] & 1) == 0)
              {
                uint64_t v95 = *MEMORY[0x1E4F1C3B8];
                v96 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Cannot merge multiple root entity source tables into one destination entity root table", @"message", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend((id)objc_msgSend(v55, "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity](v5), "entityDescription"), "name"), 0), @"sourceRootEntities", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "entityDescription"), "name"), @"destinationRootEntity", 0);
                id v97 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v95, 134190, @"Cannot merge multiple root entity source tables into one destination entity root table", v96);
                objc_exception_throw(v97);
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v132 objects:v148 count:16];
          }
          while (v52);
        }
      }
      else
      {
        if ([*(id *)(v5 + 176) count])
        {
          uint64_t v102 = a3;
          uint64_t v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "stringByReplacingOccurrencesOfString:withString:", @"-", &stru_1ED787880);
          id v57 = -[_NSSQLTableMigrationDescription _sourceRootEntity](v5);
          uint64_t v58 = [v57 tableName];
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id obja = *(id *)(v5 + 176);
          uint64_t v59 = [obja countByEnumeratingWithState:&v128 objects:v147 count:16];
          if (v59)
          {
            uint64_t v60 = v59;
            uint64_t v61 = *(void *)v129;
            do
            {
              for (uint64_t j = 0; j != v60; ++j)
              {
                if (*(void *)v129 != v61) {
                  objc_enumerationMutation(obja);
                }
                long long v63 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO _DEFERRED_%@__%@", v58, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * j), "firstObject"), "columnName"), v56, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * j), "firstObject"), "columnName")];
                long long v64 = [[NSSQLiteStatement alloc] initWithEntity:v57 sqlString:v63];

                [a2 addObject:v64];
              }
              uint64_t v60 = [obja countByEnumeratingWithState:&v128 objects:v147 count:16];
            }
            while (v60);
          }
          uint64_t v5 = v99;
          if (v102) {
            *(unsigned char *)(v102 + 217) = 1;
          }
        }
        long long v65 = *(void **)(v5 + 120);
        if (v65)
        {
          if ([v65 count])
          {
            long long v126 = 0u;
            long long v127 = 0u;
            long long v124 = 0u;
            long long v125 = 0u;
            long long v66 = *(void **)(v5 + 120);
            uint64_t v67 = [v66 countByEnumeratingWithState:&v124 objects:v146 count:16];
            if (v67)
            {
              uint64_t v68 = v67;
              uint64_t v69 = *(void *)v125;
              do
              {
                for (uint64_t k = 0; k != v68; ++k)
                {
                  if (*(void *)v125 != v69) {
                    objc_enumerationMutation(v66);
                  }
                  long long v71 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 0), "tableName"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 1), "tableName"));
                  [a2 addObject:v71];
                }
                uint64_t v68 = [v66 countByEnumeratingWithState:&v124 objects:v146 count:16];
              }
              while (v68);
            }
          }
        }
        long long v72 = *(void **)(v5 + 128);
        if (v72)
        {
          if ([v72 count])
          {
            long long v73 = (void *)[(id)v99 rootEntity];
            uint64_t v74 = [v73 tableName];
            long long v75 = objc_msgSend((id)objc_msgSend(*(id *)(v99 + 128), "sortedArrayUsingDescriptors:", MEMORY[0x1E4F1CBF0]), "sortedArrayUsingComparator:", &__block_literal_global_20);
            long long v120 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            id objb = v75;
            uint64_t v76 = [v75 countByEnumeratingWithState:&v120 objects:v145 count:16];
            if (v76)
            {
              uint64_t v77 = v76;
              uint64_t v78 = *(void *)v121;
              do
              {
                for (uint64_t m = 0; m != v77; ++m)
                {
                  if (*(void *)v121 != v78) {
                    objc_enumerationMutation(objb);
                  }
                  long long v80 = *(void **)(*((void *)&v120 + 1) + 8 * m);
                  long long v81 = (void *)[v80 firstObject];
                  long long v82 = (void *)[v80 lastObject];
                  if ([v81 propertyType] == 3)
                  {
                    long long v83 = -[NSSQLiteAdapter newDropIndexStatementForColumn:](v103, v81);
                    [a2 addObject:v83];
                  }
                  v84 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", v74, objc_msgSend(v81, "columnName"), objc_msgSend(v82, "columnName")];
                  v85 = [[NSSQLiteStatement alloc] initWithEntity:v73 sqlString:v84];

                  [a2 addObject:v85];
                }
                uint64_t v77 = [objb countByEnumeratingWithState:&v120 objects:v145 count:16];
              }
              while (v77);
            }
          }
        }
        uint64_t v5 = v99;
        v86 = *(void **)(v99 + 112);
        if (v86)
        {
          if ([v86 count])
          {
            v87 = (void *)[(id)v99 rootEntity];
            uint64_t v88 = [v87 tableName];
            long long v116 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id objc = *(id *)(v99 + 112);
            uint64_t v89 = [objc countByEnumeratingWithState:&v116 objects:v144 count:16];
            if (v89)
            {
              uint64_t v90 = v89;
              uint64_t v91 = *(void *)v117;
              do
              {
                for (uint64_t n = 0; n != v90; ++n)
                {
                  if (*(void *)v117 != v91) {
                    objc_enumerationMutation(objc);
                  }
                  v93 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@", v88, objc_msgSend(*(id *)(*((void *)&v116 + 1) + 8 * n), "columnName"), NSSQLiteAdapter_typeStringForSQLType(objc_msgSend(*(id *)(*((void *)&v116 + 1)+ 8 * n), "sqlType"))];
                  v94 = [[NSSQLiteStatement alloc] initWithEntity:v87 sqlString:v93];

                  [a2 addObject:v94];
                }
                uint64_t v90 = [objc countByEnumeratingWithState:&v116 objects:v144 count:16];
                uint64_t v5 = v99;
              }
              while (v90);
            }
          }
        }
      }
    }
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v7 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](v5);
    id result = [v7 countByEnumeratingWithState:&v112 objects:v143 count:16];
    if (result)
    {
      uint64_t v8 = result;
      long long v9 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
      uint64_t v10 = *(void *)v113;
      uint64_t v101 = *(void *)v113;
      v98 = v7;
      do
      {
        id v11 = 0;
        uint64_t v100 = v8;
        do
        {
          if (*(void *)v113 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(__CFString **)(*((void *)&v112 + 1) + 8 * (void)v11);
          if (v12 && *(void **)((char *)&v12->isa + v9[163]))
          {
            obuint64_t j = v11;
            uint64_t v13 = (unsigned char *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](objc_msgSend((id)objc_msgSend(*(id *)(v5 + 64), "objectForKey:", objc_msgSend((id)-[__CFString entity](v12, "entity"), "name")), "sourceEntity"), objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "renamingIdentifier"));
            uint64_t v14 = v13;
            if (v13)
            {
              if (v13[24] == 9)
              {
                int v15 = objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "isOrdered");
                if (v15 == objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "isOrdered"))
                {
                  int v16 = 0;
                }
                else if (objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "isOrdered"))
                {
                  int v16 = objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "isOrdered");
                }
                else
                {
                  int v16 = 1;
                }
                length = (void *)v12[1].length;
                if (length)
                {
                  int v18 = objc_msgSend((id)objc_msgSend(length, "propertyDescription"), "isOrdered");
                  int v19 = v18;
                  uint64_t v20 = (void *)*((void *)v14 + 7);
                  if (v20) {
                    goto LABEL_24;
                  }
                  if ((v18 & 1) == 0)
                  {
LABEL_34:
                    LODWORD(length) = 0;
                    goto LABEL_35;
                  }
LABEL_25:
                  uint64_t v21 = (void *)v12[1].length;
                  if (v21 && objc_msgSend((id)objc_msgSend(v21, "propertyDescription"), "isOrdered"))
                  {
                    length = (void *)*((void *)v14 + 7);
                    if (length) {
                      LODWORD(length) = objc_msgSend((id)objc_msgSend(length, "propertyDescription"), "isOrdered");
                    }
                    goto LABEL_35;
                  }
                  goto LABEL_36;
                }
                int v19 = 0;
                uint64_t v20 = (void *)*((void *)v14 + 7);
                if (v20)
                {
LABEL_24:
                  if (v19 == objc_msgSend((id)objc_msgSend(v20, "propertyDescription"), "isOrdered")) {
                    goto LABEL_34;
                  }
                  goto LABEL_25;
                }
LABEL_35:
                if ((v16 | length))
                {
LABEL_36:
                  uint64_t v22 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](v5, [v14 correlationTableName]);
                  uint64_t v23 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, [v14 correlationTableName], (uint64_t)v22);
                  [a2 addObject:v23];
                }
                else
                {
                  if ((objc_msgSend((id)objc_msgSend(v14, "correlationTableName"), "isEqualToString:", -[__CFString correlationTableName](v12, "correlationTableName")) & 1) == 0)
                  {
                    int v24 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, [v14 correlationTableName], -[__CFString correlationTableName](v12, "correlationTableName"));
                    [a2 addObject:v24];
                  }
                  char v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "renamingIdentifier"));
                  id v26 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
                  v142[0] = [(__CFString *)v12 columnName];
                  if (v25) {
                    uint64_t v27 = (__CFString *)[v14 columnName];
                  }
                  else {
                    uint64_t v27 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v14);
                  }
                  v142[1] = v27;
                  objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v142, 2));
                  v141[0] = -[NSSQLManyToMany inverseColumnName](v12);
                  if (v25) {
                    uint64_t v28 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v14);
                  }
                  else {
                    uint64_t v28 = (__CFString *)[v14 columnName];
                  }
                  v141[1] = v28;
                  objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v141, 2));
                  if (v12[2].data)
                  {
                    if (*((void *)v14 + 10))
                    {
                      v140[0] = v12[2].data;
                      if (v25)
                      {
                        uint64_t v29 = (__CFString *)*((void *)v14 + 10);
                        if (!v29) {
                          uint64_t v29 = (__CFString *)[v14 columnName];
                        }
                      }
                      else
                      {
                        uint64_t v29 = -[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14);
                        if (!v29) {
                          uint64_t v29 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v14);
                        }
                      }
                      v140[1] = v29;
                      v30 = v140;
                    }
                    else
                    {
                      v139[0] = v12[2].data;
                      v139[1] = &stru_1ED787880;
                      v30 = v139;
                    }
                    objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2));
                  }
                  id v31 = -[NSSQLManyToMany inverseOrderColumnName](v12);
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    if (-[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14))
                    {
                      v138[0] = v32;
                      if (v25)
                      {
                        id v33 = -[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14);
                        if (!v33) {
                          id v33 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v14);
                        }
                      }
                      else
                      {
                        id v33 = (__CFString *)*((void *)v14 + 10);
                        if (!v33) {
                          id v33 = (__CFString *)[v14 columnName];
                        }
                      }
                      v138[1] = v33;
                      uint64_t v34 = v138;
                    }
                    else
                    {
                      v137[0] = v32;
                      v137[1] = &stru_1ED787880;
                      uint64_t v34 = v137;
                    }
                    objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 2));
                  }
                  uint64_t v35 = (void *)[v26 sortedArrayUsingComparator:&__block_literal_global_63];
                  long long v108 = 0u;
                  long long v109 = 0u;
                  long long v110 = 0u;
                  long long v111 = 0u;
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v108 objects:v136 count:16];
                  if (v36)
                  {
                    uint64_t v37 = v36;
                    uint64_t v38 = *(void *)v109;
                    do
                    {
                      for (iuint64_t i = 0; ii != v37; ++ii)
                      {
                        if (*(void *)v109 != v38) {
                          objc_enumerationMutation(v35);
                        }
                        uint64_t v40 = *(void **)(*((void *)&v108 + 1) + 8 * ii);
                        if ((objc_msgSend((id)objc_msgSend(v40, "lastObject"), "isEqualToString:", objc_msgSend(v40, "firstObject")) & 1) == 0)
                        {
                          uint64_t v41 = objc_msgSend((id)objc_msgSend(v40, "lastObject"), "length");
                          id v42 = [NSString alloc];
                          uint64_t v43 = [(__CFString *)v12 correlationTableName];
                          if (v41) {
                            uint64_t v44 = [v42 initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", v43, objc_msgSend(v40, "lastObject"), objc_msgSend(v40, "firstObject")];
                          }
                          else {
                            uint64_t v44 = [v42 initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@", v43, objc_msgSend(v40, "firstObject"), @"INTEGER"];
                          }
                          v45 = (void *)v44;
                          int v46 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v44];

                          [a2 addObject:v46];
                        }
                      }
                      uint64_t v37 = [v35 countByEnumeratingWithState:&v108 objects:v136 count:16];
                    }
                    while (v37);
                  }
                  uint64_t v5 = v99;
                  [*(id *)(v99 + 136) addObject:v12];
                  uint64_t v7 = v98;
                  uint64_t v8 = v100;
                  long long v9 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
                }
                uint64_t v10 = v101;
                id v11 = obj;
                goto LABEL_79;
              }
              if (([v13 isToMany] & 1) == 0 && v14[24] != 7) {
LABEL_133:
              }
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Unrecognized source property type for many-to-many migration", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v14, @"sourceRelationship")));
            }
            else if (([0 isToMany] & 1) == 0)
            {
              goto LABEL_133;
            }
          }
LABEL_79:
          id v11 = (char *)v11 + 1;
        }
        while (v11 != (id)v8);
        id result = [v7 countByEnumeratingWithState:&v112 objects:v143 count:16];
        uint64_t v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_transformedManyToManys
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 24) < 2u) {
    return 0;
  }
  if (!*(void *)(a1 + 88))
  {
    *(void *)(a1 + 88) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = *(void **)(a1 + 48);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 88) addObjectsFromArray:-[_NSSQLEntityMigrationDescription transformedManyToManys](*(void *)(*((void *)&v17 + 1) + 8 * i))];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = *(void **)(a1 + 56);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 88) addObjectsFromArray:-[_NSSQLEntityMigrationDescription transformedManyToManys](*(void *)(*((void *)&v13 + 1) + 8 * j))];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
  return *(void *)(a1 + 88);
}

- (uint64_t)appendStatementsToCreateOrDropTables:(uint64_t)a3 migrationContext:
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v5 = result;
    if (a3) {
      uint64_t v6 = *(NSSQLiteStatement **)(a3 + 32);
    }
    else {
      uint64_t v6 = 0;
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    if (*(_DWORD *)(result + 24))
    {
      if (!*(void *)(result + 80))
      {
        *(void *)(result + 80) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        obuint64_t j = *(id *)(v5 + 40);
        uint64_t v67 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (v67)
        {
          uint64_t v65 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v67; ++i)
            {
              if (*(void *)v90 != v65) {
                objc_enumerationMutation(obj);
              }
              uint64_t v8 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * i) sourceEntity];
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              uint64_t v9 = (void *)[v8 manyToManyRelationships];
              uint64_t v10 = [v9 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v10)
              {
                uint64_t v11 = v10;
                uint64_t v12 = *(void *)v86;
                do
                {
                  for (uint64_t j = 0; j != v11; ++j)
                  {
                    if (*(void *)v86 != v12) {
                      objc_enumerationMutation(v9);
                    }
                    uint64_t v14 = *(void *)(*((void *)&v85 + 1) + 8 * j);
                    if (v14
                      && *(void *)(v14 + 64)
                      && (void *)[*(id *)(*((void *)&v85 + 1) + 8 * j) entity] == v8)
                    {
                      [*(id *)(v5 + 80) addObject:v14];
                    }
                  }
                  uint64_t v11 = [v9 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }
                while (v11);
              }
            }
            uint64_t v67 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
          }
          while (v67);
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v15 = *(void **)(v5 + 56);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v96 count:16];
        uint64_t v4 = a2;
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v82;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v82 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(v5 + 80) addObjectsFromArray:-[_NSSQLEntityMigrationDescription removedManyToManys](*(void *)(*((void *)&v81 + 1) + 8 * k))];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v96 count:16];
          }
          while (v17);
        }
      }
      long long v20 = *(void **)(v5 + 80);
      uint64_t v3 = a3;
    }
    else
    {
      long long v20 = 0;
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v95 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v78;
      do
      {
        for (uint64_t m = 0; m != v22; ++m)
        {
          if (*(void *)v78 != v23) {
            objc_enumerationMutation(v20);
          }
          char v25 = *(void **)(*((void *)&v77 + 1) + 8 * m);
          if (v25 && v25[8])
          {
            id v26 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v6, [v25 correlationTableName]);
            [v4 addObject:v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v77 objects:v95 count:16];
      }
      while (v22);
    }
    uint64_t v27 = *(void **)(v5 + 104);
    if (!v27)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v5, v3);
      uint64_t v27 = *(void **)(v5 + 104);
    }
    int v28 = [v27 BOOLValue];
    int v29 = *(_DWORD *)(v5 + 24);
    if (v29 == 1) {
      int v30 = 0;
    }
    else {
      int v30 = v28;
    }
    if (!v29 || v30)
    {
      id v31 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((__CFString *)v6, *(void **)(v5 + 8));
      [v4 addObject:v31];

      int v29 = *(_DWORD *)(v5 + 24);
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    if (v29 == 1)
    {
      uint64_t v32 = 0;
    }
    else
    {
      if (!*(void *)(v5 + 72))
      {
        uint64_t v61 = v4;
        *(void *)(v5 + 72) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id obja = *(id *)(v5 + 32);
        uint64_t v68 = [obja countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (v68)
        {
          uint64_t v66 = *(void *)v90;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v90 != v66) {
                objc_enumerationMutation(obja);
              }
              uint64_t v34 = *(void *)(*((void *)&v89 + 1) + 8 * v33);
              if (v34) {
                uint64_t v35 = *(void **)(v34 + 32);
              }
              else {
                uint64_t v35 = 0;
              }
              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              uint64_t v36 = (void *)[v35 manyToManyRelationships];
              uint64_t v37 = [v36 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v86;
                do
                {
                  for (uint64_t n = 0; n != v38; ++n)
                  {
                    if (*(void *)v86 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v41 = *(void *)(*((void *)&v85 + 1) + 8 * n);
                    if (v41
                      && *(void *)(v41 + 64)
                      && (void *)[*(id *)(*((void *)&v85 + 1) + 8 * n) entity] == v35)
                    {
                      [*(id *)(v5 + 72) addObject:v41];
                    }
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }
                while (v38);
              }
              ++v33;
            }
            while (v33 != v68);
            uint64_t v42 = [obja countByEnumeratingWithState:&v89 objects:v98 count:16];
            uint64_t v68 = v42;
          }
          while (v42);
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        uint64_t v43 = *(void **)(v5 + 56);
        uint64_t v44 = [v43 countByEnumeratingWithState:&v81 objects:v96 count:16];
        uint64_t v4 = v61;
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v82;
          do
          {
            for (iuint64_t i = 0; ii != v45; ++ii)
            {
              if (*(void *)v82 != v46) {
                objc_enumerationMutation(v43);
              }
              [*(id *)(v5 + 72) addObjectsFromArray:-[_NSSQLEntityMigrationDescription addedManyToManys](*(void *)(*((void *)&v81 + 1) + 8 * ii))];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v81 objects:v96 count:16];
          }
          while (v45);
        }
      }
      uint64_t v32 = *(void **)(v5 + 72);
    }
    uint64_t v48 = [v32 countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v74;
      do
      {
        for (juint64_t j = 0; jj != v49; ++jj)
        {
          if (*(void *)v74 != v50) {
            objc_enumerationMutation(v32);
          }
          uint64_t v52 = *(__CFString **)(*((void *)&v73 + 1) + 8 * jj);
          if (v52 && v52[2].isa)
          {
            uint64_t v53 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v52);
            [v4 addObject:v53];
          }
        }
        uint64_t v49 = [v32 countByEnumeratingWithState:&v73 objects:v94 count:16];
      }
      while (v49);
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    char v54 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](v5);
    id result = [v54 countByEnumeratingWithState:&v69 objects:v93 count:16];
    if (result)
    {
      uint64_t v55 = result;
      uint64_t v56 = *(void *)v70;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v70 != v56) {
            objc_enumerationMutation(v54);
          }
          uint64_t v58 = *(__CFString **)(*((void *)&v69 + 1) + 8 * v57);
          if (v58
            && v58[2].isa
            && ([*(id *)(v5 + 136) containsObject:*(void *)(*((void *)&v69 + 1) + 8 * v57)] & 1) == 0)
          {
            uint64_t v59 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v58);
            [v4 addObject:v59];
          }
          ++v57;
        }
        while (v55 != v57);
        id result = [v54 countByEnumeratingWithState:&v69 objects:v93 count:16];
        uint64_t v55 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)appendStatementsToPerformMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v3 = *(_DWORD *)(a1 + 24);
  if (!v3) {
    return;
  }
  uint64_t v4 = (NSSQLiteStatement *)a3;
  if (v3 == 1)
  {
    if (a3) {
      uint64_t v4 = *(NSSQLiteStatement **)(a3 + 32);
    }
    long long v69 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v4, [*(id *)(a1 + 8) tableName]);
    objc_msgSend(a2, "addObject:");

    return;
  }
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v64 = v5;
  if ([*(id *)(a1 + 40) count])
  {
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"DELETE FROM "];
    objc_msgSend(v7, "appendString:", objc_msgSend(*(id *)(a1 + 8), "tableName"));
    [v7 appendString:@" WHERE "];
    [v7 appendString:@"Z_ENT"];
    objc_msgSend(v7, "appendString:", @" IN (");
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v91;
      char v10 = 1;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v91 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v90 + 1) + 8 * v11) sourceEntity];
          if (v12) {
            uint64_t v13 = *(unsigned int *)(v12 + 184);
          }
          else {
            uint64_t v13 = 0;
          }
          if (v10) {
            uint64_t v14 = @"%d";
          }
          else {
            uint64_t v14 = @",%d";
          }
          objc_msgSend(v7, "appendFormat:", v14, v13);
          char v10 = 0;
          ++v11;
        }
        while (v8 != v11);
        uint64_t v15 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
        uint64_t v8 = v15;
        char v10 = 0;
      }
      while (v15);
    }
    id v5 = v64;
    [v7 appendString:@""]);
    if (v4) {
      uint64_t sqlString = (uint64_t)v4->_sqlString;
    }
    else {
      uint64_t sqlString = 0;
    }
    uint64_t v17 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](sqlString, (uint64_t)v7);

    [v67 addObject:v17];
  }
  uint64_t v18 = *(void **)(a1 + 104);
  if (!v18)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, (uint64_t)v4);
    uint64_t v18 = *(void **)(a1 + 104);
  }
  if ([v18 BOOLValue])
  {
    if ([*(id *)(a1 + 56) count])
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v19 = *(void **)(a1 + 56);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v86 objects:v98 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v87 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            int v24 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:](a1, v23, (uint64_t)v4);
            [v67 addObject:v24];

            id v25 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:]((uint64_t)v23, (uint64_t)v4);
            if (v25)
            {
              [v5 addObjectsFromArray:v25];
            }
            while (1)
            {
              id v26 = (void *)-[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:]((uint64_t)v23, (uint64_t)v4);
              if (!v26) {
                break;
              }
              [v6 addObject:v26];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v86 objects:v98 count:16];
        }
        while (v20);
      }
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v27 = *(void **)(a1 + 48);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v82 objects:v97 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v83 != v29) {
            objc_enumerationMutation(v27);
          }
          id v31 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:](a1, *(void **)(*((void *)&v82 + 1) + 8 * j), (uint64_t)v4);
          [v67 addObject:v31];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v82 objects:v97 count:16];
        id v5 = v64;
      }
      while (v28);
    }
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v32 = *(void **)(a1 + 48);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v78 objects:v96 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v79 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v78 + 1) + 8 * k);
          if (v36 && !*(void *)(v36 + 16)) {
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](*(void *)(*((void *)&v78 + 1) + 8 * k), (uint64_t)v4);
          }
          id v37 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:](v36, (uint64_t)v4);
          if (v37)
          {
            [v64 addObjectsFromArray:v37];
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v78 objects:v96 count:16];
      }
      while (v33);
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v38 = *(void **)(a1 + 56);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v74 objects:v95 count:16];
    id v5 = v64;
    if (v39)
    {
      uint64_t v40 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void *)(*((void *)&v74 + 1) + 8 * m);
          if (v42 && !*(void *)(v42 + 16)) {
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](*(void *)(*((void *)&v74 + 1) + 8 * m), (uint64_t)v4);
          }
          id v43 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:](v42, (uint64_t)v4);
          if (v43)
          {
            [v64 addObjectsFromArray:v43];
          }
          while (1)
          {
            uint64_t v44 = (void *)-[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:](v42, (uint64_t)v4);
            if (!v44) {
              break;
            }
            [v6 addObject:v44];
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v74 objects:v95 count:16];
      }
      while (v39);
    }
  }
  [a2 addObjectsFromArray:v67];
  [a2 addObjectsFromArray:v5];
  [a2 addObjectsFromArray:v6];

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v45 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](a1);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v70 objects:v94 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v71;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v71 != v47) {
          objc_enumerationMutation(v45);
        }
        uint64_t v49 = *(__CFString **)(*((void *)&v70 + 1) + 8 * v48);
        if (v49 && v49[2].isa)
        {
          uint64_t v50 = (__CFString *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * v48), "entity"), "name")), "sourceEntity"), objc_msgSend((id)-[__CFString propertyDescription](v49, "propertyDescription"), "renamingIdentifier"));
          uint64_t v51 = v50;
          if (v50)
          {
            if (LOBYTE(v50->length) == 9)
            {
              if ([*(id *)(a1 + 136) containsObject:v49]) {
                goto LABEL_95;
              }
              uint64_t v52 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](a1, [(__CFString *)v51 correlationTableName]);
              int v53 = objc_msgSend((id)objc_msgSend((id)-[__CFString propertyDescription](v51, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)-[__CFString propertyDescription](v49, "propertyDescription"), "renamingIdentifier"));
              if (v4) {
                char v54 = (NSSQLiteStatement *)v4->_sqlString;
              }
              else {
                char v54 = 0;
              }
              uint64_t v55 = (uint64_t)-[NSSQLiteAdapter newCopyAndInsertStatementForManyToMany:toManyToMany:intermediateTableName:invertColumns:](v54, v51, v49, (uint64_t)v52, v53 ^ 1u);
              goto LABEL_94;
            }
            if ([(__CFString *)v50 isToMany])
            {
              length = (void *)v51[1].length;
              goto LABEL_91;
            }
            if (LOBYTE(v51->length) != 7) {
              goto LABEL_102;
            }
            uint64_t v59 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](a1, (uint64_t)v4);
            uint64_t v55 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:](v51, v49, (uint64_t)v59, 0, (uint64_t)v4);
          }
          else
          {
            if (([0 isToMany] & 1) == 0)
            {
LABEL_102:
              long long v62 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v51 forKey:@"sourceRelationship"];
              objc_exception_throw((id)[v62 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unrecognized source property type for many-to-many migration" userInfo:v63]);
            }
            length = 0;
LABEL_91:
            uint64_t v57 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:]((uint64_t)v4, (void *)[length entity]);
            uint64_t v58 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](v57, (uint64_t)v4);
            uint64_t v55 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:](length, v49, (uint64_t)v58, 1, (uint64_t)v4);
          }
LABEL_94:
          uint64_t v60 = (void *)v55;
          [a2 addObject:v55];
        }
LABEL_95:
        ++v48;
      }
      while (v46 != v48);
      uint64_t v61 = [v45 countByEnumeratingWithState:&v70 objects:v94 count:16];
      uint64_t v46 = v61;
    }
    while (v61);
  }
}

- (void)createInsertStatementForEntityMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a2) {
    uint64_t v8 = (_DWORD *)a2[4];
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [a2 sourceEntity];
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v63 = a1;
  uint64_t v64 = a3;
  uint64_t v65 = (uint64_t)a2;
  if (v10)
  {
    while (v10)
    {
      uint64_t v11 = v10;
      uint64_t v10 = *(void *)(v10 + 168);
      if (v10 == v11)
      {
        uint64_t v12 = *(void **)(v11 + 72);
        goto LABEL_7;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_7:
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v13 = (void *)[v12 sortedArrayUsingFunction:sortColumnsByType context:0];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v14) {
    goto LABEL_42;
  }
  uint64_t v15 = *(void *)v73;
  while (2)
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v73 != v15) {
        objc_enumerationMutation(v13);
      }
      uint64_t v17 = *(unsigned __int8 **)(*((void *)&v72 + 1) + 8 * v16);
      if (!v17)
      {
LABEL_18:
        uint64_t v20 = [*(id *)(*((void *)&v72 + 1) + 8 * v16) entity];
        if (v8)
        {
          unsigned int v21 = v8[46];
          if (v20)
          {
            if (v21 < *(_DWORD *)(v20 + 184)) {
              goto LABEL_23;
            }
            unsigned int v22 = *(_DWORD *)(v20 + 188);
          }
          else
          {
            unsigned int v22 = 0;
          }
          if (v21 <= v22)
          {
            uint64_t v26 = [v17 columnName];
            if (!v65) {
              goto LABEL_41;
            }
            uint64_t v27 = v26;
            uint64_t v28 = *(void **)(v65 + 16);
            if (!v28)
            {
              -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](v65, v64);
              uint64_t v28 = *(void **)(v65 + 16);
            }
            int v24 = (__CFString *)[v28 objectForKey:v27];
            if (!v24)
            {
LABEL_41:
              int v30 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, @"entity", objc_msgSend(v17, "columnName"), @"column", 0);
              uint64_t v32 = (void *)[v30 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unrecognized column in entity" userInfo:v31];
              if (v32) {
                goto LABEL_51;
              }
              goto LABEL_42;
            }
            objc_msgSend(v6, "addObject:", objc_msgSend(v17, "columnName"));
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v67 addObject:v24];
              int v24 = @"?";
            }
            goto LABEL_24;
          }
        }
LABEL_23:
        objc_msgSend(v6, "addObject:", objc_msgSend(v17, "columnName"));
        uint64_t v23 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, [v17 sqlType], 0);
        [v67 addObject:v23];

        int v24 = @"?";
LABEL_24:
        [v7 addObject:v24];
        goto LABEL_28;
      }
      int v18 = v17[24];
      switch(v18)
      {
        case 6:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * v16), "columnName"));
          long long v19 = &OBJC_IVAR___NSSQLEntity__optLockKey;
          if (!v9) {
            goto LABEL_31;
          }
          break;
        case 5:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * v16), "columnName"));
          long long v19 = &OBJC_IVAR___NSSQLEntity__entityKey;
          if (!v9) {
            goto LABEL_31;
          }
          break;
        case 2:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * v16), "columnName"));
          long long v19 = &OBJC_IVAR___NSSQLEntity__primaryKey;
          if (!v9)
          {
LABEL_31:
            id v25 = 0;
            goto LABEL_27;
          }
          break;
        default:
          goto LABEL_18;
      }
      id v25 = *(void **)(v9 + *v19);
LABEL_27:
      objc_msgSend(v7, "addObject:", objc_msgSend(v25, "columnName"));
LABEL_28:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v29 = [v13 countByEnumeratingWithState:&v72 objects:v77 count:16];
    uint64_t v14 = v29;
    if (v29) {
      continue;
    }
    break;
  }
LABEL_42:
  uint64_t v33 = v8;
  uint64_t v35 = v63;
  uint64_t v34 = v64;
  while (v33)
  {
    uint64_t v36 = v33;
    uint64_t v33 = (_DWORD *)*((void *)v33 + 21);
    if (v33 == v36)
    {
      id v37 = (void *)*((void *)v36 + 9);
      goto LABEL_46;
    }
  }
  id v37 = 0;
LABEL_46:
  uint64_t v38 = [v37 count];
  if (v38 == [v6 count])
  {
    uint64_t v39 = [v6 count];
    if (v39 != [v7 count])
    {
      uint64_t v40 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:@"entity"];
      uint64_t v42 = *MEMORY[0x1E4F1C3B8];
      id v43 = @"Mismatched columns and values in migration insert statement";
      goto LABEL_50;
    }
    goto LABEL_52;
  }
  uint64_t v40 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:@"entity"];
  uint64_t v42 = *MEMORY[0x1E4F1C3B8];
  id v43 = @"Wrong number of columns in migration insert statement";
LABEL_50:
  uint64_t v32 = (void *)[v40 exceptionWithName:v42 reason:v43 userInfo:v41];
  if (v32)
  {
LABEL_51:
    uint64_t v44 = 0;
  }
  else
  {
LABEL_52:
    uint64_t v62 = [v6 componentsJoinedByString:@","];
    uint64_t v66 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](v63, v64);
    unint64_t v45 = 0x1E4F28000uLL;
    if (v9 && (*(void *)(v9 + 160) || (uint64_t v56 = *(void **)(v9 + 152)) != 0 && [v56 count]))
    {
      uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
      [v46 appendString:v66];
      [v46 appendString:@"."];
      [v46 appendString:@"Z_ENT"];
      [v46 appendString:@" = "];
      uint64_t v47 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "entityDescription"), "userInfo"), "objectForKey:", @"NSEntityRenamingShouldRebaseKey");
      if (!v47) {
        goto LABEL_70;
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v48 = *(void **)(v9 + 152);
      uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (!v49) {
        goto LABEL_70;
      }
      uint64_t v50 = 0;
      uint64_t v51 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v69 != v51) {
            objc_enumerationMutation(v48);
          }
          if (!v50)
          {
            int v53 = *(unsigned int **)(*((void *)&v68 + 1) + 8 * i);
            int v54 = objc_msgSend((id)objc_msgSend(v53, "name"), "isEqualToString:", v47);
            if (v53) {
              int v55 = v54;
            }
            else {
              int v55 = 0;
            }
            if (v55 == 1) {
              uint64_t v50 = v53[46];
            }
            else {
              uint64_t v50 = 0;
            }
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v49);
      unint64_t v45 = 0x1E4F28000;
      if (!v50) {
LABEL_70:
      }
        uint64_t v50 = *(unsigned int *)(v9 + 184);
      objc_msgSend(v46, "appendFormat:", @"%d", v50);
      uint64_t v35 = v63;
      uint64_t v34 = v64;
    }
    else
    {
      uint64_t v46 = 0;
    }
    uint64_t v57 = [v7 componentsJoinedByString:@","];
    id v58 = v66;
    uint64_t v59 = (void *)[objc_alloc(*(Class *)(v45 + 3704)) initWithString:@"INSERT INTO "];
    objc_msgSend(v59, "appendString:", objc_msgSend(*(id *)(v35 + 8), "tableName"));
    objc_msgSend(v59, "appendString:", @" (");
    [v59 appendString:v62];
    [v59 appendString:@" SELECT "]);
    [v59 appendString:v57];
    [v59 appendString:@" FROM "];
    [v59 appendString:v58];
    if (v46)
    {
      [v59 appendString:v46];
    }
    if (v34) {
      uint64_t v60 = *(void *)(v34 + 32);
    }
    else {
      uint64_t v60 = 0;
    }
    uint64_t v44 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](v60, (uint64_t)v59);
    -[NSSQLiteAdapter _useModel:]((uint64_t)v44, v67);

    uint64_t v32 = 0;
  }

  if (v32)
  {

    objc_exception_throw(v32);
  }
  return v44;
}

- (id)createFEKUpdateStatementsForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v4 = *(void **)(a1 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  if (![v4 count]) {
    return 0;
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v26 = (void *)v5[5];
      goto LABEL_7;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v26 = 0;
LABEL_7:
  uint64_t v6 = [v5 tableName];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * v9);
        uint64_t v11 = (void *)[v4 objectForKey:v10];
        uint64_t v12 = (void *)[v26 objectForKey:v10];
        uint64_t v13 = (void *)[v12 foreignKey];
        if (v12) {
          uint64_t v14 = (void *)v12[9];
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v11);
        if (!v15) {
          goto LABEL_19;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void **)(v15 + 104);
        if (!v17)
        {
          -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v16, a2);
          uint64_t v17 = *(void **)(v16 + 104);
        }
        if ([v17 BOOLValue]) {
          id v18 = (id)[[NSString alloc] initWithFormat:@"_T_%@", objc_msgSend(v11, "tableName")];
        }
        else {
LABEL_19:
        }
          id v18 = (id)objc_msgSend((id)objc_msgSend(v12, "destinationEntity"), "tableName");
        id v19 = v18;
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE OR FAIL "];
        [v20 appendString:v6];
        [v20 appendString:@" SET "];
        objc_msgSend(v20, "appendString:", objc_msgSend(v14, "columnName"));
        objc_msgSend(v20, "appendString:", @" = (SELECT _EKT.");
        [v20 appendString:@"Z_ENT"];
        [v20 appendString:@" FROM "];
        [v20 appendString:v19];
        [v20 appendString:@" _EKT WHERE "];
        [v20 appendString:v6];
        [v20 appendString:@"."];
        objc_msgSend(v20, "appendString:", objc_msgSend(v13, "columnName"));
        [v20 appendString:@" = _EKT."];
        [v20 appendString:@"Z_PK"];
        [v20 appendString:@""]);
        if (a2) {
          uint64_t v21 = *(void *)(a2 + 32);
        }
        else {
          uint64_t v21 = 0;
        }
        unsigned int v22 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](v21, (uint64_t)v20);

        [v27 addObject:v22];
        ++v9;
      }
      while (v8 != v9);
      uint64_t v23 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v8 = v23;
    }
    while (v23);
  }
  return v27;
}

- (uint64_t)createUpdateStatementForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  int v3 = (void *)a1;
  uint64_t v4 = -[_NSSQLEntityMigrationDescription nextPropertyTransform](a1);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = v3[4];
    uint64_t v7 = [v3 sourceEntity];
    if (v6)
    {
      int v3 = (void *)[*(id *)(v6 + 40) objectForKey:*(void *)(v5 + 16)];
      char v8 = 0;
      goto LABEL_5;
    }
    int v3 = 0;
  }
  else
  {
    uint64_t v7 = [0 sourceEntity];
    uint64_t v6 = 0;
  }
  char v8 = 1;
LABEL_5:
  uint64_t v9 = *(void **)(v5 + 8);
  uint64_t v10 = [v9 expressionType];
  if (v10 != 3)
  {
    if (!v10)
    {
      uint64_t v11 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", [v9 constantValue], objc_msgSend(v3, "sqlType"), 0);
      uint64_t v12 = @"?";
      goto LABEL_12;
    }
    return 0;
  }
  uint64_t v14 = [v9 keyPath];
  if (v8) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = (void *)[*(id *)(v6 + 40) objectForKey:v14];
  }
  uint64_t v12 = (__CFString *)[v15 columnName];
  uint64_t v11 = 0;
LABEL_12:
  if (*(unsigned char *)(v5 + 32))
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@" WHERE %@ is NULL", objc_msgSend(v3, "columnName"), 0];
    if (v8) {
      goto LABEL_23;
    }
    if (!*(void *)(v6 + 160))
    {
      unsigned int v22 = *(void **)(v6 + 152);
      if (!v22 || ![v22 count]) {
        goto LABEL_23;
      }
    }
    if (v16)
    {
      [v16 appendString:@" AND "];
LABEL_20:
      [v16 appendString:@"Z_ENT"];
      [v16 appendString:@" = "];
      if (v7) {
        uint64_t v17 = *(unsigned int *)(v7 + 184);
      }
      else {
        uint64_t v17 = 0;
      }
      objc_msgSend(v16, "appendFormat:", @"%d", v17);
      goto LABEL_23;
    }
LABEL_19:
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
    goto LABEL_20;
  }
  if ((v8 & 1) == 0)
  {
    if (*(void *)(v6 + 160)) {
      goto LABEL_19;
    }
    uint64_t v23 = *(void **)(v6 + 152);
    if (v23)
    {
      if ([v23 count]) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v16 = 0;
LABEL_23:
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE OR FAIL "];
  objc_msgSend(v18, "appendString:", objc_msgSend((id)v6, "tableName"));
  [v18 appendString:@" SET "];
  objc_msgSend(v18, "appendString:", objc_msgSend(v3, "columnName"));
  [v18 appendString:@" = "];
  [v18 appendString:v12];
  if (v16) {
    [v18 appendString:v16];
  }
  if (a2) {
    uint64_t v19 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = -[NSSQLiteAdapter newStatementWithSQLString:](v19, (uint64_t)v18);
  uint64_t v13 = v20;
  if (v11)
  {
    -[NSSQLiteStatement addBindVariable:](v20, v11);
  }
  if (v16) {

  }
  return v13;
}

- (uint64_t)newCopyAndInsertStatementForToOne:(void *)a1 toManyToMany:(__CFString *)a2 fromTableName:(uint64_t)a3 invertColumns:(int)a4 migrationContext:(uint64_t)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT INTO "];
  objc_msgSend(v10, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
  objc_msgSend(v10, "appendString:", @" (");
  if (a2) {
    data = a2[2].data;
  }
  else {
    data = 0;
  }
  uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a2);
  if (a4)
  {
    [v10 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    [v10 appendString:@", "];
    objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
    if (v12)
    {
      [v10 appendString:@", "];
      [v10 appendString:v12];
    }
    uint64_t v13 = (__CFString *)data;
    if (!data) {
      goto LABEL_12;
    }
LABEL_11:
    [v10 appendString:@", "];
    [v10 appendString:v13];
    goto LABEL_12;
  }
  objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
  [v10 appendString:@", "];
  [v10 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
  if (data)
  {
    [v10 appendString:@", "];
    [v10 appendString:data];
  }
  uint64_t v13 = v12;
  if (v12) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v14 = (void *)[a1 entity];
  if (v14) {
    uint64_t v14 = (void *)v14[16];
  }
  uint64_t v15 = [v14 columnName];
  [v10 appendString:@" SELECT "]);
  [v10 appendString:v15];
  [v10 appendString:@", "];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a1, "foreignKey"), "columnName");
  [v10 appendString:v16];
  if (a1) {
    uint64_t v17 = (void *)a1[10];
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [v17 columnName];
  if (data)
  {
    uint64_t v19 = v18;
    [v10 appendString:@", "];
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v15;
    }
    [v10 appendString:v20];
  }
  if (v12) {
    [v10 appendString:@", 2000"];
  }
  [v10 appendString:@" FROM "];
  [v10 appendString:a3];
  [v10 appendString:@" WHERE "];
  [v10 appendString:v16];
  [v10 appendString:@" IS NOT NULL"];
  uint64_t v21 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a5, (void *)[a1 entity]);
  unsigned int v22 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:](v21, [a1 entity]);
  uint64_t v48 = a5;
  if ([v22 count])
  {
    uint64_t v23 = (void *)[a1 entity];
    uint64_t v47 = a1;
    if (v23) {
      uint64_t v23 = (void *)v23[17];
    }
    uint64_t v24 = [v23 columnName];
    [v10 appendString:@" AND "];
    [v10 appendString:v24];
    objc_msgSend(v10, "appendString:", @" NOT IN (");
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v25 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      char v27 = 0;
      uint64_t v28 = *(void *)v54;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(v22);
          }
          uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * v29);
          if (v27) {
            [v10 appendString:@","];
          }
          if (v30) {
            uint64_t v31 = *(unsigned int *)(v30 + 184);
          }
          else {
            uint64_t v31 = 0;
          }
          objc_msgSend(v10, "appendFormat:", @"%d", v31);
          ++v29;
          char v27 = 1;
        }
        while (v26 != v29);
        uint64_t v32 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
        uint64_t v26 = v32;
      }
      while (v32);
    }
    [v10 appendString:@""]);
    a1 = v47;
    a5 = v48;
  }

  if (a1)
  {
    uint64_t v33 = (void *)a1[9];
    if (v33)
    {
      uint64_t v34 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a5, (void *)[a1 destinationEntity]);
      uint64_t v35 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:](v34, [a1 destinationEntity]);
      if ([v35 count])
      {
        [v10 appendString:@" AND "];
        objc_msgSend(v10, "appendString:", objc_msgSend(v33, "columnName"));
        objc_msgSend(v10, "appendString:", @" NOT IN (");
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          char v38 = 0;
          uint64_t v39 = *(void *)v50;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(v35);
              }
              uint64_t v41 = *(void *)(*((void *)&v49 + 1) + 8 * v40);
              if (v38) {
                [v10 appendString:@","];
              }
              if (v41) {
                uint64_t v42 = *(unsigned int *)(v41 + 184);
              }
              else {
                uint64_t v42 = 0;
              }
              objc_msgSend(v10, "appendFormat:", @"%d", v42);
              ++v40;
              char v38 = 1;
            }
            while (v37 != v40);
            uint64_t v43 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
            uint64_t v37 = v43;
          }
          while (v43);
        }
        [v10 appendString:@""]);
        a5 = v48;
      }
    }
  }
  if (a5) {
    uint64_t v44 = *(void *)(a5 + 32);
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v45 = -[NSSQLiteAdapter newStatementWithSQLString:](v44, (uint64_t)v10);

  return v45;
}

- (uint64_t)appendStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(result + 96), "allValues", 0);
    id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if (a3) {
            uint64_t v9 = *(NSSQLiteStatement **)(a3 + 32);
          }
          else {
            uint64_t v9 = 0;
          }
          uint64_t v10 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v9, *(void *)(*((void *)&v11 + 1) + 8 * v8));
          [a2 addObject:v10];

          ++v8;
        }
        while (v6 != v8);
        id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)appendDefaultValueStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1 && *(_DWORD *)(a1 + 24) >= 2u)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = *(void **)(a1 + 104);
    if (!v7)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a3);
      uint64_t v7 = *(void **)(a1 + 104);
    }
    if (([v7 BOOLValue] & 1) == 0)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v8 = *(void **)(a1 + 56);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:](a1, *(void *)(*((void *)&v25 + 1) + 8 * i), a3);
            long long v13 = v12;
            if (v12)
            {
              if ([v12 count]) {
                [v6 addObjectsFromArray:v13];
              }
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v9);
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v14 = *(void **)(a1 + 112);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(unsigned char **)(*((void *)&v21 + 1) + 8 * j);
            if (v18)
            {
              if (v18[24] == 10)
              {
                id v19 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:](a1, objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend((id)objc_msgSend(v18, "entity"), "name")), a3);
                uint64_t v20 = v19;
                if (v19)
                {
                  if ([v19 count]) {
                    [v6 addObjectsFromArray:v20];
                  }
                }
              }
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v15);
      }
      [a2 addObjectsFromArray:v6];
    }
  }
}

- (id)createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v47 = a1;
  id v6 = *(void **)(a1 + 112);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v8 = *(void **)(a1 + 112);
    uint64_t v9 = [*(id *)(v47 + 112) countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          if (!v13
            || *(unsigned char *)(v13 + 24) != 1
            || objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "attributeDescription"), "defaultValue"))
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v10);
    }
    if ([v7 count]) {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v7, "allObjects"));
    }
  }
  long long v14 = *(void **)(v47 + 168);
  if (v14) {
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
  }
  uint64_t v15 = *(void **)(v47 + 144);
  if (v15) {
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v16 = [v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    id v44 = v5;
    uint64_t v45 = *(void *)v49;
    do
    {
      uint64_t v19 = 0;
      uint64_t v42 = v17;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v20 = *(unsigned __int8 **)(*((void *)&v48 + 1) + 8 * v19);
        if (v20)
        {
          int v21 = v20[24];
          if (v21 == 10 || v21 == 1)
          {
            uint64_t v23 = [*(id *)(*((void *)&v48 + 1) + 8 * v19) columnName];
            if (a2)
            {
              uint64_t v24 = v23;
              long long v25 = *(void **)(a2 + 16);
              if (!v25)
              {
                -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](a2, a3);
                long long v25 = *(void **)(a2 + 16);
              }
              uint64_t v26 = [v25 objectForKey:v24];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = objc_msgSend((id)objc_msgSend(v20, "entity"), "rootEntity");
                uint64_t v29 = [(id)v28 tableName];
                uint64_t v30 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"UPDATE %@ SET ", v29];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                uint64_t v32 = [v20 columnName];
                if (isKindOfClass)
                {
                  [v30 appendFormat:@"%@ = ?", v32];
                  uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v27, 0);
                }
                else
                {
                  [v30 appendFormat:@"%@ = %@", v32, v27];
                  uint64_t v33 = 0;
                }
                if (!v28) {
                  goto LABEL_49;
                }
                if (*(void *)(v28 + 160) || (uint64_t v37 = *(void **)(v28 + 152)) != 0 && [v37 count])
                {
                  uint64_t v34 = *(void **)(v28 + 152);
                  if (!v34 || ![v34 count])
                  {
                    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
                    [v35 appendString:v29];
                    [v35 appendString:@"."];
                    [v35 appendString:@"Z_ENT"];
                    [v35 appendString:@" = "];
                    uint64_t v36 = &OBJC_IVAR___NSSQLEntity__entityID;
                    goto LABEL_48;
                  }
                }
                if (*(void *)(v28 + 160) && (char v38 = *(void **)(v28 + 152)) != 0 && [v38 count])
                {
                  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
                  objc_msgSend(v35, "appendFormat:", @"%d", *(unsigned int *)(v28 + 184));
                  [v35 appendString:@" <= "];
                  [v35 appendString:v29];
                  [v35 appendString:@"."];
                  [v35 appendString:@"Z_ENT"];
                  [v35 appendString:@" AND "];
                  [v35 appendString:v29];
                  [v35 appendString:@"."];
                  uint64_t v17 = v42;
                  [v35 appendString:@"Z_ENT"];
                  [v35 appendString:@" <= "];
                  uint64_t v36 = &OBJC_IVAR___NSSQLEntity__subentityMaxID;
LABEL_48:
                  objc_msgSend(v35, "appendFormat:", @"%d", *(unsigned int *)(v28 + *v36));
                }
                else
                {
LABEL_49:
                  uint64_t v35 = 0;
                }
                if ([*(id *)(v47 + 168) containsObject:v20])
                {
                  if (v35) {
                    [v35 appendString:@" AND "];
                  }
                  else {
                    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
                  }
                  [v35 appendFormat:@"%@ IS NULL", objc_msgSend(v20, "columnName")];
                }
                if (v35) {
                  [v30 appendString:v35];
                }

                uint64_t v39 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v30];
                uint64_t v40 = v39;
                if (v33)
                {
                  -[NSSQLiteAdapter _useModel:]((uint64_t)v39, v33);
                }
                [v46 addObject:v40];

                id v5 = v44;
                uint64_t v18 = v45;
              }
            }
          }
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v17);
  }

  return v46;
}

- (void)_retainedRemovedSubEntitiesOfEntity:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) sourceEntity];
      if (v10)
      {
        uint64_t v11 = v10;
        unsigned int v12 = *(_DWORD *)(v10 + 184);
        if (a2)
        {
          if (v12 < *(_DWORD *)(a2 + 184)) {
            goto LABEL_15;
          }
          unsigned int v13 = *(_DWORD *)(a2 + 188);
        }
        else
        {
          unsigned int v13 = 0;
        }
        if (v12 <= v13)
        {
          if (!v7) {
            uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
          }
          [v7 addObject:v11];
        }
      }
LABEL_15:
      ++v9;
    }
    while (v6 != v9);
    uint64_t v14 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    uint64_t v6 = v14;
  }
  while (v14);
  return v7;
}

- (uint64_t)newCloudKitMetadataUpdateStatements:(uint64_t)a1
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 8) tableName];
    _NSCoreDataLog(4, @"Migration: CloudKit tables detected. Adding migration statements for removed table: %@", v4, v5, v6, v7, v8, v9, v3);
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = *(void *)(a1 + 8);
    if (v11) {
      unsigned int v12 = *(void **)(v11 + 152);
    }
    else {
      unsigned int v12 = 0;
    }
    unsigned int v13 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v12, "count") + 1);
    uint64_t v14 = *(void *)(a1 + 8);
    if (v14) {
      uint64_t v15 = *(unsigned int *)(v14 + 184);
    }
    else {
      uint64_t v15 = 0;
    }
    objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v15));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v16 = *(void *)(a1 + 8);
    if (v16) {
      long long v17 = *(void **)(v16 + 152);
    }
    else {
      long long v17 = 0;
    }
    uint64_t v18 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v82;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v82 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v81 + 1) + 8 * v20);
          if (v21) {
            uint64_t v22 = *(unsigned int *)(v21 + 184);
          }
          else {
            uint64_t v22 = 0;
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v22));
          ++v20;
        }
        while (v18 != v20);
        uint64_t v23 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
        uint64_t v18 = v23;
      }
      while (v23);
    }
    uint64_t v24 = [NSSQLiteStatement alloc];
    long long v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"DELETE FROM ANSCKRECORDMETADATA WHERE ZENTITYID IN %@", v13]);
    [v68 addObject:v25];

    goto LABEL_76;
  }
  uint64_t v62 = a1;
  if ([*(id *)(a1 + 56) count])
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v26 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v26)
    {
      uint64_t v64 = *(void *)v78;
      uint64_t v27 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
      do
      {
        uint64_t v28 = 0;
        uint64_t v65 = v26;
        do
        {
          if (*(void *)v78 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v77 + 1) + 8 * v28);
          [v29 validateCloudKitEntityMigration];
          uint64_t v30 = [v29 sourceEntity];
          if (v30)
          {
            int v31 = *(_DWORD *)(v30 + v27[36]);
            if (!v29) {
              goto LABEL_48;
            }
          }
          else
          {
            int v31 = 0;
            if (!v29)
            {
LABEL_48:
              LODWORD(v32) = 0;
              goto LABEL_31;
            }
          }
          uint64_t v32 = v29[4];
          if (v32) {
            LODWORD(v32) = *(_DWORD *)(v32 + v27[36]);
          }
LABEL_31:
          if (v31 != v32)
          {
            uint64_t v33 = NSNumber;
            uint64_t v34 = [v29 sourceEntity];
            if (v34) {
              uint64_t v35 = *(unsigned int *)(v34 + v27[36]);
            }
            else {
              uint64_t v35 = 0;
            }
            v88[0] = [v33 numberWithUnsignedInt:v35];
            if (v29 && (uint64_t v36 = v29[4]) != 0) {
              uint64_t v37 = *(unsigned int *)(v36 + v27[36]);
            }
            else {
              uint64_t v37 = 0;
            }
            v88[1] = [NSNumber numberWithUnsignedInt:v37];
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v88, 2));
          }
          uint64_t v66 = v28;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          char v38 = (void *)-[_NSSQLEntityMigrationDescription removedManyToManys]((uint64_t)v29);
          uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v87 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v74;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v74 != v40) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v42 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                uint64_t v43 = [NSSQLiteStatement alloc];
                id v44 = -[NSSQLiteStatement initWithEntity:sqlString:](v43, "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"DELETE FROM ANSCKMIRROREDRELATIONSHIP WHERE ZCDENTITYNAME = '%@' AND ZRELATIONSHIPNAME = '%@'", objc_msgSend((id)objc_msgSend(v29, "sourceEntity"), "name"), objc_msgSend(v42, "name")]);
                [v68 addObject:v44];
              }
              uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v87 count:16];
            }
            while (v39);
          }
          uint64_t v28 = v66 + 1;
          uint64_t v27 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
        }
        while (v66 + 1 != v65);
        uint64_t v45 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
        uint64_t v26 = v45;
      }
      while (v45);
    }
  }
  if ([*(id *)(v62 + 48) count])
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v46 = *(void **)(v62 + 48);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v86 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v70;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v70 != v48) {
            objc_enumerationMutation(v46);
          }
          long long v50 = *(void **)(*((void *)&v69 + 1) + 8 * v49);
          [v50 validateCloudKitEntityMigration];
          uint64_t v51 = [v50 sourceEntity];
          if (v51)
          {
            int v52 = *(_DWORD *)(v51 + 184);
            if (!v50) {
              goto LABEL_72;
            }
          }
          else
          {
            int v52 = 0;
            if (!v50)
            {
LABEL_72:
              LODWORD(v53) = 0;
              goto LABEL_62;
            }
          }
          uint64_t v53 = v50[4];
          if (v53) {
            LODWORD(v53) = *(_DWORD *)(v53 + 184);
          }
LABEL_62:
          if (v52 != v53)
          {
            long long v54 = NSNumber;
            uint64_t v55 = [v50 sourceEntity];
            if (v55) {
              uint64_t v56 = *(unsigned int *)(v55 + 184);
            }
            else {
              uint64_t v56 = 0;
            }
            v85[0] = [v54 numberWithUnsignedInt:v56];
            if (v50 && (uint64_t v57 = v50[4]) != 0) {
              uint64_t v58 = *(unsigned int *)(v57 + 184);
            }
            else {
              uint64_t v58 = 0;
            }
            v85[1] = [NSNumber numberWithUnsignedInt:v58];
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v85, 2));
          }
          ++v49;
        }
        while (v47 != v49);
        uint64_t v59 = [v46 countByEnumeratingWithState:&v69 objects:v86 count:16];
        uint64_t v47 = v59;
      }
      while (v59);
    }
  }
LABEL_76:
  uint64_t v60 = [v68 copy];

  return v60;
}

- (NSSQLEntity)rootEntity
{
  return self->_rootEntity;
}

@end