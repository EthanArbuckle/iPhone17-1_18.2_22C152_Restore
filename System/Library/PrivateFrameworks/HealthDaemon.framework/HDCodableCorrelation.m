@interface HDCodableCorrelation
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasSample;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSample:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCorrelation

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  v5 = [(HDCodableCorrelation *)self sample];
  char v6 = [v5 applyToObject:v4];

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCorrelation;
  id v4 = [(HDCodableCorrelation *)&v8 description];
  v5 = [(HDCodableCorrelation *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCorrelationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sample) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  sample = self->_sample;
  if (sample) {
    [a3 setSample:sample];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sample = self->_sample;
    if ((unint64_t)sample | v4[1]) {
      char v6 = -[HDCodableSample isEqual:](sample, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(HDCodableSample *)self->_sample hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[1];
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[HDCodableCorrelation setSample:](self, "setSample:");
  }
  id v4 = v7;
LABEL_7:
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (void).cxx_destruct
{
}

@end