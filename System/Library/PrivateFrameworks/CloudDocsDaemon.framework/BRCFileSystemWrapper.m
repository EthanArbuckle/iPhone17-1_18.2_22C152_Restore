@interface BRCFileSystemWrapper
+ (int)recursiveRemove:(id)a3;
@end

@implementation BRCFileSystemWrapper

+ (int)recursiveRemove:(id)a3
{
  return BRCRecursiveRemove(a3);
}

@end