@interface VNDocumentCameraScan
+ (id)scannedDocumentsFolderURL;
+ (void)initialize;
- (BOOL)copyImagesFromDocInfoCollection:(id)a3 imageCache:(id)a4;
- (BOOL)deleteImage:(id)a3;
- (BOOL)makeSureScanDirectoryExists:(id *)a3;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (NSMutableArray)docInfos;
- (NSString)title;
- (NSUInteger)pageCount;
- (NSURL)scannedDocumentImageDirectoryURL;
- (UIImage)imageOfPageAtIndex:(NSUInteger)index;
- (VNDocumentCameraScan)initWithArchivedData:(id)a3 error:(id *)a4;
- (VNDocumentCameraScan)initWithDocInfoCollection:(id)a3 imageCache:(id)a4;
- (VNDocumentCameraScan)initWithURL:(id)a3 error:(id *)a4;
- (id)URLForImageInFolder:(id)a3 withUUID:(id)a4;
- (id)URLForImageWithUUID:(id)a3;
- (id)archivedDataWithError:(id *)a3;
- (id)copyImageAtURL:(id)a3;
- (id)copyImageForLoading:(id)a3 fromFolderURL:(id)a4;
- (id)copyImageForSaving:(id)a3 toFolderURL:(id)a4;
- (id)getImage:(id)a3;
- (id)imageForScanAtIndex:(unint64_t)a3 error:(id *)a4;
- (id)infoCollectionWithImageCache:(id)a3 error:(id *)a4;
- (id)pListURL:(id)a3;
- (void)dealloc;
- (void)deleteAllImages;
- (void)replaceContentsWithDocInfoCollection:(id)a3 imageCache:(id)a4;
- (void)setDocInfos:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VNDocumentCameraScan

+ (id)scannedDocumentsFolderURL
{
  if (scannedDocumentsFolderURL_onceToken_0 != -1) {
    dispatch_once(&scannedDocumentsFolderURL_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)scannedDocumentsFolderURL_URL_0;

  return v2;
}

void __49__VNDocumentCameraScan_scannedDocumentsFolderURL__block_invoke()
{
  v0 = +[DCCachesDirectory sharedCachesDirectory];
  id v3 = [v0 cachesDirectoryURL];

  uint64_t v1 = [v3 URLByAppendingPathComponent:@"com.apple.ScannedDocuments"];
  v2 = (void *)scannedDocumentsFolderURL_URL_0;
  scannedDocumentsFolderURL_URL_0 = v1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v4 = +[VNDocumentCameraScan scannedDocumentsFolderURL];
    v2 = [MEMORY[0x263F08850] defaultManager];
    id v3 = [v4 path];
    [v2 removeItemAtPath:v3 error:0];
  }
}

- (VNDocumentCameraScan)initWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)VNDocumentCameraScan;
  id v5 = a4;
  id v6 = a3;
  v7 = [(VNDocumentCameraScan *)&v19 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x263F08C38], "UUID", v19.receiver, v19.super_class);
    v9 = [v8 UUIDString];

    v10 = +[VNDocumentCameraScan scannedDocumentsFolderURL];
    uint64_t v11 = [v10 URLByAppendingPathComponent:v9];
    scannedDocumentImageDirectoryURL = v7->_scannedDocumentImageDirectoryURL;
    v7->_scannedDocumentImageDirectoryURL = (NSURL *)v11;
  }
  v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v19.receiver, v19.super_class);
  uint64_t v14 = *MEMORY[0x263F1D0E0];
  v15 = [MEMORY[0x263F1C408] sharedApplication];
  [v13 addObserver:v7 selector:sel_applicationWillTerminate_ name:v14 object:v15];

  [(VNDocumentCameraScan *)v7 copyImagesFromDocInfoCollection:v6 imageCache:v5];
  v16 = [v6 title];

  v17 = (void *)[v16 copy];
  [(VNDocumentCameraScan *)v7 setTitle:v17];

  return v7;
}

