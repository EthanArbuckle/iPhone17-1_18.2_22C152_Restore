@interface QLThumbnailReply
+ (BOOL)supportsSecureCoding;
+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceAsyncBlock:(id)a4;
+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceBlock:(id)a4;
+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize currentContextDrawingBlock:(void *)drawingBlock;
+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize drawingBlock:(void *)drawingBlock;
+ (QLThumbnailReply)replyWithData:(id)a3 contentType:(id)a4;
+ (QLThumbnailReply)replyWithFileURL:(id)a3 contentType:(id)a4;
+ (QLThumbnailReply)replyWithImageFileURL:(NSURL *)fileURL;
+ (QLThumbnailReply)replyWithImageRenderer:(id)a3;
+ (QLThumbnailReply)replyWithImages:(id)a3;
- (BOOL)isLowQuality;
- (CGColorSpace)colorSpace;
- (CGSize)contextSize;
- (IOSurface)ioSurface;
- (NSArray)bitmapImages;
- (NSArray)images;
- (NSString)extensionBadge;
- (QLThumbnailItem)item;
- (QLThumbnailMetadata)metadata;
- (QLThumbnailReply)init;
- (QLThumbnailReply)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)drawInContextBlock;
- (id)drawingBlock;
- (id)ioSurfaceAsyncBlock;
- (id)ioSurfaceBlock;
- (id)rendererBlock;
- (int)iconFlavor;
- (int)inlinePreviewMode;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBitmapImages:(id)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setContextSize:(CGSize)a3;
- (void)setDrawInContextBlock:(id)a3;
- (void)setDrawingBlock:(id)a3;
- (void)setExtensionBadge:(NSString *)extensionBadge;
- (void)setIconFlavor:(int)a3;
- (void)setImages:(id)a3;
- (void)setInlinePreviewMode:(int)a3;
- (void)setIoSurface:(id)a3;
- (void)setIoSurfaceAsyncBlock:(id)a3;
- (void)setIoSurfaceBlock:(id)a3;
- (void)setIsLowQuality:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRendererBlock:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation QLThumbnailReply

- (QLThumbnailReply)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailReply;
  v2 = [(QLThumbnailReply *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    metadata = v2->_metadata;
    v2->_metadata = (QLThumbnailMetadata *)v3;

    [(QLThumbnailMetadata *)v2->_metadata setIconFlavor:0x7FFFFFFFLL];
    [(QLThumbnailMetadata *)v2->_metadata setInlinePreviewMode:1];
  }
  return v2;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize drawingBlock:(void *)drawingBlock
{
  double height = contextSize.height;
  double width = contextSize.width;
  objc_super v6 = drawingBlock;
  v7 = objc_opt_new();
  [v7 setDrawInContextBlock:v6];

  objc_msgSend(v7, "setContextSize:", width, height);
  [v7 setType:0];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize currentContextDrawingBlock:(void *)drawingBlock
{
  double height = contextSize.height;
  double width = contextSize.width;
  objc_super v6 = drawingBlock;
  v7 = objc_opt_new();
  [v7 setDrawingBlock:v6];

  objc_msgSend(v7, "setContextSize:", width, height);
  [v7 setType:1];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithImageFileURL:(NSURL *)fileURL
{
  uint64_t v3 = fileURL;
  v4 = objc_opt_new();
  v5 = [[QLThumbnailItem alloc] initWithURL:v3];

  [v4 setItem:v5];
  [v4 setType:3];

  return (QLThumbnailReply *)v4;
}

+ (QLThumbnailReply)replyWithFileURL:(id)a3 contentType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  int v8 = [v5 startAccessingSecurityScopedResource];
  v9 = [QLThumbnailItem alloc];
  v10 = v9;
  if (v8)
  {
    v11 = [MEMORY[0x1E4F25D78] wrapperWithSecurityScopedURL:v5];
    v12 = [(QLThumbnailItem *)v10 initWithURLWrapper:v11 parentDirectoryWrapper:0 contentType:v6];

    [v7 setItem:v12];
    [v5 stopAccessingSecurityScopedResource];
  }
  else
  {
    v13 = [(QLThumbnailItem *)v9 initWithURL:v5 contentType:v6];

    [v7 setItem:v13];
  }
  [v7 setType:3];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithData:(id)a3 contentType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  int v8 = [[QLThumbnailItem alloc] initWithData:v6 contentType:v5];

  [v7 setItem:v8];
  [v7 setType:3];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceBlock:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setIoSurfaceBlock:v6];

  objc_msgSend(v7, "setContextSize:", width, height);
  [v7 setType:4];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceAsyncBlock:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setIoSurfaceAsyncBlock:v6];

  objc_msgSend(v7, "setContextSize:", width, height);
  [v7 setType:4];

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithImages:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setImages:v3];

  [v4 setType:5];

  return (QLThumbnailReply *)v4;
}

