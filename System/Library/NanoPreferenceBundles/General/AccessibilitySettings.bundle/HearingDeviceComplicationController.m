@interface HearingDeviceComplicationController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation HearingDeviceComplicationController

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v17 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    uint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263F60138];
    uint64_t v7 = *MEMORY[0x263F60308];
    char v8 = 1;
    do
    {
      char v9 = v8;
      v10 = nameForComplicationPreferredDisplayMode();
      v11 = (void *)MEMORY[0x263F5FC40];
      v12 = nameForComplicationPreferredDisplayMode();
      v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v13 setProperty:v10 forKey:v6];
      v14 = [NSNumber numberWithInteger:v5];
      [v13 setProperty:v14 forKey:v7];

      [v4 addObject:v13];
      char v8 = 0;
      uint64_t v5 = 1;
    }
    while ((v9 & 1) != 0);
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v17);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v17) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v17);
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v12 = [v6 specifier];
  uint64_t v7 = [(id)objc_opt_class() domainAccessorForDomain:*MEMORY[0x263F8B1E8]];
  char v8 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:@"HearingAidComplicationPreferredDisplayMode" domainAccessor:v7];
  uint64_t v9 = [v8 integerValue];

  v10 = [v12 propertyForKey:*MEMORY[0x263F60308]];
  uint64_t v11 = [v10 integerValue];

  [v6 setChecked:v11 == v9];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HearingDeviceComplicationController;
  id v6 = a4;
  id v7 = a3;
  [(HearingDeviceComplicationController *)&v14 tableView:v7 didSelectRowAtIndexPath:v6];
  char v8 = objc_msgSend(v7, "cellForRowAtIndexPath:", v6, v14.receiver, v14.super_class);

  uint64_t v9 = [v8 specifier];
  v10 = [v9 propertyForKey:*MEMORY[0x263F60308]];
  uint64_t v11 = [v10 integerValue];

  id v12 = [NSNumber numberWithInteger:v11];
  v13 = [(id)objc_opt_class() domainAccessorForDomain:*MEMORY[0x263F8B1E8]];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v12 forKey:@"HearingAidComplicationPreferredDisplayMode" domainAccessor:v13];

  [(HearingDeviceComplicationController *)self reloadSpecifiers];
}

@end