@interface BLCacheDeleteStorageVolumeInfo
- (BOOL)purgeableValueChanged;
- (int64_t)purgeableHighPriority;
- (int64_t)purgeableLowPriority;
- (int64_t)purgeableMediumPriority;
- (int64_t)purgeableSpecialCasePriority;
- (void)setPurgeableHighPriority:(int64_t)a3;
- (void)setPurgeableLowPriority:(int64_t)a3;
- (void)setPurgeableMediumPriority:(int64_t)a3;
- (void)setPurgeableSpecialCasePriority:(int64_t)a3;
- (void)setPurgeableValueChanged:(BOOL)a3;
@end

@implementation BLCacheDeleteStorageVolumeInfo

- (void)setPurgeableLowPriority:(int64_t)a3
{
  if (self->_purgeableLowPriority != a3)
  {
    self->_purgeableLowPriority = a3;
    self->_purgeableValueChanged = 1;
  }
}

- (void)setPurgeableMediumPriority:(int64_t)a3
{
  if (self->_purgeableMediumPriority != a3)
  {
    self->_purgeableMediumPriority = a3;
    self->_purgeableValueChanged = 1;
  }
}

- (void)setPurgeableHighPriority:(int64_t)a3
{
  if (self->_purgeableHighPriority != a3)
  {
    self->_purgeableHighPriority = a3;
    self->_purgeableValueChanged = 1;
  }
}

- (void)setPurgeableSpecialCasePriority:(int64_t)a3
{
  if (self->_purgeableSpecialCasePriority != a3)
  {
    self->_purgeableSpecialCasePriority = a3;
    self->_purgeableValueChanged = 1;
  }
}

- (BOOL)purgeableValueChanged
{
  return self->_purgeableValueChanged;
}

- (void)setPurgeableValueChanged:(BOOL)a3
{
  self->_purgeableValueChanged = a3;
}

- (int64_t)purgeableLowPriority
{
  return self->_purgeableLowPriority;
}

- (int64_t)purgeableMediumPriority
{
  return self->_purgeableMediumPriority;
}

- (int64_t)purgeableHighPriority
{
  return self->_purgeableHighPriority;
}

- (int64_t)purgeableSpecialCasePriority
{
  return self->_purgeableSpecialCasePriority;
}

@end