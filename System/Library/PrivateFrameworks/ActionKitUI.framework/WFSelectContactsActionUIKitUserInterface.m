@interface WFSelectContactsActionUIKitUserInterface
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)selectMultiple;
- (NSArray)contactProperties;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)finishWithContacts:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContactProperties:(id)a3;
- (void)setSelectMultiple:(BOOL)a3;
- (void)showWithProperties:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WFSelectContactsActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactProperties, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setContactProperties:(id)a3
{
}

- (NSArray)contactProperties
{
  return self->_contactProperties;
}

- (void)setSelectMultiple:(BOOL)a3
{
  self->_selectMultiple = a3;
}

- (BOOL)selectMultiple
{
  return self->_selectMultiple;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  objc_msgSend(a4, "if_map:", &__block_literal_global_5557);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(WFSelectContactsActionUIKitUserInterface *)self finishWithContacts:v5 error:0];
}

uint64_t __76__WFSelectContactsActionUIKitUserInterface_contactPicker_didSelectContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F33748] contactWithCNContact:a2];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = WFContactFromCNContactProperty();
  v7[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(WFSelectContactsActionUIKitUserInterface *)self finishWithContacts:v6 error:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F33748] contactWithCNContact:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(WFSelectContactsActionUIKitUserInterface *)self contactProperties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v17 = self;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v23 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        v12 = WFContactPropertyIDsFromActionProperties();
        v13 = [v12 firstObject];
        uint64_t v14 = [v13 intValue];

        if ([v5 hasValueForPropertyID:v14])
        {
          uint64_t v15 = [v5 contactWithPropertyID:v14 multivalueIndex:0];

          id v5 = (void *)v15;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_11:
    self = v17;
  }

  v22 = v5;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  [(WFSelectContactsActionUIKitUserInterface *)self finishWithContacts:v16 error:0];
}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFSelectContactsActionUIKitUserInterface *)self finishWithContacts:0 error:v4];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5 = sel_contactPicker_didSelectContacts_ == a3 || sel_contactPicker_didSelectContactProperties_ == a3;
  if (!v5 || (BOOL v6 = [(WFSelectContactsActionUIKitUserInterface *)self selectMultiple]))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSelectContactsActionUIKitUserInterface;
    LOBYTE(v6) = [(WFSelectContactsActionUIKitUserInterface *)&v8 respondsToSelector:a3];
  }
  return v6;
}

- (void)finishWithContacts:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(WFSelectContactsActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    objc_super v8 = [(WFSelectContactsActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFSelectContactsActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __84__WFSelectContactsActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSelectContactsActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __84__WFSelectContactsActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithContacts:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithProperties:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFSelectContactsActionUIKitUserInterface.m", 44, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFSelectContactsActionUIKitUserInterface *)self setContactProperties:v9];
  [(WFSelectContactsActionUIKitUserInterface *)self setCompletionHandler:v10];
  [(WFSelectContactsActionUIKitUserInterface *)self setSelectMultiple:v6];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__WFSelectContactsActionUIKitUserInterface_showWithProperties_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  block[4] = self;
  id v14 = v9;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __96__WFSelectContactsActionUIKitUserInterface_showWithProperties_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v2 = (void *)getCNContactPickerViewControllerClass_softClass;
  uint64_t v16 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getCNContactPickerViewControllerClass_block_invoke;
    v12[3] = &unk_264900EF8;
    v12[4] = &v13;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = objc_alloc_init(v3);
  [v4 setModalPresentationStyle:2];
  [v4 setDelegate:*(void *)(a1 + 32)];
  id v5 = WFCNPropertyKeysFromActionProperties();
  [v4 setDisplayedPropertyKeys:v5];

  BOOL v6 = [v4 displayedPropertyKeys];
  uint64_t v7 = WFPredicateForEnablingPerson();
  [v4 setPredicateForEnablingContact:v7];

  id v8 = [v4 displayedPropertyKeys];
  id v9 = WFPredicateForSelectionOfPerson();
  [v4 setPredicateForSelectionOfContact:v9];

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v4 presentationController];
  [v11 setDelegate:v10];

  [*(id *)(a1 + 32) presentContent:v4];
}

@end