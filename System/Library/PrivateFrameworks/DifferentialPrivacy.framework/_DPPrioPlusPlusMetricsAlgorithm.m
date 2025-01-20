@interface _DPPrioPlusPlusMetricsAlgorithm
+ (id)initializeWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4;
- (_DPPrioPlusPlusMetricsAlgorithm)initWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4;
- (double)secretSharingSigma;
- (id)randomize:(id)a3;
- (unint64_t)dimension;
@end

@implementation _DPPrioPlusPlusMetricsAlgorithm

+ (id)initializeWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSecretSharingSigma:a4 dimensionality:a3];
  return v4;
}

- (_DPPrioPlusPlusMetricsAlgorithm)initWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4
{
  if (+[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:")
    && +[_DPPrioPlusPlusNoiseGenerator isValidDimension:a4])
  {
    v10.receiver = self;
    v10.super_class = (Class)_DPPrioPlusPlusMetricsAlgorithm;
    v7 = [(_DPPrioPlusPlusMetricsAlgorithm *)&v10 init];
    if (v7)
    {
      v7->_secretSharingSigma = a3;
      v7->_dimension = a4;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)randomize:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA58] dataWithData:a3];
  unint64_t v5 = [(_DPPrioPlusPlusMetricsAlgorithm *)self dimension];
  [(_DPPrioPlusPlusMetricsAlgorithm *)self secretSharingSigma];
  v6 = +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v5);
  v10[0] = @"share1";
  v10[1] = @"share2";
  v11[0] = v4;
  v11[1] = v6;
  v10[2] = @"dimensionality";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[_DPPrioPlusPlusMetricsAlgorithm dimension](self, "dimension"));
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (double)secretSharingSigma
{
  return self->_secretSharingSigma;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

@end