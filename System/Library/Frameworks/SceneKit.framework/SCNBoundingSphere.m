@interface SCNBoundingSphere
- (SCNVector3)center;
- (double)radius;
- (id)description;
- (void)setCenter:(SCNVector3)a3;
- (void)setRadius:(double)a3;
@end

@implementation SCNBoundingSphere

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"bsphere %p - center:[%f %f %f] radius:%f", self, self->center.x, self->center.y, self->center.z, *(void *)&self->radius);
}

- (SCNVector3)center
{
  float x = self->center.x;
  float y = self->center.y;
  float z = self->center.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setCenter:(SCNVector3)a3
{
  self->center = a3;
}

- (double)radius
{
  return self->radius;
}

- (void)setRadius:(double)a3
{
  self->radius = a3;
}

@end