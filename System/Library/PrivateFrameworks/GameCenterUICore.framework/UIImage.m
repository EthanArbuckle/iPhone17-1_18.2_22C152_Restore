@interface UIImage
@end

@implementation UIImage

void __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke()
{
  id v0 = [MEMORY[0x263F40298] shared];
  _gkloadRemoteImageForURL_queue_withCompletionHandler__shouldAnnotateImageUsage = [v0 shouldAnnotateImageUsage];
}

void __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v7 = v3;
    if ([v3 length])
    {
      v4 = [MEMORY[0x263F1C6B0] _gkImageWithCheckedData:v7];
      v5 = v4;
      if (v4) {
        BOOL v6 = _gkloadRemoteImageForURL_queue_withCompletionHandler__shouldAnnotateImageUsage == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6) {
        objc_setAssociatedObject(v4, @"GK_IMAGE_URL_ANNOTATION_KEY", *(id *)(a1 + 32), (void *)0x301);
      }
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v3 = v7;
  }
}

uint64_t __65__UIImage_GKTransferFunction___gkReadAtSize_ARGBHostEndianBytes___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3 = *MEMORY[0x263F00148];
  CGFloat v4 = *(double *)(MEMORY[0x263F00148] + 8);
  CGFloat v5 = *(double *)(a1 + 48);
  CGFloat v6 = *(double *)(a1 + 56);
  id v7 = (CGContext *)[a2 CGContext];
  v14.origin.x = v3;
  v14.origin.y = v4;
  v14.size.width = v5;
  v14.size.height = v6;
  CGContextClearRect(v7, v14);
  v8 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  v15.origin.x = v3;
  v15.origin.y = v4;
  v15.size.width = v5;
  v15.size.height = v6;
  CGContextDrawImage(v7, v15, v8);
  CGBitmapContextGetBytesPerRow(v7);
  CGBitmapContextGetData(v7);
  v9 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 40) + 16);
  v10.n128_u64[0] = *(void *)(a1 + 48);
  v11.n128_u64[0] = *(void *)(a1 + 56);
  return v9(v10, v11);
}

@end