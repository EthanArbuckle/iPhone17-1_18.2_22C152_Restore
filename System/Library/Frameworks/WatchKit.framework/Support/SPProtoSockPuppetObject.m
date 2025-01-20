@interface SPProtoSockPuppetObject
- (BOOL)hasCacheMessage;
- (BOOL)hasKey;
- (BOOL)hasNBOOL;
- (BOOL)hasNdouble;
- (BOOL)hasNfloat;
- (BOOL)hasNint32;
- (BOOL)hasNint64;
- (BOOL)hasNuint32;
- (BOOL)hasNuint64;
- (BOOL)hasObject;
- (BOOL)hasSubtype;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)nBOOL;
- (BOOL)readFrom:(id)a3;
- (NSData)object;
- (NSString)key;
- (NSString)text;
- (SPProtoCacheMessage)cacheMessage;
- (double)ndouble;
- (float)nfloat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)nint32;
- (int)subtype;
- (int)type;
- (int64_t)nint64;
- (unint64_t)hash;
- (unint64_t)nuint64;
- (unsigned)nuint32;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheMessage:(id)a3;
- (void)setHasNBOOL:(BOOL)a3;
- (void)setHasNdouble:(BOOL)a3;
- (void)setHasNfloat:(BOOL)a3;
- (void)setHasNint32:(BOOL)a3;
- (void)setHasNint64:(BOOL)a3;
- (void)setHasNuint32:(BOOL)a3;
- (void)setHasNuint64:(BOOL)a3;
- (void)setHasSubtype:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNBOOL:(BOOL)a3;
- (void)setNdouble:(double)a3;
- (void)setNfloat:(float)a3;
- (void)setNint32:(int)a3;
- (void)setNint64:(int64_t)a3;
- (void)setNuint32:(unsigned int)a3;
- (void)setNuint64:(unint64_t)a3;
- (void)setObject:(id)a3;
- (void)setSubtype:(int)a3;
- (void)setText:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoSockPuppetObject

- (void)setSubtype:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_subtype = a3;
}

- (void)setHasSubtype:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubtype
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasCacheMessage
{
  return self->_cacheMessage != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)setNdouble:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ndouble = a3;
}

- (void)setHasNdouble:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNdouble
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNfloat:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_nfloat = a3;
}

- (void)setHasNfloat:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNfloat
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNint64:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nint64 = a3;
}

- (void)setHasNint64:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNint64
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNint32:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_nint32 = a3;
}

- (void)setHasNint32:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNint32
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNuint64:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nuint64 = a3;
}

- (void)setHasNuint64:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNuint64
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNuint32:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_nuint32 = a3;
}

- (void)setHasNuint32:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNuint32
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNBOOL:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_nBOOL = a3;
}

