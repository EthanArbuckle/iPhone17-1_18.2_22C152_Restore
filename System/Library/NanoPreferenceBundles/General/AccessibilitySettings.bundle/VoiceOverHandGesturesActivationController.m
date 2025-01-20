@interface VoiceOverHandGesturesActivationController
- (id)greyActivationGesture;
- (id)greyVisualIndicator;
- (id)specifiers;
- (void)setGreyVisualIndicator:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverHandGesturesActivationController

- (id)specifiers
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v30 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v6 = v4;
    v29 = v5;
    [v4 addObject:v5];
    v33 = [(VoiceOverHandGesturesActivationController *)self greyActivationGesture];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v7 = [MEMORY[0x263F85B10] sharedInstance];
    v8 = [v7 eligibleGreyActivationGestures];

    id obj = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    v31 = self;
    if (v9)
    {
      uint64_t v10 = v9;
      v11 = 0;
      uint64_t v12 = *(void *)v35;
      uint64_t v13 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v16 = [v15 integerValue];
          v17 = (void *)MEMORY[0x263F5FC40];
          v18 = WCNameForGreyEvent();
          v19 = [v17 preferenceSpecifierNamed:v18 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v20 = [NSNumber numberWithInteger:v16];
          [v19 setProperty:v20 forKey:v13];

          [v6 addObject:v19];
          if ([v15 isEqualToNumber:v33])
          {
            id v21 = v19;

            v11 = v21;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    [v29 setProperty:v11 forKey:*MEMORY[0x263F60200]];
    v22 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v6 addObject:v22];

    v23 = (void *)MEMORY[0x263F5FC40];
    v24 = settingsLocString(@"GREY_VISUAL_INDICATOR_ROW_TITLE", @"AccessibilitySettings-watchcontrol");
    v25 = [v23 preferenceSpecifierNamed:v24 target:v31 set:sel_setGreyVisualIndicator_ get:sel_greyVisualIndicator detail:0 cell:6 edit:0];
    [v6 addObject:v25];

    v26 = *(Class *)((char *)&v31->super.super.super.super.super.super.isa + v30);
    *(Class *)((char *)&v31->super.super.super.super.super.super.isa + v30) = (Class)v6;
    id v27 = v6;

    v3 = *(Class *)((char *)&v31->super.super.super.super.super.super.isa + v30);
  }

  return v3;
}

- (id)greyActivationGesture
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "greyActivationGesture"));

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverHandGesturesActivationController;
  id v6 = a4;
  [(VoiceOverHandGesturesActivationController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[VoiceOverHandGesturesActivationController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = [(VoiceOverHandGesturesActivationController *)self specifiers];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(VoiceOverHandGesturesActivationController *)self specifierAtIndex:[(VoiceOverHandGesturesActivationController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [MEMORY[0x263F85B10] sharedInstance];
      objc_msgSend(v15, "setGreyActivationGesture:", objc_msgSend(v14, "integerValue"));

      [(VoiceOverHandGesturesActivationController *)self reloadSpecifiers];
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