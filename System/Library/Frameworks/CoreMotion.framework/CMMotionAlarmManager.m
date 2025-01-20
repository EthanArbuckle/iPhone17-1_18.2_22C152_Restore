@interface CMMotionAlarmManager
+ (BOOL)isAvailable;
+ (id)defaultManager;
- (BOOL)acknowledgeAlarm:(id)a3 error:(id *)a4;
- (BOOL)acknowledgeAlarmWithName:(id)a3 error:(id *)a4;
- (BOOL)launchRemoteAppWithError:(id *)a3;
- (BOOL)registerAlarmWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 error:(id *)a7;
- (BOOL)unregisterAlarm:(id)a3 error:(id *)a4;
- (BOOL)unregisterAlarmWithName:(id)a3 error:(id *)a4;
- (CMMotionAlarmDelegateProtocol)delegate;
- (CMMotionAlarmManager)init;
- (CMMotionAlarmManager)initWithName:(id)a3;
- (NSString)name;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CMMotionAlarmManager

- (CMMotionAlarmManager)init
{
  return (CMMotionAlarmManager *)objc_msgSend_initWithName_(self, a2, @"_DefaultManager");
}

- (CMMotionAlarmManager)initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMMotionAlarmManager;
  v4 = [(CMMotionAlarmManager *)&v6 init];
  if (v4) {
    v4->_name = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_name = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMMotionAlarmManager;
  [(CMMotionAlarmManager *)&v3 dealloc];
}

+ (id)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904E6184;
  block[3] = &unk_1E568D118;
  block[4] = a1;
  if (qword_1EB3BF2F8 != -1) {
    dispatch_once(&qword_1EB3BF2F8, block);
  }
  return (id)qword_1EB3BF300;
}

- (BOOL)registerAlarmWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  v13 = [CMMotionAlarm alloc];
  v15 = objc_msgSend_initWithName_type_duration_repeats_(v13, v14, (uint64_t)a3, v10, v9, v8);
  objc_msgSend_setManager_(v15, v16, (uint64_t)self);
  v19 = objc_msgSend_instance(CMMotionAlarmManagerInternal, v17, v18);
  LOBYTE(a7) = objc_msgSend__registerAlarm_error_(v19, v20, (uint64_t)v15, a7);

  return (char)a7;
}

- (BOOL)unregisterAlarmWithName:(id)a3 error:(id *)a4
{
  v7 = [CMMotionAlarm alloc];
  uint64_t v9 = objc_msgSend_initWithName_type_duration_repeats_(v7, v8, (uint64_t)a3, 9, 0xFFFFFFFFLL, 0);
  objc_msgSend_setManager_(v9, v10, (uint64_t)self);
  v13 = objc_msgSend_instance(CMMotionAlarmManagerInternal, v11, v12);
  LOBYTE(a4) = objc_msgSend__unregisterAlarm_error_(v13, v14, (uint64_t)v9, a4);

  return (char)a4;
}

- (BOOL)acknowledgeAlarmWithName:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend_instance(CMMotionAlarmManagerInternal, a2, (uint64_t)a3);

  return MEMORY[0x1F4181798](v5, sel__acknowledgeAlarm_error_, a3);
}

- (BOOL)launchRemoteAppWithError:(id *)a3
{
  uint64_t v5 = objc_msgSend_instance(CMMotionAlarmManagerInternal, a2, (uint64_t)a3);
  objc_msgSend_delegate(self, v6, v7);

  return MEMORY[0x1F4181798](v5, sel__launchRemoteAppWithError_delegate_, a3);
}

- (BOOL)unregisterAlarm:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend_name(a3, a2, (uint64_t)a3);

  return MEMORY[0x1F4181798](self, sel_unregisterAlarmWithName_error_, v5);
}

- (BOOL)acknowledgeAlarm:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend_name(a3, a2, (uint64_t)a3);

  return MEMORY[0x1F4181798](self, sel_acknowledgeAlarmWithName_error_, v5);
}

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_1902CD6B0() >> 1) & 1;
}

- (CMMotionAlarmDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMMotionAlarmDelegateProtocol *)a3;
}

- (NSString)name
{
  return self->_name;
}

@end