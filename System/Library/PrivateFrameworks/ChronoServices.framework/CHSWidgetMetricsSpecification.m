@interface CHSWidgetMetricsSpecification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetMetricsSpecification)init;
- (CHSWidgetMetricsSpecification)initWithCoder:(id)a3;
- (CHSWidgetMetricsSpecification)initWithMetricsSpecification:(id)a3;
- (NSDictionary)alternatesByFamily;
- (NSDictionary)metricsByFamily;
- (NSString)description;
- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4;
- (id)alternateMetricsForFamily:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)metricsForFamily:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)families;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetMetricsSpecification

- (CHSWidgetMetricsSpecification)init
{
  v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  v5 = [(CHSWidgetMetricsSpecification *)self _initWithMetricsByFamily:v3 alternates:v4];

  return v5;
}

- (CHSWidgetMetricsSpecification)initWithMetricsSpecification:(id)a3
{
  id v4 = a3;
  v5 = [v4 metricsByFamily];
  v6 = [v4 alternatesByFamily];
  v7 = [(CHSWidgetMetricsSpecification *)self _initWithMetricsByFamily:v5 alternates:v6];

  return v7;
}

- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetMetricsSpecification;
  v9 = [(CHSWidgetMetricsSpecification *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricsByFamily, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)families
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CHSWidgetMetricsSpecification *)self metricsByFamily];
  v3 = [v2 keyEnumerator];

  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 |= CHSWidgetFamilyMaskFromWidgetFamily([*(id *)(*((void *)&v9 + 1) + 8 * v7++) integerValue]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

- (id)metricsForFamily:(int64_t)a3
{
  unint64_t v4 = [(CHSWidgetMetricsSpecification *)self metricsByFamily];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)alternateMetricsForFamily:(int64_t)a3
{
  unint64_t v4 = [(CHSWidgetMetricsSpecification *)self alternatesByFamily];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CHSWidgetMetricsSpecification *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(CHSWidgetMetricsSpecification *)self metricsByFamily];
      uint64_t v7 = [(CHSWidgetMetricsSpecification *)v5 metricsByFamily];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        long long v9 = [(CHSWidgetMetricsSpecification *)self alternatesByFamily];
        long long v10 = [(CHSWidgetMetricsSpecification *)v5 alternatesByFamily];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return 3 * [(NSDictionary *)self->_metricsByFamily hash];
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetMetricsSpecification *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSWidgetMetricsSpecification *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CHSWidgetMetricsSpecification_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  long long v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

void __59__CHSWidgetMetricsSpecification_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CHSWidgetFamilyMaskDescription([*(id *)(a1 + 40) families]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSWidgetMetricsSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E56C81F0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v2[3] = &unk_1E56C9428;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 description];
  uint64_t v7 = CHSWidgetFamilyDescription([v8 integerValue]);
  [v5 appendString:v6 withName:v7];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CHSMutableWidgetMetricsSpecification allocWithZone:a3];
  return [(CHSWidgetMetricsSpecification *)v4 initWithMetricsSpecification:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSWidgetMetricsSpecification *)self metricsByFamily];
  [v4 encodeObject:v5 forKey:@"metricsByFamily"];

  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = [(CHSWidgetMetricsSpecification *)self alternatesByFamily];
  id v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  long long v9 = [(CHSWidgetMetricsSpecification *)self alternatesByFamily];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__CHSWidgetMetricsSpecification_encodeWithCoder___block_invoke;
  v11[3] = &unk_1E56C9450;
  id v10 = v8;
  id v12 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];

  [v4 encodeObject:v10 forKey:@"alternatesByFamily"];
}

void __49__CHSWidgetMetricsSpecification_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (CHSWidgetMetricsSpecification)initWithCoder:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"metricsByFamily"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  long long v9 = [v7 setWithArray:v8];

  id v10 = [v9 setByAddingObject:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = v9;
  }
  id v12 = v11;
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"alternatesByFamily"];
  uint64_t v14 = [v13 objectEnumerator];
  v15 = [v14 nextObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __47__CHSWidgetMetricsSpecification_initWithCoder___block_invoke;
    v25 = &unk_1E56C9478;
    id v18 = v17;
    id v26 = v18;
    [v13 enumerateKeysAndObjectsUsingBlock:&v22];
    id v19 = (id)objc_msgSend(v18, "copy", v22, v23, v24, v25);
  }
  else
  {
    id v19 = v13;
  }
  v20 = 0;
  if (v6 && v19)
  {
    self = (CHSWidgetMetricsSpecification *)[(CHSWidgetMetricsSpecification *)self _initWithMetricsByFamily:v6 alternates:v19];
    v20 = self;
  }

  return v20;
}

void __47__CHSWidgetMetricsSpecification_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (NSDictionary)metricsByFamily
{
  return self->_metricsByFamily;
}

- (NSDictionary)alternatesByFamily
{
  return self->_alternatesByFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatesByFamily, 0);
  objc_storeStrong((id *)&self->_metricsByFamily, 0);
}

@end