@interface HDCodableSyncStateVersionedData
- (BOOL)hasObjectData;
- (BOOL)hasOrigin;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncStateOrigin)origin;
- (NSData)objectData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setObjectData:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncStateVersionedData

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (BOOL)hasObjectData
{
  return self->_objectData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncStateVersionedData;
  v4 = [(HDCodableSyncStateVersionedData *)&v8 description];
  v5 = [(HDCodableSyncStateVersionedData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  origin = self->_origin;
  if (origin)
  {
    v6 = [(HDCodableSyncStateOrigin *)origin dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"origin"];
  }
  objectData = self->_objectData;
  if (objectData) {
    [v3 setObject:objectData forKey:@"objectData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateVersionedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_origin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_objectData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_origin)
  {
    objc_msgSend(v4, "setOrigin:");
    id v4 = v5;
  }
  if (self->_objectData)
  {
    objc_msgSend(v5, "setObjectData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(HDCodableSyncStateOrigin *)self->_origin copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSData *)self->_objectData copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((void *)v4 + 2) && !-[HDCodableSyncStateOrigin isEqual:](origin, "isEqual:")) {
    goto LABEL_11;
  }
  objectData = self->_objectData;
  if ((unint64_t)objectData | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](objectData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HDCodableSyncStateOrigin *)self->_origin hash] ^ v3;
  return v4 ^ [(NSData *)self->_objectData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  origin = self->_origin;
  uint64_t v7 = v5[2];
  objc_super v8 = v5;
  if (origin)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HDCodableSyncStateOrigin mergeFrom:](origin, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HDCodableSyncStateVersionedData setOrigin:](self, "setOrigin:");
  }
  uint64_t v5 = v8;
LABEL_9:
  if (v5[1])
  {
    -[HDCodableSyncStateVersionedData setObjectData:](self, "setObjectData:");
    uint64_t v5 = v8;
  }
}

- (int)version
{
  return self->_version;
}

- (HDCodableSyncStateOrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSData)objectData
{
  return self->_objectData;
}

- (void)setObjectData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_objectData, 0);
}

@end