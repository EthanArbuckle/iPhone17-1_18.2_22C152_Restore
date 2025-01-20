@interface PHMediaFormatConversionPlaceholderSource
+ (id)imageSourceForFileType:(id)a3;
+ (id)videoSourceForFileType:(id)a3;
- (CGSize)imageDimensions;
- (NSString)fileType;
- (PHMediaFormatConversionPlaceholderSource)initWithFileType:(id)a3 mediaType:(int64_t)a4;
- (id)fileURL;
- (unint64_t)length;
- (void)setFileType:(id)a3;
@end

@implementation PHMediaFormatConversionPlaceholderSource

- (void).cxx_destruct
{
}

- (void)setFileType:(id)a3
{
}

- (NSString)fileType
{
  return self->_fileType;
}

- (CGSize)imageDimensions
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ does not support %@", v6, v7 format];

  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v9;
  result.width = v8;
  return result;
}

- (unint64_t)length
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ does not support %@", v6, v7 format];

  return 0;
}

- (id)fileURL
{
  v2 = (void *)MEMORY[0x1E4F442D8];
  v3 = [(PHMediaFormatConversionPlaceholderSource *)self fileType];
  uint64_t v4 = [v2 typeWithIdentifier:v3];
  v5 = [v4 preferredFilenameExtension];

  if (v5)
  {
    v6 = [@"IMG_0001" stringByAppendingPathExtension:v5];
    v7 = (void *)MEMORY[0x1E4F1CB10];
    double v8 = NSTemporaryDirectory();
    double v9 = [v8 stringByAppendingPathComponent:v6];
    v10 = [v7 fileURLWithPath:v9 isDirectory:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PHMediaFormatConversionPlaceholderSource)initWithFileType:(id)a3 mediaType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHMediaFormatConversionPlaceholderSource;
  double v8 = [(PHMediaFormatConversionPlaceholderSource *)&v11 init];
  if (v8)
  {
    if (!v7)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v8, @"PHMediaFormatConversion.m", 470, @"Invalid parameter not satisfying: %@", @"fileType" object file lineNumber description];
    }
    [(PHMediaFormatConversionPlaceholderSource *)v8 setFileType:v7];
    [(PHMediaFormatConversionContent *)v8 setMediaType:a4];
  }

  return v8;
}

+ (id)videoSourceForFileType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFileType:v4 mediaType:1];

  return v5;
}

+ (id)imageSourceForFileType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFileType:v4 mediaType:2];

  return v5;
}

@end