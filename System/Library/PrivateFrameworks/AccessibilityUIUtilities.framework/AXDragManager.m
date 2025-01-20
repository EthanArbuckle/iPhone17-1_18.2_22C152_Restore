@interface AXDragManager
- (AXDispatchTimer)dragStartTimer;
- (AXDragManager)initWithMachServiceName:(id)a3;
- (AXDragManagerDelegate)delegate;
- (AXDragSession)dragSession;
- (BOOL)_shouldAllowEndpointVendForRequestingConnection:(id)a3;
- (BOOL)isDragActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)machServiceName;
- (id)dragStartCompletionHandler;
- (id)endpointForRequestingConnection:(id)a3 fromEndpointVendor:(id)a4;
- (int)pidForDrag;
- (void)cancelDrag;
- (void)dragSession:(id)a3 movedToPoint:(CGPoint)a4 byRequestor:(id)a5;
- (void)dragSessionChanged:(id)a3 toStatus:(id)a4;
- (void)dragSessionEnded:(id)a3 withOperation:(unint64_t)a4;
- (void)dragSessionWasTerminated:(id)a3;
- (void)drop;
- (void)moveToAndDropAtPoint:(CGPoint)a3;
- (void)moveToPoint:(CGPoint)a3;
- (void)sessionWasTerminated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setDragStartCompletionHandler:(id)a3;
- (void)setDragStartTimer:(id)a3;
- (void)setPidForDrag:(int)a3;
- (void)waitForDragStartFromPid:(int)a3 completionHandler:(id)a4;
@end

@implementation AXDragManager

- (AXDragManager)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXDragManager;
  v5 = [(AXDragManager *)&v19 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v4];
    v7 = [[AXDragEndpointVendor alloc] initWithXPCListener:v6];
    vendor = v5->_vendor;
    v5->_vendor = v7;

    [(AXDragEndpointVendor *)v5->_vendor setDelegate:v5];
    uint64_t v9 = [MEMORY[0x1E4F29290] anonymousListener];
    endpointListener = v5->_endpointListener;
    v5->_endpointListener = (NSXPCListener *)v9;

    [(NSXPCListener *)v5->_endpointListener setDelegate:v5];
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    activeSessions = v5->_activeSessions;
    v5->_activeSessions = (NSMutableArray *)v11;

    id v13 = [v4 stringByAppendingFormat:@"-DragStateQueue"];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    dragStateQueue = v5->_dragStateQueue;
    v5->_dragStateQueue = (OS_dispatch_queue *)v14;

    v5->_pidForDrag = -1;
    [(AXDragEndpointVendor *)v5->_vendor resume];
    [(NSXPCListener *)v5->_endpointListener resume];
    uint64_t v16 = [v4 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v16;
  }
  return v5;
}

- (void)sessionWasTerminated:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = AXLogDragging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXDragManager listener:shouldAcceptNewConnection:](v5);
  }

  v7 = [v5 valueForEntitlement:@"com.apple.backboardd.detachTouches"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue])
  {
    v8 = [[AXDragSession alloc] initWithDruidConnection:v5];
    [(AXDragSession *)v8 setManager:self];
    [(NSMutableArray *)self->_activeSessions addObject:v8];
    dragStateQueue = self->_dragStateQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E649BF98;
    v13[4] = self;
    dispatch_queue_t v14 = v8;
    v10 = v8;
    dispatch_async(dragStateQueue, v13);

    BOOL v11 = 1;
  }
  else
  {
    v10 = AXLogDragging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = [v5 processIdentifier];
      _os_log_impl(&dword_1C39D1000, v10, OS_LOG_TYPE_DEFAULT, "Process %d, you are not druid. Go away.", buf, 8u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) pidForDrag];
  id v4 = AXLogDragging();
  id v5 = v4;
  if (v3 == -1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) abort];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_2(v2);
    }

    [*(id *)(a1 + 32) setPidForDrag:0xFFFFFFFFLL];
    uint64_t v6 = [*(id *)(a1 + 32) dragStartTimer];
    [(id)v6 cancel];

    [*(id *)(a1 + 32) setDragSession:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) resume];
    v7 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if (v6)
    {
      v8 = [*v2 delegate];
      [v8 didStartDragForDragManager:*v2];
    }
    uint64_t v9 = [*v2 dragStartCompletionHandler];

    if (v9)
    {
      v10 = [*v2 dragStartCompletionHandler];
      v10[2](v10, 1);
    }
  }
  return [*v2 setDragStartCompletionHandler:0];
}

