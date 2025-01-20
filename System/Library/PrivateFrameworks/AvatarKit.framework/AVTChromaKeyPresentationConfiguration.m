@interface AVTChromaKeyPresentationConfiguration
- (AVTChromaKeyPresentationConfiguration)init;
- (UIColor)keyColor;
- (__n128)shadableKeyColorComponents;
- (void)setKeyColor:(id)a3;
@end

@implementation AVTChromaKeyPresentationConfiguration

- (AVTChromaKeyPresentationConfiguration)init
{
  v2 = [(AVTPresentationConfiguration *)self _initWithStyle:3];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] greenColor];
    [(AVTChromaKeyPresentationConfiguration *)v2 setKeyColor:v3];
  }
  return v2;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_keyColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_keyColor, a3);
    __n128 v6 = AVTGetColorComponentsMetal(self->_keyColor);
    v5 = v7;
    *(__n128 *)self->_shadableKeyColorComponents = v6;
  }
}

- (__n128)shadableKeyColorComponents
{
  return a1[2];
}

- (void).cxx_destruct
{
}

@end