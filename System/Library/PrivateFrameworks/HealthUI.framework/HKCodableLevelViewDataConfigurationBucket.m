@interface HKCodableLevelViewDataConfigurationBucket
- (BOOL)highlighted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableClosedRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableLevelViewDataConfigurationBucket

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableLevelViewDataConfigurationBucket;
  v4 = [(HKCodableLevelViewDataConfigurationBucket *)&v8 description];
  v5 = [(HKCodableLevelViewDataConfigurationBucket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  range = self->_range;
  if (range)
  {
    v5 = [(HKCodableClosedRange *)range dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"range"];
  }
  v6 = [NSNumber numberWithBool:self->_highlighted];
  [v3 setObject:v6 forKey:@"highlighted"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableLevelViewDataConfigurationBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_range) {
    -[HKCodableLevelViewDataConfigurationBucket writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  range = self->_range;
  id v5 = a3;
  [v5 setRange:range];
  v5[16] = self->_highlighted;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableClosedRange *)self->_range copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(unsigned char *)(v5 + 16) = self->_highlighted;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((range = self->_range, !((unint64_t)range | *((void *)v4 + 1)))
     || -[HKCodableClosedRange isEqual:](range, "isEqual:")))
  {
    if (self->_highlighted) {
      BOOL v6 = v4[16] != 0;
    }
    else {
      BOOL v6 = v4[16] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_highlighted) ^ [(HKCodableClosedRange *)self->_range hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  range = self->_range;
  uint64_t v6 = *((void *)v4 + 1);
  if (range)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    range = (HKCodableClosedRange *)-[HKCodableClosedRange mergeFrom:](range, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    range = (HKCodableClosedRange *)-[HKCodableLevelViewDataConfigurationBucket setRange:](self, "setRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_highlighted = *((unsigned char *)v4 + 16);
  MEMORY[0x1F41817F8](range, v4);
}

- (HKCodableClosedRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableLevelViewDataConfigurationBucket writeTo:]", "HKCodableLevelViewDataConfigurationBucket.m", 93, "self->_range != nil");
}

@end