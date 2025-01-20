@interface MSSticker
+ (BOOL)_isHEICSupported;
+ (BOOL)_isImageSourceAdaptiveImageGlyph:(CGImageSource *)a3;
+ (CGSize)_frameSizeFromFrameProperties:(id)a3;
+ (MSSticker)stickerWithContentsOfURL:(id)a3 localizedDescription:(id)a4 error:(id *)a5;
+ (id)MSStickerPreviewCacheKeyForSticker:(id)a3;
+ (id)_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:(id)a3;
+ (id)_stickerRepresentationsForImageFileURL:(id)a3;
- (IMImageDataProtocol)_imageData;
- (MSSticker)initWithContentsOfFileURL:(NSURL *)fileURL localizedDescription:(NSString *)localizedDescription error:(NSError *)error;
- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7;
- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 localizedDescription:(id)a5 error:(id *)a6;
- (MSSticker)initWithContentsOfURL:(id)a3 externalURI:(id)a4 localizedDescription:(id)a5 error:(id *)a6;
- (MSSticker)initWithFileURL:(NSURL *)url identifier:(NSUUID *)identifier localizedDescription:(NSString *)localizedDescription;
- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6;
- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 localizedDescription:(id)a8 metadata:(id)a9 attributionInfo:(id)a10;
- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 externalURI:(id)a6 localizedDescription:(id)a7;
- (NSArray)representations;
- (NSData)data;
- (NSData)metadata;
- (NSDictionary)attributionInfo;
- (NSError)_stickerError;
- (NSString)description;
- (NSString)externalURI;
- (NSString)localizedDescription;
- (NSString)stickerName;
- (NSString)stickerPackGUID;
- (NSURL)animatedImageCacheURL;
- (NSURL)imageFileURL;
- (NSUUID)stickerIdentifier;
- (UIImage)_thumbnail;
- (unint64_t)stickerEffectType;
- (void)_convertImageFileURLIfNeeded;
- (void)_generateImageData;
- (void)_generateImageDataFromRepresentation:(id)a3;
- (void)_generateImageDataFromURL:(id)a3;
- (void)_generateThumbnail;
- (void)animatedImageCacheURL;
- (void)setStickerEffectType:(unint64_t)a3;
- (void)setStickerPackGUID:(id)a3;
- (void)set_imageData:(id)a3;
- (void)set_stickerError:(id)a3;
- (void)set_thumbnail:(id)a3;
@end

@implementation MSSticker

+ (MSSticker)stickerWithContentsOfURL:(id)a3 localizedDescription:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[MSSticker alloc] initWithContentsOfFileURL:v8 localizedDescription:v7 error:a5];

  return v9;
}