- (BOOL)_shouldAllowEndpointVendForRequestingConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke;
  block[3] = &unk_1E649C008;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(dragStateQueue, block);
  LOBYTE(dragStateQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dragStateQueue;
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) pidForDrag];
  id v4 = (id *)(a1 + 40);
  if (v3 == [*(id *)(a1 + 40) processIdentifier])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v5 = AXLogDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_1(v2);
    }
  }
  else
  {
    id v5 = AXLogDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_2(v4, v2, v5);
    }
  }
}

- (id)endpointForRequestingConnection:(id)a3 fromEndpointVendor:(id)a4
{
  id v5 = a3;
  id v6 = AXLogDragging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXDragManager endpointForRequestingConnection:fromEndpointVendor:](v5);
  }

  if ([(AXDragManager *)self _shouldAllowEndpointVendForRequestingConnection:v5])
  {
    v7 = [(NSXPCListener *)self->_endpointListener endpoint];
  }
  else
  {
    v8 = AXLogDragging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXDragManager endpointForRequestingConnection:fromEndpointVendor:](v5, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (void)waitForDragStartFromPid:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = AXLogDragging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXDragManager waitForDragStartFromPid:completionHandler:]();
  }

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke;
  block[3] = &unk_1E649C030;
  int v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(dragStateQueue, block);
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPidForDrag:*(unsigned int *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) dragStartCompletionHandler];

  if (v2)
  {
    int v3 = AXLogDragging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_cold_1();
    }

    id v4 = [*(id *)(a1 + 32) dragStartCompletionHandler];
    v4[2](v4, 0);
  }
  [*(id *)(a1 + 32) setDragStartCompletionHandler:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) dragStartTimer];

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F48318]) initWithTargetSerialQueue:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(a1 + 32) setDragStartTimer:v6];
  }
  v7 = [*(id *)(a1 + 32) dragStartTimer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_279;
  v8[3] = &unk_1E649BED8;
  v8[4] = *(void *)(a1 + 32);
  [v7 afterDelay:v8 processBlock:5.0];
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_279(uint64_t a1)
{
  v2 = AXLogDragging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_279_cold_1();
  }

  [*(id *)(a1 + 32) setPidForDrag:0xFFFFFFFFLL];
  int v3 = [*(id *)(a1 + 32) dragStartCompletionHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) dragStartCompletionHandler];
    v4[2](v4, 0);
  }
}

- (void)setDragSession:(id)a3
{
  id v5 = (AXDragSession *)a3;
  dragSession = self->_dragSession;
  p_dragSession = &self->_dragSession;
  id v6 = dragSession;
  if (dragSession != v5)
  {
    [(AXDragSession *)v6 cancel];
    objc_storeStrong((id *)p_dragSession, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)isDragActive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dragStateQueue = self->_dragStateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AXDragManager_isDragActive__block_invoke;
  v5[3] = &unk_1E649C058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dragStateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__AXDragManager_isDragActive__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dragSession];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)cancelDrag
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1C39D1000, v0, v1, "Cancel drag", v2, v3, v4, v5, v6);
}

void __27__AXDragManager_cancelDrag__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dragSession];
  [v1 cancel];
}

- (void)moveToPoint:(CGPoint)a3
{
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__AXDragManager_moveToPoint___block_invoke;
  block[3] = &unk_1E649C0A8;
  block[4] = self;
  CGPoint v5 = a3;
  dispatch_async(dragStateQueue, block);
}

void __29__AXDragManager_moveToPoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragSession];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AXDragManager_moveToPoint___block_invoke_2;
  v6[3] = &unk_1E649C080;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = v2;
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  id v5 = v2;
  objc_msgSend(v5, "moveToPoint:forRequestor:completion:", 0, v6, v3, v4);
}