- (VNDocumentCameraScan)initWithURL:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v54 = a3;
  v63.receiver = self;
  v63.super_class = (Class)VNDocumentCameraScan;
  id v5 = [(VNDocumentCameraScan *)&v63 init];
  id v6 = v5;
  if (!v5)
  {
LABEL_19:
    v38 = v6;
    goto LABEL_24;
  }
  v51 = v5;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v54 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    v10 = [(VNDocumentCameraScan *)v51 pListURL:v54];
    uint64_t v11 = [v10 path];
    char v12 = [v7 fileExistsAtPath:v11];

    if ((v12 & 1) == 0)
    {

      v38 = 0;
      id v6 = v51;
      goto LABEL_24;
    }
    v45 = v7;
    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];

    v15 = +[VNDocumentCameraScan scannedDocumentsFolderURL];
    v43 = (void *)v14;
    uint64_t v16 = [v15 URLByAppendingPathComponent:v14];
    scannedDocumentImageDirectoryURL = v51->_scannedDocumentImageDirectoryURL;
    v51->_scannedDocumentImageDirectoryURL = (NSURL *)v16;

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v19 = *MEMORY[0x263F1D0E0];
    v20 = [MEMORY[0x263F1C408] sharedApplication];
    [v18 addObserver:v51 selector:sel_applicationWillTerminate_ name:v19 object:v20];

    v44 = v10;
    v21 = [NSDictionary dictionaryWithContentsOfURL:v10];
    v41 = [v21 objectForKey:@"Version"];
    v40 = [v21 objectForKey:@"DocumentName"];
    -[VNDocumentCameraScan setTitle:](v51, "setTitle:");
    v22 = [MEMORY[0x263EFF980] array];
    [(VNDocumentCameraScan *)v51 setDocInfos:v22];

    v42 = v21;
    [v21 objectForKey:@"DocumentInfos"];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v51;
    uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v60 != v47) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v53 = [v24 objectForKey:@"Metadata"];
          v25 = [v24 objectForKey:@"ImageQuad"];
          point.x = 0.0;
          point.y = 0.0;
          v57.x = 0.0;
          v57.y = 0.0;
          v56.x = 0.0;
          v56.y = 0.0;
          v55.x = 0.0;
          v55.y = 0.0;
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKey:@"ImageQuadTopLeft"], &point);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKey:@"ImageQuadTopRight"], &v57);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKey:@"ImageQuadBottomLeft"], &v56);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKey:@"ImageQuadBottomRight"], &v55);
          v26 = [v24 objectForKey:@"CroppedAndFilteredImage"];
          uint64_t v27 = [v24 objectForKey:@"FullImage"];
          v28 = [v24 objectForKey:@"FilterType"];
          v29 = [v24 objectForKey:@"Orientation"];
          unsigned int v50 = +[ICDocCamImageFilters imageFilterTypeFromNonLocalizedName:v28];
          uint64_t v49 = dc_orientationFromNonLocalizedName(v29);
          v30 = [v24 objectForKey:@"MarkupModelData"];
          id v31 = [(VNDocumentCameraScan *)v6 copyImageForLoading:v26 fromFolderURL:v54];
          v52 = (void *)v27;
          if (v31)
          {
            id v32 = [(VNDocumentCameraScan *)v6 copyImageForLoading:v27 fromFolderURL:v54];
            if (v32)
            {
              v33 = objc_alloc_init(ICDocCamDocumentInfo);
              [(ICDocCamDocumentInfo *)v33 setMetaData:v53];
              v34 = [ICDocCamImageQuad alloc];
              v35 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v34, "initWithBottomLeft:bottomRight:topLeft:topRight:", v56.x, v56.y, v55.x, v55.y, point.x, point.y, v57.x, v57.y);
              [(ICDocCamDocumentInfo *)v33 setImageQuad:v35];

              [(ICDocCamDocumentInfo *)v33 setCroppedAndFilteredImageUUID:v31];
              [(ICDocCamDocumentInfo *)v33 setFullImageUUID:v32];
              [(ICDocCamDocumentInfo *)v33 setCurrentFilter:v50];
              [(ICDocCamDocumentInfo *)v33 setCurrentOrientation:v49];
              [(ICDocCamDocumentInfo *)v33 setMarkupModelData:v30];
              v36 = [(VNDocumentCameraScan *)v51 docInfos];
              [v36 addObject:v33];

              int v37 = 0;
            }
            else
            {
              int v37 = 1;
            }
          }
          else
          {
            int v37 = 1;
          }

          if (v37)
          {

            goto LABEL_23;
          }
          id v6 = v51;
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }

    goto LABEL_19;
  }

