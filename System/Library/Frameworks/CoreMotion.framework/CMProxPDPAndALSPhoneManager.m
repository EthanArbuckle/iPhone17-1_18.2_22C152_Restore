@interface CMProxPDPAndALSPhoneManager
+ (BOOL)isAvailable;
- (CMProxPDPAndALSPhoneManager)init;
- (CMProxPDPAndALSPhoneManagerInternal)_internal;
- (void)dealloc;
- (void)startALSPhoneUpdatesWithHandler:(id)a3;
- (void)startPDPUpdatesWithHandler:(id)a3;
@end

@implementation CMProxPDPAndALSPhoneManager

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_1902CD6B0() >> 8) & 1;
}

- (void)startPDPUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CMProxPDPAndALSPhoneManager.mm", 156, @"Invalid parameter not satisfying: %@", @"handler");
  }
  uint64_t v5 = objc_msgSend__internal(self, a2, (uint64_t)a3);

  MEMORY[0x1F4181798](v5, sel__startPDPUpdatesWithHandler_, a3);
}

- (void)startALSPhoneUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CMProxPDPAndALSPhoneManager.mm", 162, @"Invalid parameter not satisfying: %@", @"handler");
  }
  uint64_t v5 = objc_msgSend__internal(self, a2, (uint64_t)a3);

  MEMORY[0x1F4181798](v5, sel__startALSPhoneUpdatesWithHandler_, a3);
}

- (CMProxPDPAndALSPhoneManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMProxPDPAndALSPhoneManager;
  v2 = [(CMProxPDPAndALSPhoneManager *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMProxPDPAndALSPhoneManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMProxPDPAndALSPhoneManager;
  [(CMProxPDPAndALSPhoneManager *)&v3 dealloc];
}

- (CMProxPDPAndALSPhoneManagerInternal)_internal
{
  return (CMProxPDPAndALSPhoneManagerInternal *)self->_internal;
}

@end