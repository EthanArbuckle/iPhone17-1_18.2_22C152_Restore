@interface MFMediaExporter
+ (id)conversionTimers;
+ (id)log;
+ (int)exportAsset:(id)a3 progressHandler:(id)a4 completion:(id)a5;
+ (void)jpegRepresentationForImageData:(id)a3 inputContentType:(id)a4 completion:(id)a5;
+ (void)setConversionTimers:(id)a3;
@end

@implementation MFMediaExporter

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MFMediaExporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;

  return v2;
}

void __22__MFMediaExporter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

+ (int)exportAsset:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[MFMediaExporter log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v8, "mf_localIdentifier");
    *(_DWORD *)buf = 138543362;
    v39 = v12;
    _os_log_impl(&dword_1AF945000, v11, OS_LOG_TYPE_DEFAULT, "Exporting asset: %{public}@", buf, 0xCu);
  }
  if ([v8 canPlayAutoloop])
  {
    v13 = +[MFMediaExporter log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v13, OS_LOG_TYPE_DEFAULT, "\tAsset is an auto loop, converting to gif.", buf, 2u);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v14 setNetworkAccessAllowed:1];
    v15 = v37;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke;
    v37[3] = &unk_1E5F7C800;
    v37[4] = v9;
    [v14 setProgressHandler:v37];
    v16 = [MEMORY[0x1E4F390D0] defaultManager];
    v17 = v36;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_33;
    v36[3] = &unk_1E5F7C850;
    v36[4] = v10;
    int v18 = [v16 requestURLForVideo:v8 options:0 resultHandler:v36];
LABEL_14:
    int v23 = v18;
    v24 = (id *)(v15 + 4);
    v25 = (id *)(v17 + 4);
    goto LABEL_15;
  }
  if (![v8 isVideo])
  {
    v26 = +[MFMediaExporter log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v26, OS_LOG_TYPE_DEFAULT, "\tAsset is an image. Exporting as a web-friendly image.", buf, 2u);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    v15 = v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_50;
    v29[3] = &unk_1E5F7C800;
    v29[4] = v9;
    [v14 setProgressHandler:v29];
    [v14 setNetworkAccessAllowed:1];
    [v14 setDeliveryMode:1];
    v16 = [MEMORY[0x1E4F390D0] defaultManager];
    v17 = v28;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51;
    v28[3] = &unk_1E5F7C918;
    v28[4] = v10;
    v28[5] = a1;
    int v18 = [v16 requestImageDataAndOrientationForAsset:v8 options:v14 resultHandler:v28];
    goto LABEL_14;
  }
  v19 = +[MFMediaExporter log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v19, OS_LOG_TYPE_DEFAULT, "\tAsset is a video. Exporting as a mov.", buf, 2u);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F39348]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_40;
  v34[3] = &unk_1E5F7C800;
  id v20 = v9;
  id v35 = v20;
  [v14 setProgressHandler:v34];
  [v14 setNetworkAccessAllowed:1];
  [v14 setVersion:0];
  v21 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v22 = *MEMORY[0x1E4F15738];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_41;
  v30[3] = &unk_1E5F7C8C8;
  id v32 = v20;
  id v33 = v10;
  id v31 = v8;
  int v23 = [v21 requestExportSessionForVideo:v31 options:v14 exportPreset:v22 resultHandler:v30];

  v24 = &v35;
  v25 = &v32;
  v16 = v33;
