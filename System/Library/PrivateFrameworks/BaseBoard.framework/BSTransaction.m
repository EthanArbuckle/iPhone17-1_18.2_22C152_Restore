@interface BSTransaction
+ (id)_defaultTransactionLog;
- (BOOL)_canBeInterrupted;
- (BOOL)_debugLoggingEnabled;
- (BOOL)_evaluateParentTransactionsWithSchedulingPolicy:(uint64_t)a3 evaluator:;
- (BOOL)_isRootTransaction;
- (BOOL)_removeMilestones:(char)a3 ignoringAuditHistory:;
- (BOOL)_revertWithReason:(id)a3;
- (BOOL)_shouldComplete;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)hasChildTransactionsOfClass:(Class)a3;
- (BOOL)hasStarted;
- (BOOL)isAuditHistoryEnabled;
- (BOOL)isComplete;
- (BOOL)isFailed;
- (BOOL)isFinishedWorking;
- (BOOL)isInterrupted;
- (BOOL)isInterruptible;
- (BOOL)isRunning;
- (BOOL)isWaitingForMilestone:(id)a3;
- (BOOL)removeMilestone:(id)a3;
- (BOOL)removeMilestones:(id)a3;
- (BOOL)shouldWatchdog:(id *)a3;
- (BSTransaction)init;
- (NSArray)allErrors;
- (NSArray)childTransactions;
- (NSError)error;
- (NSSet)milestones;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (double)watchdogTimeout;
- (id)_buildGraphEdgeDescriptionWithType:(uint64_t)a1 fromTransaction:(id)a2 toTransaction:(void *)a3;
- (id)_childTransactionsWithSchedulingPolicy:(uint64_t)a1;
- (id)_createErrorWithCode:(uint64_t)a3 reason:(uint64_t)a4 description:(uint64_t)a5 precipitatingError:;
- (id)_customizedDescriptionProperties;
- (id)_debugLogCategories;
- (id)_descriptionForDebugging:(uint64_t)a1 indentLevel:(int)a2;
- (id)_descriptionForDebugging:(uint64_t)a3 indentLevel:(void *)a4 visited:;
- (id)_descriptionProem;
- (id)_graphNodeDebugName;
- (id)_graphNodeIdentifier;
- (id)_loggingProem;
- (id)_stringForMilestones:(id)a3;
- (id)childTransactionsOfClass:(Class)a3;
- (id)completionBlock;
- (uint64_t)_areConcurrentChildTransactionsFinishedWorking;
- (uint64_t)_beginIfPossible;
- (uint64_t)_terminateNow;
- (void)_addAuditHistoryItem:(id)a3;
- (void)_addDebugLogCategory:(id)a3;
- (void)_checkAndReportIfCompleted;
- (void)_childRelationshipForTransaction:(uint64_t)a1;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)_evaluateCompletion;
- (void)_failForTimeoutWithDescription:(id)a3;
- (void)_failWithError:(uint64_t)a1;
- (void)_failWithReason:(id)a3 description:(id)a4;
- (void)_failWithReason:(id)a3 description:(id)a4 precipitatingError:(id)a5;
- (void)_inFinishedWorkingState;
- (void)_initializeAuditHistoryIfNecessary;
- (void)_interruptWithReason:(char)a3 force:;
- (void)_isDoingWork;
- (void)_noteCompleted;
- (void)_parentRelationshipForTransaction:(void *)a1;
- (void)_populateGraphIntoNodes:(void *)a3 edges:;
- (void)_preventTransactionCompletionForReason:(char)a3 ignoringAuditHistory:(uint64_t)a4 andExecuteBlock:;
- (void)_removeChildTransactionRelationship:(id *)a1;
- (void)_removeDebugLogCategory:(id)a3;
- (void)_removeParentTransaction:(uint64_t)a1;
- (void)_setState:(uint64_t)a1;
- (void)_unsafe_enumerateChildTransactionsWithBlock:(uint64_t)a1;
- (void)_unsafe_enumerateParentTransactionsWithBlock:(uint64_t)a1;
- (void)addChildTransaction:(id)a3;
- (void)addChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4;
- (void)addMilestone:(id)a3;
- (void)addMilestones:(id)a3;
- (void)addObserver:(id)a3;
- (void)begin;
- (void)dealloc;
- (void)evaluateMilestone:(id)a3 withEvaluator:(id)a4;
- (void)failWithReason:(id)a3;
- (void)interrupt;
- (void)interruptWithReason:(id)a3;
- (void)listenForSatisfiedMilestone:(id)a3 withBlock:(id)a4;
- (void)registerBlockObserver:(id)a3;
- (void)removeAllChildTransactions;
- (void)removeAllChildTransactionsOfClass:(Class)a3;
- (void)removeAllMilestones;
- (void)removeChildTransaction:(id)a3;
- (void)removeObserver:(id)a3;
- (void)satisfyMilestone:(id)a3;
- (void)setAuditHistoryEnabled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation BSTransaction

- (void)addChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v7 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v7);

  if (a4 == 1)
  {
    id v8 = a3;
    if (a3 && *((void *)a3 + 9))
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2 object:self file:@"BSTransaction.m" lineNumber:262 description:@"Cannot add a serial child transaction if the child has already begun."];

      id v8 = a3;
    }
    -[BSTransaction _inFinishedWorkingState](self);
LABEL_22:
    if ([(BSTransaction *)self isComplete])
    {
      if ([(BSTransaction *)self _debugLoggingEnabled])
      {
        contexta = (void *)MEMORY[0x18C125360]();
        v19 = [(BSTransaction *)self _descriptionProem];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v20 = [(BSTransaction *)self _debugLogCategories];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v57 != v22) {
                objc_enumerationMutation(v20);
              }
              v24 = *(NSObject **)(*((void *)&v56 + 1) + 8 * i);
              if (v19 && os_log_type_enabled(*(os_log_t *)(*((void *)&v56 + 1) + 8 * i), OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v19;
                _os_log_debug_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
              }
              v25 = v24;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                v26 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v26;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = self;
                __int16 v74 = 2114;
                id v75 = a3;
                id v27 = v26;
                _os_log_debug_impl(&dword_18AAA8000, v25, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add child transaction because we have already completed: %{public}@", buf, 0x20u);
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v21);
        }
      }
      return;
    }
    if (!v8) {
      return;
    }
    if (self)
    {
      v28 = -[BSTransaction _childRelationshipForTransaction:]((uint64_t)self, (uint64_t)v8);

      id v8 = a3;
      if (v28) {
        return;
      }
    }
    v29 = [_BSTransactionChildRelationship alloc];
    if (v29
      && (*(void *)buf = v29,
          *(void *)&buf[8] = _BSTransactionChildRelationship,
          (id v30 = objc_msgSendSuper2((objc_super *)buf, sel_init)) != 0))
    {
      v55 = v30;
      objc_storeStrong((id *)v30 + 1, v8);
      v55[2] = a4;
      if (!self) {
        goto LABEL_82;
      }
    }
    else
    {
      v55 = 0;
      if (!self)
      {
LABEL_82:

        return;
      }
    }
    if (v55) {
      v31 = (void *)v55[1];
    }
    else {
      v31 = 0;
    }
    v32 = v31;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v33 = self->_debugLogCategories;
    uint64_t v34 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v64 objects:buf count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v33);
          }
          [v32 _addDebugLogCategory:*(void *)(*((void *)&v64 + 1) + 8 * j)];
        }
        uint64_t v34 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v64 objects:buf count:16];
      }
      while (v34);
    }

    [v32 setAuditHistoryEnabled:self->_auditHistoryEnabled];
    [(BSTransaction *)self _willAddChildTransaction:v32];
    if (os_log_type_enabled((os_log_t)self->_auditHistoryLog, OS_LOG_TYPE_INFO)
      || [(BSTransaction *)self isAuditHistoryEnabled])
    {
      v37 = [v32 _descriptionProem];
      if ([(BSTransaction *)self isAuditHistoryEnabled]) {
        [(BSTransaction *)self _addAuditHistoryItem:@"Adding child transaction: %@", v37];
      }
      v38 = self->_auditHistoryLog;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_INFO))
      {
        v39 = objc_opt_class();
        *(_DWORD *)v70 = 138543874;
        *(void *)&v70[4] = v39;
        *(_WORD *)&v70[12] = 2048;
        *(void *)&v70[14] = self;
        __int16 v71 = 2114;
        v72 = v37;
        id v40 = v39;
        _os_log_impl(&dword_18AAA8000, (os_log_t)v38, OS_LOG_TYPE_INFO, "<%{public}@:%p> Adding child transaction: %{public}@", v70, 0x20u);
      }
    }
    if (v55) {
      uint64_t v41 = v55[2];
    }
    else {
      uint64_t v41 = 0;
    }
    -[NSMutableArray addObject:](self->_childTransactionRelationships, "addObject:");
    if (v32)
    {
      v42 = -[BSTransaction _parentRelationshipForTransaction:](v32[1], (uint64_t)self);

      if (v42)
      {
        v51 = [MEMORY[0x1E4F28B00] currentHandler];
        [v51 handleFailureInMethod:sel__addParentTransaction_withSchedulingPolicy_ object:v32 file:@"BSTransaction.m" lineNumber:1090 description:@"Cannot add the same parent transaction twice."];
      }
      v43 = [_BSTransactionParentRelationship alloc];
      if (v43)
      {
        *(void *)v70 = v43;
        *(void *)&v70[8] = _BSTransactionParentRelationship;
        id v44 = objc_msgSendSuper2((objc_super *)v70, sel_init);
        v45 = v44;
        if (v44)
        {
          *((void *)v44 + 1) = self;
          *((void *)v44 + 2) = v41;
        }
      }
      else
      {
        v45 = 0;
      }
      [v32[1] addObject:v45];
    }
    [(BSTransaction *)self _didAddChildTransaction:v32];
    if (!self->_inSubclassBegin)
    {
      unsigned __int8 v46 = -[BSTransaction _isDoingWork](self);
      unsigned __int8 v47 = v41 ? 0 : v46;
      if ((v47 & 1) != 0
        || ((unsigned int v48 = -[BSTransaction _inFinishedWorkingState](self), v41 == 1) ? (v49 = v48) : (v49 = 0),
            v49 == 1))
      {
        -[BSTransaction _beginIfPossible]((uint64_t)v32);
        -[BSTransaction _checkAndReportIfCompleted]((id *)&self->super.isa);
      }
    }

    goto LABEL_82;
  }
  unsigned int v9 = -[BSTransaction _inFinishedWorkingState](self);
  id v8 = a3;
  if (a4 || !v9) {
    goto LABEL_22;
  }
  if ([(BSTransaction *)self _debugLoggingEnabled])
  {
    context = (void *)MEMORY[0x18C125360]();
    v10 = [(BSTransaction *)self _descriptionProem];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v11 = [(BSTransaction *)self _debugLogCategories];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v12; ++k)
        {
          if (*(void *)v61 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(NSObject **)(*((void *)&v60 + 1) + 8 * k);
          if (v10 && os_log_type_enabled(*(os_log_t *)(*((void *)&v60 + 1) + 8 * k), OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v10;
            _os_log_debug_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
          }
          v16 = v15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = self;
            __int16 v74 = 2114;
            id v75 = a3;
            id v18 = v17;
            _os_log_debug_impl(&dword_18AAA8000, v16, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add concurrent child transaction because we have already finished doing work: %{public}@", buf, 0x20u);
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v12);
    }
  }
}

