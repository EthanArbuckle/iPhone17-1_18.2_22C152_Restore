@interface MUIconArgument
- (BOOL)hasNightMode;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTransparent;
- (BOOL)isEqual:(id)a3;
- (BOOL)nightMode;
- (BOOL)readFrom:(id)a3;
- (BOOL)transparent;
- (MUStyleAttributes)styleAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNightMode:(BOOL)a3;
- (void)setHasTransparent:(BOOL)a3;
- (void)setNightMode:(BOOL)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTransparent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUIconArgument

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (void)setNightMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nightMode = a3;
}

- (void)setHasNightMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNightMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTransparent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_transparent = a3;
}

- (void)setHasTransparent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransparent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUIconArgument;
  v4 = [(MUIconArgument *)&v8 description];
  v5 = [(MUIconArgument *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
  {
    v5 = [(MUStyleAttributes *)styleAttributes dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"styleAttributes"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithBool:self->_nightMode];
    [v3 setObject:v7 forKey:@"nightMode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_transparent];
    [v3 setObject:v8 forKey:@"transparent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUIconArgumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_styleAttributes)
  {
    id v6 = v4;
    objc_msgSend(v4, "setStyleAttributes:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[16] = self->_nightMode;
    v4[20] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[17] = self->_transparent;
    v4[20] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MUStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v5 + 16) = self->_nightMode;
    *(unsigned char *)(v5 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_transparent;
    *(unsigned char *)(v5 + 20) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 1))
  {
    if (!-[MUStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_nightMode)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_transparent)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 17))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MUStyleAttributes *)self->_styleAttributes hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_nightMode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_transparent;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  styleAttributes = self->_styleAttributes;
  uint64_t v6 = *((void *)v4 + 1);
  if (styleAttributes)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    styleAttributes = (MUStyleAttributes *)-[MUStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    styleAttributes = (MUStyleAttributes *)-[MUIconArgument setStyleAttributes:](self, "setStyleAttributes:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 20);
  if (v7)
  {
    self->_nightMode = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 20);
  }
  if ((v7 & 2) != 0)
  {
    self->_transparent = *((unsigned char *)v4 + 17);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](styleAttributes, v4);
}

- (MUStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (BOOL)transparent
{
  return self->_transparent;
}

- (void).cxx_destruct
{
}

@end