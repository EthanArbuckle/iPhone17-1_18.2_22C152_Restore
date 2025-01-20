@interface PFCloudKitModelValidator
- (PFCloudKitModelValidator)initWithManagedObjectModel:(id)a3 configuration:(id)a4 mirroringDelegateOptions:(id)a5;
- (uint64_t)_validateManagedObjectModel:(void *)a3 error:;
- (void)dealloc;
@end

@implementation PFCloudKitModelValidator

- (PFCloudKitModelValidator)initWithManagedObjectModel:(id)a3 configuration:(id)a4 mirroringDelegateOptions:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitModelValidator;
  v8 = [(PFCloudKitModelValidator *)&v10 init];
  if (v8)
  {
    v8->_model = (NSManagedObjectModel *)a3;
    v8->_configurationName = (NSString *)a4;
    v8->_options = (NSCloudKitMirroringDelegateOptions *)a5;
    *(_WORD *)&v8->_skipValueTransformerValidation = 0;
    v8->_supportsMergeableTransformable = 0;
  }
  return v8;
}

- (void)dealloc
{
  self->_model = 0;
  self->_configurationName = 0;

  self->_options = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitModelValidator;
  [(PFCloudKitModelValidator *)&v3 dealloc];
}

- (uint64_t)_validateManagedObjectModel:(void *)a3 error:
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  if (a2)
  {
    uint64_t v4 = result;
    v5 = (void *)[a2 entitiesForConfiguration:*(void *)(result + 16)];
    if (v5)
    {
      v6 = v5;
      if ([v5 count] || !objc_msgSend(*(id *)(v4 + 16), "length"))
      {
        uint64_t v100 = v4;
        v93 = a3;
        context = (void *)MEMORY[0x18C127630]();
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
        id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v115 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v94 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id obj = (id)v7;
        v13 = (void *)v7;
        id v14 = v11;
        v103 = v10;
        v106 = v11;
        v113 = v12;
        uint64_t v111 = [v13 countByEnumeratingWithState:&v140 objects:buf count:16];
        if (v111)
        {
          uint64_t v97 = *(void *)v141;
          id v98 = v9;
          id v99 = v8;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v141 != v97) {
                objc_enumerationMutation(obj);
              }
              uint64_t v114 = v15;
              v16 = *(void **)(*((void *)&v140 + 1) + 8 * v15);
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              if (objc_msgSend((id)objc_msgSend(v16, "userInfo"), "objectForKey:", @"NSPersistentCloudKitContainerEncryptedAttributeKey"))
              {
                v19 = NSString;
                uint64_t v90 = [v16 name];
                v20 = v19;
                id v12 = v113;
                [v96 addObject:objc_msgSend(v20, "stringWithFormat:", @"%@: %@ cannot be applied to an entity type'", v90, @"NSPersistentCloudKitContainerEncryptedAttributeKey"];
              }
              v21 = (void *)[v16 attributesByName];
              v139[0] = MEMORY[0x1E4F143A8];
              v139[1] = 3221225472;
              v139[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke;
              v139[3] = &unk_1E544B638;
              v139[4] = v100;
              v139[5] = v10;
              v139[6] = v16;
              v139[7] = v109;
              v139[8] = v12;
              v139[9] = v110;
              v139[10] = v17;
              v139[11] = v8;
              v139[12] = v105;
              [v21 enumerateKeysAndObjectsUsingBlock:v139];
              v22 = (void *)[v16 relationshipsByName];
              v138[0] = MEMORY[0x1E4F143A8];
              v138[1] = 3221225472;
              v138[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2;
              v138[3] = &unk_1E544B660;
              v138[4] = v108;
              v138[5] = v16;
              v138[6] = v9;
              v138[7] = v107;
              v138[8] = obj;
              v138[9] = v14;
              v138[10] = v102;
              v138[11] = v104;
              v138[12] = v101;
              [v22 enumerateKeysAndObjectsUsingBlock:v138];
              self;
              if (qword_1EB270538 != -1) {
                dispatch_once(&qword_1EB270538, &__block_literal_global_178);
              }
              if ((_MergedGlobals_64 & 1) == 0 && objc_msgSend((id)objc_msgSend(v16, "uniquenessConstraints"), "count"))
              {
                v23 = (void *)[v16 uniquenessConstraints];
                v137[0] = MEMORY[0x1E4F143A8];
                v137[1] = 3221225472;
                v137[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3;
                v137[3] = &unk_1E544B6B0;
                v137[4] = v16;
                v137[5] = v94;
                [v23 enumerateObjectsUsingBlock:v137];
              }
              if (qword_1EB270528 != -1) {
                dispatch_once(&qword_1EB270528, &__block_literal_global_0);
              }
              v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "userInfo"), "objectForKey:", @"NSPersistentHistoryTombstoneAttributes"), "componentsSeparatedByString:", @",");
              if (v24)
              {
                v25 = v24;
                if ([v24 count]) {
                  [v17 addObjectsFromArray:v25];
                }
              }
              long long v135 = 0u;
              long long v136 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              v26 = (void *)qword_1EB270530;
              uint64_t v27 = [(id)qword_1EB270530 countByEnumeratingWithState:&v133 objects:v156 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v134;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v134 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v133 + 1) + 8 * i);
                    if ([v18 containsObject:v31]
                      && ([v17 containsObject:v31] & 1) == 0)
                    {
                      v32 = (void *)[[NSString alloc] initWithFormat:@"%@:%@ - preservesValueInHistoryOnDeletion should be YES", objc_msgSend(v16, "name"), v31];
                      [v115 addObject:v32];
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v133 objects:v156 count:16];
                }
                while (v28);
              }

              id v33 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
              v34 = (void *)[v33 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
              v35 = +[PFCloudKitSchemaGenerator newRepresentativeRecordForStaticFieldsInEntity:inZoneWithID:]((uint64_t)PFCloudKitSchemaGenerator, v16, (uint64_t)v34);
              if ((unint64_t)[v35 size] > 0xAAE60)
              {
                v36 = (void *)[[NSString alloc] initWithFormat:@"%@: Estimated size %lu bytes", objc_msgSend(v16, "name"), objc_msgSend(v35, "size")];
                [v95 addObject:v36];
              }
              id v12 = v113;
              uint64_t v15 = v114 + 1;
              id v9 = v98;
              id v8 = v99;
              id v10 = v103;
              id v14 = v106;
            }
            while (v114 + 1 != v111);
            uint64_t v111 = [obj countByEnumeratingWithState:&v140 objects:buf count:16];
          }
          while (v111);
        }
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v9 count])
        {
          [v9 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v38 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration requires that all relationships have an inverse, the following do not:"];
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_99;
          v132[3] = &unk_1E544B6D8;
          v132[4] = v38;
          [v9 enumerateObjectsUsingBlock:v132];
          [v37 addObject:v38];
        }
        v39 = v109;
        if ([v107 count])
        {
          [v107 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v40 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration does not support ordered relationships. The following relationships are marked ordered:"];
          v131[0] = MEMORY[0x1E4F143A8];
          v131[1] = 3221225472;
          v131[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_107;
          v131[3] = &unk_1E544B6D8;
          v131[4] = v40;
          [v107 enumerateObjectsUsingBlock:v131];
          [v37 addObject:v40];

          v39 = v109;
        }
        if ([v8 count])
        {
          [v8 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v41 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration requires that all attributes be optional, or have a default value set. The following attributes are marked non-optional but do not have a default value:"];
          v130[0] = MEMORY[0x1E4F143A8];
          v130[1] = 3221225472;
          v130[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_111;
          v130[3] = &unk_1E544B6D8;
          v130[4] = v41;
          [v8 enumerateObjectsUsingBlock:v130];
          [v37 addObject:v41];

          v39 = v109;
        }
        if ([v108 count])
        {
          [v108 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v42 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration requires that all relationships be optional, the following are not:"];
          v129[0] = MEMORY[0x1E4F143A8];
          v129[1] = 3221225472;
          v129[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5;
          v129[3] = &unk_1E544B6D8;
          v129[4] = v42;
          [v108 enumerateObjectsUsingBlock:v129];
          [v37 addObject:v42];

          v39 = v109;
        }
        if ([v39 count])
        {
          [v39 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v43 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration does not support all attribute types. The following entities have attributes of an unsupported type:"];
          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6;
          v128[3] = &unk_1E544B6D8;
          v128[4] = v43;
          [v39 enumerateObjectsUsingBlock:v128];
          [v37 addObject:v43];
        }
        if ([v10 count])
        {
          [v10 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          id v44 = objc_alloc(MEMORY[0x1E4F28E78]);
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = (void *)[v44 initWithFormat:@"CloudKit integration requires that the value transformers for transformable attributes are available via +[%@ %@] and allow reverse transformation:", v46, NSStringFromSelector(sel_valueTransformerForName_)];
          v127[0] = MEMORY[0x1E4F143A8];
          v127[1] = 3221225472;
          v127[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7;
          v127[3] = &unk_1E544B6D8;
          v127[4] = v47;
          [v103 enumerateObjectsUsingBlock:v127];
          [v37 addObject:v47];
        }
        if ([v106 count])
        {
          [v106 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v48 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CloudKit integration does not allow relationships to objects that aren't sync'd. The following relationships have destination entities that not in the specified configuration."];
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8;
          v126[3] = &unk_1E544B6D8;
          v126[4] = v48;
          [v106 enumerateObjectsUsingBlock:v126];
          [v37 addObject:v48];
        }
        if ([v115 count])
        {
          [v115 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v49 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CloudKit integration requires that all entities tombstone %@ and %@ on delete if configured. The following entities are not properly configured:", @"ckRecordID", @"ckRecordSystemFields"];
          v125[0] = MEMORY[0x1E4F143A8];
          v125[1] = 3221225472;
          v125[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9;
          v125[3] = &unk_1E544B6D8;
          v125[4] = v49;
          [v115 enumerateObjectsUsingBlock:v125];
          [v37 addObject:v49];
        }
        if ([v95 count])
        {
          [v95 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"CloudKit integration requires that all entities can be materialized in a CKRecord of less than %lu bytes. The following entities cannot:", 700000);
          v124[0] = MEMORY[0x1E4F143A8];
          v124[1] = 3221225472;
          v124[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10;
          v124[3] = &unk_1E544B6D8;
          v124[4] = v50;
          [v95 enumerateObjectsUsingBlock:v124];
          [v37 addObject:v50];
        }
        if ([v113 count])
        {
          [v113 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v51 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following attributes have invalid values for '%@':", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"];
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11;
          v123[3] = &unk_1E544B6D8;
          v123[4] = v51;
          [v113 enumerateObjectsUsingBlock:v123];
          [v37 addObject:v51];
        }
        if ([v102 count])
        {
          [v102 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v52 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CloudKit integration does not support ignored relationships. The following entities and relationships are marked ignored using '%@':", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"];
          v122[0] = MEMORY[0x1E4F143A8];
          v122[1] = 3221225472;
          v122[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12;
          v122[3] = &unk_1E544B6D8;
          v122[4] = v52;
          [v102 enumerateObjectsUsingBlock:v122];
          [v37 addObject:v52];
        }
        if ([v96 count])
        {
          [v96 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v53 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following entities have invalid values:"];
          v121[0] = MEMORY[0x1E4F143A8];
          v121[1] = 3221225472;
          v121[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13;
          v121[3] = &unk_1E544B6D8;
          v121[4] = v53;
          [v96 enumerateObjectsUsingBlock:v121];
          [v37 addObject:v53];
        }
        v54 = v110;
        if ([v110 count])
        {
          [v110 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v55 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following attributes have invalid values:"];
          v120[0] = MEMORY[0x1E4F143A8];
          v120[1] = 3221225472;
          v120[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14;
          v120[3] = &unk_1E544B6D8;
          v120[4] = v55;
          [v110 enumerateObjectsUsingBlock:v120];
          [v37 addObject:v55];

          v54 = v110;
        }
        if ([v104 count])
        {
          [v104 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v56 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CloudKit integration does not support encrypted relationships. The following entities and relationships are marked with '%@':", @"NSPersistentCloudKitContainerEncryptedAttributeKey"];
          v119[0] = MEMORY[0x1E4F143A8];
          v119[1] = 3221225472;
          v119[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15;
          v119[3] = &unk_1E544B6D8;
          v119[4] = v56;
          [v104 enumerateObjectsUsingBlock:v119];
          [v37 addObject:v56];

          v54 = v110;
        }
        if ([v105 count])
        {
          [v105 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v57 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following attributes use mergeable storage with CloudKit which is unsupported:"];
          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16;
          v118[3] = &unk_1E544B6D8;
          v118[4] = v57;
          [v105 enumerateObjectsUsingBlock:v118];
          [v37 addObject:v57];

          v54 = v110;
        }
        if ([v101 count])
        {
          [v101 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v58 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following relationships are configured with unsupported delete rules:"];
          v117[0] = MEMORY[0x1E4F143A8];
          v117[1] = 3221225472;
          v117[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17;
          v117[3] = &unk_1E544B6D8;
          v117[4] = v58;
          [v101 enumerateObjectsUsingBlock:v117];
          [v37 addObject:v58];

          v54 = v110;
        }
        if ([v94 count])
        {
          [v94 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v59 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CloudKit integration does not support unique constraints. The following entities are constrained:"];
          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = 3221225472;
          v116[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18;
          v116[3] = &unk_1E544B6D8;
          v116[4] = v59;
          [v94 enumerateObjectsUsingBlock:v116];
          [v37 addObject:v59];

          v54 = v110;
        }

        uint64_t v60 = [v37 count];
        if (v60)
        {
          if ((unint64_t)[v37 count] < 2) {
            uint64_t v61 = [v37 lastObject];
          }
          else {
            uint64_t v61 = [v37 componentsJoinedByString:@"\n"];
          }
          uint64_t v71 = *MEMORY[0x1E4F281F8];
          uint64_t v154 = *MEMORY[0x1E4F28588];
          uint64_t v155 = v61;
          v70 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v71, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));

          if (!v70)
          {
            uint64_t v72 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v72, v73, v74, v75, v76, v77, v78, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
            v79 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v150 = 136315394;
              v151 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
              __int16 v152 = 1024;
              int v153 = 563;
              _os_log_fault_impl(&dword_18AB82000, v79, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v150, 0x12u);
            }
            v70 = 0;
          }
        }
        else
        {

          v70 = 0;
        }
        id v80 = v70;

        id v81 = v70;
        a3 = v93;
        if (!v60) {
          return 1;
        }
        goto LABEL_85;
      }
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F281F8];
      uint64_t v146 = *MEMORY[0x1E4F28588];
      uint64_t v147 = [NSString stringWithFormat:@"The configuration named '%@' does not contain any entities.", *(void *)(v4 + 16)];
      v67 = (void *)MEMORY[0x1E4F1C9E8];
      v68 = &v147;
      v69 = &v146;
    }
    else
    {
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F281F8];
      uint64_t v148 = *MEMORY[0x1E4F28588];
      uint64_t v149 = [NSString stringWithFormat:@"Unable to find a configuration named '%@' in the specified managed object model.", *(void *)(v4 + 16)];
      v67 = (void *)MEMORY[0x1E4F1C9E8];
      v68 = &v149;
      v69 = &v148;
    }
  }
  else
  {
    v62 = NSString;
    v63 = (objc_class *)objc_opt_class();
    uint64_t v64 = [v62 stringWithFormat:@"Cannot be used without an instance of %@.", NSStringFromClass(v63)];
    v65 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F281F8];
    uint64_t v144 = *MEMORY[0x1E4F28588];
    uint64_t v145 = v64;
    v67 = (void *)MEMORY[0x1E4F1C9E8];
    v68 = &v145;
    v69 = &v144;
  }
  v70 = objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, 134060, objc_msgSend(v67, "dictionaryWithObjects:forKeys:count:", v68, v69, 1));
LABEL_85:
  if (v70)
  {
    if (a3)
    {
      result = 0;
      *a3 = v70;
      return result;
    }
  }
  else
  {
    uint64_t v82 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v82, v83, v84, v85, v86, v87, v88, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
    v89 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    v158 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
    __int16 v159 = 1024;
    int v160 = 108;
    _os_log_fault_impl(&dword_18AB82000, v89, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 25))
  {
    uint64_t result = +[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a3);
    if (result) {
      return result;
    }
  }
  uint64_t v7 = [a3 attributeType];
  if (v7 > 799)
  {
    if (v7 <= 1099)
    {
      if (v7 != 800 && v7 != 900 && v7 != 1000) {
        goto LABEL_32;
      }
    }
    else if (v7 > 1799)
    {
      if (v7 == 2100) {
        goto LABEL_34;
      }
      if (v7 != 1800) {
        goto LABEL_32;
      }
      if (objc_msgSend((id)objc_msgSend(a3, "valueTransformerName"), "length")
        && !*(unsigned char *)(*(void *)(a1 + 32) + 24))
      {
        if (objc_msgSend(MEMORY[0x1E4F29248], "valueTransformerForName:", objc_msgSend(a3, "valueTransformerName")))
        {
          if ([(id)objc_opt_class() allowsReverseTransformation]) {
            goto LABEL_34;
          }
          id v8 = *(void **)(a1 + 40);
          uint64_t v9 = [NSString stringWithFormat:@"%@: %@ - Doesn't allow reverse transformation", objc_msgSend(*(id *)(a1 + 48), "name"), a2, v36];
        }
        else
        {
          id v8 = *(void **)(a1 + 40);
          uint64_t v9 = [NSString stringWithFormat:@"%@: %@ - Cannot locate value transformer with name '%@'", objc_msgSend(*(id *)(a1 + 48), "name"), a2, objc_msgSend(a3, "valueTransformerName")];
        }
        uint64_t v11 = v9;
        id v12 = v8;
        goto LABEL_33;
      }
    }
    else if (v7 != 1100 && v7 != 1200)
    {
      goto LABEL_32;
    }
  }
  else if (v7 <= 399)
  {
    if (v7 != 100 && v7 != 200 && v7 != 300) {
      goto LABEL_32;
    }
  }
  else if (v7 > 599)
  {
    if (v7 != 600 && v7 != 700) {
      goto LABEL_32;
    }
  }
  else if (v7 != 400 && v7 != 500)
  {
LABEL_32:
    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = [NSString stringWithFormat:@"%@: %@ - Unsupported attribute type (%@)", objc_msgSend(*(id *)(a1 + 48), "name"), a2, +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", v7)];
    id v12 = v10;
LABEL_33:
    [v12 addObject:v11];
  }
LABEL_34:
  v13 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey");
  if (v13)
  {
    id v14 = v13;
    if ([v13 isNSNumber] & 1) != 0 || (objc_msgSend(v14, "isNSString"))
    {
      if (![v14 BOOLValue] || (objc_msgSend(a3, "isOptional") & 1) != 0) {
        goto LABEL_42;
      }
      uint64_t v15 = *(void **)(a1 + 64);
      uint64_t v16 = [NSString stringWithFormat:@"%@: %@ - attribute is not optional", objc_msgSend(*(id *)(a1 + 48), "name"), a2, v36, v37, v38];
    }
    else
    {
      uint64_t v15 = *(void **)(a1 + 64);
      id v17 = NSString;
      uint64_t v18 = [*(id *)(a1 + 48) name];
      uint64_t v19 = [a3 name];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      uint64_t v16 = [v17 stringWithFormat:@"%@: %@ - Value must be an instance of '%@' or '%@' that evalutes to YES or NO using '%@'", v18, v19, v21, v23, NSStringFromSelector(sel_BOOLValue)];
    }
    [v15 addObject:v16];
  }
LABEL_42:
  v24 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSPersistentCloudKitContainerEncryptedAttributeKey");
  if (v24)
  {
    v25 = v24;
    if (([v24 isNSNumber] & 1) == 0 && (objc_msgSend(v25, "isNSString") & 1) == 0)
    {
      v26 = *(void **)(a1 + 72);
      uint64_t v27 = NSString;
      uint64_t v28 = [*(id *)(a1 + 48) name];
      uint64_t v29 = [a3 name];
      v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      v32 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v32);
      [v26 addObject:objc_msgSend(v27, "stringWithFormat:", @"%@: %@ - Value for %@ must be an instance of '%@' or '%@' that evalutes to YES or NO using '%@'", v28, v29, @"NSPersistentCloudKitContainerEncryptedAttributeKey", v31, v33, NSStringFromSelector(sel_BOOLValue))];
    }
    if ([a3 allowsCloudEncryption]) {
      [*(id *)(a1 + 72) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@ - Encryption value should be set via -[NSAttributeDescription allowsCloudEncryption], please remove usage of 'NSPersistentCloudKitContainerEncryptedAttributeKey'", objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name"))];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 32) useDeviceToDeviceEncryption]) {
      [*(id *)(a1 + 72) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@ - Partial encryption cannot be used with device-to-device encryption", objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name"))];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) useDeviceToDeviceEncryption]
    && [a3 allowsCloudEncryption])
  {
    [*(id *)(a1 + 72) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@ - Device-to-Device encryption cannot be used with partial encryption", objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name"))];
  }
  if ([a3 preservesValueInHistoryOnDeletion]) {
    [*(id *)(a1 + 80) addObject:a2];
  }
  if (([a3 isOptional] & 1) == 0 && !objc_msgSend(a3, "defaultValue")) {
    [*(id *)(a1 + 88) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name"))];
  }
  uint64_t result = [a3 usesMergeableStorage];
  if (result && !*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    v34 = *(void **)(a1 + 96);
    uint64_t v35 = [NSString stringWithFormat:@"Attributes that use mergeable storage (%@: %@) are unsupported in CloudKit. Please file a radar to Core Data to request support.", objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")];
    return [v34 addObject:v35];
  }
  return result;
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (([a3 isOptional] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if (![a3 inverseRelationship]) {
    [*(id *)(a1 + 48) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if ([a3 isOrdered]) {
    [*(id *)(a1 + 56) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if ([a3 destinationEntity]
    && (objc_msgSend(*(id *)(a1 + 64), "containsObject:", objc_msgSend(a3, "destinationEntity")) & 1) == 0)
  {
    [*(id *)(a1 + 72) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@ - %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2, objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name"))];
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue"))objc_msgSend(*(id *)(a1 + 80), "addObject:", objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name"))); {
  if (objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSPersistentCloudKitContainerEncryptedAttributeKey"))
  }
  {
    [*(id *)(a1 + 88) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name"))];
  }
  uint64_t result = [a3 deleteRule];
  if (result == 3)
  {
    uint64_t v7 = *(void **)(a1 + 96);
    id v8 = NSString;
    uint64_t v9 = [*(id *)(a1 + 40) name];
    uint64_t v10 = [a3 name];
    unint64_t v11 = [a3 deleteRule];
    self;
    if (v11 > 3) {
      id v12 = 0;
    }
    else {
      id v12 = off_1E544B6F8[v11];
    }
    uint64_t v13 = [v8 stringWithFormat:@"%@:%@ - %@", v9, v10, v12];
    return [v7 addObject:v13];
  }
  return result;
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4;
  v5[3] = &unk_1E544B688;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v4;
  [a2 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 32), "name"), v4)];
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a2 isNSString])
  {
LABEL_4:
    if (v2)
    {
      if ([*(id *)(a1 + 40) length]) {
        [*(id *)(a1 + 40) appendString:@", "];
      }
      id v4 = *(void **)(a1 + 40);
      [v4 appendString:v2];
    }
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (void *)[v2 name];
    goto LABEL_4;
  }
  uint64_t v5 = [NSString stringWithUTF8String:"PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@"];
  uint64_t v6 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 32) uniquenessConstraints];
  _NSCoreDataLog(17, v5, v7, v8, v9, v10, v11, v12, v6);
  uint64_t v13 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 32) name];
    uint64_t v15 = [*(id *)(a1 + 32) uniquenessConstraints];
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@", buf, 0x16u);
  }
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_78()
{
  v1[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x18C127630]();
  v1[0] = @"ckRecordID";
  v1[1] = @"ckRecordSystemFields";
  qword_1EB270530 = (uint64_t)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_99(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_107(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_111(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v4 = *(void **)(a1 + 32);

  return [v4 appendString:a2];
}

void __57__PFCloudKitModelValidator_enforceUniqueConstraintChecks__block_invoke()
{
  if (!(_BYTE)dword_1EB270AB8 || (v0 = getprogname()) != 0 && !strncmp("routined", v0, 8uLL)) {
    _MergedGlobals_64 = 1;
  }
}

@end