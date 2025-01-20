@interface CIFaceMaskApply
+ (id)_kernel;
- (CIImage)inputImage;
- (CIImage)inputParameterImage;
- (CIVector)inputFacesCenterX;
- (CIVector)inputFacesCenterY;
- (CIVector)inputFacesChinX;
- (CIVector)inputFacesChinY;
- (CIVector)inputK0;
- (CIVector)inputK1;
- (CIVector)inputK2;
- (CIVector)inputK3;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputK4;
- (id)outputImage;
- (void)setInputFacesCenterX:(id)a3;
- (void)setInputFacesCenterY:(id)a3;
- (void)setInputFacesChinX:(id)a3;
- (void)setInputFacesChinY:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputK0:(id)a3;
- (void)setInputK1:(id)a3;
- (void)setInputK2:(id)a3;
- (void)setInputK3:(id)a3;
- (void)setInputK4:(id)a3;
- (void)setInputParameterImage:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIFaceMaskApply

+ (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIFaceMaskApply];
}

- (id)outputImage
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputParameterImage)
    {
      uint64_t v4 = [(id)objc_opt_class() _kernel];
      inputImage = self->inputImage;
      if (v4)
      {
        v85 = (void *)v4;
        [(CIImage *)inputImage extent];
        double v6 = v5;
        [(CIImage *)self->inputImage extent];
        double v8 = v7;
        long long v90 = xmmword_193953200;
        long long v91 = xmmword_193953200;
        double v9 = v7 / v6;
        unint64_t v10 = [(CIVector *)self->inputFacesChinX count];
        if (v10 >= [(CIVector *)self->inputFacesCenterX count]) {
          uint64_t v11 = 96;
        }
        else {
          uint64_t v11 = 112;
        }
        unint64_t v12 = [*(id *)((char *)&self->super.super.isa + v11) count];
        unint64_t v13 = [(CIVector *)self->inputFacesChinY count];
        if (v13 >= [(CIVector *)self->inputFacesCenterY count]) {
          uint64_t v14 = 104;
        }
        else {
          uint64_t v14 = 120;
        }
        unint64_t v15 = [*(id *)((char *)&self->super.super.isa + v14) count];
        double v16 = -1.0;
        double v17 = -1.0;
        double v18 = -1.0;
        if (v12 <= v15) {
          unint64_t v19 = v15;
        }
        else {
          unint64_t v19 = v12;
        }
        double v20 = -1.0;
        double v21 = -1.0;
        double v22 = -1.0;
        double v23 = -1.0;
        double v24 = -1.0;
        double v25 = -1.0;
        if (v19)
        {
          unint64_t v26 = v15;
          for (unint64_t i = 0; i != v19; ++i)
          {
            if (i < v12)
            {
              -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", i, v25, v24, v23, v22);
              double v29 = v28;
              [(CIVector *)self->inputFacesCenterX valueAtIndex:i];
              double v25 = v29 - v30;
              *(float *)&double v25 = v25;
              *((_DWORD *)&v91 + i) = LODWORD(v25);
            }
            if (i < v26)
            {
              [(CIVector *)self->inputFacesChinY valueAtIndex:i];
              double v32 = v31;
              [(CIVector *)self->inputFacesCenterY valueAtIndex:i];
              double v25 = v9 * (v32 - v33);
              *(float *)&double v25 = v25;
              *((_DWORD *)&v90 + i) = LODWORD(v25);
            }
          }
          double v25 = *(float *)&v91;
          double v24 = *((float *)&v91 + 1);
          double v23 = *((float *)&v91 + 2);
          double v22 = *((float *)&v91 + 3);
          double v21 = *(float *)&v90;
          double v20 = *((float *)&v90 + 1);
          double v18 = *((float *)&v90 + 2);
          double v17 = *((float *)&v90 + 3);
        }
        v34 = +[CIVector vectorWithX:v25 / v6 Y:v24 / v6 Z:v23 / v6 W:v22 / v6];
        v35 = +[CIVector vectorWithX:v21 / v8 Y:v20 / v8 Z:v18 / v8 W:v17 / v8];
        [(CIVector *)self->inputFacesCenterX X];
        if (v36 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterX X];
          double v16 = v37 / v6;
        }
        [(CIVector *)self->inputFacesCenterX Y];
        double v38 = -1.0;
        double v39 = -1.0;
        if (v40 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterX Y];
          double v39 = v41 / v6;
        }
        [(CIVector *)self->inputFacesCenterX Z];
        if (v42 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterX Z];
          double v38 = v43 / v6;
        }
        [(CIVector *)self->inputFacesCenterX W];
        double v44 = -1.0;
        double v45 = -1.0;
        if (v46 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterX W];
          double v45 = v47 / v6;
        }
        v48 = +[CIVector vectorWithX:v16 Y:v39 Z:v38 W:v45];
        [(CIVector *)self->inputFacesCenterY X];
        if (v49 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterY X];
          double v44 = v50 / v8;
        }
        [(CIVector *)self->inputFacesCenterY Y];
        double v51 = -1.0;
        double v52 = -1.0;
        if (v53 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterY Y];
          double v52 = v54 / v8;
        }
        [(CIVector *)self->inputFacesCenterY Z];
        if (v55 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterY Z];
          double v51 = v56 / v8;
        }
        [(CIVector *)self->inputFacesCenterY W];
        double v57 = -1.0;
        if (v58 != -1.0)
        {
          [(CIVector *)self->inputFacesCenterY W];
          double v57 = v59 / v8;
        }
        v60 = +[CIVector vectorWithX:v44 Y:v52 Z:v51 W:v57];
        SDOFFaceMaskValue(@"chinThetaLimit", self->inputTuningParameters);
        double v62 = v61;
        SDOFFaceMaskValue(@"chinThetaMultip", self->inputTuningParameters);
        v64 = +[CIVector vectorWithX:v62 Y:v63];
        v89[0] = self->inputImage;
        v89[1] = v48;
        v89[2] = v60;
        v89[3] = v34;
        v89[4] = v35;
        uint64_t v65 = [NSNumber numberWithDouble:v9];
        inputParameterImage = self->inputParameterImage;
        v89[5] = v65;
        v89[6] = inputParameterImage;
        v89[7] = +[CIVector vectorWithX:1.0 / v6 Y:1.0 / v8];
        v89[8] = v64;
        uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:9];
        [(CIImage *)self->inputParameterImage extent];
        uint64_t v69 = v68;
        uint64_t v71 = v70;
        uint64_t v73 = v72;
        uint64_t v75 = v74;
        saveImage(self->inputImage, @"/tmp/inputFaceMask-CI.tiff", 0);
        [(CIImage *)self->inputImage extent];
        double v77 = v76;
        double v79 = v78;
        double v81 = v80;
        double v83 = v82;
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __30__CIFaceMaskApply_outputImage__block_invoke;
        v86[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v86[4] = v69;
        v86[5] = v71;
        v86[6] = v73;
        v86[7] = v75;
        v87[0] = @"kCIKernelOutputFormat";
        v87[1] = @"kCIImageAlphaOne";
        v88[0] = [NSNumber numberWithInt:2053];
        v88[1] = MEMORY[0x1E4F1CC38];
        inputImage = (CIImage *)objc_msgSend(v85, "applyWithExtent:roiCallback:arguments:options:", v86, v67, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v88, v87, 2), v77, v79, v81, v83);
        saveImage(inputImage, @"/tmp/outputFaceMask-CI.tiff", 0);
      }
    }
    return inputImage;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __30__CIFaceMaskApply_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return *(double *)(a1 + 32);
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputParameterImage
{
  return self->inputParameterImage;
}

- (void)setInputParameterImage:(id)a3
{
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
}

- (CIVector)inputK0
{
  return self->inputK0;
}

- (void)setInputK0:(id)a3
{
}

- (CIVector)inputK1
{
  return self->inputK1;
}

- (void)setInputK1:(id)a3
{
}

- (CIVector)inputK2
{
  return self->inputK2;
}

- (void)setInputK2:(id)a3
{
}

- (CIVector)inputK3
{
  return self->inputK3;
}

- (void)setInputK3:(id)a3
{
}

- (NSNumber)inputK4
{
  return self->inputK4;
}

- (void)setInputK4:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

@end