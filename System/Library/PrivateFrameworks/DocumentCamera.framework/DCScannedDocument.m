@interface DCScannedDocument
+ (id)scannedDocumentsFolderURL;
+ (void)initialize;
- (BOOL)copyImagesFromDocInfoCollection:(id)a3 imageCache:(id)a4;
- (BOOL)deleteImage:(id)a3;
- (BOOL)makeSureScanDirectoryExists:(id *)a3;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (DCScannedDocument)initWithDocInfoCollection:(id)a3 imageCache:(id)a4;
- (DCScannedDocument)initWithURL:(id)a3 error:(id *)a4;
- (NSMutableArray)docInfos;
- (NSString)title;
- (NSURL)scannedDocumentImageDirectoryURL;
- (id)URLForImageInFolder:(id)a3 withUUID:(id)a4;
- (id)URLForImageWithUUID:(id)a3;
- (id)copyImageAtURL:(id)a3;
- (id)copyImageForLoading:(id)a3 fromFolderURL:(id)a4;
- (id)copyImageForSaving:(id)a3 toFolderURL:(id)a4;
- (id)getImage:(id)a3;
- (id)imageForScanAtIndex:(unint64_t)a3 error:(id *)a4;
- (id)imageOfPageAtIndex:(unint64_t)a3;
- (id)pListURL:(id)a3;
- (unint64_t)pageCount;
- (void)dealloc;
- (void)deleteAllImages;
- (void)replaceContentsWithDocInfoCollection:(id)a3 imageCache:(id)a4;
- (void)setDocInfos:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DCScannedDocument

+ (id)scannedDocumentsFolderURL
{
  if (scannedDocumentsFolderURL_onceToken != -1) {
    dispatch_once(&scannedDocumentsFolderURL_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)scannedDocumentsFolderURL_URL;

  return v2;
}

void __46__DCScannedDocument_scannedDocumentsFolderURL__block_invoke()
{
  v0 = +[DCCachesDirectory sharedCachesDirectory];
  id v3 = [v0 cachesDirectoryURL];

  uint64_t v1 = [v3 URLByAppendingPathComponent:@"com.apple.ScannedDocuments"];
  v2 = (void *)scannedDocumentsFolderURL_URL;
  scannedDocumentsFolderURL_URL = v1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v4 = +[DCScannedDocument scannedDocumentsFolderURL];
    v2 = [MEMORY[0x263F08850] defaultManager];
    id v3 = [v4 path];
    [v2 removeItemAtPath:v3 error:0];
  }
}

- (DCScannedDocument)initWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)DCScannedDocument;
  id v5 = a4;
  id v6 = a3;
  v7 = [(DCScannedDocument *)&v19 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x263F08C38], "UUID", v19.receiver, v19.super_class);
    v9 = [v8 UUIDString];

    v10 = +[DCScannedDocument scannedDocumentsFolderURL];
    uint64_t v11 = [v10 URLByAppendingPathComponent:v9];
    scannedDocumentImageDirectoryURL = v7->_scannedDocumentImageDirectoryURL;
    v7->_scannedDocumentImageDirectoryURL = (NSURL *)v11;
  }
  v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v19.receiver, v19.super_class);
  uint64_t v14 = *MEMORY[0x263F1D0E0];
  v15 = [MEMORY[0x263F1C408] sharedApplication];
  [v13 addObserver:v7 selector:sel_applicationWillTerminate_ name:v14 object:v15];

  [(DCScannedDocument *)v7 copyImagesFromDocInfoCollection:v6 imageCache:v5];
  v16 = [v6 title];

  v17 = (void *)[v16 copy];
  [(DCScannedDocument *)v7 setTitle:v17];

  return v7;
}

