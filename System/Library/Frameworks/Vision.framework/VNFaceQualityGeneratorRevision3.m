@interface VNFaceQualityGeneratorRevision3
+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNFaceQualityGeneratorRevision3

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  v3 = "v3_drop4";
  unint64_t v4 = 8;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"facequality_regression-n6vfnwub35_11333-quant-fp16.espresso";
}

@end