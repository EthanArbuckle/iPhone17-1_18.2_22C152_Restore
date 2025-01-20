@interface PKPencilTouchDetection
- (PKPencilTouchDetection)init;
- (PKPencilTouchDetectionDelegate)delegate;
- (void)dealloc;
- (void)didUpdateWithUserInfo:(id)a3;
- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PKPencilTouchDetection

- (PKPencilTouchDetection)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPencilTouchDetection;
  v2 = [(PKPencilTouchDetection *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PKTouchDetectionUpdateCallback, @"com.apple.pencilkit.pktouchdetectionupdate", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.pencilkit.pktouchdetectionupdate", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKPencilTouchDetection;
  [(PKPencilTouchDetection *)&v4 dealloc];
}

- (void)didUpdateWithUserInfo:(id)a3
{
  id v14 = a3;
  objc_super v4 = [v14 objectForKey:@"com.apple.pencilkit.pktouchdetectionupdate.firstUse"];
  if (v4)
  {
    objc_super v5 = [(PKPencilTouchDetection *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [v4 integerValue];
      v8 = [(PKPencilTouchDetection *)self delegate];
      [v8 didDetectFirstUseForType:v7];
    }
  }
  v9 = [v14 objectForKey:@"com.apple.pencilkit.pktouchdetectionupdate.reactivation"];
  if (v9)
  {
    v10 = [(PKPencilTouchDetection *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [v9 integerValue];
      v13 = [(PKPencilTouchDetection *)self delegate];
      [v13 didDetectReactivationForType:v12];
    }
  }
}

- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.pencilkit.pktouchdetection" options:0];
    uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F205BBC8];
    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E64C77E0;
    id v8 = v5;
    id v16 = v8;
    id v9 = v6;
    id v15 = v9;
    v10 = [v9 remoteObjectProxyWithErrorHandler:v14];
    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke_64;
      v11[3] = &unk_1E64C6898;
      id v13 = v8;
      id v12 = v9;
      [v10 pencilType:a3 hasRecentlyBeenUsedWithCompletionHandler:v11];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
      [v9 invalidate];
    }
  }
}

void __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for touch detection: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke_64(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (PKPencilTouchDetectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPencilTouchDetectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end