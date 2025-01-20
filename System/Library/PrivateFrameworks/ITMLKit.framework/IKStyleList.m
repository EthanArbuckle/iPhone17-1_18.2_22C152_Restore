@interface IKStyleList
- (BOOL)isResolutionDone;
- (BOOL)requiresMediaQueryEvaluation;
- (IKStyleList)baseStyleList;
- (IKStyleList)initWithClassSelector:(id)a3 styles:(id)a4 baseStyleList:(id)a5;
- (IKViewElementStyle)resolvedStyle;
- (NSArray)styles;
- (NSString)classSelector;
- (id)resolvedStyleWithMediaQueryEvaluator:(id)a3;
- (void)_resolveWithMediaQueryEvaluator:(id)a3;
- (void)setNeedsReresolution;
- (void)setResolutionDone:(BOOL)a3;
- (void)setResolvedStyle:(id)a3;
@end

@implementation IKStyleList

- (IKStyleList)initWithClassSelector:(id)a3 styles:(id)a4 baseStyleList:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IKStyleList;
  v11 = [(IKStyleList *)&v28 init];
  if (v11)
  {
    char v12 = [v10 requiresMediaQueryEvaluation];
    v11->_requiresMediaQueryEvaluation = v12;
    if ((v12 & 1) == 0)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "mediaQueryList", (void)v24);

            if (v18)
            {
              v11->_requiresMediaQueryEvaluation = 1;
              goto LABEL_13;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    objc_storeStrong((id *)&v11->_baseStyleList, a5);
    uint64_t v19 = [v9 copy];
    styles = v11->_styles;
    v11->_styles = (NSArray *)v19;

    uint64_t v21 = [v8 copy];
    classSelector = v11->_classSelector;
    v11->_classSelector = (NSString *)v21;

    if (!v11->_requiresMediaQueryEvaluation) {
      [(IKStyleList *)v11 _resolveWithMediaQueryEvaluator:0];
    }
  }

  return v11;
}

- (id)resolvedStyleWithMediaQueryEvaluator:(id)a3
{
  id v4 = a3;
  if (![(IKStyleList *)self isResolutionDone]) {
    [(IKStyleList *)self _resolveWithMediaQueryEvaluator:v4];
  }
  v5 = [(IKStyleList *)self resolvedStyle];

  return v5;
}

- (void)setNeedsReresolution
{
  if ([(IKStyleList *)self requiresMediaQueryEvaluation])
  {
    [(IKStyleList *)self setResolvedStyle:0];
    [(IKStyleList *)self setResolutionDone:0];
    id v3 = [(IKStyleList *)self baseStyleList];
    [v3 setNeedsReresolution];
  }
}

- (void)_resolveWithMediaQueryEvaluator:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IKStyleList *)self isResolutionDone])
  {
    v5 = (void *)MEMORY[0x1E4F1CA48];
    v6 = [(IKStyleList *)self styles];
    v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);

    id v8 = [(IKStyleList *)self baseStyleList];
    uint64_t v9 = [v8 resolvedStyleWithMediaQueryEvaluator:v4];

    if (v9) {
      [v7 addObject:v9];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [(IKStyleList *)self styles];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = [v15 mediaQueryList];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = [v15 mediaQueryList];
            int v19 = [v4 evaluateStyleMediaQueryList:v18];

            if (!v19) {
              continue;
            }
          }
          [v7 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    if ([v7 count])
    {
      v20 = +[IKViewElementStyle elementStyleWithSelector:0 aggregatingStyles:v7];
    }
    else
    {
      v20 = 0;
    }
    [v22 setResolvedStyle:v20];
    [v22 setResolutionDone:1];
  }
}

- (BOOL)requiresMediaQueryEvaluation
{
  return self->_requiresMediaQueryEvaluation;
}

- (NSString)classSelector
{
  return self->_classSelector;
}

- (IKStyleList)baseStyleList
{
  return self->_baseStyleList;
}

- (NSArray)styles
{
  return self->_styles;
}

- (IKViewElementStyle)resolvedStyle
{
  return self->_resolvedStyle;
}

- (void)setResolvedStyle:(id)a3
{
}

- (BOOL)isResolutionDone
{
  return self->_resolutionDone;
}

- (void)setResolutionDone:(BOOL)a3
{
  self->_resolutionDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedStyle, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_baseStyleList, 0);
  objc_storeStrong((id *)&self->_classSelector, 0);
}

@end