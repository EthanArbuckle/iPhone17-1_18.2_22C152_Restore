@interface VCPProtoVideoKeyFrame
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTime)timestamp;
- (float)curationScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurationScore:(float)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoVideoKeyFrame

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoKeyFrame;
  v4 = [(VCPProtoVideoKeyFrame *)&v8 description];
  v5 = [(VCPProtoVideoKeyFrame *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v6 = [(VCPProtoTime *)timestamp dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timestamp"];
  }
  *(float *)&double v4 = self->_curationScore;
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"curationScore"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoKeyFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  timestamp = self->_timestamp;
  v5 = (float *)a3;
  [v5 setTimestamp:timestamp];
  v5[2] = self->_curationScore;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTime *)self->_timestamp copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_curationScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timestamp = self->_timestamp, !((unint64_t)timestamp | *((void *)v4 + 2)))
     || -[VCPProtoTime isEqual:](timestamp, "isEqual:"))
    && self->_curationScore == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTime *)self->_timestamp hash];
  float curationScore = self->_curationScore;
  float v5 = -curationScore;
  if (curationScore >= 0.0) {
    float v5 = self->_curationScore;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  float v10 = fabsf(v7);
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
  id v4 = a3;
  timestamp = self->_timestamp;
  uint64_t v6 = *((void *)v4 + 2);
  if (timestamp)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoTime mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoVideoKeyFrame setTimestamp:](self, "setTimestamp:");
  }
  id v4 = v7;
LABEL_7:
  self->_float curationScore = *((float *)v4 + 2);
}

- (VCPProtoTime)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_float curationScore = a3;
}

- (void).cxx_destruct
{
}

@end