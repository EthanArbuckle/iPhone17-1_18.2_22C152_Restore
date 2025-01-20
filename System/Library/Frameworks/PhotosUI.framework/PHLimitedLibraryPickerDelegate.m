@interface PHLimitedLibraryPickerDelegate
- (PLAssetsdClient)assetsdClient;
- (id)dismissalBlock;
- (id)finishedPickingBlock;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAssetsdClient:(id)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setFinishedPickingBlock:(id)a3;
@end

@implementation PHLimitedLibraryPickerDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
  objc_storeStrong(&self->_finishedPickingBlock, 0);

  objc_storeStrong(&self->_dismissalBlock, 0);
}

- (void)setAssetsdClient:(id)a3
{
}

- (PLAssetsdClient)assetsdClient
{
  return self->_assetsdClient;
}

- (void)setFinishedPickingBlock:(id)a3
{
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_DEBUG, "[Limited Library Picker] picker: %@ didFinishPicking: %@", buf, 0x16u);
  }

  v9 = [(PHLimitedLibraryPickerDelegate *)self finishedPickingBlock];

  if (v9)
  {
    v10 = PFMap();
    v11 = [(PHLimitedLibraryPickerDelegate *)self finishedPickingBlock];
    v12 = (void *)[v10 copy];
    ((void (**)(void, void *))v11)[2](v11, v12);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke_2;
  v13[3] = &unk_2642C5618;
  v13[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v13];
}

void __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissalBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dismissalBlock];
    v3[2]();
  }
}

uint64_t __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_217C33000, v5, OS_LOG_TYPE_DEBUG, "[Limited Library Picker] presentationControllerDidDismiss: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(PHLimitedLibraryPickerDelegate *)self finishedPickingBlock];

  if (v6)
  {
    id v7 = [(PHLimitedLibraryPickerDelegate *)self finishedPickingBlock];
    v7[2](v7, MEMORY[0x263EFFA68]);
  }
  v8 = [(PHLimitedLibraryPickerDelegate *)self dismissalBlock];

  if (v8)
  {
    v9 = [(PHLimitedLibraryPickerDelegate *)self dismissalBlock];
    v9[2]();
  }
}

@end