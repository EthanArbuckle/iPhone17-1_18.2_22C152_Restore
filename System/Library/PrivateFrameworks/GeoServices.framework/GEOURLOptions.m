@interface GEOURLOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)connectedToCar;
- (BOOL)enableTraffic;
- (BOOL)hasCamera;
- (BOOL)hasCenterSpan;
- (BOOL)hasConnectedToCar;
- (BOOL)hasEnableTraffic;
- (BOOL)hasIgnoreLabelPreference;
- (BOOL)hasMapType;
- (BOOL)hasPitchedWhileTracking;
- (BOOL)hasReferralIdentifier;
- (BOOL)hasRouteHandle;
- (BOOL)hasTimePoint;
- (BOOL)hasTransportType;
- (BOOL)hasUserTrackingMode;
- (BOOL)ignoreLabelPreference;
- (BOOL)isEqual:(id)a3;
- (BOOL)pitchedWhileTracking;
- (BOOL)readFrom:(id)a3;
- (GEOURLCamera)camera;
- (GEOURLCenterSpan)centerSpan;
- (GEOURLOptions)init;
- (GEOURLOptions)initWithData:(id)a3;
- (GEOURLOptions)initWithDictionary:(id)a3;
- (GEOURLOptions)initWithJSON:(id)a3;
- (GEOURLOptions)initWithUrlRepresentation:(id)a3;
- (GEOURLRouteHandle)routeHandle;
- (GEOURLTimePoint)timePoint;
- (NSString)description;
- (NSString)referralIdentifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (id)transportTypeAsString:(int)a3;
- (id)urlRepresentation;
- (id)userTrackingModeAsString:(int)a3;
- (int)StringAsMapType:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)StringAsUserTrackingMode:(id)a3;
- (int)mapType;
- (int)transportType;
- (int)userTrackingMode;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCamera;
- (void)_readCenterSpan;
- (void)_readReferralIdentifier;
- (void)_readRouteHandle;
- (void)_readTimePoint;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCamera:(id)a3;
- (void)setCenterSpan:(id)a3;
- (void)setConnectedToCar:(BOOL)a3;
- (void)setEnableTraffic:(BOOL)a3;
- (void)setHasConnectedToCar:(BOOL)a3;
- (void)setHasEnableTraffic:(BOOL)a3;
- (void)setHasIgnoreLabelPreference:(BOOL)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setHasPitchedWhileTracking:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasUserTrackingMode:(BOOL)a3;
- (void)setIgnoreLabelPreference:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)setPitchedWhileTracking:(BOOL)a3;
- (void)setReferralIdentifier:(id)a3;
- (void)setRouteHandle:(id)a3;
- (void)setTimePoint:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setUserTrackingMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLOptions

- (void)setUserTrackingMode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_userTrackingMode = a3;
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_mapType = a3;
}

- (void)setCamera:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_camera, a3);
}

- (GEOURLOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLOptions;
  v2 = [(GEOURLOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePoint, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_referralIdentifier, 0);
  objc_storeStrong((id *)&self->_centerSpan, 0);
  objc_storeStrong((id *)&self->_camera, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOURLOptionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOURLOptions *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_centerSpan) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_camera) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_referralIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_routeHandle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timePoint) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_21;
    }
LABEL_27:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  PBDataWriterWriteBOOLField();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x40) != 0) {
    goto LABEL_27;
  }
LABEL_21:
  if ((v6 & 0x20) != 0) {
LABEL_28:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_189_0;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_190_0;
    }
    GEOURLOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOURLOptionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOURLOptions)initWithUrlRepresentation:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)GEOURLOptions;
  v5 = [(GEOURLOptions *)&v44 init];
  if (!v5) {
    goto LABEL_61;
  }
  __int16 v6 = [v4 objectForKey:@"maptype"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 isEqualToString:@"standard"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"hybrid"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"satellite"])
    {
      uint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"transit"])
    {
      uint64_t v7 = 3;
    }
    else
    {
      if (![v6 isEqualToString:@"driving"]) {
        goto LABEL_14;
      }
      uint64_t v7 = 4;
    }
    [(GEOURLOptions *)v5 setMapType:v7];
  }