- (void)_addDebugLogCategory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_debugLogCategories)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    debugLogCategories = self->_debugLogCategories;
    self->_debugLogCategories = v5;

    if (!a3) {
      return;
    }
  }
  [(NSMutableSet *)self->_debugLogCategories addObject:a3];
  if (!self->_disableDebugLogCheckForUnitTesting && os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG))
  {
    self->_debugLoggingEnabled = 1;
    -[BSTransaction _initializeAuditHistoryIfNecessary](self);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_childTransactionRelationships;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v11) {
          v11 = (void *)v11[1];
        }
        uint64_t v12 = v11;
        objc_msgSend(v12, "_addDebugLogCategory:", a3, (void)v13);
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_checkAndReportIfCompleted
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1[2] count];
    uint64_t v3 = [a1[7] count];
    if ([a1 isRunning])
    {
      char v4 = [a1 isComplete];
      int v5 = -[BSTransaction _areConcurrentChildTransactionsFinishedWorking]((uint64_t)a1);
      if ((v4 & 1) == 0)
      {
        int v6 = v5;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v50) = 1;
        *(void *)v51 = MEMORY[0x1E4F143A8];
        *(void *)&v51[8] = 3221225472;
        *(void *)&v51[16] = __46__BSTransaction__areChildTransactionsComplete__block_invoke;
        v52 = &unk_1E5445A90;
        v53 = (id *)buf;
        -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)a1, (uint64_t)v51);
        if (v3) {
          int v7 = 0;
        }
        else {
          int v7 = v6;
        }
        int v8 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (v2) {
          int v9 = 0;
        }
        else {
          int v9 = v7;
        }
        if (!v8) {
          int v9 = 0;
        }
        if (v7 == 1)
        {
          int v35 = v9;
          if (([a1 isFinishedWorking] & 1) == 0)
          {
            -[BSTransaction _setState:]((uint64_t)a1, 2uLL);
            [a1 _didFinishWork];
            *(void *)v51 = MEMORY[0x1E4F143A8];
            *(void *)&v51[8] = 3221225472;
            *(void *)&v51[16] = __47__BSTransaction__notifyObserversOfFinishedWork__block_invoke;
            v52 = &unk_1E5445A68;
            v53 = a1;
            [a1 _enumerateObserversWithBlock:v51];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v10 = [MEMORY[0x1E4F1CA48] array];
            *(void *)v51 = MEMORY[0x1E4F143A8];
            *(void *)&v51[8] = 3221225472;
            *(void *)&v51[16] = __57__BSTransaction__parentTransactionsWithSchedulingPolicy___block_invoke;
            v52 = &unk_1E5445B70;
            uint64_t v54 = 0;
            v11 = v10;
            v53 = (id *)v11;
            -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:]((uint64_t)a1, (uint64_t)v51);

            uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v45;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v45 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  long long v15 = *(id **)(*((void *)&v44 + 1) + 8 * i);
                  if (v15)
                  {
                    long long v16 = [*(id *)(*((void *)&v44 + 1) + 8 * i) queue];
                    BSDispatchQueueAssert(v16);

                    if (os_log_type_enabled((os_log_t)v15[11], OS_LOG_TYPE_INFO)
                      || [v15 isAuditHistoryEnabled])
                    {
                      v17 = [a1 _descriptionProem];
                      if ([v15 isAuditHistoryEnabled]) {
                        [v15 _addAuditHistoryItem:@"Child transaction finished work: %@", v17];
                      }
                      uint64_t v18 = v15[11];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                      {
                        v19 = objc_opt_class();
                        *(_DWORD *)buf = 138543874;
                        *(void *)&buf[4] = v19;
                        *(_WORD *)&buf[12] = 2048;
                        *(void *)&buf[14] = v15;
                        *(_WORD *)&unsigned char buf[22] = 2114;
                        v50 = v17;
                        id v20 = v19;
                        _os_log_impl(&dword_18AAA8000, v18, OS_LOG_TYPE_INFO, "<%{public}@:%p> Child transaction finished work: %{public}@", buf, 0x20u);
                      }
                    }
                    [v15 _childTransactionDidFinishWork:a1];
                    -[BSTransaction _checkAndReportIfCompleted](v15);
                  }
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
              }
              while (v12);
            }

            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v21 = -[BSTransaction _childTransactionsWithSchedulingPolicy:]((uint64_t)a1, 1);
            uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:buf count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v41 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  -[BSTransaction _beginIfPossible](*(void *)(*((void *)&v40 + 1) + 8 * j));
                }
                uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:buf count:16];
              }
              while (v22);
            }
          }
          int v9 = v35;
        }
        if (v9)
        {
          if ([a1 _shouldComplete])
          {
            [a1 _willComplete];
            -[BSTransaction _noteCompleted](a1);
          }
          else if ([a1 _debugLoggingEnabled])
          {
            context = (void *)MEMORY[0x18C125360]();
            v25 = [a1 _descriptionProem];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            v26 = [a1 _debugLogCategories];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v37;
              do
              {
                uint64_t v29 = 0;
                do
                {
                  if (*(void *)v37 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  id v30 = *(NSObject **)(*((void *)&v36 + 1) + 8 * v29);
                  if (v25 && os_log_type_enabled(*(os_log_t *)(*((void *)&v36 + 1) + 8 * v29), OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v51 = 138412290;
                    *(void *)&v51[4] = v25;
                    _os_log_debug_impl(&dword_18AAA8000, v30, OS_LOG_TYPE_DEBUG, "%@:", v51, 0xCu);
                  }
                  v31 = v30;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    v32 = objc_opt_class();
                    *(_DWORD *)v51 = 138543618;
                    *(void *)&v51[4] = v32;
                    *(_WORD *)&v51[12] = 2048;
                    *(void *)&v51[14] = a1;
                    id v33 = v32;
                    _os_log_debug_impl(&dword_18AAA8000, v31, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction wishes to extend its life beyond its normal completion", v51, 0x16u);
                  }
                  ++v29;
                }
                while (v27 != v29);
                uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
              }
              while (v27);
            }
          }
        }
      }
    }
    else
    {
      -[BSTransaction _areConcurrentChildTransactionsFinishedWorking]((uint64_t)a1);
    }
  }
}

- (uint64_t)_areConcurrentChildTransactionsFinishedWorking
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__BSTransaction__areConcurrentChildTransactionsFinishedWorking__block_invoke;
  v3[3] = &unk_1E5445A90;
  v3[4] = &v4;
  -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:](a1, (uint64_t)v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_unsafe_enumerateChildTransactionsWithBlock:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__unsafe_enumerateChildTransactionsWithBlock_, a1, @"BSTransaction.m", 1229, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
    }
    char v17 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
LABEL_6:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          id v9 = *(id *)(v8 + 8);
          uint64_t v10 = *(void *)(v8 + 16);
        }
        else
        {
          id v9 = 0;
          uint64_t v10 = 0;
        }
        (*(void (**)(uint64_t, id, uint64_t, char *))(a2 + 16))(a2, v9, v10, &v17);

        if (v17) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v11 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
          uint64_t v5 = v11;
          if (v11) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
}

uint64_t __63__BSTransaction__areConcurrentChildTransactionsFinishedWorking__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v5 = result;
    result = [a2 isFinishedWorking];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isFinishedWorking
{
  if (-[BSTransaction _inFinishedWorkingState](self)) {
    return 1;
  }
  return [(BSTransaction *)self isComplete];
}

uint64_t __46__BSTransaction__areChildTransactionsComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isComplete];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isRunning
{
  uint64_t v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  if (-[BSTransaction _isDoingWork](self)) {
    return 1;
  }
  return -[BSTransaction _inFinishedWorkingState](self);
}

