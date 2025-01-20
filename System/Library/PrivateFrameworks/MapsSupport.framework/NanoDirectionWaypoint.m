@interface NanoDirectionWaypoint
+ (BOOL)supportsSecureCoding;
+ (NanoDirectionWaypoint)directionWaypointWithGEOMapItem:(id)a3;
+ (NanoDirectionWaypoint)directionWaypointWithLabel:(id)a3 muid:(unint64_t)a4 providerID:(int)a5;
+ (NanoDirectionWaypoint)directionWaypointWithSearchString:(id)a3;
+ (id)directionWaypointForCompanionWaypoint:(id)a3;
+ (id)directionWaypointForComposedWaypoint:(id)a3;
+ (id)directionWaypointForCurrentLocation:(id)a3;
+ (id)directionWaypointForLocation:(id)a3;
+ (id)directionWaypointForLocation:(id)a3 findMyHandleID:(id)a4;
+ (id)directionWaypointToCustomRoute:(id)a3;
- (BOOL)isCurrentLocation;
- (BOOL)isValid;
- (GEOComposedGeometryRoutePersistentData)destinationRouteData;
- (GEOComposedWaypoint)composedWaypoint;
- (GEOLocation)location;
- (GEOMapItem)geoMapItem;
- (NSString)findMyHandleID;
- (NSString)name;
- (NSString)searchString;
- (NanoDirectionWaypoint)initWithCoder:(id)a3;
- (id)companionWaypoint;
- (id)debugDescription;
- (id)description;
- (int)providerID;
- (unint64_t)muid;
- (void)cancelRefinement;
- (void)encodeWithCoder:(id)a3;
- (void)refineWithTraits:(id)a3 auditToken:(id)a4 completionHandler:(id)a5;
- (void)setComposedWaypoint:(id)a3;
- (void)setCurrentLocation:(BOOL)a3;
- (void)setFindMyHandleID:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setProviderID:(int)a3;
- (void)setSearchString:(id)a3;
@end

@implementation NanoDirectionWaypoint

+ (id)directionWaypointForCompanionWaypoint:(id)a3
{
  id v4 = a3;
  if ([v4 isCurrentLocation])
  {
    v5 = [v4 location];
    v6 = [a1 directionWaypointForCurrentLocation:v5];
  }
  else
  {
    v6 = objc_alloc_init((Class)a1);
    v7 = [v4 location];
    [v6 setLocation:v7];

    v8 = [v4 mapItem];
    [v6 setGeoMapItem:v8];

    v9 = [v4 searchString];
    [v6 setSearchString:v9];

    id v10 = [objc_alloc((Class)GEOComposedWaypoint) initWithCompanionWaypoint:v4];
    [v6 setComposedWaypoint:v10];

    v11 = [v4 findMyHandleID];
    [v6 setFindMyHandleID:v11];

    v5 = [v4 routeData];
    if (v5)
    {
      id v16 = 0;
      uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v16];
      id v13 = v16;
      v14 = (void *)v6[8];
      v6[8] = v12;
    }
  }

  return v6;
}

+ (id)directionWaypointToCustomRoute:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 persistentData];
  v6 = (void *)v4[8];
  v4[8] = v5;

  v7 = [v3 name];
  [v4 setName:v7];

  id v8 = [objc_alloc((Class)GEOComposedWaypointToRoute) initWithRoute:v3];
  [v4 setComposedWaypoint:v8];

  return v4;
}