LABEL_23:
  v38 = 0;
  id v6 = v51;
LABEL_24:

  return v38;
}

- (VNDocumentCameraScan)initWithArchivedData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v7 temporaryDirectory];

  char v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  uint64_t v11 = [v8 URLByAppendingPathComponent:v10 isDirectory:1];

  char v12 = [MEMORY[0x263F08C38] UUID];
  v13 = [v12 UUIDString];
  uint64_t v14 = [v11 URLByAppendingPathComponent:v13 isDirectory:0];

  v15 = [(id)v14 URLByAppendingPathExtensionForType:*MEMORY[0x263F1DDA8]];

  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v14) = [v16 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a4];

  if ((v14 & 1) == 0 || ([v6 writeToURL:v15 options:1 error:a4] & 1) == 0)
  {
    v17 = [MEMORY[0x263F08850] defaultManager];
    [(DCArchiveReader *)v17 removeItemAtURL:v11 error:0];
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
  v17 = [[DCArchiveReader alloc] initWithSourceURL:v15 destinationURL:v11];
  [(DCArchiveReader *)v17 setSkipsInvisibleHeaders:1];
  if (![(DCArchiveReader *)v17 unarchiveResultURLs:0 error:a4])
  {
    v22 = [MEMORY[0x263F08850] defaultManager];
    [v22 removeItemAtURL:v11 error:0];

    goto LABEL_6;
  }
  v18 = [(VNDocumentCameraScan *)self initWithURL:v11 error:a4];
  uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
  [v19 removeItemAtURL:v11 error:0];

  self = v18;
  v20 = self;
LABEL_7:

  return v20;
}

- (void)dealloc
{
  [(VNDocumentCameraScan *)self deleteAllImages];
  v3.receiver = self;
  v3.super_class = (Class)VNDocumentCameraScan;
  [(VNDocumentCameraScan *)&v3 dealloc];
}

