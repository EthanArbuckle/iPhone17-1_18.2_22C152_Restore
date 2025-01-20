@interface BCSActionPickerViewAssistant
- (BOOL)isShowingPicker;
- (BOOL)showActionPickerWithItems:(id)a3 fromViewController:(id)a4 presentingRect:(CGRect)a5;
- (id)actionPickerItemAlertController:(id)a3;
- (void)_cleanUpAlertController;
@end

@implementation BCSActionPickerViewAssistant

- (BOOL)isShowingPicker
{
  return self->_alertController != 0;
}

- (BOOL)showActionPickerWithItems:(id)a3 fromViewController:(id)a4 presentingRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v56 = a3;
  id v11 = a4;
  v12 = v11;
  if (v11)
  {
    v58 = self;
    v55 = v11;
    v13 = [v11 presentedViewController];

    if (v13)
    {
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v14) {
        -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      if (![(BCSActionPickerViewAssistant *)self isShowingPicker])
      {
        v40 = (UIAlertController *)objc_alloc_init((Class)getUIAlertControllerClass());
        alertController = self->_alertController;
        self->_alertController = v40;

        objc_initWeak(&location, self);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id obj = v56;
        uint64_t v42 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v66 != v43) {
                objc_enumerationMutation(obj);
              }
              v45 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              [v45 setActionPickerItemDelegate:v58];
              char v46 = [v45 shouldDismissAlertWhenActionIsTaken];
              v47 = v58->_alertController;
              v48 = [v45 label];
              v62[0] = MEMORY[0x263EF8330];
              v62[1] = 3221225472;
              v62[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke;
              v62[3] = &unk_26468AF70;
              v62[4] = v45;
              char v64 = v46;
              objc_copyWeak(&v63, &location);
              v61[0] = MEMORY[0x263EF8330];
              v61[1] = 3221225472;
              v61[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_2;
              v61[3] = &unk_26468AF98;
              v61[4] = v45;
              [(UIAlertController *)v47 _addActionWithTitle:v48 style:0 handler:v62 shouldDismissHandler:v61];

              objc_destroyWeak(&v63);
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
          }
          while (v42);
        }

        v49 = v58->_alertController;
        id UIAlertActionClass = getUIAlertActionClass();
        v51 = _BCSLocalizedString(@"Cancel", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_3;
        v59[3] = &unk_26468AFC0;
        objc_copyWeak(&v60, &location);
        v52 = [UIAlertActionClass actionWithTitle:v51 style:1 handler:v59];
        [(UIAlertController *)v49 addAction:v52];

        v53 = [(UIAlertController *)v58->_alertController popoverPresentationController];
        v54 = [v55 view];
        [v53 setSourceView:v54];

        objc_msgSend(v53, "setSourceRect:", x, y, width, height);
        [v55 presentViewController:v58->_alertController animated:1 completion:0];

        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
        BOOL v30 = 1;
        goto LABEL_12;
      }
      BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v31) {
        -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:](v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    BOOL v30 = 0;
LABEL_12:
    v12 = v55;
    goto LABEL_13;
  }
  BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v22) {
    -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:](v22, v23, v24, v25, v26, v27, v28, v29);
  }
  BOOL v30 = 0;
LABEL_13:

  return v30;
}

void __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performAction];
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _cleanUpAlertController];
  }
}

uint64_t __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldDismissAlertWhenActionIsTaken];
}

void __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanUpAlertController];
}

- (id)actionPickerItemAlertController:(id)a3
{
  return self->_alertController;
}

- (void)_cleanUpAlertController
{
  self->_alertController = 0;
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end