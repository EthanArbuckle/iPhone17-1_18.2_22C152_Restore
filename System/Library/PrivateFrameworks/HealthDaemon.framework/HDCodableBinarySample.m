@interface HDCodableBinarySample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasPayload;
- (BOOL)hasSample;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)payload;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSample:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableBinarySample

- (void)setSample:(id)a3
{
}

- (void)setPayload:(id)a3
{
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
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableBinarySample;
  id v4 = [(HDCodableBinarySample *)&v8 description];
  id v5 = [(HDCodableBinarySample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableBinarySampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v5;
  }
  if (self->_payload)
  {
    objc_msgSend(v5, "setPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_payload copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sample = self->_sample, !((unint64_t)sample | v4[2])) || -[HDCodableSample isEqual:](sample, "isEqual:")))
  {
    payload = self->_payload;
    if ((unint64_t)payload | v4[1]) {
      char v7 = -[NSData isEqual:](payload, "isEqual:");
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
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  return [(NSData *)self->_payload hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableBinarySample setSample:](self, "setSample:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[HDCodableBinarySample setPayload:](self, "setPayload:");
    id v4 = v7;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (NSData)payload
{
  return self->_payload;
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F1878810])
  {
    id v5 = [(HDCodableBinarySample *)self sample];
    int v6 = [v5 applyToObject:v4];
    if (v6)
    {
      char v7 = [(HDCodableBinarySample *)self payload];
      [v4 _setPayload:v7];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end