@interface DCMapsLink
+ ($5DAFA5872F15DB93AA0534C5CA46C53E)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4 atZoomLevel:(CLLocationCoordinate2D)a5;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4 atZoomLevel:(int64_t)a5;
+ (BOOL)isMapsURL:(id)a3;
+ (DCMapsLink)mapsLinkWithURL:(id)a3;
+ (double)latitudeToPixelSpaceY:(double)a3;
+ (double)longitudeToPixelSpaceX:(double)a3;
+ (double)pixelSpaceXToLongitude:(double)a3;
+ (double)pixelSpaceYToLatitude:(double)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (void)createMapsLinkWithPlacemark:(id)a3 location:(id)a4 streetAddress:(id)a5 shiftingLocationIfNecessary:(BOOL)a6 completionHandler:(id)a7;
+ (void)processLocation:(id)a3 shiftingIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- ($BA53C1BB0937E3E485E38CF18850CA32)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4;
- (BOOL)canGetDirections;
- (BOOL)showsBicycling;
- (BOOL)showsStreetView;
- (BOOL)showsTraffic;
- (BOOL)showsTransit;
- (CLLocationCoordinate2D)centerCoordinate;
- (CLLocationCoordinate2D)centerLocationCoordinate;
- (CLLocationCoordinate2D)locationCoordinateFromString:(id)a3;
- (CLLocationCoordinate2D)searchLocationCoordinate;
- (CLLocationCoordinate2D)streetViewLocationCoordinate;
- (NSString)centerLocation;
- (NSString)description;
- (NSString)destinationAddress;
- (NSString)mkDirectionsMode;
- (NSString)searchLocation;
- (NSString)searchNearQuery;
- (NSString)searchQuery;
- (NSString)startAddress;
- (NSString)streetViewLocation;
- (NSString)wfName;
- (id)baiduMapsAppURL;
- (id)googleMapsAppURL;
- (id)mapsAppURL;
- (id)region;
- (id)regionCenteredAtLocation:(CLLocationCoordinate2D)a3;
- (id)transitAppURL;
- (id)wazeAppURL;
- (id)wfSerializedRepresentation;
- (int64_t)zoomLevel;
- (unint64_t)directionsMode;
- (unint64_t)directionsTransportType;
- (unint64_t)mapType;
- (unint64_t)mkMapType;
- (void)geocodeAddressString:(id)a3 inRegionIfAvailable:(id)a4 completionHandler:(id)a5;
- (void)geocodeDirectionsEndpointsWithCompletionHandler:(id)a3;
- (void)getAppleMapsDirectionsURL:(id)a3;
- (void)getCitymapperAppURL:(id)a3;
- (void)getDirectionsToPlacemark:(id)a3 fromPlacemark:(id)a4 withCompletionHandler:(id)a5;
- (void)getDirectionsToPlacemark:(id)a3 withCompletionHandler:(id)a4;
- (void)getDirectionsWithCompletionHandler:(id)a3;
@end

@implementation DCMapsLink

- (void)geocodeDirectionsEndpointsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DCMapsLink *)self region];
  v6 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__4179;
  v31[4] = __Block_byref_object_dispose__4180;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__4179;
  v29[4] = __Block_byref_object_dispose__4180;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__4179;
  v27[4] = __Block_byref_object_dispose__4180;
  id v28 = 0;
  v7 = [(DCMapsLink *)self startAddress];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    dispatch_group_enter(v6);
    v9 = [(DCMapsLink *)self startAddress];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke;
    v23[3] = &unk_2642865C0;
    v25 = v31;
    v26 = v27;
    v24 = v6;
    [(DCMapsLink *)self geocodeAddressString:v9 inRegionIfAvailable:v5 completionHandler:v23];
  }
  dispatch_group_enter(v6);
  v10 = [(DCMapsLink *)self destinationAddress];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_2642865C0;
  v21 = v29;
  v22 = v27;
  v11 = v6;
  v20 = v11;
  [(DCMapsLink *)self geocodeAddressString:v10 inRegionIfAvailable:v5 completionHandler:v19];

  v12 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_2642865E8;
  id v15 = v4;
  v16 = v31;
  v17 = v29;
  v18 = v27;
  id v13 = v4;
  dispatch_group_notify(v11, v12, v14);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

void __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
}

- (void)geocodeAddressString:(id)a3 inRegionIfAvailable:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v10 = (void *)getCLGeocoderClass_softClass;
  uint64_t v17 = getCLGeocoderClass_softClass;
  if (!getCLGeocoderClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getCLGeocoderClass_block_invoke;
    v13[3] = &unk_26428AC60;
    v13[4] = &v14;
    __getCLGeocoderClass_block_invoke((uint64_t)v13);
    v10 = (void *)v15[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);
  v12 = objc_opt_new();
  [v12 geocodeAddressString:v7 inRegion:v8 completionHandler:v9];
}

