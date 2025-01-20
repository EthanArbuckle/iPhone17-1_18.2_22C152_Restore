@interface SGSuggestionPresenter
+ (id)formatList:(id)a3;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)wantsToShowBanner;
- (NSArray)suggestions;
- (SGBannerProtocol)banner;
- (SGSuggestionPresenter)init;
- (SGSuggestionPresenterDelegate)delegate;
- (id)_presentedControllerCancelButtonItem;
- (id)_presentedControllerDoneButtonItem;
- (id)_presentingViewController;
- (id)_sortSuggestionByCategoryUsing:(id)a3;
- (id)_viewControllerForPresentingFromBanner;
- (id)formatMixedCategoriesSubtitle:(id)a3;
- (id)formatMixedCategoriesTitle:(id)a3;
- (id)icsPreviewControllerForData:(id)a3 andEventStore:(id)a4;
- (id)suggestionStore;
- (id)tableViewController;
- (int64_t)_bannerAccessoryType;
- (int64_t)suggestionsUIContext;
- (void)_bannerDismiss;
- (void)_bannerPrimaryAction;
- (void)_dismissPresentedViewController:(id)a3;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_filterSuggestions;
- (void)_listDidChangeNotification:(id)a3;
- (void)_presentModalViewController:(id)a3 fromSourceView:(id)a4;
- (void)_presentModalViewControllerFromButton:(id)a3;
- (void)_removeBanner;
- (void)_restoreSuggestions;
- (void)_updateBanner;
- (void)addSuggestion:(id)a3;
- (void)dealloc;
- (void)dismissAllSuggestions;
- (void)dismissICSPreviewController:(id)a3;
- (void)dismissViewController:(id)a3;
- (void)presentViewController:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)reloadSuggestionsFromSearchableItems;
- (void)removeSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setWantsToShowBanner:(BOOL)a3;
- (void)suggestion:(id)a3 actionFinished:(BOOL)a4;
- (void)suggestionBatchDismissal;
- (void)suggestionWasUpdated:(id)a3;
@end

@implementation SGSuggestionPresenter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_icsPreviewController, 0);
  objc_storeStrong((id *)&self->_suggestionCategoryList, 0);
  objc_storeStrong((id *)&self->_filteredSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionStore, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_bannerDismissAction, 0);
  objc_storeStrong((id *)&self->_bannerPrimaryAction, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

- (BOOL)wantsToShowBanner
{
  return self->_wantsToShowBanner;
}

- (SGSuggestionPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SGSuggestionPresenterDelegate *)WeakRetained;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v8 = a3;
  v4 = [(SGSuggestionPresenter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SGSuggestionPresenter *)self delegate];
    v7 = [v8 presentedViewController];
    [v6 suggestionPresenter:self didDismissViewController:v7];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  char v5 = [(SGSuggestionPresenter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SGSuggestionPresenter *)self delegate];
    id v8 = [v4 presentedViewController];
    [v7 suggestionPresenter:self willDismissViewController:v8];
  }
  return 1;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v10 = [a3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v10 topViewController];

    id v10 = (id)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4 == -1 || a4 == 7)
    {
      id v8 = [v10 navigationItem];
      [v8 setRightBarButtonItem:0];
    }
    else
    {
      id v8 = [(SGSuggestionPresenter *)self _presentedControllerDoneButtonItem];
      v9 = [v10 navigationItem];
      [v9 setRightBarButtonItem:v8];
    }
  }
}

- (void)_dismissPresentedViewController:(id)a3
{
}

- (id)_presentedControllerCancelButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismissPresentedViewController_];
  return v2;
}

- (id)_presentedControllerDoneButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissPresentedViewController_];
  return v2;
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(UIViewController *)self->_presentedViewController presentingViewController];
  if (v5)
  {
    char v6 = [(SGSuggestionPresenter *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(SGSuggestionPresenter *)self delegate];
      [v8 suggestionPresenter:self willDismissViewController:self->_presentedViewController];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__SGSuggestionPresenter__dismissViewControllerAnimated___block_invoke;
    v9[3] = &unk_1E612E7E8;
    v9[4] = self;
    [v5 dismissViewControllerAnimated:v3 completion:v9];
  }
}

void __56__SGSuggestionPresenter__dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 suggestionPresenter:*(void *)(a1 + 32) didDismissViewController:*(void *)(*(void *)(a1 + 32) + 32)];
  }
}

