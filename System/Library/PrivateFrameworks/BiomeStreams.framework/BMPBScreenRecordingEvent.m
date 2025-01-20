@interface BMPBScreenRecordingEvent
- (BOOL)hasIsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBScreenRecordingEvent

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStart
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBScreenRecordingEvent;
  v4 = [(BMPBScreenRecordingEvent *)&v8 description];
  v5 = [(BMPBScreenRecordingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isStart];
    [v3 setObject:v4 forKey:@"isStart"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBScreenRecordingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_isStart;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_isStart;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_isStart)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_isStart;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_isStart = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isStart
{
  return self->_isStart;
}

@end