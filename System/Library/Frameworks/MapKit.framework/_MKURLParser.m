@interface _MKURLParser
+ (BOOL)isAppleMapsGuidesURL:(id)a3;
+ (BOOL)isValidMapURL:(id)a3;
- ($DC1C8D958DDC8D67D0023B74A9319680)searchRegion;
- ($F24F406B2B787EFB06265DBA3D28CBD5)span;
- (BOOL)exactPositionSpecified;
- (BOOL)parseIncludingCustomParameters:(BOOL)a3;
- (BOOL)showAllCuratedCollections;
- (BOOL)showCarDestinations;
- (BOOL)showMyLocationCard;
- (BOOL)showParkedCar;
- (BOOL)showReports;
- (BOOL)tester;
- (BOOL)trackingModeSpecified;
- (CLLocationCoordinate2D)centerCoordinate;
- (CLLocationCoordinate2D)searchCoordinate;
- (GEOEnrichmentInfo)enrichmentInfo;
- (GEOMapRegion)offlineDownloadRegion;
- (GEOMuninViewState)muninViewState;
- (GEOURLCollectionStorage)collectionStorage;
- (GEOURLDirectionsOptions)directionsOptions;
- (GEOURLExtraStorage)extraStorage;
- (GEOURLLocationQueryItem)destinationLocationQueryItem;
- (GEOURLLocationQueryItem)locationQueryItem;
- (GEOURLLocationQueryItem)sourceLocationQueryItem;
- (GEOUserSessionEntity)userSessionEntity;
- (MKMapCamera)mapCamera;
- (NSArray)directionsDestinationAddressStrings;
- (NSArray)directionsLocationQueryItems;
- (NSString)abAddressID;
- (NSString)abRecordID;
- (NSString)addressString;
- (NSString)cnAddressIdentifier;
- (NSString)cnContactIdentifier;
- (NSString)contentProvider;
- (NSString)contentProviderID;
- (NSString)directionsDestinationAddressString;
- (NSString)directionsSourceAddressString;
- (NSString)label;
- (NSString)lineName;
- (NSString)searchQuery;
- (_MKURLParser)initWithURL:(id)a3;
- (double)altitude;
- (double)cameraCenterBasedAltitude;
- (double)roll;
- (double)rotation;
- (double)tilt;
- (float)zoomLevel;
- (int)searchProviderID;
- (int64_t)actionType;
- (int64_t)favoritesType;
- (int64_t)trackingMode;
- (unint64_t)curatedCollectionMUID;
- (unint64_t)lineMUID;
- (unint64_t)mapType;
- (unint64_t)publisherMUID;
- (unint64_t)searchUID;
- (unint64_t)transportType;
@end

@implementation _MKURLParser

+ (BOOL)isValidMapURL:(id)a3
{
  return [MEMORY[0x1E4F64728] isValidMapURL:a3];
}

+ (BOOL)isAppleMapsGuidesURL:(id)a3
{
  id v3 = a3;
  v4 = [[_MKURLParser alloc] initWithURL:v3];

  BOOL v5 = 1;
  [(_MKURLParser *)v4 parseIncludingCustomParameters:1];
  v6 = [(_MKURLParser *)v4 collectionStorage];

  if (!v6 && ![(_MKURLParser *)v4 curatedCollectionMUID]) {
    BOOL v5 = [(_MKURLParser *)v4 publisherMUID] != 0;
  }

  return v5;
}

- (_MKURLParser)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLParser;
  BOOL v5 = [(_MKURLParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F64728]) initWithURL:v4];
    parser = v5->parser;
    v5->parser = (GEOMapURLParser *)v6;
  }
  return v5;
}

- (BOOL)parseIncludingCustomParameters:(BOOL)a3
{
  return [(GEOMapURLParser *)self->parser parseIncludingCustomParameters:a3];
}

- (unint64_t)mapType
{
  id v3 = [MEMORY[0x1E4F64918] modernManager];
  if ([v3 isMuninEnabled])
  {
    id v4 = [(_MKURLParser *)self muninViewState];

    if (v4) {
      return 107;
    }
  }
  else
  {
  }
  unsigned int v6 = [(GEOMapURLParser *)self->parser mapType];
  if (v6 > 4) {
    return 103;
  }
  else {
    return qword_18BD1AE40[v6];
  }
}