- (void)_presentModalViewController:(id)a3 fromSourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
    }
    else
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
      v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      id v10 = [v8 view];
      [v10 setBackgroundColor:v9];

      Class v11 = NSClassFromString(&cfstr_Remremindercre.isa);
      Class v12 = NSClassFromString(&cfstr_Pkaddpassesvie.isa);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      if (v11 && (objc_opt_isKindOfClass() & 1) != 0
        || v12 && (objc_opt_isKindOfClass() & 1) != 0
        || [v14 containsString:@"SwiftUI"]
        && [v14 containsString:@"FinanceKitUI"]
        && [v14 containsString:@"OrderImportPreview"])
      {
        [v8 setNavigationBarHidden:1];
      }

      id v6 = v8;
    }
    [v8 setModalPresentationStyle:7];
  }
  objc_storeStrong((id *)&self->_presentedViewController, v6);
  v15 = [v6 popoverPresentationController];
  [v15 setDelegate:self];
  if (!v7)
  {
    id v7 = [(SGSuggestionPresenter *)self banner];
  }
  [v15 setSourceView:v7];
  v16 = [(SGSuggestionPresenter *)self banner];
  [v16 popoverSourceRect];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  [v7 actionButtonLeadingEdgeOffset];
  objc_msgSend(v15, "setSourceRect:", v20 - v23, v18, v20, v22);
  v24 = [(SGSuggestionPresenter *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    v26 = [(SGSuggestionPresenter *)self delegate];
    [v26 suggestionPresenter:self willPresentViewController:v6];
  }
  v27 = [(SGSuggestionPresenter *)self _presentingViewController];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__SGSuggestionPresenter__presentModalViewController_fromSourceView___block_invoke;
  v29[3] = &unk_1E612E798;
  v29[4] = self;
  id v30 = v6;
  id v28 = v6;
  [v27 presentViewController:v28 animated:1 completion:v29];
}

void __68__SGSuggestionPresenter__presentModalViewController_fromSourceView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 suggestionPresenter:*(void *)(a1 + 32) didPresentViewController:*(void *)(a1 + 40)];
  }
}

- (void)_presentModalViewControllerFromButton:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionPresenter *)self banner];
  [(SGSuggestionPresenter *)self _presentModalViewController:v4 fromSourceView:v5];
}

- (id)_presentingViewController
{
  char v3 = [(SGSuggestionPresenter *)self delegate];
  id v4 = [v3 viewControllerForPresentingFromBannerByPresenter:self];

  return v4;
}

- (id)_viewControllerForPresentingFromBanner
{
  char v3 = [(SGSuggestionPresenter *)self delegate];
  id v4 = [v3 viewControllerForPresentingFromBannerByPresenter:self];

  return v4;
}

- (int64_t)suggestionsUIContext
{
  return _currentContext;
}

- (void)suggestionWasUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SGSuggestionPresenter_suggestionWasUpdated___block_invoke;
  v6[3] = &unk_1E612E798;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  runOnMainThread(v6);
}

uint64_t __46__SGSuggestionPresenter_suggestionWasUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) updateSuggestion:*(void *)(a1 + 40)];
}

- (void)suggestion:(id)a3 actionFinished:(BOOL)a4
{
  if (a4) {
    [(SGSuggestionPresenter *)self removeSuggestion:a3];
  }
}

- (void)dismissViewController:(id)a3
{
  if (_suggestionViewControllerPresenter) {
    [(id)_suggestionViewControllerPresenter dismissViewController:a3];
  }
  else {
    [(SGSuggestionPresenter *)self _dismissViewControllerAnimated:1];
  }
}

- (void)dismissICSPreviewController:(id)a3
{
  icsPreviewController = self->_icsPreviewController;
  if (icsPreviewController)
  {
    id v5 = [(EKICSPreviewController *)icsPreviewController viewController];
    [(SGSuggestionPresenter *)self dismissViewController:v5];
  }
}

- (id)icsPreviewControllerForData:(id)a3 andEventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v8 = (void *)getEKICSPreviewControllerClass_softClass;
  uint64_t v18 = getEKICSPreviewControllerClass_softClass;
  if (!getEKICSPreviewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getEKICSPreviewControllerClass_block_invoke;
    v14[3] = &unk_1E612E840;
    v14[4] = &v15;
    __getEKICSPreviewControllerClass_block_invoke((uint64_t)v14);
    id v8 = (void *)v16[3];
  }
  v9 = v8;
  _Block_object_dispose(&v15, 8);
  id v10 = (EKICSPreviewController *)[[v9 alloc] initWithData:v6 eventStore:v7];
  icsPreviewController = self->_icsPreviewController;
  self->_icsPreviewController = v10;

  Class v12 = self->_icsPreviewController;
  return v12;
}

- (void)presentViewController:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_suggestionViewControllerPresenter)
  {
    [(id)_suggestionViewControllerPresenter presentViewController:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(SGSuggestionPresenter *)self _presentedControllerCancelButtonItem];
      v8[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      id v7 = [v4 navigationItem];
      [v7 setLeftBarButtonItems:v6];
    }
    [(SGSuggestionPresenter *)self _presentModalViewControllerFromButton:v4];
  }
}

- (id)formatMixedCategoriesSubtitle:(id)a3
{
  return +[SGSuggestionPresenter formatList:a3];
}

