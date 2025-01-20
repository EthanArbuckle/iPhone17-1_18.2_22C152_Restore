@interface CMElevation
+ (BOOL)isElevationAvailable;
- (CMAltimeterInternal)_internal;
- (CMElevation)init;
- (void)dealloc;
- (void)startElevationUpdatesWithHandler:(id)a3;
- (void)stopElevationUpdates;
@end

@implementation CMElevation

- (CMElevation)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMElevation;
  v2 = [(CMElevation *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMAltimeterInternal);
  }
  return v2;
}

- (void)dealloc
{
  value = self->_internal->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905C983C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(value, block);

  v4.receiver = self;
  v4.super_class = (Class)CMElevation;
  [(CMElevation *)&v4 dealloc];
}

+ (BOOL)isElevationAvailable
{
  return 0;
}

- (void)startElevationUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMAltimeter.mm", 1114, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905C9934;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopElevationUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905C99E8;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (CMAltimeterInternal)_internal
{
  return self->_internal;
}

@end