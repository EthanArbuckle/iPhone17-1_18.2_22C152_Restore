@interface NSSQLiteStoreMigrator
@end

@implementation NSSQLiteStoreMigrator

id __70___NSSQLiteStoreMigrator_initWithStore_destinationModel_mappingModel___block_invoke(uint64_t a1)
{
  id result = -[NSSQLiteConnection fetchTableNames](*(id *)(*(void *)(a1 + 32) + 48));
  *(void *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

void __37___NSSQLiteStoreMigrator__disconnect__block_invoke(uint64_t a1)
{
}

void __43___NSSQLiteStoreMigrator_performMigration___block_invoke(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v1378 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  v1050 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1140 = v1;
  if (*(unsigned char *)(v1 + 64))
  {
    _NSCoreDataLog(4, @"Beginning lightweight migration on connection", v4, v5, v6, v7, v8, v9, (uint64_t)v1034);
    v1039 = (unsigned char *)(v1 + 65);
    int v16 = *(unsigned __int8 *)(v1 + 64);
    if (!*(unsigned char *)(v1 + 65)) {
      goto LABEL_7;
    }
    if (*(unsigned char *)(v1 + 64)) {
      _NSCoreDataLog(4, @"Increasing SQLite cache size to 117MB", v10, v11, v12, v13, v14, v15, (uint64_t)v1034);
    }
  }
  else
  {
    v1039 = (unsigned char *)(v1 + 65);
    if (!*(unsigned char *)(v1 + 65)) {
      goto LABEL_9;
    }
  }
  -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1 + 32) + 48), @"pragma cache_size = 30000");
  int v16 = *(unsigned __int8 *)(v1 + 64);
LABEL_7:
  if (v16) {
    _NSCoreDataLog(4, @"Beginning creation of schema migration statements", v10, v11, v12, v13, v14, v15, (uint64_t)v1034);
  }
LABEL_9:
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v19 = v18;
  v1042 = (void *)MEMORY[0x18C127630](v17);
  uint64_t v20 = *(void *)(v1 + 32);
  if (!v20)
  {
    id v1049 = 0;
    goto LABEL_313;
  }
  v1040 = (void *)MEMORY[0x18C127630]();
  uint64_t v21 = *(void *)(v20 + 24);
  if (v21) {
    uint64_t v22 = *(void *)(v21 + 32);
  }
  else {
    uint64_t v22 = 0;
  }
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] arrayWithArray:v22];
  long long v1276 = 0u;
  long long v1275 = 0u;
  long long v1274 = 0u;
  long long v1273 = 0u;
  uint64_t v23 = *(void *)(v20 + 16);
  if (v23) {
    v24 = *(void **)(v23 + 32);
  }
  else {
    v24 = 0;
  }
  uint64_t v25 = [v24 countByEnumeratingWithState:&v1273 objects:&v1357 count:16];
  if (v25)
  {
    id v1048 = *(id *)v1274;
    id v1094 = v24;
    do
    {
      uint64_t v1067 = 0;
      id v1045 = (id)v25;
      do
      {
        if (*(id *)v1274 != v1048) {
          objc_enumerationMutation(v24);
        }
        uint64_t v26 = *(void *)(*((void *)&v1273 + 1) + 8 * v1067);
        context = (void *)MEMORY[0x18C127630]();
        v1062 = (void *)[(id)v26 entityDescription];
        v27 = (NSSQLEntity_DerivedAttributesExtension *)-[NSSQLModel _sqlEntityWithRenamingIdentifier:](*(void *)(v20 + 24), (void *)[v1062 renamingIdentifier]);
        v1057 = (void *)[(NSSQLEntity_DerivedAttributesExtension *)v27 entityDescription];
        if (v27)
        {
          int v28 = v26 ? *(_DWORD *)(v26 + 184) : 0;
          if (LODWORD(v27[4]._triggerSQL) != v28)
          {
            objc_msgSend(*(id *)(v20 + 72), "setObject:forKey:", v26, -[NSSQLEntity_DerivedAttributesExtension name](v27, "name"));
            *(unsigned char *)(v20 + 136) = 1;
            long long v1349 = 0u;
            long long v1350 = 0u;
            long long v1351 = 0u;
            long long v1352 = 0u;
            v29 = (void *)[(id)v26 toManyRelationships];
            uint64_t v30 = [v29 countByEnumeratingWithState:&v1349 objects:&v1371 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v1350;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v1350 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v1349 + 1) + 8 * i);
                  if (v33)
                  {
                    v34 = *(unsigned char **)(v33 + 56);
                    if (v34)
                    {
                      if (v34[88])
                      {
                        v35 = (void *)[v34 entity];
                        v36 = objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend(v35, "name"));
                        if (v36)
                        {
                          [v36 addObject:v34];
                        }
                        else
                        {
                          v1034 = 0;
                          v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v34];
                          objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v37, objc_msgSend(v35, "name"));
                        }
                      }
                    }
                  }
                }
                uint64_t v30 = [v29 countByEnumeratingWithState:&v1349 objects:&v1371 count:16];
              }
              while (v30);
            }
            v24 = v1094;
            if (v26)
            {
              v38 = *(void **)(v26 + 152);
              if (v38)
              {
                if ([v38 count])
                {
                  long long v1348 = 0u;
                  long long v1347 = 0u;
                  long long v1346 = 0u;
                  long long v1345 = 0u;
                  uint64_t v39 = [(id)v26 model];
                  v40 = v39 ? *(void **)(v39 + 32) : 0;
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v1345 objects:&v1369 count:16];
                  if (v41)
                  {
                    id v1079 = v40;
                    id v1083 = *(id *)v1346;
                    do
                    {
                      v42 = 0;
                      v1107 = (char *)v41;
                      do
                      {
                        if (*(id *)v1346 != v1083) {
                          objc_enumerationMutation(v40);
                        }
                        v43 = *(void **)(*((void *)&v1345 + 1) + 8 * (void)v42);
                        long long v1341 = 0u;
                        long long v1342 = 0u;
                        long long v1343 = 0u;
                        long long v1344 = 0u;
                        v44 = (void *)[v43 foreignEntityKeyColumns];
                        uint64_t v45 = [v44 countByEnumeratingWithState:&v1341 objects:&v1365 count:16];
                        v1124 = v42;
                        if (v45)
                        {
                          uint64_t v46 = *(void *)v1342;
                          do
                          {
                            for (uint64_t j = 0; j != v45; ++j)
                            {
                              if (*(void *)v1342 != v46) {
                                objc_enumerationMutation(v44);
                              }
                              v48 = *(void **)(*((void *)&v1341 + 1) + 8 * j);
                              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "foreignKey"), "toOneRelationship"), "destinationEntity"), "isEqual:", v26))
                              {
                                v49 = objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend(v43, "name"));
                                if (v49)
                                {
                                  [v49 addObject:v48];
                                }
                                else
                                {
                                  v1034 = 0;
                                  v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v48];
                                  objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v50, objc_msgSend(v43, "name"));
                                }
                              }
                            }
                            uint64_t v45 = [v44 countByEnumeratingWithState:&v1341 objects:&v1365 count:16];
                          }
                          while (v45);
                        }
                        v42 = v1124 + 1;
                        v24 = v1094;
                        v40 = v1079;
                      }
                      while (v1124 + 1 != v1107);
                      uint64_t v41 = [v1079 countByEnumeratingWithState:&v1345 objects:&v1369 count:16];
                    }
                    while (v41);
                  }
                }
              }
            }
            long long v1280 = 0u;
            long long v1279 = 0u;
            long long v1278 = 0u;
            long long v1277 = 0u;
            v51 = (void *)[(id)v26 manyToManyRelationships];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v1277 objects:&v1361 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v1278;
              do
              {
                for (uint64_t k = 0; k != v52; ++k)
                {
                  if (*(void *)v1278 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v1277 + 1) + 8 * k);
                  v56 = objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend((id)v26, "name"));
                  if (v56)
                  {
                    [v56 addObject:v55];
                  }
                  else
                  {
                    v1034 = 0;
                    v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v55];
                    objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v57, objc_msgSend((id)v26, "name"));
                  }
                }
                uint64_t v52 = [v51 countByEnumeratingWithState:&v1277 objects:&v1361 count:16];
              }
              while (v52);
            }
            uint64_t v25 = (uint64_t)v1045;
          }
        }
        id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1057, "attributeKeys"));
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1062, "attributeKeys"));
        long long v1272 = 0u;
        long long v1271 = 0u;
        long long v1270 = 0u;
        long long v1269 = 0u;
        uint64_t v59 = [v58 countByEnumeratingWithState:&v1269 objects:&v1353 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v1270;
          do
          {
            for (uint64_t m = 0; m != v59; ++m)
            {
              if (*(void *)v1270 != v60) {
                objc_enumerationMutation(v58);
              }
              uint64_t v62 = *(void *)(*((void *)&v1269 + 1) + 8 * m);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v62, (uint64_t)v27, v26);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v62, v27, (void *)v26);
            }
            uint64_t v59 = [v58 countByEnumeratingWithState:&v1269 objects:&v1353 count:16];
          }
          while (v59);
        }

        v63 = objc_msgSend((id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"), "indexes");
        v64 = objc_msgSend((id)objc_msgSend((id)v26, "entityDescription"), "indexes");
        uint64_t v65 = [v63 sortedArrayUsingComparator:&__block_literal_global_624];
        uint64_t v66 = [v64 sortedArrayUsingComparator:&__block_literal_global_626];
        uint64_t v1371 = MEMORY[0x1E4F143A8];
        uint64_t v1372 = 3221225472;
        v1373 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1374 = &unk_1E544E708;
        uint64_t v1375 = v20;
        uint64_t v1376 = v26;
        v1377 = v27;
        v67 = (void (**)(void, void, void))[&v1371 copy];
        v67[2](v67, v65, v66);

        v68 = objc_msgSend((id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"), "_uniquenessConstraintsAsFetchIndexes");
        v69 = objc_msgSend((id)objc_msgSend((id)v26, "entityDescription"), "_uniquenessConstraintsAsFetchIndexes");
        uint64_t v70 = [v68 sortedArrayUsingComparator:&__block_literal_global_628];
        uint64_t v71 = [v69 sortedArrayUsingComparator:&__block_literal_global_630];
        uint64_t v1371 = MEMORY[0x1E4F143A8];
        uint64_t v1372 = 3221225472;
        v1373 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1374 = &unk_1E544E708;
        uint64_t v1375 = v20;
        uint64_t v1376 = v26;
        v1377 = v27;
        v72 = (void (**)(void, void, void))[&v1371 copy];
        v72[2](v72, v70, v71);

        v73 = -[NSSQLEntity derivedAttributesExtension](v27);
        if (v73) {
          [*(id *)(v20 + 184) addObject:v73];
        }
        v74 = -[NSSQLEntity derivedAttributesExtension]((NSSQLEntity_DerivedAttributesExtension *)v26);
        if (v74) {
          [*(id *)(v20 + 192) addObject:v74];
        }
        if (v27) {
          [obj removeObject:v27];
        }
        ++v1067;
      }
      while (v1067 != v25);
      uint64_t v75 = [v24 countByEnumeratingWithState:&v1273 objects:&v1357 count:16];
      uint64_t v25 = v75;
    }
    while (v75);
  }
  long long v1368 = 0u;
  long long v1367 = 0u;
  long long v1366 = 0u;
  long long v1365 = 0u;
  uint64_t v76 = [obj countByEnumeratingWithState:&v1365 objects:&v1371 count:16];
  if (v76)
  {
    id v1125 = *(id *)v1366;
    do
    {
      for (uint64_t n = 0; n != v76; ++n)
      {
        if (*(id *)v1366 != v1125) {
          objc_enumerationMutation(obj);
        }
        v78 = *(void **)(*((void *)&v1365 + 1) + 8 * n);
        v79 = (void *)MEMORY[0x18C127630]();
        long long v1364 = 0u;
        long long v1363 = 0u;
        long long v1362 = 0u;
        long long v1361 = 0u;
        v80 = objc_msgSend((id)objc_msgSend(v78, "entityDescription"), "attributeKeys");
        uint64_t v81 = [v80 countByEnumeratingWithState:&v1361 objects:&v1369 count:16];
        if (v81)
        {
          uint64_t v82 = *(void *)v1362;
          do
          {
            for (iuint64_t i = 0; ii != v81; ++ii)
            {
              if (*(void *)v1362 != v82) {
                objc_enumerationMutation(v80);
              }
              uint64_t v84 = *(void *)(*((void *)&v1361 + 1) + 8 * ii);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v84, (uint64_t)v78, 0);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v84, v78, 0);
            }
            uint64_t v81 = [v80 countByEnumeratingWithState:&v1361 objects:&v1369 count:16];
          }
          while (v81);
        }
      }
      uint64_t v76 = [obj countByEnumeratingWithState:&v1365 objects:&v1371 count:16];
    }
    while (v76);
  }
  long long v1363 = 0u;
  long long v1364 = 0u;
  long long v1361 = 0u;
  long long v1362 = 0u;
  v85 = (void *)[*(id *)(v20 + 40) entityMappings];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v1361 objects:&v1369 count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v1362;
    uint64_t v1054 = *(void *)v1362;
    v1058 = v85;
    do
    {
      id v1126 = 0;
      v1063 = (void *)v86;
      do
      {
        if (*(void *)v1362 != v87) {
          objc_enumerationMutation(v85);
        }
        v88 = *(unsigned char **)(*((void *)&v1361 + 1) + 8 * (void)v1126);
        id v1095 = (id)MEMORY[0x18C127630]();
        v89 = objc_msgSend(*(id *)(v20 + 16), "entityNamed:", objc_msgSend(v88, "destinationEntityName"));
        v90 = objc_msgSend(*(id *)(v20 + 24), "entityNamed:", objc_msgSend(v88, "sourceEntityName"));
        v1108 = -[_NSSQLEntityMigrationDescription initWithEntityMapping:sourceEntity:destinationEntity:]([_NSSQLEntityMigrationDescription alloc], v88, v90, v89);
        if (v90) {
          BOOL v91 = v89 == 0;
        }
        else {
          BOOL v91 = 1;
        }
        if (!v91) {
          objc_msgSend(*(id *)(v20 + 88), "setObject:forKey:", v89, objc_msgSend(v90, "name"));
        }
        if ([v88 mappingType] != 3 && !objc_msgSend((id)objc_msgSend(v89, "name"), "length"))
        {
LABEL_985:
          v1020 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v1021 = [v88 name];
          v1017 = objc_msgSend(v1020, "dictionaryWithObjectsAndKeys:", v1021, @"entityMapping", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v88, "mappingType")), @"mappingType", 0);
          uint64_t v1018 = *MEMORY[0x1E4F1C3B8];
          v1019 = @"Unsupported entity mapping type with empty entity name";
LABEL_986:
          id v1022 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v1018, 134110, (uint64_t)v1019, v1017);
          objc_exception_throw(v1022);
        }
        uint64_t v92 = [v89 name];
        switch([v88 mappingType])
        {
          case 2:
            *(unsigned char *)(v20 + 136) = 1;
            v93 = (id *)(v20 + 96);
            if (!v92) {
              goto LABEL_143;
            }
            goto LABEL_142;
          case 3:
            *(unsigned char *)(v20 + 136) = 1;
            if (!objc_msgSend((id)objc_msgSend(v90, "name"), "length")) {
              goto LABEL_985;
            }
            uint64_t v102 = [v90 name];
            v103 = (void *)[*(id *)(v20 + 16) entityNamed:v102];
            v104 = v103;
            if (v103
              && (v105 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "entityDescription"), "userInfo"), "objectForKey:", @"NSEntityRenamingShouldRebaseKey")) != 0&& objc_msgSend(v105, "isEqualToString:", v102))
            {
              _NSCoreDataLog(2, @"Collapsing Entity Hierarchy for: %@", v106, v107, v108, v109, v110, v111, v102);
              objc_msgSend(*(id *)(v20 + 72), "setObject:forKey:", v104, objc_msgSend(v90, "name"));
            }
            else
            {
              [*(id *)(v20 + 104) setObject:v1108 forKey:v102];
            }
            goto LABEL_143;
          case 4:
            goto LABEL_141;
          case 5:
            if (!v88 || (v88[120] & 2) == 0) {
              goto LABEL_137;
            }
            if (!*(void *)(v20 + 56)) {
              *(void *)(v20 + 56) = -[NSSQLiteConnection fetchTableCreationSQL](*(id *)(v20 + 48));
            }
            v94 = objc_msgSend((id)objc_msgSend(v90, "rootEntity"), "tableName");
            long long v1368 = 0u;
            long long v1367 = 0u;
            long long v1366 = 0u;
            long long v1365 = 0u;
            v95 = *(void **)(v20 + 56);
            uint64_t v96 = [v95 countByEnumeratingWithState:&v1365 objects:&v1371 count:16];
            if (!v96) {
              goto LABEL_129;
            }
            uint64_t v97 = *(void *)v1366;
            break;
          default:
            v1015 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v1016 = [v88 name];
            v1017 = objc_msgSend(v1015, "dictionaryWithObjectsAndKeys:", v1016, @"entityMapping", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v88, "mappingType")), @"mappingType", 0);
            uint64_t v1018 = *MEMORY[0x1E4F1C3B8];
            v1019 = @"Unsupported entity mapping type";
            goto LABEL_986;
        }
        while (2)
        {
          for (juint64_t j = 0; jj != v96; ++jj)
          {
            if (*(void *)v1366 != v97) {
              objc_enumerationMutation(v95);
            }
            v99 = *(void **)(*((void *)&v1365 + 1) + 8 * jj);
            uint64_t v100 = [v99 firstObject];
            v101 = (void *)[v99 lastObject];
            if ([v94 isEqual:v100])
            {
              uint64_t v112 = [v101 rangeOfString:@" UNIQUE"];
              uint64_t v87 = v1054;
              v85 = v1058;
              uint64_t v86 = (uint64_t)v1063;
              if (v112 != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_139;
              }
LABEL_137:
              v93 = (id *)(v20 + 112);
              if (!v92) {
                goto LABEL_143;
              }
LABEL_142:
              [*v93 setObject:v1108 forKey:v92];
              goto LABEL_143;
            }
          }
          uint64_t v96 = [v95 countByEnumeratingWithState:&v1365 objects:&v1371 count:16];
          if (v96) {
            continue;
          }
          break;
        }
