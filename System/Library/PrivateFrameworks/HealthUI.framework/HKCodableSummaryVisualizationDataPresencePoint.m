@interface HKCodableSummaryVisualizationDataPresencePoint
- (BOOL)dataPresent;
- (BOOL)hasDataPresent;
- (BOOL)hasDateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataPresent:(BOOL)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasDataPresent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryVisualizationDataPresencePoint

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setDataPresent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataPresent = a3;
}

- (void)setHasDataPresent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataPresent
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryVisualizationDataPresencePoint;
  v4 = [(HKCodableSummaryVisualizationDataPresencePoint *)&v8 description];
  v5 = [(HKCodableSummaryVisualizationDataPresencePoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    v5 = [(HKCodableDateInterval *)dateInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dateInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_dataPresent];
    [v3 setObject:v6 forKey:@"dataPresent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryVisualizationDataPresencePointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_dateInterval)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDateInterval:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_dataPresent;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateInterval *)self->_dateInterval copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_dataPresent;
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
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((void *)v4 + 1))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:")) {
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
    if (self->_dataPresent)
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
  unint64_t v3 = [(HKCodableDateInterval *)self->_dateInterval hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_dataPresent;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  dateInterval = self->_dateInterval;
  uint64_t v6 = *((void *)v4 + 1);
  if (dateInterval)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    dateInterval = (HKCodableDateInterval *)-[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    dateInterval = (HKCodableDateInterval *)-[HKCodableSummaryVisualizationDataPresencePoint setDateInterval:](self, "setDateInterval:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_dataPresent = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](dateInterval, v4);
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (BOOL)dataPresent
{
  return self->_dataPresent;
}

- (void).cxx_destruct
{
}

@end