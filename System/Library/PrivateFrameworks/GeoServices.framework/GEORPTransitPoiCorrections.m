@interface GEORPTransitPoiCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)businessHoursType;
- (BOOL)hasAccessPoint;
- (BOOL)hasAmenity;
- (BOOL)hasContainmentCorrections;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLineScheduleDelay;
- (BOOL)hasLineShapeIncorrect;
- (BOOL)hasMapLocation;
- (BOOL)hasName;
- (BOOL)hasOriginalName;
- (BOOL)isEqual:(id)a3;
- (BOOL)lineScheduleDelay;
- (BOOL)lineShapeIncorrect;
- (BOOL)readFrom:(id)a3;
- (GEORPAccessPointCorrections)accessPoint;
- (GEORPAmenityCorrections)amenity;
- (GEORPCorrectedCoordinate)coordinate;
- (GEORPMapLocation)mapLocation;
- (GEORPPlaceContainmentCorrections)containmentCorrections;
- (GEORPTransitPoiCorrections)init;
- (GEORPTransitPoiCorrections)initWithData:(id)a3;
- (GEORPTransitPoiCorrections)initWithDictionary:(id)a3;
- (GEORPTransitPoiCorrections)initWithJSON:(id)a3;
- (NSMutableArray)businessHours;
- (NSString)name;
- (NSString)originalName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)businessHoursAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)businessHoursCount;
- (unint64_t)hash;
- (void)_addNoFlagsBusinessHours:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAccessPoint;
- (void)_readAmenity;
- (void)_readBusinessHours;
- (void)_readContainmentCorrections;
- (void)_readCoordinate;
- (void)_readMapLocation;
- (void)_readName;
- (void)_readOriginalName;
- (void)addBusinessHours:(id)a3;
- (void)clearBusinessHours;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessPoint:(id)a3;
- (void)setAmenity:(id)a3;
- (void)setBusinessHours:(id)a3;
- (void)setContainmentCorrections:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasLineScheduleDelay:(BOOL)a3;
- (void)setHasLineShapeIncorrect:(BOOL)a3;
- (void)setLineScheduleDelay:(BOOL)a3;
- (void)setLineShapeIncorrect:(BOOL)a3;
- (void)setMapLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginalName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTransitPoiCorrections

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[v6 copy];
        [a1 setName:v7];
      }
      v8 = [v5 objectForKeyedSubscript:@"amenity"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEORPAmenityCorrections alloc];
        if (a3) {
          uint64_t v10 = [(GEORPAmenityCorrections *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEORPAmenityCorrections *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setAmenity:v10];
      }
      if (a3) {
        v12 = @"businessHours";
      }
      else {
        v12 = @"business_hours";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = v5;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v52 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v20 = [GEORPFeedbackBusinessHours alloc];
                if (a3) {
                  uint64_t v21 = [(GEORPFeedbackBusinessHours *)v20 initWithJSON:v19];
                }
                else {
                  uint64_t v21 = [(GEORPFeedbackBusinessHours *)v20 initWithDictionary:v19];
                }
                v22 = (void *)v21;
                [a1 addBusinessHours:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }
          while (v16);
        }

        id v5 = v50;
      }

      v23 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEORPCorrectedCoordinate alloc];
        if (a3) {
          uint64_t v25 = [(GEORPCorrectedCoordinate *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEORPCorrectedCoordinate *)v24 initWithDictionary:v23];
        }
        v26 = (void *)v25;
        [a1 setCoordinate:v25];
      }
      if (a3) {
        v27 = @"mapLocation";
      }
      else {
        v27 = @"map_location";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = [GEORPMapLocation alloc];
        if (a3) {
          uint64_t v30 = [(GEORPMapLocation *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEORPMapLocation *)v29 initWithDictionary:v28];
        }
        v31 = (void *)v30;
        [a1 setMapLocation:v30];
      }
      if (a3) {
        v32 = @"lineShapeIncorrect";
      }
      else {
        v32 = @"line_shape_incorrect";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineShapeIncorrect:", objc_msgSend(v33, "BOOLValue"));
      }

      if (a3) {
        v34 = @"lineScheduleDelay";
      }
      else {
        v34 = @"line_schedule_delay";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineScheduleDelay:", objc_msgSend(v35, "BOOLValue"));
      }

      if (a3) {
        v36 = @"accessPoint";
      }
      else {
        v36 = @"access_point";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = [GEORPAccessPointCorrections alloc];
        if (a3) {
          uint64_t v39 = [(GEORPAccessPointCorrections *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEORPAccessPointCorrections *)v38 initWithDictionary:v37];
        }
        v40 = (void *)v39;
        [a1 setAccessPoint:v39];
      }
      if (a3) {
        v41 = @"originalName";
      }
      else {
        v41 = @"original_name";
      }
      v42 = [v5 objectForKeyedSubscript:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v43 = (void *)[v42 copy];
        [a1 setOriginalName:v43];
      }
      if (a3) {
        v44 = @"containmentCorrections";
      }
      else {
        v44 = @"containment_corrections";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [GEORPPlaceContainmentCorrections alloc];
        if (a3) {
          uint64_t v47 = [(GEORPPlaceContainmentCorrections *)v46 initWithJSON:v45];
        }
        else {
          uint64_t v47 = [(GEORPPlaceContainmentCorrections *)v46 initWithDictionary:v45];
        }
        v48 = (void *)v47;
        [a1 setContainmentCorrections:v47];
      }
    }
  }

  return a1;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 name];
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    v6 = [(id)a1 amenity];
    v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"amenity"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v50 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            uint64_t v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v12);
      }

      if (a2) {
        uint64_t v17 = @"businessHours";
      }
      else {
        uint64_t v17 = @"business_hours";
      }
      [v4 setObject:v9 forKey:v17];
    }
    v18 = [(id)a1 coordinate];
    uint64_t v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"coordinate"];
    }
    uint64_t v21 = [(id)a1 mapLocation];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"mapLocation";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"map_location";
      }
      [v4 setObject:v23 forKey:v24];
    }
    __int16 v25 = *(_WORD *)(a1 + 104);
    if ((v25 & 2) != 0)
    {
      v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
      if (a2) {
        v27 = @"lineShapeIncorrect";
      }
      else {
        v27 = @"line_shape_incorrect";
      }
      [v4 setObject:v26 forKey:v27];

      __int16 v25 = *(_WORD *)(a1 + 104);
    }
    if (v25)
    {
      v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        v29 = @"lineScheduleDelay";
      }
      else {
        v29 = @"line_schedule_delay";
      }
      [v4 setObject:v28 forKey:v29];
    }
    uint64_t v30 = [(id)a1 accessPoint];
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"accessPoint";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"access_point";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = [(id)a1 originalName];
    if (v34)
    {
      if (a2) {
        v35 = @"originalName";
      }
      else {
        v35 = @"original_name";
      }
      [v4 setObject:v34 forKey:v35];
    }

    v36 = [(id)a1 containmentCorrections];
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        uint64_t v39 = @"containmentCorrections";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        uint64_t v39 = @"containment_corrections";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __56__GEORPTransitPoiCorrections__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addBusinessHours:(id)a3
{
  id v4 = a3;
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  -[GEORPTransitPoiCorrections _addNoFlagsBusinessHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsBusinessHours:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_3758);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (GEORPTransitPoiCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitPoiCorrections;
  v2 = [(GEORPTransitPoiCorrections *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEORPTransitPoiCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitPoiCorrections;
  id v3 = [(GEORPTransitPoiCorrections *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3755);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORPTransitPoiCorrections _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readAmenity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAmenity_tags_3756);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAmenity
{
  return self->_amenity != 0;
}

- (GEORPAmenityCorrections)amenity
{
  -[GEORPTransitPoiCorrections _readAmenity]((uint64_t)self);
  amenity = self->_amenity;

  return amenity;
}

- (void)setAmenity:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_amenity, a3);
}

- (void)_readBusinessHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessHours_tags_3757);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)businessHours
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return businessHours;
}