LABEL_129:
        uint64_t v87 = v1054;
        v85 = v1058;
        uint64_t v86 = (uint64_t)v1063;
LABEL_139:
        if (v1108)
        {
          *((unsigned char *)v1108 + 96) = 1;
          [v88 setMappingType:4];
          objc_msgSend(v88, "setName:", objc_msgSend((id)objc_msgSend(v88, "name"), "stringByAppendingString:", @"_AsCopy"));
          *((_DWORD *)v1108 + 12) = 2;
        }
        else
        {
          [v88 setMappingType:4];
          objc_msgSend(v88, "setName:", objc_msgSend((id)objc_msgSend(v88, "name"), "stringByAppendingString:", @"_AsCopy"));
        }
LABEL_141:
        v93 = (id *)(v20 + 120);
        if (v92) {
          goto LABEL_142;
        }
LABEL_143:

        id v1126 = (char *)v1126 + 1;
      }
      while (v1126 != (id)v86);
      uint64_t v113 = [v85 countByEnumeratingWithState:&v1361 objects:&v1369 count:16];
      uint64_t v86 = v113;
    }
    while (v113);
  }
  long long v1345 = 0u;
  long long v1346 = 0u;
  long long v1347 = 0u;
  long long v1348 = 0u;
  v114 = *(void **)(v20 + 112);
  uint64_t v115 = [v114 countByEnumeratingWithState:&v1345 objects:&v1371 count:16];
  if (v115)
  {
    uint64_t v116 = *(void *)v1346;
    do
    {
      for (kuint64_t k = 0; kk != v115; ++kk)
      {
        if (*(void *)v1346 != v116) {
          objc_enumerationMutation(v114);
        }
        uint64_t v118 = *(void *)(*((void *)&v1345 + 1) + 8 * kk);
        v119 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, [*(id *)(v20 + 112) objectForKey:v118], objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v118), "rootEntity"), 3);
      }
      uint64_t v115 = [v114 countByEnumeratingWithState:&v1345 objects:&v1371 count:16];
    }
    while (v115);
  }
  id v120 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v121 = *(void *)(v20 + 16);
  if (v121) {
    v122 = *(void **)(v121 + 32);
  }
  else {
    v122 = 0;
  }
  v123 = objc_msgSend(v120, "initWithCapacity:", objc_msgSend(v122, "count"));
  long long v1344 = 0u;
  long long v1343 = 0u;
  long long v1342 = 0u;
  long long v1341 = 0u;
  v124 = *(void **)(v20 + 120);
  uint64_t v125 = [v124 countByEnumeratingWithState:&v1341 objects:&v1369 count:16];
  if (v125)
  {
    uint64_t v126 = *(void *)v1342;
    do
    {
      for (muint64_t m = 0; mm != v125; ++mm)
      {
        if (*(void *)v1342 != v126) {
          objc_enumerationMutation(v124);
        }
        objc_msgSend(v123, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", *(void *)(*((void *)&v1341 + 1) + 8 * mm)), "rootEntity"));
      }
      uint64_t v125 = [v124 countByEnumeratingWithState:&v1341 objects:&v1369 count:16];
    }
    while (v125);
  }
  long long v1280 = 0u;
  long long v1279 = 0u;
  long long v1278 = 0u;
  long long v1277 = 0u;
  v128 = *(void **)(v20 + 112);
  uint64_t v129 = [v128 countByEnumeratingWithState:&v1277 objects:&v1365 count:16];
  if (v129)
  {
    uint64_t v130 = *(void *)v1278;
    do
    {
      for (nuint64_t n = 0; nn != v129; ++nn)
      {
        if (*(void *)v1278 != v130) {
          objc_enumerationMutation(v128);
        }
        objc_msgSend(v123, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", *(void *)(*((void *)&v1277 + 1) + 8 * nn)), "rootEntity"));
      }
      uint64_t v129 = [v128 countByEnumeratingWithState:&v1277 objects:&v1365 count:16];
    }
    while (v129);
  }
  long long v1276 = 0u;
  long long v1275 = 0u;
  long long v1274 = 0u;
  long long v1273 = 0u;
  v132 = *(void **)(v20 + 96);
  uint64_t v133 = [v132 countByEnumeratingWithState:&v1273 objects:&v1361 count:16];
  if (v133)
  {
    uint64_t v134 = *(void *)v1274;
    do
    {
      for (uint64_t i1 = 0; i1 != v133; ++i1)
      {
        if (*(void *)v1274 != v134) {
          objc_enumerationMutation(v132);
        }
        uint64_t v136 = *(void *)(*((void *)&v1273 + 1) + 8 * i1);
        v137 = (void *)MEMORY[0x18C127630]();
        v138 = objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v136), "rootEntity");
        uint64_t v139 = [*(id *)(v20 + 96) objectForKey:v136];
        if ([v123 containsObject:v138]) {
          int v140 = 3;
        }
        else {
          int v140 = 0;
        }
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v139, v138, v140);
      }
      uint64_t v133 = [v132 countByEnumeratingWithState:&v1273 objects:&v1361 count:16];
    }
    while (v133);
  }
  long long v1272 = 0u;
  long long v1271 = 0u;
  long long v1270 = 0u;
  long long v1269 = 0u;
  id v1127 = *(id *)(v20 + 104);
  uint64_t v141 = [v1127 countByEnumeratingWithState:&v1269 objects:&v1357 count:16];
  if (v141)
  {
    uint64_t v142 = *(void *)v1270;
    do
    {
      for (uint64_t i2 = 0; i2 != v141; ++i2)
      {
        if (*(void *)v1270 != v142) {
          objc_enumerationMutation(v1127);
        }
        uint64_t v144 = *(void *)(*((void *)&v1269 + 1) + 8 * i2);
        v145 = (void *)MEMORY[0x18C127630]();
        v146 = (void *)[*(id *)(v20 + 24) entityNamed:v144];
        v147 = (void *)[v146 rootEntity];
        uint64_t v148 = [*(id *)(v20 + 104) objectForKey:v144];
        if (v146 && !v146[20] || objc_msgSend(*(id *)(v20 + 104), "objectForKey:", objc_msgSend(v147, "name")))
        {
          int v149 = 1;
        }
        else
        {
          v147 = objc_msgSend((id)objc_msgSend(*(id *)(v20 + 88), "objectForKey:", objc_msgSend(v147, "name")), "rootEntity");
          int v149 = 3;
        }
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v148, v147, v149);
      }
      uint64_t v141 = [v1127 countByEnumeratingWithState:&v1269 objects:&v1357 count:16];
    }
    while (v141);
  }
  long long v1268 = 0u;
  long long v1267 = 0u;
  long long v1266 = 0u;
  long long v1265 = 0u;
  v150 = *(void **)(v20 + 80);
  uint64_t v151 = [v150 countByEnumeratingWithState:&v1265 objects:&v1353 count:16];
  if (v151)
  {
    uint64_t v152 = *(void *)v1266;
    do
    {
      for (uint64_t i3 = 0; i3 != v151; ++i3)
      {
        if (*(void *)v1266 != v152) {
          objc_enumerationMutation(v150);
        }
        uint64_t v154 = *(void *)(*((void *)&v1265 + 1) + 8 * i3);
        v155 = (void *)MEMORY[0x18C127630]();
        v156 = (void *)[*(id *)(v20 + 16) entityNamed:v154];
        uint64_t v157 = objc_msgSend(*(id *)(v20 + 120), "objectForKey:", objc_msgSend(v156, "name"));
        if (v157) {
          -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v157, (void *)[v156 rootEntity], 3);
        }
      }
      uint64_t v151 = [v150 countByEnumeratingWithState:&v1265 objects:&v1353 count:16];
    }
    while (v151);
  }
  long long v1264 = 0u;
  long long v1263 = 0u;
  long long v1262 = 0u;
  long long v1261 = 0u;
  id v1128 = *(id *)(v20 + 120);
  uint64_t v158 = [v1128 countByEnumeratingWithState:&v1261 objects:&v1349 count:16];
  if (v158)
  {
    uint64_t v159 = *(void *)v1262;
    do
    {
      for (uint64_t i4 = 0; i4 != v158; ++i4)
      {
        if (*(void *)v1262 != v159) {
          objc_enumerationMutation(v1128);
        }
        uint64_t v161 = *(void *)(*((void *)&v1261 + 1) + 8 * i4);
        v162 = (void *)MEMORY[0x18C127630]();
        v163 = (void *)[*(id *)(v20 + 16) entityNamed:v161];
        if (![*(id *)(v20 + 80) objectForKey:v161])
        {
          v164 = (void *)[v163 rootEntity];
          uint64_t v165 = objc_msgSend(*(id *)(v20 + 128), "objectForKey:", objc_msgSend(v164, "name"));
          if (v165 && *(_DWORD *)(v165 + 24) != 2) {
            int v166 = 3;
          }
          else {
            int v166 = 2;
          }
          -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, [*(id *)(v20 + 120) objectForKey:v161], v164, v166);
        }
      }
      uint64_t v158 = [v1128 countByEnumeratingWithState:&v1261 objects:&v1349 count:16];
    }
    while (v158);
  }

  id v1129 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 4 * objc_msgSend(*(id *)(v20 + 128), "count"));
  id v1109 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 128), "allValues"), "sortedArrayUsingComparator:", &__block_literal_global_22);
  uint64_t v167 = *(void *)(v20 + 48);
  if (!v167)
  {
    int v1084 = 0;
    goto LABEL_999;
  }
  int v1084 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v167, @"ANSCKRECORDMETADATA", 0);
  uint64_t v168 = *(void *)(v20 + 48);
  if (!v168)
  {
LABEL_999:
    int v1080 = 0;
    goto LABEL_217;
  }
  int v1080 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v168, @"ANSCKHISTORYANALYZERSTATE", 0);
LABEL_217:
  *(unsigned char *)(v20 + 216) = v1084 | v1080;
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1280 = 0u;
  long long v1279 = 0u;
  long long v1278 = 0u;
  long long v1277 = 0u;
  uint64_t v169 = [v1109 countByEnumeratingWithState:&v1277 objects:&v1371 count:16];
  if (v169)
  {
    int v1096 = 0;
    uint64_t v170 = *(void *)v1278;
    while (1)
    {
      for (uint64_t i5 = 0; i5 != v169; ++i5)
      {
        if (*(void *)v1278 != v170) {
          objc_enumerationMutation(v1109);
        }
        v172 = *(_DWORD **)(*((void *)&v1277 + 1) + 8 * i5);
        v173 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLTableMigrationDescription appendStatementsToRenameTables:migrationContext:]((uint64_t)v172, v1129, v20);
        if (-[_NSSQLiteStoreMigrator enforceCloudKitConstraintsForEntity:](v20, (void *)[v172 rootEntity]))
        {
          if (!v172)
          {
            int v174 = 0;
LABEL_231:
            v1096 |= v174 == 0;
            goto LABEL_232;
          }
          int v174 = v172[6];
          if ((v174 - 1) > 2) {
            goto LABEL_231;
          }
          BOOL v175 = v174 == 3;
          v176 = (void *)-[_NSSQLTableMigrationDescription newCloudKitMetadataUpdateStatements:]((uint64_t)v172, obja);
          if (v176)
          {
            [*(id *)(v20 + 208) addObjectsFromArray:v176];
          }
          else
          {
            uint64_t v177 = [NSString stringWithUTF8String:"tableMigration returned nil cloudkit update statements: %@"];
            _NSCoreDataLog(17, v177, v178, v179, v180, v181, v182, v183, (uint64_t)v172);
            v184 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              int v1369 = 138412290;
              v1370 = v172;
              _os_log_fault_impl(&dword_18AB82000, v184, OS_LOG_TYPE_FAULT, "CoreData: tableMigration returned nil cloudkit update statements: %@", (uint8_t *)&v1369, 0xCu);
            }
          }

          v1096 |= v175;
        }
LABEL_232:
      }
      uint64_t v169 = [v1109 countByEnumeratingWithState:&v1277 objects:&v1371 count:16];
      if (!v169) {
        goto LABEL_236;
      }
    }
  }
  LOBYTE(v1096) = 0;
