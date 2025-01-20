@interface BUCoalescingCallBlock
- (BOOL)isInvoking;
- (BOOL)pending;
- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 blockDescription:(id)a4;
- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 notifyTimeout:(unsigned __int16)a4 blockDescription:(id)a5 notifyTimeoutBlock:(id)a6;
- (NSMutableArray)callbacks;
- (NSString)notifyBlockDescription;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)sync;
- (double)coalescingDelay;
- (double)maximumDelay;
- (id)description;
- (id)notifyBlock;
- (id)notifyTimeoutBlock;
- (unint64_t)nextCoalescingTime;
- (unint64_t)nextMaxTime;
- (unsigned)notifyTimeoutDurationSeconds;
- (void)_coalescingTimeExpired:(unint64_t)a3;
- (void)_invoke;
- (void)_invokeIfNotInProgress;
- (void)_maxTimeExpired:(unint64_t)a3;
- (void)setCallbacks:(id)a3;
- (void)setCoalescingDelay:(double)a3;
- (void)setGroup:(id)a3;
- (void)setInvoking:(BOOL)a3;
- (void)setMaximumDelay:(double)a3;
- (void)setNextCoalescingTime:(unint64_t)a3;
- (void)setNextMaxTime:(unint64_t)a3;
- (void)setNotifyBlock:(id)a3;
- (void)setNotifyBlockDescription:(id)a3;
- (void)setNotifyTimeoutBlock:(id)a3;
- (void)setNotifyTimeoutDurationSeconds:(unsigned __int16)a3;
- (void)setPending:(BOOL)a3;
- (void)setSync:(id)a3;
- (void)signal;
- (void)signalWithCompletion:(id)a3;
@end

@implementation BUCoalescingCallBlock

- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 notifyTimeout:(unsigned __int16)a4 blockDescription:(id)a5 notifyTimeoutBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BUCoalescingCallBlock;
  v15 = [(BUCoalescingCallBlock *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v10, v13, v14);
    id notifyBlock = v15->_notifyBlock;
    v15->_id notifyBlock = (id)v16;

    uint64_t v20 = objc_msgSend_copy(v12, v18, v19);
    id notifyTimeoutBlock = v15->_notifyTimeoutBlock;
    v15->_id notifyTimeoutBlock = (id)v20;

    v15->_notifyTimeoutDurationSeconds = a4;
    uint64_t v24 = objc_msgSend_copy(v11, v22, v23);
    notifyBlockDescription = v15->_notifyBlockDescription;
    v15->_notifyBlockDescription = (NSString *)v24;

    dispatch_group_t v26 = dispatch_group_create();
    group = v15->_group;
    v15->_group = (OS_dispatch_group *)v26;

    dispatch_queue_t v28 = dispatch_queue_create("BUCoalescingCallBlock.sync", 0);
    sync = v15->_sync;
    v15->_sync = (OS_dispatch_queue *)v28;

    v15->_nextCoalescingTime = -1;
    v15->_nextMaxTime = -1;
  }

  return v15;
}

- (void)setMaximumDelay:(double)a3
{
  self->_maximumDelay = a3;
}

- (void)setCoalescingDelay:(double)a3
{
  self->_coalescingDelay = a3;
}

- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 blockDescription:(id)a4
{
  return (BUCoalescingCallBlock *)MEMORY[0x270F9A6D0](self, sel_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_, a3);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v10 = objc_msgSend_notifyBlockDescription(self, v6, v7);
  if (v10) {
    id v11 = @" nb=\"";
  }
  else {
    id v11 = &stru_26CF11AD8;
  }
  id v12 = objc_msgSend_notifyBlockDescription(self, v8, v9);
  uint64_t v16 = objc_msgSend_notifyBlockDescription(self, v13, v14);
  v17 = @"\"";
  if (!v16) {
    v17 = &stru_26CF11AD8;
  }
  v18 = objc_msgSend_stringWithFormat_(v3, v15, @"<%@: %p%@%@%@>", v5, self, v11, v12, v17);

  return v18;
}

