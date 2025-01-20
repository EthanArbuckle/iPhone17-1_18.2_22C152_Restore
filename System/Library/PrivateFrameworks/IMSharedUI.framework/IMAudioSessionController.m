@interface IMAudioSessionController
+ (id)queue;
+ (id)sharedInstance;
+ (void)__setSingleton__im:(id)a3;
- (BOOL)isActive;
- (BOOL)isDirty;
- (BOOL)shouldDuckOthers;
- (BOOL)shouldStopPlayingWhenSilent;
- (BOOL)shouldUseSpeaker;
- (unint64_t)options;
- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)configureAudioSessionWithOptions:(unint64_t)a3;
- (void)deactivate;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setDirty:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation IMAudioSessionController

+ (void)__setSingleton__im:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F90F8;
  block[3] = &unk_2643009F8;
  block[4] = a1;
  if (qword_267BC01F0 != -1) {
    dispatch_once(&qword_267BC01F0, block);
  }
  v2 = (void *)qword_267BC01E8;
  return v2;
}

+ (id)queue
{
  if (qword_267BC0200 != -1) {
    dispatch_once(&qword_267BC0200, &unk_26C918FB8);
  }
  v2 = (void *)qword_267BC01F8;
  return v2;
}

- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)deactivate
{
}

- (BOOL)shouldUseSpeaker
{
  return objc_msgSend_options(self, a2, v2) & 1;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return ((unint64_t)objc_msgSend_options(self, a2, v2) >> 1) & 1;
}

- (BOOL)shouldDuckOthers
{
  return ((unint64_t)objc_msgSend_options(self, a2, v2) >> 2) & 1;
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v11 = objc_msgSend_audio(IMSharedUILogs, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x21D462460](v8);
    *(_DWORD *)buf = 67109632;
    BOOL v23 = v6;
    __int16 v24 = 1024;
    int v25 = a4 & 1;
    __int16 v26 = 2048;
    v27 = v12;
    _os_log_impl(&dword_2180ED000, v11, OS_LOG_TYPE_INFO, "setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);
  }
  v15 = objc_msgSend_queue(IMAudioSessionController, v13, v14);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2180F9424;
  v17[3] = &unk_264300A20;
  BOOL v20 = v6;
  char v21 = a4 & 1;
  v17[4] = self;
  id v18 = v8;
  unint64_t v19 = a4;
  id v16 = v8;
  dispatch_async(v15, v17);
}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3);
  v11 = @"IMAudioSessionControllerSessionNotificationOptionsKey";
  v7 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v6, a3);
  v12[0] = v7;
  v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v12, &v11, 1);
  objc_msgSend_postNotificationName_object_userInfo_(v5, v10, @"IMAudioSessionControllerSessionOptionsWillChangeNotification", self, v9);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end