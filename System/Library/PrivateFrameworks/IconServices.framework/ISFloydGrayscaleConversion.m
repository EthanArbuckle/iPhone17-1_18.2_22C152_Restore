@interface ISFloydGrayscaleConversion
- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:;
- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:;
@end

@implementation ISFloydGrayscaleConversion

- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:
{
  return 0.0000305175853;
}

- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:
{
  return 0.0000305175853;
}

@end