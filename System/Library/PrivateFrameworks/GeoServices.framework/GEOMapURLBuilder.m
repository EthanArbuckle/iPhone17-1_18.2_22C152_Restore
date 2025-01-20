@interface GEOMapURLBuilder
+ (id)URLForAddress:(id)a3;
+ (id)URLForAddress:(id)a3 label:(id)a4;
+ (id)URLForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7;
+ (id)URLForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7;
+ (id)URLForCollectionStorage:(id)a3;
+ (id)URLForCoordinate:(id)a3;
+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5;
+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6;
+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7;
+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8;
+ (id)URLForCoordinate:(id)a3 label:(id)a4;
+ (id)URLForCuratedCollection:(unint64_t)a3 provider:(int)a4;
+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4;
+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(int)a5;
+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4;
+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(int)a5;
+ (id)URLForDirectionsFromHereTo:(id)a3;
+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(int)a7;
+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(int)a4;
+ (id)URLForDirectionsFromHereToDestinations:(id)a3;
+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(int)a4;
+ (id)URLForDirectionsFromSource:(id)a3 toDestination:(id)a4;
+ (id)URLForDirectionsFromSource:(id)a3 toDestination:(id)a4 transportType:(int)a5;
+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4;
+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4 transportType:(int)a5;
+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4 transportType:(int)a5 directionsOptions:(id)a6;
+ (id)URLForDirectionsToDestination:(id)a3;
+ (id)URLForDirectionsToDestination:(id)a3 transportType:(int)a4;
+ (id)URLForDirectionsToDestinations:(id)a3;
+ (id)URLForDirectionsToDestinations:(id)a3 transportType:(int)a4;
+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5;
+ (id)URLForGuidesWithCollectionMUID:(unint64_t)a3 provider:(int)a4;
+ (id)URLForGuidesWithCollectionStorage:(id)a3;
+ (id)URLForGuidesWithPublisherMUID:(unint64_t)a3 provider:(int)a4;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10;
+ (id)URLForLookAroundWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5 muninViewState:(id)a6;
+ (id)URLForMapFrameWithCenter:(id)a3;
+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6;
+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8;
+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8 span:(id)a9;
+ (id)URLForMapFrameWithCenter:(id)a3 mapType:(int)a4;
+ (id)URLForPlaceForCurrentLocation;
+ (id)URLForPlaceWithMapItemIdentifier:(id)a3;
+ (id)URLForPlaceWithName:(id)a3 address:(id)a4;
+ (id)URLForPlaceWithName:(id)a3 coordinate:(id)a4;
+ (id)URLForPlaceWithName:(id)a3 mapItemIdentifier:(id)a4 coordinate:(id)a5 address:(id)a6;
+ (id)URLForPublisher:(unint64_t)a3 provider:(int)a4;
+ (id)URLForReportAProblemWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5;
+ (id)URLForSearch:(id)a3;
+ (id)URLForSearch:(id)a3 at:(id)a4 span:(id)a5;
+ (id)URLForSearch:(id)a3 at:(id)a4 zoomLevel:(double)a5;
+ (id)URLForSearch:(id)a3 near:(id)a4;
+ (id)URLForSearchWithQuery:(id)a3;
+ (id)URLForSearchWithQuery:(id)a3 centeredAt:(id)a4;
+ (id)URLForSearchWithQuery:(id)a3 centeredAt:(id)a4 span:(id)a5;
+ (id)URLForShowFavoritesType:(int64_t)a3;
+ (id)URLForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5;
- (GEOEnrichmentInfo)enrichmentInfo;
- (GEOMuninViewState)muninViewState;
- (GEOURLCollectionStorage)collectionStorage;
- (GEOURLExtraStorage)extraStorage;
- (id)_stringForCoordinate2DPointer:(id *)a3;
- (id)_stringForCoordinateSpanPointer:(id *)a3;
- (id)build;
- (id)buildForCollections;
- (id)buildForWeb;
- (id)buildForWebPlaceCard;
- (id)buildUniversalLink;
- (id)initForAddress:(id)a3 label:(id)a4;
- (id)initForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7;
- (id)initForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7;
- (id)initForCollectionStorage:(id)a3;
- (id)initForCoordinate:(id)a3 address:(id)a4 label:(id)a5;
- (id)initForCoordinate:(id)a3 label:(id)a4;
- (id)initForCuratedCollection:(unint64_t)a3 provider:(int)a4;
- (id)initForDirectionsTo:(id)a3;
- (id)initForDirectionsToAddresses:(id)a3;
- (id)initForDirectionsWithSource:(id)a3 destinations:(id)a4 transportType:(int)a5 directionsOptions:(id)a6;
- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5;
- (id)initForForReportAProblemWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5;
- (id)initForGuidesWithCollectionMUID:(unint64_t)a3 provider:(int)a4;
- (id)initForGuidesWithCollectionStorage:(id)a3;
- (id)initForGuidesWithPublisherMUID:(unint64_t)a3 provider:(int)a4;
- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5;
- (id)initForLookAroundWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5 muninViewState:(id)a6;
- (id)initForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8 span:(id)a9;
- (id)initForPlaceForCurrentLocation;
- (id)initForPlaceWithName:(id)a3 mapItemIdentifier:(id)a4 coordinate:(id)a5 address:(id)a6 mapType:(int)a7 providerId:(int)a8;
- (id)initForPublisher:(unint64_t)a3 provider:(int)a4;
- (id)initForSearch:(id)a3;
- (id)initForSearchWithQuery:(id)a3 centeredAt:(id)a4 span:(id)a5;
- (id)initForShowFavoritesType:(int64_t)a3;
- (id)initForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5;
- (void)_removeParametersAllBut:(id)a3;
- (void)addCodable:(id)a3 key:(id)a4 compressedKey:(id)a5;
- (void)setBusinessAddress:(id)a3;
- (void)setBusinessCoordinate:(id)a3;
- (void)setCollectionStorage:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setDestinationLabel:(id)a3;
- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4;
- (void)setDisplayRegion:(id)a3;
- (void)setEnrichmentInfo:(id)a3;
- (void)setExtraStorage:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setMapType:(int)a3;
- (void)setMuninViewState:(id)a3;
- (void)setNear:(id)a3;
- (void)setSearchLocation:(id)a3 span:(id)a4;
- (void)setSearchLocation:(id)a3 zoomLevel:(double)a4;
- (void)setStartAddress:(id)a3;
- (void)setTransportType:(int)a3;
@end

