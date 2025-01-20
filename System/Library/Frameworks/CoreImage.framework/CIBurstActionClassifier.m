@interface CIBurstActionClassifier
- (BOOL)isBurstAction;
- (CIBurstActionClassifier)init;
- (CIBurstActionClassifier)initWithVersion:(int)a3;
- (__SVMParameters)svmParameters;
- (double)computeKernelValueWithSupportVector:(const CIBurstSupportVector *)a3;
- (float)predictResult;
- (float)testAverageCameraTravelDistance;
- (float)testAverageRegistrationErrorSkewness;
- (float)testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix;
- (float)testInOutRatio;
- (float)testMaxInnerDistance;
- (float)testMaxPeakRegistrationError;
- (float)testMaxRegistrationErrorIntegral;
- (float)testMaxRegistrationErrorSkewness;
- (float)testMeanPeakRegistrationError;
- (float)testMinRegionOfInterestSize;
- (void)scaleVector;
- (void)setSvmParameters:(__SVMParameters *)a3;
- (void)setTestAverageCameraTravelDistance:(float)a3;
- (void)setTestAverageRegistrationErrorSkewness:(float)a3;
- (void)setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:(float)a3;
- (void)setTestInOutRatio:(float)a3;
- (void)setTestMaxInnerDistance:(float)a3;
- (void)setTestMaxPeakRegistrationError:(float)a3;
- (void)setTestMaxRegistrationErrorIntegral:(float)a3;
- (void)setTestMaxRegistrationErrorSkewness:(float)a3;
- (void)setTestMeanPeakRegistrationError:(float)a3;
- (void)setTestMinRegionOfInterestSize:(float)a3;
@end

@implementation CIBurstActionClassifier

- (CIBurstActionClassifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIBurstActionClassifier;
  result = [(CIBurstActionClassifier *)&v3 init];
  if (result)
  {
    *(void *)&result->testMinRegionOfInterestSize = 2139095039;
    *(_OWORD *)&result->testAverageCameraTravelDistance = 0u;
    *(_OWORD *)&result->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix = 0u;
    result->hasBeenScaled = 0;
  }
  return result;
}

- (CIBurstActionClassifier)initWithVersion:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CIBurstActionClassifier;
  v4 = [(CIBurstActionClassifier *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1) {
      v6 = &g_svmParameters_v1;
    }
    else {
      v6 = &g_svmParameters_v2;
    }
    [(CIBurstActionClassifier *)v4 setSvmParameters:v6];
  }
  return v5;
}

- (void)scaleVector
{
  if (!self->hasBeenScaled)
  {
    objc_super v3 = [(CIBurstActionClassifier *)self svmParameters];
    long double v4 = log((float)(self->testAverageCameraTravelDistance + 1.0));
    uint64_t v5 = 0;
    *(float *)&long double v4 = v4;
    self->testAverageCameraTravelDistance = *(float *)&v4;
    self->testVector[0] = *(float *)&v4;
    double v6 = (float)(self->testMeanPeakRegistrationError / self->testMaxPeakRegistrationError);
    self->testVector[1] = self->testMaxRegistrationErrorIntegral;
    self->testVector[2] = v6;
    float32x2_t v7 = *(float32x2_t *)&self->testMaxInnerDistance;
    *(float64x2_t *)&self->testVector[3] = vcvtq_f64_f32(*(float32x2_t *)&self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix);
    *(float64x2_t *)&self->testVector[5] = vcvtq_f64_f32(v7);
    do
    {
      self->testVector[v5] = (self->testVector[v5] - v3->var0[v5].var1) / v3->var0[v5].var0;
      ++v5;
    }
    while (v5 != 7);
    BurstLoggingMessage("\tscaled Average Camera Travel Distance = %f\n", self->testVector[0]);
    BurstLoggingMessage("\tscaled Max Registration Error Integral = %f\n", self->testVector[1]);
    BurstLoggingMessage("\tscaled Mean peak registration error / Max peak registration error = %f\n", self->testVector[2]);
    BurstLoggingMessage("\tscaled Beginning vs. End AEMatrix difference vs. Average of Adjacent AE Matrix Differences = %f\n", self->testVector[3]);
    BurstLoggingMessage("\tscaled In-out ratio = %f\n", self->testVector[4]);
    BurstLoggingMessage("\tscaled Max inner distance = %f\n", self->testVector[5]);
    BurstLoggingMessage("\tscaled Average registration error skewness = %f\n", self->testVector[6]);
    self->hasBeenScaled = 1;
  }
}

- (double)computeKernelValueWithSupportVector:(const CIBurstSupportVector *)a3
{
  if (!self->hasBeenScaled) {
    return 0.0;
  }
  uint64_t v3 = 0;
  double v4 = 0.0;
  do
  {
    double v5 = a3->var1[v3] - self->testVector[v3];
    double v4 = v4 + v5 * v5;
    ++v3;
  }
  while (v3 != 7);
  double var0 = a3->var0;
  return var0 * exp(-((double)[(CIBurstActionClassifier *)self svmParameters][56] * v4));
}

