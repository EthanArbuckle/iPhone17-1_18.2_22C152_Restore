@interface FBSSystemServiceSpecification
+ (NSString)identifier;
@end

@implementation FBSSystemServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.frontboard.system-service";
}

@end