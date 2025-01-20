@interface GEOPolyLocationShiftResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOPolyLocationShiftResponse)init;
- (GEOPolyLocationShiftResponse)initWithData:(id)a3;
- (GEOPolyLocationShiftResponse)initWithDictionary:(id)a3;
- (GEOPolyLocationShiftResponse)initWithJSON:(id)a3;
- (double)parameters;
- (double)parametersAtIndex:(unint64_t)a3;
- (double)radius;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCenter;
- (void)_readParameters;
- (void)addParameters:(double)a3;
- (void)clearParameters;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCenter:(id)a3;
- (void)setParameters:(double *)a3 count:(unint64_t)a4;
- (void)setRadius:(double)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPolyLocationShiftResponse

- (GEOPolyLocationShiftResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPolyLocationShiftResponse;
  v2 = [(GEOPolyLocationShiftResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPolyLocationShiftResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPolyLocationShiftResponse;
  v3 = [(GEOPolyLocationShiftResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPolyLocationShiftResponse;
  [(GEOPolyLocationShiftResponse *)&v3 dealloc];
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_status = a3;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53EBCE8[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOCATION_SHIFT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_NO_SHIFT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAILURE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPolyLocationShiftResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)parametersCount
{
  return self->_parameters.count;
}

- (double)parameters
{
  return self->_parameters.list;
}

- (void)clearParameters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedDoubleClear();
}

- (void)addParameters:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (double)parametersAtIndex:(unint64_t)a3
{
  -[GEOPolyLocationShiftResponse _readParameters]((uint64_t)self);
  p_parameters = &self->_parameters;
  unint64_t count = self->_parameters.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_parameters->list[a3];
}

- (void)setParameters:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147320](&self->_parameters, a3, a4);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_radius = a3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPolyLocationShiftResponse;
  int v4 = [(GEOPolyLocationShiftResponse *)&v8 description];
  v5 = [(GEOPolyLocationShiftResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPolyLocationShiftResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *(int *)(a1 + 68);
    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E53EBCE8[v5];
    }
    [v4 setObject:v6 forKey:@"status"];

    if (*(void *)(a1 + 24))
    {
      objc_super v7 = PBRepeatedDoubleNSArray();
      [v4 setObject:v7 forKey:@"parameters"];
    }
    objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v4 setObject:v8 forKey:@"radius"];

    v9 = [(id)a1 center];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"center"];
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
  return -[GEOPolyLocationShiftResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPolyLocationShiftResponse)initWithDictionary:(id)a3
{
  return (GEOPolyLocationShiftResponse *)-[GEOPolyLocationShiftResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_34;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_34;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"LOCATION_SHIFT"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"LOCATION_NO_SHIFT"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FAILURE"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setStatus:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"parameters"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v15, "doubleValue", (void)v22);
            objc_msgSend(a1, "addParameters:");
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
  v16 = [v5 objectForKeyedSubscript:@"radius"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v16 doubleValue];
    objc_msgSend(a1, "setRadius:");
  }

  v17 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v19 = [(GEOLatLng *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOLatLng *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    objc_msgSend(a1, "setCenter:", v19, (void)v22);
  }
LABEL_34:

  return a1;
}

- (GEOPolyLocationShiftResponse)initWithJSON:(id)a3
{
  return (GEOPolyLocationShiftResponse *)-[GEOPolyLocationShiftResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_70;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_70;
    }
    GEOPolyLocationShiftResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_center readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPolyLocationShiftResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPolyLocationShiftResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 7) == 0)
    {
      id v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_9;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPolyLocationShiftResponse *)self readAll:0];
  PBDataWriterWriteInt32Field();
  if (self->_parameters.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v5;
    }
    while (v5 < self->_parameters.count);
  }
  PBDataWriterWriteDoubleField();
  objc_super v6 = v9;
  if (self->_center)
  {
    PBDataWriterWriteSubmessage();
LABEL_9:
    objc_super v6 = v9;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPolyLocationShiftResponse _readCenter]((uint64_t)self);
  center = self->_center;

  return [(GEOLatLng *)center hasGreenTeaWithValue:v3];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPolyLocationShiftResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_9);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPolyLocationShiftResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v8 + 17) = self->_status;
  if ([(GEOPolyLocationShiftResponse *)self parametersCount])
  {
    [v8 clearParameters];
    unint64_t v4 = [(GEOPolyLocationShiftResponse *)self parametersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(GEOPolyLocationShiftResponse *)self parametersAtIndex:i];
        objc_msgSend(v8, "addParameters:");
      }
    }
  }
  id v7 = v8;
  v8[6] = *(id *)&self->_radius;
  if (self->_center)
  {
    objc_msgSend(v8, "setCenter:");
    id v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPolyLocationShiftResponse *)self readAll:0];
    *(_DWORD *)(v5 + 68) = self->_status;
    PBRepeatedDoubleCopy();
    *(double *)(v5 + 48) = self->_radius;
    id v8 = [(GEOLatLng *)self->_center copyWithZone:a3];
    id v7 = *(PBDataReader **)(v5 + 40);
    *(void *)(v5 + 40) = v8;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPolyLocationShiftResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOPolyLocationShiftResponse *)self readAll:1],
        [v4 readAll:1],
        self->_status == *((_DWORD *)v4 + 17))
    && PBRepeatedDoubleIsEqual()
    && self->_radius == *((double *)v4 + 6))
  {
    center = self->_center;
    if ((unint64_t)center | v4[5]) {
      char v6 = -[GEOLatLng isEqual:](center, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEOPolyLocationShiftResponse *)self readAll:1];
  uint64_t status = self->_status;
  uint64_t v4 = PBRepeatedDoubleHash();
  double radius = self->_radius;
  double v6 = -radius;
  if (radius >= 0.0) {
    double v6 = self->_radius;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabs(v8);
  if (v8 >= 0.0) {
    unint64_t v12 = v11;
  }
  return (2654435761 * status) ^ [(GEOLatLng *)self->_center hash] ^ v4 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  self->_uint64_t status = *((_DWORD *)v10 + 17);
  uint64_t v4 = [v10 parametersCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v10 parametersAtIndex:i];
      -[GEOPolyLocationShiftResponse addParameters:](self, "addParameters:");
    }
  }
  long double v7 = v10;
  self->_double radius = *((double *)v10 + 6);
  center = self->_center;
  uint64_t v9 = *((void *)v10 + 5);
  if (center)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOPolyLocationShiftResponse setCenter:](self, "setCenter:");
  }
  long double v7 = v10;
LABEL_10:
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPolyLocationShiftResponse _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end