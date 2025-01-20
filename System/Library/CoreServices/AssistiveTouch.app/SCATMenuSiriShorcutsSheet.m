@interface SCATMenuSiriShorcutsSheet
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATMenuSiriShorcutsSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = +[AXSiriShortcutsManager sharedManager];
  v6 = [v5 shortcuts];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 identifier];
        v13 = [v11 shortcutName];
        v14 = +[SCATModernMenuItem itemWithIdentifier:v12 delegate:self title:v13 imageName:0 activateBehavior:1];

        v15 = [v11 shortcutName];
        v16 = +[UIImage scat_singleCharacterImageForTitle:v15 charactersInUse:v4];
        [v14 setImage:v16];

        [v14 setShortcut:v11];
        [v3 addObject:v14];
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 shortcut];

    if (v6)
    {
      id v7 = +[AXSiriShortcutsManager sharedManager];
      id v8 = [v5 shortcut];
      [v7 performShortcut:v8];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCATMenuSiriShorcutsSheet;
    [(SCATModernMenuSheet *)&v9 menuItemWasActivated:v4];
  }
}

@end