@interface FBKResolverCurrentBuild
+ (id)name;
- (id)run;
- (int64_t)expectedArguments;
@end

@implementation FBKResolverCurrentBuild

+ (id)name
{
  return @"current_build";
}

- (int64_t)expectedArguments
{
  return 0;
}

- (id)run
{
  return +[FBKSSharedConstants swVers];
}

@end