@interface MKTransitInfoPreload
- (MKTransitInfoPreload)initWithAttributedString:(id)a3;
- (NSAttributedString)attributedString;
@end

@implementation MKTransitInfoPreload

- (MKTransitInfoPreload)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoPreload;
  v5 = [(MKTransitInfoPreload *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;
  }
  return v5;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
}

@end