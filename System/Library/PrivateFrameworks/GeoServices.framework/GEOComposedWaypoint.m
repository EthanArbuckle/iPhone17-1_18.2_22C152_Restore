@interface GEOComposedWaypoint
+ (BOOL)isValid:(id)a3;
+ (id)composedWaypointForAddressString:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
+ (id)composedWaypointForID:(unint64_t)a3 resultsProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9;
+ (id)composedWaypointForIdentifier:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForIncompleteMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 auditToken:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8;
+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8;
+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8;
+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7;
+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 clientResolvedCompletionHandler:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9;
+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8;
+ (id)composedWaypointForTransitID:(unint64_t)a3 coordinate:(id)a4 isCurrentLocation:(BOOL)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9;
+ (id)composedWaypointForWaypointTyped:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (void)composedWaypointForMapServiceResponse:(id)a3 clientAttributes:(id)a4 error:(id)a5 handler:(id)a6;
- ($1AB5FA073B851C12C2339EC22442E995)coordinate;
- (BOOL)hasClientFeatureID;
- (BOOL)hasFindMyHandleID;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCurrentLocation;
- (BOOL)hasIsOutsideOfflineDownloadedRegion;
- (BOOL)hasLatLng;
- (BOOL)hasLocation;
- (BOOL)hasMapItemStorage;
- (BOOL)hasMuid;
- (BOOL)hasStyleAttributesData;
- (BOOL)hasType;
- (BOOL)hasUniqueWaypointID;
- (BOOL)hasWaypoint;
- (BOOL)isAddressWaypointType;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationWaypointType;
- (BOOL)isOutsideOfflineDownloadedRegion;
- (BOOL)isSameAs:(id)a3;
- (BOOL)isSameAs:(id)a3 comparisonCriteria:(unint64_t)a4;
- (BOOL)isServerProvidedWaypoint;
- (BOOL)readFrom:(id)a3;
- (GEOComposedWaypoint)init;
- (GEOComposedWaypoint)initWithCompanionWaypoint:(id)a3;
- (GEOComposedWaypoint)initWithData:(id)a3;
- (GEOComposedWaypoint)initWithDictionary:(id)a3;
- (GEOComposedWaypoint)initWithJSON:(id)a3;
- (GEOComposedWaypoint)initWithLocation:(id)a3 findMyHandleID:(id)a4;
- (GEOComposedWaypoint)initWithLocation:(id)a3 isCurrentLocation:(BOOL)a4;
- (GEOComposedWaypoint)initWithMapItem:(id)a3;
- (GEOLatLng)latLng;
- (GEOLocation)location;
- (GEOMapItemStorage)mapItemStorage;
- (GEOWaypointInfo)geoWaypointInfo;
- (GEOWaypointTyped)geoWaypointTyped;
- (GEOWaypointTyped)waypoint;
- (NSData)styleAttributesData;
- (NSData)uniqueWaypointID;
- (NSString)findMyHandleID;
- (id)_addressCandidatesForComparison;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_locationCandidatesForComparison;
- (id)_muidCandidatesForComparison;
- (id)_regionCandidatesForContainment;
- (id)artwork;
- (id)bestLatLng;
- (id)chargingInfo;
- (id)convertToStaticLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayInfo;
- (id)jsonRepresentation;
- (id)name;
- (id)route;
- (id)styleAttributes;
- (id)timezone;
- (id)typeAsString:(int)a3;
- (id)uniqueID;
- (int)StringAsType:(id)a3;
- (int)mapDisplayType;
- (int)type;
- (int)waypointCategory;
- (unint64_t)clientFeatureID;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readFindMyHandleID;
- (void)_readLatLng;
- (void)_readLocation;
- (void)_readMapItemStorage;
- (void)_readStyleAttributesData;
- (void)_readUniqueWaypointID;
- (void)_readWaypoint;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)recomputeGeoWaypointTyped;
- (void)setClientFeatureID:(unint64_t)a3;
- (void)setFindMyHandleID:(id)a3;
- (void)setHasClientFeatureID:(BOOL)a3;
- (void)setHasIsCurrentLocation:(BOOL)a3;
- (void)setHasIsOutsideOfflineDownloadedRegion:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setIsOutsideOfflineDownloadedRegion:(BOOL)a3;
- (void)setLatLng:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setStyleAttributesData:(id)a3;
- (void)setType:(int)a3;
- (void)setUniqueWaypointID:(id)a3;
- (void)setWaypoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOComposedWaypoint

- (GEOComposedWaypoint)initWithLocation:(id)a3 isCurrentLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedWaypoint;
  v7 = [(GEOComposedWaypoint *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(GEOComposedWaypoint *)v7 setType:1];
    v9 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    [(GEOComposedWaypoint *)v8 setUniqueWaypointID:v9];

    [(GEOComposedWaypoint *)v8 setLocation:v6];
    v10 = [v6 latLng];
    [(GEOComposedWaypoint *)v8 setLatLng:v10];

    [(GEOComposedWaypoint *)v8 setIsCurrentLocation:v4];
    v11 = [(GEOComposedWaypoint *)v8 geoWaypointTyped];
    [(GEOComposedWaypoint *)v8 setWaypoint:v11];

    v12 = v8;
  }

  return v8;
}

- (void)setWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypoint, a3);
}

- (void)setUniqueWaypointID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_uniqueWaypointID, a3);
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_type = a3;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (GEOComposedWaypoint)initWithMapItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedWaypoint;
  v5 = [(GEOComposedWaypoint *)&v17 init];
  if (v5)
  {
    if ([v4 _hasMUID]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    [(GEOComposedWaypoint *)v5 setType:v6];
    v7 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    [(GEOComposedWaypoint *)v5 setUniqueWaypointID:v7];

    v8 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v4];
    [(GEOComposedWaypoint *)v5 setMapItemStorage:v8];

    -[GEOComposedWaypoint setMuid:](v5, "setMuid:", [v4 _muid]);
    v9 = [GEOLatLng alloc];
    [v4 centerCoordinate];
    v10 = -[GEOLatLng initWithCoordinate:](v9, "initWithCoordinate:");
    v11 = [[GEOLocation alloc] initWithLocation:v10];
    [(GEOComposedWaypoint *)v5 setLocation:v11];

    v12 = [(GEOComposedWaypoint *)v5 location];
    v13 = [v12 latLng];
    [(GEOComposedWaypoint *)v5 setLatLng:v13];

    objc_super v14 = [(GEOComposedWaypoint *)v5 geoWaypointTyped];
    [(GEOComposedWaypoint *)v5 setWaypoint:v14];

    v15 = v5;
  }

  return v5;
}