LABEL_236:
  if ([obja count])
  {
    [obja sortUsingComparator:&__block_literal_global_565];
    long long v1276 = 0u;
    long long v1275 = 0u;
    long long v1274 = 0u;
    long long v1273 = 0u;
    uint64_t v185 = [obja countByEnumeratingWithState:&v1273 objects:&v1369 count:16];
    if (v185)
    {
      uint64_t v186 = *(void *)v1274;
      do
      {
        for (uint64_t i6 = 0; i6 != v185; ++i6)
        {
          if (*(void *)v1274 != v186) {
            objc_enumerationMutation(obja);
          }
          v188 = *(void **)(*((void *)&v1273 + 1) + 8 * i6);
          v189 = (void *)MEMORY[0x18C127630]();
          if (v1084)
          {
            v190 = [NSSQLiteStatement alloc];
            v191 = NSString;
            v1034 = (__CFString *)[v188 objectAtIndexedSubscript:1];
            [v188 objectAtIndexedSubscript:0];
            v192 = -[NSSQLiteStatement initWithEntity:sqlString:](v190, "initWithEntity:sqlString:", 0, [v191 stringWithFormat:@"UPDATE ANSCKRECORDMETADATA SET ZENTITYID = %@ WHERE ZENTITYID = %@"]);
            [*(id *)(v20 + 208) addObject:v192];
          }
          if (v1080)
          {
            v193 = [NSSQLiteStatement alloc];
            v194 = NSString;
            v1034 = (__CFString *)[v188 objectAtIndexedSubscript:1];
            [v188 objectAtIndexedSubscript:0];
            v195 = -[NSSQLiteStatement initWithEntity:sqlString:](v193, "initWithEntity:sqlString:", 0, [v194 stringWithFormat:@"UPDATE ANSCKHISTORYANALYZERSTATE SET ZENTITYID = %@ WHERE ZENTITYID = %@"]);
            [*(id *)(v20 + 208) addObject:v195];
          }
        }
        uint64_t v185 = [obja countByEnumeratingWithState:&v1273 objects:&v1369 count:16];
      }
      while (v185);
    }
  }

  if (([*(id *)(v20 + 208) count] != 0) | v1096 & 1)
  {
    v196 = objc_msgSend((id)objc_msgSend(*(id *)(v20 + 8), "metadata"), "mutableCopy");
    [v196 setObject:MEMORY[0x1E4F1CC08] forKey:@"PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"];
    uint64_t v197 = *(void *)(v20 + 8);
    if (v197) {
      -[NSSQLCore _setMetadata:clean:](v197, v196, 0);
    }
  }
  v198 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v1272 = 0u;
  long long v1271 = 0u;
  long long v1270 = 0u;
  long long v1269 = 0u;
  uint64_t v199 = [v1129 countByEnumeratingWithState:&v1269 objects:&v1365 count:16];
  if (v199)
  {
    uint64_t v200 = *(void *)v1270;
    do
    {
      for (uint64_t i7 = 0; i7 != v199; ++i7)
      {
        if (*(void *)v1270 != v200) {
          objc_enumerationMutation(v1129);
        }
        v202 = *(void **)(*((void *)&v1269 + 1) + 8 * i7);
        if (objc_msgSend((id)objc_msgSend(v202, "sqlString"), "containsString:", @"RENAME TO Z_")) {
          [v198 addObject:v202];
        }
      }
      uint64_t v199 = [v1129 countByEnumeratingWithState:&v1269 objects:&v1365 count:16];
    }
    while (v199);
  }
  if ([v198 count])
  {
    id v1085 = (id)MEMORY[0x18C127630]();
    v203 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v1097 = (id)[MEMORY[0x1E4F1CA48] array];
    long long v1268 = 0u;
    long long v1267 = 0u;
    long long v1266 = 0u;
    long long v1265 = 0u;
    uint64_t v204 = [v198 countByEnumeratingWithState:&v1265 objects:&v1361 count:16];
    if (v204)
    {
      uint64_t v205 = *(void *)v1266;
      do
      {
        for (uint64_t i8 = 0; i8 != v204; ++i8)
        {
          if (*(void *)v1266 != v205) {
            objc_enumerationMutation(v198);
          }
          v207 = *(void **)(*((void *)&v1265 + 1) + 8 * i8);
          v208 = (void *)MEMORY[0x18C127630]();
          v209 = objc_msgSend((id)objc_msgSend(v207, "sqlString"), "componentsSeparatedByString:", @" ");
          if ([v209 count] == 6)
          {
            objc_msgSend(v203, "addObject:", objc_msgSend(v209, "objectAtIndexedSubscript:", 2));
            objc_msgSend(v1097, "addObject:", objc_msgSend(v209, "lastObject"));
          }
        }
        uint64_t v204 = [v198 countByEnumeratingWithState:&v1265 objects:&v1361 count:16];
      }
      while (v204);
    }
    v210 = (void *)[MEMORY[0x1E4F1CA48] array];
    v211 = (void *)[MEMORY[0x1E4F1CA48] array];
    for (unint64_t i9 = 0; [v203 count] > i9; ++i9)
    {
      v213 = (void *)MEMORY[0x18C127630]();
      v214 = (void *)[v203 objectAtIndexedSubscript:i9];
      uint64_t v215 = [v1097 objectAtIndexedSubscript:i9];
      uint64_t v216 = [v214 stringByAppendingString:@"TEMP"];
      v217 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](*(NSSQLiteStatement **)(v20 + 32), (uint64_t)v214, v216);
      [v210 addObject:v217];
      v218 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](*(NSSQLiteStatement **)(v20 + 32), v216, v215);
      [v211 addObject:v218];
    }
    [v1129 removeObjectsInArray:v198];
    objc_msgSend(v1129, "insertObjects:atIndexes:", v211, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v211, "count")));
    objc_msgSend(v1129, "insertObjects:atIndexes:", v210, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v210, "count")));
  }
  long long v1264 = 0u;
  long long v1263 = 0u;
  long long v1262 = 0u;
  long long v1261 = 0u;
  uint64_t v219 = [v1109 countByEnumeratingWithState:&v1261 objects:&v1357 count:16];
  if (v219)
  {
    uint64_t v220 = *(void *)v1262;
    do
    {
      for (uint64_t i10 = 0; i10 != v219; ++i10)
      {
        if (*(void *)v1262 != v220) {
          objc_enumerationMutation(v1109);
        }
        uint64_t v222 = *(void *)(*((void *)&v1261 + 1) + 8 * i10);
        v223 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLTableMigrationDescription appendStatementsToCreateOrDropTables:migrationContext:](v222, v1129, v20);
      }
      uint64_t v219 = [v1109 countByEnumeratingWithState:&v1261 objects:&v1357 count:16];
    }
    while (v219);
  }
  long long v1260 = 0u;
  long long v1259 = 0u;
  long long v1258 = 0u;
  long long v1257 = 0u;
  uint64_t v224 = [v1109 countByEnumeratingWithState:&v1257 objects:&v1353 count:16];
  if (v224)
  {
    uint64_t v225 = *(void *)v1258;
    do
    {
      for (uint64_t i11 = 0; i11 != v224; ++i11)
      {
        if (*(void *)v1258 != v225) {
          objc_enumerationMutation(v1109);
        }
        uint64_t v227 = *(void *)(*((void *)&v1257 + 1) + 8 * i11);
        v228 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLTableMigrationDescription appendStatementsToPerformMigration:migrationContext:](v227, v1129, v20);
      }
      uint64_t v224 = [v1109 countByEnumeratingWithState:&v1257 objects:&v1353 count:16];
    }
    while (v224);
  }
  long long v1256 = 0u;
  long long v1255 = 0u;
  long long v1254 = 0u;
  long long v1253 = 0u;
  uint64_t v229 = [v1109 countByEnumeratingWithState:&v1253 objects:&v1349 count:16];
  if (v229)
  {
    uint64_t v230 = *(void *)v1254;
    do
    {
      for (uint64_t i12 = 0; i12 != v229; ++i12)
      {
        if (*(void *)v1254 != v230) {
          objc_enumerationMutation(v1109);
        }
        uint64_t v232 = *(void *)(*((void *)&v1253 + 1) + 8 * i12);
        v233 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLTableMigrationDescription appendStatementsToCompleteMigration:migrationContext:](v232, v1129, v20);
      }
      uint64_t v229 = [v1109 countByEnumeratingWithState:&v1253 objects:&v1349 count:16];
    }
    while (v229);
  }
  *(void *)(v20 + 176) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1249 = 0u;
  long long v1250 = 0u;
  long long v1251 = 0u;
  long long v1252 = 0u;
  uint64_t v234 = [v1109 countByEnumeratingWithState:&v1249 objects:&v1345 count:16];
  if (v234)
  {
    uint64_t v235 = *(void *)v1250;
    do
    {
      for (uint64_t i13 = 0; i13 != v234; ++i13)
      {
        if (*(void *)v1250 != v235) {
          objc_enumerationMutation(v1109);
        }
        uint64_t v237 = *(void *)(*((void *)&v1249 + 1) + 8 * i13);
        v238 = (void *)MEMORY[0x18C127630]();
        -[_NSSQLTableMigrationDescription appendDefaultValueStatementsToCompleteMigration:migrationContext:](v237, *(void **)(v20 + 176), v20);
      }
      uint64_t v234 = [v1109 countByEnumeratingWithState:&v1249 objects:&v1345 count:16];
    }
    while (v234);
  }
  long long v1248 = 0u;
  long long v1247 = 0u;
  long long v1246 = 0u;
  long long v1245 = 0u;
  uint64_t v239 = *(void *)(v20 + 16);
  if (v239) {
    v240 = *(void **)(v239 + 32);
  }
  else {
    v240 = 0;
  }
  uint64_t v241 = [v240 countByEnumeratingWithState:&v1245 objects:&v1341 count:16];
  if (v241)
  {
    uint64_t v242 = *(void *)v1246;
    do
    {
      for (uint64_t i14 = 0; i14 != v241; ++i14)
      {
        if (*(void *)v1246 != v242) {
          objc_enumerationMutation(v240);
        }
        uint64_t v244 = *(void *)(*((void *)&v1245 + 1) + 8 * i14);
        v245 = (void *)MEMORY[0x18C127630]();
        id v246 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](*(void *)(v20 + 32), v244, 0);
        [v1129 addObjectsFromArray:v246];
      }
      uint64_t v241 = [v240 countByEnumeratingWithState:&v1245 objects:&v1341 count:16];
    }
    while (v241);
  }

  id v1049 = v1129;
LABEL_313:
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v1340[0] = @"Creation of entity migration statements";
  v1340[1] = [NSNumber numberWithDouble:v247 - v19];
  objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1340, 2), @"1.1");
  if (!v1049)
  {
    v309 = (void *)MEMORY[0x1E4F28C58];
    v1034 = @"reason";
    uint64_t v310 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:@"Failed to generate statements to perform migration"];
    id v311 = (id)[v309 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v310];
    v1131 = 0;
    id v1082 = 0;
    id v1049 = 0;
    int v312 = 0;
    uint64_t v313 = v1140;
    *(void *)(*(void *)(*(void *)(v1140 + 40) + 8) + 40) = v311;
    *(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) = 0;
    goto LABEL_1005;
  }
  if ([*(id *)(*(void *)(v1140 + 32) + 72) count])
  {
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Creating statements to update entity keys", v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v255 = v254;
    v1041 = (void *)MEMORY[0x18C127630]();
    uint64_t v256 = *(void *)(v1140 + 32);
    if (v256 && [*(id *)(v256 + 72) count])
    {
      v1035 = (void *)MEMORY[0x18C127630]();
      v1064 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(*(id *)(v256 + 72), "count"));
      id v1130 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(v256 + 72), "count"));
      id v1098 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(v256 + 72), "count"));
      long long v1356 = 0u;
      long long v1355 = 0u;
      long long v1354 = 0u;
      long long v1353 = 0u;
      v257 = *(void **)(v256 + 72);
      uint64_t v258 = [v257 countByEnumeratingWithState:&v1353 objects:&v1371 count:16];
      if (v258)
      {
        uint64_t v259 = *(void *)v1354;
        do
        {
          uint64_t v260 = 0;
          do
          {
            if (*(void *)v1354 != v259) {
              objc_enumerationMutation(v257);
            }
            uint64_t v261 = *(void *)(*((void *)&v1353 + 1) + 8 * v260);
            v262 = (void *)MEMORY[0x18C127630]();
            uint64_t v263 = [*(id *)(v256 + 24) entityNamed:v261];
            v264 = objc_msgSend((id)objc_msgSend(*(id *)(v256 + 72), "objectForKey:", v261), "rootEntity");
            v265 = objc_msgSend(v1130, "objectForKey:", objc_msgSend(v264, "name"));
            if (v265)
            {
              [v265 addObject:v263];
            }
            else
            {
              v266 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v263, 0);
              objc_msgSend(v1130, "setObject:forKey:", v266, objc_msgSend(v264, "name"));
            }
            v267 = objc_msgSend(v1098, "objectForKey:", objc_msgSend(v264, "name"));
            if (v267)
            {
              if (v263) {
                uint64_t v268 = *(unsigned int *)(v263 + 184);
              }
              else {
                uint64_t v268 = 0;
              }
              objc_msgSend(v267, "appendFormat:", @",%u", v268);
            }
            else
            {
              id v269 = objc_alloc(MEMORY[0x1E4F28E78]);
              if (v263) {
                uint64_t v270 = *(unsigned int *)(v263 + 184);
              }
              else {
                uint64_t v270 = 0;
              }
              v271 = objc_msgSend(v269, "initWithFormat:", @"%u", v270);
              objc_msgSend(v1098, "setObject:forKey:", v271, objc_msgSend(v264, "name"));
            }
            ++v260;
          }
          while (v258 != v260);
          uint64_t v272 = [v257 countByEnumeratingWithState:&v1353 objects:&v1371 count:16];
          uint64_t v258 = v272;
        }
        while (v272);
      }
      long long v1352 = 0u;
      long long v1351 = 0u;
      long long v1350 = 0u;
      long long v1349 = 0u;
      id v1037 = *(id *)(v256 + 128);
      uint64_t v273 = [v1037 countByEnumeratingWithState:&v1349 objects:&v1369 count:16];
      if (v273)
      {
        uint64_t v1038 = *(void *)v1350;
        do
        {
          id v1046 = 0;
          id v1036 = (id)v273;
          do
          {
            if (*(void *)v1350 != v1038) {
              objc_enumerationMutation(v1037);
            }
            uint64_t v274 = *(void *)(*((void *)&v1349 + 1) + 8 * (void)v1046);
            v1043 = (void *)MEMORY[0x18C127630]();
            v275 = (void *)[*(id *)(v256 + 16) entityNamed:v274];
            v276 = objc_msgSend(v1130, "objectForKey:", objc_msgSend(v275, "name"));
            if ([v276 count])
            {
              id v1110 = (id)objc_msgSend(v1098, "objectForKey:", objc_msgSend(v275, "name"));
              v277 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE OR FAIL "];
              objc_msgSend(v277, "appendString:", objc_msgSend(v275, "tableName"));
              [v277 appendString:@" SET "];
              [v277 appendString:@"Z_ENT"];
              objc_msgSend(v277, "appendString:", @" =(CASE");
              long long v1348 = 0u;
              long long v1347 = 0u;
              long long v1346 = 0u;
              long long v1345 = 0u;
              uint64_t v278 = [v276 countByEnumeratingWithState:&v1345 objects:&v1365 count:16];
              v279 = v275;
              if (!v278) {
                goto LABEL_358;
              }
              uint64_t v280 = *(void *)v1346;
              while (1)
              {
                uint64_t v281 = 0;
                do
                {
                  if (*(void *)v1346 != v280) {
                    objc_enumerationMutation(v276);
                  }
                  v282 = *(unsigned int **)(*((void *)&v1345 + 1) + 8 * v281);
                  uint64_t v283 = objc_msgSend(*(id *)(v256 + 72), "objectForKey:", objc_msgSend(v282, "name"));
                  [v277 appendString:@" WHEN "];
                  [v277 appendString:@"Z_ENT"];
                  if (v282)
                  {
                    uint64_t v284 = v282[46];
                    if (v283) {
                      goto LABEL_352;
                    }
                  }
                  else
                  {
                    uint64_t v284 = 0;
                    if (v283)
                    {
LABEL_352:
                      uint64_t v285 = *(unsigned int *)(v283 + 184);
                      goto LABEL_353;
                    }
                  }
                  uint64_t v285 = 0;
LABEL_353:
                  objc_msgSend(v277, "appendFormat:", @" = %d THEN %d", v284, v285);
                  ++v281;
                }
                while (v278 != v281);
                uint64_t v286 = [v276 countByEnumeratingWithState:&v1345 objects:&v1365 count:16];
                uint64_t v278 = v286;
                if (!v286)
                {
LABEL_358:
                  [v277 appendString:@" ELSE "];
                  v275 = v279;
                  [v277 appendString:@"Z_ENT"];
                  [v277 appendString:@" END WHERE "]);
                  [v277 appendString:@"Z_ENT"];
                  objc_msgSend(v277, "appendString:", @" IN (");
                  [v277 appendString:v1110];
                  [v277 appendString:@""]);
                  v287 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](*(void *)(v256 + 32), (uint64_t)v277);
                  [v1064 addObject:v287];

                  break;
                }
              }
            }
            long long v1344 = 0u;
            long long v1343 = 0u;
            long long v1342 = 0u;
            long long v1341 = 0u;
            if (v275)
            {
              v288 = v275;
              do
              {
                if (!v288) {
                  goto LABEL_390;
                }
                v289 = v288;
                v288 = (void *)v288[21];
              }
              while (v288 != v289);
              v290 = (void *)v289[9];
            }
            else
            {
LABEL_390:
              v290 = 0;
            }
            uint64_t v291 = [v290 countByEnumeratingWithState:&v1341 objects:&v1361 count:16];
            v1059 = v275;
            if (!v291) {
              goto LABEL_388;
            }
            v292 = *(void **)v1342;
            contexta = *(void **)v1342;
            v1055 = v290;
            do
            {
              id v293 = 0;
              uint64_t v1068 = v291;
              do
              {
                if (*(void **)v1342 != v292) {
                  objc_enumerationMutation(v290);
                }
                v294 = *(unsigned char **)(*((void *)&v1341 + 1) + 8 * (void)v293);
                id v1111 = (id)MEMORY[0x18C127630]();
                if (v294)
                {
                  if (v294[24] == 4)
                  {
                    v295 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v294, "toOneRelationship"), "destinationEntity"), "rootEntity");
                    v296 = objc_msgSend(v1130, "objectForKey:", objc_msgSend(v295, "name"));
                    if ([v296 count])
                    {
                      id v1081 = (id)objc_msgSend(v1098, "objectForKey:", objc_msgSend(v295, "name"));
                      uint64_t v297 = [v294 columnName];
                      v298 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE OR FAIL "];
                      objc_msgSend(v298, "appendString:", objc_msgSend(v1059, "tableName"));
                      [v298 appendString:@" SET "];
                      [v298 appendString:v297];
                      objc_msgSend(v298, "appendString:", @" =(CASE");
                      long long v1280 = 0u;
                      long long v1279 = 0u;
                      long long v1278 = 0u;
                      long long v1277 = 0u;
                      uint64_t v299 = [v296 countByEnumeratingWithState:&v1277 objects:&v1357 count:16];
                      id objb = v293;
                      uint64_t v300 = v256;
                      if (!v299) {
                        goto LABEL_385;
                      }
                      uint64_t v301 = *(void *)v1278;
                      while (1)
                      {
                        uint64_t v302 = 0;
                        do
                        {
                          if (*(void *)v1278 != v301) {
                            objc_enumerationMutation(v296);
                          }
                          v303 = *(unsigned int **)(*((void *)&v1277 + 1) + 8 * v302);
                          uint64_t v304 = objc_msgSend(*(id *)(v300 + 72), "objectForKey:", objc_msgSend(v303, "name"));
                          [v298 appendString:@" WHEN "];
                          [v298 appendString:v297];
                          if (v303)
                          {
                            uint64_t v305 = v303[46];
                            if (v304) {
                              goto LABEL_379;
                            }
                          }
                          else
                          {
                            uint64_t v305 = 0;
                            if (v304)
                            {
LABEL_379:
                              uint64_t v306 = *(unsigned int *)(v304 + 184);
                              goto LABEL_380;
                            }
                          }
                          uint64_t v306 = 0;
LABEL_380:
                          objc_msgSend(v298, "appendFormat:", @" = %d THEN %d", v305, v306);
                          ++v302;
                        }
                        while (v299 != v302);
                        uint64_t v307 = [v296 countByEnumeratingWithState:&v1277 objects:&v1357 count:16];
                        uint64_t v299 = v307;
                        if (!v307)
                        {
LABEL_385:
                          [v298 appendString:@" ELSE "];
                          uint64_t v256 = v300;
                          v292 = contexta;
                          v290 = v1055;
                          uint64_t v291 = v1068;
                          id v293 = objb;
                          [v298 appendString:v297];
                          [v298 appendString:@" END WHERE "]);
                          [v298 appendString:v297];
                          objc_msgSend(v298, "appendString:", @" IN (");
                          [v298 appendString:v1081];
                          [v298 appendString:@""]);
                          v308 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](*(void *)(v256 + 32), (uint64_t)v298);
                          [v1064 addObject:v308];

                          break;
                        }
                      }
                    }
                  }
                }
                id v293 = (char *)v293 + 1;
              }
              while (v293 != (id)v291);
              uint64_t v291 = [v290 countByEnumeratingWithState:&v1341 objects:&v1361 count:16];
            }
            while (v291);
