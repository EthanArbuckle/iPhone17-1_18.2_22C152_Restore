@interface WatchControlFocusRingColorController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlFocusRingColorController

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v20 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v19 = v5;
    [v4 addObject:v5];
    v6 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v7 = [v6 focusRingColor];

    v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *MEMORY[0x263F60308];
    do
    {
      v11 = (void *)MEMORY[0x263F5FC40];
      v12 = WCNameForCursorColor();
      v13 = [v11 preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      v14 = [NSNumber numberWithInteger:v9];
      [v13 setProperty:v14 forKey:v10];

      [v4 addObject:v13];
      if (v7 == v9)
      {
        id v15 = v13;

        v8 = v15;
      }

      ++v9;
    }
    while (v9 != 8);
    [v19 setProperty:v8 forKey:*MEMORY[0x263F60200]];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v20);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v20) = (Class)v4;
    id v17 = v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v20);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WatchControlFocusRingColorController;
  id v6 = a4;
  [(WatchControlFocusRingColorController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlFocusRingColorController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = [(WatchControlFocusRingColorController *)self specifiers];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(WatchControlFocusRingColorController *)self specifierAtIndex:[(WatchControlFocusRingColorController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      id v15 = [MEMORY[0x263F85B10] sharedInstance];
      objc_msgSend(v15, "setFocusRingColor:", objc_msgSend(v14, "unsignedIntegerValue"));

      [(WatchControlFocusRingColorController *)self reloadSpecifiers];
    }
  }
}

@end