- (id)region
{
  [(DCMapsLink *)self centerCoordinate];
  return -[DCMapsLink regionCenteredAtLocation:](self, "regionCenteredAtLocation:");
}

- (id)regionCenteredAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v6 = (unsigned int (*)(double, double))getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  id v30 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  if (!getCLLocationCoordinate2DIsValidSymbolLoc_ptr)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __getCLLocationCoordinate2DIsValidSymbolLoc_block_invoke;
    v25 = &unk_26428AC60;
    v26 = &v27;
    id v7 = CoreLocationLibrary_4183();
    v28[3] = (uint64_t)dlsym(v7, "CLLocationCoordinate2DIsValid");
    getCLLocationCoordinate2DIsValidSymbolLoc_ptr = *(_UNKNOWN **)(v26[1] + 24);
    uint64_t v6 = (unsigned int (*)(double, double))v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v6)
  {
    if (v6(latitude, longitude))
    {
      -[DCMapsLink coordinateSpanForMapSize:centeredAtLocation:](self, "coordinateSpanForMapSize:centeredAtLocation:", 256.0, 256.0, latitude, longitude);
      double v9 = latitude - v8;
      double v11 = longitude - v10;
      v12 = (void *)[objc_alloc((Class)getCLLocationClass()) initWithLatitude:latitude longitude:longitude];
      id v13 = (void *)[objc_alloc((Class)getCLLocationClass()) initWithLatitude:v9 longitude:v11];
      [v13 distanceFromLocation:v12];
      double v15 = v14;
      uint64_t v27 = 0;
      id v28 = &v27;
      uint64_t v29 = 0x2050000000;
      uint64_t v16 = (void *)getCLCircularRegionClass_softClass_4200;
      id v30 = (void *)getCLCircularRegionClass_softClass_4200;
      if (!getCLCircularRegionClass_softClass_4200)
      {
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        v24 = __getCLCircularRegionClass_block_invoke_4201;
        v25 = &unk_26428AC60;
        v26 = &v27;
        __getCLCircularRegionClass_block_invoke_4201((uint64_t)&v22);
        uint64_t v16 = (void *)v28[3];
      }
      uint64_t v17 = v16;
      _Block_object_dispose(&v27, 8);
      v18 = objc_msgSend([v17 alloc], "initWithCenter:radius:identifier:", @"Region", latitude, longitude, v15);
    }
    else
    {
      v18 = 0;
    }
    return v18;
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    v21 = [NSString stringWithUTF8String:"BOOL WFCLLocationCoordinate2DIsValid(CLLocationCoordinate2D)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"DCMapsLink+CLGeocoding.m", 18, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)wfSerializedRepresentation
{
  v28[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(DCMapsLink *)self searchQuery];

  if (v4)
  {
    v5 = [(DCMapsLink *)self searchQuery];
    [v3 setObject:v5 forKey:@"searchQuery"];
  }
  uint64_t v6 = [(DCMapsLink *)self searchNearQuery];

  if (v6)
  {
    id v7 = [(DCMapsLink *)self searchNearQuery];
    [v3 setObject:v7 forKey:@"searchNearQuery"];
  }
  double v8 = [(DCMapsLink *)self searchLocation];

  if (v8)
  {
    double v9 = [(DCMapsLink *)self searchLocation];
    [v3 setObject:v9 forKey:@"searchLocation"];
  }
  double v10 = [(DCMapsLink *)self startAddress];

  if (v10)
  {
    double v11 = [(DCMapsLink *)self startAddress];
    [v3 setObject:v11 forKey:@"startAddress"];
  }
  v12 = [(DCMapsLink *)self destinationAddress];

  if (v12)
  {
    id v13 = [(DCMapsLink *)self destinationAddress];
    [v3 setObject:v13 forKey:@"destinationAddress"];
  }
  double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DCMapsLink directionsMode](self, "directionsMode"));
  [v3 setObject:v14 forKey:@"directionsMode"];

  double v15 = [(DCMapsLink *)self centerLocation];

  if (v15)
  {
    uint64_t v16 = [(DCMapsLink *)self centerLocation];
    [v3 setObject:v16 forKey:@"centerLocation"];
  }
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[DCMapsLink zoomLevel](self, "zoomLevel"));
  [v3 setObject:v17 forKey:@"zoomLevel"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DCMapsLink mapType](self, "mapType"));
  [v3 setObject:v18 forKey:@"mapType"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[DCMapsLink showsTraffic](self, "showsTraffic"));
  [v3 setObject:v19 forKey:@"showsTraffic"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[DCMapsLink showsTransit](self, "showsTransit"));
  [v3 setObject:v20 forKey:@"showsTransit"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[DCMapsLink showsStreetView](self, "showsStreetView"));
  [v3 setObject:v21 forKey:@"showsStreetView"];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[DCMapsLink showsBicycling](self, "showsBicycling"));
  [v3 setObject:v22 forKey:@"showsBicycling"];

  uint64_t v23 = [(DCMapsLink *)self streetViewLocation];

  if (v23)
  {
    v24 = [(DCMapsLink *)self streetViewLocation];
    [v3 setObject:v24 forKey:@"streetViewLocation"];
  }
  uint64_t v27 = @"link.contentkit.dcmapslink";
  v28[0] = v3;
  v25 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];

  return v25;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.dcmapslink"];

  v5 = objc_opt_new();
  uint64_t v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"searchQuery"];
  [v5 setSearchQuery:v6];

  id v7 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"searchNearQuery"];
  [v5 setSearchNearQuery:v7];

  double v8 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"searchLocation"];
  [v5 setSearchLocation:v8];

  double v9 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"startAddress"];
  [v5 setStartAddress:v9];

  double v10 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"destinationAddress"];
  [v5 setDestinationAddress:v10];

  double v11 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"directionsMode"];
  objc_msgSend(v5, "setDirectionsMode:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"centerLocation"];
  [v5 setCenterLocation:v12];

  id v13 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"zoomLevel"];
  objc_msgSend(v5, "setZoomLevel:", objc_msgSend(v13, "integerValue"));

  double v14 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"mapType"];
  objc_msgSend(v5, "setMapType:", objc_msgSend(v14, "unsignedIntegerValue"));

  double v15 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"showsTraffic"];
  objc_msgSend(v5, "setShowsTraffic:", objc_msgSend(v15, "BOOLValue"));

  uint64_t v16 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"showsTransit"];
  objc_msgSend(v5, "setShowsTransit:", objc_msgSend(v16, "BOOLValue"));

  uint64_t v17 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"showsStreetView"];
  objc_msgSend(v5, "setShowsStreetView:", objc_msgSend(v17, "BOOLValue"));

  v18 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"showsBicycling"];
  objc_msgSend(v5, "setShowsBicycling:", objc_msgSend(v18, "BOOLValue"));

  v19 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"streetViewLocation"];
  [v5 setStreetViewLocation:v19];

  return v5;
}