LABEL_388:
            id v1046 = (char *)v1046 + 1;
          }
          while (v1046 != v1036);
          uint64_t v273 = [v1037 countByEnumeratingWithState:&v1349 objects:&v1369 count:16];
        }
        while (v273);
      }

      id v1082 = v1064;
    }
    else
    {
      id v1082 = 0;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1339[0] = @"Creation of update entity keys statements";
    v1339[1] = [NSNumber numberWithDouble:v314 - v255];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1339, 2), @"1.2");
  }
  else
  {
    id v1082 = 0;
  }
  if (*(unsigned char *)(*(void *)(v1140 + 32) + 136))
  {
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Creating statements to update primary key table", v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v316 = v315;
    v1065 = (void *)MEMORY[0x18C127630]();
    uint64_t v317 = *(void *)(v1140 + 32);
    if (v317)
    {
      v1060 = (void *)MEMORY[0x18C127630]();
      *(void *)(v317 + 144) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v1112 = (NSString *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ RENAME TO %@_ORIG", @"Z_PRIMARYKEY", @"Z_PRIMARYKEY"];
      v318 = [[NSSQLiteStatement alloc] initWithEntity:0];
      v319 = v318;
      if (v318)
      {
        sqlString = v318->_sqlString;
        if (sqlString != v1112)
        {

          v319->_sqlString = (NSString *)[(NSString *)v1112 copy];
        }
      }

      [*(id *)(v317 + 144) addObject:v319];
      PrimaryKeyTable = -[NSSQLiteAdapter newCreatePrimaryKeyTableStatement](*(NSSQLiteStatement **)(v317 + 32));
      [*(id *)(v317 + 144) addObject:PrimaryKeyTable];

      uint64_t v322 = *(void *)(v317 + 16);
      if (v322) {
        v323 = *(void **)(v322 + 32);
      }
      else {
        v323 = 0;
      }
      long long v1352 = 0u;
      long long v1351 = 0u;
      long long v1350 = 0u;
      long long v1349 = 0u;
      uint64_t v324 = [v323 countByEnumeratingWithState:&v1349 objects:&v1371 count:16];
      if (v324)
      {
        uint64_t v325 = *(void *)v1350;
        do
        {
          uint64_t v326 = 0;
          do
          {
            if (*(void *)v1350 != v325) {
              objc_enumerationMutation(v323);
            }
            uint64_t v327 = *(void *)(*((void *)&v1349 + 1) + 8 * v326);
            v328 = (void *)MEMORY[0x18C127630]();
            if (v327) {
              uint64_t v329 = *(void *)(v327 + 160) == 0;
            }
            else {
              uint64_t v329 = 0;
            }
            v330 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](*(NSSQLiteStatement **)(v317 + 32), v327, v329 << 63 >> 63);
            [*(id *)(v317 + 144) addObject:v330];

            ++v326;
          }
          while (v324 != v326);
          uint64_t v331 = [v323 countByEnumeratingWithState:&v1349 objects:&v1371 count:16];
          uint64_t v324 = v331;
        }
        while (v331);
      }
      v1069 = (void *)MEMORY[0x18C127630]();
      long long v1348 = 0u;
      long long v1347 = 0u;
      long long v1346 = 0u;
      long long v1345 = 0u;
      v332 = objc_msgSend((id)objc_msgSend(*(id *)(v317 + 8), "ancillarySQLModels"), "allValues");
      uint64_t v333 = [v332 countByEnumeratingWithState:&v1345 objects:&v1369 count:16];
      if (v333)
      {
        id v1086 = *(id *)v1346;
        id objc = v332;
        do
        {
          v334 = 0;
          id v1099 = (id)v333;
          do
          {
            if (*(id *)v1346 != v1086) {
              objc_enumerationMutation(objc);
            }
            uint64_t v335 = *(void *)(*((void *)&v1345 + 1) + 8 * (void)v334);
            long long v1341 = 0u;
            long long v1342 = 0u;
            long long v1343 = 0u;
            long long v1344 = 0u;
            if (v335) {
              v336 = *(void **)(v335 + 32);
            }
            else {
              v336 = 0;
            }
            uint64_t v337 = [v336 countByEnumeratingWithState:&v1341 objects:&v1365 count:16];
            if (v337)
            {
              uint64_t v338 = *(void *)v1342;
              do
              {
                uint64_t v339 = 0;
                do
                {
                  if (*(void *)v1342 != v338) {
                    objc_enumerationMutation(v336);
                  }
                  uint64_t v340 = *(void *)(*((void *)&v1341 + 1) + 8 * v339);
                  v341 = (void *)MEMORY[0x18C127630]();
                  if (v340) {
                    uint64_t v342 = *(void *)(v340 + 160) == 0;
                  }
                  else {
                    uint64_t v342 = 0;
                  }
                  v343 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](*(NSSQLiteStatement **)(v317 + 32), v340, v342 << 63 >> 63);
                  [*(id *)(v317 + 144) addObject:v343];

                  ++v339;
                }
                while (v337 != v339);
                uint64_t v344 = [v336 countByEnumeratingWithState:&v1341 objects:&v1365 count:16];
                uint64_t v337 = v344;
              }
              while (v344);
            }
            v334 = (char *)v334 + 1;
          }
          while (v334 != v1099);
          uint64_t v345 = [objc countByEnumeratingWithState:&v1345 objects:&v1369 count:16];
          uint64_t v333 = v345;
        }
        while (v345);
      }
      long long v1280 = 0u;
      long long v1279 = 0u;
      long long v1278 = 0u;
      long long v1277 = 0u;
      v346 = *(void **)(v317 + 96);
      uint64_t v347 = [v346 countByEnumeratingWithState:&v1277 objects:&v1361 count:16];
      if (v347)
      {
        uint64_t v348 = *(void *)v1278;
        do
        {
          uint64_t v349 = 0;
          do
          {
            if (*(void *)v1278 != v348) {
              objc_enumerationMutation(v346);
            }
            uint64_t v350 = *(void *)(*((void *)&v1277 + 1) + 8 * v349);
            v351 = (void *)MEMORY[0x18C127630]();
            uint64_t v352 = [*(id *)(v317 + 96) valueForKey:v350];
            if (v352)
            {
              uint64_t v353 = *(void *)(v352 + 32);
              if (v353)
              {
                if (!*(void *)(v353 + 160))
                {
                  if ([*(id *)(v353 + 152) count])
                  {
                    v354 = -[_NSSQLiteStoreMigrator _originalRootsForAddedEntity:](v317, (void *)v353);
                    v355 = v354;
                    if (!v354 || ![v354 count]) {
                      goto LABEL_461;
                    }
                    if ([v355 count] == 1)
                    {
                      id v356 = [NSString alloc];
                      uint64_t v357 = [v355 lastObject];
                      if (v357) {
                        uint64_t v358 = *(unsigned int *)(v357 + 184);
                      }
                      else {
                        uint64_t v358 = 0;
                      }
                      v1112 = (NSString *)[v356 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_ENT", v358, @"Z_ENT", *(unsigned int *)(v353 + 184)];
                    }
                    else
                    {
                      v360 = v1112;
                    }
                    v359 = [[NSSQLiteStatement alloc] initWithEntity:0];
                  }
                  else
                  {
                    v1112 = (NSString *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET %@ = 0 WHERE %@ = %d", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_ENT", *(unsigned int *)(v353 + 184)];
                    v359 = [[NSSQLiteStatement alloc] initWithEntity:0];
                  }
                  v361 = v359;
                  if (v359)
                  {
                    v362 = v359->_sqlString;
                    if (v362 != v1112)
                    {

                      v361->_sqlString = (NSString *)[(NSString *)v1112 copy];
                    }
                  }

                  [*(id *)(v317 + 144) addObject:v361];
                }
              }
            }
LABEL_461:
            ++v349;
          }
          while (v347 != v349);
          uint64_t v363 = [v346 countByEnumeratingWithState:&v1277 objects:&v1361 count:16];
          uint64_t v347 = v363;
        }
        while (v363);
      }
      long long v1276 = 0u;
      long long v1275 = 0u;
      long long v1274 = 0u;
      long long v1273 = 0u;
      id v1113 = *(id *)(v317 + 120);
      uint64_t v364 = [v1113 countByEnumeratingWithState:&v1273 objects:&v1357 count:16];
      if (v364)
      {
        uint64_t v365 = *(void *)v1274;
        do
        {
          uint64_t v366 = 0;
          do
          {
            if (*(void *)v1274 != v365) {
              objc_enumerationMutation(v1113);
            }
            uint64_t v367 = *(void *)(*((void *)&v1273 + 1) + 8 * v366);
            v368 = (void *)MEMORY[0x18C127630]();
            v369 = (void *)[*(id *)(v317 + 120) valueForKey:v367];
            if (v369)
            {
              uint64_t v370 = v369[4];
              if (v370)
              {
                if (!*(void *)(v370 + 160))
                {
                  uint64_t v371 = [v369 sourceEntity];
                  id v372 = [NSString alloc];
                  if (v371) {
                    uint64_t v373 = *(unsigned int *)(v371 + 184);
                  }
                  else {
                    uint64_t v373 = 0;
                  }
                  v374 = (NSString *)[v372 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_ENT", v373, @"Z_ENT", *(unsigned int *)(v370 + 184)];
                  v375 = [[NSSQLiteStatement alloc] initWithEntity:0];
                  v376 = v375;
                  if (v375)
                  {
                    v377 = v375->_sqlString;
                    if (v377 != v374)
                    {

                      v376->_sqlString = (NSString *)[(NSString *)v374 copy];
                    }
                  }

                  [*(id *)(v317 + 144) addObject:v376];
                }
              }
            }
            ++v366;
          }
          while (v364 != v366);
          uint64_t v378 = [v1113 countByEnumeratingWithState:&v1273 objects:&v1357 count:16];
          uint64_t v364 = v378;
        }
        while (v378);
      }
      long long v1272 = 0u;
      long long v1271 = 0u;
      long long v1270 = 0u;
      long long v1269 = 0u;
      id v1114 = *(id *)(v317 + 112);
      uint64_t v379 = [v1114 countByEnumeratingWithState:&v1269 objects:&v1353 count:16];
      if (v379)
      {
        uint64_t v380 = *(void *)v1270;
        do
        {
          for (uint64_t i15 = 0; i15 != v379; ++i15)
          {
            if (*(void *)v1270 != v380) {
              objc_enumerationMutation(v1114);
            }
            uint64_t v382 = *(void *)(*((void *)&v1269 + 1) + 8 * i15);
            v383 = (void *)MEMORY[0x18C127630]();
            v384 = (void *)[*(id *)(v317 + 112) valueForKey:v382];
            if (v384)
            {
              uint64_t v385 = v384[4];
              if (v385)
              {
                if (!*(void *)(v385 + 160))
                {
                  v386 = (void *)[v384 sourceEntity];
                  uint64_t v387 = (uint64_t)v386;
                  if (v386 && !v386[20])
                  {
                    id v388 = [NSString alloc];
                  }
                  else
                  {
                    uint64_t v387 = [v386 rootEntity];
                    id v388 = [NSString alloc];
                    if (!v387)
                    {
                      uint64_t v389 = 0;
                      goto LABEL_497;
                    }
                  }
                  uint64_t v389 = *(unsigned int *)(v387 + 184);
LABEL_497:
                  v390 = (NSString *)[v388 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_ENT", v389, @"Z_ENT", *(unsigned int *)(v385 + 184)];
                  v391 = [[NSSQLiteStatement alloc] initWithEntity:0];
                  v392 = v391;
                  if (v391)
                  {
                    v393 = v391->_sqlString;
                    if (v393 != v390)
                    {

                      v392->_sqlString = (NSString *)[(NSString *)v390 copy];
                    }
                  }

                  [*(id *)(v317 + 144) addObject:v392];
                }
              }
            }
          }
          uint64_t v379 = [v1114 countByEnumeratingWithState:&v1269 objects:&v1353 count:16];
        }
        while (v379);
      }
      v1034 = @"Z_PRIMARYKEY";
      v394 = (NSString *)[[NSString alloc] initWithFormat:@"DROP TABLE %@_ORIG"];
      v395 = [[NSSQLiteStatement alloc] initWithEntity:0];
      v396 = v395;
      if (v395)
      {
        v397 = v395->_sqlString;
        if (v397 != v394)
        {

          v396->_sqlString = (NSString *)[(NSString *)v394 copy];
        }
      }

      [*(id *)(v317 + 144) addObject:v396];
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1338[0] = @"Creation of update primary key table statements";
    v1338[1] = [NSNumber numberWithDouble:v398 - v316];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1338, 2), @"1.3");
  }
  if (*(unsigned char *)(v1140 + 64)) {
    _NSCoreDataLog(4, @"Finished creating schema migration statements", v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v1337[0] = @"Total preparation time for schema migration statements";
  v1337[1] = [NSNumber numberWithDouble:v399 - v19];
  objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1337, 2), @"1.0");
  if (*(unsigned char *)(v1140 + 64)) {
    _NSCoreDataLog(4, @"Beginning formal transaction", v400, v401, v402, v403, v404, v405, (uint64_t)v1034);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v407 = v406;
  -[NSSQLiteConnection beginTransaction](*(void *)(*(void *)(v1140 + 32) + 48));
  uint64_t v414 = *(void *)(v1140 + 32);
  if (v414 && *(unsigned char *)(v414 + 218))
  {
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Beginning forced migration", v408, v409, v410, v411, v412, v413, (uint64_t)v1034);
    }
  }
  else
  {
    if (*(unsigned char *)(v1140 + 64))
    {
      _NSCoreDataLog(4, @"Checking metadata", v408, v409, v410, v411, v412, v413, (uint64_t)v1034);
      uint64_t v414 = *(void *)(v1140 + 32);
    }
    if (v414) {
      v415 = *(void **)(v414 + 16);
    }
    else {
      v415 = 0;
    }
    id v416 = -[NSManagedObjectModel _entityVersionHashesDigest]((id)[v415 managedObjectModel]);
    if (objc_msgSend((id)objc_msgSend(-[NSSQLiteConnection fetchMetadata](*(void *)(*(void *)(v1140 + 32) + 48)), "objectForKey:", 0x1ED796400), "isEqualToString:", v416))
    {
      _NSCoreDataLog(2, @"Migration was completed by another client", v417, v418, v419, v420, v421, v422, (uint64_t)v1034);
      v1131 = 0;
LABEL_522:
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Committing formal transaction", v423, v424, v425, v426, v427, v428, (uint64_t)v1034);
      }
      -[NSSQLiteConnection commitTransaction](*(void *)(*(void *)(v1140 + 32) + 48));
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished committing formal transaction", v429, v430, v431, v432, v433, v434, (uint64_t)v1034);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v436 = v435;
      v1285[0] = @"Time for COMMIT";
      v1285[1] = [NSNumber numberWithDouble:v435 - v407];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1285, 2), @"2.17");
      v1284[0] = @"Total formal transaction time";
      v1284[1] = [NSNumber numberWithDouble:v436 - v19];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1284, 2), @"2.0");
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Checkpointing WAL journal", v437, v438, v439, v440, v441, v442, (uint64_t)v1034);
      }
      CFMutableArrayRef v443 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(void *)(*(void *)(v1140 + 32) + 48), @"pragma wal_checkpoint(truncate)");
      if (v443) {
        CFRelease(v443);
      }
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished checkpointing WAL journal", v444, v445, v446, v447, v448, v449, (uint64_t)v1034);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) = 1;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Successfully completed lightweight migration on connection", v444, v445, v446, v447, v448, v449, (uint64_t)v1034);
      }
      if (*v1039) {
        -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1140 + 32) + 48), @"pragma cache_size = 512");
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v451 = v450;
      v1283[0] = @"Checkpoint time";
      v1283[1] = [NSNumber numberWithDouble:v450 - v436];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1283, 2), @"3.0");
      v1282[0] = @"Total migration time (on connection)";
      v1282[1] = [NSNumber numberWithDouble:v451 - v3];
      uint64_t v452 = MEMORY[0x18C127630](objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1282, 2), @"0.0"));
      if (*(unsigned char *)(v1140 + 64))
      {
        v453 = objc_msgSend((id)objc_msgSend(v1050, "allKeys"), "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
        long long v1143 = 0u;
        long long v1144 = 0u;
        long long v1141 = 0u;
        long long v1142 = 0u;
        uint64_t v454 = [v453 countByEnumeratingWithState:&v1141 objects:v1281 count:16];
        if (v454)
        {
          uint64_t v455 = *(void *)v1142;
          do
          {
            for (uint64_t i16 = 0; i16 != v454; ++i16)
            {
              if (*(void *)v1142 != v455) {
                objc_enumerationMutation(v453);
              }
              uint64_t v457 = *(void *)(*((void *)&v1141 + 1) + 8 * i16);
              v458 = (void *)[v1050 objectForKey:v457];
              [v458 firstObject];
              objc_msgSend((id)objc_msgSend(v458, "lastObject"), "doubleValue");
              if (v465 > 0.01) {
                _NSCoreDataLog(4, @"    Migration step %@ '%@' took %2.2f seconds", v459, v460, v461, v462, v463, v464, v457);
              }
            }
            uint64_t v454 = [v453 countByEnumeratingWithState:&v1141 objects:v1281 count:16];
          }
          while (v454);
        }
      }
      int v312 = 0;
      v466 = (void *)v452;
      uint64_t v313 = v1140;
      goto LABEL_1005;
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v19 = v467;
  v1336[0] = @"Beginning formal transaction";
  v1336[1] = [NSNumber numberWithDouble:v467 - v407];
  objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1336, 2), @"2.1");
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1140 + 32) + 152), "objectForKey:", @"deleted"), "count"))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v475 = v474;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin dropping attribute extensions.", v468, v469, v470, v471, v472, v473, (uint64_t)v1034);
    }
    long long v1244 = 0u;
    long long v1243 = 0u;
    long long v1242 = 0u;
    long long v1241 = 0u;
    v476 = (void *)[*(id *)(*(void *)(v1140 + 32) + 152) objectForKey:@"deleted"];
    uint64_t v477 = [v476 countByEnumeratingWithState:&v1241 objects:v1335 count:16];
    if (v477)
    {
      id v1115 = *(id *)v1242;
      id v1087 = v476;
      do
      {
        v484 = 0;
        id v1100 = (id)v477;
        do
        {
          if (*(id *)v1242 != v1115) {
            objc_enumerationMutation(v1087);
          }
          v485 = *(void **)(*((void *)&v1241 + 1) + 8 * (void)v484);
          id v1132 = (id)MEMORY[0x18C127630]();
          int v486 = [v485 validate:*(void *)(v1140 + 56)];
          if (v486)
          {
            long long v1240 = 0u;
            long long v1239 = 0u;
            long long v1238 = 0u;
            long long v1237 = 0u;
            v487 = (void *)[v485 dropSQLStrings];
            uint64_t v488 = [v487 countByEnumeratingWithState:&v1237 objects:v1334 count:16];
            if (v488)
            {
              uint64_t v489 = *(void *)v1238;
              do
              {
                for (uint64_t i17 = 0; i17 != v488; ++i17)
                {
                  if (*(void *)v1238 != v489) {
                    objc_enumerationMutation(v487);
                  }
                  uint64_t v491 = *(void *)(*((void *)&v1237 + 1) + 8 * i17);
                  v492 = (void *)MEMORY[0x18C127630]();
                  v493 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v491];
                  v500 = v493;
                  if (*(unsigned char *)(v1140 + 64)) {
                    _NSCoreDataLog(4, @"Executing drop attribute extension statement: %@", v494, v495, v496, v497, v498, v499, (uint64_t)v493);
                  }
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v500);
                }
                uint64_t v488 = [v487 countByEnumeratingWithState:&v1237 objects:v1334 count:16];
              }
              while (v488);
            }
          }
          else
          {
            id v501 = *(id *)(*(void *)(*(void *)(v1140 + 40) + 8) + 40);
            *(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) = 0;
          }
          if (!v486) {
            goto LABEL_844;
          }
          v484 = (char *)v484 + 1;
        }
        while (v484 != v1100);
        uint64_t v477 = [v1087 countByEnumeratingWithState:&v1241 objects:v1335 count:16];
      }
      while (v477);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished dropping attribute extensions.", v478, v479, v480, v481, v482, v483, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1333[0] = @"Drop attribute extensions";
    v1333[1] = [NSNumber numberWithDouble:v502 - v475];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1333, 2), @"2.2");
  }
  if ([*(id *)(*(void *)(v1140 + 32) + 184) count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v510 = v509;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin dropping derived properties.", v503, v504, v505, v506, v507, v508, (uint64_t)v1034);
    }
    long long v1236 = 0u;
    long long v1235 = 0u;
    long long v1234 = 0u;
    long long v1233 = 0u;
    id v1116 = *(id *)(*(void *)(v1140 + 32) + 184);
    uint64_t v517 = [v1116 countByEnumeratingWithState:&v1233 objects:v1332 count:16];
    if (v517)
    {
      id v1133 = *(id *)v1234;
      do
      {
        uint64_t v518 = 0;
        do
        {
          if (*(id *)v1234 != v1133) {
            objc_enumerationMutation(v1116);
          }
          uint64_t v519 = *(void *)(*((void *)&v1233 + 1) + 8 * v518);
          v520 = (void *)MEMORY[0x18C127630]();
          if (v519)
          {
            -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v519);
            v521 = *(void **)(v519 + 32);
          }
          else
          {
            v521 = 0;
          }
          v522 = (void *)[v521 valueForKey:@"dropStatements"];
          long long v1232 = 0u;
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          uint64_t v523 = [v522 countByEnumeratingWithState:&v1229 objects:v1331 count:16];
          if (v523)
          {
            uint64_t v524 = *(void *)v1230;
            do
            {
              for (uint64_t i18 = 0; i18 != v523; ++i18)
              {
                if (*(void *)v1230 != v524) {
                  objc_enumerationMutation(v522);
                }
                v526 = *(void **)(*((void *)&v1229 + 1) + 8 * i18);
                v533 = (void *)MEMORY[0x18C127630]();
                if (*(unsigned char *)(v1140 + 64)) {
                  _NSCoreDataLog(4, @"Executing drop derived property statement: %@", v527, v528, v529, v530, v531, v532, (uint64_t)v526);
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v526);
              }
              uint64_t v523 = [v522 countByEnumeratingWithState:&v1229 objects:v1331 count:16];
            }
            while (v523);
          }
          ++v518;
        }
        while (v518 != v517);
        uint64_t v534 = [v1116 countByEnumeratingWithState:&v1233 objects:v1332 count:16];
        uint64_t v517 = v534;
      }
      while (v534);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"End dropping derived properties.", v511, v512, v513, v514, v515, v516, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1330[0] = @"Drop derived properties";
    v1330[1] = [NSNumber numberWithDouble:v535 - v510];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1330, 2), @"2.3");
  }
  if ([*(id *)(*(void *)(v1140 + 32) + 168) count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v543 = v542;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin dropping indices.", v536, v537, v538, v539, v540, v541, (uint64_t)v1034);
    }
    long long v1228 = 0u;
    long long v1227 = 0u;
    long long v1226 = 0u;
    long long v1225 = 0u;
    id v1117 = *(id *)(*(void *)(v1140 + 32) + 168);
    uint64_t v550 = [v1117 countByEnumeratingWithState:&v1225 objects:v1329 count:16];
    if (v550)
    {
      id v1134 = *(id *)v1226;
      do
      {
        for (uint64_t i19 = 0; i19 != v550; ++i19)
        {
          if (*(id *)v1226 != v1134) {
            objc_enumerationMutation(v1117);
          }
          v552 = *(void **)(*((void *)&v1225 + 1) + 8 * i19);
          v553 = (void *)MEMORY[0x18C127630]();
          v554 = (void *)[v552 dropStatementsForStore:*(void *)(*(void *)(v1140 + 32) + 8)];
          long long v1224 = 0u;
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          uint64_t v555 = [v554 countByEnumeratingWithState:&v1221 objects:v1328 count:16];
          if (v555)
          {
            uint64_t v556 = *(void *)v1222;
            do
            {
              for (uint64_t i20 = 0; i20 != v555; ++i20)
              {
                if (*(void *)v1222 != v556) {
                  objc_enumerationMutation(v554);
                }
                v558 = *(void **)(*((void *)&v1221 + 1) + 8 * i20);
                v565 = (void *)MEMORY[0x18C127630]();
                if (*(unsigned char *)(v1140 + 64)) {
                  _NSCoreDataLog(4, @"Executing drop index statement: %@", v559, v560, v561, v562, v563, v564, (uint64_t)v558);
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v558);
              }
              uint64_t v555 = [v554 countByEnumeratingWithState:&v1221 objects:v1328 count:16];
            }
            while (v555);
          }
        }
        uint64_t v550 = [v1117 countByEnumeratingWithState:&v1225 objects:v1329 count:16];
      }
      while (v550);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished dropping indices.", v544, v545, v546, v547, v548, v549, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1327[0] = @"Drop indices";
    v1327[1] = [NSNumber numberWithDouble:v566 - v543];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1327, 2), @"2.4");
  }
  if ([v1049 count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v574 = v573;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin entity schema & data migration statements.", v567, v568, v569, v570, v571, v572, (uint64_t)v1034);
    }
    long long v1220 = 0u;
    long long v1219 = 0u;
    long long v1218 = 0u;
    long long v1217 = 0u;
    uint64_t v581 = [v1049 countByEnumeratingWithState:&v1217 objects:v1326 count:16];
    if (v581)
    {
      uint64_t v582 = *(void *)v1218;
      do
      {
        uint64_t v583 = 0;
        do
        {
          if (*(void *)v1218 != v582) {
            objc_enumerationMutation(v1049);
          }
          v584 = *(void **)(*((void *)&v1217 + 1) + 8 * v583);
          v591 = (void *)MEMORY[0x18C127630]();
          if (*(unsigned char *)(v1140 + 64)) {
            _NSCoreDataLog(4, @"Executing entity schema & data migration statement: %@", v585, v586, v587, v588, v589, v590, (uint64_t)v584);
          }
          if (*(unsigned char *)(v1140 + 66))
          {
            v592 = (void *)[v584 sqlString];
            if ([v592 hasPrefix:@"CREATE TABLE Z_48ACTIONMEDIAPLAYBACKS_"])
            {
              uint64_t v593 = *(void *)(*(void *)(v1140 + 32) + 48);
              if (!v593
                || (-[NSSQLiteConnection _hasTableWithName:isTemp:](v593, @"Z_48ACTIONMEDIAPLAYBACKS_", 0) & 1) == 0)
              {
                goto LABEL_636;
              }
              goto LABEL_635;
            }
            if (![v592 isEqualToString:@"DROP TABLE Z_47ACTIONMEDIAPLAYBACKS_"])
            {
              int v596 = [v592 isEqualToString:@"ALTER TABLE Z_47ACTIONMEDIAPLAYBACKS_TEMP RENAME TO Z_48ACTIONMEDIAPLAYBACKS_"];
              uint64_t v594 = *(void *)(*(void *)(v1140 + 32) + 48);
              if (!v596) {
                goto LABEL_637;
              }
              if (!v594
                || !-[NSSQLiteConnection _hasTableWithName:isTemp:](v594, @"Z_48ACTIONMEDIAPLAYBACKS_", 0))
              {
LABEL_636:
                uint64_t v594 = *(void *)(*(void *)(v1140 + 32) + 48);
LABEL_637:
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v594, v584);
                goto LABEL_639;
              }
LABEL_635:
              -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1140 + 32) + 48), @"DROP TABLE Z_48ACTIONMEDIAPLAYBACKS_");
              goto LABEL_636;
            }
            uint64_t v595 = *(void *)(*(void *)(v1140 + 32) + 48);
            if (v595
              && -[NSSQLiteConnection _hasTableWithName:isTemp:](v595, @"Z_47ACTIONMEDIAPLAYBACKS_", 0))
            {
              -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1140 + 32) + 48), @"DROP TABLE Z_47ACTIONMEDIAPLAYBACKS_");
            }
          }
          else
          {
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v584);
          }
