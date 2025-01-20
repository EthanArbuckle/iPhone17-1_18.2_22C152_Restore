@interface CARWallpaperPanel
- (CARWallpaperPanel)initWithPanelController:(id)a3;
- (CGSize)cachedEffectiveSectionInsetLayoutSize;
- (CRSUIWallpaperPreferences)wallpaperPreferences;
- (NSArray)sections;
- (UIEdgeInsets)cachedEffectiveSectionInset;
- (UIEdgeInsets)effectiveSectionHeaderInset;
- (UIEdgeInsets)effectiveSectionInset;
- (UIEdgeInsets)sectionInset;
- (id)_newPreviewPanelForWallpaper:(id)a3;
- (id)cellSpecifier;
- (id)specifierSections;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_vehicleDidChange:(id)a3;
- (void)invalidate;
- (void)setCachedEffectiveSectionInset:(UIEdgeInsets)a3;
- (void)setCachedEffectiveSectionInsetLayoutSize:(CGSize)a3;
- (void)setSections:(id)a3;
- (void)setWallpaperPreferences:(id)a3;
@end

@implementation CARWallpaperPanel

- (CARWallpaperPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CARWallpaperPanel;
  v5 = [(CARSettingsPanel *)&v10 initWithPanelController:v4];
  if (v5)
  {
    uint64_t v6 = [v4 loadWallpaperPreferences];
    wallpaperPreferences = v5->_wallpaperPreferences;
    v5->_wallpaperPreferences = (CRSUIWallpaperPreferences *)v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"_vehicleDidChange:" name:@"CARSettingsPanelControllerVehicleDidChangeNotification" object:0];
  }
  return v5;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"WALLPAPER_TITLE");
    uint64_t v6 = +[CARSettingsImageCache wallpaperImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AB64;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = [(CARWallpaperPanel *)self sections];

  if (!v3)
  {
    id v4 = objc_opt_new();
    v5 = [(CARWallpaperPanel *)self wallpaperPreferences];
    uint64_t v6 = [v5 dataProvider];
    v7 = [v6 wallpapers];

    objc_initWeak(&location, self);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10000ADA8;
    v17 = &unk_100092080;
    v18 = self;
    objc_copyWeak(&v20, &location);
    id v8 = v4;
    id v19 = v8;
    [v7 enumerateObjectsUsingBlock:&v14];
    v9 = [CARSettingsCellSpecifierSection alloc];
    objc_super v10 = -[CARSettingsCellSpecifierSection initWithTitle:specifiers:](v9, "initWithTitle:specifiers:", 0, v8, v14, v15, v16, v17, v18);
    v22 = v10;
    id v11 = +[NSArray arrayWithObjects:&v22 count:1];
    [(CARWallpaperPanel *)self setSections:v11];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  v12 = [(CARWallpaperPanel *)self sections];

  return v12;
}

- (unint64_t)numberOfColumns
{
  return 3;
}

- (unint64_t)numberOfRows
{
  return 3;
}

- (UIEdgeInsets)sectionInset
{
  double v2 = 0.0;
  double v3 = 4.0;
  double v4 = 4.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)effectiveSectionInset
{
  double v3 = [(CARWallpaperPanel *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double height = CGSizeZero.height;

  if (CGSizeZero.width == v5 && height == v7)
  {
    [(CARWallpaperPanel *)self sectionInset];
  }
  else
  {
    objc_super v10 = [(CARSettingsPanel *)self panelController];
    id v11 = [v10 carSession];
    v12 = [v11 configuration];
    v13 = [v12 screens];
    v14 = [v13 bs_firstObjectPassingTest:&stru_1000920C0];

    uint64_t v15 = [v14 currentViewArea];
    [v15 safeFrame];
    double v17 = v16;
    double v19 = v18;

    id v20 = [(CARWallpaperPanel *)self view];
    v21 = [v20 safeAreaLayoutGuide];
    [v21 layoutFrame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    double v27 = v26;
    double v29 = v28;

    [(CARWallpaperPanel *)self cachedEffectiveSectionInsetLayoutSize];
    if (v27 != v31
      || v29 != v30
      || ([(CARWallpaperPanel *)self cachedEffectiveSectionInset],
          UIEdgeInsetsZero.left == v35)
      && UIEdgeInsetsZero.top == v32
      && UIEdgeInsetsZero.right == v34
      && UIEdgeInsetsZero.bottom == v33)
    {
      -[CARWallpaperPanel setCachedEffectiveSectionInsetLayoutSize:](self, "setCachedEffectiveSectionInsetLayoutSize:", v17, v19);
      v82.origin.x = v23;
      v82.origin.y = v25;
      v82.size.width = v27;
      v82.size.double height = v29;
      double Width = CGRectGetWidth(v82);
      [(CARWallpaperPanel *)self sectionInset];
      double v38 = Width - v37;
      [(CARWallpaperPanel *)self sectionInset];
      double v40 = v38 - v39 - (double)[(CARWallpaperPanel *)self numberOfColumns] * 8.0;
      double v41 = v19 / v17;
      double v42 = v41 * (v40 / (double)[(CARWallpaperPanel *)self numberOfColumns]);
      double v43 = (double)[(CARWallpaperPanel *)self numberOfRows];
      CGFloat v44 = (double)[(CARWallpaperPanel *)self numberOfRows] * 8.0 + v42 * v43 + 32.0;
      v83.origin.x = v23;
      v83.origin.y = v25;
      v83.size.width = v27;
      v83.size.double height = v29;
      CGFloat v45 = CGRectGetHeight(v83) * 0.98;
      unint64_t v46 = (unint64_t)[v14 availableInteractionModels] & 2;
      if (v44 < v45 || v46 == 0)
      {
        [(CARWallpaperPanel *)self sectionInset];
        double v51 = v50;
        double v53 = v52;
      }
      else
      {
        v84.origin.x = v23;
        v84.origin.y = v25;
        v84.size.width = v27;
        v84.size.double height = v29;
        CGFloat v58 = CGRectGetWidth(v84) + -45.0;
        [(CARWallpaperPanel *)self sectionInset];
        CGFloat v60 = v58 - v59;
        [(CARWallpaperPanel *)self sectionInset];
        CGFloat v62 = v60 - v61 - (double)[(CARWallpaperPanel *)self numberOfColumns] * 8.0;
        double v63 = v41 * (v62 / (double)[(CARWallpaperPanel *)self numberOfColumns]);
        double v64 = (double)[(CARWallpaperPanel *)self numberOfRows];
        double v65 = (double)[(CARWallpaperPanel *)self numberOfRows] * 8.0 + v63 * v64 + 32.0;
        v85.origin.x = v23;
        v85.origin.y = v25;
        v85.size.width = v27;
        v85.size.double height = v29;
        double v66 = CGRectGetHeight(v85) * 0.98;
        [(CARWallpaperPanel *)self sectionInset];
        double v51 = v67;
        double v53 = v68;
        if (v65 >= v66)
        {
          v69 = [(CARSettingsPanel *)self panelController];
          v70 = [v69 carSession];
          v71 = [v70 configuration];
          unsigned int v72 = [v71 rightHandDrive];

          [(CARWallpaperPanel *)self sectionInset];
          if (v72) {
            double v48 = 45.0;
          }
          else {
            double v49 = 45.0;
          }
        }
        else
        {
          double v48 = 22.5;
          double v49 = 22.5;
        }
      }
      -[CARWallpaperPanel setCachedEffectiveSectionInset:](self, "setCachedEffectiveSectionInset:", v51, v48, v53, v49);
    }
    [(CARWallpaperPanel *)self cachedEffectiveSectionInset];
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;

    double v54 = v74;
    double v55 = v76;
    double v56 = v78;
    double v57 = v80;
  }
  result.right = v57;
  result.bottom = v56;
  result.left = v55;
  result.top = v54;
  return result;
}

- (UIEdgeInsets)effectiveSectionHeaderInset
{
  [(CARWallpaperPanel *)self effectiveSectionInset];
  double v5 = v4 + 4.0;
  double v7 = v6 + 4.0;
  result.right = v7;
  result.bottom = v3;
  result.left = v5;
  result.top = v2;
  return result;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CARWallpaperPanel;
  [(CARSettingsPanel *)&v4 invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (id)_newPreviewPanelForWallpaper:(id)a3
{
  id v4 = a3;
  double v5 = [CARWallpaperPreviewPanel alloc];
  double v6 = [(CARWallpaperPanel *)self wallpaperPreferences];
  double v7 = [(CARSettingsPanel *)self panelController];
  id v8 = [(CARWallpaperPreviewPanel *)v5 initWithWallpaper:v4 wallpaperPreferences:v6 panelController:v7 completionHandler:&stru_100092100];

  return v8;
}

- (void)_vehicleDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B5AC;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (UIEdgeInsets)cachedEffectiveSectionInset
{
  double top = self->_cachedEffectiveSectionInset.top;
  double left = self->_cachedEffectiveSectionInset.left;
  double bottom = self->_cachedEffectiveSectionInset.bottom;
  double right = self->_cachedEffectiveSectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCachedEffectiveSectionInset:(UIEdgeInsets)a3
{
  self->_cachedEffectiveSectionInset = a3;
}

- (CGSize)cachedEffectiveSectionInsetLayoutSize
{
  double width = self->_cachedEffectiveSectionInsetLayoutSize.width;
  double height = self->_cachedEffectiveSectionInsetLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedEffectiveSectionInsetLayoutSize:(CGSize)a3
{
  self->_cachedEffectiveSectionInsetLayoutSize = a3;
}

- (CRSUIWallpaperPreferences)wallpaperPreferences
{
  return self->_wallpaperPreferences;
}

- (void)setWallpaperPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperPreferences, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end