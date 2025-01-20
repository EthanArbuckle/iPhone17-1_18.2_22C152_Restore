@interface Matcher
- (BOOL)match:(float *)a3 withLength:(unsigned int)a4;
- (BOOL)matched;
- (Matcher)initWithAnimationName:(id)a3;
- (float)correlation;
- (float)kernel;
- (float)matchStrength;
- (float)normalizedSignal;
- (float)std_floor;
- (float)strengthThreshold;
- (unsigned)correlationLength;
- (unsigned)kernelLength;
- (unsigned)matchIndex;
- (unsigned)sampleThreshold;
- (unsigned)signalCorrLength;
- (unsigned)signalOffset;
- (void)circularCorrelation:(float *)a3 withLength:(unsigned int)a4;
- (void)computeNormalizedSignal:(float *)a3 withLength:(unsigned int)a4;
- (void)dealloc;
- (void)loadTemplate:(id)a3;
- (void)reset;
- (void)setSampleThreshold:(unsigned int)a3;
- (void)setStd_floor:(float)a3;
- (void)setStrengthThreshold:(float)a3;
@end

@implementation Matcher

- (Matcher)initWithAnimationName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Matcher;
  v5 = [(Matcher *)&v10 init];
  v6 = (Matcher *)v5;
  if (v5)
  {
    *(void *)(v5 + 28) = 0x23F4CCCCDLL;
    *((_DWORD *)v5 + 10) = 0;
    *((void *)v5 + 8) = 0;
    *((void *)v5 + 9) = 0;
    [v5 reset];
    [(Matcher *)v6 loadTemplate:v4];
    LODWORD(v7) = v6->_kernelLength;
    unsigned int v8 = ((double)v7 * 0.5);
    v6->_correlationLength = v8;
    v6->_correlation = (float *)malloc_type_realloc(v6->_correlation, 4 * v8, 0x100004052888210uLL);
    v6->_matchError = (float *)malloc_type_realloc(v6->_matchError, 4 * v6->_correlationLength, 0x100004052888210uLL);
  }

  return v6;
}

- (void)reset
{
  self->_matched = 0;
  *(void *)&self->_matchStrength = 0;
}

- (void)dealloc
{
  correlation = self->_correlation;
  if (correlation) {
    free(correlation);
  }
  kernel = self->_kernel;
  if (kernel) {
    free(kernel);
  }
  normalizedSignal = self->_normalizedSignal;
  if (normalizedSignal) {
    free(normalizedSignal);
  }
  matchError = self->_matchError;
  if (matchError) {
    free(matchError);
  }
  v7.receiver = self;
  v7.super_class = (Class)Matcher;
  [(Matcher *)&v7 dealloc];
}

- (void)loadTemplate:(id)a3
{
  id v5 = a3;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 pathForResource:v5 ofType:@"dat"];

  unsigned int v8 = +[NSFileManager defaultManager];
  LOBYTE(v5) = [v8 fileExistsAtPath:v7];

  if ((v5 & 1) != 0
    && (v9 = fopen((const char *)[v7 UTF8String], "rb")) != 0)
  {
    objc_super v10 = v9;
    uint64_t __ptr = 0;
    fread((char *)&__ptr + 4, 4uLL, 1uLL, v9);
    fread(&__ptr, 4uLL, 1uLL, v10);
    uint64_t v11 = HIDWORD(__ptr);
    uint64_t v12 = SHIDWORD(__ptr);
    v13 = (char *)&v16 - ((4 * HIDWORD(__ptr) + 15) & 0x7FFFFFFF0);
    if (fread(v13, __ptr, HIDWORD(__ptr), v10) != v11)
    {
      v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"Matcher.m" lineNumber:87 description:@"Error reading file. Number of elements not as expected."];
    }
    fclose(v10);
    self->_kernelLength = 2 * v12;
    v14 = (float *)malloc_type_realloc(self->_kernel, 4 * (2 * v12), 0x100004052888210uLL);
    self->_kernel = v14;
    memcpy(v14, v13, 4 * v12);
    memcpy(&self->_kernel[v12], v13, 4 * v12);
    uint64_t __StandardDeviation = 0;
    vDSP_normalize(self->_kernel, 1, self->_kernel, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, self->_kernelLength);
    self->_normalizedSignal = (float *)malloc_type_realloc(self->_normalizedSignal, 4 * self->_kernelLength, 0x100004052888210uLL);
  }
  else
  {
    +[NSException raise:NSFileHandleOperationException format:@"Template file not found."];
  }
}

