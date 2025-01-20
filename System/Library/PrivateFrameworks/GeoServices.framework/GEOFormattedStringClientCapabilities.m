@interface GEOFormattedStringClientCapabilities
+ (BOOL)isValid:(id)a3;
- (BOOL)concatenatingFormatStringsSupported;
- (BOOL)hasConcatenatingFormatStringsSupported;
- (BOOL)hasStyleSupported;
- (BOOL)hasTimestampFormatPatternSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)styleSupported;
- (BOOL)timestampFormatPatternSupported;
- (GEOFormattedStringClientCapabilities)initWithDictionary:(id)a3;
- (GEOFormattedStringClientCapabilities)initWithJSON:(id)a3;
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
- (void)setConcatenatingFormatStringsSupported:(BOOL)a3;
- (void)setHasConcatenatingFormatStringsSupported:(BOOL)a3;
- (void)setHasStyleSupported:(BOOL)a3;
- (void)setHasTimestampFormatPatternSupported:(BOOL)a3;
- (void)setStyleSupported:(BOOL)a3;
- (void)setTimestampFormatPatternSupported:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOFormattedStringClientCapabilities

- (void).cxx_destruct
{
}

- (void)setTimestampFormatPatternSupported:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_timestampFormatPatternSupported = a3;
}

- (void)setStyleSupported:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_styleSupported = a3;
}

- (void)setConcatenatingFormatStringsSupported:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_concatenatingFormatStringsSupported = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v4 + 18) = self->_timestampFormatPatternSupported;
    *(unsigned char *)(v4 + 20) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v4 + 16) = self->_concatenatingFormatStringsSupported;
  *(unsigned char *)(v4 + 20) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(unsigned char *)(v4 + 17) = self->_styleSupported;
    *(unsigned char *)(v4 + 20) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (BOOL)concatenatingFormatStringsSupported
{
  return self->_concatenatingFormatStringsSupported;
}

- (void)setHasConcatenatingFormatStringsSupported:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasConcatenatingFormatStringsSupported
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)timestampFormatPatternSupported
{
  return self->_timestampFormatPatternSupported;
}

- (void)setHasTimestampFormatPatternSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTimestampFormatPatternSupported
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)styleSupported
{
  return self->_styleSupported;
}

- (void)setHasStyleSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStyleSupported
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOFormattedStringClientCapabilities;
  uint64_t v4 = [(GEOFormattedStringClientCapabilities *)&v8 description];
  id v5 = [(GEOFormattedStringClientCapabilities *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormattedStringClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_17:
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
    [v4 setObject:v16 forKey:@"timestampFormatPatternSupported"];

    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  [v4 setObject:v15 forKey:@"concatenatingFormatStringsSupported"];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 4) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if ((v5 & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
  if (a2) {
    v7 = @"styleSupported";
  }
  else {
    v7 = @"style_supported";
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
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__GEOFormattedStringClientCapabilities__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E53D8860;
      id v12 = v11;
      id v18 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];
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
  return -[GEOFormattedStringClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOFormattedStringClientCapabilities__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOFormattedStringClientCapabilities)initWithDictionary:(id)a3
{
  return (GEOFormattedStringClientCapabilities *)-[GEOFormattedStringClientCapabilities _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"concatenatingFormatStringsSupported"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setConcatenatingFormatStringsSupported:", objc_msgSend(v6, "BOOLValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"timestampFormatPatternSupported"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimestampFormatPatternSupported:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"styleSupported";
      }
      else {
        objc_super v8 = @"style_supported";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStyleSupported:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOFormattedStringClientCapabilities)initWithJSON:(id)a3
{
  return (GEOFormattedStringClientCapabilities *)-[GEOFormattedStringClientCapabilities _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormattedStringClientCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormattedStringClientCapabilitiesReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOFormattedStringClientCapabilities *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[16] = self->_concatenatingFormatStringsSupported;
    v5[20] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[18] = self->_timestampFormatPatternSupported;
  v5[20] |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[17] = self->_styleSupported;
    v5[20] |= 2u;
  }
LABEL_5:
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOFormattedStringClientCapabilities *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[20] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_concatenatingFormatStringsSupported)
    {
      if (!v4[16]) {
        goto LABEL_20;
      }
    }
    else if (v4[16])
    {
      goto LABEL_20;
    }
  }
  else if (v4[20])
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_timestampFormatPatternSupported)
    {
      if (!v4[18]) {
        goto LABEL_20;
      }
    }
    else if (v4[18])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[20] & 4) != 0)
  {
    goto LABEL_20;
  }
  BOOL v5 = (v4[20] & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) != 0)
    {
      if (self->_styleSupported)
      {
        if (!v4[17]) {
          goto LABEL_20;
        }
      }
      else if (v4[17])
      {
        goto LABEL_20;
      }
      BOOL v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  [(GEOFormattedStringClientCapabilities *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_concatenatingFormatStringsSupported;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_timestampFormatPatternSupported;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_styleSupported;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if (v4)
  {
    self->_concatenatingFormatStringsSupported = v5[16];
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v4 = v5[20];
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[20] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_timestampFormatPatternSupported = v5[18];
  *(unsigned char *)&self->_flags |= 4u;
  if ((v5[20] & 2) != 0)
  {
LABEL_4:
    self->_styleSupported = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
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
    [(GEOFormattedStringClientCapabilities *)self readAll:0];
  }
}

@end