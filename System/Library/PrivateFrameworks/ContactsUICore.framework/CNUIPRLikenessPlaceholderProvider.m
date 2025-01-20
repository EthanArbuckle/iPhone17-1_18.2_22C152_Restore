@interface CNUIPRLikenessPlaceholderProvider
+ (id)companyImageNameForDiameter:(double)a3;
+ (id)imageNameForDiameter:(double)a3;
- (BOOL)isForCompany;
- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)renderCircularImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5;
- (CGImage)renderRoundedRectImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5;
- (CNCache)cache;
- (CNUIPRLikenessPlaceholderProvider)init;
- (CNUIPRLikenessPlaceholderProvider)initWithContact:(id)a3;
- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)_cnui_likenessType;
- (void)setIsForCompany:(BOOL)a3;
@end

@implementation CNUIPRLikenessPlaceholderProvider

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v8 = [(CNUIPRLikenessPlaceholderProvider *)self isForCompany];
  v9 = objc_opt_class();
  if (width >= height) {
    double v10 = height;
  }
  else {
    double v10 = width;
  }
  if (v8) {
    [v9 companyImageNameForDiameter:v10];
  }
  else {
  v11 = [v9 imageNameForDiameter:v10];
  }
  v12 = [NSNumber numberWithDouble:a4];
  v13 = [v11 stringByAppendingFormat:@"_%@-Circular", v12];

  v14 = [(CNUIPRLikenessPlaceholderProvider *)self cache];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__CNUIPRLikenessPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke;
  v18[3] = &unk_264018D78;
  id v15 = v11;
  id v19 = v15;
  v20 = self;
  double v21 = a4;
  double v22 = width;
  double v23 = height;
  v16 = [v14 objectForKey:v13 onCacheMiss:v18];

  if (v16) {
    v16 = CFAutorelease(v16);
  }

  return (CGImage *)v16;
}

- (BOOL)isForCompany
{
  return self->_isForCompany;
}

- (CNCache)cache
{
  return self->_cache;
}

+ (id)imageNameForDiameter:(double)a3
{
  if (a3 <= 32.0) {
    return @"silhouette-S";
  }
  if (a3 <= 45.0) {
    return @"silhouette-M";
  }
  if (a3 <= 96.0) {
    return @"silhouette-L";
  }
  if (a3 <= 120.0) {
    return @"silhouette-ATV-M";
  }
  if (a3 <= 148.0) {
    return @"silhouette-ATV-L";
  }
  if (a3 <= 180.0) {
    return @"silhouette-ATV-XL";
  }
  if (a3 <= 250.0) {
    return @"silhouette-ATV-XXL";
  }
  return @"silhouette-EDU-XL";
}

- (CNUIPRLikenessPlaceholderProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNUIPRLikenessPlaceholderProvider;
  v2 = [(CNUIPRLikenessPlaceholderProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F33568] atomicCache];
    cache = v2->_cache;
    v2->_cache = (CNCache *)v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
}

id __70__CNUIPRLikenessPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  v2 = +[CNUIImageProvider uncachedImageForResource:*(void *)(a1 + 32) template:0];
  uint64_t v3 = [v2 CGImage];
  double v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    [v2 scale];
    double v4 = v5;
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "renderCircularImageForSilhouetteImage:size:scale:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

  return v6;
}

