@interface ASTCursorColorSelectionController
- (ASTCursorColorSelectionControllerDelegate)delegate;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ASTCursorColorSelectionController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v23 = OBJC_IVAR___PSListController__specifiers;
    v26 = objc_opt_new();
    uint64_t v4 = 0;
    uint64_t v25 = PSCellClassKey;
    uint64_t v24 = PSSpecifierIsSearchableKey;
    do
    {
      uint64_t v5 = [(ASTCursorColorSelectionController *)self delegate];
      if (!v5) {
        goto LABEL_6;
      }
      v6 = (void *)v5;
      v7 = [(ASTCursorColorSelectionController *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0
        || ([(ASTCursorColorSelectionController *)self delegate],
            v9 = objc_claimAutoreleasedReturnValue(),
            unsigned int v10 = [v9 cursorColorSelectionController:self allowsCursorColor:v4],
            v9,
            v10))
      {
LABEL_6:
        v11 = AXAssistiveTouchScannerColorDescription();
        v12 = (CGColor *)AXSAssistiveTouchCursorColor();
        Components = CGColorGetComponents(v12);
        v14 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v14 setProperty:objc_opt_class() forKey:v25];
        v15 = +[NSNumber numberWithDouble:*Components];
        v27[0] = v15;
        v16 = +[NSNumber numberWithDouble:Components[1]];
        v27[1] = v16;
        v17 = +[NSNumber numberWithDouble:Components[2]];
        v27[2] = v17;
        v18 = +[NSNumber numberWithDouble:Components[3]];
        v27[3] = v18;
        v19 = +[NSArray arrayWithObjects:v27 count:4];
        [v14 setProperty:v19 forKey:@"rgb"];

        [v14 setProperty:&off_229180 forKey:@"colorType"];
        v20 = +[NSNumber numberWithInteger:v4];
        [v14 setProperty:v20 forKey:@"cursorColor"];

        [v14 setProperty:&__kCFBooleanFalse forKey:v24];
        [v14 setCellType:3];
        [v26 addObject:v14];
      }
      ++v4;
    }
    while (v4 != 8);
    v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v23];
    *(void *)&self->AXUISettingsBaseListController_opaque[v23] = v26;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v23];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)ASTCursorColorSelectionController;
  uint64_t v5 = [(ASTCursorColorSelectionController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  v7 = [v6 propertyForKey:@"cursorColor"];
  id v8 = [v7 integerValue];

  v9 = [(ASTCursorColorSelectionController *)self delegate];

  if (v9)
  {
    unsigned int v10 = [(ASTCursorColorSelectionController *)self delegate];
    objc_msgSend(v5, "setChecked:", objc_msgSend(v10, "selectedColorForSelectionController:", self) == v8);
  }
  else
  {
    [v5 setChecked:0];
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ASTCursorColorSelectionController;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASTCursorColorSelectionController *)&v14 tableView:v7 cellForRowAtIndexPath:v6];
  v9 = objc_msgSend(v8, "specifier", v14.receiver, v14.super_class);
  unsigned int v10 = [v9 propertyForKey:@"cursorColor"];
  id v11 = [v10 integerValue];

  objc_super v12 = [(ASTCursorColorSelectionController *)self delegate];

  if (v12)
  {
    v13 = [(ASTCursorColorSelectionController *)self delegate];
    [v13 cursorColorSelectionController:self selectedCursorColor:v11];
  }
  [(ASTCursorColorSelectionController *)self updateTableCheckedSelection:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (ASTCursorColorSelectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTCursorColorSelectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end