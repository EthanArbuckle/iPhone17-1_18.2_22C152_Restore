@interface HUQuickControlContentCharacteristicWritingUpdateAdapter
- (BOOL)shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges;
- (HFItemManager)itemManager;
- (HUQuickControlContentCharacteristicWritingDelegate)forwardingCharacteristicWritingDelegate;
- (HUQuickControlContentCharacteristicWritingUpdateAdapter)initWithItemManager:(id)a3;
- (_HUQuickControlContentCharacteristicWriteQueuedUpdate)queuedUpdate;
- (id)_characteristicUpdateSuppressionReasonForContent:(id)a3;
- (void)_executeQueuedUpdate;
- (void)dealloc;
- (void)quickControlContent:(id)a3 didEndPossibleWritesForCharacteristics:(id)a4;
- (void)quickControlContent:(id)a3 willBeginPossibleWritesForCharacteristics:(id)a4;
- (void)quickControlContentDidUpdateCharacteristicValueOverrides:(id)a3;
- (void)setForwardingCharacteristicWritingDelegate:(id)a3;
- (void)setQueuedUpdate:(id)a3;
- (void)setShouldIssueItemUpdatesOnCharacteristicOverrideValueChanges:(BOOL)a3;
@end

@implementation HUQuickControlContentCharacteristicWritingUpdateAdapter

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)initWithItemManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlContentCharacteristicWritingUpdateAdapter;
  v6 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemManager, a3);
    v7->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges = 1;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self queuedUpdate];
  v4 = [v3 cancellationToken];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContentCharacteristicWritingUpdateAdapter;
  [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)&v5 dealloc];
}

- (void)_executeQueuedUpdate
{
  v4 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self itemManager];
  objc_super v5 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self itemManager];
  v6 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self queuedUpdate];
  v7 = [v6 affectedCharacteristics];
  v8 = [v5 _itemsToUpdateForModifiedCharacteristics:v7 includeSuppressedCharacteristics:1];
  id v9 = (id)[v4 updateResultsForItems:v8 senderSelector:a2];

  [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self setQueuedUpdate:0];
}

- (void)quickControlContentDidUpdateCharacteristicValueOverrides:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self forwardingCharacteristicWritingDelegate];
  [v5 quickControlContentDidUpdateCharacteristicValueOverrides:v4];

  if ([(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges])
  {
    v6 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self queuedUpdate];

    if (!v6)
    {
      objc_initWeak(&location, self);
      v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __116__HUQuickControlContentCharacteristicWritingUpdateAdapter_quickControlContentDidUpdateCharacteristicValueOverrides___block_invoke;
      v17 = &unk_1E63862A0;
      objc_copyWeak(&v18, &location);
      v8 = [v7 afterDelay:&v14 performBlock:0.05];

      id v9 = [_HUQuickControlContentCharacteristicWriteQueuedUpdate alloc];
      v10 = -[_HUQuickControlContentCharacteristicWriteQueuedUpdate initWithCancellationToken:](v9, "initWithCancellationToken:", v8, v14, v15, v16, v17);
      [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self setQueuedUpdate:v10];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    v11 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self queuedUpdate];
    v12 = [v11 affectedCharacteristics];
    v13 = [v4 affectedCharacteristics];
    [v12 unionSet:v13];
  }
}

void __116__HUQuickControlContentCharacteristicWritingUpdateAdapter_quickControlContentDidUpdateCharacteristicValueOverrides___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _executeQueuedUpdate];
}

- (void)quickControlContent:(id)a3 willBeginPossibleWritesForCharacteristics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self forwardingCharacteristicWritingDelegate];
  [v8 quickControlContent:v7 willBeginPossibleWritesForCharacteristics:v6];

  id v10 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self itemManager];
  id v9 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self _characteristicUpdateSuppressionReasonForContent:v7];

  [v10 beginSuppressingUpdatesForCharacteristics:v6 withReason:v9];
}

- (void)quickControlContent:(id)a3 didEndPossibleWritesForCharacteristics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self forwardingCharacteristicWritingDelegate];
  [v8 quickControlContent:v7 didEndPossibleWritesForCharacteristics:v6];

  id v10 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self itemManager];
  id v9 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)self _characteristicUpdateSuppressionReasonForContent:v7];

  [v10 endSuppressingUpdatesForCharacteristicsWithReason:v9 updateAffectedItems:0];
}

- (id)_characteristicUpdateSuppressionReasonForContent:(id)a3
{
  return (id)objc_msgSend(@"QuickControlUserInteraction", "stringByAppendingFormat:", @"-%p", a3);
}

- (HUQuickControlContentCharacteristicWritingDelegate)forwardingCharacteristicWritingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingCharacteristicWritingDelegate);

  return (HUQuickControlContentCharacteristicWritingDelegate *)WeakRetained;
}

- (void)setForwardingCharacteristicWritingDelegate:(id)a3
{
}

- (BOOL)shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges
{
  return self->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges;
}

- (void)setShouldIssueItemUpdatesOnCharacteristicOverrideValueChanges:(BOOL)a3
{
  self->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges = a3;
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (_HUQuickControlContentCharacteristicWriteQueuedUpdate)queuedUpdate
{
  return self->_queuedUpdate;
}

- (void)setQueuedUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedUpdate, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_destroyWeak((id *)&self->_forwardingCharacteristicWritingDelegate);
}

@end