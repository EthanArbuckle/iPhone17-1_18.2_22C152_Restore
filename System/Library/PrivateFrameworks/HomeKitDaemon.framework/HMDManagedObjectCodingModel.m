@interface HMDManagedObjectCodingModel
+ (unint64_t)defaultOptions;
- (BOOL)_managedObject:(uint64_t)a3 withDescription:(void *)a4 matchesKeyAttributes:;
- (BOOL)_processDeferredBlocks:(id *)a3 context:;
- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4;
- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4 changes:(id)a5 conditions:(id)a6 userContext:(id)a7;
- (BOOL)hasOnlyParentChildRelationships;
- (BOOL)isRelevantChanges:(id)a3 withRootObject:(id)a4 conditions:(id)a5 userContext:(id)a6;
- (BOOL)isValidCondition:(id)a3;
- (BOOL)updateRootObject:(id)a3 fromReader:(id)a4;
- (HMDEntityCodingDescription)rootDescription;
- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5;
- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5 options:(unint64_t)a6;
- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5;
- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5 options:(unint64_t)a6;
- (NSArray)allDescriptions;
- (NSManagedObjectModel)objectModel;
- (id)_decodeManagedObjectWithDescription:(int)a3 byReference:(int)a4 useDynamicType:(uint64_t)a5 context:(uint64_t)a6 lookupBlock:(uint64_t)a7 emplaceBlock:;
- (id)_decodeManagedObjectWithDescription:(uint64_t)a3 byReference:(uint64_t)a4 useDynamicType:(uint64_t)a5 candidates:context:orEmplaceWithBlock:;
- (id)_managedObjectWithDescription:(void *)a3 matchingKeyAttributes:(uint64_t)a4 context:;
- (id)_readKeyAttributesWithDescription:(void *)a3 typeID:(int)a4 byReference:(id *)a5 context:;
- (id)_readValueForAttribute:(void *)a1 context:(id *)a2;
- (id)codingKeyForProperty:(uint64_t)a1;
- (id)codingKeyForPropertyName:(uint64_t)a1;
- (id)decodeRootObjectFromReader:(id)a3;
- (id)descriptionForAttribute:(id)a3;
- (id)descriptionForDestinationOfRelationship:(id)a3;
- (id)descriptionForEntity:(id)a3;
- (id)descriptionForManagedObject:(id)a3;
- (id)descriptionForRelationship:(id)a3;
- (id)insertOrUpdateRootObjectInContext:(id)a3 fromReader:(id)a4;
- (id)mutableCodingKeyTableForProperties:(uint64_t)a1;
- (id)reverseLookupTableForCodingKeyTable:(void *)a1;
- (id)subentityOfDescription:(id)a3 withTypeID:(id)a4;
- (id)typeIdForEntity:(uint64_t)a1;
- (uint64_t)_conditionallyEncodeChildObject:(uint64_t)a3 withDescription:(void *)a4 forRelationship:(uint64_t)a5 byReference:(unsigned int)a6 useDynamicType:(uint64_t)a7 context:;
- (uint64_t)_prepareRelatedObject:(uint64_t)a3 ofManagedObject:(void *)a4 relationship:(char)a5 byReference:(uint64_t)a6 context:;
- (uint64_t)contextualizeConditions:(void *)a3 forManagedObject:(uint64_t)a4 userContext:;
- (uint64_t)includeModeForProperty:(uint64_t)a3 withDefault:;
- (void)_buildPredicateAtoms:(void *)a3 withDescription:(uint64_t)a4 keyPathPrefix:(void *)a5 values:;
- (void)_encodeAttribute:(void *)a3 ofManagedObject:(uint64_t)a4 context:;
- (void)_encodeKeyAttributesOfManagedObject:(void *)a3 withDescription:(uint64_t)a4 typeID:(int)a5 byReference:(id *)a6 context:;
- (void)_encodeManagedObject:(void *)a3 withDescription:(int)a4 byReference:(int)a5 useDynamicType:(uint64_t)a6 context:;
- (void)_encodeRelationship:(void *)a3 ofManagedObject:(uint64_t)a4 context:;
- (void)_encodeValue:(void *)a3 forAttribute:(void *)a4 context:;
@end

@implementation HMDManagedObjectCodingModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalConfigKey, 0);
  objc_storeStrong((id *)&self->_inlineConfigKey, 0);
  objc_storeStrong((id *)&self->_transformerConfigKey, 0);
  objc_storeStrong((id *)&self->_codingKeyConfigKey, 0);
  objc_storeStrong((id *)&self->_includeConfigKey, 0);
  objc_storeStrong((id *)&self->_refContextConfigKey, 0);
  objc_storeStrong((id *)&self->_keyAttributesConfigKey, 0);
  objc_storeStrong((id *)&self->_typeIDConfigKey, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (BOOL)isValidCondition:(id)a3
{
  +[HMDCodingConditionSet resolve:fromSet:]((uint64_t)HMDCodingConditionSet, (uint64_t)a3, self->_conditions);
  return v3 != 0;
}

- (id)subentityOfDescription:(id)a3 withTypeID:(id)a4
{
  v6 = [a3 concreteSubentitiesByTypeID];
  v7 = [v6 objectForKeyedSubscript:a4];

  if (v7)
  {
    descriptions = self->_descriptions;
    v9 = [v7 name];
    v10 = [(NSDictionary *)descriptions objectForKeyedSubscript:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)descriptionForDestinationOfRelationship:(id)a3
{
  v4 = [a3 relationship];
  v5 = [v4 destinationEntity];
  v6 = [(HMDManagedObjectCodingModel *)self descriptionForEntity:v5];

  return v6;
}

- (id)descriptionForRelationship:(id)a3
{
  descriptions = self->_descriptions;
  v5 = [a3 entity];
  v6 = [v5 name];
  v7 = [(NSDictionary *)descriptions objectForKeyedSubscript:v6];
  v8 = [v7 descriptionForRelationship:a3];

  return v8;
}

- (id)descriptionForAttribute:(id)a3
{
  descriptions = self->_descriptions;
  v5 = [a3 entity];
  v6 = [v5 name];
  v7 = [(NSDictionary *)descriptions objectForKeyedSubscript:v6];
  v8 = [v7 descriptionForAttribute:a3];

  return v8;
}

- (id)descriptionForManagedObject:(id)a3
{
  descriptions = self->_descriptions;
  v4 = [a3 entity];
  v5 = [v4 name];
  v6 = [(NSDictionary *)descriptions objectForKeyedSubscript:v5];

  return v6;
}

- (id)descriptionForEntity:(id)a3
{
  descriptions = self->_descriptions;
  v4 = [a3 name];
  v5 = [(NSDictionary *)descriptions objectForKeyedSubscript:v4];

  return v5;
}

- (NSArray)allDescriptions
{
  return [(NSDictionary *)self->_descriptions allValues];
}

- (HMDEntityCodingDescription)rootDescription
{
  return self->_root;
}

- (NSManagedObjectModel)objectModel
{
  return self->_model;
}

- (BOOL)hasOnlyParentChildRelationships
{
  return !self->_hasAnyReferenceRelationships;
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5 options:(unint64_t)a6
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    _HMFPreconditionFailure();
    goto LABEL_108;
  }
  if (!a4)
  {
LABEL_108:
    _HMFPreconditionFailure();
LABEL_109:
    _HMFPreconditionFailure();
LABEL_110:
    [v142 name];
    objc_claimAutoreleasedReturnValue();
    _HMFPreconditionFailureWithFormat();
LABEL_113:
    __break(1u);
  }
  if (!a5) {
    goto LABEL_109;
  }
  v159.receiver = self;
  v159.super_class = (Class)HMDManagedObjectCodingModel;
  result = [(HMDManagedObjectCodingModel *)&v159 init];
  v150 = result;
  if (result)
  {
    objc_storeStrong((id *)&result->_model, a3);
    v150->_options = a6;
    uint64_t v10 = [a4 stringByAppendingString:@"TypeID"];
    typeIDConfigKey = v150->_typeIDConfigKey;
    v150->_typeIDConfigKey = (NSString *)v10;

    uint64_t v12 = [a4 stringByAppendingString:@"KeyAttributes"];
    keyAttributesConfigKey = v150->_keyAttributesConfigKey;
    v150->_keyAttributesConfigKey = (NSString *)v12;

    uint64_t v14 = [a4 stringByAppendingString:@"RefContext"];
    refContextConfigKey = v150->_refContextConfigKey;
    v150->_refContextConfigKey = (NSString *)v14;

    uint64_t v16 = [a4 stringByAppendingString:@"Include"];
    includeConfigKey = v150->_includeConfigKey;
    v150->_includeConfigKey = (NSString *)v16;

    uint64_t v18 = [a4 stringByAppendingString:@"Key"];
    codingKeyConfigKey = v150->_codingKeyConfigKey;
    v150->_codingKeyConfigKey = (NSString *)v18;

    uint64_t v20 = [a4 stringByAppendingFormat:@"Transformer"];
    transformerConfigKey = v150->_transformerConfigKey;
    v150->_transformerConfigKey = (NSString *)v20;

    uint64_t v22 = [a4 stringByAppendingString:@"Inline"];
    inlineConfigKey = v150->_inlineConfigKey;
    v150->_inlineConfigKey = (NSString *)v22;

    uint64_t v24 = [a4 stringByAppendingString:@"Conditional"];
    conditionalConfigKey = v150->_conditionalConfigKey;
    v150->_conditionalConfigKey = (NSString *)v24;

    v26 = [a4 stringByAppendingString:@"ContextualizeConditions:userContext:"];
    SEL v27 = NSSelectorFromString(v26);
    p_contextualizeConditionsSelector = &v150->_contextualizeConditionsSelector;
    if (v27) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    v150->_contextualizeConditionsSelector = v28;

    v29 = [a4 stringByAppendingString:@"AttributeValueForKey:userContext:"];
    SEL v30 = NSSelectorFromString(v29);
    p_attributeValueForKeySelector = &v150->_attributeValueForKeySelector;
    if (v30) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    v150->_attributeValueForKeySelector = v31;

    v32 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    conditions = v150->_conditions;
    v150->_conditions = v32;

    id v141 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v34 = [MEMORY[0x263EFF980] arrayWithObject:a5];
    if ([v34 count])
    {
      while (1)
      {
        v35 = [v34 lastObject];
        [v34 removeLastObject];
        v143 = [v35 name];
        v36 = [v141 objectForKeyedSubscript:v143];

        if (!v36) {
          break;
        }
LABEL_99:

        if (![v34 count]) {
          goto LABEL_100;
        }
      }
      v37 = [HMDEntityCodingDescription alloc];
      if (!v37
        || (v160.receiver = v37,
            v160.super_class = (Class)HMDEntityCodingDescription,
            v38 = [(HMDManagedObjectCodingModel *)&v160 init],
            (v144 = v38) == 0))
      {
        v48 = 0;
LABEL_79:
        v145 = v48;
        objc_msgSend(v141, "setObject:forKeyedSubscript:");
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        v115 = [(HMDManagedObjectCodingModel *)v145 concreteSubentitiesByTypeID];
        v116 = [v115 allValues];

        uint64_t v117 = [v116 countByEnumeratingWithState:&v155 objects:v172 count:16];
        if (v117)
        {
          uint64_t v118 = *(void *)v156;
          do
          {
            for (uint64_t i = 0; i != v117; ++i)
            {
              if (*(void *)v156 != v118) {
                objc_enumerationMutation(v116);
              }
              if (*(void **)(*((void *)&v155 + 1) + 8 * i) != v35) {
                objc_msgSend(v34, "addObject:");
              }
            }
            uint64_t v117 = [v116 countByEnumeratingWithState:&v155 objects:v172 count:16];
          }
          while (v117);
        }

        long long v153 = 0u;
        long long v154 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        v120 = [(HMDManagedObjectCodingModel *)v145 relationshipsByCodingKey];
        v121 = [v120 allValues];

        uint64_t v122 = [v121 countByEnumeratingWithState:&v151 objects:v171 count:16];
        if (v122)
        {
          uint64_t v123 = *(void *)v152;
          do
          {
            for (uint64_t j = 0; j != v122; ++j)
            {
              if (*(void *)v152 != v123) {
                objc_enumerationMutation(v121);
              }
              v125 = *(void **)(*((void *)&v151 + 1) + 8 * j);
              v126 = [v125 relationship];
              v127 = [v126 destinationEntity];
              [v34 addObject:v127];

              if (!v150->_hasAnyReferenceRelationships && [v125 isReference]) {
                v150->_hasAnyReferenceRelationships = 1;
              }
            }
            uint64_t v122 = [v121 countByEnumeratingWithState:&v151 objects:v171 count:16];
          }
          while (v122);
        }

        goto LABEL_99;
      }
      objc_storeStrong((id *)&v38->_model, v35);
      uint64_t v39 = -[HMDManagedObjectCodingModel typeIdForEntity:]((uint64_t)v150, v35);
      options = (void *)v144->_options;
      v144->_options = v39;

      v41 = v150->_keyAttributesConfigKey;
      id v42 = v35;
      v142 = v42;
      if (v42)
      {
        v139 = v41;
        v43 = v42;
        do
        {
          v44 = [v43 userInfo];
          v45 = [v44 objectForKeyedSubscript:v150->_keyAttributesConfigKey];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v46 = v45;
          }
          else {
            v46 = 0;
          }
          id v148 = v46;

          v146 = [v43 superentity];

          v43 = v146;
        }
        while (v146 && !v148);
        if (v148)
        {
          v47 = [v148 componentsSeparatedByString:@","];
          goto LABEL_27;
        }
      }
      else
      {
        v146 = 0;
      }

      v49 = [v142 uniquenessConstraints];
      v47 = [v49 firstObject];

      id v148 = 0;
      v139 = @"unique constraint";
LABEL_27:
      if (![v47 count]) {
        goto LABEL_110;
      }
      v50 = [v142 attributesByName];
      v51 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v47, "count"));
      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      id v52 = v47;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v161 objects:buf count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v162;
        do
        {
          for (uint64_t k = 0; k != v53; ++k)
          {
            if (*(void *)v162 != v54) {
              objc_enumerationMutation(v52);
            }
            v56 = [v50 objectForKeyedSubscript:*(void *)(*((void *)&v161 + 1) + 8 * k)];
            v57 = v56;
            if (!v56) {
              goto LABEL_110;
            }
            if ([v56 isOptional])
            {
              [v142 name];
              objc_claimAutoreleasedReturnValue();
              [v57 name];
              objc_claimAutoreleasedReturnValue();
              _HMFPreconditionFailureWithFormat();
              goto LABEL_113;
            }
            [v51 addObject:v57];
          }
          uint64_t v53 = [v52 countByEnumeratingWithState:&v161 objects:buf count:16];
        }
        while (v53);
      }

      v138 = (void *)[v51 copy];
      v58 = -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v150, v138);
      uint64_t v59 = [v58 copy];
      v60 = *(void **)&v144->_hasAnyReferenceRelationships;
      *(void *)&v144->_hasAnyReferenceRelationships = v59;

      [*(id *)&v144->_hasAnyReferenceRelationships enumerateKeysAndObjectsUsingBlock:&__block_literal_global_61634];
      v61 = [v142 attributesByName];
      v62 = [v61 allValues];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __57__HMDManagedObjectCodingModel_syncedAttributesForEntity___block_invoke;
      v174 = &unk_264A1B930;
      v175 = v150;
      v149 = objc_msgSend(v62, "hmf_objectsPassingTest:", buf);

      v63 = -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v150, v149);
      v64 = [*(id *)&v144->_hasAnyReferenceRelationships allKeys];
      [v63 removeObjectsForKeys:v64];

      uint64_t v65 = [v63 copy];
      v66 = v144->_typeIDConfigKey;
      v144->_typeIDConfigKey = (NSString *)v65;

      uint64_t v67 = -[HMDManagedObjectCodingModel reverseLookupTableForCodingKeyTable:](v144->_typeIDConfigKey);
      v68 = v144->_keyAttributesConfigKey;
      v144->_keyAttributesConfigKey = (NSString *)v67;

      v69 = [v142 relationshipsByName];
      v70 = [v69 allValues];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke;
      v174 = &unk_264A1B958;
      v175 = v150;
      id v176 = v142;
      v147 = objc_msgSend(v70, "hmf_objectsPassingTest:", buf);

      v71 = -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v150, v147);
      uint64_t v72 = [v71 copy];
      v73 = v144->_refContextConfigKey;
      v144->_refContextConfigKey = (NSString *)v72;

      uint64_t v74 = -[HMDManagedObjectCodingModel reverseLookupTableForCodingKeyTable:](v144->_refContextConfigKey);
      v75 = v144->_includeConfigKey;
      v144->_includeConfigKey = (NSString *)v74;

      v76 = [v142 relationshipsByName];
      v77 = [v76 allValues];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke;
      v174 = &unk_264A1B958;
      v175 = v150;
      id v176 = v142;
      uint64_t v78 = objc_msgSend(v77, "hmf_objectsPassingTest:", buf);

      v79 = v144->_codingKeyConfigKey;
      v144->_codingKeyConfigKey = (NSString *)v78;

      id v80 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __68__HMDManagedObjectCodingModel_concreteSubentitiesByTypeIDForEntity___block_invoke;
      v174 = &unk_264A1B8E0;
      v175 = v150;
      id v176 = v80;
      v177 = (uint64_t *)v142;
      id v81 = v80;
      objc_msgSend(v142, "hmd_recursivelyEnumerateSubentitiesUsingBlock:", buf);
      v82 = (void *)[v81 copy];

      if ((unint64_t)[v82 count] > 1 || objc_msgSend(v142, "isAbstract")) {
        v83 = v82;
      }
      else {
        v83 = 0;
      }
      objc_storeStrong((id *)&v144->_transformerConfigKey, v83);
      v84 = [v142 userInfo];
      v85 = [v84 objectForKeyedSubscript:v150->_refContextConfigKey];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v86 = v85;
      }
      else {
        v86 = 0;
      }
      v87 = v86;

      if (v87)
      {
        *(void *)&long long v161 = 0;
        *((void *)&v161 + 1) = &v161;
        *(void *)&long long v162 = 0x3032000000;
        *((void *)&v162 + 1) = __Block_byref_object_copy__61643;
        *(void *)&long long v163 = __Block_byref_object_dispose__61644;
        *((void *)&v163 + 1) = 0;
        uint64_t v88 = [(NSDictionary *)v87 rangeOfString:@"="];
        v89 = v150;
        uint64_t v90 = v88;
        if (v88 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v88 || v88 + 1 >= (unint64_t)[(NSDictionary *)v87 length]) {
            goto LABEL_110;
          }
          uint64_t v91 = [(NSDictionary *)v87 substringToIndex:v90];
          v92 = *(void **)(*((void *)&v161 + 1) + 40);
          *(void *)(*((void *)&v161 + 1) + 40) = v91;

          v85 = [(NSDictionary *)v87 substringFromIndex:v90 + 1];

          v89 = v150;
        }
        uint64_t v165 = 0;
        v166 = &v165;
        uint64_t v167 = 0x3032000000;
        v168 = __Block_byref_object_copy__61643;
        v169 = __Block_byref_object_dispose__61644;
        id v93 = v142;
        id v170 = v93;
        v94 = [(NSDictionary *)v85 componentsSeparatedByString:@"."];
        uint64_t v95 = [v94 count];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __76__HMDManagedObjectCodingModel_refContextCodingKey_keyPath_entity_forEntity___block_invoke;
        v174 = &unk_264A1B908;
        v175 = v89;
        id v176 = v93;
        v177 = &v165;
        v178 = &v161;
        uint64_t v179 = v95 - 1;
        objc_msgSend(v94, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
        objc_storeStrong((id *)&v144->_root, *(id *)(*((void *)&v161 + 1) + 40));
        descriptions = v144->_descriptions;
        v144->_descriptions = v85;
        v97 = v85;

        objc_storeStrong((id *)&v144->_conditions, (id)v166[5]);
        _Block_object_dispose(&v165, 8);

        _Block_object_dispose(&v161, 8);
        v98 = [*(id *)&v144->_hasAnyReferenceRelationships objectForKeyedSubscript:v144->_root];
        LOBYTE(descriptions) = v98 == 0;

        if ((descriptions & 1) == 0)
        {
          [v93 name];
          objc_claimAutoreleasedReturnValue();
          _HMFPreconditionFailureWithFormat();
          goto LABEL_113;
        }
      }
      v99 = [v142 managedObjectClassName];
      v100 = NSClassFromString(v99);

      if (*p_contextualizeConditionsSelector) {
        v101 = *p_contextualizeConditionsSelector;
      }
      else {
        v101 = 0;
      }
      if (([(objc_class *)v100 instancesRespondToSelector:v101] & 1) == 0)
      {
        v102 = *p_contextualizeConditionsSelector ? *p_contextualizeConditionsSelector : 0;
        if (!class_addMethod(v100, v102, (IMP)defaultContextualizeIMP, "v@:@@"))
        {
          v103 = (void *)MEMORY[0x230FBD990]();
          v104 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v105 = HMFGetLogIdentifier();
            if (*p_contextualizeConditionsSelector) {
              v106 = *p_contextualizeConditionsSelector;
            }
            else {
              v106 = 0;
            }
            v107 = NSStringFromSelector(v106);
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v105;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v100;
            *(_WORD *)&buf[22] = 2114;
            v174 = v107;
            _os_log_impl(&dword_22F52A000, v104, OS_LOG_TYPE_ERROR, "%{public}@Failed to add default -[%{public}@ %{public}@] implementation", buf, 0x20u);
          }
        }
      }
      if (*p_attributeValueForKeySelector) {
        v108 = *p_attributeValueForKeySelector;
      }
      else {
        v108 = 0;
      }
      if (([(objc_class *)v100 instancesRespondToSelector:v108] & 1) == 0)
      {
        v109 = *p_attributeValueForKeySelector ? *p_attributeValueForKeySelector : 0;
        if (!class_addMethod(v100, v109, (IMP)defaultAttributeValueForKeyIMP, "@@:@@"))
        {
          v110 = (void *)MEMORY[0x230FBD990]();
          v111 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            v112 = HMFGetLogIdentifier();
            if (*p_attributeValueForKeySelector) {
              v113 = *p_attributeValueForKeySelector;
            }
            else {
              v113 = 0;
            }
            v114 = NSStringFromSelector(v113);
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v112;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v100;
            *(_WORD *)&buf[22] = 2114;
            v174 = v114;
            _os_log_impl(&dword_22F52A000, v111, OS_LOG_TYPE_ERROR, "%{public}@Failed to add default -[%{public}@ %{public}@] implementation", buf, 0x20u);
          }
        }
      }

      v48 = v144;
      goto LABEL_79;
    }
