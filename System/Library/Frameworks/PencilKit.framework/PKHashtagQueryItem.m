@interface PKHashtagQueryItem
- (BOOL)isEqual:(id)a3;
- (CHPrefixQueryItem)coreHandwritingPrefixQueryItem;
- (NSString)hashtagResult;
- (PKHashtagQueryItem)initWithCoreHandwritingPrefixQueryItem:(id)a3;
- (id)baselinePath;
- (id)strokeIdentifiers;
- (unint64_t)hash;
- (void)setCoreHandwritingPrefixQueryItem:(id)a3;
- (void)setHashtagResult:(id)a3;
@end

@implementation PKHashtagQueryItem

- (PKHashtagQueryItem)initWithCoreHandwritingPrefixQueryItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKHashtagQueryItem;
  v5 = [(PKHashtagQueryItem *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(PKHashtagQueryItem *)v5 setCoreHandwritingPrefixQueryItem:v4];
    v7 = [v4 queryResult];
    [(PKHashtagQueryItem *)v6 setHashtagResult:v7];
  }
  return v6;
}

- (id)strokeIdentifiers
{
  return (id)[(CHPrefixQueryItem *)self->_coreHandwritingPrefixQueryItem strokeIdentifiers];
}

- (id)baselinePath
{
  v2 = (void *)MEMORY[0x1E4FB14C0];
  uint64_t v3 = [(CHPrefixQueryItem *)self->_coreHandwritingPrefixQueryItem estimatedBaseline];

  return (id)[v2 bezierPathWithCGPath:v3];
}

- (unint64_t)hash
{
  return [(CHPrefixQueryItem *)self->_coreHandwritingPrefixQueryItem hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKHashtagQueryItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      coreHandwritingPrefixQueryItem = self->_coreHandwritingPrefixQueryItem;
      v6 = [(PKHashtagQueryItem *)v4 coreHandwritingPrefixQueryItem];
      char v7 = [(CHPrefixQueryItem *)coreHandwritingPrefixQueryItem isEqualToPrefixQueryItem:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)hashtagResult
{
  return self->_hashtagResult;
}

- (void)setHashtagResult:(id)a3
{
}

- (CHPrefixQueryItem)coreHandwritingPrefixQueryItem
{
  return self->_coreHandwritingPrefixQueryItem;
}

- (void)setCoreHandwritingPrefixQueryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHandwritingPrefixQueryItem, 0);

  objc_storeStrong((id *)&self->_hashtagResult, 0);
}

@end