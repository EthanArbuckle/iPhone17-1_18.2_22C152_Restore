@interface NSMappingModelBuilder
@end

@implementation NSMappingModelBuilder

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (a3) {
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(a2, "renamingIdentifier")];
  }
  else {
    uint64_t v5 = [a2 renamingIdentifier];
  }
  [*(id *)(a1 + 32) setObject:a2 forKey:v5];
  v6 = *(void **)(a1 + 40);
  uint64_t v7 = [a2 name];

  return [v6 addObject:v7];
}

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v17;
    unint64_t v8 = 0x1E544A000uLL;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a2);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(a1 + 32);
          goto LABEL_8;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v13 = v8;
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          [v10 elements];
          [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v10, "name")];
          v12 = *(void (**)(void))(v14 + 16);
          unint64_t v8 = v13;
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = *(void *)(a1 + 40);
LABEL_8:
          v12 = *(void (**)(void))(*(void *)(*(void *)(v11 + 8) + 40) + 16);
LABEL_11:
          v12();
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

void __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v146[1] = *MEMORY[0x1E4F143B8];
  if ([a2 isTransient]) {
    return;
  }
  if (a3) {
    uint64_t v6 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(a2, "renamingIdentifier")];
  }
  else {
    uint64_t v6 = [a2 renamingIdentifier];
  }
  uint64_t v7 = v6;
  unint64_t v8 = (void *)[*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v9 = [a2 _propertyType];
  uint64_t v10 = [v8 _propertyType];
  uint64_t v144 = v9;
  if (v8 && v10 != v9)
  {
    if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
    {
      [v8 name];
      _NSCoreDataLog(2, @"(migration) destination model property (renaming identifier '%@') matches the renaming identifier for a different type of property (%@) in the source model. Properties cannot be mapped to other property types.\n", v11, v12, v13, v14, v15, v16, v7);
    }
    unint64_t v8 = 0;
  }
  uint64_t v17 = 56;
  if (!v8) {
    uint64_t v17 = 48;
  }
  objc_msgSend(*(id *)(a1 + v17), "addObject:", objc_msgSend(a2, "_qualifiedName"));
  if (![a2 _isAttribute])
  {
    if (![a2 _isRelationship] || (uint64_t v141 = *(void *)(a1 + 40)) == 0)
    {
LABEL_154:
      if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
      {
        [v8 name];
        _NSCoreDataLog(1, @"(migration) uninferrable, non-transient property type '%u' for destination model property (renaming identifier '%@'), source model property (renaming identifier '%@').", v127, v128, v129, v130, v131, v132, v144);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      return;
    }
    uint64_t v138 = [a2 name];
    if (v8)
    {
      uint64_t v22 = [v8 name];
      if (([v8 isOptional] & 1) == 0
        && (![v8 isToMany] || objc_msgSend(v8, "minCount"))
        || ([a2 isOptional] & 1) != 0
        || [a2 isToMany] && !objc_msgSend(a2, "minCount"))
      {
        int v30 = 0;
      }
      else
      {
        if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
        {
          uint64_t v23 = [*(id *)(v141 + 24) sourceEntityName];
          [*(id *)(v141 + 24) destinationEntityName];
          _NSCoreDataLog(2, @"(migration) relationship mapping for (%@->%@ to %@->%@) requires data validation during store migration, mapping a previously optional relationship to a mandatory relationship.\n", v24, v25, v26, v27, v28, v29, v23);
        }
        int v30 = 1;
      }
      if ([v8 isToMany] && !objc_msgSend(a2, "isToMany"))
      {
        id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v81 = objc_msgSend(v82, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134190, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v138, @"property", objc_msgSend(*(id *)(v141 + 24), "destinationEntityName"), @"entity", @"Can not map from a to-many to a to-one relationship", @"reason", 0));
        goto LABEL_83;
      }
      v53 = (void *)MEMORY[0x1E4F28C68];
      uint64_t v54 = [MEMORY[0x1E4F28C68] expressionForVariable:@"source"];
      uint64_t v55 = objc_msgSend(v53, "expressionForFunction:selectorName:arguments:", v54, @"valueForKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", v22)));
      v56 = (void *)MEMORY[0x1E4F28C68];
      uint64_t v57 = [MEMORY[0x1E4F28C68] expressionForVariable:@"manager"];
      uint64_t v58 = objc_msgSend(v56, "expressionForFunction:selectorName:arguments:", v57, @"destinationInstancesForSourceRelationshipNamed:sourceInstances:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", v22), v55, 0));
      v59 = [NSPropertyTransform alloc];
      v145 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v59, "initWithPropertyName:valueExpression:", v138, [MEMORY[0x1E4F28C68] expressionForKeyPath:v22]);
      v60 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v145 count:1];

      if (v60)
      {
LABEL_70:
        v40 = objc_alloc_init(NSPropertyMapping);
        [(NSPropertyMapping *)v40 setName:v138];
        [(NSPropertyMapping *)v40 setValueExpression:v58];
        -[NSPropertyMapping _setPropertyTransforms:](v40, v60);

        if (v30)
        {
          id v61 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v62 = [NSNumber numberWithBool:1];
          v63 = objc_msgSend(v61, "initWithObjectsAndKeys:", v62, _NSInferredMappingCouldFailValidation, 0);
          [(NSPropertyMapping *)v40 setUserInfo:v63];
          v146[0] = NSPropertyTransformMandatoryPropertyValidation;
          -[NSPropertyMapping _setTransformValidations:](v40, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:1]);
          v64 = (void *)[*(id *)(v141 + 24) userInfo];
          if (v64)
          {
            v65 = v64;
            if ((objc_msgSend((id)objc_msgSend(v64, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue") & 1) == 0)
            {
              v66 = (void *)[v65 mutableCopy];
              uint64_t v67 = [NSNumber numberWithBool:1];
              [v66 setObject:v67 forKey:_NSInferredMappingCouldFailValidation];
              [*(id *)(v141 + 24) setUserInfo:v66];
            }
          }
          else
          {
            [*(id *)(v141 + 24) setUserInfo:v63];
          }
        }
        if (!v40) {
          goto LABEL_154;
        }
        v90 = (id *)(a1 + 80);
        goto LABEL_96;
      }
    }
    else
    {
      if (([a2 isOptional] & 1) != 0
        || [a2 isToMany] && !objc_msgSend(a2, "minCount"))
      {
        int v30 = 0;
      }
      else
      {
        if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
        {
          uint64_t v71 = [*(id *)(v141 + 24) destinationEntityName];
          _NSCoreDataLog(2, @"(migration) relationship mapping for (%@->%@) requires data validation during store migration, mapping a new, mandatory relationship.\n", v72, v73, v74, v75, v76, v77, v71);
        }
        int v30 = 1;
      }
      v78 = [NSPropertyTransform alloc];
      uint64_t v79 = [a2 name];
      v145 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v78, "initWithPropertyName:valueExpression:", v79, [MEMORY[0x1E4F28C68] expressionForConstantValue:0]);
      v60 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v145 count:1];

      uint64_t v58 = 0;
      if (v60) {
        goto LABEL_70;
      }
    }
    id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v81 = objc_msgSend(v80, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134190, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v138, @"property", objc_msgSend(*(id *)(v141 + 24), "destinationEntityName"), @"entity", @"Unable to infer mapping for relationship", @"reason", 0));
