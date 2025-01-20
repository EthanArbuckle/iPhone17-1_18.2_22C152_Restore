@interface NTKSnowglobeRotatingObjectController
- (NTKSnowglobeRotatingObjectController)init;
- (SCNNode)node;
- (SCNVector3)rotationAxis;
- (double)rotation;
- (double)rotationSpeed;
- (void)setNode:(id)a3;
- (void)setRotation:(double)a3;
- (void)setRotationAxis:(SCNVector3)a3;
- (void)setRotationSpeed:(double)a3;
- (void)updateAtTime:(double)a3;
@end

@implementation NTKSnowglobeRotatingObjectController

- (NTKSnowglobeRotatingObjectController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSnowglobeRotatingObjectController;
  v2 = [(NTKSnowglobeRotatingObjectController *)&v5 init];
  if (v2)
  {
    uint32_t v3 = arc4random();
    v2->_offset = ((double)v3 / 4294967300.0 + (double)v3 / 4294967300.0) * 3.14159265;
  }
  return v2;
}

- (void)updateAtTime:(double)a3
{
  double rotationSpeed = self->_rotationSpeed;
  double rotation = self->_rotation;
  double offset = self->_offset;
  double v6 = offset + rotationSpeed * rotation;
  *(float *)&double rotationSpeed = self->_rotationAxis.x;
  *(float *)&double rotation = self->_rotationAxis.y;
  *(float *)&double offset = self->_rotationAxis.z;
  *(float *)&double v6 = v6;
  -[SCNNode setRotation:](self->_node, "setRotation:", rotationSpeed, rotation, offset, v6);
}

- (SCNNode)node
{
  return (SCNNode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNode:(id)a3
{
}

- (SCNVector3)rotationAxis
{
  objc_copyStruct(dest, &self->_rotationAxis, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setRotationAxis:(SCNVector3)a3
{
  SCNVector3 src = a3;
  objc_copyStruct(&self->_rotationAxis, &src, 12, 1, 0);
}

- (double)rotationSpeed
{
  return self->_rotationSpeed;
}

- (void)setRotationSpeed:(double)a3
{
  self->_double rotationSpeed = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_double rotation = a3;
}

- (void).cxx_destruct
{
}

@end