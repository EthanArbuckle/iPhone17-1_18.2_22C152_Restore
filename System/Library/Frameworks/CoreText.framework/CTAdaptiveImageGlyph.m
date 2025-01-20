@interface CTAdaptiveImageGlyph
+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats;
+ (BOOL)prefersEmojiImageTextAttachment;
+ (BOOL)prefersTextAttachment;
+ (BOOL)supportsSecureCoding;
+ (UTType)contentType;
+ (void)flushInstanceCache;
+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3;
+ (void)setPrefersTextAttachment:(BOOL)a3;
- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (CGSize)_imageSizeForAttributes:(id)a3;
- (CGSize)_imageSizeForProposedSize:(CGSize)a3 scaleFactor:(double)a4;
- (CTAdaptiveImageGlyph)initWithCoder:(id)a3;
- (CTAdaptiveImageGlyph)initWithFileWrapper:(id)a3;
- (CTAdaptiveImageGlyph)initWithImageContent:(id)a3;
- (NSArray)strikes;
- (NSData)imageContent;
- (NSFileWrapper)_fallbackFileWrapper;
- (NSString)contentDescription;
- (NSString)contentIdentifier;
- (id)_configuredFileWrapperForAttributes:(id)a3;
- (id)_initWithContentIdentifier:(id)a3;
- (id)_nominalTextAttachmentCreatingIfNeededUsingBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTAdaptiveImageGlyph

+ (UTType)contentType
{
  return (UTType *)(id)*MEMORY[0x1E4F443E0];
}

+ (BOOL)prefersTextAttachment
{
  if (qword_1EB2CE8F8 != -1) {
    dispatch_once(&qword_1EB2CE8F8, &__block_literal_global_7);
  }
  return _MergedGlobals_35;
}

void __45__CTAdaptiveImageGlyph_prefersTextAttachment__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [v0 objectForKey:@"_NSAdaptiveImageGlyphPrefersTextAttachment"];

  if (v2) {
    char v1 = [v2 BOOLValue];
  }
  else {
    char v1 = dyld_program_sdk_at_least() ^ 1;
  }
  _MergedGlobals_35 = v1;
}

+ (void)setPrefersTextAttachment:(BOOL)a3
{
  if (_MergedGlobals_35 != a3)
  {
    _MergedGlobals_35 = a3;
    +[__CTAdaptiveImageGlyphStorage flushInstanceCache];
  }
}

+ (BOOL)prefersEmojiImageTextAttachment
{
  if (qword_1EB2CE900 != -1) {
    dispatch_once(&qword_1EB2CE900, &__block_literal_global_58);
  }
  return byte_1EB2CE8F1;
}

void __55__CTAdaptiveImageGlyph_prefersEmojiImageTextAttachment__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  byte_1EB2CE8F1 = [v0 BOOLForKey:@"_NSAdaptiveImageGlyphPrefersEmojiImageTextAttachment"];
}

+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3
{
  if (byte_1EB2CE8F1 != a3)
  {
    byte_1EB2CE8F1 = a3;
    +[__CTAdaptiveImageGlyphStorage flushInstanceCache];
  }
}

+ (void)flushInstanceCache
{
}

