@interface VCPProtoTimeRange
+ (VCPProtoTimeRange)timeRangeWithCMTimeRange:(id *)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRangeValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTime)duration;
- (VCPProtoTime)start;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(id)a3;
- (void)setStart:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoTimeRange

+ (VCPProtoTimeRange)timeRangeWithCMTimeRange:(id *)a3
{
  v4 = objc_alloc_init(VCPProtoTimeRange);
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var0;
  v5 = +[VCPProtoTime timeWithCMTime:&var0];
  [(VCPProtoTimeRange *)v4 setStart:v5];

  $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var1;
  v6 = +[VCPProtoTime timeWithCMTime:&var0];
  [(VCPProtoTimeRange *)v4 setDuration:v6];

  return v4;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRangeValue
{
  v5 = [(VCPProtoTimeRange *)self start];
  v6 = v5;
  if (v5) {
    [v5 timeValue];
  }
  else {
    memset(&start, 0, sizeof(start));
  }
  v7 = [(VCPProtoTimeRange *)self duration];
  v8 = v7;
  if (v7) {
    [v7 timeValue];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CMTimeRangeMake((CMTimeRange *)retstr, &start, &v10);

  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoTimeRange;
  v4 = [(VCPProtoTimeRange *)&v8 description];
  v5 = [(VCPProtoTimeRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime start = self->_start;
  if (start)
  {
    v5 = [(VCPProtoTime *)start dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"start"];
  }
  duration = self->_duration;
  if (duration)
  {
    v7 = [(VCPProtoTime *)duration dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"duration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoTimeRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  CMTime start = self->_start;
  id v5 = a3;
  [v5 setStart:start];
  [v5 setDuration:self->_duration];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTime *)self->_start copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(VCPProtoTime *)self->_duration copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((CMTime start = self->_start, !((unint64_t)start | v4[2])) || -[VCPProtoTime isEqual:](start, "isEqual:")))
  {
    duration = self->_duration;
    if ((unint64_t)duration | v4[1]) {
      char v7 = -[VCPProtoTime isEqual:](duration, "isEqual:");
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
  unint64_t v3 = [(VCPProtoTime *)self->_start hash];
  return [(VCPProtoTime *)self->_duration hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  CMTime start = self->_start;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (start)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTime mergeFrom:](start, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTimeRange setStart:](self, "setStart:");
  }
  v4 = v9;
LABEL_7:
  duration = self->_duration;
  uint64_t v8 = v4[1];
  if (duration)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoTime mergeFrom:](duration, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoTimeRange setDuration:](self, "setDuration:");
  }
  v4 = v9;
LABEL_13:
}

- (VCPProtoTime)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (VCPProtoTime)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end