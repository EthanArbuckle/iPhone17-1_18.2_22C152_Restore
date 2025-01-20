@interface CNWallpaper
@end

@implementation CNWallpaper

uint64_t __85__CNWallpaper_UIAdditions__reducedSizePosterArchiveDataFromData_posterConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

void __54__CNWallpaper_Snapshotting__snapshotImageDataForWatch__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2 error:0];
}

void __96__CNWallpaper_Snapshotting__snapshotDataFromSnapshotImage_forSize_topPadding_extensionBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  v3 = (CGContext *)[v17 CGContext];
  v4 = [v17 format];
  [v4 bounds];
  double v5 = 0.0;
  CGContextTranslateCTM(v3, 0.0, v6);

  CGContextScaleCTM((CGContextRef)[v17 CGContext], 1.0, -1.0);
  v19.size.width = *(CGFloat *)(a1 + 40);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.height = 1.0;
  v7 = CGImageCreateWithImageInRect(*(CGImageRef *)(a1 + 32), v19);
  v8 = [v17 format];
  [v8 bounds];
  double v10 = v9 - *(double *)(a1 + 48);

  if (v10 > 0.0)
  {
    uint64_t v11 = 1;
    do
    {
      v12 = (CGContext *)[v17 CGContext];
      v20.size.width = *(CGFloat *)(a1 + 40);
      v20.origin.y = v5 + *(double *)(a1 + 48);
      v20.origin.x = 0.0;
      v20.size.height = 1.0;
      CGContextDrawImage(v12, v20, v7);
      double v5 = (double)v11;
      v13 = [v17 format];
      [v13 bounds];
      double v15 = v14 - *(double *)(a1 + 48);

      ++v11;
    }
    while (v15 > v5);
  }
  v16 = (CGContext *)[v17 CGContext];
  v21.size.width = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 32));
  v21.size.height = *(CGFloat *)(a1 + 48);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  CGContextDrawImage(v16, v21, *(CGImageRef *)(a1 + 32));
  CGImageRelease(v7);
}

void __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (!a3 || v6)
  {
    v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CGRect v20 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v29 = v20;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "Failed to snapshot poster with error: %@", buf, 0xCu);
    }
    id v17 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_8;
    v26[3] = &unk_1E549B8A0;
    id v27 = *(id *)(a1 + 56);
    [v17 performBlock:v26];

    uint64_t v11 = v27;
  }
  else
  {
    v8 = [a3 snapshotBundle];
    double v9 = [*(id *)(a1 + 40) levelSets];
    double v10 = [v9 firstObject];
    uint64_t v11 = [v8 snapshotForLevelSet:v10];

    if (v11)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "snapshotDataFromSnapshotImage:forSize:topPadding:extensionBundleID:", v11, *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      v13 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_2;
      v21[3] = &unk_1E549B710;
      id v14 = *(id *)(a1 + 56);
      id v22 = v12;
      id v23 = v14;
      id v15 = v12;
      [v13 performBlock:v21];
    }
    else
    {
      v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v18, OS_LOG_TYPE_ERROR, "Snapshot of poster returned nil", buf, 2u);
      }

      CGRect v19 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_9;
      v24[3] = &unk_1E549B8A0;
      id v25 = *(id *)(a1 + 56);
      [v19 performBlock:v24];

      id v15 = v25;
    }
  }
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __32__CNWallpaper_Snapshotting__log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNWallpaper+CNSnapshotting");
  v1 = (void *)log_cn_once_object_4_48686;
  log_cn_once_object_4_48686 = (uint64_t)v0;
}

@end