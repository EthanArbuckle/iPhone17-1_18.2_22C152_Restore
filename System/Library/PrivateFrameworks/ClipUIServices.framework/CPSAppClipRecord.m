@interface CPSAppClipRecord
@end

@implementation CPSAppClipRecord

void __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 placeholder] & 1) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke_2;
    v4[3] = &unk_1E6AE8D50;
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke_2(uint64_t a1)
{
}

@end