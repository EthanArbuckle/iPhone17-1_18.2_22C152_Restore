@interface CNWallpaper(Snapshotting)
+ (id)log;
- (__CFData)snapshotDataFromSnapshotImage:()Snapshotting forSize:topPadding:extensionBundleID:;
- (id)snapshotImageDataForWatch;
- (uint64_t)imageIsFullyTransparent:()Snapshotting;
- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting completion:;
- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting posterConfiguration:completion:;
- (uint64_t)snapshotImageDataForWatchWithCompletion:()Snapshotting;
- (void)posterSnapshotForSize:()Snapshotting topPadding:contact:posterConfiguration:completion:;
- (void)snapshotImageDataWithPreferredSize:()Snapshotting topPadding:contact:posterConfiguration:completion:;
@end

@implementation CNWallpaper(Snapshotting)

- (void)snapshotImageDataWithPreferredSize:()Snapshotting topPadding:contact:posterConfiguration:completion:
{
  id v14 = a6;
  id v15 = a7;
  v16 = a8;
  uint64_t v17 = *MEMORY[0x1E4F5A268];
  v18 = [a1 generatedWatchImageData];
  LOBYTE(v17) = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  if (v17)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(a1, "posterSnapshotForSize:topPadding:contact:posterConfiguration:completion:", v14, v15, v16, a2, a3, a4);
    }
    else
    {
      v20 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
      }

      v16[2](v16, 0);
    }
  }
  else
  {
    v19 = [a1 generatedWatchImageData];
    ((void (**)(id, void *))v16)[2](v16, v19);
  }
}

- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting completion:
{
  return [a1 snapshotImageDataForWatchForContact:a3 posterConfiguration:0 completion:a4];
}

- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting posterConfiguration:completion:
{
  return objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 410.0, 502.0, 165.0);
}

- (uint64_t)snapshotImageDataForWatchWithCompletion:()Snapshotting
{
  return objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 0, 0, a3, 410.0, 502.0, 165.0);
}

- (id)snapshotImageDataForWatch
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CNWallpaper_Snapshotting__snapshotImageDataForWatch__block_invoke;
  v8[3] = &unk_1E549A2C8;
  id v3 = v2;
  id v9 = v3;
  objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 0, 0, v8, 410.0, 502.0, 165.0);
  v4 = [v3 future];
  v5 = [v4 resultWithTimeout:0 error:5.0];

  objc_opt_class();
  v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    v6 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();
  }

  return v6;
}

- (__CFData)snapshotDataFromSnapshotImage:()Snapshotting forSize:topPadding:extensionBundleID:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v56.width = a2;
    v56.height = a3;
    id v15 = NSStringFromCGSize(v56);
    *(_DWORD *)buf = 138412290;
    id v53 = v15;
    _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEFAULT, "Generating image data for snapshot image of size: %@", buf, 0xCu);
  }
  uint64_t v16 = [v12 ioSurface];
  if (v16)
  {
    [v12 ioSurface];
    uint64_t v17 = UICreateCGImageFromIOSurface();
  }
  else
  {
    uint64_t v17 = [v12 CGImage];
  }
  v18 = (CGImage *)v17;
  BOOL v19 = +[CNWallpaperUtilities supportsWatchImageDataRepairFor:v13];
  double v20 = floor(a4);
  double Width = (double)CGImageGetWidth(v18);
  double v22 = Width / (double)CGImageGetHeight(v18);
  double v23 = 0.0;
  if (!v19) {
    double v23 = v20;
  }
  double v24 = a3 + v23;
  double v25 = a2 / (a3 + v23);
  if (v22 >= v25) {
    double v26 = a3 + v23;
  }
  else {
    double v26 = a2 / v22;
  }
  v27 = (CGImage *)CGImageCreateByScaling();
  if (v16) {
    CGImageRelease(v18);
  }
  if (v19) {
    double v28 = v20;
  }
  else {
    double v28 = 0.0;
  }
  double v29 = v28 + v24;
  double v30 = 0.0;
  if (v22 < v25)
  {
    if (v19)
    {
      +[CNWallpaperUtilities monogramPosterOffset];
      double v30 = floor(v24 * -0.5 + v26 * v31 - v20);
    }
    else
    {
      double v30 = v26 * 0.0;
    }
  }
  double v32 = fmax(v30, 0.0);
  if (v30 > 0.0) {
    double v30 = 0.0;
  }
  double v33 = v29 + v30;
  uint64_t v34 = 0;
  CGFloat v35 = a2;
  v36 = CGImageCreateWithImageInRect(v27, *(CGRect *)(&v32 - 1));
  CGImageRelease(v27);
  v37 = (__CFData *)objc_opt_new();
  double Height = (double)CGImageGetHeight(v36);
  size_t v39 = CGImageGetWidth(v36);
  BOOL v40 = v29 > Height && v19;
  v41 = v36;
  if (v40)
  {
    double v42 = (double)v39;
    v43 = objc_opt_new();
    [v43 setScale:1.0];
    [v43 setOpaque:0];
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v43, a2, v29);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __96__CNWallpaper_Snapshotting__snapshotDataFromSnapshotImage_forSize_topPadding_extensionBundleID___block_invoke;
    v51[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v51[4] = v36;
    *(double *)&v51[5] = v42;
    *(double *)&v51[6] = Height;
    id v45 = [v44 imageWithActions:v51];
    v41 = (CGImage *)[v45 CGImage];
  }
  if ([a1 imageIsFullyTransparent:v41])
  {
    v46 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v13;
      _os_log_error_impl(&dword_18B625000, v46, OS_LOG_TYPE_ERROR, "Failed to generate watch snapshot image data from image, resulting image is fully transparent. %@", buf, 0xCu);
    }

    CGImageRelease(v36);
