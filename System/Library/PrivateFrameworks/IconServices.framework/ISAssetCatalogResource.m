@interface ISAssetCatalogResource
+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 error:(id *)a5;
+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 platform:(unint64_t)a5 error:(id *)a6;
+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6 error:(id *)a7;
+ (id)assetCatalogResourceWithURL:(id)a3 symbolName:(id)a4 error:(id *)a5;
+ (id)coreGlyphsCatalog;
- (BOOL)disableSubtype;
- (BOOL)hasDarkResource;
- (BOOL)hasResourceWithAppearance:(int64_t)a3;
- (BOOL)hasResourceWithAppearance:(int64_t)a3 appearanceString:(id)a4;
- (BOOL)hasTintableResource;
- (BOOL)isPrecomposed;
- (CUICatalog)catalog;
- (IFImageBag)imageBag;
- (ISAssetCatalogResource)initWithCatalog:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6;
- (NSString)imageName;
- (NSString)symbolName;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (id)imageWithName:(id)a3 scale:(double)a4;
- (id)symbolImageForFontSize:(double)a3 scale:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6;
- (id)symbolImageForSize:(CGSize)a3 scale:(double)a4;
- (int64_t)_layoutDirectionFromDevice;
- (int64_t)appearance;
- (int64_t)layoutDirection;
- (unint64_t)platform;
- (void)setAppearance:(int64_t)a3;
- (void)setDisableSubtype:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
@end

@implementation ISAssetCatalogResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_imageBag, 0);
}

+ (id)coreGlyphsCatalog
{
  if (coreGlyphsCatalog_onceToken != -1) {
    dispatch_once(&coreGlyphsCatalog_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)coreGlyphsCatalog_catalog;
  return v2;
}

void __43__ISAssetCatalogResource_coreGlyphsCatalog__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F5E048], "_IS_coreGlyphsBundleURL");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(MEMORY[0x1E4F5E048], "_IS_assetCatalogURLWithBundleURL:", v3);
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v0 error:0];
  v2 = (void *)coreGlyphsCatalog_catalog;
  coreGlyphsCatalog_catalog = v1;
}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 error:(id *)a5
{
  return +[ISAssetCatalogResource assetCatalogResourceWithURL:a3 imageName:a4 symbolName:0 platform:0 error:a5];
}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 platform:(unint64_t)a5 error:(id *)a6
{
  return +[ISAssetCatalogResource assetCatalogResourceWithURL:a3 imageName:a4 symbolName:0 platform:a5 error:a6];
}

+ (id)assetCatalogResourceWithURL:(id)a3 symbolName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F5E048], "_IS_coreGlyphsBundleURL");
    objc_msgSend(MEMORY[0x1E4F5E048], "_IS_assetCatalogURLWithBundleURL:", v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v7 imageName:0 symbolName:v8 platform:0 error:a5];

  return v10;
}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (uint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  unint64_t v14 = v13;
  if (!v11 || !(v12 | v13))
  {
    if (a7)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      *a7 = (id)[v15 initWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:MEMORY[0x1E4F1CC08]];
    }
    uint64_t v16 = _ISDefaultLog();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      if (a7) {
        id v24 = *a7;
      }
      else {
        id v24 = 0;
      }
      *(_DWORD *)buf = 138413058;
      id v36 = v11;
      __int16 v37 = 2112;
      uint64_t v38 = v12;
      __int16 v39 = 2112;
      unint64_t v40 = v14;
      __int16 v41 = 2112;
      id v42 = v24;
      _os_log_error_impl(&dword_1AE771000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Unable to find asset in %@ with name i:%@ s:%@. Error: %@", buf, 0x2Au);
    }
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v11 error:a7];
  if (!(v14 | v16))
  {
    v19 = _ISDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:]((uint64_t)v11, (uint64_t *)a7, v19);
    }

    goto LABEL_6;
  }
  if (v12)
  {
    v20 = +[ISPlatformInfo sharedInstance];
    if ([v20 supportsRequestingLayerStacksForPlatform:a6])
    {
      char v21 = objc_msgSend((id)v16, "_IS_possibleLayerStackExistsWithName:platform:", v12, a6);

      if (v21) {
        goto LABEL_40;
      }
    }
    else
    {
    }
    v23 = +[ISPlatformInfo sharedInstance];
    if ([v23 supportsRequestingMultisizedImagesForPlatform:a6]) {
      int v22 = objc_msgSend((id)v16, "_IS_possibleMultisizedImageExistsWithName:platform:", v12, a6);
    }
    else {
      int v22 = 0;
    }
  }
  else
  {
    int v22 = 0;
  }
  if (v14 && !v22) {
    int v22 = [(id)v16 imageExistsWithName:v14];
  }
  if (v12 && (v22 & 1) == 0)
  {
    v25 = [(id)v12 stringByAppendingPathComponent:@"image_"];
    v26 = [(id)v16 allImageNames];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __90__ISAssetCatalogResource_assetCatalogResourceWithURL_imageName_symbolName_platform_error___block_invoke;
    v33[3] = &unk_1E5F08EF8;
    id v34 = v25;
    id v27 = v25;
    uint64_t v28 = [v26 indexOfObjectPassingTest:v33];

    int v22 = v28 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v14 || v22)
  {
    if ((v22 & 1) == 0) {
      goto LABEL_35;
    }
LABEL_40:
    v17 = [[ISAssetCatalogResource alloc] initWithCatalog:v16 imageName:v12 symbolName:v14 platform:a6];
    goto LABEL_7;
  }
  v29 = +[ISAssetCatalogResource coreGlyphsCatalog];
  char v30 = [v29 imageExistsWithName:v14];

  if (v30) {
    goto LABEL_40;
  }
