@interface ATXPBCGRectWrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)copyTo:(uint64_t)a1;
- (double)height;
- (double)mergeFrom:(uint64_t)a1;
- (double)width;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)setHeight:(uint64_t)result;
- (uint64_t)setWidth:(uint64_t)result;
- (uint64_t)setX:(uint64_t)result;
- (uint64_t)setY:(uint64_t)result;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBCGRectWrapper

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBCGRectWrapper;
  v4 = [(ATXPBCGRectWrapper *)&v8 description];
  v5 = [(ATXPBCGRectWrapper *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_x];
  [v3 setObject:v4 forKey:@"x"];

  v5 = [NSNumber numberWithDouble:self->_y];
  [v3 setObject:v5 forKey:@"y"];

  v6 = [NSNumber numberWithDouble:self->_width];
  [v3 setObject:v6 forKey:@"width"];

  v7 = [NSNumber numberWithDouble:self->_height];
  [v3 setObject:v7 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBCGRectWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (double)copyTo:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a2 + 24) = *(void *)(a1 + 24);
    *(void *)(a2 + 32) = *(void *)(a1 + 32);
    *(void *)(a2 + 16) = *(void *)(a1 + 16);
    double result = *(double *)(a1 + 8);
    *(double *)(a2 + 8) = result;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 3) = *(void *)&self->_x;
  *((void *)result + 4) = *(void *)&self->_y;
  *((void *)result + 2) = *(void *)&self->_width;
  *((void *)result + 1) = *(void *)&self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_x == v4[3]
    && self->_y == v4[4]
    && self->_width == v4[2]
    && self->_height == v4[1];

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

- (double)mergeFrom:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    double result = *(double *)(a2 + 8);
    *(double *)(a1 + 8) = result;
  }
  return result;
}

- (double)x
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setX:(uint64_t)result
{
  if (result) {
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (double)y
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setY:(uint64_t)result
{
  if (result) {
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (double)width
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setWidth:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (double)height
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setHeight:(uint64_t)result
{
  if (result) {
    *(double *)(result + 8) = a2;
  }
  return result;
}

@end