LABEL_100:
    v128 = [a5 name];
    uint64_t v129 = [v141 objectForKeyedSubscript:v128];
    root = v150->_root;
    v150->_root = (HMDEntityCodingDescription *)v129;

    uint64_t v131 = [v141 copy];
    v132 = v150->_descriptions;
    v150->_descriptions = (NSDictionary *)v131;

    uint64_t v133 = [(NSOrderedSet *)v150->_conditions count];
    v134 = v150->_conditions;
    if (v133)
    {
      uint64_t v133 = [(NSOrderedSet *)v134 copy];
      v135 = v150;
      v134 = v150->_conditions;
    }
    else
    {
      v135 = v150;
    }
    v135->_conditions = (NSOrderedSet *)v133;

    return v150;
  }
  return result;
}

- (id)typeIdForEntity:(uint64_t)a1
{
  if (a1)
  {
    v4 = [a2 userInfo];
    v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 56)];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = v5;
    }
    else
    {
      id v8 = [a2 name];
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)mutableCodingKeyTableForProperties:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a2, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = a2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = *(void **)v46;
    id v42 = (void *)*MEMORY[0x263F081E0];
    do
    {
      uint64_t v8 = 0;
      uint64_t v43 = v6;
      do
      {
        if (*(void **)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        uint64_t v10 = -[HMDManagedObjectCodingModel codingKeyForProperty:](a1, v9);
        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        if (v11)
        {
          v34 = (void *)v11;
          [v9 entity];
          a1 = [(id)objc_claimAutoreleasedReturnValue() name];
          uint64_t v35 = [v34 name];
          [v9 name];
          v41 = uint64_t v40 = v35;
          uint64_t v38 = a1;
          uint64_t v39 = (uint64_t)v10;
          _HMFPreconditionFailureWithFormat();
LABEL_52:
          uint64_t v36 = *(void *)(a1 + 96);
LABEL_54:
          objc_msgSend(v9, "entity", v38, v39, v40, v41);
          uint64_t v37 = [(id)objc_claimAutoreleasedReturnValue() name];
          [v9 name];
          v40 = uint64_t v39 = v37;
          uint64_t v38 = v36;
          _HMFPreconditionFailureWithFormat();
LABEL_55:
          objc_msgSend(v9, "entity", v38, v39, v40);
          [(id)objc_claimAutoreleasedReturnValue() name];
          objc_claimAutoreleasedReturnValue();
          uint64_t v39 = [v9 name];
          uint64_t v40 = (uint64_t)v7;
          _HMFPreconditionFailureWithFormat();
LABEL_56:
          uint64_t v38 = objc_opt_class();
          _HMFPreconditionFailureWithFormat();
LABEL_57:
          objc_msgSend(v9, "entity", v38, v39, v40);
          [(id)objc_claimAutoreleasedReturnValue() name];
          objc_claimAutoreleasedReturnValue();
          [v9 name];
          objc_claimAutoreleasedReturnValue();
          _HMFPreconditionFailureWithFormat();
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [HMDAttributeCodingDescription alloc];
          if (v12)
          {
            v13 = -[HMDPropertyCodingDescription initWithModel:property:](v12, a1, v9);
            if (!v13) {
              goto LABEL_44;
            }
            uint64_t v14 = v7;
            uint64_t v15 = [v9 attributeType];
            uint64_t v16 = [v9 userInfo];
            id v7 = [v16 objectForKeyedSubscript:*(void *)(a1 + 96)];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v17 = v7;
            }
            else {
              v17 = 0;
            }
            id v18 = v17;

            if (v18 && v15 != 1800) {
              goto LABEL_52;
            }
            if (v15 != 1800)
            {
              v19 = 0;
              goto LABEL_30;
            }
            if (v18)
            {
              v23 = @"HMDIdentityTransformer";
              if (([v18 isEqualToString:@"none"] & 1) == 0) {
                goto LABEL_28;
              }
            }
            else
            {
              uint64_t v24 = [v9 valueTransformerName];
              id v18 = (id)v24;
              v25 = v42;
              if (v24) {
                v25 = (void *)v24;
              }
              v23 = v25;
            }

            id v7 = v23;
LABEL_28:
            uint64_t v26 = +[HMDValueTransformer valueTransformerForName:v7];
            if (!v26) {
              goto LABEL_55;
            }
            v19 = (void *)v26;
            id v18 = v7;
LABEL_30:

            id v27 = v13[5];
            v13[5] = v19;

            uint64_t v28 = [v9 attributeType];
            v29 = [v9 userInfo];
            id v7 = [v29 objectForKeyedSubscript:*(void *)(a1 + 104)];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              SEL v30 = v7;
            }
            else {
              SEL v30 = 0;
            }
            id v31 = v30;

            if (v31 && v28 != 1800)
            {
              uint64_t v36 = *(void *)(a1 + 104);
              goto LABEL_54;
            }
            if (v31)
            {
              id v7 = v14;
              if ([v31 isEqualToString:@"YES"])
              {
                BOOL v21 = 1;
                goto LABEL_39;
              }
              uint64_t v6 = v43;
              if (([v31 isEqualToString:@"NO"] & 1) == 0) {
                goto LABEL_57;
              }
              BOOL v21 = 0;
            }
            else
            {
              BOOL v21 = 1;
              id v7 = v14;
LABEL_39:
              uint64_t v6 = v43;
            }

            uint64_t v22 = &OBJC_IVAR___HMDAttributeCodingDescription__shouldInline;
LABEL_43:
            *((unsigned char *)v13 + *v22) = v21;
            goto LABEL_44;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v20 = [HMDRelationshipCodingDescription alloc];
          if (v20)
          {
            v13 = -[HMDPropertyCodingDescription initWithModel:property:](v20, a1, v9);
            if (!v13) {
              goto LABEL_44;
            }
            BOOL v21 = -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](a1, v9, 0) == 1;
            uint64_t v22 = &OBJC_IVAR___HMDRelationshipCodingDescription__parentChild;
            goto LABEL_43;
          }
        }
        v13 = 0;
LABEL_44:
        [v4 setObject:v13 forKeyedSubscript:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      uint64_t v6 = v32;
    }
    while (v32);
  }

  return v4;
}

- (id)reverseLookupTableForCodingKeyTable:(void *)a1
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__61643;
  uint64_t v8 = __Block_byref_object_dispose__61644;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke;
  v3[3] = &unk_264A1B980;
  v3[4] = &v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void __76__HMDManagedObjectCodingModel_refContextCodingKey_keyPath_entity_forEntity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) relationshipsByName];
  id v15 = [v6 objectForKeyedSubscript:a2];

  if (!v15 || [v15 isToMany])
  {
    [*(id *)(a1 + 40) name];
    objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) name];
    objc_claimAutoreleasedReturnValue();
    uint64_t v13 = _HMFPreconditionFailureWithFormat();
    -[HMDManagedObjectCodingModel codingKeyForPropertyName:](v13, v14);
  }
  else
  {
    uint64_t v7 = [v15 destinationEntity];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && *(void *)(a1 + 64) == a3)
    {
      uint64_t v10 = -[HMDManagedObjectCodingModel codingKeyForPropertyName:](*(void *)(a1 + 32), a2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

- (id)codingKeyForPropertyName:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    if ((unint64_t)[v2 length] >= 2 && objc_msgSend(v2, "hasSuffix:", @"_"))
    {
      uint64_t v3 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);

      id v2 = (id)v3;
    }
    if ((unint64_t)[v2 length] >= 2 && objc_msgSend(v2, "hasPrefix:", @"_"))
    {
      uint64_t v4 = [v2 substringFromIndex:1];

      id v2 = (id)v4;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __68__HMDManagedObjectCodingModel_concreteSubentitiesByTypeIDForEntity___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isAbstract] & 1) == 0)
  {
    -[HMDManagedObjectCodingModel typeIdForEntity:](*(void *)(a1 + 32), a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      [*(id *)(a1 + 48) name];
      objc_claimAutoreleasedReturnValue();
      [v5 name];
      objc_claimAutoreleasedReturnValue();
      [a2 name];
      objc_claimAutoreleasedReturnValue();
      uint64_t v6 = _HMFPreconditionFailureWithFormat();
      __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke(v6);
    }
    else
    {
      [*(id *)(a1 + 40) setObject:a2 forKeyedSubscript:v7];
    }
  }
}

uint64_t __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 inverseRelationship];
  if (!v4
    || (uint64_t v5 = *(void *)(a1 + 32)) == 0
    || -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v5, v4, 0) != 1)
  {
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6 || !-[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v6, a2, 0))
  {
    uint64_t v7 = 1;
LABEL_8:

    return v7;
  }
  [*(id *)(a1 + 40) name];
  objc_claimAutoreleasedReturnValue();
  [a2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = _HMFPreconditionFailureWithFormat();
  return -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v9, v10, v11);
}

- (uint64_t)includeModeForProperty:(uint64_t)a3 withDefault:
{
  uint64_t v6 = [a2 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 80)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (!v9) {
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"NO"])
  {
    a3 = 0;
LABEL_11:

    return a3;
  }
  if ([v9 isEqualToString:@"YES"])
  {
    a3 = 1;
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"REF"])
  {
    a3 = 2;
    goto LABEL_11;
  }
  [a2 entity];
  [(id)objc_claimAutoreleasedReturnValue() name];
  objc_claimAutoreleasedReturnValue();
  [a2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v11 = _HMFPreconditionFailureWithFormat();
  return __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke(v11);
}

void __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v4, a2, 0) == 1)
  {
    uint64_t v6 = [a2 inverseRelationship];
    if (v6)
    {
      id v2 = v6;
      if (![v6 isToMany])
      {

        return;
      }
    }
    else
    {
      uint64_t v3 = [*(id *)(v3 + 40) name];
      [a2 name];
      v11 = uint64_t v10 = v3;
      _HMFPreconditionFailureWithFormat();
    }
    objc_msgSend(*(id *)(v3 + 40), "name", v10, v11);
    objc_claimAutoreleasedReturnValue();
    [a2 name];
    objc_claimAutoreleasedReturnValue();
    [v2 name];
    objc_claimAutoreleasedReturnValue();
    uint64_t v7 = _HMFPreconditionFailureWithFormat();
    __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke(v7, v8, v9);
  }
}

void __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = [a3 name];
  if ((objc_msgSend(a2, "isEqualToString:") & 1) == 0)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v5)
    {
      [v5 setObject:a2 forKeyedSubscript:v9];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithObject:a2 forKey:v9];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

