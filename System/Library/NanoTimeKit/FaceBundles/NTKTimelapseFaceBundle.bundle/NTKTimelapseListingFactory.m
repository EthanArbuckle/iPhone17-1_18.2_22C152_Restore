@interface NTKTimelapseListingFactory
+ (id)sharedInstanceForDevice:(id)a3;
- (id)_initLibraryForDevice:(id)a3;
- (id)heroImageWithTheme:(unint64_t)a3 date:(id)a4 location:(CLLocationCoordinate2D)a5;
- (id)listingWithTheme:(unint64_t)a3 date:(id)a4 location:(CLLocationCoordinate2D)a5;
- (id)posterImageWithTheme:(unint64_t)a3;
- (void)discardAssets;
- (void)setTimelapseListingHasAssets:(id)a3;
@end

@implementation NTKTimelapseListingFactory

+ (id)sharedInstanceForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_154D0);
  id WeakRetained = objc_loadWeakRetained(&qword_154D8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_154D8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_154D8, v3);
    qword_154E0 = (uint64_t)[v3 version];

    sub_3C7C(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_154E0;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_154D0);
  id v11 = (id)qword_154C8;

  return v11;
}

- (id)_initLibraryForDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKTimelapseListingFactory;
  id v6 = [(NTKTimelapseListingFactory *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_opt_new();
    assetListings = v7->_assetListings;
    v7->_assetListings = (NSMutableSet *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

- (id)listingWithTheme:(unint64_t)a3 date:(id)a4 location:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v9 = a4;
  uint64_t v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316163;
    v16 = "-[NTKTimelapseListingFactory listingWithTheme:date:location:]";
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2049;
    double v22 = latitude;
    __int16 v23 = 2049;
    double v24 = longitude;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s theme:%lu date:%@ latitude:%{private}f longitude:%{private}f", (uint8_t *)&v15, 0x34u);
  }

  uint64_t v11 = NTKVideoIndexForTimelapseTheme(a3, v9, latitude, longitude);
  objc_super v12 = NTKPhotoAnalysisForTimelapseVideo(a3, v11, (uint64_t)[(CLKDevice *)self->_device sizeClass]);
  id v13 = [[NTKTimelapseListing alloc] initForDevice:self->_device withTheme:a3 videoIndex:v11 photoAnalysis:v12];

  return v13;
}

- (id)heroImageWithTheme:(unint64_t)a3 date:(id)a4 location:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v9 = a4;
  uint64_t v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    unint64_t v18 = "-[NTKTimelapseListingFactory heroImageWithTheme:date:location:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2049;
    double v24 = latitude;
    __int16 v25 = 2049;
    double v26 = longitude;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s theme:%lu date:%@ latitude:%{private}f longitude:%{private}f", buf, 0x34u);
  }

  uint64_t v11 = NTKVideoIndexForTimelapseTheme(a3, v9, latitude, longitude);
  objc_super v12 = +[NTKTimelapseThemeEditOption optionWithTimelapseTheme:a3 forDevice:self->_device];
  id v13 = [v12 resourceBaseName];
  v14 = +[NSString stringWithFormat:@"%@-%03d-hero", v13, v11];

  int v15 = NTKImageNamedFromAssetsBundle();

  return v15;
}

- (id)posterImageWithTheme:(unint64_t)a3
{
  id v3 = +[NTKTimelapseThemeEditOption optionWithTimelapseTheme:a3 forDevice:self->_device];
  v4 = [v3 resourceBaseName];
  id v5 = NTKImageNamedFromAssetsBundle();

  return v5;
}

- (void)setTimelapseListingHasAssets:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_assetListings, "containsObject:") & 1) == 0)
  {
    [(NTKTimelapseListingFactory *)self discardAssets];
    [(NSMutableSet *)self->_assetListings addObject:v4];
  }
}

- (void)discardAssets
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_assetListings;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "discardAssets", (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_assetListings removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetListings, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end