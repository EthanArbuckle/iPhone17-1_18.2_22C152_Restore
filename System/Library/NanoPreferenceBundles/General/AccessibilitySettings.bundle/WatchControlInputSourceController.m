@interface WatchControlInputSourceController
- (BOOL)inputSourceTypeEnabled;
- (id)enableInputSourceSpecifiers;
- (id)inputSourceCustomizationSpecifiers;
- (id)inputSourceTypeEnabled:(id)a3;
- (id)specifiers;
- (unint64_t)inputSourceType;
- (void)inputSourceTypeSetEnabled:(id)a3 specifier:(id)a4;
@end

@implementation WatchControlInputSourceController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(WatchControlInputSourceController *)self enableInputSourceSpecifiers];
    v7 = (void *)v6;
    uint64_t v8 = MEMORY[0x263EFFA68];
    if (v6) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = MEMORY[0x263EFFA68];
    }
    [v5 addObjectsFromArray:v9];

    uint64_t v10 = [(WatchControlInputSourceController *)self inputSourceCustomizationSpecifiers];
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v8;
    }
    [v5 addObjectsFromArray:v12];

    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (unint64_t)inputSourceType
{
  v2 = [(WatchControlInputSourceController *)self specifier];
  uint64_t v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"InputSource"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (BOOL)inputSourceTypeEnabled
{
  uint64_t v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = [v3 enabledInputSourceTypes];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WatchControlInputSourceController inputSourceType](self, "inputSourceType"));
  uint64_t v6 = [v4 objectForKey:v5];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)enableInputSourceSpecifiers
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [(WatchControlInputSourceController *)self customizeEnableInputSourceGroupSpecifier:v4];
  [v3 addObject:v4];
  unint64_t v5 = (void *)MEMORY[0x263F5FC40];
  [(WatchControlInputSourceController *)self inputSourceType];
  uint64_t v6 = WCNameForInputSourceType();
  char v7 = [v5 preferenceSpecifierNamed:v6 target:self set:sel_inputSourceTypeSetEnabled_specifier_ get:sel_inputSourceTypeEnabled_ detail:0 cell:6 edit:0];
  [v3 addObject:v7];

  return v3;
}

- (id)inputSourceCustomizationSpecifiers
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)inputSourceTypeSetEnabled:(id)a3 specifier:(id)a4
{
  BOOL v5 = [(WatchControlInputSourceController *)self inputSourceTypeEnabled];
  id v7 = [MEMORY[0x263F85B10] sharedInstance];
  unint64_t v6 = [(WatchControlInputSourceController *)self inputSourceType];
  if (v5) {
    [v7 disableInputSourceType:v6];
  }
  else {
    [v7 enableInputSourceType:v6];
  }
}

- (id)inputSourceTypeEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(WatchControlInputSourceController *)self inputSourceTypeEnabled];

  return (id)[v3 numberWithBool:v4];
}

@end