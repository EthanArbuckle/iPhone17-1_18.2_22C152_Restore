@interface MSPTransitStorageShield
- (BOOL)hasShieldColorString;
- (BOOL)hasShieldText;
- (BOOL)hasShieldType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPTransitStorageShield)initWithShield:(id)a3;
- (NSString)description;
- (NSString)shieldColorString;
- (NSString)shieldText;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)shieldType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShieldType:(BOOL)a3;
- (void)setShieldColorString:(id)a3;
- (void)setShieldText:(id)a3;
- (void)setShieldType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageShield

- (MSPTransitStorageShield)initWithShield:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSPTransitStorageShield;
  v5 = [(MSPTransitStorageShield *)&v10 init];
  if (v5)
  {
    -[MSPTransitStorageShield setShieldType:](v5, "setShieldType:", [v4 shieldType]);
    v6 = [v4 shieldText];
    [(MSPTransitStorageShield *)v5 setShieldText:v6];

    v7 = [v4 shieldColorString];
    [(MSPTransitStorageShield *)v5 setShieldColorString:v7];

    v8 = v5;
  }

  return v5;
}

- (BOOL)hasShieldText
{
  return self->_shieldText != 0;
}

- (void)setShieldType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShieldType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasShieldColorString
{
  return self->_shieldColorString != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageShield;
  id v4 = [(MSPTransitStorageShield *)&v8 description];
  v5 = [(MSPTransitStorageShield *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  shieldText = self->_shieldText;
  if (shieldText) {
    [v3 setObject:shieldText forKey:@"shield_text"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_shieldType];
    [v4 setObject:v6 forKey:@"shield_type"];
  }
  shieldColorString = self->_shieldColorString;
  if (shieldColorString) {
    [v4 setObject:shieldColorString forKey:@"shield_color_string"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageShieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shieldText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_shieldColorString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shieldText)
  {
    objc_msgSend(v4, "setShieldText:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 2) = self->_shieldType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_shieldColorString)
  {
    objc_msgSend(v5, "setShieldColorString:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_shieldText copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 16) = self->_shieldType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_shieldColorString copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  shieldText = self->_shieldText;
  if ((unint64_t)shieldText | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](shieldText, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_shieldType != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  shieldColorString = self->_shieldColorString;
  if ((unint64_t)shieldColorString | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](shieldColorString, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_shieldText hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_shieldType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSString *)self->_shieldColorString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  uint64_t v5 = v4;
  if (v4[4])
  {
    -[MSPTransitStorageShield setShieldText:](self, "setShieldText:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_shieldType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[MSPTransitStorageShield setShieldColorString:](self, "setShieldColorString:");
    uint64_t v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldColorString
{
  return self->_shieldColorString;
}

- (void)setShieldColorString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_shieldColorString, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end