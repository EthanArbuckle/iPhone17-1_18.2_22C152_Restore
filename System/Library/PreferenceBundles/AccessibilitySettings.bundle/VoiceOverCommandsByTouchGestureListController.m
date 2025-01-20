@interface VoiceOverCommandsByTouchGestureListController
- (BOOL)_isCategoryEnabled:(id)a3;
- (id)_boundCommandNameForGesture:(id)a3;
- (id)_headerSpecifiersForCategory:(id)a3;
- (id)makeSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverCommandsByTouchGestureListController

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(VoiceOverCommandsByTouchGestureListController *)self deactivateAndPersistSearchText];
  v8 = [(VoiceOverCommandsByTouchGestureListController *)self specifierForIndexPath:v7];
  v9 = [v8 voCommandResolver];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_20A1C8;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  objc_copyWeak(&v19, &location);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_270;
  v14[3] = &unk_208798;
  objc_copyWeak(&v15, &location);
  v12 = +[VoiceOverCommandPickerPresenter presenterWithSpecifier:v10 selectionBlock:v16 cancelBlock:v14];
  commandPickerPresenter = self->_commandPickerPresenter;
  self->_commandPickerPresenter = v12;

  [(VoiceOverCommandPickerPresenter *)self->_commandPickerPresenter presentWithController:self];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [*(id *)(a1 + 32) voCommandManager];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v15[3] = &unk_20A1A0;
  v18[1] = a4;
  id v13 = v7;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  objc_copyWeak(v18, v11);
  [v9 applyAction:a4 toCommand:v13 withGesture:v14 keyboardShortcut:0 resolver:v10 presentationController:WeakRetained completion:v15];

  objc_destroyWeak(v18);
}

void __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = VOTLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  v5 = (id *)(a1 + 6);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setNeedsSpecifierRefresh];

  id v7 = objc_loadWeakRetained(v5);
  [v7 reloadSpecifiers];

  id v8 = objc_loadWeakRetained(v5);
  [v8 dismissViewControllerAnimated:1 completion:0];
}

void __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_270(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)makeSpecifiers
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
  uint64_t v44 = [v4 commandManager];

  id v32 = (id)objc_opt_new();
  uint64_t v41 = v3;
  v5 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v3] voCommandResolver];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = +[VOSGestureCategory allCategories];
  id v34 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  id v6 = 0;
  if (v34)
  {
    v35 = 0;
    uint64_t v33 = *(void *)v52;
    uint64_t v40 = PSEnabledKey;
    uint64_t v38 = AXLongTitleValueTableViewCellButtonBoolKey;
    uint64_t v39 = PSCellClassKey;
    id v7 = (void *)v44;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v8;
        v9 = *(void **)(*((void *)&v51 + 1) + 8 * v8);
        uint64_t v10 = +[NSMutableArray array];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v37 = v9;
        id v46 = [v9 gestures];
        id v11 = [v46 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v48;
          uint64_t v42 = *(void *)v48;
          v43 = v10;
          do
          {
            id v14 = 0;
            id v45 = v12;
            do
            {
              if (*(void *)v48 != v13) {
                objc_enumerationMutation(v46);
              }
              uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * (void)v14);
              id v16 = (char *)[v7 availabilityForGesture:v15 withResolver:v5];
              if (v16 != (unsigned char *)&dword_0 + 2)
              {
                id v17 = v16;
                id v18 = v6;
                id v19 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v41] voCommandContext];
                [v19 resolver];
                v21 = v20 = v7;
                id v6 = +[PSSpecifier voGestureItem:v15 commandManager:v20 resolver:v21];

                v22 = [v20 commandForTouchGesture:v15 withResolver:v5];
                v23 = [v6 voCommandContext];
                [v23 setCommand:v22];

                if (v17) {
                  BOOL v24 = 0;
                }
                else {
                  BOOL v24 = [(VoiceOverCommandsByTouchGestureListController *)self _isCategoryEnabled:v37];
                }
                uint64_t v10 = v43;
                v25 = +[NSNumber numberWithInt:v24];
                [v6 setProperty:v25 forKey:v40];

                [v6 setProperty:objc_opt_class() forKey:v39];
                [v6 setProperty:&__kCFBooleanTrue forKey:v38];
                objc_storeWeak((id *)&v6[OBJC_IVAR___PSSpecifier_target], self);
                *(void *)&v6[OBJC_IVAR___PSSpecifier_getter] = "_boundCommandNameForGesture:";
                [v43 addObject:v6];
                id v7 = (void *)v44;
                uint64_t v13 = v42;
                id v12 = v45;
              }
              id v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v46 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v12);
        }

        if ([v10 count])
        {
          v26 = [v37 localizedCategoryName];
          uint64_t v27 = +[PSSpecifier groupSpecifierWithName:v26];

          [v32 addObject:v27];
          v28 = [(VoiceOverCommandsByTouchGestureListController *)self _headerSpecifiersForCategory:v37];
          [v32 addObjectsFromArray:v28];

          id v7 = (void *)v44;
          [v32 addObjectsFromArray:v10];
          v35 = (void *)v27;
        }

        uint64_t v8 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v34);
  }
  else
  {
    v35 = 0;
    id v7 = (void *)v44;
  }

  id v29 = v32;
  return v29;
}

- (id)_boundCommandNameForGesture:(id)a3
{
  id v3 = a3;
  v4 = [v3 voCommandContext];
  v5 = [v4 gesture];
  id v6 = +[VOSGesture OneFingerSingleTap];

  if (v5 == v6)
  {
    v9 = VOSLocString();
  }
  else
  {
    id v7 = [v3 voCommandContext];
    uint64_t v8 = [v7 command];
    v9 = [v8 localizedName];
  }

  return v9;
}

- (id)_headerSpecifiersForCategory:(id)a3
{
  return &__NSArray0__struct;
}

- (BOOL)_isCategoryEnabled:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

void __83__VoiceOverCommandsByTouchGestureListController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = a1[7];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  int v6 = 134218754;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to apply action:(%ld) to command: %@. gesture: %@. %@", (uint8_t *)&v6, 0x2Au);
}

@end