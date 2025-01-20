@interface DOCThumbnailFolderIcon
+ (id)_folderIconForSize:(CGSize)a3 scale:(double)a4;
+ (id)_folderIconsForImageNamePattern:(id)a3 documentsBadgeNamePattern:(id)a4 desktopBadgeNamePattern:(id)a5 sharedBadgeNamePattern:(id)a6 downloadsBadgeNamePattern:(id)a7 genericSharepointBadgeNamePattern:(id)a8;
+ (id)folderIconForDescriptor:(id)a3;
+ (id)folderIcons;
+ (id)imageWithStyle:(unint64_t)a3 assetImage:(id)a4;
- (CGSize)badgeSize;
- (CGSize)badgeSizeForFolderType:(unint64_t)a3;
- (DOCThumbnailFolderIcon)initWithImageName:(id)a3 documentsBadgeName:(id)a4 dekstopBadgeName:(id)a5 sharedBadgeName:(id)a6 downloadsBadgeName:(id)a7 genericSharepointBadgeName:(id)a8 imageDimension:(double)a9 badgeDimension:(double)a10 badgeBottomInset:(double)a11 sharedBadgeDimension:(double)a12 sharedBadgeBottomInset:(double)a13;
- (NSString)imageName;
- (UIImage)desktopBadge;
- (UIImage)documentsBadge;
- (UIImage)downloadsBadge;
- (UIImage)genericSharepointBadge;
- (UIImage)plainFolderImage;
- (UIImage)sharedBadge;
- (double)bottomInset;
- (double)bottomInsetForFolderType:(unint64_t)a3;
- (double)imageDimension;
- (id)_badgedFolderIconForBadge:(id)a3 badgeSize:(CGSize)a4 bottomInset:(double)a5 style:(unint64_t)a6;
- (id)badgeForFolderType:(unint64_t)a3;
- (id)badgedFolderIconForBadge:(id)a3 style:(unint64_t)a4;
- (id)badgedFolderIconForFolderType:(unint64_t)a3 style:(unint64_t)a4;
- (id)image;
- (id)plainFolderImageWithStyle:(unint64_t)a3;
- (void)resolveImage;
@end

@implementation DOCThumbnailFolderIcon

+ (id)_folderIconsForImageNamePattern:(id)a3 documentsBadgeNamePattern:(id)a4 desktopBadgeNamePattern:(id)a5 sharedBadgeNamePattern:(id)a6 downloadsBadgeNamePattern:(id)a7 genericSharepointBadgeNamePattern:(id)a8
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v24 = a7;
  id v23 = a8;
  id v25 = [MEMORY[0x263EFF980] arrayWithCapacity:14];
  for (uint64_t i = 0; i != 14; ++i)
  {
    double v14 = *(double *)&qword_222E3BD50[i];
    v15 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, @"%u", 0, v14);
    v16 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, @"%u", 0, v14);
    v17 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, @"%u", 0, v14);
    v18 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, @"%u", 0, v14);
    v19 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%u", 0, v14);
    v20 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, @"%u", 0, v14);
    v21 = [[DOCThumbnailFolderIcon alloc] initWithImageName:v15 documentsBadgeName:v16 dekstopBadgeName:v17 sharedBadgeName:v18 downloadsBadgeName:v19 genericSharepointBadgeName:v20 imageDimension:v14 badgeDimension:*(double *)&qword_222E3BDC0[i] badgeBottomInset:*(double *)&qword_222E3BEA0[i] sharedBadgeDimension:*(double *)&qword_222E3BE30[i] sharedBadgeBottomInset:*(double *)&qword_222E3BF10[i]];
    [v25 addObject:v21];
  }
  return v25;
}

+ (id)folderIcons
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DOCThumbnailFolderIcon_folderIcons__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (folderIcons_onceToken != -1) {
    dispatch_once(&folderIcons_onceToken, block);
  }
  v2 = (void *)folderIcons_folderIcons;
  return v2;
}

uint64_t __37__DOCThumbnailFolderIcon_folderIcons__block_invoke(uint64_t a1)
{
  folderIcons_folderIcons = [*(id *)(a1 + 32) _folderIconsForImageNamePattern:@"Folder%upt" documentsBadgeNamePattern:@"DocumentsFolder%upt" desktopBadgeNamePattern:@"DesktopFolder%upt" sharedBadgeNamePattern:@"SharedFolder%upt" downloadsBadgeNamePattern:@"DownloadsFolder%upt" genericSharepointBadgeNamePattern:@"GenericSharepointFolder%upt"];
  return MEMORY[0x270F9A758]();
}