- (id)formatMixedCategoriesTitle:(id)a3
{
  return +[SGSuggestionPresenter formatList:a3];
}

- (void)_updateBanner
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  bannerPrimaryAction = self->_bannerPrimaryAction;
  self->_bannerPrimaryAction = 0;

  bannerDismissAction = self->_bannerDismissAction;
  self->_bannerDismissAction = 0;

  if ([(SGList *)self->_suggestionStore count])
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      v9 = [(SGList *)self->_suggestionStore objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 count];

      if (v10) {
        ++v8;
      }
      ++v7;
    }
    while (v7 < [(SGList *)self->_suggestionStore count]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  Class v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    uint64_t v149 = v8;
    __int16 v150 = 1024;
    BOOL v151 = v4 == 6;
    _os_log_impl(&dword_1B5B6C000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter - Banner update initiated with %{public}lu item(s) Banner For Vision: %{BOOL}d", buf, 0x12u);
  }

  Class v12 = [(SGSuggestionPresenter *)self banner];
  [v12 setSuggestionStore:self->_suggestionStore];
  if (!v8) {
    goto LABEL_169;
  }
  v121 = v12;
  v129 = self;
  if (v8 != 1)
  {
    double v19 = objc_opt_new();
    uint64_t v20 = objc_opt_new();
    uint64_t v21 = objc_opt_new();
    if ([(SGList *)self->_suggestionStore count])
    {
      v119 = (void *)v21;
      v122 = (void *)v20;
      uint64_t v124 = 0;
      unint64_t v22 = 0;
      uint64_t v125 = 0;
      uint64_t v127 = 0;
      uint64_t v23 = 5;
      do
      {
        v24 = [(SGList *)self->_suggestionStore objectAtIndexedSubscript:v22];
        char v25 = [v24 items];

        v26 = [(SGList *)self->_suggestionStore objectAtIndexedSubscript:v22];
        v27 = [v26 category];

        id v28 = [v27 suggestionCategoryTitle];
        v29 = v19;
        [v19 addObject:v28];

        id v30 = [v27 suggestionCategoryId];
        v31 = &unk_1F0ED7520;
        if (([v30 isEqualToString:@"com.apple.suggestions.SGContactSuggestion"] & 1) == 0)
        {
          v31 = &unk_1F0ED7538;
          if (([v30 isEqualToString:@"com.apple.suggestions.SGEventSuggestion"] & 1) == 0)
          {
            v31 = &unk_1F0ED7550;
            if (([v30 isEqualToString:@"com.apple.suggestions.SGReminderSuggestion"] & 1) == 0)
            {
              v31 = &unk_1F0ED7568;
              if (([v30 isEqualToString:@"com.apple.suggestions.SGRadarSuggestion"] & 1) == 0)
              {
                v32 = sgLogHandle();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1B5B6C000, v32, OS_LOG_TYPE_DEBUG, "SGSuggestionPresenter: Encountered unknown suggestion type while determining banner subtitle", buf, 2u);
                }

                v31 = &unk_1F0ED7508;
              }
            }
          }
        }
        if (([v31 isEqual:&unk_1F0ED7508] & 1) == 0)
        {
          v33 = [v27 suggestionCategoryLocalizedCountOfItems:v25];
          [v122 setObject:v33 forKeyedSubscript:v31];

          v34 = [v27 suggestionCategoryImage];
          if (v34) {
            [v119 setObject:v34 forKeyedSubscript:v31];
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v127)
          {
            uint64_t v127 = [v27 suggestionCategoryBackgroundVisualEffectView];
          }
          uint64_t v35 = 0;
          if ((objc_opt_respondsToSelector() & 1) != 0 && v23 == 5) {
            uint64_t v35 = [v27 suggestionCategoryActionButtonType];
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v125)
          {
            uint64_t v125 = [v27 suggestionCategoryBackgroundColor];
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v124)
          {
            uint64_t v124 = [v27 suggestionCategoryDivider];
          }
          if (objc_opt_respondsToSelector()) {
            uint64_t v36 = [v27 suggestionCategorySupportsBatchDismissal];
          }
          else {
            uint64_t v36 = 0;
          }
          [v12 setSuggestionCategorySupportsBatchDismissal:v36];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v27 suggestionCategoryIconSFSymbol], (uint64_t v37 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v38 = (void *)v37;
            v138[0] = v37;
            v138[1] = v37;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
            [v121 setIconSFSymbols:v39];

            Class v12 = v121;
          }
          else
          {
            [v12 setIconSFSymbols:0];
          }

          uint64_t v23 = v35;
        }

        ++v22;
        self = v129;
        double v19 = v29;
      }
      while (v22 < [(SGList *)v129->_suggestionStore count]);
      if (v125) {
        [v12 setBackgroundColor:v125];
      }
      if (v124) {
        [v12 setBannerDivider:v124];
      }
      uint64_t v20 = (uint64_t)v122;
      if (v127) {
        [v12 setBackgroundVisualEffectView:v127];
      }
      else {
        uint64_t v127 = 0;
      }
      uint64_t v21 = (uint64_t)v119;
    }
    else
    {
      uint64_t v125 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v23 = 5;
    }
    [(SGSuggestionPresenter *)v129 _sortSuggestionByCategoryUsing:v21];
    v46 = v45 = (void *)v21;
    [v12 setImages:v46];

    v47 = [(SGSuggestionPresenter *)v129 formatMixedCategoriesTitle:v19];
    [v12 setTitle:v47];

    [v12 setAttributedSubtitle:0];
    v48 = [(SGSuggestionPresenter *)v129 _sortSuggestionByCategoryUsing:v20];
    v49 = [(SGSuggestionPresenter *)v129 formatMixedCategoriesSubtitle:v48];
    [v12 setSubtitle:v49];

    [v12 setActionButtonType:v23];
    [v12 setAccessoryType:1];
    v50 = [(SGList *)v129->_suggestionStore objectAtIndexedSubscript:0];
    v51 = [v50 items];
    v52 = [v51 firstObject];
    v53 = [v52 suggestionDelegate];
    [v121 setDelegate:v53];

    Class v12 = v121;
    v54 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    v55 = [v54 localizedStringForKey:@"SuggestionsBannerButtonReview" value:&stru_1F0ED27A8 table:0];
    [v121 setActionTitle:v55];

    v56 = (void *)v20;
    v57 = v45;
    [v121 setSuggestion:0];
    id v58 = (id)v124;
    v13 = (void *)v125;
    v59 = (void *)v127;
    goto LABEL_168;
  }
  v13 = [(SGList *)self->_suggestionStore objectAtIndexedSubscript:0];
  if ([v13 count])
  {
    if ([v13 count] == 1)
    {
      v14 = [v13 objectAtIndexedSubscript:0];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v14 suggestionBackgroundVisualEffectView];
        if (v15) {
          [v12 setBackgroundVisualEffectView:v15];
        }
      }
      if (objc_opt_respondsToSelector())
      {
        v16 = [v14 suggestionBackgroundColor];
        [v12 setBackgroundColor:v16];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v14 suggestionDivider];
        if (v17) {
          [v12 setBannerDivider:v17];
        }
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v12, "setActionButtonType:", objc_msgSend(v14, "suggestionActionButtonType"));
        uint64_t v18 = [v12 actionButtonType];
        if (v4 != 6)
        {
LABEL_98:
          if (v18)
          {
LABEL_99:
            [v12 setImages:0];
            goto LABEL_102;
          }
LABEL_80:
          uint64_t v60 = suggestionImage(v14);
          v61 = (void *)v60;
          if (v60)
          {
            uint64_t v147 = v60;
            v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
            [v12 setImages:v62];
          }
          else
          {
            [v12 setImages:0];
          }

LABEL_102:
          uint64_t v76 = suggestionImageSGView(v14);
          v59 = (void *)v76;
          if (v76)
          {
            uint64_t v146 = v76;
            v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
            [v12 setImageSGViews:v77];
          }
          else
          {
            [v12 setImageSGViews:0];
          }
          v78 = [v14 suggestionTitle];
          [v12 setTitle:v78];

          id v58 = v14;
          if (objc_opt_respondsToSelector())
          {
            double v19 = [v58 suggestionAttributedSubtitle];

            if (v19)
            {
              [v12 setAttributedSubtitle:v19];
LABEL_113:
              uint64_t v81 = [v58 suggestionPrimaryAction];
              v82 = v129->_bannerPrimaryAction;
              v129->_bannerPrimaryAction = (SGSuggestionAction *)v81;

              if (objc_opt_respondsToSelector())
              {
                uint64_t v83 = [v58 suggestionDismissAction];
              }
              else
              {
                uint64_t v83 = 0;
              }
              v84 = v129->_bannerDismissAction;
              v129->_bannerDismissAction = (SGSuggestionAction *)v83;

              if (objc_opt_respondsToSelector()) {
                objc_msgSend(v12, "setProminentActionButton:", objc_msgSend(v58, "suggestionProminentActionButton"));
              }
              if ((objc_opt_respondsToSelector() & 1) != 0
                && ([v58 suggestionIconSFSymbol], (uint64_t v85 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v56 = (void *)v85;
                uint64_t v145 = v85;
                v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
                [v12 setIconSFSymbols:v86];
              }
              else
              {
                [v12 setIconSFSymbols:0];
                v56 = 0;
              }
              v87 = [(SGSuggestionAction *)v129->_bannerPrimaryAction title];
              [v12 setActionTitle:v87];

              [v12 setAccessoryType:v129->_bannerDismissAction != 0];
              [v12 setSuggestion:v58];
              v57 = [v58 suggestionDelegate];
              [v12 setDelegate:v57];
LABEL_168:

              self = v129;
LABEL_169:
              [v12 reload];
              [(SGSuggestionPresenter *)self setWantsToShowBanner:v8 != 0];
              goto LABEL_170;
            }
          }
          else
          {
          }
          id v79 = v58;
          if (objc_opt_respondsToSelector())
          {
            v80 = [v79 suggestionSubtitle];
          }
          else
          {
            v80 = 0;
          }

          [v12 setSubtitle:v80];
          double v19 = 0;
          goto LABEL_113;
        }
      }
      else
      {
        if (v4 != 6)
        {
          [v12 setActionButtonType:1];
          uint64_t v18 = [v12 actionButtonType];
          goto LABEL_98;
        }
        [v12 setActionButtonType:2];
        [v12 actionButtonType];
      }
      if ([v12 actionButtonType]
        && [v12 actionButtonType] != 3
        && [v12 actionButtonType] != 4)
      {
        goto LABEL_99;
      }
      goto LABEL_80;
    }
    v40 = [v13 items];
    v41 = [v13 category];
    uint64_t v42 = objc_opt_new();
    uint64_t v123 = objc_opt_new();
    v128 = v41;
    v43 = (void *)v42;
    if (objc_opt_respondsToSelector())
    {
      int v126 = [v41 suggestionCategoryCoalesceImages];
      if (v126) {
        unint64_t v44 = 1;
      }
      else {
        unint64_t v44 = 2;
      }
    }
    else
    {
      LOBYTE(v126) = 0;
      unint64_t v44 = 2;
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v63 = v40;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v134 objects:v144 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v135;
LABEL_85:
      uint64_t v67 = 0;
      while (1)
      {
        if (*(void *)v135 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v134 + 1) + 8 * v67);
        if ([v43 count] == v44) {
          break;
        }
        v69 = suggestionImage(v68);
        if (v69) {
          [v43 addObject:v69];
        }

        if (v65 == ++v67)
        {
          uint64_t v65 = [v63 countByEnumeratingWithState:&v134 objects:v144 count:16];
          if (v65) {
            goto LABEL_85;
          }
          break;
        }
      }
    }

    double v19 = v43;
    if ([v43 count] >= v44)
    {
      v75 = v121;
      [v121 setImages:v43];
      v70 = v128;
      v73 = (void *)v123;
    }
    else
    {
      v70 = v128;
      uint64_t v71 = [v128 suggestionCategoryImage];
      v72 = (void *)v71;
      v73 = (void *)v123;
      if (v71)
      {
        v143[0] = v71;
        v143[1] = v71;
        v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];
        [v121 setImages:v74];

        v75 = v121;
        v70 = v128;
      }
      else
      {
        v75 = v121;
        [v121 setImages:0];
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v70 suggestionCategoryIconSFSymbol], (uint64_t v88 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v142[0] = v88;
      v142[1] = v88;
      v120 = (void *)v88;
      v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
      [v75 setIconSFSymbols:v89];
    }
    else
    {
      [v75 setIconSFSymbols:0];
      v120 = 0;
    }
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v90 = v63;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v130 objects:v141 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v131;
LABEL_131:
      uint64_t v94 = 0;
      while (1)
      {
        if (*(void *)v131 != v93) {
          objc_enumerationMutation(v90);
        }
        v95 = *(void **)(*((void *)&v130 + 1) + 8 * v94);
        if ([v73 count] == v44) {
          break;
        }
        v96 = suggestionImageSGView(v95);
        if (v96) {
          [v73 addObject:v96];
        }

        if (v92 == ++v94)
        {
          uint64_t v92 = [v90 countByEnumeratingWithState:&v130 objects:v141 count:16];
          if (v92) {
            goto LABEL_131;
          }
          break;
        }
      }
    }
    id v58 = v90;

    if ([v73 count] >= v44)
    {
      Class v12 = v121;
      [v121 setImageSGViews:v73];
      v97 = v128;
      goto LABEL_149;
    }
    v97 = v128;
    Class v12 = v121;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v98 = [v128 suggestionCategoryImageSGView];
      v99 = (void *)v98;
      if (v126)
      {
        if (v98)
        {
          uint64_t v140 = v98;
          v100 = (void *)MEMORY[0x1E4F1C978];
          v101 = &v140;
          uint64_t v102 = 1;
LABEL_148:
          v103 = [v100 arrayWithObjects:v101 count:v102];
          [v121 setImageSGViews:v103];

LABEL_149:
          v104 = [v13 list];
          if (v104 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            suggestionCategoryList = v129->_suggestionCategoryList;
            v106 = [v104 suggestionListTitle];
            [(SGSuggestionCategoryList *)suggestionCategoryList setListTitle:v106];
          }
          v107 = [v97 suggestionCategoryTitleForItems:v58];
          [v12 setTitle:v107];

          [v12 setAttributedSubtitle:0];
          v108 = [v97 suggestionCategorySubtitleForItems:v58];
          [v12 setSubtitle:v108];

          objc_msgSend(v12, "setAccessoryType:", -[SGSuggestionPresenter _bannerAccessoryType](v129, "_bannerAccessoryType"));
          v109 = [v58 firstObject];
          v110 = [v109 suggestionDelegate];
          [v12 setDelegate:v110];

          v111 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
          v112 = [v111 localizedStringForKey:@"SuggestionsBannerButtonReview" value:&stru_1F0ED27A8 table:0];
          [v12 setActionTitle:v112];

          v59 = v97;
          [v12 setSuggestion:0];
          char v113 = objc_opt_respondsToSelector();
          uint64_t v114 = 0;
          if (v113) {
            uint64_t v114 = objc_msgSend(v97, "suggestionCategoryActionButtonType", 0);
          }
          [v12 setActionButtonType:v114];
          if (objc_opt_respondsToSelector())
          {
            v115 = [v97 suggestionCategoryBackgroundVisualEffectView];
            if (v115) {
              [v12 setBackgroundVisualEffectView:v115];
            }
          }
          if (objc_opt_respondsToSelector())
          {
            v116 = [v97 suggestionCategoryBackgroundColor];
            [v12 setBackgroundColor:v116];
          }
          if (objc_opt_respondsToSelector())
          {
            v117 = [v97 suggestionCategoryDivider];
            if (v117) {
              [v12 setBannerDivider:v117];
            }
          }
          v56 = (void *)v123;
          if (objc_opt_respondsToSelector()) {
            uint64_t v118 = [v97 suggestionCategorySupportsBatchDismissal];
          }
          else {
            uint64_t v118 = 0;
          }
          [v12 setSuggestionCategorySupportsBatchDismissal:v118];

          v57 = v120;
          goto LABEL_168;
        }
      }
      else if (v98)
      {
        v139[0] = v98;
        v139[1] = v98;
        v100 = (void *)MEMORY[0x1E4F1C978];
        v101 = v139;
        uint64_t v102 = 2;
        goto LABEL_148;
      }
    }
    [v121 setImageSGViews:0];
    goto LABEL_149;
  }

