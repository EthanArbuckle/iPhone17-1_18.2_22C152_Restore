@interface IKSrcsetParser
- (IKSrcsetParser)initWithSrcsetStr:(id)a3 defaultStr:(id)a4;
- (NSURL)resolvedURL;
@end

@implementation IKSrcsetParser

- (IKSrcsetParser)initWithSrcsetStr:(id)a3 defaultStr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)IKSrcsetParser;
  v8 = [(IKSrcsetParser *)&v25 init];
  if (v8)
  {
    if (initWithSrcsetStr_defaultStr__sOnce != -1) {
      dispatch_once(&initWithSrcsetStr_defaultStr__sOnce, &__block_literal_global_15);
    }
    v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    if ([v6 length])
    {
      v10 = (void *)initWithSrcsetStr_defaultStr__sSrcsetRegularExpression;
      uint64_t v11 = [v6 length];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke_2;
      v22 = &unk_1E6DE5910;
      id v23 = v6;
      id v24 = v9;
      objc_msgSend(v10, "enumerateMatchesInString:options:range:usingBlock:", v23, 0, 0, v11, &v19);
    }
    if (objc_msgSend(v7, "length", v19, v20, v21, v22))
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v13 = [v7 stringByTrimmingCharactersInSet:initWithSrcsetStr_defaultStr__sWhiteSpaceChars];
      v14 = (void *)[v12 initWithString:v13];

      v15 = [[IKSrcSetRule alloc] initWithURL:v14 descriptor:0];
      [v9 addObject:v15];
    }
    uint64_t v16 = [v9 copy];
    srcsetRules = v8->_srcsetRules;
    v8->_srcsetRules = (NSArray *)v16;
  }
  return v8;
}

uint64_t __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([^\\s,]+)(\\s+[^,]+)?" options:0 error:0];
  v1 = (void *)initWithSrcsetStr_defaultStr__sSrcsetRegularExpression;
  initWithSrcsetStr_defaultStr__sSrcsetRegularExpression = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = initWithSrcsetStr_defaultStr__sWhiteSpaceChars;
  initWithSrcsetStr_defaultStr__sWhiteSpaceChars = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  if ([v16 numberOfRanges] != 3)
  {
    id v12 = 0;
    v14 = &stru_1F3E09950;
    goto LABEL_9;
  }
  uint64_t v3 = [v16 rangeAtIndex:1];
  uint64_t v5 = v4;
  uint64_t v6 = [v16 rangeAtIndex:2];
  uint64_t v8 = v7;
  id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
  uint64_t v11 = [v10 stringByTrimmingCharactersInSet:initWithSrcsetStr_defaultStr__sWhiteSpaceChars];
  id v12 = (void *)[v9 initWithString:v11];

  if (v8)
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
    v14 = [v13 stringByTrimmingCharactersInSet:initWithSrcsetStr_defaultStr__sWhiteSpaceChars];

    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {
    v14 = &stru_1F3E09950;
    if (!v12) {
      goto LABEL_9;
    }
  }
  if ([(__CFString *)v14 hasSuffix:@"x"])
  {
    v15 = [[IKSrcSetRule alloc] initWithURL:v12 descriptor:v14];
    [*(id *)(a1 + 40) addObject:v15];
  }
LABEL_9:
}

- (NSURL)resolvedURL
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = v4;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_srcsetRules;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 descriptor];
        if ([v12 hasSuffix:@"x"])
        {
          v13 = [v11 descriptor];
          BOOL v14 = [v13 integerValue] == (uint64_t)v5;
        }
        else
        {
          BOOL v14 = 0;
        }

        if (v14 || !v8)
        {
          id v15 = v11;

          uint64_t v8 = v15;
        }
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v16 = [v8 imageURL];

  return (NSURL *)v16;
}

- (void).cxx_destruct
{
}

@end