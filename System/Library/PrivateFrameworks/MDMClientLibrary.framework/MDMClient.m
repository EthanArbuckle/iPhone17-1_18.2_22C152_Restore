@interface MDMClient
+ (id)sharedClient;
- (MDMClient)init;
@end

@implementation MDMClient

+ (id)sharedClient
{
  if (sharedClient_once != -1) {
    dispatch_once(&sharedClient_once, &__block_literal_global);
  }
  v2 = (void *)sharedClient_client;

  return v2;
}

uint64_t __25__MDMClient_sharedClient__block_invoke()
{
  sharedClient_client = objc_alloc_init(MDMClient);

  return MEMORY[0x1F41817F8]();
}

- (MDMClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)MDMClient;
  return [(MDMClientCore *)&v3 initWithChannelType:0];
}

@end