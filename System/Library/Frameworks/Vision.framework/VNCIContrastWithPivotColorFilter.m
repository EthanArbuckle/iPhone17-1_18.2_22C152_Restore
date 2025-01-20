@interface VNCIContrastWithPivotColorFilter
- (NSNumber)inputContrast;
- (NSNumber)inputPivot;
- (VNCIContrastWithPivotColorFilter)init;
- (VNCIContrastWithPivotColorFilter)initWithInputParameters:(id)a3;
- (id)outputImage;
- (void)_initProperties;
- (void)setInputContrast:(id)a3;
- (void)setInputPivot:(id)a3;
@end

@implementation VNCIContrastWithPivotColorFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPivot, 0);

  objc_storeStrong((id *)&self->_inputContrast, 0);
}

- (NSNumber)inputPivot
{
  return self->_inputPivot;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->_inputContrast;
}

- (id)outputImage
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(VNCIContrastWithPivotColorFilter *)self inputContrast];
  [v3 floatValue];
  float v5 = v4;

  if (v5 == 1.0)
  {
    v6 = [(VNCIFilter *)self inputImage];
  }
  else
  {
    v7 = [(VNCIContrastWithPivotColorFilter *)self inputPivot];
    v11[0] = v7;
    v8 = [(VNCIContrastWithPivotColorFilter *)self inputContrast];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v6 = -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v9);
  }

  return v6;
}

- (void)setInputPivot:(id)a3
{
  id v4 = a3;
  float v5 = NSNumber;
  id v9 = v4;
  [v4 floatValue];
  *(float *)&double v6 = fminf(*(float *)&v6, 1.0);
  if (*(float *)&v6 < 0.0) {
    *(float *)&double v6 = 0.0;
  }
  v7 = [v5 numberWithFloat:v6];
  inputPivot = self->_inputPivot;
  self->_inputPivot = v7;
}

- (VNCIContrastWithPivotColorFilter)initWithInputParameters:(id)a3
{
  v3 = [(VNCIFilter *)self initWithKernelName:@"contrastWithPivot" inputParameters:a3];
  id v4 = v3;
  if (v3) {
    -[VNCIContrastWithPivotColorFilter _initProperties]((uint64_t)v3);
  }
  return v4;
}

- (void)_initProperties
{
  if (!*(void *)(a1 + 96)) {
    *(void *)(a1 + 96) = &unk_1EF7A81B0;
  }
  if (!*(void *)(a1 + 104))
  {
    *(void *)(a1 + 104) = &unk_1EF7A81C0;
  }
}

- (VNCIContrastWithPivotColorFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)VNCIContrastWithPivotColorFilter;
  v2 = [(VNCIFilter *)&v5 initWithKernelName:@"contrastWithPivot"];
  v3 = v2;
  if (v2) {
    -[VNCIContrastWithPivotColorFilter _initProperties]((uint64_t)v2);
  }
  return v3;
}

@end