LABEL_83:
    *(void *)(v141 + 32) = v81;
    goto LABEL_154;
  }
  uint64_t v18 = [*(id *)(a1 + 64) objectForKey:a3];
  if (v18) {
    uint64_t v18 = [*(id *)(a1 + 64) objectForKey:a3];
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = a3;
  }
  if (!v19) {
    goto LABEL_154;
  }
  if (v20) {
    uint64_t v21 = [NSString stringWithFormat:@"%@.%@", v20, objc_msgSend(a2, "name")];
  }
  else {
    uint64_t v21 = [a2 name];
  }
  uint64_t v31 = v21;
  if (v8)
  {
    uint64_t v142 = v21;
    if (!objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSMigrationAllowTypeTransformation")
      || (uint64_t v32 = [v8 attributeType], v32 == objc_msgSend(a2, "attributeType"))
      && ([a2 attributeType] == 1000 || objc_msgSend(a2, "attributeType") == 1800))
    {
      uint64_t v33 = [v8 attributeType];
      uint64_t v34 = [a2 attributeType];
      uint64_t v31 = v142;
      if (!v33 || !v34)
      {
LABEL_150:
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v69 = *MEMORY[0x1E4F281F8];
        v124 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v125 = [*(id *)(v19 + 24) destinationEntityName];
        v135 = @"reason";
        uint64_t v136 = 0;
        v126 = @"Source and destination attribute types are incompatible";
LABEL_151:
        uint64_t v70 = objc_msgSend(v124, "dictionaryWithObjectsAndKeys:", v31, @"property", v125, @"entity", v126, v135, v136);
        goto LABEL_152;
      }
      if (v33 != v34)
      {
        char v35 = 1;
        if (v33 > 399)
        {
          if (v33 != 400 && v33 != 500 && v33 != 600) {
            goto LABEL_103;
          }
        }
        else if (v33 != 100 && v33 != 200 && v33 != 300)
        {
LABEL_103:
          char v35 = 0;
        }
        if (v34 > 399)
        {
          if (v34 != 400 && v34 != 600 && v34 != 500)
          {
LABEL_147:
            if (v34 != 800) {
              char v35 = 0;
            }
            if ((v35 & 1) == 0) {
              goto LABEL_150;
            }
            goto LABEL_115;
          }
        }
        else if (v34 != 100 && v34 != 200 && v34 != 300)
        {
          goto LABEL_147;
        }
        if (v33 == 800) {
          char v35 = 1;
        }
        if ((v35 & 1) == 0) {
          goto LABEL_150;
        }
      }
    }
    else
    {
      if (([v8 attributeType] != 1800 || objc_msgSend(a2, "attributeType") != 1000)
        && ([v8 attributeType] != 1000 || objc_msgSend(a2, "attributeType") != 1800))
      {
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v69 = *MEMORY[0x1E4F281F8];
        uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v142, @"property", objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), @"entity", @"Type Transformation expects NSTransformableAttributeType or NSBinaryDataAttributeType", @"reason", 0);
LABEL_152:
        uint64_t v50 = v70;
        v51 = v68;
        uint64_t v52 = v69;
        goto LABEL_153;
      }
      if ([v8 attributeType] == 1000 && (objc_msgSend(v8, "storesBinaryDataExternally") & 1) != 0
        || [a2 attributeType] == 1000 && objc_msgSend(a2, "storesBinaryDataExternally"))
      {
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F281F8];
        uint64_t v50 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v142, @"property", objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), @"entity", @"Type Transformation expects NSBinaryDataAttributeType NOT to be stored externally", @"reason", 0);
        v51 = v48;
        uint64_t v52 = v49;
