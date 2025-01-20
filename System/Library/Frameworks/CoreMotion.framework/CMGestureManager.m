@interface CMGestureManager
+ (BOOL)isGestureServiceAvailable;
+ (BOOL)isGestureServiceEnabled;
+ (void)setGestureServiceEnabled:(BOOL)a3;
- (CMGestureManager)init;
- (CMGestureManager)initWithPriority:(int)a3;
- (id)gestureHandler;
- (void)dealloc;
- (void)setGestureHandler:(id)a3;
@end

@implementation CMGestureManager

- (CMGestureManager)init
{
  return (CMGestureManager *)objc_msgSend_initWithPriority_(self, a2, 0);
}

- (CMGestureManager)initWithPriority:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CMGestureManager;
  v4 = [(CMGestureManager *)&v8 init];
  if (v4)
  {
    v5 = [CMGestureManagerInternal alloc];
    v4->_internal = (id)objc_msgSend_initWithPriority_(v5, v6, v3);
  }
  return v4;
}

- (void)dealloc
{
  id internal = self->_internal;
  v4 = *((void *)internal + 4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19051EE88;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_async(v4, block);

  self->_id internal = 0;
  v5.receiver = self;
  v5.super_class = (Class)CMGestureManager;
  [(CMGestureManager *)&v5 dealloc];
}

- (void)setGestureHandler:(id)a3
{
  id internal = self->_internal;
  v4 = *((void *)internal + 4);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19051EF04;
  v5[3] = &unk_1E568D320;
  v5[4] = internal;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

- (id)gestureHandler
{
  id internal = self->_internal;
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD150;
  v11 = sub_1902DD0AC;
  uint64_t v12 = 0;
  uint64_t v3 = *((void *)internal + 4);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19051EFE4;
  v6[3] = &unk_1E568DDB0;
  v6[4] = internal;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (BOOL)isGestureServiceEnabled
{
  char v5 = 0;
  if (sub_190553E80((uint64_t)&v5, a2, v2)) {
    BOOL v3 = v5 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)isGestureServiceAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return (sub_1902BB1DC() >> 3) & 1;
  }
  return v2;
}

+ (void)setGestureServiceEnabled:(BOOL)a3
{
}

@end