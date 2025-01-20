@interface MPPropertySet
+ (BOOL)supportsSecureCoding;
+ (MPPropertySet)propertySetWithProperties:(id)a3;
+ (MPPropertySet)propertySetWithRelationships:(id)a3;
+ (id)emptyPropertySet;
- (BOOL)containsPropertySet:(id)a3;
- (BOOL)isEmpty;
- (MPPropertySet)initWithCoder:(id)a3;
- (MPPropertySet)initWithProperties:(id)a3 relationships:(id)a4;
- (NSDictionary)relationships;
- (NSSet)properties;
- (NSString)debugDescription;
- (NSString)description;
- (id)_stateDumpObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertySetByCombiningWithPropertySet:(id)a3;
- (id)propertySetByIntersectingWithPropertySet:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPPropertySet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

+ (MPPropertySet)propertySetWithProperties:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithProperties:v4 relationships:0];

  return (MPPropertySet *)v5;
}

- (MPPropertySet)initWithProperties:(id)a3 relationships:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPPropertySet;
  v8 = [(MPPropertySet *)&v16 init];
  if (v8)
  {
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    properties = v8->_properties;
    v8->_properties = (NSSet *)v10;

    uint64_t v12 = [v7 copy];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v8->_relationships, v14);
  }
  return v8;
}

- (NSDictionary)relationships
{
  return self->_relationships;
}

- (NSSet)properties
{
  return self->_properties;
}

void __58__MPPropertySet_propertySetByIntersectingWithPropertySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v14];
  id v7 = [v6 properties];
  if ([v7 count])
  {
  }
  else
  {
    v8 = [v6 relationships];
    uint64_t v9 = [v8 count];

    if (!v9) {
      goto LABEL_9;
    }
  }
  uint64_t v10 = [v5 propertySetByIntersectingWithPropertySet:v6];
  v11 = [v10 properties];
  if ([v11 count])
  {

LABEL_7:
    [*(id *)(a1 + 40) setObject:v10 forKey:v14];
    goto LABEL_8;
  }
  uint64_t v12 = [v10 relationships];
  uint64_t v13 = [v12 count];

  if (v13) {
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

void __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7];

  if (!v6) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v7];
  }
}

void __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKey:v7];
  v8 = [v6 propertySetByCombiningWithPropertySet:v9];

  [*(id *)(a1 + 40) setObject:v8 forKey:v7];
}

- (id)propertySetByCombiningWithPropertySet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[(NSSet *)self->_properties mutableCopy];
    [v5 unionSet:v4[1]];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationships = self->_relationships;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke;
    v22[3] = &unk_1E57F7950;
    v8 = v4;
    id v23 = v8;
    id v9 = v6;
    id v24 = v9;
    [(NSDictionary *)relationships enumerateKeysAndObjectsUsingBlock:v22];
    uint64_t v10 = (void *)v8[2];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke_2;
    v19 = &unk_1E57F7950;
    v20 = self;
    id v21 = v9;
    id v11 = v9;
    [v10 enumerateKeysAndObjectsUsingBlock:&v16];
    id v12 = objc_alloc((Class)objc_opt_class());
    uint64_t v13 = objc_msgSend(v5, "allObjects", v16, v17, v18, v19, v20);
    id v14 = (MPPropertySet *)[v12 initWithProperties:v13 relationships:v11];
  }
  else
  {
    id v14 = self;
  }

  return v14;
}

- (id)propertySetByIntersectingWithPropertySet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[(NSSet *)self->_properties mutableCopy];
    [v5 intersectSet:v4[1]];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationships = self->_relationships;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __58__MPPropertySet_propertySetByIntersectingWithPropertySet___block_invoke;
    uint64_t v16 = &unk_1E57F7950;
    uint64_t v17 = v4;
    id v18 = v6;
    id v8 = v6;
    [(NSDictionary *)relationships enumerateKeysAndObjectsUsingBlock:&v13];
    id v9 = objc_alloc((Class)objc_opt_class());
    uint64_t v10 = objc_msgSend(v5, "allObjects", v13, v14, v15, v16);
    id v11 = (void *)[v9 initWithProperties:v10 relationships:v8];
  }
  else
  {
    id v11 = [(id)objc_opt_class() emptyPropertySet];
  }

  return v11;
}

+ (id)emptyPropertySet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MPPropertySet_emptyPropertySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyPropertySet_onceToken != -1) {
    dispatch_once(&emptyPropertySet_onceToken, block);
  }
  v2 = (void *)emptyPropertySet_emptyPropertySet;

  return v2;
}

void __37__MPPropertySet_containsPropertySet___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:a2];
  id v8 = v7;
  if (!v7 || ([v7 containsPropertySet:v9] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)containsPropertySet:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  BOOL v6 = 1;
  if (v4)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    id v7 = [v4 properties];
    id v8 = v7;
    if (v7)
    {
      int v9 = [v7 isSubsetOfSet:self->_properties];
      *((unsigned char *)v15 + 24) = v9;
      if (v9)
      {
LABEL_4:
        uint64_t v10 = [v5 relationships];
        id v11 = v10;
        if (v10)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __37__MPPropertySet_containsPropertySet___block_invoke;
          v13[3] = &unk_1E57F7928;
          v13[4] = self;
          v13[5] = &v14;
          [v10 enumerateKeysAndObjectsUsingBlock:v13];
        }

        BOOL v6 = *((unsigned char *)v15 + 24) != 0;
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v15 + 24))
    {
      goto LABEL_4;
    }
    BOOL v6 = 0;
LABEL_9:

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

void __33__MPPropertySet_emptyPropertySet__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithProperties:0 relationships:0];
  v2 = (void *)emptyPropertySet_emptyPropertySet;
  emptyPropertySet_emptyPropertySet = v1;
}

