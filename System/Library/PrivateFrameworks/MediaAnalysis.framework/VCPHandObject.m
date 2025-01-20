@interface VCPHandObject
- (CGRect)bounds;
- (float)confidence;
- (int)chirality;
- (int)groupID;
- (int)handID;
- (int)revision;
- (void)setBounds:(CGRect)a3;
- (void)setChirality:(int)a3;
- (void)setConfidence:(float)a3;
- (void)setGroupID:(int)a3;
- (void)setHandID:(int)a3;
- (void)setRevision:(int)a3;
@end

@implementation VCPHandObject

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

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end