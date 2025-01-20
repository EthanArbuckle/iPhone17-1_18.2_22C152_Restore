@interface HMEProtoEventMetadata
- (BOOL)hasCachePolicy;
- (BOOL)hasCombinePolicy;
- (BOOL)hasQos;
- (BOOL)hasSource;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)cachePolicy;
- (unsigned)combinePolicy;
- (unsigned)qos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCachePolicy:(unsigned int)a3;
- (void)setCombinePolicy:(unsigned int)a3;
- (void)setHasCachePolicy:(BOOL)a3;
- (void)setHasCombinePolicy:(BOOL)a3;
- (void)setHasQos:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setQos:(unsigned int)a3;
- (void)setSource:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMEProtoEventMetadata

- (void).cxx_destruct
{
}

- (unsigned)qos
{
  return self->_qos;
}

- (unsigned)combinePolicy
{
  return self->_combinePolicy;
}

- (unsigned)cachePolicy
{
  return self->_cachePolicy;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[HMEProtoEventMetadata setSource:](self, "setSource:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_cachePolicy = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_combinePolicy = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_7:
    self->_qos = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_source hash];
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v7 = -timestamp;
    if (timestamp >= 0.0) {
      double v7 = self->_timestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) == 0)
  {
    uint64_t v10 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = 0;
    if ((has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_cachePolicy;
  if ((has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_combinePolicy;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_qos;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_cachePolicy != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_combinePolicy != *((_DWORD *)v4 + 5)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_qos != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_source copyWithZone:a3];
  double v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_combinePolicy;
      *(unsigned char *)(v5 + 40) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_cachePolicy;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_qos;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_source)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSource:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 4) = self->_cachePolicy;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_combinePolicy;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 6) = self->_qos;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_8:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  char has = (char)self->_has;
  if (has)
  {
    double v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v4 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInt:self->_cachePolicy];
  [v4 setObject:v10 forKey:@"cachePolicy"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_combinePolicy];
  [v4 setObject:v11 forKey:@"combinePolicy"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    double v7 = [NSNumber numberWithUnsignedInt:self->_qos];
    [v4 setObject:v7 forKey:@"qos"];
  }
LABEL_8:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMEProtoEventMetadata;
  id v4 = [(HMEProtoEventMetadata *)&v8 description];
  uint64_t v5 = [(HMEProtoEventMetadata *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasQos
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasQos:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setQos:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_qos = a3;
}

- (BOOL)hasCombinePolicy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCombinePolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setCombinePolicy:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_combinePolicy = a3;
}

- (BOOL)hasCachePolicy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCachePolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCachePolicy:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cachePolicy = a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double timestamp = a3;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

@end