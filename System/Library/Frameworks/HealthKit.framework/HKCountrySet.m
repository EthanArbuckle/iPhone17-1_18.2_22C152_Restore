@interface HKCountrySet
+ (BOOL)_versionsMatchBetweenAvailabilityRegions:(void *)a3 availabilityRegions:;
+ (BOOL)supportsSecureCoding;
+ (id)_decodePlistDictionary:(uint64_t)a1;
+ (id)bitmaskPathForCountryCode:(id)a3;
+ (id)countryCodeForBitmaskPath:(id)a3;
+ (id)countryCodesForCountryBitmasks:(id)a3;
+ (id)countrySetWithPlistURL:(id)a3 error:(id *)a4;
+ (id)emptyCountrySet;
+ (id)regionsWithPlistAtURL:(id)a3 error:(id *)a4;
+ (int64_t)isRegionCodeFound:(id)a3 availabilityWatch:(id)a4 availabilityPhone:(id)a5;
- (BOOL)containsCountryCode:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (HKCountrySet)initWithCoder:(id)a3;
- (HKCountrySet)initWithCountryBitmasks:(id)a3 compatibilityVersion:(int64_t)a4 contentVersion:(int64_t)a5 provenance:(int64_t)a6;
- (HKCountrySet)initWithDictionaryRepresentation:(id)a3 provenance:(int64_t)a4;
- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4;
- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4 provenance:(int64_t)a5;
- (NSArray)allCountryCodes;
- (NSArray)countryBitmasks;
- (NSDictionary)dictionaryRepresentation;
- (id)_countrySetByOperatingWithCountriesInSet:(uint64_t)a3 contentVersion:(void *)a4 enumerationBlock:;
- (id)countrySetByAddingCountriesInSet:(id)a3;
- (id)countrySetByIntersectingCountriesInSet:(id)a3;
- (id)countrySetByRemovingCountriesInSet:(id)a3;
- (id)description;
- (int64_t)compatibilityVersion;
- (int64_t)contentVersion;
- (int64_t)provenance;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCountrySet

+ (int64_t)isRegionCodeFound:(id)a3 availabilityWatch:(id)a4 availabilityPhone:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = a4;
    v11 = [[HKCountrySet alloc] initWithDictionaryRepresentation:v10 provenance:0];

    v12 = [[HKCountrySet alloc] initWithDictionaryRepresentation:v9 provenance:0];
    if (v12)
    {
      if (v11)
      {
        v13 = [(HKCountrySet *)v11 countrySetByIntersectingCountriesInSet:v12];
        int v14 = [v13 containsCountryCode:v8];
        BOOL v15 = +[HKCountrySet _versionsMatchBetweenAvailabilityRegions:availabilityRegions:]((uint64_t)a1, v11, v12);
        self;
        uint64_t v16 = 1;
        if (!v14) {
          uint64_t v16 = 2;
        }
        uint64_t v17 = 3;
        if (v14) {
          uint64_t v17 = 4;
        }
        if (v15) {
          int64_t v18 = v16;
        }
        else {
          int64_t v18 = v17;
        }
      }
      else
      {
        int64_t v18 = 6;
      }
    }
    else
    {
      int64_t v18 = 5;
    }
  }
  else
  {
    int64_t v18 = 2;
  }

  return v18;
}

+ (BOOL)_versionsMatchBetweenAvailabilityRegions:(void *)a3 availabilityRegions:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = [v5 compatibilityVersion];

  uint64_t v7 = [v4 compatibilityVersion];
  return v6 == v7;
}

+ (id)bitmaskPathForCountryCode:(id)a3
{
  if (a3)
  {
    v3 = [a3 uppercaseString];
    if ([&unk_1EECE6AB0 count])
    {
      uint64_t v4 = 0;
      while (1)
      {
        id v5 = [&unk_1EECE6AC8 objectAtIndexedSubscript:v4];
        uint64_t v6 = [v5 objectForKeyedSubscript:v3];

        if (v6) {
          break;
        }
        if (++v4 >= (unint64_t)[&unk_1EECE6AB0 count]) {
          goto LABEL_6;
        }
      }
      uint64_t v7 = +[HKCountrySetBitmaskPath pathWithBitmask:index:](HKCountrySetBitmaskPath, "pathWithBitmask:index:", [v6 unsignedLongLongValue], v4);
    }
    else
    {
LABEL_6:
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)countryCodeForBitmaskPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(&unk_1EECE6AE0, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HKCountrySet_BitmaskEncoding__countryCodeForBitmaskPath___block_invoke;
  v12[3] = &unk_1E58C0798;
  id v7 = v5;
  id v13 = v7;
  id v8 = objc_msgSend(v6, "hk_filterKeysWithBlock:", v12);

  if ([v8 count] != 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+BitmaskEncoding.m" lineNumber:604 description:@"Each availability mask corresponds to one ISO 3166-1 country."];
  }
  id v9 = [v8 anyObject];

  return v9;
}

BOOL __59__HKCountrySet_BitmaskEncoding__countryCodeForBitmaskPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bitmask];
  uint64_t v5 = [v3 unsignedLongLongValue];

  return (v5 & v4) != 0;
}