- (MSSticker)initWithContentsOfFileURL:(NSURL *)fileURL localizedDescription:(NSString *)localizedDescription error:(NSError *)error
{
  id v7 = fileURL;
  id v8 = localizedDescription;
  v19.receiver = self;
  v19.super_class = (Class)MSSticker;
  v9 = [(MSSticker *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [(NSURL *)v7 copy];
    imageFileURL = v9->_imageFileURL;
    v9->_imageFileURL = (NSURL *)v10;

    objc_storeStrong((id *)&v9->_localizedDescription, localizedDescription);
    stickerIdentifier = v9->_stickerIdentifier;
    v9->_stickerIdentifier = 0;

    representations = v9->_representations;
    v9->_representations = 0;

    uint64_t v14 = [(NSURL *)v7 absoluteString];
    externalURI = v9->_externalURI;
    v9->_externalURI = (NSString *)v14;

    v9->_stickerEffectType = -1;
    metadata = v9->_metadata;
    v9->_metadata = 0;

    attributionInfo = v9->_attributionInfo;
    v9->_attributionInfo = 0;
  }
  return v9;
}

- (MSSticker)initWithFileURL:(NSURL *)url identifier:(NSUUID *)identifier localizedDescription:(NSString *)localizedDescription
{
  id v8 = url;
  v9 = identifier;
  uint64_t v10 = localizedDescription;
  v21.receiver = self;
  v21.super_class = (Class)MSSticker;
  v11 = [(MSSticker *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [(NSURL *)v8 copy];
    imageFileURL = v11->_imageFileURL;
    v11->_imageFileURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_localizedDescription, localizedDescription);
    stickerIdentifier = v11->_stickerIdentifier;
    v11->_stickerIdentifier = 0;

    representations = v11->_representations;
    v11->_representations = 0;

    uint64_t v16 = [(NSURL *)v8 absoluteString];
    externalURI = v11->_externalURI;
    v11->_externalURI = (NSString *)v16;

    v11->_stickerEffectType = -1;
    metadata = v11->_metadata;
    v11->_metadata = 0;

    attributionInfo = v11->_attributionInfo;
    v11->_attributionInfo = 0;

    objc_storeStrong((id *)&v11->_stickerIdentifier, identifier);
  }

  return v11;
}

- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 localizedDescription:(id)a5 error:(id *)a6
{
  return [(MSSticker *)self initWithContentsOfURL:a3 data:a4 externalURI:0 localizedDescription:a5 error:a6];
}

- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MSSticker;
  v15 = [(MSSticker *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    imageFileURL = v15->_imageFileURL;
    v15->_imageFileURL = (NSURL *)v16;

    objc_storeStrong((id *)&v15->_localizedDescription, a6);
    objc_storeStrong((id *)&v15->_data, a4);
    stickerIdentifier = v15->_stickerIdentifier;
    v15->_stickerIdentifier = 0;

    representations = v15->_representations;
    v15->_representations = 0;

    objc_storeStrong((id *)&v15->_externalURI, a5);
    v15->_stickerEffectType = -1;
    metadata = v15->_metadata;
    v15->_metadata = 0;

    attributionInfo = v15->_attributionInfo;
    v15->_attributionInfo = 0;
  }
  return v15;
}

- (MSSticker)initWithContentsOfURL:(id)a3 externalURI:(id)a4 localizedDescription:(id)a5 error:(id *)a6
{
  return [(MSSticker *)self initWithContentsOfURL:a3 data:0 externalURI:a4 localizedDescription:a5 error:a6];
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 externalURI:(id)a6 localizedDescription:(id)a7
{
  return [(MSSticker *)self initWithStickerIdentifier:a3 representations:a4 stickerName:a5 effectType:0 externalURI:a6 localizedDescription:a7 metadata:0 attributionInfo:0];
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 localizedDescription:(id)a8 metadata:(id)a9 attributionInfo:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v41.receiver = self;
  v41.super_class = (Class)MSSticker;
  objc_super v23 = [(MSSticker *)&v41 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    stickerIdentifier = v23->_stickerIdentifier;
    v23->_stickerIdentifier = (NSUUID *)v24;

    uint64_t v26 = [v17 copy];
    representations = v23->_representations;
    v23->_representations = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    stickerName = v23->_stickerName;
    v23->_stickerName = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    externalURI = v23->_externalURI;
    v23->_externalURI = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    localizedDescription = v23->_localizedDescription;
    v23->_localizedDescription = (NSString *)v32;

    imageFileURL = v23->_imageFileURL;
    v23->_imageFileURL = 0;

    data = v23->_data;
    v23->_data = 0;

    uint64_t v36 = [v21 copy];
    metadata = v23->_metadata;
    v23->_metadata = (NSData *)v36;

    uint64_t v38 = [v22 copy];
    attributionInfo = v23->_attributionInfo;
    v23->_attributionInfo = (NSDictionary *)v38;

    v23->_stickerEffectType = a6;
  }

  return v23;
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6
{
  return [(MSSticker *)self initWithStickerIdentifier:a3 representations:a4 stickerName:0 externalURI:a5 localizedDescription:a6];
}

- (NSString)description
{
  representations = self->_representations;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)v6;
  uint64_t v8 = 8;
  if (representations)
  {
    v9 = @"<%@-<%p> imageFileURL %@ localizedDescription %@>";
  }
  else
  {
    uint64_t v8 = 56;
    v9 = @"<%@-<%p> representations %@ localizedDescription %@>";
  }
  uint64_t v10 = objc_msgSend(v4, "stringWithFormat:", v9, v6, self, *(Class *)((char *)&self->super.isa + v8), self->_localizedDescription);

  return (NSString *)v10;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  if (self->_stickerEffectType != a3) {
    self->_stickerEffectType = a3;
  }
}

- (void)_convertImageFileURLIfNeeded
{
  if (self->_imageFileURL)
  {
    if (!self->_representations)
    {
      v3 = [(id)objc_opt_class() _stickerRepresentationsForImageFileURL:self->_imageFileURL];
      representations = self->_representations;
      self->_representations = v3;

      if (!self->_externalURI)
      {
        self->_externalURI = [(NSURL *)self->_imageFileURL absoluteString];
        MEMORY[0x1F41817F8]();
      }
    }
  }
}

+ (BOOL)_isImageSourceAdaptiveImageGlyph:(CGImageSource *)a3
{
  if (CGImageSourceGetCount(a3) == 1) {
    return 0;
  }
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  uint64_t v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FD48]];
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v7 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (CGSize)_frameSizeFromFrameProperties:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F2FD00];
  id v4 = a3;
  CFDictionaryRef v5 = [v4 objectForKeyedSubscript:v3];
  unint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];

  unint64_t v8 = [v7 unsignedIntegerValue];
  double v9 = (double)v6;
  double v10 = (double)v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:(id)a3
{
  [a1 _frameSizeFromFrameProperties:a3];
  double v5 = v3;
  if (v3 == 40.0 && v4 == 40.0)
  {
    double v9 = (id *)MEMORY[0x1E4F441F8];
    goto LABEL_20;
  }
  double v7 = v4;
  if (v3 == 64.0 && v4 == 64.0)
  {
    double v9 = (id *)MEMORY[0x1E4F44200];
    goto LABEL_20;
  }
  if (v3 == 96.0 && v4 == 96.0)
  {
    double v9 = (id *)MEMORY[0x1E4F44208];
LABEL_20:
    id v10 = *v9;
    goto LABEL_21;
  }
  if (v3 == 160.0 && v4 == 160.0)
  {
    double v9 = (id *)MEMORY[0x1E4F441E8];
    goto LABEL_20;
  }
  if (v3 == 320.0 && v4 == 320.0)
  {
    double v9 = (id *)MEMORY[0x1E4F441F0];
    goto LABEL_20;
  }
  id v12 = ms_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[MSSticker _stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:v7];
  }

  id v10 = 0;
