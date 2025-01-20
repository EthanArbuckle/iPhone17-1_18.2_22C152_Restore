@interface NSString(CacheManagementAdditions)
+ (id)stringWithFileSystemRepresentation:()CacheManagementAdditions length:;
+ (uint64_t)stringWithFileSystemRepresentation:()CacheManagementAdditions;
@end

@implementation NSString(CacheManagementAdditions)

+ (id)stringWithFileSystemRepresentation:()CacheManagementAdditions length:
{
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v6 stringWithFileSystemRepresentation:a3 length:a4];

  return v7;
}

+ (uint64_t)stringWithFileSystemRepresentation:()CacheManagementAdditions
{
  size_t v4 = strlen(__s);
  v5 = NSString;
  return [v5 stringWithFileSystemRepresentation:__s length:v4];
}

@end