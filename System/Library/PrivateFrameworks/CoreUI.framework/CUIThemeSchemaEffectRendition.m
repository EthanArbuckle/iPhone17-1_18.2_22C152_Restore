@interface CUIThemeSchemaEffectRendition
- (BOOL)_generateReferenceImage;
- (CUIThemeSchemaEffectRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4;
- (id)_rendererInitializationDictionary;
- (id)coreUIOptions;
- (id)effectPreset;
- (id)referenceImage;
- (void)_initializeCoreUIOptions:(id)a3;
- (void)dealloc;
@end

@implementation CUIThemeSchemaEffectRendition

- (CUIThemeSchemaEffectRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaEffectRendition;
  v6 = [(CUIThemeSchemaEffectRendition *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CUIThemeRendition *)v6 _initializeRenditionKey:a4];
    [(CUIThemeRendition *)v7 setOpacity:1.0];
    [(CUIThemeRendition *)v7 setBlendMode:0];
    if (+[NSBundle bundleWithIdentifier:@"com.apple.systemappearance"])
    {
      [(CUIThemeSchemaEffectRendition *)v7 _initializeCoreUIOptions:a3];
    }
    if (!v7->_effectPreset)
    {

      return 0;
    }
  }
  return v7;
}

- (id)_rendererInitializationDictionary
{
  return &unk_1EF4A6D20;
}

- (void)_initializeCoreUIOptions:(id)a3
{
  self->_cuiInfo = (NSDictionary *)a3;
}

- (id)coreUIOptions
{
  return self->_cuiInfo;
}

- (void)dealloc
{
  cuiInfo = self->_cuiInfo;
  if (cuiInfo) {

  }
  effectPreset = self->_effectPreset;
  if (effectPreset) {

  }
  referenceImage = self->_referenceImage;
  if (referenceImage) {

  }
  v6.receiver = self;
  v6.super_class = (Class)CUIThemeSchemaEffectRendition;
  [(CUIThemeRendition *)&v6 dealloc];
}

- (BOOL)_generateReferenceImage
{
  return 0;
}

- (id)referenceImage
{
  id result = self->_referenceImage;
  if (!result)
  {
    [(CUIThemeSchemaEffectRendition *)self _generateReferenceImage];
    return self->_referenceImage;
  }
  return result;
}

- (id)effectPreset
{
  return self->_effectPreset;
}

@end