- (GEOWaypointTyped)geoWaypointTyped
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOWaypointTyped);
  [(GEOWaypointTyped *)v3 setIsCurrentLocation:[(GEOComposedWaypoint *)self isCurrentLocation]];
  if ([(GEOComposedWaypoint *)self isCurrentLocation])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [(GEOComposedWaypoint *)self findMyHandleID];
    BOOL v6 = v5 != 0;

    uint64_t v4 = (2 * v6);
  }
  [(GEOWaypointTyped *)v3 setWaypointLocationSource:v4];
  v7 = [(GEOComposedWaypoint *)self uniqueWaypointID];

  if (!v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    [(GEOComposedWaypoint *)self setUniqueWaypointID:v8];
  }
  v9 = (void *)MEMORY[0x1E4F29128];
  v10 = [(GEOComposedWaypoint *)self uniqueWaypointID];
  v11 = objc_msgSend(v9, "_geo_waypointUUIDForData:", v10);
  [(GEOWaypointTyped *)v3 setUniqueWaypointId:v11];

  if ([(GEOComposedWaypoint *)self isOutsideOfflineDownloadedRegion]) {
    [(GEOWaypointTyped *)v3 setDownloadedOfflineRegionState:1];
  }
  v12 = [(GEOComposedWaypoint *)self geoMapItem];
  v13 = [GEOLatLng alloc];
  [v12 centerCoordinate];
  objc_super v14 = -[GEOLatLng initWithCoordinate:](v13, "initWithCoordinate:");
  if (![(GEOComposedWaypoint *)self hasType])
  {
    if ([(GEOComposedWaypoint *)self isCurrentLocation]
      || ([(GEOComposedWaypoint *)self geoMapItem],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      uint64_t v16 = 1;
    }
    else if ([(GEOComposedWaypoint *)self muid])
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 3;
    }
    [(GEOComposedWaypoint *)self setType:v16];
  }
  switch([(GEOComposedWaypoint *)self type])
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v17 = [(GEOComposedWaypoint *)self type];
        if (v17 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
          v18 = (GEOWaypointID *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = (GEOWaypointID *)*((void *)&off_1E53EC490 + (int)v17);
        }
        *(_DWORD *)buf = 138412290;
        v33 = v18;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Unhandled type in GEOComposedWaypointType_Type: %@", buf, 0xCu);
        goto LABEL_33;
      }
      break;
    case 1:
      [(GEOWaypointTyped *)v3 setWaypointType:4];
      v19 = objc_alloc_init(GEOWaypointLocation);
      v20 = [(GEOComposedWaypoint *)self location];
      [(GEOWaypointLocation *)v19 setLocation:v20];

      [(GEOWaypointTyped *)v3 setWaypointLocation:v19];
      break;
    case 2:
      [(GEOWaypointTyped *)v3 setWaypointType:2];
      v18 = objc_alloc_init(GEOWaypointID);
      -[GEOWaypointID setMuid:](v18, "setMuid:", [v12 _muid]);
      if ([v12 _hasResultProviderID]) {
        -[GEOWaypointID setResultProviderId:](v18, "setResultProviderId:", (int)[v12 _resultProviderID]);
      }
      v21 = [v12 name];
      [(GEOWaypointID *)v18 setPlaceNameHint:v21];

      [(GEOWaypointID *)v18 setLocationHint:v14];
      v22 = [v12 geoAddress];
      if ([v22 hasStructuredAddress])
      {
        v23 = [v22 structuredAddress];
        [(GEOWaypointID *)v18 setAddressHint:v23];
      }
      if ([v22 formattedAddressLinesCount])
      {
        v24 = [v22 formattedAddressLines];
        [(GEOWaypointID *)v18 setFormattedAddressLineHints:v24];
      }
      unsigned int v25 = [v12 _addressGeocodeAccuracy];
      if (v25 < 6 || v25 != -1) {
        -[GEOWaypointID setAddressGeocodeAccuracyHint:](v18, "setAddressGeocodeAccuracyHint:");
      }
      int v26 = [v12 _placeType];
      if (v26) {
        [(GEOWaypointID *)v18 setPlaceTypeHint:_PDPlaceTypeForMapItemPlaceType(v26)];
      }
      [(GEOWaypointTyped *)v3 setWaypointId:v18];

      goto LABEL_33;
    case 3:
      [(GEOWaypointTyped *)v3 setWaypointType:3];
      v18 = objc_alloc_init(GEOWaypointPlace);
      [(GEOWaypointID *)v18 setCenter:v14];
      v27 = (void *)MEMORY[0x1E4F1CA48];
      v28 = [v12 _roadAccessPoints];
      v29 = [v27 arrayWithArray:v28];
      [(GEOWaypointID *)v18 setRoadAccessPoints:v29];

      v30 = [v12 _arrivalMapRegionForTransportType:0];
      [(GEOWaypointID *)v18 setMapRegion:v30];

      [(GEOWaypointTyped *)v3 setWaypointPlace:v18];
LABEL_33:

      break;
    default:
      break;
  }

  return v3;
}

- (NSData)uniqueWaypointID
{
  -[GEOComposedWaypoint _readUniqueWaypointID]((uint64_t)self);
  uniqueWaypointID = self->_uniqueWaypointID;

  return uniqueWaypointID;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)_readUniqueWaypointID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueWaypointID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (GEOMapItemStorage)mapItemStorage
{
  -[GEOComposedWaypoint _readMapItemStorage]((uint64_t)self);
  mapItemStorage = self->_mapItemStorage;

  return mapItemStorage;
}

- (BOOL)isOutsideOfflineDownloadedRegion
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) != 0 && self->_isOutsideOfflineDownloadedRegion;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readMapItemStorage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapItemStorage_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (GEOLocation)location
{
  -[GEOComposedWaypoint _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSString)findMyHandleID
{
  -[GEOComposedWaypoint _readFindMyHandleID]((uint64_t)self);
  findMyHandleID = self->_findMyHandleID;

  return findMyHandleID;
}

- (void)_readFindMyHandleID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFindMyHandleID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (GEOLatLng)latLng
{
  -[GEOComposedWaypoint _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return latLng;
}

- (void)_readLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLng_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_muid = a3;
}

- (void)setMapItemStorage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_isCurrentLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointID, 0);
  objc_storeStrong((id *)&self->_styleAttributesData, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOComposedWaypoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedWaypoint;
  v2 = [(GEOComposedWaypoint *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOComposedWaypoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOComposedWaypoint;
  id v3 = [(GEOComposedWaypoint *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasWaypoint
{
  return self->_waypoint != 0;
}

- (GEOWaypointTyped)waypoint
{
  -[GEOComposedWaypoint _readWaypoint]((uint64_t)self);
  waypoint = self->_waypoint;

  return waypoint;
}

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readStyleAttributesData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributesData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasStyleAttributesData
{
  return self->_styleAttributesData != 0;
}

- (NSData)styleAttributesData
{
  -[GEOComposedWaypoint _readStyleAttributesData]((uint64_t)self);
  styleAttributesData = self->_styleAttributesData;

  return styleAttributesData;
}

- (void)setStyleAttributesData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_styleAttributesData, a3);
}

- (BOOL)hasUniqueWaypointID
{
  return self->_uniqueWaypointID != 0;
}

- (BOOL)hasFindMyHandleID
{
  return self->_findMyHandleID != 0;
}

- (void)setFindMyHandleID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (void)setIsOutsideOfflineDownloadedRegion:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_isOutsideOfflineDownloadedRegion = a3;
}

- (void)setHasIsOutsideOfflineDownloadedRegion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4112;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsOutsideOfflineDownloadedRegion
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E1160[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MUID"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasIsCurrentLocation
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)clientFeatureID
{
  return self->_clientFeatureID;
}

- (void)setClientFeatureID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_clientFeatureID = a3;
}

- (void)setHasClientFeatureID:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasClientFeatureID
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedWaypoint;
  int v4 = [(GEOComposedWaypoint *)&v8 description];
  v5 = [(GEOComposedWaypoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOComposedWaypoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 waypoint];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"waypoint"];
    }
    objc_super v8 = [(id)a1 latLng];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"latLng"];
    }
    v11 = [(id)a1 mapItemStorage];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"mapItemStorage"];
    }
    if ((*(_WORD *)(a1 + 108) & 2) != 0)
    {
      objc_super v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v4 setObject:v14 forKey:@"muid"];
    }
    v15 = [(id)a1 styleAttributesData];
    uint64_t v16 = v15;
    if (v15)
    {
      if (a2)
      {
        uint64_t v17 = [v15 base64EncodedStringWithOptions:0];
        [v4 setObject:v17 forKey:@"styleAttributesData"];
      }
      else
      {
        [v4 setObject:v15 forKey:@"styleAttributesData"];
      }
    }

    v18 = [(id)a1 uniqueWaypointID];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 base64EncodedStringWithOptions:0];
        [v4 setObject:v20 forKey:@"uniqueWaypointID"];
      }
      else
      {
        [v4 setObject:v18 forKey:@"uniqueWaypointID"];
      }
    }

    v21 = [(id)a1 findMyHandleID];
    if (v21) {
      [v4 setObject:v21 forKey:@"findMyHandleID"];
    }

    __int16 v22 = *(_WORD *)(a1 + 108);
    if ((v22 & 0x10) != 0)
    {
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
      [v4 setObject:v23 forKey:@"isOutsideOfflineDownloadedRegion"];

      __int16 v22 = *(_WORD *)(a1 + 108);
    }
    if ((v22 & 4) != 0)
    {
      uint64_t v24 = *(int *)(a1 + 100);
      if (v24 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        unsigned int v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned int v25 = off_1E53E1160[v24];
      }
      [v4 setObject:v25 forKey:@"type"];
    }
    int v26 = [(id)a1 location];
    v27 = v26;
    if (v26)
    {
      if (a2) {
        [v26 jsonRepresentation];
      }
      else {
      v28 = [v26 dictionaryRepresentation];
      }
      [v4 setObject:v28 forKey:@"location"];
    }
    __int16 v29 = *(_WORD *)(a1 + 108);
    if ((v29 & 8) != 0)
    {
      v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
      [v4 setObject:v30 forKey:@"isCurrentLocation"];

      __int16 v29 = *(_WORD *)(a1 + 108);
    }
    if (v29)
    {
      v31 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v4 setObject:v31 forKey:@"clientFeatureID"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOComposedWaypoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOComposedWaypoint)initWithDictionary:(id)a3
{
  return (GEOComposedWaypoint *)-[GEOComposedWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_52;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_52;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"waypoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [GEOWaypointTyped alloc];
    if (a3) {
      uint64_t v8 = [(GEOWaypointTyped *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOWaypointTyped *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setWaypoint:v8];
  }
  v10 = [v5 objectForKeyedSubscript:@"latLng"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v12 = [(GEOLatLng *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEOLatLng *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setLatLng:v12];
  }
  objc_super v14 = [v5 objectForKeyedSubscript:@"mapItemStorage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOMapItemStorage alloc];
    if (a3) {
      uint64_t v16 = [(GEOMapItemStorage *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOMapItemStorage *)v15 initWithDictionary:v14];
    }
    uint64_t v17 = (void *)v16;
    [a1 setMapItemStorage:v16];
  }
  v18 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v18, "unsignedLongLongValue"));
  }

  v19 = [v5 objectForKeyedSubscript:@"styleAttributesData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v19 options:0];
    [a1 setStyleAttributesData:v20];
  }
  v21 = [v5 objectForKeyedSubscript:@"uniqueWaypointID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v21 options:0];
    [a1 setUniqueWaypointID:v22];
  }
  v23 = [v5 objectForKeyedSubscript:@"findMyHandleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = (void *)[v23 copy];
    [a1 setFindMyHandleID:v24];
  }
  unsigned int v25 = [v5 objectForKeyedSubscript:@"isOutsideOfflineDownloadedRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsOutsideOfflineDownloadedRegion:", objc_msgSend(v25, "BOOLValue"));
  }

  int v26 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v26;
    if ([v27 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v28 = 0;
    }
    else if ([v27 isEqualToString:@"LOCATION"])
    {
      uint64_t v28 = 1;
    }
    else if ([v27 isEqualToString:@"MUID"])
    {
      uint64_t v28 = 2;
    }
    else if ([v27 isEqualToString:@"PLACE"])
    {
      uint64_t v28 = 3;
    }
    else
    {
      uint64_t v28 = 0;
    }

    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v26 intValue];
