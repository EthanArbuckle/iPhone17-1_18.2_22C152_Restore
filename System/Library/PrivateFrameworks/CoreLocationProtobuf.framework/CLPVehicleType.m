@interface CLPVehicleType
- (BOOL)hasIsMotorcycle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMotorcycle;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMotorcycle:(BOOL)a3;
- (void)setIsMotorcycle:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPVehicleType

- (void)setIsMotorcycle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isMotorcycle = a3;
}

- (void)setHasIsMotorcycle:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMotorcycle
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPVehicleType;
  v4 = [(CLPVehicleType *)&v8 description];
  v5 = [(CLPVehicleType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isMotorcycle];
    [v3 setObject:v4 forKey:@"isMotorcycle"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPVehicleTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_isMotorcycle;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_isMotorcycle;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_isMotorcycle)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_isMotorcycle;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_isMotorcycle = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isMotorcycle
{
  return self->_isMotorcycle;
}

@end