uint64_t __57__HMDManagedObjectCodingModel_syncedAttributesForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = [a2 attributeType];
  int v5 = 1;
  if (v4 <= 699)
  {
    if (v4 > 399)
    {
      if (v4 != 400 && v4 != 500 && v4 != 600) {
        goto LABEL_23;
      }
    }
    else if (v4 != 100 && v4 != 200 && v4 != 300)
    {
      goto LABEL_23;
    }
  }
  else if (v4 <= 999)
  {
    if (v4 != 700 && v4 != 800 && v4 != 900) {
      goto LABEL_23;
    }
  }
  else if (v4 > 1199)
  {
    if (v4 != 1200 && v4 != 1800) {
      goto LABEL_23;
    }
  }
  else if (v4 != 1000 && v4 != 1100)
  {
LABEL_23:
    int v5 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && !(((*(unsigned char *)(v2 + 16) & 1) == 0) | isKindOfClass & 1)) {
    uint64_t v7 = [a2 isTransient] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v2, a2, v7);
  if (v8 == 1)
  {
    if (v5) {
      return 1;
    }
    [a2 entity];
    uint64_t v10 = [(id)objc_claimAutoreleasedReturnValue() name];
    [a2 name];
    v13 = uint64_t v12 = v10;
    _HMFPreconditionFailureWithFormat();
  }
  else if (v8 != 2)
  {
    return 0;
  }
  objc_msgSend(a2, "entity", v12, v13);
  [(id)objc_claimAutoreleasedReturnValue() name];
  objc_claimAutoreleasedReturnValue();
  [a2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v11 = _HMFPreconditionFailureWithFormat();
  return __51__HMDEntityCodingDescription_initWithModel_entity___block_invoke(v11);
}

- (id)codingKeyForProperty:(uint64_t)a1
{
  uint64_t v4 = [a2 userInfo];
  int v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 88)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = v5;
  }
  else
  {
    id v9 = [a2 name];
    -[HMDManagedObjectCodingModel codingKeyForPropertyName:](a1, v9);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5
{
  uint64_t v9 = [(id)objc_opt_class() defaultOptions];
  return [(HMDManagedObjectCodingModel *)self initWithModel:a3 configNamespace:a4 rootEntity:a5 options:v9];
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5 options:(unint64_t)a6
{
  uint64_t v11 = [a3 entitiesByName];
  uint64_t v12 = [v11 objectForKeyedSubscript:a5];
  uint64_t v13 = [(HMDManagedObjectCodingModel *)self initWithModel:a3 configNamespace:a4 rootEntity:v12 options:a6];

  return v13;
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5
{
  uint64_t v9 = [(id)objc_opt_class() defaultOptions];
  return [(HMDManagedObjectCodingModel *)self initWithModel:a3 configNamespace:a4 rootEntityName:a5 options:v9];
}

+ (unint64_t)defaultOptions
{
  return 1;
}

- (uint64_t)contextualizeConditions:(void *)a3 forManagedObject:(uint64_t)a4 userContext:
{
  if (result)
  {
    id v7 = (uint64_t *)(result + 120);
    if (*(void *)(result + 120)) {
      uint64_t v8 = *(void *)(result + 120);
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))[a3 methodForSelector:v8];
    if (*v7) {
      uint64_t v10 = *v7;
    }
    else {
      uint64_t v10 = 0;
    }
    return v9(a3, v10, a2, a4);
  }
  return result;
}

- (id)insertOrUpdateRootObjectInContext:(id)a3 fromReader:(id)a4
{
  uint64_t v7 = [(HMDManagedObjectCodingModel *)self rootDescription];
  if (!a3)
  {
    _HMFPreconditionFailure();
LABEL_12:
    v19 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v21, 8);
    __destructor_8_s0_s8_sb16((uint64_t)&v32);
    _Unwind_Resume(v19);
  }
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  id v32 = a4;
  id v33 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke;
  aBlock[3] = &unk_264A21CA0;
  id v11 = v10;
  id v31 = v11;
  id v34 = _Block_copy(aBlock);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_2;
  v27[3] = &unk_264A21CF0;
  v27[4] = self;
  id v12 = v8;
  id v28 = v12;
  v29 = &v32;
  uint64_t v13 = _Block_copy(v27);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__149903;
  v25 = __Block_byref_object_dispose__149904;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_3;
  v20[3] = &unk_264A21C78;
  v20[4] = &v21;
  uint64_t v14 = _Block_copy(v20);
  id v15 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](self, v12, 0, [v12 hasConcreteSubentities], (uint64_t)&v32, (uint64_t)v13, (uint64_t)v14);
  if (-[HMDManagedObjectCodingModel _processDeferredBlocks:context:]((uint64_t)self, v11, &v32))
  {
    uint64_t v16 = v15;
    if (!v15) {
      uint64_t v16 = (void *)v22[5];
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v17;
}

void __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = _Block_copy(aBlock);
  [v2 addObject:v3];
}

id __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_2(uint64_t a1, void *a2)
{
  return -[HMDManagedObjectCodingModel _managedObjectWithDescription:matchingKeyAttributes:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(void *)(a1 + 48));
}

void __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)_decodeManagedObjectWithDescription:(int)a3 byReference:(int)a4 useDynamicType:(uint64_t)a5 context:(uint64_t)a6 lookupBlock:(uint64_t)a7 emplaceBlock:
{
  id v7 = a1;
  uint64_t v136 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if ((a3 & 1) == 0) {
      [*(id *)a5 beginArray];
    }
    v106 = (id *)a5;
    v111 = v7;
    if (a4)
    {
      v117[0] = 0;
      -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](v7, a2, v117, a3, (id *)a5);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v117[0];
      if (v14)
      {
        uint64_t v16 = [v7 subentityOfDescription:a2 withTypeID:v15];
        if (!v16)
        {
          id v37 = *(id *)a5;
          id v17 = [a2 name];
          [v37 failWithReason:@"%@: Missing or invalid type ID '%@'", v17, v15];
          goto LABEL_29;
        }
        id v17 = (id)v16;
LABEL_10:
        v19 = (*(void (**)(uint64_t, id))(a6 + 16))(a6, v14);
        id v7 = v19;
        v105 = v17;
        if (v19)
        {
          if ((a3 & 1) == 0)
          {
            uint64_t v20 = [v19 entity];
            uint64_t v21 = [v17 entity];

            if (v20 == v21)
            {
              id v102 = v15;
              id v22 = v7;
              v100 = v22;
LABEL_40:
              v51 = v106;
              [*v106 beginDictionary];
              if ([*v106 tokenType] == 5)
              {
                do
                {
                  id v52 = [*v51 readDictionaryKey];
                  uint64_t v53 = [v17 attributesByCodingKey];
                  uint64_t v54 = [v53 objectForKeyedSubscript:v52];

                  if (v54)
                  {
                    v55 = -[HMDManagedObjectCodingModel _readValueForAttribute:context:](v54, v51);
                    v56 = [v54 name];
                    v57 = [v22 valueForKey:v56];

                    if ((HMFEqualObjects() & 1) == 0)
                    {
                      v58 = [v54 name];
                      [v22 setValue:v55 forKey:v58];
                    }
                    v51 = v106;
                  }
                  else
                  {
                    uint64_t v59 = (void *)MEMORY[0x230FBD990]();
                    id v60 = v111;
                    v61 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      v62 = HMFGetLogIdentifier();
                      v63 = [v105 name];
                      *(_DWORD *)uint64_t v123 = 138543874;
                      *(void *)&v123[4] = v62;
                      *(_WORD *)&v123[12] = 2114;
                      *(void *)&v123[14] = v52;
                      *(_WORD *)&v123[22] = 2114;
                      v124 = v63;
                      _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected attribute '%{public}@' for %{public}@", v123, 0x20u);
                    }
                    v51 = v106;
                    [*v106 skipLogicalValue];
                    id v17 = v105;
                  }
                }
                while ([*v51 tokenType] == 5);
              }
              [*v51 endDictionary];
              v64 = [*v51 error];

              if (!v64)
              {
                [*v51 beginDictionary];
                if ([*v51 tokenType] == 5)
                {
                  id v98 = v14;
                  do
                  {
                    uint64_t v65 = [*v51 readDictionaryKey];
                    v66 = [v17 relationshipsByCodingKey];
                    v104 = (void *)v65;
                    uint64_t v67 = [v66 objectForKeyedSubscript:v65];

                    if (!v67)
                    {
                      v71 = (void *)MEMORY[0x230FBD990]();
                      id v72 = v111;
                      v73 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v74 = HMFGetLogIdentifier();
                        v75 = [v17 name];
                        *(_DWORD *)uint64_t v123 = 138543874;
                        *(void *)&v123[4] = v74;
                        *(_WORD *)&v123[12] = 2114;
                        *(void *)&v123[14] = v104;
                        *(_WORD *)&v123[22] = 2114;
                        v124 = v75;
                        _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected key attribute '%{public}@' for %{public}@", v123, 0x20u);

                        uint64_t v67 = 0;
                      }

                      [*v51 skipLogicalValue];
                      goto LABEL_95;
                    }
                    v68 = [v111 descriptionForDestinationOfRelationship:v67];
                    int v69 = [v67 isParentChild];
                    v108 = v68;
                    if (v69) {
                      uint64_t v70 = [v68 hasConcreteSubentities];
                    }
                    else {
                      uint64_t v70 = 0;
                    }
                    v76 = [v67 relationship];
                    int v77 = [v76 isToMany];

                    v110 = v67;
                    uint64_t v78 = [v67 name];
                    if (v77)
                    {
                      v79 = [v22 mutableSetValueForKey:v78];

                      id v80 = (void *)[v79 mutableCopy];
                      [*v51 beginArray];
                      while (1)
                      {
                        uint64_t v81 = [*v51 tokenType];
                        if (v81 == -2) {
                          break;
                        }
                        if (v81 == 2)
                        {
                          [*v51 endArray];
                          long long v121 = 0u;
                          long long v122 = 0u;
                          long long v119 = 0u;
                          long long v120 = 0u;
                          id v84 = v80;
                          uint64_t v85 = [v84 countByEnumeratingWithState:&v119 objects:v123 count:16];
                          if (v85)
                          {
                            uint64_t v86 = v85;
                            uint64_t v87 = *(void *)v120;
                            do
                            {
                              for (uint64_t i = 0; i != v86; ++i)
                              {
                                if (*(void *)v120 != v87) {
                                  objc_enumerationMutation(v84);
                                }
                                uint64_t v89 = *(void *)(*((void *)&v119 + 1) + 8 * i);
                                [v79 removeObject:v89];
                                if (v69)
                                {
                                  uint64_t v90 = [v22 managedObjectContext];
                                  [v90 deleteObject:v89];
                                }
                              }
                              uint64_t v86 = [v84 countByEnumeratingWithState:&v119 objects:v123 count:16];
                            }
                            while (v86);
                          }

                          id v14 = v98;
                          v51 = v106;
                          break;
                        }
                        *(void *)buf = MEMORY[0x263EF8330];
                        *(void *)&buf[8] = 3221225472;
                        *(void *)&buf[16] = __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke;
                        v130 = &unk_264A21E00;
                        *(void *)&long long v131 = v111;
                        *((void *)&v131 + 1) = v22;
                        char v135 = v69;
                        v132 = v110;
                        v134 = v51;
                        id v133 = v79;
                        v82 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:](v111, (uint64_t)v108, v69 ^ 1u, v70, (uint64_t)v80);
                        if (v82) {
                          [v80 removeObject:v82];
                        }
                      }
                      id v17 = v105;
                      goto LABEL_94;
                    }
                    v79 = [v22 valueForKey:v78];

                    if ([*v51 tokenType] == 6)
                    {
                      [*v51 readNull];
                      if (!v79) {
                        goto LABEL_94;
                      }
                      v83 = [v110 name];
                      [v22 setValue:0 forKey:v83];

                      if (!v69) {
                        goto LABEL_94;
                      }
                    }
                    else
                    {
                      if (v79)
                      {
                        uint64_t v91 = [MEMORY[0x263EFFA08] setWithObject:v79];
                      }
                      else
                      {
                        uint64_t v91 = 0;
                      }
                      v117[1] = (id)MEMORY[0x263EF8330];
                      v117[2] = (id)3221225472;
                      v117[3] = __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke_2;
                      v117[4] = &unk_264A21E28;
                      v117[5] = v111;
                      v117[6] = v22;
                      char v118 = v69;
                      v117[7] = v110;
                      v117[8] = v51;
                      v92 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:](v111, (uint64_t)v108, v69 ^ 1u, v70, (uint64_t)v91);
                      if (v79) {
                        BOOL v93 = v92 == 0;
                      }
                      else {
                        BOOL v93 = 0;
                      }
                      if (v93) {
                        int v94 = v69;
                      }
                      else {
                        int v94 = 0;
                      }

                      if (v79) {
                      if (!v94)
                      }
                        goto LABEL_94;
                    }
                    uint64_t v95 = [v22 managedObjectContext];
                    [v95 deleteObject:v79];

LABEL_94:
                    uint64_t v67 = v110;
LABEL_95:
                  }
                  while ([*v51 tokenType] == 5);
                }
                [*v51 endDictionary];
              }
              [*v51 endArray];
              id v7 = v100;

              id v15 = v102;
              goto LABEL_98;
            }
