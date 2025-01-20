@interface _EXExtensionPredicateBuilder
- (BOOL)strictMatchingSpecified;
- (BOOL)usesStrictMatching;
- (NSDictionary)predicateDictionary;
- (_EXExtensionActivationRules)activationRules;
- (_EXExtensionPredicateBuilder)initWithActivationRules:(_EXExtensionActivationRules *)a3 predicateDictionary:(id)a4;
- (id)applyRuleWithRuleName:(id)a3 acceptRule:(id)a4 rejectRule:(id)a5 types:(id)a6 exceptTypes:(id)a7 parentType:(id)a8 children:(id)a9 parentAccepted:(BOOL)a10 accepted:(BOOL *)a11 acceptedTypesInSubtree:(id *)a12 exceptTypesInSubtree:(id *)a13;
- (id)gatherChildrenPredicateWithRuleDictionary:(id)a3 parentType:(id)a4 parentAccepted:(BOOL)a5 acceptedChildTypes:(id *)a6 exceptChildTypes:(id *)a7;
- (id)makePredicate;
- (id)predicateForCountingRule:(id)a3 type:(id)a4 exceptTypes:(id)a5 specifiedCount:(int)a6;
- (id)predicateForRejectExceptOtherTypesRule:(id)a3 type:(id)a4 otherTypes:(id)a5;
- (unint64_t)version;
@end

@implementation _EXExtensionPredicateBuilder

- (_EXExtensionPredicateBuilder)initWithActivationRules:(_EXExtensionActivationRules *)a3 predicateDictionary:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_EXExtensionPredicateBuilder;
  v8 = [(_EXExtensionPredicateBuilder *)&v13 init];
  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:@"NSExtensionActivationDictionaryVersion"];
    v8->_version = [v9 unsignedIntegerValue];

    v10 = [v7 objectForKeyedSubscript:@"NSExtensionActivationUsesStrictMatching"];
    v8->_strictMatchingSpecified = [v10 BOOLValue];

    BOOL v11 = v8->_strictMatchingSpecified || v8->_version < 2;
    v8->_usesStrictMatching = v11;
    objc_storeStrong((id *)&v8->_predicateDictionary, a4);
    v8->_activationRules = a3;
  }

  return v8;
}

- (id)predicateForCountingRule:(id)a3 type:(id)a4 exceptTypes:(id)a5 specifiedCount:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v21[1] = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  if (v9 | v10)
  {
    uint64_t v12 = [NSNumber numberWithInt:v6];
    objc_super v13 = (void *)v12;
    if (v9)
    {
      v20 = @"SPECIFIED_COUNT";
      v21[0] = v12;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v15 = _EXPredicateWithString((void *)v9);
      BOOL v11 = [v15 predicateWithSubstitutionVariables:v14];
    }
    else
    {
      v18[0] = @"SPECIFIED_COUNT";
      v18[1] = @"TYPE";
      v19[0] = v12;
      v19[1] = v10;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      BOOL v11 = [self->_activationRules->var0 predicateWithSubstitutionVariables:v14];
    }

    if (!v11)
    {
      v16 = _EXDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[_EXExtensionPredicateBuilder predicateForCountingRule:type:exceptTypes:specifiedCount:]();
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)predicateForRejectExceptOtherTypesRule:(id)a3 type:(id)a4 otherTypes:(id)a5
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v8 | v9)
  {
    if (!v8 && v10 && [v10 count])
    {
      if ((unint64_t)[v11 count] < 2)
      {
        v18[0] = @"TYPE";
        v18[1] = @"OTHER_TYPE";
        v19[0] = v9;
        v15 = [v11 firstObject];
        v19[1] = v15;
        objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

        p_var1 = &self->_activationRules->var1;
      }
      else
      {
        v20[0] = @"TYPE";
        v20[1] = @"OTHER_TYPES";
        v21[0] = v9;
        v21[1] = v11;
        objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
        p_var1 = &self->_activationRules->var2;
      }
      uint64_t v12 = [*p_var1 predicateWithSubstitutionVariables:v13];

      if (!v12)
      {
        v16 = _EXDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[_EXExtensionPredicateBuilder predicateForRejectExceptOtherTypesRule:type:otherTypes:]();
        }
      }
    }
    else
    {
      uint64_t v12 = [(_EXExtensionPredicateBuilder *)self predicateForCountingRule:v8 type:v9 exceptTypes:0 specifiedCount:0];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)applyRuleWithRuleName:(id)a3 acceptRule:(id)a4 rejectRule:(id)a5 types:(id)a6 exceptTypes:(id)a7 parentType:(id)a8 children:(id)a9 parentAccepted:(BOOL)a10 accepted:(BOOL *)a11 acceptedTypesInSubtree:(id *)a12 exceptTypesInSubtree:(id *)a13
{
  id v19 = a3;
  id v39 = a4;
  id v42 = a5;
  id v44 = a6;
  id v43 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [(NSDictionary *)self->_predicateDictionary objectForKey:v19];
  uint64_t v23 = [v22 intValue];
  uint64_t v24 = v23;
  BOOL v25 = v22 == 0;
  if (v23) {
    BOOL v25 = 1;
  }
  if ((int)v23 > 0 == v25) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = !self->_usesStrictMatching || a10;
  }
  if ([v44 count])
  {
    v27 = [v44 objectAtIndex:0];
  }
  else
  {
    v27 = 0;
  }
  v40 = v21;
  v41 = v20;
  if (v26)
  {
    id v47 = 0;
    v48[0] = 0;
    v28 = [(_EXExtensionPredicateBuilder *)self gatherChildrenPredicateWithRuleDictionary:v21 parentType:v20 parentAccepted:a10 acceptedChildTypes:v48 exceptChildTypes:&v47];
    id v29 = v48[0];
    id v30 = v47;
    if ((int)v24 <= 0)
    {
LABEL_13:
      v31 = 0;
      goto LABEL_29;
    }
LABEL_15:
    v32 = self;
    v33 = v39;
    v31 = [(_EXExtensionPredicateBuilder *)v32 predicateForCountingRule:v39 type:v27 exceptTypes:v43 specifiedCount:v24];
    *a11 = 1;
    v34 = a12;
    v35 = a13;
    if (!a12) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  id v45 = 0;
  id v46 = 0;
  v28 = [(_EXExtensionPredicateBuilder *)self gatherChildrenPredicateWithRuleDictionary:v21 parentType:v27 parentAccepted:(int)v24 > 0 acceptedChildTypes:&v46 exceptChildTypes:&v45];
  id v29 = v46;
  id v30 = v45;
  if ((int)v24 >= 1) {
    goto LABEL_15;
  }
  *a11 = 0;
  if (!v42 && self->_usesStrictMatching) {
    goto LABEL_13;
  }
  v38 = [MEMORY[0x1E4F1CA48] array];
  [v38 addObjectsFromArray:v29];
  if (a10) {
    [v38 addObject:v41];
  }
  v31 = [(_EXExtensionPredicateBuilder *)self predicateForRejectExceptOtherTypesRule:v42 type:v27 otherTypes:v38];

LABEL_29:
  v35 = a13;
  v33 = v39;
  v34 = a12;
  if (a12) {
LABEL_16:
  }
    id *v34 = v29;
LABEL_17:
  if (v35) {
    id *v35 = v30;
  }
  v36 = _EXExtensionMakeAndPredicate(v31, v28);
  if (+[EXConcreteExtension _shouldLogExtensionDiscovery])
  {
    NSLog(&cfstr_GeneratedPredi.isa, v36, v19);
  }

  return v36;
}