- (float)predictResult
{
  uint64_t v3 = 0;
  double v4 = 0.0 - (double)[(CIBurstActionClassifier *)self svmParameters][64];
  do
  {
    [(CIBurstActionClassifier *)self computeKernelValueWithSupportVector:(void)[(CIBurstActionClassifier *)self svmParameters][80] + v3];
    double v4 = v4 + v5;
    v3 += 64;
  }
  while (v3 != 2880);
  for (uint64_t i = 0; i != 2816; i += 64)
  {
    [(CIBurstActionClassifier *)self computeKernelValueWithSupportVector:(void)[(CIBurstActionClassifier *)self svmParameters][88] + i];
    double v4 = v4 + v7;
  }
  return v4;
}

- (BOOL)isBurstAction
{
  float testMaxPeakRegistrationError = self->testMaxPeakRegistrationError;
  if (testMaxPeakRegistrationError >= 7250.0)
  {
    BurstLoggingMessage("Non-Linear SVM Action classifier called with:\n", a2);
    BurstLoggingMessage("\tAverage Camera Travel Distance = %f\n", self->testAverageCameraTravelDistance);
    BurstLoggingMessage("\tMax Registration Error Integral = %f\n", self->testMaxRegistrationErrorIntegral);
    BurstLoggingMessage("\tMean peak registration error / Max peak registration error = %f\n", (float)(self->testMeanPeakRegistrationError / self->testMaxPeakRegistrationError));
    BurstLoggingMessage("\tBeginning vs. End AEMatrix difference vs. Average of Adjacent AE Matrix Differences = %f\n", self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix);
    BurstLoggingMessage("\tIn-out ratio = %f\n", self->testInOutRatio);
    BurstLoggingMessage("\tMax inner distance = %f\n", self->testMaxInnerDistance);
    BurstLoggingMessage("\tAverage registration error skewness = %f\n", self->testAverageRegistrationErrorSkewness);
    [(CIBurstActionClassifier *)self scaleVector];
    [(CIBurstActionClassifier *)self predictResult];
    BOOL v3 = v5 >= 0.0;
    double v6 = "NON-ACTION";
    if (v5 >= 0.0) {
      double v6 = "ACTION";
    }
    BurstLoggingMessage("PREDICTION: --- %s --- (value = %f)\n", v6, v5);
  }
  else
  {
    BurstLoggingMessage("Sequence classified as NON-ACTION due to complete lack of local motion (%f, threshold %f)\n", testMaxPeakRegistrationError, 7250.0);
    return 0;
  }
  return v3;
}

- (float)testAverageCameraTravelDistance
{
  return self->testAverageCameraTravelDistance;
}

- (void)setTestAverageCameraTravelDistance:(float)a3
{
  self->testAverageCameraTravelDistance = a3;
}

- (float)testMaxRegistrationErrorIntegral
{
  return self->testMaxRegistrationErrorIntegral;
}

- (void)setTestMaxRegistrationErrorIntegral:(float)a3
{
  self->testMaxRegistrationErrorIntegral = a3;
}

- (float)testMaxPeakRegistrationError
{
  return self->testMaxPeakRegistrationError;
}

- (void)setTestMaxPeakRegistrationError:(float)a3
{
  self->float testMaxPeakRegistrationError = a3;
}

- (float)testMeanPeakRegistrationError
{
  return self->testMeanPeakRegistrationError;
}

- (void)setTestMeanPeakRegistrationError:(float)a3
{
  self->testMeanPeakRegistrationError = a3;
}

- (float)testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix
{
  return self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix;
}

- (void)setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:(float)a3
{
  self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix = a3;
}

- (float)testInOutRatio
{
  return self->testInOutRatio;
}

- (void)setTestInOutRatio:(float)a3
{
  self->testInOutRatio = a3;
}

- (float)testMaxInnerDistance
{
  return self->testMaxInnerDistance;
}

- (void)setTestMaxInnerDistance:(float)a3
{
  self->testMaxInnerDistance = a3;
}

- (float)testAverageRegistrationErrorSkewness
{
  return self->testAverageRegistrationErrorSkewness;
}

- (void)setTestAverageRegistrationErrorSkewness:(float)a3
{
  self->testAverageRegistrationErrorSkewness = a3;
}

- (float)testMinRegionOfInterestSize
{
  return self->testMinRegionOfInterestSize;
}

- (void)setTestMinRegionOfInterestSize:(float)a3
{
  self->testMinRegionOfInterestSize = a3;
}

- (float)testMaxRegistrationErrorSkewness
{
  return self->testMaxRegistrationErrorSkewness;
}

- (void)setTestMaxRegistrationErrorSkewness:(float)a3
{
  self->testMaxRegistrationErrorSkewness = a3;
}

- (__SVMParameters)svmParameters
{
  return self->_svmParameters;
}

- (void)setSvmParameters:(__SVMParameters *)a3
{
  self->_svmParameters = a3;
}

@end