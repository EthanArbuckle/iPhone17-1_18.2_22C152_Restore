@interface ATXModeEntityAffinityVector
+ (id)centroid:(id)a3;
+ (id)weightedCentroid:(id)a3;
- (ATXModeEntityAffinityVector)init;
- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3;
- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3 shouldResize:(BOOL)a4;
- (BOOL)isZeroVector;
- (NSArray)affinityVector;
- (double)magnitude;
- (double)scoreForMode:(unint64_t)a3;
- (id)_initWithAffinityVector:(id)a3;
- (id)description;
- (id)prettyDescription;
- (id)sortedAffinities;
- (void)resizeToUnit;
@end

@implementation ATXModeEntityAffinityVector

- (ATXModeEntityAffinityVector)init
{
  return [(ATXModeEntityAffinityVector *)self initWithAffinities:MEMORY[0x1E4F1CC08]];
}

- (id)_initWithAffinityVector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeEntityAffinityVector;
  v6 = [(ATXModeEntityAffinityVector *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_affinityVector, a3);
  }

  return v7;
}

- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3 shouldResize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ATXModeEntityAffinityVector;
  v7 = [(ATXModeEntityAffinityVector *)&v25 init];
  if (v7)
  {
    int v8 = 16;
    objc_super v9 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:16];
    do
    {
      [(NSArray *)v9 addObject:&unk_1F27F2208];
      --v8;
    }
    while (v8);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
          unint64_t v16 = ATXStringToMode();
          if (v16 <= 0xF)
          {
            unint64_t v17 = v16;
            v18 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v21);
            [(NSArray *)v9 setObject:v18 atIndexedSubscript:v17];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    affinityVector = v7->_affinityVector;
    v7->_affinityVector = v9;

    if (v4) {
      [(ATXModeEntityAffinityVector *)v7 resizeToUnit];
    }
  }

  return v7;
}

- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3
{
  return [(ATXModeEntityAffinityVector *)self initWithAffinities:a3 shouldResize:0];
}

- (id)description
{
  v2 = [(NSArray *)self->_affinityVector _pas_mappedArrayWithTransform:&__block_literal_global_201];
  v3 = NSString;
  BOOL v4 = [v2 componentsJoinedByString:@", "];
  id v5 = [v3 stringWithFormat:@"<%@>", v4];

  return v5;
}

uint64_t __42__ATXModeEntityAffinityVector_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (id)prettyDescription
{
  v2 = [(ATXModeEntityAffinityVector *)self sortedAffinities];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_9_0);
  BOOL v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

id __48__ATXModeEntityAffinityVector_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  BOOL v4 = [v3 second];
  id v5 = [v3 first];

  [v5 doubleValue];
  v7 = [v2 stringWithFormat:@"%@: %f", v4, v6];

  return v7;
}

- (id)sortedAffinities
{
  v2 = [(NSArray *)self->_affinityVector _pas_mappedArrayWithIndexedTransform:&__block_literal_global_15_4];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_19_3];

  return v3;
}

id __47__ATXModeEntityAffinityVector_sortedAffinities__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 doubleValue];
  if (v3 >= 0.0001)
  {
    id v5 = (void *)MEMORY[0x1E4F93BB8];
    uint64_t v6 = ATXModeToString();
    BOOL v4 = [v5 tupleWithFirst:v2 second:v6];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __47__ATXModeEntityAffinityVector_sortedAffinities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 first];
  uint64_t v6 = [v4 first];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (double)scoreForMode:(unint64_t)a3
{
  if (a3 > 0xF) {
    return 0.0;
  }
  id v4 = -[NSArray objectAtIndexedSubscript:](self->_affinityVector, "objectAtIndexedSubscript:");
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)magnitude
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_affinityVector;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "doubleValue", (void)v10);
        double v6 = v6 + v8 * v8;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  double result = fabs(sqrt(v6));
  if (v6 == -INFINITY) {
    return INFINITY;
  }
  return result;
}

- (BOOL)isZeroVector
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_affinityVector;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "doubleValue", (void)v10);
        if (v7 < 0.0) {
          double v7 = -v7;
        }
        if (v7 > 0.0001)
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (void)resizeToUnit
{
  if (![(ATXModeEntityAffinityVector *)self isZeroVector])
  {
    [(ATXModeEntityAffinityVector *)self magnitude];
    affinityVector = self->_affinityVector;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__ATXModeEntityAffinityVector_resizeToUnit__block_invoke;
    v7[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    v7[4] = v4;
    uint64_t v5 = [(NSArray *)affinityVector _pas_mappedArrayWithTransform:v7];
    double v6 = self->_affinityVector;
    self->_affinityVector = v5;
  }
}

uint64_t __43__ATXModeEntityAffinityVector_resizeToUnit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  [a2 doubleValue];
  double v5 = v4 / *(double *)(a1 + 32);
  return [v3 numberWithDouble:v5];
}

+ (id)centroid:(id)a3
{
  double v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_24_0);
  double v5 = [a1 weightedCentroid:v4];

  return v5;
}

uint64_t __40__ATXModeEntityAffinityVector_centroid___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F93BB8] tupleWithFirst:a2 second:&unk_1F27F2220];
}

+ (id)weightedCentroid:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    v37 = objc_opt_new();
    goto LABEL_24;
  }
  double v5 = [v4 objectAtIndexedSubscript:0];
  double v6 = [v5 first];
  double v7 = [v6 affinityVector];
  uint64_t v8 = [v7 count];

  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v8)
  {
    uint64_t v10 = v8;
    do
    {
      [v9 addObject:&unk_1F27F2208];
      --v10;
    }
    while (v10);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v39 = (objc_class *)a1;
    id v40 = v4;
    uint64_t v14 = *(void *)v43;
    double v15 = 0.0;
    obuint64_t j = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v18 = [v17 first];
        v19 = [v18 affinityVector];

        v20 = [v17 second];
        [v20 doubleValue];
        double v22 = v21;

        if (v8)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            long long v24 = [v19 objectAtIndexedSubscript:j];
            [v24 doubleValue];
            double v26 = v22 * v25;

            uint64_t v27 = NSNumber;
            v28 = [v9 objectAtIndexedSubscript:j];
            [v28 doubleValue];
            v30 = [v27 numberWithDouble:v26 + v29];
            [v9 setObject:v30 atIndexedSubscript:j];
          }
        }
        double v15 = v15 + v22;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);

    id v4 = v40;
    if (v15 >= 0.0001)
    {
      if (v8)
      {
        for (uint64_t k = 0; k != v8; ++k)
        {
          v32 = NSNumber;
          v33 = [v9 objectAtIndexedSubscript:k];
          [v33 doubleValue];
          v35 = [v32 numberWithDouble:v34 / v15];
          [v9 setObject:v35 atIndexedSubscript:k];
        }
      }
      uint64_t v36 = [[v39 alloc] _initWithAffinityVector:v9];
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v36 = objc_opt_new();
LABEL_23:
  v37 = (void *)v36;

LABEL_24:
  return v37;
}

- (NSArray)affinityVector
{
  return self->_affinityVector;
}

- (void).cxx_destruct
{
}

@end