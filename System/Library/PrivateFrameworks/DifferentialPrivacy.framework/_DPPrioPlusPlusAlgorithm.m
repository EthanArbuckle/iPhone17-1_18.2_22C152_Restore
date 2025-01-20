@interface _DPPrioPlusPlusAlgorithm
+ (id)initializeWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5;
- (_DPPrioPlusPlusAlgorithm)initWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5;
- (double)secretSharingSigma;
- (double)sigma;
- (id)randomize:(id)a3;
- (unint64_t)dimension;
@end

@implementation _DPPrioPlusPlusAlgorithm

+ (id)initializeWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithSigma:a5 secretSharingSigma:a3 dimensionality:a4];
  return v5;
}

- (_DPPrioPlusPlusAlgorithm)initWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5
{
  if (+[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:")
    && +[_DPPrioPlusPlusNoiseGenerator isValidSigma:a4]
    && +[_DPPrioPlusPlusNoiseGenerator isValidDimension:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioPlusPlusAlgorithm;
    v9 = [(_DPPrioPlusPlusAlgorithm *)&v12 init];
    if (v9)
    {
      v9->_sigma = a3;
      v9->_secretSharingSigma = a4;
      v9->_dimension = a5;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)randomize:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA58] dataWithData:a3];
  *(float *)&double v5 = _DPClipNorm((float *)[v4 mutableBytes], (unint64_t)objc_msgSend(v4, "length") >> 2, 1.0);
  unint64_t v6 = [(_DPPrioPlusPlusAlgorithm *)self dimension];
  [(_DPPrioPlusPlusAlgorithm *)self sigma];
  id v7 = +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v6);
  unint64_t v8 = [(_DPPrioPlusPlusAlgorithm *)self dimension];
  [(_DPPrioPlusPlusAlgorithm *)self secretSharingSigma];
  v9 = +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v8);
  v13[0] = @"share1";
  v13[1] = @"share2";
  v14[0] = v4;
  v14[1] = v9;
  v13[2] = @"dimensionality";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[_DPPrioPlusPlusAlgorithm dimension](self, "dimension"));
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

- (double)sigma
{
  return self->_sigma;
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