- (BOOL)match:(float *)a3 withLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[Matcher computeNormalizedSignal:withLength:](self, "computeNormalizedSignal:withLength:", a3);
  vDSP_Length __I = 0;
  float __C = 0.0;
  vDSP_maxvi(self->_normalizedSignal, 1, &__C, &__I, v4);
  [(Matcher *)self circularCorrelation:self->_normalizedSignal withLength:v4];
  if (self->_matchStrength < self->_strengthThreshold) {
    goto LABEL_5;
  }
  int v6 = self->_matchIndex - __I;
  if (v6 < 0) {
    int v6 = __I - self->_matchIndex;
  }
  if ((signed int)(v6 % (self->_kernelLength >> 1)) <= (signed int)self->_sampleThreshold) {
    BOOL result = 1;
  }
  else {
LABEL_5:
  }
    BOOL result = 0;
  self->_matched = result;
  return result;
}

- (void)computeNormalizedSignal:(float *)a3 withLength:(unsigned int)a4
{
  vDSP_Length v6 = a4;
  if (self->_kernelLength < a4) {
    self->_normalizedSignal = (float *)malloc_type_realloc(self->_normalizedSignal, 4 * a4, 0x100004052888210uLL);
  }
  uint64_t __StandardDeviation = 0;
  vDSP_normalize(a3, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v6);
  *((float *)&__StandardDeviation + 1) = -*((float *)&__StandardDeviation + 1);
  vDSP_vsadd(a3, 1, (const float *)&__StandardDeviation + 1, self->_normalizedSignal, 1, v6);
  if (*(float *)&__StandardDeviation < self->_std_floor) {
    *(float *)&uint64_t __StandardDeviation = self->_std_floor;
  }
  vDSP_vsdiv(self->_normalizedSignal, 1, (const float *)&__StandardDeviation, self->_normalizedSignal, 1, v6);
}

- (void)circularCorrelation:(float *)a3 withLength:(unsigned int)a4
{
  self->_uint64_t signalOffset = 0;
  self->_vDSP_Length signalCorrLength = a4;
  LODWORD(v4) = self->_kernelLength;
  double v7 = (double)v4 * 0.5;
  if (v7 >= (double)a4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = a4 - v7;
    self->_uint64_t signalOffset = v8;
    self->_vDSP_Length signalCorrLength = v7;
    a4 = v7;
  }
  vDSP_conv(self->_kernel, 1, &a3[v8], 1, self->_correlation, 1, self->_correlationLength, a4);
  vDSP_Length __I = 0;
  vDSP_maxvi(self->_correlation, 1, &self->_matchStrength, &__I, self->_correlationLength);
  vDSP_Length signalCorrLength = self->_signalCorrLength;
  self->_matchStrength = self->_matchStrength / (float)signalCorrLength;
  int v11 = __I;
  if (__I) {
    int v11 = self->_correlationLength - __I;
  }
  uint64_t signalOffset = self->_signalOffset;
  LODWORD(v9) = self->_kernelLength;
  self->_matchIndex = v11 + signalOffset;
  vDSP_vsub(&self->_kernel[((double)v9 * 0.5) - v11], 1, &a3[signalOffset], 1, self->_matchError, 1, signalCorrLength);
  vDSP_vabs(self->_matchError, 1, self->_matchError, 1, signalCorrLength);
  float __C = 0.0;
  vDSP_maxv(self->_matchError, 1, &__C, signalCorrLength);
  self->_matchStrength = 1.0 - __C;
}

- (float)strengthThreshold
{
  return self->_strengthThreshold;
}

- (void)setStrengthThreshold:(float)a3
{
  self->_strengthThreshold = a3;
}

- (unsigned)sampleThreshold
{
  return self->_sampleThreshold;
}

- (void)setSampleThreshold:(unsigned int)a3
{
  self->_sampleThreshold = a3;
}

- (float)std_floor
{
  return self->_std_floor;
}

- (void)setStd_floor:(float)a3
{
  self->_std_floor = a3;
}

- (BOOL)matched
{
  return self->_matched;
}

- (float)normalizedSignal
{
  return self->_normalizedSignal;
}

- (float)kernel
{
  return self->_kernel;
}

- (unsigned)kernelLength
{
  return self->_kernelLength;
}

- (float)correlation
{
  return self->_correlation;
}

- (unsigned)correlationLength
{
  return self->_correlationLength;
}

- (float)matchStrength
{
  return self->_matchStrength;
}

- (unsigned)matchIndex
{
  return self->_matchIndex;
}

- (unsigned)signalOffset
{
  return self->_signalOffset;
}

- (unsigned)signalCorrLength
{
  return self->_signalCorrLength;
}

@end