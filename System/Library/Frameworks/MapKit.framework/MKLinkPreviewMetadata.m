@interface MKLinkPreviewMetadata
+ (double)displayScale;
- ($DC1C8D958DDC8D67D0023B74A9319680)coordinateRegion;
- (GEOPlaceCollection)curatedCollection;
- (GEOURLCollectionStorage)collectionStorage;
- (MKLinkPreviewMetadata)initWithActionType:(int64_t)a3 mapType:(unint64_t)a4;
- (MKLookAroundScene)scene;
- (MKMapCamera)mapCamera;
- (NSArray)mapItems;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (int64_t)actionType;
- (int64_t)type;
- (unint64_t)mapType;
- (void)setCollectionStorage:(id)a3;
- (void)setCoordinateRegion:(id *)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMapCamera:(id)a3;
- (void)setMapItems:(id)a3;
- (void)setScene:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MKLinkPreviewMetadata

+ (double)displayScale
{
  if (qword_1EB315B50 != -1) {
    dispatch_once(&qword_1EB315B50, &__block_literal_global_87);
  }
  return *(double *)&_MergedGlobals_3_6;
}

void __37__MKLinkPreviewMetadata_displayScale__block_invoke()
{
  _MergedGlobals_3_6 = 0x4008000000000000;
}

- (MKLinkPreviewMetadata)initWithActionType:(int64_t)a3 mapType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MKLinkPreviewMetadata;
  result = [(MKLinkPreviewMetadata *)&v7 init];
  if (result)
  {
    result->_actionType = a3;
    result->_mapType = a4;
    result->_coordinateRegion.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid;
    result->_coordinateRegion.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_18BD1C248;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)coordinateRegion
{
  return self;
}

- (void)setCoordinateRegion:(id *)a3
{
  self->_coordinateRegion.center.latitude = v3;
  self->_coordinateRegion.center.longitude = v4;
  self->_coordinateRegion.span.latitudeDelta = v5;
  self->_coordinateRegion.span.longitudeDelta = v6;
}

- (MKMapCamera)mapCamera
{
  return self->_mapCamera;
}

- (void)setMapCamera:(id)a3
{
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
}

- (MKLookAroundScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (void)setCollectionStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStorage, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_storeStrong((id *)&self->_mapCamera, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end