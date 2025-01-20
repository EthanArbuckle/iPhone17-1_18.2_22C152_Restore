@interface GEOVehicleInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCarPlayConnectionStatus;
- (BOOL)hasIntentsConnectionStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVehicleInfo)initWithDictionary:(id)a3;
- (GEOVehicleInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)carPlayConnectionStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intentsConnectionStatusAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsCarPlayConnectionStatus:(id)a3;
- (int)StringAsIntentsConnectionStatus:(id)a3;
- (int)carPlayConnectionStatus;
- (int)intentsConnectionStatus;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarPlayConnectionStatus:(int)a3;
- (void)setHasCarPlayConnectionStatus:(BOOL)a3;
- (void)setHasIntentsConnectionStatus:(BOOL)a3;
- (void)setIntentsConnectionStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVehicleInfo

- (int)carPlayConnectionStatus
{
  if (*(unsigned char *)&self->_flags) {
    return self->_carPlayConnectionStatus;
  }
  else {
    return 0;
  }
}

- (void)setCarPlayConnectionStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_carPlayConnectionStatus = a3;
}

- (void)setHasCarPlayConnectionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCarPlayConnectionStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)carPlayConnectionStatusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"ACTIVE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"INACTIVE";
  }
  return v4;
}

- (int)StringAsCarPlayConnectionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INACTIVE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ACTIVE"];
  }

  return v4;
}

- (int)intentsConnectionStatus
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_intentsConnectionStatus;
  }
  else {
    return 0;
  }
}

- (void)setIntentsConnectionStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_intentsConnectionStatus = a3;
}

- (void)setHasIntentsConnectionStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntentsConnectionStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)intentsConnectionStatusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ACTIVE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"INACTIVE";
  }
  return v4;
}

- (int)StringAsIntentsConnectionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INACTIVE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ACTIVE"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVehicleInfo;
  int v4 = [(GEOVehicleInfo *)&v8 description];
  v5 = [(GEOVehicleInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
      int v6 = *(_DWORD *)(a1 + 16);
      if (v6)
      {
        if (v6 == 1)
        {
          v7 = @"ACTIVE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = @"INACTIVE";
      }
      if (a2) {
        objc_super v8 = @"carPlayConnectionStatus";
      }
      else {
        objc_super v8 = @"car_play_connection_status";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 20);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"ACTIVE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"INACTIVE";
      }
      if (a2) {
        v11 = @"intentsConnectionStatus";
      }
      else {
        v11 = @"intents_connection_status";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __44__GEOVehicleInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOVehicleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOVehicleInfo)initWithDictionary:(id)a3
{
  return (GEOVehicleInfo *)-[GEOVehicleInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        int v6 = @"carPlayConnectionStatus";
      }
      else {
        int v6 = @"car_play_connection_status";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"INACTIVE"]) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = [v8 isEqualToString:@"ACTIVE"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setCarPlayConnectionStatus:v9];
LABEL_14:

      if (a3) {
        id v10 = @"intentsConnectionStatus";
      }
      else {
        id v10 = @"intents_connection_status";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"INACTIVE"]) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = [v12 isEqualToString:@"ACTIVE"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setIntentsConnectionStatus:v13];
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

- (GEOVehicleInfo)initWithJSON:(id)a3
{
  return (GEOVehicleInfo *)-[GEOVehicleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVehicleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVehicleInfoReadAllFrom((uint64_t)self, a3);
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
  [(GEOVehicleInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_carPlayConnectionStatus;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_intentsConnectionStatus;
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
    *(_DWORD *)(v4 + 16) = self->_carPlayConnectionStatus;
    *(unsigned char *)(v4 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_intentsConnectionStatus;
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
  [(GEOVehicleInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_carPlayConnectionStatus != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_intentsConnectionStatus != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVehicleInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_carPlayConnectionStatus;
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
  uint64_t v4 = 2654435761 * self->_intentsConnectionStatus;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_carPlayConnectionStatus = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_intentsConnectionStatus = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOVehicleInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end