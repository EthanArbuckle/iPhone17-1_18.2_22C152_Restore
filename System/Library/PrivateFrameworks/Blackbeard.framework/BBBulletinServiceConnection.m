@interface BBBulletinServiceConnection
+ (id)sharedBulletinServiceWithDelegate:(id)a3;
@end

@implementation BBBulletinServiceConnection

+ (id)sharedBulletinServiceWithDelegate:(id)a3
{
  if (sharedBulletinServiceWithDelegate__onceToken[0] != -1) {
    dispatch_once(sharedBulletinServiceWithDelegate__onceToken, &__block_literal_global);
  }
  v3 = (void *)sharedBulletinServiceWithDelegate__service;
  return v3;
}

uint64_t __65__BBBulletinServiceConnection_sharedBulletinServiceWithDelegate___block_invoke()
{
  sharedBulletinServiceWithDelegate__service = [[BBBulletinService alloc] initNoop];
  return MEMORY[0x270F9A758]();
}

@end