LABEL_14:
  v8 = [v4 objectForKey:@"camera"];
  if (v8)
  {
    id v9 = objc_alloc_init(GEOURLCamera);
    v10 = [v8 objectForKey:@"center"];
    v11 = v10;
    if (v10 && [v10 count] == 2)
    {
      v12 = [v11 firstObject];
      uint64_t v13 = [v11 lastObject];
      v14 = (void *)v13;
      if (v12 && v13)
      {
        [v12 doubleValue];
        -[GEOURLCamera setLatitude:](v9, "setLatitude:");
        [v14 doubleValue];
        -[GEOURLCamera setLongitude:](v9, "setLongitude:");
      }
      v15 = [v8 objectForKey:@"heading"];
      v16 = v15;
      if (v15)
      {
        [v15 doubleValue];
        -[GEOURLCamera setHeading:](v9, "setHeading:");
      }
      v17 = [v8 objectForKey:@"pitch"];

      if (v17)
      {
        [v17 doubleValue];
        -[GEOURLCamera setPitch:](v9, "setPitch:");
      }
      v18 = [v8 objectForKey:@"altitude"];

      if (v18)
      {
        [v18 doubleValue];
        -[GEOURLCamera setAltitude:](v9, "setAltitude:");
      }
      [(GEOURLOptions *)v5 setCamera:v9];

      v19 = v6;
    }
    else
    {
      v19 = v6;
    }
  }
  else
  {
    id v9 = objc_alloc_init(GEOURLCenterSpan);
    v19 = [v4 objectForKey:@"region"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
    v20 = [v19 objectForKey:@"center"];
    v21 = v20;
    if (v20 && [v20 count] == 2)
    {
      v22 = [v21 firstObject];
      uint64_t v23 = [v21 lastObject];
      v24 = (void *)v23;
      if (v22 && v23)
      {
        [v22 doubleValue];
        -[GEOURLCamera setLatitude:](v9, "setLatitude:");
        [v24 doubleValue];
        -[GEOURLCamera setLongitude:](v9, "setLongitude:");
      }
    }
    v11 = [v19 objectForKey:@"span"];

    if (v11 && [v11 count] == 2)
    {
      v25 = [v11 firstObject];
      uint64_t v26 = [v11 lastObject];
      v27 = (void *)v26;
      if (v25 && v26)
      {
        [v25 doubleValue];
        -[GEOURLCamera setLatitudeDelta:](v9, "setLatitudeDelta:");
        [v27 doubleValue];
        -[GEOURLCamera setLongitudeDelta:](v9, "setLongitudeDelta:");
      }
    }
    [(GEOURLOptions *)v5 setCenterSpan:v9];
  }

LABEL_43:
  v28 = [v4 objectForKey:@"traffic"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[GEOURLOptions setEnableTraffic:](v5, "setEnableTraffic:", [v28 BOOLValue]);
  }
  v29 = [v4 objectForKey:@"referralIdentifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(GEOURLOptions *)v5 setReferralIdentifier:v29];
  }
  v30 = [v4 objectForKey:@"routeHandle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = objc_alloc_init(GEOURLRouteHandle);
    v32 = [v30 objectForKey:@"routeHandleDirectionsResponseID"];
    [(GEOURLRouteHandle *)v31 setDirectionsResponseID:v32];

    v33 = [v30 objectForKey:@"routeHandleRouteID"];
    [(GEOURLRouteHandle *)v31 setRouteID:v33];

    v34 = [v30 objectForKey:@"routeHandleZilch"];
    [(GEOURLRouteHandle *)v31 setZilchPoints:v34];

    v35 = [v30 objectForKey:@"routeHandleTransit"];
    [(GEOURLRouteHandle *)v31 setTransitData:v35];

    [(GEOURLOptions *)v5 setRouteHandle:v31];
  }
  v36 = [v4 objectForKey:@"timePoint"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_58;
  }
  v37 = objc_alloc_init(GEOURLTimePoint);
  v38 = [v36 objectForKey:@"type"];
  if ([v38 isEqualToString:@"arrival"])
  {
    uint64_t v39 = 1;
LABEL_54:
    [(GEOURLTimePoint *)v37 setType:v39];
    goto LABEL_55;
  }
  if ([v38 isEqualToString:@"departure"])
  {
    uint64_t v39 = 0;
    goto LABEL_54;
  }
LABEL_55:
  v40 = [v36 objectForKey:@"time"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v40 doubleValue];
    -[GEOURLTimePoint setTime:](v37, "setTime:");
  }
  [(GEOURLOptions *)v5 setTimePoint:v37];