- (NSString)wfName
{
  id v3 = WFLocalizedString(@"Unknown Maps Link");
  if (![(DCMapsLink *)self directionsMode])
  {
    v12 = [(DCMapsLink *)self searchQuery];
    if (v12) {
      goto LABEL_8;
    }
    uint64_t v13 = [(DCMapsLink *)self searchNearQuery];
LABEL_10:
    double v14 = (void *)v13;
    if (v13) {
      double v15 = (void *)v13;
    }
    else {
      double v15 = v3;
    }
    id v11 = v15;

    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = [(DCMapsLink *)self startAddress];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(DCMapsLink *)self destinationAddress];

    if (v6)
    {
      id v7 = NSString;
      WFLocalizedString(@"Directions from %@ to %@");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      double v9 = [(DCMapsLink *)self startAddress];
      double v10 = [(DCMapsLink *)self destinationAddress];
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
  v12 = [(DCMapsLink *)self startAddress];
  if (!v12)
  {
    uint64_t v13 = [(DCMapsLink *)self destinationAddress];
    goto LABEL_10;
  }
LABEL_8:
  id v8 = v12;
  id v11 = v8;
LABEL_14:

  return (NSString *)v11;
}

- (void)getAppleMapsDirectionsURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  if ([(DCMapsLink *)self mapType])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DCMapsLink mkMapType](self, "mkMapType"));
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    id v7 = (void *)getMKLaunchOptionsMapTypeKeySymbolLoc_ptr;
    v38 = (void *)getMKLaunchOptionsMapTypeKeySymbolLoc_ptr;
    if (!getMKLaunchOptionsMapTypeKeySymbolLoc_ptr)
    {
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      id v32 = __getMKLaunchOptionsMapTypeKeySymbolLoc_block_invoke;
      v33 = &unk_26428AC60;
      v34 = &v35;
      id v8 = MapKitLibrary_8993();
      v36[3] = (uint64_t)dlsym(v8, "MKLaunchOptionsMapTypeKey");
      getMKLaunchOptionsMapTypeKeySymbolLoc_ptr = *(void *)(v34[1] + 24);
      id v7 = (void *)v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (!v7)
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsMapTypeKey(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"DCMapsLink+MKDirections.m", 31, @"%s", dlerror());
      goto LABEL_28;
    }
    [v5 setObject:v6 forKey:*v7];
  }
  if ([(DCMapsLink *)self showsTraffic])
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    double v9 = (void *)getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr;
    v38 = (void *)getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr;
    if (!getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr)
    {
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      id v32 = __getMKLaunchOptionsShowsTrafficKeySymbolLoc_block_invoke;
      v33 = &unk_26428AC60;
      v34 = &v35;
      double v10 = MapKitLibrary_8993();
      v36[3] = (uint64_t)dlsym(v10, "MKLaunchOptionsShowsTrafficKey");
      getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr = *(void *)(v34[1] + 24);
      double v9 = (void *)v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (!v9)
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsShowsTrafficKey(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"DCMapsLink+MKDirections.m", 32, @"%s", dlerror());
      goto LABEL_28;
    }
    [v5 setObject:MEMORY[0x263EFFA88] forKey:*v9];
  }
  id v11 = [(DCMapsLink *)self mkDirectionsMode];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  v12 = (void *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  v38 = (void *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr)
  {
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    id v32 = __getMKLaunchOptionsDirectionsModeKeySymbolLoc_block_invoke;
    v33 = &unk_26428AC60;
    v34 = &v35;
    uint64_t v13 = MapKitLibrary_8993();
    v36[3] = (uint64_t)dlsym(v13, "MKLaunchOptionsDirectionsModeKey");
    getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr = *(void *)(v34[1] + 24);
    v12 = (void *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (v12)
  {
    [v5 setObject:v11 forKey:*v12];

    [(DCMapsLink *)self centerCoordinate];
    double v15 = v14;
    double v17 = v16;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    v18 = (unsigned int (*)(double, double))getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8999;
    v38 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8999;
    if (!getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8999)
    {
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      id v32 = __getCLLocationCoordinate2DIsValidSymbolLoc_block_invoke_9000;
      v33 = &unk_26428AC60;
      v34 = &v35;
      __getCLLocationCoordinate2DIsValidSymbolLoc_block_invoke_9000(&v30);
      v18 = (unsigned int (*)(double, double))v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (v18)
    {
      if (!v18(v15, v17))
      {
LABEL_22:
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __54__DCMapsLink_MKDirections__getAppleMapsDirectionsURL___block_invoke;
        v27[3] = &unk_264287708;
        id v28 = v5;
        id v29 = v4;
        v27[4] = self;
        id v23 = v5;
        id v24 = v4;
        [(DCMapsLink *)self geocodeDirectionsEndpointsWithCompletionHandler:v27];

        return;
      }
      v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithMKCoordinate:", v15, v17);
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      v20 = (void *)getMKLaunchOptionsMapCenterKeySymbolLoc_ptr;
      v38 = (void *)getMKLaunchOptionsMapCenterKeySymbolLoc_ptr;
      if (!getMKLaunchOptionsMapCenterKeySymbolLoc_ptr)
      {
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        id v32 = __getMKLaunchOptionsMapCenterKeySymbolLoc_block_invoke;
        v33 = &unk_26428AC60;
        v34 = &v35;
        v21 = MapKitLibrary_8993();
        uint64_t v22 = dlsym(v21, "MKLaunchOptionsMapCenterKey");
        *(void *)(v34[1] + 24) = v22;
        getMKLaunchOptionsMapCenterKeySymbolLoc_ptr = *(void *)(v34[1] + 24);
        v20 = (void *)v36[3];
      }
      _Block_object_dispose(&v35, 8);
      if (v20)
      {
        [v5 setObject:v19 forKey:*v20];

        goto LABEL_22;
      }
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsMapCenterKey(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"DCMapsLink+MKDirections.m", 34, @"%s", dlerror());
    }
    else
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = [NSString stringWithUTF8String:"BOOL WFCLLocationCoordinate2DIsValid(CLLocationCoordinate2D)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"DCMapsLink+MKDirections.m", 40, @"%s", dlerror());
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    v26 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeKey(void)"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"DCMapsLink+MKDirections.m", 33, @"%s", dlerror());
  }
LABEL_28:

  __break(1u);
}

void __54__DCMapsLink_MKDirections__getAppleMapsDirectionsURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    if (v16)
    {
      id v7 = objc_alloc((Class)getMKMapItemClass_9004());
      id v8 = (void *)[objc_alloc((Class)getMKPlacemarkClass()) initWithPlacemark:v16];
      double v9 = (void *)[v7 initWithPlacemark:v8];
      [v6 addObject:v9];
    }
    id v10 = objc_alloc((Class)getMKMapItemClass_9004());
    id v11 = (void *)[objc_alloc((Class)getMKPlacemarkClass()) initWithPlacemark:v5];
    v12 = (void *)[v10 initWithPlacemark:v11];
    [v6 addObject:v12];

    uint64_t v13 = *(void *)(a1 + 48);
    double v14 = [getMKMapItemClass_9004() urlForMapItems:v6 options:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 32) mapsAppURL];
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v6, 0);
  }
}

