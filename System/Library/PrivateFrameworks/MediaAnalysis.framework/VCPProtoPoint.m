@interface VCPProtoPoint
+ (VCPProtoPoint)pointWithPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CGPoint)pointValue;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoPoint

+ (VCPProtoPoint)pointWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(VCPProtoPoint);
  [(VCPProtoPoint *)v5 setX:x];
  [(VCPProtoPoint *)v5 setY:y];
  return v5;
}

- (CGPoint)pointValue
{
  [(VCPProtoPoint *)self x];
  double v4 = v3;
  [(VCPProtoPoint *)self y];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoPoint;
  double v4 = [(VCPProtoPoint *)&v8 description];
  double v5 = [(VCPProtoPoint *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [NSNumber numberWithDouble:self->_x];
  [v3 setObject:v4 forKey:@"x"];

  double v5 = [NSNumber numberWithDouble:self->_y];
  [v3 setObject:v5 forKey:@"y"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoPointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_x;
  *((void *)a3 + 2) = *(void *)&self->_y;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_x;
  *((void *)result + 2) = *(void *)&self->_y;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()] && self->_x == v4[1] && self->_y == v4[2];

  return v5;
}

- (unint64_t)hash
{
  double x = self->_x;
  double v4 = -x;
  if (x >= 0.0) {
    double v4 = self->_x;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double y = self->_y;
  double v13 = -y;
  if (y >= 0.0) {
    double v13 = self->_y;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  double v18 = fabs(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_double x = *((double *)a3 + 1);
  self->_double y = *((double *)a3 + 2);
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_double x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_double y = a3;
}

@end