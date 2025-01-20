@interface REDisplayLinkTarget
- (REDisplayLinkTarget)initWithClock:(void *)a3;
- (void)update;
- (void)updateOnQueue;
@end

@implementation REDisplayLinkTarget

- (REDisplayLinkTarget)initWithClock:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)REDisplayLinkTarget;
  v4 = [(REDisplayLinkTarget *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_clock = a3;
    v6 = v4;
  }

  return v5;
}

- (void)update
{
}

- (void)updateOnQueue
{
  v3 = *((id *)self->_clock + 17);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__REDisplayLinkTarget_updateOnQueue__block_invoke;
  block[3] = &unk_264BE2330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __36__REDisplayLinkTarget_updateOnQueue__block_invoke(uint64_t a1)
{
}

@end