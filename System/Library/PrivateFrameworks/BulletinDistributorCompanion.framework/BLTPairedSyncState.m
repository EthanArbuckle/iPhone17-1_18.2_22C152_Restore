@interface BLTPairedSyncState
+ (id)sharedInstance;
- (BOOL)becameSyncUnrestricted:(id)a3;
- (BOOL)becameTrafficUnrestricted:(id)a3;
- (BOOL)isInitialSyncComplete;
- (BOOL)isSyncRestricted;
- (BOOL)isTrafficRestricted;
- (unint64_t)state;
- (void)leaveState:(unint64_t)a3;
- (void)setInitialSyncComplete:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation BLTPairedSyncState

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__BLTPairedSyncState_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __36__BLTPairedSyncState_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)setState:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    v5 = objc_alloc_init(BLTPairedSyncStateChangedInfo);
    [(BLTPairedSyncStateChangedInfo *)v5 setOldState:self->_state];
    [(BLTPairedSyncStateChangedInfo *)v5 setNewState:a3];
    self->_state = a3;
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    v8 = @"info";
    v9[0] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v6 postNotificationName:@"BLTPairedSyncStateChanged" object:self userInfo:v7];
  }
}

- (BOOL)isSyncRestricted
{
  return self->_state < 2;
}

- (BOOL)isTrafficRestricted
{
  return self->_state == 0;
}

- (void)setInitialSyncComplete:(BOOL)a3
{
  if (self->_initialSyncComplete != a3)
  {
    self->_initialSyncComplete = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"BLTPairedSyncStateInitialSyncCompleteChanged" object:self];
  }
}

- (BOOL)becameTrafficUnrestricted:(id)a3
{
  return stateDidChange(a3, (uint64_t (*)(uint64_t))stateIsTrafficRestricted);
}

- (BOOL)becameSyncUnrestricted:(id)a3
{
  return stateDidChange(a3, (uint64_t (*)(uint64_t))stateIsSyncRestricted);
}

- (void)leaveState:(unint64_t)a3
{
  if (self->_state <= a3) {
    [(BLTPairedSyncState *)self setState:a3 + 1];
  }
}

- (BOOL)isInitialSyncComplete
{
  return self->_initialSyncComplete;
}

- (unint64_t)state
{
  return self->_state;
}

@end