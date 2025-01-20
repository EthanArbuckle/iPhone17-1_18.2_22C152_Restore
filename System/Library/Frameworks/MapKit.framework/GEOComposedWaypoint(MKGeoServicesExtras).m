@interface GEOComposedWaypoint(MKGeoServicesExtras)
+ (void)composedWaypointForMapItem:()MKGeoServicesExtras useAsLocation:forQuickETA:traits:completionHandler:networkActivityHandler:;
@end

@implementation GEOComposedWaypoint(MKGeoServicesExtras)

+ (void)composedWaypointForMapItem:()MKGeoServicesExtras useAsLocation:forQuickETA:traits:completionHandler:networkActivityHandler:
{
  id v37 = a3;
  id v14 = a6;
  v15 = a7;
  id v16 = a8;
  v17 = v37;
  if (!v37)
  {
    v20 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"mapItem cannot be nil"];
    v15[2](v15, 0, v20);
    goto LABEL_23;
  }
  if (!v14)
  {
    v18 = +[MKMapService sharedService];
    id v14 = [v18 defaultTraits];

    v17 = v37;
  }
  if ([v17 isCurrentLocation])
  {
    v19 = +[MKLocationManager sharedLocationManager];
    v20 = [v19 currentLocation];

    if (a5)
    {
      if (v15)
      {
        v21 = (void *)[[a1 alloc] initWithLocation:v20 isCurrentLocation:1];
        ((void (**)(id, void *, void *))v15)[2](v15, v21, 0);
      }
    }
    else
    {
      id v26 = (id)[(objc_class *)a1 composedWaypointForCurrentLocation:v20 traits:v14 completionHandler:v15 networkActivityHandler:v16];
    }
    goto LABEL_23;
  }
  if (![v37 _hasCorrectedHomeWorkCoordinate])
  {
    v27 = [v37 place];

    if (v27 && (a4 & 1) == 0)
    {
      if (a5)
      {
        if (!v15) {
          goto LABEL_24;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F644F0]);
        v29 = [v37 _geoMapItem];
        v20 = (void *)[v28 initWithMapItem:v29];

        ((void (**)(id, void *, void *))v15)[2](v15, v20, 0);
      }
      else
      {
        int v34 = [v37 isPlaceHolder];
        v20 = [v37 _geoMapItem];
        if (v34) {
          id v35 = (id)[(objc_class *)a1 composedWaypointForIncompleteMapItem:v20 traits:v14 clientAttributes:0 completionHandler:v15 networkActivityHandler:v16];
        }
        else {
          id v36 = (id)[(objc_class *)a1 composedWaypointForMapItem:v20 traits:v14 clientAttributes:0 completionHandler:v15 networkActivityHandler:v16];
        }
      }
      goto LABEL_23;
    }
    id v30 = objc_alloc(MEMORY[0x1E4F64660]);
    v31 = [v37 placemark];
    v32 = [v31 location];
    v20 = (void *)[v30 initWithCLLocation:v32];

LABEL_21:
    v25 = [v37 _geoMapItem];
    id v33 = (id)[(objc_class *)a1 composedWaypointForLocation:v20 mapItem:v25 traits:v14 completionHandler:v15 networkActivityHandler:v16];
    goto LABEL_22;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F64660]);
  [v37 _coordinate];
  double v24 = v23;
  [v37 _coordinate];
  v20 = objc_msgSend(v22, "initWithLatitude:longitude:", v24);
  if (!a5) {
    goto LABEL_21;
  }
  if (v15)
  {
    v25 = (void *)[[a1 alloc] initWithLocation:v20 isCurrentLocation:0];
    ((void (**)(id, void *, void *))v15)[2](v15, v25, 0);
LABEL_22:
  }
LABEL_23:

LABEL_24:
}

@end