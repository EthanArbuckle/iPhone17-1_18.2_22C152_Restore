@interface VNANFDDetectedObject
- (VNANFDDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 rotationAngle:(float)a6 yawAngle:(float)a7 pitchAngle:(float)a8 labelKey:(int)a9 groupId:(int)a10;
- (float)pitchAngle;
- (float)rotationAngle;
- (float)yawAngle;
- (id)description;
- (int)groupId;
- (int)labelKey;
- (void)setGroupId:(int)a3;
- (void)setLabelKey:(int)a3;
- (void)setPitchAngle:(float)a3;
- (void)setRotationAngle:(float)a3;
- (void)setYawAngle:(float)a3;
@end

@implementation VNANFDDetectedObject

- (void)setGroupId:(int)a3
{
  self->_groupId = a3;
}

- (int)groupId
{
  return self->_groupId;
}

- (void)setLabelKey:(int)a3
{
  self->_labelKey = a3;
}

- (int)labelKey
{
  return self->_labelKey;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setRotationAngle:(float)a3
{
  self->_rotationAngle = a3;
}

- (float)rotationAngle
{
  return self->_rotationAngle;
}

- (id)description
{
  id v3 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)VNANFDDetectedObject;
  v4 = [(VNEspressoDetectedObject *)&v13 description];
  uint64_t v5 = [(VNANFDDetectedObject *)self labelKey];
  [(VNANFDDetectedObject *)self rotationAngle];
  float v7 = v6;
  [(VNANFDDetectedObject *)self yawAngle];
  float v9 = v8;
  [(VNANFDDetectedObject *)self pitchAngle];
  v11 = objc_msgSend(v3, "initWithFormat:", @"%@ labelKey = %d; rotationAngle = %f; yawAngle = %f, pitchAngle = %f, groupID = %d",
                  v4,
                  v5,
                  v7,
                  v9,
                  v10,
                  [(VNANFDDetectedObject *)self groupId]);

  return v11;
}

- (VNANFDDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 rotationAngle:(float)a6 yawAngle:(float)a7 pitchAngle:(float)a8 labelKey:(int)a9 groupId:(int)a10
{
  v19.receiver = self;
  v19.super_class = (Class)VNANFDDetectedObject;
  v15 = -[VNEspressoDetectedObject initWithObjectType:boundingBox:confidence:](&v19, sel_initWithObjectType_boundingBox_confidence_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v16 = v15;
  if (v15)
  {
    v15->_rotationAngle = a6;
    v15->_yawAngle = a7;
    v15->_pitchAngle = a8;
    v15->_labelKey = a9;
    v15->_groupId = a10;
    v17 = v15;
  }

  return v16;
}

@end