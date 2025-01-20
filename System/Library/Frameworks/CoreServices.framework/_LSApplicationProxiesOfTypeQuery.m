@interface _LSApplicationProxiesOfTypeQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithType:(unint64_t)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (_LSApplicationProxiesOfTypeQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationProxiesOfTypeQuery

- (_LSApplicationProxiesOfTypeQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  v5 = [(_LSQuery *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

+ (id)queryWithType:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc((Class)a1) _init];
  if (v4) {
    v4[2] = a3;
  }

  return v4;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(_LSApplicationProxiesOfTypeQuery *)self type];
  if (v6 >= 3) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = *off_1E522D9C0[v6];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70___LSApplicationProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke;
  v9[3] = &unk_1E522D958;
  v10 = v7;
  v8 = v7;
  yieldAppsMatchingSearch(v5, v9);
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  if ([(_LSQuery *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 type];
    if (v6 == [(_LSApplicationProxiesOfTypeQuery *)self type])
    {
      int v7 = [v5 isLegacy];
      int v8 = v7 ^ [(_LSQuery *)self isLegacy] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_LSApplicationProxiesOfTypeQuery *)self type];
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  return [(_LSQuery *)&v5 hash] | (v3 << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  [(_LSQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[_LSApplicationProxiesOfTypeQuery type](self, "type"), @"type");
}

- (unint64_t)type
{
  return self->_type;
}

@end