- (void)replaceContentsWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VNDocumentCameraScan *)self deleteAllImages];
  [(VNDocumentCameraScan *)self setTitle:0];
  [(VNDocumentCameraScan *)self copyImagesFromDocInfoCollection:v7 imageCache:v6];

  id v9 = [v7 title];

  v8 = (void *)[v9 copy];
  [(VNDocumentCameraScan *)self setTitle:v8];
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  [v7 removeItemAtURL:v6 error:0];
  LOBYTE(v8) = 0;
  if ([v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:a4])
  {
    id v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = [NSString stringWithFormat:@"%@.%@", &unk_26C7ED7D8, &unk_26C7ED7F0];
    [v9 setObject:v10 forKey:@"Version"];

    uint64_t v11 = [(VNDocumentCameraScan *)self title];

    if (v11) {
      [(VNDocumentCameraScan *)self title];
    }
    else {
    char v12 = [v6 lastPathComponent];
    }
    [v9 setObject:v12 forKey:@"DocumentName"];
    v45 = [MEMORY[0x263EFF980] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [(VNDocumentCameraScan *)self docInfos];
    uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v44)
    {
      id v42 = v6;
      uint64_t v43 = *(void *)v47;
      v38 = v9;
      v39 = v7;
      v41 = self;
      int v37 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v8 = [v14 croppedAndFilteredImageUUID];
          id v15 = [(VNDocumentCameraScan *)self copyImageForSaving:v8 toFolderURL:v6];
          if (!v15) {
            goto LABEL_20;
          }
          uint64_t v16 = v15;
          v17 = [v14 fullImageUUID];
          id v18 = [(VNDocumentCameraScan *)self copyImageForSaving:v17 toFolderURL:v6];
          if (!v18)
          {

LABEL_20:
            LOBYTE(v8) = 0;
            id v9 = v38;
            id v7 = v39;
            char v12 = v37;
            goto LABEL_21;
          }
          uint64_t v19 = v18;
          v20 = [MEMORY[0x263EFF9A0] dictionary];
          v21 = [v14 metaData];
          [v20 setObject:v21 forKey:@"Metadata"];

          v22 = [MEMORY[0x263EFF9A0] dictionary];
          v23 = [v14 imageQuad];
          [v23 topLeft];
          CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v52);
          [v22 setObject:DictionaryRepresentation forKey:@"ImageQuadTopLeft"];

          v25 = [v14 imageQuad];
          [v25 topRight];
          CFDictionaryRef v26 = CGPointCreateDictionaryRepresentation(v53);
          [v22 setObject:v26 forKey:@"ImageQuadTopRight"];

          uint64_t v27 = [v14 imageQuad];
          [v27 bottomLeft];
          CFDictionaryRef v28 = CGPointCreateDictionaryRepresentation(v54);
          [v22 setObject:v28 forKey:@"ImageQuadBottomLeft"];

          v29 = [v14 imageQuad];
          [v29 bottomRight];
          CFDictionaryRef v30 = CGPointCreateDictionaryRepresentation(v55);
          [v22 setObject:v30 forKey:@"ImageQuadBottomRight"];

          [v20 setObject:v22 forKey:@"ImageQuad"];
          [v20 setObject:v19 forKey:@"FullImage"];
          [v20 setObject:v16 forKey:@"CroppedAndFilteredImage"];
          id v31 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", [v14 currentFilter]);
          [v20 setObject:v31 forKey:@"FilterType"];

          id v32 = dc_nonLocalizedOrientationNameForType([v14 currentOrientation]);
          [v20 setObject:v32 forKey:@"Orientation"];

          v33 = [v14 markupModelData];

          if (v33)
          {
            v34 = [v14 markupModelData];
            [v20 setObject:v34 forKey:@"MarkupModelData"];
          }
          [v45 addObject:v20];

          self = v41;
          id v6 = v42;
        }
        id v9 = v38;
        id v7 = v39;
        char v12 = v37;
        uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }

    [v9 setObject:v45 forKey:@"DocumentInfos"];
    id obj = [(VNDocumentCameraScan *)self pListURL:v6];
    LODWORD(v8) = objc_msgSend(v9, "writeToURL:error:");
    if (v8)
    {
      v35 = [(VNDocumentCameraScan *)self title];

      if (!v35) {
        [(VNDocumentCameraScan *)self setTitle:v12];
      }
    }
LABEL_21:
  }
  return (char)v8;
}

- (id)archivedDataWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v5 temporaryDirectory];

  id v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [v7 UUIDString];
  id v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:1];

  v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v11 = [v10 UUIDString];
  char v12 = [v9 URLByAppendingPathComponent:v11 isDirectory:0];

  v13 = [v12 URLByAppendingPathExtensionForType:*MEMORY[0x263F1DDA8]];

  LOBYTE(self) = [(VNDocumentCameraScan *)self saveToURL:v9 error:a3];
  uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
  id v15 = v14;
  if (self)
  {
    uint64_t v16 = [v9 path];
    v17 = [v15 contentsOfDirectoryAtPath:v16 error:a3];

    if (v17)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __46__VNDocumentCameraScan_archivedDataWithError___block_invoke;
      v25[3] = &unk_2642A9F18;
      id v18 = v9;
      id v26 = v18;
      uint64_t v19 = objc_msgSend(v17, "dc_map:", v25);
      v20 = [[DCArchiveWriter alloc] initWithDestinationURL:v13 baseURL:v18];
      [(DCArchiveWriter *)v20 setUsesCompression:1];
      if ([(DCArchiveWriter *)v20 writeURLs:v19 error:a3]
        && [(DCArchiveWriter *)v20 finish:a3])
      {
        v21 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v13 options:1 error:0];
      }
      else
      {
        v21 = 0;
      }
      v22 = [MEMORY[0x263F08850] defaultManager];
      [v22 removeItemAtURL:v18 error:0];
    }
    else
    {
      v23 = [MEMORY[0x263F08850] defaultManager];
      [v23 removeItemAtURL:v9 error:0];

      v21 = 0;
    }
  }
  else
  {
    [v14 removeItemAtURL:v9 error:0];

    v21 = 0;
  }

  return v21;
}