- (CTAdaptiveImageGlyph)initWithImageContent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTAdaptiveImageGlyph;
  v5 = [(CTAdaptiveImageGlyph *)&v10 init];
  if (v5
    && (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:0 imageContent:v4], uint64_t v6 = objc_claimAutoreleasedReturnValue(), storage = v5->_storage, v5->_storage = (__CTAdaptiveImageGlyphStorage *)v6, storage, v5->_storage))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_initWithContentIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTAdaptiveImageGlyph;
  v5 = [(CTAdaptiveImageGlyph *)&v10 init];
  if (v5
    && (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:v4 imageContent:0], uint64_t v6 = objc_claimAutoreleasedReturnValue(), storage = v5->_storage, v5->_storage = (__CTAdaptiveImageGlyphStorage *)v6, storage, v5->_storage))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CTAdaptiveImageGlyph)initWithFileWrapper:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredFilename];
  uint64_t v6 = [v5 pathExtension];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    v8 = +[CTAdaptiveImageGlyph contentType];
    int v9 = [v7 isEqual:v8];

    if (!v9)
    {
      v12 = 0;
LABEL_11:

      goto LABEL_12;
    }
    objc_super v10 = [v4 regularFileContents];
    if (v10)
    {
      v11 = [(CTAdaptiveImageGlyph *)self initWithImageContent:v10];
      if (v11)
      {
        self = v11;
        v12 = self;
LABEL_10:

        goto LABEL_11;
      }
      self = 0;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (NSData)imageContent
{
  return [(__CTAdaptiveImageGlyphStorage *)self->_storage imageContent];
}

- (NSString)contentIdentifier
{
  return [(__CTAdaptiveImageGlyphStorage *)self->_storage contentIdentifier];
}

- (NSString)contentDescription
{
  return [(__CTAdaptiveImageGlyphStorage *)self->_storage imageDescription];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CTAdaptiveImageGlyph alloc];
  v5 = [(__CTAdaptiveImageGlyphStorage *)self->_storage contentIdentifier];
  uint64_t v6 = [(CTAdaptiveImageGlyph *)v4 initWithContentIdentifier:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([v6 allowsKeyedCoding])
  {
    id v4 = [(__CTAdaptiveImageGlyphStorage *)self->_storage contentIdentifier];
    [v6 encodeObject:v4 forKey:@"NS.contentIdentifier"];

    v5 = [(__CTAdaptiveImageGlyphStorage *)self->_storage imageContent];
    [v6 encodeObject:v5 forKey:@"NS.imageContent"];
  }
}

- (CTAdaptiveImageGlyph)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NS.contentIdentifier"];
    if (!v5
      || (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:v5 imageContent:0], (id v6 = (__CTAdaptiveImageGlyphStorage *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NS.imageContent"];
      id v6 = +[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:0 imageContent:v7];

      if (!v6) {
        goto LABEL_8;
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)CTAdaptiveImageGlyph;
    v8 = [(CTAdaptiveImageGlyph *)&v12 init];
    self = v8;
    if (v8)
    {
      storage = v8->_storage;
      v8->_storage = v6;

      self = self;
      objc_super v10 = self;
    }
    else
    {
LABEL_8:

      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (NSArray)strikes
{
  id v2 = __CTEmojiImageSourceCopyImageStrikes([(__CTAdaptiveImageGlyphStorage *)self->_storage imageSourceRef]);

  return (NSArray *)v2;
}

- (CGSize)_imageSizeForProposedSize:(CGSize)a3 scaleFactor:(double)a4
{
  long long v6 = *MEMORY[0x1E4F1DB30];
  __CTEmojiImageSourceGetImageIndex([(__CTAdaptiveImageGlyphStorage *)self->_storage imageSourceRef], (uint64_t)&v6, 0, a3.width, a3.height, 1.0);
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_nominalTextAttachmentCreatingIfNeededUsingBlock:(id)a3
{
  double v4 = (void (**)(void))a3;
  double v5 = self->_storage;
  objc_sync_enter(v5);
  long long v6 = [(__CTAdaptiveImageGlyphStorage *)self->_storage _nominalTextAttachment];
  if (!v6)
  {
    long long v6 = v4[2](v4);
    [(__CTAdaptiveImageGlyphStorage *)self->_storage _setNominalTextAttachment:v6];
  }
  objc_sync_exit(v5);

  return v6;
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  double height = a3.height;
  double width = a3.width;
  objc_super v12 = [(__CTAdaptiveImageGlyphStorage *)self->_storage imageSourceRef];
  id v26 = 0;
  size_t ImageIndex = __CTEmojiImageSourceGetImageIndex(v12, (uint64_t)a6, (uint64_t)&v26, width, height, a4);
  id v14 = v26;
  v15 = 0;
  if (ImageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex([(__CTAdaptiveImageGlyphStorage *)self->_storage imageSourceRef], ImageIndex, 0);
    if (ImageAtIndex)
    {
      CGImageRef v17 = ImageAtIndex;
      if (!a5)
      {
LABEL_14:
        v15 = (CGImage *)CFAutorelease(v17);
        goto LABEL_15;
      }
      v18 = [v14 objectForKeyedSubscript:@"__NSEmojiImagePropertyKeyOrigin"];
      v19 = v18;
      if (v18)
      {
        [v18 pointValue];
      }
      else
      {
        double v20 = *MEMORY[0x1E4F1DAD8];
        double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      a5->x = v20;
      a5->y = v21;
      double v22 = a6->width;
      double v23 = a6->height;
      if (a6->width >= v23)
      {
        if (v23 >= v22)
        {
LABEL_13:

          goto LABEL_14;
        }
        double v24 = v22 - v23 - v21;
        double v20 = v21;
        a5 = (CGPoint *)((char *)a5 + 8);
      }
      else
      {
        double v24 = v23 - v22 - v20;
      }
      a5->x = v20 + v24 * 0.5;
      goto LABEL_13;
    }
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[CTAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats
{
  if (+[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::onceToken != -1) {
    dispatch_once(&+[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::onceToken, &__block_literal_global_74);
  }
  return +[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::_readsAdaptiveImageGlyphFromDocumentFormats;
}

void __67__CTAdaptiveImageGlyph__readsAdaptiveImageGlyphFromDocumentFormats__block_invoke()
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v0 = [v3 valueForKey:@"_NSReadsEmojiImageTextAttachmentFromDocumentFormats"];
  char v1 = v0;
  if (v0)
  {
    if ([v0 BOOLValue]) {
      char v2 = [v3 BOOLForKey:@"_NSAdaptiveImageGlyphDisableUnarchivingFromDocumentFormats"] ^ 1;
    }
    else {
      char v2 = 0;
    }
    +[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::_readsAdaptiveImageGlyphFromDocumentFormats = v2;
  }
}

- (id)_configuredFileWrapperForAttributes:(id)a3
{
  double v5 = [(id)objc_opt_class() contentType];
  long long v6 = [v5 preferredFilenameExtension];

  v7 = [(CTAdaptiveImageGlyph *)self contentIdentifier];
  v8 = [@"AdaptiveImageGlyph-" stringByAppendingString:v7];

  if (v6)
  {
    uint64_t v9 = [v8 stringByAppendingPathExtension:v6];

    v8 = (void *)v9;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F28CF0]);
  storage = self->_storage;
  if (a3) {
    [(__CTAdaptiveImageGlyphStorage *)storage _RTFDImageData];
  }
  else {
  objc_super v12 = [(__CTAdaptiveImageGlyphStorage *)storage imageContent];
  }
  v13 = (void *)[v10 initRegularFileWithContents:v12];

  [v13 setPreferredFilename:v8];

  return v13;
}

- (CGSize)_imageSizeForAttributes:(id)a3
{
  double v4 = [a3 objectForKeyedSubscript:@"NSFont"];
  if (!v4)
  {
    double v5 = _CTGetEmojiFontName(0);
    double v4 = CTFontCreateWithName(v5, 12.0, 0);
  }
  v11.origin.x = CTFontGetTypographicBoundsForAdaptiveImageProvider(v4);
  double Height = CGRectGetHeight(v11);
  CFRelease(v4);

  -[CTAdaptiveImageGlyph _imageSizeForProposedSize:scaleFactor:](self, "_imageSizeForProposedSize:scaleFactor:", Height, Height, 1.0);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (NSFileWrapper)_fallbackFileWrapper
{
  char v2 = [(__CTAdaptiveImageGlyphStorage *)self->_storage _fallbackImageData];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v2];
    [v3 setPreferredFilename:@"Attachment.png"];
  }
  else
  {
    id v3 = 0;
  }

  return (NSFileWrapper *)v3;
}

- (void).cxx_destruct
{
}

@end