LABEL_41:
    [a1 setType:v28];
  }

  __int16 v29 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOLocation alloc];
    if (a3) {
      uint64_t v31 = [(GEOLocation *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOLocation *)v30 initWithDictionary:v29];
    }
    v32 = (void *)v31;
    [a1 setLocation:v31];
  }
  v33 = [v5 objectForKeyedSubscript:@"isCurrentLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v33, "BOOLValue"));
  }

  uint64_t v34 = [v5 objectForKeyedSubscript:@"clientFeatureID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setClientFeatureID:", objc_msgSend(v34, "unsignedLongLongValue"));
  }

LABEL_52:
  return a1;
}

- (GEOComposedWaypoint)initWithJSON:(id)a3
{
  return (GEOComposedWaypoint *)-[GEOComposedWaypoint _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_32;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_32;
    }
    GEOComposedWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOComposedWaypointCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOComposedWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOComposedWaypointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOComposedWaypointIsDirty((uint64_t)self))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOComposedWaypoint *)self readAll:0];
    if (self->_waypoint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_latLng) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapItemStorage) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_styleAttributesData) {
      PBDataWriterWriteDataField();
    }
    if (self->_uniqueWaypointID) {
      PBDataWriterWriteDataField();
    }
    if (self->_findMyHandleID) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v6 = (__int16)self->_flags;
    }
    if (v6) {
      PBDataWriterWriteUint64Field();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOComposedWaypoint _readLatLng]((uint64_t)self);
  if ([(GEOLatLng *)self->_latLng hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOComposedWaypoint _readLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_location hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOComposedWaypoint _readMapItemStorage]((uint64_t)self);
  if ([(GEOMapItemStorage *)self->_mapItemStorage hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOComposedWaypoint _readWaypoint]((uint64_t)self);
  waypoint = self->_waypoint;

  return [(GEOWaypointTyped *)waypoint hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOComposedWaypoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 22) = self->_readerMarkPos;
  *((_DWORD *)v7 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_waypoint) {
    objc_msgSend(v7, "setWaypoint:");
  }
  if (self->_latLng) {
    objc_msgSend(v7, "setLatLng:");
  }
  int v4 = v7;
  if (self->_mapItemStorage)
  {
    objc_msgSend(v7, "setMapItemStorage:");
    int v4 = v7;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_muid;
    *((_WORD *)v4 + 54) |= 2u;
  }
  if (self->_styleAttributesData)
  {
    objc_msgSend(v7, "setStyleAttributesData:");
    int v4 = v7;
  }
  if (self->_uniqueWaypointID)
  {
    objc_msgSend(v7, "setUniqueWaypointID:");
    int v4 = v7;
  }
  if (self->_findMyHandleID)
  {
    objc_msgSend(v7, "setFindMyHandleID:");
    int v4 = v7;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((unsigned char *)v4 + 105) = self->_isOutsideOfflineDownloadedRegion;
    *((_WORD *)v4 + 54) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_type;
    *((_WORD *)v4 + 54) |= 4u;
  }
  if (self->_location)
  {
    objc_msgSend(v7, "setLocation:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v4 + 104) = self->_isCurrentLocation;
    *((_WORD *)v4 + 54) |= 8u;
    __int16 v6 = (__int16)self->_flags;
  }
  if (v6)
  {
    v4[2] = self->_clientFeatureID;
    *((_WORD *)v4 + 54) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOComposedWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOComposedWaypoint *)self readAll:0];
  id v9 = [(GEOWaypointTyped *)self->_waypoint copyWithZone:a3];
  v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  id v11 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  objc_super v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 56) = self->_muid;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  uint64_t v15 = [(NSData *)self->_styleAttributesData copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  uint64_t v17 = [(NSData *)self->_uniqueWaypointID copyWithZone:a3];
  v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  uint64_t v19 = [(NSString *)self->_findMyHandleID copyWithZone:a3];
  v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 105) = self->_isOutsideOfflineDownloadedRegion;
    *(_WORD *)(v5 + 108) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_type;
    *(_WORD *)(v5 + 108) |= 4u;
  }
  id v22 = [(GEOLocation *)self->_location copyWithZone:a3];
  v23 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v22;

  __int16 v24 = (__int16)self->_flags;
  if ((v24 & 8) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_isCurrentLocation;
    *(_WORD *)(v5 + 108) |= 8u;
    __int16 v24 = (__int16)self->_flags;
  }
  if (v24)
  {
    *(void *)(v5 + 16) = self->_clientFeatureID;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOComposedWaypoint *)self readAll:1];
  [v4 readAll:1];
  waypoint = self->_waypoint;
  if ((unint64_t)waypoint | *((void *)v4 + 10))
  {
    if (!-[GEOWaypointTyped isEqual:](waypoint, "isEqual:")) {
      goto LABEL_47;
    }
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:")) {
      goto LABEL_47;
    }
  }
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((void *)v4 + 6))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 v8 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_muid != *((void *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_47;
  }
  styleAttributesData = self->_styleAttributesData;
  if ((unint64_t)styleAttributesData | *((void *)v4 + 8)
    && !-[NSData isEqual:](styleAttributesData, "isEqual:"))
  {
    goto LABEL_47;
  }
  uniqueWaypointID = self->_uniqueWaypointID;
  if ((unint64_t)uniqueWaypointID | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](uniqueWaypointID, "isEqual:")) {
      goto LABEL_47;
    }
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](findMyHandleID, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 54);
  if ((flags & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0) {
      goto LABEL_47;
    }
    if (self->_isOutsideOfflineDownloadedRegion)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_47;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_type != *((_DWORD *)v4 + 25)) {
      goto LABEL_47;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_47;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 5))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_47;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v13 = *((_WORD *)v4 + 54);
  }
  if ((flags & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_isCurrentLocation)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_47;
        }
        goto LABEL_43;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_43;
      }
    }
LABEL_47:
    BOOL v15 = 0;
    goto LABEL_48;
  }
  if ((v13 & 8) != 0) {
    goto LABEL_47;
  }
LABEL_43:
  BOOL v15 = (v13 & 1) == 0;
  if (flags)
  {
    if ((v13 & 1) == 0 || self->_clientFeatureID != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
    BOOL v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  [(GEOComposedWaypoint *)self readAll:1];
  unint64_t v17 = [(GEOWaypointTyped *)self->_waypoint hash];
  unint64_t v16 = [(GEOLatLng *)self->_latLng hash];
  unint64_t v3 = [(GEOMapItemStorage *)self->_mapItemStorage hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_styleAttributesData hash];
  uint64_t v6 = [(NSData *)self->_uniqueWaypointID hash];
  NSUInteger v7 = [(NSString *)self->_findMyHandleID hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v9 = 2654435761 * self->_isOutsideOfflineDownloadedRegion;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((flags & 4) != 0)
    {
LABEL_6:
      uint64_t v10 = 2654435761 * self->_type;
      goto LABEL_9;
    }
  }
  uint64_t v10 = 0;
LABEL_9:
  unint64_t v11 = [(GEOLocation *)self->_location hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isCurrentLocation;
    if (v12) {
      goto LABEL_11;
    }
LABEL_13:
    unint64_t v14 = 0;
    return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((v12 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v14 = 2654435761u * self->_clientFeatureID;
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  BOOL v15 = a3;
  [v15 readAll:0];
  unint64_t v4 = v15;
  waypoint = self->_waypoint;
  uint64_t v6 = v15[10];
  if (waypoint)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOWaypointTyped mergeFrom:](waypoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOComposedWaypoint setWaypoint:](self, "setWaypoint:");
  }
  unint64_t v4 = v15;
LABEL_7:
  latLng = self->_latLng;
  uint64_t v8 = v4[4];
  if (latLng)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOComposedWaypoint setLatLng:](self, "setLatLng:");
  }
  unint64_t v4 = v15;
LABEL_13:
  mapItemStorage = self->_mapItemStorage;
  uint64_t v10 = v4[6];
  if (mapItemStorage)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOComposedWaypoint setMapItemStorage:](self, "setMapItemStorage:");
  }
  unint64_t v4 = v15;
