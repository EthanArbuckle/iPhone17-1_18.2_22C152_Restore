@interface GEOTrafficBannerTextButton
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAction;
- (BOOL)hasButtonDisplay;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)text;
- (GEOTrafficBannerTextButton)initWithDictionary:(id)a3;
- (GEOTrafficBannerTextButton)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionAsString:(int)a3;
- (id)buttonDisplayAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAction:(id)a3;
- (int)StringAsButtonDisplay:(id)a3;
- (int)action;
- (int)buttonDisplay;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setButtonDisplay:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasButtonDisplay:(BOOL)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficBannerTextButton

- (BOOL)hasText
{
  return self->_text != 0;
}

- (GEOFormattedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int)action
{
  if (*(unsigned char *)&self->_flags) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0750[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISMISS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCEPT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)buttonDisplay
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_buttonDisplay;
  }
  else {
    return 0;
  }
}

- (void)setButtonDisplay:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_buttonDisplay = a3;
}

- (void)setHasButtonDisplay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasButtonDisplay
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)buttonDisplayAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0768[a3];
  }

  return v3;
}

- (int)StringAsButtonDisplay:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DISPLAY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISPLAY_DEFAULT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISPLAY_AFTER_USER_INTERACTION"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)GEOTrafficBannerTextButton;
  int v4 = [(GEOTrafficBannerTextButton *)&v8 description];
  v5 = [(GEOTrafficBannerTextButton *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficBannerTextButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 text];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"text"];
    }
    char v8 = *(unsigned char *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = *(int *)(a1 + 24);
      if (v9 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E0750[v9];
      }
      [v4 setObject:v10 forKey:@"action"];

      char v8 = *(unsigned char *)(a1 + 32);
    }
    if ((v8 & 2) != 0)
    {
      uint64_t v11 = *(int *)(a1 + 28);
      if (v11 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53E0768[v11];
      }
      if (a2) {
        v13 = @"buttonDisplay";
      }
      else {
        v13 = @"button_display";
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
        v21[2] = __56__GEOTrafficBannerTextButton__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficBannerTextButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOTrafficBannerTextButton__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTrafficBannerTextButton)initWithDictionary:(id)a3
{
  return (GEOTrafficBannerTextButton *)-[GEOTrafficBannerTextButton _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"text"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithDictionary:v6];
        }
        uint64_t v9 = (void *)v8;
        [a1 setText:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"action"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"DISMISS"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"ACCEPT"])
        {
          uint64_t v12 = 2;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setAction:v12];
LABEL_20:

      if (a3) {
        v13 = @"buttonDisplay";
      }
      else {
        v13 = @"button_display";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"DISPLAY_UNKNOWN"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"DISPLAY_DEFAULT"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"DISPLAY_AFTER_USER_INTERACTION"])
        {
          uint64_t v16 = 2;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_35:

          goto LABEL_36;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setButtonDisplay:v16];
      goto LABEL_35;
    }
  }
LABEL_36:

  return a1;
}

- (GEOTrafficBannerTextButton)initWithJSON:(id)a3
{
  return (GEOTrafficBannerTextButton *)-[GEOTrafficBannerTextButton _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficBannerTextButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficBannerTextButtonReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_text)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
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
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTrafficBannerTextButton *)self readAll:0];
  if (self->_text) {
    objc_msgSend(v5, "setText:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 6) = self->_action;
    *((unsigned char *)v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_buttonDisplay;
    *((unsigned char *)v5 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOFormattedString *)self->_text copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_action;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_buttonDisplay;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOTrafficBannerTextButton *)self readAll:1];
  [v4 readAll:1];
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 2))
  {
    if (!-[GEOFormattedString isEqual:](text, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_action != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_buttonDisplay != *((_DWORD *)v4 + 7)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTrafficBannerTextButton *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_text hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_action;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_buttonDisplay;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  v7 = (int *)a3;
  [v7 readAll:0];
  text = self->_text;
  uint64_t v5 = *((void *)v7 + 2);
  if (text)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](text, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTrafficBannerTextButton setText:](self, "setText:");
  }
  char v6 = *((unsigned char *)v7 + 32);
  if (v6)
  {
    self->_action = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
    char v6 = *((unsigned char *)v7 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_buttonDisplay = v7[7];
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
    [(GEOTrafficBannerTextButton *)self readAll:0];
    text = self->_text;
    [(GEOFormattedString *)text clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end