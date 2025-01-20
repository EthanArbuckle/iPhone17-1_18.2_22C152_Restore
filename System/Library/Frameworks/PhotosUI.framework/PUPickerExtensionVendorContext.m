@interface PUPickerExtensionVendorContext
- (_PUPickerExtensionContextVendorInterface)delegate;
- (void)_deselectAssetsWithIdentifiers:(id)a3;
- (void)_hostModalInPresentationDidChange:(BOOL)a3;
- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4;
- (void)_popViewControllerWithReply:(id)a3;
- (void)_scrollContentToInitialPosition;
- (void)_searchWithString:(id)a3;
- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4;
- (void)_updatePickerUsingUpdateConfiguration:(id)a3;
- (void)_updateSelectedAssetsWithIdentifiers:(id)a3;
- (void)_zoomInContent;
- (void)_zoomOutContent;
- (void)setDelegate:(id)a3;
@end

@implementation PUPickerExtensionVendorContext

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (_PUPickerExtensionContextVendorInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PUPickerExtensionContextVendorInterface *)WeakRetained;
}

- (void)_hostModalInPresentationDidChange:(BOOL)a3
{
}

void __68__PUPickerExtensionVendorContext__hostModalInPresentationDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _hostModalInPresentationDidChange:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_zoomOutContent
{
}

void __49__PUPickerExtensionVendorContext__zoomOutContent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 _zoomOutContent];
}

- (void)_zoomInContent
{
}

void __48__PUPickerExtensionVendorContext__zoomInContent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 _zoomInContent];
}

- (void)_scrollContentToInitialPosition
{
}

void __65__PUPickerExtensionVendorContext__scrollContentToInitialPosition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 _scrollContentToInitialPosition];
}

- (void)_popViewControllerWithReply:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v5 = [(PUPickerExtensionVendorContext *)self delegate];
    [v5 _popViewControllerWithReply:v4];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__PUPickerExtensionVendorContext__popViewControllerWithReply___block_invoke;
    v6[3] = &unk_2642C5640;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], v6);
  }
}

void __62__PUPickerExtensionVendorContext__popViewControllerWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _popViewControllerWithReply:*(void *)(a1 + 40)];
}

- (void)_searchWithString:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __52__PUPickerExtensionVendorContext__searchWithString___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _searchWithString:*(void *)(a1 + 40)];
}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __71__PUPickerExtensionVendorContext__updateSelectedAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _updateSelectedAssetsWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  PLDispatchOnMainQueue();
}

void __75__PUPickerExtensionVendorContext__moveAssetWithIdentifier_afterIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _moveAssetWithIdentifier:*(void *)(a1 + 40) afterIdentifier:*(void *)(a1 + 48)];
}

- (void)_deselectAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __65__PUPickerExtensionVendorContext__deselectAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _deselectAssetsWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __82__PUPickerExtensionVendorContext__stopActivityIndicatorsForAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _stopActivityIndicatorsForAssetsWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __83__PUPickerExtensionVendorContext__startActivityIndicatorsForAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _startActivityIndicatorsForAssetsWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)_updatePickerUsingUpdateConfiguration:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __72__PUPickerExtensionVendorContext__updatePickerUsingUpdateConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _updatePickerUsingUpdateConfiguration:*(void *)(a1 + 40)];
}

- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  PLDispatchOnMainQueue();
}

void __73__PUPickerExtensionVendorContext__updateConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _updateConfiguration:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

@end