LABEL_19:
  if ((*((_WORD *)v4 + 54) & 2) != 0)
  {
    self->_muid = v4[7];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[8])
  {
    -[GEOComposedWaypoint setStyleAttributesData:](self, "setStyleAttributesData:");
    unint64_t v4 = v15;
  }
  if (v4[9])
  {
    -[GEOComposedWaypoint setUniqueWaypointID:](self, "setUniqueWaypointID:");
    unint64_t v4 = v15;
  }
  if (v4[3])
  {
    -[GEOComposedWaypoint setFindMyHandleID:](self, "setFindMyHandleID:");
    unint64_t v4 = v15;
  }
  __int16 v11 = *((_WORD *)v4 + 54);
  if ((v11 & 0x10) != 0)
  {
    self->_isOutsideOfflineDownloadedRegion = *((unsigned char *)v4 + 105);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v11 = *((_WORD *)v4 + 54);
  }
  if ((v11 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 4u;
  }
  location = self->_location;
  uint64_t v13 = v4[5];
  if (location)
  {
    if (!v13) {
      goto LABEL_37;
    }
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_37;
    }
    -[GEOComposedWaypoint setLocation:](self, "setLocation:");
  }
  unint64_t v4 = v15;
LABEL_37:
  __int16 v14 = *((_WORD *)v4 + 54);
  if ((v14 & 8) != 0)
  {
    self->_isCurrentLocation = *((unsigned char *)v4 + 104);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v14 = *((_WORD *)v4 + 54);
  }
  if (v14)
  {
    self->_clientFeatureID = v4[2];
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (GEOComposedWaypoint)initWithCompanionWaypoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 routeData];

  if (!v5)
  {
    __int16 v14 = [v4 mapItem];

    if (v14)
    {
      BOOL v15 = [GEOComposedWaypoint alloc];
      unint64_t v16 = [v4 mapItem];
      p_super = [(GEOComposedWaypoint *)v15 initWithMapItem:v16];

      -[GEOComposedWaypoint setIsCurrentLocation:](p_super, "setIsCurrentLocation:", [v4 isCurrentLocation]);
      [(GEOComposedWaypoint *)p_super recomputeGeoWaypointTyped];
      goto LABEL_7;
    }
    if ([v4 isCurrentLocation])
    {
      v18 = [GEOComposedWaypoint alloc];
      uint64_t v9 = [v4 location];
      uint64_t v19 = v18;
      v20 = v9;
      uint64_t v21 = 1;
    }
    else
    {
      id v22 = [v4 findMyHandleID];

      v23 = [GEOComposedWaypoint alloc];
      uint64_t v9 = [v4 location];
      if (v22)
      {
        __int16 v11 = [v4 findMyHandleID];
        __int16 v12 = [(GEOComposedWaypoint *)v23 initWithLocation:v9 findMyHandleID:v11];
        goto LABEL_3;
      }
      uint64_t v19 = v23;
      v20 = v9;
      uint64_t v21 = 0;
    }
    p_super = [(GEOComposedWaypoint *)v19 initWithLocation:v20 isCurrentLocation:v21];

    goto LABEL_4;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 routeData];
  uint64_t v24 = 0;
  uint64_t v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:&v24];

  uint64_t v10 = [[GEORouteBuilder_PersistentData alloc] initWithPersistentData:v9];
  __int16 v11 = [(GEORouteBuilderBase *)v10 buildRoute];

  __int16 v12 = [[GEOComposedWaypointToRoute alloc] initWithRoute:v11];
LABEL_3:
  p_super = &v12->super;

LABEL_4:
LABEL_7:

  return p_super;
}

- (BOOL)isSameAs:(id)a3
{
  return [(GEOComposedWaypoint *)self isSameAs:a3 comparisonCriteria:7];
}

