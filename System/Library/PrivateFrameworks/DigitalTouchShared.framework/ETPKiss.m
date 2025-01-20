@interface ETPKiss
- (BOOL)hasAngles;
- (BOOL)hasDelays;
- (BOOL)hasPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)angles;
- (NSData)delays;
- (NSData)points;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAngles:(id)a3;
- (void)setDelays:(id)a3;
- (void)setPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPKiss

- (BOOL)hasDelays
{
  return self->_delays != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (BOOL)hasAngles
{
  return self->_angles != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPKiss;
  v4 = [(ETPKiss *)&v8 description];
  v5 = [(ETPKiss *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  delays = self->_delays;
  if (delays) {
    [v3 setObject:delays forKey:@"delays"];
  }
  points = self->_points;
  if (points) {
    [v4 setObject:points forKey:@"points"];
  }
  angles = self->_angles;
  if (angles) {
    [v4 setObject:angles forKey:@"angles"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPKissReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_delays)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_angles)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_delays copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_points copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_angles copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((delays = self->_delays, !((unint64_t)delays | v4[2]))
     || -[NSData isEqual:](delays, "isEqual:"))
    && ((points = self->_points, !((unint64_t)points | v4[3]))
     || -[NSData isEqual:](points, "isEqual:")))
  {
    angles = self->_angles;
    if ((unint64_t)angles | v4[1]) {
      char v8 = -[NSData isEqual:](angles, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_delays hash];
  uint64_t v4 = [(NSData *)self->_points hash] ^ v3;
  return v4 ^ [(NSData *)self->_angles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[ETPKiss setDelays:](self, "setDelays:");
  }
  if (v4[3]) {
    -[ETPKiss setPoints:](self, "setPoints:");
  }
  if (v4[1]) {
    -[ETPKiss setAngles:](self, "setAngles:");
  }
}

- (NSData)delays
{
  return self->_delays;
}

- (void)setDelays:(id)a3
{
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (NSData)angles
{
  return self->_angles;
}

- (void)setAngles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_delays, 0);

  objc_storeStrong((id *)&self->_angles, 0);
}

@end