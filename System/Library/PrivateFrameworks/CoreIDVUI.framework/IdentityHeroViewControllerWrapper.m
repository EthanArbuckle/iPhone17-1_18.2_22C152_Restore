@interface IdentityHeroViewControllerWrapper
- (IdentityHeroViewControllerWrapper)initWithImageData:(id)a3 title:(id)a4 subtitle:(id)a5 primaryButtonTitle:(id)a6 secondaryButtonTitle:(id)a7;
- (id)identityHeroViewController:(id)a3 secondaryButtonClicked:(id)a4;
@end

@implementation IdentityHeroViewControllerWrapper

- (IdentityHeroViewControllerWrapper)initWithImageData:(id)a3 title:(id)a4 subtitle:(id)a5 primaryButtonTitle:(id)a6 secondaryButtonTitle:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IdentityHeroViewControllerWrapper;
  v17 = [(IdentityHeroViewControllerWrapper *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageData, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v18->_subTitle, a5);
    objc_storeStrong((id *)&v18->_primaryButtonTitle, a6);
    objc_storeStrong((id *)&v18->_secondaryButtonTitle, a7);
  }

  return v18;
}

- (id)identityHeroViewController:(id)a3 secondaryButtonClicked:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v8 = (void *)getPKIdentityHeroViewControllerClass_softClass;
  uint64_t v28 = getPKIdentityHeroViewControllerClass_softClass;
  if (!getPKIdentityHeroViewControllerClass_softClass)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getPKIdentityHeroViewControllerClass_block_invoke;
    v23 = &unk_2645105B0;
    v24 = &v25;
    __getPKIdentityHeroViewControllerClass_block_invoke((uint64_t)&v20);
    v8 = (void *)v26[3];
  }
  v9 = v8;
  _Block_object_dispose(&v25, 8);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v10 = (void *)getPKIdentityHeroViewConfigurationClass_softClass;
  uint64_t v28 = getPKIdentityHeroViewConfigurationClass_softClass;
  if (!getPKIdentityHeroViewConfigurationClass_softClass)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getPKIdentityHeroViewConfigurationClass_block_invoke;
    v23 = &unk_2645105B0;
    v24 = &v25;
    __getPKIdentityHeroViewConfigurationClass_block_invoke((uint64_t)&v20);
    v10 = (void *)v26[3];
  }
  v11 = v10;
  _Block_object_dispose(&v25, 8);
  if (v9 && v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F5C018]) initWithIdentifier:@"AppleIdentityHeroViewImage" imageData:self->_imageData credentialType:129];
    id v13 = (void *)[[v11 alloc] initWithImage:v12 title:self->_title subtitle:self->_subTitle primaryButtonTitle:self->_primaryButtonTitle secondaryButtonTitle:self->_secondaryButtonTitle];
    id v14 = (void *)[[v9 alloc] initWithConfiguration:v13];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke;
    v18[3] = &unk_264510588;
    id v19 = v6;
    [v14 setPrimaryButtonClickedBlock:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke_2;
    v16[3] = &unk_264510588;
    id v17 = v7;
    [v14 setSecondaryButtonClickedBlock:v16];
  }
  else
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F82E10]) initWithNibName:0 bundle:0];
  }

  return v14;
}

uint64_t __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end