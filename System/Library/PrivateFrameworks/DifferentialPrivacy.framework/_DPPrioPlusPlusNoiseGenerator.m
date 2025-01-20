@interface _DPPrioPlusPlusNoiseGenerator
+ (BOOL)isValidDimension:(unint64_t)a3;
+ (BOOL)isValidSigma:(double)a3;
+ (id)randomize:(id)a3 dimension:(unint64_t)a4 stddev:(double)a5;
@end

@implementation _DPPrioPlusPlusNoiseGenerator

+ (id)randomize:(id)a3 dimension:(unint64_t)a4 stddev:(double)a5
{
  id v7 = a3;
  v8 = +[_DPGaussianPRNG generateSeed];
  v9 = +[_DPGaussianPRNG randomFloatVectorFromSeed:v8 length:a4 mean:0.0 stddev:a5];
  if (v9)
  {
    v10 = (float *)[v7 mutableBytes];
    for (i = (float *)[v9 bytes]; a4; --a4)
    {
      float v12 = *i++;
      float *v10 = *v10 - v12;
      ++v10;
    }
    id v13 = v8;
  }
  else
  {
    v14 = +[_DPLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](v14);
    }

    id v13 = 0;
  }

  return v13;
}

+ (BOOL)isValidSigma:(double)a3
{
  return a3 > 0.0;
}

+ (BOOL)isValidDimension:(unint64_t)a3
{
  return a3 - 1 < 0x39FBC;
}

+ (void)randomize:(os_log_t)log dimension:stddev:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusNoiseGenerator failed to generate random numbers from a seed.", v1, 2u);
}

@end