- (id)gatherChildrenPredicateWithRuleDictionary:(id)a3 parentType:(id)a4 parentAccepted:(BOOL)a5 acceptedChildTypes:(id *)a6 exceptChildTypes:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1;
  id v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __136___EXExtensionPredicateBuilder_gatherChildrenPredicateWithRuleDictionary_parentType_parentAccepted_acceptedChildTypes_exceptChildTypes___block_invoke;
  v17[3] = &unk_1E573D488;
  v17[4] = self;
  id v14 = v13;
  BOOL v22 = a5;
  id v18 = v14;
  id v19 = &v35;
  id v20 = &v29;
  id v21 = &v23;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  if (a6) {
    *a6 = (id) v30[5];
  }
  if (a7) {
    *a7 = (id) v24[5];
  }
  v15 = _EXExtensionMakeAndPredicateWithArray((void *)v36[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);

  return v15;
}

- (id)makePredicate
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id var7 = self->_activationRules->var7;
  id v21 = 0;
  id v22 = 0;
  v4 = [(_EXExtensionPredicateBuilder *)self gatherChildrenPredicateWithRuleDictionary:var7 parentType:0 parentAccepted:0 acceptedChildTypes:&v22 exceptChildTypes:&v21];
  id v5 = v22;
  id v6 = v21;
  if ([v5 count])
  {
    id v7 = (void *)[v6 mutableCopy];
    [v7 removeObjectsInArray:v5];
    uint64_t v8 = [v7 count];
    activationRules = self->_activationRules;
    if (v8)
    {
      uint64_t v10 = 40;
      if (!self->_usesStrictMatching) {
        uint64_t v10 = 48;
      }
      id v11 = *(id *)((char *)&activationRules->var0 + v10);
      v23[0] = @"TYPES";
      v23[1] = @"REJECTED_TYPES";
      v24[0] = v5;
      v24[1] = v7;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = v24;
      id v14 = (__CFString **)v23;
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v17 = 24;
      if (!self->_usesStrictMatching) {
        uint64_t v17 = 32;
      }
      id v11 = *(id *)((char *)&activationRules->var0 + v17);
      uint64_t v25 = @"TYPES";
      v26[0] = v5;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = v26;
      id v14 = &v25;
      uint64_t v15 = 1;
    }
    id v18 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
    v16 = [v11 predicateWithSubstitutionVariables:v18];
  }
  else
  {
    v16 = 0;
  }
  id v19 = _EXExtensionMakeAndPredicate(v4, v16);

  return v19;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)strictMatchingSpecified
{
  return self->_strictMatchingSpecified;
}

- (BOOL)usesStrictMatching
{
  return self->_usesStrictMatching;
}

- (NSDictionary)predicateDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (_EXExtensionActivationRules)activationRules
{
  return self->_activationRules;
}

- (void).cxx_destruct
{
}

- (void)predicateForCountingRule:type:exceptTypes:specifiedCount:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "predicate != NULL";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_1();
  int v4 = 663;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unable to create predicate!", (uint8_t *)&v1, 0x1Cu);
}

- (void)predicateForRejectExceptOtherTypesRule:type:otherTypes:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "predicate != NULL";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_1();
  int v4 = 687;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unable to create predicate!", (uint8_t *)&v1, 0x1Cu);
}

@end