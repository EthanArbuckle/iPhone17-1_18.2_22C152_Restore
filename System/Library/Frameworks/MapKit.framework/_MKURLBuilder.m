@interface _MKURLBuilder
+ (id)URLForAddress:(id)a3;
+ (id)URLForAddress:(id)a3 label:(id)a4;
+ (id)URLForCollectionStorage:(id)a3;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 useWebPlaceCard:(BOOL)a6;
+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4;
+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4;
+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(unint64_t)a5;
+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4;
+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(unint64_t)a5;
+ (id)URLForDirectionsFromHereTo:(id)a3;
+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(unint64_t)a7;
+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(unint64_t)a4;
+ (id)URLForDirectionsFromHereToDestinations:(id)a3;
+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(unint64_t)a4;
+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8;
+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8 mapItemData:(id)a9;
+ (id)URLForSearch:(id)a3;
+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 span:(id)a5;
+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5;
+ (id)URLForSearch:(id)a3 near:(CLLocationCoordinate2D)a4;
- (id)build;
- (id)buildForWeb;
- (id)initForAddress:(id)a3 label:(id)a4;
- (id)initForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5;
- (id)initForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4;
- (id)initForDirectionsTo:(id)a3;
- (id)initForDirectionsToAddresses:(id)a3;
- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5;
- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5;
- (id)initForSearch:(id)a3;
- (void)setBusinessAddress:(id)a3;
- (void)setBusinessCoordinate:(CLLocationCoordinate2D)a3;
- (void)setContentProvider:(id)a3;
- (void)setDestinationLabel:(id)a3;
- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4;
- (void)setDisplayRegion:(id *)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setNear:(CLLocationCoordinate2D)a3;
- (void)setSearchLocation:(CLLocationCoordinate2D)a3 span:(id)a4;
- (void)setSearchLocation:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4;
- (void)setStartAddress:(id)a3;
- (void)setTransportType:(unint64_t)a3;
@end

@implementation _MKURLBuilder

+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 span:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForSearch:at:span:", a3, a4.latitude, a4.longitude, a5.var0, a5.var1);
}

- (id)initForSearch:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = [(_MKURLBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F64720]) initForSearch:v4];
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;
  }
  return v5;
}

- (void)setNear:(CLLocationCoordinate2D)a3
{
}

- (void)setSearchLocation:(CLLocationCoordinate2D)a3 span:(id)a4
{
}

- (void)setSearchLocation:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4
{
}

+ (id)URLForSearch:(id)a3
{
  return (id)[MEMORY[0x1E4F64720] URLForSearch:a3];
}

+ (id)URLForSearch:(id)a3 near:(CLLocationCoordinate2D)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForSearch:near:", a3, a4.latitude, a4.longitude);
}

+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForSearch:at:zoomLevel:", a3, a4.latitude, a4.longitude, a5);
}

- (id)initForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKURLBuilder;
  v11 = [(_MKURLBuilder *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64720]), "initForCoordinate:address:label:", v9, v10, latitude, longitude);
    realBuilder = v11->_realBuilder;
    v11->_realBuilder = (GEOMapURLBuilder *)v12;
  }
  return v11;
}

- (id)initForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MKURLBuilder;
  v8 = [(_MKURLBuilder *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64720]), "initForCoordinate:label:", v7, latitude, longitude);
    realBuilder = v8->_realBuilder;
    v8->_realBuilder = (GEOMapURLBuilder *)v9;
  }
  return v8;
}

- (id)initForAddress:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MKURLBuilder;
  v8 = [(_MKURLBuilder *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F64720]) initForAddress:v6 label:v7];
    realBuilder = v8->_realBuilder;
    v8->_realBuilder = (GEOMapURLBuilder *)v9;
  }
  return v8;
}

+ (id)URLForAddress:(id)a3
{
  return (id)[MEMORY[0x1E4F64720] URLForAddress:a3];
}

- (void)setDisplayRegion:(id *)a3
{
}

+ (id)URLForAddress:(id)a3 label:(id)a4
{
  return (id)[MEMORY[0x1E4F64720] URLForAddress:a3 label:a4];
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:", a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:label:", a4, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:address:label:", a4, a5, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 useWebPlaceCard:(BOOL)a6
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, 0, a6, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, a6, 0, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, a6, a7, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", a4, a5, a6, a7, a8, a3.latitude, a3.longitude);
}

- (id)initForDirectionsTo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = [(_MKURLBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F64720]) initForDirectionsTo:v4];
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;
  }
  return v5;
}

- (id)initForDirectionsToAddresses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = [(_MKURLBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F64720]) initForDirectionsToAddresses:v4];
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;
  }
  return v5;
}

