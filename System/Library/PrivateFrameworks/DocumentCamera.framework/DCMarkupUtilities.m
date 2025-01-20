@interface DCMarkupUtilities
+ (BOOL)hasPrivateImageMetadata:(id)a3;
+ (id)cleanImageMetadataFromData:(id)a3;
+ (id)createMarkupViewController;
+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3;
+ (id)dataToEditForDocumentInfo:(id)a3 imageCache:(id)a4 includeMarkupModelData:(BOOL)a5;
+ (id)dataToEditForDocumentInfo:(id)a3 includeMarkupModelData:(BOOL)a4 imageCache:(id)a5 embedMarkupModelDataInImage:(BOOL)a6;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5;
+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4;
+ (id)markupModelDataFromData:(id)a3;
+ (id)markupModelDataFromDataAtURL:(id)a3;
+ (void)applyMarkupModelData:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5;
+ (void)extractReturnedMarkupURL:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5;
@end

@implementation DCMarkupUtilities

+ (id)dataToEditForDocumentInfo:(id)a3 imageCache:(id)a4 includeMarkupModelData:(BOOL)a5
{
  return (id)[a1 dataToEditForDocumentInfo:a3 includeMarkupModelData:a5 imageCache:a4 embedMarkupModelDataInImage:1];
}

+ (id)dataToEditForDocumentInfo:(id)a3 includeMarkupModelData:(BOOL)a4 imageCache:(id)a5 embedMarkupModelDataInImage:(BOOL)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 fullImageUUID];
  v11 = [v9 getImage:v10];

  v12 = UIImageJPEGRepresentation(v11, 1.0);
  if (v12)
  {
    uint64_t v13 = [v8 currentOrientation];
    v14 = [v8 markupModelData];
    v15 = [v8 imageQuad];
    if (v13 || [v8 currentFilter] || v15)
    {
      id v25 = a1;
      context = (void *)MEMORY[0x21D44F7D0]();
      v16 = [MEMORY[0x263F1C6B0] imageWithData:v12];
      if (v15)
      {
        uint64_t v17 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v16 normalizedImageQuad:v15];

        v16 = (void *)v17;
      }
      v18 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v16, 0, [v8 currentFilter]);

      v19 = +[ICDocCamImageFilters imageWithRGBColorspaceFromImage:v18];

      if (v13)
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_orientedImageFromImage:toOrientation:", v19, v13);

        v19 = (void *)v20;
      }
      uint64_t v21 = objc_msgSend(v19, "dc_JPEGData");

      v12 = (void *)v21;
      a1 = v25;
    }
    if ([v14 length])
    {
      uint64_t v22 = [a1 imageDataWithMarkupModelData:v14 sourceImageData:v12];

      v12 = (void *)v22;
    }
  }

  return v12;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [getMarkupViewControllerClass() hasPrivateImageMetadata:v3];

  return v4;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3 = a3;
  char v4 = [getMarkupViewControllerClass() cleanImageMetadataFromData:v3];

  return v4;
}

+ (id)createMarkupViewController
{
  id v2 = objc_alloc_init((Class)getMarkupViewControllerClass());

  return v2;
}

+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3
{
  id v3 = objc_msgSend(a1, "createMarkupViewController", a3);
  [v3 setEncryptPrivateMetadata:0];

  return v3;
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4
{
  return (id)[a1 imageDataWithMarkupModelData:a3 sourceImageData:a4 embedData:0];
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v24 = 0;
  v10 = [a1 createProcessingMarkupViewControllerOutWindow:&v24];
  id v11 = v24;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke;
  v20[3] = &unk_2642A97F0;
  id v12 = v10;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  id v14 = v8;
  id v23 = v14;
  dc_performBlockOnMainThread(v20);
  id v19 = 0;
  v15 = [v12 dataRepresentationEmbeddingSourceImageAndEditModel:v5 error:&v19];
  id v16 = v19;
  if (v16)
  {
    uint64_t v17 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[DCMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:]((uint64_t)v16, v17);
    }
  }

  return v15;
}

uint64_t __76__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) withArchivedModelData:*(void *)(a1 + 48)];
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = 0;
  id v8 = [a1 createProcessingMarkupViewControllerOutWindow:&v22];
  id v9 = v22;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke;
  v18[3] = &unk_2642A97F0;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  dc_performBlockOnMainThread(v18);
  id v17 = 0;
  id v13 = [v10 dataRepresentationEmbeddingSourceImageAndEditModel:0 error:&v17];
  id v14 = v17;
  if (v14)
  {
    v15 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[DCMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:]((uint64_t)v14, v15);
    }
  }

  return v13;
}

uint64_t __65__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFileURL:*(void *)(a1 + 40) withArchivedModelData:*(void *)(a1 + 48)];
}

+ (id)markupModelDataFromDataAtURL:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  BOOL v5 = [a1 createProcessingMarkupViewControllerOutWindow:&v14];
  id v6 = v14;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__DCMarkupUtilities_markupModelDataFromDataAtURL___block_invoke;
  v11[3] = &unk_2642A9360;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  dc_performBlockOnMainThread(v11);
  id v9 = [v8 createArchivedModelData];

  return v9;
}

uint64_t __50__DCMarkupUtilities_markupModelDataFromDataAtURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFileURL:*(void *)(a1 + 40) withArchivedModelData:0];
}

+ (id)markupModelDataFromData:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  BOOL v5 = [a1 createProcessingMarkupViewControllerOutWindow:&v14];
  id v6 = v14;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__DCMarkupUtilities_markupModelDataFromData___block_invoke;
  v11[3] = &unk_2642A9360;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  dc_performBlockOnMainThread(v11);
  id v9 = [v8 createArchivedModelData];

  return v9;
}

uint64_t __45__DCMarkupUtilities_markupModelDataFromData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) withArchivedModelData:0];
}

+ (void)applyMarkupModelData:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5
{
  unint64_t v12 = (unint64_t)a3;
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  uint64_t v9 = [v7 markupModelData];
  if (v12 | v9)
  {
    id v10 = (void *)v9;
    char v11 = [(id)v12 isEqual:v9];

    if ((v11 & 1) == 0) {
      [v7 setMarkupModelData:v12];
    }
  }
  if (v8) {
    v8[2](v8);
  }
}

+ (void)extractReturnedMarkupURL:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 startAccessingSecurityScopedResource];
  id v11 = [a1 markupModelDataFromDataAtURL:v10];
  [v10 stopAccessingSecurityScopedResource];

  [a1 applyMarkupModelData:v11 documentInfo:v9 completionBlock:v8];
}

+ (void)imageDataWithMarkupModelData:(uint64_t)a1 sourceImageData:(NSObject *)a2 embedData:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Markup error: %@", (uint8_t *)&v2, 0xCu);
}

@end