LABEL_58:
  v41 = [v4 objectForKey:@"connectedToCar"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[GEOURLOptions setConnectedToCar:](v5, "setConnectedToCar:", [v41 BOOLValue]);
  }
  v42 = v5;

LABEL_61:
  return v5;
}

- (id)urlRepresentation
{
  v56[2] = *MEMORY[0x1E4F143B8];
  if ([(GEOURLOptions *)self hasEnableTraffic]
    || [(GEOURLOptions *)self hasMapType]
    || [(GEOURLOptions *)self hasTransportType]
    || [(GEOURLOptions *)self hasCenterSpan]
    || [(GEOURLOptions *)self hasCamera]
    || [(GEOURLOptions *)self hasReferralIdentifier]
    || [(GEOURLOptions *)self hasRouteHandle]
    || [(GEOURLOptions *)self hasTimePoint])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(GEOURLOptions *)self hasMapType])
    {
      unsigned int v4 = [(GEOURLOptions *)self mapType] - 1;
      if (v4 > 3) {
        v5 = @"standard";
      }
      else {
        v5 = off_1E53DB460[v4];
      }
      [v3 setObject:v5 forKey:@"maptype"];
    }
    if ([(GEOURLOptions *)self hasTransportType])
    {
      unsigned int v6 = [(GEOURLOptions *)self transportType];
      if (v6 > 3) {
        uint64_t v7 = @"preferred";
      }
      else {
        uint64_t v7 = off_1E53DB480[v6];
      }
      [v3 setObject:v7 forKey:@"dirtype"];
    }
    if ([(GEOURLOptions *)self hasCenterSpan])
    {
      v8 = [(GEOURLOptions *)self centerSpan];
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v8 hasLatitude] && objc_msgSend(v8, "hasLongitude"))
      {
        v10 = NSNumber;
        [v8 latitude];
        v11 = objc_msgSend(v10, "numberWithDouble:");
        v56[0] = v11;
        v12 = NSNumber;
        [v8 longitude];
        uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
        v56[1] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
        [v9 setObject:v14 forKey:@"center"];
      }
      if ([v8 hasLatitudeDelta] && objc_msgSend(v8, "hasLongitudeDelta"))
      {
        v15 = NSNumber;
        [v8 latitudeDelta];
        v16 = objc_msgSend(v15, "numberWithDouble:");
        v55[0] = v16;
        v17 = NSNumber;
        [v8 longitudeDelta];
        v18 = objc_msgSend(v17, "numberWithDouble:");
        v55[1] = v18;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
        [v9 setObject:v19 forKey:@"span"];
      }
      [v3 setObject:v9 forKey:@"region"];
    }
    if ([(GEOURLOptions *)self hasCamera])
    {
      v20 = [(GEOURLOptions *)self camera];
      v53[0] = @"center";
      v21 = NSNumber;
      [v20 latitude];
      v49 = objc_msgSend(v21, "numberWithDouble:");
      v52[0] = v49;
      v22 = NSNumber;
      [v20 longitude];
      uint64_t v23 = objc_msgSend(v22, "numberWithDouble:");
      v52[1] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      v54[0] = v24;
      v53[1] = @"heading";
      v25 = NSNumber;
      [v20 heading];
      uint64_t v26 = objc_msgSend(v25, "numberWithDouble:");
      v54[1] = v26;
      v53[2] = @"pitch";
      v27 = NSNumber;
      [v20 pitch];
      v28 = objc_msgSend(v27, "numberWithDouble:");
      v54[2] = v28;
      v53[3] = @"altitude";
      v29 = NSNumber;
      [v20 altitude];
      v30 = objc_msgSend(v29, "numberWithDouble:");
      v54[3] = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
      [v3 setObject:v31 forKey:@"camera"];
    }
    if ([(GEOURLOptions *)self hasEnableTraffic])
    {
      v32 = objc_msgSend(NSNumber, "numberWithBool:", -[GEOURLOptions enableTraffic](self, "enableTraffic"));
      [v3 setObject:v32 forKey:@"traffic"];
    }
    if ([(GEOURLOptions *)self hasReferralIdentifier])
    {
      v33 = [(GEOURLOptions *)self referralIdentifier];
      [v3 setObject:v33 forKey:@"referralIdentifier"];
    }
    if ([(GEOURLOptions *)self hasRouteHandle])
    {
      v34 = [(GEOURLOptions *)self routeHandle];
      v50[0] = @"routeHandleDirectionsResponseID";
      v35 = [v34 directionsResponseID];
      v51[0] = v35;
      v50[1] = @"routeHandleRouteID";
      v36 = [v34 routeID];
      v51[1] = v36;
      v50[2] = @"routeHandleZilch";
      v37 = [v34 zilchPoints];
      v51[2] = v37;
      v50[3] = @"routeHandleTransit";
      v38 = [v34 transitData];
      v51[3] = v38;
      uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
      [v3 setObject:v39 forKey:@"routeHandle"];
    }
    if ([(GEOURLOptions *)self hasTimePoint])
    {
      v40 = [(GEOURLOptions *)self timePoint];
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v40 hasType])
      {
        int v42 = [v40 type];
        v43 = @"departure";
        if (v42) {
          v43 = 0;
        }
        if (v42 == 1) {
          objc_super v44 = @"arrival";
        }
        else {
          objc_super v44 = v43;
        }
        [v41 setObject:v44 forKey:@"type"];
      }
      if ([v40 hasTime])
      {
        v45 = NSNumber;
        [v40 time];
        v46 = objc_msgSend(v45, "numberWithDouble:");
        [v41 setObject:v46 forKey:@"time"];
      }
      [v3 setObject:v41 forKey:@"timePoint"];
    }
    if ([(GEOURLOptions *)self hasConnectedToCar])
    {
      v47 = objc_msgSend(NSNumber, "numberWithBool:", -[GEOURLOptions connectedToCar](self, "connectedToCar"));
      [v3 setObject:v47 forKey:@"connectedToCar"];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (GEOURLOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLOptions;
  id v3 = [(GEOURLOptions *)&v7 initWithData:a3];
  unsigned int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)enableTraffic
{
  return self->_enableTraffic;
}

- (void)setEnableTraffic:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_enableTraffic = a3;
}

