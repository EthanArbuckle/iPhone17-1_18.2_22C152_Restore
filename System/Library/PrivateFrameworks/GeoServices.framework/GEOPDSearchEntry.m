@interface GEOPDSearchEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchEntry

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchEntry;
  v4 = [(GEOPDSearchEntry *)&v8 description];
  v5 = [(GEOPDSearchEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if (v5)
    {
      v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v7 = @"geoId";
      }
      else {
        v7 = @"geo_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v9 = @"geoTypeId";
      }
      else {
        v9 = @"geo_type_id";
      }
      [v4 setObject:v8 forKey:v9];
    }
    id v10 = *(id *)(a1 + 8);
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"center"];
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
  return -[GEOPDSearchEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"geoId";
    }
    else {
      v7 = @"geo_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 longLongValue];
      *(unsigned char *)(v6 + 28) |= 1u;
      *(void *)(v6 + 16) = v9;
    }

    if (a3) {
      id v10 = @"geoTypeId";
    }
    else {
      id v10 = @"geo_type_id";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [v11 intValue];
      *(unsigned char *)(v6 + 28) |= 2u;
      *(_DWORD *)(v6 + 24) = v12;
    }

    v13 = [v5 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [GEOLatLng alloc];
      if (a3) {
        v15 = [(GEOLatLng *)v14 initWithJSON:v13];
      }
      else {
        v15 = [(GEOLatLng *)v14 initWithDictionary:v13];
      }
      v16 = v15;
      v17 = v15;
      objc_storeStrong((id *)(v6 + 8), v16);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchEntryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_center)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 16) = self->_geoId;
    *(unsigned char *)(v5 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_geoTypeId;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  id v8 = [(GEOLatLng *)self->_center copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_geoId != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_geoTypeId != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 1)) {
    char v6 = -[GEOLatLng isEqual:](center, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v2 = 2654435761 * self->_geoId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(GEOLatLng *)self->_center hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_geoTypeId;
  return v3 ^ v2 ^ [(GEOLatLng *)self->_center hash];
}

- (void).cxx_destruct
{
}

@end