- (BOOL)isSameAs:(id)a3 comparisonCriteria:(unint64_t)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (GEOComposedWaypoint *)a3;
  if (self != v6)
  {
    if ((a4 & 2) == 0
      || ([(GEOComposedWaypoint *)self _muidCandidatesForComparison],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [(GEOComposedWaypoint *)v6 _muidCandidatesForComparison],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 intersectsSet:v8],
          v8,
          v7,
          (v9 & 1) == 0))
    {
      if (a4)
      {
        __int16 v11 = [(GEOComposedWaypoint *)self _locationCandidatesForComparison];
        __int16 v12 = [(GEOComposedWaypoint *)v6 _locationCandidatesForComparison];
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        obuint64_t j = v11;
        uint64_t v13 = [obj countByEnumeratingWithState:&v129 objects:v140 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v130;
          v76 = self;
          v77 = v6;
          unint64_t v75 = a4;
          uint64_t v97 = *(void *)v130;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v130 != v15) {
                objc_enumerationMutation(obj);
              }
              unint64_t v17 = *(void **)(*((void *)&v129 + 1) + 8 * i);
              long long v125 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              id v18 = v12;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v125 objects:v139 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v126;
                do
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v126 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    id v23 = *(id *)(*((void *)&v125 + 1) + 8 * j);
                    id v24 = v17;
                    [v24 coordinate];
                    double v26 = v25;
                    double v28 = v27;
                    [v23 coordinate];
                    double v30 = v29;
                    double v32 = v31;

                    if (vabdd_f64(v26, v30) < 0.00000000999999994 && vabdd_f64(v28, v32) < 0.00000000999999994)
                    {
LABEL_67:
                      BOOL v10 = 1;
                      v50 = v18;
                      id v51 = obj;
                      uint64_t v6 = v77;
                      goto LABEL_68;
                    }
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v125 objects:v139 count:16];
                }
                while (v20);
              }

              uint64_t v15 = v97;
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v129 objects:v140 count:16];
            self = v76;
            uint64_t v6 = v77;
            a4 = v75;
          }
          while (v14);
        }
      }
      if ((a4 & 4) == 0) {
        goto LABEL_65;
      }
      unint64_t v75 = a4;
      v76 = self;
      v33 = [(GEOComposedWaypoint *)self _addressCandidatesForComparison];
      v77 = v6;
      v90 = [(GEOComposedWaypoint *)v6 _addressCandidatesForComparison];
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      obuint64_t j = v33;
      uint64_t v91 = [obj countByEnumeratingWithState:&v121 objects:v138 count:16];
      if (!v91) {
        goto LABEL_64;
      }
      uint64_t v89 = *(void *)v122;
      while (1)
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v122 != v89) {
            objc_enumerationMutation(obj);
          }
          uint64_t v92 = v34;
          v35 = *(void **)(*((void *)&v121 + 1) + 8 * v34);
          long long v117 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v18 = v90;
          uint64_t v36 = [v18 countByEnumeratingWithState:&v117 objects:v137 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v118;
            do
            {
              uint64_t v39 = 0;
              do
              {
                if (*(void *)v118 != v38) {
                  objc_enumerationMutation(v18);
                }
                v40 = *(void **)(*((void *)&v117 + 1) + 8 * v39);
                id v41 = v35;
                id v42 = v40;
                if (![v41 hasCountryCode]
                  || ![v42 hasCountryCode])
                {
                  goto LABEL_53;
                }
                v43 = [v41 countryCode];
                v44 = [v42 countryCode];
                if (![v43 isEqualToString:v44]
                  || ![v41 hasAdministrativeArea]
                  || ![v42 hasAdministrativeArea])
                {
                  goto LABEL_52;
                }
                uint64_t v45 = [v41 administrativeArea];
                uint64_t v46 = [v42 administrativeArea];
                v98 = (void *)v45;
                v47 = (void *)v45;
                v48 = (void *)v46;
                if (![v47 isEqualToString:v46]
                  || ![v41 hasLocality]
                  || ![v42 hasLocality])
                {
                  goto LABEL_51;
                }
                v94 = [v41 locality];
                v93 = [v42 locality];
                if (!objc_msgSend(v94, "isEqualToString:")
                  || ![v41 hasFullThoroughfare]
                  || ![v42 hasFullThoroughfare])
                {
                  goto LABEL_50;
                }
                v88 = [v41 fullThoroughfare];
                v87 = [v42 fullThoroughfare];
                if (!objc_msgSend(v88, "isEqualToString:"))
                {

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

                  goto LABEL_54;
                }
                v85 = [v41 postCode];
                v84 = [v42 postCode];
                if (objc_msgSend(v85, "isEqualToString:"))
                {
                  v82 = [v41 subLocality];
                  v81 = [v42 subLocality];
                  if (objc_msgSend(v82, "isEqualToString:"))
                  {
                    v80 = [v41 subAdministrativeArea];
                    v79 = [v42 subAdministrativeArea];
                    char v83 = [v80 isEqualToString:v79];
                  }
                  else
                  {
                    char v83 = 0;
                  }
                }
                else
                {
                  char v83 = 0;
                }

                if (v83) {
                  goto LABEL_67;
                }
LABEL_54:
                ++v39;
              }
              while (v37 != v39);
              uint64_t v49 = [v18 countByEnumeratingWithState:&v117 objects:v137 count:16];
              uint64_t v37 = v49;
            }
            while (v49);
          }

          uint64_t v34 = v92 + 1;
        }
        while (v92 + 1 != v91);
        uint64_t v91 = [obj countByEnumeratingWithState:&v121 objects:v138 count:16];
        if (!v91)
        {
LABEL_64:

          self = v76;
          uint64_t v6 = v77;
          LOBYTE(a4) = v75;
LABEL_65:
          if ((a4 & 8) == 0)
          {
            BOOL v10 = 0;
            goto LABEL_71;
          }
          id v18 = [(GEOComposedWaypoint *)self _regionCandidatesForContainment];
          if ([v18 count])
          {
            v50 = [(GEOComposedWaypoint *)v6 _regionCandidatesForContainment];
            v53 = [(GEOComposedWaypoint *)v6 _locationCandidatesForComparison];
            obuint64_t j = v53;
            if ([v50 count])
            {
              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v51 = v18;
              uint64_t v99 = [v51 countByEnumeratingWithState:&v113 objects:v136 count:16];
              if (v99)
              {
                uint64_t v54 = *(void *)v114;
                uint64_t v95 = *(void *)v114;
                do
                {
                  for (uint64_t k = 0; k != v99; ++k)
                  {
                    v56 = v6;
                    if (*(void *)v114 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    v57 = *(void **)(*((void *)&v113 + 1) + 8 * k);
                    long long v109 = 0u;
                    long long v110 = 0u;
                    long long v111 = 0u;
                    long long v112 = 0u;
                    id v58 = v50;
                    uint64_t v59 = [v58 countByEnumeratingWithState:&v109 objects:v135 count:16];
                    if (v59)
                    {
                      uint64_t v60 = v59;
                      uint64_t v61 = *(void *)v110;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v60; ++m)
                        {
                          if (*(void *)v110 != v61) {
                            objc_enumerationMutation(v58);
                          }
                          if (!objc_msgSend(v57, "containsRegion:", *(void *)(*((void *)&v109 + 1) + 8 * m), v75, v76))
                          {
                            uint64_t v6 = v56;
                            goto LABEL_111;
                          }
                        }
                        uint64_t v60 = [v58 countByEnumeratingWithState:&v109 objects:v135 count:16];
                        if (v60) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v54 = v95;
                    uint64_t v6 = v56;
                  }
                  BOOL v10 = 1;
                  uint64_t v99 = [v51 countByEnumeratingWithState:&v113 objects:v136 count:16];
                }
                while (v99);
                id v18 = v51;
                v50 = v58;
                goto LABEL_68;
              }
LABEL_109:
              BOOL v10 = 1;
              id v18 = v51;
              goto LABEL_68;
            }
            if ([v53 count])
            {
              long long v107 = 0u;
              long long v108 = 0u;
              long long v105 = 0u;
              long long v106 = 0u;
              id v51 = v18;
              uint64_t v100 = [v51 countByEnumeratingWithState:&v105 objects:v134 count:16];
              if (!v100) {
                goto LABEL_109;
              }
              uint64_t v63 = *(void *)v106;
              v78 = v6;
              uint64_t v96 = *(void *)v106;
              do
              {
                uint64_t v64 = 0;
                v65 = obj;
                do
                {
                  if (*(void *)v106 != v63)
                  {
                    objc_enumerationMutation(v51);
                    v65 = obj;
                  }
                  v66 = *(void **)(*((void *)&v105 + 1) + 8 * v64);
                  long long v101 = 0u;
                  long long v102 = 0u;
                  long long v103 = 0u;
                  long long v104 = 0u;
                  id v58 = v65;
                  uint64_t v67 = [v58 countByEnumeratingWithState:&v101 objects:v133 count:16];
                  if (v67)
                  {
                    uint64_t v68 = v67;
                    uint64_t v69 = *(void *)v102;
                    while (2)
                    {
                      for (uint64_t n = 0; n != v68; ++n)
                      {
                        if (*(void *)v102 != v69) {
                          objc_enumerationMutation(v58);
                        }
                        v71 = *(void **)(*((void *)&v101 + 1) + 8 * n);
                        objc_msgSend(v71, "lat", v75, v76);
                        double v73 = v72;
                        [v71 lng];
                        if (!objc_msgSend(v66, "containsCoordinate:", v73, v74))
                        {
                          uint64_t v6 = v78;
LABEL_111:

                          BOOL v10 = 0;
                          id v51 = v18;
                          goto LABEL_68;
                        }
                      }
                      uint64_t v68 = [v58 countByEnumeratingWithState:&v101 objects:v133 count:16];
                      if (v68) {
                        continue;
                      }
                      break;
                    }
                  }

                  ++v64;
                  uint64_t v63 = v96;
                  uint64_t v6 = v78;
                  v65 = obj;
                }
                while (v64 != v100);
                BOOL v10 = 1;
                uint64_t v100 = [v51 countByEnumeratingWithState:&v105 objects:v134 count:16];
              }
              while (v100);
              id v18 = v51;
              obuint64_t j = v58;
LABEL_68:

              id v18 = v51;
            }
            else
            {
              BOOL v10 = 0;
            }
          }
          else
          {
            BOOL v10 = 0;
          }

          goto LABEL_71;
        }
      }
    }
  }
  BOOL v10 = 1;
LABEL_71:

  return v10;
}

- (id)_muidCandidatesForComparison
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(GEOComposedWaypoint *)self waypoint];
  uint64_t v5 = [v4 waypointId];
  int v6 = [v5 hasMuid];

  if (v6)
  {
    uint64_t v7 = NSNumber;
    uint64_t v8 = [(GEOComposedWaypoint *)self waypoint];
    char v9 = [v8 waypointId];
    BOOL v10 = objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid"));
    [v3 addObject:v10];
  }
  __int16 v11 = [(GEOComposedWaypoint *)self mapItemStorage];
  __int16 v12 = [v11 placeData];
  int v13 = [v12 hasPreferredMuid];

  if (v13)
  {
    uint64_t v14 = NSNumber;
    uint64_t v15 = [(GEOComposedWaypoint *)self mapItemStorage];
    unint64_t v16 = [v15 placeData];
    unint64_t v17 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v16, "preferredMuid"));
    [v3 addObject:v17];
  }
  id v18 = [(GEOComposedWaypoint *)self mapItemStorage];
  uint64_t v19 = [v18 placeData];
  int v20 = [v19 hasMuid];

  if (v20)
  {
    uint64_t v21 = NSNumber;
    id v22 = [(GEOComposedWaypoint *)self mapItemStorage];
    id v23 = [v22 placeData];
    id v24 = objc_msgSend(v21, "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
    [v3 addObject:v24];
  }
  double v25 = [(GEOComposedWaypoint *)self mapItemStorage];
  double v26 = [v25 placeData];
  double v27 = [v26 mapsId];
  double v28 = [v27 shardedId];
  int v29 = [v28 hasMuid];

  if (v29)
  {
    double v30 = NSNumber;
    double v31 = [(GEOComposedWaypoint *)self mapItemStorage];
    double v32 = [v31 placeData];
    v33 = [v32 mapsId];
    uint64_t v34 = [v33 shardedId];
    v35 = objc_msgSend(v30, "numberWithUnsignedLongLong:", objc_msgSend(v34, "muid"));
    [v3 addObject:v35];
  }

  return v3;
}

