@interface CHSIntentRecommendationsContainer
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_didAdjustRecommendationCount;
- (BOOL)isEqual:(id)a3;
- (CHSIntentRecommendationsContainer)initWithBSXPCCoder:(id)a3;
- (CHSIntentRecommendationsContainer)initWithCoder:(id)a3;
- (CHSIntentRecommendationsContainer)initWithSchemaIntent:(id)a3 recommendations:(id)a4;
- (NSArray)recommendations;
- (id)_initWithSchemaData:(id)a3 recommendations:(id)a4;
- (id)_recommendationsWithoutSchemaData;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSIntentRecommendationsContainer

- (CHSIntentRecommendationsContainer)initWithSchemaIntent:(id)a3 recommendations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  v8 = +[CHSIntentReference _schemaDataFromIntent:v6 error:&v18];
  id v9 = v18;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __74__CHSIntentRecommendationsContainer_initWithSchemaIntent_recommendations___block_invoke;
      v16 = &unk_1E56C8A50;
      id v17 = v8;
      uint64_t v11 = objc_msgSend(v7, "bs_map:", &v13);

      id v7 = (id)v11;
    }
    self = (CHSIntentRecommendationsContainer *)-[CHSIntentRecommendationsContainer _initWithSchemaData:recommendations:](self, "_initWithSchemaData:recommendations:", v8, v7, v13, v14, v15, v16);
    v10 = self;
  }

  return v10;
}

id __74__CHSIntentRecommendationsContainer_initWithSchemaIntent_recommendations___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 _copyFillingInSchema:*(void *)(a1 + 32)];
  return v2;
}

- (id)_initWithSchemaData:(id)a3 recommendations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHSIntentRecommendationsContainer;
  id v9 = [(CHSIntentRecommendationsContainer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schemaData, a3);
    if ((unint64_t)[v8 count] >= 0x10)
    {
      uint64_t v11 = CHSLogChronoServices();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        *(_DWORD *)buf = 138543362;
        id v17 = v12;
        _os_log_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEFAULT, "A large number of intent recommendations detected %{public}@; filtering to a reasonable number.",
          buf,
          0xCu);
      }
      v10->_didAdjustRecommendationCount = 1;
      uint64_t v13 = objc_msgSend(v8, "subarrayWithRange:", 0, 15);

      id v8 = (id)v13;
    }
    objc_storeStrong((id *)&v10->_recommendations, v8);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSIntentRecommendationsContainer *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CHSIntentRecommendationsContainer *)v4 recommendations];
      char v6 = BSEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return 7 * [(NSArray *)self->_recommendations count];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_recommendationsWithoutSchemaData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_recommendations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_copyWithoutSchemaDataIfNecessary", (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_schemaData forKey:@"schema"];
  v4 = [(CHSIntentRecommendationsContainer *)self _recommendationsWithoutSchemaData];
  [v5 encodeObject:v4 forKey:@"recommendations"];
}

- (CHSIntentRecommendationsContainer)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v8 = [v6 setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recommendations"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "intentReference", (void)v17);
        [v14 _setPartialSchemaData:v5];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (v10)
  {
    self = (CHSIntentRecommendationsContainer *)[(CHSIntentRecommendationsContainer *)self _initWithSchemaData:v5 recommendations:v10];
    uint64_t v15 = self;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_schemaData forKey:@"schema"];
  id v4 = [(CHSIntentRecommendationsContainer *)self _recommendationsWithoutSchemaData];
  [v5 encodeCollection:v4 forKey:@"recommendations"];
}

- (CHSIntentRecommendationsContainer)initWithBSXPCCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
  uint64_t v6 = objc_opt_class();
  [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"recommendations"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "intentReference", (void)v14);
        [v11 _setPartialSchemaData:v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (v7)
  {
    self = (CHSIntentRecommendationsContainer *)[(CHSIntentRecommendationsContainer *)self _initWithSchemaData:v5 recommendations:v7];
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (BOOL)_didAdjustRecommendationCount
{
  return self->_didAdjustRecommendationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end