@implementation GEOMapURLBuilder

+ (id)URLForSearch:(id)a3 at:(id)a4 span:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  double v7 = a4.var1;
  double v8 = a4.var0;
  id v9 = a3;
  id v10 = [[GEOMapURLBuilder alloc] initForSearch:v9];

  objc_msgSend(v10, "setSearchLocation:span:", v8, v7, var0, var1);
  v11 = [v10 buildForWeb];

  return v11;
}

- (void)setSearchLocation:(id)a3 span:(id)a4
{
  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1ED73ECC8, *(void *)&a4.var0, *(void *)&a4.var1, *(void *)&a3.var0, *(void *)&a3.var1);
  v5 = [(GEOMapURLBuilder *)self _stringForCoordinate2DPointer:&v8];
  [(NSMutableDictionary *)self->_dict setObject:v5 forKeyedSubscript:@"sll"];

  v6 = [(GEOMapURLBuilder *)self _stringForCoordinateSpanPointer:&v7];
  [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"sspn"];
}

- (id)initForSearch:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  v5 = [(GEOMapURLBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    [(NSMutableDictionary *)v5->_dict setObject:v4 forKeyedSubscript:@"q"];
  }

  return v5;
}

- (id)buildForWeb
{
  return _geo_URLForDictionary(2, self->_dict, self->_actionType);
}

- (id)_stringForCoordinateSpanPointer:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lf,%lf", *(void *)&a3->var0, *(void *)&a3->var1);
  }
  else
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      objc_super v9 = v6;
      __int16 v10 = 2082;
      v11 = "nil == span";
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    v3 = 0;
  }

  return v3;
}

- (id)_stringForCoordinate2DPointer:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lf,%lf", *(void *)&a3->var0, *(void *)&a3->var1);
  }
  else
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      objc_super v9 = v6;
      __int16 v10 = 2082;
      v11 = "nil == coordinate";
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    v3 = 0;
  }

  return v3;
}

- (void)_removeParametersAllBut:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_dict allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (([v4 containsObject:v10] & 1) == 0) {
          [(NSMutableDictionary *)self->_dict removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);
  objc_storeStrong((id *)&self->_collectionStorage, 0);

  objc_storeStrong((id *)&self->_dict, 0);
}

- (void)setNear:(id)a3
{
  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1ED73ECB0, *(void *)&a3.var0, *(void *)&a3.var1);
  id v4 = [(GEOMapURLBuilder *)self _stringForCoordinate2DPointer:&v5];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"near"];
}

- (void)setSearchLocation:(id)a3 zoomLevel:(double)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v8 = a3;
  [(GEOMapURLBuilder *)self _removeParametersAllBut:&unk_1ED73ECE0];
  uint64_t v6 = [(GEOMapURLBuilder *)self _stringForCoordinate2DPointer:&v8];
  [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"sll"];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&a4);
  [(NSMutableDictionary *)self->_dict setObject:v7 forKeyedSubscript:@"z"];
}

+ (id)URLForSearch:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMapURLBuilder alloc] initForSearch:v3];

  uint64_t v5 = [v4 buildForWeb];

  return v5;
}

+ (id)URLForSearch:(id)a3 near:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v6 = a3;
  id v7 = [[GEOMapURLBuilder alloc] initForSearch:v6];

  objc_msgSend(v7, "setNear:", var0, var1);
  $F24F406B2B787EFB06265DBA3D28CBD5 v8 = [v7 buildForWeb];

  return v8;
}

+ (id)URLForSearch:(id)a3 at:(id)a4 zoomLevel:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  id v9 = [[GEOMapURLBuilder alloc] initForSearch:v8];

  objc_msgSend(v9, "setSearchLocation:zoomLevel:", var0, var1, a5);
  uint64_t v10 = [v9 buildForWeb];

  return v10;
}

- (id)initForCoordinate:(id)a3 address:(id)a4 label:(id)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v15 = a3;
  id v7 = a4;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapURLBuilder;
  id v9 = [(GEOMapURLBuilder *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v9->_dict;
    v9->_dict = (NSMutableDictionary *)v10;

    long long v12 = [(GEOMapURLBuilder *)v9 _stringForCoordinate2DPointer:&v15];
    [(NSMutableDictionary *)v9->_dict setObject:v12 forKeyedSubscript:@"ll"];

    if (v7) {
      [(NSMutableDictionary *)v9->_dict setObject:v7 forKeyedSubscript:@"address"];
    }
    if (v8) {
      [(NSMutableDictionary *)v9->_dict setObject:v8 forKeyedSubscript:@"q"];
    }
  }

  return v9;
}

- (id)initForCoordinate:(id)a3 label:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v12 = a3;
  id v5 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapURLBuilder;
  id v6 = [(GEOMapURLBuilder *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    dict = v6->_dict;
    v6->_dict = (NSMutableDictionary *)v7;

    id v9 = [(GEOMapURLBuilder *)v6 _stringForCoordinate2DPointer:&v12];
    [(NSMutableDictionary *)v6->_dict setObject:v9 forKeyedSubscript:@"ll"];

    if (v5) {
      [(NSMutableDictionary *)v6->_dict setObject:v5 forKeyedSubscript:@"q"];
    }
  }

  return v6;
}

- (id)initForAddress:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  id v8 = [(GEOMapURLBuilder *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    dict = v8->_dict;
    v8->_dict = (NSMutableDictionary *)v9;

    [(NSMutableDictionary *)v8->_dict setObject:v6 forKeyedSubscript:@"address"];
    if (v7) {
      [(NSMutableDictionary *)v8->_dict setObject:v7 forKeyedSubscript:@"q"];
    }
  }

  return v8;
}

- (void)setDisplayRegion:(id)a3
{
  v5[0] = *(void *)&a3.var1.var0;
  v5[1] = *(void *)&a3.var1.var1;
  id v4 = -[GEOMapURLBuilder _stringForCoordinateSpanPointer:](self, "_stringForCoordinateSpanPointer:", v5, *(void *)&a3.var0.var0, *(void *)&a3.var0.var1);
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"spn"];
}

+ (id)URLForAddress:(id)a3
{
  return (id)[a1 URLForAddress:a3 label:0];
}

+ (id)URLForAddress:(id)a3 label:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEOMapURLBuilder alloc] initForAddress:v6 label:v5];

  id v8 = [v7 buildForWeb];

  return v8;
}

