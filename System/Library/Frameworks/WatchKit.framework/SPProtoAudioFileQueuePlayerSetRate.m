@interface SPProtoAudioFileQueuePlayerSetRate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (float)rate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRate:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFileQueuePlayerSetRate

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFileQueuePlayerSetRate;
  v4 = [(SPProtoAudioFileQueuePlayerSetRate *)&v8 description];
  v5 = [(SPProtoAudioFileQueuePlayerSetRate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  *(float *)&double v4 = self->_rate;
  v7 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v7 forKey:@"rate"];

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFileQueuePlayerSetRateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  identifier = self->_identifier;
  v5 = (float *)a3;
  [v5 setIdentifier:identifier];
  v5[4] = self->_rate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_rate;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | *((void *)v4 + 1)))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_rate == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  float rate = self->_rate;
  double v5 = rate;
  if (rate < 0.0) {
    double v5 = -rate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  double v10 = fabs(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if (*((void *)v4 + 1))
  {
    double v5 = v4;
    -[SPProtoAudioFileQueuePlayerSetRate setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  self->_float rate = v4[4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_float rate = a3;
}

- (void).cxx_destruct
{
}

- (id)sockPuppetMessage
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setSetRate:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

@end