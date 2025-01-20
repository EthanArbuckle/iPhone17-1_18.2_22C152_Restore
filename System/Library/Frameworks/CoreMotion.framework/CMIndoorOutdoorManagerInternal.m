@interface CMIndoorOutdoorManagerInternal
- (CMIndoorOutdoorManagerInternal)init;
- (void)_lastKnownIndoorOutdoorStateWithHandler:(id)a3;
- (void)_startIndoorOutdoorUpdates;
- (void)_stopIndoorOutdoorUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMIndoorOutdoorManagerInternal

- (CMIndoorOutdoorManagerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMIndoorOutdoorManagerInternal;
  v2 = [(CMIndoorOutdoorManagerInternal *)&v4 init];
  if (v2)
  {
    v2->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMIndoorOutdoor.InternalQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_internalQueue);
  self->_internalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMIndoorOutdoorManagerInternal;
  [(CMIndoorOutdoorManagerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  sub_1902C3F54(&__p, "kCLConnectionMessageIndoorOutdoorUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  if (self->_connection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->_connection = 0;
}

- (void)_startIndoorOutdoorUpdates
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904BFAAC;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_stopIndoorOutdoorUpdates
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904C0060;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)_lastKnownIndoorOutdoorStateWithHandler:(id)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904C0384;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

@end