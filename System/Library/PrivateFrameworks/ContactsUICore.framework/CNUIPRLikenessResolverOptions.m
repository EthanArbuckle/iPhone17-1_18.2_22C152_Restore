@interface CNUIPRLikenessResolverOptions
- (CNUIPRLikenessResolverOptions)initWithMonogramColor:(id)a3;
- (PRMonogramColor)monogramColor;
@end

@implementation CNUIPRLikenessResolverOptions

- (CNUIPRLikenessResolverOptions)initWithMonogramColor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIPRLikenessResolverOptions;
  v6 = [(CNUIPRLikenessResolverOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monogramColor, a3);
    v8 = v7;
  }

  return v7;
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (void).cxx_destruct
{
}

@end