@interface HDCodableRoutineLocationResponse
- (BOOL)hasLocationOfInterest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRoutineLocation)locationOfInterest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocationOfInterest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineLocationResponse

- (BOOL)hasLocationOfInterest
{
  return self->_locationOfInterest != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineLocationResponse;
  v4 = [(HDCodableRoutineLocationResponse *)&v8 description];
  v5 = [(HDCodableRoutineLocationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    v5 = [(HDCodableRoutineLocation *)locationOfInterest dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"locationOfInterest"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineLocationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_locationOfInterest) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest) {
    [a3 setLocationOfInterest:locationOfInterest];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableRoutineLocation *)self->_locationOfInterest copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    locationOfInterest = self->_locationOfInterest;
    if ((unint64_t)locationOfInterest | v4[1]) {
      char v6 = -[HDCodableRoutineLocation isEqual:](locationOfInterest, "isEqual:");
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
  return [(HDCodableRoutineLocation *)self->_locationOfInterest hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  locationOfInterest = self->_locationOfInterest;
  uint64_t v6 = v4[1];
  if (locationOfInterest)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[HDCodableRoutineLocation mergeFrom:](locationOfInterest, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[HDCodableRoutineLocationResponse setLocationOfInterest:](self, "setLocationOfInterest:");
  }
  v4 = v7;
LABEL_7:
}

- (HDCodableRoutineLocation)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end