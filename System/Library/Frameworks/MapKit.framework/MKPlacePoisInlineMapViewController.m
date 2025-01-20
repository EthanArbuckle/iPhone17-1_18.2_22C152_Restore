@interface MKPlacePoisInlineMapViewController
+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)resizableViewsDisabled;
- (CLLocation)location;
- (id)geoCamera;
- (id)visibleMapItems;
- (int64_t)preferredUserInterfaceStyle;
- (void)_handleTapOnMap;
- (void)_updateMap;
- (void)fetchPoisForBrand;
- (void)loadView;
- (void)setLocation:(id)a3;
- (void)setResizableViewsDisabled:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MKPlacePoisInlineMapViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 _isMapItemTypeBrand] && (objc_msgSend(v5, "_isStandAloneBrand") & 1) == 0) {
    v7 = [(MKPlaceInlineMapViewController *)[MKPlacePoisInlineMapViewController alloc] initWithMKMapItem:v5 configuration:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (void)loadView
{
  v3 = [_MKPlacePoisInlineMapContentView alloc];
  v4 = -[_MKPlacePoisInlineMapContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlacePoisInlineMapViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlacePoisInlineMapViewController;
  [(MKPlaceInlineMapViewController *)&v5 viewDidLoad];
  v3 = [(MKPlacePoisInlineMapViewController *)self view];
  mapContentView = self->_mapContentView;
  self->_mapContentView = v3;
}

- (id)visibleMapItems
{
  fetchedMapItems = self->_fetchedMapItems;
  if (fetchedMapItems) {
    v3 = fetchedMapItems;
  }
  else {
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)_updateMap
{
  v3 = [(MKPlaceInlineMapViewController *)self mapItem];
  int v4 = [v3 _isMapItemTypeBrand];

  if (v4)
  {
    [(MKPlacePoisInlineMapViewController *)self fetchPoisForBrand];
  }
}

- (void)setLocation:(id)a3
{
  id v5 = a3;
  if (v5 && !self->_location)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_location, a3);
    [(MKPlacePoisInlineMapViewController *)self fetchPoisForBrand];
    id v5 = v6;
  }
}

- (void)fetchPoisForBrand
{
  v3 = +[MKMapService sharedService];
  int v4 = [v3 defaultTraits];

  if ([v4 hasDeviceLocation]) {
    goto LABEL_4;
  }
  if (self->_location)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:self->_location];
    [v4 setDeviceLocation:v5];

LABEL_4:
    id v6 = [(MKPlaceInlineMapViewController *)self mapItem];
    uint64_t v7 = [v6 _muid];

    v8 = +[MKMapService sharedService];
    v9 = [v8 ticketForSearchPoisForBrandMUID:v7 traits:v4];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__MKPlacePoisInlineMapViewController_fetchPoisForBrand__block_invoke;
    v10[3] = &unk_1E54B8FA8;
    v10[4] = self;
    [v9 submitWithHandler:v10 networkActivity:&__block_literal_global_180];
  }
}

void __55__MKPlacePoisInlineMapViewController_fetchPoisForBrand__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v13 = v6;
    uint64_t v8 = [v6 count];
    uint64_t v7 = v13;
    if (v8)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MKPlaceActionManagerBrandStoresEnableNotification" object:0];

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), a2);
      [*(id *)(a1 + 32) updateInlineMapWithRefinedMapItems];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "setLocationsNumber:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1056), "count"));
      [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
      if (([*(id *)(*(void *)(a1 + 32) + 1064) visible] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 1064) setVisible:1];
        v10 = [*(id *)(a1 + 32) view];
        [v10 invalidateIntrinsicContentSize];

        v11 = [*(id *)(a1 + 32) view];
        objc_msgSend(v11, "_mapkit_setNeedsLayout");

        v12 = [*(id *)(a1 + 32) view];
        objc_msgSend(v12, "_mapkit_layoutIfNeeded");
      }
      [MEMORY[0x1E4F42FF0] setAnimationsEnabled:1];
      uint64_t v7 = v13;
    }
  }
}

- (id)geoCamera
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F64B40]);
  int v4 = [(MKPlaceInlineMapViewController *)self mapCamera];
  [v4 centerCoordinate];
  objc_msgSend(v3, "setLatitude:");

  id v5 = [(MKPlaceInlineMapViewController *)self mapCamera];
  [v5 centerCoordinate];
  [v3 setLongitude:v6];

  uint64_t v7 = [(MKPlaceInlineMapViewController *)self mapCamera];
  [v7 heading];
  objc_msgSend(v3, "setHeading:");

  uint64_t v8 = [(MKPlaceInlineMapViewController *)self mapCamera];
  [v8 pitch];
  objc_msgSend(v3, "setPitch:");

  v9 = [(MKPlaceInlineMapViewController *)self mapCamera];
  [v9 altitude];
  objc_msgSend(v3, "setAltitude:");

  [v3 latitude];
  [v3 longitude];
  [v3 heading];
  [v3 pitch];
  [v3 altitude];

  return v3;
}

- (void)_handleTapOnMap
{
  if ([(_MKPlacePoisInlineMapContentView *)self->_mapContentView visible])
  {
    id v3 = [(MKPlaceInlineMapViewController *)self mapItem];
    [v3 _launchActivityForBrandItem];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  return 0;
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapContentView, 0);

  objc_storeStrong((id *)&self->_fetchedMapItems, 0);
}

@end