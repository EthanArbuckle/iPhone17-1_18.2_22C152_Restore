@interface DMFTaskRequest
+ (BOOL)isPermittedOnCurrentPlatform;
+ (BOOL)isPermittedOnPlatform:(unint64_t)a3;
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (NSArray)permittedPlatforms;
@end

@implementation DMFTaskRequest

+ (NSArray)permittedPlatforms
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)isPermittedOnCurrentPlatform
{
  return [a1 isPermittedOnPlatform:1];
}

+ (BOOL)isPermittedOnPlatform:(unint64_t)a3
{
  v4 = [a1 permittedPlatforms];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

@end