- (void)_isDoingWork
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result queue];
    BSDispatchQueueAssert(v2);

    return (void *)(v1[9] == 1);
  }
  return result;
}

- (void)_inFinishedWorkingState
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result queue];
    BSDispatchQueueAssert(v2);

    return (void *)(v1[9] == 2);
  }
  return result;
}

- (BOOL)isComplete
{
  uint64_t v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  return self->_state == 3 || self->_failed || self->_aborted;
}

- (OS_dispatch_queue)queue
{
  uint64_t v2 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (void)_parentRelationshipForTransaction:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        if (v7) {
          uint64_t v8 = v7[1];
        }
        else {
          uint64_t v8 = 0;
        }
        if (v8 == a2)
        {
          uint64_t v10 = v7;
          goto LABEL_15;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v9;
    }
    while (v9);
  }
  uint64_t v10 = 0;
LABEL_15:

  return v10;
}

- (void)_setState:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = *(void *)(a1 + 72);
    if (v4 != a2)
    {
      if (!os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_INFO))
      {
        if (![(id)a1 isAuditHistoryEnabled])
        {
LABEL_11:
          *(void *)(a1 + 72) = a2;
          return;
        }
        unint64_t v4 = *(void *)(a1 + 72);
      }
      uint64_t v5 = NSStringFromBSTransactionState(v4);
      uint64_t v6 = NSStringFromBSTransactionState(a2);
      if ([(id)a1 isAuditHistoryEnabled]) {
        [(id)a1 _addAuditHistoryItem:@"State changed from '%@' to '%@'", v5, v6];
      }
      uint64_t v7 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138544130;
        id v10 = (id)objc_opt_class();
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        long long v14 = v5;
        __int16 v15 = 2114;
        long long v16 = v6;
        id v8 = v10;
        _os_log_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> State changed from '%{public}@' to '%{public}@'", buf, 0x2Au);
      }
      goto LABEL_11;
    }
  }
}

- (BOOL)isAuditHistoryEnabled
{
  return self->_auditHistoryEnabled || self->_debugLoggingEnabled || self->_cachedDefaultBasedAuditHistoryEnabled;
}

- (void)_addAuditHistoryItem:(id)a3
{
  if (self->_auditHistory)
  {
    if (self->_state != 3)
    {
      unint64_t v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v7];
      auditHistory = self->_auditHistory;
      uint64_t v6 = +[BSAuditHistoryItem itemWithString:v4];
      [(BSAuditHistory *)auditHistory addItem:v6];
    }
  }
}

- (id)_descriptionProem
{
  return self->_cachedDescriptionProem;
}

uint64_t __56__BSTransaction__childTransactionsWithSchedulingPolicy___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 40) == a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)setAuditHistoryEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_auditHistoryEnabled != a3)
  {
    self->_auditHistoryEnabled = a3;
    -[BSTransaction _initializeAuditHistoryIfNecessary](self);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    unint64_t v4 = [(BSTransaction *)self childTransactions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setAuditHistoryEnabled:self->_auditHistoryEnabled];
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_childRelationshipForTransaction:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
          if (v7) {
            uint64_t v8 = v7[1];
          }
          else {
            uint64_t v8 = 0;
          }
          if (v8 == a2)
          {
            long long v10 = v7;
            goto LABEL_16;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v9 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v4 = v9;
      }
      while (v9);
    }
    long long v10 = 0;
LABEL_16:
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

- (NSArray)childTransactions
{
  id v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_childTransactionRelationships, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__BSTransaction_childTransactions__block_invoke;
  v7[3] = &unk_1E5445A40;
  id v5 = v4;
  id v8 = v5;
  -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)self, (uint64_t)v7);

  return (NSArray *)v5;
}

- (void)_initializeAuditHistoryIfNecessary
{
  if (a1 && !a1[10] && [a1 isAuditHistoryEnabled])
  {
    uint64_t v2 = objc_alloc_init(BSAuditHistory);
    id v3 = (void *)a1[10];
    a1[10] = v2;
  }
}

- (BOOL)_shouldComplete
{
  return 1;
}

uint64_t __34__BSTransaction_childTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)satisfyMilestone:(id)a3
{
}

- (void)addChildTransaction:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  if (a3 && ![(NSHashTable *)self->_observers containsObject:a3])
  {
    observers = self->_observers;
    [(NSHashTable *)observers addObject:a3];
  }
}

- (void)evaluateMilestone:(id)a3 withEvaluator:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v7);

  if (a4
    && ![(BSTransaction *)self isComplete]
    && [(BSTransaction *)self isWaitingForMilestone:a3]
    && (*((unsigned int (**)(id))a4 + 2))(a4))
  {
    id v8 = [NSString stringWithFormat:@"Milestone satisfied: %@", a3];
    [(BSTransaction *)self _addAuditHistoryItem:@"%@", v8];
    uint64_t v9 = self->_auditHistoryLog;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2048;
      long long v15 = self;
      __int16 v16 = 2114;
      id v17 = a3;
      id v10 = v13;
      _os_log_impl(&dword_18AAA8000, (os_log_t)v9, OS_LOG_TYPE_INFO, "<%{public}@:%p> Milestone satisfied: %{public}@", buf, 0x20u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__BSTransaction_evaluateMilestone_withEvaluator___block_invoke;
    v11[3] = &unk_1E54456B8;
    v11[4] = self;
    v11[5] = a3;
    -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:]((uint64_t)self, (uint64_t)v8, 1, (uint64_t)v11);
  }
}

- (BOOL)isWaitingForMilestone:(id)a3
{
  id v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  milestones = self->_milestones;
  return [(NSMutableSet *)milestones containsObject:a3];
}

uint64_t __34__BSTransaction_satisfyMilestone___block_invoke()
{
  return 1;
}

- (void)_noteCompleted
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1[9] != 3)
  {
    uint64_t v1 = a1;
    -[BSTransaction _setState:]((uint64_t)v1, 3uLL);
    [(id)v1[4] timeIntervalSinceNow];
    double v3 = -v2;
    if ([v1 isAuditHistoryEnabled]) {
      [v1 _addAuditHistoryItem:@"Completed after %.2fs.", *(void *)&v3];
    }
    uint64_t v4 = (id)v1[11];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v1;
      *(_WORD *)&unsigned char buf[22] = 2050;
      double v57 = v3;
      id v5 = *(id *)&buf[4];
      _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "<%{public}@:%p> Completed after %{public}.2fs.", buf, 0x20u);
    }
    [v1 _didComplete];
    uint64_t v6 = v1[16];
    if (v6)
    {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, [v1 isFailed] ^ 1);
      uint64_t v7 = (void *)v1[16];
      v1[16] = 0;
    }
    [(id)v1[5] removeAllObjects];
    id v8 = (void *)v1[5];
    v1[5] = 0;

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __45__BSTransaction__notifyObserversOfCompletion__block_invoke;
    v53[3] = &unk_1E5445A68;
    v53[4] = v1;
    [v1 _enumerateObserversWithBlock:v53];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v9 = (id)v1[15];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v9);
          }
          [(id)v1[8] removeObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:buf count:16];
      }
      while (v10);
    }

    [(id)v1[15] removeAllObjects];
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"BSTransactionCompletedNotification" object:v1];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    __int16 v14 = [MEMORY[0x1E4F1CA48] array];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __36__BSTransaction__parentTransactions__block_invoke;
    double v57 = COERCE_DOUBLE(&unk_1E5445A40);
    id v15 = v14;
    id v58 = v15;
    -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:]((uint64_t)v1, (uint64_t)buf);

    uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(id **)(*((void *)&v45 + 1) + 8 * j);
          if (v19)
          {
            id v20 = [*(id *)(*((void *)&v45 + 1) + 8 * j) queue];
            BSDispatchQueueAssert(v20);

            if ([v1 isFailed]) {
              int v21 = [v19 _shouldFailForChildTransaction:v1];
            }
            else {
              int v21 = 0;
            }
            if (os_log_type_enabled((os_log_t)v19[11], OS_LOG_TYPE_INFO)
              || [v19 isAuditHistoryEnabled])
            {
              uint64_t v22 = [v1 _descriptionProem];
              if ([v19 isAuditHistoryEnabled]) {
                [v19 _addAuditHistoryItem:@"Child transaction completed: %@", v22];
              }
              uint64_t v23 = v19[11];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v24 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v24;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v19;
                *(_WORD *)&unsigned char buf[22] = 2114;
                double v57 = *(double *)&v22;
                id v25 = v24;
                _os_log_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_INFO, "<%{public}@:%p> Child transaction completed: %{public}@", buf, 0x20u);
              }
            }
            [v19 _childTransactionDidComplete:v1];
            if (v21)
            {
              v26 = NSString;
              uint64_t v27 = [v1 _descriptionProem];
              uint64_t v28 = [v26 stringWithFormat:@"Child transaction failed: %@", v27];

              uint64_t v29 = [v1 error];
              id v30 = -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)v19, 1, @"child transaction", (uint64_t)v28, (uint64_t)v29);

              -[BSTransaction _failWithError:]((uint64_t)v19, v30);
            }
            -[BSTransaction _checkAndReportIfCompleted](v19);
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v16);
    }

    if ([v1 _isRootTransaction] && objc_msgSend(v1, "_debugLoggingEnabled"))
    {
      context = (void *)MEMORY[0x18C125360]();
      v31 = [v1 _descriptionProem];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v32 = [v1 _debugLogCategories];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v42;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v42 != v34) {
              objc_enumerationMutation(v32);
            }
            long long v36 = *(NSObject **)(*((void *)&v41 + 1) + 8 * v35);
            if (v31 && os_log_type_enabled(*(os_log_t *)(*((void *)&v41 + 1) + 8 * v35), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v31;
              _os_log_debug_impl(&dword_18AAA8000, v36, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            long long v37 = v36;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              long long v38 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v38;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v1;
              *(_WORD *)&unsigned char buf[22] = 2114;
              double v57 = *(double *)&v1;
              id v39 = v38;
              _os_log_debug_impl(&dword_18AAA8000, v37, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction completed: %{public}@", buf, 0x20u);
            }
            ++v35;
          }
          while (v33 != v35);
          uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v33);
      }
    }
  }
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (void)dealloc
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(BSTransaction *)self _debugLoggingEnabled])
  {
    context = (void *)MEMORY[0x18C125360]();
    double v3 = [(BSTransaction *)self _descriptionProem];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [(BSTransaction *)self _debugLogCategories];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v25;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(NSObject **)(*((void *)&v24 + 1) + 8 * v7);
          if (v3 && os_log_type_enabled(*(os_log_t *)(*((void *)&v24 + 1) + 8 * v7), OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v3;
            _os_log_debug_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
          }
          id v9 = v8;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v10 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v30 = v10;
            __int16 v31 = 2048;
            v32 = self;
            id v11 = v10;
            _os_log_debug_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Dealloc", buf, 0x16u);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v5);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v12 = (void *)[(NSMutableArray *)self->_childTransactionRelationships copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v16) {
          uint64_t v16 = (void *)v16[1];
        }
        uint64_t v17 = v16;
        -[BSTransaction _removeParentTransaction:]((uint64_t)v17, (uint64_t)self);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  v19.receiver = self;
  v19.super_class = (Class)BSTransaction;
  [(BSTransaction *)&v19 dealloc];
}

