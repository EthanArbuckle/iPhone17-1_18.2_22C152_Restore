@interface EMCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighImpact;
- (BOOL)isPrimary;
- (BOOL)isUncategorized;
- (BOOL)needsRecategorization;
- (EMCategory)initWithCoder:(id)a3;
- (EMCategory)initWithType:(unint64_t)a3 state:(unint64_t)a4;
- (EMCategory)initWithType:(unint64_t)a3 subtype:(unint64_t)a4 isHighImpact:(BOOL)a5 state:(unint64_t)a6;
- (NSString)ef_publicDescription;
- (id)_shortDescription;
- (id)cachedSelf;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)subtype;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubtype:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation EMCategory

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = EMStringFromCategoryType([(EMCategory *)self type]);
  v6 = EMStringFromSubtype([(EMCategory *)self subtype]);
  unint64_t v7 = [(EMCategory *)self state] - 1;
  if (v7 > 3) {
    v8 = @"Uncategorized";
  }
  else {
    v8 = off_1E63E2BA8[v7];
  }
  BOOL v9 = [(EMCategory *)self isHighImpact];
  v10 = &stru_1F1A3DFB0;
  if (v9) {
    v10 = @" (high impact)";
  }
  v11 = [v3 stringWithFormat:@"<%@ %p category:%@ subtype:%@ categorizationState:%@%@>", v4, self, v5, v6, v8, v10];

  return (NSString *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory type](self, "type"), @"EFPropertyKey_type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory subtype](self, "subtype"), @"EFPropertyKey_subtype");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory state](self, "state"), @"EFPropertyKey_state");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMCategory isHighImpact](self, "isHighImpact"), @"EFPropertyKey_isHighImpact");
}

- (BOOL)isUncategorized
{
  return [(EMCategory *)self state] == 0;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EMCategory *)self type];
  unint64_t v4 = 33 * (33 * v3 + [(EMCategory *)self subtype]);
  unint64_t v5 = 33 * (v4 + [(EMCategory *)self state]);
  return v5 + [(EMCategory *)self isHighImpact] + 1185921;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[EMCategory type](self, "type"), v5 == [v4 type])
    && (unint64_t v6 = -[EMCategory subtype](self, "subtype"), v6 == [v4 subtype])
    && (unint64_t v7 = -[EMCategory state](self, "state"), v7 == [v4 state]))
  {
    BOOL v8 = [(EMCategory *)self isHighImpact];
    int v9 = v8 ^ [v4 isHighImpact] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isHighImpact
{
  return self->_isHighImpact;
}

- (EMCategory)initWithType:(unint64_t)a3 subtype:(unint64_t)a4 isHighImpact:(BOOL)a5 state:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)EMCategory;
  v10 = [(EMCategory *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_subtype = a4;
    v10->_isHighImpact = a5;
    v10->_state = a6;
  }
  v12 = [(EMCategory *)v10 cachedSelf];

  return v12;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken != -1) {
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_3);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  unint64_t v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMCategory;
  unint64_t v5 = [(EMCategory *)&v7 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"EFPropertyKey_type"];
    v5->_subtype = [v4 decodeIntegerForKey:@"EFPropertyKey_subtype"];
    v5->_state = [v4 decodeIntegerForKey:@"EFPropertyKey_state"];
    v5->_isHighImpact = [v4 decodeBoolForKey:@"EFPropertyKey_isHighImpact"];
  }

  return v5;
}

void __37__EMCategory_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs;
  cachedSelf_sUniqueObjectIDs = v0;
}

- (EMCategory)initWithType:(unint64_t)a3 state:(unint64_t)a4
{
  return [(EMCategory *)self initWithType:a3 subtype:0 isHighImpact:0 state:a4];
}

- (BOOL)isPrimary
{
  if (![(EMCategory *)self type]) {
    return 1;
  }
  return [(EMCategory *)self isHighImpact];
}

- (BOOL)needsRecategorization
{
  return [(EMCategory *)self state] == 4;
}

- (id)_shortDescription
{
  unint64_t v3 = NSString;
  id v4 = EMShortStringFromCategoryType([(EMCategory *)self type]);
  unint64_t v5 = EMShortStringFromSubtype([(EMCategory *)self subtype]);
  unint64_t v6 = [v3 stringWithFormat:@"(%@,%@)", v4, v5];

  return v6;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end