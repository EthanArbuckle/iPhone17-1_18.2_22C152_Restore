@interface GEOHyperlinkMetaData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayedString;
- (BOOL)hasHyperlinkType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOHyperlinkMetaData)initWithDictionary:(id)a3;
- (GEOHyperlinkMetaData)initWithJSON:(id)a3;
- (NSString)displayedString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hyperlinkTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsHyperlinkType:(id)a3;
- (int)hyperlinkType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayedString:(id)a3;
- (void)setHasHyperlinkType:(BOOL)a3;
- (void)setHyperlinkType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOHyperlinkMetaData

- (int)hyperlinkType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_hyperlinkType;
  }
  else {
    return 0;
  }
}

- (void)setHyperlinkType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_hyperlinkType = a3;
}

- (void)setHasHyperlinkType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHyperlinkType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)hyperlinkTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E53EC7F0 + a3);
  }

  return v3;
}

- (int)StringAsHyperlinkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PERSONAL_COLLECTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_CONTAINMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TAPPABLE_ENTITY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NON_TAPPABLE_ENTITY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDisplayedString
{
  return self->_displayedString != 0;
}

- (NSString)displayedString
{
  return self->_displayedString;
}

- (void)setDisplayedString:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOHyperlinkMetaData;
  int v4 = [(GEOHyperlinkMetaData *)&v8 description];
  v5 = [(GEOHyperlinkMetaData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOHyperlinkMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 5)
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      }
      else
      {
        v6 = (void *)*((void *)&off_1E53EC7F0 + v5);
      }
      if (a2) {
        v7 = @"hyperlinkType";
      }
      else {
        v7 = @"hyperlink_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 displayedString];
    if (v8)
    {
      if (a2) {
        v9 = @"displayedString";
      }
      else {
        v9 = @"displayed_string";
      }
      [v4 setObject:v8 forKey:v9];
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
  return -[GEOHyperlinkMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOHyperlinkMetaData)initWithDictionary:(id)a3
{
  return (GEOHyperlinkMetaData *)-[GEOHyperlinkMetaData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  if (a3) {
    v6 = @"hyperlinkType";
  }
  else {
    v6 = @"hyperlink_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"PERSONAL_COLLECTION"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"POI_CONTAINMENT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TAPPABLE_ENTITY"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"NON_TAPPABLE_ENTITY"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setHyperlinkType:v9];
  }

  if (a3) {
    v10 = @"displayedString";
  }
  else {
    v10 = @"displayed_string";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setDisplayedString:v12];
  }
LABEL_28:

  return a1;
}

- (GEOHyperlinkMetaData)initWithJSON:(id)a3
{
  return (GEOHyperlinkMetaData *)-[GEOHyperlinkMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOHyperlinkMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOHyperlinkMetaDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_displayedString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOHyperlinkMetaData *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_hyperlinkType;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_displayedString)
  {
    objc_msgSend(v5, "setDisplayedString:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_hyperlinkType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_displayedString copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOHyperlinkMetaData *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_hyperlinkType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  displayedString = self->_displayedString;
  if ((unint64_t)displayedString | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](displayedString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOHyperlinkMetaData *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_hyperlinkType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_displayedString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[5])
  {
    self->_hyperlinkType = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEOHyperlinkMetaData setDisplayedString:](self, "setDisplayedString:");
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

@end