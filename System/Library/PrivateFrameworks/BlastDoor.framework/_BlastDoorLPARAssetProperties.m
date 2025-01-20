@interface _BlastDoorLPARAssetProperties
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
@end

@implementation _BlastDoorLPARAssetProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_BlastDoorLPARAssetProperties allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPARAssetProperties *)self accessibilityText];
    v6 = (void *)[v5 copy];
    [(_BlastDoorLPARAssetProperties *)v4 setAccessibilityText:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPARAssetProperties;
  if ([(_BlastDoorLPARAssetProperties *)&v8 isEqual:v4]) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = v4[1];
  if (!(v5 | (unint64_t)self->_accessibilityText)) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = objc_msgSend((id)v5, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_accessibilityText hash];
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