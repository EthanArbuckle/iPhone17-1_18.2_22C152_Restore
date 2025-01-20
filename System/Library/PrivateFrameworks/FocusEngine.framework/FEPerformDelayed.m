@interface FEPerformDelayed
@end

@implementation FEPerformDelayed

void ___FEPerformDelayed_block_invoke()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_269A11C30;
  uint64_t v7 = qword_269A11C30;
  if (!qword_269A11C30)
  {
    UIKitCoreLibraryCore();
    v5[3] = (uint64_t)objc_getClass("UIApplication");
    qword_269A11C30 = v5[3];
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  uint64_t v2 = [v1 sharedApplication];
  v3 = (void *)qword_269A11C20;
  qword_269A11C20 = v2;
}

void ___FEPerformDelayed_block_invoke_0()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_269A11C78;
  uint64_t v7 = qword_269A11C78;
  if (!qword_269A11C78)
  {
    UIKitCoreLibraryCore_2();
    v5[3] = (uint64_t)objc_getClass("UIApplication");
    qword_269A11C78 = v5[3];
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  uint64_t v2 = [v1 sharedApplication];
  v3 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v2;
}

@end