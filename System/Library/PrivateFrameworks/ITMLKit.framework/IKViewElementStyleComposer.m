@interface IKViewElementStyleComposer
+ (IKViewElementStyleComposer)styleComposerWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6;
- (BOOL)isCompositionDone;
- (BOOL)requiresMediaQueryEvaluation;
- (IKStyleList)styleList;
- (IKViewElementStyle)composedSansDefaultStyle;
- (IKViewElementStyle)composedStyle;
- (IKViewElementStyle)elementStyleOverrides;
- (IKViewElementStyleComposer)defaultStyleComposer;
- (IKViewElementStyleComposer)initWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6;
- (IKViewElementStyleComposer)parentStyleComposer;
- (id)composedSansDefaultStyleWithMediaQueryEvaluator:(id)a3;
- (id)composedStyleWithMediaQueryEvaluator:(id)a3;
- (id)consolidatedDefaultStyleList;
- (void)_composeWithMediaQueryEvaluator:(id)a3;
- (void)setComposedSansDefaultStyle:(id)a3;
- (void)setComposedStyle:(id)a3;
- (void)setNeedsRecomposition;
@end

@implementation IKViewElementStyleComposer

+ (IKViewElementStyleComposer)styleComposerWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6
{
  if (a3 || a4 || a5 || a6)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v9 = [[IKViewElementStyleComposer alloc] initWithDefaultStyleComposer:v13 parentStyleComposer:v12 styleList:v11 elementStyleOverrides:v10];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (IKViewElementStyleComposer)initWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IKViewElementStyleComposer;
  v15 = [(IKViewElementStyleComposer *)&v18 init];
  if (v15)
  {
    if (([v11 requiresMediaQueryEvaluation] & 1) != 0
      || ([v12 requiresMediaQueryEvaluation] & 1) != 0)
    {
      char v16 = 1;
    }
    else
    {
      char v16 = [v13 requiresMediaQueryEvaluation];
    }
    v15->_requiresMediaQueryEvaluation = v16;
    objc_storeStrong((id *)&v15->_defaultStyleComposer, a3);
    objc_storeStrong((id *)&v15->_parentStyleComposer, a4);
    objc_storeStrong((id *)&v15->_styleList, a5);
    objc_storeStrong((id *)&v15->_elementStyleOverrides, a6);
    if (!v15->_requiresMediaQueryEvaluation) {
      [(IKViewElementStyleComposer *)v15 _composeWithMediaQueryEvaluator:0];
    }
  }

  return v15;
}

- (id)composedStyleWithMediaQueryEvaluator:(id)a3
{
  id v4 = a3;
  if (![(IKViewElementStyleComposer *)self isCompositionDone]) {
    [(IKViewElementStyleComposer *)self _composeWithMediaQueryEvaluator:v4];
  }
  v5 = [(IKViewElementStyleComposer *)self composedStyle];

  return v5;
}

- (void)setNeedsRecomposition
{
  if ([(IKViewElementStyleComposer *)self requiresMediaQueryEvaluation])
  {
    [(IKViewElementStyleComposer *)self setComposedSansDefaultStyle:0];
    [(IKViewElementStyleComposer *)self setComposedStyle:0];
    self->_compositionDone = 0;
    v3 = [(IKViewElementStyleComposer *)self styleList];
    [v3 setNeedsReresolution];

    id v4 = [(IKViewElementStyleComposer *)self defaultStyleComposer];
    [v4 setNeedsRecomposition];
  }
}

- (id)consolidatedDefaultStyleList
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(IKViewElementStyleComposer *)self styleList];

  if (v4)
  {
    v5 = [(IKViewElementStyleComposer *)self styleList];
    [v3 addObject:v5];
  }
  v6 = [(IKViewElementStyleComposer *)self defaultStyleComposer];
  v7 = [v6 consolidatedDefaultStyleList];
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (id)composedSansDefaultStyleWithMediaQueryEvaluator:(id)a3
{
  id v4 = a3;
  if (![(IKViewElementStyleComposer *)self isCompositionDone]) {
    [(IKViewElementStyleComposer *)self _composeWithMediaQueryEvaluator:v4];
  }
  v5 = [(IKViewElementStyleComposer *)self composedSansDefaultStyle];

  return v5;
}

- (void)_composeWithMediaQueryEvaluator:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IKViewElementStyleComposer *)self isCompositionDone])
  {
    v5 = [(IKViewElementStyleComposer *)self parentStyleComposer];
    v6 = [v5 composedSansDefaultStyleWithMediaQueryEvaluator:v4];

    v7 = [(IKViewElementStyleComposer *)self styleList];
    v8 = [v7 resolvedStyleWithMediaQueryEvaluator:v4];

    v9 = [(IKViewElementStyleComposer *)self elementStyleOverrides];
    id v10 = +[IKViewElementStyle elementStyleWithParentStyle:v6 elementStyle:v8 elementStyleOverrides:v9];
    [(IKViewElementStyleComposer *)self setComposedSansDefaultStyle:v10];
    id v11 = [(IKViewElementStyleComposer *)self defaultStyleComposer];
    id v12 = [v11 composedStyleWithMediaQueryEvaluator:v4];

    if (v12)
    {
      if (v10)
      {
        v17[0] = v12;
        v17[1] = v10;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
        id v14 = +[IKViewElementStyle elementStyleWithSelector:0 aggregatingStyles:v13];
        [(IKViewElementStyleComposer *)self setComposedStyle:v14];

LABEL_8:
        self->_compositionDone = 1;

        goto LABEL_9;
      }
      v15 = self;
      char v16 = v12;
    }
    else
    {
      v15 = self;
      char v16 = v10;
    }
    [(IKViewElementStyleComposer *)v15 setComposedStyle:v16];
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)requiresMediaQueryEvaluation
{
  return self->_requiresMediaQueryEvaluation;
}

- (IKViewElementStyleComposer)defaultStyleComposer
{
  return self->_defaultStyleComposer;
}

- (IKViewElementStyleComposer)parentStyleComposer
{
  return self->_parentStyleComposer;
}

- (IKStyleList)styleList
{
  return self->_styleList;
}

- (IKViewElementStyle)elementStyleOverrides
{
  return self->_elementStyleOverrides;
}

- (BOOL)isCompositionDone
{
  return self->_compositionDone;
}

- (IKViewElementStyle)composedSansDefaultStyle
{
  return self->_composedSansDefaultStyle;
}

- (void)setComposedSansDefaultStyle:(id)a3
{
}

- (IKViewElementStyle)composedStyle
{
  return self->_composedStyle;
}

- (void)setComposedStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedStyle, 0);
  objc_storeStrong((id *)&self->_composedSansDefaultStyle, 0);
  objc_storeStrong((id *)&self->_elementStyleOverrides, 0);
  objc_storeStrong((id *)&self->_styleList, 0);
  objc_storeStrong((id *)&self->_parentStyleComposer, 0);
  objc_storeStrong((id *)&self->_defaultStyleComposer, 0);
}

@end