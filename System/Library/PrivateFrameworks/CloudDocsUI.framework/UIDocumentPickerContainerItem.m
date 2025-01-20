@interface UIDocumentPickerContainerItem
@end

@implementation UIDocumentPickerContainerItem

uint64_t __52___UIDocumentPickerContainerItem__lruThumbnailArray__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _lruThumbnailArray_cacheArray;
  _lruThumbnailArray_cacheArray = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 5);
    if (v4)
    {
      if (([v4 isCancelled] & 1) == 0)
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "_createThumbnailWithSize:scale:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
        v6 = v5;
        if (v5)
        {
          v7[0] = MEMORY[0x263EF8330];
          v7[1] = 3221225472;
          v7[2] = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_2;
          v7[3] = &unk_26492D010;
          v7[4] = *(void *)(a1 + 32);
          id v8 = v5;
          id v9 = *(id *)(a1 + 40);
          id v10 = *(id *)(a1 + 48);
          dispatch_async(MEMORY[0x263EF83A0], v7);
        }
      }
    }
  }
}

void __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) refreshItem:*(void *)(a1 + 32) thumbnailOnly:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_3;
  block[3] = &unk_26492CC78;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_3(uint64_t a1)
{
  return +[_UIDocumentPickerContainerItem markThumbnailAsRecentlyUsed:*(void *)(a1 + 32)];
}

void __65___UIDocumentPickerContainerItem__createThumbnailWithSize_scale___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  CGFloat v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x263F00148], v4, v5, v6);
  if (*(unsigned char *)(a1 + 56))
  {
    v7 = (CGContext *)[v9 CGContext];
    id v8 = [MEMORY[0x263F1C550] separatorColor];
    CGContextSetStrokeColorWithColor(v7, (CGColorRef)[v8 CGColor]);

    CGContextSetLineWidth(v7, 1.0);
    v11.origin.x = v3;
    v11.origin.y = v4;
    v11.size.width = v5;
    v11.size.height = v6;
    CGRect v12 = CGRectInset(v11, 0.5, 0.5);
    CGContextStrokeRect(v7, v12);
  }
}

id __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke(uint64_t a1)
{
  v2 = +[_UIDocumentPickerURLContainerModel tagColorsByTag];
  double v3 = *(double *)(a1 + 40);
  double v4 = v3 * 0.5;
  double v5 = ceil(v3);
  double v6 = v5 + (double)(unint64_t)([*(id *)(a1 + 32) count] - 1) * (v3 * 0.5);
  v7 = objc_opt_new();
  [v7 setScale:*(double *)(a1 + 48)];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v7, v6, v5);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke_2;
  v12[3] = &unk_26492D088;
  id v13 = *(id *)(a1 + 32);
  id v14 = v2;
  double v15 = v4;
  double v16 = v5;
  id v9 = v2;
  id v10 = [v8 imageWithActions:v12];

  return v10;
}

void __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = [*(id *)(a1 + 32) count] - 1;
  if (v4 >= 0)
  {
    do
    {
      CGFloat v5 = *(double *)(a1 + 48) * (double)v4;
      double v6 = [*(id *)(a1 + 32) objectAtIndex:v4];
      v7 = [*(id *)(a1 + 40) objectForKey:v6];
      v17.size.CGFloat width = *(CGFloat *)(a1 + 56);
      v17.origin.CGFloat y = 0.0;
      v17.origin.CGFloat x = v5;
      v17.size.CGFloat height = v17.size.width;
      CGRect v18 = CGRectInset(v17, 0.5, 0.5);
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
      CGContextAddEllipseInRect(v3, v18);
      CGContextSetLineWidth(v3, 1.0);
      id v12 = v7;
      CGContextSetFillColorWithColor(v3, (CGColorRef)[v12 CGColor]);
      CGContextFillPath(v3);
      id v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
      id v14 = [v13 colorWithAlphaComponent:0.5];
      double v15 = [v12 _colorBlendedWithColor:v14];

      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGContextAddEllipseInRect(v3, v19);
      id v16 = v15;
      CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v16 CGColor]);
      CGContextStrokePath(v3);

      --v4;
    }
    while (v4 != -1);
  }
}

uint64_t __88___UIDocumentPickerContainerItem_Icons___blockingFolderIconForURL_container_size_scale___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [*(id *)(a1 + 32) size];
  UIRectCenteredXInRect();
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  [*(id *)(a1 + 32) size];
  double v9 = v8 - *(double *)(a1 + 56) - *(double *)(a1 + 64);
  id v10 = *(void **)(a1 + 40);

  return objc_msgSend(v10, "drawInRect:", v3, v9, v5, v7);
}

@end