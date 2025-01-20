@interface ATXDeviceClass
+ (BOOL)isConstrainedForActions;
+ (BOOL)shouldComputeActions;
@end

@implementation ATXDeviceClass

+ (BOOL)shouldComputeActions
{
  return !+[ATXDeviceClass isConstrainedForActions];
}

+ (BOOL)isConstrainedForActions
{
  if (isConstrainedForActions_onceToken != -1) {
    dispatch_once(&isConstrainedForActions_onceToken, &__block_literal_global_28);
  }
  return isConstrainedForActions_constrained;
}

void __41__ATXDeviceClass_isConstrainedForActions__block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  unint64_t v1 = [v0 physicalMemory];

  if (v1 <= 0x64000000) {
    isConstrainedForActions_constrained = 1;
  }
}

@end