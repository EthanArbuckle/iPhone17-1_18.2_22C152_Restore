@interface INDataImage
@end

@implementation INDataImage

void __98___INDataImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a2;
  id v9 = [v7 imageData];
  (*(void (**)(uint64_t, id, void, id, double, double))(v6 + 16))(v6, v9, 0, v8, a3, a4);
}

@end