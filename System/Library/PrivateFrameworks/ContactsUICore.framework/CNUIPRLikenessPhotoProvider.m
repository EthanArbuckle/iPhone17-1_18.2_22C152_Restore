@interface CNUIPRLikenessPhotoProvider
+ (CGImage)cgImageFromData:(id)a3;
+ (CGImage)cgThumbnailFromData:(id)a3 maxSize:(CGSize)a4;
- (CFTypeRef)renderCircularImageForSize:(double)a3 scale:(double)a4;
- (CFTypeRef)renderRoundedRectImageForSize:(double)a3 scale:(double)a4;
- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_cnui_image;
- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CNUIPRLikenessPhotoProvider)initWithPhotoData:(id)a3 fingerprint:(id)a4;
- (NSData)originalPhotoData;
- (NSString)likenessFingerprint;
- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)_cnui_likenessType;
@end

@implementation CNUIPRLikenessPhotoProvider

- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4
{
  double v5 = a3.width * a4;
  double v6 = a3.height * a4;
  v7 = NSString;
  v8 = NSStringFromSize(a3);
  v9 = [v7 stringWithFormat:@"%@-Thumbnail", v8];

  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__CNUIPRLikenessPhotoProvider__cnui_imageForSize_scale___block_invoke;
  v14[3] = &unk_264019518;
  v14[4] = self;
  *(double *)&v14[5] = v5;
  *(double *)&v14[6] = v6;
  v11 = [(CNCache *)cache objectForKey:v9 onCacheMiss:v14];
  if (v11) {
    v12 = (CGImage *)CFAutorelease(v11);
  }
  else {
    v12 = 0;
  }

  return v12;
}

- (CNUIPRLikenessPhotoProvider)initWithPhotoData:(id)a3 fingerprint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIPRLikenessPhotoProvider;
  v8 = [(CNUIPRLikenessPhotoProvider *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F33568] atomicCache];
    cache = v8->_cache;
    v8->_cache = (CNCache *)v9;

    v11 = _safeImageDataType(v6);
    if (v11) {
      v12 = v6;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&v8->_originalPhotoData, v12);

    objc_storeStrong((id *)&v8->_likenessFingerprint, a4);
    v13 = v8;
  }

  return v8;
}

id __56__CNUIPRLikenessPhotoProvider__cnui_imageForSize_scale___block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  v3 = [*(id *)(a1 + 32) originalPhotoData];
  v4 = objc_msgSend(v2, "cgThumbnailFromData:maxSize:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

- (NSData)originalPhotoData
{
  return self->_originalPhotoData;
}

+ (CGImage)cgThumbnailFromData:(id)a3 maxSize:(CGSize)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__CNUIPRLikenessPhotoProvider_cgThumbnailFromData_maxSize___block_invoke;
  v5[3] = &__block_descriptor_48_e34___CGImage__16__0__CGImageSource__8l;
  CGSize v6 = a4;
  return (CGImage *)_cgProcessSafeImageSourceFromData(a3, v5);
}

CGImageRef __59__CNUIPRLikenessPhotoProvider_cgThumbnailFromData_maxSize___block_invoke(uint64_t a1, CGImageSource *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F0F5A8];
  v11[0] = MEMORY[0x263EFFA88];
  uint64_t v4 = *MEMORY[0x263F0F638];
  v10[0] = v3;
  v10[1] = v4;
  double v5 = *(double *)(a1 + 32);
  if (v5 < *(double *)(a1 + 40)) {
    double v5 = *(double *)(a1 + 40);
  }
  CGSize v6 = [NSNumber numberWithDouble:v5];
  v11[1] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a2, 0, v7);
  return ThumbnailAtIndex;
}

+ (CGImage)cgImageFromData:(id)a3
{
  return (CGImage *)_cgProcessSafeImageSourceFromData(a3, &__block_literal_global_74);
}

