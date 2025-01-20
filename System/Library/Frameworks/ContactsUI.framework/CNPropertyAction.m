@interface CNPropertyAction
+ (void)performDefaultActionForItem:(id)a3 sender:(id)a4;
- (BOOL)canPerformAction;
- (CNPropertyAction)initWithContact:(id)a3;
- (CNPropertyAction)initWithContact:(id)a3 propertyItem:(id)a4;
- (CNPropertyAction)initWithContact:(id)a3 propertyItems:(id)a4;
- (CNPropertyGroupItem)propertyItem;
- (NSArray)propertyItems;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)presentDisambiguationAlertWithSender:(id)a3;
- (void)setPropertyItems:(id)a3;
@end

@implementation CNPropertyAction

- (void).cxx_destruct
{
}

- (void)setPropertyItems:(id)a3
{
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (void)presentDisambiguationAlertWithSender:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CNPropertyAction *)self propertyItems];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = [v9 displayValue];
        v11 = [v9 displayLabel];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke;
        v21[3] = &unk_1E549BC48;
        v21[4] = self;
        v21[5] = v9;
        v12 = [MEMORY[0x1E4FB1410] _actionWithTitle:v10 descriptiveText:v11 image:0 style:0 handler:v21 shouldDismissHandler:0];
        [v4 addAction:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  v13 = (void *)MEMORY[0x1E4FB1410];
  v14 = CNContactsUIBundle();
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke_2;
  v20[3] = &unk_1E549B590;
  v20[4] = self;
  v16 = [v13 actionWithTitle:v15 style:1 handler:v20];
  [v4 addAction:v16];

  v17 = [(CNContactAction *)self delegate];
  [v17 action:self presentViewController:v4 sender:v18];
}

void __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

void __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionWasCanceled:*(void *)(a1 + 32)];
}

- (void)performActionWithSender:(id)a3
{
  id v8 = a3;
  v4 = [(CNPropertyAction *)self propertyItems];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    uint64_t v6 = [(CNPropertyAction *)self propertyItem];
    [(CNPropertyAction *)self performActionForItem:v6 sender:v8];

    uint64_t v7 = [(CNContactAction *)self delegate];
    [v7 actionDidFinish:self];
  }
  else
  {
    [(CNPropertyAction *)self presentDisambiguationAlertWithSender:v8];
  }
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() performDefaultActionForItem:v6 sender:v5];
}

- (BOOL)canPerformAction
{
  return 1;
}

- (CNPropertyGroupItem)propertyItem
{
  id v2 = [(CNPropertyAction *)self propertyItems];
  v3 = [v2 firstObject];

  return (CNPropertyGroupItem *)v3;
}

- (CNPropertyAction)initWithContact:(id)a3 propertyItem:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[CNPropertyAction initWithContact:propertyItems:](self, "initWithContact:propertyItems:", v8, v9, v12, v13);
  return v10;
}

- (CNPropertyAction)initWithContact:(id)a3 propertyItems:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAction;
  id v7 = [(CNContactAction *)&v11 initWithContact:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    propertyItems = v7->_propertyItems;
    v7->_propertyItems = (NSArray *)v8;
  }
  return v7;
}

- (CNPropertyAction)initWithContact:(id)a3
{
  return [(CNPropertyAction *)self initWithContact:a3 propertyItems:MEMORY[0x1E4F1CBF0]];
}

+ (void)performDefaultActionForItem:(id)a3 sender:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = [v4 defaultActionURL];
  if (v9)
  {
    if ([v4 isSuggested])
    {
      Class v10 = (Class)getSGSuggestedActionMetricsClass[0]();
      objc_super v11 = [v4 property];
      id v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 bundleIdentifier];
      [(objc_class *)v10 recordContactDetailUsage:v11 withApp:v13];
    }
    v14 = +[CNUIDataCollector sharedCollector];
    uint64_t v15 = CNUIContactActionTypeTapProperty;
    v25[0] = CNUIContactActionTapPropertyIdentifier;
    v16 = [v4 property];
    v26[0] = v16;
    v25[1] = CNUIDataCollectorActionTypeAttributeContact;
    v17 = [v4 contact];
    v26[1] = v17;
    v25[2] = CNUIDataCollectorActionTypeAttributeLabeledValue;
    id v18 = [v4 labeledValue];
    v26[2] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    [v14 logContactActionType:v15 attributes:v19];

    v20 = +[CNUIContactsEnvironment currentEnvironment];
    v21 = [v20 applicationWorkspace];
    uint64_t v23 = *MEMORY[0x1E4F22320];
    uint64_t v24 = MEMORY[0x1E4F1CC38];
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v21 openSensitiveURLInBackground:v9 withOptions:v22];
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyAction.m", 89, 6, @"%@ doesn’t define a default action URL", v5, v6, v7, v8, (uint64_t)v4);
  }
}

@end