+ (id)URLForCoordinate:(id)a3
{
  return (id)objc_msgSend(a1, "URLForCoordinate:label:", 0, a3.var0, a3.var1);
}

+ (id)URLForCoordinate:(id)a3 label:(id)a4
{
  return (id)objc_msgSend(a1, "URLForCoordinate:address:label:", 0, a4, a3.var0, a3.var1);
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a5;
  id v9 = a4;
  id v10 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v9, v8, var0, var1);

  objc_super v11 = [v10 buildForWeb];

  return v11;
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v12, v11, var0, var1);

  [v13 setExtraStorage:v10];
  objc_super v14 = [v13 buildForWeb];

  return v14;
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7
{
  return (id)objc_msgSend(a1, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", a4, a5, a6, a7, 0, a3.var0, a3.var1);
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v17, v16, var0, var1);

  [v18 setExtraStorage:v15];
  [v18 setMuninViewState:v14];

  if (a7) {
    [v18 buildForWebPlaceCard];
  }
  else {
  v19 = [v18 buildForWeb];
  }

  return v19;
}

- (id)initForDirectionsTo:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v7 = [(GEOMapURLBuilder *)self initForDirectionsToAddresses:v6];
  }
  else
  {
    id v7 = [(GEOMapURLBuilder *)self initForDirectionsToAddresses:0];
  }

  return v7;
}

- (id)initForDirectionsToAddresses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  id v5 = [(GEOMapURLBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    [(NSMutableDictionary *)v5->_dict setObject:v4 forKeyedSubscript:@"daddr"];
  }

  return v5;
}

- (void)setStartAddress:(id)a3
{
  id v4 = a3;
  [(GEOMapURLBuilder *)self _removeParametersAllBut:&unk_1ED73ECF8];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"saddr"];
}

- (void)setTransportType:(int)a3
{
  [(GEOMapURLBuilder *)self _removeParametersAllBut:&unk_1ED73ED10];
  id v5 = _geo_urlArgumentForTransportType(a3, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    [(NSMutableDictionary *)self->_dict setObject:v5 forKeyedSubscript:@"dirflg"];
    id v5 = v6;
  }
}

- (void)setDestinationLabel:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"label"];
  }
}

- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"auid"];

    objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_dict setObject:v7 forKeyedSubscript:@"lsp"];
  }
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    id v7 = objc_msgSend(a1, "URLForDirectionsFrom:to:transport:");
  }
  else
  {
    id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2082;
      id v12 = "nil == destinationAddress && nil == startAddress";
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v9, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 count];
  if (v7 || v9)
  {
    id v12 = [a1 URLForDirectionsFrom:v7 toDestinations:v8 transport:4];
  }
  else
  {
    id v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = NSStringFromSelector(a2);
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2082;
      id v17 = "0u == destinationAddresses.count && nil == startAddress";
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  __int16 v11 = (void *)v10;
  if (v9 | v10)
  {
    if (v10)
    {
      unint64_t v17 = v10;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      int v14 = [a1 URLForDirectionsFrom:v9 toDestinations:v15 transport:v5];
    }
    else
    {
      int v14 = [a1 URLForDirectionsFrom:v9 toDestinations:0 transport:v5];
    }
  }
  else
  {
    id v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2082;
      v21 = "nil == destinationAddress && nil == startAddress";
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    int v14 = 0;
  }

  return v14;
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 count];
  if (v8 || v10)
  {
    id v14 = [[GEOMapURLBuilder alloc] initForDirectionsToAddresses:v9];
    id v15 = v14;
    if (v8) {
      [v14 setStartAddress:v8];
    }
    if (v5 != 4) {
      [v15 setTransportType:v5];
    }
    uint64_t v13 = [v15 buildForWeb];
  }
  else
  {
    __int16 v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = "0u == destinationAddresses.count && nil == startAddress";
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [a1 URLForDirectionsFrom:0 to:a3 transport:*(void *)&a4];
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromSelector(a2);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2082;
      id v12 = "nil == destinationAddress";
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    id v8 = [a1 URLForDirectionsFrom:0 toDestinations:v7 transport:v4];
  }
  else
  {
    int v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2082;
      id v15 = "0u == destinationAddresses.count";
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)URLForDirectionsFromHereTo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [a1 URLForDirectionsFromHereTo:a3 transport:4];
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      int v8 = 138543618;
      int v9 = v6;
      __int16 v10 = 2082;
      __int16 v11 = "nil == destinationAddress";
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v8, 0x16u);
    }
    id v3 = 0;
  }

  return v3;
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [a1 URLForDirectionsFrom:0 toDestinations:v5 transport:4];
  }
  else
  {
    id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = NSStringFromSelector(a2);
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2082;
      uint64_t v13 = "0u == destinationAddresses.count";
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (v12)
  {
    id v14 = [[GEOMapURLBuilder alloc] initForDirectionsTo:v12];
    id v15 = v14;
    if (v7 != 4) {
      [v14 setTransportType:v7];
    }
    [v15 setDestinationLabel:v13];
    [v15 setDestinationMUID:a5 provider:v8];
    uint64_t v16 = [v15 buildForWeb];
  }
  else
  {
    int v17 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2082;
      v23 = "nil == destinationAddress";
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)initForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v18 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapURLBuilder;
  __int16 v11 = [(GEOMapURLBuilder *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    id v14 = [(GEOMapURLBuilder *)v11 _stringForCoordinate2DPointer:&v18];
    [(NSMutableDictionary *)v11->_dict setObject:v14 forKeyedSubscript:@"ll"];

    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lf,%lf,%lf,%lf", *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7);
    [(NSMutableDictionary *)v11->_dict setObject:v15 forKeyedSubscript:@"cam"];
  }
  return v11;
}

+ (id)URLForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  id v7 = -[GEOMapURLBuilder initForCameraAt:altitude:rotation:tilt:roll:]([GEOMapURLBuilder alloc], "initForCameraAt:altitude:rotation:tilt:roll:", a3.var0, a3.var1, a4, a5, a6, a7);
  uint64_t v8 = [v7 buildForWeb];

  return v8;
}

- (id)initForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v19 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapURLBuilder;
  __int16 v11 = [(GEOMapURLBuilder *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    id v14 = [(GEOMapURLBuilder *)v11 _stringForCoordinate2DPointer:&v19];
    [(NSMutableDictionary *)v11->_dict setObject:v14 forKeyedSubscript:@"ll"];

    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&a4);
    [(NSMutableDictionary *)v11->_dict setObject:v15 forKeyedSubscript:@"z"];

    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lf,%lf,%lf", *(void *)&a5, *(void *)&a6, *(void *)&a7);
    [(NSMutableDictionary *)v11->_dict setObject:v16 forKeyedSubscript:@"cam"];
  }
  return v11;
}

