@interface HWPMessage
- (BOOL)hasCreationDate;
- (BOOL)hasDrawing;
- (BOOL)hasIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)drawing;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)creationDate;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDate:(int64_t)a3;
- (void)setDrawing:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HWPMessage

- (unsigned)version
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCreationDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDrawing
{
  return self->_drawing != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HWPMessage;
  v4 = [(HWPMessage *)&v8 description];
  v5 = [(HWPMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_creationDate];
    [v3 setObject:v6 forKey:@"creationDate"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  drawing = self->_drawing;
  if (drawing) {
    [v3 setObject:drawing forKey:@"drawing"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v10 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"Unknown Fields"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HWPMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteSfixed64Field();
    id v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_drawing)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_version;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 2) = self->_creationDate;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  if (self->_drawing)
  {
    objc_msgSend(v6, "setDrawing:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_version;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 16) = self->_creationDate;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_drawing copyWithZone:a3];
  v11 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v10;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_creationDate != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_16;
  }
  drawing = self->_drawing;
  if ((unint64_t)drawing | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](drawing, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_creationDate;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_identifier hash];
  return v5 ^ [(NSData *)self->_drawing hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_creationDate = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[HWPMessage setIdentifier:](self, "setIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[HWPMessage setDrawing:](self, "setDrawing:");
    id v4 = v6;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int64_t)creationDate
{
  return self->_creationDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end