LABEL_21:

  return v10;
}

+ (id)_stickerRepresentationsForImageFileURL:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = (const __CFURL *)a3;
  CFURLRef v5 = v4;
  if (!v4)
  {
    id v18 = 0;
    goto LABEL_58;
  }
  unint64_t v6 = (void *)MEMORY[0x1E4F42A80];
  double v7 = [(__CFURL *)v4 path];
  unint64_t v8 = [v6 imageWithContentsOfFile:v7];

  if (!v8)
  {
    id v18 = 0;
    goto LABEL_57;
  }
  isrc = CGImageSourceCreateWithURL(v5, 0);
  CFStringRef Type = CGImageSourceGetType(isrc);
  id v10 = (__CFString *)Type;
  id v11 = (void *)MEMORY[0x1E4F22678];
  id v65 = a1;
  if (!Type)
  {
    BOOL v13 = 0;
    int v17 = 0;
    int v64 = 0;
    BOOL v16 = 0;
    int v62 = 0;
    goto LABEL_14;
  }
  CFComparisonResult v12 = CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F22678], 0);
  BOOL v13 = v12 == kCFCompareEqualTo;
  if (v12 == kCFCompareEqualTo) {
    goto LABEL_7;
  }
  if (CFEqual(v10, (CFStringRef)*MEMORY[0x1E4F6EB40]))
  {
    int v64 = [a1 _isImageSourceAdaptiveImageGlyph:isrc];
    BOOL v13 = 0;
    BOOL v16 = 0;
    int v62 = 0;
    int v17 = 1;
    goto LABEL_14;
  }
  id v14 = IMSupportedAnimatedImageUTTypesSortedByPreference();
  int v15 = [v14 containsObject:v10];

  if (!v15)
  {
    BOOL v13 = 0;
    int v17 = 0;
    int v64 = 0;
    BOOL v16 = 0;
    int v62 = 0;
  }
  else
  {
LABEL_7:
    BOOL v16 = v12 != kCFCompareEqualTo;
    int v62 = IMFileURLIsActuallyAnimated();
    int v17 = 0;
    int v64 = 0;
  }
  a1 = v65;
