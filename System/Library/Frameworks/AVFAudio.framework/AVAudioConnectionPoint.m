@interface AVAudioConnectionPoint
+ (AVAudioConnectionPoint)connectionPointWithNode:(id)a3 bus:(unint64_t)a4;
- (AVAudioConnectionPoint)init;
- (AVAudioConnectionPoint)initWithNode:(AVAudioNode *)node bus:(AVAudioNodeBus)bus;
- (AVAudioNode)node;
- (AVAudioNodeBus)bus;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAudioConnectionPoint

- (AVAudioNodeBus)bus
{
  return self->_bus;
}

- (AVAudioNode)node
{
  return self->_node;
}

- (unint64_t)hash
{
  return (unint64_t)&self->_node[2 * self->_bus + 60].super.isa - self->_bus + 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (AVAudioNode *)[a3 node] == self->_node
      && [a3 bus] == self->_bus;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVAudioConnectionPoint;
  [(AVAudioConnectionPoint *)&v2 dealloc];
}

- (AVAudioConnectionPoint)initWithNode:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  if (node)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVAudioConnectionPoint;
    result = [(AVAudioConnectionPoint *)&v7 init];
    if (result)
    {
      result->_node = node;
      result->_bus = bus;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (AVAudioConnectionPoint)init
{
  return 0;
}

+ (AVAudioConnectionPoint)connectionPointWithNode:(id)a3 bus:(unint64_t)a4
{
  v4 = [[AVAudioConnectionPoint alloc] initWithNode:a3 bus:a4];

  return v4;
}

@end