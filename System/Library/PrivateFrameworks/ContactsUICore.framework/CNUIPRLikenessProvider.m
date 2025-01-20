@interface CNUIPRLikenessProvider
- (CNUIPRLikenessProvider)initWithPRLikeness:(id)a3;
- (PRLikeness)likeness;
- (unint64_t)_cnui_likenessType;
@end

@implementation CNUIPRLikenessProvider

- (PRLikeness)likeness
{
  return self->_likeness;
}

- (void).cxx_destruct
{
}

- (CNUIPRLikenessProvider)initWithPRLikeness:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIPRLikenessProvider;
  v6 = [(CNUIPRLikenessProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_likeness, a3);
  }

  return v7;
}

- (unint64_t)_cnui_likenessType
{
  v2 = [(CNUIPRLikenessProvider *)self likeness];
  unint64_t v3 = [v2 type];

  return v3;
}

@end