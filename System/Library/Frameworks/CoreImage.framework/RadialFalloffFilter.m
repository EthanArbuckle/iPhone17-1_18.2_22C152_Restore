@interface RadialFalloffFilter
- (CIImage)inputCenter;
- (CIVector)inputExtent;
- (NSNumber)inputAnisotropic;
- (NSNumber)inputFalloff;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)setInputAnisotropic:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputFalloff:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation RadialFalloffFilter

- (id)outputImage
{
  [(CIVector *)self->inputExtent CGRectValue];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(NSNumber *)self->inputFalloff floatValue];
  float v12 = v11;
  [(NSNumber *)self->inputRadius floatValue];
  float v14 = v13;
  inputCenter = self->inputCenter;
  uint64_t v16 = v4;
  uint64_t v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v10;

  return RRradialCentroidMask(inputCenter, *(CGRect *)&v16, v14, v12, 1);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputFalloff
{
  return self->inputFalloff;
}

- (void)setInputFalloff:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputAnisotropic
{
  return self->inputAnisotropic;
}

- (void)setInputAnisotropic:(id)a3
{
}

@end