- (NSString)mkDirectionsMode
{
  switch([(DCMapsLink *)self directionsMode])
  {
    case 1uLL:
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v2 = (void **)getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
      uint64_t v19 = getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        double v14 = __getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_block_invoke;
        uint64_t v15 = &unk_26428AC60;
        id v3 = MapKitLibrary_8993();
        v17[3] = (uint64_t)dlsym(v3, "MKLaunchOptionsDirectionsModeDriving");
        getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr = v17[3];
        v2 = (void **)v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v2) {
        goto LABEL_21;
      }
      id v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeDriving(void)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+MKDirections.m", 27, @"%s", dlerror(), v12, v13, v14, v15);
      goto LABEL_25;
    case 2uLL:
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v2 = (void **)getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr;
      uint64_t v19 = getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        double v14 = __getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_block_invoke;
        uint64_t v15 = &unk_26428AC60;
        id v7 = MapKitLibrary_8993();
        v17[3] = (uint64_t)dlsym(v7, "MKLaunchOptionsDirectionsModeCycling");
        getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr = v17[3];
        v2 = (void **)v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v2) {
        goto LABEL_21;
      }
      id v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeCycling(void)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+MKDirections.m", 28, @"%s", dlerror(), v12, v13, v14, v15);
      goto LABEL_25;
    case 3uLL:
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v2 = (void **)getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr;
      uint64_t v19 = getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        double v14 = __getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_block_invoke;
        uint64_t v15 = &unk_26428AC60;
        id v8 = MapKitLibrary_8993();
        v17[3] = (uint64_t)dlsym(v8, "MKLaunchOptionsDirectionsModeWalking");
        getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr = v17[3];
        v2 = (void **)v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v2) {
        goto LABEL_21;
      }
      id v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeWalking(void)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+MKDirections.m", 25, @"%s", dlerror(), v12, v13, v14, v15);
      goto LABEL_25;
    case 4uLL:
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v2 = (void **)getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr;
      uint64_t v19 = getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        double v14 = __getMKLaunchOptionsDirectionsModeTransitSymbolLoc_block_invoke;
        uint64_t v15 = &unk_26428AC60;
        double v9 = MapKitLibrary_8993();
        v17[3] = (uint64_t)dlsym(v9, "MKLaunchOptionsDirectionsModeTransit");
        getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr = v17[3];
        v2 = (void **)v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v2) {
        goto LABEL_21;
      }
      id v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeTransit(void)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+MKDirections.m", 26, @"%s", dlerror(), v12, v13, v14, v15);
      goto LABEL_25;
    default:
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v2 = (void **)getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr;
      uint64_t v19 = getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        double v14 = __getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_block_invoke;
        uint64_t v15 = &unk_26428AC60;
        uint64_t v6 = MapKitLibrary_8993();
        v17[3] = (uint64_t)dlsym(v6, "MKLaunchOptionsDirectionsModeDefault");
        getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr = v17[3];
        v2 = (void **)v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v2)
      {
LABEL_21:
        id v10 = *v2;
        return (NSString *)v10;
      }
      else
      {
        id v4 = [MEMORY[0x263F08690] currentHandler];
        id v5 = [NSString stringWithUTF8String:"NSString *getMKLaunchOptionsDirectionsModeDefault(void)"];
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+MKDirections.m", 29, @"%s", dlerror(), v12, v13, v14, v15);
LABEL_25:

        __break(1u);
      }
      return result;
  }
}