- (void)setBusinessHours:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  businessHours = self->_businessHours;
  self->_businessHours = v4;
}

- (void)clearBusinessHours
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  businessHours = self->_businessHours;

  [(NSMutableArray *)businessHours removeAllObjects];
}

- (unint64_t)businessHoursCount
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return [(NSMutableArray *)businessHours count];
}

- (id)businessHoursAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return (id)[(NSMutableArray *)businessHours objectAtIndex:a3];
}

+ (Class)businessHoursType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEORPCorrectedCoordinate)coordinate
{
  -[GEORPTransitPoiCorrections _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLocation_tags_3759);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasMapLocation
{
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPTransitPoiCorrections _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (BOOL)lineShapeIncorrect
{
  return self->_lineShapeIncorrect;
}

- (void)setLineShapeIncorrect:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_lineShapeIncorrect = a3;
}

- (void)setHasLineShapeIncorrect:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLineShapeIncorrect
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)lineScheduleDelay
{
  return self->_lineScheduleDelay;
}

- (void)setLineScheduleDelay:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_lineScheduleDelay = a3;
}

- (void)setHasLineScheduleDelay:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasLineScheduleDelay
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readAccessPoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccessPoint_tags_3760);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAccessPoint
{
  return self->_accessPoint != 0;
}

- (GEORPAccessPointCorrections)accessPoint
{
  -[GEORPTransitPoiCorrections _readAccessPoint]((uint64_t)self);
  accessPoint = self->_accessPoint;

  return accessPoint;
}

