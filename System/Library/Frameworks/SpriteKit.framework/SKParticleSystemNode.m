@interface SKParticleSystemNode
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
@end

@implementation SKParticleSystemNode

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKParticleSystemNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcParticleSystemNode = [(SKNode *)self _backingNode];
}

@end