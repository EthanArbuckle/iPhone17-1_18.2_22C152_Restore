@interface VoiceOverHandGesturesActionDetailController
- (VoiceOverHandGesturesActionDetailControllerDelegate)delegate;
- (id)_mapVOTActionToWCImage:(id)a3;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverHandGesturesActionDetailController

- (id)actionDetailControllerDelegate
{
  v2 = [(VoiceOverHandGesturesActionDetailController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"VoiceOverHandGesturesActionDetailDelegate"];

  return v4;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v23 = (int)*MEMORY[0x263F5FDB8];
    v22 = [MEMORY[0x263EFF980] array];
    v4 = [(VoiceOverHandGesturesActionDetailController *)v2 actionDetailControllerDelegate];
    v31 = [v4 selectedActionForDetailController:v2];

    v5 = [MEMORY[0x263EFF980] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [MEMORY[0x263F84DC8] defaultActions];
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v29 = *(void *)v33;
      v30 = 0;
      uint64_t v25 = *MEMORY[0x263F83628];
      uint64_t v28 = *MEMORY[0x263F60140];
      uint64_t v27 = *MEMORY[0x263F60308];
      uint64_t v26 = *MEMORY[0x263F5FEF8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v10 = [MEMORY[0x263F84DC8] nameForAction:v9];
          v11 = settingsLocString(v10, @"VoiceOverSettings");
          if (([v10 isEqualToString:*MEMORY[0x263F84E00]] & 1) != 0
            || [v10 isEqualToString:*MEMORY[0x263F84DF8]])
          {
            uint64_t v12 = WCNameForAction();

            v11 = (void *)v12;
          }
          v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          v14 = v2;
          v15 = [(VoiceOverHandGesturesActionDetailController *)v2 _mapVOTActionToWCImage:v9];
          if (([v9 isEqualToString:*MEMORY[0x263F84E00]] & 1) != 0
            || [v9 isEqualToString:*MEMORY[0x263F84DF8]])
          {
            uint64_t v16 = AXResizeImageToSystemImage(v15, v25);

            v15 = (void *)v16;
          }
          [v13 setProperty:v15 forKey:v28];
          [v13 setProperty:v9 forKey:v27];
          [v13 setProperty:MEMORY[0x263EFFA88] forKey:v26];
          if ([v9 isEqualToString:v31])
          {
            id v17 = v13;

            v30 = v17;
          }
          v2 = v14;
          [v5 addObject:v13];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }
    else
    {
      v30 = 0;
    }

    if ([v5 count])
    {
      v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
      [v18 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
      [v22 addObject:v18];
      if (v30) {
        [v18 setProperty:v30 forKey:*MEMORY[0x263F60200]];
      }
      [v22 addObjectsFromArray:v5];
    }
    v19 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v23);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v23) = (Class)v22;
    id v20 = v22;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v23);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverHandGesturesActionDetailController;
  id v6 = a4;
  [(VoiceOverHandGesturesActionDetailController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[VoiceOverHandGesturesActionDetailController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = [(VoiceOverHandGesturesActionDetailController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(VoiceOverHandGesturesActionDetailController *)self specifierAtIndex:[(VoiceOverHandGesturesActionDetailController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [(VoiceOverHandGesturesActionDetailController *)self actionDetailControllerDelegate];
      [v15 setAction:v14 forDetailController:self];

      [(VoiceOverHandGesturesActionDetailController *)self reloadSpecifiers];
    }
  }
}

- (id)_mapVOTActionToWCImage:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F84DD0]]
    || [v3 isEqualToString:*MEMORY[0x263F84DE8]]
    || [v3 isEqualToString:*MEMORY[0x263F84DD8]]
    || [v3 isEqualToString:*MEMORY[0x263F84DE0]])
  {
    goto LABEL_5;
  }
  if (([v3 isEqualToString:*MEMORY[0x263F84E08]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F84DF0]])
  {
    id v6 = (void *)MEMORY[0x263F827E8];
    uint64_t v7 = [MEMORY[0x263F84DC8] symbolNameForAction:v3];
    v8 = [v6 systemImageNamed:v7];

    v9 = [MEMORY[0x263F825C8] whiteColor];
    v4 = [v8 imageWithTintColor:v9 renderingMode:1];
  }
  else
  {
    if ([v3 isEqualToString:*MEMORY[0x263F84E00]]
      || [v3 isEqualToString:*MEMORY[0x263F84DF8]])
    {
LABEL_5:
      v4 = WCImageForAction();
      goto LABEL_6;
    }
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (VoiceOverHandGesturesActionDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VoiceOverHandGesturesActionDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end