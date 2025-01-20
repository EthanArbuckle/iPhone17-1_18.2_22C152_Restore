@interface IndividualSwipeOptionController
- (BOOL)_canSelectOptionAtIndex:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)itemsFromParent;
- (void)listItemSelected:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation IndividualSwipeOptionController

- (void)viewDidLoad
{
  v3 = [(IndividualSwipeOptionController *)self specifier];
  v4 = [v3 performGetter];

  self->_showArchiveFooter = [v4 isEqualToString:@"SwipeActionAlternateDestructiveAction"];
  v5.receiver = self;
  v5.super_class = (Class)IndividualSwipeOptionController;
  [(IndividualSwipeOptionController *)&v5 viewDidLoad];
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IndividualSwipeOptionController;
  [(IndividualSwipeOptionController *)&v8 listItemSelected:v4];
  objc_super v5 = [(IndividualSwipeOptionController *)self specifier];
  v6 = [v5 values];
  v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));

  self->_showArchiveFooter = [v7 isEqualToString:@"SwipeActionAlternateDestructiveAction"];
  [(IndividualSwipeOptionController *)self reloadSpecifiers];
}

- (id)itemsFromParent
{
  v18.receiver = self;
  v18.super_class = (Class)IndividualSwipeOptionController;
  v3 = [(IndividualSwipeOptionController *)&v18 itemsFromParent];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  if (self->_showArchiveFooter)
  {
    objc_super v5 = [v4 firstObject];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SWIPE_OPTIONS_ARCHIVE_INFO" value:&stru_39200 table:@"Preferences"];
    [v5 setProperty:v7 forKey:PSFooterTextGroupKey];
  }
  objc_super v8 = [(IndividualSwipeOptionController *)self specifier];
  v9 = [v8 propertyForKey:@"kLocalizedSwipeDirection"];
  v10 = (char *)[v9 integerValue];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v10 == (unsigned char *)&dword_0 + 1) {
    [v11 localizedStringForKey:@"SWIPE_DIRECTION_LEFT" value:&stru_39200 table:@"Preferences"];
  }
  else {
  v12 = [v11 localizedStringForKey:@"SWIPE_DIRECTION_RIGHT" value:&stru_39200 table:@"Preferences"];
  }

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"SWIPE_OPTIONS_INFO %@" value:&stru_39200 table:@"Preferences"];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

  v16 = +[PSSpecifier groupSpecifierWithName:0];
  [v16 setProperty:v15 forKey:PSFooterTextGroupKey];
  [v4 insertObject:v16 atIndex:0];

  return v4;
}

- (BOOL)_canSelectOptionAtIndex:(unint64_t)a3
{
  objc_super v5 = [(IndividualSwipeOptionController *)self specifier];
  v6 = [v5 propertyForKey:@"kSwipeDirection"];
  v7 = (char *)[v6 integerValue];

  if (v7 == (unsigned char *)&dword_0 + 1) {
    rightSwipeSetting(1);
  }
  else {
  objc_super v8 = leftSwipeSetting(1);
  }
  if ([v8 isEqualToString:@"SwipeActionNone"])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v10 = [(IndividualSwipeOptionController *)self specifier];
    v11 = [v10 values];
    v12 = [v11 objectAtIndex:a3];

    unsigned int v9 = [v12 isEqualToString:v8] ^ 1;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 10.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  LOBYTE(self) = -[IndividualSwipeOptionController _canSelectOptionAtIndex:](self, "_canSelectOptionAtIndex:", [v5 row]);

  return (char)self;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  BOOL v8 = -[IndividualSwipeOptionController _canSelectOptionAtIndex:](self, "_canSelectOptionAtIndex:", [v7 row]);
  unsigned int v9 = [v17 textLabel];
  [v9 setEnabled:v8];

  if (!v8)
  {
    v10 = [(IndividualSwipeOptionController *)self specifier];
    v11 = [v10 propertyForKey:@"kLocalizedSwipeDirection"];
    v12 = (char *)[v11 integerValue];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v12 == (unsigned char *)&dword_0 + 1) {
      [v13 localizedStringForKey:@"SWIPE_RIGHT" value:&stru_39200 table:@"Preferences"];
    }
    else {
    v14 = [v13 localizedStringForKey:@"SWIPE_LEFT" value:&stru_39200 table:@"Preferences"];
    }

    v15 = +[NSString stringWithFormat:@"(%@)", v14];
    v16 = [v17 detailTextLabel];
    [v16 setText:v15];
  }
}

@end