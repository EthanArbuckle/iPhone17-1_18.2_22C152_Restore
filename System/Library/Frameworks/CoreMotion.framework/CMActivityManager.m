@interface CMActivityManager
- (BOOL)isActivityAvailable;
- (CMActivityManager)init;
- (id)activityHandler;
- (int64_t)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4;
- (int64_t)simulateMotionState:(BOOL)a3 withState:(int64_t)a4;
- (int64_t)simulateMotionStateYouthWithState:(int64_t)a3;
- (void)dealloc;
- (void)setActivityHandler:(id)a3;
@end

@implementation CMActivityManager

- (int64_t)simulateMotionStateYouthWithState:(int64_t)a3
{
  id internal = self->_internal;
  v4 = *((void *)internal + 3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905200AC;
  v6[3] = &unk_1E568DB10;
  v6[4] = internal;
  v6[5] = a3;
  dispatch_sync(v4, v6);
  return *((void *)internal + 13);
}

- (int64_t)simulateMotionState:(BOOL)a3 withState:(int64_t)a4
{
  id internal = self->_internal;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v7 = *((void *)internal + 3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1902B6B24;
  block[3] = &unk_1E568E110;
  block[4] = internal;
  block[5] = &v14;
  dispatch_sync(v7, block);
  int64_t v8 = v15[3];
  if (!v8)
  {
    v9 = *((void *)internal + 10);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1902B5958;
    v11[3] = &unk_1E568E8C0;
    BOOL v12 = a3;
    v11[5] = &v14;
    v11[6] = a4;
    v11[4] = internal;
    dispatch_sync(v9, v11);
    int64_t v8 = v15[3];
  }
  _Block_object_dispose(&v14, 8);
  return v8;
}

- (CMActivityManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMActivityManager;
  v2 = [(CMActivityManager *)&v4 init];
  if (v2) {
    v2->_id internal = objc_alloc_init(CMActivityManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  self->_id internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMActivityManager;
  [(CMActivityManager *)&v3 dealloc];
}

- (void)setActivityHandler:(id)a3
{
  id internal = self->_internal;
  objc_super v4 = *((void *)internal + 3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19051FDB0;
  v5[3] = &unk_1E568D320;
  v5[4] = internal;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

- (id)activityHandler
{
  id internal = self->_internal;
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD160;
  v11 = sub_1902DD0B8;
  uint64_t v12 = 0;
  objc_super v3 = *((void *)internal + 3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19051FE90;
  v6[3] = &unk_1E568DDB0;
  v6[4] = internal;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  objc_super v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isActivityAvailable
{
  if (sub_1902BACB4())
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_1902BAD40();
    return ((unint64_t)sub_1902CD6B0() >> 22) & 1;
  }
  return v2;
}

- (int64_t)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4
{
  id internal = self->_internal;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v7 = *((void *)internal + 3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190520000;
  block[3] = &unk_1E568E110;
  block[4] = internal;
  block[5] = &v14;
  dispatch_sync(v7, block);
  int64_t v8 = v15[3];
  if (!v8)
  {
    uint64_t v9 = *((void *)internal + 6);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1902BBBF0;
    v11[3] = &unk_1E568E8C0;
    BOOL v12 = a3;
    v11[5] = &v14;
    v11[6] = a4;
    v11[4] = internal;
    dispatch_sync(v9, v11);
    int64_t v8 = v15[3];
  }
  _Block_object_dispose(&v14, 8);
  return v8;
}

@end