@interface DDSAttributeFilter
+ (BOOL)supportsSecureCoding;
+ (id)attributeFilter;
+ (id)attributeFilterWithDictionary:(id)a3;
+ (unint64_t)hashDictionary:(id)a3;
+ (unint64_t)hashObject:(id)a3;
+ (unint64_t)hashSet:(id)a3;
- (BOOL)doesContainAttributes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryFilter:(id)a3;
- (DDSAttributeFilter)init;
- (DDSAttributeFilter)initWithCoder:(id)a3;
- (DDSAttributeFilter)initWithDictionary:(id)a3;
- (NSMutableDictionary)filters;
- (id)_setForKey:(id)a3;
- (id)allowedValuesForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dumpDescription;
- (id)entriesMatchingAttributes:(id)a3;
- (unint64_t)hash;
- (void)addAllowedValue:(id)a3 forKey:(id)a4;
- (void)addAllowedValues:(id)a3 forKey:(id)a4;
- (void)addEntriesFromFilter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllowedValuesAndKeys:(id)a3;
- (void)removeAllowedValue:(id)a3 forKey:(id)a4;
- (void)removeAllowedValues:(id)a3 forKey:(id)a4;
- (void)setFilters:(id)a3;
@end

@implementation DDSAttributeFilter

- (void).cxx_destruct
{
}

- (void)addAllowedValue:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(DDSAttributeFilter *)self _setForKey:a4];
    [v7 addObject:v6];
  }
}

+ (id)attributeFilter
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithDictionary:MEMORY[0x1E4F1CC08]];
  return v3;
}

- (id)description
{
  if (DDS_LOG_REDACTED())
  {
    v3 = NSString;
    v4 = [(DDSAttributeFilter *)self filters];
    [v3 stringWithFormat:@"<filter: %@>", v4];
  }
  else
  {
    v5 = [(DDSAttributeFilter *)self filters];
    v4 = (void *)[v5 mutableCopy];

    id v6 = [v4 objectForKey:@"AssetRegion"];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"<redacted>"];
      [v4 setObject:v7 forKey:@"AssetRegion"];
    }
    [NSString stringWithFormat:@"<filter: %@>", v4];
  v8 = };

  return v8;
}

- (DDSAttributeFilter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSAttributeFilter;
  v5 = [(DDSAttributeFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    filters = v5->_filters;
    v5->_filters = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = objc_opt_class();
  id v4 = [(DDSAttributeFilter *)self filters];
  unint64_t v5 = [v3 hashObject:v4];

  return v5;
}

- (id)_setForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DDSAttributeFilter *)self filters];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = [(DDSAttributeFilter *)self filters];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (NSMutableDictionary)filters
{
  return self->_filters;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [DDSAttributeFilter alloc];
  unint64_t v5 = [(DDSAttributeFilter *)self filters];
  uint64_t v6 = (void *)[v5 copy];
  id v7 = [(DDSAttributeFilter *)v4 initWithDictionary:v6];

  return v7;
}

+ (unint64_t)hashSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 77239;
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
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 *= [(id)objc_opt_class() hashObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

void __37__DDSAttributeFilter_hashDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [(id)objc_opt_class() hashObject:v7];

  uint64_t v9 = [(id)objc_opt_class() hashObject:v6];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8 * v5 * v9;
}

+ (unint64_t)hashObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(id)objc_opt_class() hashDictionary:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [(id)objc_opt_class() hashSet:v3];
    }
    else {
      uint64_t v4 = [v3 hash];
    }
  }
  if (v4) {
    unint64_t v5 = 57097 * v4;
  }
  else {
    unint64_t v5 = 0x1A2CCD34BLL;
  }

  return v5;
}

+ (unint64_t)hashDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 65537;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__DDSAttributeFilter_hashDictionary___block_invoke;
  v7[3] = &unk_1E6E3A0D8;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)attributeFilterWithDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DDSAttributeFilter)init
{
  return 0;
}

- (id)allowedValuesForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DDSAttributeFilter *)self filters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)enumerateAllowedValuesAndKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(DDSAttributeFilter *)self filters];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__DDSAttributeFilter_enumerateAllowedValuesAndKeys___block_invoke;
    v6[3] = &unk_1E6E3A038;
    id v7 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __52__DDSAttributeFilter_enumerateAllowedValuesAndKeys___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEntriesFromFilter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__DDSAttributeFilter_addEntriesFromFilter___block_invoke;
  v3[3] = &unk_1E6E3A060;
  v3[4] = self;
  [a3 enumerateAllowedValuesAndKeys:v3];
}

uint64_t __43__DDSAttributeFilter_addEntriesFromFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addAllowedValues:a3 forKey:a2];
}

- (id)entriesMatchingAttributes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__DDSAttributeFilter_entriesMatchingAttributes___block_invoke;
  v11[3] = &unk_1E6E3A088;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(DDSAttributeFilter *)self enumerateAllowedValuesAndKeys:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __48__DDSAttributeFilter_entriesMatchingAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:v8];
  LODWORD(v5) = [v6 containsObject:v7];

  if (v5) {
    [*(id *)(a1 + 40) setObject:v7 forKey:v8];
  }
}

- (BOOL)doesContainAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__DDSAttributeFilter_doesContainAttributes___block_invoke;
  v6[3] = &unk_1E6E3A0B0;
  void v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __44__DDSAttributeFilter_doesContainAttributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) allowedValuesForKey:a2];
  id v8 = v7;
  if (!v7 || ([v7 containsObject:v9] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)addAllowedValues:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    uint64_t v7 = [(DDSAttributeFilter *)self _setForKey:v6];
    [v7 unionSet:v8];
  }
}

- (void)removeAllowedValue:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(DDSAttributeFilter *)self _setForKey:a4];
    [v7 removeObject:v6];
  }
}

- (void)removeAllowedValues:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    id v7 = [(DDSAttributeFilter *)self _setForKey:v6];
    [v7 minusSet:v8];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(DDSAttributeFilter *)self filters];
  unint64_t v5 = NSStringFromSelector(sel_filters);
  [v4 encodeObject:v6 forKey:v5];
}

- (DDSAttributeFilter)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DDSAttributeFilter;
  unint64_t v5 = [(DDSAttributeFilter *)&v18 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    id v9 = [v7 setWithArray:v8];

    char v10 = NSStringFromSelector(sel_filters);
    id v17 = 0;
    uint64_t v11 = [v4 decodeTopLevelObjectOfClasses:v9 forKey:v10 error:&v17];
    id v12 = v17;
    filters = v5->_filters;
    v5->_filters = (NSMutableDictionary *)v11;

    id v6 = v5;
    if (v12)
    {
      v14 = DefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DDSAttributeFilter initWithCoder:](sel_filters, v14);
      }

      id v6 = 0;
    }
  }
  uint64_t v15 = v6;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dumpDescription
{
  if (DDS_IS_INTERNAL_INSTALL())
  {
    id v3 = NSString;
    id v4 = [(DDSAttributeFilter *)self filters];
    unint64_t v5 = [v3 stringWithFormat:@"<filter: %@>", v4];
  }
  else
  {
    unint64_t v5 = &stru_1F3FA8828;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(DDSAttributeFilter *)self isEqualToQueryFilter:v4];

  return v5;
}

- (BOOL)isEqualToQueryFilter:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAttributeFilter *)self filters];
  id v6 = [v4 filters];

  LOBYTE(v4) = DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6);
  return (char)v4;
}

- (void)setFilters:(id)a3
{
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSelector(a1);
  int v4 = 138543362;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Error decoding object for key %{public}@", (uint8_t *)&v4, 0xCu);
}

@end