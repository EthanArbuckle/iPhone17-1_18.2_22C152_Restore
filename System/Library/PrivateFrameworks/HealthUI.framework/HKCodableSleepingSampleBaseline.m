@interface HKCodableSleepingSampleBaseline
- (BOOL)hasMedialRangeMaximum;
- (BOOL)hasMedialRangeMinimum;
- (BOOL)hasMiddle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)medialRangeMaximum;
- (HKCodableQuantity)medialRangeMinimum;
- (HKCodableQuantity)middle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMedialRangeMaximum:(id)a3;
- (void)setMedialRangeMinimum:(id)a3;
- (void)setMiddle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepingSampleBaseline

- (BOOL)hasMiddle
{
  return self->_middle != 0;
}

- (BOOL)hasMedialRangeMinimum
{
  return self->_medialRangeMinimum != 0;
}

- (BOOL)hasMedialRangeMaximum
{
  return self->_medialRangeMaximum != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepingSampleBaseline;
  v4 = [(HKCodableSleepingSampleBaseline *)&v8 description];
  v5 = [(HKCodableSleepingSampleBaseline *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  middle = self->_middle;
  if (middle)
  {
    v5 = [(HKCodableQuantity *)middle dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"middle"];
  }
  medialRangeMinimum = self->_medialRangeMinimum;
  if (medialRangeMinimum)
  {
    v7 = [(HKCodableQuantity *)medialRangeMinimum dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"medialRangeMinimum"];
  }
  medialRangeMaximum = self->_medialRangeMaximum;
  if (medialRangeMaximum)
  {
    v9 = [(HKCodableQuantity *)medialRangeMaximum dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"medialRangeMaximum"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_middle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_medialRangeMinimum)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_medialRangeMaximum)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_middle)
  {
    objc_msgSend(v4, "setMiddle:");
    id v4 = v5;
  }
  if (self->_medialRangeMinimum)
  {
    objc_msgSend(v5, "setMedialRangeMinimum:");
    id v4 = v5;
  }
  if (self->_medialRangeMaximum)
  {
    objc_msgSend(v5, "setMedialRangeMaximum:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_middle copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(HKCodableQuantity *)self->_medialRangeMinimum copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HKCodableQuantity *)self->_medialRangeMaximum copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((middle = self->_middle, !((unint64_t)middle | v4[3]))
     || -[HKCodableQuantity isEqual:](middle, "isEqual:"))
    && ((medialRangeMinimum = self->_medialRangeMinimum, !((unint64_t)medialRangeMinimum | v4[2]))
     || -[HKCodableQuantity isEqual:](medialRangeMinimum, "isEqual:")))
  {
    medialRangeMaximum = self->_medialRangeMaximum;
    if ((unint64_t)medialRangeMaximum | v4[1]) {
      char v8 = -[HKCodableQuantity isEqual:](medialRangeMaximum, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_middle hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_medialRangeMinimum hash] ^ v3;
  return v4 ^ [(HKCodableQuantity *)self->_medialRangeMaximum hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  middle = self->_middle;
  uint64_t v6 = v4[3];
  v11 = v4;
  if (middle)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](middle, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSleepingSampleBaseline setMiddle:](self, "setMiddle:");
  }
  unint64_t v4 = v11;
LABEL_7:
  medialRangeMinimum = self->_medialRangeMinimum;
  uint64_t v8 = v4[2];
  if (medialRangeMinimum)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HKCodableQuantity mergeFrom:](medialRangeMinimum, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HKCodableSleepingSampleBaseline setMedialRangeMinimum:](self, "setMedialRangeMinimum:");
  }
  unint64_t v4 = v11;
LABEL_13:
  medialRangeMaximum = self->_medialRangeMaximum;
  uint64_t v10 = v4[1];
  if (medialRangeMaximum)
  {
    if (!v10) {
      goto LABEL_19;
    }
    medialRangeMaximum = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](medialRangeMaximum, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    medialRangeMaximum = (HKCodableQuantity *)-[HKCodableSleepingSampleBaseline setMedialRangeMaximum:](self, "setMedialRangeMaximum:");
  }
  unint64_t v4 = v11;
LABEL_19:
  MEMORY[0x1F41817F8](medialRangeMaximum, v4);
}

- (HKCodableQuantity)middle
{
  return self->_middle;
}

- (void)setMiddle:(id)a3
{
}

- (HKCodableQuantity)medialRangeMinimum
{
  return self->_medialRangeMinimum;
}

- (void)setMedialRangeMinimum:(id)a3
{
}

- (HKCodableQuantity)medialRangeMaximum
{
  return self->_medialRangeMaximum;
}

- (void)setMedialRangeMaximum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middle, 0);
  objc_storeStrong((id *)&self->_medialRangeMinimum, 0);
  objc_storeStrong((id *)&self->_medialRangeMaximum, 0);
}

@end