LABEL_19:
            id v102 = v15;
            id v25 = objc_alloc(MEMORY[0x263EFF280]);
            id v26 = [v17 entity];
            id v22 = (id)[v25 initWithEntity:v26 insertIntoManagedObjectContext:*(void *)(a5 + 8)];

            [v22 setValuesForKeysWithDictionary:v14];
            if (v7)
            {
              uint64_t v109 = a7;
              id v27 = [v17 entity];
              id v28 = [v7 entity];
              id v29 = v27;
              id v30 = v28;
              id v31 = v30;
              id v32 = 0;
              id v33 = v29;
              id v34 = v30;
              if (v29 && v30)
              {
                uint64_t v35 = v30;
                uint64_t v36 = v29;
                id v32 = 0;
                while (1)
                {
                  if ([v36 isKindOfEntity:v35])
                  {
                    uint64_t v38 = v35;
                    goto LABEL_32;
                  }
                  if ([v35 isKindOfEntity:v36]) {
                    break;
                  }
                  id v33 = [v36 superentity];

                  id v34 = [v35 superentity];

                  if (v33)
                  {
                    uint64_t v35 = v34;
                    uint64_t v36 = v33;
                    if (v34) {
                      continue;
                    }
                  }
                  goto LABEL_33;
                }
                uint64_t v38 = v36;
LABEL_32:
                id v32 = v38;
                id v33 = v36;
                id v34 = v35;
              }
LABEL_33:

              uint64_t v39 = HMFGetOSLogHandle();
              BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

              if (v40)
              {
                uint64_t v41 = [MEMORY[0x263EFF980] array];
              }
              else
              {
                uint64_t v41 = 0;
              }
              id v42 = [v32 relationshipsByName];
              *(void *)uint64_t v123 = MEMORY[0x263EF8330];
              *(void *)&v123[8] = 3221225472;
              *(void *)&v123[16] = __113__HMDManagedObjectCodingModel_Transmutation___prepareReplacementObject_withDescription_forExistingManagedObject___block_invoke;
              v124 = &unk_264A21E50;
              v125 = v111;
              id v126 = v7;
              id v127 = v22;
              id v43 = v41;
              id v128 = v43;
              [v42 enumerateKeysAndObjectsUsingBlock:v123];

              v44 = (void *)MEMORY[0x230FBD990]();
              id v45 = v111;
              long long v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                v99 = HMFGetLogIdentifier();
                v103 = [v7 objectID];
                v97 = [v103 URIRepresentation];
                v101 = [v22 entity];
                long long v47 = [v101 name];
                [v43 sortedArrayUsingSelector:sel_compare_];
                long long v48 = v107 = v43;
                uint64_t v49 = [v48 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v99;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v97;
                *(_WORD *)&buf[22] = 2114;
                v130 = v47;
                LOWORD(v131) = 2114;
                *(void *)((char *)&v131 + 2) = v49;
                uint64_t v50 = (void *)v49;
                _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Recreating <%{public}@> as %{public}@, migrated relationships: %{public}@", buf, 0x2Au);

                id v43 = v107;
              }

              id v17 = v105;
              a7 = v109;
            }
            (*(void (**)(uint64_t, id))(a7 + 16))(a7, v22);
            v100 = 0;
            goto LABEL_40;
          }
LABEL_98:

          goto LABEL_99;
        }
        uint64_t v23 = [*(id *)a5 error];

        if (!v23)
        {
          if ((a3 & 1) == 0) {
            goto LABEL_19;
          }
          uint64_t v24 = *(void *)(a5 + 16);
          v112[0] = MEMORY[0x263EF8330];
          v112[1] = 3221225472;
          v112[2] = __142__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_context_lookupBlock_emplaceBlock___block_invoke;
          v112[3] = &unk_264A29290;
          uint64_t v115 = a7;
          v112[4] = v111;
          id v17 = v17;
          id v113 = v17;
          id v14 = v14;
          id v114 = v14;
          uint64_t v116 = a5;
          (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v112);
        }
LABEL_29:
        id v7 = 0;
        goto LABEL_98;
      }
    }
    else
    {
      uint64_t v18 = -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](v7, a2, 0, a3, (id *)a5);
      if (v18)
      {
        id v14 = (id)v18;
        id v17 = a2;
        id v15 = 0;
        goto LABEL_10;
      }
      id v15 = 0;
    }
    id v7 = 0;
LABEL_99:
  }
  return v7;
}

- (BOOL)_processDeferredBlocks:(id *)a3 context:
{
  if (!a1) {
    return 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDManagedObjectCodingModel_Transmutation___processDeferredBlocks_context___block_invoke;
  v7[3] = &__block_descriptor_40_e21_v32__0___v___8Q16_B24l;
  v7[4] = a3;
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  uint64_t v4 = [*a3 error];
  BOOL v5 = v4 == 0;

  return v5;
}

void __77__HMDManagedObjectCodingModel_Transmutation___processDeferredBlocks_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [**(id **)(a1 + 32) error];

  if (v6)
  {
    *a4 = 1;
  }
  else
  {
    id v7 = *(void (**)(uint64_t))(a2 + 16);
    v7(a2);
  }
}

- (id)_readKeyAttributesWithDescription:(void *)a3 typeID:(int)a4 byReference:(id *)a5 context:
{
  uint64_t v8 = a2;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a2 keyAttributesByCodingKey];
  if (a4)
  {
    uint64_t v10 = [v8 refContextCodingKey];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v9 count];
  if (v10) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v36 = v12;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v12];
  [*a5 beginDictionary];
  if ([*a5 tokenType] == 5)
  {
    id v37 = v8;
    uint64_t v38 = a3;
    do
    {
      id v14 = [*a5 readDictionaryKey];
      id v15 = v14;
      if (v10 && [v14 isEqualToString:v10])
      {
        uint64_t v16 = [v8 refContextEntity];
        id v17 = [a1 descriptionForEntity:v16];

        uint64_t v18 = -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](a1, v17, 0, 1, a5);
        [v13 setObject:v18 forKeyedSubscript:@"$context"];
      }
      else if (a3 && [v15 isEqualToString:@"$type"])
      {
        *a3 = [*a5 readString];
      }
      else
      {
        v19 = [v9 objectForKeyedSubscript:v15];
        uint64_t v20 = v19;
        if (v19)
        {
          uint64_t v21 = -[HMDManagedObjectCodingModel _readValueForAttribute:context:](v19, a5);
          if (v21)
          {
            id v22 = [v20 name];
            [v13 setObject:v21 forKeyedSubscript:v22];

            a3 = v38;
          }
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          id v23 = a1;
          uint64_t v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v25 = HMFGetLogIdentifier();
            [v8 name];
            id v26 = v13;
            v28 = id v27 = v9;
            *(_DWORD *)buf = 138543874;
            id v42 = v25;
            __int16 v43 = 2114;
            v44 = v15;
            __int16 v45 = 2114;
            long long v46 = v28;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected key attribute '%{public}@' for %{public}@", buf, 0x20u);

            uint64_t v9 = v27;
            uint64_t v13 = v26;
            uint64_t v8 = v37;

            a3 = v38;
          }

          [*a5 skipLogicalValue];
        }
      }
    }
    while ([*a5 tokenType] == 5);
  }
  [*a5 endDictionary];
  id v29 = [*a5 error];

  if (!v29)
  {
    if ([v13 count] == v36)
    {
      id v30 = (void *)[v13 copy];
      goto LABEL_29;
    }
    id v31 = *a5;
    id v32 = [v8 name];
    id v33 = [v13 allKeys];
    id v34 = [v33 componentsJoinedByString:@", "];
    [v31 failWithReason:@"%@: Incomplete key attributes (%@)", v32, v34];
  }
  id v30 = 0;
LABEL_29:

  return v30;
}

void __142__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_context_lookupBlock_emplaceBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  -[HMDManagedObjectCodingModel _managedObjectWithDescription:matchingKeyAttributes:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 64));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_managedObjectWithDescription:(void *)a3 matchingKeyAttributes:(uint64_t)a4 context:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF260]);
    uint64_t v9 = [a2 entity];
    [v8 setEntity:v9];

    [v8 setIncludesPropertyValues:0];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
    -[HMDManagedObjectCodingModel _buildPredicateAtoms:withDescription:keyPathPrefix:values:](a1, (uint64_t)v10, a2, 0, a3);
    if ([v10 count] == 1) {
      [v10 firstObject];
    }
    else {
    uint64_t v11 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v10];
    }

    [v8 setPredicate:v11];
    [v8 setFetchLimit:2];
    uint64_t v12 = *(void **)(a4 + 8);
    id v32 = 0;
    uint64_t v13 = [v12 executeFetchRequest:v8 error:&v32];
    id v14 = v32;
    if (v13)
    {
      if ((unint64_t)[v13 count] < 2)
      {
        id v30 = [v13 firstObject];
        goto LABEL_15;
      }
      id v15 = [a3 allKeys];
      uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];
      id v17 = [v16 componentsJoinedByString:@", "];

      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = a1;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        id v22 = [a2 entity];
        id v23 = [v22 name];
        *(_DWORD *)buf = 138543874;
        id v34 = v21;
        __int16 v35 = 2114;
        uint64_t v36 = v23;
        __int16 v37 = 2114;
        id v38 = v17;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@%{public}@: Fetch request with key(s) %{public}@ returned more than one result", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        id v28 = [a2 entity];
        id v29 = [v28 name];
        *(_DWORD *)buf = 138543874;
        id v34 = v27;
        __int16 v35 = 2114;
        uint64_t v36 = v29;
        __int16 v37 = 2114;
        id v38 = v14;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@%{public}@: Fetch request failed: %{public}@", buf, 0x20u);
      }
    }
    id v30 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v30 = 0;
LABEL_16:
  return v30;
}

