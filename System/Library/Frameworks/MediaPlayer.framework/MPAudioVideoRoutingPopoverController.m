@interface MPAudioVideoRoutingPopoverController
- (BOOL)mirroringOnly;
- (MPAudioVideoRoutingPopoverController)initWithContentViewController:(id)a3;
- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3;
- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3 includeMirroring:(BOOL)a4;
- (id)routingController;
- (void)dealloc;
- (void)routingViewController:(id)a3 didPickRoute:(id)a4;
- (void)routingViewControllerDidUpdateContents:(id)a3;
- (void)setMirroringOnly:(BOOL)a3;
@end

@implementation MPAudioVideoRoutingPopoverController

- (void).cxx_destruct
{
}

- (BOOL)mirroringOnly
{
  return self->_mirroringOnly;
}

- (void)routingViewControllerDidUpdateContents:(id)a3
{
  id v4 = [(MPAudioVideoRoutingPopoverController *)self contentViewController];
  [v4 preferredContentSize];
  -[MPAudioVideoRoutingPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1);
}

- (void)routingViewController:(id)a3 didPickRoute:(id)a4
{
  if (!self->_mirroringIncluded)
  {
    -[MPAudioVideoRoutingPopoverController dismissPopoverAnimated:](self, "dismissPopoverAnimated:", 1, a4);
    id v5 = [(MPAudioVideoRoutingPopoverController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 popoverControllerDidDismissPopover:self];
    }
  }
}

- (id)routingController
{
  return [(MPAVRoutingViewController *)self->_routingViewController _routingController];
}

- (void)setMirroringOnly:(BOOL)a3
{
  if (a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPAudioVideoRoutingPopoverController.m" lineNumber:101 description:@"Mirroring is no longer supported by MPAudioVideoRoutingPopoverController"];
  }
  self->_mirroringOnly = a3;
}

- (void)dealloc
{
  if (self->_airPlayPasswordAlertDidAppearTokenIsValid) {
    notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)MPAudioVideoRoutingPopoverController;
  [(MPAudioVideoRoutingPopoverController *)&v3 dealloc];
}

- (MPAudioVideoRoutingPopoverController)initWithContentViewController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPAudioVideoRoutingPopoverController;
  id v5 = [(MPAudioVideoRoutingPopoverController *)&v13 initWithContentViewController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__MPAudioVideoRoutingPopoverController_initWithContentViewController___block_invoke;
    v10[3] = &unk_1E57F6F90;
    objc_copyWeak(&v11, &location);
    uint32_t v8 = notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertWillAppear", &v5->_airPlayPasswordAlertDidAppearToken, v6, v10);

    v5->_airPlayPasswordAlertDidAppearTokenIsValid = v8 == 0;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __70__MPAudioVideoRoutingPopoverController_initWithContentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained dismissPopoverAnimated:1];
    v2 = [v3 delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 popoverControllerDidDismissPopover:v3];
    }

    id WeakRetained = v3;
  }
}

- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3 includeMirroring:(BOOL)a4
{
  if (a4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPAudioVideoRoutingPopoverController.m" lineNumber:46 description:@"Mirroring is no longer supported by MPAudioVideoRoutingPopoverController"];
  }
  id v7 = [[MPAVRoutingViewController alloc] initWithStyle:1];
  uint32_t v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [(MPAVRoutingViewController *)v7 _setTableCellsBackgroundColor:v8];

  [(MPAVRoutingViewController *)v7 setAVItemType:a3];
  [(MPAVRoutingViewController *)v7 setMirroringStyle:0];
  [(MPAVRoutingViewController *)v7 setDelegate:self];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  v15.receiver = self;
  v15.super_class = (Class)MPAudioVideoRoutingPopoverController;
  v10 = [(MPAudioVideoRoutingPopoverController *)&v15 initWithContentViewController:v9];
  id v11 = v10;
  if (v10)
  {
    v10->_mirroringIncluded = a4;
    objc_storeStrong((id *)&v10->_routingViewController, v7);
  }

  return v11;
}

- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3
{
  return [(MPAudioVideoRoutingPopoverController *)self initWithType:a3 includeMirroring:0];
}

@end