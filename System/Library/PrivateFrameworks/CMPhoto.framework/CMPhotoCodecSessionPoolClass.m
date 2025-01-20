@interface CMPhotoCodecSessionPoolClass
@end

@implementation CMPhotoCodecSessionPoolClass

void __CMPhotoCodecSessionPoolClass_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 16) = 1;
  v3 = *(NSObject **)(v2 + 136);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 128))
    {
      dispatch_resume(*(dispatch_object_t *)(v4 + 136));
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
    }
  }
}

@end