uint64_t __46__VNDocumentCameraScan_archivedDataWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) URLByAppendingPathComponent:a2 isDirectory:0];
}

- (id)copyImageForSaving:(id)a3 toFolderURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v22 = 0;
  BOOL v8 = [(VNDocumentCameraScan *)self makeSureScanDirectoryExists:&v22];
  id v9 = v22;
  v10 = 0;
  if (v8)
  {
    uint64_t v11 = [(VNDocumentCameraScan *)self URLForImageWithUUID:v6];
    char v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v11 path];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      id v15 = [MEMORY[0x263F08C38] UUID];
      v10 = [v15 UUIDString];

      uint64_t v16 = [(VNDocumentCameraScan *)self URLForImageInFolder:v7 withUUID:v10];
      id v21 = 0;
      char v17 = [v12 copyItemAtURL:v11 toURL:v16 error:&v21];
      id v18 = v21;
      if ((v17 & 1) == 0)
      {
        uint64_t v19 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v11;
          __int16 v25 = 2112;
          id v26 = v16;
          __int16 v27 = 2112;
          id v28 = v18;
          _os_log_error_impl(&dword_217885000, v19, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        v10 = 0;
      }
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument copyImageForSaving:toFolderURL:]();
      }
      v10 = 0;
    }
  }
  return v10;
}

- (id)copyImageForLoading:(id)a3 fromFolderURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v22 = 0;
  BOOL v8 = [(VNDocumentCameraScan *)self makeSureScanDirectoryExists:&v22];
  id v9 = v22;
  v10 = 0;
  if (v8)
  {
    uint64_t v11 = [(VNDocumentCameraScan *)self URLForImageInFolder:v7 withUUID:v6];
    char v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v11 path];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      id v15 = [MEMORY[0x263F08C38] UUID];
      v10 = [v15 UUIDString];

      uint64_t v16 = [(VNDocumentCameraScan *)self URLForImageWithUUID:v10];
      id v21 = 0;
      char v17 = [v12 copyItemAtURL:v11 toURL:v16 error:&v21];
      id v18 = v21;
      if ((v17 & 1) == 0)
      {
        uint64_t v19 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v11;
          __int16 v25 = 2112;
          id v26 = v16;
          __int16 v27 = 2112;
          id v28 = v18;
          _os_log_error_impl(&dword_217885000, v19, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        v10 = 0;
      }
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument copyImageForSaving:toFolderURL:]();
      }
      v10 = 0;
    }
  }
  return v10;
}

- (id)pListURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"DocumentInfo.plist"];
}

- (id)imageForScanAtIndex:(unint64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = [(VNDocumentCameraScan *)self docInfos];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    if (a4)
    {
      v10 = +[DCLocalization localizedStringForKey:@"Index out of range." value:@"Index out of range." table:@"Localizable"];
      uint64_t v13 = *MEMORY[0x263F08320];
      v14[0] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.documentcamera" code:1 userInfo:v11];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = [(VNDocumentCameraScan *)self imageOfPageAtIndex:a3];
  }

  return v9;
}

- (NSUInteger)pageCount
{
  objc_super v3 = [(VNDocumentCameraScan *)self docInfos];

  if (!v3) {
    return 0;
  }
  id v4 = [(VNDocumentCameraScan *)self docInfos];
  NSUInteger v5 = [v4 count];

  return v5;
}

