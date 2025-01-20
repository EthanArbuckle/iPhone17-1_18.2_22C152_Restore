@interface CUINamedColor
- (BOOL)substituteWithSystemColor;
- (CGColor)cgColor;
- (CUINamedColor)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (NSString)systemColorName;
- (void)dealloc;
@end

@implementation CUINamedColor

- (CUINamedColor)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v17.receiver = self;
  v17.super_class = (Class)CUINamedColor;
  v6 = [(CUINamedLookup *)&v17 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  v7 = v6;
  if (v6)
  {
    v8 = [(CUINamedLookup *)v6 _rendition];
    if ((id)[(CUIThemeRendition *)v8 type] == (id)1009)
    {
      unsigned int v15 = [(CUIThemeRendition *)v8 substituteWithSystemColor];
      v7->_substituteWithSystemColor = v15;
      if (v15) {
        v7->_colorName = (NSString *)objc_msgSend(-[CUIThemeRendition systemColorName](v8, "systemColorName"), "copy");
      }
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named color '%@' with a name that s not a color type in the AssetCatalog", v9, v10, v11, v12, v13, v14, (uint64_t)a3);

      return 0;
    }
  }
  return v7;
}

- (BOOL)substituteWithSystemColor
{
  return self->_substituteWithSystemColor;
}

- (CGColor)cgColor
{
  result = self->_cgColor;
  if (!result)
  {
    v4 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] cgColor];
    self->_cgColor = v4;
    CGColorRetain(v4);
    return self->_cgColor;
  }
  return result;
}

- (NSString)systemColorName
{
  return self->_colorName;
}

- (void)dealloc
{
  CGColorRelease(self->_cgColor);

  v3.receiver = self;
  v3.super_class = (Class)CUINamedColor;
  [(CUINamedLookup *)&v3 dealloc];
}

@end