@interface HKDataMetadataWorkoutRouteSection
- (CGSize)tableViewSize;
- (HKDataMetadataWorkoutRouteCell)cell;
- (HKDataMetadataWorkoutRouteSection)initWithLocationReadings:(id)a3 tableViewSize:(CGSize)a4;
- (HKLocationFetcher)locationFetcher;
- (HKLocationReadings)locationReadings;
- (HKRouteMapGenerator)generator;
- (NSCache)routeImageCache;
- (id)_cachedRouteImageForUserInterfaceStyle:(int64_t)a3 snapshotSize:(CGSize)a4;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)_generateRouteImageForTraitCollection:(id)a3;
- (void)generateRouteImage;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setCell:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setLocationFetcher:(id)a3;
- (void)setRouteImageCache:(id)a3;
- (void)setTableViewSize:(CGSize)a3;
- (void)workoutRouteCell:(id)a3 didUpdateTraitCollection:(id)a4;
@end

@implementation HKDataMetadataWorkoutRouteSection

- (HKDataMetadataWorkoutRouteSection)initWithLocationReadings:(id)a3 tableViewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKDataMetadataWorkoutRouteSection;
  v9 = [(HKDataMetadataWorkoutRouteSection *)&v16 init];
  if (v9)
  {
    if (!v8 || ![v8 count])
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_locationReadings, a3);
    v9->_tableViewSize.CGFloat width = width;
    v9->_tableViewSize.CGFloat height = height;
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    routeImageCache = v9->_routeImageCache;
    v9->_routeImageCache = v10;

    [(NSCache *)v9->_routeImageCache setCountLimit:2];
    v12 = objc_alloc_init(HKDataMetadataWorkoutRouteCell);
    cell = v9->_cell;
    v9->_cell = v12;

    [(HKDataMetadataWorkoutRouteCell *)v9->_cell setDelegate:v9];
    [(HKDataMetadataWorkoutRouteSection *)v9 generateRouteImage];
  }
  v14 = v9;
LABEL_7:

  return v14;
}

- (void)setTableViewSize:(CGSize)a3
{
  double width = self->_tableViewSize.width;
  double height = self->_tableViewSize.height;
  self->_tableViewSize = a3;
  if (a3.width != width || a3.height != height) {
    [(HKDataMetadataWorkoutRouteSection *)self generateRouteImage];
  }
}

- (void)generateRouteImage
{
  id v3 = [(HKDataMetadataWorkoutRouteCell *)self->_cell traitCollection];
  [(HKDataMetadataWorkoutRouteSection *)self _generateRouteImageForTraitCollection:v3];
}

- (void)_generateRouteImageForTraitCollection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double width = self->_tableViewSize.width;
  if (width == 0.0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_DEFAULT, "[route] skipping route image snapshot with zero width", buf, 2u);
    }
  }
  else
  {
    double v7 = HKUIRoundToScreenScale(width * 0.66);
    id v8 = (void *)[v4 userInterfaceStyle];
    v9 = -[HKDataMetadataWorkoutRouteSection _cachedRouteImageForUserInterfaceStyle:snapshotSize:](self, "_cachedRouteImageForUserInterfaceStyle:snapshotSize:", v8, width, v7);
    if (v9)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_DEFAULT, "[route] using cached workout route image for interface style: %ld", buf, 0xCu);
      }
      [(HKDataMetadataWorkoutRouteCell *)self->_cell setRouteImage:v9];
    }
    else
    {
      v11 = objc_alloc_init(HKRouteMapGenerator);
      generator = self->_generator;
      self->_generator = v11;

      [(HKRouteMapGenerator *)self->_generator setLocationReadings:self->_locationReadings];
      objc_initWeak((id *)buf, self);
      v13 = self->_generator;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __75__HKDataMetadataWorkoutRouteSection__generateRouteImageForTraitCollection___block_invoke;
      v14[3] = &unk_1E6D523E0;
      v15[1] = v8;
      objc_copyWeak(v15, (id *)buf);
      -[HKRouteMapGenerator snapshotWithSize:lineWidth:traitCollection:offsets:completion:](v13, "snapshotWithSize:lineWidth:traitCollection:offsets:completion:", v4, v14, width, v7, 5.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __75__HKDataMetadataWorkoutRouteSection__generateRouteImageForTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = [WeakRetained cell];
    double v7 = [v6 traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];

    if (v4 == v8)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      v10 = [v9 cell];
      [v10 setRouteImage:v3];
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = [v11 routeImageCache];
    v13 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v12 setObject:v3 forKey:v13];
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1E0B26000, v14, OS_LOG_TYPE_DEFAULT, "[route] map generator returned nil route image. snapshot may have been canceled or encountered an error.", v15, 2u);
    }
  }
}

- (id)_cachedRouteImageForUserInterfaceStyle:(int64_t)a3 snapshotSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  routeImageCache = self->_routeImageCache;
  double v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [(NSCache *)routeImageCache objectForKey:v7];

  if (!v8) {
    goto LABEL_6;
  }
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = CGRectIntegral(v18);
  double v9 = v19.size.width;
  double v10 = v19.size.height;
  objc_msgSend(v8, "size", v19.origin.x, v19.origin.y);
  CGFloat v12 = v11;
  [v8 size];
  v20.size.CGFloat height = v13;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.CGFloat width = v12;
  CGRect v21 = CGRectIntegral(v20);
  if (v9 == v21.size.width && v10 == v21.size.height) {
    id v15 = v8;
  }
  else {
LABEL_6:
  }
    id v15 = 0;

  return v15;
}

- (void)workoutRouteCell:(id)a3 didUpdateTraitCollection:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(HKDataMetadataWorkoutRouteSection *)self cell];

  if (v7 == v6) {
    [(HKDataMetadataWorkoutRouteSection *)self _generateRouteImageForTraitCollection:v8];
  }
}

- (id)sectionTitle
{
  v2 = HKHealthKitFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"WORKOUT_ROUTE_TITLE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  return self->_cell;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [HKWorkoutRouteViewController alloc];
  locationReadings = self->_locationReadings;
  double v10 = [(HKDataMetadataWorkoutRouteSection *)self sectionTitle];
  double v11 = [(HKWorkoutRouteViewController *)v8 initWithLocationReadings:locationReadings title:v10 sharingEnabled:0 shareText:0 excludedActivityTypes:0];

  [v7 pushViewController:v11 animated:v5];
}

- (CGSize)tableViewSize
{
  double width = self->_tableViewSize.width;
  double height = self->_tableViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (HKDataMetadataWorkoutRouteCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
}

- (HKRouteMapGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (NSCache)routeImageCache
{
  return self->_routeImageCache;
}

- (void)setRouteImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeImageCache, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end