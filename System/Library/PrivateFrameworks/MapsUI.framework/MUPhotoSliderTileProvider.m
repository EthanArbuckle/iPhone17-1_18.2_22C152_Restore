@interface MUPhotoSliderTileProvider
- (BOOL)_canShowARPCallToAction;
- (BOOL)shouldRouteToPhotoThumbnailGallery;
- (BOOL)showFullScreen;
- (BOOL)showMorePhotoPunchoutAtEndOfSlider;
- (BOOL)showPhotoAttributionAtEndOfSlider;
- (MUPhotoSliderTileProvider)initWithMapItem:(id)a3;
- (NSArray)photos;
- (id)_albumOverlayForPhoto:(id)a3;
- (id)_flatListOverlayForPhoto:(id)a3;
- (id)_photoAlbumForPhoto:(id)a3;
- (id)albumIdForPhoto:(id)a3;
- (id)overlayForPhoto:(id)a3;
- (id)photoItemAtIndex:(unint64_t)a3;
- (id)yourPhotosTileOverlay;
- (int64_t)displayType;
- (unint64_t)numberOfPhotos;
- (void)_setup;
- (void)_setupForFlatPhotoList;
- (void)_setupForPhotoAlbums;
@end

@implementation MUPhotoSliderTileProvider

- (MUPhotoSliderTileProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPhotoSliderTileProvider;
  v6 = [(MUPhotoSliderTileProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    [(MUPhotoSliderTileProvider *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  int64_t v3 = [(MUPhotoSliderTileProvider *)self displayType];
  if (v3 == 1)
  {
    [(MUPhotoSliderTileProvider *)self _setupForPhotoAlbums];
  }
  else if (!v3)
  {
    [(MUPhotoSliderTileProvider *)self _setupForFlatPhotoList];
  }
}

- (void)_setupForPhotoAlbums
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v5 = [v4 _photos];
  v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v8 = [v7 _captionedPhotoAlbums];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) photoList];
        v14 = [v13 firstObject];

        id v15 = objc_alloc(MEMORY[0x1E4F30F18]);
        v16 = [(MKMapItem *)self->_mapItem name];
        v17 = (void *)[v15 initWithGeoMapItemPhoto:v14 fallbackTitle:v16];

        [v6 addObject:v17];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v18 = (NSArray *)[v6 copy];
  photos = self->_photos;
  self->_photos = v18;

  self->_showFullScreen = 1;
  v20 = MUGetMUPhotoSliderTileProviderLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1931EA000, v20, OS_LOG_TYPE_INFO, "Showing full screen since we have an album layout", v21, 2u);
  }
}

- (void)_setupForFlatPhotoList
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(MKMapItem *)self->_mapItem _mapkit_resolvedFlatPhotoList];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = [(MKMapItem *)self->_mapItem _mapkit_resolvedFlatPhotoList];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4F30F18]);
        v13 = [(MKMapItem *)self->_mapItem name];
        v14 = (void *)[v12 initWithGeoMapItemPhoto:v11 fallbackTitle:v13];
        [v5 addObject:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  id v15 = MUGetMUPhotoSliderTileProviderLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_INFO, "Flat list layout, checking if we should show full screen", v19, 2u);
  }

  uint64_t v16 = [v5 indexOfObjectPassingTest:&__block_literal_global_52];
  v17 = (NSArray *)[v5 copy];
  photos = self->_photos;
  self->_photos = v17;

  self->_showFullScreen = v16 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __51__MUPhotoSliderTileProvider__setupForFlatPhotoList__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 displayFullScreenPhotoGallery])
  {
    BOOL v6 = *a4 != 0;
  }
  else
  {
    uint64_t v7 = MUGetMUPhotoSliderTileProviderLog();
    BOOL v6 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v5 attribution];
      uint64_t v9 = [v8 providerName];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "Vendor %@ does not allow use of gallery", (uint8_t *)&v11, 0xCu);
    }
    *a4 = 1;
  }

  return v6;
}

- (unint64_t)numberOfPhotos
{
  unint64_t result = [(MUPhotoSliderTileProvider *)self displayType];
  if (result == 1)
  {
    id v5 = [(MKMapItem *)self->_mapItem _geoMapItem];
    BOOL v6 = [v5 _captionedPhotoAlbums];
    unint64_t v7 = [v6 count];

    return v7;
  }
  else if (!result)
  {
    photos = self->_photos;
    return [(NSArray *)photos count];
  }
  return result;
}

- (int64_t)displayType
{
  return [(MKMapItem *)self->_mapItem _mapkit_hasFlatListOfPhotos] ^ 1;
}

