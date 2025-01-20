@interface KCSharingGroupManager(AuthenticationServicesExtras)
- (void)as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler:()AuthenticationServicesExtras;
@end

@implementation KCSharingGroupManager(AuthenticationServicesExtras)

- (void)as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler:()AuthenticationServicesExtras
{
  id v3 = a3;
  v4 = dispatch_group_create();
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_alloc_init(MEMORY[0x263F3BF48]);
  dispatch_group_enter(v4);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke;
  v14[3] = &unk_264395D50;
  v15 = v4;
  id v7 = v5;
  id v16 = v7;
  v8 = v4;
  [v6 startRequestWithCompletionHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_22;
  v11[3] = &unk_264395D78;
  id v12 = v7;
  id v13 = v3;
  id v9 = v7;
  id v10 = v3;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], v11);
}

@end