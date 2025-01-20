@interface CLPRegulatoryDomainEstimate
- (BOOL)hasCountryCode;
- (BOOL)hasIsInDisputedArea;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInDisputedArea;
- (BOOL)readFrom:(id)a3;
- (NSString)countryCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setHasIsInDisputedArea:(BOOL)a3;
- (void)setIsInDisputedArea:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPRegulatoryDomainEstimate

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setIsInDisputedArea:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isInDisputedArea = a3;
}

- (void)setHasIsInDisputedArea:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsInDisputedArea
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPRegulatoryDomainEstimate;
  v4 = [(CLPRegulatoryDomainEstimate *)&v8 description];
  v5 = [(CLPRegulatoryDomainEstimate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"countryCode"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isInDisputedArea];
    [v4 setObject:v6 forKey:@"isInDisputedArea"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPRegulatoryDomainEstimateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_countryCode)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCountryCode:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_isInDisputedArea;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_countryCode copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_isInDisputedArea;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_isInDisputedArea)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_countryCode hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isInDisputedArea;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[CLPRegulatoryDomainEstimate setCountryCode:](self, "setCountryCode:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_isInDisputedArea = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (BOOL)isInDisputedArea
{
  return self->_isInDisputedArea;
}

- (void).cxx_destruct
{
}

@end