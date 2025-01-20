@interface HFItemManagerDelegateUpdateRequest
- (BOOL)debug_wasPerformed;
- (BOOL)isInitialUpdate;
- (HFGroupedItemDiff)changes;
- (HFItemManagerDelegateUpdateRequest)init;
- (HFItemManagerDelegateUpdateRequest)initWithChanges:(id)a3 isInitialUpdate:(BOOL)a4 applyChangesBlock:(id)a5 issueDelegateMessagesBlock:(id)a6;
- (id)applyChangesBlock;
- (id)description;
- (id)issueDelegateMessagesBlock;
- (void)performWithOptions:(unint64_t)a3;
@end

@implementation HFItemManagerDelegateUpdateRequest

- (HFItemManagerDelegateUpdateRequest)initWithChanges:(id)a3 isInitialUpdate:(BOOL)a4 applyChangesBlock:(id)a5 issueDelegateMessagesBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HFItemManagerDelegateUpdateRequest;
  v14 = [(HFItemManagerDelegateUpdateRequest *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_changes, a3);
    v15->_initialUpdate = a4;
    v16 = _Block_copy(v12);
    id applyChangesBlock = v15->_applyChangesBlock;
    v15->_id applyChangesBlock = v16;

    v18 = _Block_copy(v13);
    id issueDelegateMessagesBlock = v15->_issueDelegateMessagesBlock;
    v15->_id issueDelegateMessagesBlock = v18;
  }
  return v15;
}

- (BOOL)debug_wasPerformed
{
  return self->_debug_wasPerformed;
}

- (void)performWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v5 = [(HFItemManagerDelegateUpdateRequest *)self applyChangesBlock];
  v5[2]();

  if ((v3 & 1) == 0)
  {
    v6 = [(HFItemManagerDelegateUpdateRequest *)self issueDelegateMessagesBlock];
    v6[2]();
  }
  self->_debug_wasPerformed = 1;
}

- (id)issueDelegateMessagesBlock
{
  return self->_issueDelegateMessagesBlock;
}

- (id)applyChangesBlock
{
  return self->_applyChangesBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_issueDelegateMessagesBlock, 0);
  objc_storeStrong(&self->_applyChangesBlock, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (HFItemManagerDelegateUpdateRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithChanges_isInitialUpdate_applyChangesBlock_issueDelegateMessagesBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemManager.m", 101, @"%s is unavailable; use %@ instead",
    "-[HFItemManagerDelegateUpdateRequest init]",
    v5);

  return 0;
}

- (id)description
{
  char v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HFItemManagerDelegateUpdateRequest isInitialUpdate](self, "isInitialUpdate"), @"isInitialUpdate", 1);
  v5 = [(HFItemManagerDelegateUpdateRequest *)self changes];
  id v6 = (id)[v3 appendObject:v5 withName:@"changes"];

  v7 = [v3 build];

  return v7;
}

- (HFGroupedItemDiff)changes
{
  return self->_changes;
}

- (BOOL)isInitialUpdate
{
  return self->_initialUpdate;
}

@end