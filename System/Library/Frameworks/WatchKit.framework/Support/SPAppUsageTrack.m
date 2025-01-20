@interface SPAppUsageTrack
- (SPAppUsageTrack)init;
- (unsigned)toCompArray;
- (unsigned)toGizmoArray;
- (void)incToComp:(int)a3;
- (void)incToGizmo:(int)a3;
@end

@implementation SPAppUsageTrack

- (SPAppUsageTrack)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPAppUsageTrack;
  result = [(SPAppUsageTrack *)&v3 init];
  if (result)
  {
    result->toGizmo[12] = 0;
    *(_OWORD *)&result->toGizmo[8] = 0u;
    *(_OWORD *)&result->toGizmo[4] = 0u;
    *(_OWORD *)result->toGizmo = 0u;
    *(_OWORD *)result->toComp = 0u;
    *(_OWORD *)&result->toComp[4] = 0u;
    *(_OWORD *)&result->toComp[8] = 0u;
    result->toComp[12] = 0;
  }
  return result;
}

- (void)incToGizmo:(int)a3
{
}

- (void)incToComp:(int)a3
{
}

- (unsigned)toGizmoArray
{
  return self->toGizmo;
}

- (unsigned)toCompArray
{
  return self->toComp;
}

@end