+ (id)folderIconForDescriptor:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [v4 scale];
  double v10 = v9;

  return (id)objc_msgSend(a1, "_folderIconForSize:scale:", v6, v8, v10);
}

+ (id)_folderIconForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (_folderIconForSize_scale__onceToken != -1) {
    dispatch_once(&_folderIconForSize_scale__onceToken, &__block_literal_global_1);
  }
  double v7 = [NSNumber numberWithDouble:height + width * 100000.0];
  double v8 = [(id)_folderIconForSize_scale__folderIconCache objectForKey:v7];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    [a1 folderIcons];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
        [v15 imageDimension];
        if (vabdd_f64(width, v16) < 1.0) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v17 = v15;

      if (v17) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_13:
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke_2;
    v20[3] = &__block_descriptor_48_e39_B32__0__DOCThumbnailFolderIcon_8Q16_B24l;
    *(double *)&v20[4] = width;
    *(double *)&v20[5] = height;
    uint64_t v18 = [v10 indexOfObjectPassingTest:v20];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      [v10 lastObject];
    }
    else {
    id v17 = [v10 objectAtIndexedSubscript:v18];
    }
LABEL_19:
    [v17 resolveImage];
    [(id)_folderIconForSize_scale__folderIconCache setObject:v17 forKey:v7];
    id v9 = v17;
  }
  return v9;
}

uint64_t __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_folderIconForSize_scale__folderIconCache;
  _folderIconForSize_scale__folderIconCache = (uint64_t)v0;

  v2 = (void *)_folderIconForSize_scale__folderIconCache;
  return [v2 setCountLimit:10];
}

BOOL __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 imageDimension];
  BOOL result = v6 >= *(double *)(a1 + 32);
  *a4 = result;
  return result;
}

- (DOCThumbnailFolderIcon)initWithImageName:(id)a3 documentsBadgeName:(id)a4 dekstopBadgeName:(id)a5 sharedBadgeName:(id)a6 downloadsBadgeName:(id)a7 genericSharepointBadgeName:(id)a8 imageDimension:(double)a9 badgeDimension:(double)a10 badgeBottomInset:(double)a11 sharedBadgeDimension:(double)a12 sharedBadgeBottomInset:(double)a13
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  v34.receiver = self;
  v34.super_class = (Class)DOCThumbnailFolderIcon;
  id v28 = [(DOCThumbnailFolderIcon *)&v34 init];
  id v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_imageName, a3);
    v29->_imageDimension = a9;
    objc_storeStrong((id *)&v29->_documentsBadgeName, a4);
    objc_storeStrong((id *)&v29->_desktopBadgeName, a5);
    objc_storeStrong((id *)&v29->_sharedBadgeName, a6);
    objc_storeStrong((id *)&v29->_downloadsBadgeName, a7);
    objc_storeStrong((id *)&v29->_genericSharepointBadgeName, a8);
    v29->_bottomInset = a11;
    v29->_sharedBadgeBottomInset = a13;
    v29->_badgeSize.double width = a10;
    v29->_badgeSize.double height = a10;
    v29->_sharedBadgeSize.double width = a12;
    v29->_sharedBadgeSize.double height = a12;
  }

  return v29;
}

- (UIImage)documentsBadge
{
  documentsBadge = self->_documentsBadge;
  if (!documentsBadge)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    documentsBadgeName = self->_documentsBadgeName;
    double v6 = DOCFrameworkBundle();
    double v7 = [v4 imageNamed:documentsBadgeName inBundle:v6];
    double v8 = self->_documentsBadge;
    self->_documentsBadge = v7;

    documentsBadge = self->_documentsBadge;
  }
  return documentsBadge;
}

- (UIImage)desktopBadge
{
  desktopBadge = self->_desktopBadge;
  if (!desktopBadge)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    desktopBadgeName = self->_desktopBadgeName;
    double v6 = DOCFrameworkBundle();
    double v7 = [v4 imageNamed:desktopBadgeName inBundle:v6];
    double v8 = self->_desktopBadge;
    self->_desktopBadge = v7;

    desktopBadge = self->_desktopBadge;
  }
  return desktopBadge;
}

