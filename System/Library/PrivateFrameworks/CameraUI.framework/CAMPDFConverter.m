@interface CAMPDFConverter
+ (id)_pdfPageOptionsForImageRef:(CGImage *)a3;
+ (void)convertToPDFAndWrite:(id)a3 documentName:(id)a4 completionHandler:(id)a5;
@end

@implementation CAMPDFConverter

+ (void)convertToPDFAndWrite:(id)a3 documentName:(id)a4 completionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CAMPDFConverter_convertToPDFAndWrite_documentName_completionHandler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e26___PDFPage_16__0__UIImage_8l;
  aBlock[4] = a1;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v11 = objc_alloc_init(MEMORY[0x263F14740]);
  v12 = (void *)MEMORY[0x21050BCA0]();
  if ([v8 pageCount])
  {
    v36 = v12;
    v13 = 0;
    v14 = 0;
    unint64_t v15 = 0;
    do
    {
      v16 = v14;
      v17 = v13;
      v14 = [v8 imageOfPageAtIndex:v15];

      v13 = v10[2](v10, v14);

      if (v13)
      {
        objc_msgSend(v11, "insertPage:atIndex:", v13, objc_msgSend(v11, "pageCount"));
      }
      else
      {
        v18 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = [v8 pageCount];
          v19 = [v14 debugDescription];
          *(_DWORD *)buf = 134218498;
          unint64_t v46 = v15;
          __int16 v47 = 2048;
          uint64_t v48 = v35;
          __int16 v49 = 2114;
          v50 = v19;
          _os_log_error_impl(&dword_2099F8000, v18, OS_LOG_TYPE_ERROR, "Failed to create PDF page from image (image %lu/%lu of scanned document) with description: %{public}@", buf, 0x20u);
        }
      }
      ++v15;
    }
    while (v15 < [v8 pageCount]);

    v12 = v36;
  }
  v20 = [MEMORY[0x263F08850] defaultManager];
  v21 = [v20 temporaryDirectory];
  v22 = [MEMORY[0x263F08C38] UUID];
  uint64_t v23 = [v22 UUIDString];
  v24 = [v21 URLByAppendingPathComponent:v23];

  v25 = [v24 path];
  LOBYTE(v23) = [v20 fileExistsAtPath:v25];

  if (v23)
  {
    v26 = [v24 path];
    id v41 = 0;
    [v20 removeItemAtPath:v26 error:&v41];
    id v27 = v41;

    if (v27)
    {
      v28 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[CAMPDFConverter convertToPDFAndWrite:documentName:completionHandler:](v24, (uint64_t)v27, v28);
      }
LABEL_17:

      v30 = v39;
      (*((void (**)(id, void))v39 + 2))(v39, 0);
      goto LABEL_22;
    }
  }
  v29 = [v24 path];
  id v40 = 0;
  [v20 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v40];
  id v27 = v40;

  if (v27)
  {
    v28 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[CAMPDFConverter convertToPDFAndWrite:documentName:completionHandler:]((uint64_t)v27, v28);
    }
    goto LABEL_17;
  }
  v37 = [NSString stringWithFormat:@"%@.pdf", v9];
  v31 = [v24 URLByAppendingPathComponent:v37];
  uint64_t v43 = *MEMORY[0x263F00460];
  uint64_t v44 = MEMORY[0x263EFFA88];
  [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v38 = v21;
  v33 = id v32 = v9;
  v30 = v39;
  if ([v11 writeToURL:v31 withOptions:v33]) {
    v34 = v31;
  }
  else {
    v34 = 0;
  }
  (*((void (**)(id, void *))v39 + 2))(v39, v34);

  id v9 = v32;
  v21 = v38;

LABEL_22:
}

id __71__CAMPDFConverter_convertToPDFAndWrite_documentName_completionHandler___block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = objc_msgSend(v2, "_pdfPageOptionsForImageRef:", objc_msgSend(v3, "CGImage"));
  v5 = (void *)[objc_alloc(MEMORY[0x263F14750]) initWithImage:v3 options:v4];

  return v5;
}

+ (id)_pdfPageOptionsForImageRef:(CGImage *)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  CGImageGetSizeAfterOrientation();
  v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 0.0, 0.0, v3, v4);
  uint64_t v6 = *MEMORY[0x263F14890];
  v9[0] = *MEMORY[0x263F14880];
  v9[1] = v6;
  v10[0] = v5;
  v10[1] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (void)convertToPDFAndWrite:(uint64_t)a1 documentName:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory for scanned PDF with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)convertToPDFAndWrite:(void *)a1 documentName:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a1 path];
  int v6 = 138543618;
  v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Failed to remove item (at path %{public}@) prior to storing scanned PDF with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end