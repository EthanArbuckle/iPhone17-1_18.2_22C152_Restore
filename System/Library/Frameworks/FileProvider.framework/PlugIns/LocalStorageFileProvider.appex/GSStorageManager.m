@interface GSStorageManager
+ (id)fp_defaultManager;
@end

@implementation GSStorageManager

+ (id)fp_defaultManager
{
  return +[GSStorageManager manager];
}

@end