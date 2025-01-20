@interface CAStateControllerAnimation
- (CALayer)layer;
- (CAStateControllerAnimation)initWithLayer:(id)a3 key:(id)a4;
- (NSString)key;
- (void)dealloc;
@end

@implementation CAStateControllerAnimation

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerAnimation;
  [(CAStateControllerAnimation *)&v3 dealloc];
}

- (CAStateControllerAnimation)initWithLayer:(id)a3 key:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAStateControllerAnimation;
  v6 = [(CAStateControllerAnimation *)&v8 init];
  if (v6)
  {
    v6->_layer = (CALayer *)a3;
    v6->_key = (NSString *)[a4 copy];
  }
  return v6;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)key
{
  return self->_key;
}

@end