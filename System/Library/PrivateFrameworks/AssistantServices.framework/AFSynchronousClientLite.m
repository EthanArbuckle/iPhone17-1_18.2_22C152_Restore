@interface AFSynchronousClientLite
- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7;
@end

@implementation AFSynchronousClientLite

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__AFSynchronousClientLite__handleCommand_afterCurrentRequest_isOneWay_commandHandler_completion___block_invoke;
  v19[3] = &unk_1E59288F0;
  v20 = v15;
  id v21 = v12;
  v18.receiver = self;
  v18.super_class = (Class)AFSynchronousClientLite;
  v16 = v15;
  id v17 = v12;
  [(AFClientLite *)&v18 _handleCommand:v14 afterCurrentRequest:v9 isOneWay:v8 commandHandler:v13 completion:v19];

  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

void __97__AFSynchronousClientLite__handleCommand_afterCurrentRequest_isOneWay_commandHandler_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v2);
}

@end