+ (id)directionWaypointForComposedWaypoint:(id)a3
{
  id v3 = a3;
  if ([v3 isCurrentLocation])
  {
    if ([v3 hasLatLng])
    {
      id v4 = objc_alloc((Class)GEOLocation);
      uint64_t v5 = [v3 latLng];
      id v6 = objc_msgSend(v4, "initWithLocation:isUserLocation:floorOrdinal:", v5, objc_msgSend(v3, "isCurrentLocation"), 0x7FFFFFFFLL);
    }
    else
    {
      id v6 = 0;
    }
    id v8 = +[NanoDirectionWaypoint directionWaypointForCurrentLocation:v6];
  }
  else
  {
    v7 = [v3 geoMapItem];
    id v8 = +[NanoDirectionWaypoint directionWaypointWithGEOMapItem:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v3 route];
      uint64_t v10 = [v9 persistentData];
      v11 = (void *)v8[8];
      v8[8] = v10;
    }
    id v6 = [v3 findMyHandleID];
    [v8 setFindMyHandleID:v6];
  }

  return v8;
}

+ (id)directionWaypointForCurrentLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setCurrentLocation:1];
  [v5 setLocation:v4];

  return v5;
}

+ (id)directionWaypointForLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setLocation:v4];

  return v5;
}

+ (id)directionWaypointForLocation:(id)a3 findMyHandleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  id v9 = [v6 copy];

  [v8 setFindMyHandleID:v9];
  [v8 setLocation:v7];

  return v8;
}

+ (NanoDirectionWaypoint)directionWaypointWithGEOMapItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setGeoMapItem:v4];
  id v6 = [objc_alloc((Class)GEOComposedWaypoint) initWithMapItem:v4];

  [v5 setComposedWaypoint:v6];

  return (NanoDirectionWaypoint *)v5;
}

+ (NanoDirectionWaypoint)directionWaypointWithSearchString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setSearchString:v4];

  return (NanoDirectionWaypoint *)v5;
}

+ (NanoDirectionWaypoint)directionWaypointWithLabel:(id)a3 muid:(unint64_t)a4 providerID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)a1);
  [v9 setSearchString:v8];

  [v9 setMuid:a4];
  [v9 setProviderID:v5];

  return (NanoDirectionWaypoint *)v9;
}

- (NSString)name
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(GEOComposedWaypoint *)self->_composedWaypoint name];
LABEL_5:
    uint64_t v5 = v3;
    goto LABEL_6;
  }
  name = self->_name;
  if (name)
  {
    id v3 = name;
    goto LABEL_5;
  }
  id v7 = [(GEOComposedWaypoint *)self->_composedWaypoint geoMapItem];
  id v8 = [v7 name];
  searchString = v8;
  if (v8 || (searchString = self->_searchString) != 0)
  {
    uint64_t v5 = searchString;
  }
  else
  {
    uint64_t v10 = [(NanoDirectionWaypoint *)self geoMapItem];
    v11 = [v10 name];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v5 = v11;
    }
    else
    {
      id v13 = +[NSBundle mainBundle];
      uint64_t v5 = [v13 localizedStringForKey:@"Destination [Nano, Route Planning]", @"localized string not found", 0 value table];
    }
  }

LABEL_6:

  return v5;
}

- (BOOL)isValid
{
  id v3 = [(NanoDirectionWaypoint *)self composedWaypoint];
  if (v3 || [(NanoDirectionWaypoint *)self isCurrentLocation])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v6 = [(NanoDirectionWaypoint *)self location];
    if (v6)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v7 = [(NanoDirectionWaypoint *)self geoMapItem];
      if (v7)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v8 = [(NanoDirectionWaypoint *)self searchString];
        if ([v8 length])
        {
          BOOL v4 = 1;
        }
        else if ([(NanoDirectionWaypoint *)self muid])
        {
          BOOL v4 = [(NanoDirectionWaypoint *)self providerID] > 0;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (void)setComposedWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_composedWaypoint, a3);
  id v5 = a3;
  id v6 = [(NanoDirectionWaypoint *)self findMyHandleID];
  [(GEOComposedWaypoint *)self->_composedWaypoint setFindMyHandleID:v6];
}