- (id)_locationCandidatesForComparison
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(GEOComposedWaypoint *)self waypoint];
  uint64_t v5 = [v4 waypointId];
  int v6 = [v5 hasLocationHint];

  if (v6)
  {
    uint64_t v7 = [(GEOComposedWaypoint *)self waypoint];
    uint64_t v8 = [v7 waypointId];
    char v9 = [v8 locationHint];
    [v3 addObject:v9];
  }
  BOOL v10 = [(GEOComposedWaypoint *)self waypoint];
  __int16 v11 = [v10 waypointPlace];
  int v12 = [v11 hasCenter];

  if (v12)
  {
    int v13 = [(GEOComposedWaypoint *)self waypoint];
    uint64_t v14 = [v13 waypointPlace];
    uint64_t v15 = [v14 center];
    [v3 addObject:v15];
  }
  unint64_t v16 = [(GEOComposedWaypoint *)self waypoint];
  unint64_t v17 = [v16 waypointLocation];
  id v18 = [v17 location];
  uint64_t v19 = [v18 latLng];

  if (v19)
  {
    int v20 = [(GEOComposedWaypoint *)self waypoint];
    uint64_t v21 = [v20 waypointLocation];
    id v22 = [v21 location];
    id v23 = [v22 latLng];
    [v3 addObject:v23];
  }
  id v24 = [(GEOComposedWaypoint *)self mapItemStorage];
  double v25 = [v24 place];
  int v26 = [v25 hasCenter];

  if (v26)
  {
    double v27 = [(GEOComposedWaypoint *)self mapItemStorage];
    double v28 = [v27 place];
    int v29 = [v28 center];
    [v3 addObject:v29];
  }
  if ([(GEOComposedWaypoint *)self hasLatLng])
  {
    double v30 = [(GEOComposedWaypoint *)self latLng];
    [v3 addObject:v30];
  }

  return v3;
}

- (id)_addressCandidatesForComparison
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(GEOComposedWaypoint *)self waypoint];
  uint64_t v5 = [v4 waypointId];
  int v6 = [v5 hasAddressHint];

  if (v6)
  {
    uint64_t v7 = [(GEOComposedWaypoint *)self waypoint];
    uint64_t v8 = [v7 waypointId];
    char v9 = [v8 addressHint];
    [v3 addObject:v9];
  }
  BOOL v10 = [(GEOComposedWaypoint *)self mapItemStorage];
  __int16 v11 = [v10 place];
  int v12 = [v11 address];
  int v13 = [v12 hasStructuredAddress];

  if (v13)
  {
    uint64_t v14 = [(GEOComposedWaypoint *)self mapItemStorage];
    uint64_t v15 = [v14 place];
    unint64_t v16 = [v15 address];
    unint64_t v17 = [v16 structuredAddress];
    [v3 addObject:v17];
  }
  id v18 = [(GEOComposedWaypoint *)self mapItemStorage];
  uint64_t v19 = [v18 geoAddress];
  int v20 = [v19 hasStructuredAddress];

  if (v20)
  {
    uint64_t v21 = [(GEOComposedWaypoint *)self mapItemStorage];
    id v22 = [v21 geoAddress];
    id v23 = [v22 structuredAddress];
    [v3 addObject:v23];
  }

  return v3;
}

- (id)_regionCandidatesForContainment
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(GEOComposedWaypoint *)self mapItemStorage];
  uint64_t v5 = [v4 geoFenceMapRegion];

  if (v5)
  {
    int v6 = [(GEOComposedWaypoint *)self mapItemStorage];
    uint64_t v7 = [v6 geoFenceMapRegion];
    [v3 addObject:v7];
  }

  return v3;
}

- (GEOComposedWaypoint)initWithLocation:(id)a3 findMyHandleID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(GEOComposedWaypoint *)self initWithLocation:a3 isCurrentLocation:0];
  uint64_t v8 = (void *)[v6 copy];

  [(GEOComposedWaypoint *)v7 setFindMyHandleID:v8];
  [(GEOComposedWaypoint *)v7 recomputeGeoWaypointTyped];
  return v7;
}

- (void)recomputeGeoWaypointTyped
{
  id v3 = [(GEOComposedWaypoint *)self geoWaypointTyped];
  [(GEOComposedWaypoint *)self setWaypoint:v3];
}

- (id)uniqueID
{
  id v3 = [(GEOComposedWaypoint *)self uniqueWaypointID];

  if (!v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    [(GEOComposedWaypoint *)self setUniqueWaypointID:v4];
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = [(GEOComposedWaypoint *)self uniqueWaypointID];
  uint64_t v7 = objc_msgSend(v5, "_geo_uuidForData:", v6);

  return v7;
}

- (id)name
{
  v2 = [(GEOComposedWaypoint *)self geoMapItem];
  id v3 = [v2 name];

  return v3;
}

- (void)setStyleAttributes:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(self, &_geowaypoint_styleAttributesKey);
  unint64_t v5 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  unint64_t value = (unint64_t)v4;
  if (value | v5)
  {
    char v6 = [(id)v5 isEqual:value];

    if ((v6 & 1) == 0)
    {
      objc_setAssociatedObject(self, &_geowaypoint_styleAttributesKey, (id)value, (void *)1);
      uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:value requiringSecureCoding:1 error:0];
      [(GEOComposedWaypoint *)self setStyleAttributesData:v7];
    }
  }
}

- (id)styleAttributes
{
  id v3 = objc_getAssociatedObject(self, &_geowaypoint_styleAttributesKey);
  if (!v3)
  {
    id v4 = [(GEOComposedWaypoint *)self styleAttributesData];

    if (v4)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = [(GEOComposedWaypoint *)self styleAttributesData];
      id v3 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:0];

      if (v3) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = [(GEOComposedWaypoint *)self mapItemStorage];
    id v3 = [v8 _styleAttributes];

    if (v3) {
LABEL_5:
    }
      objc_setAssociatedObject(self, &_geowaypoint_styleAttributesKey, v3, (void *)1);
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_styleAttributes);
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = NSStringFromSelector(sel_styleAttributesData);
    char v9 = [v7 setWithObject:v8];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___GEOComposedWaypoint;
    char v9 = objc_msgSendSuper2(&v11, sel_keyPathsForValuesAffectingValueForKey_, v4);
  }

  return v9;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  v2 = [(GEOComposedWaypoint *)self latLng];
  [v2 coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = 1.79769313e308;
  double v8 = v4;
  double v9 = v6;
  result.var2 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)timezone
{
  v2 = [(GEOComposedWaypoint *)self geoMapItem];
  double v3 = [v2 timezone];

  return v3;
}

- (int)waypointCategory
{
  double v3 = [(GEOComposedWaypoint *)self findMyHandleID];

  if (!v3)
  {
    double v5 = [(GEOComposedWaypoint *)self geoMapItem];
    double v6 = v5;
    if (!v5)
    {
      int v4 = 8;
      goto LABEL_27;
    }
    double v7 = [v5 contactName];
    int v8 = [v6 contactAddressType];
    switch(v8)
    {
      case 3:
        if ([v6 contactIsMe])
        {
          int v4 = 10;
          goto LABEL_26;
        }
        if ([v7 length])
        {
          int v4 = 11;
          goto LABEL_26;
        }
        break;
      case 2:
        if ([v6 contactIsMe])
        {
          int v4 = 1;
          goto LABEL_26;
        }
        if ([v7 length])
        {
          int v4 = 3;
          goto LABEL_26;
        }
        break;
      case 1:
        if ([v6 contactIsMe])
        {
          int v4 = 2;
LABEL_26:

LABEL_27:
          return v4;
        }
        if ([v7 length])
        {
          int v4 = 4;
          goto LABEL_26;
        }
        break;
    }
    if ([v7 length])
    {
      int v4 = 5;
    }
    else if ([v6 _muid])
    {
      int v4 = 6;
    }
    else
    {
      double v9 = [v6 addressObject];

      if (v9) {
        int v4 = 7;
      }
      else {
        int v4 = 0;
      }
    }
    goto LABEL_26;
  }
  return 12;
}

- (id)artwork
{
  return 0;
}

- (int)mapDisplayType
{
  v2 = [(GEOComposedWaypoint *)self geoMapItem];
  int v3 = [v2 mapDisplayType];

  return v3;
}

- (BOOL)isLocationWaypointType
{
  return [(GEOComposedWaypoint *)self type] == 1;
}