- (void)_buildPredicateAtoms:(void *)a3 withDescription:(uint64_t)a4 keyPathPrefix:(void *)a5 values:
{
  uint64_t v10 = [a5 objectForKeyedSubscript:@"$context"];
  if (v10)
  {
    uint64_t v11 = [a3 refContextEntity];
    uint64_t v12 = [a1 descriptionForEntity:v11];
    uint64_t v13 = [a3 refContextKeyPath];
    -[HMDManagedObjectCodingModel _buildPredicateAtoms:withDescription:keyPathPrefix:values:](a1, a2, v12, v13, v10);
  }
  id v14 = [a3 keyAttributesByCodingKey];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__HMDManagedObjectCodingModel_Transmutation___buildPredicateAtoms_withDescription_keyPathPrefix_values___block_invoke;
  v15[3] = &unk_264A21E78;
  v15[4] = a2;
  v15[5] = a1;
  v15[6] = a4;
  v15[7] = a5;
  [v14 enumerateKeysAndObjectsUsingBlock:v15];
}

void __104__HMDManagedObjectCodingModel_Transmutation___buildPredicateAtoms_withDescription_keyPathPrefix_values___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 name];
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v14 = (id)v4;
  id v8 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  if (v6)
  {
    if (v7)
    {
      id v9 = [v7 stringByAppendingFormat:@".%@", v14];
    }
    else
    {
      id v9 = v14;
    }
    uint64_t v10 = v9;
    uint64_t v11 = (void *)MEMORY[0x263F08720];
    uint64_t v12 = [MEMORY[0x263F087F0] expressionForKeyPath:v9];
    uint64_t v13 = [MEMORY[0x263F087F0] expressionForConstantValue:v8];
    uint64_t v6 = [v11 predicateWithLeftExpression:v12 rightExpression:v13 modifier:0 type:4 options:0];
  }
  [v5 addObject:v6];
}

uint64_t __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = -[HMDManagedObjectCodingModel _prepareRelatedObject:ofManagedObject:relationship:byReference:context:](*(void *)(a1 + 32), a2, *(void *)(a1 + 40), *(void **)(a1 + 48), *(unsigned char *)(a1 + 72) == 0, *(void *)(a1 + 64));
  if (result)
  {
    BOOL v5 = *(void **)(a1 + 56);
    return [v5 addObject:a2];
  }
  return result;
}

- (id)_decodeManagedObjectWithDescription:(uint64_t)a3 byReference:(uint64_t)a4 useDynamicType:(uint64_t)a5 candidates:context:orEmplaceWithBlock:
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __147__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_candidates_context_orEmplaceWithBlock___block_invoke;
    aBlock[3] = &unk_264A21D60;
    void aBlock[4] = a1;
    aBlock[5] = a5;
    aBlock[6] = a2;
    uint64_t v6 = _Block_copy(aBlock);
    id v7 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](a1);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke_2(uint64_t a1, void *a2)
{
  if (-[HMDManagedObjectCodingModel _prepareRelatedObject:ofManagedObject:relationship:byReference:context:](*(void *)(a1 + 32), a2, *(void *)(a1 + 40), *(void **)(a1 + 48), *(unsigned char *)(a1 + 64) == 0, *(void *)(a1 + 56)))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) name];
    [v4 setValue:a2 forKey:v5];
  }
}

- (uint64_t)_prepareRelatedObject:(uint64_t)a3 ofManagedObject:(void *)a4 relationship:(char)a5 byReference:(uint64_t)a6 context:
{
  if (result)
  {
    BOOL v8 = a2 != 0;
    if (!a2)
    {
      uint64_t v13 = *(void **)a6;
      uint64_t v11 = [a4 shortDescription];
      uint64_t v12 = [a4 relationship];
      id v14 = [v12 destinationEntity];
      id v15 = [v14 name];
      [v13 failWithReason:@"%@: Failed to resolve referenced %@", v11, v15];

      goto LABEL_8;
    }
    uint64_t result = 1;
    if (!*(void *)(a6 + 8) && (a5 & 1) == 0)
    {
      uint64_t v10 = [a4 relationship];
      uint64_t v11 = [v10 inverseRelationship];

      if (!v11)
      {
        BOOL v8 = 1;
        goto LABEL_9;
      }
      uint64_t v12 = [v11 name];
      [a2 setValue:a3 forKey:v12];
LABEL_8:

LABEL_9:
      return v8;
    }
  }
  return result;
}

id __147__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_candidates_context_orEmplaceWithBlock___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    id v3 = (void *)a1[5];
    uint64_t v4 = a1[6];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__149903;
    uint64_t v12 = __Block_byref_object_dispose__149904;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __106__HMDManagedObjectCodingModel_Transmutation___managedObjectFromSet_withDescription_matchingKeyAttributes___block_invoke;
    v7[3] = &unk_264A21EA0;
    v7[4] = v2;
    void v7[5] = v4;
    v7[6] = a2;
    v7[7] = &v8;
    objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __106__HMDManagedObjectCodingModel_Transmutation___managedObjectFromSet_withDescription_matchingKeyAttributes___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(void *)(a1 + 32), (uint64_t)a2, *(void *)(a1 + 40), *(void **)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_managedObject:(uint64_t)a3 withDescription:(void *)a4 matchesKeyAttributes:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __98__HMDManagedObjectCodingModel_Transmutation___managedObject_withDescription_matchesKeyAttributes___block_invoke;
  v6[3] = &unk_264A21EC8;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a1;
  v6[7] = &v7;
  [a4 enumerateKeysAndObjectsUsingBlock:v6];
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __98__HMDManagedObjectCodingModel_Transmutation___managedObject_withDescription_matchesKeyAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v8 = [a2 isEqualToString:@"$context"];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8)
  {
    char v10 = [*(id *)(a1 + 40) refContextKeyPath];
    id v16 = [v9 valueForKeyPath:v10];

    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 40) refContextEntity];
    id v13 = [v11 descriptionForEntity:v12];

    if (!v16
      || (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(void *)(a1 + 48), v16, v13, a3) & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) valueForKey:a2];
    char v15 = [v14 isEqual:a3];

    if ((v15 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

- (id)_readValueForAttribute:(void *)a1 context:(id *)a2
{
  if ([*a2 tokenType] == 6)
  {
    [*a2 readNull];
    BOOL v4 = 0;
    goto LABEL_23;
  }
  id v5 = [a1 attribute];
  uint64_t v6 = [v5 attributeType];

  if (v6 <= 699)
  {
    if (v6 > 399)
    {
      if (v6 != 400 && v6 != 500 && v6 != 600) {
        goto LABEL_52;
      }
    }
    else if (v6 != 100 && v6 != 200 && v6 != 300)
    {
      goto LABEL_52;
    }
    uint64_t v7 = [*a2 readNumber];
    goto LABEL_22;
  }
  if (v6 <= 999)
  {
    switch(v6)
    {
      case 700:
        uint64_t v7 = [*a2 readString];
        goto LABEL_22;
      case 800:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*a2, "readBoolean"));
        goto LABEL_22;
      case 900:
        uint64_t v7 = [*a2 readDate];
        goto LABEL_22;
    }
LABEL_52:
    id v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *MEMORY[0x263EFF498];
    uint64_t v24 = NSString;
    id v25 = [a1 attribute];
    id v26 = objc_msgSend(v24, "stringWithFormat:", @"Attribute type not supported: %zd", objc_msgSend(v25, "attributeType"));
    id v27 = [v22 exceptionWithName:v23 reason:v26 userInfo:0];

    objc_exception_throw(v27);
  }
  if (v6 <= 1199)
  {
    if (v6 == 1000)
    {
      uint64_t v7 = [*a2 readData];
      goto LABEL_22;
    }
    if (v6 == 1100)
    {
      uint64_t v7 = [*a2 readUUID];
LABEL_22:
      BOOL v4 = (void *)v7;
      goto LABEL_23;
    }
    goto LABEL_52;
  }
  if (v6 == 1200)
  {
    uint64_t v9 = [*a2 readString];
    if (v9)
    {
      uint64_t v12 = [NSURL URLWithString:v9];
      BOOL v4 = v12;
      if (v12)
      {
        id v13 = v12;
      }
      else
      {
        id v16 = *a2;
        id v17 = [a1 shortDescription];
        [v16 failWithReason:@"%@: Invalid / malformed URI value", v17];
      }
      goto LABEL_51;
    }
  }
  else
  {
    if (v6 != 1800) {
      goto LABEL_52;
    }
    uint64_t v9 = [*a2 readLogicalValueAsObject];
    if (v9)
    {
      id v28 = 0;
      char v10 = [a1 transformer];
      if ([a1 shouldInline]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && [(id)objc_opt_class() isStructuredDataCompatible])
      {
        uint64_t v11 = [v10 valueFromOPACK:v9 error:&v28];
      }
      else
      {
        uint64_t v11 = [v10 reverseTransformedValue:v9 error:&v28];
      }
      BOOL v4 = (void *)v11;

      id v14 = v28;
      if (v4)
      {
        id v15 = v4;
      }
      else
      {
        uint64_t v18 = [a1 transformer];
        if ([v18 isKindOfTransformer:objc_opt_class()])
        {
          BOOL v19 = +[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:v9];

          if (v19) {
            goto LABEL_50;
          }
        }
        else
        {
        }
        id v20 = *a2;
        uint64_t v21 = [a1 shortDescription];
        [v20 failWithReason:@"%@: Failed to transform attribute value: %@", v21, v14];
      }
LABEL_50:

      goto LABEL_51;
    }
  }
  BOOL v4 = 0;
LABEL_51:

LABEL_23:
  return v4;
}

void __113__HMDManagedObjectCodingModel_Transmutation___prepareReplacementObject_withDescription_forExistingManagedObject___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v10 = [a3 inverseRelationship];
  uint64_t v6 = [a1[4] descriptionForRelationship:a3];
  if (v6)
  {

    goto LABEL_3;
  }
  if (v10)
  {
    int v8 = [a1[4] descriptionForRelationship:v10];
    int v9 = [v8 isReference];

    if (v9)
    {
LABEL_3:
      uint64_t v7 = [a1[5] valueForKey:a2];
      if ([a3 isToMany])
      {
        if (![v7 count]) {
          goto LABEL_11;
        }
      }
      else if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
      [a1[5] setValue:0 forKey:a2];
      [a1[6] setValue:v7 forKey:a2];
      [a1[7] addObject:a2];
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (BOOL)updateRootObject:(id)a3 fromReader:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(HMDManagedObjectCodingModel *)self rootDescription];
  int v8 = [a3 entity];
  int v9 = [v7 entity];
  char v10 = [v8 isKindOfEntity:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [a3 entity];
      id v16 = [v7 entity];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2114;
      __int16 v37 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected root entity: %{public}@, expecting %{public}@", buf, 0x20u);
    }
  }
  id v17 = [a3 entity];
  uint64_t v18 = [v7 entity];
  char v19 = [v17 isKindOfEntity:v18];

  if ((v19 & 1) == 0
    || ([a3 managedObjectContext],
        id v20 = objc_claimAutoreleasedReturnValue(),
        BOOL v21 = v20 == 0,
        v20,
        v21)
    || !a4)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  id v22 = (void *)MEMORY[0x230FBD990]();
  uint64_t v23 = [MEMORY[0x263EFF980] array];
  id v24 = a4;
  *(void *)buf = v24;
  *(void *)&buf[8] = [a3 managedObjectContext];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke;
  aBlock[3] = &unk_264A21CA0;
  id v25 = v23;
  id v35 = v25;
  *(void *)&buf[16] = _Block_copy(aBlock);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke_2;
  v31[3] = &unk_264A21CC8;
  v31[4] = self;
  v31[5] = a3;
  id v26 = v7;
  id v32 = v26;
  id v33 = v24;
  id v27 = _Block_copy(v31);
  id v28 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](self, v26, 0, [v26 hasConcreteSubentities], (uint64_t)buf, (uint64_t)v27, 0);
  BOOL v29 = -[HMDManagedObjectCodingModel _processDeferredBlocks:context:]((uint64_t)self, v25, (id *)buf);

  return v29;
}

