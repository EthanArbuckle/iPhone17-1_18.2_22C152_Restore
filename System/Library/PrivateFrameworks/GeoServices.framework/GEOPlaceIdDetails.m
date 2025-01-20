@interface GEOPlaceIdDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBasemapId;
- (BOOL)hasBusinessId;
- (BOOL)hasLocalSearchProviderId;
- (BOOL)hasResultIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceIdDetails)initWithDictionary:(id)a3;
- (GEOPlaceIdDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)basemapId;
- (unint64_t)businessId;
- (unint64_t)hash;
- (unsigned)localSearchProviderId;
- (unsigned)resultIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBasemapId:(unint64_t)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setHasBasemapId:(BOOL)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasLocalSearchProviderId:(BOOL)a3;
- (void)setHasResultIndex:(BOOL)a3;
- (void)setLocalSearchProviderId:(unsigned int)a3;
- (void)setResultIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceIdDetails

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBusinessId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)basemapId
{
  return self->_basemapId;
}

- (void)setBasemapId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_basemapId = a3;
}

- (void)setHasBasemapId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBasemapId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_localSearchProviderId = a3;
}

- (void)setHasLocalSearchProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLocalSearchProviderId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasResultIndex
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceIdDetails;
  v4 = [(GEOPlaceIdDetails *)&v8 description];
  v5 = [(GEOPlaceIdDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceIdDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v7 = @"businessId";
    }
    else {
      v7 = @"business_id";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if ((v5 & 1) == 0)
  {
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v11 = @"localSearchProviderId";
    }
    else {
      v11 = @"local_search_provider_id";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 32) & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
  if (a2) {
    v9 = @"basemapId";
  }
  else {
    v9 = @"basemap_id";
  }
  [v4 setObject:v8 forKey:v9];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v5 & 8) != 0)
  {
LABEL_19:
    v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v13 = @"resultIndex";
    }
    else {
      v13 = @"result_index";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceIdDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPlaceIdDetails)initWithDictionary:(id)a3
{
  return (GEOPlaceIdDetails *)-[GEOPlaceIdDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"businessId";
      }
      else {
        v6 = @"business_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBusinessId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"basemapId";
      }
      else {
        objc_super v8 = @"basemap_id";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBasemapId:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      if (a3) {
        v10 = @"localSearchProviderId";
      }
      else {
        v10 = @"local_search_provider_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocalSearchProviderId:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"resultIndex";
      }
      else {
        v12 = @"result_index";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultIndex:", objc_msgSend(v13, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPlaceIdDetails)initWithJSON:(id)a3
{
  return (GEOPlaceIdDetails *)-[GEOPlaceIdDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceIdDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceIdDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPlaceIdDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[2] = self->_businessId;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = self->_basemapId;
  *((unsigned char *)v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v5 + 6) = self->_localSearchProviderId;
  *((unsigned char *)v5 + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 7) = self->_resultIndex;
    *((unsigned char *)v5 + 32) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)result + 2) = self->_businessId;
    *((unsigned char *)result + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_basemapId;
  *((unsigned char *)result + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_localSearchProviderId;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 7) = self->_resultIndex;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOPlaceIdDetails *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_businessId != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_basemapId != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_localSearchProviderId != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_resultIndex != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPlaceIdDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_businessId;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_basemapId;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_localSearchProviderId;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_resultIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_businessId = *((void *)v5 + 2);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_basemapId = *((void *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_localSearchProviderId = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 32) & 8) != 0)
  {
LABEL_5:
    self->_resultIndex = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
}

@end