- (BOOL)isAddressWaypointType
{
  v2 = [(GEOComposedWaypoint *)self geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 3;

  return v3;
}

- (BOOL)isServerProvidedWaypoint
{
  return 0;
}

- (id)chargingInfo
{
  return 0;
}

- (id)displayInfo
{
  return 0;
}

- (id)route
{
  return 0;
}

+ (id)composedWaypointForIdentifier:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = a7;
    id v15 = a4;
    id v16 = a3;
    unint64_t v17 = +[GEOMapService sharedService];
    v25[0] = v16;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v19 = [v17 ticketForIdentifiers:v18 traits:v15];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIdentifier_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v21[3] = &unk_1E53DC4F8;
    id v24 = a1;
    id v22 = v12;
    id v23 = v13;
    [v19 submitWithHandler:v21 networkActivity:v14];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIdentifier_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) composedWaypointForMapServiceResponse:a2 clientAttributes:*(void *)(a1 + 32) error:a3 handler:*(void *)(a1 + 40)];
}

+ (id)composedWaypointForID:(unint64_t)a3 resultsProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v15 = a7;
  id v16 = a8;
  if (v16)
  {
    id v17 = a9;
    id v18 = a6;
    id v19 = a5;
    int v20 = +[GEOMapService sharedService];
    uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a3];
    v29[0] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v23 = [v20 ticketForMUIDs:v22 resultProviderID:v12 contentProvider:v19 traits:v18];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __163__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForID_resultsProviderID_contentProvider_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v25[3] = &unk_1E53DC4F8;
    id v28 = a1;
    id v26 = v15;
    id v27 = v16;
    [v23 submitWithHandler:v25 networkActivity:v17];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

uint64_t __163__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForID_resultsProviderID_contentProvider_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) composedWaypointForMapServiceResponse:a2 clientAttributes:*(void *)(a1 + 32) error:a3 handler:*(void *)(a1 + 40)];
}

+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)[a1 composedWaypointForLocation:a3 mapItem:a4 traits:a5 auditToken:0 completionHandler:a6 networkActivityHandler:a7];
}

+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 auditToken:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v18)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke;
    v34[3] = &unk_1E53EC3A8;
    id v20 = v14;
    id v35 = v20;
    id v21 = v17;
    id v36 = v21;
    id v22 = v19;
    id v37 = v22;
    id v39 = a1;
    id v38 = v18;
    id v23 = (void (**)(void, void))MEMORY[0x18C120660](v34);
    if ([v15 isValid])
    {
      ((void (**)(void, id))v23)[2](v23, v15);
      id v24 = 0;
    }
    else
    {
      +[GEOMapService sharedService];
      id v31 = v17;
      id v25 = v14;
      v27 = id v26 = v16;
      [v20 coordinate];
      id v24 = objc_msgSend(v27, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", objc_msgSend(v15, "referenceFrame") == 1, v26, v28, v29);

      id v16 = v26;
      id v14 = v25;
      id v17 = v31;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_5;
      v32[3] = &unk_1E53DA278;
      v33 = v23;
      [v24 submitWithHandler:v32 auditToken:v21 timeout:0 networkActivity:v22];
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) referenceFrame] == 1
    && ([*(id *)(a1 + 32) coordinate],
        +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
  {
    int v4 = objc_alloc_init(GEOLocationShifter);
    double v5 = (void *)[*(id *)(a1 + 32) copy];
    double v6 = [*(id *)(a1 + 32) latLng];
    [*(id *)(a1 + 32) horizontalAccuracy];
    double v8 = v7;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_2;
    v18[3] = &unk_1E53EC358;
    uint64_t v9 = *(void *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v19 = v5;
    uint64_t v23 = *(void *)(a1 + 64);
    id v20 = v3;
    id v22 = *(id *)(a1 + 56);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_3;
    v16[3] = &unk_1E53DA028;
    id v17 = *(id *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_4;
    v13[3] = &unk_1E53EC380;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v10 = v5;
    global_queue = (void *)geo_get_global_queue();
    [(GEOLocationShifter *)v4 shiftLatLng:v6 accuracy:v9 auditToken:v18 withCompletionHandler:v16 mustGoToNetworkCallback:v13 errorHandler:global_queue callbackQueue:v8];
  }
  else
  {
    int v4 = (GEOLocationShifter *)[objc_alloc(*(Class *)(a1 + 64)) initWithLocation:*(void *)(a1 + 32) isCurrentLocation:0];
    if (v3)
    {
      uint64_t v12 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v3];
      [(GEOLocationShifter *)v4 setMapItemStorage:v12];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  double v8 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  id v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a2, a3);
  [*(id *)(a1 + 32) setLatLng:v10];
  [*(id *)(a1 + 32) setHorizontalAccuracy:a4];
  [*(id *)(a1 + 32) setReferenceFrame:2];
  objc_super v11 = (void *)[objc_alloc(*(Class *)(a1 + 64)) initWithLocation:*(void *)(a1 + 32) isCurrentLocation:0];
  if (*(void *)(a1 + 40))
  {
    uint64_t v12 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:");
    [v11 setMapItemStorage:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [a2 firstObject];
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  return (id)[a1 composedWaypointForCurrentLocation:a3 traits:a4 auditToken:0 completionHandler:a5 networkActivityHandler:a6];
}

+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __136__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForCurrentLocation_traits_auditToken_completionHandler_networkActivityHandler___block_invoke;
  v16[3] = &unk_1E53EC3D0;
  id v17 = v12;
  id v13 = v12;
  id v14 = [a1 composedWaypointForLocation:a3 mapItem:0 traits:a4 auditToken:a5 completionHandler:v16 networkActivityHandler:a7];

  return v14;
}

void __136__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForCurrentLocation_traits_auditToken_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 setIsCurrentLocation:1];
  [v6 recomputeGeoWaypointTyped];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)composedWaypointForAddressString:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = a7;
    id v15 = a4;
    id v16 = a3;
    id v17 = +[GEOMapService sharedService];
    id v18 = [v17 ticketForForwardGeocodeString:v16 maxResults:1 traits:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __140__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForAddressString_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v20[3] = &unk_1E53DC4F8;
    id v23 = a1;
    id v21 = v12;
    id v22 = v13;
    [v18 submitWithHandler:v20 networkActivity:v14];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __140__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForAddressString_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) composedWaypointForMapServiceResponse:a2 clientAttributes:*(void *)(a1 + 32) error:a3 handler:*(void *)(a1 + 40)];
}

+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  return (id)[a1 composedWaypointForSearchString:a3 completionItem:a4 traits:a5 clientAttributes:a6 clientResolvedCompletionHandler:0 completionHandler:a7 networkActivityHandler:a8];
}

+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 clientResolvedCompletionHandler:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = (void (**)(id, void *))a7;
  id v20 = a8;
  id v21 = a9;
  if (!v20) {
    goto LABEL_8;
  }
  if (!v19 && [v17 knownClientResolvedTypesCount])
  {
    id v22 = (void *)[v17 copy];

    [v22 clearKnownClientResolvedTypes];
    id v17 = v22;
  }
  id v23 = [v16 clientResolved];
  int v24 = [v23 itemType];

  if (v19 && v24)
  {
    id v25 = [v16 clientResolved];
    v19[2](v19, v25);

LABEL_8:
    id v26 = 0;
    goto LABEL_10;
  }
  id v27 = +[GEOMapService sharedService];
  double v28 = [v27 ticketForSearchQuery:v15 completionItem:v16 maxResults:1 traits:v17 searchSessionData:0];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __186__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForSearchString_completionItem_traits_clientAttributes_clientResolvedCompletionHandler_completionHandler_networkActivityHandler___block_invoke;
  v32[3] = &unk_1E53EC3F8;
  id v29 = v28;
  id v33 = v29;
  id v37 = a1;
  id v34 = v18;
  id v35 = v20;
  id v36 = v19;
  [v29 submitWithHandler:v32 networkActivity:v21];
  double v30 = v36;
  id v26 = v29;

LABEL_10:

  return v26;
}

void __186__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForSearchString_completionItem_traits_clientAttributes_clientResolvedCompletionHandler_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) clientResolvedResult];
  if (!v7) {
    goto LABEL_9;
  }
  double v8 = (void *)v7;
  uint64_t v9 = [*(id *)(a1 + 32) clientResolvedResult];
  int v10 = [v9 itemType];

  if (!v10) {
    goto LABEL_9;
  }
  objc_super v11 = [*(id *)(a1 + 32) clientResolvedResult];
  if ([v11 itemType] != 5)
  {

LABEL_7:
    uint64_t v19 = *(void *)(a1 + 56);
    if (v19)
    {
      id v20 = [*(id *)(a1 + 32) clientResolvedResult];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

      goto LABEL_10;
    }
LABEL_9:
    [*(id *)(a1 + 64) composedWaypointForMapServiceResponse:v5 clientAttributes:*(void *)(a1 + 40) error:v6 handler:*(void *)(a1 + 48)];
    goto LABEL_10;
  }
  id v12 = [*(id *)(a1 + 32) clientResolvedResult];
  unint64_t v13 = [v12 resultIndex];
  unint64_t v14 = [v5 count];

  if (v13 >= v14) {
    goto LABEL_7;
  }
  id v15 = *(void **)(a1 + 64);
  id v16 = [*(id *)(a1 + 32) clientResolvedResult];
  id v17 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v16, "resultIndex"));
  v21[0] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v15 composedWaypointForMapServiceResponse:v18 clientAttributes:*(void *)(a1 + 40) error:v6 handler:*(void *)(a1 + 48)];

