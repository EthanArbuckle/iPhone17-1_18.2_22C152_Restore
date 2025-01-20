@interface CalDisjointDateRange
+ (BOOL)supportsSecureCoding;
+ (id)disjointRangeWithDistinctRanges:(id)a3;
+ (id)disjointRangeWithSingleRange:(id)a3;
- (BOOL)containsDate:(id)a3;
- (BOOL)containsRange:(id)a3;
- (BOOL)intersectsRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CalDisjointDateRange)initWithCoder:(id)a3;
- (CalDisjointDateRange)initWithDistinctRanges:(id)a3;
- (NSSet)distinctRanges;
- (double)totalDuration;
- (id)addDisjointRange:(id)a3;
- (id)addRange:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)intersectionWithDisjointRange:(id)a3;
- (id)intersectionWithRange:(id)a3;
- (id)sortedDistinctRanges;
- (id)subtractDisjointRange:(id)a3;
- (id)subtractRange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDistinctRanges:(id)a3;
@end

@implementation CalDisjointDateRange

+ (id)disjointRangeWithDistinctRanges:(id)a3
{
  id v3 = a3;
  v4 = [[CalDisjointDateRange alloc] initWithDistinctRanges:v3];

  return v4;
}

- (CalDisjointDateRange)initWithDistinctRanges:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalDisjointDateRange;
  v5 = [(CalDisjointDateRange *)&v9 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = [v4 copy];
    }
    else {
      uint64_t v6 = objc_opt_new();
    }
    distinctRanges = v5->_distinctRanges;
    v5->_distinctRanges = (NSMutableSet *)v6;
  }
  return v5;
}

- (id)subtractDisjointRange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a3, "distinctRanges", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = [(CalDisjointDateRange *)v10 subtractRange:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CalDisjointDateRange *)self sortedDistinctRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 appendString:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [NSString stringWithString:v3];

  return v10;
}

- (id)sortedDistinctRanges
{
  v2 = [(CalDisjointDateRange *)self distinctRanges];
  id v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_164];

  return v4;
}

- (NSSet)distinctRanges
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_distinctRanges];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v6 = (void *)[v4 initWithDistinctRanges:v5];

  return v6;
}

- (void).cxx_destruct
{
}

- (id)addRange:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v7 = [v5 setWithSet:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = [(CalDisjointDateRange *)self distinctRanges];
  v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v15 intersectsRange:v4 allowSinglePointIntersection:1])
        {
          [v8 addObject:v15];
          [v7 removeObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  v16 = +[CalDateRange rangeWithRange:v4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v21 = 0;
      v22 = v16;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v16 = objc_msgSend(v22, "unionRange:", *(void *)(*((void *)&v27 + 1) + 8 * v21), (void)v27);

        ++v21;
        v22 = v16;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  v23 = [MEMORY[0x1E4F1CA80] setWithObject:v16];
  if ([v7 count])
  {
    v24 = [v7 allObjects];
    [v23 addObjectsFromArray:v24];
  }
  v25 = [(id)objc_opt_class() disjointRangeWithDistinctRanges:v23];

  return v25;
}

- (id)subtractRange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) subtractRange:v4];
        uint64_t v12 = [v11 distinctRanges];

        if (v12)
        {
          uint64_t v13 = [v11 distinctRanges];
          long long v14 = [v13 allObjects];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = +[CalDisjointDateRange disjointRangeWithDistinctRanges:v5];

  return v15;
}

- (BOOL)containsRange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsRange:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __44__CalDisjointDateRange_sortedDistinctRanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)disjointRangeWithSingleRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];

  uint64_t v6 = [v4 disjointRangeWithDistinctRanges:v5];

  return v6;
}

- (id)intersectionWithDisjointRange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = objc_msgSend(v4, "distinctRanges", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [(CalDisjointDateRange *)self intersectionWithRange:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        long long v12 = [v11 distinctRanges];

        if (v12)
        {
          long long v13 = [v11 distinctRanges];
          long long v14 = [v13 allObjects];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = +[CalDisjointDateRange disjointRangeWithDistinctRanges:v5];

  return v15;
}

- (id)intersectionWithRange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) intersectionWithRange:v4];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = +[CalDisjointDateRange disjointRangeWithDistinctRanges:v5];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CalDisjointDateRange *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v5 = [(CalDisjointDateRange *)self distinctRanges];
      uint64_t v6 = [(CalDisjointDateRange *)v4 distinctRanges];
      char v7 = [v5 isEqualToSet:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)intersectsRange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) intersectsRange:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)totalDuration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * i) duration];
        double v6 = v6 + v8;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)containsDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CalDisjointDateRange *)self distinctRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsDate:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)addDisjointRange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(a3, "distinctRanges", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      long long v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = [(CalDisjointDateRange *)v10 addRange:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        ++v9;
        long long v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CalDisjointDateRange)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_distinctRanges"];

  uint64_t v6 = (NSMutableSet *)[v5 copy];
  distinctRanges = self->_distinctRanges;
  self->_distinctRanges = v6;

  return self;
}

- (void)setDistinctRanges:(id)a3
{
}

@end