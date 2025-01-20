@interface CICircularityDescriptor
- (CIImage)inputCentroid;
- (CIVector)inputExtent;
- (id)outputImage;
- (void)setInputCentroid:(id)a3;
- (void)setInputExtent:(id)a3;
@end

@implementation CICircularityDescriptor

- (id)outputImage
{
  v34[1] = *MEMORY[0x1E4F143B8];
  inputCentroid = self->inputCentroid;
  if (!inputCentroid)
  {
    inputImage = self->inputImage;
    inputExtent = self->inputExtent;
    v33 = @"inputExtent";
    v34[0] = inputExtent;
    inputCentroid = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaRedCentroid", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1]);
  }
  [(CIVector *)self->inputExtent CGRectValue];
  double v7 = v6;
  double v9 = v8;
  v10 = self->inputImage;
  v11 = self->inputExtent;
  v31 = @"inputExtent";
  v32 = v11;
  uint64_t v12 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1]), "imageByClampingToExtent");
  v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_cdintersect];
  *(float *)&double v7 = v7 * v9 / 3.14159265;
  [(CIImage *)self->inputImage extent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v30[0] = self->inputImage;
  v30[1] = inputCentroid;
  v30[2] = v12;
  LODWORD(v14) = LODWORD(v7);
  v30[3] = [NSNumber numberWithFloat:v14];
  v22 = -[CIColorKernel applyWithExtent:arguments:](v13, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4], v15, v17, v19, v21);
  v23 = self->inputExtent;
  v28 = @"inputExtent";
  v29 = v23;
  uint64_t v24 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1]), "imageByClampingToExtent");
  v25 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_cdmeasure];
  v27[0] = v12;
  v27[1] = v24;
  return -[CIColorKernel applyWithExtent:arguments:](v25, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2], 0.0, 0.0, 1.0, 1.0);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (CIImage)inputCentroid
{
  return self->inputCentroid;
}

- (void)setInputCentroid:(id)a3
{
}

@end