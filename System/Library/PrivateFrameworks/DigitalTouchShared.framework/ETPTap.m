@interface ETPTap
- (BOOL)hasColors;
- (BOOL)hasPoints;
- (BOOL)hasTimeDeltas;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)colors;
- (NSData)points;
- (NSData)timeDeltas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setColors:(id)a3;
- (void)setPoints:(id)a3;
- (void)setTimeDeltas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPTap

- (BOOL)hasTimeDeltas
{
  return self->_timeDeltas != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (BOOL)hasColors
{
  return self->_colors != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPTap;
  v4 = [(ETPTap *)&v8 description];
  v5 = [(ETPTap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  timeDeltas = self->_timeDeltas;
  if (timeDeltas) {
    [v3 setObject:timeDeltas forKey:@"timeDeltas"];
  }
  points = self->_points;
  if (points) {
    [v4 setObject:points forKey:@"points"];
  }
  colors = self->_colors;
  if (colors) {
    [v4 setObject:colors forKey:@"colors"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timeDeltas)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_colors)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_timeDeltas copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSData *)self->_points copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_colors copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeDeltas = self->_timeDeltas, !((unint64_t)timeDeltas | v4[3]))
     || -[NSData isEqual:](timeDeltas, "isEqual:"))
    && ((points = self->_points, !((unint64_t)points | v4[2]))
     || -[NSData isEqual:](points, "isEqual:")))
  {
    colors = self->_colors;
    if ((unint64_t)colors | v4[1]) {
      char v8 = -[NSData isEqual:](colors, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_timeDeltas hash];
  uint64_t v4 = [(NSData *)self->_points hash] ^ v3;
  return v4 ^ [(NSData *)self->_colors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[3]) {
    -[ETPTap setTimeDeltas:](self, "setTimeDeltas:");
  }
  if (v4[2]) {
    -[ETPTap setPoints:](self, "setPoints:");
  }
  if (v4[1]) {
    -[ETPTap setColors:](self, "setColors:");
  }
}

- (NSData)timeDeltas
{
  return self->_timeDeltas;
}

- (void)setTimeDeltas:(id)a3
{
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (NSData)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeDeltas, 0);
  objc_storeStrong((id *)&self->_points, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end