void __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = _Block_copy(aBlock);
  [v2 addObject:v3];
}

id __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke_2(uint64_t a1, void *a2)
{
  if (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), a2))
  {
    id v3 = *(id *)(a1 + 40);
  }
  else
  {
    [*(id *)(a1 + 56) failWithReason:@"Decoded key attributes do not match object to update"];
    id v3 = 0;
  }
  return v3;
}

- (id)decodeRootObjectFromReader:(id)a3
{
  if (![(HMDManagedObjectCodingModel *)self hasOnlyParentChildRelationships])
  {
    _HMFPreconditionFailure();
LABEL_10:
    id v13 = (_Unwind_Exception *)_HMFPreconditionFailure();
    __destructor_8_s0_s8_sb16((uint64_t)&v15);
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v13);
  }
  if (!a3) {
    goto LABEL_10;
  }
  id v5 = [(HMDManagedObjectCodingModel *)self rootDescription];
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__149903;
  id v22 = __Block_byref_object_dispose__149904;
  id v23 = 0;
  id v16 = 0;
  id v17 = 0;
  id v15 = a3;
  uint64_t v7 = [v5 hasConcreteSubentities];
  uint64_t v14 = MEMORY[0x263EF8330];
  id v8 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:](self, (uint64_t)v5, 0, v7, 0);
  int v9 = objc_msgSend(v15, "error", v14, 3221225472, __73__HMDManagedObjectCodingModel_Transmutation__decodeRootObjectFromReader___block_invoke, &unk_264A21C78, &v18);
  if (v9) {
    char v10 = 0;
  }
  else {
    char v10 = (void *)v19[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v18, 8);

  return v11;
}

void __73__HMDManagedObjectCodingModel_Transmutation__decodeRootObjectFromReader___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)isRelevantChanges:(id)a3 withRootObject:(id)a4 conditions:(id)a5 userContext:(id)a6
{
  uint64_t v11 = [(HMDManagedObjectCodingModel *)self rootDescription];
  if (!a3)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  uint64_t v12 = (void *)v11;
  id v13 = [a4 entity];
  uint64_t v14 = [v12 entity];
  char v15 = [v13 isKindOfEntity:v14];

  if ((v15 & 1) == 0)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (a5)
  {
    id v16 = (HMDManagedObjectCodingModel *)*((id *)a5 + 1);

    if (v16 != self)
    {
LABEL_15:
      id v25 = (_Unwind_Exception *)_HMFPreconditionFailure();
      __destructor_8_s0_s8_s16_s24_s40((uint64_t)&v26);
      _Unwind_Resume(v25);
    }
  }
  id v17 = (void *)MEMORY[0x230FBD990]();
  BOOL v28 = 0;
  *(void *)&long long v26 = 0;
  long long v27 = 0u;
  *((void *)&v26 + 1) = a3;
  uint64_t v18 = (HMDCodingConditionSet *)a5;
  if (!a5) {
    uint64_t v18 = -[HMDCodingConditionSet initWithModel:]([HMDCodingConditionSet alloc], "initWithModel:", self, v26, v27, v28);
  }
  char v19 = v18;
  *(void *)&long long v27 = v19;
  *((void *)&v27 + 1) = a6;
  LOBYTE(v28) = 0;
  id v20 = *((id *)&v27 + 1);
  if ([v20 conformsToProtocol:&unk_26E55AC38]) {
    BOOL v21 = v20;
  }
  else {
    BOOL v21 = 0;
  }
  id v22 = v21;

  id v29 = v22;
  if (!a5) {

  }
  -[HMDManagedObjectCodingModel contextualizeConditions:forManagedObject:userContext:]((uint64_t)self, (uint64_t)v19, a4, (uint64_t)v20);
  -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](self, a4, v12, 0, [v12 hasConcreteSubentities], (uint64_t)&v26);
  BOOL v23 = v28;
  __destructor_8_s0_s8_s16_s24_s40((uint64_t)&v26);

  return v23;
}

- (void)_encodeManagedObject:(void *)a3 withDescription:(int)a4 byReference:(int)a5 useDynamicType:(uint64_t)a6 context:
{
  if (!a1) {
    return;
  }
  if ((a4 & 1) == 0) {
    [*(id *)a6 beginArrayOfSize:3];
  }
  if (a5)
  {
    id v22 = [a1 descriptionForManagedObject:a2];
    uint64_t v12 = [v22 typeID];
    -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, a2, a3, (uint64_t)v12, a4, (id *)a6);

    if (a4) {
      goto LABEL_21;
    }
LABEL_8:
    id v13 = *(id *)(a6 + 8);
    if (v13)
    {
      uint64_t v14 = [a2 objectID];
      id v39 = 0;
      id v40 = 0;
      uint64_t v15 = [v13 changeScopeForObjectWithID:v14 attributeKeys:&v40 relationshipKeys:&v39];
      id v13 = v40;
      id v16 = v39;

      if (v15 == 2)
      {
        char v19 = [v22 attributesByCodingKey];
        objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v13, "count"));
        uint64_t v31 = MEMORY[0x263EF8330];
        uint64_t v32 = 3221225472;
        id v33 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke;
        id v34 = &unk_264A21D88;
        uint64_t v38 = a6;
        id v35 = a1;
        id v17 = v19;
        id v36 = v17;
        __int16 v37 = a2;
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v31);
        [*(id *)a6 endDictionary];
        if (*(void *)a6 || !*(unsigned char *)(a6 + 32))
        {
          id v20 = [v22 relationshipsByCodingKey];
          objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v16, "count"));
          uint64_t v23 = MEMORY[0x263EF8330];
          uint64_t v24 = 3221225472;
          id v25 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_2;
          long long v26 = &unk_264A21D88;
          long long v27 = a1;
          id v28 = v20;
          id v29 = a2;
          uint64_t v30 = a6;
          id v21 = v20;
          objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v23);
          [*(id *)a6 endDictionary];
        }
        goto LABEL_19;
      }
      if (v15 == 1)
      {
        [*(id *)a6 beginDictionaryOfSize:0];
        [*(id *)a6 endDictionary];
        [*(id *)a6 beginDictionaryOfSize:0];
        [*(id *)a6 endDictionary];
LABEL_20:

        [*(id *)a6 endArray];
        goto LABEL_21;
      }
    }
    else
    {
      id v16 = 0;
    }
    *(unsigned char *)(a6 + 32) = 1;
    if (!*(void *)a6) {
      goto LABEL_20;
    }
    id v17 = [v22 attributesByCodingKey];
    objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v17, "count"));
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    id v33 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_3;
    id v34 = &unk_264A21DB0;
    id v36 = a2;
    __int16 v37 = (void *)a6;
    id v35 = a1;
    [v17 enumerateKeysAndObjectsUsingBlock:&v31];
    [*(id *)a6 endDictionary];
    uint64_t v18 = [v22 relationshipsByCodingKey];
    objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v18, "count"));
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_4;
    long long v26 = &unk_264A21DD8;
    id v28 = a2;
    id v29 = (void *)a6;
    long long v27 = a1;
    [v18 enumerateKeysAndObjectsUsingBlock:&v23];
    [*(id *)a6 endDictionary];

LABEL_19:
    goto LABEL_20;
  }
  -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, a2, a3, 0, a4, (id *)a6);
  id v22 = a3;
  if ((a4 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_21:
}

- (void)_encodeKeyAttributesOfManagedObject:(void *)a3 withDescription:(uint64_t)a4 typeID:(int)a5 byReference:(id *)a6 context:
{
  if (!*a6) {
    return;
  }
  [*a6 beginDictionaryOfSize:-1];
  if (!a5) {
    goto LABEL_7;
  }
  uint64_t v12 = [a3 refContextKeyPath];
  if (!v12)
  {
LABEL_6:

LABEL_7:
    if (a4)
    {
      [*a6 writeDictionaryKey:@"$type"];
      [*a6 writeString:a4];
    }
    char v19 = [a3 keyAttributesByCodingKey];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __125__HMDManagedObjectCodingModel_Transmutation___encodeKeyAttributesOfManagedObject_withDescription_typeID_byReference_context___block_invoke;
    v22[3] = &unk_264A21D38;
    v22[4] = a2;
    v22[5] = a3;
    v22[6] = a1;
    v22[7] = a6;
    [v19 enumerateKeysAndObjectsUsingBlock:v22];

    [*a6 endDictionary];
    return;
  }
  id v21 = v12;
  uint64_t v13 = [a2 valueForKeyPath:v12];
  id v14 = *a6;
  if (v13)
  {
    uint64_t v15 = (void *)v13;
    id v16 = [a3 refContextCodingKey];
    [v14 writeDictionaryKey:v16];

    id v17 = [a3 refContextEntity];
    uint64_t v18 = [a1 descriptionForEntity:v17];
    -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, v15, v18, 0, 1, a6);

    uint64_t v12 = v21;
    goto LABEL_6;
  }
  id v20 = [a3 name];
  [v14 failWithReason:@"%@: Missing required REF context (%@)", v20, v21];
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = **(void ***)(a1 + 56);
  if (v5)
  {
    [v5 writeDictionaryKey:a2];
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
    -[HMDManagedObjectCodingModel _encodeAttribute:ofManagedObject:context:](v6, v10, *(void **)(a1 + 48), *(void *)(a1 + 56));
  }
  else if (([a2 isEqualToString:@"writerTimestamp"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
    int v9 = [v8 shouldIncludeWithConditions:*(void *)(*(void *)(a1 + 56) + 16)];

    if (v9)
    {
      *a3 = 1;
      *(unsigned char *)(*(void *)(a1 + 56) + 32) = 1;
    }
  }
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  [**(id **)(a1 + 56) writeDictionaryKey:a2];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  -[HMDManagedObjectCodingModel _encodeRelationship:ofManagedObject:context:](v6, v7, *(void **)(a1 + 48), *(void *)(a1 + 56));

  uint64_t v8 = *(void *)(a1 + 56);
  if (*(void *)v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = *(unsigned char *)(v8 + 32) != 0;
  }
  *a3 = v9;
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  [**(id **)(a1 + 48) writeDictionaryKey:a2];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  -[HMDManagedObjectCodingModel _encodeAttribute:ofManagedObject:context:](v5, a3, v6, v7);
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  [**(id **)(a1 + 48) writeDictionaryKey:a2];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  -[HMDManagedObjectCodingModel _encodeRelationship:ofManagedObject:context:](v5, a3, v6, v7);
}

- (void)_encodeRelationship:(void *)a3 ofManagedObject:(uint64_t)a4 context:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v8 = [a1 descriptionForDestinationOfRelationship:a2];
    int v9 = [a2 isParentChild];
    if (v9) {
      unsigned int v33 = [v8 hasConcreteSubentities];
    }
    else {
      unsigned int v33 = 0;
    }
    id v10 = [a2 relationship];
    int v11 = [v10 isToMany];

    if (v11)
    {
      char v12 = [a2 isConditional];
      uint64_t v13 = [a2 name];
      id v14 = [a3 valueForKey:v13];

      id v15 = *(id *)a4;
      if (v12) {
        uint64_t v16 = -1;
      }
      else {
        uint64_t v16 = [v14 count];
      }
      [v15 beginArrayOfSize:v16];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = v14;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        obuint64_t j = v19;
        uint64_t v32 = (uint64_t)v8;
        uint64_t v22 = (uint64_t)a1;
        char v30 = 0;
        uint64_t v23 = *(void *)v35;
        uint64_t v24 = v9 ^ 1u;
LABEL_14:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v26 = *(void **)(*((void *)&v34 + 1) + 8 * v25);
          long long v27 = *(void **)(a4 + 8);
          id v28 = [v26 objectID];
          uint64_t v29 = [v27 changeScopeForObjectWithID:v28 attributeKeys:0 relationshipKeys:0];

          if (v29 != 1) {
            break;
          }
          if (*(void *)a4) {
            goto LABEL_21;
          }
LABEL_23:
          if (v21 == ++v25)
          {
            uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v21) {
              goto LABEL_14;
            }
            id v19 = obj;

            uint64_t v8 = (void *)v32;
            if (v30) {
              goto LABEL_32;
            }
            goto LABEL_31;
          }
        }
        char v30 = 1;
LABEL_21:
        -[HMDManagedObjectCodingModel _conditionallyEncodeChildObject:withDescription:forRelationship:byReference:useDynamicType:context:](v22, v26, v32, a2, v24, v33, a4);
        if (!*(void *)a4 && *(unsigned char *)(a4 + 32))
        {
          id v19 = obj;

          uint64_t v8 = (void *)v32;
          goto LABEL_33;
        }
        goto LABEL_23;
      }

