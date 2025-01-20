@interface HKCodableAudiogramSensitivityPointClampingRange
- (BOOL)hasLowerBound;
- (BOOL)hasUpperBound;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)lowerBound;
- (HKCodableQuantity)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLowerBound:(id)a3;
- (void)setUpperBound:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableAudiogramSensitivityPointClampingRange

- (BOOL)hasLowerBound
{
  return self->_lowerBound != 0;
}

- (BOOL)hasUpperBound
{
  return self->_upperBound != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableAudiogramSensitivityPointClampingRange;
  v4 = [(HKCodableAudiogramSensitivityPointClampingRange *)&v8 description];
  v5 = [(HKCodableAudiogramSensitivityPointClampingRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  lowerBound = self->_lowerBound;
  if (lowerBound)
  {
    v5 = [(HKCodableQuantity *)lowerBound dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"lowerBound"];
  }
  upperBound = self->_upperBound;
  if (upperBound)
  {
    v7 = [(HKCodableQuantity *)upperBound dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"upperBound"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAudiogramSensitivityPointClampingRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_lowerBound)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_upperBound)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_lowerBound)
  {
    objc_msgSend(v4, "setLowerBound:");
    id v4 = v5;
  }
  if (self->_upperBound)
  {
    objc_msgSend(v5, "setUpperBound:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_lowerBound copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HKCodableQuantity *)self->_upperBound copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((lowerBound = self->_lowerBound, !((unint64_t)lowerBound | v4[1]))
     || -[HKCodableQuantity isEqual:](lowerBound, "isEqual:")))
  {
    upperBound = self->_upperBound;
    if ((unint64_t)upperBound | v4[2]) {
      char v7 = -[HKCodableQuantity isEqual:](upperBound, "isEqual:");
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
  unint64_t v3 = [(HKCodableQuantity *)self->_lowerBound hash];
  return [(HKCodableQuantity *)self->_upperBound hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  lowerBound = self->_lowerBound;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (lowerBound)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](lowerBound, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableAudiogramSensitivityPointClampingRange setLowerBound:](self, "setLowerBound:");
  }
  id v4 = v9;
LABEL_7:
  upperBound = self->_upperBound;
  uint64_t v8 = v4[2];
  if (upperBound)
  {
    if (!v8) {
      goto LABEL_13;
    }
    upperBound = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](upperBound, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    upperBound = (HKCodableQuantity *)-[HKCodableAudiogramSensitivityPointClampingRange setUpperBound:](self, "setUpperBound:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x1F41817F8](upperBound, v4);
}

- (HKCodableQuantity)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(id)a3
{
}

- (HKCodableQuantity)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBound, 0);
  objc_storeStrong((id *)&self->_lowerBound, 0);
}

@end