- (UIImage)sharedBadge
{
  sharedBadge = self->_sharedBadge;
  if (!sharedBadge)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    sharedBadgeName = self->_sharedBadgeName;
    double v6 = DOCFrameworkBundle();
    double v7 = [v4 imageNamed:sharedBadgeName inBundle:v6];
    double v8 = self->_sharedBadge;
    self->_sharedBadge = v7;

    sharedBadge = self->_sharedBadge;
  }
  return sharedBadge;
}

- (UIImage)downloadsBadge
{
  downloadsBadge = self->_downloadsBadge;
  if (!downloadsBadge)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    downloadsBadgeName = self->_downloadsBadgeName;
    double v6 = DOCFrameworkBundle();
    double v7 = [v4 imageNamed:downloadsBadgeName inBundle:v6];
    double v8 = self->_downloadsBadge;
    self->_downloadsBadge = v7;

    downloadsBadge = self->_downloadsBadge;
  }
  return downloadsBadge;
}

- (UIImage)genericSharepointBadge
{
  genericSharepointBadge = self->_genericSharepointBadge;
  if (!genericSharepointBadge)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    genericSharepointBadgeName = self->_genericSharepointBadgeName;
    double v6 = DOCFrameworkBundle();
    double v7 = [v4 imageNamed:genericSharepointBadgeName inBundle:v6];
    double v8 = self->_genericSharepointBadge;
    self->_genericSharepointBadge = v7;

    genericSharepointBadge = self->_genericSharepointBadge;
  }
  return genericSharepointBadge;
}

- (id)image
{
  [(DOCThumbnailFolderIcon *)self resolveImage];
  plainFolderImage = self->_plainFolderImage;
  return plainFolderImage;
}

- (void)resolveImage
{
  __assert_rtn("-[DOCThumbnailFolderIcon resolveImage]", "DOCThumbnailFolderIcon.m", 252, "_imageName != NULL");
}

+ (id)imageWithStyle:(unint64_t)a3 assetImage:(id)a4
{
  id v7 = a4;
  double v8 = [v7 imageAsset];

  if (!v8)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"DOCThumbnailFolderIcon.m" lineNumber:264 description:@"Image has to load from xcasset."];
  }
  if (a3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = [v7 traitCollection];
  if ([v10 userInterfaceStyle] == v9)
  {
    id v11 = v7;
  }
  else
  {
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    uint64_t v13 = v12;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __52__DOCThumbnailFolderIcon_imageWithStyle_assetImage___block_invoke;
    v18[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v18[4] = v9;
    uint64_t v14 = [v12 traitCollectionByModifyingTraits:v18];

    v15 = [v7 imageAsset];
    id v11 = [v15 imageWithTraitCollection:v14];
  }
  return v11;
}

uint64_t __52__DOCThumbnailFolderIcon_imageWithStyle_assetImage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (id)plainFolderImageWithStyle:(unint64_t)a3
{
  double v5 = objc_opt_class();
  double v6 = [(DOCThumbnailFolderIcon *)self plainFolderImage];
  id v7 = [v5 imageWithStyle:a3 assetImage:v6];

  return v7;
}

- (id)badgedFolderIconForFolderType:(unint64_t)a3 style:(unint64_t)a4
{
  id v7 = -[DOCThumbnailFolderIcon badgeForFolderType:](self, "badgeForFolderType:");
  [(DOCThumbnailFolderIcon *)self badgeSizeForFolderType:a3];
  double v9 = v8;
  double v11 = v10;
  [(DOCThumbnailFolderIcon *)self bottomInsetForFolderType:a3];
  uint64_t v13 = -[DOCThumbnailFolderIcon _badgedFolderIconForBadge:badgeSize:bottomInset:style:](self, "_badgedFolderIconForBadge:badgeSize:bottomInset:style:", v7, a4, v9, v11, v12);

  return v13;
}

- (id)badgedFolderIconForBadge:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  [(DOCThumbnailFolderIcon *)self badgeSize];
  double v8 = v7;
  double v10 = v9;
  [(DOCThumbnailFolderIcon *)self bottomInset];
  double v12 = -[DOCThumbnailFolderIcon _badgedFolderIconForBadge:badgeSize:bottomInset:style:](self, "_badgedFolderIconForBadge:badgeSize:bottomInset:style:", v6, a4, v8, v10, v11);

  return v12;
}

