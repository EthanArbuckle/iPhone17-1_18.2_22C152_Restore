@interface HoverTextScrollSpeedViewController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation HoverTextScrollSpeedViewController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v16 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [&off_22C2F0 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = PSTitleKey;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(&off_22C2F0);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = hoverTextScrollingSpeedLocString((unint64_t)[v10 integerValue]);
          v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v12 setProperty:v10 forKey:@"HTScrollSpeed"];
          v13 = hoverTextScrollingSpeedLocString((unint64_t)[v10 integerValue]);
          [v12 setProperty:v13 forKey:v8];

          [v12 setCellType:3];
          [v4 addObject:v12];
        }
        id v6 = [&off_22C2F0 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    v14 = *(void **)&self->AXUISettingsBaseListController_opaque[v16];
    *(void *)&self->AXUISettingsBaseListController_opaque[v16] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v16];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[AXSettings sharedInstance];
  uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 hoverTextScrollingSpeed]);

  id v11 = v5;
  uint64_t v8 = [v11 specifier];
  v9 = [v8 propertyForKey:@"HTScrollSpeed"];
  id v10 = [v9 isEqual:v7];

  [v11 setChecked:v10];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HoverTextScrollSpeedViewController;
  id v6 = a4;
  [(HoverTextScrollSpeedViewController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[HoverTextScrollSpeedViewController specifierAtIndex:](self, "specifierAtIndex:", -[HoverTextScrollSpeedViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v11.receiver, v11.super_class));
  uint64_t v8 = [v7 propertyForKey:@"HTScrollSpeed"];
  id v9 = [v8 integerValue];
  id v10 = +[AXSettings sharedInstance];
  [v10 setHoverTextScrollingSpeed:v9];

  [(HoverTextScrollSpeedViewController *)self updateTableCheckedSelection:v6];
}

@end