- (MKMapCamera)mapCamera
{
  id v3 = objc_alloc_init(MKMapCamera);
  id v4 = [(_MKURLParser *)self muninViewState];

  if (v4)
  {
    BOOL v5 = [(_MKURLParser *)self muninViewState];
    unsigned int v6 = [v5 cameraFrame];

    [v6 altitude];
    -[MKMapCamera setAltitude:](v3, "setAltitude:");
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    [v6 longitude];
    CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
    -[MKMapCamera setCenterCoordinate:](v3, "setCenterCoordinate:", v10.latitude, v10.longitude);
    [v6 pitch];
    -[MKMapCamera setPitch:](v3, "setPitch:");
    [v6 yaw];
    -[MKMapCamera setHeading:](v3, "setHeading:");
  }
  else
  {
    [(_MKURLParser *)self altitude];
    -[MKMapCamera setAltitude:](v3, "setAltitude:");
    [(_MKURLParser *)self centerCoordinate];
    -[MKMapCamera setCenterCoordinate:](v3, "setCenterCoordinate:");
    [(_MKURLParser *)self tilt];
    -[MKMapCamera setPitch:](v3, "setPitch:");
    [(_MKURLParser *)self rotation];
    -[MKMapCamera setHeading:](v3, "setHeading:");
  }

  return v3;
}

- (unint64_t)transportType
{
  unsigned int v2 = [(GEOMapURLParser *)self->parser transportType];
  if (v2 > 5) {
    return 0xFFFFFFFLL;
  }
  else {
    return qword_18BD1AE68[v2];
  }
}

- (BOOL)trackingModeSpecified
{
  return [(GEOMapURLParser *)self->parser trackingModeSpecified];
}

