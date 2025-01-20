@interface CKDPrivacyManager
+ (id)sharedManager;
- (CKDPrivacyManager)init;
- (NSMutableSet)operations;
- (OS_dispatch_queue)privacyManagerQueue;
- (id)initInternal;
- (void)_resetPrivacySettingsForAppContainerAccountTuple:(id)a3 completionHandler:(id)a4;
- (void)resetPrivacySettingsWithCompletionHandler:(id)a3;
- (void)setOperations:(id)a3;
- (void)setPrivacyManagerQueue:(id)a3;
@end

@implementation CKDPrivacyManager

+ (id)sharedManager
{
  if (qword_1EBBCFBD8 != -1) {
    dispatch_once(&qword_1EBBCFBD8, &unk_1F2042EB0);
  }
  v2 = (void *)qword_1EBBCFBD0;
  return v2;
}

- (CKDPrivacyManager)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v4 = (id)objc_msgSend_initWithCode_format_(v2, v3, 12, @"Use +[CKDPrivacyManager sharedManager] instead");
  objc_exception_throw(v4);
}

- (id)initInternal
{
  v10.receiver = self;
  v10.super_class = (Class)CKDPrivacyManager;
  id v2 = [(CKDPrivacyManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cloudkit.privacyManagerQueue", v4);
    privacyManagerQueue = v2->_privacyManagerQueue;
    v2->_privacyManagerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableSet *)v7;
  }
  return v2;
}

- (void)resetPrivacySettingsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v8 = objc_msgSend_privacyManagerQueue(self, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DAB514;
  block[3] = &unk_1E64F1970;
  id v11 = v5;
  SEL v12 = a2;
  block[4] = self;
  id v9 = v5;
  dispatch_async(v8, block);
}

- (void)_resetPrivacySettingsForAppContainerAccountTuple:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v10 = objc_msgSend_privacyManagerQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DABD14;
  block[3] = &unk_1E64F0FA0;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (OS_dispatch_queue)privacyManagerQueue
{
  return self->_privacyManagerQueue;
}

- (void)setPrivacyManagerQueue:(id)a3
{
}

- (NSMutableSet)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_privacyManagerQueue, 0);
}

@end