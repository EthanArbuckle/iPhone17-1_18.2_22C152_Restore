@interface AXANFDDetectedObject
- (AXANFDDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 rotationAngle:(float)a6 yawAngle:(float)a7 labelKey:(int)a8;
- (float)rotationAngle;
- (float)yawAngle;
- (int)labelKey;
- (void)setLabelKey:(int)a3;
- (void)setRotationAngle:(float)a3;
- (void)setYawAngle:(float)a3;
@end

@implementation AXANFDDetectedObject

- (AXANFDDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 rotationAngle:(float)a6 yawAngle:(float)a7 labelKey:(int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)AXANFDDetectedObject;
  v11 = -[AXVNEspressoDetectedObject initWithObjectType:boundingBox:confidence:](&v15, sel_initWithObjectType_boundingBox_confidence_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v12 = v11;
  if (v11)
  {
    v11->_rotationAngle = a6;
    v11->_yawAngle = a7;
    v11->_labelKey = a8;
    v13 = v11;
  }

  return v12;
}

- (float)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(float)a3
{
  self->_rotationAngle = a3;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (int)labelKey
{
  return self->_labelKey;
}

- (void)setLabelKey:(int)a3
{
  self->_labelKey = a3;
}

@end