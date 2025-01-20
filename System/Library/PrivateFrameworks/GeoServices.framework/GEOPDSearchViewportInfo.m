@interface GEOPDSearchViewportInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setMapRegion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchViewportInfo

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 8);
  v5 = (void *)v3[1];
  if (v4)
  {
    if (v5)
    {
      v7 = v3;
      objc_msgSend(v4, "mergeFrom:");
LABEL_7:
      v3 = v7;
    }
  }
  else if (v5)
  {
    v7 = v3;
    -[GEOPDSearchViewportInfo setMapRegion:](a1, v5);
    goto LABEL_7;
  }
  char v6 = *((unsigned char *)v3 + 24);
  if ((v6 & 2) != 0)
  {
    *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
    *(unsigned char *)(a1 + 24) |= 2u;
    char v6 = *((unsigned char *)v3 + 24);
  }
  if (v6)
  {
    *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
    *(unsigned char *)(a1 + 24) |= 1u;
  }
LABEL_12:
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchViewportInfo;
  id v4 = [(GEOPDSearchViewportInfo *)&v8 description];
  v5 = [(GEOPDSearchViewportInfo *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchViewportInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 8);
    char v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapRegion";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 24);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v11 = @"timeSinceMapViewportChanged";
      }
      else {
        v11 = @"time_since_map_viewport_changed";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 24);
    }
    if (v9)
    {
      uint64_t v12 = *(int *)(a1 + 16);
      if (v12 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53EA3D0[v12];
      }
      if (a2) {
        v14 = @"mapType";
      }
      else {
        v14 = @"map_type";
      }
      [v4 setObject:v13 forKey:v14];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchViewportInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchViewportInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_timeSinceMapViewportChanged;
    *(unsigned char *)(v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_mapType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 1))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_timeSinceMapViewportChanged != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_mapType != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_timeSinceMapViewportChanged;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mapType;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
}

@end