LABEL_639:
          ++v583;
        }
        while (v581 != v583);
        uint64_t v597 = [v1049 countByEnumeratingWithState:&v1217 objects:v1326 count:16];
        uint64_t v581 = v597;
      }
      while (v597);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished entity schema & data migration statements.", v575, v576, v577, v578, v579, v580, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1325[0] = @"Execution of entity schema and data migration statements";
    v1325[1] = [NSNumber numberWithDouble:v598 - v574];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1325, 2), @"2.5");

    id v1049 = 0;
  }
  if ([v1082 count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v606 = v605;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin updating entity key columns.", v599, v600, v601, v602, v603, v604, (uint64_t)v1034);
    }
    long long v1216 = 0u;
    long long v1215 = 0u;
    long long v1214 = 0u;
    long long v1213 = 0u;
    uint64_t v613 = [v1082 countByEnumeratingWithState:&v1213 objects:v1324 count:16];
    if (v613)
    {
      uint64_t v614 = *(void *)v1214;
      do
      {
        for (uint64_t i21 = 0; i21 != v613; ++i21)
        {
          if (*(void *)v1214 != v614) {
            objc_enumerationMutation(v1082);
          }
          v616 = *(void **)(*((void *)&v1213 + 1) + 8 * i21);
          v623 = (void *)MEMORY[0x18C127630]();
          if (*(unsigned char *)(v1140 + 64)) {
            _NSCoreDataLog(4, @"Executing entity key column update statement: %@", v617, v618, v619, v620, v621, v622, (uint64_t)v616);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v616);
        }
        uint64_t v613 = [v1082 countByEnumeratingWithState:&v1213 objects:v1324 count:16];
      }
      while (v613);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished updating entity key columns.", v607, v608, v609, v610, v611, v612, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1323[0] = @"Execution of entity key column updates";
    v1323[1] = [NSNumber numberWithDouble:v624 - v606];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1323, 2), @"2.6");

    id v1082 = 0;
  }
  uint64_t v625 = *(void *)(v1140 + 32);
  if (*(unsigned char *)(v625 + 136))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v633 = v632;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin updating primary key table.", v626, v627, v628, v629, v630, v631, (uint64_t)v1034);
    }
    long long v1212 = 0u;
    long long v1211 = 0u;
    long long v1210 = 0u;
    long long v1209 = 0u;
    v634 = *(void **)(*(void *)(v1140 + 32) + 144);
    uint64_t v641 = [v634 countByEnumeratingWithState:&v1209 objects:v1322 count:16];
    if (v641)
    {
      uint64_t v642 = *(void *)v1210;
      do
      {
        for (uint64_t i22 = 0; i22 != v641; ++i22)
        {
          if (*(void *)v1210 != v642) {
            objc_enumerationMutation(v634);
          }
          v644 = *(void **)(*((void *)&v1209 + 1) + 8 * i22);
          v645 = (void *)MEMORY[0x18C127630]();
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v644);
        }
        uint64_t v641 = [v634 countByEnumeratingWithState:&v1209 objects:v1322 count:16];
      }
      while (v641);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished updating primary key table.", v635, v636, v637, v638, v639, v640, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1321[0] = @"Update primary key table";
    v1321[1] = [NSNumber numberWithDouble:v646 - v633];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1321, 2), @"2.7");
    uint64_t v625 = *(void *)(v1140 + 32);
  }
  if ([*(id *)(v625 + 176) count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v654 = v653;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Begin updating default values.", v647, v648, v649, v650, v651, v652, (uint64_t)v1034);
    }
    long long v1208 = 0u;
    long long v1207 = 0u;
    long long v1206 = 0u;
    long long v1205 = 0u;
    v655 = *(void **)(*(void *)(v1140 + 32) + 176);
    uint64_t v662 = [v655 countByEnumeratingWithState:&v1205 objects:v1320 count:16];
    if (v662)
    {
      uint64_t v663 = *(void *)v1206;
      do
      {
        for (uint64_t i23 = 0; i23 != v662; ++i23)
        {
          if (*(void *)v1206 != v663) {
            objc_enumerationMutation(v655);
          }
          v665 = *(void **)(*((void *)&v1205 + 1) + 8 * i23);
          v666 = (void *)MEMORY[0x18C127630]();
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v665);
        }
        uint64_t v662 = [v655 countByEnumeratingWithState:&v1205 objects:v1320 count:16];
      }
      while (v662);
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished updating default values.", v656, v657, v658, v659, v660, v661, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1319[0] = @"Update default values";
    v1319[1] = [NSNumber numberWithDouble:v667 - v654];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1319, 2), @"2.7.1");
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1140 + 32) + 152), "objectForKey:", @"inserted"), "count"))
  {
LABEL_729:
    if ([*(id *)(*(void *)(v1140 + 32) + 160) count])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v722 = v721;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Begin index creation and updates.", v715, v716, v717, v718, v719, v720, (uint64_t)v1034);
      }
      long long v1192 = 0u;
      long long v1191 = 0u;
      long long v1190 = 0u;
      long long v1189 = 0u;
      id v1089 = *(id *)(*(void *)(v1140 + 32) + 160);
      uint64_t v729 = [v1089 countByEnumeratingWithState:&v1189 objects:v1314 count:16];
      if (v729)
      {
        id v1102 = *(id *)v1190;
        do
        {
          v730 = 0;
          id v1119 = (id)v729;
          do
          {
            if (*(id *)v1190 != v1102) {
              objc_enumerationMutation(v1089);
            }
            v731 = *(void **)(*((void *)&v1189 + 1) + 8 * (void)v730);
            id v1136 = (id)MEMORY[0x18C127630]();
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v733 = v732;
            v734 = (void *)[v731 generateStatementsForStore:*(void *)(*(void *)(v1140 + 32) + 8)];
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v736 = v735;
            v1313[0] = @"Generate index creation statements";
            v1313[1] = [NSNumber numberWithDouble:v735 - v733];
            objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1313, 2), @"2.9.1");
            long long v1187 = 0u;
            long long v1188 = 0u;
            long long v1185 = 0u;
            long long v1186 = 0u;
            uint64_t v737 = [v734 countByEnumeratingWithState:&v1185 objects:v1312 count:16];
            if (v737)
            {
              uint64_t v738 = *(void *)v1186;
              do
              {
                for (uint64_t i24 = 0; i24 != v737; ++i24)
                {
                  if (*(void *)v1186 != v738) {
                    objc_enumerationMutation(v734);
                  }
                  v740 = *(void **)(*((void *)&v1185 + 1) + 8 * i24);
                  v747 = (void *)MEMORY[0x18C127630]();
                  if (*(unsigned char *)(v1140 + 64)) {
                    _NSCoreDataLog(4, @"Executing index creation statement: %@", v741, v742, v743, v744, v745, v746, (uint64_t)v740);
                  }
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v740);
                }
                uint64_t v737 = [v734 countByEnumeratingWithState:&v1185 objects:v1312 count:16];
              }
              while (v737);
            }
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v749 = v748;
            v1311[0] = @"Execute index creation statements";
            v1311[1] = [NSNumber numberWithDouble:v748 - v736];
            objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1311, 2), @"2.9.2");
            v750 = (void *)[v731 bulkUpdateStatementsForStore:*(void *)(*(void *)(v1140 + 32) + 8)];
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v752 = v751;
            v1310[0] = @"Generate index update statements";
            v1310[1] = [NSNumber numberWithDouble:v751 - v749];
            objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1310, 2), @"2.9.3");
            long long v1183 = 0u;
            long long v1184 = 0u;
            long long v1181 = 0u;
            long long v1182 = 0u;
            uint64_t v753 = [v750 countByEnumeratingWithState:&v1181 objects:v1309 count:16];
            if (v753)
            {
              uint64_t v754 = *(void *)v1182;
              do
              {
                for (uint64_t i25 = 0; i25 != v753; ++i25)
                {
                  if (*(void *)v1182 != v754) {
                    objc_enumerationMutation(v750);
                  }
                  v756 = *(void **)(*((void *)&v1181 + 1) + 8 * i25);
                  v763 = (void *)MEMORY[0x18C127630]();
                  if (*(unsigned char *)(v1140 + 64)) {
                    _NSCoreDataLog(4, @"Executing index update statement: %@", v757, v758, v759, v760, v761, v762, (uint64_t)v756);
                  }
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v756);
                }
                uint64_t v753 = [v750 countByEnumeratingWithState:&v1181 objects:v1309 count:16];
              }
              while (v753);
            }
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v1308[0] = @"Execute index update statements";
            v1308[1] = [NSNumber numberWithDouble:v764 - v752];
            objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1308, 2), @"2.9.4");
            v730 = (char *)v730 + 1;
          }
          while (v730 != v1119);
          uint64_t v729 = [v1089 countByEnumeratingWithState:&v1189 objects:v1314 count:16];
        }
        while (v729);
      }
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished index creation and updates.", v723, v724, v725, v726, v727, v728, (uint64_t)v1034);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1307[0] = @"Total index creation and update time";
      v1307[1] = [NSNumber numberWithDouble:v765 - v722];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1307, 2), @"2.9");
    }
    uint64_t v766 = *(void *)(*(void *)(v1140 + 32) + 16);
    if (v766) {
      v767 = *(void **)(v766 + 24);
    }
    else {
      v767 = 0;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v769 = v768;
    long long v1179 = 0u;
    long long v1180 = 0u;
    long long v1177 = 0u;
    long long v1178 = 0u;
    uint64_t v770 = [v767 countByEnumeratingWithState:&v1177 objects:v1306 count:16];
    if (v770)
    {
      char v1137 = 0;
      uint64_t v771 = *(void *)v1178;
      do
      {
        uint64_t v772 = 0;
        do
        {
          if (*(void *)v1178 != v771) {
            objc_enumerationMutation(v767);
          }
          uint64_t v773 = *(void *)(*((void *)&v1177 + 1) + 8 * v772);
          v774 = (void *)MEMORY[0x18C127630]();
          uint64_t v775 = [v767 objectForKey:v773];
          v776 = (void *)v775;
          if (v775)
          {
            if (!*(void *)(v775 + 160))
            {
              v777 = *(void **)(v775 + 152);
              if (v777)
              {
                if ([v777 count])
                {
                  v778 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v776, "entityDescription"), "userInfo"), "objectForKey:", @"_NSEntityOmitSubentityColumnIndex");
                  v779 = v778;
                  if (v778)
                  {
                    if ([v778 isNSString])
                    {
                      v780 = (void *)[v779 lowercaseString];
                      v781 = v780;
                      if (v780)
                      {
                        if (([v780 isEqualToString:@"yes"] & 1) != 0
                          || [v781 isEqualToString:@"1"])
                        {
                          v782 = NSString;
                          v1034 = (__CFString *)[v776 tableName];
                          uint64_t v783 = [v782 stringWithFormat:@"DROP INDEX IF EXISTS %@_Z_ENT_INDEX"];
                          v790 = (void *)v783;
                          if (*(unsigned char *)(v1140 + 64)) {
                            _NSCoreDataLog(4, @"Executing drop Z_ENT index statement: %@", v784, v785, v786, v787, v788, v789, v783);
                          }
                          -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1140 + 32) + 48), v790);
                          char v1137 = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          ++v772;
        }
        while (v770 != v772);
        uint64_t v791 = [v767 countByEnumeratingWithState:&v1177 objects:v1306 count:16];
        uint64_t v770 = v791;
      }
      while (v791);
      if (v1137)
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v1305[0] = @"Dropping Z_ENT indices";
        v1305[1] = [NSNumber numberWithDouble:v792 - v769];
        objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1305, 2), @"2.10");
      }
    }
    if ([*(id *)(*(void *)(v1140 + 32) + 192) count])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v800 = v799;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Begin updating derived properties.", v793, v794, v795, v796, v797, v798, (uint64_t)v1034);
      }
      long long v1175 = 0u;
      long long v1176 = 0u;
      long long v1173 = 0u;
      long long v1174 = 0u;
      id v1090 = *(id *)(*(void *)(v1140 + 32) + 192);
      uint64_t v801 = [v1090 countByEnumeratingWithState:&v1173 objects:v1304 count:16];
      if (v801)
      {
        id v1103 = *(id *)v1174;
        do
        {
          v808 = 0;
          id v1120 = (id)v801;
          do
          {
            if (*(id *)v1174 != v1103) {
              objc_enumerationMutation(v1090);
            }
            uint64_t v809 = *(void *)(*((void *)&v1173 + 1) + 8 * (void)v808);
            id v1138 = (id)MEMORY[0x18C127630]();
            if (v809)
            {
              -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v809);
              v810 = *(void **)(v809 + 32);
            }
            else
            {
              v810 = 0;
            }
            v811 = (void *)[v810 valueForKey:@"dataStatements"];
            long long v1171 = 0u;
            long long v1172 = 0u;
            long long v1169 = 0u;
            long long v1170 = 0u;
            uint64_t v812 = [v811 countByEnumeratingWithState:&v1169 objects:v1303 count:16];
            if (v812)
            {
              uint64_t v813 = *(void *)v1170;
              do
              {
                for (uint64_t i26 = 0; i26 != v812; ++i26)
                {
                  if (*(void *)v1170 != v813) {
                    objc_enumerationMutation(v811);
                  }
                  v815 = *(void **)(*((void *)&v1169 + 1) + 8 * i26);
                  v822 = (void *)MEMORY[0x18C127630]();
                  if (*(unsigned char *)(v1140 + 64)) {
                    _NSCoreDataLog(4, @"Executing derived property update statement (data): %@", v816, v817, v818, v819, v820, v821, (uint64_t)v815);
                  }
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v815);
                }
                uint64_t v812 = [v811 countByEnumeratingWithState:&v1169 objects:v1303 count:16];
              }
              while (v812);
            }
            if (v809)
            {
              -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v809);
              v823 = *(void **)(v809 + 32);
            }
            else
            {
              v823 = 0;
            }
            v824 = (void *)[v823 valueForKey:@"triggerCreationStatements"];
            long long v1167 = 0u;
            long long v1168 = 0u;
            long long v1165 = 0u;
            long long v1166 = 0u;
            uint64_t v825 = [v824 countByEnumeratingWithState:&v1165 objects:v1302 count:16];
            if (v825)
            {
              uint64_t v826 = *(void *)v1166;
              do
              {
                for (uint64_t i27 = 0; i27 != v825; ++i27)
                {
                  if (*(void *)v1166 != v826) {
                    objc_enumerationMutation(v824);
                  }
                  v828 = *(void **)(*((void *)&v1165 + 1) + 8 * i27);
                  v835 = (void *)MEMORY[0x18C127630]();
                  if (*(unsigned char *)(v1140 + 64)) {
                    _NSCoreDataLog(4, @"Executing derived property update statement (trigger): %@", v829, v830, v831, v832, v833, v834, (uint64_t)v828);
                  }
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v828);
                }
                uint64_t v825 = [v824 countByEnumeratingWithState:&v1165 objects:v1302 count:16];
              }
              while (v825);
            }
            v808 = (char *)v808 + 1;
          }
          while (v808 != v1120);
          uint64_t v801 = [v1090 countByEnumeratingWithState:&v1173 objects:v1304 count:16];
        }
        while (v801);
      }
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished updating derived properties.", v802, v803, v804, v805, v806, v807, (uint64_t)v1034);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1301[0] = @"Update derived properties";
      v1301[1] = [NSNumber numberWithDouble:v836 - v800];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1301, 2), @"2.11");
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v838 = v837;
    id v1091 = (id)MEMORY[0x18C127630]();
    long long v1163 = 0u;
    long long v1164 = 0u;
    long long v1161 = 0u;
    long long v1162 = 0u;
    v839 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1140 + 32) + 8), "ancillarySQLModels"), "allValues");
    uint64_t v840 = [v839 countByEnumeratingWithState:&v1161 objects:v1300 count:16];
    if (v840)
    {
      char v841 = 0;
      id v1104 = v839;
      id v1121 = *(id *)v1162;
      do
      {
        v842 = 0;
        id v1139 = (id)v840;
        do
        {
          if (*(id *)v1162 != v1121) {
            objc_enumerationMutation(v1104);
          }
          uint64_t v843 = *(void *)(*((void *)&v1161 + 1) + 8 * (void)v842);
          v844 = (void *)MEMORY[0x18C127630]();
          long long v1159 = 0u;
          long long v1160 = 0u;
          long long v1157 = 0u;
          long long v1158 = 0u;
          if (v843) {
            v845 = *(void **)(v843 + 32);
          }
          else {
            v845 = 0;
          }
          uint64_t v846 = [v845 countByEnumeratingWithState:&v1157 objects:v1299 count:16];
          if (v846)
          {
            uint64_t v847 = *(void *)v1158;
            do
            {
              for (uint64_t i28 = 0; i28 != v846; ++i28)
              {
                if (*(void *)v1158 != v847) {
                  objc_enumerationMutation(v845);
                }
                v849 = *(void **)(*((void *)&v1157 + 1) + 8 * i28);
                v850 = (void *)MEMORY[0x18C127630]();
                uint64_t v851 = *(void *)(*(void *)(v1140 + 32) + 48);
                uint64_t v852 = [v849 tableName];
                if (v851 && -[NSSQLiteConnection _hasTableWithName:isTemp:](v851, v852, 0))
                {
                  -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](*(void *)(*(void *)(v1140 + 32) + 48), (uint64_t)v849, 0);
                  char v841 = 1;
                }
              }
              uint64_t v846 = [v845 countByEnumeratingWithState:&v1157 objects:v1299 count:16];
            }
            while (v846);
          }
          v842 = (char *)v842 + 1;
        }
        while (v842 != v1139);
        uint64_t v840 = [v1104 countByEnumeratingWithState:&v1161 objects:v1300 count:16];
      }
      while (v840);
    }
    else
    {
      char v841 = 0;
    }
    if (v841)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1298[0] = @"Update ancillary model primary keys";
      v1298[1] = [NSNumber numberWithDouble:v853 - v838];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1298, 2), @"2.12");
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v855 = v854;
    v856 = (void *)MEMORY[0x18C127630]();
    if (-[NSSQLiteConnection hasIndexTrackingTable](*(void *)(*(void *)(v1140 + 32) + 48)))
    {
      -[NSSQLiteConnection dropIndexTrackingTable](*(void **)(*(void *)(v1140 + 32) + 48));
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1297[0] = @"Drop index tracking table";
      v1297[1] = [NSNumber numberWithDouble:v857 - v855];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1297, 2), @"2.13");
    }
    int hasPersistentHistory = -[NSSQLiteConnection _hasPersistentHistoryTables](*(void *)(*(void *)(v1140 + 32) + 48));
    if (hasPersistentHistory)
    {
      v859 = (void *)MEMORY[0x18C127630]();
      uint64_t v860 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v868 = v867;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Beginning persistent history metadata tables update", v861, v862, v863, v864, v865, v866, (uint64_t)v1034);
      }
      v869 = (void *)MEMORY[0x18C127630](v860);
      char v870 = -[_NSSQLiteStoreMigrator deleteStatementsForHistory](*(void *)(v1140 + 32));
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v872 = v871;
      v1296[0] = @"Generate persistent history delete statements";
      v1296[1] = [NSNumber numberWithDouble:v871 - v868];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1296, 2), @"2.14.1");
      v873 = -[_NSSQLiteStoreMigrator updateStatementsForHistoryChanges](*(uint64_t **)(v1140 + 32));
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v875 = v874;
      v1295[0] = @"Generate persistent history update statements";
      v1295[1] = [NSNumber numberWithDouble:v874 - v872];
      uint64_t v876 = objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1295, 2), @"2.14.2");
      if (v873) {
        char v883 = v870;
      }
      else {
        char v883 = 0;
      }
      if (v883)
      {
        long long v1155 = 0u;
        long long v1156 = 0u;
        long long v1153 = 0u;
        long long v1154 = 0u;
        uint64_t v884 = [v873 countByEnumeratingWithState:&v1153 objects:v1293 count:16];
        if (v884)
        {
          uint64_t v885 = *(void *)v1154;
          do
          {
            for (uint64_t i29 = 0; i29 != v884; ++i29)
            {
              if (*(void *)v1154 != v885) {
                objc_enumerationMutation(v873);
              }
              v887 = *(void **)(*((void *)&v1153 + 1) + 8 * i29);
              v894 = (void *)MEMORY[0x18C127630]();
              if (*(unsigned char *)(v1140 + 64)) {
                _NSCoreDataLog(4, @"Executing history migration statement: %@", v888, v889, v890, v891, v892, v893, (uint64_t)v887);
              }
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v887);
            }
            uint64_t v884 = [v873 countByEnumeratingWithState:&v1153 objects:v1293 count:16];
          }
          while (v884);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v1292[0] = @"Execution of persistent history migration";
        v1292[1] = [NSNumber numberWithDouble:v895 - v875];
        objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1292, 2), @"2.14.4");
      }
      else
      {
        if (*(unsigned char *)(v1140 + 64)) {
          _NSCoreDataLog(2, @"Dropping Persistent History b/c of an issue with migration", v877, v878, v879, v880, v881, v882, (uint64_t)v1034);
        }
        v902 = (void *)MEMORY[0x18C127630](v876);
        -[NSSQLiteConnection dropHistoryTrackingTables](*(id **)(*(void *)(v1140 + 32) + 48));
        if (*(unsigned char *)(v1140 + 64)) {
          _NSCoreDataLog(2, @"Finished dropping Persistent History b/c of an issue with migration", v903, v904, v905, v906, v907, v908, (uint64_t)v1034);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v1294[0] = @"Drop persistent history tables";
        v1294[1] = [NSNumber numberWithDouble:v909 - v875];
        objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1294, 2), @"2.14.3");
      }
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Completed persistent history metadata tables update", v896, v897, v898, v899, v900, v901, (uint64_t)v1034);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1291[0] = @"Total persistent history migration";
      v1291[1] = [NSNumber numberWithDouble:v910 - v868];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1291, 2), @"2.14");
    }
    if ([*(id *)(*(void *)(v1140 + 32) + 208) count])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v918 = v917;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Beginning CloudKit metadata tables update", v911, v912, v913, v914, v915, v916, (uint64_t)v1034);
      }
      long long v1151 = 0u;
      long long v1152 = 0u;
      long long v1149 = 0u;
      long long v1150 = 0u;
      v919 = *(void **)(*(void *)(v1140 + 32) + 208);
      uint64_t v926 = [v919 countByEnumeratingWithState:&v1149 objects:v1290 count:16];
      if (v926)
      {
        uint64_t v927 = *(void *)v1150;
        do
        {
          for (uint64_t i30 = 0; i30 != v926; ++i30)
          {
            if (*(void *)v1150 != v927) {
              objc_enumerationMutation(v919);
            }
            v929 = *(void **)(*((void *)&v1149 + 1) + 8 * i30);
            v936 = (void *)MEMORY[0x18C127630]();
            if (*(unsigned char *)(v1140 + 64)) {
              _NSCoreDataLog(4, @"Executing CloudKit metadata table update: %@", v930, v931, v932, v933, v934, v935, (uint64_t)v929);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v929);
          }
          uint64_t v926 = [v919 countByEnumeratingWithState:&v1149 objects:v1290 count:16];
        }
        while (v926);
      }
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished CloudKit metadata tables update", v920, v921, v922, v923, v924, v925, (uint64_t)v1034);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v1289[0] = @"CloudKit metadata updates";
      v1289[1] = [NSNumber numberWithDouble:v937 - v918];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1289, 2), @"2.15");
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v945 = v944;
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Updating metadata", v938, v939, v940, v941, v942, v943, (uint64_t)v1034);
    }
    v946 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1140 + 32) + 8), "metadata"), "mutableCopy");
    v1131 = v946;
    v947 = (void *)[*(id *)(*(void *)(v1140 + 32) + 16) managedObjectModel];
    v948 = (void *)[v947 entityVersionHashesByName];
    [(__CFString *)v946 setObject:v948 forKey:@"NSStoreModelVersionHashes"];
    id v949 = -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v947, v948);
    [(__CFString *)v946 setObject:v949 forKey:0x1ED796400];
    -[__CFString setObject:forKey:](v946, "setObject:forKey:", [v947 versionChecksum], @"NSStoreModelVersionChecksumKey");
    if (v947) {
      uint64_t v950 = objc_msgSend((id)objc_msgSend(v947, "versionIdentifiers"), "allObjects");
    }
    else {
      uint64_t v950 = 0;
    }
    [(__CFString *)v946 setObject:v950 forKey:@"NSStoreModelVersionIdentifiers"];
    uint64_t v951 = [(id)objc_opt_class() _annotatesMigrationMetadata];
    if (v951) {
      uint64_t v951 = [(__CFString *)v946 setObject:@"NSSQLiteInPlaceMigrationManager" forKey:@"migrationManagerClass"];
    }
    uint64_t v952 = *(void *)(v1140 + 32);
    if (v952 && *(unsigned char *)(v952 + 217)) {
      uint64_t v951 = [(__CFString *)v946 setValue:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreDeferredLightweightMigrationOptionKey"];
    }
    v953 = (void *)MEMORY[0x18C127630](v951);
    -[NSSQLiteConnection saveMetadata:](*(void **)(*(void *)(v1140 + 32) + 48), v946);
    -[NSSQLiteConnection saveCachedModel:](*(void *)(*(void *)(v1140 + 32) + 48), (uint64_t)v947);
    if (hasPersistentHistory) {
      -[NSSQLiteConnection processMigrationRequestForHash:stageLabel:](*(void *)(*(void *)(v1140 + 32) + 48), (uint64_t)v949, *(void *)(*(void *)(v1140 + 32) + 232));
    }
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished updating metadata", v954, v955, v956, v957, v958, v959, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v407 = v960;
    v1288[0] = @"Update store metadata";
    v1288[1] = [NSNumber numberWithDouble:v960 - v945];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1288, 2), @"2.16");
    if (-[NSMappingModel _hasInferredMappingNeedingValidation](*(void *)(*(void *)(v1140 + 32) + 40)))
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v968 = v967;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Starting inferred mapping validation", v961, v962, v963, v964, v965, v966, (uint64_t)v1034);
      }
      long long v1147 = 0u;
      long long v1148 = 0u;
      long long v1145 = 0u;
      long long v1146 = 0u;
      id v1047 = (id)[*(id *)(*(void *)(v1140 + 32) + 40) entityMappings];
      contextb = (void *)[v1047 countByEnumeratingWithState:&v1145 objects:v1287 count:16];
      if (contextb)
      {
        uint64_t v1056 = *(void *)v1146;
        do
        {
          for (i31 = 0; i31 != contextb; i31 = (char *)i31 + 1)
          {
            if (*(void *)v1146 != v1056) {
              objc_enumerationMutation(v1047);
            }
            v1071 = *(void **)(*((void *)&v1145 + 1) + 8 * (void)i31);
            v1061 = (void *)MEMORY[0x18C127630]();
            if (v1071)
            {
              v969 = (void *)[v1071 userInfo];
              if (objc_msgSend((id)objc_msgSend(v969, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue"))
              {
                if (*(unsigned char *)(v1140 + 64))
                {
                  uint64_t v970 = [v1071 name];
                  _NSCoreDataLog(4, @"Executing inferred mapping validation: %@", v971, v972, v973, v974, v975, v976, v970);
                }
                uint64_t v978 = *(void *)(v1140 + 32);
                uint64_t v977 = *(void *)(v1140 + 40);
                if (!v978) {
                  goto LABEL_993;
                }
                v1044 = *(void **)(v977 + 8);
                v979 = (id *)objc_msgSend(*(id *)(v978 + 16), "entityNamed:", objc_msgSend(v1071, "destinationEntityName"));
                long long v1360 = 0u;
                long long v1359 = 0u;
                long long v1358 = 0u;
                long long v1357 = 0u;
                v980 = (void *)[v1071 attributeMappings];
                uint64_t v981 = [v980 countByEnumeratingWithState:&v1357 objects:&v1371 count:16];
                if (v981)
                {
                  id v1092 = *(id *)v1358;
                  id obje = v980;
                  do
                  {
                    id v1105 = (id)v981;
                    id v1122 = 0;
                    do
                    {
                      if (*(id *)v1358 != v1092) {
                        objc_enumerationMutation(v980);
                      }
                      v982 = *(void **)(*((void *)&v1357 + 1) + 8 * (void)v1122);
                      long long v1353 = 0u;
                      long long v1354 = 0u;
                      long long v1355 = 0u;
                      long long v1356 = 0u;
                      if (v982) {
                        v983 = (void *)v982[2];
                      }
                      else {
                        v983 = 0;
                      }
                      uint64_t v984 = [v983 countByEnumeratingWithState:&v1353 objects:&v1369 count:16];
                      if (v984)
                      {
                        uint64_t v985 = *(void *)v1354;
                        do
                        {
                          uint64_t v986 = 0;
                          do
                          {
                            if (*(void *)v1354 != v985) {
                              objc_enumerationMutation(v983);
                            }
                            if (![*(id *)(*((void *)&v1353 + 1) + 8 * v986) isEqualToString:NSPropertyTransformMandatoryPropertyValidation])
                            {
                              v1023 = (void *)MEMORY[0x1E4F1CA00];
                              uint64_t v1024 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v982 forKey:@"propertyMapping"];
LABEL_989:
                              objc_exception_throw((id)[v1023 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unrecognized transform validation in property mapping" userInfo:v1024]);
                            }
                            uint64_t v987 = [v982 name];
                            if (v979) {
                              v988 = (void *)[v979[5] objectForKey:v987];
                            }
                            else {
                              v988 = 0;
                            }
                            v989 = (void *)[v988 propertyDescription];
                            if (v989 && [v989 superCompositeAttribute])
                            {
                              v990 = objc_msgSend((id)objc_msgSend(v988, "propertyDescription"), "superCompositeAttribute");
                              while (([v990 isOptional] & 1) == 0)
                              {
                                v990 = (void *)[v990 superCompositeAttribute];
                                if (!v990) {
                                  goto LABEL_936;
                                }
                              }
                            }
                            else
                            {
LABEL_936:
                              if (-[_NSSQLiteStoreMigrator _countNullsInColumn:forEntity:](v978, v988, (uint64_t)v979) >= 1)
                              {
                                v1025 = (void *)MEMORY[0x1E4F28C58];
                                uint64_t v1026 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Validation error missing attribute values on mandatory destination attribute", @"reason", objc_msgSend(v979, "name"), @"entity", objc_msgSend(v988, "name"), @"attribute", 0);
                                goto LABEL_992;
                              }
                            }
                            ++v986;
                          }
                          while (v986 != v984);
                          uint64_t v991 = [v983 countByEnumeratingWithState:&v1353 objects:&v1369 count:16];
                          uint64_t v984 = v991;
                        }
                        while (v991);
                      }
                      id v1122 = (char *)v1122 + 1;
                      v980 = obje;
                    }
                    while (v1122 != v1105);
                    uint64_t v992 = [obje countByEnumeratingWithState:&v1357 objects:&v1371 count:16];
                    uint64_t v981 = v992;
                  }
                  while (v992);
                }
                long long v1352 = 0u;
                long long v1351 = 0u;
                long long v1350 = 0u;
                long long v1349 = 0u;
                v993 = (void *)[v1071 relationshipMappings];
                uint64_t v994 = [v993 countByEnumeratingWithState:&v1349 objects:&v1365 count:16];
                if (!v994) {
                  goto LABEL_978;
                }
                id v1093 = *(id *)v1350;
                id objf = v993;
LABEL_947:
                v995 = 0;
                v1106 = (char *)v994;
                while (1)
                {
                  if (*(id *)v1350 != v1093) {
                    objc_enumerationMutation(v993);
                  }
                  v996 = *(void **)(*((void *)&v1349 + 1) + 8 * (void)v995);
                  long long v1345 = 0u;
                  long long v1346 = 0u;
                  long long v1347 = 0u;
                  long long v1348 = 0u;
                  v997 = v996 ? (void *)v996[2] : 0;
                  uint64_t v998 = [v997 countByEnumeratingWithState:&v1345 objects:&v1361 count:16];
                  v1123 = v995;
                  if (v998) {
                    break;
                  }
LABEL_974:
                  v995 = v1123 + 1;
                  v993 = objf;
                  if (v1123 + 1 == v1106)
                  {
                    uint64_t v994 = [objf countByEnumeratingWithState:&v1349 objects:&v1365 count:16];
                    if (!v994) {
                      goto LABEL_978;
                    }
                    goto LABEL_947;
                  }
                }
                uint64_t v999 = *(void *)v1346;
                while (2)
                {
                  uint64_t v1000 = 0;
LABEL_955:
                  if (*(void *)v1346 != v999) {
                    objc_enumerationMutation(v997);
                  }
                  if (![*(id *)(*((void *)&v1345 + 1) + 8 * v1000) isEqualToString:NSPropertyTransformMandatoryPropertyValidation])
                  {
                    v1023 = (void *)MEMORY[0x1E4F1CA00];
                    uint64_t v1024 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v996 forKey:@"propertyMapping"];
                    goto LABEL_989;
                  }
                  uint64_t v1001 = [v996 name];
                  if (v979
                    && (v1002 = (__CFString *)[v979[5] objectForKey:v1001], (v1003 = v1002) != 0))
                  {
                    if (LOBYTE(v1002->length) == 7)
                    {
                      if (-[_NSSQLiteStoreMigrator _countNullsInColumn:forEntity:](v978, (void *)[(__CFString *)v1002 foreignKey], (uint64_t)v979) >= 1)
                      {
                        v1025 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v1026 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Validation error missing attribute values on mandatory destination relationship", @"reason", objc_msgSend(v979, "name"), @"entity", -[__CFString name](v1003, "name"), @"attribute", 0);
                        goto LABEL_992;
                      }
                      goto LABEL_969;
                    }
                    if (![(__CFString *)v1002 isToMany])
                    {
                      if (LOBYTE(v1003->length) == 9)
                      {
                        v1005 = -[NSSQLManyToMany inverseColumnName](v1003);
                        if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:](v978, (uint64_t)v979, (uint64_t)v1005, [(__CFString *)v1003 correlationTableName]) >= 1)
                        {
LABEL_991:
                          v1025 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v1026 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Validation error missing relationship values on mandatory destination destination", @"reason", objc_msgSend(v979, "name"), @"entity", -[__CFString name](v1003, "name"), @"relationship", 0);
LABEL_992:
                          v1044[5] = [v1025 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v1026];
                          uint64_t v977 = *(void *)(v1140 + 40);
LABEL_993:
                          id v1027 = *(id *)(*(void *)(v977 + 8) + 40);
                          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"validation error" reason:@"validation failed" userInfo:0]);
                        }
                      }
LABEL_969:
                      if (v998 == ++v1000)
                      {
                        uint64_t v1006 = [v997 countByEnumeratingWithState:&v1345 objects:&v1361 count:16];
                        uint64_t v998 = v1006;
                        if (!v1006) {
                          goto LABEL_974;
                        }
                        continue;
                      }
                      goto LABEL_955;
                    }
                    length = (void *)v1003[1].length;
                  }
                  else
                  {
                    if (([0 isToMany] & 1) == 0) {
                      goto LABEL_969;
                    }
                    v1003 = 0;
                    length = 0;
                  }
                  break;
                }
                if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:](v978, (uint64_t)v979, objc_msgSend((id)objc_msgSend(length, "foreignKey"), "columnName"), objc_msgSend((id)-[__CFString destinationEntity](v1003, "destinationEntity"), "tableName")) >= 1)goto LABEL_991; {
                goto LABEL_969;
                }
              }
            }