- (unint64_t)directionsTransportType
{
  unint64_t v2 = [(DCMapsLink *)self directionsMode];
  if (v2 - 1 > 3) {
    return 0xFFFFFFFLL;
  }
  else {
    return qword_216612A18[v2 - 1];
  }
}

- (void)getDirectionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__DCMapsLink_MKDirections__getDirectionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_2642876E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DCMapsLink *)self geocodeDirectionsEndpointsWithCompletionHandler:v6];
}

uint64_t __63__DCMapsLink_MKDirections__getDirectionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(a1 + 32) getDirectionsToPlacemark:a3 fromPlacemark:a2 withCompletionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getDirectionsToPlacemark:(id)a3 fromPlacemark:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (v9) {
    id v11 = (void *)[objc_alloc((Class)getMKPlacemarkClass()) initWithPlacemark:v9];
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = (void *)[objc_alloc((Class)getMKPlacemarkClass()) initWithPlacemark:v8];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  uint64_t v13 = (void *)getMKDirectionsRequestClass_softClass;
  uint64_t v31 = getMKDirectionsRequestClass_softClass;
  if (!getMKDirectionsRequestClass_softClass)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getMKDirectionsRequestClass_block_invoke;
    v26 = &unk_26428AC60;
    uint64_t v27 = &v28;
    __getMKDirectionsRequestClass_block_invoke((uint64_t)&v23);
    uint64_t v13 = (void *)v29[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v28, 8);
  uint64_t v15 = objc_opt_new();
  MKMapItemClass_9004 = (objc_class *)getMKMapItemClass_9004();
  if (v11)
  {
    uint64_t v17 = [[MKMapItemClass_9004 alloc] initWithPlacemark:v11];
  }
  else
  {
    uint64_t v17 = [(objc_class *)MKMapItemClass_9004 mapItemForCurrentLocation];
  }
  uint64_t v18 = (void *)v17;
  [v15 setSource:v17];

  uint64_t v19 = (void *)[objc_alloc((Class)getMKMapItemClass_9004()) initWithPlacemark:v12];
  [v15 setDestination:v19];

  objc_msgSend(v15, "setTransportType:", -[DCMapsLink directionsTransportType](self, "directionsTransportType"));
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v20 = (void *)getMKDirectionsClass_softClass;
  uint64_t v31 = getMKDirectionsClass_softClass;
  if (!getMKDirectionsClass_softClass)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getMKDirectionsClass_block_invoke;
    v26 = &unk_26428AC60;
    uint64_t v27 = &v28;
    __getMKDirectionsClass_block_invoke((uint64_t)&v23);
    v20 = (void *)v29[3];
  }
  v21 = v20;
  _Block_object_dispose(&v28, 8);
  uint64_t v22 = (void *)[[v21 alloc] initWithRequest:v15];
  v10[2](v10, v22, 0);
}