LABEL_170:
}

- (int64_t)_bannerAccessoryType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(SGSuggestionStore *)self->_suggestionStore suggestions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 suggestionCategory];
        v9 = [v8 suggestionCategoryId];

        if ([v9 isEqualToString:@"com.apple.suggestions.SGEventSuggestion"])
        {
          getRealtimeSuggestion(v7);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_16;
          }
          id v10 = v10;
          if ([v10 state] != 4 && objc_msgSend(v10, "state") != 5)
          {

LABEL_16:
LABEL_17:

            int64_t v11 = 1;
            goto LABEL_18;
          }
        }
        else if ([v9 isEqualToString:@"CKCollaborationNoticeSuggestion"])
        {
          goto LABEL_17;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int64_t v11 = 0;
LABEL_18:

  return v11;
}

- (id)_sortSuggestionByCategoryUsing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:i];
    unint64_t v7 = [v3 objectForKey:v6];

    if (v7)
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:i];
      v9 = [v3 objectForKey:v8];
      [v4 addObject:v9];
    }
  }

  return v4;
}

- (void)_restoreSuggestions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(SGSuggestionStore *)self->_suggestionStore hostApp]
    && ![(SGList *)self->_suggestionStore count]
    && [(NSMutableArray *)self->_filteredSuggestions count])
  {
    [(SGSuggestionPresenter *)self _removeBanner];
    [(SGSuggestionPresenter *)self setWantsToShowBanner:0];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = self->_filteredSuggestions;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[SGSuggestionPresenter addSuggestion:](self, "addSuggestion:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)self->_filteredSuggestions removeAllObjects];
  }
}

