@interface GEOWaypointNameProperties
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayAddress;
- (BOOL)hasDisplayName;
- (BOOL)hasHasDisplayAddress;
- (BOOL)hasHasDisplayName;
- (BOOL)hasHasSpokenAddress;
- (BOOL)hasHasSpokenName;
- (BOOL)hasSpokenAddress;
- (BOOL)hasSpokenName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWaypointNameProperties)initWithDictionary:(id)a3;
- (GEOWaypointNameProperties)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasDisplayAddress:(BOOL)a3;
- (void)setHasDisplayName:(BOOL)a3;
- (void)setHasHasDisplayAddress:(BOOL)a3;
- (void)setHasHasDisplayName:(BOOL)a3;
- (void)setHasHasSpokenAddress:(BOOL)a3;
- (void)setHasHasSpokenName:(BOOL)a3;
- (void)setHasSpokenAddress:(BOOL)a3;
- (void)setHasSpokenName:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointNameProperties

- (BOOL)hasDisplayName
{
  return self->_hasDisplayName;
}

- (void)setHasDisplayName:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_hasDisplayName = a3;
}

- (void)setHasHasDisplayName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasDisplayName
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasSpokenName
{
  return self->_hasSpokenName;
}

- (void)setHasSpokenName:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_hasSpokenName = a3;
}

- (void)setHasHasSpokenName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHasSpokenName
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasDisplayAddress
{
  return self->_hasDisplayAddress;
}

- (void)setHasDisplayAddress:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_hasDisplayAddress = a3;
}

- (void)setHasHasDisplayAddress:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHasDisplayAddress
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasSpokenAddress
{
  return self->_hasSpokenAddress;
}

- (void)setHasSpokenAddress:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_hasSpokenAddress = a3;
}

- (void)setHasHasSpokenAddress:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHasSpokenAddress
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointNameProperties;
  v4 = [(GEOWaypointNameProperties *)&v8 description];
  v5 = [(GEOWaypointNameProperties *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointNameProperties _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
    if (a2) {
      v16 = @"hasDisplayName";
    }
    else {
      v16 = @"has_display_name";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 20) & 8) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 19)];
  if (a2) {
    v18 = @"hasSpokenName";
  }
  else {
    v18 = @"has_spoken_name";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  if (a2) {
    v20 = @"hasDisplayAddress";
  }
  else {
    v20 = @"has_display_address";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 20) & 4) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
    if (a2) {
      v7 = @"hasSpokenAddress";
    }
    else {
      v7 = @"has_spoken_address";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__GEOWaypointNameProperties__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v12 = v11;
      id v22 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v21];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointNameProperties _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOWaypointNameProperties__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointNameProperties)initWithDictionary:(id)a3
{
  return (GEOWaypointNameProperties *)-[GEOWaypointNameProperties _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"hasDisplayName";
      }
      else {
        v6 = @"has_display_name";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasDisplayName:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"hasSpokenName";
      }
      else {
        objc_super v8 = @"has_spoken_name";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasSpokenName:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"hasDisplayAddress";
      }
      else {
        id v10 = @"has_display_address";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasDisplayAddress:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        id v12 = @"hasSpokenAddress";
      }
      else {
        id v12 = @"has_spoken_address";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasSpokenAddress:", objc_msgSend(v13, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOWaypointNameProperties)initWithJSON:(id)a3
{
  return (GEOWaypointNameProperties *)-[GEOWaypointNameProperties _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointNamePropertiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointNamePropertiesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWaypointNameProperties *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_hasDisplayName;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[19] = self->_hasSpokenName;
  v5[20] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[16] = self->_hasDisplayAddress;
  v5[20] |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v5[18] = self->_hasSpokenAddress;
    v5[20] |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v4 + 17) = self->_hasDisplayName;
    *(unsigned char *)(v4 + 20) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v4 + 16) = self->_hasDisplayAddress;
      *(unsigned char *)(v4 + 20) |= 1u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 19) = self->_hasSpokenName;
  *(unsigned char *)(v4 + 20) |= 8u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(unsigned char *)(v4 + 18) = self->_hasSpokenAddress;
    *(unsigned char *)(v4 + 20) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOWaypointNameProperties *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_hasDisplayName)
    {
      if (!v4[17]) {
        goto LABEL_28;
      }
    }
    else if (v4[17])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[20] & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_hasSpokenName)
    {
      if (!v4[19]) {
        goto LABEL_28;
      }
    }
    else if (v4[19])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 8) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[20] & 1) == 0) {
      goto LABEL_28;
    }
    if (self->_hasDisplayAddress)
    {
      if (!v4[16]) {
        goto LABEL_28;
      }
    }
    else if (v4[16])
    {
      goto LABEL_28;
    }
  }
  else if (v4[20])
  {
    goto LABEL_28;
  }
  BOOL v5 = (v4[20] & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) != 0)
    {
      if (self->_hasSpokenAddress)
      {
        if (!v4[18]) {
          goto LABEL_28;
        }
      }
      else if (v4[18])
      {
        goto LABEL_28;
      }
      BOOL v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  [(GEOWaypointNameProperties *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_hasDisplayName;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_hasSpokenName;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_hasDisplayAddress;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasSpokenAddress;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_hasDisplayName = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[20];
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if (!v4) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v5[20] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_hasSpokenName = v5[19];
  *(unsigned char *)&self->_flags |= 8u;
  BOOL v4 = v5[20];
  if (!v4)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_hasDisplayAddress = v5[16];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[20] & 4) != 0)
  {
LABEL_5:
    self->_hasSpokenAddress = v5[18];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_6:
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
    [(GEOWaypointNameProperties *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end