LABEL_978:
          }
          contextb = (void *)[v1047 countByEnumeratingWithState:&v1145 objects:v1287 count:16];
        }
        while (contextb);
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v1014 = v1013;
      if (*(unsigned char *)(v1140 + 64)) {
        _NSCoreDataLog(4, @"Finished inferred mapping validation", v1007, v1008, v1009, v1010, v1011, v1012, (uint64_t)v1034);
      }
      v1286[0] = @"Inferred mapping validation";
      v1286[1] = [NSNumber numberWithDouble:v1014 - v968];
      objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1286, 2), @"2.16b");
    }
    goto LABEL_522;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v675 = v674;
  if (*(unsigned char *)(v1140 + 64)) {
    _NSCoreDataLog(4, @"Begin attribute extension updates.", v668, v669, v670, v671, v672, v673, (uint64_t)v1034);
  }
  long long v1204 = 0u;
  long long v1203 = 0u;
  long long v1202 = 0u;
  long long v1201 = 0u;
  v676 = (void *)[*(id *)(*(void *)(v1140 + 32) + 152) objectForKey:@"inserted"];
  uint64_t v677 = [v676 countByEnumeratingWithState:&v1201 objects:v1318 count:16];
  if (!v677)
  {
LABEL_726:
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Finished attribute extension updates.", v678, v679, v680, v681, v682, v683, (uint64_t)v1034);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v1315[0] = @"Update attribute extensions";
    v1315[1] = [NSNumber numberWithDouble:v714 - v675];
    objc_msgSend(v1050, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1315, 2), @"2.8");
    goto LABEL_729;
  }
  id v1088 = *(id *)v1202;
  v1070 = v676;