- (void)_filterSuggestions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(SGSuggestionStore *)self->_suggestionStore hostApp])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = [(SGList *)self->_suggestionStore items];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (!v4)
    {
LABEL_23:

      return;
    }
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * i) count]) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);

    if (v6 >= 2)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v3 = [(SGSuggestionStore *)self->_suggestionStore suggestions];
      uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v3);
            }
            uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * j);
            long long v14 = [v13 suggestionCategory];
            long long v15 = [v14 suggestionCategoryId];

            long long v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
            uint64_t v17 = [v16 localizedStringForKey:@"SuggestionsCategorySubscriptions" value:&stru_1F0ED27A8 table:0];

            if (v17 && ([v15 isEqualToString:v17] & 1) != 0
              || [v15 isEqualToString:@"Subscriptions"])
            {
              [(SGSuggestionPresenter *)self _removeBanner];
              [(SGSuggestionPresenter *)self setWantsToShowBanner:0];
              [(SGSuggestionPresenter *)self removeSuggestion:v13];
            }
          }
          uint64_t v10 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v10);
      }
      goto LABEL_23;
    }
  }
}

- (void)_removeBanner
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 suggestionPresenterWantsToHideBanner:self];
  }
}

- (void)reloadSuggestionsFromSearchableItems
{
  id v3 = [(SGSuggestionPresenter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SGSuggestionPresenter *)self delegate];
    [v5 reloadSuggestionsFromSearchableItems];
  }
}

