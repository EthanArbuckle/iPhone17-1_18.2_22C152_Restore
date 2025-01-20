@interface CMFitnessMachine
+ (BOOL)isAvailable;
- (CMFitnessMachine)init;
- (CMFitnessMachineInternal)_internal;
- (void)dealloc;
- (void)feedFitnessMachineData:(id)a3;
@end

@implementation CMFitnessMachine

- (CMFitnessMachine)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMFitnessMachine;
  v2 = [(CMFitnessMachine *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMFitnessMachineInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190545D0C;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMFitnessMachine;
  [(CMFitnessMachine *)&v5 dealloc];
}

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (void)feedFitnessMachineData:(id)a3
{
  if (qword_1EB3BF568 != -1) {
    dispatch_once(&qword_1EB3BF568, &unk_1EDFD3860);
  }
  if (qword_1EB3BF560 == 3)
  {
    uint64_t v5 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v5, sel__feedFitnessMachineData_, a3);
  }
}

- (CMFitnessMachineInternal)_internal
{
  return self->_internal;
}

@end