@interface PKProofreadingQueryItem
- (BOOL)isEqual:(id)a3;
- (CHTextCheckingQueryItem)coreHandwritingTextCheckingQueryItem;
- (NSArray)replacementStrings;
- (PKProofreadingQueryItem)initWithCoreHandwritingTextCheckingQueryItem:(id)a3;
- (id)baselinePath;
- (id)strokeIdentifiers;
- (int)resultType;
- (unint64_t)hash;
- (void)setCoreHandwritingTextCheckingQueryItem:(id)a3;
@end

@implementation PKProofreadingQueryItem

- (PKProofreadingQueryItem)initWithCoreHandwritingTextCheckingQueryItem:(id)a3
{
  v4 = (CHTextCheckingQueryItem *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProofreadingQueryItem;
  v5 = [(PKProofreadingQueryItem *)&v8 init];
  coreHandwritingTextCheckingQueryItem = v5->_coreHandwritingTextCheckingQueryItem;
  v5->_coreHandwritingTextCheckingQueryItem = v4;

  return v5;
}

- (id)strokeIdentifiers
{
  return (id)[(CHTextCheckingQueryItem *)self->_coreHandwritingTextCheckingQueryItem strokeIdentifiers];
}

- (id)baselinePath
{
  v2 = (void *)MEMORY[0x1E4FB14C0];
  uint64_t v3 = [(CHTextCheckingQueryItem *)self->_coreHandwritingTextCheckingQueryItem estimatedBaseline];

  return (id)[v2 bezierPathWithCGPath:v3];
}

- (NSArray)replacementStrings
{
  return (NSArray *)[(CHTextCheckingQueryItem *)self->_coreHandwritingTextCheckingQueryItem replacementStrings];
}

- (int)resultType
{
  return [(CHTextCheckingQueryItem *)self->_coreHandwritingTextCheckingQueryItem textCheckingResultType];
}

- (unint64_t)hash
{
  return [(CHTextCheckingQueryItem *)self->_coreHandwritingTextCheckingQueryItem hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKProofreadingQueryItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      coreHandwritingTextCheckingQueryItem = self->_coreHandwritingTextCheckingQueryItem;
      v6 = [(PKProofreadingQueryItem *)v4 coreHandwritingTextCheckingQueryItem];
      char v7 = [(CHTextCheckingQueryItem *)coreHandwritingTextCheckingQueryItem isEqualToTextCheckingQueryItem:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (CHTextCheckingQueryItem)coreHandwritingTextCheckingQueryItem
{
  return self->_coreHandwritingTextCheckingQueryItem;
}

- (void)setCoreHandwritingTextCheckingQueryItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end