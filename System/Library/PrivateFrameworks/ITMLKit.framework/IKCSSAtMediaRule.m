@interface IKCSSAtMediaRule
- (IKCSSAtMediaRule)initWithMediaQuery:(id)a3;
- (_NSRange)queryRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mediaQuery;
- (void)setQueryRange:(_NSRange)a3;
@end

@implementation IKCSSAtMediaRule

- (IKCSSAtMediaRule)initWithMediaQuery:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKCSSAtMediaRule;
  v6 = [(IKCSSAtMediaRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaQuery, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IKCSSAtMediaRule;
  v4 = [(IKCSSRule *)&v8 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_mediaQuery);
  uint64_t v5 = [(IKCSSAtMediaRule *)self queryRange];
  objc_msgSend(v4, "setQueryRange:", v5, v6);
  return v4;
}

- (id)mediaQuery
{
  return self->_mediaQuery;
}

- (id)description
{
  v3 = [(IKCSSRule *)self selectorList];

  if (v3)
  {
    v4 = [(IKCSSRule *)self selectorList];
    uint64_t v5 = [v4 description];
  }
  else
  {
    uint64_t v5 = @"null";
  }
  uint64_t v6 = [(IKCSSRule *)self declarationList];

  if (v6)
  {
    v7 = [(IKCSSRule *)self declarationList];
    objc_super v8 = [v7 description];
  }
  else
  {
    objc_super v8 = @"null";
  }
  objc_super v9 = NSString;
  v15.location = [(IKCSSAtMediaRule *)self queryRange];
  v10 = NSStringFromRange(v15);
  v11 = [(IKCSSAtMediaRule *)self mediaQuery];
  v12 = [v9 stringWithFormat:@"{mediaQuery: (%@) \"%@\", selectorList: %@, declarationList: %@}", v10, v11, v5, v8];

  return v12;
}

- (_NSRange)queryRange
{
  p_queryRange = &self->_queryRange;
  NSUInteger location = self->_queryRange.location;
  NSUInteger length = p_queryRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setQueryRange:(_NSRange)a3
{
  self->_queryRange = a3;
}

- (void).cxx_destruct
{
}

@end