LABEL_35:
  v31 = _ISDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:](v12, (uint64_t)v11, v31);
  }

  if (!a7) {
    goto LABEL_6;
  }
  id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
  v17 = 0;
  *a7 = (id)[v32 initWithDomain:*MEMORY[0x1E4F28760] code:-2582 userInfo:MEMORY[0x1E4F1CC08]];
LABEL_7:

  return v17;
}

uint64_t __90__ISAssetCatalogResource_assetCatalogResourceWithURL_imageName_symbolName_platform_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPrefix:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (ISAssetCatalogResource)initWithCatalog:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ISAssetCatalogResource;
  unint64_t v14 = [(ISAssetCatalogResource *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imageName, a4);
    objc_storeStrong((id *)&v15->_symbolName, a5);
    objc_storeStrong((id *)&v15->_catalog, a3);
    v15->_disableSubtype = 0;
    v15->_layoutDirection = 5;
    v15->_platform = a6;
    v15->_appearance = 0;
  }

  return v15;
}

- (id)imageWithName:(id)a3 scale:(double)a4
{
  v4 = [(CUICatalog *)self->_catalog imageWithName:a3 scaleFactor:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 image];
    CGImageSetProperty();
    id v7 = objc_alloc(MEMORY[0x1E4F6F1E8]);
    [v5 scale];
    id v8 = objc_msgSend(v7, "initWithCGImage:scale:", v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)_layoutDirectionFromDevice
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  uint64_t v4 = [v2 characterDirectionForLanguage:v3];

  if (v4 == 1) {
    return 5;
  }
  else {
    return 4 * (v4 == 2);
  }
}

