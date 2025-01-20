@interface GEOPOIEventCategory
+ (BOOL)supportsSecureCoding;
+ (id)poiEventCategoriesForEventCategories:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPOIEventCategory:(id)a3;
- (GEOPOIEventCategory)init;
- (GEOPOIEventCategory)initWithCategory:(id)a3 localizedNames:(id)a4;
- (GEOPOIEventCategory)initWithCoder:(id)a3;
- (GEOPOIEventCategory)initWithEventCategory:(id)a3;
- (NSArray)localizedNames;
- (NSString)category;
- (id)parsePDCategories:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOPOIEventCategory

+ (id)poiEventCategoriesForEventCategories:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        v11 = [GEOPOIEventCategory alloc];
        v12 = -[GEOPOIEventCategory initWithEventCategory:](v11, "initWithEventCategory:", v10, (void)v16);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    v13 = v4;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPOIEventCategory)init
{
  result = (GEOPOIEventCategory *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOPOIEventCategory)initWithEventCategory:(id)a3
{
  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPOIEventCategory;
  id v5 = [(GEOPOIEventCategory *)&v13 init];
  if (!v5) {
    goto LABEL_6;
  }
  if (v4 && (*((unsigned char *)v4 + 28) & 1) != 0)
  {
    uint64_t v7 = _GEOSpatialEventLookupCategoryForPDCategory(*((_DWORD *)v4 + 6));
    category = v5->_category;
    v5->_category = (NSString *)v7;

    uint64_t v9 = -[GEOPDEventCategory localizedCategorys](v4);
    uint64_t v10 = [(GEOPOIEventCategory *)v5 parsePDCategories:v9];
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSArray *)v10;

LABEL_6:
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (GEOPOIEventCategory)initWithCategory:(id)a3 localizedNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPOIEventCategory;
  uint64_t v9 = [(GEOPOIEventCategory *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_localizedNames, a4);
  }

  return v10;
}

- (GEOPOIEventCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOIEventCategory;
  id v5 = [(GEOPOIEventCategory *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventCategoryType"];
    category = v5->_category;
    v5->_category = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"GEOPOIEventCategoryNames"];
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  category = self->_category;
  id v5 = a3;
  [v5 encodeObject:category forKey:@"GEOPOIEventCategoryType"];
  [v5 encodeObject:self->_localizedNames forKey:@"GEOPOIEventCategoryNames"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GEOPOIEventCategory *)self isEqualToPOIEventCategory:v4];

  return v5;
}

- (BOOL)isEqualToPOIEventCategory:(id)a3
{
  id v4 = a3;
  category = self->_category;
  uint64_t v6 = [v4 category];
  if ([(NSString *)category isEqual:v6])
  {
    localizedNames = self->_localizedNames;
    id v8 = [v4 localizedNames];
    BOOL v9 = [(NSArray *)localizedNames isEqualToArray:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)parsePDCategories:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "localizedNames", (void)v15);
        uint64_t v11 = [v10 firstObject];

        objc_super v12 = [v11 stringValue];

        if (v12)
        {
          objc_super v13 = [v11 stringValue];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSArray)localizedNames
{
  return self->_localizedNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNames, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end