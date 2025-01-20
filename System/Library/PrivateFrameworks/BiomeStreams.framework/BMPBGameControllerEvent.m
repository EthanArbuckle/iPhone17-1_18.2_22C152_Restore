@interface BMPBGameControllerEvent
- (BOOL)hasIsControllerConnected;
- (BOOL)hasNumberOfControllersConnected;
- (BOOL)isControllerConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)numberOfControllersConnected;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsControllerConnected:(BOOL)a3;
- (void)setHasNumberOfControllersConnected:(BOOL)a3;
- (void)setIsControllerConnected:(BOOL)a3;
- (void)setNumberOfControllersConnected:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBGameControllerEvent

- (void)setIsControllerConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isControllerConnected = a3;
}

- (void)setHasIsControllerConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsControllerConnected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfControllersConnected:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfControllersConnected = a3;
}

- (void)setHasNumberOfControllersConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfControllersConnected
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBGameControllerEvent;
  v4 = [(BMPBGameControllerEvent *)&v8 description];
  v5 = [(BMPBGameControllerEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isControllerConnected];
    [v3 setObject:v5 forKey:@"isControllerConnected"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_numberOfControllersConnected];
    [v3 setObject:v6 forKey:@"numberOfControllersConnected"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBGameControllerEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_isControllerConnected;
    v4[16] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_numberOfControllersConnected;
    v4[16] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_isControllerConnected;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_numberOfControllersConnected;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_isControllerConnected)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 16) & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_numberOfControllersConnected != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isControllerConnected;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numberOfControllersConnected;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_isControllerConnected = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_numberOfControllersConnected = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isControllerConnected
{
  return self->_isControllerConnected;
}

- (int)numberOfControllersConnected
{
  return self->_numberOfControllersConnected;
}

@end