void __29__AXDragManager_moveToPoint___block_invoke_2(uint64_t a1, int a2)
{
  double v4 = AXLogDragging();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __29__AXDragManager_moveToPoint___block_invoke_2_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __29__AXDragManager_moveToPoint___block_invoke_2_cold_2();
  }
}

- (void)drop
{
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__AXDragManager_drop__block_invoke;
  block[3] = &unk_1E649BED8;
  block[4] = self;
  dispatch_async(dragStateQueue, block);
}

void __21__AXDragManager_drop__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dragSession];
  [v1 drop];

  uint64_t v2 = AXLogDragging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __21__AXDragManager_drop__block_invoke_cold_1();
  }
}

- (void)moveToAndDropAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint8_t v6 = AXLogDragging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXDragManager moveToAndDropAtPoint:](x, y);
  }

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke;
  block[3] = &unk_1E649C0A8;
  block[4] = self;
  *(double *)&void block[5] = x;
  *(double *)&block[6] = y;
  dispatch_async(dragStateQueue, block);
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragSession];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2;
  v6[3] = &unk_1E649C0D0;
  long long v8 = *(_OWORD *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  id v5 = v2;
  objc_msgSend(v5, "moveToPoint:forRequestor:completion:", 0, v6, v3, v4);
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2(uint64_t a1, int a2)
{
  double v4 = AXLogDragging();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_1((CGPoint *)a1);
    }

    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke_281;
    block[3] = &unk_1E649BED8;
    char v9 = *(id *)(a1 + 40);
    dispatch_after(v6, v7, block);
    id v5 = v9;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_2();
  }
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_281(uint64_t a1)
{
  [*(id *)(a1 + 32) drop];
  id v1 = AXLogDragging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __21__AXDragManager_drop__block_invoke_cold_1();
  }
}

- (void)dragSession:(id)a3 movedToPoint:(CGPoint)a4 byRequestor:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = a3;
  dragStateQueue = self->_dragStateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke;
  v11[3] = &unk_1E649C0F8;
  id v12 = v8;
  uint64_t v13 = self;
  CGFloat v14 = x;
  CGFloat v15 = y;
  id v10 = v8;
  dispatch_async(dragStateQueue, v11);
}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) dragSession];

  double v4 = AXLogDragging();
  id v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_1((CGPoint *)a1);
  }

  dispatch_time_t v6 = [*(id *)(a1 + 40) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    objc_msgSend(v5, "dragManager:didMoveDragToPoint:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
LABEL_8:
  }
}

- (void)dragSessionChanged:(id)a3 toStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AXDragManager_dragSessionChanged_toStatus___block_invoke;
  block[3] = &unk_1E649C120;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dragStateQueue, block);
}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) dragSession];

  double v4 = AXLogDragging();
  id v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_1();
  }

  id v6 = [*(id *)(a1 + 40) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 dragManager:*(void *)(a1 + 40) didChangeDragToStatus:*(void *)(a1 + 48)];
LABEL_8:
  }
}

- (void)dragSessionEnded:(id)a3 withOperation:(unint64_t)a4
{
  id v6 = a3;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AXDragManager_dragSessionEnded_withOperation___block_invoke;
  block[3] = &unk_1E649C148;
  id v10 = v6;
  id v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_async(dragStateQueue, block);
}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) dragSession];

  double v4 = AXLogDragging();
  id v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_1();
  }

  id v6 = [*(id *)(a1 + 40) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 dragManager:*(void *)(a1 + 40) didEndDragOperation:*(void *)(a1 + 48)];
LABEL_8:
  }
}

- (void)dragSessionWasTerminated:(id)a3
{
  id v4 = a3;
  dragStateQueue = self->_dragStateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AXDragManager_dragSessionWasTerminated___block_invoke;
  v7[3] = &unk_1E649BF98;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dragStateQueue, v7);
}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) dragSession];

  id v4 = AXLogDragging();
  id v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_1();
  }

  [*(id *)(a1 + 40) setDragSession:0];
  id v6 = [*(id *)(a1 + 40) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 didTerminateDragForDragManager:*(void *)(a1 + 40)];
