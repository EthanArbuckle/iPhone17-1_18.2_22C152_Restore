@interface _BlastDoorLPImageProperties
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (_BlastDoorLPPlatformColor)dominantColor;
- (_BlastDoorLPPlatformColor)overlaidTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
- (void)setDominantColor:(id)a3;
- (void)setOverlaidTextColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _BlastDoorLPImageProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_BlastDoorLPImageProperties allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPImageProperties *)self accessibilityText];
    v6 = (void *)[v5 copy];
    [(_BlastDoorLPImageProperties *)v4 setAccessibilityText:v6];

    [(_BlastDoorLPImageProperties *)v4 setType:[(_BlastDoorLPImageProperties *)self type]];
    v7 = [(_BlastDoorLPImageProperties *)self overlaidTextColor];
    [(_BlastDoorLPImageProperties *)v4 setOverlaidTextColor:v7];

    v8 = [(_BlastDoorLPImageProperties *)self dominantColor];
    [(_BlastDoorLPImageProperties *)v4 setDominantColor:v8];

    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPImageProperties;
  if ([(_BlastDoorLPImageProperties *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v4;
      unint64_t v7 = v6[1];
      if ((!(v7 | (unint64_t)self->_accessibilityText) || objc_msgSend((id)v7, "isEqual:"))
        && v6[2] == self->_type
        && ((unint64_t v8 = v6[3], !(v8 | (unint64_t)self->_overlaidTextColor))
         || objc_msgSend((id)v8, "isEqual:")))
      {
        unint64_t v9 = v6[4];
        if (v9 | (unint64_t)self->_dominantColor) {
          char v5 = objc_msgSend((id)v9, "isEqual:");
        }
        else {
          char v5 = 1;
        }
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessibilityText hash];
  unint64_t v4 = [(_BlastDoorLPPlatformColor *)self->_overlaidTextColor hash] ^ v3;
  return v4 ^ [(_BlastDoorLPPlatformColor *)self->_dominantColor hash];
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

- (_BlastDoorLPPlatformColor)overlaidTextColor
{
  return self->_overlaidTextColor;
}

- (void)setOverlaidTextColor:(id)a3
{
}

- (_BlastDoorLPPlatformColor)dominantColor
{
  return self->_dominantColor;
}

- (void)setDominantColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColor, 0);
  objc_storeStrong((id *)&self->_overlaidTextColor, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end