- (void)_removeParentTransaction:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = -[BSTransaction _parentRelationshipForTransaction:](*(void **)(a1 + 8), a2);
    id v5 = (id)v3;
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel__removeParentTransaction_ object:a1 file:@"BSTransaction.m" lineNumber:1099 description:@"Cannot remove a parent transaction that is not actually a parent."];

      uint64_t v3 = 0;
    }
    [*(id *)(a1 + 8) removeObject:v3];
    if ([*(id *)(a1 + 8) count] && !*(void *)(a1 + 72)) {
      -[BSTransaction _beginIfPossible](a1);
    }
  }
}

- (BOOL)_debugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

uint64_t __22__BSTransaction_begin__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _willBegin];
  double v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __22__BSTransaction_begin__block_invoke_2;
  v14[3] = &unk_1E5445A68;
  v14[4] = v2;
  [v2 _enumerateObserversWithBlock:v14];
  -[BSTransaction _setState:](*(void *)(a1 + 32), 1uLL);
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = 1;
  [*(id *)(a1 + 32) _begin];
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = -[BSTransaction _childTransactionsWithSchedulingPolicy:](*(void *)(a1 + 32), 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        -[BSTransaction _beginIfPossible](*(void *)(*((void *)&v10 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _didBegin];
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __22__BSTransaction_begin__block_invoke_3;
  v9[3] = &unk_1E5445A68;
  v9[4] = v7;
  return [v7 _enumerateObserversWithBlock:v9];
}

- (id)_childTransactionsWithSchedulingPolicy:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__BSTransaction__childTransactionsWithSchedulingPolicy___block_invoke;
    v7[3] = &unk_1E5445B70;
    uint64_t v9 = a2;
    id v5 = v4;
    id v8 = v5;
    -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:](a1, (uint64_t)v7);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)addMilestones:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v4);

  if ([a3 count])
  {
    if ([(BSTransaction *)self isFinishedWorking])
    {
      if ([(BSTransaction *)self _debugLoggingEnabled])
      {
        context = (void *)MEMORY[0x18C125360]();
        id v5 = [(BSTransaction *)self _descriptionProem];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v6 = [(BSTransaction *)self _debugLogCategories];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v21;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v21 != v8) {
                objc_enumerationMutation(v6);
              }
              long long v10 = *(NSObject **)(*((void *)&v20 + 1) + 8 * v9);
              if (v5 && os_log_type_enabled(*(os_log_t *)(*((void *)&v20 + 1) + 8 * v9), OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v25 = v5;
                _os_log_debug_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
              }
              long long v11 = v10;
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                id v12 = (id)objc_opt_class();
                long long v13 = [(BSTransaction *)self _stringForMilestones:a3];
                *(_DWORD *)buf = 138543874;
                id v25 = v12;
                __int16 v26 = 2048;
                long long v27 = self;
                __int16 v28 = 2114;
                uint64_t v29 = v13;
                _os_log_debug_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add milestones because we have already finished working: %{public}@", buf, 0x20u);
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v7);
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_auditHistoryLog, OS_LOG_TYPE_INFO)
        || [(BSTransaction *)self isAuditHistoryEnabled])
      {
        if ([(BSTransaction *)self isAuditHistoryEnabled])
        {
          uint64_t v14 = [(BSTransaction *)self _stringForMilestones:a3];
          [(BSTransaction *)self _addAuditHistoryItem:@"Milestones added: %@", v14];
        }
        id v15 = self->_auditHistoryLog;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
        {
          id v16 = (id)objc_opt_class();
          uint64_t v17 = [(BSTransaction *)self _stringForMilestones:a3];
          *(_DWORD *)buf = 138543874;
          id v25 = v16;
          __int16 v26 = 2048;
          long long v27 = self;
          __int16 v28 = 2114;
          uint64_t v29 = v17;
          _os_log_impl(&dword_18AAA8000, (os_log_t)v15, OS_LOG_TYPE_INFO, "<%{public}@:%p> Milestones added: %{public}@", buf, 0x20u);
        }
      }
      [(NSMutableSet *)self->_milestones unionSet:a3];
    }
  }
}

- (id)_stringForMilestones:(id)a3
{
  if ([a3 count])
  {
    uint64_t v4 = [a3 allObjects];
    id v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    id v5 = @"(none)";
  }
  return v5;
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v8 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v8);

  if (a3)
  {
    id v9 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v9 count];
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [v9 objectAtIndex:i];
        (*((void (**)(id, void *))a3 + 2))(a3, v7);
      }
    }
  }
}

- (void)begin
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v4);

  uint64_t v5 = self;
  uint64_t v6 = (uint64_t)v5;
  if (v5->_failed)
  {
    if ([(BSTransaction *)v5 _debugLoggingEnabled])
    {
      context = (void *)MEMORY[0x18C125360]();
      uint64_t v7 = [(id)v6 _descriptionProem];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v8 = [(id)v6 _debugLogCategories];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v37;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v37 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = *(NSObject **)(*((void *)&v36 + 1) + 8 * v11);
            if (v7 && os_log_type_enabled(*(os_log_t *)(*((void *)&v36 + 1) + 8 * v11), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v42 = v7;
              _os_log_debug_impl(&dword_18AAA8000, v12, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            long long v13 = v12;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              id v14 = (id)objc_opt_class();
              id v15 = [*(id *)(v6 + 144) localizedDescription];
              *(_DWORD *)buf = 138543874;
              id v42 = v14;
              __int16 v43 = 2048;
              uint64_t v44 = v6;
              __int16 v45 = 2114;
              uint64_t v46 = (uint64_t)v15;
              _os_log_debug_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Unable to begin transaction, because the transaction failed prior to starting with error: %{public}@", buf, 0x20u);
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v47 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    if (v5->_state)
    {
      long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:v6 file:@"BSTransaction.m" lineNumber:386 description:@"Cannot begin a transaction that has already begun or completed."];
    }
    if (!-[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:](v6, 1, (uint64_t)&__block_literal_global_322))
    {
      __int16 v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v6 file:@"BSTransaction.m" lineNumber:387 description:@"Cannot begin a serial child transaction if all parents are not finished doing work."];
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v17 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v16;

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __22__BSTransaction_begin__block_invoke;
    v35[3] = &unk_1E54457C8;
    v35[4] = v6;
    -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:](v6, @"beginning", 0, (uint64_t)v35);
    if ([(id)v6 _isRootTransaction]
      && ([(id)v6 isComplete] & 1) == 0
      && [(id)v6 _debugLoggingEnabled])
    {
      contexta = (void *)MEMORY[0x18C125360]();
      uint64_t v18 = [(id)v6 _descriptionProem];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      objc_super v19 = [(id)v6 _debugLogCategories];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v32;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v19);
            }
            long long v23 = *(NSObject **)(*((void *)&v31 + 1) + 8 * v22);
            if (v18 && os_log_type_enabled(*(os_log_t *)(*((void *)&v31 + 1) + 8 * v22), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v42 = v18;
              _os_log_debug_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            long long v24 = v23;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              id v25 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              id v42 = v25;
              __int16 v43 = 2048;
              uint64_t v44 = v6;
              __int16 v45 = 2114;
              uint64_t v46 = v6;
              id v26 = v25;
              _os_log_debug_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction started: %{public}@", buf, 0x20u);
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v20);
      }
    }
  }
}

- (BOOL)_isRootTransaction
{
  uint64_t v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  return [(NSMutableArray *)self->_parentTransactionRelationships count] == 0;
}

