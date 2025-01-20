@interface WatchControlGreyActivationController
- (id)greyVisualIndicator;
- (id)specifiers;
- (void)setGreyVisualIndicator:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlGreyActivationController

- (id)specifiers
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v31 = (int)*MEMORY[0x263F5FDB8];
    v32 = self;
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v6 = v4;
    v30 = v5;
    [v4 addObject:v5];
    v7 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v8 = [v7 greyActivationGesture];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v9 = [MEMORY[0x263F85B10] sharedInstance];
    v10 = [v9 eligibleGreyActivationGestures];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v13 = 0;
      uint64_t v14 = *(void *)v35;
      uint64_t v15 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) integerValue];
          v18 = (void *)MEMORY[0x263F5FC40];
          v19 = WCNameForGreyEvent();
          v20 = [v18 preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v21 = [NSNumber numberWithInteger:v17];
          [v20 setProperty:v21 forKey:v15];

          [v6 addObject:v20];
          if (v17 == v8)
          {
            id v22 = v20;

            v13 = v22;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    [v30 setProperty:v13 forKey:*MEMORY[0x263F60200]];
    v23 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v6 addObject:v23];

    v24 = (void *)MEMORY[0x263F5FC40];
    v25 = settingsLocString(@"GREY_VISUAL_INDICATOR_ROW_TITLE", @"AccessibilitySettings-watchcontrol");
    v26 = [v24 preferenceSpecifierNamed:v25 target:v32 set:sel_setGreyVisualIndicator_ get:sel_greyVisualIndicator detail:0 cell:6 edit:0];
    [v6 addObject:v26];

    v27 = *(Class *)((char *)&v32->super.super.super.super.super.super.isa + v31);
    *(Class *)((char *)&v32->super.super.super.super.super.super.isa + v31) = (Class)v6;
    id v28 = v6;

    v3 = *(Class *)((char *)&v32->super.super.super.super.super.super.isa + v31);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WatchControlGreyActivationController;
  id v6 = a4;
  [(WatchControlGreyActivationController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlGreyActivationController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  uint64_t v8 = [(WatchControlGreyActivationController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(WatchControlGreyActivationController *)self specifierAtIndex:[(WatchControlGreyActivationController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F85B10] sharedInstance];
      objc_msgSend(v15, "setGreyActivationGesture:", objc_msgSend(v14, "integerValue"));

      [(WatchControlGreyActivationController *)self reloadSpecifiers];
    }
  }
}

- (id)greyVisualIndicator
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "showGestureRecognizerIndicator"));

  return v4;
}

- (void)setGreyVisualIndicator:(id)a3
{
  v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setShowGestureRecognizerIndicator:v5];
}

@end