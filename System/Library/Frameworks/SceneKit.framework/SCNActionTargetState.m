@interface SCNActionTargetState
- (BOOL)usesEuler;
- (SCNVector3)euler;
- (SCNVector3)position;
- (SCNVector3)scale;
- (SCNVector4)rotation;
- (float)opacity;
- (void)setEuler:(SCNVector3)a3;
- (void)setOpacity:(float)a3;
- (void)setPosition:(SCNVector3)a3;
- (void)setRotation:(SCNVector4)a3;
- (void)setScale:(SCNVector3)a3;
- (void)setUsesEuler:(BOOL)a3;
@end

@implementation SCNActionTargetState

- (SCNVector3)position
{
  float x = self->position.x;
  float y = self->position.y;
  float z = self->position.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  self->position = a3;
}

- (SCNVector3)euler
{
  float x = self->euler.x;
  float y = self->euler.y;
  float z = self->euler.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setEuler:(SCNVector3)a3
{
  self->euler = a3;
}

- (SCNVector4)rotation
{
  float x = self->rotation.x;
  float y = self->rotation.y;
  float z = self->rotation.z;
  float w = self->rotation.w;
  result.float w = w;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setRotation:(SCNVector4)a3
{
  self->rotation = a3;
}

- (SCNVector3)scale
{
  float x = self->scale.x;
  float y = self->scale.y;
  float z = self->scale.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setScale:(SCNVector3)a3
{
  self->scale = a3;
}

- (BOOL)usesEuler
{
  return self->usesEuler;
}

- (void)setUsesEuler:(BOOL)a3
{
  self->usesEuler = a3;
}

- (float)opacity
{
  return self->opacity;
}

- (void)setOpacity:(float)a3
{
  self->opacitfloat y = a3;
}

@end