- (void)refineWithTraits:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11) {
    goto LABEL_40;
  }
  if (![(NanoDirectionWaypoint *)self isValid])
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    goto LABEL_40;
  }
  uint64_t v12 = [(NanoDirectionWaypoint *)self geoMapItem];
  if (v12
    || ([(NanoDirectionWaypoint *)self destinationRouteData],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = [(NanoDirectionWaypoint *)self composedWaypoint];

    if (v12)
    {

      if (v13) {
        goto LABEL_14;
      }
    }
    else
    {

      if (v13) {
        goto LABEL_14;
      }
    }
    v14 = [(NanoDirectionWaypoint *)self destinationRouteData];

    if (v14)
    {
      id v15 = objc_alloc((Class)GEORouteBuilder_PersistentData);
      id v16 = [(NanoDirectionWaypoint *)self destinationRouteData];
      id v17 = [v15 initWithPersistentData:v16];

      id v18 = [v17 buildRoute];
      id v19 = [objc_alloc((Class)GEOComposedWaypointToRoute) initWithRoute:v18];
      [(NanoDirectionWaypoint *)self setComposedWaypoint:v19];
    }
    else
    {
      id v20 = objc_alloc((Class)GEOComposedWaypoint);
      id v17 = [(NanoDirectionWaypoint *)self geoMapItem];
      id v18 = [v20 initWithMapItem:v17];
      [(NanoDirectionWaypoint *)self setComposedWaypoint:v18];
    }
  }
LABEL_14:
  v21 = [(NanoDirectionWaypoint *)self composedWaypoint];

  if (v21)
  {
    v22 = [(NanoDirectionWaypoint *)self composedWaypoint];
    (*((void (**)(id, void *, void))v11 + 2))(v11, v22, 0);
  }
  else
  {
    if ([(NanoDirectionWaypoint *)self isCurrentLocation]) {
      [v9 deviceLocation];
    }
    else {
    v23 = [(NanoDirectionWaypoint *)self location];
    }
    if ([(NanoDirectionWaypoint *)self isCurrentLocation] && !v23)
    {
      v24 = sub_100053DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Waypoint wants current location but none found on traits", buf, 2u);
      }
    }
    v40 = [(NanoDirectionWaypoint *)self searchString];
    unint64_t v25 = [(NanoDirectionWaypoint *)self muid];
    uint64_t v26 = [(NanoDirectionWaypoint *)self providerID];
    objc_initWeak(&location, self);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10001B640;
    v43[3] = &unk_100081B40;
    objc_copyWeak(&v45, &location);
    id v44 = v11;
    v27 = objc_retainBlock(v43);
    if (v23)
    {
      v28 = sub_100053DCC();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [v23 latLng];
        [v29 lat];
        v31 = v30;
        v32 = [v23 latLng];
        [v32 lng];
        *(_DWORD *)buf = 134283777;
        v48 = v31;
        __int16 v49 = 2049;
        uint64_t v50 = v33;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Will refine location: %{private}#.3lf,%{private}#.3lf", buf, 0x16u);
      }
      v34 = +[GEOComposedWaypoint composedWaypointForCurrentLocation:v23 traits:v9 auditToken:v10 completionHandler:v27 networkActivityHandler:0];
      objc_storeWeak((id *)&self->_refinementTicket, v34);
    }
    else if (v25)
    {
      v35 = sub_100053DCC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283777;
        v48 = (NanoDirectionWaypoint *)v25;
        __int16 v49 = 1025;
        LODWORD(v50) = v26;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Will refine ID: %{private}llu/%{private}d", buf, 0x12u);
      }

      v36 = +[GEOComposedWaypoint composedWaypointForID:v25 resultsProviderID:v26 contentProvider:0 traits:v9 clientAttributes:0 completionHandler:v27 networkActivityHandler:0];
      objc_storeWeak((id *)&self->_refinementTicket, v36);
    }
    else
    {
      v37 = sub_100053DCC();
      v38 = v37;
      if (v40)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v48 = v40;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Will refine address: %{private}@", buf, 0xCu);
        }

        v39 = +[GEOComposedWaypoint composedWaypointForSearchString:v40 completionItem:0 traits:v9 clientAttributes:0 completionHandler:v27 networkActivityHandler:0];
        objc_storeWeak((id *)&self->_refinementTicket, v39);
      }
      else
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v48 = self;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unable to refine: %{private}@", buf, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001B714;
        block[3] = &unk_100081B68;
        block[4] = self;
        v42 = v27;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