- (DCScannedDocument)initWithURL:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v55 = a3;
  v64.receiver = self;
  v64.super_class = (Class)DCScannedDocument;
  id v5 = [(DCScannedDocument *)&v64 init];
  id v6 = v5;
  if (!v5)
  {
LABEL_21:
    v39 = v6;
    goto LABEL_26;
  }
  v52 = v5;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v55 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    v10 = [(DCScannedDocument *)v52 pListURL:v55];
    uint64_t v11 = [v10 path];
    char v12 = [v7 fileExistsAtPath:v11];

    if ((v12 & 1) == 0)
    {

      v39 = 0;
      id v6 = v52;
      goto LABEL_26;
    }
    v46 = v7;
    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];

    v15 = +[DCScannedDocument scannedDocumentsFolderURL];
    v44 = (void *)v14;
    uint64_t v16 = [v15 URLByAppendingPathComponent:v14];
    scannedDocumentImageDirectoryURL = v52->_scannedDocumentImageDirectoryURL;
    v52->_scannedDocumentImageDirectoryURL = (NSURL *)v16;

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v19 = *MEMORY[0x263F1D0E0];
    v20 = [MEMORY[0x263F1C408] sharedApplication];
    [v18 addObserver:v52 selector:sel_applicationWillTerminate_ name:v19 object:v20];

    v45 = v10;
    v21 = [NSDictionary dictionaryWithContentsOfURL:v10];
    v42 = [v21 objectForKey:@"Version"];
    uint64_t v22 = [v21 objectForKey:@"DocumentName"];
    if (!v22)
    {
      uint64_t v22 = [v55 lastPathComponent];
    }
    v41 = (void *)v22;
    [(DCScannedDocument *)v52 setTitle:v22];
    v23 = [MEMORY[0x263EFF980] array];
    [(DCScannedDocument *)v52 setDocInfos:v23];

    v43 = v21;
    [v21 objectForKey:@"DocumentInfos"];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v52;
    uint64_t v49 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v61 != v48) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v54 = [v25 objectForKey:@"Metadata"];
          v26 = [v25 objectForKey:@"ImageQuad"];
          point.x = 0.0;
          point.y = 0.0;
          v58.x = 0.0;
          v58.y = 0.0;
          v57.x = 0.0;
          v57.y = 0.0;
          v56.x = 0.0;
          v56.y = 0.0;
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v26 objectForKey:@"ImageQuadTopLeft"], &point);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v26 objectForKey:@"ImageQuadTopRight"], &v58);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v26 objectForKey:@"ImageQuadBottomLeft"], &v57);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v26 objectForKey:@"ImageQuadBottomRight"], &v56);
          v27 = [v25 objectForKey:@"CroppedAndFilteredImage"];
          uint64_t v28 = [v25 objectForKey:@"FullImage"];
          v29 = [v25 objectForKey:@"FilterType"];
          v30 = [v25 objectForKey:@"Orientation"];
          unsigned int v51 = +[ICDocCamImageFilters imageFilterTypeFromNonLocalizedName:v29];
          uint64_t v50 = dc_orientationFromNonLocalizedName(v30);
          v31 = [v25 objectForKey:@"MarkupModelData"];
          id v32 = [(DCScannedDocument *)v6 copyImageForLoading:v27 fromFolderURL:v55];
          v53 = (void *)v28;
          if (v32)
          {
            id v33 = [(DCScannedDocument *)v6 copyImageForLoading:v28 fromFolderURL:v55];
            if (v33)
            {
              v34 = [[ICDocCamDocumentInfo alloc] initWithDelegate:0];
              [(ICDocCamDocumentInfo *)v34 setMetaData:v54];
              v35 = [ICDocCamImageQuad alloc];
              v36 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v35, "initWithBottomLeft:bottomRight:topLeft:topRight:", v57.x, v57.y, v56.x, v56.y, point.x, point.y, v58.x, v58.y);
              [(ICDocCamDocumentInfo *)v34 setImageQuad:v36];

              [(ICDocCamDocumentInfo *)v34 setCroppedAndFilteredImageUUID:v32];
              [(ICDocCamDocumentInfo *)v34 setFullImageUUID:v33];
              [(ICDocCamDocumentInfo *)v34 setCurrentFilter:v51];
              [(ICDocCamDocumentInfo *)v34 setCurrentOrientation:v50];
              [(ICDocCamDocumentInfo *)v34 setMarkupModelData:v31];
              v37 = [(DCScannedDocument *)v52 docInfos];
              [v37 addObject:v34];

              int v38 = 0;
            }
            else
            {
              int v38 = 1;
            }
          }
          else
          {
            int v38 = 1;
          }

          if (v38)
          {

            goto LABEL_25;
          }
          id v6 = v52;
        }
        uint64_t v49 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v49) {
          continue;
        }
        break;
      }
    }

    goto LABEL_21;
  }