- (void)_preventTransactionCompletionForReason:(char)a3 ignoringAuditHistory:(uint64_t)a4 andExecuteBlock:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1 && a4)
  {
    [*(id *)(a1 + 16) addObject:a2];
    if ((a3 & 1) == 0)
    {
      if ([(id)a1 isAuditHistoryEnabled]) {
        [(id)a1 _addAuditHistoryItem:@"Life assertion taken for reason: %@", a2];
      }
      id v8 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2048;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        uint64_t v18 = a2;
        id v9 = v14;
        _os_log_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_INFO, "<%{public}@:%p> Life assertion taken for reason: %{public}@", buf, 0x20u);
      }
    }
    (*(void (**)(uint64_t))(a4 + 16))(a4);
    if (a2 && [*(id *)(a1 + 16) containsObject:a2])
    {
      if ((a3 & 1) == 0)
      {
        if ([(id)a1 isAuditHistoryEnabled]) {
          [(id)a1 _addAuditHistoryItem:@"Life assertion removed for reason: %@", a2];
        }
        uint64_t v10 = *(id *)(a1 + 88);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          id v14 = v11;
          __int16 v15 = 2048;
          uint64_t v16 = a1;
          __int16 v17 = 2114;
          uint64_t v18 = a2;
          id v12 = v11;
          _os_log_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_INFO, "<%{public}@:%p> Life assertion removed for reason: %{public}@", buf, 0x20u);
        }
      }
      [*(id *)(a1 + 16) removeObject:a2];
      if (![*(id *)(a1 + 16) count])
      {
        if (*(unsigned char *)(a1 + 137) || *(unsigned char *)(a1 + 24))
        {
          if ([(id)a1 isRunning]) {
            -[BSTransaction _terminateNow](a1);
          }
        }
        -[BSTransaction _checkAndReportIfCompleted]((id *)a1);
      }
    }
  }
}

- (uint64_t)_beginIfPossible
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if (!*(void *)(result + 72))
    {
      uint64_t result = -[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:](result, 0, (uint64_t)&__block_literal_global_320);
      if (result)
      {
        uint64_t result = -[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:]((BOOL)v1, 1, (uint64_t)&__block_literal_global_322);
        if (result)
        {
          return [v1 begin];
        }
      }
    }
  }
  return result;
}

- (BOOL)_evaluateParentTransactionsWithSchedulingPolicy:(uint64_t)a3 evaluator:
{
  BOOL v3 = a1;
  if (a1)
  {
    if (!a3)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__evaluateParentTransactionsWithSchedulingPolicy_evaluator_, v3, @"BSTransaction.m", 1515, @"Invalid parameter not satisfying: %@", @"evaluator" object file lineNumber description];
    }
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__BSTransaction__evaluateParentTransactionsWithSchedulingPolicy_evaluator___block_invoke;
    v8[3] = &unk_1E5445BE0;
    v8[5] = &v9;
    v8[6] = a2;
    v8[4] = a3;
    -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:](v3, (uint64_t)v8);
    BOOL v3 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  return v3;
}

- (void)_unsafe_enumerateParentTransactionsWithBlock:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__unsafe_enumerateParentTransactionsWithBlock_, a1, @"BSTransaction.m", 1140, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        id v9 = *(id *)(v8 + 8);
        uint64_t v10 = *(void *)(v8 + 16);
      }
      else
      {
        id v9 = 0;
        uint64_t v10 = 0;
      }
      (*(void (**)(uint64_t, id, uint64_t, char *))(a2 + 16))(a2, v9, v10, &v17);

      if (v17) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v11 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v5 = v11;
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

void *__75__BSTransaction__evaluateParentTransactionsWithSchedulingPolicy_evaluator___block_invoke(void *result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (result[6] == a3)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(result[5] + 8);
    if (*(unsigned char *)(v6 + 24))
    {
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      uint64_t v6 = *(void *)(v5[5] + 8);
    }
    else
    {
      uint64_t result = 0;
    }
    *(unsigned char *)(v6 + 24) = (_BYTE)result;
    if (!*(unsigned char *)(*(void *)(v5[5] + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

void *__60__BSTransaction__areSerialParentTransactionsFinishedWorking__block_invoke(uint64_t a1, void *a2)
{
  return -[BSTransaction _inFinishedWorkingState](a2);
}

uint64_t __36__BSTransaction__parentTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __57__BSTransaction__parentTransactionsWithSchedulingPolicy___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 40) == a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void *__58__BSTransaction__areConcurrentParentTransactionsDoingWork__block_invoke(uint64_t a1, void *a2)
{
  return -[BSTransaction _isDoingWork](a2);
}

void __49__BSTransaction_evaluateMilestone_withEvaluator___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)(a1 + 32);
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*v2 + 40) removeObjectForKey:v2[1]];
  id v4 = *(id **)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  -[BSTransaction _removeMilestones:ignoringAuditHistory:](v4, v5, 1);

  [*(id *)(a1 + 32) _didSatisfyMilestone:*(void *)(a1 + 40)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_removeMilestones:(char)a3 ignoringAuditHistory:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([a1 isComplete])
  {
    if ([a1 _debugLoggingEnabled])
    {
      context = (void *)MEMORY[0x18C125360]();
      uint64_t v5 = [a1 _descriptionProem];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = [a1 _debugLogCategories];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v24;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v6);
            }
            long long v10 = *(NSObject **)(*((void *)&v23 + 1) + 8 * v9);
            if (v5 && os_log_type_enabled(*(os_log_t *)(*((void *)&v23 + 1) + 8 * v9), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v5;
              _os_log_debug_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            long long v11 = v10;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              id v12 = (id)objc_opt_class();
              long long v13 = [a1 _stringForMilestones:a2];
              *(_DWORD *)buf = 138543874;
              id v28 = v12;
              __int16 v29 = 2048;
              id v30 = a1;
              __int16 v31 = 2114;
              long long v32 = v13;
              _os_log_debug_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Attempt to remove milestones once completed: %{public}@", buf, 0x20u);
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
        }
        while (v7);
      }
    }
    return 0;
  }
  uint64_t v14 = [a2 count];
  BOOL v15 = v14 != 0;
  if (v14 && (a3 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)a1[11], OS_LOG_TYPE_INFO)
      || [a1 isAuditHistoryEnabled])
    {
      if ([a1 isAuditHistoryEnabled])
      {
        long long v16 = [a1 _stringForMilestones:a2];
        [a1 _addAuditHistoryItem:@"Removed milestones: %@", v16];
      }
      char v17 = a1[11];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = (id)objc_opt_class();
        uint64_t v19 = [a1 _stringForMilestones:a2];
        *(_DWORD *)buf = 138543874;
        id v28 = v18;
        __int16 v29 = 2048;
        id v30 = a1;
        __int16 v31 = 2114;
        long long v32 = v19;
        _os_log_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_INFO, "<%{public}@:%p> Removed milestones: %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_27;
  }
  if (!v14) {
    return 0;
  }
LABEL_27:
  [a1[7] minusSet:a2];
  -[BSTransaction _checkAndReportIfCompleted](a1);
  return v15;
}

- (void)addMilestone:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  -[BSTransaction addMilestones:](self, "addMilestones:");
}

uint64_t __22__BSTransaction_begin__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 transactionDidBegin:v5];
  }
  return result;
}

uint64_t __22__BSTransaction_begin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 transactionWillBegin:v5];
  }
  return result;
}

uint64_t __47__BSTransaction__notifyObserversOfFinishedWork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 transactionDidFinishWork:v5];
  }
  return result;
}

uint64_t __45__BSTransaction__notifyObserversOfCompletion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 transactionDidComplete:v5];
  }
  return result;
}

- (BOOL)isInterrupted
{
  BOOL v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  return self->_interrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_blockObservers, 0);
  objc_storeStrong((id *)&self->_cachedDescriptionProem, 0);
  objc_storeStrong((id *)&self->_debugLogCategories, 0);
  objc_storeStrong((id *)&self->_auditHistoryLog, 0);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_childTransactionRelationships, 0);
  objc_storeStrong((id *)&self->_milestonesToHandlers, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_lifeAssertions, 0);
  objc_storeStrong((id *)&self->_parentTransactionRelationships, 0);
}

- (BSTransaction)init
{
  v25.receiver = self;
  v25.super_class = (Class)BSTransaction;
  double v2 = [(BSTransaction *)&v25 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blockObservers = v3->_blockObservers;
    v3->_blockObservers = v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    milestones = v3->_milestones;
    v3->_milestones = v8;

    long long v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parentTransactionRelationships = v3->_parentTransactionRelationships;
    v3->_parentTransactionRelationships = v10;

    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    childTransactionRelationships = v3->_childTransactionRelationships;
    v3->_childTransactionRelationships = v12;

    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    milestonesToHandlers = v3->_milestonesToHandlers;
    v3->_milestonesToHandlers = v14;

    long long v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lifeAssertions = v3->_lifeAssertions;
    v3->_lifeAssertions = v16;

    uint64_t v18 = +[BSDescriptionBuilder descriptionForObject:v3];
    cachedDescriptionProem = v3->_cachedDescriptionProem;
    v3->_cachedDescriptionProem = (NSString *)v18;

    self;
    if (qword_1EB21B0A0 != -1) {
      dispatch_once(&qword_1EB21B0A0, &__block_literal_global_6);
    }
    id v20 = (id)_MergedGlobals_8;
    v3->_cachedDefaultBasedAuditHistoryEnabled = [v20 isAuditHistoryEnabled];

    uint64_t v21 = +[BSTransaction _defaultTransactionLog]();
    auditHistoryLog = v3->_auditHistoryLog;
    v3->_auditHistoryLog = (OS_os_log *)v21;

    long long v23 = +[BSTransaction _defaultTransactionLog]();
    [(BSTransaction *)v3 _addDebugLogCategory:v23];
  }
  return v3;
}

