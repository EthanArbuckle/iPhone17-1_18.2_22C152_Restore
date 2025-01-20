@interface CNPropertySendMessageAction
- (BOOL)shouldPresentDisambiguationMenu;
- (CNActionMenuHelper)actionMenuHelper;
- (CNContactActionsController)actionsController;
- (CNPropertySendMessageAction)initWithContact:(id)a3 propertyItems:(id)a4 actionDataSource:(id)a5;
- (CNUIUserActionListDataSource)actionsDataSource;
- (UIContextMenuInteraction)contextMenuInteraction;
- (id)menuProviderForContextMenuInteraction:(id)a3;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)setActionMenuHelper:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsDataSource:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
@end

@implementation CNPropertySendMessageAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);

  objc_storeStrong((id *)&self->_actionsController, 0);
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setActionMenuHelper:(id)a3
{
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionsDataSource:(id)a3
{
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5 = a4;
  id v7 = [(CNPropertySendMessageAction *)self actionMenuHelper];
  v6 = [(CNPropertySendMessageAction *)self contextMenuInteraction];
  [v7 updateWithMenuItems:v5 contextMenuInteraction:v6];
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v8 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  id v6 = (id)[v8 performActionWithContext:v5];

  id v7 = [(CNContactAction *)self delegate];
  [v7 actionDidFinish:self];

  [(CNPropertySendMessageAction *)self setActionsController:0];
  [(CNPropertySendMessageAction *)self setActionMenuHelper:0];
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 property];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v6)
  {
    id v7 = [v4 labeledValue];
    id v8 = [v7 value];

    uint64_t v9 = [v8 stringValue];
LABEL_5:
    v12 = (void *)v9;

    goto LABEL_7;
  }
  v10 = [v4 property];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v11)
  {
    id v8 = [v4 labeledValue];
    uint64_t v9 = [v8 value];
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:
  v13 = NSString;
  v14 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  v15 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v14];
  v16 = [v13 stringWithFormat:@"sms:%@", v15];

  v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
  v18 = +[CNUIDataCollector sharedCollector];
  uint64_t v19 = CNUIContactActionTypeSendMessage;
  v24[0] = CNUIContactActionDestinationType;
  v20 = &CNUIContactActionDestinationTypePhoneNumber;
  if (!v6) {
    v20 = (uint64_t *)&CNUIContactActionDestinationTypeEmail;
  }
  v25[0] = *v20;
  v24[1] = CNUIDataCollectorActionTypeAttributeContact;
  v21 = [v4 contact];
  v25[1] = v21;
  v24[2] = CNUIDataCollectorActionTypeAttributeLabeledValue;
  v22 = [v4 labeledValue];
  v25[2] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v18 logContactActionType:v19 attributes:v23];

  [(id)*MEMORY[0x1E4FB2608] openURL:v17 withCompletionHandler:0];
}

- (void)performActionWithSender:(id)a3
{
  id v6 = a3;
  if (![(CNPropertySendMessageAction *)self shouldPresentDisambiguationMenu])
  {
    id v4 = [(CNPropertyAction *)self propertyItem];
    [(CNPropertySendMessageAction *)self performActionForItem:v4 sender:v6];

    id v5 = [(CNContactAction *)self delegate];
    [v5 actionDidFinish:self];
  }
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNPropertySendMessageAction *)self shouldPresentDisambiguationMenu])
  {
    [(CNPropertySendMessageAction *)self setContextMenuInteraction:v4];
    id v5 = objc_alloc_init(CNActionMenuHelper);
    [(CNPropertySendMessageAction *)self setActionMenuHelper:v5];

    id v6 = [CNContactActionsController alloc];
    id v7 = [(CNContactAction *)self contact];
    id v8 = [(CNPropertySendMessageAction *)self actionsDataSource];
    v17[0] = *MEMORY[0x1E4F1AD48];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v10 = [(CNContactActionsController *)v6 initWithContact:v7 dataSource:v8 actionTypes:v9];
    [(CNPropertySendMessageAction *)self setActionsController:v10];

    int v11 = [(CNPropertySendMessageAction *)self actionsController];
    [v11 setShouldUseOutlinedActionGlyphStyle:1];

    v12 = [(CNPropertySendMessageAction *)self actionsController];
    [v12 setDelegate:self];

    v13 = [(CNPropertySendMessageAction *)self actionsController];
    [v13 retrieveModels];

    v14 = [(CNPropertySendMessageAction *)self actionMenuHelper];
    v15 = [v14 menuProviderWithActionBlock:&__block_literal_global_43231];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)shouldPresentDisambiguationMenu
{
  v2 = [(CNPropertyAction *)self propertyItems];
  BOOL v3 = [v2 count] != 1;

  return v3;
}

- (CNPropertySendMessageAction)initWithContact:(id)a3 propertyItems:(id)a4 actionDataSource:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNPropertySendMessageAction;
  v10 = [(CNPropertyAction *)&v13 initWithContact:a3 propertyItems:a4];
  int v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_actionsDataSource, a5);
  }

  return v11;
}

@end