LABEL_40:
}

- (void)cancelRefinement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refinementTicket);
  [WeakRetained cancel];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoDirectionWaypoint)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NanoDirectionWaypoint *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    id location = v5->_location;
    v5->_id location = (GEOLocation *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLocation"];
    v5->_currentLocation = [v10 BOOLValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muid"];
    v5->_muid = (unint64_t)[v13 unsignedLongLongValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerID"];
    v5->_providerID = [v14 intValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoMapItemStorage"];
    geoMapItem = v5->_geoMapItem;
    v5->_geoMapItem = (GEOMapItem *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedWaypoint"];
    composedWaypoint = v5->_composedWaypoint;
    v5->_composedWaypoint = (GEOComposedWaypoint *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findMyHandleID"];
    findMyHandleID = v5->_findMyHandleID;
    v5->_findMyHandleID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationRouteData"];
    destinationRouteData = v5->_destinationRouteData;
    v5->_destinationRouteData = (GEOComposedGeometryRoutePersistentData *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v9 = a3;
  [v9 encodeObject:name forKey:@"name"];
  [v9 encodeObject:self->_location forKey:@"location"];
  id v5 = +[NSNumber numberWithBool:self->_currentLocation];
  [v9 encodeObject:v5 forKey:@"currentLocation"];

  [v9 encodeObject:self->_searchString forKey:@"searchString"];
  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:self->_muid];
  [v9 encodeObject:v6 forKey:@"muid"];

  id v7 = +[NSNumber numberWithInt:self->_providerID];
  [v9 encodeObject:v7 forKey:@"providerID"];

  uint64_t v8 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:self->_geoMapItem];
  [v9 encodeObject:v8 forKey:@"geoMapItemStorage"];

  [v9 encodeObject:self->_composedWaypoint forKey:@"composedWaypoint"];
  [v9 encodeObject:self->_findMyHandleID forKey:@"findMyHandleID"];
  [v9 encodeObject:self->_destinationRouteData forKey:@"destinationRouteData"];
}

- (id)description
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001BFB0;
  v17[3] = &unk_100081B90;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(v17);
  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"name", self->_name);
  ((void (*)(void *, const __CFString *, GEOLocation *))v4[2])(v4, @"location", self->_location);
  if (self->_currentLocation)
  {
    id v5 = +[NSNumber numberWithBool:1];
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"currentLocation", v5);
  }
  else
  {
    ((void (*)(void *, const __CFString *, void))v4[2])(v4, @"currentLocation", 0);
  }
  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"searchString", self->_searchString);
  if (self->_muid)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"muid", v6);
  }
  else
  {
    ((void (*)(void *, const __CFString *))v4[2])(v4, @"muid");
  }
  if (self->_providerID <= 0)
  {
    ((void (*)(void *, const __CFString *, void))v4[2])(v4, @"providerId", 0);
  }
  else
  {
    id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"providerId", v7);
  }
  ((void (*)(void *, const __CFString *, GEOMapItem *))v4[2])(v4, @"geoMapItem", self->_geoMapItem);
  uint64_t v8 = [(GEOComposedWaypoint *)self->_composedWaypoint shortDescription];
  ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"composedWaypoint", v8);

  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"findMyHandleID", self->_findMyHandleID);
  id v9 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
  ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"clientAttrbutes", v9);

  if (self->_destinationRouteData) {
    id v10 = &__kCFBooleanTrue;
  }
  else {
    id v10 = 0;
  }
  ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"destinationRouteData", v10);
  v16.receiver = self;
  v16.super_class = (Class)NanoDirectionWaypoint;
  uint64_t v11 = [(NanoDirectionWaypoint *)&v16 description];
  uint64_t v12 = [(NanoDirectionWaypoint *)self name];
  id v13 = [v3 componentsJoinedByString:@", "];
  v14 = +[NSString stringWithFormat:@"%@ %@ (%@)", v11, v12, v13];

  return v14;
}

