@interface BWGraphLiveExtension
- (BOOL)committed;
- (id)nodes;
- (void)addNode:(id)a3;
- (void)dealloc;
- (void)setCommitted:(BOOL)a3;
@end

@implementation BWGraphLiveExtension

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWGraphLiveExtension;
  [(BWGraphLiveExtension *)&v3 dealloc];
}

- (void)addNode:(id)a3
{
  if (!self->_nodes) {
    self->_nodes = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  }
  [a3 setConfigurationID:self->_configurationID];
  nodes = self->_nodes;
  [(NSMutableArray *)nodes addObject:a3];
}

- (id)nodes
{
  return self->_nodes;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (BOOL)committed
{
  return self->_committed;
}

@end