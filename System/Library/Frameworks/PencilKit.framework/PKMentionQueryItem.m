@interface PKMentionQueryItem
- (BOOL)isEqual:(id)a3;
- (CHPrefixQueryItem)coreHandwritingPrefixQueryItem;
- (NSString)mentionResult;
- (PKMentionQueryItem)initWithCoreHandwritingPrefixQueryItem:(id)a3;
- (id)baselinePath;
- (id)strokeIdentifiers;
- (unint64_t)hash;
- (void)setCoreHandwritingPrefixQueryItem:(id)a3;
- (void)setMentionResult:(id)a3;
@end

@implementation PKMentionQueryItem

- (PKMentionQueryItem)initWithCoreHandwritingPrefixQueryItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMentionQueryItem;
  v5 = [(PKMentionQueryItem *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(PKMentionQueryItem *)v5 setCoreHandwritingPrefixQueryItem:v4];
    v7 = [v4 queryResult];
    [(PKMentionQueryItem *)v6 setMentionResult:v7];
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
  id v4 = (PKMentionQueryItem *)a3;
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
      v6 = [(PKMentionQueryItem *)v4 coreHandwritingPrefixQueryItem];
      char v7 = [(CHPrefixQueryItem *)coreHandwritingPrefixQueryItem isEqualToPrefixQueryItem:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)mentionResult
{
  return self->_mentionResult;
}

- (void)setMentionResult:(id)a3
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

  objc_storeStrong((id *)&self->_mentionResult, 0);
}

@end