+ (id)_defaultTransactionLog
{
  self;
  if (qword_1EB21B0B0 != -1) {
    dispatch_once(&qword_1EB21B0B0, &__block_literal_global_118);
  }
  v0 = (void *)qword_1EB21B0A8;
  return v0;
}

- (BOOL)removeMilestone:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  LOBYTE(self) = [(BSTransaction *)self removeMilestones:v4];

  return (char)self;
}

- (BOOL)removeMilestones:(id)a3
{
  uint64_t v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  return -[BSTransaction _removeMilestones:ignoringAuditHistory:]((id *)&self->super.isa, a3, 0);
}

- (BOOL)hasStarted
{
  if ([(BSTransaction *)self isRunning]) {
    return 1;
  }
  return [(BSTransaction *)self isComplete];
}

- (id)completionBlock
{
  double v2 = (void *)MEMORY[0x18C125630](self->_completionBlock, a2);
  return v2;
}

- (void)setCompletionBlock:(id)a3
{
  if (self->_completionBlock != a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    completionBlocuint64_t k = self->_completionBlock;
    self->_completionBlocuint64_t k = v4;
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  if (a3 && [(NSHashTable *)self->_observers containsObject:a3])
  {
    [(NSHashTable *)self->_observers removeObject:a3];
    blockObservers = self->_blockObservers;
    [(NSMutableArray *)blockObservers removeObject:a3];
  }
}

- (void)removeChildTransaction:(id)a3
{
  id v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  if (a3)
  {
    -[BSTransaction _childRelationshipForTransaction:]((uint64_t)self, (uint64_t)a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6) {
      -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, (uint64_t)v6);
    }
  }
}

- (void)_removeChildTransactionRelationship:(id *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2) {
      uint64_t v4 = *(void **)(a2 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;
    [a1 _willRemoveChildTransaction:v5];
    if (os_log_type_enabled((os_log_t)a1[11], OS_LOG_TYPE_INFO)
      || [a1 isAuditHistoryEnabled])
    {
      id v6 = [v5 _descriptionProem];
      if ([a1 isAuditHistoryEnabled]) {
        [a1 _addAuditHistoryItem:@"Removing child transaction: %@", v6];
      }
      uint64_t v7 = a1[11];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v10 = (id)objc_opt_class();
        __int16 v11 = 2048;
        id v12 = a1;
        __int16 v13 = 2114;
        uint64_t v14 = v6;
        id v8 = v10;
        _os_log_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> Removing child transaction: %{public}@", buf, 0x20u);
      }
    }
    -[BSTransaction _removeParentTransaction:]((uint64_t)v5, (uint64_t)a1);
    [a1[6] removeObject:a2];
    [a1 _didRemoveChildTransaction:v5];
    if ([a1 isRunning]) {
      -[BSTransaction _checkAndReportIfCompleted](a1);
    }
  }
}

- (BOOL)isInterruptible
{
  BOOL v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  BOOL v4 = [(BSTransaction *)self _canBeInterrupted];
  char v5 = 0;
  if (v4) {
    char v5 = ![(BSTransaction *)self isComplete];
  }
  char v12 = v5;
  if (*((unsigned char *)v10 + 24))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__BSTransaction_isInterruptible__block_invoke;
    v8[3] = &unk_1E5445A90;
    v8[4] = &v9;
    -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)self, (uint64_t)v8);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSSet)milestones
{
  BOOL v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  milestones = self->_milestones;
  return (NSSet *)milestones;
}

- (BOOL)hasChildTransactionsOfClass:(Class)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v4);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = self->_childTransactionRelationships;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v9) {
          uint64_t v9 = (void *)v9[1];
        }
        id v10 = v9;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)childTransactionsOfClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v4);

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_childTransactionRelationships;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10) {
          id v10 = (void *)v10[1];
        }
        uint64_t v11 = v10;
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)removeAllChildTransactionsOfClass:(Class)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v4);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (void *)[(NSMutableArray *)self->_childTransactionRelationships copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        if (v9) {
          id v10 = *(void **)(v9 + 8);
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, v9);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }
}

- (void)removeAllChildTransactions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v4 = (void *)[(NSMutableArray *)self->_childTransactionRelationships copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSArray)allErrors
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = [(BSTransaction *)self childTransactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) allErrors];
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if (self->_error) {
    objc_msgSend(v3, "addObject:");
  }
  return (NSArray *)v3;
}

- (void)registerBlockObserver:(id)a3
{
  id v6 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v6);

  if (!a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BSTransaction.m", 346, @"Invalid parameter not satisfying: %@", @"blockObserverCallback" object file lineNumber description];
  }
  uint64_t v7 = objc_alloc_init(BSTransactionBlockObserver);
  (*((void (**)(id))a3 + 2))(a3);
  [(NSMutableArray *)self->_blockObservers addObject:v7];
  [(BSTransaction *)self addObserver:v7];
}

uint64_t __32__BSTransaction_isInterruptible__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isComplete];
  if ((result & 1) == 0)
  {
    uint64_t result = [a2 isInterruptible];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      if (a4) {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)interrupt
{
}

- (void)interruptWithReason:(id)a3
{
  uint64_t v5 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v5);

  -[BSTransaction _interruptWithReason:force:](self, (uint64_t)a3, 0);
}

- (void)_interruptWithReason:(char)a3 force:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a1;
    uint64_t v6 = (uint64_t)v5;
    if (a3 & 1) != 0 || ([v5 isInterruptible])
    {
      if ([(id)v6 isComplete])
      {
        long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:sel__interruptWithReason_force_ object:v6 file:@"BSTransaction.m" lineNumber:1407 description:@"Cannot interrupt a completed transaction."];
      }
      if (([(id)v6 isRunning] & 1) == 0)
      {
        long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:sel__interruptWithReason_force_ object:v6 file:@"BSTransaction.m" lineNumber:1408 description:@"Cannot interrupt a non-running transaction."];
      }
      if (*(unsigned char *)(v6 + 25))
      {
        uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:sel__interruptWithReason_force_ object:v6 file:@"BSTransaction.m" lineNumber:1409 description:@"Cannot interrupt an already interrupted transaction."];
      }
      if ([(id)v6 isAuditHistoryEnabled]) {
        [(id)v6 _addAuditHistoryItem:@"Interrupting for reason: %@", a2];
      }
      uint64_t v7 = *(id *)(v6 + 88);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v22 = (id)objc_opt_class();
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        __int16 v25 = 2114;
        uint64_t v26 = a2;
        id v8 = v22;
        _os_log_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> Interrupting for reason: %{public}@", buf, 0x20u);
      }
      if (!*(void *)(v6 + 144))
      {
        uint64_t v9 = -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](v6, 2, a2, 0, 0);
        long long v10 = *(void **)(v6 + 144);
        *(void *)(v6 + 144) = v9;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __44__BSTransaction__interruptWithReason_force___block_invoke;
      v19[3] = &unk_1E5445B98;
      v19[4] = v6;
      v19[5] = a2;
      char v20 = a3;
      -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:](v6, @"interruption", 0, (uint64_t)v19);
      if (([(id)v6 isComplete] & 1) == 0)
      {
        long long v11 = *(id *)(v6 + 88);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          long long v12 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v22 = v12;
          __int16 v23 = 2048;
          uint64_t v24 = v6;
          id v13 = v12;
          _os_log_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_INFO, "<%{public}@:%p> Interrupted but not yet done. Waiting.", buf, 0x16u);
        }
      }
    }
    else
    {
      long long v14 = *(id *)(v6 + 88);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v22 = (id)objc_opt_class();
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        __int16 v25 = 2114;
        uint64_t v26 = a2;
        id v15 = v22;
        _os_log_impl(&dword_18AAA8000, v14, OS_LOG_TYPE_INFO, "<%{public}@:%p> Cannot be interrupted for reason \"%{public}@\". Ignoring.", buf, 0x20u);
      }
    }
  }
}

- (void)failWithReason:(id)a3
{
  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, (uint64_t)a3, 0, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v4);
}

- (id)_createErrorWithCode:(uint64_t)a3 reason:(uint64_t)a4 description:(uint64_t)a5 precipitatingError:
{
  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 2) {
      long long v10 = @"completed";
    }
    else {
      long long v10 = off_1E5445C00[a2 - 1];
    }
    long long v11 = [NSString stringWithFormat:@"Transaction %@.", v10];
    long long v12 = [MEMORY[0x1E4F1CA60] dictionary];
    id v13 = v12;
    if (a4)
    {
      [v12 setObject:a4 forKey:@"error-description"];
      uint64_t v14 = [v11 stringByAppendingFormat:@" %@", a4];

      long long v11 = (void *)v14;
    }
    if (a3)
    {
      [v13 setObject:a3 forKey:@"error-reason"];
      uint64_t v15 = [v11 stringByAppendingFormat:@" (%@)", a3];

      long long v11 = (void *)v15;
    }
    if (a5) {
      [v13 setObject:a5 forKey:@"precipitating-error"];
    }
    long long v16 = +[BSDescriptionBuilder succinctDescriptionForObject:a1];
    [v13 setObject:v16 forKey:@"transaction"];

    [v13 setObject:v11 forKey:*MEMORY[0x1E4F28588]];
    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"BSTransactionError" code:a2 userInfo:v13];
  }
  else
  {
    long long v17 = 0;
  }
  return v17;
}

