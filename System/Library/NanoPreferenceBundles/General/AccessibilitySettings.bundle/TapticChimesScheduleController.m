@interface TapticChimesScheduleController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TapticChimesScheduleController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TapticChimesScheduleController;
  [(AccessibilityBridgeBaseController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F21DC0] sharedInstance];
  v4 = [v3 tapticChimesScheduleLocalizedTitle];
  [(TapticChimesScheduleController *)self setTitle:v4];
}

- (id)specifiers
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v24 = (int)*MEMORY[0x263F5FDB8];
    v26 = self;
    v4 = [MEMORY[0x263F21DC0] sharedInstance];
    objc_super v5 = [v4 tapticChimesFrequencyOptions];
    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v23 = v7;
    [v6 addObject:v7];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = 0;
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) integerValue];
          v15 = (void *)MEMORY[0x263F5FC40];
          v16 = [v4 localizedStringForTapticChimesFrequencyEncoding:v14];
          v17 = [v15 preferenceSpecifierNamed:v16 target:v26 set:0 get:0 detail:0 cell:3 edit:0];

          v18 = [NSNumber numberWithInteger:v14];
          [v17 setProperty:v18 forKey:v12];

          [v6 addObject:v17];
          if ([v4 voiceOverTapticChimesFrequencyEncoding] == v14)
          {
            id v19 = v17;

            v10 = v19;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    [v23 setProperty:v10 forKey:*MEMORY[0x263F60200]];
    v20 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24);
    *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24) = (Class)v6;
    id v21 = v6;

    v3 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)TapticChimesScheduleController;
  id v6 = a4;
  [(TapticChimesScheduleController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[TapticChimesScheduleController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);
  uint64_t v8 = [(TapticChimesScheduleController *)self specifiers];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(TapticChimesScheduleController *)self specifierAtIndex:[(TapticChimesScheduleController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 integerValue];
      v17 = [MEMORY[0x263F21DC0] sharedInstance];
      [v17 setVoiceOverTapticChimesFrequencyEncoding:v16];

      [(TapticChimesScheduleController *)self reloadSpecifiers];
    }
  }
}

@end