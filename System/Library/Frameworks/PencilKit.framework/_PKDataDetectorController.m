@interface _PKDataDetectorController
- (NSArray)currentItems;
- (_PKDataDetectorController)init;
- (_PKDataDetectorControllerDelegate)delegate;
- (id)dataDetectorItemAllItems:(id)a3;
- (id)hitTest:(CGPoint)a3;
- (void)_foundDataDetectorItems:(uint64_t)a1;
- (void)setDelegate:(id)a3;
@end

@implementation _PKDataDetectorController

- (_PKDataDetectorController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PKDataDetectorController;
  v2 = [(_PKDataDetectorController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    currentDataDetectorItems = v2->_currentDataDetectorItems;
    v2->_currentDataDetectorItems = (NSMutableSet *)v3;
  }
  return v2;
}

- (id)hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_currentDataDetectorItems;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "_hitTest:", x, y, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (NSArray)currentItems
{
  return (NSArray *)[(NSMutableSet *)self->_currentDataDetectorItems allObjects];
}

- (void)_foundDataDetectorItems:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CBF0];
    }
    v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
    id v5 = (void *)[*(id *)(a1 + 8) mutableCopy];
    [v5 minusSet:v4];
    id v6 = (void *)[v4 mutableCopy];
    [v6 minusSet:*(void *)(a1 + 8)];
    if ([v5 count])
    {
      uint64_t v7 = os_log_create("com.apple.pencilkit", "DataDetectorController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = [v5 count];
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "removed items: %lu", buf, 0xCu);
      }
    }
    if ([v6 count])
    {
      v8 = os_log_create("com.apple.pencilkit", "DataDetectorController");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v6 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = v9;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_INFO, "added items: %lu", buf, 0xCu);
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) setDelegate:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "setDelegate:", a1, (void)v21);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    [*(id *)(a1 + 8) minusSet:v10];
    [*(id *)(a1 + 8) unionSet:v15];
    if ([v15 count] || objc_msgSend(v10, "count")) && (*(unsigned char *)(a1 + 16))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [WeakRetained _dataDetectorControllerItemsDidChange:a1];
    }
  }
}

- (id)dataDetectorItemAllItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_currentDataDetectorItems count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_currentDataDetectorItems, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_currentDataDetectorItems;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "coreResult", (void)v15);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v13 = [v4 coreResult];
    if (v13)
    {
      uint64_t v19 = v13;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (_PKDataDetectorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PKDataDetectorControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentDataDetectorItems, 0);
}

@end