- (UIImage)imageOfPageAtIndex:(NSUInteger)index
{
  id v6 = [(VNDocumentCameraScan *)self docInfos];

  if (v6)
  {
    id v7 = [(VNDocumentCameraScan *)self docInfos];
    NSUInteger v8 = [v7 count];

    if (v8 <= index)
    {
      char v17 = 0;
      goto LABEL_16;
    }
    id v9 = [(VNDocumentCameraScan *)self docInfos];
    v10 = [v9 objectAtIndexedSubscript:index];

    uint64_t v11 = [v10 croppedAndFilteredImageUUID];
    char v12 = (void *)MEMORY[0x21D44F7D0]();
    uint64_t v13 = [MEMORY[0x263F086E0] mainBundle];
    char v14 = [v13 bundleIdentifier];
    id v15 = [v14 lowercaseString];
    int v16 = [v15 isEqualToString:@"com.apple.sidecar.extension.camera"];

    if (v16)
    {
      char v17 = [(VNDocumentCameraScan *)self getImage:v11];
    }
    else
    {
      __int16 v25 = [(VNDocumentCameraScan *)self getImageURL:v11];
      id v26 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v25 options:0 error:0];
      char v17 = [MEMORY[0x263F1C6B0] imageWithData:v26];
    }
    if (!v17)
    {
      __int16 v27 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        [(VNDocumentCameraScan *)(uint64_t)v11 imageOfPageAtIndex:v27];
      }
    }
  }
  else
  {
    v10 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VNDocumentCameraScan imageOfPageAtIndex:](v10, v18, v19, v20, v21, v22, v23, v24);
    }
    char v17 = 0;
  }

LABEL_16:
  id v28 = [(VNDocumentCameraScan *)self docInfos];
  NSUInteger v29 = [v28 count];

  if (v29 <= index)
  {
    v33 = NSString;
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    v36 = NSStringFromSelector(a2);
    uint64_t v37 = [v33 stringWithFormat:@"-[%@ %@]: index (%lu) beyond bounds (%lu).", v35, v36, index, -[VNDocumentCameraScan pageCount](self, "pageCount")];

    id v38 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] reason:v37 userInfo:0];
    objc_exception_throw(v38);
  }
  if (v17) {
    id v30 = v17;
  }
  else {
    id v30 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  }
  id v31 = v30;

  return (UIImage *)v31;
}

- (BOOL)copyImagesFromDocInfoCollection:(id)a3 imageCache:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v48 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  [(VNDocumentCameraScan *)self setDocInfos:v7];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v6 docInfos];
  uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v47)
  {
    BOOL v26 = 1;
    goto LABEL_19;
  }
  uint64_t v46 = *(void *)v52;
  id v44 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v47; ++i)
    {
      if (*(void *)v52 != v46) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      v10 = [v9 croppedAndFilteredImageUUID];
      uint64_t v11 = [v48 getImageURL:v10 async:0];
      id v12 = [(VNDocumentCameraScan *)self copyImageAtURL:v11];
      uint64_t v13 = [v9 fullImageUUID];
      char v14 = [v48 getImageURL:v13 async:0];
      id v15 = [(VNDocumentCameraScan *)self copyImageAtURL:v14];
      int v16 = v15;
      if (!v12)
      {
        __int16 v27 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](v27, v28, v29, v30, v31, v32, v33, v34);
        }

        [(VNDocumentCameraScan *)self deleteAllImages];
        goto LABEL_18;
      }
      if (!v15)
      {
        v35 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](v35, v36, v37, v38, v39, v40, v41, v42);
        }

        [(VNDocumentCameraScan *)self deleteAllImages];
