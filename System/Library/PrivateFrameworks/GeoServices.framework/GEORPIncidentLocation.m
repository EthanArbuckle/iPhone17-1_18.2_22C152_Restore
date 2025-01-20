@interface GEORPIncidentLocation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLatLng;
- (BOOL)hasZoomLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)latLng;
- (GEORPIncidentLocation)initWithDictionary:(id)a3;
- (GEORPIncidentLocation)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)zoomLevel;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasZoomLevel:(BOOL)a3;
- (void)setLatLng:(id)a3;
- (void)setZoomLevel:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPIncidentLocation

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
}

- (unsigned)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasZoomLevel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPIncidentLocation;
  v4 = [(GEORPIncidentLocation *)&v8 description];
  v5 = [(GEORPIncidentLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 latLng];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"latLng";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"lat_lng";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v10 = @"zoomLevel";
      }
      else {
        v10 = @"zoom_level";
      }
      [v4 setObject:v9 forKey:v10];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPIncidentLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentLocation)initWithDictionary:(id)a3
{
  return (GEORPIncidentLocation *)-[GEORPIncidentLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"latLng";
      }
      else {
        v6 = @"lat_lng";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setLatLng:v9];
      }
      if (a3) {
        v11 = @"zoomLevel";
      }
      else {
        v11 = @"zoom_level";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZoomLevel:", objc_msgSend(v12, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEORPIncidentLocation)initWithJSON:(id)a3
{
  return (GEORPIncidentLocation *)-[GEORPIncidentLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentLocationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_latLng hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPIncidentLocation *)self readAll:0];
  if (self->_latLng) {
    objc_msgSend(v4, "setLatLng:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_zoomLevel;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_zoomLevel;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEORPIncidentLocation *)self readAll:1];
  [v4 readAll:1];
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 1))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_zoomLevel == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPIncidentLocation *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_latLng hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_zoomLevel;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (unsigned int *)a3;
  [v6 readAll:0];
  latLng = self->_latLng;
  uint64_t v5 = *((void *)v6 + 1);
  if (latLng)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPIncidentLocation setLatLng:](self, "setLatLng:");
  }
  if (v6[5])
  {
    self->_zoomLevel = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end