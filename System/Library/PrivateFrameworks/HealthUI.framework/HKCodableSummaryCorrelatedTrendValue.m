@interface HKCodableSummaryCorrelatedTrendValue
- (BOOL)hasObjectTypeIdentifier;
- (BOOL)hasTrendValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableSummaryTrendValue)trendValue;
- (NSString)objectTypeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setObjectTypeIdentifier:(id)a3;
- (void)setTrendValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryCorrelatedTrendValue

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (BOOL)hasTrendValue
{
  return self->_trendValue != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryCorrelatedTrendValue;
  v4 = [(HKCodableSummaryCorrelatedTrendValue *)&v8 description];
  v5 = [(HKCodableSummaryCorrelatedTrendValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier) {
    [v3 setObject:objectTypeIdentifier forKey:@"objectTypeIdentifier"];
  }
  trendValue = self->_trendValue;
  if (trendValue)
  {
    v7 = [(HKCodableSummaryTrendValue *)trendValue dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"trendValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCorrelatedTrendValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trendValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v4, "setObjectTypeIdentifier:");
    id v4 = v5;
  }
  if (self->_trendValue)
  {
    objc_msgSend(v5, "setTrendValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_objectTypeIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HKCodableSummaryTrendValue *)self->_trendValue copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((objectTypeIdentifier = self->_objectTypeIdentifier, !((unint64_t)objectTypeIdentifier | v4[1]))
     || -[NSString isEqual:](objectTypeIdentifier, "isEqual:")))
  {
    trendValue = self->_trendValue;
    if ((unint64_t)trendValue | v4[2]) {
      char v7 = -[HKCodableSummaryTrendValue isEqual:](trendValue, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_objectTypeIdentifier hash];
  return [(HKCodableSummaryTrendValue *)self->_trendValue hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[HKCodableSummaryCorrelatedTrendValue setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    id v4 = v7;
  }
  trendValue = self->_trendValue;
  uint64_t v6 = v4[2];
  if (trendValue)
  {
    if (!v6) {
      goto LABEL_9;
    }
    trendValue = (HKCodableSummaryTrendValue *)-[HKCodableSummaryTrendValue mergeFrom:](trendValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    trendValue = (HKCodableSummaryTrendValue *)-[HKCodableSummaryCorrelatedTrendValue setTrendValue:](self, "setTrendValue:");
  }
  id v4 = v7;
LABEL_9:
  MEMORY[0x1F41817F8](trendValue, v4);
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
}

- (HKCodableSummaryTrendValue)trendValue
{
  return self->_trendValue;
}

- (void)setTrendValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendValue, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
}

@end