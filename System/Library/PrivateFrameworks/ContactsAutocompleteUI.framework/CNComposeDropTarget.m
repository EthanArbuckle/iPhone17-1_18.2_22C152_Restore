@interface CNComposeDropTarget
+ (id)os_log;
- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3;
- (BOOL)_delegateHandlesDrops;
- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3;
- (BOOL)canLoadContactObjectsFromSession:(id)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)handlesDroppedContacts;
- (BOOL)shouldHandleContactItemsFromSession:(id)a3;
- (CNComposeDropTarget)initWithView:(id)a3 delegate:(id)a4;
- (CNComposeDropTargetDelegate)delegate;
- (NSSet)acceptableUTIs;
- (UIDropInteraction)dropInteraction;
- (UIView)targetView;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)emailRecipientForContact:(id)a3;
- (id)unifiedEmailRecipientForContact:(id)a3;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (unint64_t)composeAddressKind:(unint64_t)a3;
- (void)_delegateDidDropItemsWithDropSession:(id)a3;
- (void)_updateDelegateFlags;
- (void)addContactItemsToTargetViewFromSession:(id)a3;
- (void)addDroppedContacts:(id)a3 toTargetView:(id)a4 forSession:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)handleDropOfContactItemProviders:(id)a3;
- (void)setAcceptableUTIs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation CNComposeDropTarget

+ (id)os_log
{
  if (os_log_cn_once_token_2_0 != -1) {
    dispatch_once(&os_log_cn_once_token_2_0, &__block_literal_global_18);
  }
  v2 = (void *)os_log_cn_once_object_2_0;

  return v2;
}

uint64_t __29__CNComposeDropTarget_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composedroptarget");
  uint64_t v1 = os_log_cn_once_object_2_0;
  os_log_cn_once_object_2_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNComposeDropTarget)initWithView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNComposeDropTarget;
  v8 = [(CNComposeDropTarget *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_targetView, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F429D0]) initWithDelegate:v9];
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = (UIDropInteraction *)v10;

    [v6 addInteraction:v9->_dropInteraction];
    objc_storeWeak((id *)&v9->_delegate, v7);
    [(CNComposeDropTarget *)v9 _updateDelegateFlags];
  }

  return v9;
}

- (void)_updateDelegateFlags
{
  id v3 = [(CNComposeDropTarget *)self delegate];
  self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragEntered = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragExited = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragDidMoveToPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidDropItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToShouldHandleDroppedContacts = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToSendingAddressForTargetView = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToAddressKind = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToComposeRecipientsForDroppedContacts = objc_opt_respondsToSelector() & 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CNComposeDropTarget dropInteraction:sessionDidEnter:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (self->_delegateFlags.respondsToDragEntered)
  {
    v14 = [(CNComposeDropTarget *)self delegate];
    v15 = [(CNComposeDropTarget *)self targetView];
    [v5 locationInView:v15];
    double v17 = v16;
    double v19 = v18;

    objc_msgSend(v14, "dropTarget:dragEnteredAtPoint:", self, v17, v19);
  }
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CNComposeDropTarget dropInteraction:sessionDidExit:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (self->_delegateFlags.respondsToDragExited)
  {
    uint64_t v13 = [(CNComposeDropTarget *)self delegate];
    [v13 dropTargetDragExited:self];
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = ([(CNComposeDropTarget *)self _delegateHandlesDrops]
     || [(CNComposeDropTarget *)self shouldHandleContactItemsFromSession:v5])
    && [(CNComposeDropTarget *)self _sessionContainsOnlyAcceptableTypeIdentifiers:v5];

  return v6;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_delegateFlags.respondsToDragDidMoveToPoint)
  {
    uint64_t v8 = [(CNComposeDropTarget *)self targetView];
    [v7 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    uint64_t v13 = [(CNComposeDropTarget *)self delegate];
    objc_msgSend(v13, "dropTarget:dragDidMoveToPoint:", self, v10, v12);
  }
  if ([v7 allowsMoveOperation])
  {
    v14 = [v7 localDragSession];
    if (v14) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v15 = 2;
  }
  double v16 = (void *)[objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:v15];

  return v16;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CNComposeDropTarget dropInteraction:performDrop:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(CNComposeDropTarget *)self _delegateDidDropItemsWithDropSession:v5];
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  if (!self->_delegateFlags.respondsToDataOwner) {
    return 3;
  }
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  int64_t v8 = [WeakRetained dropTarget:self dataOwnerForSession:v6];

  return v8;
}

- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  id v5 = [v4 items];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CNComposeDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke;
  v7[3] = &unk_1E6129310;
  v7[4] = self;
  v7[5] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __69__CNComposeDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [a2 itemProvider];
  uint64_t v8 = [(id)v7 registeredTypeIdentifiers];
  id v10 = [v6 setWithArray:v8];

  uint64_t v9 = [*(id *)(a1 + 32) acceptableUTIs];
  LOBYTE(v7) = [v9 intersectsSet:v10];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_delegateDidDropItemsWithDropSession:(id)a3
{
  id v12 = a3;
  if (-[CNComposeDropTarget shouldHandleContactItemsFromSession:](self, "shouldHandleContactItemsFromSession:")
    && ([v12 localDragSession], id v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    [(CNComposeDropTarget *)self addContactItemsToTargetViewFromSession:v12];
  }
  else if ([(CNComposeDropTarget *)self _delegateHandlesDrops])
  {
    id v5 = [(CNComposeDropTarget *)self targetView];
    [v12 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    id v10 = [(CNComposeDropTarget *)self delegate];
    char v11 = [v12 items];
    objc_msgSend(v10, "dropTarget:didDropDragItems:atPoint:", self, v11, v7, v9);
  }
}

- (BOOL)_delegateHandlesDrops
{
  return self->_delegateFlags.respondsToDidDropItemsAtPoint != 0;
}

- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3
{
  if (!self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint) {
    return 1;
  }
  id v3 = self;
  id v4 = a3;
  id v5 = [(CNComposeDropTarget *)v3 delegate];
  double v6 = [(CNComposeDropTarget *)v3 targetView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  LOBYTE(v3) = objc_msgSend(v5, "dropTarget:canDropDraggedItemsAtPoint:", v3, v8, v10);
  return (char)v3;
}

- (BOOL)handlesDroppedContacts
{
  return [(CNComposeDropTarget *)self shouldHandleContactItemsFromSession:0];
}

- (BOOL)shouldHandleContactItemsFromSession:(id)a3
{
  id v4 = a3;
  if (self->_delegateFlags.respondsToShouldHandleDroppedContacts
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        [(CNComposeDropTarget *)self targetView],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [WeakRetained dropTarget:self shouldAddDroppedContactsToTargetView:v6 forSession:v4],
        v6,
        WeakRetained,
        v7))
  {
    if (v4) {
      BOOL v8 = [(CNComposeDropTarget *)self canLoadContactObjectsFromSession:v4];
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canLoadContactObjectsFromSession:(id)a3
{
  id v3 = a3;
  char v4 = [v3 canLoadObjectsOfClass:objc_opt_class()];

  return v4;
}

- (void)addContactItemsToTargetViewFromSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(CNComposeDropTarget *)self targetView];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1BC00];
    double v9 = (void *)MEMORY[0x1E4F1B8F8];
    double v10 = +[CNComposeRecipient descriptorsForRequiredKeysForContact];
    char v11 = [NSString stringWithUTF8String:"-[CNComposeDropTarget addContactItemsToTargetViewFromSession:]"];
    id v12 = [v9 descriptorWithKeyDescriptors:v10 description:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__CNComposeDropTarget_addContactItemsToTargetViewFromSession___block_invoke;
    v13[3] = &unk_1E6129338;
    v13[4] = self;
    id v14 = v7;
    id v15 = v4;
    [v8 provideContactsForDropSession:v15 withKeys:v12 completionBlock:v13];
  }
}

uint64_t __62__CNComposeDropTarget_addContactItemsToTargetViewFromSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addDroppedContacts:a2 toTargetView:*(void *)(a1 + 40) forSession:*(void *)(a1 + 48)];
}

- (void)addDroppedContacts:(id)a3 toTargetView:(id)a4 forSession:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke;
  v16[3] = &unk_1E6129360;
  v16[4] = self;
  double v10 = objc_msgSend(a3, "_cn_map:", v16);
  if (self->_delegateFlags.respondsToComposeRecipientsForDroppedContacts)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = [WeakRetained dropTarget:self proposedRecipientsForDroppedContacts:v10 forSession:v9];

    double v10 = (void *)v12;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_2;
  v14[3] = &unk_1E61292C8;
  id v15 = v8;
  id v13 = v8;
  objc_msgSend(v10, "_cn_each:", v14);
}

uint64_t __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) emailRecipientForContact:a2];
}

void __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_3;
  v5[3] = &unk_1E61283C0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addRecipient:*(void *)(a1 + 40)];
}