+ (id)URLForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  id v7 = -[GEOMapURLBuilder initForCameraAt:zoomLevel:rotation:tilt:roll:]([GEOMapURLBuilder alloc], "initForCameraAt:zoomLevel:rotation:tilt:roll:", a3.var0, a3.var1, a4, a5, a6, a7);
  uint64_t v8 = [v7 buildForWeb];

  return v8;
}

- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapURLBuilder;
  int v9 = [(GEOMapURLBuilder *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v9->_dict;
    v9->_dict = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
    [(NSMutableDictionary *)v9->_dict setObject:v12 forKeyedSubscript:@"auid"];

    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v5);
    [(NSMutableDictionary *)v9->_dict setObject:v13 forKeyedSubscript:@"lsp"];

    if (v8)
    {
      if ([v8 length]) {
        [(NSMutableDictionary *)v9->_dict setObject:v8 forKeyedSubscript:@"q"];
      }
    }
  }

  return v9;
}

- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapURLBuilder;
  __int16 v11 = [(GEOMapURLBuilder *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    id v14 = [NSString stringWithFormat:@"%@", v10];
    [(NSMutableDictionary *)v11->_dict setObject:v14 forKeyedSubscript:@"cp"];

    objc_super v15 = [NSString stringWithFormat:@"%@", v9];
    [(NSMutableDictionary *)v11->_dict setObject:v15 forKeyedSubscript:@"cpid"];

    if (v8)
    {
      if ([v8 length]) {
        [(NSMutableDictionary *)v11->_dict setObject:v8 forKeyedSubscript:@"q"];
      }
    }
  }

  return v11;
}

- (void)setBusinessCoordinate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = a3;
  if (a3.var1 < -180.0 || a3.var1 > 180.0 || a3.var0 < -90.0 || a3.var0 > 90.0)
  {
    uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@ cannot set an invalid coordinate.", buf, 0xCu);
    }
  }
  else
  {
    -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1ED73ED28, *(void *)&v7.var0, *(void *)&v7.var1);
    uint64_t v5 = [(GEOMapURLBuilder *)self _stringForCoordinate2DPointer:&v7];
    [(NSMutableDictionary *)self->_dict setObject:v5 forKeyedSubscript:@"ll"];
  }
}

- (void)setBusinessAddress:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && [v5 length])
  {
    [(GEOMapURLBuilder *)self _removeParametersAllBut:&unk_1ED73ED40];
    [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"address"];
  }
  else
  {
    $F24F406B2B787EFB06265DBA3D28CBD5 v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(a2);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@ cannot set an invalid postal address.", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = [[GEOMapURLBuilder alloc] initForInternalBusiness:v7 id:a4 provider:v5];

  int v9 = [v8 buildForWeb];

  return v9;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  uint64_t v9 = *(void *)&a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = [[GEOMapURLBuilder alloc] initForInternalBusiness:v13 id:a4 provider:v9];

  objc_msgSend(v14, "setBusinessCoordinate:", var0, var1);
  [v14 setBusinessAddress:v12];

  objc_super v15 = [v14 buildForWeb];

  return v15;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8
{
  return (id)objc_msgSend(a1, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(void *)&a5, a7, a8, 0, a6.var0, a6.var1);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9
{
  return (id)objc_msgSend(a1, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:", a3, a4, *(void *)&a5, a7, a8, a9, a6.var0, a6.var1, 0);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  uint64_t v15 = *(void *)&a5;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a3;
  id v22 = [[GEOMapURLBuilder alloc] initForInternalBusiness:v21 id:a4 provider:v15];

  objc_msgSend(v22, "setBusinessCoordinate:", var0, var1);
  [v22 setBusinessAddress:v20];

  [v22 setExtraStorage:v19];
  [v22 setMuninViewState:v18];

  if (a9) {
    [v22 buildForWebPlaceCard];
  }
  else {
  v23 = [v22 buildForWeb];
  }

  return v23;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  uint64_t v14 = *(void *)&a5;
  id v17 = a8;
  id v18 = a7;
  id v19 = a3;
  id v20 = [[GEOMapURLBuilder alloc] initForInternalBusiness:v19 id:a4 provider:v14];

  objc_msgSend(v20, "setBusinessCoordinate:", var0, var1);
  [v20 setBusinessAddress:v18];

  [v20 setExtraStorage:v17];
  if (a9) {
    [v20 buildForWebPlaceCard];
  }
  else {
  id v21 = [v20 buildForWeb];
  }

  return v21;
}

+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[GEOMapURLBuilder alloc] initForExternalBusiness:v9 id:v8 ofContentProvider:v7];

  uint64_t v11 = [v10 buildForWeb];

  return v11;
}

- (void)setMapRegion:(id)a3
{
  id v4 = a3;
  double v5 = GEOMapRectForMapRegion(v4);
  v18[2] = GEOCoordinateRegionForMapRect(v5, v6, v7, v8);
  v18[3] = v9;
  v19[0] = v10;
  v19[1] = v11;
  id v12 = [(GEOMapURLBuilder *)self _stringForCoordinateSpanPointer:v19];
  [(NSMutableDictionary *)self->_dict setObject:v12 forKeyedSubscript:@"spn"];

  [v4 centerLat];
  uint64_t v14 = v13;
  [v4 centerLng];
  uint64_t v16 = v15;

  v18[0] = v14;
  v18[1] = v16;
  id v17 = [(GEOMapURLBuilder *)self _stringForCoordinate2DPointer:v18];
  [(NSMutableDictionary *)self->_dict setObject:v17 forKeyedSubscript:@"ll"];
}

- (id)initForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapURLBuilder;
  uint64_t v10 = [(GEOMapURLBuilder *)&v15 init];
  if (v10)
  {
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v10->_dict;
    v10->_dict = v11;

    [(GEOMapURLBuilder *)v10 setMapType:3];
    if (v9) {
      [(GEOMapURLBuilder *)v10 setMapRegion:v9];
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)v10->_dict setObject:v13 forKeyedSubscript:@"lineid"];

    if (v8) {
      [(NSMutableDictionary *)v10->_dict setObject:v8 forKeyedSubscript:@"name"];
    }
  }

  return v10;
}