- (id)_badgedFolderIconForBadge:(id)a3 badgeSize:(CGSize)a4 bottomInset:(double)a5 style:(unint64_t)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  double v12 = objc_opt_class();
  uint64_t v13 = [(DOCThumbnailFolderIcon *)self plainFolderImage];
  uint64_t v14 = [v12 imageWithStyle:a6 assetImage:v13];

  v15 = [(id)objc_opt_class() imageWithStyle:a6 assetImage:v11];

  id v16 = objc_alloc_init(MEMORY[0x263F1C688]);
  [v14 scale];
  objc_msgSend(v16, "setScale:");
  id v17 = objc_alloc(MEMORY[0x263F1C680]);
  [v14 size];
  uint64_t v18 = objc_msgSend(v17, "initWithSize:format:", v16);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __80__DOCThumbnailFolderIcon__badgedFolderIconForBadge_badgeSize_bottomInset_style___block_invoke;
  v23[3] = &unk_2646749D8;
  CGFloat v26 = width;
  CGFloat v27 = height;
  double v28 = a5;
  id v24 = v14;
  id v25 = v15;
  id v19 = v15;
  id v20 = v14;
  long long v21 = [v18 imageWithActions:v23];

  return v21;
}

void __80__DOCThumbnailFolderIcon__badgedFolderIconForBadge_badgeSize_bottomInset_style___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 size];
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v3, v4, v7, v8);
  double v9 = (CGContext *)[v6 CGContext];

  CGContextSaveGState(v9);
  [*(id *)(a1 + 32) size];
  UIRectCenteredXInRect();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [*(id *)(a1 + 32) size];
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v11, v16 - *(double *)(a1 + 64) - *(double *)(a1 + 56), v13, v15);
  CGContextRestoreGState(v9);
}

- (id)badgeForFolderType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      double v5 = [(DOCThumbnailFolderIcon *)self desktopBadge];
      goto LABEL_10;
    case 3uLL:
      double v5 = [(DOCThumbnailFolderIcon *)self documentsBadge];
      goto LABEL_10;
    case 4uLL:
      double v5 = [(DOCThumbnailFolderIcon *)self downloadsBadge];
      goto LABEL_10;
    case 5uLL:
      double v5 = [(DOCThumbnailFolderIcon *)self sharedBadge];
      goto LABEL_10;
    case 6uLL:
      double v5 = [(DOCThumbnailFolderIcon *)self genericSharepointBadge];
LABEL_10:
      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (CGSize)badgeSize
{
  [(DOCThumbnailFolderIcon *)self badgeSizeForFolderType:1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)badgeSizeForFolderType:(unint64_t)a3
{
  p_CGFloat width = (double *)MEMORY[0x263F001B0];
  uint64_t v4 = (double *)(MEMORY[0x263F001B0] + 8);
  p_badgeSize = &self->_badgeSize;
  p_CGFloat height = &self->_badgeSize.height;
  if (a3 == 5)
  {
    p_badgeSize = &self->_sharedBadgeSize;
    p_CGFloat height = &self->_sharedBadgeSize.height;
  }
  if (a3)
  {
    p_CGFloat width = &p_badgeSize->width;
    uint64_t v4 = p_height;
  }
  double v7 = *v4;
  double v8 = *p_width;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (double)bottomInset
{
  [(DOCThumbnailFolderIcon *)self bottomInsetForFolderType:1];
  return result;
}

- (double)bottomInsetForFolderType:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  uint64_t v3 = 16;
  if (a3 != 5) {
    uint64_t v3 = 8;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIImage)plainFolderImage
{
  return self->_plainFolderImage;
}

- (double)imageDimension
{
  return self->_imageDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainFolderImage, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_genericSharepointBadge, 0);
  objc_storeStrong((id *)&self->_downloadsBadge, 0);
  objc_storeStrong((id *)&self->_sharedBadge, 0);
  objc_storeStrong((id *)&self->_desktopBadge, 0);
  objc_storeStrong((id *)&self->_documentsBadge, 0);
  objc_storeStrong((id *)&self->_genericSharepointBadgeName, 0);
  objc_storeStrong((id *)&self->_downloadsBadgeName, 0);
  objc_storeStrong((id *)&self->_sharedBadgeName, 0);
  objc_storeStrong((id *)&self->_desktopBadgeName, 0);
  objc_storeStrong((id *)&self->_documentsBadgeName, 0);
}

@end