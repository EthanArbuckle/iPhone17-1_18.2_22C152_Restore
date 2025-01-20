@interface NTKParmesanImageAnalysis
- (BOOL)isBright;
- (BOOL)isComplexBackground;
- (BOOL)isEqual:(id)a3;
- (void)setBright:(BOOL)a3;
- (void)setComplexBackground:(BOOL)a3;
@end

@implementation NTKParmesanImageAnalysis

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_bright == v4[9])
  {
    BOOL v5 = self->_complexBackground == v4[8];

    return v5;
  }
  else
  {

    return 0;
  }
}

- (BOOL)isComplexBackground
{
  return self->_complexBackground;
}

- (void)setComplexBackground:(BOOL)a3
{
  self->_complexBackground = a3;
}

- (BOOL)isBright
{
  return self->_bright;
}

- (void)setBright:(BOOL)a3
{
  self->_bright = a3;
}

@end