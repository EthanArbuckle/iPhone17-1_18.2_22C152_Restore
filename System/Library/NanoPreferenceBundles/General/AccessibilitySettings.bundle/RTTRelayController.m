@interface RTTRelayController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldSelectResponderOnAppearance;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)suspend;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RTTRelayController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"TTY_RELAY_FOOTER", @"RTTSettings");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = [(RTTRelayController *)self parentController];
    v10 = [v8 preferenceSpecifierNamed:0 target:v9 set:sel_setRTTRelayNumber_specifier_ get:sel_rttRelayNumber_ detail:0 cell:8 edit:0];

    [v10 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601E8]];
    *(void *)&v10[*MEMORY[0x263F5FE48]] = 2;
    [v5 addObject:v10];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)suspend
{
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)RTTRelayController;
  [(RTTRelayController *)&v4 suspend];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)RTTRelayController;
  [(RTTRelayController *)&v6 viewWillDisappear:v3];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RTTRelayController;
  objc_super v4 = [(RTTRelayController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == 8)
  {
    id v5 = [v4 editableTextField];
    [v5 setAutocapitalizationType:2];
    [v5 setAutocorrectionType:1];
    [v5 setAdjustsFontSizeToFitWidth:1];
    [v5 setReturnKeyType:9];
    [v5 setClearButtonMode:3];
  }

  return v4;
}

@end