LABEL_8:
  }
}

- (AXDragManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXDragManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (int)pidForDrag
{
  return self->_pidForDrag;
}

- (void)setPidForDrag:(int)a3
{
  self->_pidForDrag = a3;
}

- (id)dragStartCompletionHandler
{
  return self->_dragStartCompletionHandler;
}

- (void)setDragStartCompletionHandler:(id)a3
{
}

- (AXDispatchTimer)dragStartTimer
{
  return self->_dragStartTimer;
}

- (void)setDragStartTimer:(id)a3
{
}

- (AXDragSession)dragSession
{
  return self->_dragSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_dragStartTimer, 0);
  objc_storeStrong(&self->_dragStartCompletionHandler, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragStateQueue, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_endpointListener, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1C39D1000, v1, v2, "Got a proposed connection from pid %d", v3, v4, v5, v6, v7);
}

void __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1C39D1000, v0, v1, "Drag session became ready, but we hadn't tried to start a drag.", v2, v3, v4, v5, v6);
}

void __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_2(id *a1)
{
  [*a1 pidForDrag];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1C39D1000, v1, v2, "Drag session ready for pid: %i", v3, v4, v5, v6, v7);
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_1(id *a1)
{
  [*a1 pidForDrag];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1C39D1000, v1, v2, "Received endpoint request from connection with pid: %i", v3, v4, v5, v6, v7);
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_2(id *a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [*a1 processIdentifier];
  int v6 = [*a2 pidForDrag];
  v7[0] = 67109376;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_error_impl(&dword_1C39D1000, a3, OS_LOG_TYPE_ERROR, "Unexpectedly received endpoint request from connection with pid: %i. Expected pid: %i", (uint8_t *)v7, 0xEu);
}

- (void)endpointForRequestingConnection:(void *)a1 fromEndpointVendor:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 processIdentifier];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_ERROR, "Not giving app with pid %d a drag endpoint.", v3, 8u);
}

- (void)endpointForRequestingConnection:(void *)a1 fromEndpointVendor:.cold.2(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1C39D1000, v1, v2, "app with pid %d is asking for a drag endpoint", v3, v4, v5, v6, v7);
}

- (void)waitForDragStartFromPid:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_DEBUG, "Wait for drag start from pid: %i", v1, 8u);
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1C39D1000, v0, v1, "Had a drag start completion handler that did not get called before next attempt to wait for a drag start", v2, v3, v4, v5, v6);
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_279_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1C39D1000, v0, v1, "Unable to start drag within allowed time.", v2, v3, v4, v5, v6);
}

void __29__AXDragManager_moveToPoint___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Moved to %@", v4, v5, v6, v7, v8);
}

void __29__AXDragManager_moveToPoint___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Unable to move for session %@", v2, v3, v4, v5, v6);
}

void __21__AXDragManager_drop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1C39D1000, v0, v1, "Dropped dragged item", v2, v3, v4, v5, v6);
}

- (void)moveToAndDropAtPoint:(double)a1 .cold.1(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v3, v4, "Move to %@", v5, v6, v7, v8, v9);
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_1(CGPoint *a1)
{
  uint64_t v1 = NSStringFromCGPoint(a1[3]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Moved to %@", v4, v5, v6, v7, v8);
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Unable to move for session %@", v2, v3, v4, v5, v6);
}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_1(CGPoint *a1)
{
  uint64_t v1 = NSStringFromCGPoint(a1[3]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Drag moved to %@", v4, v5, v6, v7, v8);
}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Received moved to point callback from unknown drag session: %@", v2, v3, v4, v5, v6);
}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_DEBUG, "Drag status changed to %@", v1, 0xCu);
}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Received changed callback from unknown drag session: %@", v2, v3, v4, v5, v6);
}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_DEBUG, "Drag session ended with operation %lu", v1, 0xCu);
}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Received session ended callback from unknown drag session: %@", v2, v3, v4, v5, v6);
}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1C39D1000, v0, v1, "Drag session was terminated", v2, v3, v4, v5, v6);
}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Received terminated callback from unknown drag session: %@", v2, v3, v4, v5, v6);
}

@end