+ (id)countryCodesForCountryBitmasks:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v3 objectAtIndexedSubscript:v5];
      id v7 = [&unk_1EECE6AF8 objectAtIndexedSubscript:v5];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__HKCountrySet_BitmaskEncoding__countryCodesForCountryBitmasks___block_invoke;
      v13[3] = &unk_1E58C0798;
      id v14 = v6;
      id v8 = v6;
      id v9 = objc_msgSend(v7, "hk_filterKeysWithBlock:", v13);
      id v10 = [v9 allObjects];
      [v4 addObjectsFromArray:v10];

      ++v5;
    }
    while (v5 < [v3 count]);
  }
  v11 = (void *)[v4 copy];

  return v11;
}

BOOL __64__HKCountrySet_BitmaskEncoding__countryCodesForCountryBitmasks___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 unsignedLongLongValue];
  uint64_t v5 = [v3 unsignedLongLongValue];

  return (v5 & v4) != 0;
}

- (HKCountrySet)initWithDictionaryRepresentation:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "hk_safeArrayIfExistsForKeyPath:error:", @"countryBitmasks", 0);
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      objc_msgSend(v7, "hk_safeArrayForKeyPath:error:", @"AvailableRegions", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    if ([v12 count] == 5
      && objc_msgSend(v12, "hk_allObjectsPassTest:", &__block_literal_global_37))
    {
      id v13 = objc_msgSend(v7, "hk_safeNumberIfExistsForKeyPath:error:", @"compatibilityVersion", 0);
      id v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        objc_msgSend(v7, "hk_safeNumberForKeyPath:error:", @"AvailableRegionsVersion", 0);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v16 = v15;

      uint64_t v17 = [v16 integerValue];
      v11 = 0;
      if (v17)
      {
        uint64_t v18 = v17;
        if (v17 != 0x7FFFFFFF)
        {
          v19 = objc_msgSend(v7, "hk_safeNumberIfExistsForKeyPath:error:", @"contentVersion", 0);
          uint64_t v20 = [v19 integerValue];

          self = [(HKCountrySet *)self initWithCountryBitmasks:v12 compatibilityVersion:v18 contentVersion:v20 provenance:a4];
          v11 = self;
        }
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __60__HKCountrySet_initWithDictionaryRepresentation_provenance___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HKCountrySet)initWithCountryBitmasks:(id)a3 compatibilityVersion:(int64_t)a4 contentVersion:(int64_t)a5 provenance:(int64_t)a6
{
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKCountrySet;
  v12 = [(HKCountrySet *)&v19 init];
  if (!v12) {
    goto LABEL_9;
  }
  if ([v11 count] != 5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, v12, @"HKCountrySet.m", 68, @"Invalid parameter not satisfying: %@", @"countryBitmasks.count == 5" object file lineNumber description];
  }
  if (a4 < 2)
  {
    uint64_t v15 = [v11 copy];
    countryBitmasks = v12->_countryBitmasks;
    v12->_countryBitmasks = (NSArray *)v15;

    v12->_compatibilityVersion = a4;
    v12->_contentVersion = a5;
    v12->_provenance = a6;
LABEL_9:
    id v14 = v12;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v13 = HKLogInfrastructure();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:]((uint64_t)v12, a4, v13);
  }

  id v14 = 0;
LABEL_10:

  return v14;
}

- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4
{
  return [(HKCountrySet *)self initWithSupportedCountryCodes:a3 contentVersion:a4 provenance:-1];
}

- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4 provenance:(int64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    int64_t v29 = a4;
    int64_t v9 = a5;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x19F395970]();
        id v14 = +[HKCountrySet bitmaskPathForCountryCode:v12];
        uint64_t v15 = [v14 bitmask];
        uint64_t v16 = [v14 index];
        *((void *)&v37 + v16) |= v15;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
    uint64_t v17 = *((void *)&v37 + 1);
    uint64_t v8 = v37;
    uint64_t v19 = *((void *)&v38 + 1);
    uint64_t v18 = v38;
    uint64_t v20 = v39;
    a5 = v9;
    a4 = v29;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
    uint64_t v17 = 0;
  }

  v21 = [NSNumber numberWithUnsignedLongLong:v8];
  v35[0] = v21;
  v22 = [NSNumber numberWithUnsignedLongLong:v17];
  v35[1] = v22;
  v23 = [NSNumber numberWithUnsignedLongLong:v18];
  v35[2] = v23;
  v24 = [NSNumber numberWithUnsignedLongLong:v19];
  v35[3] = v24;
  v25 = [NSNumber numberWithUnsignedLongLong:v20];
  v35[4] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  v27 = [(HKCountrySet *)self initWithCountryBitmasks:v26 compatibilityVersion:1 contentVersion:a4 provenance:a5];

  return v27;
}

