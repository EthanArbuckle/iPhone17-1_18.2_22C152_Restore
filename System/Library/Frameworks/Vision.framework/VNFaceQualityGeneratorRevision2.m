@interface VNFaceQualityGeneratorRevision2
+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNFaceQualityGeneratorRevision2

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  v3 = "v2";
  unint64_t v4 = 2;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"face_quality_v2.0_fp16.espresso";
}

@end