- (IFImageBag)imageBag
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  imageBag = self->_imageBag;
  if (!imageBag)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(NSString *)self->_imageName stringByAppendingPathComponent:@"image"];
    [(CUICatalog *)self->_catalog allImageNames];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 hasPrefix:v5])
          {
            id v11 = [v10 imageMetadataFromFileName];
            id v12 = [v11 objectForKeyedSubscript:kIconCompilerImageInfoNameKey];
            if (([v12 isEqualToString:v5] & 1) != 0
              || [v12 isEqualToString:self->_imageName])
            {
              id v13 = [(ISAssetCatalogResource *)self imageWithName:v10 scale:1.0];
              if (v13) {
                [v4 addObject:v13];
              }

              unint64_t v14 = [(ISAssetCatalogResource *)self imageWithName:v10 scale:2.0];
              if (v14) {
                [v4 addObject:v14];
              }

              id v15 = [(ISAssetCatalogResource *)self imageWithName:v10 scale:3.0];
              if (v15) {
                [v4 addObject:v15];
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    if ([v4 count])
    {
      uint64_t v16 = (IFImageBag *)[objc_alloc(MEMORY[0x1E4F6F1F0]) initWithImages:v4];
      objc_super v17 = self->_imageBag;
      self->_imageBag = v16;
    }
    imageBag = self->_imageBag;
  }
  return imageBag;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = +[ISPlatformInfo sharedInstance];
  int v9 = objc_msgSend(v8, "supportsRequestingLayerStacksForPlatform:", -[ISAssetCatalogResource platform](self, "platform"));

  if (v9)
  {
    v10 = [(ISAssetCatalogResource *)self catalog];
    id v11 = [(ISAssetCatalogResource *)self imageName];
    id v12 = objc_msgSend(v10, "_IS_layerStackWithName:scale:layoutDirection:platform:", v11, -[ISAssetCatalogResource layoutDirection](self, "layoutDirection"), -[ISAssetCatalogResource platform](self, "platform"), a4);

    if (v12)
    {
      uint64_t v13 = [v12 flattenedImage];
      unint64_t v14 = 0;
      double v15 = a4;
      goto LABEL_7;
    }
  }
  uint64_t v16 = +[ISPlatformInfo sharedInstance];
  int v17 = objc_msgSend(v16, "supportsRequestingMultisizedImagesForPlatform:", -[ISAssetCatalogResource platform](self, "platform"));

  if (v17)
  {
    catalog = self->_catalog;
    v19 = [(ISAssetCatalogResource *)self imageName];
    unint64_t v14 = -[CUICatalog _IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:](catalog, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", v19, [(ISAssetCatalogResource *)self layoutDirection], [(ISAssetCatalogResource *)self platform], [(ISAssetCatalogResource *)self catalogAppearance], width, height, a4);

    if (v14)
    {
      uint64_t v13 = [v14 image];
      [v14 scale];
      double v15 = v20;
      id v12 = 0;
LABEL_7:
      CGImageSetProperty();
      long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F6F1E8]) initWithCGImage:v13 scale:v15];
      if (v21) {
        goto LABEL_23;
      }
      goto LABEL_11;
    }
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
    unint64_t v14 = 0;
  }
LABEL_11:
  if (!self->_imageName) {
    goto LABEL_28;
  }
  long long v22 = _ISDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    imageName = self->_imageName;
    int v31 = 138413058;
    id v32 = imageName;
    __int16 v33 = 2048;
    double v34 = width;
    __int16 v35 = 2048;
    double v36 = width;
    __int16 v37 = 2048;
    double v38 = a4;
    _os_log_debug_impl(&dword_1AE771000, v22, OS_LOG_TYPE_DEBUG, "Unable to find icon image named: %@ for size: (%f,%f) scale:(%lf). Looking for resources matching the iconset naming convention.", (uint8_t *)&v31, 0x2Au);
  }

  long long v23 = [(ISAssetCatalogResource *)self imageBag];
  long long v21 = objc_msgSend(v23, "imageForSize:scale:", width, height, a4);

  if (!v21)
  {
    if (!self->_symbolName) {
      goto LABEL_20;
    }
LABEL_28:
    id v24 = _ISDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v29 = self->_imageName;
      int v31 = 138413058;
      id v32 = v29;
      __int16 v33 = 2048;
      double v34 = width;
      __int16 v35 = 2048;
      double v36 = width;
      __int16 v37 = 2048;
      double v38 = a4;
      _os_log_debug_impl(&dword_1AE771000, v24, OS_LOG_TYPE_DEBUG, "Unable to find resources matching the iconset naming convention with base name: %@ for size: (%f,%f) scale:(%lf). Looking for a symbol.", (uint8_t *)&v31, 0x2Au);
    }

    uint64_t v25 = -[ISAssetCatalogResource symbolImageForSize:scale:](self, "symbolImageForSize:scale:", width, height, a4);
    if (v25)
    {
      long long v21 = (void *)v25;
    }
    else
    {
LABEL_20:
      v26 = _ISDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v30 = self->_imageName;
        int v31 = 138413058;
        id v32 = v30;
        __int16 v33 = 2048;
        double v34 = width;
        __int16 v35 = 2048;
        double v36 = width;
        __int16 v37 = 2048;
        double v38 = a4;
        _os_log_error_impl(&dword_1AE771000, v26, OS_LOG_TYPE_ERROR, "Failed to find a icon resources with named: %@ for size: (%f,%f) scale:(%lf)", (uint8_t *)&v31, 0x2Au);
      }

      long long v21 = 0;
    }
  }
LABEL_23:

  return v21;
}

- (BOOL)isPrecomposed
{
  return 0;
}

