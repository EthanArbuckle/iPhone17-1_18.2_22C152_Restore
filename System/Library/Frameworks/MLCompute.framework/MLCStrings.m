@interface MLCStrings
+ (id)errorDomainGeneric;
+ (id)sortedSequenceLengths;
+ (id)tempDirectoryForANEModels;
+ (id)testing_ResourcePath;
+ (id)unitTestOutputDirectoryPath;
@end

@implementation MLCStrings

+ (id)errorDomainGeneric
{
  return @"com.apple.coreml.foundation";
}

+ (id)tempDirectoryForANEModels
{
  v2 = NSString;
  v3 = NSTemporaryDirectory();
  v4 = [v2 stringWithFormat:@"%@models/", v3];

  return v4;
}

+ (id)sortedSequenceLengths
{
  return @"sortedSequenceLengths";
}

+ (id)testing_ResourcePath
{
  return @"/AppleInternal/Tests/MLCompute/MLCompute_tests.xctest/";
}

+ (id)unitTestOutputDirectoryPath
{
  return @"/tmp/";
}

@end