- (void)handleDropOfContactItemProviders:(id)a3
{
  id v4 = a3;
  if ([(CNComposeDropTarget *)self shouldHandleContactItemsFromSession:0]
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    objc_opt_class();
    id v5 = [(CNComposeDropTarget *)self targetView];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke;
      v8[3] = &unk_1E61293B0;
      v8[4] = self;
      id v9 = v7;
      objc_msgSend(v4, "_cn_each:", v8);
    }
  }
}

void __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 canLoadObjectOfClass:objc_opt_class()])
  {
    uint64_t v4 = objc_opt_class();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke_2;
    v7[3] = &unk_1E6129388;
    id v5 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v6 = (id)[v3 loadObjectOfClass:v4 completionHandler:v7];
  }
}

void __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1BC00];
    v14[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v9 = (void *)MEMORY[0x1E4F1B8F8];
    double v10 = +[CNComposeRecipient descriptorsForRequiredKeysForContact];
    char v11 = [NSString stringWithUTF8String:"-[CNComposeDropTarget handleDropOfContactItemProviders:]_block_invoke_2"];
    uint64_t v12 = [v9 descriptorWithKeyDescriptors:v10 description:v11];
    id v13 = [v7 contactsFromDraggingContacts:v8 withKeys:v12];

    [*(id *)(a1 + 32) addDroppedContacts:v13 toTargetView:*(void *)(a1 + 40) forSession:0];
  }
}

- (id)emailRecipientForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  id v6 = [v4 emailAddresses];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    id v7 = [CNComposeRecipient alloc];
    id v8 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
    id v9 = [(CNComposeRecipient *)v7 initWithContact:v4 address:v8 kind:0];
  }
  else
  {
    id v9 = [(CNComposeDropTarget *)self unifiedEmailRecipientForContact:v4];
  }

  return v9;
}

- (id)unifiedEmailRecipientForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F5A098] factoryWithPriorityDomain:0 sendingAddress:0];
  if (self->_delegateFlags.respondsToAddressKind)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [(CNComposeDropTarget *)self targetView];
    uint64_t v8 = [WeakRetained addressKindForDropTarget:self withTargetView:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [v4 emailAddresses];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke;
  v26[3] = &unk_1E61293D8;
  id v10 = v5;
  id v27 = v10;
  id v11 = v4;
  id v28 = v11;
  v29 = self;
  uint64_t v30 = v8;
  uint64_t v12 = objc_msgSend(v9, "_cn_map:", v26);

  if (self->_delegateFlags.respondsToSendingAddressForTargetView)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = [(CNComposeDropTarget *)self targetView];
    id v15 = [v13 sendingAddressForDropTarget:self withTargetView:v14];

    uint64_t v16 = [MEMORY[0x1E4F605B0] rangeOfAddressDomainFromAddress:v15];
    double v18 = objc_msgSend(v15, "substringWithRange:", v16, v17);
  }
  else
  {
    double v18 = 0;
  }
  double v19 = [MEMORY[0x1E4F1BA28] bestGuessEmailAddressForContact:v11 sendingAddressDomain:v18];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke_2;
  v24[3] = &unk_1E6128188;
  id v25 = v19;
  id v20 = v19;
  v21 = objc_msgSend(v12, "_cn_firstObjectPassingTest:", v24);
  v22 = [[CNUnifiedComposeRecipient alloc] initWithChildren:v12 defaultChild:v21];

  return v22;
}

CNComposeRecipient *__55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5A0A0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 value];
  [v5 setAddress:v6];

  [v5 setAddressType:1];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) identifier];
  id v9 = [v7 localContactResultWithDisplayName:0 value:v5 nameComponents:0 contactIdentifier:v8];

  id v10 = [CNComposeRecipient alloc];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v4 value];

  id v13 = -[CNComposeRecipient initWithContact:address:kind:](v10, "initWithContact:address:kind:", v11, v12, [*(id *)(a1 + 48) composeAddressKind:*(void *)(a1 + 56)]);
  [(CNComposeRecipient *)v13 setAutocompleteResult:v9];

  return v13;
}

uint64_t __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 address];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (unint64_t)composeAddressKind:(unint64_t)a3
{
  if (a3) {
    return 5;
  }
  else {
    return 0;
  }
}

- (NSSet)acceptableUTIs
{
  return self->_acceptableUTIs;
}

- (void)setAcceptableUTIs:(id)a3
{
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (CNComposeDropTargetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNComposeDropTargetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);

  objc_storeStrong((id *)&self->_acceptableUTIs, 0);
}

- (void)dropInteraction:(uint64_t)a3 sessionDidEnter:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dropInteraction:(uint64_t)a3 sessionDidExit:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dropInteraction:(uint64_t)a3 performDrop:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end