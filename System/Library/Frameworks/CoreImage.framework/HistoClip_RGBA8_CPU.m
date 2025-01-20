@interface HistoClip_RGBA8_CPU
- (CIImage)inputCenterLeft;
- (CIImage)inputCenterRight;
- (CIImage)inputDetectionLeft;
- (CIImage)inputDetectionRight;
- (CIImage)inputImage;
- (CIVector)inputCenterExtentLeft;
- (CIVector)inputCenterExtentRight;
- (CIVector)inputCenterOffsetLeft;
- (CIVector)inputCenterOffsetRight;
- (CIVector)inputMaxArea;
- (CIVector)inputMaxAreaRatio;
- (CIVector)inputMinimum;
- (NSNumber)inputAbortMaxCenterDist;
- (NSNumber)inputDensityRadius;
- (NSNumber)inputInterPeakMinRepair;
- (NSNumber)inputMaxInterDispersion;
- (NSNumber)inputMaxRelDensity;
- (NSNumber)inputMinDensity;
- (NSNumber)inputMinGobalLocalMeanDiff;
- (NSNumber)inputMinInterDispersion;
- (NSNumber)inputPercentRepair;
- (NSNumber)inputPercentSpecular;
- (NSNumber)inputPercentileRepair;
- (NSNumber)inputPercentileSpecular;
- (NSNumber)inputTuning;
- (id)outputImage;
- (void)setInputAbortMaxCenterDist:(id)a3;
- (void)setInputCenterExtentLeft:(id)a3;
- (void)setInputCenterExtentRight:(id)a3;
- (void)setInputCenterLeft:(id)a3;
- (void)setInputCenterOffsetLeft:(id)a3;
- (void)setInputCenterOffsetRight:(id)a3;
- (void)setInputCenterRight:(id)a3;
- (void)setInputDensityRadius:(id)a3;
- (void)setInputDetectionLeft:(id)a3;
- (void)setInputDetectionRight:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputInterPeakMinRepair:(id)a3;
- (void)setInputMaxArea:(id)a3;
- (void)setInputMaxAreaRatio:(id)a3;
- (void)setInputMaxInterDispersion:(id)a3;
- (void)setInputMaxRelDensity:(id)a3;
- (void)setInputMinDensity:(id)a3;
- (void)setInputMinGobalLocalMeanDiff:(id)a3;
- (void)setInputMinInterDispersion:(id)a3;
- (void)setInputMinimum:(id)a3;
- (void)setInputPercentRepair:(id)a3;
- (void)setInputPercentSpecular:(id)a3;
- (void)setInputPercentileRepair:(id)a3;
- (void)setInputPercentileSpecular:(id)a3;
- (void)setInputTuning:(id)a3;
@end

@implementation HistoClip_RGBA8_CPU

- (id)outputImage
{
  v34[5] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  double v3 = *MEMORY[0x1E4F1DB10];
  double v4 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputCenterLeft = self->inputCenterLeft;
  v34[0] = self->inputImage;
  v34[1] = inputCenterLeft;
  inputDetectionLeft = self->inputDetectionLeft;
  v34[2] = self->inputCenterRight;
  v34[3] = inputDetectionLeft;
  v34[4] = self->inputDetectionRight;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  inputPercentileRepair = self->inputPercentileRepair;
  v32[0] = @"percentileRepair";
  v32[1] = @"percentileSpecular";
  inputPercentileSpecular = self->inputPercentileSpecular;
  inputPercentRepair = self->inputPercentRepair;
  v33[0] = inputPercentileRepair;
  v33[1] = inputPercentileSpecular;
  inputPercentSpecular = self->inputPercentSpecular;
  v32[2] = @"percentRepair";
  v32[3] = @"percentSpecular";
  v33[2] = inputPercentRepair;
  v33[3] = inputPercentSpecular;
  inputInterPeakMinRepair = self->inputInterPeakMinRepair;
  inputMinimum = self->inputMinimum;
  v32[4] = @"interPeakMinRepair";
  v32[5] = @"threshold";
  inputMaxArea = self->inputMaxArea;
  v33[4] = inputInterPeakMinRepair;
  v33[5] = inputMinimum;
  v32[6] = @"area";
  v32[7] = @"centerOffsetLeft";
  inputCenterOffsetLeft = self->inputCenterOffsetLeft;
  inputCenterOffsetRight = self->inputCenterOffsetRight;
  v33[6] = inputMaxArea;
  v33[7] = inputCenterOffsetLeft;
  inputCenterExtentLeft = self->inputCenterExtentLeft;
  v32[8] = @"centerOffsetRight";
  v32[9] = @"centerExtentLeft";
  v33[8] = inputCenterOffsetRight;
  v33[9] = inputCenterExtentLeft;
  inputCenterExtentRight = self->inputCenterExtentRight;
  inputAbortMaxCenterDist = self->inputAbortMaxCenterDist;
  v32[10] = @"centerExtentRight";
  v32[11] = @"abortMaxCenterDist";
  inputMinDensity = self->inputMinDensity;
  v33[10] = inputCenterExtentRight;
  v33[11] = inputAbortMaxCenterDist;
  v32[12] = @"minDensity";
  v32[13] = @"maxRelDensity";
  inputMaxRelDensity = self->inputMaxRelDensity;
  inputDensityRadius = self->inputDensityRadius;
  v33[12] = inputMinDensity;
  v33[13] = inputMaxRelDensity;
  inputMaxAreaRatio = self->inputMaxAreaRatio;
  v32[14] = @"densityRadius";
  v32[15] = @"areaMaxRatio";
  v33[14] = inputDensityRadius;
  v33[15] = inputMaxAreaRatio;
  v33[16] = self->inputTuning;
  v32[16] = @"tuning";
  v32[17] = @"roi";
  [(CIImage *)self->inputImage extent];
  v26 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  inputMinInterDispersion = self->inputMinInterDispersion;
  v33[17] = v26;
  v33[18] = inputMinInterDispersion;
  inputMaxInterDispersion = self->inputMaxInterDispersion;
  v32[18] = @"minInterDispersion";
  v32[19] = @"maxInterDispersion";
  v32[20] = @"minGobalLocalMeanDiff";
  inputMinGobalLocalMeanDiff = self->inputMinGobalLocalMeanDiff;
  v33[19] = inputMaxInterDispersion;
  v33[20] = inputMinGobalLocalMeanDiff;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PercentileClipProcessor_RGBA8_CPU, "applyWithExtent:inputs:arguments:error:", v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:21], &v31, v3, v4, v5, v6);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputCenterLeft
{
  return self->inputCenterLeft;
}

