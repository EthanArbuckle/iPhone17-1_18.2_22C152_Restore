@interface IKSrcSetRule
- (IKSrcSetRule)initWithURL:(id)a3 descriptor:(id)a4;
- (IKStyleMediaQuery)mediaQuery;
- (NSString)descriptor;
- (NSURL)imageURL;
- (void)_parseDescriptor:(id)a3;
- (void)_parseMediaQueryDescriptor:(id)a3;
- (void)_parseResolutionDescriptor:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setMediaQuery:(id)a3;
@end

@implementation IKSrcSetRule

- (IKSrcSetRule)initWithURL:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKSrcSetRule;
  v8 = [(IKSrcSetRule *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IKSrcSetRule *)v8 setImageURL:v6];
    if ([v7 length]) {
      [(IKSrcSetRule *)v9 _parseDescriptor:v7];
    }
  }

  return v9;
}

- (void)_parseDescriptor:(id)a3
{
  id v4 = a3;
  [(IKSrcSetRule *)self setDescriptor:v4];
  if (objc_msgSend(v4, "hasPrefix:", @"(")
    && [v4 hasSuffix:@""]))
  {
    [(IKSrcSetRule *)self _parseMediaQueryDescriptor:v4];
  }
  else
  {
    [(IKSrcSetRule *)self _parseResolutionDescriptor:v4];
  }
}

- (void)_parseMediaQueryDescriptor:(id)a3
{
  id v12 = a3;
  id v4 = [[IKCSSTokenizer alloc] initWithText:v12];
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(IKCSSTokenizer *)v4 getNextToken];
  if ([v6 type] == 2)
  {
    id v7 = v6;
  }
  else
  {
    do
    {
      [(IKCSSTokenizer *)v4 reconsumeToken:v6];
      v8 = +[IKCSSParser consumeComponentValue:v4];
      [v5 addObject:v8];

      id v7 = [(IKCSSTokenizer *)v4 getNextToken];

      id v6 = v7;
    }
    while ([v7 type] != 2);
  }
  if ([v5 count])
  {
    v9 = +[IKCSSMediaQuery mediaQueryFromTokenList:v5];
    v10 = +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:v9];
    objc_super v11 = [v10 firstObject];

    [(IKSrcSetRule *)self setMediaQuery:v11];
  }
}

- (void)_parseResolutionDescriptor:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = @"1x";
  id v6 = @"2x";
  if (([v4 isEqualToString:@"2x"] & 1) != 0
    || (id v6 = @"3x", [v4 isEqualToString:@"3x"]))
  {
    id v7 = v6;

    v5 = v7;
  }
  v10 = @"min-pixel-ratio";
  v11[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = [[IKStyleMediaQuery alloc] initWithMediaType:@"all" featureValues:v8 isNegated:0];
  [(IKSrcSetRule *)self setMediaQuery:v9];
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (IKStyleMediaQuery)mediaQuery
{
  return self->_mediaQuery;
}

- (void)setMediaQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQuery, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end