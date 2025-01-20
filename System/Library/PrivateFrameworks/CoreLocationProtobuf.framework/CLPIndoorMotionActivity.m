@interface CLPIndoorMotionActivity
- (BOOL)hasMotionActivity;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMotionActivity)motionActivity;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMotionActivity:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorMotionActivity

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMotionActivity
{
  return self->_motionActivity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorMotionActivity;
  v4 = [(CLPIndoorMotionActivity *)&v8 description];
  v5 = [(CLPIndoorMotionActivity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  motionActivity = self->_motionActivity;
  if (motionActivity)
  {
    v6 = [(CLPMotionActivity *)motionActivity dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"motionActivity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorMotionActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_motionActivity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_motionActivity)
  {
    id v5 = v4;
    objc_msgSend(v4, "setMotionActivity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(CLPMotionActivity *)self->_motionActivity copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  motionActivity = self->_motionActivity;
  if ((unint64_t)motionActivity | *((void *)v4 + 2)) {
    char v6 = -[CLPMotionActivity isEqual:](motionActivity, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(CLPMotionActivity *)self->_motionActivity hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[3])
  {
    self->_double timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  motionActivity = self->_motionActivity;
  uint64_t v7 = *((void *)v5 + 2);
  if (motionActivity)
  {
    if (v7) {
      -[CLPMotionActivity mergeFrom:](motionActivity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[CLPIndoorMotionActivity setMotionActivity:](self, "setMotionActivity:");
  }

  MEMORY[0x1F41817F8]();
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CLPMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)setMotionActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end