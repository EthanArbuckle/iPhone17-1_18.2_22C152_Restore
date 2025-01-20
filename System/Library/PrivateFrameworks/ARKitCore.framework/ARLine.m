@interface ARLine
- (__n128)endPoint;
- (__n128)startPoint;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)identifier;
- (void)setEndPoint:(ARLine *)self;
- (void)setIdentifier:(unint64_t)a3;
- (void)setStartPoint:(ARLine *)self;
@end

@implementation ARLine

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((void *)result + 1) = self->_identifier;
  *((_OWORD *)result + 1) = *(_OWORD *)self->_startPoint;
  *((_OWORD *)result + 2) = *(_OWORD *)self->_endPoint;
  return result;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (__n128)startPoint
{
  return a1[1];
}

- (void)setStartPoint:(ARLine *)self
{
  *(_OWORD *)self->_startPoint = v2;
}

- (__n128)endPoint
{
  return a1[2];
}

- (void)setEndPoint:(ARLine *)self
{
  *(_OWORD *)self->_endPoint = v2;
}

@end