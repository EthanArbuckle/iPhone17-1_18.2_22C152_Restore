@interface GEOAmenityItem
+ (id)amenityItemsFromPDAmenityItems:(id)a3;
- (BOOL)isAmenityPresent;
- (BOOL)isApplePayAmenity;
- (GEOAmenityItem)initWithAmenityValue:(id)a3;
- (NSString)amenityTitle;
- (NSString)symbolImageName;
- (id)description;
- (int)amenityType;
@end

@implementation GEOAmenityItem

- (GEOAmenityItem)initWithAmenityValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAmenityItem;
  v6 = [(GEOAmenityItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_amenityValue, a3);
  }

  return v7;
}

- (NSString)amenityTitle
{
  return (NSString *)[(GEOPDAmenityValue *)self->_amenityValue displayTitle];
}

- (int)amenityType
{
  int result = [(GEOPDAmenityValue *)self->_amenityValue amenityType];
  if (result >= 0x3F) {
    return 0;
  }
  return result;
}

- (BOOL)isApplePayAmenity
{
  return [(GEOAmenityItem *)self amenityType] == 21;
}

- (BOOL)isAmenityPresent
{
  return [(GEOPDAmenityValue *)self->_amenityValue amenityPresent];
}

- (NSString)symbolImageName
{
  return [(GEOPDAmenityValue *)self->_amenityValue symbolImageName];
}

+ (id)amenityItemsFromPDAmenityItems:(id)a3
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
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [GEOAmenityItem alloc];
        v12 = -[GEOAmenityItem initWithAmenityValue:](v11, "initWithAmenityValue:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_amenityValue];
}

- (void).cxx_destruct
{
}

@end