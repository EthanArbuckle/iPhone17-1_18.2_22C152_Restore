@interface DUXPCServerRequestHandler
- (DUXPCServerRequestHandler)initWithManager:(id)a3;
- (NSString)clientProcessName;
- (_PASBundleIdResolver)bundleIdResolver;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 pid:(int)a4 completion:(id)a5;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)synchronousEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int)a5 completion:(id)a6;
@end

@implementation DUXPCServerRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_textUnderstandingManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)synchronousEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int)a5 completion:(id)a6
{
  id v10 = a6;
  textUnderstandingManager = self->_textUnderstandingManager;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_236970554;
  v14[3] = &unk_264CB4408;
  id v15 = v10;
  id v12 = v10;
  objc_msgSend_extractEventWithSerializedDocument_documentType_pid_completion_(textUnderstandingManager, v13, (uint64_t)a3, a4, a5, v14);
}

- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 pid:(int)a4 completion:(id)a5
{
  id v8 = a5;
  textUnderstandingManager = self->_textUnderstandingManager;
  v14 = objc_msgSend_lines(a3, v10, v11, v12, v13);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_236970770;
  v17[3] = &unk_264CB43E0;
  id v18 = v8;
  id v15 = v8;
  objc_msgSend_extractPersonalIDWithLines_pid_completion_(textUnderstandingManager, v16, (uint64_t)v14, a4, (uint64_t)v17);
}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (DUXPCServerRequestHandler)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUXPCServerRequestHandler;
  v6 = [(DUXPCServerRequestHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textUnderstandingManager, a3);
  }

  return v7;
}

@end