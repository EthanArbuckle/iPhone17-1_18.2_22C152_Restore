@interface HDCodableCategorySample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasSample;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)value;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setSample:(id)a3;
- (void)setValue:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCategorySample

- (void)setSample:(id)a3
{
}

- (void)setValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableCategorySample *)self sample],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6)
    && (*(unsigned char *)&self->_has & 1) != 0)
  {
    [v4 _setValue:self->_value];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCategorySample;
  id v4 = [(HDCodableCategorySample *)&v8 description];
  id v5 = [(HDCodableCategorySample *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    id v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = [NSNumber numberWithLongLong:self->_value];
    [v3 setObject:v6 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCategorySampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_sample)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSample:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_value;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_value;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 2))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_value == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_value;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[2];
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    BOOL v7 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    BOOL v7 = v4;
    -[HDCodableCategorySample setSample:](self, "setSample:");
  }
  uint64_t v4 = v7;
LABEL_7:
  if (v4[3])
  {
    self->_value = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)value
{
  return self->_value;
}

@end