LABEL_699:
  id v1135 = 0;
  id objd = (id)v677;
  while (1)
  {
    if (*(id *)v1202 != v1088) {
      objc_enumerationMutation(v1070);
    }
    v684 = *(void **)(*((void *)&v1201 + 1) + 8 * (void)v1135);
    id v1118 = (id)MEMORY[0x18C127630]();
    int v1101 = [v684 validate:*(void *)(*(void *)(v1140 + 40) + 8) + 40];
    if (v1101)
    {
      long long v1200 = 0u;
      long long v1199 = 0u;
      long long v1198 = 0u;
      long long v1197 = 0u;
      v685 = (void *)[v684 insertSQLStrings];
      uint64_t v686 = [v685 countByEnumeratingWithState:&v1197 objects:v1317 count:16];
      if (v686)
      {
        uint64_t v687 = *(void *)v1198;
        do
        {
          for (uint64_t i32 = 0; i32 != v686; ++i32)
          {
            if (*(void *)v1198 != v687) {
              objc_enumerationMutation(v685);
            }
            uint64_t v689 = *(void *)(*((void *)&v1197 + 1) + 8 * i32);
            v690 = (void *)MEMORY[0x18C127630]();
            v691 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v689];
            v698 = v691;
            if (*(unsigned char *)(v1140 + 64)) {
              _NSCoreDataLog(4, @"Executing attribute extension insert statement: %@", v692, v693, v694, v695, v696, v697, (uint64_t)v691);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v698);
          }
          uint64_t v686 = [v685 countByEnumeratingWithState:&v1197 objects:v1317 count:16];
        }
        while (v686);
      }
      long long v1196 = 0u;
      long long v1195 = 0u;
      long long v1194 = 0u;
      long long v1193 = 0u;
      v699 = (void *)[v684 bulkUpdateSQLStrings];
      uint64_t v700 = [v699 countByEnumeratingWithState:&v1193 objects:v1316 count:16];
      if (v700)
      {
        uint64_t v701 = *(void *)v1194;
        do
        {
          for (uint64_t i33 = 0; i33 != v700; ++i33)
          {
            if (*(void *)v1194 != v701) {
              objc_enumerationMutation(v699);
            }
            uint64_t v703 = *(void *)(*((void *)&v1193 + 1) + 8 * i33);
            v704 = (void *)MEMORY[0x18C127630]();
            v705 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v703];
            v712 = v705;
            if (*(unsigned char *)(v1140 + 64)) {
              _NSCoreDataLog(4, @"Executing attribute extension change statement: %@", v706, v707, v708, v709, v710, v711, (uint64_t)v705);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(*(void *)(v1140 + 32) + 48), v712);
          }
          uint64_t v700 = [v699 countByEnumeratingWithState:&v1193 objects:v1316 count:16];
        }
        while (v700);
      }
    }
    else
    {
      id v713 = *(id *)(*(void *)(*(void *)(v1140 + 40) + 8) + 40);
      *(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) = 0;
    }
    if (!v1101) {
      break;
    }
    id v1135 = (char *)v1135 + 1;
    if (v1135 == objd)
    {
      uint64_t v677 = [v1070 countByEnumeratingWithState:&v1201 objects:v1318 count:16];
      if (v677) {
        goto LABEL_699;
      }
      goto LABEL_726;
    }
  }
