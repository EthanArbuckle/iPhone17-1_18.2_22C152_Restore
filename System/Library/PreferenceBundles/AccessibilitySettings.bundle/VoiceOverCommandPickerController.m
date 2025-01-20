@interface VoiceOverCommandPickerController
- (VoiceOverCommandPickerPresenter)presenter;
- (id)makeSpecifiers;
- (void)_resetCommandButtonTapped:(id)a3;
- (void)_unassignCommandButtonTapped:(id)a3;
- (void)setPresenter:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverCommandPickerController

- (id)makeSpecifiers
{
  v3 = objc_opt_new();
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  v5 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  uint64_t v69 = v4;
  v6 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v4] voCommandResolver];
  v7 = CAGradientLayer_ptr;
  v68 = v3;
  v70 = v6;
  v71 = v5;
  if ([v6 isHandwritingScreenreaderMode])
  {
    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v8];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v9 = +[VOSCommandCategory handwriting];
    v10 = [v9 commands];

    id obj = v10;
    id v11 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v11)
    {
      id v12 = v11;
      v64 = v8;
      v13 = 0;
      uint64_t v14 = *(void *)v85;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v85 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          if ([v5 availabilityForCommand:v16 withResolver:v6] != (char *)&dword_0 + 1)
          {
            v17 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v69] voCommandContext];
            v18 = [v17 resolver];
            v3 = v68;
            uint64_t v19 = +[PSSpecifier voCommandItem:v16 commandManager:v5 resolver:v18];

            v6 = v70;
            [v68 addObject:v19];
            v13 = (void *)v19;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v12);
LABEL_22:
      v30 = v13;
      v7 = CAGradientLayer_ptr;
      v8 = v64;
      goto LABEL_44;
    }
LABEL_23:
    v30 = 0;
    goto LABEL_44;
  }
  if ([v6 isBSIScreenreaderMode])
  {
    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v8];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v20 = +[VOSCommandCategory brailleScreenInput];
    v21 = [v20 commands];

    id obj = v21;
    id v22 = [v21 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v22)
    {
      id v23 = v22;
      v64 = v8;
      v13 = 0;
      uint64_t v24 = *(void *)v81;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v81 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v80 + 1) + 8 * (void)j);
          if ([v5 availabilityForCommand:v26 withResolver:v6] != (char *)&dword_0 + 1)
          {
            v27 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v69] voCommandContext];
            v28 = [v27 resolver];
            v3 = v68;
            uint64_t v29 = +[PSSpecifier voCommandItem:v26 commandManager:v5 resolver:v28];

            v6 = v70;
            [v68 addObject:v29];
            v13 = (void *)v29;
          }
        }
        id v23 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v23);
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = +[VOSCommandCategory allCategories];
  id v61 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
  v30 = 0;
  v8 = 0;
  if (v61)
  {
    uint64_t v60 = *(void *)v77;
    v67 = self;
    do
    {
      for (k = 0; k != v61; k = (char *)k + 1)
      {
        if (*(void *)v77 != v60) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v76 + 1) + 8 * (void)k);
        v33 = [v32 commands];
        if ([v33 count])
        {
          v65 = k;
          v34 = v7[120];
          v35 = [v32 localizedCategoryName];
          uint64_t v36 = [v34 groupSpecifierWithName:v35];

          v62 = (void *)v36;
          [v3 addObject:v36];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          v63 = v33;
          id v37 = v33;
          id v38 = [v37 countByEnumeratingWithState:&v72 objects:v88 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v73;
            v6 = v70;
            do
            {
              for (m = 0; m != v39; m = (char *)m + 1)
              {
                if (*(void *)v73 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = *(void *)(*((void *)&v72 + 1) + 8 * (void)m);
                if ([v71 availabilityForCommand:v42 withResolver:v6] != (char *)&dword_0 + 1)
                {
                  v43 = [*(id *)&v67->AXUISettingsSearchableBaseListController_opaque[v69] voCommandContext];
                  v44 = [v43 resolver];
                  v7 = CAGradientLayer_ptr;
                  uint64_t v45 = +[PSSpecifier voCommandItem:v42 commandManager:v71 resolver:v44];

                  v3 = v68;
                  v6 = v70;
                  [v68 addObject:v45];
                  v30 = (void *)v45;
                }
              }
              id v39 = [v37 countByEnumeratingWithState:&v72 objects:v88 count:16];
            }
            while (v39);
          }
          else
          {
            v6 = v70;
          }

          v8 = v62;
          v33 = v63;
          self = v67;
          k = v65;
        }
      }
      id v61 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v61);
  }
