@interface LTInstallRequest
@end

@implementation LTInstallRequest

void __56___LTInstallRequest__startInstallationWithService_done___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v2 = [a1[5] copy];
    v3 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v2;

    objc_storeStrong((id *)WeakRetained + 2, a1[4]);
    objc_msgSend(*((id *)WeakRetained + 2), "startInstallRequest:");
  }
}

@end