- (void)setHasEnableTraffic:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4112;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasEnableTraffic
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)mapType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setHasMapType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasMapType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E53E0D50 + a3);
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Standard"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Satellite"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Hybrid"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E53E0D78 + a3);
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCenterSpan
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenterSpan_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCenterSpan
{
  return self->_centerSpan != 0;
}

- (GEOURLCenterSpan)centerSpan
{
  -[GEOURLOptions _readCenterSpan]((uint64_t)self);
  centerSpan = self->_centerSpan;

  return centerSpan;
}

- (void)setCenterSpan:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_centerSpan, a3);
}

- (void)_readCamera
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCamera_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCamera
{
  return self->_camera != 0;
}

- (GEOURLCamera)camera
{
  -[GEOURLOptions _readCamera]((uint64_t)self);
  camera = self->_camera;

  return camera;
}

- (void)_readReferralIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReferralIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasReferralIdentifier
{
  return self->_referralIdentifier != 0;
}

- (NSString)referralIdentifier
{
  -[GEOURLOptions _readReferralIdentifier]((uint64_t)self);
  referralIdentifier = self->_referralIdentifier;

  return referralIdentifier;
}

- (void)setReferralIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_referralIdentifier, a3);
}

- (int)userTrackingMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_userTrackingMode;
  }
  else {
    return 0;
  }
}

- (void)setHasUserTrackingMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasUserTrackingMode
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)userTrackingModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E53E0DB0 + a3);
  }

  return v3;
}

- (int)StringAsUserTrackingMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Follow"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FollowWithHeading"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRouteHandle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteHandle_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteHandle
{
  return self->_routeHandle != 0;
}

