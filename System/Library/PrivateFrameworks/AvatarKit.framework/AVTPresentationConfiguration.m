@interface AVTPresentationConfiguration
- (AVTPresentationConfiguration)init;
- (BOOL)usesAR;
- (id)_initWithStyle:(unint64_t)a3;
- (unint64_t)internalStyle;
@end

@implementation AVTPresentationConfiguration

- (AVTPresentationConfiguration)init
{
  return 0;
}

- (unint64_t)internalStyle
{
  return self->_style;
}

- (id)_initWithStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTPresentationConfiguration;
  id result = [(AVTPresentationConfiguration *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)usesAR
{
  return (self->_style & 0xFFFFFFFFFFFFFFFELL) == 2;
}

@end