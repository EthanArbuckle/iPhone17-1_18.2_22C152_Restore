@interface MDMUserClient
+ (id)sharedClient;
- (MDMUserClient)init;
@end

@implementation MDMUserClient

+ (id)sharedClient
{
  if (sharedClient_once_0 != -1) {
    dispatch_once(&sharedClient_once_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedClient_client_0;

  return v2;
}

uint64_t __29__MDMUserClient_sharedClient__block_invoke()
{
  sharedClient_client_0 = objc_alloc_init(MDMUserClient);

  return MEMORY[0x1F41817F8]();
}

- (MDMUserClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)MDMUserClient;
  return [(MDMClientCore *)&v3 initWithChannelType:1];
}

@end