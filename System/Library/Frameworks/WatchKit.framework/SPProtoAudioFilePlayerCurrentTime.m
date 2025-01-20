@interface SPProtoAudioFilePlayerCurrentTime
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)currentTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerCurrentTime

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerCurrentTime;
  v4 = [(SPProtoAudioFilePlayerCurrentTime *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerCurrentTime *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithDouble:self->_currentTime];
  [v3 setObject:v4 forKey:@"currentTime"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerCurrentTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_currentTime;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_currentTime;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_currentTime == v4[1];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  double currentTime = self->_currentTime;
  double v3 = -currentTime;
  if (currentTime >= 0.0) {
    double v3 = self->_currentTime;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)mergeFrom:(id)a3
{
  self->_double currentTime = *((double *)a3 + 1);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_double currentTime = a3;
}

@end