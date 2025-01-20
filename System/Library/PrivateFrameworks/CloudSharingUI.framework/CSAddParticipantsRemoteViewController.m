@interface CSAddParticipantsRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (CSAddParticipantsPublicController)publicController;
- (void)dismissViewControllerWithError:(id)a3 shareURL:(id)a4 ckShare:(id)a5;
- (void)setPublicController:(id)a3;
- (void)showContactPickerFromSourceRect:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation CSAddParticipantsRemoteViewController

+ (id)serviceViewControllerInterface
{
  v31[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C931AE0];
  v3 = (void *)MEMORY[0x263EFFA08];
  v31[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_setShare_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v30 = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_setCollaborationOptionsGroups_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v29 = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_setAddressingViewModel_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_setFileURL_ argumentIndex:0 ofReply:0];

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = objc_opt_class();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v17 = [v15 setWithArray:v16];
  [v2 setClasses:v17 forSelector:sel_setContainerSetupInfo_ argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v20 = [v18 setWithArray:v19];
  [v2 setClasses:v20 forSelector:sel_userDidSelectContact_contactProperty_ argumentIndex:0 ofReply:0];

  v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = objc_opt_class();
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v23 = [v21 setWithArray:v22];
  [v2 setClasses:v23 forSelector:sel_userDidSelectContact_contactProperty_ argumentIndex:1 ofReply:0];

  return v2;
}

+ (id)exportedInterface
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9227F8];
  v3 = CKErrorUserInfoClasses();
  v4 = (void *)MEMORY[0x263EFFA08];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v6 = [v4 setWithArray:v5];
  v7 = [v3 setByAddingObjectsFromSet:v6];
  [v2 setClasses:v7 forSelector:sel_dismissViewControllerWithError_shareURL_ckShare_ argumentIndex:0 ofReply:0];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v10 = [v8 setWithArray:v9];
  [v2 setClasses:v10 forSelector:sel_showContactPickerFromSourceRect_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = CSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CSAddParticipantsRemoteViewController viewServiceDidTerminateWithError:]((uint64_t)v4, v5);
  }

  [(CSAddParticipantsRemoteViewController *)self dismissViewControllerWithError:v4 shareURL:0 ckShare:0];
  v6.receiver = self;
  v6.super_class = (Class)CSAddParticipantsRemoteViewController;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
}

- (void)dismissViewControllerWithError:(id)a3 shareURL:(id)a4 ckShare:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSAddParticipantsRemoteViewController *)self publicController];
  [v11 dismissViewControllerWithError:v10 shareURL:v9 ckShare:v8];
}

- (void)showContactPickerFromSourceRect:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAddParticipantsRemoteViewController *)self publicController];
  [v5 showContactPickerFromSourceRect:v4];
}

- (CSAddParticipantsPublicController)publicController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicController);

  return (CSAddParticipantsPublicController *)WeakRetained;
}

- (void)setPublicController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21809D000, a2, OS_LOG_TYPE_ERROR, "CSAddParticipantsRemoteViewController view service did terminate with error: %@", (uint8_t *)&v2, 0xCu);
}

@end