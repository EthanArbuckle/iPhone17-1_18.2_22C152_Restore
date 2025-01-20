@interface CLPBundleId
- (BOOL)hasFullName;
- (BOOL)hasShortKey;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fullName;
- (NSString)shortKey;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setShortKey:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPBundleId

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasShortKey
{
  return self->_shortKey != 0;
}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPBundleId;
  v4 = [(CLPBundleId *)&v8 description];
  v5 = [(CLPBundleId *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  shortKey = self->_shortKey;
  if (shortKey) {
    [v3 setObject:shortKey forKey:@"shortKey"];
  }
  fullName = self->_fullName;
  if (fullName) {
    [v3 setObject:fullName forKey:@"fullName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPBundleIdReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_shortKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fullName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_shortKey)
  {
    objc_msgSend(v4, "setShortKey:");
    id v4 = v5;
  }
  if (self->_fullName)
  {
    objc_msgSend(v5, "setFullName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_shortKey copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_fullName copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  shortKey = self->_shortKey;
  if ((unint64_t)shortKey | *((void *)v4 + 3) && !-[NSString isEqual:](shortKey, "isEqual:")) {
    goto LABEL_11;
  }
  fullName = self->_fullName;
  if ((unint64_t)fullName | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](fullName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_shortKey hash] ^ v3;
  return v8 ^ [(NSString *)self->_fullName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[4])
  {
    self->_double timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  double v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[CLPBundleId setShortKey:](self, "setShortKey:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[CLPBundleId setFullName:](self, "setFullName:");
    id v4 = v5;
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)shortKey
{
  return self->_shortKey;
}

- (void)setShortKey:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortKey, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end