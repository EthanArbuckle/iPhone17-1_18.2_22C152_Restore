@interface GEORPPersonalizedMaps
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasAddressType;
- (BOOL)hasPlaceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAddress)address;
- (GEORPPersonalizedMaps)initWithDictionary:(id)a3;
- (GEORPPersonalizedMaps)initWithJSON:(id)a3;
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
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAddressType:(int)a3;
- (void)setHasAddressType:(BOOL)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setPlaceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPersonalizedMaps

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
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E6B80[a3];
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
    char v3 = off_1E53E6BD0[a3];
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

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEORPAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPersonalizedMaps;
  int v4 = [(GEORPPersonalizedMaps *)&v8 description];
  v5 = [(GEORPPersonalizedMaps *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPersonalizedMaps _dictionaryRepresentation:]((uint64_t)self, 0);
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
        v7 = off_1E53E6B80[v6];
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
        v10 = off_1E53E6BD0[v9];
      }
      if (a2) {
        v11 = @"placeType";
      }
      else {
        v11 = @"place_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 address];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"address"];
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
  return -[GEORPPersonalizedMaps _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPersonalizedMaps)initWithDictionary:(id)a3
{
  return (GEORPPersonalizedMaps *)-[GEORPPersonalizedMaps _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_55;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_55;
  }
  if (a3) {
    uint64_t v6 = @"addressType";
  }
  else {
    uint64_t v6 = @"address_type";
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

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_48:
    [a1 setPlaceType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEORPAddress alloc];
    if (a3) {
      uint64_t v16 = [(GEORPAddress *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEORPAddress *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setAddress:v16];
  }
LABEL_55:

  return a1;
}

- (GEORPPersonalizedMaps)initWithJSON:(id)a3
{
  return (GEORPPersonalizedMaps *)-[GEORPPersonalizedMaps _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPersonalizedMapsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPersonalizedMapsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEORPPersonalizedMaps *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_addressType;
    *((unsigned char *)v6 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_placeType;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
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
    *(_DWORD *)(v5 + 16) = self->_addressType;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_placeType;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  id v8 = [(GEORPAddress *)self->_address copyWithZone:a3];
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
  [(GEORPPersonalizedMaps *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_addressType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_placeType != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 1)) {
    char v6 = -[GEORPAddress isEqual:](address, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPPersonalizedMaps *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_addressType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEORPAddress *)self->_address hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_placeType;
  return v4 ^ v3 ^ [(GEORPAddress *)self->_address hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 24);
  if (v5)
  {
    self->_addressType = v8[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_placeType = v8[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
  address = self->_address;
  uint64_t v7 = *((void *)v8 + 1);
  if (address)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEORPAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEORPPersonalizedMaps setAddress:](self, "setAddress:");
  }
  uint64_t v4 = v8;
LABEL_11:
}

- (void).cxx_destruct
{
}

@end