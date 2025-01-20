@interface ASTMouseZoomOptionsController
- (id)_localizedDescriptionForPanningStyle:(unint64_t)a3;
- (id)_localizedTitleForPanningStyle:(unint64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)_currentStyle;
- (unint64_t)_panningStyleForIndexPath:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ASTMouseZoomOptionsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"GROUP_SPECIFIER"];
    v7 = [(ASTMouseZoomOptionsController *)self _localizedDescriptionForPanningStyle:[(ASTMouseZoomOptionsController *)self _currentStyle]];
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    unint64_t v8 = kAXSZWPanningStyleFirst;
    unint64_t v9 = kAXSZWPanningStyleLast;
    while (v8 <= v9)
    {
      v10 = [(ASTMouseZoomOptionsController *)self _localizedTitleForPanningStyle:v8];
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v5 addObject:v11];
      ++v8;
    }
    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (unint64_t)_currentStyle
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchMouseZoomPanningStyle];

  return (unint64_t)v3;
}

- (unint64_t)_panningStyleForIndexPath:(id)a3
{
  return (unint64_t)[a3 row];
}

- (id)_localizedTitleForPanningStyle:(unint64_t)a3
{
  if (a3 <= 2)
  {
    settingsLocString(off_20C030[a3], @"HandSettings");
    self = (ASTMouseZoomOptionsController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_localizedDescriptionForPanningStyle:(unint64_t)a3
{
  if (a3 <= 2)
  {
    settingsLocString(off_20C048[a3], @"HandSettings");
    self = (ASTMouseZoomOptionsController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ASTMouseZoomOptionsController;
  id v6 = a4;
  v7 = [(ASTMouseZoomOptionsController *)&v10 tableView:a3 cellForRowAtIndexPath:v6];
  unint64_t v8 = -[ASTMouseZoomOptionsController _panningStyleForIndexPath:](self, "_panningStyleForIndexPath:", v6, v10.receiver, v10.super_class);

  objc_msgSend(v7, "setChecked:", v8 == -[ASTMouseZoomOptionsController _currentStyle](self, "_currentStyle"));

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(ASTMouseZoomOptionsController *)self _panningStyleForIndexPath:v6];
  unint64_t v9 = +[AXSettings sharedInstance];
  [v9 setAssistiveTouchMouseZoomPanningStyle:v8];

  [(ASTMouseZoomOptionsController *)self updateTableCheckedSelection:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  id v11 = [(ASTMouseZoomOptionsController *)self specifierForID:@"GROUP_SPECIFIER"];
  objc_super v10 = [(ASTMouseZoomOptionsController *)self _localizedDescriptionForPanningStyle:v8];
  [v11 setProperty:v10 forKey:PSFooterTextGroupKey];

  [(ASTMouseZoomOptionsController *)self reloadSpecifier:v11 animated:1];
}

@end