+ (id)emptyCountrySet
{
  id v2 = [HKCountrySet alloc];
  id v3 = [(HKCountrySet *)v2 initWithSupportedCountryCodes:MEMORY[0x1E4F1CBF0] contentVersion:0 provenance:3];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  int64_t compatibilityVersion = self->_compatibilityVersion;
  v9[0] = self->_countryBitmasks;
  v8[0] = @"countryBitmasks";
  v8[1] = @"compatibilityVersion";
  uint64_t v4 = [NSNumber numberWithInteger:compatibilityVersion];
  v9[1] = v4;
  v8[2] = @"contentVersion";
  uint64_t v5 = [NSNumber numberWithInteger:self->_contentVersion];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HKCountrySet *)self allCountryCodes];
  id v6 = [v5 componentsJoinedByString:@","];
  id v7 = [NSNumber numberWithInteger:self->_contentVersion];
  uint64_t v8 = [NSNumber numberWithInteger:self->_provenance];
  int64_t v9 = [v3 stringWithFormat:@"<%@ countries=%@ contentVersion=%@ provenance=%@>", v4, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCountrySet;
  if ([(HKCountrySet *)&v11 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      id v7 = v6;
      BOOL v5 = self->_compatibilityVersion == v6[2]
        && self->_contentVersion == v6[3]
        && ((countryBitmasks = self->_countryBitmasks, int64_t v9 = (NSArray *)v7[1], countryBitmasks == v9)
         || v9 && -[NSArray isEqual:](countryBitmasks, "isEqual:"))
        && self->_provenance == v7[4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v2 = self->_contentVersion ^ self->_compatibilityVersion;
  return v2 ^ [(NSArray *)self->_countryBitmasks hash] ^ self->_provenance;
}

- (BOOL)containsCountryCode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() bitmaskPathForCountryCode:v4];

  if (v5)
  {
    id v6 = [(HKCountrySet *)self countryBitmasks];
    id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
    uint64_t v8 = [v7 unsignedLongLongValue];

    BOOL v9 = ([v5 bitmask] & v8) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSArray)allCountryCodes
{
  id v3 = objc_opt_class();
  id v4 = [(HKCountrySet *)self countryBitmasks];
  BOOL v5 = [v3 countryCodesForCountryBitmasks:v4];

  return (NSArray *)v5;
}

- (id)countrySetByIntersectingCountriesInSet:(id)a3
{
  int64_t contentVersion = self->_contentVersion;
  id v5 = a3;
  uint64_t v6 = [v5 contentVersion];
  if (contentVersion >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = contentVersion;
  }
  uint64_t v8 = -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7, &__block_literal_global_44_0);

  return v8;
}

uint64_t __55__HKCountrySet_countrySetByIntersectingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 & a2;
}

- (id)_countrySetByOperatingWithCountriesInSet:(uint64_t)a3 contentVersion:(void *)a4 enumerationBlock:
{
  uint64_t v6 = a4;
  if (a1)
  {
    uint64_t v24 = a1;
    id v7 = *(id *)(a1 + 8);
    uint64_t v8 = [a2 countryBitmasks];
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    unint64_t v10 = [v7 count];
    unint64_t v11 = [v8 count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        id v14 = objc_msgSend(v7, "objectAtIndexedSubscript:", v13, v24);
        uint64_t v15 = [v14 unsignedLongLongValue];

        uint64_t v16 = [v8 objectAtIndexedSubscript:v13];
        uint64_t v17 = [v16 unsignedLongLongValue];

        uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v6[2](v6, v15, v17));
        [v9 addObject:v18];

        ++v13;
        unint64_t v19 = [v7 count];
        unint64_t v20 = [v8 count];
        if (v19 >= v20) {
          unint64_t v21 = v20;
        }
        else {
          unint64_t v21 = v19;
        }
      }
      while (v13 < v21);
    }
    v22 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCountryBitmasks:v9 compatibilityVersion:*(void *)(v24 + 16) contentVersion:a3 provenance:0];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)countrySetByAddingCountriesInSet:(id)a3
{
  int64_t contentVersion = self->_contentVersion;
  id v5 = a3;
  uint64_t v6 = [v5 contentVersion];
  if (contentVersion <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = contentVersion;
  }
  uint64_t v8 = -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7 + 1, &__block_literal_global_46_0);

  return v8;
}

