@interface MTStylingProvidingSolidColorLayer
- (NSMutableDictionary)cmStylingProviders;
- (id)_fillDarkStyleSet;
- (id)_fillLightStyleSet;
- (id)_strokeDarkStyleSet;
- (id)_strokeLightStyleSet;
- (id)_styleSetForCategory:(id)a3;
- (id)_styleSetForCategory:(id)a3 styleDefinitions:(id)a4;
- (id)_styleSetNameForCategory:(id)a3;
- (id)visualStylingProviderForCategory:(id)a3;
- (void)_updateVisualStylingProviderForCategory:(id)a3;
- (void)_updateVisualStylingProviders;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCmStylingProviders:(id)a3;
@end

@implementation MTStylingProvidingSolidColorLayer

- (id)visualStylingProviderForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cmStylingProviders objectForKey:v4];
  if (!v5)
  {
    v5 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
    cmStylingProviders = self->_cmStylingProviders;
    if (!cmStylingProviders)
    {
      v7 = (NSMutableDictionary *)objc_opt_new();
      v8 = self->_cmStylingProviders;
      self->_cmStylingProviders = v7;

      cmStylingProviders = self->_cmStylingProviders;
    }
    [(NSMutableDictionary *)cmStylingProviders setObject:v5 forKey:v4];
    [(MTStylingProvidingSolidColorLayer *)self _updateVisualStylingProviders];
  }

  return v5;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTStylingProvidingSolidColorLayer;
  [(MTStylingProvidingSolidColorLayer *)&v4 setBackgroundColor:a3];
  [(MTStylingProvidingSolidColorLayer *)self _updateVisualStylingProviders];
}

- (void)_updateVisualStylingProviders
{
  [(MTStylingProvidingSolidColorLayer *)self _updateVisualStylingProviderForCategory:@"stroke"];
  [(MTStylingProvidingSolidColorLayer *)self _updateVisualStylingProviderForCategory:@"fill"];
}

- (void)_updateVisualStylingProviderForCategory:(id)a3
{
  cmStylingProviders = self->_cmStylingProviders;
  id v5 = a3;
  id v7 = [(NSMutableDictionary *)cmStylingProviders objectForKey:v5];
  v6 = [(MTStylingProvidingSolidColorLayer *)self _styleSetForCategory:v5];

  [v7 _setVisualStyleSet:v6];
}

- (id)_styleSetForCategory:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if (!MTCGColorIsPerceivedLight((CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor]))
  {
    if (@"fill" == v4)
    {
      uint64_t v5 = [(MTStylingProvidingSolidColorLayer *)self _fillLightStyleSet];
      goto LABEL_11;
    }
    if (@"stroke" == v4)
    {
      uint64_t v5 = [(MTStylingProvidingSolidColorLayer *)self _strokeLightStyleSet];
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (@"fill" == v4)
  {
    uint64_t v5 = [(MTStylingProvidingSolidColorLayer *)self _fillDarkStyleSet];
    goto LABEL_11;
  }
  if (@"stroke" != v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = [(MTStylingProvidingSolidColorLayer *)self _strokeDarkStyleSet];
LABEL_11:
  v6 = (void *)v5;
LABEL_12:

  return v6;
}

- (id)_fillLightStyleSet
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor];
  objc_super v4 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint(v3, 0.185, 0.85);
  uint64_t v5 = MTStylingProvidingSolidColorLayerHighlightStyleDictionary(v3);
  v9[0] = @"primary";
  v9[1] = @"highlight";
  v10[0] = v4;
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [(MTStylingProvidingSolidColorLayer *)self _styleSetForCategory:@"fill" styleDefinitions:v6];

  return v7;
}

- (id)_strokeLightStyleSet
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint((CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor], 0.48, 0.7);
  v7[0] = @"primary";
  v7[1] = @"secondary";
  v8[0] = &unk_1F06A55E0;
  v8[1] = v3;
  v7[2] = @"tertiary";
  v8[2] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  uint64_t v5 = [(MTStylingProvidingSolidColorLayer *)self _styleSetForCategory:@"stroke" styleDefinitions:v4];

  return v5;
}

- (id)_fillDarkStyleSet
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor];
  objc_super v4 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.9);
  uint64_t v5 = MTStylingProvidingSolidColorLayerHighlightStyleDictionary(v3);
  v9[0] = @"primary";
  v9[1] = @"highlight";
  v10[0] = v4;
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [(MTStylingProvidingSolidColorLayer *)self _styleSetForCategory:@"fill" styleDefinitions:v6];

  return v7;
}

- (id)_strokeDarkStyleSet
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v3 = (CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor];
  objc_super v4 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.2);
  uint64_t v5 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.5);
  v6 = MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.7);
  v10[0] = @"primary";
  v10[1] = @"secondary";
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = @"tertiary";
  v11[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v8 = [(MTStylingProvidingSolidColorLayer *)self _styleSetForCategory:@"stroke" styleDefinitions:v7];

  return v8;
}

- (id)_styleSetForCategory:(id)a3 styleDefinitions:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(MTStylingProvidingSolidColorLayer *)self _styleSetNameForCategory:a3];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = (void *)[&unk_1F06A5608 mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "capitalizedString", (void)v21);
        v17 = [v7 stringByAppendingString:v16];

        [v9 setObject:v17 forKey:v15];
        v18 = [v10 objectForKey:v15];
        [v8 setObject:v18 forKey:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v9 setObject:v8 forKey:@"styles"];
  v19 = [[MTVisualStyleSet alloc] initWithName:v7 visualStyleSetDescription:v9 andDescendantDescriptions:0];

  return v19;
}

- (id)_styleSetNameForCategory:(id)a3
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = v5;
  if (@"stroke" != v5 && @"fill" != v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MTStylingProvidingSolidColorLayer.m" lineNumber:148 description:@"MTStylingProvidingSolidColorLayer only supports stroke and fill"];
  }
  id v8 = (void *)[@"solidColorBackground" mutableCopy];
  v9 = v8;
  if (@"stroke" == v6)
  {
    id v10 = @"Stroke";
  }
  else
  {
    if (@"fill" != v6) {
      goto LABEL_11;
    }
    id v10 = @"Fill";
  }
  [v8 appendString:v10];
LABEL_11:
  if (MTCGColorIsPerceivedLight((CGColor *)[(MTStylingProvidingSolidColorLayer *)self backgroundColor]))uint64_t v11 = @"Dark"; {
  else
  }
    uint64_t v11 = @"Light";
  [v9 appendString:v11];

  return v9;
}

- (NSMutableDictionary)cmStylingProviders
{
  return self->_cmStylingProviders;
}

- (void)setCmStylingProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end