- (void)_bannerDismiss
{
}

- (id)tableViewController
{
  id v3 = [_TtC17CoreSuggestionsUI27SGSuggestionTableController alloc];
  suggestionStore = self->_suggestionStore;
  id v5 = [(SGSuggestionPresenter *)self delegate];
  id v6 = [(SGSuggestionTableController *)v3 initWithStore:suggestionStore delegate:v5 suggestionPresenter:self suggestionList:self->_suggestionCategoryList];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  long long v8 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  uint64_t v9 = [v7 view];
  [v9 setBackgroundColor:v8];

  [v7 setModalPresentationStyle:7];
  objc_storeStrong((id *)&self->_presentedViewController, v7);

  return v7;
}

- (void)dismissAllSuggestions
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__SGSuggestionPresenter_dismissAllSuggestions__block_invoke;
  v2[3] = &unk_1E612E7E8;
  v2[4] = self;
  runOnMainThread(v2);
}

uint64_t __46__SGSuggestionPresenter_dismissAllSuggestions__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) dismissAllSuggestions];
}

- (void)suggestionBatchDismissal
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(SGSuggestionPresenter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SGSuggestionPresenter *)self suggestions];
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_1B5B6C000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter: Delegate method called to dismiss all suggestions (Suggestions to dismiss: %lu)", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [(SGSuggestionPresenter *)self delegate];
    [v7 suggestionPresenterDismissAllSuggestions:v5];
  }
}

