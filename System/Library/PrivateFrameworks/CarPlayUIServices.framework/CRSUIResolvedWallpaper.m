@interface CRSUIResolvedWallpaper
- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 color:(id)a4;
- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4;
- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5;
- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5 statefulPackage:(id)a6 color:(id)a7;
- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 statefulPackage:(id)a4;
- (CRSUIWallpaper)wallpaper;
- (id)thumbnailWithCompatibleTraitCollection:(id)a3;
- (id)view;
- (void)view;
@end

@implementation CRSUIResolvedWallpaper

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 color:(id)a4
{
  return [(CRSUIResolvedWallpaper *)self initWithWallpaperInformation:a3 imageResolver:0 thumbnailResolver:0 statefulPackage:0 color:a4];
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 statefulPackage:(id)a4
{
  return [(CRSUIResolvedWallpaper *)self initWithWallpaperInformation:a3 imageResolver:0 thumbnailResolver:0 statefulPackage:a4 color:0];
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4
{
  return [(CRSUIResolvedWallpaper *)self initWithWallpaperInformation:a3 imageResolver:a4 thumbnailResolver:0 statefulPackage:0 color:0];
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5
{
  return [(CRSUIResolvedWallpaper *)self initWithWallpaperInformation:a3 imageResolver:a4 thumbnailResolver:a5 statefulPackage:0 color:0];
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5 statefulPackage:(id)a6 color:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRSUIResolvedWallpaper;
  v18 = [(CRSUIResolvedWallpaper *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_wallpaper, a3);
    uint64_t v20 = MEMORY[0x21D464300](v14);
    id imageResolver = v19->_imageResolver;
    v19->_id imageResolver = (id)v20;

    uint64_t v22 = MEMORY[0x21D464300](v15);
    id thumbnailResolver = v19->_thumbnailResolver;
    v19->_id thumbnailResolver = (id)v22;

    objc_storeStrong((id *)&v19->_statefulPackage, a6);
    objc_storeStrong((id *)&v19->_color, a7);
  }

  return v19;
}

- (id)view
{
  if (self->_color)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v3 setBackgroundColor:self->_color];
    goto LABEL_8;
  }
  id imageResolver = self->_imageResolver;
  if (imageResolver)
  {
    uint64_t v5 = CRSUIImageViewWithResolver(imageResolver);
LABEL_7:
    id v3 = (id)v5;
    goto LABEL_8;
  }
  statefulPackage = self->_statefulPackage;
  if (statefulPackage)
  {
    uint64_t v5 = CRSUICAPackageViewWithStatefulPackage(statefulPackage);
    goto LABEL_7;
  }
  v8 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[CRSUIResolvedWallpaper view](v8);
  }

  id v3 = 0;
LABEL_8:
  return v3;
}

- (id)thumbnailWithCompatibleTraitCollection:(id)a3
{
  id thumbnailResolver = (void (**)(void, void))self->_thumbnailResolver;
  if (thumbnailResolver)
  {
    ((void (**)(void, id))thumbnailResolver)[2](thumbnailResolver, a3);
    id thumbnailResolver = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return thumbnailResolver;
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_statefulPackage, 0);
  objc_storeStrong(&self->_thumbnailResolver, 0);
  objc_storeStrong(&self->_imageResolver, 0);
}

- (void)view
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21817A000, log, OS_LOG_TYPE_FAULT, "Invalid wallpaper information", v1, 2u);
}

@end