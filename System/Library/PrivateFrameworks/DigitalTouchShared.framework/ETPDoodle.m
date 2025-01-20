@interface ETPDoodle
- (BOOL)hasColorData;
- (BOOL)hasDoodleCount;
- (BOOL)hasDoodleData;
- (BOOL)hasPointTimeDeltaData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)colorData;
- (NSData)doodleData;
- (NSData)pointTimeDeltaData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)doodleCount;
- (void)mergeFrom:(id)a3;
- (void)setColorData:(id)a3;
- (void)setDoodleCount:(unsigned int)a3;
- (void)setDoodleData:(id)a3;
- (void)setHasDoodleCount:(BOOL)a3;
- (void)setPointTimeDeltaData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPDoodle

- (void)setDoodleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doodleCount = a3;
}

- (void)setHasDoodleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoodleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDoodleData
{
  return self->_doodleData != 0;
}

- (BOOL)hasColorData
{
  return self->_colorData != 0;
}

- (BOOL)hasPointTimeDeltaData
{
  return self->_pointTimeDeltaData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPDoodle;
  v4 = [(ETPDoodle *)&v8 description];
  v5 = [(ETPDoodle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_doodleCount];
    [v3 setObject:v4 forKey:@"doodleCount"];
  }
  doodleData = self->_doodleData;
  if (doodleData) {
    [v3 setObject:doodleData forKey:@"doodleData"];
  }
  colorData = self->_colorData;
  if (colorData) {
    [v3 setObject:colorData forKey:@"colorData"];
  }
  pointTimeDeltaData = self->_pointTimeDeltaData;
  if (pointTimeDeltaData) {
    [v3 setObject:pointTimeDeltaData forKey:@"pointTimeDeltaData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPDoodleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_doodleData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_colorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pointTimeDeltaData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_doodleCount;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_doodleData copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSData *)self->_colorData copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSData *)self->_pointTimeDeltaData copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_doodleCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  doodleData = self->_doodleData;
  if ((unint64_t)doodleData | *((void *)v4 + 3) && !-[NSData isEqual:](doodleData, "isEqual:")) {
    goto LABEL_13;
  }
  colorData = self->_colorData;
  if ((unint64_t)colorData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](colorData, "isEqual:")) {
      goto LABEL_13;
    }
  }
  pointTimeDeltaData = self->_pointTimeDeltaData;
  if ((unint64_t)pointTimeDeltaData | *((void *)v4 + 4)) {
    char v8 = -[NSData isEqual:](pointTimeDeltaData, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_doodleCount;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_doodleData hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_colorData hash];
  return v4 ^ v5 ^ [(NSData *)self->_pointTimeDeltaData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[10])
  {
    self->_doodleCount = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[ETPDoodle setDoodleData:](self, "setDoodleData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ETPDoodle setColorData:](self, "setColorData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[ETPDoodle setPointTimeDeltaData:](self, "setPointTimeDeltaData:");
    uint64_t v4 = v5;
  }
}

- (unsigned)doodleCount
{
  return self->_doodleCount;
}

- (NSData)doodleData
{
  return self->_doodleData;
}

- (void)setDoodleData:(id)a3
{
}

- (NSData)colorData
{
  return self->_colorData;
}

- (void)setColorData:(id)a3
{
}

- (NSData)pointTimeDeltaData
{
  return self->_pointTimeDeltaData;
}

- (void)setPointTimeDeltaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointTimeDeltaData, 0);
  objc_storeStrong((id *)&self->_doodleData, 0);

  objc_storeStrong((id *)&self->_colorData, 0);
}

@end