@interface CNURL
+ (id)isDirectory;
+ (id)isNotDirectory;
@end

@implementation CNURL

+ (id)isDirectory
{
  return &__block_literal_global_7;
}

+ (id)isNotDirectory
{
  return &__block_literal_global_12;
}

@end