LABEL_153:
        *(void *)(v19 + 32) = [v51 initWithDomain:v52 code:134190 userInfo:v50];
        goto LABEL_154;
      }
      uint64_t v139 = [v8 name];
      +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", [v8 attributeType]);
      [a2 name];
      +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", [a2 attributeType]);
      _NSCoreDataLog(2, @"Transforming %@ (%@) to %@ (%@), was %@", v91, v92, v93, v94, v95, v96, v139);
      uint64_t v31 = v142;
    }
LABEL_115:
    if (a3) {
      uint64_t v99 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v8, "name")];
    }
    else {
      uint64_t v99 = [v8 name];
    }
    uint64_t v100 = v99;
    if (![v8 isOptional] || (objc_msgSend(a2, "isOptional") & 1) != 0)
    {
      if ([a2 attributeType] == 1000
        && [a2 storesBinaryDataExternally]
        && ([v8 storesBinaryDataExternally] & 1) == 0)
      {
        uint64_t v106 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v100];
        v107 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObject:v106];
        uint64_t v101 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForEvaluatedObject"), @"_prependExternalBlobToken:", v107);

        goto LABEL_127;
      }
      if ([a2 attributeType] != 1000
        || ![v8 storesBinaryDataExternally]
        || [a2 storesBinaryDataExternally])
      {
        uint64_t v101 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v100];