- (id)_stateDumpObject
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = +[MPPropertySet emptyPropertySet];

  if (v3 == self)
  {
    id v7 = @"<EMPTY>";
  }
  else
  {
    v12[0] = @"properties";
    if ([(NSSet *)self->_properties count])
    {
      NSUInteger v4 = [(NSSet *)self->_properties count];
      properties = self->_properties;
      BOOL v6 = v4 == 1;
      if (v4 == 1) {
        [(NSSet *)properties anyObject];
      }
      else {
      int v9 = [(NSSet *)properties allObjects];
      }
      BOOL v8 = v4 != 1;
    }
    else
    {
      BOOL v6 = 0;
      BOOL v8 = 0;
      int v9 = @"<EMPTY>";
    }
    v12[1] = @"relationships";
    v13[0] = v9;
    if ([(NSDictionary *)self->_relationships count]) {
      relationships = self->_relationships;
    }
    else {
      relationships = (NSDictionary *)@"<EMPTY>";
    }
    v13[1] = relationships;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    if (v8) {

    }
    if (v6) {
  }
    }

  return v7;
}

- (BOOL)isEmpty
{
  return ![(NSSet *)self->_properties count] && [(NSDictionary *)self->_relationships count] == 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [MPMutablePropertySet alloc];
  id v5 = [(NSSet *)self->_properties allObjects];
  BOOL v6 = [(MPMutablePropertySet *)v4 initWithProperties:v5 relationships:self->_relationships];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPPropertySet)propertySetWithRelationships:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithProperties:0 relationships:v4];

  return (MPPropertySet *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  properties = self->_properties;
  id v6 = a3;
  id v5 = [(NSSet *)properties allObjects];
  [v6 encodeObject:v5 forKey:@"MPPropertySetProperties"];

  [v6 encodeObject:self->_relationships forKey:@"MPPropertySetRelationships"];
}

- (MPPropertySet)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  BOOL v8 = [v5 decodeObjectOfClasses:v7 forKey:@"MPPropertySetProperties"];

  int v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  uint64_t v13 = [v5 decodeObjectOfClasses:v12 forKey:@"MPPropertySetRelationships"];

  uint64_t v14 = [(MPPropertySet *)self initWithProperties:v8 relationships:v13];
  return v14;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  NSUInteger v7 = [(NSSet *)self->_properties count];
  if (v7)
  {
    BOOL v8 = @"properties";
    if (v7 == 1) {
      BOOL v8 = @"property";
    }
    [v6 appendFormat:@"; %lu %@", v7, v8];
  }
  NSUInteger v9 = [(NSDictionary *)self->_relationships count];
  if (v9)
  {
    uint64_t v10 = @"relationships";
    if (v9 == 1) {
      uint64_t v10 = @"relationship";
    }
    [v6 appendFormat:@"; %lu %@", v9, v10];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  NSUInteger v7 = [(NSSet *)self->_properties count];
  unint64_t v8 = v7;
  NSUInteger v9 = @"properties";
  if (v7 == 1) {
    NSUInteger v9 = @"property";
  }
  [v6 appendFormat:@"; %lu %@", v7, v9];
  [v6 appendString:@": ["];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = self->_properties;
  uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (v8 < 2)
        {
          if (*((unsigned char *)v33 + 24)) {
            v15 = @",";
          }
          else {
            v15 = &stru_1EE680640;
          }
        }
        else
        {
          [v6 appendString:@"\n    "];
          *((unsigned char *)v33 + 24) = 1;
          v15 = @",";
        }
        [v6 appendFormat:@"%@%@", v14, v15];
      }
      uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v11);
  }

  if (*((unsigned char *)v33 + 24)) {
    [v6 appendString:@"\n"];
  }
  [v6 appendString:@"]"];
  NSUInteger v16 = [(NSDictionary *)self->_relationships count];
  NSUInteger v17 = v16;
  if (v16)
  {
    if (*((unsigned char *)v33 + 24)) {
      id v18 = @"\n";
    }
    else {
      id v18 = @" ";
    }
    v19 = @"relationships";
    if (v16 == 1) {
      v19 = @"relationship";
    }
    [v6 appendFormat:@";%@%lu %@", v18, v16, v19];
    [v6 appendString:@": {"];
    relationships = self->_relationships;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __33__MPPropertySet_debugDescription__block_invoke;
    v24[3] = &unk_1E57F7900;
    v26 = &v32;
    NSUInteger v27 = v17;
    id v21 = v6;
    id v25 = v21;
    [(NSDictionary *)relationships enumerateKeysAndObjectsUsingBlock:v24];
    if (*((unsigned char *)v33 + 24)) {
      v22 = @"\n";
    }
    else {
      v22 = @" ";
    }
    [v21 appendFormat:@"%@", v22];
    [v21 appendString:@"}"];
  }
  [v6 appendString:@">"];
  _Block_object_dispose(&v32, 8);

  return (NSString *)v6;
}

void __33__MPPropertySet_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || *(void *)(a1 + 48) >= 2uLL)
  {
    [*(id *)(a1 + 32) appendString:@"\n    "];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) appendString:@" "];
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n    "];
  uint64_t v7 = [v14 length];
  if (v7)
  {
    uint64_t v8 = v7;
    do
    {
      [v6 appendString:@" "];
      --v8;
    }
    while (v8);
  }
  [v6 appendString:@"  "];
  NSUInteger v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v5 debugDescription];
  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:v6];
  uint64_t v12 = (void *)v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v13 = @",";
  }
  else {
    uint64_t v13 = &stru_1EE680640;
  }
  [v9 appendFormat:@"%@: %@%@", v14, v11, v13];
}

@end