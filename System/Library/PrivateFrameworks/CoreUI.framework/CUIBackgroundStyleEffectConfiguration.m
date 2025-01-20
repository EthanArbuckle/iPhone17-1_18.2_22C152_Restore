@interface CUIBackgroundStyleEffectConfiguration
- (BOOL)effectShowsValue;
- (BOOL)shouldIgnoreForegroundColor;
- (BOOL)shouldRespectOutputBlending;
- (CUIBackgroundStyleEffectConfiguration)init;
- (NSString)backgroundType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)setBackgroundType:(id)a3;
- (void)setEffectShowsValue:(BOOL)a3;
- (void)setShouldRespectOutputBlending:(BOOL)a3;
@end

@implementation CUIBackgroundStyleEffectConfiguration

- (CUIBackgroundStyleEffectConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  result = [(CUIStyleEffectConfiguration *)&v3 init];
  if (result) {
    result->_shouldRespectOutputBlending = -3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  [(CUIStyleEffectConfiguration *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  v5 = -[CUIStyleEffectConfiguration copyWithZone:](&v7, sel_copyWithZone_);
  if (v5)
  {
    v5[10] = [(NSString *)self->_backgroundType copyWithZone:a3];
    *((unsigned char *)v5 + 88) = self->_effectShowsValue;
  }
  return v5;
}

- (BOOL)shouldIgnoreForegroundColor
{
  v13.receiver = self;
  v13.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  LOBYTE(v3) = [(CUIStyleEffectConfiguration *)&v13 shouldIgnoreForegroundColor];
  if (self->_backgroundType
    && ![(CUIStyleEffectConfiguration *)self foregroundColorShouldTintEffects])
  {
    unint64_t v4 = (unint64_t)CUIConstantToMapID([(CUIBackgroundStyleEffectConfiguration *)self backgroundType])
       - 32;
    if (v4 < 0x22 && ((0x27246837FuLL >> v4) & 1) != 0)
    {
      return (0x1FFFFFFDFuLL >> v4) & 1;
    }
    else
    {
      v5 = [(CUIBackgroundStyleEffectConfiguration *)self backgroundType];
      _CUILog(4, (uint64_t)"CoreUI: Invalid background type requested: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    }
  }
  return v3;
}

- (void)setShouldRespectOutputBlending:(BOOL)a3
{
  self->_shouldRespectOutputBlending = a3;
}

- (BOOL)shouldRespectOutputBlending
{
  int shouldRespectOutputBlending = self->_shouldRespectOutputBlending;
  if (shouldRespectOutputBlending < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
    LOBYTE(v3) = [(CUIStyleEffectConfiguration *)&v14 shouldRespectOutputBlending];
    if (self->_backgroundType)
    {
      unint64_t v5 = (unint64_t)CUIConstantToMapID([(CUIBackgroundStyleEffectConfiguration *)self backgroundType])
         - 32;
      if (v5 < 0x1F && ((0x7246837Fu >> v5) & 1) != 0)
      {
        return (0x4FB9FE90u >> v5) & 1;
      }
      else
      {
        uint64_t v6 = [(CUIBackgroundStyleEffectConfiguration *)self backgroundType];
        _CUILog(4, (uint64_t)"CoreUI: Invalid background type requested: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      }
    }
  }
  else
  {
    LOBYTE(v3) = shouldRespectOutputBlending != 0;
  }
  return v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  return +[NSString stringWithFormat:@"%@\nbackgroundType: %@\neffectShowsValue: %d", [(CUIStyleEffectConfiguration *)&v3 description], [(CUIBackgroundStyleEffectConfiguration *)self backgroundType], [(CUIBackgroundStyleEffectConfiguration *)self effectShowsValue]];
}

- (NSString)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(id)a3
{
}

- (BOOL)effectShowsValue
{
  return self->_effectShowsValue;
}

- (void)setEffectShowsValue:(BOOL)a3
{
  self->_effectShowsValue = a3;
}

@end