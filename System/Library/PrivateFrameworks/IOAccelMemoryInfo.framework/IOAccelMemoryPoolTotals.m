@interface IOAccelMemoryPoolTotals
- (NSString)device_name;
- (NSString)pool;
- (unint64_t)allocatedSize;
- (unint64_t)dirtySize;
- (unint64_t)nonpurgeableSize;
- (unint64_t)orphanedSize;
- (unint64_t)purgeableSize;
- (unint64_t)residentSize;
- (unint64_t)wiredSize;
- (void)dealloc;
- (void)setAllocatedSize:(unint64_t)a3;
- (void)setDevice_name:(id)a3;
- (void)setDirtySize:(unint64_t)a3;
- (void)setNonpurgeableSize:(unint64_t)a3;
- (void)setOrphanedSize:(unint64_t)a3;
- (void)setPool:(id)a3;
- (void)setPurgeableSize:(unint64_t)a3;
- (void)setResidentSize:(unint64_t)a3;
- (void)setWiredSize:(unint64_t)a3;
@end

@implementation IOAccelMemoryPoolTotals

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryPoolTotals;
  [(IOAccelMemoryPoolTotals *)&v3 dealloc];
}

- (NSString)device_name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice_name:(id)a3
{
}

- (NSString)pool
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPool:(id)a3
{
}

- (unint64_t)allocatedSize
{
  return self->allocatedSize;
}

- (void)setAllocatedSize:(unint64_t)a3
{
  self->allocatedSize = a3;
}

- (unint64_t)residentSize
{
  return self->residentSize;
}

- (void)setResidentSize:(unint64_t)a3
{
  self->residentSize = a3;
}

- (unint64_t)wiredSize
{
  return self->wiredSize;
}

- (void)setWiredSize:(unint64_t)a3
{
  self->wiredSize = a3;
}

- (unint64_t)dirtySize
{
  return self->dirtySize;
}

- (void)setDirtySize:(unint64_t)a3
{
  self->dirtySize = a3;
}

- (unint64_t)purgeableSize
{
  return self->purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->purgeableSize = a3;
}

- (unint64_t)nonpurgeableSize
{
  return self->nonpurgeableSize;
}

- (void)setNonpurgeableSize:(unint64_t)a3
{
  self->nonpurgeableSize = a3;
}

- (unint64_t)orphanedSize
{
  return self->orphanedSize;
}

- (void)setOrphanedSize:(unint64_t)a3
{
  self->orphanedSize = a3;
}

@end