- (GEOURLRouteHandle)routeHandle
{
  -[GEOURLOptions _readRouteHandle]((uint64_t)self);
  routeHandle = self->_routeHandle;

  return routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readTimePoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimePoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTimePoint
{
  return self->_timePoint != 0;
}

- (GEOURLTimePoint)timePoint
{
  -[GEOURLOptions _readTimePoint]((uint64_t)self);
  timePoint = self->_timePoint;

  return timePoint;
}

- (void)setTimePoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_timePoint, a3);
}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (void)setConnectedToCar:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_connectedToCar = a3;
}

- (void)setHasConnectedToCar:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasConnectedToCar
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)pitchedWhileTracking
{
  return self->_pitchedWhileTracking;
}

- (void)setPitchedWhileTracking:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_pitchedWhileTracking = a3;
}

- (void)setHasPitchedWhileTracking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4160;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPitchedWhileTracking
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)ignoreLabelPreference
{
  return self->_ignoreLabelPreference;
}

- (void)setIgnoreLabelPreference:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_ignoreLabelPreference = a3;
}

- (void)setHasIgnoreLabelPreference:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4128;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasIgnoreLabelPreference
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (NSString)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLOptions;
  int v4 = [(GEOURLOptions *)&v8 description];
  v5 = [(GEOURLOptions *)self dictionaryRepresentation];
  unsigned int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_49;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x10) != 0)
  {
    unsigned int v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
    [v4 setObject:v6 forKey:@"enableTraffic"];

    __int16 v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v7 = *(int *)(a1 + 68);
  if (v7 >= 5)
  {
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
  }
  else
  {
    objc_super v8 = *(&off_1E53E0D50 + v7);
  }
  [v4 setObject:v8 forKey:@"mapType"];

  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
LABEL_11:
    uint64_t v9 = *(int *)(a1 + 72);
    if (v9 >= 7)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
    }
    else
    {
      v10 = *(&off_1E53E0D78 + v9);
    }
    [v4 setObject:v10 forKey:@"transportType"];
  }
LABEL_15:
  v11 = [(id)a1 centerSpan];
  v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    uint64_t v13 = [v11 dictionaryRepresentation];
    }
    [v4 setObject:v13 forKey:@"centerSpan"];
  }
  v14 = [(id)a1 camera];
  v15 = v14;
  if (v14)
  {
    if (a2) {
      [v14 jsonRepresentation];
    }
    else {
    v16 = [v14 dictionaryRepresentation];
    }
    [v4 setObject:v16 forKey:@"camera"];
  }
  v17 = [(id)a1 referralIdentifier];
  if (v17) {
    [v4 setObject:v17 forKey:@"referralIdentifier"];
  }

  if ((*(_WORD *)(a1 + 84) & 4) != 0)
  {
    uint64_t v18 = *(int *)(a1 + 76);
    if (v18 >= 3)
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
    }
    else
    {
      v19 = *(&off_1E53E0DB0 + v18);
    }
    [v4 setObject:v19 forKey:@"userTrackingMode"];
  }
  v20 = [(id)a1 routeHandle];
  v21 = v20;
  if (v20)
  {
    if (a2) {
      [v20 jsonRepresentation];
    }
    else {
    v22 = [v20 dictionaryRepresentation];
    }
    [v4 setObject:v22 forKey:@"routeHandle"];
  }
  uint64_t v23 = [(id)a1 timePoint];
  v24 = v23;
  if (v23)
  {
    if (a2) {
      [v23 jsonRepresentation];
    }
    else {
    v25 = [v23 dictionaryRepresentation];
    }
    [v4 setObject:v25 forKey:@"timePoint"];
  }
  __int16 v26 = *(_WORD *)(a1 + 84);
  if ((v26 & 8) == 0)
  {
    if ((v26 & 0x40) == 0) {
      goto LABEL_44;
    }
LABEL_47:
    v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 83)];
    [v4 setObject:v28 forKey:@"pitchedWhileTracking"];

    if ((*(_WORD *)(a1 + 84) & 0x20) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  [v4 setObject:v27 forKey:@"connectedToCar"];

  __int16 v26 = *(_WORD *)(a1 + 84);
  if ((v26 & 0x40) != 0) {
    goto LABEL_47;
  }
LABEL_44:
  if ((v26 & 0x20) != 0)
  {
LABEL_48:
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 82)];
    [v4 setObject:v29 forKey:@"ignoreLabelPreference"];
  }
