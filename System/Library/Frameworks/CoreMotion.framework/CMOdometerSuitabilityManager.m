@interface CMOdometerSuitabilityManager
- (CMOdometerSuitabilityManager)init;
- (CMOdometerSuitabilityManagerProxy)odometerSuitabilityManagerProxy;
- (void)dealloc;
- (void)startOdometerSuitabilityUpdatesWithHandler:(id)a3;
- (void)stopOdometerSuitabilityUpdates;
@end

@implementation CMOdometerSuitabilityManager

- (CMOdometerSuitabilityManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CMOdometerSuitabilityManager;
  v2 = [(CMOdometerSuitabilityManager *)&v9 init];
  if (v2)
  {
    v3 = [CMOdometerSuitabilityManagerProxy alloc];
    v5 = (CMOdometerSuitabilityManagerProxy *)objc_msgSend_initWithOdometerSuitability_(v3, v4, (uint64_t)v2);
    v2->_odometerSuitabilityManagerProxy = v5;
    objc_msgSend__startDaemonConnection(v5, v6, v7);
  }
  return v2;
}

- (void)dealloc
{
  v4 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, v2) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904F5F80;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);

  v5.receiver = self;
  v5.super_class = (Class)CMOdometerSuitabilityManager;
  [(CMOdometerSuitabilityManager *)&v5 dealloc];
}

- (void)startOdometerSuitabilityUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CMOdometerSuitabilityManager.mm", 175, @"Invalid parameter not satisfying: %@", @"handler");
  }
  objc_super v5 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, (uint64_t)a3) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904F6060;
  block[3] = &unk_1E568D2F8;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(v5, block);
}

- (void)stopOdometerSuitabilityUpdates
{
  v4 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, v2) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904F611C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (CMOdometerSuitabilityManagerProxy)odometerSuitabilityManagerProxy
{
  return self->_odometerSuitabilityManagerProxy;
}

@end