- (void)setAccessPoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_accessPoint, a3);
}

- (void)_readOriginalName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalName_tags_3761);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalName
{
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPTransitPoiCorrections _readOriginalName]((uint64_t)self);
  originalName = self->_originalName;

  return originalName;
}

- (void)setOriginalName:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readContainmentCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainmentCorrections_tags_3762);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasContainmentCorrections
{
  return self->_containmentCorrections != 0;
}

- (GEORPPlaceContainmentCorrections)containmentCorrections
{
  -[GEORPTransitPoiCorrections _readContainmentCorrections]((uint64_t)self);
  containmentCorrections = self->_containmentCorrections;

  return containmentCorrections;
}

- (void)setContainmentCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_containmentCorrections, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTransitPoiCorrections;
  id v4 = [(GEORPTransitPoiCorrections *)&v8 description];
  id v5 = [(GEORPTransitPoiCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPTransitPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPTransitPoiCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPTransitPoiCorrections)initWithDictionary:(id)a3
{
  return (GEORPTransitPoiCorrections *)-[GEORPTransitPoiCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPTransitPoiCorrections)initWithJSON:(id)a3
{
  return (GEORPTransitPoiCorrections *)-[GEORPTransitPoiCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3775;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3776;
    }
    GEORPTransitPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPTransitPoiCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitPoiCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitPoiCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPTransitPoiCorrectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTransitPoiCorrections *)self readAll:0];
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_amenity) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_businessHours;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_coordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapLocation) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_accessPoint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originalName) {
      PBDataWriterWriteStringField();
    }
    if (self->_containmentCorrections) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPTransitPoiCorrections _readAccessPoint]((uint64_t)self);
  if ([(GEORPAccessPointCorrections *)self->_accessPoint hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPTransitPoiCorrections _readCoordinate]((uint64_t)self);
  if ([(GEORPCorrectedCoordinate *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPTransitPoiCorrections _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return [(GEORPMapLocation *)mapLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEORPTransitPoiCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 22) = self->_readerMarkPos;
  *((_DWORD *)v10 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name) {
    objc_msgSend(v10, "setName:");
  }
  if (self->_amenity) {
    objc_msgSend(v10, "setAmenity:");
  }
  if ([(GEORPTransitPoiCorrections *)self businessHoursCount])
  {
    [v10 clearBusinessHours];
    unint64_t v4 = [(GEORPTransitPoiCorrections *)self businessHoursCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPTransitPoiCorrections *)self businessHoursAtIndex:i];
        [v10 addBusinessHours:v7];
      }
    }
  }
  if (self->_coordinate) {
    objc_msgSend(v10, "setCoordinate:");
  }
  uint64_t v8 = v10;
  if (self->_mapLocation)
  {
    objc_msgSend(v10, "setMapLocation:");
    uint64_t v8 = v10;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v8 + 101) = self->_lineShapeIncorrect;
    *((_WORD *)v8 + 52) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *((unsigned char *)v8 + 100) = self->_lineScheduleDelay;
    *((_WORD *)v8 + 52) |= 1u;
  }
  if (self->_accessPoint)
  {
    objc_msgSend(v10, "setAccessPoint:");
    uint64_t v8 = v10;
  }
  if (self->_originalName)
  {
    objc_msgSend(v10, "setOriginalName:");
    uint64_t v8 = v10;
  }
  if (self->_containmentCorrections)
  {
    objc_msgSend(v10, "setContainmentCorrections:");
    uint64_t v8 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPTransitPoiCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPTransitPoiCorrections *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  id v11 = [(GEORPAmenityCorrections *)self->_amenity copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v13 = self->_businessHours;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (void)v31);
        [(id)v5 addBusinessHours:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  id v18 = [(GEORPCorrectedCoordinate *)self->_coordinate copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  id v20 = [(GEORPMapLocation *)self->_mapLocation copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 101) = self->_lineShapeIncorrect;
    *(_WORD *)(v5 + 104) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v5 + 100) = self->_lineScheduleDelay;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  id v23 = -[GEORPAccessPointCorrections copyWithZone:](self->_accessPoint, "copyWithZone:", a3, (void)v31);
  v24 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v23;

  uint64_t v25 = [(NSString *)self->_originalName copyWithZone:a3];
  v26 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v25;

  id v27 = [(GEORPPlaceContainmentCorrections *)self->_containmentCorrections copyWithZone:a3];
  v28 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v27;

  v29 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v29;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEORPTransitPoiCorrections *)self readAll:1];
  [v4 readAll:1];
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_34;
    }
  }
  amenity = self->_amenity;
  if ((unint64_t)amenity | *((void *)v4 + 4))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenity, "isEqual:")) {
      goto LABEL_34;
    }
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](businessHours, "isEqual:")) {
      goto LABEL_34;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 7))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](coordinate, "isEqual:")) {
      goto LABEL_34;
    }
  }
  mapLocation = self->_mapLocation;
  if ((unint64_t)mapLocation | *((void *)v4 + 8))
  {
    if (!-[GEORPMapLocation isEqual:](mapLocation, "isEqual:")) {
      goto LABEL_34;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_34;
    }
    if (self->_lineShapeIncorrect)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_34;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_34;
  }
  if (flags)
  {
    if (v11)
    {
      if (self->_lineScheduleDelay)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_34;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_28;
      }
    }
