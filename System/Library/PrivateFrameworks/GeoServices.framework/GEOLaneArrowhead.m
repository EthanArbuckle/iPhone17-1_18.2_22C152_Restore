@interface GEOLaneArrowhead
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAngle;
- (BOOL)hasCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLaneArrowhead)initWithDictionary:(id)a3;
- (GEOLaneArrowhead)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCategory:(id)a3;
- (int)angle;
- (int)category;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAngle:(int)a3;
- (void)setCategory:(int)a3;
- (void)setHasAngle:(BOOL)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLaneArrowhead

- (int)angle
{
  return self->_angle;
}

- (void)setAngle:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_angle = a3;
}

- (void)setHasAngle:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAngle
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)category
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_category;
  }
  else {
    return 0;
  }
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 <= 15)
  {
    v4 = @"NO_DIRECTIONS_INDICATED";
    switch(a3)
    {
      case 0:
        goto LABEL_37;
      case 1:
        v4 = @"STRAIGHT";
        break;
      case 2:
        v4 = @"SLIGHT_RIGHT";
        break;
      case 4:
        v4 = @"RIGHT";
        break;
      case 8:
        v4 = @"SHARP_RIGHT";
        break;
      default:
        goto LABEL_36;
    }
    return v4;
  }
  if (a3 <= 63)
  {
    if (a3 == 16)
    {
      v4 = @"U_TURN_LEFT";
    }
    else
    {
      if (a3 != 32) {
        goto LABEL_36;
      }
      v4 = @"SHARP_LEFT";
    }
  }
  else
  {
    switch(a3)
    {
      case 64:
        v4 = @"LEFT";
        break;
      case 128:
        v4 = @"SLIGHT_LEFT";
        break;
      case 256:
        v4 = @"U_TURN_RIGHT";
        return v4;
      default:
LABEL_36:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_37:
        return v4;
    }
  }
  return v4;
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_DIRECTIONS_INDICATED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STRAIGHT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLIGHT_RIGHT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RIGHT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHARP_RIGHT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"U_TURN_LEFT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SHARP_LEFT"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"LEFT"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"SLIGHT_LEFT"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"U_TURN_RIGHT"])
  {
    int v4 = 256;
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
  v8.super_class = (Class)GEOLaneArrowhead;
  int v4 = [(GEOLaneArrowhead *)&v8 description];
  v5 = [(GEOLaneArrowhead *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaneArrowhead _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_28;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if (v5)
  {
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v6 forKey:@"angle"];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 20);
    if (v7 <= 15)
    {
      objc_super v8 = @"NO_DIRECTIONS_INDICATED";
      switch(v7)
      {
        case 0:
          goto LABEL_23;
        case 1:
          objc_super v8 = @"STRAIGHT";
          break;
        case 2:
          objc_super v8 = @"SLIGHT_RIGHT";
          break;
        case 4:
          objc_super v8 = @"RIGHT";
          break;
        case 8:
          objc_super v8 = @"SHARP_RIGHT";
          break;
        default:
          goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v7 <= 63)
    {
      if (v7 == 16)
      {
        objc_super v8 = @"U_TURN_LEFT";
        goto LABEL_23;
      }
      if (v7 == 32)
      {
        objc_super v8 = @"SHARP_LEFT";
        goto LABEL_23;
      }
    }
    else
    {
      switch(v7)
      {
        case 64:
          objc_super v8 = @"LEFT";
          goto LABEL_23;
        case 128:
          objc_super v8 = @"SLIGHT_LEFT";
          goto LABEL_23;
        case 256:
          objc_super v8 = @"U_TURN_RIGHT";
LABEL_23:
          [v4 setObject:v8 forKey:@"category"];

          goto LABEL_24;
      }
    }
LABEL_22:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __46__GEOLaneArrowhead__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E53D8860;
      id v13 = v12;
      id v17 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v16];
      id v14 = v13;

      v11 = v14;
    }
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_28:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaneArrowhead _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOLaneArrowhead__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
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

- (GEOLaneArrowhead)initWithDictionary:(id)a3
{
  return (GEOLaneArrowhead *)-[GEOLaneArrowhead _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"angle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAngle:", objc_msgSend(v4, "intValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        if ([v6 isEqualToString:@"NO_DIRECTIONS_INDICATED"])
        {
          uint64_t v7 = 0;
        }
        else if ([v6 isEqualToString:@"STRAIGHT"])
        {
          uint64_t v7 = 1;
        }
        else if ([v6 isEqualToString:@"SLIGHT_RIGHT"])
        {
          uint64_t v7 = 2;
        }
        else if ([v6 isEqualToString:@"RIGHT"])
        {
          uint64_t v7 = 4;
        }
        else if ([v6 isEqualToString:@"SHARP_RIGHT"])
        {
          uint64_t v7 = 8;
        }
        else if ([v6 isEqualToString:@"U_TURN_LEFT"])
        {
          uint64_t v7 = 16;
        }
        else if ([v6 isEqualToString:@"SHARP_LEFT"])
        {
          uint64_t v7 = 32;
        }
        else if ([v6 isEqualToString:@"LEFT"])
        {
          uint64_t v7 = 64;
        }
        else if ([v6 isEqualToString:@"SLIGHT_LEFT"])
        {
          uint64_t v7 = 128;
        }
        else if ([v6 isEqualToString:@"U_TURN_RIGHT"])
        {
          uint64_t v7 = 256;
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        uint64_t v7 = [v5 intValue];
      }
      [a1 setCategory:v7];
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (GEOLaneArrowhead)initWithJSON:(id)a3
{
  return (GEOLaneArrowhead *)-[GEOLaneArrowhead _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaneArrowheadIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaneArrowheadReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteSint32Field();
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
  [(GEOLaneArrowhead *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_angle;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_category;
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
    *(_DWORD *)(v4 + 16) = self->_angle;
    *(unsigned char *)(v4 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_category;
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
  [(GEOLaneArrowhead *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_angle != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_category != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLaneArrowhead *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_angle;
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
  uint64_t v4 = 2654435761 * self->_category;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_angle = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_category = v5[5];
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
    [(GEOLaneArrowhead *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end