+ (id)URLForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[GEOMapURLBuilder alloc] initForTransitLine:a3 withName:v8 mapRegion:v7];

  uint64_t v10 = [v9 buildForWeb];

  return v10;
}

- (id)initForShowFavoritesType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOMapURLBuilder;
  id v4 = [(GEOMapURLBuilder *)&v10 init];
  if (v4)
  {
    double v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v4->_dict;
    v4->_dict = v5;

    id v7 = @"pl";
    if (a3 == 2) {
      id v7 = @"tl";
    }
    if (a3) {
      id v8 = v7;
    }
    else {
      id v8 = &stru_1ED51F370;
    }
    if ([(__CFString *)v8 length]) {
      [(NSMutableDictionary *)v4->_dict setObject:v8 forKeyedSubscript:@"showfavorites"];
    }
  }
  return v4;
}

+ (id)URLForShowFavoritesType:(int64_t)a3
{
  id v3 = [[GEOMapURLBuilder alloc] initForShowFavoritesType:a3];
  id v4 = [v3 buildForWeb];

  return v4;
}

- (id)initForCollectionStorage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  double v5 = [(GEOMapURLBuilder *)&v9 init];
  if (v5)
  {
    double v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v5->_dict;
    v5->_dict = v6;

    [(GEOMapURLBuilder *)v5 setCollectionStorage:v4];
  }

  return v5;
}

+ (id)URLForCollectionStorage:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMapURLBuilder alloc] initForCollectionStorage:v3];

  double v5 = [v4 buildForCollections];

  return v5;
}

- (id)initForCuratedCollection:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  double v6 = [(GEOMapURLBuilder *)&v12 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v6->_dict;
    v6->_dict = v7;

    objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)v6->_dict setObject:v9 forKeyedSubscript:@"pg"];

    objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    [(NSMutableDictionary *)v6->_dict setObject:v10 forKeyedSubscript:@"lsp"];
  }
  return v6;
}

+ (id)URLForCuratedCollection:(unint64_t)a3 provider:(int)a4
{
  id v4 = [[GEOMapURLBuilder alloc] initForCuratedCollection:a3 provider:*(void *)&a4];
  double v5 = [v4 buildForCollections];

  return v5;
}

- (id)initForPublisher:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  double v6 = [(GEOMapURLBuilder *)&v12 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v6->_dict;
    v6->_dict = v7;

    objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)v6->_dict setObject:v9 forKeyedSubscript:@"pp"];

    objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    [(NSMutableDictionary *)v6->_dict setObject:v10 forKeyedSubscript:@"lsp"];
  }
  return v6;
}

+ (id)URLForPublisher:(unint64_t)a3 provider:(int)a4
{
  id v4 = [[GEOMapURLBuilder alloc] initForPublisher:a3 provider:*(void *)&a4];
  double v5 = [v4 buildForCollections];

  return v5;
}

- (id)build
{
  return _geo_URLForDictionary(1, self->_dict, self->_actionType);
}

- (id)buildForCollections
{
  return _geo_URLForDictionary(4, self->_dict, self->_actionType);
}

- (id)buildForWebPlaceCard
{
  return _geo_URLForDictionary(3, self->_dict, self->_actionType);
}

- (id)buildUniversalLink
{
  return _geo_URLForDictionary(5, self->_dict, self->_actionType);
}

- (void)setMapType:(int)a3
{
  id v4 = _geo_urlArgumentForMapType(a3, 0);
  if (v4)
  {
    double v5 = v4;
    [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"t"];
    id v4 = v5;
  }
}

- (void)setContentProvider:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_dict setObject:a3 forKeyedSubscript:@"cp"];
  }
}

- (void)addCodable:(id)a3 key:(id)a4 compressedKey:(id)a5
{
  id v19 = a5;
  if (a3)
  {
    id v8 = a4;
    id v9 = [a3 data];
    if ([v19 length]
      && (unint64_t)[v9 length] >= 0x1F5
      && (unint64_t v20 = 0,
          id v21 = 0,
          id v9 = v9,
          GEOZlibCompress((const Bytef *)[v9 bytes], objc_msgSend(v9, "length"), &v21, &v20),
          (objc_super v10 = v21) != 0)
      && (unint64_t v11 = v20, v11 < [v9 length]))
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:v11];

      int v13 = 1;
      id v9 = (id)v12;
    }
    else
    {
      int v13 = 0;
    }
    uint64_t v14 = [v9 base64EncodedStringWithOptions:0];
    if (v13) {
      id v15 = v19;
    }
    else {
      id v15 = v8;
    }
    [(NSMutableDictionary *)self->_dict setObject:v14 forKeyedSubscript:v15];
  }
  else
  {
    dict = self->_dict;
    id v17 = a4;
    [(NSMutableDictionary *)dict removeObjectForKey:v17];

    id v18 = v19;
    if (!v19) {
      goto LABEL_15;
    }
    [(NSMutableDictionary *)self->_dict removeObjectForKey:v19];
  }
  id v18 = v19;
LABEL_15:
}

- (void)setExtraStorage:(id)a3
{
  objc_storeStrong((id *)&self->_extraStorage, a3);
  id v5 = a3;
  [(GEOMapURLBuilder *)self addCodable:v5 key:@"_ext" compressedKey:@"_extc"];
}

- (void)setCollectionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_collectionStorage, a3);
  id v5 = a3;
  [(GEOMapURLBuilder *)self addCodable:v5 key:@"ug" compressedKey:0];
}

- (void)setMuninViewState:(id)a3
{
  objc_storeStrong((id *)&self->_muninViewState, a3);
  id v5 = a3;
  [(GEOMapURLBuilder *)self addCodable:v5 key:@"_mvs" compressedKey:@"_mvsc"];
}