- (BOOL)hasResourceWithAppearance:(int64_t)a3 appearanceString:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ISAssetCatalogResource *)self catalog];
  uint64_t v8 = [(ISAssetCatalogResource *)self imageName];
  int64_t v9 = [(ISAssetCatalogResource *)self layoutDirection];
  unint64_t v10 = [(ISAssetCatalogResource *)self platform];
  id v11 = objc_msgSend(v7, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", v8, v9, v10, a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0);

  if (v11)
  {
    id v12 = [v11 appearance];
    char v13 = [v12 isEqualToString:v6];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)hasResourceWithAppearance:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F5E048], "_IS_appearanceStringFromAppearance:");
  if (v5) {
    BOOL v6 = [(ISAssetCatalogResource *)self hasResourceWithAppearance:a3 appearanceString:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hasDarkResource
{
  return [(ISAssetCatalogResource *)self hasResourceWithAppearance:1];
}

- (BOOL)hasTintableResource
{
  return [(ISAssetCatalogResource *)self hasResourceWithAppearance:2];
}

- (CUICatalog)catalog
{
  return (CUICatalog *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)imageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (BOOL)disableSubtype
{
  return self->_disableSubtype;
}

- (void)setDisableSubtype:(BOOL)a3
{
  self->_disableSubtype = a3;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (id)symbolImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = [(ISAssetCatalogResource *)self symbolName];

  if (v8)
  {
    catalog = self->_catalog;
    unint64_t v10 = [(ISAssetCatalogResource *)self symbolName];
    id v11 = [(CUICatalog *)catalog namedVectorGlyphWithName:v10 scaleFactor:0 deviceIdiom:0 layoutDirection:2 glyphSize:4 glyphWeight:0 glyphPointSize:a4 appearanceName:17.0];

    if (!v11)
    {
      id v12 = +[ISAssetCatalogResource coreGlyphsCatalog];
      char v13 = [(ISAssetCatalogResource *)self symbolName];
      id v11 = [v12 namedVectorGlyphWithName:v13 scaleFactor:0 deviceIdiom:0 layoutDirection:2 glyphSize:4 glyphWeight:0 glyphPointSize:a4 appearanceName:17.0];

      if (!v11) {
        goto LABEL_7;
      }
    }
    uint64_t v14 = objc_msgSend(v11, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
    if (v14)
    {
      double v15 = (const void *)v14;
      id v16 = objc_alloc(MEMORY[0x1E4F6F1E8]);
      [v11 scale];
      int v17 = objc_msgSend(v16, "initWithCGImage:scale:", v15);
      CFRelease(v15);
    }
    else
    {
LABEL_7:
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 0;
  }
  return v17;
}

- (id)symbolImageForFontSize:(double)a3 scale:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6
{
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = 2;
  }
  if (a6) {
    int64_t v10 = a6;
  }
  else {
    int64_t v10 = 4;
  }
  catalog = self->_catalog;
  id v12 = [(ISAssetCatalogResource *)self symbolName];
  char v13 = [(CUICatalog *)catalog namedVectorGlyphWithName:v12 scaleFactor:0 deviceIdiom:0 layoutDirection:v9 glyphSize:v10 glyphWeight:0 glyphPointSize:a4 appearanceName:a3];

  if (v13) {
    goto LABEL_9;
  }
  uint64_t v14 = +[ISAssetCatalogResource coreGlyphsCatalog];
  double v15 = [(ISAssetCatalogResource *)self symbolName];
  char v13 = [v14 namedVectorGlyphWithName:v15 scaleFactor:0 deviceIdiom:0 layoutDirection:v9 glyphSize:v10 glyphWeight:0 glyphPointSize:a4 appearanceName:a3];

  if (v13) {
LABEL_9:
  }
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6F218]) initWithNamedVectorGlyph:v13];
  else {
    id v16 = 0;
  }

  return v16;
}

+ (void)assetCatalogResourceWithURL:(os_log_t)log imageName:symbolName:platform:error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = *a2;
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Unable to open asset catalog with URL: %@ error: %@.", (uint8_t *)&v4, 0x16u);
}

+ (void)assetCatalogResourceWithURL:(os_log_t)log imageName:symbolName:platform:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Unable to find image with name %@ in catalog at URL: %@.", (uint8_t *)&v3, 0x16u);
}

@end