@interface HMDCoordinationPrimaryMeshLogEvent
- (BOOL)didChangeLeader;
- (BOOL)didCurrentDeviceLeavePrimaryMesh;
- (BOOL)didElectLeader;
- (BOOL)isInSecondaryMesh;
- (BOOL)isLeader;
- (void)setDidChangeLeader:(BOOL)a3;
- (void)setDidCurrentDeviceLeavePrimaryMesh:(BOOL)a3;
- (void)setDidElectLeader:(BOOL)a3;
- (void)setIsInSecondaryMesh:(BOOL)a3;
- (void)setIsLeader:(BOOL)a3;
@end

@implementation HMDCoordinationPrimaryMeshLogEvent

- (void)setDidCurrentDeviceLeavePrimaryMesh:(BOOL)a3
{
  self->_didCurrentDeviceLeavePrimaryMesh = a3;
}

- (BOOL)didCurrentDeviceLeavePrimaryMesh
{
  return self->_didCurrentDeviceLeavePrimaryMesh;
}

- (void)setIsInSecondaryMesh:(BOOL)a3
{
  self->_isInSecondaryMesh = a3;
}

- (BOOL)isInSecondaryMesh
{
  return self->_isInSecondaryMesh;
}

- (void)setDidElectLeader:(BOOL)a3
{
  self->_didElectLeader = a3;
}

- (BOOL)didElectLeader
{
  return self->_didElectLeader;
}

- (void)setDidChangeLeader:(BOOL)a3
{
  self->_didChangeLeader = a3;
}

- (BOOL)didChangeLeader
{
  return self->_didChangeLeader;
}

- (void)setIsLeader:(BOOL)a3
{
  self->_isLeader = a3;
}

- (BOOL)isLeader
{
  return self->_isLeader;
}

@end