- (id)debugDescription
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C2B8;
  v15[3] = &unk_100081B90;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v16 = v3;
  id v4 = objc_retainBlock(v15);
  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"name", self->_name);
  ((void (*)(void *, const __CFString *, GEOLocation *))v4[2])(v4, @"location", self->_location);
  if (self->_currentLocation)
  {
    id v5 = +[NSNumber numberWithBool:1];
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"currentLocation", v5);
  }
  else
  {
    ((void (*)(void *, const __CFString *, void))v4[2])(v4, @"currentLocation", 0);
  }
  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"searchString", self->_searchString);
  if (self->_muid)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"muid", v6);
  }
  else
  {
    ((void (*)(void *, const __CFString *))v4[2])(v4, @"muid");
  }
  if (self->_providerID <= 0)
  {
    ((void (*)(void *, const __CFString *, void))v4[2])(v4, @"providerId", 0);
  }
  else
  {
    id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"providerId", v7);
  }
  ((void (*)(void *, const __CFString *, GEOMapItem *))v4[2])(v4, @"geoMapItem", self->_geoMapItem);
  ((void (*)(void *, const __CFString *, GEOComposedWaypoint *))v4[2])(v4, @"composedWaypoint", self->_composedWaypoint);
  ((void (*)(void *, const __CFString *, NSString *))v4[2])(v4, @"findMyHandleID", self->_findMyHandleID);
  if (self->_destinationRouteData) {
    uint64_t v8 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v8 = 0;
  }
  ((void (*)(void *, const __CFString *, void *))v4[2])(v4, @"destinationRouteData", v8);
  v14.receiver = self;
  v14.super_class = (Class)NanoDirectionWaypoint;
  id v9 = [(NanoDirectionWaypoint *)&v14 description];
  id v10 = [(NanoDirectionWaypoint *)self name];
  uint64_t v11 = [v3 componentsJoinedByString:@",\n"];
  uint64_t v12 = +[NSString stringWithFormat:@"%@ %@ {\n%@\n}", v9, v10, v11];

  return v12;
}

- (BOOL)isCurrentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(BOOL)a3
{
  self->_currentLocation = a3;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(int)a3
{
  self->_providerID = a3;
}

- (NSString)findMyHandleID
{
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)destinationRouteData
{
  return self->_destinationRouteData;
}

- (void)setName:(id)a3
{
}

- (GEOComposedWaypoint)composedWaypoint
{
  return self->_composedWaypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_destinationRouteData, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_destroyWeak((id *)&self->_refinementTicket);
}

- (id)companionWaypoint
{
  id v3 = objc_alloc_init((Class)GEOCompanionWaypoint);
  objc_msgSend(v3, "setIsCurrentLocation:", -[NanoDirectionWaypoint isCurrentLocation](self, "isCurrentLocation"));
  id v4 = [(NanoDirectionWaypoint *)self geoMapItem];
  id v5 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v4];
  [v3 setMapItem:v5];

  uint64_t v6 = [(NanoDirectionWaypoint *)self composedWaypoint];
  id v7 = [v6 waypoint];
  [v3 setWaypointTyped:v7];

  uint64_t v8 = [(NanoDirectionWaypoint *)self searchString];
  [v3 setSearchString:v8];

  id v9 = [(NanoDirectionWaypoint *)self findMyHandleID];
  [v3 setFindMyHandleID:v9];

  id v10 = [(NanoDirectionWaypoint *)self destinationRouteData];

  if (v10)
  {
    uint64_t v11 = [(NanoDirectionWaypoint *)self destinationRouteData];
    uint64_t v14 = 0;
    uint64_t v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v14];

    [v3 setRouteData:v12];
  }

  return v3;
}

@end