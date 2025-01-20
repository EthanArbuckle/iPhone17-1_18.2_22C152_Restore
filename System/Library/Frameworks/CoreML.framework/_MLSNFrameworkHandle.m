@interface _MLSNFrameworkHandle
+ (id)sharedHandle;
- (_MLSNFrameworkHandle)init;
@end

@implementation _MLSNFrameworkHandle

- (_MLSNFrameworkHandle)init
{
  v4.receiver = self;
  v4.super_class = (Class)_MLSNFrameworkHandle;
  v2 = [(_MLSNFrameworkHandle *)&v4 init];
  if (v2) {
    dlopen("/System/Library/Frameworks/SoundAnalysis.framework/SoundAnalysis", 4);
  }
  return v2;
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken != -1) {
    dispatch_once(&sharedHandle_onceToken, &__block_literal_global_692);
  }
  v2 = (void *)sharedHandle_singleton;

  return v2;
}

@end