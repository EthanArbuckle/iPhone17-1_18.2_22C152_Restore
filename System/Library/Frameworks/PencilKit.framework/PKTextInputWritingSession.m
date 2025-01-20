@interface PKTextInputWritingSession
- (PKTextInputWritingSession)init;
- (id)description;
- (void)_evaluatePendingWritingEndedElements;
- (void)_flushPendingWritingEndedElements:(uint64_t)a1;
- (void)dealloc;
- (void)didEndWritingInElement:(uint64_t)a1;
- (void)didInsertTextInElement:(uint64_t)a1;
- (void)invalidate;
- (void)setCurrentTargetElement:(id *)a1;
- (void)willBeginWritingInElement:(uint64_t)a1;
@end

@implementation PKTextInputWritingSession

- (PKTextInputWritingSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputWritingSession;
  v2 = [(PKTextInputWritingSession *)&v9 init];
  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v2->_beginTimestamp = v3;
    uint64_t v4 = [NSNumber numberWithInteger:_nextWritingSessionIdentifier];
    sessionIdentifier = v2->_sessionIdentifier;
    v2->_sessionIdentifier = (NSNumber *)v4;

    ++_nextWritingSessionIdentifier;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
    pendingWritingEndedElements = v2->_pendingWritingEndedElements;
    v2->_pendingWritingEndedElements = (NSMutableSet *)v6;
  }
  return v2;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextInputWritingSession;
  double v3 = [(PKTextInputWritingSession *)&v8 description];
  uint64_t v4 = v3;
  if (self) {
    sessionIdentifier = self->_sessionIdentifier;
  }
  else {
    sessionIdentifier = 0;
  }
  uint64_t v6 = [v3 stringByAppendingFormat:@" identifier: %@", sessionIdentifier];

  return v6;
}

- (void)setCurrentTargetElement:(id *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    id v6 = a1[5];
    if (v6 != v4)
    {
      id v7 = v6;
      objc_storeStrong(a1 + 5, a2);
      if (v5 && v7 && (-[PKTextInputElement isEquivalentToElement:]((id *)v7, v5) & 1) != 0)
      {
        [v7 swapWritingStateWithElement:v5];
      }
      else
      {
        objc_super v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v28 = a1;
          __int16 v29 = 2112;
          id v30 = v7;
          __int16 v31 = 2112;
          v32 = v5;
          _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Target element changed for writing session %p. (%@) -> (%@)", buf, 0x20u);
        }

        [v7 didMoveToWritingSession:0];
        [v5 didMoveToWritingSession:a1];
        id v9 = v7;
        if (v9 && ([a1[2] containsObject:v9] & 1) == 0)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = a1[2];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:buf count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v24;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v24 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
                if (-[PKTextInputElement isEquivalentToElement:]((id *)v15, v9))
                {
                  id v16 = v15;

                  if (v16) {
                    objc_msgSend(a1[2], "removeObject:", v16, (void)v23);
                  }
                  goto LABEL_22;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:buf count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          id v16 = 0;
LABEL_22:
          objc_msgSend(a1[2], "addObject:", v9, (void)v23);
        }
        -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](a1);
        id v17 = v5;
        if (v17)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v18 = a1[2];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:buf count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v24 != v21) {
                  objc_enumerationMutation(v18);
                }
                if (-[PKTextInputElement isEquivalentToElement:](*(id **)(*((void *)&v23 + 1) + 8 * j), v17))
                {

                  goto LABEL_34;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:buf count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          [v17 willBeginWriting];
        }
LABEL_34:
      }
    }
  }
}

- (void)_evaluatePendingWritingEndedElements
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = a1[2];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v3)
    {
      v5 = v2;
      goto LABEL_18;
    }
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = a1[5];
        if (-[PKTextInputElement isEquivalentToElement:]((id *)v9, v8))
        {
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained(a1 + 6);
          char v11 = [WeakRetained writingSession:a1 elementHasPendingOperations:v8];

          if ((v11 & 1) == 0)
          {
            if (!v5)
            {
              v5 = [MEMORY[0x1E4F1CA80] set];
            }
            [v5 addObject:v8];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);

    if (v5)
    {
      -[PKTextInputWritingSession _flushPendingWritingEndedElements:]((uint64_t)a1, v5);
LABEL_18:
    }
  }
}

- (void)invalidate
{
  if (a1)
  {
    -[PKTextInputWritingSession setCurrentTargetElement:]((id *)a1, 0);
    if ([*(id *)(a1 + 16) count]) {
      -[PKTextInputWritingSession _flushPendingWritingEndedElements:](a1, *(void **)(a1 + 16));
    }
    *(unsigned char *)(a1 + 8) = 1;
  }
}

- (void)_flushPendingWritingEndedElements:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) didEndWriting];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [*(id *)(a1 + 16) minusSet:v4];
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_isInvalidated)
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Deallocating session that hasn't been invalidated %@.", buf, 0xCu);
    }
  }
  if (self->_currentTargetElement)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Deallocating session that still has a current target element %@.", buf, 0xCu);
    }
  }
  if ([(NSMutableSet *)self->_pendingWritingEndedElements count])
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_error_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_ERROR, "Deallocating session that still has pending writing eneded elements %@.", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputWritingSession;
  [(PKTextInputWritingSession *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTargetElement, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_pendingWritingEndedElements, 0);
}

- (void)willBeginWritingInElement:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (id *)(a1 + 48);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained writingSession:a1 willBeginWritingInElement:v4];
  }
}

- (void)didEndWritingInElement:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (id *)(a1 + 48);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained writingSession:a1 didEndWritingInElement:v4];
  }
}

- (void)didInsertTextInElement:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (id *)(a1 + 48);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained writingSession:a1 didInsertTextInElement:v4];
  }
}

@end