LABEL_37:
    v49 = 0;
    goto LABEL_39;
  }
  v47 = CGImageDestinationCreateWithData(v37, @"public.heic", 1uLL, 0);
  CGImageDestinationAddImage(v47, v41, 0);
  CGImageDestinationFinalize(v47);
  CGImageRelease(v36);
  if (v47) {
    CFRelease(v47);
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
  {
    v48 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v48, OS_LOG_TYPE_ERROR, "Failed to generate watch snapshot image data from image", buf, 2u);
    }

    goto LABEL_37;
  }
  v49 = v37;
LABEL_39:

  return v49;
}

- (uint64_t)imageIsFullyTransparent:()Snapshotting
{
  uint64_t Width = CGImageGetWidth(image);
  uint64_t Height = CGImageGetHeight(image);
  uint64_t v6 = 1;
  v7 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v8 = CGBitmapContextCreate(v7, Width, Height, 8uLL, Width, 0, 7u);
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v8, v15, image);
  if (Height >= 1)
  {
    uint64_t v9 = 0;
    v10 = v7;
    while (1)
    {
      uint64_t v11 = Width;
      id v12 = v10;
      if (Width >= 1) {
        break;
      }
LABEL_6:
      ++v9;
      v10 += Width;
      if (v9 == Height)
      {
        uint64_t v6 = 1;
        goto LABEL_9;
      }
    }
    while (!*v12++)
    {
      if (!--v11) {
        goto LABEL_6;
      }
    }
    uint64_t v6 = 0;
  }
LABEL_9:
  free(v7);
  CGContextRelease(v8);
  return v6;
}

- (void)posterSnapshotForSize:()Snapshotting topPadding:contact:posterConfiguration:completion:
{
  id v40 = a6;
  id v39 = a7;
  id v14 = a8;
  CGRect v15 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_INFO, "Initiating request for poster snapshot", buf, 2u);
  }

  uint64_t v16 = *MEMORY[0x1E4F5A268];
  uint64_t v17 = [a1 posterArchiveData];
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if (v16)
  {
    v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v18, OS_LOG_TYPE_ERROR, "Attempting to generate a snapshot when poster archive data is empty", buf, 2u);
    }

    v14[2](v14, 0);
  }
  else
  {
    id v19 = v39;
    if (!v19)
    {
      double v20 = [a1 posterArchiveData];
      id v19 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v20 error:0];
    }
    if (v40)
    {
      v21 = [[CNPRUISIncomingCallPosterContext alloc] initWithContact:v40 showName:0];
    }
    else
    {
      v21 = +[CNPRUISIncomingCallPosterContext emptyContext];
    }
    double v22 = v21;
    double v23 = +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:v21 attachmentIdentifiers:0];
    double v24 = +[CNPRUISPosterSnapshotRequest requestForConfiguration:v19 definition:v23 interfaceOrientation:1];
    double v25 = objc_alloc_init(CNPRUISPosterSnapshotController);
    double v26 = [a1 extensionBundleID];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v19 providerBundleIdentifier];
    }
    v38 = v28;

    id v48 = 0;
    double v29 = [(CNPRUISPosterSnapshotController *)v25 latestSnapshotBundleForRequest:v24 error:&v48];
    id v37 = v48;
    if (!v29) {
      goto LABEL_18;
    }
    [v23 levelSets];
    v36 = v23;
    v31 = double v30 = v22;
    double v32 = [v31 firstObject];
    double v33 = [v29 snapshotForLevelSet:v32];

    double v22 = v30;
    double v23 = v36;
    if (v33)
    {
      uint64_t v34 = v38;
      CGFloat v35 = objc_msgSend(a1, "snapshotDataFromSnapshotImage:forSize:topPadding:extensionBundleID:", v33, v38, a2, a3, a4);
      ((void (**)(id, void *))v14)[2](v14, v35);
    }
    else
    {
LABEL_18:
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke;
      v41[3] = &unk_1E549A280;
      v41[4] = a1;
      v44 = v14;
      id v42 = v23;
      double v45 = a2;
      double v46 = a3;
      double v47 = a4;
      uint64_t v34 = v38;
      id v43 = v38;
      [(CNPRUISPosterSnapshotController *)v25 executeSnapshotRequest:v24 completion:v41];
    }
  }
}

+ (id)log
{
  if (log_cn_once_token_4_48684 != -1) {
    dispatch_once(&log_cn_once_token_4_48684, &__block_literal_global_48685);
  }
  v0 = (void *)log_cn_once_object_4_48686;

  return v0;
}

@end