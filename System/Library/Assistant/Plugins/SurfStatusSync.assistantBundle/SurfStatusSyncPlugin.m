@interface SurfStatusSyncPlugin
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
@end

@implementation SurfStatusSyncPlugin

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_2371D4584;
  v23 = sub_2371D4594;
  id v24 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = objc_alloc_init(MEMORY[0x263F5C168]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = sub_2371D459C;
  v16 = &unk_264CCC758;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  [v8 registrationStatusWithCompletion:&v13];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v9, v10);
  if (v20[5])
  {
    if (objc_msgSend(v5, "isEqualToString:", v13, v14, v15, v16))
    {
      [v6 setPostAnchor:v5];
      [v6 setObject:0];
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x263F64E50]);
      v12 = [NSURL URLWithString:@"SurfStatusIdentifier"];
      [v11 setIdentifier:v12];

      [v11 setCurrentState:v20[5]];
      [v6 setObject:v11];
      [v6 setPostAnchor:v20[5]];
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:", v13, v14, v15, v16);
    [v6 setPostAnchor:v5];
  }
  [v6 setIsDelete:0];

  _Block_object_dispose(&v19, 8);
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v7 = a6;
  if (([a4 isEqualToString:@"SurfStatusValidity"] & 1) == 0) {
    [v7 resetWithValidity:@"SurfStatusValidity"];
  }
}

@end