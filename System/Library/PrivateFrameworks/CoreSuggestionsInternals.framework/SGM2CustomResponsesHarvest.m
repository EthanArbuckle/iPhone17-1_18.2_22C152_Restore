@interface SGM2CustomResponsesHarvest
- (BOOL)hasCustomResponsesAfterPruning;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)customResponsesAfterPruning;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCustomResponsesAfterPruning:(unsigned int)a3;
- (void)setHasCustomResponsesAfterPruning:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2CustomResponsesHarvest

- (unsigned)customResponsesAfterPruning
{
  return self->_customResponsesAfterPruning;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_customResponsesAfterPruning = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_customResponsesAfterPruning;
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
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_customResponsesAfterPruning == *((_DWORD *)v4 + 2))
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
    *((_DWORD *)result + 2) = self->_customResponsesAfterPruning;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_customResponsesAfterPruning;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2CustomResponsesHarvestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_customResponsesAfterPruning];
    [v3 setObject:v4 forKey:@"customResponsesAfterPruning"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2CustomResponsesHarvest;
  id v4 = [(SGM2CustomResponsesHarvest *)&v8 description];
  BOOL v5 = [(SGM2CustomResponsesHarvest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCustomResponsesAfterPruning
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCustomResponsesAfterPruning:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCustomResponsesAfterPruning:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_customResponsesAfterPruning = a3;
}

@end