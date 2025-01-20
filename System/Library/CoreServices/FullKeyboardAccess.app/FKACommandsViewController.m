@interface FKACommandsViewController
- (AXSSKeyChord)textEditingModeExitKeyChord;
- (BOOL)_canShowWhileLocked;
- (BOOL)requiresNativeFocus;
- (void)loadView;
- (void)setTextEditingModeExitKeyChord:(id)a3;
@end

@implementation FKACommandsViewController

- (BOOL)requiresNativeFocus
{
  return 1;
}

- (void)loadView
{
  v3 = +[NSMutableArray array];
  v4 = [(FKACommandsViewController *)self textEditingModeExitKeyChord];

  v38 = self;
  if (v4)
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_TITLE" value:&stru_100024CA0 table:0];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_HELP" value:&stru_100024CA0 table:0];
    v9 = [(FKACommandsViewController *)self textEditingModeExitKeyChord];
    v10 = [v9 fkaSpeakableDisplayValue];
    v11 = +[FKACommandListItem itemWithName:v8 keyDescription:v10];
    v52 = v11;
    v12 = +[NSArray arrayWithObjects:&v52 count:1];
    v13 = +[FKACommandList listWithTitle:v6 items:v12 footerText:0];

    self = v38;
    [v3 addObject:v13];
  }
  v14 = +[FKAAvailableCommands sharedInstance];
  v15 = [v14 categories];

  v16 = +[FKAAvailableCommands sharedInstance];
  v17 = [v16 commandMap];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v15;
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v39)
  {
    uint64_t v36 = *(void *)v47;
    v37 = v3;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v18;
        v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
        v20 = +[NSMutableArray array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v40 = v19;
        v21 = [v19 commands];
        id v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              v27 = [v17 keyChordForCommand:v26];
              v28 = v27;
              if (v27)
              {
                v29 = [v27 fkaSpeakableDisplayValue];
                v30 = [v26 localizedName];
                v31 = +[FKACommandListItem itemWithName:v30 keyDescription:v29];

                [v20 addObject:v31];
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v23);
        }

        v3 = v37;
        self = v38;
        if ([v20 count])
        {
          v32 = [v40 localizedName];
          v33 = +[FKACommandList listWithTitle:v32 items:v20 footerText:0];

          [v37 addObject:v33];
        }

        uint64_t v18 = v41 + 1;
      }
      while ((id)(v41 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v39);
  }

  v34 = [(FKACommandsView *)[FKAScrollableCommandsView alloc] initWithCommandLists:v3];
  [(FKACommandsViewController *)self setView:v34];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXSSKeyChord)textEditingModeExitKeyChord
{
  return self->_textEditingModeExitKeyChord;
}

- (void)setTextEditingModeExitKeyChord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end