- (id)initForPlaceWithName:(id)a3 mapItemIdentifier:(id)a4 coordinate:(id)a5 address:(id)a6 mapType:(int)a7 providerId:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  double var1 = a5.var1;
  double var0 = a5.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v29 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)GEOMapURLBuilder;
  id v18 = [(GEOMapURLBuilder *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    dict = v18->_dict;
    v18->_dict = (NSMutableDictionary *)v19;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v16;
      if ([v21 hasMapsIdentifierString])
      {
        id v22 = [v21 mapsIdentifierString];
        [(NSMutableDictionary *)v18->_dict setObject:v22 forKeyedSubscript:@"place-id"];
      }
      if ((int)[v21 resultProviderID] >= 1)
      {
        v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v21, "resultProviderID"));
        [(NSMutableDictionary *)v18->_dict setObject:v23 forKeyedSubscript:@"_provider"];
      }
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      uint64_t v24 = [(GEOMapURLBuilder *)v18 _stringForCoordinate2DPointer:&v29];
      [(NSMutableDictionary *)v18->_dict setObject:v24 forKeyedSubscript:@"coordinate"];
    }
    if ([v17 length]) {
      [(NSMutableDictionary *)v18->_dict setObject:v17 forKeyedSubscript:@"address"];
    }
    if (v15 && [v15 length]) {
      [(NSMutableDictionary *)v18->_dict setObject:v15 forKeyedSubscript:@"name"];
    }
    if ((int)v8 >= 1)
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v8);
      [(NSMutableDictionary *)v18->_dict setObject:v25 forKeyedSubscript:@"_provider"];
    }
    v26 = _geo_urlArgumentForMapType(a7, 1);
    [(NSMutableDictionary *)v18->_dict setObject:v26 forKeyedSubscript:@"map"];

    v18->_actionType = 4;
  }

  return v18;
}

- (id)initForPlaceForCurrentLocation
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapURLBuilder;
  v2 = [(GEOMapURLBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    [(NSMutableDictionary *)v2->_dict setObject:@"my-location" forKeyedSubscript:@"place-id"];
    v2->_actionType = 4;
  }
  return v2;
}

+ (id)URLForPlaceWithName:(id)a3 address:(id)a4
{
  return +[GEOMapURLBuilder URLForPlaceWithName:mapItemIdentifier:coordinate:address:](GEOMapURLBuilder, "URLForPlaceWithName:mapItemIdentifier:coordinate:address:", a3, 0, a4, -180.0, -180.0);
}

+ (id)URLForPlaceWithName:(id)a3 coordinate:(id)a4
{
  return +[GEOMapURLBuilder URLForPlaceWithName:mapItemIdentifier:coordinate:address:](GEOMapURLBuilder, "URLForPlaceWithName:mapItemIdentifier:coordinate:address:", a3, 0, 0, a4.var0, a4.var1);
}

+ (id)URLForPlaceWithMapItemIdentifier:(id)a3
{
  return +[GEOMapURLBuilder URLForPlaceWithName:mapItemIdentifier:coordinate:address:](GEOMapURLBuilder, "URLForPlaceWithName:mapItemIdentifier:coordinate:address:", 0, a3, 0, -180.0, -180.0);
}

+ (id)URLForPlaceWithName:(id)a3 mapItemIdentifier:(id)a4 coordinate:(id)a5 address:(id)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[GEOMapURLBuilder initForPlaceWithName:mapItemIdentifier:coordinate:address:mapType:providerId:]([GEOMapURLBuilder alloc], "initForPlaceWithName:mapItemIdentifier:coordinate:address:mapType:providerId:", v12, v11, v10, 0, 0, var0, var1);

  uint64_t v14 = [v13 buildUniversalLink];

  return v14;
}

+ (id)URLForPlaceForCurrentLocation
{
  id v2 = [[GEOMapURLBuilder alloc] initForPlaceForCurrentLocation];
  uint64_t v3 = [v2 buildUniversalLink];

  return v3;
}

- (id)initForSearchWithQuery:(id)a3 centeredAt:(id)a4 span:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  double v7 = a4.var1;
  double v8 = a4.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v19 = a4;
  $F24F406B2B787EFB06265DBA3D28CBD5 v18 = a5;
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapURLBuilder;
  id v11 = [(GEOMapURLBuilder *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    if ([v10 length]) {
      [(NSMutableDictionary *)v11->_dict setObject:v10 forKeyedSubscript:@"query"];
    }
    if (v7 >= -180.0 && v7 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      uint64_t v14 = [(GEOMapURLBuilder *)v11 _stringForCoordinate2DPointer:&v19];
      [(NSMutableDictionary *)v11->_dict setObject:v14 forKeyedSubscript:@"center"];
    }
    if (var0 >= 0.0 && var0 <= 180.0 && var1 >= 0.0 && var1 <= 360.0)
    {
      id v15 = [(GEOMapURLBuilder *)v11 _stringForCoordinateSpanPointer:&v18];
      [(NSMutableDictionary *)v11->_dict setObject:v15 forKeyedSubscript:@"span"];
    }
    v11->_actionType = 3;
  }

  return v11;
}

+ (id)URLForSearchWithQuery:(id)a3
{
  return +[GEOMapURLBuilder URLForSearchWithQuery:centeredAt:](GEOMapURLBuilder, "URLForSearchWithQuery:centeredAt:", a3, -180.0, -180.0);
}

+ (id)URLForSearchWithQuery:(id)a3 centeredAt:(id)a4
{
  return +[GEOMapURLBuilder URLForSearchWithQuery:centeredAt:span:](GEOMapURLBuilder, "URLForSearchWithQuery:centeredAt:span:", a3, a4.var0, a4.var1, NAN, NAN);
}

+ (id)URLForSearchWithQuery:(id)a3 centeredAt:(id)a4 span:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  double v7 = a4.var1;
  double v8 = a4.var0;
  id v9 = a3;
  id v10 = -[GEOMapURLBuilder initForSearchWithQuery:centeredAt:span:]([GEOMapURLBuilder alloc], "initForSearchWithQuery:centeredAt:span:", v9, v8, v7, var0, var1);

  id v11 = [v10 buildUniversalLink];

  return v11;
}

