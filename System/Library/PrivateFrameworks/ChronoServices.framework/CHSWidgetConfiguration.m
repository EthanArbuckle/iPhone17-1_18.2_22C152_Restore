@interface CHSWidgetConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetConfiguration)init;
- (CHSWidgetConfiguration)initWithCoder:(id)a3;
- (CHSWidgetConfiguration)initWithConfiguration:(id)a3;
- (CHSWidgetConfiguration)initWithContainerDescriptors:(id)a3 metricsSpecification:(id)a4;
- (CHSWidgetMetricsSpecification)metricsSpecification;
- (NSArray)containerDescriptors;
- (NSSet)rateLimitPolicies;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetConfiguration

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSWidgetConfiguration.m" lineNumber:26 description:@"use initWithContainerDescriptors:metricsSpecification:"];

  return 0;
}

- (CHSWidgetConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSWidgetConfiguration.m" lineNumber:31 description:@"use initWithContainerDescriptors:metricsSpecification:"];

  return 0;
}

- (CHSWidgetConfiguration)initWithContainerDescriptors:(id)a3 metricsSpecification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSWidgetConfiguration;
  v8 = [(CHSWidgetConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    containerDescriptors = v8->_containerDescriptors;
    v8->_containerDescriptors = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    metricsSpecification = v8->_metricsSpecification;
    v8->_metricsSpecification = (CHSWidgetMetricsSpecification *)v11;
  }
  return v8;
}

- (CHSWidgetConfiguration)initWithConfiguration:(id)a3
{
  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CHSWidgetConfiguration;
  v5 = [(CHSWidgetConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    containerDescriptors = v5->_containerDescriptors;
    v5->_containerDescriptors = (NSArray *)v6;

    uint64_t v8 = [v4[2] copy];
    metricsSpecification = v5->_metricsSpecification;
    v5->_metricsSpecification = (CHSWidgetMetricsSpecification *)v8;

    uint64_t v10 = [v4[3] copy];
    rateLimitPolicies = v5->_rateLimitPolicies;
    v5->_rateLimitPolicies = (NSSet *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  containerDescriptors = self->_containerDescriptors;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke;
  v24[3] = &unk_1E56C8178;
  id v11 = v9;
  id v25 = v11;
  id v12 = (id)[v5 appendObject:containerDescriptors counterpart:v24];
  metricsSpecification = self->_metricsSpecification;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke_2;
  v22[3] = &unk_1E56C81A0;
  id v14 = v11;
  id v23 = v14;
  id v15 = (id)[v5 appendObject:metricsSpecification counterpart:v22];
  rateLimitPolicies = self->_rateLimitPolicies;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke_3;
  v20[3] = &unk_1E56C81C8;
  id v17 = v14;
  id v21 = v17;
  id v18 = (id)[v5 appendObject:rateLimitPolicies counterpart:v20];
  LOBYTE(v14) = [v5 isEqual];

  return (char)v14;
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) containerDescriptors];
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) metricsSpecification];
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) rateLimitPolicies];
}

- (unint64_t)hash
{
  return 23 * [(NSArray *)self->_containerDescriptors hash];
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSWidgetConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CHSWidgetConfiguration_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v9 = v4;
  uint64_t v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

id __52__CHSWidgetConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 40;
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "count"), @"containerCount");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(*(void *)v2 + 8);
  uint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "widgets", (void)v16);
        uint64_t v10 = [v9 count];

        v5 += v10;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v11 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:v5 withName:@"widgets"];
  id v12 = *(void **)(a1 + 32);
  objc_super v13 = [*(id *)(*(void *)(a1 + 40) + 16) succinctDescription];
  id v14 = (id)[v12 appendObject:v13 withName:@"metrics"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"), @"rateLimitCount");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CHSWidgetConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CHSWidgetConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

id __64__CHSWidgetConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = a1 + 40;
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"metricsSpecification"];
  id v5 = (id)objc_msgSend(*v2, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)v3 + 8), "count"), @"containerCount");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(*(void *)v3 + 8);
  uint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "widgets", (void)v15);
        uint64_t v12 = [v11 count];

        v7 += v12;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:v7 withName:@"widgets"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"rateLimits"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CHSMutableWidgetConfiguration allocWithZone:a3];
  return [(CHSWidgetConfiguration *)v4 initWithConfiguration:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v35 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v34 = self;
  id v4 = self->_rateLimitPolicies;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        [v35 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v5);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v34->_containerDescriptors;
  uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v11 = [v10 widgets];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v12; ++k)
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v11);
              }
              long long v15 = *(void **)(*((void *)&v36 + 1) + 8 * k);
              long long v16 = [v15 refreshStrategy];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v17 = v16;
                long long v18 = [v17 rateLimitIdentifier];
                BOOL v19 = v18 == 0;

                if (!v19)
                {
                  uint64_t v20 = [v17 rateLimitIdentifier];
                  uint64_t v21 = [v35 objectForKeyedSubscript:v20];
                  BOOL v22 = v21 == 0;

                  if (v22)
                  {
                    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
                    v24 = [v17 rateLimitIdentifier];

                    id v25 = CHSLogChronoServices();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      v26 = [v17 rateLimitIdentifier];
                      *(_DWORD *)buf = 138543618;
                      v49 = v15;
                      __int16 v50 = 2114;
                      v51 = v26;
                    }
                  }
                }
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v12);
        }
      }
      uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v31);
  }

  [v28 encodeObject:v34->_containerDescriptors forKey:@"_containerDescriptors"];
  [v28 encodeObject:v34->_metricsSpecification forKey:@"_metricsSpecification"];
  v27 = [(NSSet *)v34->_rateLimitPolicies allObjects];
  [v28 encodeObject:v27 forKey:@"rateLimits2"];
}

- (CHSWidgetConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_containerDescriptors"];

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metricsSpecification"];
  if ([v4 containsValueForKey:@"rateLimits2"])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"rateLimits2"];
  }
  else
  {
    if (![v4 containsValueForKey:@"rateLimits"])
    {
      uint64_t v13 = 0;
      goto LABEL_7;
    }
    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    long long v16 = [v4 decodeObjectOfClasses:v12 forKey:@"rateLimits"];
    uint64_t v13 = [v16 allObjects];
  }
LABEL_7:
  id v17 = 0;
  if (v8 && v9)
  {
    long long v18 = [(CHSWidgetConfiguration *)self initWithContainerDescriptors:v8 metricsSpecification:v9];
    BOOL v19 = v18;
    if (v13)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
      rateLimitPolicies = v19->_rateLimitPolicies;
      v19->_rateLimitPolicies = (NSSet *)v20;
    }
    else
    {
      rateLimitPolicies = v18->_rateLimitPolicies;
      v18->_rateLimitPolicies = 0;
    }

    self = v19;
    id v17 = self;
  }

  return v17;
}

- (NSArray)containerDescriptors
{
  return self->_containerDescriptors;
}

- (CHSWidgetMetricsSpecification)metricsSpecification
{
  return self->_metricsSpecification;
}

- (NSSet)rateLimitPolicies
{
  return self->_rateLimitPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitPolicies, 0);
  objc_storeStrong((id *)&self->_metricsSpecification, 0);
  objc_storeStrong((id *)&self->_containerDescriptors, 0);
}

@end