LABEL_14:
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v59 = v10;
  if (v16)
  {
LABEL_15:
    id v19 = objc_alloc_init(MEMORY[0x1E4F43338]);
    uint64_t v67 = 0;
    id v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v67];
    uint64_t v21 = v67;
    [v19 setData:v20];

    if (!v21)
    {
      id v22 = (void *)[(__CFString *)v10 copy];
      [v19 setType:v22];

      [v8 size];
      objc_msgSend(v19, "setSize:");
      objc_super v23 = (void *)MEMORY[0x1E4F441D0];
      if (!v62) {
        objc_super v23 = (void *)MEMORY[0x1E4F441E0];
      }
      [v19 setRole:*v23];
      [v18 addObject:v19];
    }

    a1 = v65;
    goto LABEL_20;
  }
  if (v17)
  {
    if ((v13 | [a1 _isHEICSupported] & (v64 ^ 1))) {
      goto LABEL_15;
    }
    BOOL v13 = 0;
  }
  else if (v13)
  {
    goto LABEL_15;
  }
LABEL_20:
  if (!v64) {
    goto LABEL_47;
  }
  if (![a1 _isHEICSupported]) {
    goto LABEL_47;
  }
  size_t Count = CGImageSourceGetCount(isrc);
  if (!Count) {
    goto LABEL_47;
  }
  size_t v25 = Count;
  BOOL v55 = v13;
  char v56 = v17;
  v60 = 0;
  v61 = v18;
  v57 = v8;
  CFURLRef v58 = v5;
  size_t v26 = 0;
  double v27 = *MEMORY[0x1E4F1DB30];
  double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v29 = isrc;
  do
  {
    uint64_t v30 = (void *)MEMORY[0x1E4E868E0]();
    CFDictionaryRef v31 = CGImageSourceCopyPropertiesAtIndex(v29, v26, 0);
    uint64_t v32 = [a1 _stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:v31];
    if (![v32 length])
    {
      v39 = ms_defaultLog();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 134217984;
      size_t v69 = v26;
      v43 = v39;
      v44 = "Skipping frame %ld with no role";
LABEL_33:
      _os_log_error_impl(&dword_1E4A76000, v43, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
      goto LABEL_38;
    }
    [a1 _frameSizeFromFrameProperties:v31];
    double v34 = v33;
    double v36 = v35;
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v29, v26, 0);
    if (!ImageAtIndex)
    {
      v39 = ms_defaultLog();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 134217984;
      size_t v69 = v26;
      v43 = v39;
      v44 = "Skipping frame %ld due to failure to make CGImage";
      goto LABEL_33;
    }
    CGImageRef v38 = ImageAtIndex;
    v39 = [MEMORY[0x1E4F42A80] imageWithCGImage:ImageAtIndex];
    v40 = [v39 __ms_HEICData];
    if (![v40 length])
    {
      objc_super v41 = ms_defaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        size_t v69 = v26;
        _os_log_error_impl(&dword_1E4A76000, v41, OS_LOG_TYPE_ERROR, "Skipping frame %ld due to failure to convert to HEIC data", buf, 0xCu);
      }
LABEL_36:
      double v36 = v28;
      double v34 = v27;
      goto LABEL_37;
    }
    objc_super v41 = objc_alloc_init(MEMORY[0x1E4F43338]);
    [v41 setData:v40];
    [v41 setType:@"public.heic"];
    -[NSObject setSize:](v41, "setSize:", v34, v36);
    [v41 setRole:v32];
    [v61 addObject:v41];
    if (v34 <= v27) {
      goto LABEL_36;
    }
    id v42 = v40;

    v60 = v42;
    v29 = isrc;
LABEL_37:

    CFRelease(v38);
    double v28 = v36;
    double v27 = v34;
    a1 = v65;
LABEL_38:

    ++v26;
  }
  while (v25 != v26);
  unint64_t v8 = v57;
  CFURLRef v5 = v58;
  id v18 = v61;
  id v11 = (void *)MEMORY[0x1E4F22678];
  BOOL v13 = v55;
  LOBYTE(v17) = v56;
  if (v60)
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F43338]);
    [v45 setData:v60];
    [v45 setType:@"public.heic"];
    objc_msgSend(v45, "setSize:", v27, v28);
    [v45 setRole:*MEMORY[0x1E4F441E0]];
    [v61 insertObject:v45 atIndex:0];
  }