CGImageRef __47__CNUIPRLikenessPhotoProvider_cgImageFromData___block_invoke(int a1, CGImageSourceRef isrc)
{
  return CGImageSourceCreateImageAtIndex(isrc, 0, 0);
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  uint64_t v4 = -[CNUIPRLikenessPhotoProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  double v5 = (void *)MEMORY[0x263F5D440];
  return (id)[v5 photoWithImage:v4];
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (CGImage)_cnui_image
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CNUIPRLikenessPhotoProvider *)self originalPhotoData];
  double v5 = (CGImage *)[v3 cgImageFromData:v4];

  return v5;
}

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = NSString;
  uint64_t v9 = NSStringFromSize(a3);
  v10 = [v8 stringWithFormat:@"%@-Circular", v9];

  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__CNUIPRLikenessPhotoProvider__cnui_circularImageForSize_scale___block_invoke;
  v15[3] = &unk_264017A50;
  v15[4] = self;
  *(CGFloat *)&v15[5] = width;
  *(CGFloat *)&v15[6] = height;
  *(double *)&v15[7] = a4;
  v12 = [(CNCache *)cache objectForKey:v10 onCacheMiss:v15];
  if (v12) {
    v13 = (CGImage *)CFAutorelease(v12);
  }
  else {
    v13 = 0;
  }

  return v13;
}

CFTypeRef __64__CNUIPRLikenessPhotoProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  return [(CNUIPRLikenessPhotoProvider *)*(void **)(a1 + 32) renderCircularImageForSize:*(double *)(a1 + 48) scale:*(double *)(a1 + 56)];
}

- (CFTypeRef)renderCircularImageForSize:(double)a3 scale:(double)a4
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v7 = [a1 originalPhotoData];
  uint64_t v8 = objc_opt_class();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__CNUIPRLikenessPhotoProvider_renderCircularImageForSize_scale___block_invoke;
  v13[3] = &unk_264019540;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = v8;
  CGImageRef v10 = CNUICircularImageCreate(v13, a2, a3, a4);
  if (v10) {
    CFTypeRef v11 = CFAutorelease(v10);
  }
  else {
    CFTypeRef v11 = 0;
  }

  return v11;
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v8 = NSString;
  id v9 = NSStringFromSize(a3);
  CGImageRef v10 = [v8 stringWithFormat:@"%@-RoundedRect", v9];

  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__CNUIPRLikenessPhotoProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v15[3] = &unk_264017A50;
  v15[4] = self;
  *(CGFloat *)&v15[5] = width;
  *(CGFloat *)&v15[6] = height;
  *(double *)&v15[7] = a4;
  v12 = [(CNCache *)cache objectForKey:v10 onCacheMiss:v15];
  if (v12) {
    v13 = (CGImage *)CFAutorelease(v12);
  }
  else {
    v13 = 0;
  }

  return v13;
}

CFTypeRef __67__CNUIPRLikenessPhotoProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  return [(CNUIPRLikenessPhotoProvider *)*(void **)(a1 + 32) renderRoundedRectImageForSize:*(double *)(a1 + 48) scale:*(double *)(a1 + 56)];
}

- (CFTypeRef)renderRoundedRectImageForSize:(double)a3 scale:(double)a4
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v7 = [a1 originalPhotoData];
  uint64_t v8 = objc_opt_class();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CNUIPRLikenessPhotoProvider_renderRoundedRectImageForSize_scale___block_invoke;
  v13[3] = &unk_264019540;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = v8;
  CGImageRef v10 = CNUIRoundedRectImageCreate(v13, a2, a3, a4);
  if (v10) {
    CFTypeRef v11 = CFAutorelease(v10);
  }
  else {
    CFTypeRef v11 = 0;
  }

  return v11;
}

void __64__CNUIPRLikenessPhotoProvider_renderCircularImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (*(void *)(a1 + 32))
  {
    CFTypeRef v11 = (const void *)objc_msgSend(*(id *)(a1 + 40), "cgImageFromData:");
    if (v11)
    {
      v12 = (CGImage *)CFRetain(v11);
      if (v12)
      {
        v13 = v12;
        v15.origin.x = a3;
        v15.origin.y = a4;
        v15.size.CGFloat width = a5;
        v15.size.CGFloat height = a6;
        CGContextDrawImage(a2, v15, v12);
        CFRelease(v13);
      }
    }
  }
}

void __67__CNUIPRLikenessPhotoProvider_renderRoundedRectImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (*(void *)(a1 + 32))
  {
    CFTypeRef v11 = (const void *)objc_msgSend(*(id *)(a1 + 40), "cgImageFromData:");
    if (v11)
    {
      v12 = (CGImage *)CFRetain(v11);
      if (v12)
      {
        v13 = v12;
        v15.origin.x = a3;
        v15.origin.y = a4;
        v15.size.CGFloat width = a5;
        v15.size.CGFloat height = a6;
        CGContextDrawImage(a2, v15, v12);
        CFRelease(v13);
      }
    }
  }
}

- (NSString)likenessFingerprint
{
  return self->_likenessFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likenessFingerprint, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_originalPhotoData, 0);
}

@end