- (id)photoItemAtIndex:(unint64_t)a3
{
  if ([(MUPhotoSliderTileProvider *)self numberOfPhotos] <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_fault_impl(&dword_1931EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.numberOfPhotos", v7, 2u);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_photos objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (id)albumIdForPhoto:(id)a3
{
  id v4 = a3;
  if ([(MUPhotoSliderTileProvider *)self displayType] == 1)
  {
    id v5 = [(MUPhotoSliderTileProvider *)self _photoAlbumForPhoto:v4];
    BOOL v6 = [v5 categoryId];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)overlayForPhoto:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(MUPhotoSliderTileProvider *)self displayType];
  if (v6 == 1)
  {
    uint64_t v7 = [(MUPhotoSliderTileProvider *)self _albumOverlayForPhoto:v5];
  }
  else
  {
    if (v6) {
      goto LABEL_6;
    }
    uint64_t v7 = [(MUPhotoSliderTileProvider *)self _flatListOverlayForPhoto:v5];
  }
  id v3 = (void *)v7;
LABEL_6:

  return v3;
}

- (id)yourPhotosTileOverlay
{
  v2 = objc_alloc_init(MUPhotoTileOverlay);
  id v3 = _MULocalizedStringFromThisBundle(@"Your Photos [Placecard's Your Photos Album]");
  [(MUPhotoTileOverlay *)v2 setTileTitle:v3];

  return v2;
}

- (id)_flatListOverlayForPhoto:(id)a3
{
  id v3 = a3;
  id v4 = [v3 attribution];
  if ([v4 shouldHandlePhotosLocally])
  {
    id v5 = [v3 geoMapItemPhoto];
    int64_t v6 = [v5 author];

    uint64_t v7 = [v3 attribution];
    int v8 = [v7 isUserSubmitted];

    if (GEOConfigGetBOOL()) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || ![v6 length])
    {
      int v11 = 0;
      goto LABEL_12;
    }
    uint64_t v10 = objc_alloc_init(MUPhotoTileOverlay);
    int v11 = v10;
  }
  else
  {
    id v12 = [v4 captionDisplayName];
    int v11 = (MUPhotoTileOverlay *)[v12 length];

    if (!v11) {
      goto LABEL_13;
    }
    int v11 = objc_alloc_init(MUPhotoTileOverlay);
    int64_t v6 = [v4 captionDisplayName];
    uint64_t v10 = v11;
  }
  [(MUPhotoTileOverlay *)v10 setAttributionTitle:v6];
LABEL_12:

LABEL_13:
  return v11;
}

- (id)_albumOverlayForPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [(MUPhotoSliderTileProvider *)self _photoAlbumForPhoto:v4];
  if (v5)
  {
    int64_t v6 = [(MUPhotoSliderTileProvider *)self _flatListOverlayForPhoto:v4];
    if (!v6) {
      int64_t v6 = objc_alloc_init(MUPhotoTileOverlay);
    }
    uint64_t v7 = [v5 categoryName];
    [(MUPhotoTileOverlay *)v6 setTileTitle:v7];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)_photoAlbumForPhoto:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_photos indexOfObject:a3];
  id v5 = [(MKMapItem *)self->_mapItem _geoMapItem];
  int64_t v6 = [v5 _captionedPhotoAlbums];
  unint64_t v7 = [v6 count];

  if (v4 >= v7)
  {
    uint64_t v10 = 0;
  }
  else
  {
    int v8 = [(MKMapItem *)self->_mapItem _geoMapItem];
    BOOL v9 = [v8 _captionedPhotoAlbums];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v4];
  }
  return v10;
}

- (BOOL)_canShowARPCallToAction
{
  return [MEMORY[0x1E4F30F78] shouldShowAddPhotoButtonOnEndOfPhotoSliderForMapItem:self->_mapItem];
}

- (BOOL)showMorePhotoPunchoutAtEndOfSlider
{
  if ([(MUPhotoSliderTileProvider *)self displayType] == 1)
  {
    unint64_t v3 = [(MUPhotoSliderTileProvider *)self numberOfPhotos];
    return v3 >= GEOConfigGetUInteger();
  }
  else
  {
    unint64_t UInteger = GEOConfigGetUInteger();
    unint64_t v6 = [(MKMapItem *)self->_mapItem _mapkit_numberOfPhotosAvailableForFlatList];
    if ([(MKMapItem *)self->_mapItem _mapkit_hasSinglePhotoVendor])
    {
      BOOL result = [(MKMapItem *)self->_mapItem _mapkit_canAtLeastOneAttributionShowPhotosLocally];
      if (v6 <= UInteger) {
        return 0;
      }
    }
    else
    {
      return v6 > UInteger;
    }
  }
  return result;
}

- (BOOL)showPhotoAttributionAtEndOfSlider
{
  int v3 = [(MKMapItem *)self->_mapItem _mapkit_hasSinglePhotoVendor];
  if (v3) {
    LOBYTE(v3) = ([(MKMapItem *)self->_mapItem _mapkit_canAtLeastOneAttributionShowPhotosLocally] & 1) == 0&& [(MUPhotoSliderTileProvider *)self displayType] == 0;
  }
  return v3;
}

- (BOOL)shouldRouteToPhotoThumbnailGallery
{
  int v3 = [(MKMapItem *)self->_mapItem _mapkit_supportsFullScreenExperience];
  if (v3)
  {
    unint64_t v4 = [(MUPhotoSliderTileProvider *)self numberOfPhotos];
    LOBYTE(v3) = v4 > GEOConfigGetUInteger();
  }
  return v3;
}

- (BOOL)showFullScreen
{
  return self->_showFullScreen;
}

- (NSArray)photos
{
  return self->_photos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end