- (CGImage)renderCircularImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__CNUIPRLikenessPlaceholderProvider_renderCircularImageForSilhouetteImage_size_scale___block_invoke;
  v6[3] = &unk_264017AA0;
  v6[4] = self;
  v6[5] = a3;
  result = CNUICircularImageCreate(v6, a4.width, a4.height, a5);
  if (result) {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __86__CNUIPRLikenessPlaceholderProvider_renderCircularImageForSilhouetteImage_size_scale___block_invoke(uint64_t a1, CGContext *a2, CGColorSpace *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CNUIDrawLikenessPlatterInContext(a2, a3, a4, a5, a6, a7);
  if ([*(id *)(a1 + 32) isForCompany])
  {
    double v13 = ceil(a7 * 0.06);
    CGFloat v14 = a4;
    CGFloat v15 = a5;
    CGFloat v16 = a6;
    CGFloat v17 = a7;
    CGFloat v18 = v13;
  }
  else
  {
    double v13 = 0.0;
    CGFloat v18 = 0.0;
    CGFloat v14 = a4;
    CGFloat v15 = a5;
    CGFloat v16 = a6;
    CGFloat v17 = a7;
  }
  CGRect v21 = CGRectInset(*(CGRect *)&v14, v13, v18);
  id v19 = *(CGImage **)(a1 + 40);
  DrawSilhouetteInContext(a2, v19, 1, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
}

+ (id)companyImageNameForDiameter:(double)a3
{
  if (a3 <= 14.0 || a3 <= 20.0 || a3 <= 32.0) {
    return @"company-silhouette-S";
  }
  if (a3 > 45.0) {
    return @"company-silhouette-L";
  }
  return @"company-silhouette-M";
}

- (CNUIPRLikenessPlaceholderProvider)initWithContact:(id)a3
{
  id v4 = a3;
  double v5 = [(CNUIPRLikenessPlaceholderProvider *)self init];
  if (v5)
  {
    if ([v4 isKeyAvailable:*MEMORY[0x263EFE148]]) {
      BOOL v6 = [v4 contactType] == 1;
    }
    else {
      BOOL v6 = 0;
    }
    v5->_isForCompany = v6;
    objc_super v7 = v5;
  }

  return v5;
}

- (CGImage)renderRoundedRectImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__CNUIPRLikenessPlaceholderProvider_renderRoundedRectImageForSilhouetteImage_size_scale___block_invoke;
  v6[3] = &__block_descriptor_40_e72_v56__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16__CGColorSpace__48l;
  v6[4] = a3;
  result = CNUIRoundedRectImageCreate(v6, a4.width, a4.height, a5);
  if (result) {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __89__CNUIPRLikenessPlaceholderProvider_renderRoundedRectImageForSilhouetteImage_size_scale___block_invoke(uint64_t a1, CGContext *a2, CGColorSpace *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CNUIDrawLikenessPlatterInContext(a2, a3, a4, a5, a6, a7);
  v16.origin.x = a4;
  v16.origin.y = a5;
  v16.size.double width = a6;
  v16.size.double height = a7;
  CGFloat v13 = ceil(a7 * 0.04);
  CGRect v17 = CGRectInset(v16, v13, v13);
  CGFloat v14 = *(CGImage **)(a1 + 32);
  DrawSilhouetteInContext(a2, v14, 0, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v8 = objc_opt_class();
  if (width >= height) {
    double v9 = height;
  }
  else {
    double v9 = width;
  }
  double v10 = [v8 companyImageNameForDiameter:v9];
  v11 = [NSNumber numberWithDouble:a4];
  v12 = [v10 stringByAppendingFormat:@"_%@-RoundedRect", v11];

  CGFloat v13 = [(CNUIPRLikenessPlaceholderProvider *)self cache];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__CNUIPRLikenessPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v17[3] = &unk_264018D78;
  id v14 = v10;
  id v18 = v14;
  id v19 = self;
  double v20 = a4;
  double v21 = width;
  double v22 = height;
  CGFloat v15 = [v13 objectForKey:v12 onCacheMiss:v17];

  if (v15) {
    CGFloat v15 = CFAutorelease(v15);
  }

  return (CGImage *)v15;
}

id __73__CNUIPRLikenessPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  v2 = +[CNUIImageProvider uncachedImageForResource:*(void *)(a1 + 32) template:0];
  uint64_t v3 = [v2 CGImage];
  double v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    [v2 scale];
    double v4 = v5;
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "renderRoundedRectImageForSilhouetteImage:size:scale:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

  return v6;
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  double v4 = -[CNUIPRLikenessPlaceholderProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  double v5 = (void *)MEMORY[0x263F5D440];
  return (id)[v5 photoWithScope:2 image:v4];
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (void)setIsForCompany:(BOOL)a3
{
  self->_isForCompany = a3;
}

@end