LABEL_18:
        id v6 = v44;

        BOOL v26 = 0;
        goto LABEL_19;
      }
      unsigned int v50 = v11;
      char v17 = objc_alloc_init(ICDocCamDocumentInfo);
      uint64_t v18 = [v9 metaData];
      long long v49 = v10;
      uint64_t v19 = self;
      uint64_t v20 = (void *)[v18 copy];
      [(ICDocCamDocumentInfo *)v17 setMetaData:v20];

      uint64_t v21 = [v9 imageQuad];
      uint64_t v22 = (void *)[v21 copy];
      [(ICDocCamDocumentInfo *)v17 setImageQuad:v22];

      self = v19;
      [(ICDocCamDocumentInfo *)v17 setCroppedAndFilteredImageUUID:v12];
      [(ICDocCamDocumentInfo *)v17 setCroppedButNotFilteredImageUUID:0];
      [(ICDocCamDocumentInfo *)v17 setFullImageUUID:v16];
      [(ICDocCamDocumentInfo *)v17 setMeshAnimImageUUID:0];
      -[ICDocCamDocumentInfo setCurrentFilter:](v17, "setCurrentFilter:", [v9 currentFilter]);
      -[ICDocCamDocumentInfo setCurrentOrientation:](v17, "setCurrentOrientation:", [v9 currentOrientation]);
      [(ICDocCamDocumentInfo *)v17 setScanDataDelegateIdentifier:0];
      uint64_t v23 = [v9 markupModelData];
      uint64_t v24 = (void *)[v23 copy];
      [(ICDocCamDocumentInfo *)v17 setMarkupModelData:v24];

      __int16 v25 = [(VNDocumentCameraScan *)v19 docInfos];
      [v25 addObject:v17];
    }
    BOOL v26 = 1;
    id v6 = v44;
    uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v47) {
      continue;
    }
    break;
  }
LABEL_19:

  return v26;
}

- (id)infoCollectionWithImageCache:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(ICDocCamDocumentInfoCollection);
  NSUInteger v8 = [(VNDocumentCameraScan *)self title];
  [(ICDocCamDocumentInfoCollection *)v7 setTitle:v8];

  id v9 = [(VNDocumentCameraScan *)self docInfos];
  v10 = (void *)[v9 copy];
  [(ICDocCamDocumentInfoCollection *)v7 setDocInfos:v10];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(ICDocCamDocumentInfoCollection *)v7 docInfos];
  uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v31)
  {
    uint64_t v29 = self;
    uint64_t v30 = *(void *)v33;
    unint64_t v11 = 0x263F08000uLL;
    __int16 v27 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v14 = [*(id *)(v11 + 2128) defaultManager];
        id v15 = [v13 croppedAndFilteredImageUUID];
        [(VNDocumentCameraScan *)self getImageURL:v15];
        v17 = unint64_t v16 = v11;
        uint64_t v18 = [v13 croppedAndFilteredImageUUID];
        uint64_t v19 = [v6 getImageURL:v18 async:0];
        [v14 copyItemAtURL:v17 toURL:v19 error:a4];

        unint64_t v11 = v16;
        self = v29;

        if (*a4) {
          goto LABEL_11;
        }
        uint64_t v20 = [*(id *)(v11 + 2128) defaultManager];
        uint64_t v21 = [v13 fullImageUUID];
        uint64_t v22 = [(VNDocumentCameraScan *)v29 getImageURL:v21];
        uint64_t v23 = [v13 fullImageUUID];
        uint64_t v24 = [v6 getImageURL:v23 async:0];
        [v20 copyItemAtURL:v22 toURL:v24 error:a4];

        if (*a4)
        {
LABEL_11:

          __int16 v25 = 0;
          id v7 = v27;
          goto LABEL_12;
        }
      }
      id v7 = v27;
      uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  __int16 v25 = v7;
LABEL_12:

  return v25;
}