- (void)getDirectionsToPlacemark:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)canGetDirections
{
  id v3 = [(DCMapsLink *)self startAddress];
  if ([v3 length])
  {
    id v4 = [(DCMapsLink *)self destinationAddress];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (void)createMapsLinkWithPlacemark:(id)a3 location:(id)a4 streetAddress:(id)a5 shiftingLocationIfNecessary:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v15 && !v13 && !v14)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"DCMapsLink+WFLocationCoercions.m", 32, @"Invalid parameter not satisfying: %@", @"placemark || location || streetAddress" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v14)
  {
LABEL_5:
    id v14 = [v13 location];
  }
  if (v13 && !v15)
  {
    id v15 = +[WFStreetAddress streetAddressWithPlacemark:v13 label:0];
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __132__DCMapsLink_WFLocationCoercions__createMapsLinkWithPlacemark_location_streetAddress_shiftingLocationIfNecessary_completionHandler___block_invoke;
  v20[3] = &unk_264288490;
  id v21 = v15;
  id v22 = v16;
  id v17 = v16;
  id v18 = v15;
  [a1 processLocation:v14 shiftingIfNecessary:v8 completionHandler:v20];
}

void __132__DCMapsLink_WFLocationCoercions__createMapsLinkWithPlacemark_location_streetAddress_shiftingLocationIfNecessary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc_init(DCMutableMapsLink);
  if (v11)
  {
    id v4 = NSString;
    [v11 coordinate];
    uint64_t v6 = v5;
    [v11 coordinate];
    BOOL v8 = objc_msgSend(v4, "stringWithFormat:", @"%f,%f", v6, v7);
    [(DCMutableMapsLink *)v3 setCenterLocation:v8];
  }
  id v9 = [*(id *)(a1 + 32) addressString];
  if (v9)
  {
    [(DCMutableMapsLink *)v3 setSearchQuery:v9];
  }
  else
  {
    id v10 = [(DCMutableMapsLink *)v3 centerLocation];
    [(DCMutableMapsLink *)v3 setSearchQuery:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)processLocation:(id)a3 shiftingIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  uint64_t v7 = (void (**)(id, id))a5;
  id MKLocationShifterClass = get_MKLocationShifterClass();
  if (v6
    && (id v9 = MKLocationShifterClass) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v9 instancesRespondToSelector:sel_shiftLocation_withCompletionHandler_callbackQueue_]&& (objc_msgSend(v9, "isLocationShiftRequiredForLocation:", v13) & 1) != 0)
  {
    get_MKLocationShifterClass();
    id v10 = objc_opt_new();
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      id v11 = (void *)MEMORY[0x263EF83A0];
      id v12 = MEMORY[0x263EF83A0];
    }
    else
    {
      id v11 = dispatch_get_global_queue(0, 0);
    }
    [v10 shiftLocation:v13 withCompletionHandler:v7 callbackQueue:v11];
  }
  else
  {
    v7[2](v7, v13);
  }
}

- (NSString)streetViewLocation
{
  return 0;
}

- (BOOL)showsBicycling
{
  return 0;
}

