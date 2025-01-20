@interface FTServiceStatus
+ (id)sharedInstance;
- (BOOL)blockPost;
- (BOOL)faceTimeAudioSupported;
- (BOOL)faceTimeMultiwaySupported;
- (BOOL)iMessageSupported;
- (id)initPrivate;
- (int)supportedServicesToken;
- (unint64_t)_noCache_supportedServicesFlags;
- (unint64_t)supportedServicesFlags;
- (void)_addObservers;
- (void)_reload;
- (void)_removeObservers;
- (void)dealloc;
- (void)setBlockPost:(BOOL)a3;
- (void)setSupportedServicesFlags:(unint64_t)a3;
- (void)setSupportedServicesToken:(int)a3;
@end

@implementation FTServiceStatus

- (void)_addObservers
{
  IMUserScopedNotification();
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = im_primary_queue();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v7, &location);
  uint64_t v4 = IMDispatchForNotify();
  objc_msgSend_setSupportedServicesToken_(self, v5, v4, v6, 3221225472, sub_1A7BD66AC, &unk_1E5D1AF58);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_reload
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = objc_msgSend_supportedServicesFlags(self, a2, v2);
  unint64_t v7 = objc_msgSend__noCache_supportedServicesFlags(self, v5, v6);
  objc_msgSend_setSupportedServicesFlags_(self, v8, v7);
  v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    if ((v7 & 2) != 0) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    if ((v7 & 4) != 0) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    int v23 = 138413058;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = objc_msgSend_supportedServicesFlags(self, v12, v13);
    _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Updating supported service status { iMessageSupported: %@, faceTimeAudioSupported: %@, faceTimeMultiwaySupported: %@, supportedServicesFlags: %llu }", (uint8_t *)&v23, 0x2Au);
  }

  if ((((v4 ^ v7) & 1) != 0
     || ((v4 >> 1) & 1) != ((v7 >> 1) & 1)
     || ((v4 >> 2) & 1) != ((v7 >> 2) & 1))
    && (objc_msgSend_blockPost(self, v17, v18) & 1) == 0)
  {
    v21 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20);
    objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, @"FTServiceStatusDidChangeNotification", 0);
  }
}

+ (id)sharedInstance
{
  if (qword_1EB47C830 != -1) {
    dispatch_once(&qword_1EB47C830, &unk_1EFE078A0);
  }
  uint64_t v2 = (void *)qword_1EB47C840;

  return v2;
}

- (BOOL)iMessageSupported
{
  return objc_msgSend_supportedServicesFlags(self, a2, v2) & 1;
}

- (BOOL)faceTimeMultiwaySupported
{
  return ((unint64_t)objc_msgSend_supportedServicesFlags(self, a2, v2) >> 2) & 1;
}

- (BOOL)faceTimeAudioSupported
{
  return ((unint64_t)objc_msgSend_supportedServicesFlags(self, a2, v2) >> 1) & 1;
}

- (unint64_t)supportedServicesFlags
{
  return self->_supportedServicesFlags;
}

- (int)supportedServicesToken
{
  return self->_supportedServicesToken;
}

- (void)setSupportedServicesToken:(int)a3
{
  self->_supportedServicesToken = a3;
}

- (void)setSupportedServicesFlags:(unint64_t)a3
{
  self->_supportedServicesFlags = a3;
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)FTServiceStatus;
  uint64_t v2 = [(FTServiceStatus *)&v9 init];
  v5 = v2;
  if (v2)
  {
    v2->_blockPost = 1;
    objc_msgSend__addObservers(v2, v3, v4);
    objc_msgSend__reload(v5, v6, v7);
    v5->_blockPost = 0;
  }
  return v5;
}

- (BOOL)blockPost
{
  return self->_blockPost;
}

- (unint64_t)_noCache_supportedServicesFlags
{
  uint64_t state64 = 0;
  int v3 = objc_msgSend_supportedServicesToken(self, a2, v2);
  notify_get_state(v3, &state64);
  return state64;
}

- (void)dealloc
{
  objc_msgSend__removeObservers(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FTServiceStatus;
  [(FTServiceStatus *)&v4 dealloc];
}

- (void)_removeObservers
{
  int v3 = objc_msgSend_supportedServicesToken(self, a2, v2);

  notify_cancel(v3);
}

- (void)setBlockPost:(BOOL)a3
{
  self->_blockPost = a3;
}

@end