LABEL_49:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOURLOptions)initWithDictionary:(id)a3
{
  return (GEOURLOptions *)-[GEOURLOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_82;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_82;
  }
  unsigned int v6 = [v5 objectForKeyedSubscript:@"enableTraffic"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnableTraffic:", objc_msgSend(v6, "BOOLValue"));
  }

  uint64_t v7 = [v5 objectForKeyedSubscript:@"mapType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"Standard"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"Satellite"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"Hybrid"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"Transit"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"Driving"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setMapType:v9];
LABEL_21:

  v10 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"TRANSIT"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"WALKING"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"BICYCLE"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"FERRY"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v12 = 6;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v12 = [v10 intValue];
  }
  [a1 setTransportType:v12];
LABEL_41:

  uint64_t v13 = [v5 objectForKeyedSubscript:@"centerSpan"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOURLCenterSpan alloc];
    if (a3) {
      uint64_t v15 = [(GEOURLCenterSpan *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOURLCenterSpan *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setCenterSpan:v15];
  }
  v17 = [v5 objectForKeyedSubscript:@"camera"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [GEOURLCamera alloc];
    if (a3) {
      uint64_t v19 = [(GEOURLCamera *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOURLCamera *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setCamera:v19];
  }
  v21 = [v5 objectForKeyedSubscript:@"referralIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    [a1 setReferralIdentifier:v22];
  }
  uint64_t v23 = [v5 objectForKeyedSubscript:@"userTrackingMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"None"])
    {
      uint64_t v25 = 0;
    }
    else if ([v24 isEqualToString:@"Follow"])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:@"FollowWithHeading"])
    {
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v25 = 0;
    }

    goto LABEL_64;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [v23 intValue];
LABEL_64:
    [a1 setUserTrackingMode:v25];
  }

  __int16 v26 = [v5 objectForKeyedSubscript:@"routeHandle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOURLRouteHandle alloc];
    if (a3) {
      uint64_t v28 = [(GEOURLRouteHandle *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOURLRouteHandle *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setRouteHandle:v28];
  }
  v30 = [v5 objectForKeyedSubscript:@"timePoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEOURLTimePoint alloc];
    if (a3) {
      uint64_t v32 = [(GEOURLTimePoint *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEOURLTimePoint *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setTimePoint:v32];
  }
  v34 = [v5 objectForKeyedSubscript:@"connectedToCar"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setConnectedToCar:", objc_msgSend(v34, "BOOLValue"));
  }

  v35 = [v5 objectForKeyedSubscript:@"pitchedWhileTracking"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPitchedWhileTracking:", objc_msgSend(v35, "BOOLValue"));
  }

  v36 = [v5 objectForKeyedSubscript:@"ignoreLabelPreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIgnoreLabelPreference:", objc_msgSend(v36, "BOOLValue"));
  }

LABEL_82:
  return a1;
}

- (GEOURLOptions)initWithJSON:(id)a3
{
  return (GEOURLOptions *)-[GEOURLOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = (id *)a3;
  [(GEOURLOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((unsigned char *)v7 + 81) = self->_enableTraffic;
    *((_WORD *)v7 + 42) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 17) = self->_mapType;
  *((_WORD *)v7 + 42) |= 1u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v7 + 18) = self->_transportType;
    *((_WORD *)v7 + 42) |= 2u;
  }
LABEL_5:
  if (self->_centerSpan)
  {
    objc_msgSend(v7, "setCenterSpan:");
    int v4 = v7;
  }
  if (self->_camera)
  {
    objc_msgSend(v7, "setCamera:");
    int v4 = v7;
  }
  if (self->_referralIdentifier)
  {
    objc_msgSend(v7, "setReferralIdentifier:");
    int v4 = v7;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_userTrackingMode;
    *((_WORD *)v4 + 42) |= 4u;
  }
  if (self->_routeHandle)
  {
    objc_msgSend(v7, "setRouteHandle:");
    int v4 = v7;
  }
  if (self->_timePoint)
  {
    objc_msgSend(v7, "setTimePoint:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_connectedToCar;
    *((_WORD *)v4 + 42) |= 8u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x40) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  *((unsigned char *)v4 + 83) = self->_pitchedWhileTracking;
  *((_WORD *)v4 + 42) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
LABEL_20:
    *((unsigned char *)v4 + 82) = self->_ignoreLabelPreference;
    *((_WORD *)v4 + 42) |= 0x20u;
  }
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOURLOptions *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(unsigned char *)(v5 + 81) = self->_enableTraffic;
      *(_WORD *)(v5 + 84) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 68) = self->_mapType;
    *(_WORD *)(v5 + 84) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
LABEL_9:
      id v10 = [(GEOURLCenterSpan *)self->_centerSpan copyWithZone:a3];
      id v11 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v10;

      id v12 = [(GEOURLCamera *)self->_camera copyWithZone:a3];
      uint64_t v13 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v12;

      uint64_t v14 = [(NSString *)self->_referralIdentifier copyWithZone:a3];
      uint64_t v15 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v14;

      if ((*(_WORD *)&self->_flags & 4) != 0)
      {
        *(_DWORD *)(v5 + 76) = self->_userTrackingMode;
        *(_WORD *)(v5 + 84) |= 4u;
      }
      id v16 = [(GEOURLRouteHandle *)self->_routeHandle copyWithZone:a3];
      v17 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v16;

      id v18 = [(GEOURLTimePoint *)self->_timePoint copyWithZone:a3];
      uint64_t v19 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = v18;

      __int16 v20 = (__int16)self->_flags;
      if ((v20 & 8) != 0)
      {
        *(unsigned char *)(v5 + 80) = self->_connectedToCar;
        *(_WORD *)(v5 + 84) |= 8u;
        __int16 v20 = (__int16)self->_flags;
        if ((v20 & 0x40) == 0)
        {
LABEL_13:
          if ((v20 & 0x20) == 0) {
            return (id)v5;
          }
LABEL_14:
          *(unsigned char *)(v5 + 82) = self->_ignoreLabelPreference;
          *(_WORD *)(v5 + 84) |= 0x20u;
          return (id)v5;
        }
      }
      else if ((v20 & 0x40) == 0)
      {
        goto LABEL_13;
      }
      *(unsigned char *)(v5 + 83) = self->_pitchedWhileTracking;
      *(_WORD *)(v5 + 84) |= 0x40u;
      if ((*(_WORD *)&self->_flags & 0x20) == 0) {
        return (id)v5;
      }
      goto LABEL_14;
    }
LABEL_8:
    *(_DWORD *)(v5 + 72) = self->_transportType;
    *(_WORD *)(v5 + 84) |= 2u;
    goto LABEL_9;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOURLOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  [(GEOURLOptions *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_53;
    }
    if (self->_enableTraffic)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_mapType != *((_DWORD *)v4 + 17)) {
      goto LABEL_53;
    }
  }
  else if (v6)
  {
    goto LABEL_53;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_transportType != *((_DWORD *)v4 + 18)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_53;
  }
  centerSpan = self->_centerSpan;
  if ((unint64_t)centerSpan | *((void *)v4 + 3) && !-[GEOURLCenterSpan isEqual:](centerSpan, "isEqual:")) {
    goto LABEL_53;
  }
  camera = self->_camera;
  if ((unint64_t)camera | *((void *)v4 + 2))
  {
    if (!-[GEOURLCamera isEqual:](camera, "isEqual:")) {
      goto LABEL_53;
    }
  }
  referralIdentifier = self->_referralIdentifier;
  if ((unint64_t)referralIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](referralIdentifier, "isEqual:")) {
      goto LABEL_53;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_userTrackingMode != *((_DWORD *)v4 + 19)) {
      goto LABEL_53;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_53;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((void *)v4 + 5) && !-[GEOURLRouteHandle isEqual:](routeHandle, "isEqual:")) {
    goto LABEL_53;
  }
  timePoint = self->_timePoint;
  if ((unint64_t)timePoint | *((void *)v4 + 6))
  {
    if (!-[GEOURLTimePoint isEqual:](timePoint, "isEqual:")) {
      goto LABEL_53;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 42);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0) {
      goto LABEL_53;
    }
    if (self->_connectedToCar)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_53;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0) {
      goto LABEL_53;
    }
    if (self->_pitchedWhileTracking)
    {
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 83))
    {
      goto LABEL_53;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  BOOL v15 = (v14 & 0x20) == 0;
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) != 0)
    {
      if (self->_ignoreLabelPreference)
      {
        if (!*((unsigned char *)v4 + 82)) {
          goto LABEL_53;
        }
      }
      else if (*((unsigned char *)v4 + 82))
      {
        goto LABEL_53;
      }
      BOOL v15 = 1;
      goto LABEL_54;
    }