- (void)setInputCenterLeft:(id)a3
{
}

- (CIImage)inputCenterRight
{
  return self->inputCenterRight;
}

- (void)setInputCenterRight:(id)a3
{
}

- (CIVector)inputCenterExtentLeft
{
  return self->inputCenterExtentLeft;
}

- (void)setInputCenterExtentLeft:(id)a3
{
}

- (CIVector)inputCenterExtentRight
{
  return self->inputCenterExtentRight;
}

- (void)setInputCenterExtentRight:(id)a3
{
}

- (NSNumber)inputPercentileRepair
{
  return self->inputPercentileRepair;
}

- (void)setInputPercentileRepair:(id)a3
{
}

- (NSNumber)inputPercentileSpecular
{
  return self->inputPercentileSpecular;
}

- (void)setInputPercentileSpecular:(id)a3
{
}

- (NSNumber)inputPercentRepair
{
  return self->inputPercentRepair;
}

- (void)setInputPercentRepair:(id)a3
{
}

- (NSNumber)inputPercentSpecular
{
  return self->inputPercentSpecular;
}

- (void)setInputPercentSpecular:(id)a3
{
}

- (NSNumber)inputInterPeakMinRepair
{
  return self->inputInterPeakMinRepair;
}

- (void)setInputInterPeakMinRepair:(id)a3
{
}

- (NSNumber)inputAbortMaxCenterDist
{
  return self->inputAbortMaxCenterDist;
}

- (void)setInputAbortMaxCenterDist:(id)a3
{
}

- (NSNumber)inputMinDensity
{
  return self->inputMinDensity;
}

- (void)setInputMinDensity:(id)a3
{
}

- (NSNumber)inputMaxRelDensity
{
  return self->inputMaxRelDensity;
}

- (void)setInputMaxRelDensity:(id)a3
{
}

- (NSNumber)inputDensityRadius
{
  return self->inputDensityRadius;
}

- (void)setInputDensityRadius:(id)a3
{
}

- (NSNumber)inputMinInterDispersion
{
  return self->inputMinInterDispersion;
}

- (void)setInputMinInterDispersion:(id)a3
{
}

- (NSNumber)inputMaxInterDispersion
{
  return self->inputMaxInterDispersion;
}

- (void)setInputMaxInterDispersion:(id)a3
{
}

- (NSNumber)inputMinGobalLocalMeanDiff
{
  return self->inputMinGobalLocalMeanDiff;
}

- (void)setInputMinGobalLocalMeanDiff:(id)a3
{
}

- (CIVector)inputMinimum
{
  return self->inputMinimum;
}

- (void)setInputMinimum:(id)a3
{
}

- (CIVector)inputMaxArea
{
  return self->inputMaxArea;
}

- (void)setInputMaxArea:(id)a3
{
}

- (CIVector)inputMaxAreaRatio
{
  return self->inputMaxAreaRatio;
}

- (void)setInputMaxAreaRatio:(id)a3
{
}

- (CIVector)inputCenterOffsetLeft
{
  return self->inputCenterOffsetLeft;
}

- (void)setInputCenterOffsetLeft:(id)a3
{
}

- (CIVector)inputCenterOffsetRight
{
  return self->inputCenterOffsetRight;
}

- (void)setInputCenterOffsetRight:(id)a3
{
}

- (CIImage)inputDetectionLeft
{
  return self->inputDetectionLeft;
}

- (void)setInputDetectionLeft:(id)a3
{
}

- (CIImage)inputDetectionRight
{
  return self->inputDetectionRight;
}

- (void)setInputDetectionRight:(id)a3
{
}

- (NSNumber)inputTuning
{
  return self->inputTuning;
}

- (void)setInputTuning:(id)a3
{
}

@end