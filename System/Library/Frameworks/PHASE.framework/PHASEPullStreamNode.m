@interface PHASEPullStreamNode
- (id)renderBlock;
- (void)setRenderBlock:(id)a3;
@end

@implementation PHASEPullStreamNode

- (void)setRenderBlock:(id)a3
{
  if (self->_renderBlock)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    [v3 raise:@"API Misuse" format:@"Attempting to change the renderBlock for a PullStreamNode."];
  }
  else
  {
    self->_renderBlock = _Block_copy(a3);
    MEMORY[0x270F9A758]();
  }
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void).cxx_destruct
{
}

@end