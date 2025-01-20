@interface HDCodableNotificationInstructionCriteria
- (BOOL)hasIdentifier;
- (BOOL)hasModificationTimeInterval;
- (BOOL)hasUUIDString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)uUIDString;
- (double)modificationTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasModificationTimeInterval:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setModificationTimeInterval:(double)a3;
- (void)setUUIDString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNotificationInstructionCriteria

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUUIDString
{
  return self->_uUIDString != 0;
}

- (void)setModificationTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modificationTimeInterval = a3;
}

- (void)setHasModificationTimeInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationTimeInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNotificationInstructionCriteria;
  v4 = [(HDCodableNotificationInstructionCriteria *)&v8 description];
  v5 = [(HDCodableNotificationInstructionCriteria *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  uUIDString = self->_uUIDString;
  if (uUIDString) {
    [v4 setObject:uUIDString forKey:@"UUIDString"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_modificationTimeInterval];
    [v4 setObject:v7 forKey:@"modificationTimeInterval"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionCriteriaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uUIDString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_uUIDString)
  {
    objc_msgSend(v5, "setUUIDString:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_modificationTimeInterval;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_uUIDString copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_modificationTimeInterval;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uUIDString, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_modificationTimeInterval == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_uUIDString hash];
  if (*(unsigned char *)&self->_has)
  {
    double modificationTimeInterval = self->_modificationTimeInterval;
    double v7 = -modificationTimeInterval;
    if (modificationTimeInterval >= 0.0) {
      double v7 = self->_modificationTimeInterval;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[HDCodableNotificationInstructionCriteria setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableNotificationInstructionCriteria setUUIDString:](self, "setUUIDString:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double modificationTimeInterval = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uUIDString
{
  return self->_uUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (double)modificationTimeInterval
{
  return self->_modificationTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDString, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end