LABEL_47:
  if (v62)
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F43338]);
    uint64_t v66 = 0;
    v47 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v66];
    uint64_t v48 = v66;
    [v46 setData:v47];

    if (!v48)
    {
      v49 = (void *)[(__CFString *)v59 copy];
      [v46 setType:v49];

      [v8 size];
      objc_msgSend(v46, "setSize:");
      [v46 setRole:*MEMORY[0x1E4F441E0]];
      [v18 addObject:v46];
    }

    a1 = v65;
  }
  if (((v13 | v64) & 1) == 0)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F43338]);
    v51 = objc_msgSend(v8, "__ms_PNGData");
    [v50 setData:v51];

    [v50 setType:*v11];
    [v8 size];
    objc_msgSend(v50, "setSize:");
    [v50 setRole:*MEMORY[0x1E4F441D8]];
    [v18 addObject:v50];
  }
  if ((v17 & 1) == 0 && [a1 _isHEICSupported])
  {
    id v52 = objc_alloc_init(MEMORY[0x1E4F43338]);
    v53 = objc_msgSend(v8, "__ms_HEICData");
    [v52 setData:v53];

    [v52 setType:@"public.heic"];
    [v8 size];
    objc_msgSend(v52, "setSize:");
    [v52 setRole:*MEMORY[0x1E4F441E0]];
    [v18 addObject:v52];
  }
  CFRelease(isrc);
LABEL_57:

LABEL_58:

  return v18;
}

+ (BOOL)_isHEICSupported
{
  if (_isHEICSupported_onceToken != -1) {
    dispatch_once(&_isHEICSupported_onceToken, &__block_literal_global_4);
  }
  return _isHEICSupported_isSupported;
}

void __29__MSSticker__isHEICSupported__block_invoke()
{
  CFArrayRef v0 = CGImageDestinationCopyTypeIdentifiers();
  _isHEICSupported_isSupported = [(__CFArray *)v0 containsObject:@"public.heic"];
}

- (void)_generateImageData
{
  double v3 = [(MSSticker *)self _imageData];

  if (!v3)
  {
    uint64_t v4 = [(MSSticker *)self imageFileURL];
    if (v4)
    {
      [(MSSticker *)self _generateImageDataFromURL:v4];
    }
    else
    {
      representations = self->_representations;
      if (representations)
      {
        unint64_t v6 = [(NSArray *)representations firstObject];
        [(MSSticker *)self _generateImageDataFromRepresentation:v6];
      }
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)_generateImageDataFromURL:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(v4, "__ms_conformsToUTI:", *MEMORY[0x1E4F225F8]);
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    if (v4)
    {
      objc_super v23 = @"MSStickersErrorStickerInfoKey";
      v24[0] = v4;
      double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    }
    else
    {
      double v7 = 0;
    }
    unint64_t v8 = [v6 errorWithDomain:@"com.apple.messages.stickers-error" code:3 userInfo:v7];
    [(MSSticker *)self set_stickerError:v8];

    if (v4) {
  }
    }
  CKImageDataClass = (objc_class *)getCKImageDataClass();
  id v10 = IMLogHandleForCategory();
  id v11 = v10;
  if (CKImageDataClass)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MSSticker _generateImageDataFromURL:](CKImageDataClass);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[MSSticker _generateImageDataFromURL:]();
  }

  id v12 = objc_alloc(CKImageDataClass);
  BOOL v13 = [(MSSticker *)self imageFileURL];
  id v14 = (void *)[v12 initWithURL:v13];

  if (!v14)
  {
    BOOL v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v17 = [v4 path];
    if ([v16 fileExistsAtPath:v17]) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }

    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = @"MSStickersErrorStickerInfoKey";
    id v22 = v4;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v20 = [v19 errorWithDomain:@"com.apple.messages.stickers-error" code:v18 userInfo:v15];
    [(MSSticker *)self set_stickerError:v20];

    goto LABEL_19;
  }
  if (v5)
  {
    [(MSSticker *)self set_imageData:v14];
    int v15 = [(MSSticker *)self _imageData];
    [v15 count];
LABEL_19:
  }
}

