@interface MPModelGenericObjectKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithRelationshipKinds:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelGenericObjectKind)initWithCoder:(id)a3;
- (NSDictionary)relationshipKinds;
- (id)humanDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelGenericObjectKind

- (void).cxx_destruct
{
}

- (NSDictionary)relationshipKinds
{
  return self->_relationshipKinds;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelGenericObjectKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipKinds, @"relationshipKinds", v5.receiver, v5.super_class);
}

- (MPModelGenericObjectKind)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"relationshipKinds"];

  if (v9)
  {
    v10 = +[MPModelGenericObjectKind kindWithRelationshipKinds:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelGenericObjectKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    char v5 = [(NSDictionary *)self->_relationshipKinds isEqual:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelGenericObjectKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(NSDictionary *)self->_relationshipKinds hash] ^ v3;
}

- (id)humanDescription
{
  NSUInteger v3 = [(NSDictionary *)self->_relationshipKinds count];
  id v4 = NSString;
  objc_super v5 = [(NSDictionary *)self->_relationshipKinds allValues];
  uint64_t v6 = v5;
  if (v3 == 1)
  {
    objc_super v7 = [v5 firstObject];
    v8 = [v7 humanDescription];
    [v4 stringWithFormat:@"generic %@", v8];
  }
  else
  {
    objc_super v7 = [v5 valueForKeyPath:@"humanDescription"];
    v8 = [v7 componentsJoinedByString:@"; or "];
    [v4 stringWithFormat:@"any generic (%@)", v8];
  v9 = };

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)kindWithRelationshipKinds:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] stringWithString:@"GenericObject:k"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v4 allKeys];
  objc_super v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v4 objectForKeyedSubscript:v12];
        [v5 appendFormat:@"%@-%p", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v14 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__MPModelGenericObjectKind_kindWithRelationshipKinds___block_invoke;
  v18[3] = &unk_1E57F5870;
  id v19 = v4;
  id v15 = v4;
  v16 = [a1 kindWithModelClass:v14 cacheKey:v5 block:v18];

  return v16;
}

void __54__MPModelGenericObjectKind_kindWithRelationshipKinds___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  NSUInteger v3 = a2;
  uint64_t v4 = [v2 copy];
  id v5 = (id)v3[2];
  v3[2] = v4;
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end