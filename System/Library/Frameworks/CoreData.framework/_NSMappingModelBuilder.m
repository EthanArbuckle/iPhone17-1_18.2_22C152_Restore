@interface _NSMappingModelBuilder
+ (int)migrationDebugLevel;
+ (void)setMigrationDebugLevel:(int)a3;
- (NSEntityMapping)newEntityMappingWithSource:(void *)a1 destination:(void *)a2;
- (NSMappingModel)newInferredMappingModel:(NSMappingModel *)a1;
- (_NSMappingModelBuilder)initWithSourceModel:(id)a3 destinationModel:(id)a4;
- (void)dealloc;
@end

@implementation _NSMappingModelBuilder

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel];
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (_NSMappingModelBuilder)initWithSourceModel:(id)a3 destinationModel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NSMappingModelBuilder;
  v6 = [(_NSMappingModelBuilder *)&v8 init];
  if (v6)
  {
    v6->_sourceModel = (NSManagedObjectModel *)a3;
    v6->_destinationModel = (NSManagedObjectModel *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_sourceModel = 0;
  self->_destinationModel = 0;

  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSMappingModelBuilder;
  [(_NSMappingModelBuilder *)&v3 dealloc];
}

- (NSMappingModel)newInferredMappingModel:(NSMappingModel *)a1
{
  v2 = a1;
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    a1->_reserved2 = 0;

    v2->_entityMappings = 0;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v85 = v2;
    reserved = v2->_reserved;
    uint64_t v5 = 0;
    uint64_t v6 = [reserved countByEnumeratingWithState:&v99 objects:v150 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v100 != v7) {
            objc_enumerationMutation(reserved);
          }
          objc_msgSend(v3, "setObject:forKey:", *(void *)(*((void *)&v99 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * i), "renamingIdentifier"));
        }
        v5 += v6;
        uint64_t v6 = [reserved countByEnumeratingWithState:&v99 objects:v150 count:16];
      }
      while (v6);
    }
    if (v5 == [v3 count])
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2 * v5];
      obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2 * v5];
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      reserved1 = v85->_reserved1;
      uint64_t v11 = 0;
      uint64_t v12 = [reserved1 countByEnumeratingWithState:&v95 objects:v149 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v96;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v96 != v13) {
              objc_enumerationMutation(reserved1);
            }
            v15 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            uint64_t v16 = [v15 renamingIdentifier];
            v17 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]((void *)[v3 objectForKey:v16], v15);
            [obj addObject:v17];
            [v9 addObject:v16];

            objc_msgSend(v3, "removeObjectForKey:", objc_msgSend(v15, "renamingIdentifier"));
          }
          v11 += v12;
          uint64_t v12 = [reserved1 countByEnumeratingWithState:&v95 objects:v149 count:16];
        }
        while (v12);
      }
      if (v11 == [v9 count])
      {

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        uint64_t v18 = [v3 countByEnumeratingWithState:&v91 objects:v148 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v92;
          do
          {
            for (uint64_t k = 0; k != v18; ++k)
            {
              if (*(void *)v92 != v19) {
                objc_enumerationMutation(v3);
              }
              v21 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]((void *)[v3 objectForKey:*(void *)(*((void *)&v91 + 1) + 8 * k)], 0);
              [obj addObject:v21];
            }
            uint64_t v18 = [v3 countByEnumeratingWithState:&v91 objects:v148 count:16];
          }
          while (v18);
        }

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v76 = [obj countByEnumeratingWithState:&v87 objects:v147 count:16];
        if (v76)
        {
          uint64_t v75 = *(void *)v88;
          uint64_t v73 = *MEMORY[0x1E4F281F8];
LABEL_27:
          uint64_t v84 = 0;
          while (1)
          {
            if (*(void *)v88 != v75) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v87 + 1) + 8 * v84);
            if ([v22 mappingType] == 4 || objc_msgSend(v22, "mappingType") == 5)
            {
              v23 = objc_msgSend((id)objc_msgSend(v85->_reserved, "entitiesByName"), "objectForKey:", objc_msgSend(v22, "sourceEntityName"));
              v80 = objc_msgSend((id)objc_msgSend(v85->_reserved1, "entitiesByName"), "objectForKey:", objc_msgSend(v22, "destinationEntityName"));
              v85->_reserved2 = v22;
              id v82 = objc_alloc_init(MEMORY[0x1E4F28B28]);
              v24 = (void *)MEMORY[0x1E4F28C68];
              uint64_t v25 = [MEMORY[0x1E4F28C68] expressionForVariable:@"manager"];
              v26 = (void *)MEMORY[0x1E4F1C978];
              uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(v23, "name"));
              uint64_t v28 = objc_msgSend(v24, "expressionForFunction:selectorName:arguments:", v25, @"fetchRequestForSourceEntityNamed:predicateString:", objc_msgSend(v26, "arrayWithObjects:", v27, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", @"TRUEPREDICATE"), 0));
              objc_msgSend(v22, "setSourceExpression:", +[NSFetchRequestExpression expressionForFetch:context:countOnly:](NSFetchRequestExpression, "expressionForFetch:context:countOnly:", v28, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForVariable:", @"manager"), @"sourceContext", 0), 0));
              v29 = (void *)[v23 propertiesByName];
              uint64_t v30 = [v29 count];
              v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v30];
              uint64_t v143 = 0;
              v144 = &v143;
              uint64_t v145 = 0x2020000000;
              uint64_t v146 = 0;
              uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v30];
              v77 = v22;
              uint64_t v137 = 0;
              v138 = &v137;
              uint64_t v139 = 0x3052000000;
              v140 = __Block_byref_object_copy__5;
              v141 = __Block_byref_object_dispose__5;
              v136[0] = MEMORY[0x1E4F143A8];
              v136[1] = 3221225472;
              v136[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke;
              v136[3] = &unk_1E544BA88;
              v136[6] = &v143;
              v136[4] = v31;
              v83 = (void *)v32;
              v136[5] = v32;
              v142 = v136;
              uint64_t v130 = 0;
              v131 = &v130;
              uint64_t v132 = 0x3052000000;
              v133 = __Block_byref_object_copy__5;
              v134 = __Block_byref_object_dispose__5;
              v129[0] = MEMORY[0x1E4F143A8];
              v129[1] = 3221225472;
              v129[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2;
              v129[3] = &unk_1E544BAB0;
              v129[4] = &v130;
              v129[5] = &v137;
              v135 = v129;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              v33 = (void *)[v29 allValues];
              uint64_t v34 = [v33 countByEnumeratingWithState:&v125 objects:buf count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v126;
                do
                {
                  for (uint64_t m = 0; m != v34; ++m)
                  {
                    if (*(void *)v126 != v35) {
                      objc_enumerationMutation(v33);
                    }
                    v37 = *(void **)(*((void *)&v125 + 1) + 8 * m);
                    if (([v37 isTransient] & 1) == 0)
                    {
                      switch([v37 _propertyType])
                      {
                        case 2:
                        case 4:
                        case 6:
                          uint64_t v38 = 0;
                          uint64_t v39 = v138[5];
                          goto LABEL_41;
                        case 7:
                          uint64_t v39 = v131[5];
                          uint64_t v40 = [v37 elements];
                          uint64_t v38 = [v37 name];
                          v37 = (void *)v40;
LABEL_41:
                          (*(void (**)(uint64_t, void *, uint64_t))(v39 + 16))(v39, v37, v38);
                          break;
                        default:
                          continue;
                      }
                    }
                  }
                  uint64_t v34 = [v33 countByEnumeratingWithState:&v125 objects:buf count:16];
                }
                while (v34);
              }
              uint64_t v41 = v144[3];
              if (v41 == [v31 count])
              {
                v42 = (void *)[v80 propertiesByName];
                uint64_t v43 = [v42 count];
                v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v43];
                v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v43];
                uint64_t v44 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v43];
                v81 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v43];
                id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                uint64_t v121 = 0;
                v122 = &v121;
                uint64_t v123 = 0x2020000000;
                char v124 = 0;
                uint64_t v115 = 0;
                v116 = &v115;
                uint64_t v117 = 0x3052000000;
                v118 = __Block_byref_object_copy__5;
                v119 = __Block_byref_object_dispose__5;
                v114[0] = MEMORY[0x1E4F143A8];
                v114[1] = 3221225472;
                v114[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3;
                v114[3] = &unk_1E544BAD8;
                v114[4] = v31;
                v114[5] = v85;
                v114[6] = v79;
                v114[7] = v78;
                v114[8] = v45;
                v74 = (void *)v44;
                v114[9] = v44;
                v114[10] = v81;
                v114[11] = v83;
                v114[12] = &v121;
                v120 = v114;
                uint64_t v108 = 0;
                v109 = &v108;
                uint64_t v110 = 0x3052000000;
                v111 = __Block_byref_object_copy__5;
                v112 = __Block_byref_object_dispose__5;
                v107[0] = MEMORY[0x1E4F143A8];
                v107[1] = 3221225472;
                v107[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4;
                v107[3] = &unk_1E544BB00;
                v107[5] = &v108;
                v107[4] = v45;
                v107[6] = &v115;
                v113 = v107;
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                v46 = (void *)[v42 allValues];
                uint64_t v47 = [v46 countByEnumeratingWithState:&v103 objects:v151 count:16];
                if (v47)
                {
                  uint64_t v48 = *(void *)v104;
                  do
                  {
                    for (uint64_t n = 0; n != v47; ++n)
                    {
                      if (*(void *)v104 != v48) {
                        objc_enumerationMutation(v46);
                      }
                      v50 = *(void **)(*((void *)&v103 + 1) + 8 * n);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        (*(void (**)(uint64_t, uint64_t, uint64_t))(v109[5] + 16))(v109[5], [v50 elements], objc_msgSend(v50, "name"));
                      }
                      else {
                        (*(void (**)(void))(v116[5] + 16))();
                      }
                    }
                    uint64_t v47 = [v46 countByEnumeratingWithState:&v103 objects:v151 count:16];
                  }
                  while (v47);
                }

                if (*((unsigned char *)v122 + 24))
                {
                }
                else
                {
                  [v77 setAttributeMappings:v74];
                  [v77 setRelationshipMappings:v81];

                  v53 = (void *)[v77 userInfo];
                  v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v53, "count") + 3);
                  v55 = v54;
                  if (v53) {
                    [v54 addEntriesFromDictionary:v53];
                  }
                  [v55 setObject:v83 forKey:_NSInferredRemovedPropertiesKey];
                  [v55 setObject:v79 forKey:_NSInferredAddedPropertiesKey];
                  [v55 setObject:v78 forKey:_NSInferredMappedPropertiesKey];
                  [v77 setUserInfo:v55];
                }
                [v82 drain];
                BOOL v52 = *((unsigned char *)v122 + 24) == 0;
                _Block_object_dispose(&v108, 8);
                _Block_object_dispose(&v115, 8);
                _Block_object_dispose(&v121, 8);
              }
              else
              {
                id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
                v85->_entityMappings = (NSMutableArray *)objc_msgSend(v51, "initWithDomain:code:userInfo:", v73, 134190, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Each property must have a unique renaming identifier", @"reason"));

                [v82 drain];
                BOOL v52 = 0;
              }
              _Block_object_dispose(&v130, 8);
              _Block_object_dispose(&v137, 8);
              _Block_object_dispose(&v143, 8);
              if (!v52) {
                break;
              }
            }
            if (++v84 == v76)
            {
              uint64_t v76 = [obj countByEnumeratingWithState:&v87 objects:v147 count:16];
              if (v76) {
                goto LABEL_27;
              }
              goto LABEL_65;
            }
          }
          entityMappings = v85->_entityMappings;
          if (entityMappings)
          {
            if (a2)
            {
              v2 = 0;
              *a2 = (uint64_t)entityMappings;
              goto LABEL_78;
            }
          }
          else
          {
            uint64_t v63 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m");
            v70 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m";
              __int16 v154 = 1024;
              int v155 = 131;
              _os_log_fault_impl(&dword_18AB82000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }
          v2 = 0;
        }
        else
        {
LABEL_65:
          v2 = objc_alloc_init(NSMappingModel);
          [(NSMappingModel *)v2 setEntityMappings:obj];
        }
