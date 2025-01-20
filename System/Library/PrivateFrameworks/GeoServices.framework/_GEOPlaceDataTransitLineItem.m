@interface _GEOPlaceDataTransitLineItem
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasEncyclopedicInfo;
- (BOOL)hasIncidentComponent;
- (BOOL)hasLineColorString;
- (BOOL)isBus;
- (BOOL)isIncidentsTTLExpired;
- (BOOL)showVehicleNumber;
- (GEOEncyclopedicInfo)encyclopedicInfo;
- (GEOMapItemIdentifier)identifier;
- (GEOMapRegion)mapRegion;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitAttribution)attribution;
- (GEOTransitSystem)system;
- (NSArray)incidents;
- (NSArray)labelItems;
- (NSArray)operatingHours;
- (NSString)lineColorString;
- (NSString)name;
- (_GEOPlaceDataTransitLineItem)initWithMapItem:(id)a3;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)muid;
@end

@implementation _GEOPlaceDataTransitLineItem

- (_GEOPlaceDataTransitLineItem)initWithMapItem:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOPlaceDataTransitLineItem;
  v5 = [(_GEOPlaceDataTransitLineItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 displayMapRegion];
    mapRegion = v5->_mapRegion;
    v5->_mapRegion = (GEOMapRegion *)v6;

    uint64_t v8 = [v4 _transitAttribution];
    attribution = v5->_attribution;
    v5->_attribution = (GEOTransitAttribution *)v8;

    uint64_t v10 = [v4 _transitInfo];
    transitInfo = v5->_transitInfo;
    v5->_transitInfo = (GEOMapItemTransitInfo *)v10;

    v12 = [(GEOMapItemTransitInfo *)v5->_transitInfo lines];
    uint64_t v13 = [v12 firstObject];
    line = v5->_line;
    v5->_line = (GEOTransitLine *)v13;

    v5->_hasEncyclopedicInfo = [v4 _hasEncyclopedicInfo];
    uint64_t v15 = [v4 _encyclopedicInfo];
    encyclopedicInfo = v5->_encyclopedicInfo;
    v5->_encyclopedicInfo = (GEOEncyclopedicInfo *)v15;
  }
  return v5;
}

- (unint64_t)muid
{
  return [(GEOTransitLine *)self->_line muid];
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)[(GEOTransitLine *)self->_line identifier];
}

- (NSString)name
{
  return (NSString *)[(GEOTransitLine *)self->_line name];
}

- (GEOTransitSystem)system
{
  return (GEOTransitSystem *)[(GEOTransitLine *)self->_line system];
}

- (unint64_t)departureTimeDisplayStyle
{
  return [(GEOTransitLine *)self->_line departureTimeDisplayStyle];
}

- (BOOL)departuresAreVehicleSpecific
{
  return [(GEOTransitLine *)self->_line departuresAreVehicleSpecific];
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line artwork];
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line modeArtwork];
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line alternateArtwork];
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line headerArtwork];
}

- (BOOL)hasLineColorString
{
  return [(GEOTransitLine *)self->_line hasLineColorString];
}

- (NSString)lineColorString
{
  return (NSString *)[(GEOTransitLine *)self->_line lineColorString];
}

- (BOOL)showVehicleNumber
{
  return [(GEOTransitLine *)self->_line showVehicleNumber];
}

- (NSArray)operatingHours
{
  return (NSArray *)[(GEOTransitLine *)self->_line operatingHours];
}

- (NSArray)labelItems
{
  return (NSArray *)[(GEOMapItemTransitInfo *)self->_transitInfo labelItems];
}

- (GEOTransitAttribution)attribution
{
  return self->_attribution;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (NSArray)incidents
{
  return (NSArray *)[(GEOMapItemTransitInfo *)self->_transitInfo incidents];
}

- (BOOL)hasIncidentComponent
{
  return [(GEOMapItemTransitInfo *)self->_transitInfo hasTransitIncidentComponent];
}

- (BOOL)isIncidentsTTLExpired
{
  return [(GEOMapItemTransitInfo *)self->_transitInfo isTransitIncidentsTTLExpired];
}

- (BOOL)hasEncyclopedicInfo
{
  return self->_hasEncyclopedicInfo;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  if (self->_hasEncyclopedicInfo) {
    return self->_encyclopedicInfo;
  }
  else {
    return (GEOEncyclopedicInfo *)0;
  }
}

- (BOOL)isBus
{
  return [(GEOTransitLine *)self->_line isBus];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encyclopedicInfo, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_line, 0);

  objc_storeStrong((id *)&self->_attribution, 0);
}

@end