+ (QLThumbnailReply)replyWithImageRenderer:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setRendererBlock:v3];

  [v4 setType:6];

  return (QLThumbnailReply *)v4;
}

- (NSString)extensionBadge
{
  return [(QLThumbnailMetadata *)self->_metadata extensionBadge];
}

- (int)iconFlavor
{
  return [(QLThumbnailMetadata *)self->_metadata iconFlavor];
}

- (BOOL)isLowQuality
{
  return [(QLThumbnailMetadata *)self->_metadata isLowQuality];
}

- (int)inlinePreviewMode
{
  return [(QLThumbnailMetadata *)self->_metadata inlinePreviewMode];
}

- (void)setExtensionBadge:(NSString *)extensionBadge
{
}

- (void)setInlinePreviewMode:(int)a3
{
}

- (void)setIconFlavor:(int)a3
{
}

- (void)setIsLowQuality:(BOOL)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"t"];
  [v5 encodeObject:self->_bitmapImages forKey:@"b"];
  [v5 encodeObject:self->_ioSurface forKey:@"sf"];
  [v5 encodeObject:self->_item forKey:@"it"];
  [v5 encodeObject:self->_metadata forKey:@"m"];
}

- (QLThumbnailReply)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)QLThumbnailReply;
  id v3 = a3;
  v4 = [(QLThumbnailReply *)&v14 init];
  v4->_unint64_t type = objc_msgSend(v3, "decodeIntegerForKey:", @"t", v14.receiver, v14.super_class);
  uint64_t v5 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"b"];
  bitmapImages = v4->_bitmapImages;
  v4->_bitmapImages = (NSArray *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sf"];
  ioSurface = v4->_ioSurface;
  v4->_ioSurface = (IOSurface *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"it"];
  item = v4->_item;
  v4->_item = (QLThumbnailItem *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"m"];

  metadata = v4->_metadata;
  v4->_metadata = (QLThumbnailMetadata *)v11;

  return v4;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p> type:%lu", objc_opt_class(), self, self->_type];
}

- (CGSize)contextSize
{
  double width = self->_contextSize.width;
  double height = self->_contextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContextSize:(CGSize)a3
{
  self->_contextSize = a3;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->_colorSpace = a3;
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (id)drawingBlock
{
  return self->_drawingBlock;
}

- (void)setDrawingBlock:(id)a3
{
}

- (id)drawInContextBlock
{
  return self->_drawInContextBlock;
}

- (void)setDrawInContextBlock:(id)a3
{
}

- (id)ioSurfaceBlock
{
  return self->_ioSurfaceBlock;
}

- (void)setIoSurfaceBlock:(id)a3
{
}

- (id)ioSurfaceAsyncBlock
{
  return self->_ioSurfaceAsyncBlock;
}

- (void)setIoSurfaceAsyncBlock:(id)a3
{
}

- (id)rendererBlock
{
  return self->_rendererBlock;
}

- (void)setRendererBlock:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (QLThumbnailItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSArray)bitmapImages
{
  return self->_bitmapImages;
}

- (void)setBitmapImages:(id)a3
{
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(id)a3
{
}

- (QLThumbnailMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
  objc_storeStrong((id *)&self->_bitmapImages, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_rendererBlock, 0);
  objc_storeStrong(&self->_ioSurfaceAsyncBlock, 0);
  objc_storeStrong(&self->_ioSurfaceBlock, 0);
  objc_storeStrong(&self->_drawInContextBlock, 0);
  objc_storeStrong(&self->_drawingBlock, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end