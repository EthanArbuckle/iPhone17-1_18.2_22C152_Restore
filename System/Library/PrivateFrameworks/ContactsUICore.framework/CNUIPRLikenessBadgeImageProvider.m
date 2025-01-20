@interface CNUIPRLikenessBadgeImageProvider
- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)badgeCGImage;
- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CNCache)cache;
- (CNUIPRLikenessBadgeImageProvider)initWithBadge:(id)a3;
- (NSData)badgeImageData;
- (UIImage)badgeImage;
- (unint64_t)_cnui_likenessType;
- (unint64_t)badgeType;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeImageData:(id)a3;
- (void)setBadgeType:(unint64_t)a3;
@end

@implementation CNUIPRLikenessBadgeImageProvider

- (CNUIPRLikenessBadgeImageProvider)initWithBadge:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIPRLikenessBadgeImageProvider;
  v5 = [(CNUIPRLikenessBadgeImageProvider *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F33568] atomicCache];
    cache = v5->_cache;
    v5->_cache = (CNCache *)v6;

    uint64_t v8 = [v4 imageData];
    badgeImageData = v5->_badgeImageData;
    v5->_badgeImageData = (NSData *)v8;

    v5->_badgeType = [v4 badgeType];
    uint64_t v10 = [v4 image];
    badgeImage = v5->_badgeImage;
    v5->_badgeImage = (UIImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (CGImage)badgeCGImage
{
  v3 = [(CNUIPRLikenessBadgeImageProvider *)self badgeImage];

  if (v3)
  {
    id v4 = [(CNUIPRLikenessBadgeImageProvider *)self badgeImage];
    v5 = (CGImage *)imageRefFromImage(v4);
  }
  else
  {
    id v4 = [(CNUIPRLikenessBadgeImageProvider *)self badgeImageData];
    v5 = +[CNUIPRLikenessPhotoProvider cgImageFromData:v4];
  }
  uint64_t v6 = v5;

  return v6;
}

- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v8 = NSString;
  v9 = NSStringFromSize(a3);
  uint64_t v10 = [v8 stringWithFormat:@"%@-Thumbnail", v9];

  v11 = [(CNUIPRLikenessBadgeImageProvider *)self cache];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__CNUIPRLikenessBadgeImageProvider__cnui_imageForSize_scale___block_invoke;
  v14[3] = &unk_264017A50;
  v14[4] = self;
  *(CGFloat *)&v14[5] = width;
  *(CGFloat *)&v14[6] = height;
  *(double *)&v14[7] = a4;
  v12 = [v11 objectForKey:v10 onCacheMiss:v14];

  if (v12) {
    v12 = CFAutorelease(v12);
  }

  return (CGImage *)v12;
}

id __61__CNUIPRLikenessBadgeImageProvider__cnui_imageForSize_scale___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) badgeType];
  if (v2 >= 2)
  {
    if (v2 == 2) {
      v3 = objc_msgSend(*(id *)(a1 + 32), "renderRoundedRectImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "renderCircularImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  return v3;
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__CNUIPRLikenessBadgeImageProvider_renderRoundedRectImageForSize_scale___block_invoke;
  v5[3] = &unk_264017A78;
  v5[4] = self;
  result = CNUIRoundedRectImageCreate(v5, a3.width, a3.height, a4);
  if (result) {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __72__CNUIPRLikenessBadgeImageProvider_renderRoundedRectImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v11 = (const void *)[*(id *)(a1 + 32) badgeCGImage];
  if (v11)
  {
    v12 = (CGImage *)CFRetain(v11);
    v18.origin.x = a3;
    v18.origin.y = a4;
    v18.size.CGFloat width = a5;
    v18.size.CGFloat height = a6;
    CGContextDrawImage(a2, v18, v12);
    if (v12)
    {
      CFRelease(v12);
    }
  }
  else
  {
    CGFloat v13 = a3;
    CGFloat v14 = a4;
    CGFloat v15 = a5;
    CGFloat v16 = a6;
    CGContextDrawImage(a2, *(CGRect *)&v13, 0);
  }
}

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__CNUIPRLikenessBadgeImageProvider_renderCircularImageForSize_scale___block_invoke;
  v5[3] = &unk_264017AA0;
  v5[4] = self;
  *(double *)&void v5[5] = a4;
  result = CNUICircularImageCreate(v5, a3.width, a3.height, a4);
  if (result) {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __69__CNUIPRLikenessBadgeImageProvider_renderCircularImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGContextSetFillColorWithColor(a2, SRGB);
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.CGFloat width = a5;
  v18.size.CGFloat height = a6;
  CGContextFillRect(a2, v18);
  CGFloat v13 = (const void *)[*(id *)(a1 + 32) badgeCGImage];
  if (v13) {
    CGFloat v14 = (CGImage *)CFRetain(v13);
  }
  else {
    CGFloat v14 = 0;
  }
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.CGFloat width = a5;
  v19.size.CGFloat height = a6;
  CGContextDrawImage(a2, v19, v14);
  CGContextSetLineWidth(a2, ceil(a5 * 0.04 * *(double *)(a1 + 40)));
  CGContextSetStrokeColorWithColor(a2, SRGB);
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.CGFloat width = a5;
  v20.size.CGFloat height = a6;
  CGFloat MidX = CGRectGetMidX(v20);
  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.CGFloat width = a5;
  v21.size.CGFloat height = a6;
  CGFloat MidY = CGRectGetMidY(v21);
  CGContextAddArc(a2, MidX, MidY, a5 * 0.5, 0.0, 6.28318531, 1);
  CGContextStrokePath(a2);
  if (v14) {
    CFRelease(v14);
  }
  if (SRGB)
  {
    CFRelease(SRGB);
  }
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (CNCache)cache
{
  return self->_cache;
}

- (NSData)badgeImageData
{
  return self->_badgeImageData;
}

- (void)setBadgeImageData:(id)a3
{
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setBadgeImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_storeStrong((id *)&self->_badgeImageData, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end