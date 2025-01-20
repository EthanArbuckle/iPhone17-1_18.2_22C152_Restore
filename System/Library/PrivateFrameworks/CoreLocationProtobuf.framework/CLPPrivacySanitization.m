@interface CLPPrivacySanitization
- (BOOL)hasTripSegmentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tripSegmentTypeAsString:(int)a3;
- (int)StringAsTripSegmentType:(id)a3;
- (int)tripSegmentType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTripSegmentType:(BOOL)a3;
- (void)setTripSegmentType:(int)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPrivacySanitization

- (int)tripSegmentType
{
  if (*(unsigned char *)&self->_has) {
    return self->_tripSegmentType;
  }
  else {
    return 0;
  }
}

- (void)setTripSegmentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tripSegmentType = a3;
}

- (void)setHasTripSegmentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTripSegmentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)tripSegmentTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6C360B8[a3];
  }

  return v3;
}

- (int)StringAsTripSegmentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Origin"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MainSplit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MainUnSplit"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)CLPPrivacySanitization;
  int v4 = [(CLPPrivacySanitization *)&v8 description];
  v5 = [(CLPPrivacySanitization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t tripSegmentType = self->_tripSegmentType;
    if (tripSegmentType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tripSegmentType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6C360B8[tripSegmentType];
    }
    [v3 setObject:v5 forKey:@"tripSegmentType"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPrivacySanitizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_version) {
    -[CLPPrivacySanitization writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_tripSegmentType;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  [a3 setVersion:self->_version];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_tripSegmentType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_version copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_tripSegmentType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](version, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_tripSegmentType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_version hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_uint64_t tripSegmentType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[CLPPrivacySanitization setVersion:](self, "setVersion:");
    id v4 = v5;
  }
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPrivacySanitization writeTo:]", "CLPCollectionRequest.gen.m", 32176, "nil != self->_version");
}

@end