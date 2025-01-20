@interface HKCodableSummaryAFibBurdenValue
- (BOOL)hasBurdenValue;
- (BOOL)hasLastAnalysisDayIndexRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableAFibBurdenValue)burdenValue;
- (HKCodableDayIndexRange)lastAnalysisDayIndexRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBurdenValue:(id)a3;
- (void)setLastAnalysisDayIndexRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryAFibBurdenValue

- (BOOL)hasBurdenValue
{
  return self->_burdenValue != 0;
}

- (BOOL)hasLastAnalysisDayIndexRange
{
  return self->_lastAnalysisDayIndexRange != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryAFibBurdenValue;
  v4 = [(HKCodableSummaryAFibBurdenValue *)&v8 description];
  v5 = [(HKCodableSummaryAFibBurdenValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  burdenValue = self->_burdenValue;
  if (burdenValue)
  {
    v5 = [(HKCodableAFibBurdenValue *)burdenValue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"burdenValue"];
  }
  lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
  if (lastAnalysisDayIndexRange)
  {
    v7 = [(HKCodableDayIndexRange *)lastAnalysisDayIndexRange dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"lastAnalysisDayIndexRange"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAFibBurdenValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_burdenValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_lastAnalysisDayIndexRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_burdenValue)
  {
    objc_msgSend(v4, "setBurdenValue:");
    id v4 = v5;
  }
  if (self->_lastAnalysisDayIndexRange)
  {
    objc_msgSend(v5, "setLastAnalysisDayIndexRange:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableAFibBurdenValue *)self->_burdenValue copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HKCodableDayIndexRange *)self->_lastAnalysisDayIndexRange copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((burdenValue = self->_burdenValue, !((unint64_t)burdenValue | v4[1]))
     || -[HKCodableAFibBurdenValue isEqual:](burdenValue, "isEqual:")))
  {
    lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
    if ((unint64_t)lastAnalysisDayIndexRange | v4[2]) {
      char v7 = -[HKCodableDayIndexRange isEqual:](lastAnalysisDayIndexRange, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableAFibBurdenValue *)self->_burdenValue hash];
  return [(HKCodableDayIndexRange *)self->_lastAnalysisDayIndexRange hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  burdenValue = self->_burdenValue;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (burdenValue)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableAFibBurdenValue mergeFrom:](burdenValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryAFibBurdenValue setBurdenValue:](self, "setBurdenValue:");
  }
  id v4 = v9;
LABEL_7:
  lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
  uint64_t v8 = v4[2];
  if (lastAnalysisDayIndexRange)
  {
    if (!v8) {
      goto LABEL_13;
    }
    lastAnalysisDayIndexRange = (HKCodableDayIndexRange *)-[HKCodableDayIndexRange mergeFrom:](lastAnalysisDayIndexRange, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    lastAnalysisDayIndexRange = (HKCodableDayIndexRange *)-[HKCodableSummaryAFibBurdenValue setLastAnalysisDayIndexRange:](self, "setLastAnalysisDayIndexRange:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x1F41817F8](lastAnalysisDayIndexRange, v4);
}

- (HKCodableAFibBurdenValue)burdenValue
{
  return self->_burdenValue;
}

- (void)setBurdenValue:(id)a3
{
}

- (HKCodableDayIndexRange)lastAnalysisDayIndexRange
{
  return self->_lastAnalysisDayIndexRange;
}

- (void)setLastAnalysisDayIndexRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalysisDayIndexRange, 0);
  objc_storeStrong((id *)&self->_burdenValue, 0);
}

@end