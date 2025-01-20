@interface GEORPButton
+ (BOOL)isValid:(id)a3;
- (BOOL)hasButtonAction;
- (BOOL)hasLocalizedText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPButton)initWithDictionary:(id)a3;
- (GEORPButton)initWithJSON:(id)a3;
- (NSString)localizedText;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buttonActionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsButtonAction:(id)a3;
- (int)buttonAction;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setButtonAction:(int)a3;
- (void)setHasButtonAction:(BOOL)a3;
- (void)setLocalizedText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPButton

- (BOOL)hasLocalizedText
{
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
}

- (int)buttonAction
{
  if (*(unsigned char *)&self->_flags) {
    return self->_buttonAction;
  }
  else {
    return 0;
  }
}

- (void)setButtonAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_buttonAction = a3;
}

- (void)setHasButtonAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasButtonAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)buttonActionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"OPEN_REPORTS_HOME";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"BUTTON_ACTION_UNKNOWN";
  }
  return v4;
}

- (int)StringAsButtonAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUTTON_ACTION_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"OPEN_REPORTS_HOME"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPButton;
  int v4 = [(GEORPButton *)&v8 description];
  v5 = [(GEORPButton *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 localizedText];
    if (v5)
    {
      if (a2) {
        v6 = @"localizedText";
      }
      else {
        v6 = @"localized_text";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 20))
    {
      int v7 = *(_DWORD *)(a1 + 16);
      if (v7)
      {
        if (v7 == 1)
        {
          objc_super v8 = @"OPEN_REPORTS_HOME";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v8 = @"BUTTON_ACTION_UNKNOWN";
      }
      if (a2) {
        v9 = @"buttonAction";
      }
      else {
        v9 = @"button_action";
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
  return -[GEORPButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPButton)initWithDictionary:(id)a3
{
  return (GEORPButton *)-[GEORPButton _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"localizedText";
      }
      else {
        v6 = @"localized_text";
      }
      int v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLocalizedText:v8];
      }
      if (a3) {
        v9 = @"buttonAction";
      }
      else {
        v9 = @"button_action";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"BUTTON_ACTION_UNKNOWN"]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = [v11 isEqualToString:@"OPEN_REPORTS_HOME"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setButtonAction:v12];
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEORPButton)initWithJSON:(id)a3
{
  return (GEORPButton *)-[GEORPButton _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPButtonReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localizedText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPButton *)self readAll:0];
  if (self->_localizedText) {
    objc_msgSend(v4, "setLocalizedText:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_buttonAction;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_localizedText copyWithZone:a3];
  int v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_buttonAction;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEORPButton *)self readAll:1];
  [v4 readAll:1];
  localizedText = self->_localizedText;
  if ((unint64_t)localizedText | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](localizedText, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_buttonAction == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPButton *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_localizedText hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_buttonAction;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 1)) {
    -[GEORPButton setLocalizedText:](self, "setLocalizedText:");
  }
  if (v4[5])
  {
    self->_buttonAction = v4[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end