- (void)_generateImageDataFromRepresentation:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFStringRef v6 = (const __CFString *)[v5 type];
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F225F8]))
  {
    CKImageDataClass = (objc_class *)getCKImageDataClass();
    unint64_t v8 = IMLogHandleForCategory();
    double v9 = v8;
    if (CKImageDataClass)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[MSSticker _generateImageDataFromRepresentation:](CKImageDataClass);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[MSSticker _generateImageDataFromRepresentation:]();
    }

    id v13 = objc_alloc(CKImageDataClass);
    id v14 = [v5 data];
    id v11 = (void *)[v13 initWithData:v14];

    [(MSSticker *)self set_imageData:v11];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [(MSSticker *)self stickerIdentifier];
    if (v11)
    {
      BOOL v16 = @"MSStickersErrorStickerInfoKey";
      double v3 = [(MSSticker *)self stickerIdentifier];
      v17[0] = v3;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      id v12 = 0;
    }
    int v15 = [v10 errorWithDomain:@"com.apple.messages.stickers-error" code:3 userInfo:v12];
    [(MSSticker *)self set_stickerError:v15];

    if (v11)
    {
    }
  }
}

- (void)_generateThumbnail
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

+ (id)MSStickerPreviewCacheKeyForSticker:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stickerIdentifier];

  if (v4)
  {
    uint64_t v5 = [v3 stickerIdentifier];

    [v5 UUIDString];
  }
  else
  {
    uint64_t v6 = NSString;
    uint64_t v5 = [v3 imageFileURL];

    objc_msgSend(v6, "stringWithFormat:", @"%lu", objc_msgSend(v5, "hash"));
  uint64_t v7 = };

  return v7;
}

- (NSURL)animatedImageCacheURL
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "__ms_cachesDirectory");
  uint64_t v4 = [v3 path];

  uint64_t v5 = [(NSUUID *)self->_stickerIdentifier UUIDString];
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(NSURL *)self->_imageFileURL lastPathComponent];
  }
  uint64_t v7 = v6;
  CKImageDataClass = (objc_class *)getCKImageDataClass();
  double v9 = IMLogHandleForCategory();
  id v10 = v9;
  if (CKImageDataClass)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[MSSticker animatedImageCacheURL](CKImageDataClass);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[MSSticker animatedImageCacheURL]();
  }

  if ([(objc_class *)CKImageDataClass supportsASTC]) {
    id v11 = @"ckanimatedimage";
  }
  else {
    id v11 = @"cpbitmap";
  }
  id v12 = [v7 stringByAppendingPathExtension:v11];
  if ([v4 length] && objc_msgSend(v12, "length"))
  {
    v19[0] = v4;
    v19[1] = @"BrowserData";
    v19[2] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    id v14 = [NSString pathWithComponents:v13];
    int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v16 = [v14 stringByDeletingLastPathComponent];
    [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:0];

    int v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
  }
  else
  {
    int v17 = 0;
  }

  return (NSURL *)v17;
}

- (NSURL)imageFileURL
{
  return self->_imageFileURL;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (NSUUID)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (NSArray)representations
{
  return self->_representations;
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
}

- (IMImageDataProtocol)_imageData
{
  return self->__imageData;
}

- (void)set_imageData:(id)a3
{
}

- (NSError)_stickerError
{
  return self->__stickerError;
}

- (void)set_stickerError:(id)a3
{
}

- (UIImage)_thumbnail
{
  return self->__thumbnail;
}

- (void)set_thumbnail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnail, 0);
  objc_storeStrong((id *)&self->__stickerError, 0);
  objc_storeStrong((id *)&self->__imageData, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);

  objc_storeStrong((id *)&self->_imageFileURL, 0);
}

+ (void)_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = (uint64_t)a2;
  __int16 v5 = 2048;
  uint64_t v6 = (uint64_t)a3;
  _os_log_error_impl(&dword_1E4A76000, log, OS_LOG_TYPE_ERROR, "Unable to determine role for frame of size %ldx%ld", (uint8_t *)&v3, 0x16u);
}

- (void)_generateImageDataFromURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

- (void)_generateImageDataFromURL:(objc_class *)a1 .cold.2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)_generateImageDataFromRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

- (void)_generateImageDataFromRepresentation:(objc_class *)a1 .cold.2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)animatedImageCacheURL
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

@end