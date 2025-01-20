@interface PDDPTimeIntervalInfo
- (BOOL)hasDuration;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDDPDate)startTime;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setStartTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPTimeIntervalInfo

- (BOOL)hasStartTime
{
  return self->_startTime != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPTimeIntervalInfo;
  v3 = [(PDDPTimeIntervalInfo *)&v7 description];
  v4 = [(PDDPTimeIntervalInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  startTime = self->_startTime;
  if (startTime)
  {
    v5 = [(PDDPDate *)startTime dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"start_time"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v6 forKey:@"duration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100104FF8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_startTime)
  {
    id v5 = v4;
    objc_msgSend(v4, "setStartTime:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPDate *)self->_startTime copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_duration;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  startTime = self->_startTime;
  if ((unint64_t)startTime | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](startTime, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_duration == *((double *)v4 + 1))
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
  unint64_t v3 = [(PDDPDate *)self->_startTime hash];
  if (*(unsigned char *)&self->_has)
  {
    double duration = self->_duration;
    double v6 = -duration;
    if (duration >= 0.0) {
      double v6 = self->_duration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  startTime = self->_startTime;
  uint64_t v6 = *((void *)v4 + 2);
  if (startTime)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    startTime = (PDDPDate *)-[PDDPDate mergeFrom:](startTime, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    startTime = (PDDPDate *)-[PDDPTimeIntervalInfo setStartTime:](self, "setStartTime:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1(startTime, v4);
}

- (PDDPDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end