- (void)_failWithError:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 queue];
    BSDispatchQueueAssert(v4);

    if (!*(unsigned char *)(a1 + 24) && !*(unsigned char *)(a1 + 137) && ([(id)a1 isComplete] & 1) == 0)
    {
      uint64_t v5 = *(void *)(a1 + 144);
      *(unsigned char *)(a1 + 137) = 1;
      if (!v5)
      {
        if (!v3)
        {
          -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](a1, 1, 0, 0, 0);
          id v3 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)(a1 + 144), v3);
      }
      uint64_t v6 = [v3 userInfo];
      uint64_t v7 = [v6 objectForKey:@"error-reason"];

      id v8 = @"(unspecified)";
      if (v7) {
        id v8 = v7;
      }
      uint64_t v9 = v8;
      if ([(id)a1 isAuditHistoryEnabled]) {
        [(id)a1 _addAuditHistoryItem:@"Failing for reason: %@", v9];
      }
      long long v10 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        id v13 = (id)objc_opt_class();
        __int16 v14 = 2048;
        uint64_t v15 = a1;
        __int16 v16 = 2114;
        long long v17 = v9;
        id v11 = v13;
        _os_log_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_INFO, "<%{public}@:%p> Failing for reason: %{public}@", buf, 0x20u);
      }
      if (![*(id *)(a1 + 16) count]) {
        -[BSTransaction _terminateNow](a1);
      }
    }
  }
}

- (void)removeAllMilestones
{
  id v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  milestones = self->_milestones;
  [(BSTransaction *)self removeMilestones:milestones];
}

- (void)listenForSatisfiedMilestone:(id)a3 withBlock:(id)a4
{
  id v8 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v8);

  if (a3 && a4)
  {
    id v9 = [(NSMutableDictionary *)self->_milestonesToHandlers objectForKey:a3];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      -[NSMutableDictionary setObject:forKey:](self->_milestonesToHandlers, "setObject:forKey:");
    }
    uint64_t v7 = (void *)[a4 copy];
    [v9 addObject:v7];
  }
}

- (NSString)description
{
  return (NSString *)-[BSTransaction _descriptionForDebugging:indentLevel:]((uint64_t)self, 0);
}

- (id)_descriptionForDebugging:(uint64_t)a1 indentLevel:(int)a2
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a1, a2, 0, v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[BSTransaction _descriptionForDebugging:indentLevel:]((uint64_t)self, 1);
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return 0;
}

- (BOOL)_revertWithReason:(id)a3
{
  return 0;
}

- (id)_debugLogCategories
{
  return self->_debugLogCategories;
}

- (id)_customizedDescriptionProperties
{
  return 0;
}

- (void)_evaluateCompletion
{
  id v3 = [(BSTransaction *)self queue];
  BSDispatchQueueAssert(v3);

  -[BSTransaction _checkAndReportIfCompleted]((id *)&self->super.isa);
}

- (void)_failForTimeoutWithDescription:(id)a3
{
  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, @"timeout", (uint64_t)a3, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v4);
}

- (void)_failWithReason:(id)a3 description:(id)a4
{
}

- (void)_failWithReason:(id)a3 description:(id)a4 precipitatingError:(id)a5
{
  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v6);
}

void __39__BSTransaction__defaultTransactionLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "Transaction");
  uint64_t v1 = (void *)qword_1EB21B0A8;
  qword_1EB21B0A8 = (uint64_t)v0;
}

- (id)_graphNodeIdentifier
{
  id v1 = a1;
  if (a1)
  {
    double v2 = NSString;
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v1 = [v2 stringWithFormat:@"%@-%p", v4, v1];
  }
  return v1;
}

- (id)_graphNodeDebugName
{
  double v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_populateGraphIntoNodes:(void *)a3 edges:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = [(id)a1 _customizedDescriptionProperties];
    id v8 = v7;
    if (v7)
    {
      id v9 = objc_msgSend(v7, "bs_filter:", &__block_literal_global_143);
    }
    else
    {
      id v9 = 0;
    }

    [v6 addEntriesFromDictionary:v9];
    long long v10 = -[BSTransaction _graphNodeIdentifier]((id)a1);
    [v6 setObject:v10 forKey:@"id"];

    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
    [v6 setObject:v11 forKey:@"pointer"];

    long long v12 = [(id)a1 _graphNodeDebugName];
    [v6 setObject:v12 forKey:@"name"];

    id v13 = NSStringFromBSTransactionState(*(void *)(a1 + 72));
    [v6 setObject:v13 forKey:@"state"];

    if (*(unsigned char *)(a1 + 25)) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"interrupted"];
    }
    if (*(unsigned char *)(a1 + 24)) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"aborted"];
    }
    if (*(unsigned char *)(a1 + 137)) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"failed"];
    }
    __int16 v14 = *(void **)(a1 + 144);
    if (v14)
    {
      uint64_t v15 = [v14 description];
      [v6 setObject:v15 forKey:@"error"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      __int16 v16 = [(id)a1 _stringForMilestones:*(void *)(a1 + 56)];
      [v6 setObject:v16 forKey:@"milestonesRemaining"];
    }
    [a2 addObject:v6];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v22 = (void *)MEMORY[0x18C125360]();
          if (!v21)
          {
            id v23 = 0;
LABEL_26:
            uint64_t v25 = -[BSTransaction _buildGraphEdgeDescriptionWithType:fromTransaction:toTransaction:](@"childConcurrent", (id)a1, v23);
            goto LABEL_27;
          }
          id v23 = *(id *)(v21 + 8);
          uint64_t v24 = *(void *)(v21 + 16);
          if (!v24) {
            goto LABEL_26;
          }
          if (v24 != 1)
          {
            uint64_t v26 = 0;
            goto LABEL_28;
          }
          uint64_t v25 = -[BSTransaction _buildGraphEdgeDescriptionWithType:fromTransaction:toTransaction:](@"childSerial", (id)a1, v23);
LABEL_27:
          uint64_t v26 = (void *)v25;
LABEL_28:
          [a3 addObject:v26];
          -[BSTransaction _populateGraphIntoNodes:edges:](v23, a2, a3);
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }
  }
}

uint64_t __54__BSTransaction__sanitizedCustomDescriptionProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = objc_msgSend(a2, "bs_isPlistableType");
  if (result)
  {
    return objc_msgSend(a3, "bs_isPlistableType");
  }
  return result;
}

