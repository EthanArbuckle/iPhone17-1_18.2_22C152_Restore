@interface CKUserNotificationUtilities
+ (void)showUserNotification:(__CFUserNotification *)a3 withCompletionBlock:(id)a4;
@end

@implementation CKUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 withCompletionBlock:(id)a4
{
  id v7 = a4;
  v11 = v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)a1, @"CKUserNotificationUtilities.m", 52, @"Must have a notification");

    if (v11) {
      goto LABEL_3;
    }
  }
  v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)a1, @"CKUserNotificationUtilities.m", 53, @"Must have a block here");

LABEL_3:
  v12 = sub_18B008908((uint64_t)a3, v8, v9, v10);

  if (v12)
  {
    v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)a1, @"CKUserNotificationUtilities.m", 54, @"Already waiting on this notification %p", a3);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B00895C;
  aBlock[3] = &unk_1E54600B0;
  v32 = a3;
  id v16 = v11;
  id v31 = v16;
  v17 = (void (**)(void))_Block_copy(aBlock);
  if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v18, v19, v20))
  {
    v17[2](v17);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_18B008C90;
    block[3] = &unk_1E54600B0;
    v29 = a3;
    id v28 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

@end