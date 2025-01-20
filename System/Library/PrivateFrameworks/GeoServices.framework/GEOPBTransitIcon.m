@interface GEOPBTransitIcon
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCartoId;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTransitTypeEnumValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitIcon)initWithDictionary:(id)a3;
- (GEOPBTransitIcon)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_firstAttribute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)iconType;
- (unint64_t)hash;
- (unsigned)cartoId;
- (unsigned)iconAttributeKey;
- (unsigned)iconAttributeValue;
- (unsigned)transitTypeEnumValue;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCartoId:(unsigned int)a3;
- (void)setHasCartoId:(BOOL)a3;
- (void)setHasTransitTypeEnumValue:(BOOL)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTransitTypeEnumValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitIcon

- (unsigned)cartoId
{
  return self->_cartoId;
}

- (void)setCartoId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_cartoId = a3;
}

- (void)setHasCartoId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCartoId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)transitTypeEnumValue
{
  return self->_transitTypeEnumValue;
}

- (void)setTransitTypeEnumValue:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_transitTypeEnumValue = a3;
}

- (void)setHasTransitTypeEnumValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransitTypeEnumValue
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitIcon;
  v4 = [(GEOPBTransitIcon *)&v8 description];
  v5 = [(GEOPBTransitIcon *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitIcon _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if (v5)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v7 = @"cartoId";
      }
      else {
        v7 = @"carto_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v9 = @"transitTypeEnumValue";
      }
      else {
        v9 = @"transit_type_enum_value";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 styleAttributes];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"styleAttributes";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"style_attributes";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __46__GEOPBTransitIcon__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitIcon _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitIcon__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitIcon)initWithDictionary:(id)a3
{
  return (GEOPBTransitIcon *)-[GEOPBTransitIcon _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"cartoId";
      }
      else {
        v6 = @"carto_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCartoId:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"transitTypeEnumValue";
      }
      else {
        objc_super v8 = @"transit_type_enum_value";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitTypeEnumValue:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"styleAttributes";
      }
      else {
        id v10 = @"style_attributes";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v13 = [(GEOStyleAttributes *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOStyleAttributes *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setStyleAttributes:v13];
      }
    }
  }

  return a1;
}

- (GEOPBTransitIcon)initWithJSON:(id)a3
{
  return (GEOPBTransitIcon *)-[GEOPBTransitIcon _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitIconIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitIconReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOPBTransitIcon *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 6) = self->_cartoId;
    *((unsigned char *)v6 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_transitTypeEnumValue;
    *((unsigned char *)v6 + 32) |= 2u;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v6, "setStyleAttributes:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_cartoId;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_transitTypeEnumValue;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  id v8 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPBTransitIcon *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_cartoId != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_transitTypeEnumValue != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 2)) {
    char v6 = -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPBTransitIcon *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_cartoId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_transitTypeEnumValue;
  return v4 ^ v3 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 32);
  if (v5)
  {
    self->_cartoId = v8[6];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_transitTypeEnumValue = v8[7];
    *(unsigned char *)&self->_flags |= 2u;
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v7 = *((void *)v8 + 2);
  if (styleAttributes)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPBTransitIcon setStyleAttributes:](self, "setStyleAttributes:");
  }
  uint64_t v4 = v8;
LABEL_11:
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
    [(GEOPBTransitIcon *)self readAll:0];
    styleAttributes = self->_styleAttributes;
    [(GEOStyleAttributes *)styleAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int)iconType
{
  if ([(GEOPBTransitIcon *)self hasCartoId]) {
    return 0;
  }
  else {
    return ![(GEOPBTransitIcon *)self hasTransitTypeEnumValue];
  }
}

- (unsigned)iconAttributeKey
{
  v2 = [(GEOPBTransitIcon *)self _firstAttribute];
  if ([v2 hasKey]) {
    unsigned int v3 = [v2 key];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)iconAttributeValue
{
  v2 = [(GEOPBTransitIcon *)self _firstAttribute];
  if ([v2 hasValue]) {
    unsigned int v3 = [v2 value];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (id)_firstAttribute
{
  if ([(GEOPBTransitIcon *)self hasStyleAttributes])
  {
    unsigned int v3 = [(GEOPBTransitIcon *)self styleAttributes];
    if ([v3 attributesCount])
    {
      uint64_t v4 = [v3 attributeAtIndex:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end