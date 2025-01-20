@interface _GCDevicePhysicalInput
- (BOOL)_commitTransaction:(_GCDevicePhysicalInput *)a1;
- (BOOL)isSnapshot;
- (_GCDevicePhysicalInput)_handleEventTransaction:(_GCDevicePhysicalInput *)result;
- (_GCDevicePhysicalInput)handleMouseEvent:(_GCDevicePhysicalInput *)result;
- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4;
- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4 attributes:(id)a5;
- (_GCDevicePhysicalInput)updateWithElements:(_GCDevicePhysicalInput *)result;
- (double)lastEventTimestamp;
- (id)elementValueDidChangeHandler;
- (id)inputStateAvailableHandler;
- (id)popTransaction;
- (id)queue;
- (uint64_t)currentTransaction;
- (uint64_t)handleGamepadEvent:(uint64_t)result;
- (uint64_t)pendingTransaction;
- (uint64_t)transactionQueueDepth;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setDevice:(id)a3;
- (void)setElementValueDidChangeHandler:(void *)a1;
- (void)setInputStateAvailableHandler:(void *)a1;
- (void)setQueue:(void *)result;
- (void)setTransactionQueueDepth:(void *)result;
- (void)updateViewStateIfNeeded;
@end

@implementation _GCDevicePhysicalInput

- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4 attributes:(id)a5
{
  v9 = objc_opt_new();
  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInput;
  v10 = -[_GCDevicePhysicalInputBase _initWithFacadeTemplate:elementsTemplates:attributes:context:](&v24, sel__initWithFacadeTemplate_elementsTemplates_attributes_context_, a3, [a4 allObjects], a5, v9);
  v11 = (NSMutableArray *)[objc_alloc((Class)&off_26D2B4AE0) initWithCapacity:2];
  id v13 = [(_GCDevicePhysicalInputBase *)v10 viewConfiguration];
  id v15 = [(_GCDevicePhysicalInputBase *)v10 viewState];
  uint64_t v16 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, v10, (uint64_t)v13, (uint64_t)v15);
  [(NSMutableArray *)v11 addObject:v16];
  id v18 = [(_GCDevicePhysicalInputBase *)v10 viewConfiguration];
  id v20 = [(_GCDevicePhysicalInputBase *)v10 viewState];
  v21 = +[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v20);
  uint64_t v22 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, v10, (uint64_t)v18, (uint64_t)v21);
  [(NSMutableArray *)v11 addObject:v22];
  v10->_allTransactions = v11;
  v10->_currentTransaction = (_GCDevicePhysicalInputTransaction *)v16;
  v10->_pendingTransaction = (_GCDevicePhysicalInputTransaction *)v22;
  v10->_bufferedTransactionsQueueDepth = 1;
  v10->_bufferedTransactions = (NSMutableArray *)[objc_alloc((Class)&off_26D2B4AE0) initWithCapacity:1];

  return v10;
}

- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4
{
  v7 = +[NSSet set];

  return [(_GCDevicePhysicalInput *)self initWithFacade:a3 elements:a4 attributes:v7];
}