- (void)setStartAddress:(id)a3
{
}

- (void)setTransportType:(unint64_t)a3
{
  realBuilder = self->_realBuilder;
  if (a3 - 1 > 7) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = dword_18BD1B8D8[a3 - 1];
  }
  [(GEOMapURLBuilder *)realBuilder setTransportType:v4];
}

- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4
{
}

- (void)setDestinationLabel:(id)a3
{
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFrom:a3 to:a4];
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4
{
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFrom:a3 toDestinations:a4];
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(unint64_t)a5
{
  if (a5 - 1 > 7) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = dword_18BD1B8D8[a5 - 1];
  }
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFrom:a3 to:a4 transport:v5];
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(unint64_t)a5
{
  if (a5 - 1 > 7) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = dword_18BD1B8D8[a5 - 1];
  }
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFrom:a3 toDestinations:a4 transport:v5];
}

+ (id)URLForDirectionsFromHereTo:(id)a3
{
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFromHereTo:a3];
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3
{
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFromHereToDestinations:a3];
}

+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(unint64_t)a4
{
  if (a4 - 1 > 7) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = dword_18BD1B8D8[a4 - 1];
  }
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFromHereTo:a3 transport:v4];
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(unint64_t)a4
{
  if (a4 - 1 > 7) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = dword_18BD1B8D8[a4 - 1];
  }
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFromHereToDestinations:a3 transport:v4];
}

+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(unint64_t)a7
{
  if (a7 - 1 > 7) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = dword_18BD1B8D8[a7 - 1];
  }
  return (id)[MEMORY[0x1E4F64720] URLForDirectionsFromHereTo:a3 label:a4 muid:a5 provider:*(void *)&a6 transport:v7];
}

- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKURLBuilder;
  objc_super v9 = [(_MKURLBuilder *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F64720]) initForInternalBusiness:v8 id:a4 provider:v5];
    realBuilder = v9->_realBuilder;
    v9->_realBuilder = (GEOMapURLBuilder *)v10;
  }
  return v9;
}

- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKURLBuilder;
  v11 = [(_MKURLBuilder *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F64720]) initForExternalBusiness:v8 id:v9 ofContentProvider:v10];
    realBuilder = v11->_realBuilder;
    v11->_realBuilder = (GEOMapURLBuilder *)v12;
  }
  return v11;
}

- (void)setBusinessCoordinate:(CLLocationCoordinate2D)a3
{
}

- (void)setBusinessAddress:(id)a3
{
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  return (id)[MEMORY[0x1E4F64720] URLForInternalBusiness:a3 id:a4 provider:*(void *)&a5];
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForInternalBusiness:id:provider:coordinate:address:", a3, a4, *(void *)&a5, a7, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(void *)&a5, a7, a8, 0, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(void *)&a5, a7, a8, a9, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10
{
  return (id)[MEMORY[0x1E4F64720] URLForInternalBusiness:a3 id:a4 provider:*(void *)&a5 coordinate:a7 address:a8 extraStorage:a9 useWebPlaceCard:a6.latitude muninViewState:a6.longitude];
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10
{
  return (id)[MEMORY[0x1E4F64720] URLForInternalBusiness:a3 id:a4 provider:*(void *)&a5 coordinate:a7 address:a8 extraStorage:a9 useWebPlaceCard:a6.latitude enrichmentInfo:a6.longitude];
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(void *)&a5, a7, 0, a8, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8 mapItemData:(id)a9
{
  return (id)objc_msgSend(MEMORY[0x1E4F64720], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(void *)&a5, a7, 0, a8, a6.latitude, a6.longitude);
}

+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  return (id)[MEMORY[0x1E4F64720] URLForExternalBusiness:a3 id:a4 ofContentProvider:a5];
}

+ (id)URLForCollectionStorage:(id)a3
{
  return (id)[MEMORY[0x1E4F64720] URLForCollectionStorage:a3];
}

- (id)build
{
  return (id)[(GEOMapURLBuilder *)self->_realBuilder build];
}

- (id)buildForWeb
{
  return (id)[(GEOMapURLBuilder *)self->_realBuilder buildForWeb];
}

- (void)setMapType:(unint64_t)a3
{
  realBuilder = self->_realBuilder;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      uint64_t v4 = 1;
      break;
    case 2uLL:
    case 4uLL:
      uint64_t v4 = 2;
      break;
    default:
      if (a3 == 108) {
        unsigned int v5 = 4;
      }
      else {
        unsigned int v5 = 0;
      }
      if (a3 == 104) {
        uint64_t v4 = 3;
      }
      else {
        uint64_t v4 = v5;
      }
      break;
  }
  [(GEOMapURLBuilder *)realBuilder setMapType:v4];
}

- (void)setContentProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end