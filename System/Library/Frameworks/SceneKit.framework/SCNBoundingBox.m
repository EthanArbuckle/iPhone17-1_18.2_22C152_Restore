@interface SCNBoundingBox
- (SCNVector3)max;
- (SCNVector3)min;
- (id)description;
- (void)setMax:(SCNVector3)a3;
- (void)setMin:(SCNVector3)a3;
@end

@implementation SCNBoundingBox

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"bbox %p - min:[%f %f %f] max:[%f %f %f]", self, self->min.x, self->min.y, self->min.z, self->max.x, self->max.y, self->max.z);
}

- (SCNVector3)min
{
  float x = self->min.x;
  float y = self->min.y;
  float z = self->min.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setMin:(SCNVector3)a3
{
  self->min = a3;
}

- (SCNVector3)max
{
  float x = self->max.x;
  float y = self->max.y;
  float z = self->max.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setMax:(SCNVector3)a3
{
  self->mafloat x = a3;
}

@end