LABEL_127:
        v102 = (void *)MEMORY[0x1E4F28C68];
        uint64_t v103 = [MEMORY[0x1E4F28C68] expressionForVariable:@"source"];
        uint64_t v39 = objc_msgSend(v102, "expressionForFunction:selectorName:arguments:", v103, @"valueForKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", v100)));
        v145 = [[NSPropertyTransform alloc] initWithPropertyName:v142 valueExpression:v101];
        uint64_t v31 = v142;
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v145 count:1];

        int v104 = 0;
        goto LABEL_144;
      }
      id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v69 = *MEMORY[0x1E4F281F8];
      v124 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v125 = [*(id *)(v19 + 24) destinationEntityName];
      v135 = @"Reason";
      uint64_t v136 = 0;
LABEL_160:
      v126 = @"Unable to use inferred mapping to move external reference into store.";
      goto LABEL_151;
    }
    if ([a2 defaultValue])
    {
      int v105 = 0;
    }
    else
    {
      if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
      {
        uint64_t v108 = [*(id *)(v19 + 24) sourceEntityName];
        [*(id *)(v19 + 24) destinationEntityName];
        _NSCoreDataLog(2, @"(migration) attribute mapping for (%@->%@ to %@->%@) requires data validation during store migration, mapping a previously optional attribute to a mandatory attribute without a default value.\n", v109, v110, v111, v112, v113, v114, v108);
      }
      int v105 = 1;
    }
    if ([a2 attributeType] == 1000
      && [a2 storesBinaryDataExternally]
      && ([v8 storesBinaryDataExternally] & 1) == 0)
    {
      int v143 = v105;
      uint64_t v133 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v100];
      v134 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObject:v133];
      uint64_t v140 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForEvaluatedObject"), @"_prependExternalBlobToken:", v134);
    }
    else
    {
      if ([a2 attributeType] == 1000
        && [v8 storesBinaryDataExternally]
        && ![a2 storesBinaryDataExternally])
      {
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v69 = *MEMORY[0x1E4F281F8];
        v124 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v125 = [*(id *)(v19 + 24) destinationEntityName];
        v135 = 0;
        goto LABEL_160;
      }
      int v143 = v105;
      uint64_t v140 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v100];
    }
    v115 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v137 = [MEMORY[0x1E4F28C68] expressionForVariable:@"entityPolicy"];
    v116 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v117 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v31];
    uint64_t v118 = [MEMORY[0x1E4F28C68] expressionForVariable:@"source"];
    uint64_t v39 = objc_msgSend(v115, "expressionForFunction:selectorName:arguments:", v137, @"_nonNilValueOrDefaultValueForAttribute:source:destination:", objc_msgSend(v116, "arrayWithObjects:", v117, v118, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForVariable:", @"destination"), 0));
    v119 = [[NSPropertyTransform alloc] initWithPropertyName:v31 valueExpression:v140];
    v120 = [NSPropertyTransform alloc];
    v121 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v120, "initWithPropertyName:valueExpression:", v31, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(a2, "defaultValue")));
    v123 = v121;
    if (v121)
    {
      objc_setProperty_nonatomic(v121, v122, v119, 24);
      v123->_replaceMissingValueOnly = 1;
    }
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v119, v123, 0);

    int v104 = v143;
