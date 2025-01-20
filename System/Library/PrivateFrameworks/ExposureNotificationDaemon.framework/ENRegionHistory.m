@interface ENRegionHistory
+ (BOOL)supportsSecureCoding;
- (ENRegionHistory)init;
- (ENRegionHistory)initWithCoder:(id)a3;
- (ENRegionHistory)initWithRegionVisits:(id)a3;
- (NSMutableArray)regionHistory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getRegionVisits;
- (id)getRegions;
- (void)addRegionVisit:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllRegionVisits;
- (void)removeRegionVisit:(id)a3;
@end

@implementation ENRegionHistory

- (id)getRegions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ENRegionHistory *)self getRegionVisits];
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
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) region];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x1E4F1CAD8] setWithArray:v3];

  return v10;
}

- (id)getRegionVisits
{
  v2 = (void *)[(NSMutableArray *)self->_regionHistory copy];

  return v2;
}

- (ENRegionHistory)init
{
  return [(ENRegionHistory *)self initWithRegionVisits:MEMORY[0x1E4F1CBF8]];
}

- (ENRegionHistory)initWithRegionVisits:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENRegionHistory;
  uint64_t v5 = [(ENRegionHistory *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA40] arrayWithArray:v4];
    }
    else
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA40]);
    }
    regionHistory = v5->_regionHistory;
    v5->_regionHistory = v6;
  }
  return v5;
}

- (void)addRegionVisit:(id)a3
{
  id v4 = a3;
  if (!v4) {
    return;
  }
  id v28 = v4;
  uint64_t v5 = [(NSMutableArray *)self->_regionHistory lastObject];
  uint64_t v6 = [v5 region];
  uint64_t v7 = [v28 region];
  int v8 = [v6 isCountryCodeEqualToRegion:v7];

  if (!v8) {
    goto LABEL_16;
  }
  objc_super v9 = [v28 region];
  v10 = [v9 subdivisionCode];
  if (v10)
  {

LABEL_5:
    v11 = [v5 region];
    long long v12 = [v28 region];
    if ([v11 isSubdivisionCodeEqualToRegion:v12])
    {

LABEL_7:
      [(NSMutableArray *)self->_regionHistory removeLastObject];
      id v13 = objc_alloc(MEMORY[0x1E4F257E0]);
      long long v14 = [v28 region];
      long long v15 = [v28 date];
      v16 = [v5 date];
      uint64_t v17 = [v15 laterDate:v16];
      uint64_t v18 = [v13 initWithRegion:v14 date:v17];

      id v19 = (id)v18;
      goto LABEL_17;
    }
    v22 = [v5 region];
    v23 = [v22 subdivisionCode];
    if (v23)
    {
    }
    else
    {
      v24 = [v28 region];
      v25 = [v24 subdivisionCode];

      if (!v25) {
        goto LABEL_7;
      }
    }
    v26 = [v5 region];
    v27 = [v26 subdivisionCode];

    if (!v27) {
      [(NSMutableArray *)self->_regionHistory removeLastObject];
    }
LABEL_16:
    id v19 = v28;
LABEL_17:
    id v28 = v19;
    -[NSMutableArray addObject:](self->_regionHistory, "addObject:");
    if ((unint64_t)[(NSMutableArray *)self->_regionHistory count] >= 0x3E9) {
      [(NSMutableArray *)self->_regionHistory removeObjectAtIndex:0];
    }
    goto LABEL_19;
  }
  v20 = [v5 region];
  v21 = [v20 subdivisionCode];

  if (!v21) {
    goto LABEL_5;
  }
LABEL_19:
}

- (void)removeRegionVisit:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](self->_regionHistory, "removeObject:");
  }
}

- (void)removeAllRegionVisits
{
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F29020];
  id v3 = [(ENRegionHistory *)self getRegionVisits];
  id v4 = [v3 componentsJoinedByString:@" | "];
  uint64_t v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ENRegionHistory alloc];
  uint64_t v5 = [(ENRegionHistory *)self getRegionVisits];
  uint64_t v6 = [(ENRegionHistory *)v4 initWithRegionVisits:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ENRegionHistory)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  int v8 = [v5 decodeObjectOfClasses:v7 forKey:@"visits"];

  objc_super v9 = [(ENRegionHistory *)self initWithRegionVisits:v8];
  return v9;
}

- (NSMutableArray)regionHistory
{
  return self->_regionHistory;
}

- (void).cxx_destruct
{
}

@end