LABEL_25:
  v39 = 0;
  id v6 = v52;
LABEL_26:

  return v39;
}

- (void)dealloc
{
  [(DCScannedDocument *)self deleteAllImages];
  v3.receiver = self;
  v3.super_class = (Class)DCScannedDocument;
  [(DCScannedDocument *)&v3 dealloc];
}

- (void)replaceContentsWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DCScannedDocument *)self deleteAllImages];
  [(DCScannedDocument *)self setTitle:0];
  [(DCScannedDocument *)self copyImagesFromDocInfoCollection:v7 imageCache:v6];

  id v9 = [v7 title];

  v8 = (void *)[v9 copy];
  [(DCScannedDocument *)self setTitle:v8];
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
    v10 = [NSString stringWithFormat:@"%@.%@", &unk_26C7ED7A8, &unk_26C7ED7C0];
    [v9 setObject:v10 forKey:@"Version"];

    uint64_t v11 = [(DCScannedDocument *)self title];

    if (v11) {
      [(DCScannedDocument *)self title];
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
    id obj = [(DCScannedDocument *)self docInfos];
    uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v44)
    {
      id v42 = v6;
      uint64_t v43 = *(void *)v47;
      int v38 = v9;
      v39 = v7;
      v41 = self;
      v37 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v8 = [v14 croppedAndFilteredImageUUID];
          id v15 = [(DCScannedDocument *)self copyImageForSaving:v8 toFolderURL:v6];
          if (!v15) {
            goto LABEL_20;
          }
          uint64_t v16 = v15;
          v17 = [v14 fullImageUUID];
          id v18 = [(DCScannedDocument *)self copyImageForSaving:v17 toFolderURL:v6];
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

          uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
          v23 = [v14 imageQuad];
          [v23 topLeft];
          CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v52);
          [v22 setObject:DictionaryRepresentation forKey:@"ImageQuadTopLeft"];

          v25 = [v14 imageQuad];
          [v25 topRight];
          CFDictionaryRef v26 = CGPointCreateDictionaryRepresentation(v53);
          [v22 setObject:v26 forKey:@"ImageQuadTopRight"];

          v27 = [v14 imageQuad];
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
          v31 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", [v14 currentFilter]);
          [v20 setObject:v31 forKey:@"FilterType"];

          id v32 = dc_nonLocalizedOrientationNameForType([v14 currentOrientation]);
          [v20 setObject:v32 forKey:@"Orientation"];

          id v33 = [v14 markupModelData];

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
    id obj = [(DCScannedDocument *)self pListURL:v6];
    LODWORD(v8) = objc_msgSend(v9, "writeToURL:error:");
    if (v8)
    {
      v35 = [(DCScannedDocument *)self title];

      if (!v35) {
        [(DCScannedDocument *)self setTitle:v12];
      }
    }
LABEL_21:
  }
  return (char)v8;
}