LABEL_144:
    BOOL v36 = v104 != 0;
    if (!v38)
    {
LABEL_145:
      id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v69 = *MEMORY[0x1E4F281F8];
      uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v31, @"property", objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), @"entity", @"Unable to infer mapping for attribute", @"reason", 0);
      goto LABEL_152;
    }
    goto LABEL_49;
  }
  if (([a2 isOptional] & 1) != 0 || objc_msgSend(a2, "defaultValue"))
  {
    BOOL v36 = 0;
  }
  else
  {
    if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
    {
      uint64_t v83 = [*(id *)(v19 + 24) destinationEntityName];
      _NSCoreDataLog(2, @"(migration) attribute mapping for (%@->%@) requires data validation during store migration, mapping a new, mandatory attribute without a default value.\n", v84, v85, v86, v87, v88, v89, v83);
    }
    BOOL v36 = 1;
  }
  v37 = [NSPropertyTransform alloc];
  v145 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v37, "initWithPropertyName:valueExpression:", v31, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(a2, "defaultValue")));
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v145 count:1];

  uint64_t v39 = 0;
  if (!v38) {
    goto LABEL_145;
  }
LABEL_49:
  v40 = objc_alloc_init(NSPropertyMapping);
  [(NSPropertyMapping *)v40 setName:v31];
  [(NSPropertyMapping *)v40 setValueExpression:v39];
  -[NSPropertyMapping _setPropertyTransforms:](v40, v38);

  if (v36)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v42 = [NSNumber numberWithBool:1];
    v43 = objc_msgSend(v41, "initWithObjectsAndKeys:", v42, _NSInferredMappingCouldFailValidation, 0);
    [(NSPropertyMapping *)v40 setUserInfo:v43];
    v146[0] = NSPropertyTransformMandatoryPropertyValidation;
    -[NSPropertyMapping _setTransformValidations:](v40, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:1]);
    v44 = (void *)[*(id *)(v19 + 24) userInfo];
    if (v44)
    {
      v45 = v44;
      if ((objc_msgSend((id)objc_msgSend(v44, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue") & 1) == 0)
      {
        v46 = (void *)[v45 mutableCopy];
        uint64_t v47 = [NSNumber numberWithBool:1];
        [v46 setObject:v47 forKey:_NSInferredMappingCouldFailValidation];
        [*(id *)(v19 + 24) setUserInfo:v46];
      }
    }
    else
    {
      [*(id *)(v19 + 24) setUserInfo:v43];
    }
  }
  if (!v40) {
    goto LABEL_154;
  }
  v90 = (id *)(a1 + 72);
LABEL_96:
  [*v90 addObject:v40];

  if (v8)
  {
    v97 = *(void **)(a1 + 88);
    uint64_t v98 = [v8 name];
    [v97 removeObject:v98];
  }
}

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v20;
    uint64_t v18 = a1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = a1[5];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 renamingIdentifier]
              && (objc_msgSend((id)objc_msgSend(v10, "renamingIdentifier"), "isEqualToString:", objc_msgSend(v10, "name")) & 1) == 0)
            {
              uint64_t v17 = (void *)a1[4];
              uint64_t v16 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v10, "name")];
              [v17 setObject:v16, objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", a3, objc_msgSend(v10, "renamingIdentifier")) forKey];
              uint64_t v13 = *(void *)(*(void *)(v18[5] + 8) + 40);
              [v10 elements];
              uint64_t v14 = NSString;
              uint64_t v15 = [v10 renamingIdentifier];
            }
            else
            {
              uint64_t v13 = *(void *)(*(void *)(a1[5] + 8) + 40);
              [v10 elements];
              uint64_t v14 = NSString;
              uint64_t v15 = [v10 name];
            }
            [v14 stringWithFormat:@"%@.%@", a3, v15];
            uint64_t v12 = *(void (**)(void))(v13 + 16);
            a1 = v18;
            goto LABEL_17;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          uint64_t v11 = a1[6];
        }
        uint64_t v12 = *(void (**)(void))(*(void *)(*(void *)(v11 + 8) + 40) + 16);
LABEL_17:
        v12();
LABEL_18:
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

@end