LABEL_44:

  v46 = [v7[120] emptyGroupSpecifier];

  [v3 addObject:v46];
  v47 = v7[120];
  settingsLocString(@"vo.reset.command", @"VoiceOverSettings");
  v49 = v48 = v7;
  v50 = [v47 deleteButtonSpecifierWithName:v49 target:self action:"_resetCommandButtonTapped:"];
  resetCommandSpecifier = self->_resetCommandSpecifier;
  self->_resetCommandSpecifier = v50;

  [v3 addObject:self->_resetCommandSpecifier];
  v52 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v69] voCommandContext];
  v53 = [v52 command];

  if (v53)
  {
    v54 = v48[120];
    v55 = settingsLocString(@"vo.unassign.command", @"VoiceOverSettings");
    v56 = [v54 deleteButtonSpecifierWithName:v55 target:self action:"_unassignCommandButtonTapped:"];
    unassignButtonSpecifier = self->_unassignButtonSpecifier;
    self->_unassignButtonSpecifier = v56;

    [v3 addObject:self->_unassignButtonSpecifier];
  }
  [(VoiceOverCommandPickerController *)self setupLongTitleSpecifiers:v3];
  id v58 = v3;

  return v58;
}

- (void)_resetCommandButtonTapped:(id)a3
{
  uint64_t v4 = [(VoiceOverCommandPickerController *)self presenter];
  v5 = [v4 userSelectedCommandBlock];

  if (v5)
  {
    uint64_t v6 = OBJC_IVAR___PSViewController__specifier;
    v7 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
    id v12 = [v7 command];

    v8 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v6] voCommandContext];
    v9 = [v8 gesture];

    v10 = [(VoiceOverCommandPickerController *)self presenter];
    id v11 = [v10 userSelectedCommandBlock];
    ((void (**)(void, id, void *, uint64_t))v11)[2](v11, v12, v9, 2);
  }
}

- (void)_unassignCommandButtonTapped:(id)a3
{
  uint64_t v4 = [(VoiceOverCommandPickerController *)self presenter];
  v5 = [v4 userSelectedCommandBlock];

  if (v5)
  {
    uint64_t v6 = OBJC_IVAR___PSViewController__specifier;
    v7 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
    id v12 = [v7 command];

    v8 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v6] voCommandContext];
    v9 = [v8 gesture];

    v10 = [(VoiceOverCommandPickerController *)self presenter];
    id v11 = [v10 userSelectedCommandBlock];
    ((void (**)(void, id, void *, uint64_t))v11)[2](v11, v12, v9, 1);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v7 = *(void **)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 voCommandContext];
  id v14 = [v10 command];

  id v11 = [(VoiceOverCommandPickerController *)self specifierForIndexPath:v8];

  id v12 = [v11 voCommandContext];
  v13 = [v12 command];

  objc_msgSend(v9, "setChecked:", objc_msgSend(v14, "isEqual:", v13));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [(VoiceOverCommandPickerController *)self specifierForIndexPath:v7];
  id v9 = v8;
  if (v8 == self->_unassignButtonSpecifier || v8 == self->_resetCommandSpecifier)
  {
    v22.receiver = self;
    v22.super_class = (Class)VoiceOverCommandPickerController;
    [(VoiceOverCommandPickerController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  else
  {
    uint64_t v10 = OBJC_IVAR___PSViewController__specifier;
    id v11 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
    id v12 = [v11 command];

    v13 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v10] voCommandContext];
    id v14 = [v13 gesture];

    v15 = [(PSSpecifier *)v9 voCommandContext];
    uint64_t v16 = [v15 command];

    unsigned int v17 = [v16 isEqual:v12];
    v18 = [(VoiceOverCommandPickerController *)self presenter];
    uint64_t v19 = [v18 userSelectedCommandBlock];

    if (v19)
    {
      v20 = [(VoiceOverCommandPickerController *)self presenter];
      v21 = [v20 userSelectedCommandBlock];
      ((void (**)(void, void *, void *, void))v21)[2](v21, v16, v14, v17);
    }
  }
}

- (VoiceOverCommandPickerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (VoiceOverCommandPickerPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_resetCommandSpecifier, 0);

  objc_storeStrong((id *)&self->_unassignButtonSpecifier, 0);
}

@end