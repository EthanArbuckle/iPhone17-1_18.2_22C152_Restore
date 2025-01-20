@interface CREditTextController
- (double)_insetHeightForTextView:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_text:(id)a3;
- (id)_textCell;
- (id)specifiers;
- (void)_setText:(id)a3 withSpecifier:(id)a4;
- (void)suspend;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation CREditTextController

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];

  v5 = +[PSSpecifier preferenceSpecifierNamed:&stru_24F60 target:self set:"_setText:withSpecifier:" get:"_text:" detail:0 cell:14 edit:0];
  [v5 setIdentifier:@"CREditTextSpecifierIdentifier"];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 addObject:v5];
  uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
  v7 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v8 = v3;

  id v9 = *(id *)&self->PSListController_opaque[v6];
  return v9;
}

- (void)suspend
{
  v3 = [(CREditTextController *)self _textCell];
  v4 = [v3 textView];
  v5 = [v4 text];

  [(CREditTextController *)self _setText:v5 withSpecifier:0];
  v6.receiver = self;
  v6.super_class = (Class)CREditTextController;
  [(CREditTextController *)&v6 suspend];
}

- (id)_textCell
{
  v3 = [(CREditTextController *)self specifierForID:@"CREditTextSpecifierIdentifier"];
  v4 = [(CREditTextController *)self table];
  v5 = [(CREditTextController *)self indexPathForSpecifier:v3];
  objc_super v6 = [v4 cellForRowAtIndexPath:v5];

  return v6;
}

- (double)_insetHeightForTextView:(id)a3
{
  id v4 = a3;
  PSTextViewInsets();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CREditTextController *)self table];
  [v13 bounds];
  double v15 = v14 - v8 - v12;

  objc_msgSend(v4, "sizeThatFits:", v15, 1.79769313e308);
  double v17 = v16;

  return v10 + v6 + v17;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CREditTextController *)self specifierAtIndexPath:v7];
  double v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"CREditTextSpecifierIdentifier"];

  if (v10
    && ([v8 propertyForKey:PSTableCellKey], (double v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v12 = v11;
    v13 = [v11 textView];
    [(CREditTextController *)self _insetHeightForTextView:v13];
    double v15 = v14;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CREditTextController;
    [(CREditTextController *)&v18 tableView:v6 heightForRowAtIndexPath:v7];
    double v15 = v16;
  }

  return v15;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v13 = [(CREditTextController *)self _textCell];
  [v13 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CREditTextController *)self _insetHeightForTextView:v4];
  double v12 = v11;

  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  [v13 setNeedsLayout];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  [(CREditTextController *)self _setText:v4 withSpecifier:0];
}

- (void)_setText:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    double v6 = [(CREditTextController *)self specifier];
    double v7 = v6;
    if (v6) {
      [v6 performSetterWithValue:v8];
    }

    id v5 = v8;
  }
}

- (id)_text:(id)a3
{
  v3 = [(CREditTextController *)self specifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 performGetter];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end