uint64_t __49__HKCountrySet_countrySetByAddingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 | a2;
}

- (id)countrySetByRemovingCountriesInSet:(id)a3
{
  int64_t contentVersion = self->_contentVersion;
  id v5 = a3;
  uint64_t v6 = [v5 contentVersion];
  if (contentVersion <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = contentVersion;
  }
  uint64_t v8 = -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7 + 1, &__block_literal_global_48_0);

  return v8;
}

uint64_t __51__HKCountrySet_countrySetByRemovingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 & ~a3;
}

- (BOOL)isEmpty
{
  return ![(NSArray *)self->_countryBitmasks hk_containsObjectPassingTest:&__block_literal_global_52];
}

BOOL __23__HKCountrySet_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedLongLongValue] != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t compatibilityVersion = self->_compatibilityVersion;
  id v5 = a3;
  [v5 encodeInteger:compatibilityVersion forKey:@"compatibilityVersion"];
  [v5 encodeInteger:self->_contentVersion forKey:@"contentVersion"];
  [v5 encodeObject:self->_countryBitmasks forKey:@"countryBitmasks"];
  [v5 encodeInteger:self->_provenance forKey:@"provenance"];
}

- (HKCountrySet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"countryBitmasks"];

  if ([v6 count] == 5)
  {
    self = -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:](self, "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", v6, [v4 decodeIntegerForKey:@"compatibilityVersion"], objc_msgSend(v4, "decodeIntegerForKey:", @"contentVersion"), objc_msgSend(v4, "decodeIntegerForKey:", @"provenance"));
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)countryBitmasks
{
  return self->_countryBitmasks;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
}

+ (id)regionsWithPlistAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 pathExtension];

  if (!v7) {
    id v8 = (id)[v6 URLByAppendingPathExtension:@"plist"];
  }
  id v16 = 0;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:&v16];
  id v10 = v16;
  unint64_t v11 = v10;
  if (v9)
  {
    unint64_t v12 = +[HKCountrySet _decodePlistDictionary:]((uint64_t)a1, v9);
  }
  else
  {
    id v13 = v10;
    id v14 = v13;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError(v13);
      }
    }

    unint64_t v12 = 0;
  }

  return v12;
}

+ (id)_decodePlistDictionary:(uint64_t)a1
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = [v2 objectForKeyedSubscript:@"AvailableRegionsVersion"];
  id v4 = [v2 objectForKeyedSubscript:@"AvailableRegions"];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v4 objectAtIndexedSubscript:v6];
      unint64_t v12 = 0;
      [v7 getBytes:&v12 length:8];
      unint64_t v12 = bswap64(v12);
      id v8 = [NSNumber numberWithUnsignedLongLong:v12];
      [v5 addObject:v8];

      ++v6;
    }
    while ([v4 count] > v6);
  }
  v13[0] = @"countryBitmasks";
  BOOL v9 = (void *)[v5 copy];
  v13[1] = @"compatibilityVersion";
  v14[0] = v9;
  v14[1] = v3;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v10;
}

+ (id)countrySetWithPlistURL:(id)a3 error:(id *)a4
{
  id v13 = 0;
  id v5 = [a1 regionsWithPlistAtURL:a3 error:&v13];
  id v6 = v13;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [[HKCountrySet alloc] initWithDictionaryRepresentation:v5 provenance:1];
    BOOL v9 = v8;
    if (v8)
    {
      BOOL v9 = v8;
      id v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"Plist contents were in an invalid format");
      id v10 = 0;
    }
  }
  else
  {
    unint64_t v11 = (HKCountrySet *)v6;
    BOOL v9 = v11;
    if (v11)
    {
      if (a4)
      {
        BOOL v9 = v11;
        id v10 = 0;
        *a4 = v9;
        goto LABEL_10;
      }
      _HKLogDroppedError(v11);
    }
    id v10 = 0;
  }
LABEL_10:

  return v10;
}

- (void)initWithCountryBitmasks:(NSObject *)a3 compatibilityVersion:contentVersion:provenance:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  id v6 = NSNumber;
  id v7 = v5;
  id v8 = [v6 numberWithInteger:a2];
  int v9 = 138543618;
  id v10 = v5;
  __int16 v11 = 2114;
  unint64_t v12 = v8;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Attempted to decode unsupported version: %{public}@", (uint8_t *)&v9, 0x16u);
}

@end