LABEL_10:
}

+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)[a1 composedWaypointForMapItemToRefine:a3 traits:a4 auditToken:0 clientAttributes:a5 completionHandler:a6 networkActivityHandler:a7];
}

+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = a8;
    id v17 = a5;
    id v18 = a4;
    id v19 = a3;
    id v20 = +[GEOMapService sharedService];
    id v21 = [v20 ticketForMapItemToRefine:v19 traits:v18];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __153__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForMapItemToRefine_traits_auditToken_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v23[3] = &unk_1E53DC4F8;
    id v26 = a1;
    id v24 = v14;
    id v25 = v15;
    [v21 submitWithHandler:v23 auditToken:v17 timeout:0 networkActivity:v16];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __153__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForMapItemToRefine_traits_auditToken_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) composedWaypointForMapServiceResponse:a2 clientAttributes:*(void *)(a1 + 32) error:a3 handler:*(void *)(a1 + 40)];
}

+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)[a1 composedWaypointForMapItem:a3 traits:a4 auditToken:0 clientAttributes:a5 completionHandler:a6 networkActivityHandler:a7];
}

+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void))a7;
  id v19 = a8;
  if (v18)
  {
    id v20 = [v14 _enhancedPlacement];
    if (v20) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = [v14 _muid] != 0;
    }

    if (![v14 isValid]
      || ([v14 centerCoordinate], v23 < -180.0)
      || v23 > 180.0
      || v22 < -90.0
      || v22 > 90.0
      || v21)
    {
      id v25 = [a1 composedWaypointForMapItemToRefine:v14 traits:v15 auditToken:v16 clientAttributes:v17 completionHandler:v18 networkActivityHandler:v19];
      goto LABEL_17;
    }
    if (v17)
    {
      id v24 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14 clientAttributes:v17];
    }
    else
    {
      id v26 = [v14 _clientAttributes];
      id v24 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14 clientAttributes:v26];
    }
    id v27 = (void *)[objc_alloc((Class)a1) initWithMapItem:v24];
    v18[2](v18, v27, 0);
  }
  id v25 = 0;
LABEL_17:

  return v25;
}

+ (id)composedWaypointForIncompleteMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __144__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIncompleteMapItem_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    id v25 = &unk_1E53EC420;
    id v15 = v12;
    id v26 = v15;
    id v16 = v13;
    id v27 = v16;
    id v29 = a1;
    id v28 = v14;
    id v17 = a7;
    id v18 = a4;
    id v19 = (void *)MEMORY[0x18C120660](&v22);
    id v20 = objc_msgSend(a1, "composedWaypointForMapItemToRefine:traits:clientAttributes:completionHandler:networkActivityHandler:", v15, v18, v16, v19, v17, v22, v23, v24, v25);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __144__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIncompleteMapItem_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5)
  {
    if ([*(id *)(a1 + 32) isValid])
    {
      [*(id *)(a1 + 32) centerCoordinate];
      if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (*(void *)(a1 + 40))
        {
          uint64_t v9 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", *(void *)(a1 + 32));
        }
        else
        {
          int v10 = [*(id *)(a1 + 32) _clientAttributes];
          uint64_t v9 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v8 clientAttributes:v10];
        }
        uint64_t v11 = [objc_alloc(*(Class *)(a1 + 56)) initWithMapItem:v9];

        id v5 = 0;
        id v12 = (id)v11;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)composedWaypointForTransitID:(unint64_t)a3 coordinate:(id)a4 isCurrentLocation:(BOOL)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = a9;
    id v20 = a6;
    BOOL v21 = +[GEOMapService sharedService];
    uint64_t v22 = [NSNumber numberWithUnsignedLongLong:a3];
    v33[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v24 = [v21 ticketForMUIDs:v23 traits:v20];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v26[3] = &unk_1E53EC470;
    id v29 = a1;
    id v27 = v17;
    BOOL v32 = a5;
    id v28 = v18;
    double v30 = var0;
    double v31 = var1;
    [v24 submitWithHandler:v26 networkActivity:v19];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = *(double *)(a1 + 64);
    if (v7 >= -180.0 && v7 <= 180.0)
    {
      double v8 = *(double *)(a1 + 56);
      if (v8 >= -90.0 && v8 <= 90.0)
      {
        uint64_t v9 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
        int v10 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithLocation:v9 isCurrentLocation:*(unsigned __int8 *)(a1 + 72)];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke_2;
    v13[3] = &unk_1E53EC448;
    char v15 = *(unsigned char *)(a1 + 72);
    id v12 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    [v12 composedWaypointForMapServiceResponse:v5 clientAttributes:v11 error:0 handler:v13];
  }
}

void __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v7 setIsCurrentLocation:v5];
  [v7 recomputeGeoWaypointTyped];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)composedWaypointForWaypointTyped:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    goto LABEL_6;
  }
  int v10 = [v7 waypointType];
  if (v10 == 4)
  {
    uint64_t v11 = [v7 waypointLocation];
    id v16 = [v11 location];
LABEL_9:
    uint64_t v17 = +[GEOComposedWaypoint composedWaypointForLocation:v16 mapItem:0 traits:0 completionHandler:v8 networkActivityHandler:v9];
    goto LABEL_10;
  }
  if (v10 == 3)
  {
    uint64_t v11 = [v7 waypointPlace];
    id v19 = [GEOLocation alloc];
    id v20 = [v11 center];
    id v16 = [(GEOLocation *)v19 initWithLocation:v20];

    goto LABEL_9;
  }
  if (v10 != 2)
  {
LABEL_6:
    id v18 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = [v7 waypointId];
  id v12 = [GEOMapItemIdentifier alloc];
  uint64_t v13 = [v11 muid];
  uint64_t v14 = [v11 resultProviderId];
  char v15 = [v11 locationHint];
  [v15 coordinate];
  id v16 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v12, "initWithMUID:resultProviderID:coordinate:", v13, v14);

  uint64_t v17 = +[GEOComposedWaypoint composedWaypointForIdentifier:v16 traits:0 clientAttributes:0 completionHandler:v8 networkActivityHandler:v9];
LABEL_10:
  id v18 = (void *)v17;

LABEL_11:

  return v18;
}

+ (void)composedWaypointForMapServiceResponse:(id)a3 clientAttributes:(id)a4 error:(id)a5 handler:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void (**)(void, void, void))v12;
  if (v12)
  {
    if (v11)
    {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v11);
    }
    else
    {
      uint64_t v14 = [v19 firstObject];
      char v15 = v14;
      if (v14
        && [v14 isValid]
        && ([v15 conformsToProtocol:&unk_1ED78BC80] & 1) != 0)
      {
        if (v10)
        {
          id v16 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v15 clientAttributes:v10];
        }
        else
        {
          uint64_t v17 = [v15 _clientAttributes];
          id v16 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v15 clientAttributes:v17];
        }
        id v18 = (void *)[objc_alloc((Class)a1) initWithMapItem:v16];
        ((void (**)(void, void *, void))v13)[2](v13, v18, 0);
      }
      else
      {
        id v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
        ((void (**)(void, void, void *))v13)[2](v13, 0, v16);
      }
    }
  }
}

- (id)bestLatLng
{
  v2 = [(GEOComposedWaypoint *)self location];
  uint64_t v3 = [v2 latLng];

  return v3;
}

- (id)convertToStaticLocation
{
  if ([(GEOComposedWaypoint *)self isCurrentLocation])
  {
    uint64_t v3 = (GEOComposedWaypoint *)[(GEOComposedWaypoint *)self copy];
    [(GEOComposedWaypoint *)v3 setIsCurrentLocation:0];
    [(GEOComposedWaypoint *)v3 recomputeGeoWaypointTyped];
  }
  else
  {
    uint64_t v3 = self;
  }

  return v3;
}

- (GEOWaypointInfo)geoWaypointInfo
{
  uint64_t v3 = objc_opt_new();
  if ([(GEOComposedWaypoint *)self isServerProvidedWaypoint]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v3 setSource:v4];
  uint64_t v5 = [(GEOComposedWaypoint *)self uniqueID];
  id v6 = objc_msgSend(v5, "_geo_waypointUUID");
  [v3 setUniqueWaypointId:v6];

  return (GEOWaypointInfo *)v3;
}

@end