@interface _BlastDoorLPVideoProperties
- (BOOL)hasAudio;
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
- (void)setHasAudio:(BOOL)a3;
@end

@implementation _BlastDoorLPVideoProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_BlastDoorLPVideoProperties allocWithZone:a3];
  if (v4)
  {
    [(_BlastDoorLPVideoProperties *)v4 setHasAudio:[(_BlastDoorLPVideoProperties *)self hasAudio]];
    v5 = [(_BlastDoorLPVideoProperties *)self accessibilityText];
    v6 = (void *)[v5 copy];
    [(_BlastDoorLPVideoProperties *)v4 setAccessibilityText:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPVideoProperties;
  BOOL v5 = [(_BlastDoorLPVideoProperties *)&v10 isEqual:v4];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (unint64_t *)v4;
      v7 = v6;
      if (*((unsigned __int8 *)v6 + 8) == self->_hasAudio)
      {
        unint64_t v8 = v6[2];
        if (v8 | (unint64_t)self->_accessibilityText) {
          objc_msgSend((id)v8, "isEqual:");
        }
      }
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_accessibilityText hash];
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end