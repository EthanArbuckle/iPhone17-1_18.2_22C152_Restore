@interface CKPPTSubTest
+ (void)start:(id)a3;
+ (void)stop:(id)a3;
@end

@implementation CKPPTSubTest

+ (void)start:(id)a3
{
  id v5 = a3;
  if (!kApplicationReference && CKIsRunningInMessages())
  {
    uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
    v4 = (void *)kApplicationReference;
    kApplicationReference = v3;
  }
  [(id)kApplicationReference startPPTSubtestForCurrentTest:v5];
}

+ (void)stop:(id)a3
{
  id v5 = a3;
  if (!kApplicationReference && CKIsRunningInMessages())
  {
    uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
    v4 = (void *)kApplicationReference;
    kApplicationReference = v3;
  }
  [(id)kApplicationReference stopPPTSubtestForCurrentTest:v5];
}

@end