LABEL_15:

  return v23;
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = [a5 objectForKey:*MEMORY[0x1E4F39690]];
  if ([v9 BOOLValue])
  {
    id v10 = +[MFMediaExporter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v8, "ef_publicDescription");
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = NSTemporaryDirectory();
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];
  id v9 = [v4 fileURLWithPath:v8];

  id v11 = v3;
  id v12 = *(id *)(a1 + 32);
  id v10 = v9;
  PFCreateGIFFromVideoURL();
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = +[MFMediaExporter log];
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "\tAuto-loop exported to: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = v7;
    uint64_t v9 = a1[4];
    if (v9) {
      [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB31F0]];
    }
    [v8 setObject:a1[5] forKeyedSubscript:*MEMORY[0x1E4FB2A20]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_cold_1(v5);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_40(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F39690]];
  if ([v9 BOOLValue])
  {
    int v10 = +[MFMediaExporter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(v8, "ef_publicDescription");
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_41(id *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = NSTemporaryDirectory();
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];
  uint64_t v9 = [v8 stringByAppendingPathExtension:@"mov"];
  int v10 = [v4 fileURLWithPath:v9];

  [v3 setOutputURL:v10];
  [v3 setOutputFileType:*MEMORY[0x1E4F15AB0]];
  uint64_t v11 = +[MFMediaExporter log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 absoluteString];
    *(_DWORD *)buf = 138543618;
    id v31 = v12;
    __int16 v32 = 2114;
    id v33 = v3;
    _os_log_impl(&dword_1AF945000, v11, OS_LOG_TYPE_DEFAULT, "\tExporting to %{public}@ with export session: %{public}@", buf, 0x16u);
  }
  id v13 = +[MFMediaExporter conversionTimers];
  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v14 = (void *)MEMORY[0x1E4F1CB00];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_44;
  v26[3] = &unk_1E5F7C878;
  id v15 = v3;
  id v27 = v15;
  id v29 = a1[5];
  id v16 = v13;
  id v28 = v16;
  v17 = [v14 timerWithTimeInterval:1 repeats:v26 block:0.1];
  [v16 addObject:v17];
  +[MFMediaExporter setConversionTimers:v16];
  int v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v18 addTimer:v17 forMode:*MEMORY[0x1E4F1C3A0]];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_47;
  v21[3] = &unk_1E5F7C8A0;
  id v19 = v15;
  id v22 = v19;
  id v20 = v10;
  id v23 = v20;
  id v25 = a1[6];
  id v24 = a1[4];
  [v19 exportAsynchronouslyWithCompletionHandler:v21];
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) progress];
  float v4 = v3;
  (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v3 * 0.5 + 0.5);
  if (v4 >= 1.0)
  {
    [v5 invalidate];
    [*(id *)(a1 + 40) removeObject:v5];
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_47(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = +[MFMediaExporter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) status];
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "\tFinished exporting with status %ld", (uint8_t *)&v10, 0xCu);
  }

  if ([*(id *)(a1 + 32) status] == 3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v14 = *MEMORY[0x1E4FB2A20];
    v15[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = +[MFMediaExporter log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(*(id *)(a1 + 48), "mf_localIdentifier");
      id v8 = [*(id *)(a1 + 32) error];
      uint64_t v9 = objc_msgSend(v8, "ef_publicDescription");
      int v10 = 138543618;
      uint64_t v11 = (uint64_t)v7;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_error_impl(&dword_1AF945000, v6, OS_LOG_TYPE_ERROR, "\tError exporting asset %{public}@ with error %{public}@", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_50(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F39690]];
  if ([v9 BOOLValue])
  {
    int v10 = +[MFMediaExporter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(v8, "ef_publicDescription");
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F396A0];
  int v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F396A0]];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v7)
    {
      __int16 v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v7];
      id v13 = v12;
      if (v12 && [v12 conformsToType:*MEMORY[0x1E4F44400]])
      {
        if (([v13 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
          || ([v13 conformsToType:*MEMORY[0x1E4F44460]] & 1) != 0
          || [v13 conformsToType:*MEMORY[0x1E4F443D0]])
        {
          uint64_t v14 = [v8 objectForKeyedSubscript:v9];
          [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB3230]];

          id v15 = +[MFMediaExporter log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_DEFAULT, "\tSuccessfully exported the image.", buf, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else
        {
          int v18 = *(void **)(a1 + 40);
          id v19 = [v8 objectForKeyedSubscript:v9];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_53;
          v20[3] = &unk_1E5F7C8F0;
          id v21 = v11;
          id v22 = *(id *)(a1 + 32);
          [v18 jpegRepresentationForImageData:v19 inputContentType:v7 completion:v20];
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      id v13 = 0;
    }
    v17 = +[MFMediaExporter log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51_cold_2((uint64_t)v7, v17);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_18;
  }
  id v16 = +[MFMediaExporter log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51_cold_1(v16);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_19:
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB3230]];
  uint64_t v4 = +[MFMediaExporter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "\tSuccessfully converted and exported the image as JPEG.", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)jpegRepresentationForImageData:(id)a3 inputContentType:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (_imageConversionScheduler_onceToken != -1) {
    dispatch_once(&_imageConversionScheduler_onceToken, &__block_literal_global_26);
  }
  id v10 = (id)_imageConversionScheduler_sInstance;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__MFMediaExporter_jpegRepresentationForImageData_inputContentType_completion___block_invoke;
  v14[3] = &unk_1E5F79528;
  id v15 = v8;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  [v10 performBlock:v14];
}

void __78__MFMediaExporter_jpegRepresentationForImageData_inputContentType_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v15 = *MEMORY[0x1E4F2FF78];
  v16[0] = v2;
  CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v4 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 40), v3);
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = [MEMORY[0x1E4F1CA58] data];
  uint64_t v6 = [(id)*MEMORY[0x1E4F44410] identifier];
  id v7 = CGImageDestinationCreateWithData(v5, v6, 1uLL, 0);

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F2F450];
    v13[0] = *MEMORY[0x1E4F2F460];
    v13[1] = v8;
    v14[0] = MEMORY[0x1E4F1CC38];
    v14[1] = MEMORY[0x1E4F1CC38];
    v13[2] = *MEMORY[0x1E4F2F430];
    v14[2] = &unk_1F0841A78;
    CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v4);
    CGImageDestinationAddImageFromSource(v7, v4, PrimaryImageIndex, v9);
    id v11 = CGImageDestinationFinalize(v7) ? v5 : 0;
    CFRelease(v7);
  }
  else
  {
    id v11 = 0;
  }
  CFRelease(v4);

  if (!v11)
  {
LABEL_9:
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:*(void *)(a1 + 40)];
    _UIImageJPEGRepresentation();
    id v11 = (__CFData *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)conversionTimers
{
  return objc_getAssociatedObject(a1, "MFConversionTimersKey");
}

+ (void)setConversionTimers:(id)a3
{
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, a2, a3, "\tAsset export cancelled with error: %{public}@", (uint8_t *)a2);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "\tFailed to export auto-loop to gif.", v1, 2u);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "\tUnable to export the image. There is no data.", v1, 2u);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_51_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "\tUnable to export the image. The contentType is not an image - %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end