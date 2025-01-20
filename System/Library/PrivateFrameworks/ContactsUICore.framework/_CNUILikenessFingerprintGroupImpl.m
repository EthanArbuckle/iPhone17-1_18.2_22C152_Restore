@interface _CNUILikenessFingerprintGroupImpl
- (BOOL)hasContactIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNUILikenessRenderingScope)scope;
- (NSArray)badges;
- (NSArray)impls;
- (NSString)description;
- (_CNUILikenessFingerprintGroupImpl)initWithImpls:(id)a3 scope:(id)a4 badges:(id)a5;
- (unint64_t)hash;
@end

@implementation _CNUILikenessFingerprintGroupImpl

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F335E8] arrayHash:self->_impls];
  uint64_t v4 = [MEMORY[0x263F335E8] objectHash:self->_scope] - v3 + 32 * v3;
  return [MEMORY[0x263F335E8] objectHash:self->_badges] - v4 + 32 * v4 + 506447;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_CNUILikenessFingerprintGroupImpl *)a3;
  BOOL v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (impls = self->_impls, (unint64_t)impls | (unint64_t)v4->_impls)
      && !-[NSArray isEqual:](impls, "isEqual:")
      || (scope = self->_scope, (unint64_t)scope | (unint64_t)v4->_scope)
      && !-[CNUILikenessRenderingScope isEqual:](scope, "isEqual:")
      || (badges = self->_badges, (unint64_t)badges | (unint64_t)v4->_badges)
      && !-[NSArray isEqual:](badges, "isEqual:"))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_impls, 0);
}

- (_CNUILikenessFingerprintGroupImpl)initWithImpls:(id)a3 scope:(id)a4 badges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CNUILikenessFingerprintGroupImpl;
  v11 = [(_CNUILikenessFingerprintGroupImpl *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    impls = v11->_impls;
    v11->_impls = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    scope = v11->_scope;
    v11->_scope = (CNUILikenessRenderingScope *)v14;

    uint64_t v16 = [v10 copy];
    badges = v11->_badges;
    v11->_badges = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(NSArray *)self->_impls _cn_map:&__block_literal_global_198];
  id v5 = (id)[v3 appendName:@"impls" object:v4];
  id v6 = (id)[v3 appendName:@"scope" object:self->_scope];
  id v7 = (id)[v3 appendName:@"badges" object:self->_badges];
  id v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  id v4 = a3;
  impls = self->_impls;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58___CNUILikenessFingerprintGroupImpl_hasContactIdentifier___block_invoke;
  v8[3] = &unk_2640175B0;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(impls) = [(NSArray *)impls _cn_any:v8];

  return (char)impls;
}

- (NSArray)impls
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (CNUILikenessRenderingScope)scope
{
  return (CNUILikenessRenderingScope *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)badges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

@end