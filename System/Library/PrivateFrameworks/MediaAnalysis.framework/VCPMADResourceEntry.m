@interface VCPMADResourceEntry
- (VCPMADResource)resource;
- (VCPMADResourceEntry)initWithResource:(id)a3;
- (int64_t)activeCount;
- (int64_t)currentCost;
- (void)setActiveCount:(int64_t)a3;
- (void)setCurrentCost:(int64_t)a3;
- (void)setResource:(id)a3;
@end

@implementation VCPMADResourceEntry

- (VCPMADResourceEntry)initWithResource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPMADResourceEntry;
  v6 = [(VCPMADResourceEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resource, a3);
  }

  return v7;
}

- (VCPMADResource)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (int64_t)activeCount
{
  return self->_activeCount;
}

- (void)setActiveCount:(int64_t)a3
{
  self->_activeCount = a3;
}

- (int64_t)currentCost
{
  return self->_currentCost;
}

- (void)setCurrentCost:(int64_t)a3
{
  self->_currentCost = a3;
}

- (void).cxx_destruct
{
}

@end