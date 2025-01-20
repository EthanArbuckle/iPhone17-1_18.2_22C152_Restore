@interface GEORPTdmUserMapsStatus
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsBlocked;
- (BOOL)hasIsTrusted;
- (BOOL)hasVersion;
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrusted;
- (BOOL)readFrom:(id)a3;
- (GEORPTdmUserMapsStatus)initWithDictionary:(id)a3;
- (GEORPTdmUserMapsStatus)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)version;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsBlocked:(BOOL)a3;
- (void)setHasIsTrusted:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsTrusted:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTdmUserMapsStatus

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isBlocked = a3;
}

- (void)setHasIsBlocked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsBlocked
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isTrusted
{
  return self->_isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isTrusted = a3;
}

- (void)setHasIsTrusted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsTrusted
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTdmUserMapsStatus;
  v4 = [(GEORPTdmUserMapsStatus *)&v8 description];
  v5 = [(GEORPTdmUserMapsStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmUserMapsStatus _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_20:
    v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    [v4 setObject:v17 forKey:@"version"];

    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
  if (a2) {
    v16 = @"isBlocked";
  }
  else {
    v16 = @"is_blocked";
  }
  [v4 setObject:v15 forKey:v16];

  char v5 = *(unsigned char *)(a1 + 28);
  if (v5) {
    goto LABEL_20;
  }
LABEL_4:
  if ((v5 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  if (a2) {
    v7 = @"isTrusted";
  }
  else {
    v7 = @"is_trusted";
  }
  [v4 setObject:v6 forKey:v7];

LABEL_9:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__GEORPTdmUserMapsStatus__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E53D8860;
      id v12 = v11;
      id v19 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v18];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPTdmUserMapsStatus _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORPTdmUserMapsStatus__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEORPTdmUserMapsStatus)initWithDictionary:(id)a3
{
  return (GEORPTdmUserMapsStatus *)-[GEORPTdmUserMapsStatus _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"isBlocked";
      }
      else {
        v6 = @"is_blocked";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsBlocked:", objc_msgSend(v7, "BOOLValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVersion:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      if (a3) {
        v9 = @"isTrusted";
      }
      else {
        v9 = @"is_trusted";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsTrusted:", objc_msgSend(v10, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPTdmUserMapsStatus)initWithJSON:(id)a3
{
  return (GEORPTdmUserMapsStatus *)-[GEORPTdmUserMapsStatus _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmUserMapsStatusIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmUserMapsStatusReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPTdmUserMapsStatus *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[24] = self->_isBlocked;
    v5[28] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 2) = self->_version;
  v5[28] |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5[25] = self->_isTrusted;
    v5[28] |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v4 + 16) = self->_version;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v4 + 24) = self->_isBlocked;
  *(unsigned char *)(v4 + 28) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v4 + 25) = self->_isTrusted;
    *(unsigned char *)(v4 + 28) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEORPTdmUserMapsStatus *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_isBlocked)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_isTrusted)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPTdmUserMapsStatus *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_isBlocked;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_version;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_isTrusted;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_isBlocked = *((unsigned char *)v5 + 24);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((void *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 4) != 0)
  {
LABEL_4:
    self->_isTrusted = *((unsigned char *)v5 + 25);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
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
    [(GEORPTdmUserMapsStatus *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end