@interface CMSkeletonCollection
- (NSArray)skeleton2D;
- (NSArray)skeleton3DLifted;
- (NSArray)skeleton3DRetargeted;
- (double)globalMachtime;
- (double)localMachtime;
- (void)setGlobalMachtime:(double)a3;
- (void)setLocalMachtime:(double)a3;
- (void)setSkeleton2D:(id)a3;
- (void)setSkeleton3DLifted:(id)a3;
- (void)setSkeleton3DRetargeted:(id)a3;
@end

@implementation CMSkeletonCollection

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (NSArray)skeleton2D
{
  return self->_skeleton2D;
}

- (void)setSkeleton2D:(id)a3
{
}

- (NSArray)skeleton3DLifted
{
  return self->_skeleton3DLifted;
}

- (void)setSkeleton3DLifted:(id)a3
{
}

- (NSArray)skeleton3DRetargeted
{
  return self->_skeleton3DRetargeted;
}

- (void)setSkeleton3DRetargeted:(id)a3
{
}

@end