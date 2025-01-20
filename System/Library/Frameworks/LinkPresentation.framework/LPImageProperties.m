@interface LPImageProperties
- (BOOL)hasSingleDominantColor;
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (UIColor)dominantColor;
- (UIColor)overlaidTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
- (void)setDominantColor:(id)a3;
- (void)setHasSingleDominantColor:(BOOL)a3;
- (void)setOverlaidTextColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation LPImageProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPImageProperties allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPImageProperties *)self accessibilityText];
    v6 = (void *)[v5 copy];
    [(LPImageProperties *)v4 setAccessibilityText:v6];

    [(LPImageProperties *)v4 setType:[(LPImageProperties *)self type]];
    v7 = [(LPImageProperties *)self overlaidTextColor];
    [(LPImageProperties *)v4 setOverlaidTextColor:v7];

    v8 = [(LPImageProperties *)self dominantColor];
    [(LPImageProperties *)v4 setDominantColor:v8];

    [(LPImageProperties *)v4 setHasSingleDominantColor:[(LPImageProperties *)self hasSingleDominantColor]];
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPImageProperties;
  if ([(LPImageProperties *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual(v6[2], self->_accessibilityText) & 1) != 0
        && v6[3] == (void *)self->_type
        && objectsAreEqual(v6[4], self->_overlaidTextColor)
        && objectsAreEqual(v6[5], self->_dominantColor)
        && *((unsigned __int8 *)v6 + 8) == self->_hasSingleDominantColor;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessibilityText hash];
  uint64_t v4 = [(UIColor *)self->_overlaidTextColor hash] ^ v3;
  return v4 ^ [(UIColor *)self->_dominantColor hash];
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIColor)overlaidTextColor
{
  return self->_overlaidTextColor;
}

- (void)setOverlaidTextColor:(id)a3
{
}

- (UIColor)dominantColor
{
  return self->_dominantColor;
}

- (void)setDominantColor:(id)a3
{
}

- (BOOL)hasSingleDominantColor
{
  return self->_hasSingleDominantColor;
}

- (void)setHasSingleDominantColor:(BOOL)a3
{
  self->_hasSingleDominantColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColor, 0);
  objc_storeStrong((id *)&self->_overlaidTextColor, 0);

  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end