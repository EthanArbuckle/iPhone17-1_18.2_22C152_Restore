@interface MagnifierObjc
+ (BOOL)catchException:(id)a3 error:(id *)a4;
+ (void)sbs_unlockDeviceIfNeededAndPerform:(id)a3;
@end

@implementation MagnifierObjc

+ (BOOL)catchException:(id)a3 error:(id *)a4
{
  v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

+ (void)sbs_unlockDeviceIfNeededAndPerform:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  SBSRequestPasscodeUnlockUI();
}

uint64_t __52__MagnifierObjc_sbs_unlockDeviceIfNeededAndPerform___block_invoke(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

@end