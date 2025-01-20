@interface MADProtoFaceprint
+ (id)protoFromPhotosFaceprint:(id)a3;
- (BOOL)hasFaceprintData;
- (BOOL)hasFaceprintVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)faceprintData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)vcpFaceprintWithDetectionType:(signed __int16)a3;
- (int64_t)faceprintVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFaceprintData:(id)a3;
- (void)setFaceprintVersion:(int64_t)a3;
- (void)setHasFaceprintVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoFaceprint

- (void)setFaceprintVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_faceprintVersion = a3;
}

- (void)setHasFaceprintVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceprintVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFaceprintData
{
  return self->_faceprintData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoFaceprint;
  v4 = [(MADProtoFaceprint *)&v8 description];
  v5 = [(MADProtoFaceprint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_faceprintVersion];
    [v3 setObject:v4 forKey:@"faceprintVersion"];
  }
  faceprintData = self->_faceprintData;
  if (faceprintData) {
    [v3 setObject:faceprintData forKey:@"faceprintData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoFaceprintReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_faceprintData)
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
    v4[1] = self->_faceprintVersion;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_faceprintData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setFaceprintData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_faceprintVersion;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_faceprintData copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_faceprintVersion != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  faceprintData = self->_faceprintData;
  if ((unint64_t)faceprintData | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](faceprintData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_faceprintVersion;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_faceprintData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[3])
  {
    self->_faceprintVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[MADProtoFaceprint setFaceprintData:](self, "setFaceprintData:");
    id v4 = v5;
  }
}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (void)setFaceprintData:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)protoFromPhotosFaceprint:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MADProtoFaceprint);
  -[MADProtoFaceprint setFaceprintVersion:](v4, "setFaceprintVersion:", [v3 faceprintVersion]);
  uint64_t v5 = [v3 faceprintData];

  [(MADProtoFaceprint *)v4 setFaceprintData:v5];
  return v4;
}

- (id)vcpFaceprintWithDetectionType:(signed __int16)a3
{
  BOOL v4 = a3 != 1;
  int64_t v5 = [(MADProtoFaceprint *)self faceprintVersion];
  char v6 = [(MADProtoFaceprint *)self faceprintData];
  uint64_t v7 = +[VCPVNImageprintWrapper wrapperWithImageprintType:v4 version:v5 andData:v6];

  return v7;
}

@end