- (id)copyImageForSaving:(id)a3 toFolderURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v22 = 0;
  BOOL v8 = [(DCScannedDocument *)self makeSureScanDirectoryExists:&v22];
  id v9 = v22;
  v10 = 0;
  if (v8)
  {
    uint64_t v11 = [(DCScannedDocument *)self URLForImageWithUUID:v6];
    char v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v11 path];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      id v15 = [MEMORY[0x263F08C38] UUID];
      v10 = [v15 UUIDString];

      uint64_t v16 = [(DCScannedDocument *)self URLForImageInFolder:v7 withUUID:v10];
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
          CFDictionaryRef v26 = v16;
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
  BOOL v8 = [(DCScannedDocument *)self makeSureScanDirectoryExists:&v22];
  id v9 = v22;
  v10 = 0;
  if (v8)
  {
    uint64_t v11 = [(DCScannedDocument *)self URLForImageInFolder:v7 withUUID:v6];
    char v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v11 path];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      id v15 = [MEMORY[0x263F08C38] UUID];
      v10 = [v15 UUIDString];

      uint64_t v16 = [(DCScannedDocument *)self URLForImageWithUUID:v10];
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
          CFDictionaryRef v26 = v16;
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
  id v7 = [(DCScannedDocument *)self docInfos];
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
    id v9 = [(DCScannedDocument *)self imageOfPageAtIndex:a3];
  }

  return v9;
}

- (unint64_t)pageCount
{
  objc_super v3 = [(DCScannedDocument *)self docInfos];

  if (!v3) {
    return 0;
  }
  id v4 = [(DCScannedDocument *)self docInfos];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)imageOfPageAtIndex:(unint64_t)a3
{
  id v6 = [(DCScannedDocument *)self docInfos];

  if (!v6)
  {
    v10 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DCScannedDocument imageOfPageAtIndex:](v10, v14, v15, v16, v17, v18, v19, v20);
    }
    char v12 = 0;
    goto LABEL_11;
  }
  id v7 = [(DCScannedDocument *)self docInfos];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    id v9 = [(DCScannedDocument *)self docInfos];
    v10 = [v9 objectAtIndexedSubscript:a3];

    uint64_t v11 = [v10 croppedAndFilteredImageUUID];
    char v12 = [(DCScannedDocument *)self getImage:v11];
    if (!v12)
    {
      uint64_t v13 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(DCScannedDocument *)(uint64_t)v11 imageOfPageAtIndex:v13];
      }
    }
LABEL_11:

    goto LABEL_13;
  }
  char v12 = 0;
LABEL_13:
  id v21 = [(DCScannedDocument *)self docInfos];
  unint64_t v22 = [v21 count];

  if (v22 <= a3)
  {
    CFDictionaryRef v26 = NSString;
    __int16 v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    uint64_t v29 = NSStringFromSelector(a2);
    uint64_t v30 = [v26 stringWithFormat:@"-[%@ %@]: index (%lu) beyond bounds (%lu).", v28, v29, a3, -[DCScannedDocument pageCount](self, "pageCount")];

    id v31 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] reason:v30 userInfo:0];
    objc_exception_throw(v31);
  }
  if (v12) {
    id v23 = v12;
  }
  else {
    id v23 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  }
  v24 = v23;

  return v24;
}

- (BOOL)copyImagesFromDocInfoCollection:(id)a3 imageCache:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v48 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  [(DCScannedDocument *)self setDocInfos:v7];

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
      id v12 = [(DCScannedDocument *)self copyImageAtURL:v11];
      uint64_t v13 = [v9 fullImageUUID];
      uint64_t v14 = [v48 getImageURL:v13 async:0];
      id v15 = [(DCScannedDocument *)self copyImageAtURL:v14];
      uint64_t v16 = v15;
      if (!v12)
      {
        __int16 v27 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](v27, v28, v29, v30, v31, v32, v33, v34);
        }

        [(DCScannedDocument *)self deleteAllImages];
        goto LABEL_18;
      }
      if (!v15)
      {
        v35 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](v35, v36, v37, v38, v39, v40, v41, v42);
        }

        [(DCScannedDocument *)self deleteAllImages];
