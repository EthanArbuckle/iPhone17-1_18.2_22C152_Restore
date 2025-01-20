@interface IKImageElement
+ (BOOL)shouldParseChildDOMElements;
+ (unint64_t)_imageTypeForTagName:(id)a3;
- (IKImageElement)fallbackImageElement;
- (IKImageElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (IKImageElement)initWithOriginalElement:(id)a3;
- (IKImageElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5;
- (IKSrcSetRule)bestRule;
- (NSArray)srcsetRules;
- (NSDictionary)srcset;
- (NSURL)placeholderURL;
- (NSURL)resolvedURL;
- (NSURL)url;
- (UIColor)borderColor;
- (double)aspectRatio;
- (double)height;
- (double)width;
- (int64_t)fill;
- (int64_t)reflect;
- (unint64_t)imageType;
- (unint64_t)position;
- (void)_initCommon;
- (void)_parseSrcset:(id)a3;
- (void)_resolveURL;
- (void)appDocumentDidMarkStylesDirty;
- (void)setBestRule:(id)a3;
- (void)setResolvedURL:(id)a3;
- (void)setSrcsetRules:(id)a3;
@end

@implementation IKImageElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (IKImageElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IKImageElement;
  v9 = [(IKViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = objc_opt_class();
    v11 = [v8 nodeName];
    v9->_imageType = [v10 _imageTypeForTagName:v11];

    [(IKImageElement *)v9 _initCommon];
  }

  return v9;
}

- (IKImageElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKImageElement;
  v9 = [(IKViewElement *)&v11 initWithPrototypeElement:v8 parent:a4 appDataItem:a5];
  if (v9)
  {
    v9->_imageType = [v8 imageType];
    [(IKImageElement *)v9 _initCommon];
  }

  return v9;
}

- (IKImageElement)initWithOriginalElement:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IKImageElement;
  v5 = [(IKViewElement *)&v7 initWithOriginalElement:v4];
  if (v5)
  {
    v5->_imageType = [v4 imageType];
    [(IKImageElement *)v5 _initCommon];
  }

  return v5;
}

- (IKImageElement)fallbackImageElement
{
  if (!self->_fallbackImageElement)
  {
    if ([(NSArray *)self->_srcsetRules count])
    {
      if (self->_bestRule || ([(IKImageElement *)self _resolveURL], self->_bestRule))
      {
        v3 = (void *)[(NSArray *)self->_srcsetRules mutableCopy];
        [v3 removeObject:self->_bestRule];
        if ([v3 count])
        {
          v6[0] = MEMORY[0x1E4F143A8];
          v6[1] = 3221225472;
          v6[2] = __38__IKImageElement_fallbackImageElement__block_invoke;
          v6[3] = &unk_1E6DE40B8;
          v6[4] = self;
          id v7 = v3;
          [(IKViewElement *)self performImplicitUpdates:v6];
        }
      }
    }
  }
  fallbackImageElement = self->_fallbackImageElement;
  return fallbackImageElement;
}

uint64_t __38__IKImageElement_fallbackImageElement__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc((Class)objc_opt_class()) initWithOriginalElement:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 240);
  *(void *)(v3 + 240) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 240);
  uint64_t v7 = *(void *)(v6 + 280);
  *(void *)(v6 + 280) = v5;
  return MEMORY[0x1F41817F8](v5, v7);
}

- (NSURL)url
{
  if (!self->_resolvedURL && [(NSArray *)self->_srcsetRules count]) {
    [(IKImageElement *)self _resolveURL];
  }
  resolvedURL = self->_resolvedURL;
  return resolvedURL;
}

- (double)width
{
  return self->_srcWidth;
}

- (double)height
{
  return self->_srcHeight;
}

- (NSURL)placeholderURL
{
  uint64_t v2 = [(IKViewElement *)self style];
  uint64_t v3 = [v2 imagePlaceholderURL];

  return (NSURL *)v3;
}

