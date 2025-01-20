@interface IKCSSRule
- (IKCSSDeclarationList)declarationList;
- (IKCSSMediaQuery)mediaQuery;
- (IKCSSSelectorList)selectorList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDeclarationList:(id)a3;
- (void)setSelectorList:(id)a3;
@end

@implementation IKCSSRule

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(IKCSSRule *)self declarationList];
  v6 = (void *)[v5 copy];
  [v4 setDeclarationList:v6];

  v7 = [(IKCSSRule *)self selectorList];
  v8 = (void *)[v7 copy];
  [v4 setSelectorList:v8];

  return v4;
}

- (IKCSSMediaQuery)mediaQuery
{
  return 0;
}

- (id)description
{
  v3 = [(IKCSSRule *)self selectorList];

  if (v3)
  {
    v4 = [(IKCSSRule *)self selectorList];
    v5 = [v4 description];
  }
  else
  {
    v5 = @"null";
  }
  v6 = [(IKCSSRule *)self declarationList];

  if (v6)
  {
    v7 = [(IKCSSRule *)self declarationList];
    v8 = [v7 description];
  }
  else
  {
    v8 = @"null";
  }
  v9 = [NSString stringWithFormat:@"{selectorList: %@, declarationList: %@}", v5, v8];

  return v9;
}

- (IKCSSSelectorList)selectorList
{
  return self->_selectorList;
}

- (void)setSelectorList:(id)a3
{
}

- (IKCSSDeclarationList)declarationList
{
  return self->_declarationList;
}

- (void)setDeclarationList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationList, 0);
  objc_storeStrong((id *)&self->_selectorList, 0);
}

@end