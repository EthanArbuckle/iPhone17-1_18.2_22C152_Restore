@interface VCPHandObservation
+ (id)twoHandGestureTypes;
- (CGRect)bounds;
- (NSArray)keypoints;
- (VCPHandObservation)init;
- (float)gestureConfidence;
- (float)holdObject;
- (int)chirality;
- (int)gestureType;
- (int)groupID;
- (int)handID;
- (int)revision;
- (unint64_t)fingerOpenness;
- (unint64_t)mitigationType;
- (void)setBounds:(CGRect)a3;
- (void)setChirality:(int)a3;
- (void)setFingerOpenness:(unint64_t)a3;
- (void)setGestureConfidence:(float)a3;
- (void)setGestureType:(int)a3;
- (void)setGroupID:(int)a3;
- (void)setHandID:(int)a3;
- (void)setHoldObject:(float)a3;
- (void)setKeypoints:(id)a3;
- (void)setMitigationType:(unint64_t)a3;
- (void)setRevision:(int)a3;
@end

@implementation VCPHandObservation

+ (id)twoHandGestureTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE6D0];
}

- (VCPHandObservation)init
{
  v3.receiver = self;
  v3.super_class = (Class)VCPHandObservation;
  result = [(VCPHandObservation *)&v3 init];
  if (result) {
    result->_gestureType = -1;
  }
  return result;
}

- (NSArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
}

- (int)chirality
{
  return self->_chirality;
}

- (void)setChirality:(int)a3
{
  self->_chirality = a3;
}

- (int)handID
{
  return self->_handID;
}

- (void)setHandID:(int)a3
{
  self->_handID = a3;
}

- (int)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int)a3
{
  self->_groupID = a3;
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

- (int)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int)a3
{
  self->_gestureType = a3;
}

- (float)gestureConfidence
{
  return self->_gestureConfidence;
}

- (void)setGestureConfidence:(float)a3
{
  self->_gestureConfidence = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (unint64_t)mitigationType
{
  return self->_mitigationType;
}

- (void)setMitigationType:(unint64_t)a3
{
  self->_mitigationType = a3;
}

- (unint64_t)fingerOpenness
{
  return self->_fingerOpenness;
}

- (void)setFingerOpenness:(unint64_t)a3
{
  self->_fingerOpenness = a3;
}

- (float)holdObject
{
  return self->_holdObject;
}

- (void)setHoldObject:(float)a3
{
  self->_holdObject = a3;
}

- (void).cxx_destruct
{
}

@end