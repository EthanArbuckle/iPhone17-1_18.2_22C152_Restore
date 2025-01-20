@interface EKUIRightClickEmptySpaceInteraction
+ (id)localizedPasteStringForEventCount:(unint64_t)a3 includeHere:(BOOL)a4;
- (EKUIRightClickEmptySpaceInteraction)initWithDelegate:(id)a3;
- (EKUIRightClickEmptySpaceInteractionDelegate)delegate;
- (UIContextMenuInteraction)interaction;
- (UIView)view;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInteraction:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation EKUIRightClickEmptySpaceInteraction

- (void)willMoveToView:(id)a3
{
}

- (UIView)view
{
  return (UIView *)[(UIContextMenuInteraction *)self->_interaction view];
}

- (void)didMoveToView:(id)a3
{
}

- (EKUIRightClickEmptySpaceInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKUIRightClickEmptySpaceInteraction;
  v5 = [(EKUIRightClickEmptySpaceInteraction *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(EKUIRightClickEmptySpaceInteraction *)v5 setDelegate:v4];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v6];
    interaction = v6->_interaction;
    v6->_interaction = (UIContextMenuInteraction *)v7;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
}

+ (id)localizedPasteStringForEventCount:(unint64_t)a3 includeHere:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSString;
  uint64_t v7 = EventKitUIBundle();
  v8 = v7;
  if (v4) {
    v9 = @"num_events_to_paste_here";
  }
  else {
    v9 = @"num_events_to_paste";
  }
  objc_super v10 = [v7 localizedStringForKey:v9 value:&stru_1F0CC2140 table:0];
  v11 = objc_msgSend(v6, "localizedStringWithFormat:", v10, a3);

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = [(EKUIRightClickEmptySpaceInteraction *)self view];
  [v5 locationInView:v6];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 locationInView:v6];
  int v12 = objc_msgSend(WeakRetained, "interaction:shouldShowMenuAtPoint:inView:", self, v6);

  if (v12 && [v5 menuAppearance] != 1)
  {
    v14 = (void *)MEMORY[0x1E4FB1678];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_1E608A3A8;
    v16[4] = self;
    uint64_t v18 = v8;
    uint64_t v19 = v10;
    id v17 = v6;
    v13 = [v14 configurationWithIdentifier:0 previewProvider:0 actionProvider:v16];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v6 = (long long *)(a1 + 48);
  int v7 = objc_msgSend(WeakRetained, "interaction:canCreateEventAtPoint:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v7)
  {
    uint64_t v8 = EventKitUIBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"New Event - context menu" value:@"New Event" table:0];

    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
    v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v39[3] = &unk_1E608A380;
    objc_copyWeak(&v41, &location);
    long long v42 = *v6;
    id v40 = *(id *)(a1 + 40);
    int v12 = [v10 actionWithTitle:v9 image:v11 identifier:0 handler:v39];

    [v4 addObject:v12];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v14 = objc_msgSend(v13, "interaction:canCreateReminderAtPoint:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v14)
  {
    v15 = EventKitUIBundle();
    v16 = [v15 localizedStringForKey:@"New Reminder - context menu" value:@"New Reminder" table:0];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v17 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checklist"];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v35[3] = &unk_1E608A380;
    objc_copyWeak(&v37, &location);
    long long v38 = *v6;
    id v36 = *(id *)(a1 + 40);
    uint64_t v19 = [v17 actionWithTitle:v16 image:v18 identifier:0 handler:v35];

    [v4 addObject:v19];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v21 = objc_msgSend(v20, "interaction:canPasteEventAtPoint:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v23 = objc_msgSend(v22, "interaction:titleForPasteActionAtPoint:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v25 = objc_msgSend(v24, "interaction:subtitleForPasteActionAtPoint:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

    objc_initWeak(&location, *(id *)(a1 + 32));
    v26 = (void *)MEMORY[0x1E4FB13F0];
    v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.clipboard"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v31[3] = &unk_1E608A380;
    objc_copyWeak(&v33, &location);
    long long v34 = *v6;
    id v32 = *(id *)(a1 + 40);
    v28 = [v26 actionWithTitle:v23 image:v27 identifier:0 handler:v31];

    if ([v25 length]) {
      [v28 setDiscoverabilityTitle:v25];
    }
    [v4 addObject:v28];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v29 = [MEMORY[0x1E4FB1970] menuWithChildren:v4];

  return v29;
}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:createEventAtPoint:inView:", v4, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    id WeakRetained = v4;
  }
}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:createReminderAtPoint:inView:", v4, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    id WeakRetained = v4;
  }
}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:pasteEventAtPoint:inView:", v4, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    id WeakRetained = v4;
  }
}

- (UIContextMenuInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
}

- (EKUIRightClickEmptySpaceInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIRightClickEmptySpaceInteractionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_interaction, 0);
}

@end