- (_GCDevicePhysicalInput)updateWithElements:(_GCDevicePhysicalInput *)result
{
  if (result)
  {
    v3 = result;
    pendingTransaction = result->_pendingTransaction;
    v5 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)pendingTransaction);
    uint64_t v6 = [v5 count];
    if (v6 != [a2 count]) {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateWithElements_, v3, @"_GCDevicePhysicalInput.m", 82, @"*** Update is attempting to add or remove physical input elements.  Current elements: %@, New Elements: %@", v5, a2);
    }
    id v8 = [(_GCDevicePhysicalInputBase *)v3->_pendingTransaction viewConfiguration];
    v9 = (char *)+[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v8);
    -[_GCDevicePhysicalInputBase setViewConfiguration:](v3->_pendingTransaction, v9);
    objc_sync_enter(v3);
    currentTransaction = v3->_currentTransaction;
    v40 = v3;
    objc_sync_exit(v3);
    [(_GCDevicePhysicalInputTransaction *)currentTransaction lastEventTimestamp];
    -[_GCDevicePhysicalInputTransaction setLastEventTimestamp:]((uint64_t)pendingTransaction, v11);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v12 = [v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v5);
          }
          v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(a2, "member:", objc_msgSend(v17, "identifier"));
          if (!v18) {
            objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateWithElements_, v40, @"_GCDevicePhysicalInput.m", 93, @"*** Update is attempting to add or remove physical input elements.  Current elements: %@, New Elements: %@", v5, a2);
          }
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = __45___GCDevicePhysicalInput_updateWithElements___block_invoke;
          v50[3] = &unk_26D22C950;
          v50[4] = v17;
          v50[5] = v18;
          -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:]((uint64_t)pendingTransaction, v14 + i, (uint64_t)v50);
        }
        uint64_t v13 = [v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
        v14 += i;
      }
      while (v13);
    }
    v19 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)v40);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          uint64_t v45 = 0;
          uint64_t v26 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](pendingTransaction, v22 + j, &v45, 1);
          if (v26) {
            [v25 preCommit:v26 sender:v40];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
        v22 += j;
      }
      while (v21);
    }
    BOOL v27 = -[_GCDevicePhysicalInput _commitTransaction:](v40, 1);
    objc_sync_enter(v40);
    v28 = v40->_currentTransaction;
    objc_sync_exit(v40);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v29 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v29)
    {
      uint64_t v31 = v29;
      uint64_t v32 = 0;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v19);
          }
          v35 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          uint64_t v45 = 0;
          uint64_t v36 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](v28, v32 + k, &v45, 1);
          if (v36) {
            [v35 postCommit:v36 sender:v40];
          }
        }
        uint64_t v31 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
        v32 += k;
      }
      while (v31);
    }
    result = (_GCDevicePhysicalInput *)objc_getProperty(v40, v30, 120, 1);
    if (result) {
      BOOL v37 = v27;
    }
    else {
      BOOL v37 = 0;
    }
    if (v37)
    {
      v38 = result;
      uint64_t v39 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v40);
      return (_GCDevicePhysicalInput *)((uint64_t (*)(_GCDevicePhysicalInput *, uint64_t))v38->super._dataSource)(v38, v39);
    }
  }
  return result;
}

- (uint64_t)currentTransaction
{
  if (!a1) {
    return 0;
  }
  objc_sync_enter(a1);
  uint64_t v2 = a1[17];
  objc_sync_exit(a1);
  return v2;
}

- (BOOL)_commitTransaction:(_GCDevicePhysicalInput *)a1
{
  if (!a1) {
    return 0;
  }
  objc_sync_enter(a1);
  if (a2)
  {
    uint64_t v18 = (char *)[(_GCDevicePhysicalInputBase *)a1->_pendingTransaction viewConfiguration];
    -[_GCDevicePhysicalInputBase setViewConfiguration:](a1, v18);
  }
  v5 = (char *)[(_GCDevicePhysicalInputBase *)a1->_pendingTransaction viewState];
  -[_GCDevicePhysicalInputBase setViewState:](a1, v5);
  objc_storeStrong((id *)&a1->_currentTransaction, a1->_pendingTransaction);
  objc_storeStrong((id *)&a1->_pendingTransaction, 0);
  [(NSMutableArray *)a1->_bufferedTransactions addObject:a1->_currentTransaction];
  while ([(NSMutableArray *)a1->_bufferedTransactions count] > a1->_bufferedTransactionsQueueDepth)
  {
    [(NSMutableArray *)a1->_bufferedTransactions removeObjectAtIndex:0];
    -[_GCDevicePhysicalInputTransaction invalidateAllUpdateContexts]([(NSMutableArray *)a1->_bufferedTransactions firstObject]);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  allTransactions = a1->_allTransactions;
  uint64_t v8 = [(NSMutableArray *)allTransactions countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(allTransactions);
        }
        double v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v11 retainCount] == 1)
        {
          objc_storeStrong((id *)&a1->_pendingTransaction, v11);
          goto LABEL_17;
        }
      }
      uint64_t v8 = [(NSMutableArray *)allTransactions countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:
  pendingTransaction = a1->_pendingTransaction;
  if (pendingTransaction)
  {
    if (a2)
    {
      objc_super v24 = (char *)[(_GCDevicePhysicalInputBase *)a1 viewConfiguration];
      -[_GCDevicePhysicalInputBase setViewConfiguration:](a1->_pendingTransaction, v24);
      pendingTransaction = a1->_pendingTransaction;
    }
    id v13 = [(_GCDevicePhysicalInputBase *)pendingTransaction viewState];
    id v15 = [(_GCDevicePhysicalInputBase *)a1->_currentTransaction viewState];
    -[_GCDevicePhysicalInputStateTable updateStateTableWithContentsOf:]((uint64_t)v13, (uint64_t)v15);
  }
  else
  {
    id v19 = [(_GCDevicePhysicalInputBase *)a1 viewConfiguration];
    id v21 = [(_GCDevicePhysicalInputBase *)a1 viewState];
    uint64_t v22 = +[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v21);
    uint64_t v23 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, a1, (uint64_t)v19, (uint64_t)v22);
    [(NSMutableArray *)a1->_allTransactions addObject:v23];
    a1->_pendingTransaction = (_GCDevicePhysicalInputTransaction *)v23;
  }
  BOOL v16 = [(NSMutableArray *)a1->_bufferedTransactions count] == 1;
  objc_sync_exit(a1);
  return v16;
}

