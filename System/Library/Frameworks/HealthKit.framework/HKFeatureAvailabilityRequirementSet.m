@interface HKFeatureAvailabilityRequirementSet
+ (BOOL)supportsSecureCoding;
+ (id)noRequirements;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementSet)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementSet)initWithRequirementsByContext:(id)a3;
- (NSDictionary)requirementsByContext;
- (id)allRequirementIdentifiers;
- (id)evaluationByContextWithDataSource:(void *)a3 overrides:(void *)a4 error:;
- (id)evaluationForContext:(void *)a3 dataSource:(void *)a4 overrides:(uint64_t)a5 error:;
- (uint64_t)copyApplyingContextConstraint:(uint64_t)a1;
- (unint64_t)hash;
- (void)_initWithRequirementsByContext:(void *)a1;
- (void)allHealthDataRequirements;
- (void)allObservableRequirements;
- (void)allRequirements;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementSet

- (HKFeatureAvailabilityRequirementSet)initWithRequirementsByContext:(id)a3
{
  v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_55);
  v5 = (HKFeatureAvailabilityRequirementSet *)-[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](self, v4);

  return v5;
}

void __69__HKFeatureAvailabilityRequirementSet_initWithRequirementsByContext___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void, void))
{
  v7 = a4;
  id v8 = a2;
  objc_msgSend(a3, "_hk_featureAvailabilityRequirements");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a4)[2](v7, v8, v9);
}

- (void)_initWithRequirementsByContext:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HKFeatureAvailabilityRequirementSet;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

+ (id)noRequirements
{
  v2 = [HKFeatureAvailabilityRequirementSet alloc];
  id v3 = -[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](v2, MEMORY[0x1E4F1CC08]);

  return v3;
}

- (id)evaluationByContextWithDataSource:(void *)a3 overrides:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__23;
    v29 = __Block_byref_object_dispose__23;
    id v30 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v9 = *(void **)(a1 + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__HKFeatureAvailabilityRequirementSet_evaluationByContextWithDataSource_overrides_error___block_invoke;
    v16[3] = &unk_1E58C31A0;
    v16[4] = a1;
    id v17 = v7;
    id v18 = v8;
    v19 = &v25;
    v20 = &v21;
    v10 = objc_msgSend(v9, "hk_map:", v16);
    v11 = v10;
    if (*((unsigned char *)v22 + 24))
    {
      id v12 = (id)v26[5];
      v13 = v12;
      if (v12)
      {
        if (a4) {
          *a4 = v12;
        }
        else {
          _HKLogDroppedError(v12);
        }
      }

      id v14 = 0;
    }
    else
    {
      id v14 = v10;
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __89__HKFeatureAvailabilityRequirementSet_evaluationByContextWithDataSource_overrides_error___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = a1[4];
  id v9 = (void *)a1[5];
  v10 = (void *)a1[6];
  uint64_t v11 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = -[HKFeatureAvailabilityRequirementSet evaluationForContext:dataSource:overrides:error:](v8, (uint64_t)v6, v9, v10, (uint64_t)&obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12) {
    v7[2](v7, v6, v12);
  }
  else {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
}

- (id)evaluationForContext:(void *)a3 dataSource:(void *)a4 overrides:(uint64_t)a5 error:
{
  if (a1)
  {
    uint64_t v8 = *(void **)(a1 + 8);
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = [v8 objectForKeyedSubscript:a2];
    id v12 = +[HKFeatureAvailabilityRequirementsEvaluation evaluationOfRequirements:v11 dataSource:v10 overrides:v9 error:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)allRequirementIdentifiers
{
  v2 = -[HKFeatureAvailabilityRequirementSet allRequirements](self);
  id v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_9);

  return v3;
}

- (void)allRequirements
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA80] set];
    id v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__HKFeatureAvailabilityRequirementSet_allRequirements__block_invoke;
    v6[3] = &unk_1E58C31C8;
    id v7 = v2;
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    v1 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];
  }

  return v1;
}

uint64_t __64__HKFeatureAvailabilityRequirementSet_allRequirementIdentifiers__block_invoke()
{
  v0 = objc_opt_class();

  return [v0 requirementIdentifier];
}

uint64_t __54__HKFeatureAvailabilityRequirementSet_allRequirements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)allObservableRequirements
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA80] set];
    id v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__HKFeatureAvailabilityRequirementSet_allObservableRequirements__block_invoke;
    v6[3] = &unk_1E58C31C8;
    id v7 = v2;
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    v1 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];
  }

  return v1;
}

void __64__HKFeatureAvailabilityRequirementSet_allObservableRequirements__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1EECEE380]) {
          [*(id *)(a1 + 32) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)allHealthDataRequirements
{
  v1 = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = -[HKFeatureAvailabilityRequirementSet allRequirements](v1);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v2, "addObject:", v8, (void)v10);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    v1 = (void *)[v2 copy];
  }

  return v1;
}

- (uint64_t)copyApplyingContextConstraint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc((Class)objc_opt_class());
    uint64_t v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__HKFeatureAvailabilityRequirementSet_copyApplyingContextConstraint___block_invoke;
    v8[3] = &unk_1E58C31F0;
    id v9 = v3;
    uint64_t v6 = objc_msgSend(v5, "hk_filter:", v8);
    a1 = [v4 initWithRequirementsByContext:v6];
  }
  return a1;
}

uint64_t __69__HKFeatureAvailabilityRequirementSet_copyApplyingContextConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) acceptsContext:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSDictionary *)self->_requirementsByContext isEqualToDictionary:v4[1]];

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_requirementsByContext hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityRequirementSet)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  uint64_t v6 = HKAllFeatureAvailabilityRequirementTypes();
  uint64_t v7 = objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6, v12, v13);

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"requirementsByContext"];

  long long v10 = (HKFeatureAvailabilityRequirementSet *)-[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](self, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)requirementsByContext
{
  return self->_requirementsByContext;
}

- (void).cxx_destruct
{
}

@end