- (int64_t)trackingMode
{
  int v2 = [(GEOMapURLParser *)self->parser trackingMode];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (BOOL)exactPositionSpecified
{
  return [(GEOMapURLParser *)self->parser exactPositionSpecified];
}

- (CLLocationCoordinate2D)centerCoordinate
{
  [(GEOMapURLParser *)self->parser centerCoordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)span
{
  [(GEOMapURLParser *)self->parser span];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (float)zoomLevel
{
  [(GEOMapURLParser *)self->parser zoomLevel];
  return result;
}

- (double)cameraCenterBasedAltitude
{
  [(GEOMapURLParser *)self->parser cameraDistance];
  float v4 = v3;
  [(GEOMapURLParser *)self->parser cameraDistance];
  double v6 = v5;
  if (v4 > 0.0)
  {
    [(_MKURLParser *)self tilt];
    return cos(v7 * 0.0174532925) * v6;
  }
  return v6;
}

- (NSString)addressString
{
  return (NSString *)[(GEOMapURLParser *)self->parser addressString];
}

- (NSString)directionsSourceAddressString
{
  return (NSString *)[(GEOMapURLParser *)self->parser directionsSourceAddressString];
}

- (NSArray)directionsDestinationAddressStrings
{
  return (NSArray *)[(GEOMapURLParser *)self->parser directionsDestinationAddressStrings];
}

- (NSString)directionsDestinationAddressString
{
  return (NSString *)[(GEOMapURLParser *)self->parser directionsDestinationAddressString];
}

- (NSString)searchQuery
{
  return (NSString *)[(GEOMapURLParser *)self->parser searchQuery];
}

- (NSString)label
{
  return (NSString *)[(GEOMapURLParser *)self->parser label];
}

- (CLLocationCoordinate2D)searchCoordinate
{
  [(GEOMapURLParser *)self->parser searchCoordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)searchRegion
{
  return ($DC1C8D958DDC8D67D0023B74A9319680 *)[(GEOMapURLParser *)self->parser searchRegion];
}

- (int)searchProviderID
{
  return [(GEOMapURLParser *)self->parser searchProviderID];
}

- (unint64_t)searchUID
{
  return [(GEOMapURLParser *)self->parser searchUID];
}

- (NSString)contentProvider
{
  return (NSString *)[(GEOMapURLParser *)self->parser contentProvider];
}

- (NSString)contentProviderID
{
  return (NSString *)[(GEOMapURLParser *)self->parser contentProviderID];
}

- (NSString)abRecordID
{
  return (NSString *)[(GEOMapURLParser *)self->parser abRecordID];
}

- (NSString)abAddressID
{
  return (NSString *)[(GEOMapURLParser *)self->parser abAddressID];
}

- (NSString)cnContactIdentifier
{
  return (NSString *)[(GEOMapURLParser *)self->parser cnContactIdentifier];
}

- (NSString)cnAddressIdentifier
{
  return (NSString *)[(GEOMapURLParser *)self->parser cnAddressIdentifier];
}

- (GEOUserSessionEntity)userSessionEntity
{
  return (GEOUserSessionEntity *)[(GEOMapURLParser *)self->parser userSessionEntity];
}

- (double)altitude
{
  [(GEOMapURLParser *)self->parser altitude];
  return result;
}

- (double)rotation
{
  [(GEOMapURLParser *)self->parser rotation];
  return result;
}

- (double)tilt
{
  [(GEOMapURLParser *)self->parser tilt];
  return result;
}

- (double)roll
{
  [(GEOMapURLParser *)self->parser roll];
  return result;
}

- (unint64_t)lineMUID
{
  return [(GEOMapURLParser *)self->parser lineMUID];
}

- (NSString)lineName
{
  return (NSString *)[(GEOMapURLParser *)self->parser lineName];
}

- (int64_t)actionType
{
  return [(GEOMapURLParser *)self->parser actionType];
}

- (int64_t)favoritesType
{
  return [(GEOMapURLParser *)self->parser favoritesType];
}

- (BOOL)tester
{
  return [(GEOMapURLParser *)self->parser tester];
}

- (GEOURLCollectionStorage)collectionStorage
{
  return (GEOURLCollectionStorage *)[(GEOMapURLParser *)self->parser collectionStorage];
}

- (GEOURLExtraStorage)extraStorage
{
  return (GEOURLExtraStorage *)[(GEOMapURLParser *)self->parser extraStorage];
}

- (GEOMuninViewState)muninViewState
{
  return (GEOMuninViewState *)[(GEOMapURLParser *)self->parser muninViewState];
}

- (GEOMapRegion)offlineDownloadRegion
{
  return (GEOMapRegion *)[(GEOMapURLParser *)self->parser offlineDownloadRegion];
}

- (BOOL)showCarDestinations
{
  return [(GEOMapURLParser *)self->parser showCarDestinations];
}

- (BOOL)showParkedCar
{
  return [(GEOMapURLParser *)self->parser showParkedCar];
}

- (BOOL)showMyLocationCard
{
  return [(GEOMapURLParser *)self->parser showMyLocationCard];
}

- (BOOL)showReports
{
  return [(GEOMapURLParser *)self->parser showReports];
}

- (unint64_t)curatedCollectionMUID
{
  return [(GEOMapURLParser *)self->parser curatedCollectionMUID];
}

- (unint64_t)publisherMUID
{
  return [(GEOMapURLParser *)self->parser publisherMUID];
}

- (BOOL)showAllCuratedCollections
{
  return [(GEOMapURLParser *)self->parser showAllCuratedCollections];
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return (GEOEnrichmentInfo *)[(GEOMapURLParser *)self->parser enrichmentInfo];
}

- (GEOURLLocationQueryItem)locationQueryItem
{
  return (GEOURLLocationQueryItem *)[(GEOMapURLParser *)self->parser locationQueryItem];
}

- (GEOURLLocationQueryItem)sourceLocationQueryItem
{
  return (GEOURLLocationQueryItem *)[(GEOMapURLParser *)self->parser sourceLocationQueryItem];
}

- (GEOURLLocationQueryItem)destinationLocationQueryItem
{
  return (GEOURLLocationQueryItem *)[(GEOMapURLParser *)self->parser destinationLocationQueryItem];
}

- (NSArray)directionsLocationQueryItems
{
  return (NSArray *)[(GEOMapURLParser *)self->parser directionsLocationQueryItems];
}

- (GEOURLDirectionsOptions)directionsOptions
{
  return (GEOURLDirectionsOptions *)[(GEOMapURLParser *)self->parser directionsOptions];
}

- (void).cxx_destruct
{
}

@end