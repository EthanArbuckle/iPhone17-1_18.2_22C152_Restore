@interface VoiceOverGesturePickerController
- (BOOL)_isCategoryEnabled:(id)a3;
- (VoiceOverGesturePickerPresenter)presenter;
- (id)makeSpecifiers;
- (void)setPresenter:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverGesturePickerController

- (id)makeSpecifiers
{
  id v27 = (id)objc_opt_new();
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  uint64_t v34 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  v32 = self;
  v4 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v3] voCommandResolver];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = +[VOSGestureCategory allCategories];
  id v29 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  v5 = 0;
  if (v29)
  {
    v30 = 0;
    uint64_t v28 = *(void *)v41;
    uint64_t v33 = PSEnabledKey;
    v6 = (void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v7;
        v8 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
        v9 = +[NSMutableArray array];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v35 = [v8 gestures];
        id v10 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v37;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v37 != v12) {
                objc_enumerationMutation(v35);
              }
              uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v15 = (char *)[v6 availabilityForGesture:v14 withResolver:v4];
              if (v15 != (unsigned char *)&dword_0 + 2)
              {
                id v16 = v15;
                v17 = +[PSSpecifier voGestureItem:v14 commandManager:v6 resolver:v4];

                v18 = +[NSNumber numberWithUnsignedInteger:v16];
                v19 = [v17 voCommandContext];
                [v19 setBindingAvailability:v18];

                if (v16) {
                  BOOL v20 = 0;
                }
                else {
                  BOOL v20 = [(VoiceOverGesturePickerController *)v32 _isCategoryEnabled:v8];
                }
                v21 = +[NSNumber numberWithInt:v20];
                [v17 setProperty:v21 forKey:v33];

                [v9 addObject:v17];
                v5 = v17;
                v6 = (void *)v34;
              }
            }
            id v11 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v11);
        }

        if ([v9 count])
        {
          v22 = [v8 localizedCategoryName];
          uint64_t v23 = +[PSSpecifier groupSpecifierWithName:v22];

          [v27 addObject:v23];
          v6 = (void *)v34;
          [v27 addObjectsFromArray:v9];
          v30 = (void *)v23;
        }

        uint64_t v7 = v31 + 1;
      }
      while ((id)(v31 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v29);
  }
  else
  {
    v30 = 0;
    v6 = (void *)v34;
  }

  id v24 = v27;
  return v24;
}

- (BOOL)_isCategoryEnabled:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = *(void **)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 voCommandContext];
  id v14 = [v10 gesture];

  id v11 = [(VoiceOverGesturePickerController *)self specifierForIndexPath:v8];

  uint64_t v12 = [v11 voCommandContext];
  v13 = [v12 gesture];

  objc_msgSend(v9, "setChecked:", objc_msgSend(v14, "isEqual:", v13));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = OBJC_IVAR___PSViewController__specifier;
  id v8 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
  id v19 = [v8 gesture];

  id v9 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v7] voCommandContext];
  id v10 = [v9 command];

  id v11 = [(VoiceOverGesturePickerController *)self specifierForIndexPath:v6];

  uint64_t v12 = [v11 voCommandContext];
  v13 = [v12 gesture];

  unsigned int v14 = [v13 isEqual:v19];
  v15 = [(VoiceOverGesturePickerController *)self presenter];
  id v16 = [v15 userSelectedGestureBlock];

  if (v16)
  {
    v17 = [(VoiceOverGesturePickerController *)self presenter];
    v18 = [v17 userSelectedGestureBlock];
    ((void (**)(void, void *, void *, void))v18)[2](v18, v13, v10, v14);
  }
}

- (VoiceOverGesturePickerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (VoiceOverGesturePickerPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end