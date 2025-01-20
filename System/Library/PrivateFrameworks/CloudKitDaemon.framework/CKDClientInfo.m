@interface CKDClientInfo
+ (id)sharedClientInfo;
- (CKDClientInfo)init;
- (NSString)hostname;
- (id)initInternal;
- (void)_refreshHostname;
- (void)dealloc;
@end

@implementation CKDClientInfo

+ (id)sharedClientInfo
{
  if (qword_1EBBCFC80 != -1) {
    dispatch_once(&qword_1EBBCFC80, &unk_1F20435B0);
  }
  v2 = (void *)qword_1EBBCFC78;
  return v2;
}

- (CKDClientInfo)init
{
  v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v8, (uint64_t)a2, self, @"CKDClientInfo.m", 55, @"Use +[%@ sharedClientInfo]", v7);

  return 0;
}

- (id)initInternal
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CKDClientInfo;
  uint64_t v2 = [(CKDClientInfo *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cloudkit.clientinfo.callback", v4);
    hostCallbackQueue = v2->_hostCallbackQueue;
    v2->_hostCallbackQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v12[0] = @"UserAssignedDeviceName";
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v12, 1);
    objc_copyWeak(&v9, &location);
    v2->_hostNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)CKDClientInfo;
  [(CKDClientInfo *)&v3 dealloc];
}

- (void)_refreshHostname
{
  objc_msgSend_willChangeValueForKey_(self, a2, @"hostname");
  objc_super v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = MGCopyAnswer();
  cachedHostname = v3->_cachedHostname;
  v3->_cachedHostname = (NSString *)v4;

  if ((unint64_t)objc_msgSend_maximumLengthOfBytesUsingEncoding_(v3->_cachedHostname, v6, 4) >= 0x3E9)
  {
    uint64_t v7 = 10;
    id v9 = (void *)MEMORY[0x1C8789E70]();
    while ((unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v3->_cachedHostname, v8, 4) >= 0x3E9)
    {
      uint64_t v11 = objc_msgSend_substringToIndex_(v3->_cachedHostname, v10, 1010 - v7);
      v12 = v3->_cachedHostname;
      v3->_cachedHostname = (NSString *)v11;

      v7 *= 2;
    }
  }
  objc_sync_exit(v3);

  MEMORY[0x1F4181798](v3, sel_didChangeValueForKey_, @"hostname");
}

- (NSString)hostname
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedHostname) {
    objc_msgSend__refreshHostname(v2, v3, v4);
  }
  objc_sync_exit(v2);

  cachedHostname = v2->_cachedHostname;
  return cachedHostname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostCallbackQueue, 0);
  objc_storeStrong((id *)&self->_cachedHostname, 0);
}

@end