LABEL_844:
  v1131 = 0;
  int v312 = 1;
  uint64_t v313 = v1140;
LABEL_1005:
  -[NSSQLiteConnection endFetchAndRecycleStatement:](*(void *)(*(void *)(v313 + 32) + 48), 0);

  if (!*(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) && *(unsigned char *)(v1140 + 64)) {
    _NSCoreDataLog(4, @"Failed lightweight migration on connection", v1028, v1029, v1030, v1031, v1032, v1033, (uint64_t)v1034);
  }
  if (*(unsigned char *)(v1140 + 65)) {
    -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1140 + 32) + 48), @"pragma cache_size = 512");
  }
  if (v312)
  {
    if (*(unsigned char *)(v1140 + 64)) {
      _NSCoreDataLog(4, @"Rolling back formal transaction", v1028, v1029, v1030, v1031, v1032, v1033, (uint64_t)v1034);
    }
    -[NSSQLiteConnection rollbackTransaction](*(void *)(*(void *)(v1140 + 32) + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1140 + 48) + 8) + 24) = 0;
  }
}

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (a2)
  {
    int v5 = a2[6];
    if (a3)
    {
LABEL_3:
      int v6 = a3[6];
      goto LABEL_4;
    }
  }
  else
  {
    int v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  int v6 = 0;
LABEL_4:
  if (v5 != v6)
  {
    if (a2)
    {
      uint64_t v12 = (int)a2[6];
      if (v12 <= 3)
      {
        unint64_t v13 = qword_18AE54620[v12];
        if (!a3) {
          goto LABEL_41;
        }
LABEL_23:
        uint64_t v18 = (int)a3[6];
        if (v18 > 3) {
          unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = qword_18AE54620[v18];
        }
LABEL_26:
        if (v13 < v19) {
          return -1;
        }
        if (v13 > v19) {
          return 1;
        }
        if (a2)
        {
          unsigned int v20 = a2[6];
          if (a3)
          {
LABEL_32:
            unsigned int v21 = a3[6];
            goto LABEL_33;
          }
        }
        else
        {
          unsigned int v20 = 0;
          if (a3) {
            goto LABEL_32;
          }
        }
        unsigned int v21 = 0;
LABEL_33:
        if (v20 > v21) {
          return 1;
        }
        else {
          return -1;
        }
      }
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (a3) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v13 = 3;
      if (a3) {
        goto LABEL_23;
      }
    }
LABEL_41:
    unint64_t v19 = 3;
    goto LABEL_26;
  }
  uint64_t v7 = [a2 rootEntity];
  if (v7) {
    int v8 = *(_DWORD *)(v7 + 184);
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [a3 rootEntity];
  if (v9) {
    int v10 = *(_DWORD *)(v9 + 184);
  }
  else {
    int v10 = 0;
  }
  if (v8 == v10) {
    return 0;
  }
  uint64_t v14 = [a2 rootEntity];
  if (v14) {
    unsigned int v15 = *(_DWORD *)(v14 + 184);
  }
  else {
    unsigned int v15 = 0;
  }
  uint64_t v16 = [a3 rootEntity];
  if (v16) {
    unsigned int v17 = *(_DWORD *)(v16 + 184);
  }
  else {
    unsigned int v17 = 0;
  }
  if (v15 < v17) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke_562(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0), "compare:", objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  if (v5 == 1)
  {
    uint64_t v18 = [a2 objectAtIndexedSubscript:0];
    uint64_t v7 = [a3 objectAtIndexedSubscript:0];
    int v8 = (void *)v18;
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"CloudKit metadata migration generated a source / destination id mapping for identical ids: %@"];
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a2);
    uint64_t v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v20 = a2;
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: CloudKit metadata migration generated a source / destination id mapping for identical ids: %@", buf, 0xCu);
    }
    return 0;
  }
  if (v5 != -1) {
    return 0;
  }
  uint64_t v6 = [a3 objectAtIndexedSubscript:0];
  uint64_t v7 = [a2 objectAtIndexedSubscript:0];
  int v8 = (void *)v6;
LABEL_9:

  return [v8 compare:v7];
}

void __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a2 count];
  if (v6 | [a3 count])
  {
    obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a2];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a3];
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v35 = a1;
    uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) entityMappings];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v58 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x18C127630]();
          if (objc_msgSend((id)objc_msgSend(v14, "destinationEntityName"), "isEqualToString:", objc_msgSend(*(id *)(v35 + 40), "name"))&& objc_msgSend(v14, "mappingType") == 5)
          {
            [v36 unionSet:obj];
            goto LABEL_35;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v67 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(obj);
          }
          unsigned int v17 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          context = (void *)MEMORY[0x18C127630]();
          char v18 = [v7 containsObject:v17];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v19 = [v7 countByEnumeratingWithState:&v49 objects:v65 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v50;
            do
            {
              for (uint64_t k = 0; k != v20; ++k)
              {
                if (*(void *)v50 != v21) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v23 = *(void **)(*((void *)&v49 + 1) + 8 * k);
                if (![v17 _compare:v23])
                {
                  int v24 = -[NSFetchIndexDescription _isUnique]((uint64_t)v17);
                  if (v24 == -[NSFetchIndexDescription _isUnique]((uint64_t)v23))
                  {
                    if ((v18 & 1) == 0
                      || (objc_msgSend((id)objc_msgSend(v17, "name"), "isEqualToString:", objc_msgSend(v23, "name")) & 1) == 0)
                    {
                      [v8 removeObject:v23];
                    }
                    char v18 = 1;
                  }
                }
              }
              uint64_t v20 = [v7 countByEnumeratingWithState:&v49 objects:v65 count:16];
            }
            while (v20);
          }
          if ((v18 & 1) == 0) {
            [v36 addObject:v17];
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v39);
    }
LABEL_35:
    uint64_t v64 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
    uint64_t v25 = objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v64, 1));
    uint64_t v63 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
    uint64_t v26 = objc_msgSend(v36, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v63, 1));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*(void *)(v35 + 32) + 160), "addObject:", -[NSSQLEntity indexForIndexDescription:](*(void **)(v35 + 40), *(id **)(*((void *)&v45 + 1) + 8 * m)));
        }
        uint64_t v28 = [v25 countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v28);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v31 = [v26 countByEnumeratingWithState:&v41 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(*(id *)(*(void *)(v35 + 32) + 168), "addObject:", -[NSSQLEntity indexForIndexDescription:](*(void **)(v35 + 48), *(id **)(*((void *)&v41 + 1) + 8 * n)));
        }
        uint64_t v32 = [v26 countByEnumeratingWithState:&v41 objects:v61 count:16];
      }
      while (v32);
    }
  }
}

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

@end