- (unint64_t)position
{
  uint64_t v2 = [(IKViewElement *)self style];
  unint64_t v3 = [v2 imagePosition];

  return v3;
}

- (UIColor)borderColor
{
  uint64_t v2 = [(IKViewElement *)self style];
  unint64_t v3 = [v2 ikBorderColor];
  id v4 = [v3 color];

  return (UIColor *)v4;
}

- (int64_t)fill
{
  uint64_t v2 = [(IKViewElement *)self style];
  int64_t v3 = [v2 fillImage];

  return v3;
}

- (int64_t)reflect
{
  uint64_t v2 = [(IKViewElement *)self style];
  int64_t v3 = [v2 reflectImage];

  return v3;
}

- (void)appDocumentDidMarkStylesDirty
{
  v4.receiver = self;
  v4.super_class = (Class)IKImageElement;
  [(IKViewElement *)&v4 appDocumentDidMarkStylesDirty];
  if ([(NSArray *)self->_srcsetRules count])
  {
    [(IKViewElement *)self setUpdateType:4];
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = 0;
  }
}

- (void)_parseSrcset:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_parseSrcset__sOnce != -1) {
    dispatch_once(&_parseSrcset__sOnce, &__block_literal_global_5);
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__9;
  v47 = __Block_byref_object_dispose__9;
  id v48 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  id v42 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  objc_super v4 = (void *)_parseSrcset__sSrcsetRegularExpression;
  [v3 length];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __31__IKImageElement__parseSrcset___block_invoke_29;
  v32 = &unk_1E6DE4C18;
  id v33 = v3;
  v34 = &v49;
  v35 = &v43;
  v36 = &v37;
  id v23 = v33;
  objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:");
  objc_storeStrong((id *)&self->_srcset, (id)v38[5]);
  if (*((unsigned char *)v50 + 24))
  {
    objc_storeStrong((id *)&self->_srcsetRules, (id)v44[5]);
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [v6 scale];
    double v8 = v7;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = (id)v44[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = 0;
      v12 = 0;
      uint64_t v13 = (uint64_t)v8;
      uint64_t v14 = *(void *)v26;
LABEL_7:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        v17 = [v16 descriptor];
        uint64_t v18 = [v17 integerValue];

        if (v18 > v11 || v18 == v13)
        {
          resolvedURL = v16;

          uint64_t v11 = v18;
          v12 = resolvedURL;
          if (v18 == v13) {
            break;
          }
        }
        if (v10 == ++v15)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v53 count:16];
          resolvedURL = v12;
          if (v10) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
    else
    {
      resolvedURL = 0;
    }

    srcsetRules = self->_srcsetRules;
    self->_srcsetRules = 0;

    v21 = [(NSURL *)resolvedURL imageURL];
    v22 = self->_resolvedURL;
    self->_resolvedURL = v21;
  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
}

uint64_t __31__IKImageElement__parseSrcset___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([^\\s,]+)(\\s+[^,]+)?" options:0 error:0];
  v1 = (void *)_parseSrcset__sSrcsetRegularExpression;
  _parseSrcset__sSrcsetRegularExpression = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = _parseSrcset__sWhiteSpaceChars;
  _parseSrcset__sWhiteSpaceChars = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void __31__IKImageElement__parseSrcset___block_invoke_29(uint64_t a1, void *a2)
{
  id v16 = a2;
  if ([v16 numberOfRanges] != 3)
  {
    uint64_t v14 = &stru_1F3E09950;
    goto LABEL_8;
  }
  uint64_t v3 = [v16 rangeAtIndex:1];
  uint64_t v5 = v4;
  uint64_t v6 = [v16 rangeAtIndex:2];
  uint64_t v8 = v7;
  id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
  uint64_t v11 = [v10 stringByTrimmingCharactersInSet:_parseSrcset__sWhiteSpaceChars];
  v12 = (void *)[v9 initWithString:v11];

  if (!v8)
  {
    uint64_t v14 = &stru_1F3E09950;
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
  uint64_t v14 = [v13 stringByTrimmingCharactersInSet:_parseSrcset__sWhiteSpaceChars];

  if (v12)
  {
LABEL_7:
    uint64_t v15 = [[IKSrcSetRule alloc] initWithURL:v12 descriptor:v14];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [(__CFString *)v14 hasSuffix:@"x"] ^ 1;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v15];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v12 forKey:v14];
  }
LABEL_8:
}