- (void)_invokeIfNotInProgress
{
  if (objc_msgSend_isInvoking(self, a2, v2))
  {
    objc_msgSend_setNextMaxTime_(self, v4, -1);
    objc_msgSend_setNextCoalescingTime_(self, v6, -1);
  }
  else
  {
    objc_msgSend__invoke(self, v4, v5);
  }
}

- (void)_invoke
{
  v4 = objc_msgSend_callbacks(self, a2, v2);
  uint64_t v7 = objc_msgSend_copy(v4, v5, v6);

  objc_msgSend_setCallbacks_(self, v8, 0);
  objc_msgSend_setNextMaxTime_(self, v9, -1);
  objc_msgSend_setNextCoalescingTime_(self, v10, -1);
  objc_msgSend_setPending_(self, v11, 0);
  objc_msgSend_setInvoking_(self, v12, 1);
  v15 = objc_msgSend_group(self, v13, v14);
  v18 = objc_msgSend_sync(self, v16, v17);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_21E1D68E8;
  v20[3] = &unk_26449D808;
  v20[4] = self;
  id v21 = v7;
  id v19 = v7;
  dispatch_group_notify(v15, v18, v20);
}

- (void)_maxTimeExpired:(unint64_t)a3
{
  if (objc_msgSend_nextMaxTime(self, a2, a3) == a3)
  {
    objc_msgSend__invokeIfNotInProgress(self, v4, v5);
  }
}

- (void)_coalescingTimeExpired:(unint64_t)a3
{
  if (objc_msgSend_nextCoalescingTime(self, a2, a3) == a3)
  {
    objc_msgSend__invokeIfNotInProgress(self, v4, v5);
  }
  else if (objc_msgSend_nextCoalescingTime(self, v4, v5) != -1)
  {
    uint64_t CoalescingTime = objc_msgSend_nextCoalescingTime(self, v6, v7);
    dispatch_time_t v11 = objc_msgSend_nextCoalescingTime(self, v9, v10);
    uint64_t v14 = objc_msgSend_sync(self, v12, v13);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_21E1D7150;
    v15[3] = &unk_26449D830;
    v15[4] = self;
    v15[5] = CoalescingTime;
    dispatch_after(v11, v14, v15);
  }
}

- (void)signal
{
}

- (void)signalWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_sync(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1D7218;
  v9[3] = &unk_26449D858;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (double)coalescingDelay
{
  return self->_coalescingDelay;
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void)setNotifyBlock:(id)a3
{
}

- (id)notifyTimeoutBlock
{
  return self->_notifyTimeoutBlock;
}

- (void)setNotifyTimeoutBlock:(id)a3
{
}

- (unsigned)notifyTimeoutDurationSeconds
{
  return self->_notifyTimeoutDurationSeconds;
}

- (void)setNotifyTimeoutDurationSeconds:(unsigned __int16)a3
{
  self->_notifyTimeoutDurationSeconds = a3;
}

- (unint64_t)nextCoalescingTime
{
  return self->_nextCoalescingTime;
}

- (void)setNextCoalescingTime:(unint64_t)a3
{
  self->_nextuint64_t CoalescingTime = a3;
}

- (unint64_t)nextMaxTime
{
  return self->_nextMaxTime;
}

- (void)setNextMaxTime:(unint64_t)a3
{
  self->_nextMaxTime = a3;
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (BOOL)isInvoking
{
  return self->_invoking;
}

- (void)setInvoking:(BOOL)a3
{
  self->_invoking = a3;
}

- (NSString)notifyBlockDescription
{
  return self->_notifyBlockDescription;
}

- (void)setNotifyBlockDescription:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_notifyBlockDescription, 0);
  objc_storeStrong(&self->_notifyTimeoutBlock, 0);

  objc_storeStrong(&self->_notifyBlock, 0);
}

@end