LABEL_31:
      *(unsigned char *)(a4 + 32) = 1;
LABEL_32:
      [*(id *)a4 endArray];
LABEL_33:
    }
    else
    {
      id v17 = [a2 name];
      uint64_t v18 = [a3 valueForKey:v17];

      if (v18)
      {
        if ((-[HMDManagedObjectCodingModel _conditionallyEncodeChildObject:withDescription:forRelationship:byReference:useDynamicType:context:]((uint64_t)a1, v18, (uint64_t)v8, a2, v9 ^ 1u, v33, a4) & 1) == 0)[*(id *)a4 writeNull]; {
      }
        }
      else
      {
        [*(id *)a4 writeNull];
        *(unsigned char *)(a4 + 32) = 1;
      }
    }
  }
}

- (uint64_t)_conditionallyEncodeChildObject:(uint64_t)a3 withDescription:(void *)a4 forRelationship:(uint64_t)a5 byReference:(unsigned int)a6 useDynamicType:(uint64_t)a7 context:
{
  uint64_t v11 = *(void *)(a7 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 16);
  }
  else {
    uint64_t v12 = 0;
  }
  if (a1)
  {
    uint64_t v13 = *(void *)(a7 + 24);
    id v14 = (uint64_t *)(a1 + 120);
    uint64_t v15 = a5;
    uint64_t v16 = a3;
    if (*(void *)(a1 + 120)) {
      uint64_t v17 = *(void *)(a1 + 120);
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = (void (*)(void *, uint64_t, uint64_t, uint64_t))[a2 methodForSelector:v17];
    if (*v14) {
      uint64_t v19 = *v14;
    }
    else {
      uint64_t v19 = 0;
    }
    v18(a2, v19, v11, v13);
    uint64_t v11 = *(void *)(a7 + 16);
  }
  else
  {
    uint64_t v15 = a5;
    uint64_t v16 = a3;
  }
  uint64_t result = [a4 shouldIncludeWithConditions:v11];
  if (result)
  {
    if ([*(id *)(a7 + 40) shouldExcludeObject:a2 context:*(void *)(a7 + 24)])
    {
      uint64_t result = 0;
    }
    else if (*(void *)a7 || !v15)
    {
      -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](a1, a2, v16, v15, a6, a7);
      uint64_t result = 1;
    }
    else
    {
      uint64_t result = 1;
      *(unsigned char *)(a7 + 32) = 1;
    }
  }
  uint64_t v21 = *(void *)(a7 + 16);
  if (v21) {
    *(void *)(v21 + 16) = v12;
  }
  return result;
}

- (void)_encodeAttribute:(void *)a3 ofManagedObject:(uint64_t)a4 context:
{
  if (a1)
  {
    if ([a2 shouldIncludeWithConditions:*(void *)(a4 + 16)])
    {
      uint64_t v8 = [a2 name];
      uint64_t v9 = *(void *)(a4 + 24);
      id v10 = (uint64_t *)(a1 + 128);
      if (*(void *)(a1 + 128)) {
        uint64_t v11 = *(void *)(a1 + 128);
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v13 = (void (*)(void *, uint64_t, void *, uint64_t))[a3 methodForSelector:v11];
      if (*v10) {
        uint64_t v14 = *v10;
      }
      else {
        uint64_t v14 = 0;
      }
      v13(a3, v14, v8, v9);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      -[HMDManagedObjectCodingModel _encodeValue:forAttribute:context:](a1, v15, a2, (void **)a4);
    }
    else
    {
      uint64_t v12 = *(void **)a4;
      [v12 writeNull];
    }
  }
}

- (void)_encodeValue:(void *)a3 forAttribute:(void *)a4 context:
{
  if (!a1) {
    return;
  }
  if (a2)
  {
    uint64_t v7 = [a3 attribute];
    uint64_t v8 = [v7 attributeType];

    if (v8 <= 699)
    {
      if (v8 > 399)
      {
        if (v8 != 400 && v8 != 500 && v8 != 600) {
          goto LABEL_58;
        }
      }
      else if (v8 != 100 && v8 != 200 && v8 != 300)
      {
        goto LABEL_58;
      }
      uint64_t v12 = *a4;
      [v12 writeNumber:a2];
    }
    else if (v8 <= 999)
    {
      switch(v8)
      {
        case 700:
          uint64_t v16 = *a4;
          [v16 writeString:a2];
          break;
        case 800:
          uint64_t v17 = *a4;
          uint64_t v18 = [a2 BOOLValue];
          [v17 writeBoolean:v18];
          break;
        case 900:
          uint64_t v11 = *a4;
          [v11 writeDate:a2];
          break;
        default:
          goto LABEL_58;
      }
    }
    else if (v8 > 1199)
    {
      if (v8 == 1200)
      {
        uint64_t v19 = [a2 absoluteString];
        uint64_t v20 = *a4;
        id v32 = (id)v19;
        if (v19)
        {
          [v20 writeString:v19];
        }
        else
        {
          uint64_t v24 = [a3 shortDescription];
          [v20 failWithReason:@"%@: Invalid / malformed URI value", v24];
        }
      }
      else
      {
        if (v8 != 1800) {
          goto LABEL_58;
        }
        id v33 = 0;
        uint64_t v13 = [a3 transformer];
        if ([a3 shouldInline]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [(id)objc_opt_class() isStructuredDataCompatible])
        {
          uint64_t v14 = [v13 OPACKFromValue:a2 error:&v33];
        }
        else
        {
          uint64_t v14 = [v13 transformedValue:a2 error:&v33];
        }
        uint64_t v21 = (void *)v14;

        id v22 = v33;
        uint64_t v23 = *a4;
        if (v21)
        {
          [v23 writeLogicalValue:v21 validateAndCopy:0];
        }
        else
        {
          uint64_t v25 = [a3 shortDescription];
          [v23 failWithReason:@"%@: Failed to transform attribute value: %@", v25, v22];
        }
      }
    }
    else
    {
      if (v8 != 1000)
      {
        if (v8 == 1100)
        {
          uint64_t v9 = *a4;
          [v9 writeUUID:a2];
          return;
        }
LABEL_58:
        long long v26 = (void *)MEMORY[0x263EFF940];
        uint64_t v27 = *MEMORY[0x263EFF498];
        id v28 = NSString;
        uint64_t v29 = [a3 attribute];
        char v30 = objc_msgSend(v28, "stringWithFormat:", @"Attribute type not supported: %zd", objc_msgSend(v29, "attributeType"));
        id v31 = [v26 exceptionWithName:v27 reason:v30 userInfo:0];

        objc_exception_throw(v31);
      }
      id v15 = *a4;
      [v15 writeData:a2];
    }
  }
  else
  {
    id v10 = *a4;
    [v10 writeNull];
  }
}

void __125__HMDManagedObjectCodingModel_Transmutation___encodeKeyAttributesOfManagedObject_withDescription_typeID_byReference_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a3 name];
  id v12 = [v6 valueForKey:v7];

  uint64_t v8 = *(id **)(a1 + 56);
  id v9 = *v8;
  if (v12)
  {
    [*v8 writeDictionaryKey:a2];
    -[HMDManagedObjectCodingModel _encodeValue:forAttribute:context:](*(void *)(a1 + 48), v12, a3, *(void ***)(a1 + 56));
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) name];
    uint64_t v11 = [a3 name];
    [v9 failWithReason:@"%@: Key attribute '%@' is missing", v10, v11];
  }
}

- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4 changes:(id)a5 conditions:(id)a6 userContext:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v13 = [(HMDManagedObjectCodingModel *)self rootDescription];
  uint64_t v14 = [a3 entity];
  id v15 = [v13 entity];
  char v16 = [v14 isKindOfEntity:v15];

  if ((v16 & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_18:
    _HMFPreconditionFailure();
  }
  if (!a4) {
    goto LABEL_18;
  }
  if (a6)
  {
    uint64_t v17 = (HMDManagedObjectCodingModel *)*((id *)a6 + 1);

    if (v17 != self)
    {
      long long v34 = (_Unwind_Exception *)_HMFPreconditionFailure();
      __destructor_8_s0_s8_s16_s24_s40((uint64_t)&v35);
      _Unwind_Resume(v34);
    }
  }
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  uint64_t v39 = 0;
  id v19 = a4;
  id v35 = v19;
  id v36 = a5;
  uint64_t v20 = (HMDCodingConditionSet *)a6;
  if (!a6) {
    uint64_t v20 = -[HMDCodingConditionSet initWithModel:]([HMDCodingConditionSet alloc], "initWithModel:", self, v35, v36);
  }
  uint64_t v21 = v20;
  long long v37 = v21;
  id v38 = a7;
  id v22 = v38;
  if ([v22 conformsToProtocol:&unk_26E55AC38]) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = v23;

  id v40 = v24;
  if (!a6) {

  }
  -[HMDManagedObjectCodingModel contextualizeConditions:forManagedObject:userContext:]((uint64_t)self, (uint64_t)v21, a3, (uint64_t)v22);
  -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](self, a3, v13, 0, [v13 hasConcreteSubentities], (uint64_t)&v35);
  uint64_t v25 = [v19 error];

  if (v25)
  {
    long long v26 = (void *)MEMORY[0x230FBD990]();
    uint64_t v27 = self;
    HMFGetOSLogHandle();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      char v30 = [v19 error];
      *(_DWORD *)buf = 138543618;
      id v42 = v29;
      __int16 v43 = 2114;
      v44 = v30;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode managed object with error:%{public}@", buf, 0x16u);
    }
  }
  id v31 = objc_msgSend(v19, "error", v35);
  BOOL v32 = v31 == 0;

  __destructor_8_s0_s8_s16_s24_s40((uint64_t)&v35);

  return v32;
}

- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4
{
  return [(HMDManagedObjectCodingModel *)self encodeRootObject:a3 withWriter:a4 changes:0 conditions:0 userContext:0];
}

@end