LABEL_53:
    BOOL v15 = 0;
  }
LABEL_54:

  return v15;
}

- (unint64_t)hash
{
  [(GEOURLOptions *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    uint64_t v17 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v17 = 2654435761 * self->_enableTraffic;
  if ((flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_mapType;
  if ((flags & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_transportType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(GEOURLCenterSpan *)self->_centerSpan hash];
  unint64_t v7 = [(GEOURLCamera *)self->_camera hash];
  NSUInteger v8 = [(NSString *)self->_referralIdentifier hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_userTrackingMode;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(GEOURLRouteHandle *)self->_routeHandle hash];
  unint64_t v11 = [(GEOURLTimePoint *)self->_timePoint hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 8) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v14 = 0;
    if ((v12 & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v15 = 0;
    return v4 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v13 = 2654435761 * self->_connectedToCar;
  if ((v12 & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_pitchedWhileTracking;
  if ((v12 & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_ignoreLabelPreference;
  return v4 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v15 = a3;
  [v15 readAll:0];
  id v4 = v15;
  __int16 v5 = *((_WORD *)v15 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_enableTraffic = *((unsigned char *)v15 + 81);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v15 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_mapType = *((_DWORD *)v15 + 17);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v15 + 42) & 2) != 0)
  {
LABEL_4:
    self->_transportType = *((_DWORD *)v15 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_5:
  centerSpan = self->_centerSpan;
  uint64_t v7 = *((void *)v15 + 3);
  if (centerSpan)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOURLCenterSpan mergeFrom:](centerSpan, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOURLOptions setCenterSpan:](self, "setCenterSpan:");
  }
  id v4 = v15;
LABEL_14:
  camera = self->_camera;
  uint64_t v9 = *((void *)v4 + 2);
  if (camera)
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEOURLCamera mergeFrom:](camera, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEOURLOptions setCamera:](self, "setCamera:");
  }
  id v4 = v15;
LABEL_20:
  if (*((void *)v4 + 4))
  {
    -[GEOURLOptions setReferralIdentifier:](self, "setReferralIdentifier:");
    id v4 = v15;
  }
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
    self->_userTrackingMode = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 4u;
  }
  routeHandle = self->_routeHandle;
  uint64_t v11 = *((void *)v4 + 5);
  if (routeHandle)
  {
    if (!v11) {
      goto LABEL_30;
    }
    -[GEOURLRouteHandle mergeFrom:](routeHandle, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_30;
    }
    [(GEOURLOptions *)self setRouteHandle:"setRouteHandle:"];
  }
  id v4 = v15;
LABEL_30:
  timePoint = self->_timePoint;
  uint64_t v13 = *((void *)v4 + 6);
  if (timePoint)
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[GEOURLTimePoint mergeFrom:](timePoint, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[GEOURLOptions setTimePoint:](self, "setTimePoint:");
  }
  id v4 = v15;
LABEL_36:
  __int16 v14 = *((_WORD *)v4 + 42);
  if ((v14 & 8) != 0)
  {
    self->_connectedToCar = *((unsigned char *)v4 + 80);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v14 = *((_WORD *)v4 + 42);
    if ((v14 & 0x40) == 0)
    {
LABEL_38:
      if ((v14 & 0x20) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_38;
  }
  self->_pitchedWhileTracking = *((unsigned char *)v4 + 83);
  *(_WORD *)&self->_flags |= 0x40u;
  if ((*((_WORD *)v4 + 42) & 0x20) != 0)
  {
LABEL_39:
    self->_ignoreLabelPreference = *((unsigned char *)v4 + 82);
    *(_WORD *)&self->_flags |= 0x20u;
  }
LABEL_40:
}

@end