- (id)_buildGraphEdgeDescriptionWithType:(uint64_t)a1 fromTransaction:(id)a2 toTransaction:(void *)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v9[0] = a1;
  v8[0] = @"type";
  v8[1] = @"from";
  id v4 = -[BSTransaction _graphNodeIdentifier](a2);
  v9[1] = v4;
  v8[2] = @"to";
  uint64_t v5 = -[BSTransaction _graphNodeIdentifier](a3);
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)_descriptionForDebugging:(uint64_t)a3 indentLevel:(void *)a4 visited:
{
  v80[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = a1;
    id v54 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    for (uint64_t i = a3; a3; --a3)
      [v54 appendString:@"    "];
    long long v52 = (void *)[v54 mutableCopy];
    [v52 appendString:@"    "];
    id v6 = (void *)[v52 mutableCopy];
    [v6 appendString:@"    "];
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v8 = [(id)v5 _descriptionProem];
    id v9 = (void *)v8;
    long long v10 = &stru_1ED76E928;
    if (!i) {
      long long v10 = @"\n";
    }
    [v7 appendFormat:@"%@%@%@\n", v10, v54, v8];

    if (([a4 containsObject:v5] & 1) == 0)
    {
      [a4 addObject:v5];
      if (*(void *)(v5 + 72) == 3) {
        id v11 = @"YES\n";
      }
      else {
        id v11 = @"NO\n";
      }
      [v7 appendFormat:@"%@Completed: %@", v52, v11];
      uint64_t v48 = [(id)v5 _customizedDescriptionProperties];
      uint64_t v12 = [v48 count];
      if (v48)
      {
        uint64_t v13 = v12;
        if (v12)
        {
          id v76 = 0;
          v77 = &v76;
          uint64_t v78 = 0x2020000000;
          uint64_t v79 = 0;
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke;
          v69[3] = &unk_1E5445B20;
          id v14 = v7;
          id v70 = v14;
          id v71 = v52;
          id v72 = v6;
          v73 = &v76;
          uint64_t v74 = v13;
          [v48 enumerateKeysAndObjectsUsingBlock:v69];
          [v14 appendString:@"\n"];

          _Block_object_dispose(&v76, 8);
        }
      }
      if (([(id)v5 isComplete] & 1) == 0)
      {
        if ([(id)v5 isInterruptible]) {
          uint64_t v15 = @"YES\n";
        }
        else {
          uint64_t v15 = @"NO\n";
        }
        [v7 appendFormat:@"%@Interruptible? %@", v52, v15];
      }
      if (*(unsigned char *)(v5 + 25)) {
        [v7 appendFormat:@"%@Interrupted: %@", v52, @"YES\n"];
      }
      if (*(unsigned char *)(v5 + 137)) {
        [v7 appendFormat:@"%@Failed: %@", v52, @"YES\n"];
      }
      if (*(unsigned char *)(v5 + 24)) {
        [v7 appendFormat:@"%@Aborted: %@", v52, @"YES\n"];
      }
      __int16 v16 = *(void **)(v5 + 144);
      if (v16)
      {
        id v17 = [v16 domain];
        objc_msgSend(v7, "appendFormat:", @"%@Error domain: %@; Code: %d\n",
          v52,
          v17,
          [*(id *)(v5 + 144) code]);

        uint64_t v18 = [*(id *)(v5 + 144) localizedDescription];
        [v7 appendFormat:@"%@Error description: %@\n", v52, v18];
      }
      unint64_t v19 = [*(id *)(v5 + 56) count];
      if (v19) {
        char v20 = @"\n";
      }
      else {
        char v20 = @"(none)\n";
      }
      [v7 appendFormat:@"%@Milestones pending: %@", v52, v20];
      if (v19)
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v47 = v5;
        id v21 = *(id *)(v5 + 56);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v22)
        {
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v66;
          do
          {
            uint64_t v25 = 0;
            uint64_t v26 = v23 + 1;
            uint64_t v53 = v22 + v23;
            do
            {
              if (*(void *)v66 != v24) {
                objc_enumerationMutation(v21);
              }
              [v7 appendFormat:@"%@%@", v6, *(void *)(*((void *)&v65 + 1) + 8 * v25)];
              if (v26 + v25 < v19) {
                [v7 appendString:@"\n"];
              }
              ++v25;
            }
            while (v22 != v25);
            uint64_t v22 = [v21 countByEnumeratingWithState:&v65 objects:v75 count:16];
            uint64_t v23 = v53;
          }
          while (v22);
        }

        uint64_t v5 = v47;
        [v7 appendString:@"\n"];
      }
      long long v27 = *(void **)(v5 + 80);
      if (v27)
      {
        long long v28 = [v27 items];
        unint64_t v29 = [v28 count];
        if (v29) {
          long long v30 = @"\n";
        }
        else {
          long long v30 = @"(none)\n";
        }
        [v7 appendFormat:@"%@Audit history: %@", v52, v30];
        if (v29)
        {
          uint64_t v31 = 0;
          do
          {
            uint64_t v32 = [v28 objectAtIndex:v31];
            [v7 appendFormat:@"%@%@", v6, v32];

            if (++v31 < v29) {
              [v7 appendString:@"\n"];
            }
          }
          while (v29 != v31);
          [v7 appendString:@"\n"];
        }
      }
      long long v33 = -[BSTransaction _childTransactionsWithSchedulingPolicy:](v5, 1);
      uint64_t v34 = -[BSTransaction _childTransactionsWithSchedulingPolicy:](v5, 0);
      if ([v34 count]) {
        uint64_t v35 = @"\n";
      }
      else {
        uint64_t v35 = @"(none)\n";
      }
      [v7 appendFormat:@"%@Concurrent child transactions: %@", v52, v35];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_3;
      v60[3] = &unk_1E5445B48;
      id v36 = v7;
      char v64 = a2;
      id v61 = v36;
      long long v62 = a4;
      uint64_t v63 = i;
      [v34 enumerateObjectsUsingBlock:v60];
      if ([v33 count]) {
        long long v37 = @"\n";
      }
      else {
        long long v37 = @"(none)\n";
      }
      [v36 appendFormat:@"%@Serial child transactions: %@", v52, v37];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_4;
      v55[3] = &unk_1E5445B48;
      id v38 = v36;
      char v59 = a2;
      double v57 = a4;
      uint64_t v58 = i;
      id v56 = v38;
      [v33 enumerateObjectsUsingBlock:v55];
      if (!i && a2)
      {
        id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        -[BSTransaction _populateGraphIntoNodes:edges:](v5, v39, v40);
        v80[0] = @"nodes";
        v80[1] = @"edges";
        id v76 = v39;
        v77 = (id *)v40;
        long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:v80 count:2];

        id v76 = 0;
        id v42 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v41 options:0 error:&v76];
        id v43 = v76;
        uint64_t v44 = [v42 base64EncodedStringWithOptions:32];

        [v38 appendFormat:@"graph-base64-encoded: %@", v44];
        [v38 appendString:@"\n"];
      }
      id v45 = v38;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke(uint64_t a1, uint64_t a2, __CFString *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || (v7)
  {
    id v11 = a3;
    unint64_t v12 = [(__CFString *)v11 count];
    uint64_t v13 = @"\n";
    if (!v12) {
      uint64_t v13 = @"(none)\n";
    }
    [*(id *)(a1 + 32) appendFormat:@"%@%@: %@", *(void *)(a1 + 40), a2, v13];
    if (v12)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v23 = v11;
      id v14 = v11;
      uint64_t v15 = [(__CFString *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v31;
        do
        {
          uint64_t v18 = 0;
          uint64_t v19 = v16 + 1;
          v16 += v15;
          do
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(a1 + 32) appendFormat:@"%@%@", *(void *)(a1 + 48), *(void *)(*((void *)&v30 + 1) + 8 * v18)];
            if (v19 + v18 < v12) {
              [*(id *)(a1 + 32) appendString:@"\n"];
            }
            ++v18;
          }
          while (v15 != v18);
          uint64_t v15 = [(__CFString *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      id v11 = v23;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = a3;
      uint64_t v9 = [(__CFString *)v8 count];
      long long v10 = @"\n";
      if (!v9) {
        long long v10 = @"(none)\n";
      }
      [*(id *)(a1 + 32) appendFormat:@"%@%@: %@", *(void *)(a1 + 40), a2, v10];
      if (v9)
      {
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x2020000000;
        v29[3] = 0;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_2;
        v24[3] = &unk_1E5445AF8;
        id v25 = *(id *)(a1 + 32);
        id v26 = *(id *)(a1 + 48);
        long long v27 = v29;
        uint64_t v28 = v9;
        [(__CFString *)v8 enumerateKeysAndObjectsUsingBlock:v24];

        _Block_object_dispose(v29, 8);
      }
    }
    else
    {
      char v20 = @"(none)\n";
      if (a3) {
        char v20 = a3;
      }
      [*(id *)(a1 + 32) appendFormat:@"%@%@: %@", *(void *)(a1 + 40), a2, v20];
    }
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v22 = *(void *)(v21 + 24) + 1;
  if (v22 < *(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"\n"];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v22 = *(void *)(v21 + 24) + 1;
  }
  *(void *)(v21 + 24) = v22;
}

uint64_t __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) appendFormat:@"%@%@ = %@", *(void *)(a1 + 40), a2, a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v6 = *(void *)(v5 + 24) + 1;
  if (v6 < *(void *)(a1 + 56))
  {
    uint64_t result = [*(id *)(a1 + 32) appendString:@"\n"];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v6 = *(void *)(v5 + 24) + 1;
  }
  *(void *)(v5 + 24) = v6;
  return result;
}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48) + 2, *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"%@", v3];
}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_4(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48) + 2, *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"%@", v3];
}

- (uint64_t)_terminateNow
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 137))
  {
    double v2 = [*(id *)(a1 + 144) userInfo];
    id v3 = [v2 objectForKey:@"error-reason"];
    [(id)a1 _willFailWithReason:v3];
  }
  [(id)a1 _willComplete];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(id)a1 childTransactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 144);
          long long v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) queue];
          BSDispatchQueueAssert(v10);

          if (!*(unsigned char *)(v8 + 24) && !*(unsigned char *)(v8 + 137) && ([(id)v8 isComplete] & 1) == 0)
          {
            *(unsigned char *)(v8 + 24) = 1;
            if (!*(void *)(v8 + 144))
            {
              uint64_t v11 = -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](v8, 3, @"parent transaction", 0, v9);
              unint64_t v12 = *(void **)(v8 + 144);
              *(void *)(v8 + 144) = v11;
            }
            if (os_log_type_enabled(*(os_log_t *)(v8 + 88), OS_LOG_TYPE_INFO)
              || [(id)v8 isAuditHistoryEnabled])
            {
              if ([(id)v8 isAuditHistoryEnabled])
              {
                uint64_t v13 = [*(id *)(v8 + 144) description];
                [(id)v8 _addAuditHistoryItem:@"Aborting with error: %@", v13];
              }
              id v14 = *(id *)(v8 + 88);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                id v15 = (id)objc_opt_class();
                uint64_t v16 = [*(id *)(v8 + 144) description];
                *(_DWORD *)buf = 138543874;
                id v24 = v15;
                __int16 v25 = 2048;
                uint64_t v26 = v8;
                __int16 v27 = 2114;
                uint64_t v28 = v16;
                _os_log_impl(&dword_18AAA8000, v14, OS_LOG_TYPE_INFO, "<%{public}@:%p> Aborting with error: %{public}@", buf, 0x20u);
              }
            }
            if (![*(id *)(v8 + 16) count]) {
              -[BSTransaction _terminateNow](v8);
            }
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return -[BSTransaction _noteCompleted](a1);
}

uint64_t __44__BSTransaction__interruptWithReason_force___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _willInterruptWithReason:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "childTransactions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isRunning]
          && ([v6 isComplete] & 1) == 0
          && ([v6 isInterrupted] & 1) == 0)
        {
          -[BSTransaction _interruptWithReason:force:](v6, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  [*(id *)(a1 + 32) _didInterruptWithReason:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) removeAllMilestones];
}

- (BOOL)shouldWatchdog:(id *)a3
{
  return 1;
}

- (double)watchdogTimeout
{
  return 30.0;
}

- (void)_removeDebugLogCategory:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_debugLogCategories, "removeObject:");
  }
}

- (id)_loggingProem
{
  double v2 = NSString;
  uint64_t v3 = [(BSTransaction *)self _descriptionProem];
  uint64_t v4 = [v2 stringWithFormat:@"%@: ", v3];

  return v4;
}

- (NSError)error
{
  return self->_error;
}

@end