- (id)inputStateAvailableHandler
{
  if (result) {
    return objc_getProperty(result, a2, 120, 1);
  }
  return result;
}

- (void)dealloc
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  p_allTransactions = &self->_allTransactions;
  allTransactions = self->_allTransactions;
  uint64_t v5 = [(NSMutableArray *)allTransactions countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(allTransactions);
        }
        -[_GCDevicePhysicalInputTransaction detach](*(void **)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v6 = [(NSMutableArray *)allTransactions countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  [(NSMutableArray *)self->_bufferedTransactions removeAllObjects];
  objc_storeStrong((id *)&self->_bufferedTransactions, 0);
  [(NSMutableArray *)*p_allTransactions removeAllObjects];
  objc_storeStrong((id *)p_allTransactions, 0);

  self->_inputStateAvailableHandler = 0;
  self->_elementValueDidChangeHandler = 0;
  objc_setAssociatedObject(self, (const void *)GCDevicePhysicalInputQueueKey, 0, (void *)0x301);
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInput;
  [(_GCDevicePhysicalInputBase *)&v9 dealloc];
}

- (void)setDevice:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInput;
  -[_GCDevicePhysicalInputBase setDevice:](&v5, sel_setDevice_);
  [(NSMutableArray *)self->_allTransactions makeObjectsPerformSelector:sel_setDevice_ withObject:a3];
}

- (void)setDataSource:(id)a3
{
  if (!a3 && [(_GCDevicePhysicalInputBase *)self dataSource]) {
    objc_setAssociatedObject(self, (const void *)GCDevicePhysicalInputQueueKey, (id)[0 physicalInputQueue:self], (void *)0x301);
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInput;
  [(_GCDevicePhysicalInputBase *)&v5 setDataSource:a3];
}

- (id)queue
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = (void *)[result dataSource];
    if (v2)
    {
      return (id)[v2 physicalInputQueue:v1];
    }
    else
    {
      v3 = (const void *)GCDevicePhysicalInputQueueKey;
      return objc_getAssociatedObject(v1, v3);
    }
  }
  return result;
}

- (void)setQueue:(void *)result
{
  if (result)
  {
    v3 = result;
    v4 = (void *)[result dataSource];
    if (v4)
    {
      return (void *)[v4 physicalInput:v3 setQueue:a2];
    }
    else
    {
      [(id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3) willChangeValueForKey:@"queue"];
      objc_setAssociatedObject(v3, (const void *)GCDevicePhysicalInputQueueKey, a2, (void *)0x301);
      objc_super v5 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3);
      return (void *)[v5 didChangeValueForKey:@"queue"];
    }
  }
  return result;
}

- (uint64_t)transactionQueueDepth
{
  if (!a1) {
    return 0;
  }
  objc_sync_enter(a1);
  uint64_t v2 = a1[20];
  objc_sync_exit(a1);
  return v2;
}

- (void)setTransactionQueueDepth:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (a2 <= 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = a2;
    }
    objc_sync_enter(result);
    if (v3 != v2[20]) {
      v2[20] = v3;
    }
    objc_sync_exit(v2);
    v4 = (void *)[v2 dataSource];
    return (void *)[v4 physicalInputTransactionQueueDepthDidChange:v2];
  }
  return result;
}

- (uint64_t)pendingTransaction
{
  if (!a1) {
    return 0;
  }
  objc_sync_enter(a1);
  uint64_t v2 = a1[18];
  objc_sync_exit(a1);
  return v2;
}

- (id)popTransaction
{
  [(_GCDevicePhysicalInputDataSource *)[(_GCDevicePhysicalInputBase *)self dataSource] physicalInputPoll:self forLatest:0];
  objc_sync_enter(self);
  uint64_t v3 = (void *)[(NSMutableArray *)self->_bufferedTransactions firstObject];
  if (v3)
  {
    id v4 = v3;
    [(NSMutableArray *)self->_bufferedTransactions removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

- (void)updateViewStateIfNeeded
{
  uint64_t v3 = [(_GCDevicePhysicalInputBase *)self dataSource];

  [(_GCDevicePhysicalInputDataSource *)v3 physicalInputPoll:self forLatest:1];
}

- (BOOL)isSnapshot
{
  return 0;
}

- (double)lastEventTimestamp
{
  [(_GCDevicePhysicalInput *)self updateViewStateIfNeeded];
  uint64_t v3 = (void *)-[_GCDevicePhysicalInput currentTransaction](self);

  [v3 lastEventTimestamp];
  return result;
}

- (id)elementValueDidChangeHandler
{
  if (result) {
    return objc_getProperty(result, a2, 112, 1);
  }
  return result;
}

- (void)setElementValueDidChangeHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 112);
  }
}

