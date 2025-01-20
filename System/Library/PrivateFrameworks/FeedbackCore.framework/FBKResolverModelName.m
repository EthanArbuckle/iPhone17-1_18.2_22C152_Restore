@interface FBKResolverModelName
+ (id)name;
- (id)run;
- (int64_t)expectedArguments;
@end

@implementation FBKResolverModelName

+ (id)name
{
  return @"model_name";
}

- (int64_t)expectedArguments
{
  return 0;
}

- (id)run
{
  return +[FBKSharedConstants modelName];
}

@end