@interface LPVideoProperties
- (BOOL)hasAudio;
- (BOOL)isEqual:(id)a3;
- (UIColor)_overlappingControlsColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setOverlappingControlsColor:(id)a3;
- (void)setHasAudio:(BOOL)a3;
@end

@implementation LPVideoProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPVideoProperties allocWithZone:a3];
  if (v4)
  {
    [(LPVideoProperties *)v4 setHasAudio:[(LPVideoProperties *)self hasAudio]];
    v5 = [(LPVideoProperties *)self _overlappingControlsColor];
    [(LPVideoProperties *)v4 _setOverlappingControlsColor:v5];

    v6 = [(LPVisualMediaProperties *)self accessibilityText];
    v7 = (void *)[v6 copy];
    [(LPVisualMediaProperties *)v4 setAccessibilityText:v7];

    v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideoProperties;
  if ([(LPVisualMediaProperties *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (unsigned __int8 *)v4;
      v7 = (void **)v6;
      if (v6[16] == self->_hasAudio
        && ([v6 accessibilityText],
            v8 = objc_claimAutoreleasedReturnValue(),
            [(LPVisualMediaProperties *)self accessibilityText],
            v9 = objc_claimAutoreleasedReturnValue(),
            char v10 = objectsAreEqual_1(v8, v9),
            v9,
            v8,
            (v10 & 1) != 0))
      {
        char v5 = objectsAreEqual_1(v7[3], self->_overlappingControlsColor);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (UIColor)_overlappingControlsColor
{
  return self->_overlappingControlsColor;
}

- (void)_setOverlappingControlsColor:(id)a3
{
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (void).cxx_destruct
{
}

@end