LABEL_34:
    char v15 = 0;
    goto LABEL_35;
  }
  if (v11) {
    goto LABEL_34;
  }
LABEL_28:
  accessPoint = self->_accessPoint;
  if ((unint64_t)accessPoint | *((void *)v4 + 3)
    && !-[GEORPAccessPointCorrections isEqual:](accessPoint, "isEqual:"))
  {
    goto LABEL_34;
  }
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalName, "isEqual:")) {
      goto LABEL_34;
    }
  }
  containmentCorrections = self->_containmentCorrections;
  if ((unint64_t)containmentCorrections | *((void *)v4 + 6)) {
    char v15 = -[GEORPPlaceContainmentCorrections isEqual:](containmentCorrections, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_35:

  return v15;
}

- (unint64_t)hash
{
  [(GEORPTransitPoiCorrections *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(GEORPAmenityCorrections *)self->_amenity hash];
  uint64_t v5 = [(NSMutableArray *)self->_businessHours hash];
  unint64_t v6 = [(GEORPCorrectedCoordinate *)self->_coordinate hash];
  unint64_t v7 = [(GEORPMapLocation *)self->_mapLocation hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_lineShapeIncorrect;
    if (flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_lineScheduleDelay;
LABEL_6:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10;
  unint64_t v12 = [(GEORPAccessPointCorrections *)self->_accessPoint hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_originalName hash];
  return v11 ^ v13 ^ [(GEORPPlaceContainmentCorrections *)self->_containmentCorrections hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 9)) {
    -[GEORPTransitPoiCorrections setName:](self, "setName:");
  }
  amenity = self->_amenity;
  uint64_t v6 = *((void *)v4 + 4);
  if (amenity)
  {
    if (v6) {
      -[GEORPAmenityCorrections mergeFrom:](amenity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPTransitPoiCorrections setAmenity:](self, "setAmenity:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPTransitPoiCorrections addBusinessHours:](self, "addBusinessHours:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  coordinate = self->_coordinate;
  uint64_t v13 = *((void *)v4 + 7);
  if (coordinate)
  {
    if (v13) {
      -[GEORPCorrectedCoordinate mergeFrom:](coordinate, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPTransitPoiCorrections setCoordinate:](self, "setCoordinate:");
  }
  mapLocation = self->_mapLocation;
  uint64_t v15 = *((void *)v4 + 8);
  if (mapLocation)
  {
    if (v15) {
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPTransitPoiCorrections setMapLocation:](self, "setMapLocation:");
  }
  __int16 v16 = *((_WORD *)v4 + 52);
  if ((v16 & 2) != 0)
  {
    self->_lineShapeIncorrect = *((unsigned char *)v4 + 101);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v16 = *((_WORD *)v4 + 52);
  }
  if (v16)
  {
    self->_lineScheduleDelay = *((unsigned char *)v4 + 100);
    *(_WORD *)&self->_flags |= 1u;
  }
  accessPoint = self->_accessPoint;
  uint64_t v18 = *((void *)v4 + 3);
  if (accessPoint)
  {
    if (v18) {
      -[GEORPAccessPointCorrections mergeFrom:](accessPoint, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEORPTransitPoiCorrections setAccessPoint:](self, "setAccessPoint:");
  }
  if (*((void *)v4 + 10)) {
    -[GEORPTransitPoiCorrections setOriginalName:](self, "setOriginalName:");
  }
  containmentCorrections = self->_containmentCorrections;
  uint64_t v20 = *((void *)v4 + 6);
  if (containmentCorrections)
  {
    if (v20) {
      -[GEORPPlaceContainmentCorrections mergeFrom:](containmentCorrections, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEORPTransitPoiCorrections setContainmentCorrections:](self, "setContainmentCorrections:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPTransitPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3780);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x804u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPTransitPoiCorrections *)self readAll:0];
    [(GEORPAccessPointCorrections *)self->_accessPoint clearUnknownFields:1];
    containmentCorrections = self->_containmentCorrections;
    [(GEORPPlaceContainmentCorrections *)containmentCorrections clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_containmentCorrections, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_amenity, 0);
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end