+ (unint64_t)_imageTypeForTagName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"img"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"fullscreenImg"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"decorationImage"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_initCommon
{
  id v3 = [(IKViewElement *)self attributes];
  id v23 = [v3 objectForKeyedSubscript:@"width"];

  unint64_t v4 = [(IKViewElement *)self attributes];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"height"];

  uint64_t v6 = [(IKViewElement *)self attributes];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"aspectRatio"];

  char v8 = objc_opt_respondsToSelector();
  double v9 = 0.0;
  double v10 = 0.0;
  if (v8) {
    double v10 = (float)objc_msgSend(v23, "integerValue", 0.0);
  }
  self->_srcWidth = v10;
  if (objc_opt_respondsToSelector()) {
    double v9 = (float)[v5 integerValue];
  }
  self->_srcHeight = v9;
  char v11 = objc_opt_respondsToSelector();
  double v12 = 0.0;
  if (v11) {
    objc_msgSend(v7, "doubleValue", 0.0);
  }
  self->_aspectRatio = v12;
  uint64_t v13 = [(IKViewElement *)self attributes];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"src"];

  uint64_t v15 = [(IKViewElement *)self attributes];
  id v16 = [v15 objectForKeyedSubscript:@"srcset"];

  if ([v16 length])
  {
    v17 = (void *)MEMORY[0x1E4E655C0]();
    [(IKImageElement *)self _parseSrcset:v16];
  }
  if (!-[NSDictionary count](self->_srcset, "count") && !self->_resolvedURL && [v14 length])
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v20 = [v14 stringByTrimmingCharactersInSet:v19];
    v21 = [v18 URLWithString:v20];
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = v21;
  }
}

- (void)_resolveURL
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = v4;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = self;
  id obj = [(IKImageElement *)self srcsetRules];
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = [v11 mediaQuery];
        if (!v12) {
          goto LABEL_8;
        }
        uint64_t v13 = (void *)v12;
        uint64_t v14 = [(IKViewElement *)v27 appDocument];
        uint64_t v15 = [v11 mediaQuery];
        v32 = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        int v17 = [v14 evaluateStyleMediaQueryList:v16];

        if (v17)
        {
LABEL_8:
          uint64_t v18 = [v11 descriptor];
          if ([v18 hasSuffix:@"x"])
          {
            v19 = [v11 descriptor];
            BOOL v20 = [v19 integerValue] == (uint64_t)v5;
          }
          else
          {
            BOOL v20 = 0;
          }

          if (v20 || !v8)
          {
            v21 = v11;

            char v8 = v21;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  bestRule = v27->_bestRule;
  v27->_bestRule = v8;
  id v23 = v8;

  uint64_t v24 = [(IKSrcSetRule *)v23 imageURL];
  resolvedURL = v27->_resolvedURL;
  v27->_resolvedURL = (NSURL *)v24;
}

- (NSDictionary)srcset
{
  return self->_srcset;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (NSURL)resolvedURL
{
  return self->_resolvedURL;
}

- (void)setResolvedURL:(id)a3
{
}

- (NSArray)srcsetRules
{
  return self->_srcsetRules;
}

- (void)setSrcsetRules:(id)a3
{
}

- (IKSrcSetRule)bestRule
{
  return self->_bestRule;
}

- (void)setBestRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestRule, 0);
  objc_storeStrong((id *)&self->_srcsetRules, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_srcset, 0);
  objc_storeStrong((id *)&self->_fallbackImageElement, 0);
}

@end