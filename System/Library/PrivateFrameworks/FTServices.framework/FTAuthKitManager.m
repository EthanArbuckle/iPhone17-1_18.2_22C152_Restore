@interface FTAuthKitManager
+ (id)sharedInstance;
- (FTAuthKitManager)init;
- (void)anisetteHeadersForRequest:(id)a3 completionBlockQueue:(id)a4 completionBlock:(id)a5;
- (void)handleResponse:(id)a3 forRequest:(id)a4 completionBlock:(id)a5;
@end

@implementation FTAuthKitManager

+ (id)sharedInstance
{
  if (qword_1EB47C8B0 != -1) {
    dispatch_once(&qword_1EB47C8B0, &unk_1EFE07900);
  }
  v2 = (void *)qword_1EB47C868;

  return v2;
}

- (FTAuthKitManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)FTAuthKitManager;
  v2 = [(FTAuthKitManager *)&v12 init];
  if (v2)
  {
    qword_1EB47C700 = MEMORY[0x1AD0D4F50](@"AKAppleIDSession", @"AuthKit");
    id v3 = objc_alloc((Class)qword_1EB47C700);
    v4 = IMGetMainBundleIdentifier();
    uint64_t v6 = objc_msgSend_initWithIdentifier_(v3, v5, (uint64_t)v4);
    akAppleIDSession = v2->_akAppleIDSession;
    v2->_akAppleIDSession = (AKAppleIDSession *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ids.ftauthkitmanager", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)anisetteHeadersForRequest:(id)a3 completionBlockQueue:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_super v12 = objc_msgSend_copy(a3, v9, v10);
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1A7BD7DCC;
    v15[3] = &unk_1E5D1AF88;
    v15[4] = self;
    id v16 = v12;
    id v17 = v8;
    id v18 = v11;
    id v14 = v12;
    dispatch_async(queue, v15);
  }
}

- (void)handleResponse:(id)a3 forRequest:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A7BD813C;
    v12[3] = &unk_1E5D1AF88;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(queue, v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_akAppleIDSession, 0);
}

@end