- (id)initForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8 span:(id)a9
{
  double var1 = a9.var1;
  double var0 = a9.var0;
  double v16 = a3.var1;
  double v17 = a3.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v32 = a3;
  $F24F406B2B787EFB06265DBA3D28CBD5 v31 = a9;
  v30.receiver = self;
  v30.super_class = (Class)GEOMapURLBuilder;
  $F24F406B2B787EFB06265DBA3D28CBD5 v18 = [(GEOMapURLBuilder *)&v30 init];
  if (v18)
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    dict = v18->_dict;
    v18->_dict = (NSMutableDictionary *)v19;

    if (v16 >= -180.0 && v16 <= 180.0 && v17 >= -90.0 && v17 <= 90.0)
    {
      id v21 = [(GEOMapURLBuilder *)v18 _stringForCoordinate2DPointer:&v32];
      [(NSMutableDictionary *)v18->_dict setObject:v21 forKeyedSubscript:@"center"];
    }
    if (a4 > 0.0)
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&a4);
      [(NSMutableDictionary *)v18->_dict setObject:v22 forKeyedSubscript:@"distance"];
    }
    if (a5 > 0.01 || a5 < -0.01)
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&a5);
      [(NSMutableDictionary *)v18->_dict setObject:v23 forKeyedSubscript:@"heading"];
    }
    if (a6 > 0.01 || a6 < -0.01)
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&a6);
      [(NSMutableDictionary *)v18->_dict setObject:v24 forKeyedSubscript:@"pitch"];
    }
    if (a8)
    {
      v25 = @"follow-with-heading";
      if (a8 != 2) {
        v25 = 0;
      }
      if (a8 == 1) {
        v26 = @"follow";
      }
      else {
        v26 = v25;
      }
      [(NSMutableDictionary *)v18->_dict setObject:v26 forKeyedSubscript:@"mode"];
    }
    if (var0 >= 0.0 && var0 <= 180.0 && var1 >= 0.0 && var1 <= 360.0)
    {
      v27 = [(GEOMapURLBuilder *)v18 _stringForCoordinateSpanPointer:&v31];
      [(NSMutableDictionary *)v18->_dict setObject:v27 forKeyedSubscript:@"span"];
    }
    objc_super v28 = _geo_urlArgumentForMapType(a7, 1);
    [(NSMutableDictionary *)v18->_dict setObject:v28 forKeyedSubscript:@"map"];

    v18->_actionType = 2;
  }
  return v18;
}

+ (id)URLForMapFrameWithCenter:(id)a3
{
  return +[GEOMapURLBuilder URLForMapFrameWithCenter:mapType:](GEOMapURLBuilder, "URLForMapFrameWithCenter:mapType:", 0, a3.var0, a3.var1);
}

+ (id)URLForMapFrameWithCenter:(id)a3 mapType:(int)a4
{
  return +[GEOMapURLBuilder URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:](GEOMapURLBuilder, "URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:", *(void *)&a4, 0, a3.var0, a3.var1, 0.0, 0.0, 0.0);
}

+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6
{
  return +[GEOMapURLBuilder URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:](GEOMapURLBuilder, "URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:", 0, 0, a3.var0, a3.var1, a4, a5, a6);
}

+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8
{
  return +[GEOMapURLBuilder URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:span:](GEOMapURLBuilder, "URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:span:", *(void *)&a7, *(void *)&a8, a3.var0, a3.var1, a4, a5, a6, NAN, NAN);
}

+ (id)URLForMapFrameWithCenter:(id)a3 distance:(double)a4 heading:(double)a5 pitch:(double)a6 mapType:(int)a7 trackingMode:(int)a8 span:(id)a9
{
  id v9 = -[GEOMapURLBuilder initForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:span:]([GEOMapURLBuilder alloc], "initForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:span:", *(void *)&a7, *(void *)&a8, a3.var0, a3.var1, a4, a5, a6, a9.var0, a9.var1);
  id v10 = [v9 buildUniversalLink];

  return v10;
}

- (id)initForDirectionsWithSource:(id)a3 destinations:(id)a4 transportType:(int)a5 directionsOptions:(id)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapURLBuilder;
  id v13 = [(GEOMapURLBuilder *)&v31 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v13->_dict;
    v13->_dict = (NSMutableDictionary *)v14;

    id v30 = v11;
    double v16 = +[GEOURLLocationQueryItem locationQueryItemsWithArray:v11];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v16 count])
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = [v16 objectAtIndexedSubscript:v18];
        if (v18 == [v16 count] - 1)
        {
          v33[0] = v19;
          unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
          id v21 = +[GEOURLLocationQueryItem serializedJsonStringFromLocationQueryItems:v20];
          [(NSMutableDictionary *)v13->_dict setObject:v21 forKeyedSubscript:@"destination"];
        }
        else
        {
          [v17 addObject:v19];
        }

        ++v18;
      }
      while (v18 < [v16 count]);
    }
    if ([v17 count])
    {
      id v22 = +[GEOURLLocationQueryItem serializedJsonStringFromLocationQueryItems:v17];
      [(NSMutableDictionary *)v13->_dict setObject:v22 forKeyedSubscript:@"waypoints"];
    }
    if (v10)
    {
      v23 = [[GEOURLLocationQueryItem alloc] initWithQueryItemValue:v10];
      $F24F406B2B787EFB06265DBA3D28CBD5 v32 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v25 = +[GEOURLLocationQueryItem serializedJsonStringFromLocationQueryItems:v24];
      [(NSMutableDictionary *)v13->_dict setObject:v25 forKeyedSubscript:@"source"];
    }
    if (a5 != 4)
    {
      v26 = _geo_urlArgumentForTransportType(a5, 1);
      [(NSMutableDictionary *)v13->_dict setObject:v26 forKeyedSubscript:@"mode"];
    }
    v27 = [v12 avoidOptionsString];
    id v11 = v30;
    if ([v27 length]) {
      [(NSMutableDictionary *)v13->_dict setObject:v27 forKeyedSubscript:@"avoid"];
    }
    objc_super v28 = [v12 transitOptionsString];
    if ([v28 length]) {
      [(NSMutableDictionary *)v13->_dict setObject:v28 forKeyedSubscript:@"transit-preferences"];
    }
    v13->_actionType = 1;
  }
  return v13;
}

+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4 transportType:(int)a5
{
  return +[GEOMapURLBuilder URLForDirectionsFromSource:a3 toDestinations:a4 transportType:*(void *)&a5 directionsOptions:0];
}

+ (id)URLForDirectionsFromSource:(id)a3 toDestination:(id)a4 transportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 arrayWithObjects:&v13 count:1];
  id v11 = +[GEOMapURLBuilder URLForDirectionsFromSource:toDestinations:transportType:directionsOptions:](GEOMapURLBuilder, "URLForDirectionsFromSource:toDestinations:transportType:directionsOptions:", v9, v10, v5, 0, v13, v14);

  return v11;
}

+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4 transportType:(int)a5 directionsOptions:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[GEOMapURLBuilder alloc] initForDirectionsWithSource:v11 destinations:v10 transportType:v6 directionsOptions:v9];

  id v13 = [v12 buildUniversalLink];

  return v13;
}

+ (id)URLForDirectionsFromSource:(id)a3 toDestinations:(id)a4
{
  return +[GEOMapURLBuilder URLForDirectionsFromSource:a3 toDestinations:a4 transportType:4];
}

