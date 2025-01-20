@interface AVMapPublisher
+ (id)mapPublisherWithUpstream:(id)a3 transform:(id)a4;
- (AVMapPublisher)initWithUpstream:(id)a3 transform:(id)a4;
- (id)description;
- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation AVMapPublisher

uint64_t __56__AVMapPublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  upstream = self->_upstream;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AVMapPublisher_subscribeRequestingInitialValue_block___block_invoke;
  v6[3] = &unk_1E57B4468;
  v6[4] = self;
  v6[5] = a4;
  return [(AVPublisher *)upstream subscribeRequestingInitialValue:a3 block:v6];
}

+ (id)mapPublisherWithUpstream:(id)a3 transform:(id)a4
{
  v4 = [[AVMapPublisher alloc] initWithUpstream:a3 transform:a4];
  return v4;
}

- (AVMapPublisher)initWithUpstream:(id)a3 transform:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMapPublisher;
  v6 = [(AVPublisher *)&v9 init];
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v6->_upstream = (AVPublisher *)a3;
      v7->_transform = (id)[a4 copy];
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMapPublisher;
  [(AVPublisher *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p upstream=%@>", objc_opt_class(), self, self->_upstream];
}

@end