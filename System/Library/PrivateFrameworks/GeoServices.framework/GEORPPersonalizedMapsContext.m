@interface GEORPPersonalizedMapsContext
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressType;
- (BOOL)hasPlaceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPersonalizedMapsContext)initWithDictionary:(id)a3;
- (GEORPPersonalizedMapsContext)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeTypeAsString:(int)a3;
- (int)StringAsAddressType:(id)a3;
- (int)StringAsPlaceType:(id)a3;
- (int)addressType;
- (int)placeType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressType:(int)a3;
- (void)setHasAddressType:(BOOL)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setPlaceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPersonalizedMapsContext

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPersonalizedMapsContext *)self readAll:0];
  }
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
        v6 = @"addressType";
      }
      else {
        v6 = @"address_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"ADDRESS_TYPE_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_CURRENT_LOCATION"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_MARKED_LOCATION"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_FREQUENT_LOCATION"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_RECENT_LOCATION"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"SEARCH"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"USER_EDIT_FWDGEO"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"FALLBACK_CURRENT_LOCATION"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_TYPE_COMPLETION"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"EXISTING_ADDRESS"])
        {
          uint64_t v9 = 9;
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
          goto LABEL_32;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setAddressType:v9];
LABEL_32:

      if (a3) {
        v10 = @"placeType";
      }
      else {
        v10 = @"place_type";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"PLACE_TYPE_UNKNOWN"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"HOME"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"WORK"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"SCHOOL"])
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setPlaceType:v13];
      goto LABEL_49;
    }
  }
LABEL_50:

  return a1;
}

- (int)addressType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_addressType;
  }
  else {
    return 0;
  }
}

- (void)setAddressType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_addressType = a3;
}

- (void)setHasAddressType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAddressType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)addressTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E53DBCA0[a3];
  }

  return v3;
}

- (int)StringAsAddressType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADDRESS_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_CURRENT_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_MARKED_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_FREQUENT_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RECENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USER_EDIT_FWDGEO"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FALLBACK_CURRENT_LOCATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_TYPE_COMPLETION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"EXISTING_ADDRESS"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_placeType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPlaceType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DBCF0[a3];
  }

  return v3;
}

- (int)StringAsPlaceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCHOOL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPersonalizedMapsContext;
  int v4 = [(GEORPPersonalizedMapsContext *)&v8 description];
  id v5 = [(GEORPPersonalizedMapsContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPersonalizedMapsContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DBCA0[v6];
      }
      if (a2) {
        objc_super v8 = @"addressType";
      }
      else {
        objc_super v8 = @"address_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 20);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53DBCF0[v9];
      }
      if (a2) {
        v11 = @"placeType";
      }
      else {
        v11 = @"place_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    id v12 = *(void **)(a1 + 8);
    if (v12)
    {
      uint64_t v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __58__GEORPPersonalizedMapsContext__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEORPPersonalizedMapsContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEORPPersonalizedMapsContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPPersonalizedMapsContext)initWithDictionary:(id)a3
{
  return (GEORPPersonalizedMapsContext *)-[GEORPPersonalizedMapsContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPPersonalizedMapsContext)initWithJSON:(id)a3
{
  return (GEORPPersonalizedMapsContext *)-[GEORPPersonalizedMapsContext _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPersonalizedMapsContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPersonalizedMapsContextReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPPersonalizedMapsContext *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_addressType;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_placeType;
    *((unsigned char *)v5 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_addressType;
    *(unsigned char *)(v4 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_placeType;
    *(unsigned char *)(v4 + 24) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPPersonalizedMapsContext *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_addressType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_placeType != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPPersonalizedMapsContext *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_addressType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_placeType;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_addressType = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_placeType = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void).cxx_destruct
{
}

@end