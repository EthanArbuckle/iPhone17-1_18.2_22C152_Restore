@interface CNPair
+ (BOOL)supportsSecureCoding;
+ (CNPair)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CNPair)initWithCoder:(id)a3;
- (CNPair)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (id)first;
- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4;
- (id)second;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNPair

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);

  objc_storeStrong(&self->_first, 0);
}

+ (CNPair)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithFirst:v7 second:v6];

  return (CNPair *)v8;
}

- (CNPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 == (id)MEMORY[0x1E4F1CC38] && v7 == 0)
  {
    if (initWithFirst_second__cn_once_token_1 != -1) {
      dispatch_once(&initWithFirst_second__cn_once_token_1, &__block_literal_global_33);
    }
    v11 = (CNPair *)initWithFirst_second__cn_once_object_1;
  }
  else if (v6 == (id)MEMORY[0x1E4F1CC28] && v7 == 0)
  {
    if (initWithFirst_second__cn_once_token_2 != -1) {
      dispatch_once(&initWithFirst_second__cn_once_token_2, &__block_literal_global_2_1);
    }
    v11 = (CNPair *)initWithFirst_second__cn_once_object_2;
  }
  else
  {
    v11 = [(CNPair *)self initNonMemoizedWithFirst:v6 second:v7];
    self = v11;
  }
  v12 = v11;

  return v12;
}

- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPair;
  v9 = [(CNPair *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(p_isa + 2, a4);
    v11 = p_isa;
  }

  return p_isa;
}

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
}

uint64_t __31__CNPair_initWithFirst_second___block_invoke()
{
  v0 = [CNPair alloc];
  initWithFirst_second__cn_once_object_1 = [(CNPair *)v0 initNonMemoizedWithFirst:MEMORY[0x1E4F1CC38] second:0];

  return MEMORY[0x1F41817F8]();
}

uint64_t __31__CNPair_initWithFirst_second___block_invoke_2()
{
  v0 = [CNPair alloc];
  initWithFirst_second__cn_once_object_2 = [(CNPair *)v0 initNonMemoizedWithFirst:MEMORY[0x1E4F1CC28] second:0];

  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(CNPair *)self first];
  id v5 = (id)[v3 appendName:@"first" object:v4];

  id v6 = [(CNPair *)self second];
  id v7 = (id)[v3 appendName:@"second" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CNPair *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (unint64_t first = (unint64_t)self->_first, first | (unint64_t)v4->_first)
      && !objc_msgSend((id)first, "isEqual:")
      || (unint64_t second = (unint64_t)self->_second, second | (unint64_t)v4->_second)
      && !objc_msgSend((id)second, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  aBlock[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __14__CNPair_hash__block_invoke;
  v6[3] = &unk_1E56A0070;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __14__CNPair_hash__block_invoke_2;
  aBlock[3] = &unk_1E56A0070;
  v2 = _Block_copy(aBlock);
  unint64_t v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __14__CNPair_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) first];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

unint64_t __14__CNPair_hash__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) second];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPair)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"first"];
  id v6 = [v4 decodeObjectForKey:@"second"];

  BOOL v7 = [(CNPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPair *)self first];
  [v4 encodeObject:v5 forKey:@"first"];

  id v6 = [(CNPair *)self second];
  [v4 encodeObject:v6 forKey:@"second"];
}

@end