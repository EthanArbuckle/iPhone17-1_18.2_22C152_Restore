@interface RTTCannedMessagesController
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (id)cannedReplies;
- (id)cannedRepliesFromSpecifiers;
- (id)customReply:(id)a3;
- (id)newCannedReplySpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)addNewReply:(id)a3;
- (void)returnPressedAtEnd;
- (void)saveReplies;
- (void)setCustomReply:(id)a3 specifier:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RTTCannedMessagesController

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RTTCannedMessagesController;
  [(RTTCannedMessagesController *)&v6 viewWillAppear:a3];
  v4 = [(RTTCannedMessagesController *)self editButtonItem];
  v5 = [(RTTCannedMessagesController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    int v7 = 0;
  }
  else {
    int v7 = [(RTTCannedMessagesController *)self isEditing];
  }
  v11.receiver = self;
  v11.super_class = (Class)RTTCannedMessagesController;
  [(RTTCannedMessagesController *)&v11 setEditing:v5 animated:v4];
  [(RTTCannedMessagesController *)self returnPressedAtEnd];
  v8 = [(RTTCannedMessagesController *)self table];
  [v8 setEditing:v5 animated:1];

  addNewSpecifier = self->_addNewSpecifier;
  if (!addNewSpecifier)
  {
LABEL_7:
    if (!v7) {
      return;
    }
    goto LABEL_8;
  }
  if (v5)
  {
    [(RTTCannedMessagesController *)self removeSpecifier:self->_addNewSpecifier animated:v4];
    goto LABEL_7;
  }
  v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) lastObject];
  [(RTTCannedMessagesController *)self insertSpecifier:addNewSpecifier afterSpecifier:v10 animated:v4];

  if (!v7) {
    return;
  }
LABEL_8:
  [(RTTCannedMessagesController *)self saveReplies];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = (void *)MEMORY[0x263F5FC40];
    int v7 = settingsLocString(@"RTT_CANNED_TEXT_TITLE", @"RTTSettings");
    v8 = [v6 groupSpecifierWithName:v7];

    v9 = settingsLocString(@"RTT_CANNED_TEXT_FOOTER", @"RTTSettings");
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v5 addObject:v8];
    v10 = [(RTTCannedMessagesController *)self cannedReplies];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__RTTCannedMessagesController_specifiers__block_invoke;
    v19[3] = &unk_2651F2240;
    v19[4] = self;
    id v11 = v5;
    id v20 = v11;
    [v10 enumerateObjectsUsingBlock:v19];
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = settingsLocString(@"RTT_CANNED_TEXT_ADD", @"RTTSettings");
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];
    addNewSpecifier = self->_addNewSpecifier;
    self->_addNewSpecifier = v14;

    [(PSSpecifier *)self->_addNewSpecifier setButtonAction:sel_addNewReply_];
    [(PSSpecifier *)self->_addNewSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    [v11 addObject:self->_addNewSpecifier];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v11;
    id v17 = v11;

    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

void __41__RTTCannedMessagesController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)[v3 newCannedReplySpecifier];
  [v5 setProperty:v4 forKey:@"cannedResponse"];

  [*(id *)(a1 + 40) addObject:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RTTCannedMessagesController;
  id v5 = [(RTTCannedMessagesController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    objc_super v6 = [v5 editableTextField];
    [v6 setClearButtonMode:1];

    int v7 = [v5 editableTextField];
    [v7 setReturnKeyType:9];

    objc_msgSend(v5, "setShowsReorderControl:", -[RTTCannedMessagesController isEditing](self, "isEditing"));
  }

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(RTTCannedMessagesController *)self specifierAtIndexPath:a4];
  int64_t v5 = [v4 cellType] == 8;

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = [(RTTCannedMessagesController *)self specifierAtIndexPath:a5];
    -[RTTCannedMessagesController removeSpecifier:animated:](self, "removeSpecifier:animated:");
    if (([(RTTCannedMessagesController *)self isEditing] & 1) == 0) {
      [(RTTCannedMessagesController *)self saveReplies];
    }
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(RTTCannedMessagesController *)self specifierAtIndexPath:a4];
  uint64_t v6 = [v5 cellType];
  if (v6 == 8 || v6 == 6) {
    char v8 = [(RTTCannedMessagesController *)self isEditing];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (int)*MEMORY[0x263F5FDB8];
  if ([*(id *)((char *)&self->super.super.super.super.super.isa + v10) count])
  {
    unint64_t v11 = [(RTTCannedMessagesController *)self indexForIndexPath:v8];
    unint64_t v12 = [(RTTCannedMessagesController *)self indexForIndexPath:v9];
    if (v11 < [*(id *)((char *)&self->super.super.super.super.super.isa + v10) count])
    {
      v13 = [(RTTCannedMessagesController *)self specifierAtIndex:v11];
      if (v13)
      {
        v14 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v10) mutableCopy];
        if (v12 >= [v14 count]) {
          -[RTTCannedMessagesController tableView:moveRowAtIndexPath:toIndexPath:]();
        }
        if (v12 < [v14 count])
        {
          [v14 removeObjectAtIndex:v11];
          [v14 insertObject:v13 atIndex:v12];
        }
        v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v14;
      }
    }
  }
}

- (void)returnPressedAtEnd
{
  id v4 = [(RTTCannedMessagesController *)self view];
  v2 = [v4 window];
  uint64_t v3 = [v2 firstResponder];
  [v3 resignFirstResponder];
}

- (id)newCannedReplySpecifier
{
  id result = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:0 target:self set:sel_setCustomReply_specifier_ get:sel_customReply_ detail:0 cell:8 edit:0];
  *(void *)((char *)result + (int)*MEMORY[0x263F5FE00]) = 2;
  return result;
}

- (void)setCustomReply:(id)a3 specifier:(id)a4
{
  [a4 setProperty:a3 forKey:@"cannedResponse"];

  [(RTTCannedMessagesController *)self saveReplies];
}

- (id)customReply:(id)a3
{
  return (id)[a3 propertyForKey:@"cannedResponse"];
}

- (void)addNewReply:(id)a3
{
  uint64_t v4 = [(RTTCannedMessagesController *)self indexOfSpecifier:self->_addNewSpecifier];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    id v13 = [(RTTCannedMessagesController *)self newCannedReplySpecifier];
    [(RTTCannedMessagesController *)self insertSpecifier:v13 atIndex:v5 animated:1];
    uint64_t v6 = [(RTTCannedMessagesController *)self table];
    id v7 = [(RTTCannedMessagesController *)self indexPathForSpecifier:v13];
    id v8 = [v6 cellForRowAtIndexPath:v7];

    id v9 = [v8 editableTextField];
    [v9 becomeFirstResponder];

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = *MEMORY[0x263F83AC8];
    unint64_t v12 = [v8 editableTextField];
    [v10 postNotificationName:v11 object:v12];
  }
}

- (id)cannedRepliesFromSpecifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "propertyForKey:", @"cannedResponse", (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)cannedReplies
{
  v2 = [MEMORY[0x263F62AE0] sharedInstance];
  id v3 = [v2 cannedResponses];

  return v3;
}

- (void)saveReplies
{
  id v4 = [MEMORY[0x263F62AE0] sharedInstance];
  id v3 = [(RTTCannedMessagesController *)self cannedRepliesFromSpecifiers];
  [v4 setCannedResponses:v3];
}

- (void).cxx_destruct
{
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.1()
{
}

@end