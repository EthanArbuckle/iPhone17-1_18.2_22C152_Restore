@interface _EXExtensionApplication
+ (BOOL)_wantsApplicationBehaviorAsExtension;
@end

@implementation _EXExtensionApplication

+ (BOOL)_wantsApplicationBehaviorAsExtension
{
  return 1;
}

@end