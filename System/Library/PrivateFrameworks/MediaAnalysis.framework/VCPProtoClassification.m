@interface VCPProtoClassification
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)identifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoClassification

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoClassification;
  v4 = [(VCPProtoClassification *)&v8 description];
  v5 = [(VCPProtoClassification *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_identifier];
  [v3 setObject:v4 forKey:@"identifier"];

  *(float *)&double v5 = self->_confidence;
  v6 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v6 forKey:@"confidence"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoClassificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_identifier;
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_identifier;
  *((_DWORD *)result + 2) = LODWORD(self->_confidence);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_identifier == *((_DWORD *)v4 + 3)
    && self->_confidence == *((float *)v4 + 2);

  return v5;
}

- (unint64_t)hash
{
  unsigned int identifier = self->_identifier;
  float confidence = self->_confidence;
  float v4 = -confidence;
  if (confidence >= 0.0) {
    float v4 = self->_confidence;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  return v10 ^ (2654435761 * identifier);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int identifier = *((_DWORD *)a3 + 3);
  self->_float confidence = *((float *)a3 + 2);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_unsigned int identifier = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

@end