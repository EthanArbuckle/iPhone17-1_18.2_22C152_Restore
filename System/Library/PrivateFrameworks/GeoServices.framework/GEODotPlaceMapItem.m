@interface GEODotPlaceMapItem
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasMUID;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)isValid;
- (GEODotPlace)dotPlace;
- (GEODotPlaceMapItem)init;
- (GEODotPlaceMapItem)initWithDotPlace:(id)a3;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (GEOMapItemIdentifier)_identifier;
- (NSString)name;
- (unint64_t)_muid;
- (void)setDotPlace:(id)a3;
@end

@implementation GEODotPlaceMapItem

- (GEODotPlaceMapItem)init
{
  result = (GEODotPlaceMapItem *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEODotPlaceMapItem)initWithDotPlace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEODotPlaceMapItem;
  v6 = [(GEODotPlaceMapItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dotPlace, a3);
  }

  return v7;
}

- (GEOMapItemIdentifier)_identifier
{
  return [(GEODotPlace *)self->_dotPlace identifier];
}

- (BOOL)isValid
{
  v2 = [(GEODotPlace *)self->_dotPlace identifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  v2 = [(GEODotPlace *)self->_dotPlace latLng];
  [v2 coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (NSString)name
{
  return [(GEODotPlace *)self->_dotPlace name];
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  double v3 = [GEOFeatureStyleAttributes alloc];
  double v4 = [(GEODotPlace *)self->_dotPlace styleAttributes];
  double v5 = [(GEOFeatureStyleAttributes *)v3 initWithGEOStyleAttributes:v4];

  return v5;
}

- (unint64_t)_muid
{
  v2 = [(GEODotPlace *)self->_dotPlace identifier];
  unint64_t v3 = [v2 muid];

  return v3;
}

- (BOOL)_hasMUID
{
  return [(GEODotPlaceMapItem *)self _muid] != 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (GEODotPlace)dotPlace
{
  return self->_dotPlace;
}

- (void)setDotPlace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end