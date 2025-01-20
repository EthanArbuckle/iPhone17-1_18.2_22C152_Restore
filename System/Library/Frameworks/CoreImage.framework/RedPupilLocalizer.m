@interface RedPupilLocalizer
- (CIVector)inputAxisLong;
- (CIVector)inputAxisShort;
- (CIVector)inputExtent;
- (CIVector)inputPupilCenter;
- (NSNumber)inputClip;
- (NSNumber)inputDebug;
- (NSNumber)inputDecay;
- (NSNumber)inputGamma;
- (NSNumber)inputIterations;
- (NSNumber)inputLocalizationRadius;
- (NSNumber)inputScale;
- (NSNumber)inputSearchAxisLong;
- (NSNumber)inputSearchAxisShort;
- (id)outputImage;
- (void)setInputAxisLong:(id)a3;
- (void)setInputAxisShort:(id)a3;
- (void)setInputClip:(id)a3;
- (void)setInputDebug:(id)a3;
- (void)setInputDecay:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputGamma:(id)a3;
- (void)setInputIterations:(id)a3;
- (void)setInputLocalizationRadius:(id)a3;
- (void)setInputPupilCenter:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputSearchAxisLong:(id)a3;
- (void)setInputSearchAxisShort:(id)a3;
@end

@implementation RedPupilLocalizer

- (id)outputImage
{
  v45[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  int v4 = [(NSNumber *)self->inputIterations intValue];
  [(NSNumber *)self->inputScale floatValue];
  float v39 = v5;
  [(NSNumber *)self->inputDecay floatValue];
  float v7 = v6;
  [(NSNumber *)self->inputGamma floatValue];
  float v9 = v8;
  [(CIVector *)self->inputExtent CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(NSNumber *)self->inputLocalizationRadius floatValue];
  float v19 = v18;
  [(NSNumber *)self->inputSearchAxisLong floatValue];
  float v21 = v19 * v20;
  [(NSNumber *)self->inputSearchAxisShort floatValue];
  float v23 = v19 * v22;
  v47.origin.x = v11;
  v47.origin.y = v13;
  v47.size.width = v15;
  v47.size.height = v17;
  v24 = RRradialEllipticalMask(v47, self->inputAxisLong, (objc_object *)self->inputPupilCenter, v21, v23, 0.25, 1.0);
  v25 = RRmultiplyRh(inputImage, v24);
  if ([(NSNumber *)self->inputDebug BOOLValue])
  {
    [(CIImage *)self->inputImage extent];
    return -[CIImage imageByCroppingToRect:](v25, "imageByCroppingToRect:");
  }
  else
  {
    [(NSNumber *)self->inputClip floatValue];
    v28 = RRclip(v25, v27);
    v44[0] = @"inputMinComponents";
    v44[1] = @"inputMaxComponents";
    v45[0] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v45[1] = +[CIVector vectorWithX:2.0 Y:2.0 Z:2.0 W:1.0];
    v29 = -[CIImage _imageByApplyingGamma:](-[CIImage imageByApplyingFilter:withInputParameters:](v28, "imageByApplyingFilter:withInputParameters:", @"CIColorClamp", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2]), "_imageByApplyingGamma:", v9);
    if (![(NSNumber *)self->inputDebug BOOLValue])
    {
      v42 = @"inputExtent";
      v43 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v11, v13, v15, v17);
      v29 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v29, "imageByApplyingFilter:withInputParameters:", @"CIAreaRedCentroid", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1]), "imageByClampingToExtent");
      [(CIVector *)self->inputAxisLong _norm];
      float v31 = v30;
      [(CIVector *)self->inputAxisShort _norm];
      if (v4 >= 1)
      {
        float v33 = (v31 * 0.75 + v32 * 0.25) * v39;
        v34 = self->inputImage;
        double v35 = 1.0 - v7;
        do
        {
          double v36 = v35 * v33;
          if (v36 < 0.0) {
            double v36 = 0.0;
          }
          float v33 = v36;
          v40[0] = @"inputExtent";
          v41[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v11, v13, v15, v17);
          v41[1] = v29;
          v40[1] = @"inputCenter";
          v40[2] = @"inputRadialMode";
          v41[2] = &unk_1EE4AA760;
          v40[3] = @"inputRadius";
          *(float *)&double v37 = v33;
          uint64_t v38 = [NSNumber numberWithFloat:v37];
          v40[4] = @"inputMinWeight";
          v41[3] = v38;
          v41[4] = &unk_1EE4A86E0;
          v29 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v34, "imageByApplyingFilter:withInputParameters:", @"CIAreaRedRadialCentroid", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5]), "imageByClampingToExtent");
          --v4;
        }
        while (v4);
      }
    }
    return v29;
  }
}

- (NSNumber)inputIterations
{
  return self->inputIterations;
}

- (void)setInputIterations:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputDecay
{
  return self->inputDecay;
}

- (void)setInputDecay:(id)a3
{
}

- (NSNumber)inputGamma
{
  return self->inputGamma;
}

- (void)setInputGamma:(id)a3
{
}

- (NSNumber)inputClip
{
  return self->inputClip;
}

- (void)setInputClip:(id)a3
{
}

- (NSNumber)inputLocalizationRadius
{
  return self->inputLocalizationRadius;
}

- (void)setInputLocalizationRadius:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (NSNumber)inputDebug
{
  return self->inputDebug;
}

- (void)setInputDebug:(id)a3
{
}

- (CIVector)inputAxisLong
{
  return self->inputAxisLong;
}

- (void)setInputAxisLong:(id)a3
{
}

- (CIVector)inputAxisShort
{
  return self->inputAxisShort;
}

- (void)setInputAxisShort:(id)a3
{
}

- (CIVector)inputPupilCenter
{
  return self->inputPupilCenter;
}

- (void)setInputPupilCenter:(id)a3
{
}

- (NSNumber)inputSearchAxisLong
{
  return self->inputSearchAxisLong;
}

- (void)setInputSearchAxisLong:(id)a3
{
}

- (NSNumber)inputSearchAxisShort
{
  return self->inputSearchAxisShort;
}

- (void)setInputSearchAxisShort:(id)a3
{
}

@end