@interface ISLuminanceGrayscaleConversion
- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:;
- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:;
@end

@implementation ISLuminanceGrayscaleConversion

- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:
{
  return 0.000352343834;
}

- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:
{
  return 0.000352343834;
}

@end