- (void)setInputStateAvailableHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 120);
  }
}

- (_GCDevicePhysicalInput)_handleEventTransaction:(_GCDevicePhysicalInput *)result
{
  if (result)
  {
    uint64_t v2 = result;
    char v3 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&result->_isHandlingEvent, (unsigned __int8 *)&v3, 1u);
    if (v3) {
      -[_GCDevicePhysicalInput _handleEventTransaction:]();
    }
    pendingTransaction = result->_pendingTransaction;
    double v5 = (*(double (**)(uint64_t, _GCDevicePhysicalInputTransaction *))(a2 + 16))(a2, pendingTransaction);
    -[_GCDevicePhysicalInputTransaction setLastEventTimestamp:]((uint64_t)pendingTransaction, v5);
    uint64_t v6 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)v2);
    uint64_t v7 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](v7, (const char *)@"lastEventTimestamp");
    uint64_t v8 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](v8, (const char *)@"lastEventLatency");
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v49 = 0;
          uint64_t v15 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](pendingTransaction, v11 + i, &v49, 1);
          if (v15) {
            [v14 preCommit:v15 sender:v2];
          }
        }
        uint64_t v10 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
        v11 += i;
      }
      while (v10);
    }
    BOOL v40 = -[_GCDevicePhysicalInput _commitTransaction:](v2, 0);
    objc_sync_enter(v2);
    currentTransaction = v2->_currentTransaction;
    objc_sync_exit(v2);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v17 = [v6 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v6);
          }
          uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v49 = 0;
          uint64_t v23 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](currentTransaction, v19 + j, &v49, 1);
          if (v23) {
            [v22 postCommit:v23 sender:v2];
          }
        }
        uint64_t v18 = [v6 countByEnumeratingWithState:&v45 objects:v55 count:16];
        v19 += j;
      }
      while (v18);
    }
    objc_super v24 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](v24, (const char *)@"lastEventLatency");
    long long v25 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](v25, (const char *)@"lastEventTimestamp");
    Property = (void (**)(id, uint64_t, void))objc_getProperty(v2, v26, 112, 1);
    if (Property)
    {
      uint64_t v29 = Property;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v30 = [v6 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v6);
            }
            uint64_t v35 = *(void *)(*((void *)&v41 + 1) + 8 * k);
            if (-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](currentTransaction, v32 + k, 0, 1))
            {
              uint64_t v36 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
              v29[2](v29, v36, v35);
            }
          }
          uint64_t v31 = [v6 countByEnumeratingWithState:&v41 objects:v54 count:16];
          v32 += k;
        }
        while (v31);
      }
    }
    double result = (_GCDevicePhysicalInput *)objc_getProperty(v2, v28, 120, 1);
    BOOL v37 = v40;
    if (!result) {
      BOOL v37 = 0;
    }
    if (v37)
    {
      v38 = result;
      uint64_t v39 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
      double result = (_GCDevicePhysicalInput *)((uint64_t (*)(_GCDevicePhysicalInput *, uint64_t))v38->super._dataSource)(v38, v39);
    }
    atomic_store(0, (unsigned __int8 *)&v2->_isHandlingEvent);
  }
  return result;
}

- (uint64_t)handleGamepadEvent:(uint64_t)result
{
  if (result)
  {
    char v3 = (_GCDevicePhysicalInput *)result;
    [a2 timestamp];
    [(id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)v3) count];
    kdebug_trace();
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke;
    v4[3] = &unk_26D22C9A0;
    v4[4] = a2;
    -[_GCDevicePhysicalInput _handleEventTransaction:](v3, (uint64_t)v4);
    [a2 timestamp];
    [(id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)v3) count];
    return kdebug_trace();
  }
  return result;
}

- (_GCDevicePhysicalInput)handleMouseEvent:(_GCDevicePhysicalInput *)result
{
  if (result)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke;
    v2[3] = &__block_descriptor_56_e43_d16__0___GCDevicePhysicalInputTransaction_8l;
    long long v3 = *a2;
    uint64_t v4 = *((void *)a2 + 2);
    return -[_GCDevicePhysicalInput _handleEventTransaction:](result, (uint64_t)v2);
  }
  return result;
}

- (void)_handleEventTransaction:.cold.1()
{
  qword_267F28C08 = (uint64_t)"BUG IN _GCDevicePhysicalInput: -handleEvent called recursively.";
  __break(1u);
}

@end