- (BOOL)showsStreetView
{
  return 0;
}

- (BOOL)showsTransit
{
  return 0;
}

- (BOOL)showsTraffic
{
  return 0;
}

- (unint64_t)mapType
{
  return 0;
}

- (int64_t)zoomLevel
{
  return 0;
}

- (NSString)centerLocation
{
  return 0;
}

- (unint64_t)directionsMode
{
  return 0;
}

- (NSString)destinationAddress
{
  return 0;
}

- (NSString)startAddress
{
  return 0;
}

- (NSString)searchLocation
{
  return 0;
}

- (NSString)searchNearQuery
{
  return 0;
}

- (NSString)searchQuery
{
  return 0;
}

- (NSString)description
{
  id v3 = [(DCMapsLink *)self startAddress];

  id v4 = NSString;
  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DCMapsLink;
    uint64_t v5 = [(DCMapsLink *)&v11 description];
    BOOL v6 = [(DCMapsLink *)self startAddress];
    uint64_t v7 = [(DCMapsLink *)self destinationAddress];
    BOOL v8 = [v4 stringWithFormat:@"%@: Directions from %@ to %@", v5, v6, v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DCMapsLink;
    uint64_t v5 = [(DCMapsLink *)&v10 description];
    BOOL v6 = [(DCMapsLink *)self searchQuery];
    BOOL v8 = [v4 stringWithFormat:@"%@: %@", v5, v6];
  }

  return (NSString *)v8;
}

- (void)getCitymapperAppURL:(id)a3
{
}

- (id)baiduMapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:self];
}

- (id)wazeAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:self];
}

- (id)transitAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:self];
}

- (id)googleMapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:self];
}

- (id)mapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:self];
}

+ (BOOL)isMapsURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[DCNewGoogleMapsLink isMapsURL:v3]
    || +[DCStandardMapsLink isMapsURL:v3];

  return v4;
}

+ (DCMapsLink)mapsLinkWithURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[DCNewGoogleMapsLink mapsLinkWithURL:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[DCStandardMapsLink mapsLinkWithURL:v3];
  }
  uint64_t v7 = v6;

  return (DCMapsLink *)v7;
}

- ($BA53C1BB0937E3E485E38CF18850CA32)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  [(DCMapsLink *)self coordinateSpanForMapSize:a4.width centeredAtLocation:a4.height];
  WFMKCoordinateRegionMake(latitude, longitude, v7, v8);
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double height = a3.height;
  double width = a3.width;
  id v9 = objc_opt_class();
  int64_t v10 = [(DCMapsLink *)self zoomLevel];
  objc_msgSend(v9, "coordinateSpanForMapSize:centeredAtLocation:atZoomLevel:", v10, width, height, latitude, longitude);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (unint64_t)mkMapType
{
  unint64_t v2 = [(DCMapsLink *)self mapType];
  if (v2 == 2) {
    return 1;
  }
  else {
    return 2 * (v2 == 3);
  }
}

- (CLLocationCoordinate2D)centerCoordinate
{
  [(DCMapsLink *)self streetViewLocationCoordinate];
  double v4 = v3;
  double v6 = v5;
  WFCLLocationCoordinate2DIsValid(v3, v5);
  if ((v7 & 1) == 0)
  {
    [(DCMapsLink *)self centerLocationCoordinate];
    double v4 = v8;
    double v6 = v9;
    WFCLLocationCoordinate2DIsValid(v8, v9);
    if ((v10 & 1) == 0)
    {
      [(DCMapsLink *)self searchLocationCoordinate];
      double v4 = v11;
      double v6 = v12;
      WFCLLocationCoordinate2DIsValid(v11, v12);
      if ((v13 & 1) == 0)
      {
        getkCLLocationCoordinate2DInvalid();
        double v4 = v14;
        double v6 = v15;
      }
    }
  }
  double v16 = v4;
  double v17 = v6;
  result.double longitude = v17;
  result.double latitude = v16;
  return result;
}