- (void)_bannerPrimaryAction
{
  bannerPrimaryAction = self->_bannerPrimaryAction;
  if (bannerPrimaryAction) {
    [(SGSuggestionAction *)bannerPrimaryAction execute];
  }
}

- (void)setWantsToShowBanner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"No";
    if (v3) {
      id v6 = @"Yes";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B5B6C000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter - Show banner: (%{public}@)", buf, 0xCu);
  }

  if (self->_wantsToShowBanner != v3 || self->_forceUpdate)
  {
    self->_wantsToShowBanner = v3;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_delegate);
        [v9 suggestionPresenterWantsToShowBanner:self];
      }
    }
    else
    {
      dispatch_time_t v10 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__SGSuggestionPresenter_setWantsToShowBanner___block_invoke;
      block[3] = &unk_1E612E7E8;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
    self->_forceUpdate = 0;
  }
}

uint64_t __46__SGSuggestionPresenter_setWantsToShowBanner___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 88))
  {
    uint64_t v2 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 96));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(v2 + 32) + 96));
      [v5 suggestionPresenterWantsToHideBanner:*(void *)(v2 + 32)];
    }
    id v6 = *(void **)(v2 + 32);
    return [v6 _dismissViewControllerAnimated:1];
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, v4);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      id v9 = [v8 suggestionCategoryComparatorForManager:self];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __37__SGSuggestionPresenter_setDelegate___block_invoke;
      aBlock[3] = &unk_1E612E7C0;
      id v13 = v9;
      id v10 = v9;
      uint64_t v11 = _Block_copy(aBlock);
    }
    else
    {
      uint64_t v11 = 0;
    }
    [(SGList *)self->_suggestionStore setComparator:v11];
  }
}

uint64_t __37__SGSuggestionPresenter_setDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 category];
  char v7 = [v5 category];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (SGBannerProtocol)banner
{
  banner = self->_banner;
  if (!banner)
  {
    uint64_t v4 = (SGBannerProtocol *)objc_opt_new();
    id v5 = self->_banner;
    self->_banner = v4;

    banner = self->_banner;
  }
  return banner;
}

- (void)removeSuggestion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SGSuggestionPresenter_removeSuggestion___block_invoke;
  v6[3] = &unk_1E612E798;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  runOnMainThread(v6);
}

uint64_t __42__SGSuggestionPresenter_removeSuggestion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeSuggestion:*(void *)(a1 + 40)];
}

- (void)addSuggestion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SGSuggestionPresenter_addSuggestion___block_invoke;
  v6[3] = &unk_1E612E798;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  runOnMainThread(v6);
}

uint64_t __39__SGSuggestionPresenter_addSuggestion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addSuggestion:*(void *)(a1 + 40)];
}

- (void)setSuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__SGSuggestionPresenter_setSuggestions___block_invoke;
    v5[3] = &unk_1E612E798;
    v5[4] = self;
    id v6 = v4;
    runOnMainThread(v5);
  }
  else
  {
    [(SGList *)self->_suggestionStore removeAllItems];
  }
}