- (BOOL)makeSureScanDirectoryExists:(id *)a3
{
  id v4 = [(VNDocumentCameraScan *)self scannedDocumentImageDirectoryURL];
  NSUInteger v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:a3];

  if ((v6 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DCScannedDocument makeSureScanDirectoryExists:]((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v6;
}

- (id)URLForImageInFolder:(id)a3 withUUID:(id)a4
{
  id v4 = [a3 URLByAppendingPathComponent:a4];
  NSUInteger v5 = [v4 URLByAppendingPathExtension:@"jpg"];

  return v5;
}

- (id)URLForImageWithUUID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(VNDocumentCameraScan *)self scannedDocumentImageDirectoryURL];
  char v6 = [(VNDocumentCameraScan *)self URLForImageInFolder:v5 withUUID:v4];

  return v6;
}

- (id)copyImageAtURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v18 = 0;
  BOOL v5 = [(VNDocumentCameraScan *)self makeSureScanDirectoryExists:&v18];
  id v6 = v18;
  id v7 = 0;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [v4 path];
    char v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F08C38] UUID];
      id v7 = [v11 UUIDString];

      uint64_t v12 = [(VNDocumentCameraScan *)self URLForImageWithUUID:v7];
      id v17 = 0;
      char v13 = [v8 copyItemAtURL:v4 toURL:v12 error:&v17];
      id v14 = v17;
      if ((v13 & 1) == 0)
      {
        id v15 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v4;
          __int16 v21 = 2112;
          uint64_t v22 = v12;
          __int16 v23 = 2112;
          id v24 = v14;
          _os_log_error_impl(&dword_217885000, v15, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        id v7 = 0;
      }
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument copyImageForSaving:toFolderURL:]();
      }
      id v7 = 0;
    }
  }
  return v7;
}

- (id)getImage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VNDocumentCameraScan getImage:](v6, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_7;
  }
  id v22 = 0;
  BOOL v5 = [(VNDocumentCameraScan *)self makeSureScanDirectoryExists:&v22];
  id v6 = v22;
  if (!v5)
  {
LABEL_7:
    char v13 = 0;
    goto LABEL_12;
  }
  id v7 = [(VNDocumentCameraScan *)self getImageURL:v4];
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v12 = [v7 path];
    char v13 = [v11 imageWithContentsOfFile:v12];
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VNDocumentCameraScan getImage:]();
    }
    char v13 = 0;
  }

LABEL_12:

  return v13;
}

- (BOOL)deleteImage:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  BOOL v5 = [(VNDocumentCameraScan *)self makeSureScanDirectoryExists:&v17];
  id v6 = v17;
  if (v5)
  {
    id v7 = [(VNDocumentCameraScan *)self getImageURL:v4];
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [v7 path];
    char v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      id v16 = 0;
      char v11 = [v8 removeItemAtURL:v7 error:&v16];
      id v12 = v16;
      if (v11)
      {
        BOOL v13 = 1;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v14 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument deleteImage:]();
      }
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[VNDocumentCameraScan deleteImage:]();
      }
      id v12 = 0;
    }

    BOOL v13 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)deleteAllImages
{
  objc_super v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(VNDocumentCameraScan *)self scannedDocumentImageDirectoryURL];
  BOOL v5 = [v4 path];
  int v6 = [v3 fileExistsAtPath:v5];

  if (v6)
  {
    id v12 = 0;
    int v7 = [v3 removeItemAtURL:v4 error:&v12];
    id v8 = v12;
    uint64_t v9 = v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10)
    {
      char v11 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument deleteAllImages]();
      }
    }
  }
  [(VNDocumentCameraScan *)self setDocInfos:0];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
}

- (NSURL)scannedDocumentImageDirectoryURL
{
  return self->_scannedDocumentImageDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannedDocumentImageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_docInfos, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)imageOfPageAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageOfPageAtIndex:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[VNDocumentCameraScan imageOfPageAtIndex:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "%s: nil image %@ %@", (uint8_t *)&v3, 0x20u);
}

- (void)getImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getImage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "VNDocumentCameraScan getImage: Unable to find file: %@", v2, v3, v4, v5, v6);
}

- (void)deleteImage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "VNDocumentCameraScan deleteImage: Unable to find file: %@", v2, v3, v4, v5, v6);
}

@end