@interface FAInviteInPersonActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (FAInviteInPersonActivity)init;
- (NSDictionary)response;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)activityCategory;
- (void)_handleRUIDismiss:(id)a3;
- (void)_notifyCompletionWithSuccess:(BOOL)a3 userInfo:(id)a4;
- (void)dealloc;
- (void)performActivity;
- (void)setPresentingViewController:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation FAInviteInPersonActivity

- (FAInviteInPersonActivity)init
{
  v5.receiver = self;
  v5.super_class = (Class)FAInviteInPersonActivity;
  v2 = [(UIActivity *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F087C8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleRUIDismiss_ name:*MEMORY[0x263F3BDD0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FAInviteInPersonActivity;
  [(FAInviteInPersonActivity *)&v4 dealloc];
}

- (id)activityType
{
  return @"FAInviteInPersonActivity";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INVITE_IN_PERSON" value:&stru_26CA2C800 table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)activityImage
{
  return (id)[MEMORY[0x263F827E8] systemImageNamed:@"person.crop.circle.badge.plus"];
}

- (int64_t)activityCategory
{
  return 0;
}

- (void)performActivity
{
  v3 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeAddMemberInline"];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = objc_alloc_init(FACircleStateController);
  [(id)v8[5] setPresentationType:1];
  objc_super v4 = [(FAInviteInPersonActivity *)self presentingViewController];
  [(id)v8[5] setPresenter:v4];

  objc_super v5 = (void *)v8[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__FAInviteInPersonActivity_performActivity__block_invoke;
  v6[3] = &unk_26434A118;
  v6[4] = self;
  v6[5] = &v7;
  [v5 performWithContext:v3 completion:v6];
  _Block_object_dispose(&v7, 8);
}

void __43__FAInviteInPersonActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __43__FAInviteInPersonActivity_performActivity__block_invoke_cold_1((uint64_t)v3, v6);
  }

  uint64_t v7 = [v3 userInfo];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 != 1)
  {
    v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v3 success];
    v14 = [v3 userInfo];
    [v12 _notifyCompletionWithSuccess:v13 userInfo:v14];
  }
}

- (void)_notifyCompletionWithSuccess:(BOOL)a3 userInfo:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__FAInviteInPersonActivity__notifyCompletionWithSuccess_userInfo___block_invoke;
  block[3] = &unk_26434A0C8;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__FAInviteInPersonActivity__notifyCompletionWithSuccess_userInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 activityDidFinish:v3];
}

- (void)_handleRUIDismiss:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"success"];

    if ([v8 length])
    {
      id v9 = _FALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FAInviteInPersonActivity _handleRUIDismiss:]((uint64_t)v8, v9);
      }

      uint64_t v10 = [v8 BOOLValue];
      uint64_t v11 = [v4 userInfo];
      [(FAInviteInPersonActivity *)self _notifyCompletionWithSuccess:v10 userInfo:v11];
    }
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

void __43__FAInviteInPersonActivity_performActivity__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "Finished FAInviteInPersonActivity %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleRUIDismiss:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "Server indicated success: %@", (uint8_t *)&v2, 0xCu);
}

@end