LABEL_78:
        id v3 = obj;
      }
      else
      {
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Each destination entity must have a unique renaming identifier" forKey:@"reason"];
        uint64_t v61 = [v59 initWithDomain:*MEMORY[0x1E4F281F8] code:134190 userInfo:v60];
        v85->_entityMappings = (NSMutableArray *)v61;
        if (a2) {
          *a2 = v61;
        }

        v2 = 0;
        id v3 = v9;
      }
    }
    else
    {
      id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Each source entity must have a unique renaming identifier" forKey:@"reason"];
      uint64_t v58 = [v56 initWithDomain:*MEMORY[0x1E4F281F8] code:134190 userInfo:v57];
      v85->_entityMappings = (NSMutableArray *)v58;
      v2 = 0;
      if (a2) {
        *a2 = v58;
      }
    }
  }
  return v2;
}

- (NSEntityMapping)newEntityMappingWithSource:(void *)a1 destination:(void *)a2
{
  v4 = objc_alloc_init(NSEntityMapping);
  if (a1)
  {
    -[NSEntityMapping setSourceEntityName:](v4, "setSourceEntityName:", [a1 name]);
    -[NSEntityMapping setSourceEntityVersionHash:](v4, "setSourceEntityVersionHash:", [a1 versionHash]);
    uint64_t v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
LABEL_7:
    id v13 = [NSString alloc];
    v14 = (void *)[v13 initWithFormat:@"%@%@_%@", _NSInferredMappingPrefix, @"Remove", objc_msgSend(a1, "renamingIdentifier")];
    [(NSEntityMapping *)v4 setName:v14];

    uint64_t v5 = 3;
    goto LABEL_11;
  }
  id v11 = [NSString alloc];
  uint64_t v12 = (void *)[v11 initWithFormat:@"%@%@_%@", _NSInferredMappingPrefix, @"Add", objc_msgSend(a2, "renamingIdentifier")];
  [(NSEntityMapping *)v4 setName:v12];

  uint64_t v5 = 2;
  if (!a2) {
    goto LABEL_7;
  }
LABEL_3:
  -[NSEntityMapping setDestinationEntityName:](v4, "setDestinationEntityName:", [a2 name]);
  -[NSEntityMapping setDestinationEntityVersionHash:](v4, "setDestinationEntityVersionHash:", [a2 versionHash]);
  if (a1)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a1, "versionHash"), "isEqual:", objc_msgSend(a2, "versionHash"));
    id v7 = [NSString alloc];
    objc_super v8 = _NSInferredMappingPrefix;
    uint64_t v9 = [a1 renamingIdentifier];
    if (v6)
    {
      v10 = (void *)[v7 initWithFormat:@"%@%@_%@", v8, @"Copy", v9];
      [(NSEntityMapping *)v4 setName:v10];

      uint64_t v5 = 4;
    }
    else
    {
      v15 = (void *)[v7 initWithFormat:@"%@%@_%@", v8, @"Transform", v9];
      [(NSEntityMapping *)v4 setName:v15];

      uint64_t v5 = 5;
      if ([a1 _isSchemaEqual:a2] && v4)
      {
        *(_DWORD *)&v4->_entityMappingFlags |= 2u;
        uint64_t v5 = 5;
      }
    }
  }
LABEL_11:
  [(NSEntityMapping *)v4 setMappingType:v5];
  return v4;
}

@end