+ (id)URLForDirectionsFromSource:(id)a3 toDestination:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 arrayWithObjects:&v11 count:1];
  id v9 = +[GEOMapURLBuilder URLForDirectionsFromSource:toDestinations:transportType:](GEOMapURLBuilder, "URLForDirectionsFromSource:toDestinations:transportType:", v7, v8, 4, v11, v12);

  return v9;
}

+ (id)URLForDirectionsToDestination:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[GEOMapURLBuilder URLForDirectionsToDestinations:](GEOMapURLBuilder, "URLForDirectionsToDestinations:", v5, v8, v9);

  return v6;
}

+ (id)URLForDirectionsToDestinations:(id)a3
{
  return +[GEOMapURLBuilder URLForDirectionsToDestinations:a3 transportType:4];
}

+ (id)URLForDirectionsToDestination:(id)a3 transportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v10 count:1];
  id v8 = +[GEOMapURLBuilder URLForDirectionsToDestinations:transportType:](GEOMapURLBuilder, "URLForDirectionsToDestinations:transportType:", v7, v4, v10, v11);

  return v8;
}

+ (id)URLForDirectionsToDestinations:(id)a3 transportType:(int)a4
{
  return +[GEOMapURLBuilder URLForDirectionsFromSource:0 toDestinations:a3 transportType:*(void *)&a4];
}

- (id)initForGuidesWithCollectionStorage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapURLBuilder;
  id v6 = [(GEOMapURLBuilder *)&v10 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v6->_dict;
    v6->_dict = v7;

    objc_storeStrong((id *)&v6->_collectionStorage, a3);
    [(GEOMapURLBuilder *)v6 addCodable:v5 key:@"user" compressedKey:0];
    v6->_actionType = 6;
  }

  return v6;
}

- (id)initForGuidesWithCollectionMUID:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  id v6 = [(GEOMapURLBuilder *)&v12 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v6->_dict;
    v6->_dict = v7;

    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)v6->_dict setObject:v9 forKeyedSubscript:@"curated"];

    objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    [(NSMutableDictionary *)v6->_dict setObject:v10 forKeyedSubscript:@"_provider"];

    v6->_actionType = 6;
  }
  return v6;
}

- (id)initForGuidesWithPublisherMUID:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  id v6 = [(GEOMapURLBuilder *)&v12 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v6->_dict;
    v6->_dict = v7;

    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(NSMutableDictionary *)v6->_dict setObject:v9 forKeyedSubscript:@"publisher"];

    objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    [(NSMutableDictionary *)v6->_dict setObject:v10 forKeyedSubscript:@"_provider"];

    v6->_actionType = 6;
  }
  return v6;
}

+ (id)URLForGuidesWithCollectionStorage:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMapURLBuilder alloc] initForGuidesWithCollectionStorage:v3];

  id v5 = [v4 buildUniversalLink];

  return v5;
}

+ (id)URLForGuidesWithCollectionMUID:(unint64_t)a3 provider:(int)a4
{
  id v4 = [[GEOMapURLBuilder alloc] initForGuidesWithCollectionMUID:a3 provider:*(void *)&a4];
  id v5 = [v4 buildUniversalLink];

  return v5;
}

+ (id)URLForGuidesWithPublisherMUID:(unint64_t)a3 provider:(int)a4
{
  id v4 = [[GEOMapURLBuilder alloc] initForGuidesWithPublisherMUID:a3 provider:*(void *)&a4];
  id v5 = [v4 buildUniversalLink];

  return v5;
}

- (id)initForLookAroundWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5 muninViewState:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v21 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)GEOMapURLBuilder;
  uint64_t v14 = [(GEOMapURLBuilder *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v14->_dict;
    v14->_dict = (NSMutableDictionary *)v15;

    if ([v11 hasMapsIdentifierString])
    {
      id v17 = [v11 mapsIdentifierString];
      [(NSMutableDictionary *)v14->_dict setObject:v17 forKeyedSubscript:@"place-id"];
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      unint64_t v18 = [(GEOMapURLBuilder *)v14 _stringForCoordinate2DPointer:&v21];
      [(NSMutableDictionary *)v14->_dict setObject:v18 forKeyedSubscript:@"coordinate"];
    }
    if ([v12 length]) {
      [(NSMutableDictionary *)v14->_dict setObject:v12 forKeyedSubscript:@"address"];
    }
    if (v13)
    {
      objc_storeStrong((id *)&v14->_muninViewState, a6);
      [(GEOMapURLBuilder *)v14 addCodable:v13 key:@"_mvs" compressedKey:@"_mvsc"];
    }
    v14->_actionType = 5;
  }

  return v14;
}

+ (id)URLForLookAroundWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5 muninViewState:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = -[GEOMapURLBuilder initForLookAroundWithMapItemIdentifier:coordinate:address:muninViewState:]([GEOMapURLBuilder alloc], "initForLookAroundWithMapItemIdentifier:coordinate:address:muninViewState:", v12, v11, v10, var0, var1);

  uint64_t v14 = [v13 buildUniversalLink];

  return v14;
}

- (id)initForForReportAProblemWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v19 = a4;
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapURLBuilder;
  id v11 = [(GEOMapURLBuilder *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v9;
      if ([v14 hasMapsIdentifierString])
      {
        uint64_t v15 = [v14 mapsIdentifierString];
        [(NSMutableDictionary *)v11->_dict setObject:v15 forKeyedSubscript:@"place-id"];
      }
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      double v16 = [(GEOMapURLBuilder *)v11 _stringForCoordinate2DPointer:&v19];
      [(NSMutableDictionary *)v11->_dict setObject:v16 forKeyedSubscript:@"coordinate"];
    }
    if ([v10 length]) {
      [(NSMutableDictionary *)v11->_dict setObject:v10 forKeyedSubscript:@"address"];
    }
    v11->_actionType = 7;
  }

  return v11;
}

+ (id)URLForReportAProblemWithMapItemIdentifier:(id)a3 coordinate:(id)a4 address:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[GEOMapURLBuilder initForForReportAProblemWithMapItemIdentifier:coordinate:address:]([GEOMapURLBuilder alloc], "initForForReportAProblemWithMapItemIdentifier:coordinate:address:", v9, v8, var0, var1);

  id v11 = [v10 buildUniversalLink];

  return v11;
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (GEOURLExtraStorage)extraStorage
{
  return self->_extraStorage;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (void)setEnrichmentInfo:(id)a3
{
}

@end