void __40__SGSuggestionPresenter_setSuggestions___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) setSuggestions:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v2 = [v4 viewControllers];
    BOOL v3 = [v2 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 updateWithSuggestionStore:*(void *)(*(void *)(a1 + 32) + 40)];
    }
  }
}

- (NSArray)suggestions
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1008;
  id v9 = __Block_byref_object_dispose__1009;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SGSuggestionPresenter_suggestions__block_invoke;
  v4[3] = &unk_1E612E770;
  v4[4] = self;
  v4[5] = &v5;
  runOnMainThreadSync(v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

uint64_t __36__SGSuggestionPresenter_suggestions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) suggestions];
  return MEMORY[0x1F41817F8]();
}

- (void)_listDidChangeNotification:(id)a3
{
  id v26 = a3;
  id v4 = [v26 object];
  uint64_t v5 = v4;
  suggestionStore = self->_suggestionStore;
  if (v4 == suggestionStore)
  {

    id v9 = v26;
  }
  else
  {
    uint64_t v7 = [v26 object];
    uint64_t v8 = [(SGList *)suggestionStore indexOfItem:v7];

    id v9 = v26;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_21;
    }
  }
  id v10 = [v9 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"SGListNotificationKeyItemUpdated"];

  if (v11) {
    [(SGSuggestionPresenter *)self reloadSuggestionsFromSearchableItems];
  }
  Class v12 = [v26 userInfo];
  id v13 = [v12 objectForKeyedSubscript:@"SGListNotificationKeyItemAdded"];

  if (v13)
  {
    if ([(SGList *)self->_suggestionStore count] == 1)
    {
      banner = self->_banner;
      if (banner) {
        [(SGBannerProtocol *)banner invalidateBannerView];
      }
    }
    [(SGSuggestionPresenter *)self _filterSuggestions];
  }
  long long v15 = [v26 userInfo];
  long long v16 = [v15 objectForKeyedSubscript:@"SGListNotificationKeyItemRemoved"];

  if (v16)
  {
    [(SGSuggestionPresenter *)self _restoreSuggestions];
    if ([(SGList *)self->_suggestionStore count])
    {
      [(SGSuggestionPresenter *)self reloadSuggestionsFromSearchableItems];
      if ([(SGList *)self->_suggestionStore count] == 1)
      {
        uint64_t v17 = self->_banner;
        if (v17) {
          [(SGBannerProtocol *)v17 invalidateBannerView];
        }
      }
    }
  }
  long long v18 = [(SGSuggestionStore *)self->_suggestionStore suggestions];
  uint64_t v19 = [v18 count];
  unint64_t currentSuggestionsCount = self->_currentSuggestionsCount;

  if (v19 != currentSuggestionsCount)
  {
    long long v21 = [(SGSuggestionStore *)self->_suggestionStore suggestions];
    self->_unint64_t currentSuggestionsCount = [v21 count];

    self->_forceUpdate = 1;
    long long v22 = self->_banner;
    if (v22) {
      [(SGBannerProtocol *)v22 invalidateBannerView];
    }
  }
  [(SGSuggestionPresenter *)self _updateBanner];
  id v9 = v26;
LABEL_21:
  long long v23 = [v9 object];
  if (v23)
  {
  }
  else
  {
    long long v24 = [v26 userInfo];
    long long v25 = [v24 objectForKeyedSubscript:@"SGListNotificationKeyChangedReorientation"];

    if (v25 && [(SGList *)self->_suggestionStore count])
    {
      self->_forceUpdate = 1;
      [(SGSuggestionPresenter *)self _updateBanner];
    }
  }
}

- (id)suggestionStore
{
  return self->_suggestionStore;
}

- (SGSuggestionPresenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)SGSuggestionPresenter;
  id v2 = [(SGSuggestionPresenter *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    suggestionStore = v2->_suggestionStore;
    v2->_suggestionStore = (SGSuggestionStore *)v3;

    [(SGSuggestionStore *)v2->_suggestionStore setSuggestionDelegate:v2];
    uint64_t v5 = objc_opt_new();
    filteredSuggestions = v2->_filteredSuggestions;
    v2->_filteredSuggestions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    suggestionCategoryList = v2->_suggestionCategoryList;
    v2->_suggestionCategoryList = (SGSuggestionCategoryList *)v7;

    v2->_unint64_t currentSuggestionsCount = 0;
    v2->_forceUpdate = 0;
    icsPreviewController = v2->_icsPreviewController;
    v2->_icsPreviewController = 0;

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__listDidChangeNotification_ name:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SGSuggestionPresenter;
  [(SGSuggestionPresenter *)&v4 dealloc];
}

+ (id)formatList:(id)a3
{
  return (id)[MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:a3];
}

@end