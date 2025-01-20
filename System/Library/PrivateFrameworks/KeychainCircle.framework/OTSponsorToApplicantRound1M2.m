@interface OTSponsorToApplicantRound1M2
- (BOOL)hasEpoch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)epoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSponsorToApplicantRound1M2

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_epoch = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_epoch;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_epoch == *((void *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_epoch;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_epoch;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    MEMORY[0x270F585B8](a3, self->_epoch, 1);
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTSponsorToApplicantRound1M2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_epoch];
    [v3 setObject:v4 forKey:@"epoch"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTSponsorToApplicantRound1M2;
  id v4 = [(OTSponsorToApplicantRound1M2 *)&v8 description];
  BOOL v5 = [(OTSponsorToApplicantRound1M2 *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_epoch = a3;
}

@end