LABEL_18:
        id v6 = v44;

        BOOL v26 = 0;
        goto LABEL_19;
      }
      uint64_t v50 = v11;
      uint64_t v17 = [[ICDocCamDocumentInfo alloc] initWithDelegate:0];
      uint64_t v18 = [v9 metaData];
      long long v49 = v10;
      uint64_t v19 = self;
      uint64_t v20 = (void *)[v18 copy];
      [(ICDocCamDocumentInfo *)v17 setMetaData:v20];

      id v21 = [v9 imageQuad];
      unint64_t v22 = (void *)[v21 copy];
      [(ICDocCamDocumentInfo *)v17 setImageQuad:v22];

      self = v19;
      [(ICDocCamDocumentInfo *)v17 setCroppedAndFilteredImageUUID:v12];
      [(ICDocCamDocumentInfo *)v17 setCroppedButNotFilteredImageUUID:0];
      [(ICDocCamDocumentInfo *)v17 setFullImageUUID:v16];
      [(ICDocCamDocumentInfo *)v17 setMeshAnimImageUUID:0];
      -[ICDocCamDocumentInfo setCurrentFilter:](v17, "setCurrentFilter:", [v9 currentFilter]);
      -[ICDocCamDocumentInfo setCurrentOrientation:](v17, "setCurrentOrientation:", [v9 currentOrientation]);
      [(ICDocCamDocumentInfo *)v17 setScanDataDelegateIdentifier:0];
      id v23 = [v9 markupModelData];
      v24 = (void *)[v23 copy];
      [(ICDocCamDocumentInfo *)v17 setMarkupModelData:v24];

      __int16 v25 = [(DCScannedDocument *)v19 docInfos];
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

- (BOOL)makeSureScanDirectoryExists:(id *)a3
{
  id v4 = [(DCScannedDocument *)self scannedDocumentImageDirectoryURL];
  unint64_t v5 = [MEMORY[0x263F08850] defaultManager];
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
  unint64_t v5 = [v4 URLByAppendingPathExtension:@"jpg"];

  return v5;
}

- (id)URLForImageWithUUID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DCScannedDocument *)self scannedDocumentImageDirectoryURL];
  char v6 = [(DCScannedDocument *)self URLForImageInFolder:v5 withUUID:v4];

  return v6;
}

- (id)copyImageAtURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v18 = 0;
  BOOL v5 = [(DCScannedDocument *)self makeSureScanDirectoryExists:&v18];
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

      uint64_t v12 = [(DCScannedDocument *)self URLForImageWithUUID:v7];
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
          unint64_t v22 = v12;
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
      -[DCScannedDocument getImage:](v6, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_7;
  }
  id v22 = 0;
  BOOL v5 = [(DCScannedDocument *)self makeSureScanDirectoryExists:&v22];
  id v6 = v22;
  if (!v5)
  {
LABEL_7:
    char v13 = 0;
    goto LABEL_12;
  }
  id v7 = [(DCScannedDocument *)self getImageURL:v4];
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
      -[DCScannedDocument getImage:]();
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
  BOOL v5 = [(DCScannedDocument *)self makeSureScanDirectoryExists:&v17];
  id v6 = v17;
  if (v5)
  {
    id v7 = [(DCScannedDocument *)self getImageURL:v4];
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
        -[DCScannedDocument deleteImage:]();
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "Removal of directory failed with error %@", v2, v3, v4, v5, v6);
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

- (void)copyImageForSaving:toFolderURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "File did not exist at path: %@", v2, v3, v4, v5, v6);
}

- (void)imageOfPageAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageOfPageAtIndex:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[DCScannedDocument imageOfPageAtIndex:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "%s: nil image %@ %@", (uint8_t *)&v3, 0x20u);
}

- (void)copyImagesFromDocInfoCollection:(uint64_t)a3 imageCache:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeSureScanDirectoryExists:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getImage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "DCScannedDocument getImage: Unable to find file: %@", v2, v3, v4, v5, v6);
}

- (void)deleteImage:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "Failed to delete image with error %@.", v2, v3, v4, v5, v6);
}

- (void)deleteImage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "DCScannedDocument deleteImage: Unable to find file: %@", v2, v3, v4, v5, v6);
}

@end