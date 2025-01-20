@interface VCPProtoBounds
+ (VCPProtoBounds)boundsWithCGRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CGRect)rectValue;
- (double)height;
- (double)width;
- (double)x0;
- (double)y0;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(double)a3;
- (void)setWidth:(double)a3;
- (void)setX0:(double)a3;
- (void)setY0:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoBounds

+ (VCPProtoBounds)boundsWithCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = objc_alloc_init(VCPProtoBounds);
  [(VCPProtoBounds *)v7 setX0:x];
  [(VCPProtoBounds *)v7 setY0:y];
  [(VCPProtoBounds *)v7 setWidth:width];
  [(VCPProtoBounds *)v7 setHeight:height];
  return v7;
}

- (CGRect)rectValue
{
  [(VCPProtoBounds *)self x0];
  double v4 = v3;
  [(VCPProtoBounds *)self y0];
  double v6 = v5;
  [(VCPProtoBounds *)self width];
  double v8 = v7;
  [(VCPProtoBounds *)self height];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.double height = v10;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoBounds;
  double v4 = [(VCPProtoBounds *)&v8 description];
  double v5 = [(VCPProtoBounds *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [NSNumber numberWithDouble:self->_x0];
  [v3 setObject:v4 forKey:@"x0"];

  double v5 = [NSNumber numberWithDouble:self->_y0];
  [v3 setObject:v5 forKey:@"y0"];

  double v6 = [NSNumber numberWithDouble:self->_width];
  [v3 setObject:v6 forKey:@"width"];

  double v7 = [NSNumber numberWithDouble:self->_height];
  [v3 setObject:v7 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoBoundsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 3) = *(void *)&self->_x0;
  *((void *)a3 + 4) = *(void *)&self->_y0;
  *((void *)a3 + 2) = *(void *)&self->_width;
  *((void *)a3 + 1) = *(void *)&self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 3) = *(void *)&self->_x0;
  *((void *)result + 4) = *(void *)&self->_y0;
  *((void *)result + 2) = *(void *)&self->_width;
  *((void *)result + 1) = *(void *)&self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_x0 == v4[3]
    && self->_y0 == v4[4]
    && self->_width == v4[2]
    && self->_height == v4[1];

  return v5;
}

- (unint64_t)hash
{
  double x0 = self->_x0;
  double v4 = -x0;
  if (x0 >= 0.0) {
    double v4 = self->_x0;
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
  double y0 = self->_y0;
  double v13 = -y0;
  if (y0 >= 0.0) {
    double v13 = self->_y0;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  double width = self->_width;
  double v22 = -width;
  if (width >= 0.0) {
    double v22 = self->_width;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  double v25 = fmod(v23, 1.84467441e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabs(v24);
  if (v24 < 0.0) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v27;
  }
  double height = self->_height;
  double v31 = -height;
  if (height >= 0.0) {
    double v31 = self->_height;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  double v34 = fmod(v32, 1.84467441e19);
  unint64_t v35 = 2654435761u * (unint64_t)v34;
  unint64_t v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0) {
    unint64_t v36 = 2654435761u * (unint64_t)v34;
  }
  unint64_t v37 = v35 - (unint64_t)fabs(v33);
  if (v33 >= 0.0) {
    unint64_t v37 = v36;
  }
  return v20 ^ v11 ^ v29 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  self->_double x0 = *((double *)a3 + 3);
  self->_double y0 = *((double *)a3 + 4);
  self->_double width = *((double *)a3 + 2);
  self->_double height = *((double *)a3 + 1);
}

- (double)x0
{
  return self->_x0;
}

- (void)setX0:(double)a3
{
  self->_double x0 = a3;
}

- (double)y0
{
  return self->_y0;
}

- (void)setY0:(double)a3
{
  self->_double y0 = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

@end