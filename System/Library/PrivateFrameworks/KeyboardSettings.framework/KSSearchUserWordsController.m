@interface KSSearchUserWordsController
- (BOOL)shouldAutorotate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (KSSearchUserWordsController)initWithNavigationController:(id)a3;
- (KSUserWordsManager)dictionaryController;
- (NSArray)filteredListContent;
- (NSArray)noResults;
- (UINavigationController)parentNavigationController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)filterContentForSearchText:(id)a3;
- (void)setDictionaryController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFilteredListContent:(id)a3;
- (void)setNoResults:(id)a3;
- (void)setParentNavigationController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation KSSearchUserWordsController

- (KSSearchUserWordsController)initWithNavigationController:(id)a3
{
  v7[3] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)KSSearchUserWordsController;
  v4 = [(KSSearchUserWordsController *)&v6 init];
  if (v4)
  {
    v7[0] = &stru_2703C6C20;
    v7[1] = &stru_2703C6C20;
    v7[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"NO_RESULTS", &stru_2703C6C20, @"Keyboard");
    v4->_noResults = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
    [(KSSearchUserWordsController *)v4 setEdgesForExtendedLayout:4];
    [(KSSearchUserWordsController *)v4 setParentNavigationController:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSSearchUserWordsController;
  [(KSSearchUserWordsController *)&v3 dealloc];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KSSearchUserWordsController;
  -[KSSearchUserWordsController setEditing:animated:](&v7, sel_setEditing_animated_);
  objc_msgSend((id)-[KSSearchUserWordsController navigationItem](self, "navigationItem"), "setHidesBackButton:animated:", v5, 1);
  objc_msgSend((id)-[KSSearchUserWordsController tableView](self, "tableView"), "setEditing:animated:", v5, v4);
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a4 == 1)
  {
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a5);
    id v7 = -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", [a5 row]);
    v8 = [(KSSearchUserWordsController *)self dictionaryController];
    v9[0] = v7;
    -[KSUserWordsManager addEntries:removeEntries:withCompletionHandler:](v8, "addEntries:removeEntries:withCompletionHandler:", 0, [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1], 0);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  if ([(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count]) {
    return a4;
  }
  else {
    return 0;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count] != 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [a3 deselectRowAtIndexPath:a4 animated:1];
  objc_super v6 = -[KSEditUserWordController initWithUserWord:]([KSEditUserWordController alloc], "initWithUserWord:", -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", [a4 row]));
  [(KSEditUserWordController *)v6 setDictionaryController:[(KSSearchUserWordsController *)self dictionaryController]];
  [(UINavigationController *)[(KSSearchUserWordsController *)self parentNavigationController] pushViewController:v6 animated:1];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count];
  if (!result)
  {
    objc_super v6 = [(KSSearchUserWordsController *)self noResults];
    return [(NSArray *)v6 count];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if ([(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count]) {
    id v7 = @"kCellIdentifier";
  }
  else {
    id v7 = @"kNoResultsIdentifier";
  }
  id v8 = (id)[a3 dequeueReusableCellWithIdentifier:v7];
  if (!v8)
  {
    BOOL v9 = [(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count] != 0;
    id v8 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:v9 reuseIdentifier:v7];
    [v8 setAccessoryType:0];
  }
  if ([(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count])
  {
    id v10 = -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", [a4 row]);
    objc_msgSend((id)objc_msgSend(v8, "detailTextLabel"), "setText:", objc_msgSend(v10, "phrase"));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend(v10, "shortcut"));
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", -[NSArray objectAtIndex:](-[KSSearchUserWordsController noResults](self, "noResults"), "objectAtIndex:", objc_msgSend(a4, "row")));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setTextAlignment:", 1);
    v11 = (void *)[v8 textLabel];
    objc_msgSend(v11, "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.8, 1.0));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setFont:", UISystemFontBoldForSize());
  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(NSArray *)[(KSSearchUserWordsController *)self filteredListContent] count] != 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)filterContentForSearchText:(id)a3
{
  -[KSSearchUserWordsController setFilteredListContent:](self, "setFilteredListContent:", -[NSArray filteredArrayUsingPredicate:](-[KSUserWordsManager entries](-[KSSearchUserWordsController dictionaryController](self, "dictionaryController"), "entries"), "filteredArrayUsingPredicate:", [MEMORY[0x263F08A98] predicateWithFormat:@"(shortcut CONTAINS[c] %@) OR (phrase CONTAINS[c] %@)", a3, a3]));
  BOOL v4 = (void *)[(KSSearchUserWordsController *)self tableView];
  [v4 reloadData];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  if ([a3 isActive])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "searchBar"), "text");
    [(KSSearchUserWordsController *)self filterContentForSearchText:v5];
  }
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
}

- (NSArray)filteredListContent
{
  return self->_filteredListContent;
}

- (void)setFilteredListContent:(id)a3
{
}

- (NSArray)noResults
{
  return self->_noResults;
}

- (void)setNoResults:(id)a3
{
}

- (UINavigationController)parentNavigationController
{
  return self->_parentNavigationController;
}

- (void)setParentNavigationController:(id)a3
{
}

@end