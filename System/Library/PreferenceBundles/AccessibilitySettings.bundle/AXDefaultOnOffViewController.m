@interface AXDefaultOnOffViewController
+ (id)stringValueForNumber:(id)a3;
- (id)getValueSelectedBlock;
- (id)setValueSelectedBlock;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXDefaultOnOffViewController

+ (id)stringValueForNumber:(id)a3
{
  id v3 = a3;
  if ([v3 integerValue] == (id)-1)
  {
    v4 = @"DEFAULT";
  }
  else if ([v3 integerValue] == (char *)&dword_0 + 1)
  {
    v4 = @"ON";
  }
  else
  {
    v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    v8 = settingsLocString(@"DEFAULT", @"Accessibility");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setProperty:&off_22A8A8 forKey:@"value"];
    [v7 addObject:v9];
    v10 = settingsLocString(@"ON", @"Accessibility");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setProperty:&off_22A8C0 forKey:@"value"];
    [v7 addObject:v11];
    v12 = settingsLocString(@"OFF", @"Accessibility");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v13 setProperty:&off_22A8D8 forKey:@"value"];
    [v7 addObject:v13];
    v14 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v7;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  uint64_t v8 = [(AXDefaultOnOffViewController *)self getValueSelectedBlock];
  v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = (*(void (**)(uint64_t))(v8 + 16))(v8);
    v11 = [(AXDefaultOnOffViewController *)self specifierAtIndexPath:v7];
    uint64_t v12 = [v11 propertyForKey:@"value"];

    if (v12 | v10) {
      id v13 = [(id)v12 isEqual:v10];
    }
    else {
      id v13 = &dword_0 + 1;
    }
    [v14 setChecked:v13];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXDefaultOnOffViewController;
  [(AXDefaultOnOffViewController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(AXDefaultOnOffViewController *)self setValueSelectedBlock];
  if (v7)
  {
    uint64_t v8 = [(AXDefaultOnOffViewController *)self specifierAtIndexPath:v6];
    v9 = [v8 propertyForKey:@"value"];
    ((void (**)(void, void *))v7)[2](v7, v9);

    [(AXDefaultOnOffViewController *)self updateTableCheckedSelection:v6];
  }
}

- (id)getValueSelectedBlock
{
  v2 = [(AXDefaultOnOffViewController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"getValueSelectedBlock"];

  return v3;
}

- (id)setValueSelectedBlock
{
  v2 = [(AXDefaultOnOffViewController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"setValueSelectedBlock"];

  return v3;
}

@end