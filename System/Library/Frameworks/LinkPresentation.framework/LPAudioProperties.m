@interface LPAudioProperties
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
@end

@implementation LPAudioProperties

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPAudioProperties allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPAudioProperties *)self accessibilityText];
    v6 = (void *)[v5 copy];
    [(LPAudioProperties *)v4 setAccessibilityText:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPAudioProperties;
  if ([(LPAudioProperties *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = objectsAreEqual_2(v4[1], self->_accessibilityText);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
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