- (void)setHasNBOOL:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasNBOOL
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasObject
{
  return self->_object != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SPProtoSockPuppetObject;
  char v3 = [(SPProtoSockPuppetObject *)&v7 description];
  v4 = [(SPProtoSockPuppetObject *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_type];
  [v3 setObject:v4 forKey:@"type"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v6 = +[NSNumber numberWithInt:self->_subtype];
    [v3 setObject:v6 forKey:@"subtype"];
  }
  cacheMessage = self->_cacheMessage;
  if (cacheMessage)
  {
    v8 = [(SPProtoCacheMessage *)cacheMessage dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"cacheMessage"];
  }
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v14 = +[NSNumber numberWithDouble:self->_ndouble];
    [v3 setObject:v14 forKey:@"ndouble"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *(float *)&double v5 = self->_nfloat;
  v15 = +[NSNumber numberWithFloat:v5];
  [v3 setObject:v15 forKey:@"nfloat"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  v16 = +[NSNumber numberWithLongLong:self->_nint64];
  [v3 setObject:v16 forKey:@"nint64"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  v17 = +[NSNumber numberWithInt:self->_nint32];
  [v3 setObject:v17 forKey:@"nint32"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
LABEL_26:
    v19 = +[NSNumber numberWithUnsignedInt:self->_nuint32];
    [v3 setObject:v19 forKey:@"nuint32"];

    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_25:
  v18 = +[NSNumber numberWithUnsignedLongLong:self->_nuint64];
  [v3 setObject:v18 forKey:@"nuint64"];

  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_27:
  v20 = +[NSNumber numberWithBool:self->_nBOOL];
  [v3 setObject:v20 forKey:@"nBOOL"];

LABEL_16:
  object = self->_object;
  if (object) {
    [v3 setObject:object forKey:@"object"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_cacheMessage) {
    PBDataWriterWriteSubmessage();
  }
  v4 = v6;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  v4 = v6;
LABEL_16:
  if (self->_object)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[22] = self->_type;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v4[18] = self->_subtype;
    *((unsigned char *)v4 + 96) |= 0x40u;
  }
  id v6 = v4;
  if (self->_cacheMessage)
  {
    objc_msgSend(v4, "setCacheMessage:");
    v4 = v6;
  }
  if (self->_key)
  {
    objc_msgSend(v6, "setKey:");
    v4 = v6;
  }
  if (self->_text)
  {
    objc_msgSend(v6, "setText:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_ndouble;
    *((unsigned char *)v4 + 96) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v4[12] = LODWORD(self->_nfloat);
  *((unsigned char *)v4 + 96) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)v4 + 2) = self->_nint64;
  *((unsigned char *)v4 + 96) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[13] = self->_nint32;
  *((unsigned char *)v4 + 96) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
LABEL_26:
    v4[14] = self->_nuint32;
    *((unsigned char *)v4 + 96) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_25:
  *((void *)v4 + 3) = self->_nuint64;
  *((unsigned char *)v4 + 96) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_27:
  *((unsigned char *)v4 + 92) = self->_nBOOL;
  *((unsigned char *)v4 + 96) |= 0x80u;
LABEL_16:
  if (self->_object)
  {
    objc_msgSend(v6, "setObject:");
    v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  v5[22] = self->_type;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v5[18] = self->_subtype;
    *((unsigned char *)v5 + 96) |= 0x40u;
  }
  id v7 = [(SPProtoCacheMessage *)self->_cacheMessage copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(NSString *)self->_key copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(NSString *)self->_text copyWithZone:a3];
  v12 = (void *)v6[10];
  v6[10] = v11;

  char has = (char)self->_has;
  if (has)
  {
    v6[1] = *(void *)&self->_ndouble;
    *((unsigned char *)v6 + 96) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 12) = LODWORD(self->_nfloat);
  *((unsigned char *)v6 + 96) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  v6[2] = self->_nint64;
  *((unsigned char *)v6 + 96) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v6 + 13) = self->_nint32;
  *((unsigned char *)v6 + 96) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    *((_DWORD *)v6 + 14) = self->_nuint32;
    *((unsigned char *)v6 + 96) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_17:
    *((unsigned char *)v6 + 92) = self->_nBOOL;
    *((unsigned char *)v6 + 96) |= 0x80u;
    goto LABEL_10;
  }
LABEL_15:
  v6[3] = self->_nuint64;
  *((unsigned char *)v6 + 96) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if (has < 0) {
    goto LABEL_17;
  }
LABEL_10:
  id v14 = [(NSData *)self->_object copyWithZone:a3];
  v15 = (void *)v6[8];
  v6[8] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_type != *((_DWORD *)v4 + 22)) {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x40) == 0 || self->_subtype != *((_DWORD *)v4 + 18)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 0x40) != 0)
  {
    goto LABEL_49;
  }
  cacheMessage = self->_cacheMessage;
  if ((unint64_t)cacheMessage | *((void *)v4 + 4)
    && !-[SPProtoCacheMessage isEqual:](cacheMessage, "isEqual:"))
  {
    goto LABEL_49;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_49;
    }
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](text, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_ndouble != *((double *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_nfloat != *((float *)v4 + 12)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_nint64 != *((void *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x10) == 0 || self->_nint32 != *((_DWORD *)v4 + 13)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_nuint64 != *((void *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x20) == 0 || self->_nuint32 != *((_DWORD *)v4 + 14)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x80) == 0) {
      goto LABEL_46;
    }
LABEL_49:
    unsigned __int8 v9 = 0;
    goto LABEL_50;
  }
  if ((*((unsigned char *)v4 + 96) & 0x80) == 0) {
    goto LABEL_49;
  }
  if (self->_nBOOL)
  {
    if (!*((unsigned char *)v4 + 92)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_49;
  }
LABEL_46:
  object = self->_object;
  if ((unint64_t)object | *((void *)v4 + 8)) {
    unsigned __int8 v9 = -[NSData isEqual:](object, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v3 = 2654435761 * self->_subtype;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t type = self->_type;
  unint64_t v5 = [(SPProtoCacheMessage *)self->_cacheMessage hash];
  NSUInteger v6 = [(NSString *)self->_key hash];
  NSUInteger v7 = [(NSString *)self->_text hash];
  char has = (char)self->_has;
  if (has)
  {
    double ndouble = self->_ndouble;
    double v11 = -ndouble;
    if (ndouble >= 0.0) {
      double v11 = self->_ndouble;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 8) != 0)
  {
    float nfloat = self->_nfloat;
    double v16 = nfloat;
    if (nfloat < 0.0) {
      double v16 = -nfloat;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v19 = 2654435761 * self->_nint64;
    if ((has & 0x10) != 0)
    {
LABEL_22:
      uint64_t v20 = 2654435761 * self->_nint32;
      if ((has & 4) != 0) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v20 = 0;
  if ((has & 4) != 0)
  {
LABEL_23:
    unint64_t v21 = 2654435761u * self->_nuint64;
    if ((has & 0x20) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    uint64_t v22 = 0;
    if (has < 0) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v23 = 0;
    return v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ (2654435761 * type) ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ (unint64_t)[(NSData *)self->_object hash];
  }
LABEL_28:
  unint64_t v21 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v22 = 2654435761 * self->_nuint32;
  if ((has & 0x80) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v23 = 2654435761 * self->_nBOOL;
  return v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ (2654435761 * type) ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ (unint64_t)[(NSData *)self->_object hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  self->_uint64_t type = v4[22];
  if ((v4[24] & 0x40) != 0)
  {
    self->_subuint64_t type = v4[18];
    *(unsigned char *)&self->_has |= 0x40u;
  }
  cacheMessage = self->_cacheMessage;
  uint64_t v7 = *((void *)v5 + 4);
  unint64_t v9 = v5;
  if (cacheMessage)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SPProtoCacheMessage mergeFrom:](cacheMessage, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SPProtoSockPuppetObject setCacheMessage:](self, "setCacheMessage:");
  }
  unint64_t v5 = v9;
LABEL_9:
  if (*((void *)v5 + 5))
  {
    -[SPProtoSockPuppetObject setKey:](self, "setKey:");
    unint64_t v5 = v9;
  }
  if (*((void *)v5 + 10))
  {
    -[SPProtoSockPuppetObject setText:](self, "setText:");
    unint64_t v5 = v9;
  }
  char v8 = *((unsigned char *)v5 + 96);
  if (v8)
  {
    self->_double ndouble = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v5 + 96);
    if ((v8 & 8) == 0)
    {
LABEL_15:
      if ((v8 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((v5[24] & 8) == 0)
  {
    goto LABEL_15;
  }
  self->_float nfloat = (float)v5[12];
  *(unsigned char *)&self->_has |= 8u;
  char v8 = *((unsigned char *)v5 + 96);
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_nint64 = *((void *)v5 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v8 = *((unsigned char *)v5 + 96);
  if ((v8 & 0x10) == 0)
  {
LABEL_17:
    if ((v8 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_nint32 = v5[13];
  *(unsigned char *)&self->_has |= 0x10u;
  char v8 = *((unsigned char *)v5 + 96);
  if ((v8 & 4) == 0)
  {
LABEL_18:
    if ((v8 & 0x20) == 0) {
      goto LABEL_19;
    }
LABEL_30:
    self->_nuint32 = v5[14];
    *(unsigned char *)&self->_has |= 0x20u;
    if ((v5[24] & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_29:
  self->_nuint64 = *((void *)v5 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v8 = *((unsigned char *)v5 + 96);
  if ((v8 & 0x20) != 0) {
    goto LABEL_30;
  }
LABEL_19:
  if ((v8 & 0x80) == 0) {
    goto LABEL_20;
  }
LABEL_31:
  self->_nBOOL = *((unsigned char *)v5 + 92);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_20:
  if (*((void *)v5 + 8)) {
    -[SPProtoSockPuppetObject setObject:](self, "setObject:");
  }

  _objc_release_x1();
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (int)subtype
{
  return self->_subtype;
}

- (SPProtoCacheMessage)cacheMessage
{
  return self->_cacheMessage;
}

- (void)setCacheMessage:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)ndouble
{
  return self->_ndouble;
}

- (float)nfloat
{
  return self->_nfloat;
}

- (int64_t)nint64
{
  return self->_nint64;
}

- (int)nint32
{
  return self->_nint32;
}

- (unint64_t)nuint64
{
  return self->_nuint64;
}

- (unsigned)nuint32
{
  return self->_nuint32;
}

- (BOOL)nBOOL
{
  return self->_nBOOL;
}

- (NSData)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_cacheMessage, 0);
}

@end