- (CLLocationCoordinate2D)streetViewLocationCoordinate
{
  double v3 = [(DCMapsLink *)self streetViewLocation];
  [(DCMapsLink *)self locationCoordinateFromString:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double longitude = v9;
  result.double latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)centerLocationCoordinate
{
  double v3 = [(DCMapsLink *)self centerLocation];
  [(DCMapsLink *)self locationCoordinateFromString:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double longitude = v9;
  result.double latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)searchLocationCoordinate
{
  double v3 = [(DCMapsLink *)self searchLocation];
  [(DCMapsLink *)self locationCoordinateFromString:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double longitude = v9;
  result.double latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)locationCoordinateFromString:(id)a3
{
  id v3 = a3;
  double v4 = [v3 componentsSeparatedByString:@","];
  if ([v4 count] == 2)
  {
    double v5 = [v4 objectAtIndex:0];
    [v5 doubleValue];
    double v7 = v6;
    double v8 = [v4 objectAtIndex:1];
    [v8 doubleValue];
    double v10 = v9;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    double v11 = (double (*)(double, double))getCLLocationCoordinate2DMakeSymbolLoc_ptr_16906;
    v25 = getCLLocationCoordinate2DMakeSymbolLoc_ptr_16906;
    if (!getCLLocationCoordinate2DMakeSymbolLoc_ptr_16906)
    {
      double v12 = CoreLocationLibrary_16894();
      v23[3] = (uint64_t)dlsym(v12, "CLLocationCoordinate2DMake");
      getCLLocationCoordinate2DMakeSymbolLoc_ptr_16906 = (_UNKNOWN *)v23[3];
      double v11 = (double (*)(double, double))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v11)
    {
      v20 = [MEMORY[0x263F08690] currentHandler];
      id v21 = objc_msgSend(NSString, "stringWithUTF8String:", "CLLocationCoordinate2D WFCLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"DCMapsLink+MKGeometry.m", 16, @"%s", dlerror());

      __break(1u);
      goto LABEL_9;
    }
    double v13 = v11(v7, v10);
    double v15 = v14;
  }
  else
  {
    getkCLLocationCoordinate2DInvalid();
    double v13 = v16;
    double v15 = v17;
  }

  double v18 = v13;
  double v19 = v15;
LABEL_9:
  result.double longitude = v19;
  result.double latitude = v18;
  return result;
}

+ ($5DAFA5872F15DB93AA0534C5CA46C53E)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4 atZoomLevel:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  [a2 coordinateSpanForMapSize:a6 centeredAtLocation:a4.width atZoomLevel:a4.height];
  WFMKCoordinateRegionMake(latitude, longitude, v8, v9);
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4 atZoomLevel:(int64_t)a5
{
  double latitude = a4.latitude;
  double height = a3.height;
  double width = a3.width;
  [a1 longitudeToPixelSpaceX:a4.longitude];
  double v11 = v10;
  [a1 latitudeToPixelSpaceY:latitude];
  double v13 = v12;
  long double v14 = exp2((double)(23 - a5));
  long double v15 = width * v14;
  long double v16 = height * v14;
  long double v17 = v11 - v15 * 0.5;
  long double v18 = v13 - v16 * 0.5;
  [a1 pixelSpaceXToLongitude:(double)v17];
  double v20 = v19;
  [a1 pixelSpaceXToLongitude:(double)(v15 + v17)];
  double v22 = v21;
  [a1 pixelSpaceYToLatitude:(double)v18];
  double v24 = v23;
  [a1 pixelSpaceYToLatitude:(double)(v16 + v18)];
  double v26 = v25;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v27 = (void (*)(double, double))getMKCoordinateSpanMakeSymbolLoc_ptr;
  v36 = getMKCoordinateSpanMakeSymbolLoc_ptr;
  if (!getMKCoordinateSpanMakeSymbolLoc_ptr)
  {
    uint64_t v28 = MapKitLibrary_16882();
    v34[3] = (uint64_t)dlsym(v28, "MKCoordinateSpanMake");
    getMKCoordinateSpanMakeSymbolLoc_ptr = (_UNKNOWN *)v34[3];
    uint64_t v27 = (void (*)(double, double))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (v27)
  {
    v27(-(v26 - v24), v22 - v20);
  }
  else
  {
    uint64_t v31 = [MEMORY[0x263F08690] currentHandler];
    id v32 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateSpan WFMKCoordinateSpanMake(CLLocationDegrees, CLLocationDegrees)");
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"DCMapsLink+MKGeometry.m", 21, @"%s", dlerror());

    __break(1u);
  }
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

+ (double)pixelSpaceYToLatitude:(double)a3
{
  long double v3 = exp((round(a3) + -268435456.0) / 85445659.4);
  return (atan(v3) * -2.0 + 1.57079633) * 180.0 / 3.14159265;
}

+ (double)pixelSpaceXToLongitude:(double)a3
{
  return (round(a3) + -268435456.0) / 85445659.4 * 180.0 / 3.14159265;
}

+ (double)latitudeToPixelSpaceY:(double)a3
{
  float v3 = a3 * 3.14159265 / 180.0;
  float v4 = sinf(v3);
  return round(logf((float)(v4 + 1.0) / (float)(1.0 - v4)) * -85445659.4 * 0.5 + 268435456.0);
}

+ (double)longitudeToPixelSpaceX:(double)a3
{
  return round(a3 * 85445659.4 * 3.14159265 / 180.0 + 268435456.0);
}

@end