@interface SGJournal
- (BOOL)hasObserver:(id)a3;
- (SGJournal)init;
- (unint64_t)_eventBatchOperationSupportedForEntries:(id)a3;
- (void)_callCalendarObservers:(id)a3 contactsObservers:(id)a4 remindersObservers:(id)a5 withEntry:(id)a6;
- (void)addCalendarObserver:(id)a3;
- (void)addContactsObserver:(id)a3;
- (void)addEntries:(id)a3;
- (void)addEntry:(id)a3;
- (void)addRemindersObserver:(id)a3;
- (void)freezeObservers;
- (void)thawObserversForTesting;
@end

@implementation SGJournal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_remindersObservers, 0);
  objc_storeStrong((id *)&self->_contactsObservers, 0);
  objc_storeStrong((id *)&self->_calendarObservers, 0);
}

- (BOOL)hasObserver:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_calendarObservers containsObject:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [(NSMutableArray *)self->_contactsObservers containsObject:v4];
  }

  return v5;
}

- (void)thawObserversForTesting
{
  if (!self->_observersFrozen)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SGJournal.m", 268, @"Invalid parameter not satisfying: %@", @"_observersFrozen" object file lineNumber description];
  }
  self->_observersFrozen = 0;
}

- (void)freezeObservers
{
  self->_observersFrozen = 1;
  [(NSMutableArray *)self->_queuedOperations removeAllObjects];
}

- (void)addRemindersObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGJournal.m", 252, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  if (self->_observersFrozen)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGJournal.m", 253, @"Invalid parameter not satisfying: %@", @"!_observersFrozen" object file lineNumber description];
  }
  [(NSMutableArray *)self->_remindersObservers addObject:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)[(NSMutableArray *)self->_queuedOperations copy];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CB79B230]();
        id v21 = v5;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [(SGJournal *)self _callCalendarObservers:v9 contactsObservers:v9 remindersObservers:v13 withEntry:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)addContactsObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGJournal.m", 242, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  if (self->_observersFrozen)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGJournal.m", 243, @"Invalid parameter not satisfying: %@", @"!_observersFrozen" object file lineNumber description];
  }
  [(NSMutableArray *)self->_contactsObservers addObject:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)[(NSMutableArray *)self->_queuedOperations copy];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CB79B230]();
        id v21 = v5;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [(SGJournal *)self _callCalendarObservers:v9 contactsObservers:v13 remindersObservers:v9 withEntry:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)addCalendarObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGJournal.m", 232, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  if (self->_observersFrozen)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGJournal.m", 233, @"Invalid parameter not satisfying: %@", @"!_observersFrozen" object file lineNumber description];
  }
  [(NSMutableArray *)self->_calendarObservers addObject:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)[(NSMutableArray *)self->_queuedOperations copy];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CB79B230]();
        id v21 = v5;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [(SGJournal *)self _callCalendarObservers:v13 contactsObservers:v9 remindersObservers:v9 withEntry:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)addEntries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SGJournal *)self _eventBatchOperationSupportedForEntries:v4];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = [SGJournalEntry alloc];
    uint64_t v8 = sgMap();
    uint64_t v9 = [(SGJournalEntry *)v7 initWithOperation:v6 eventBatch:v8];

    [(SGJournal *)self addEntry:v9];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = (SGJournalEntry *)v4;
    uint64_t v10 = [(SGJournalEntry *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[SGJournal addEntry:](self, "addEntry:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [(SGJournalEntry *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __24__SGJournal_addEntries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 event];
}

- (unint64_t)_eventBatchOperationSupportedForEntries:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    unint64_t v5 = [v3 firstObject];
    uint64_t v6 = [v5 operation];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      id v19 = v3;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
          if ([v12 operation] != v6)
          {
LABEL_16:

            unint64_t v4 = 0;
            id v3 = v19;
            goto LABEL_17;
          }
          long long v14 = [v12 event];
          long long v15 = [v14 tags];
          long long v16 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
          char v17 = [v15 containsObject:v16];

          if (v17) {
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v3 = v19;
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (v6 == 1) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 4 * (v6 == 3);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
LABEL_17:

  return v4;
}

- (void)addEntry:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGJournal.m", 178, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];

    id v5 = 0;
  }
  if (!self->_observersFrozen)
  {
    [(NSMutableArray *)self->_queuedOperations addObject:v5];
    id v5 = v7;
  }
  [(SGJournal *)self _callCalendarObservers:self->_calendarObservers contactsObservers:self->_contactsObservers remindersObservers:self->_remindersObservers withEntry:v5];
}

- (void)_callCalendarObservers:(id)a3 contactsObservers:(id)a4 remindersObservers:(id)a5 withEntry:(id)a6
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v12 event];
  v105 = v12;
  id v103 = v10;
  id v104 = v11;
  if (v13)
  {

LABEL_4:
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v126 objects:v138 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v101 = v9;
      uint64_t v107 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v127 != v107) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          id v19 = (void *)MEMORY[0x1CB79B230]();
          v124[0] = MEMORY[0x1E4F143A8];
          v124[1] = 3221225472;
          v124[2] = __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke;
          v124[3] = &unk_1E65BB9A8;
          id v20 = v12;
          id v125 = v20;
          long long v21 = (void (**)(void))MEMORY[0x1CB79B4C0](v124);
          switch([v20 operation])
          {
            case 0:
              long long v22 = sgLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                long long v23 = v22;
                v24 = "SGJournal-addEntry: Not set";
                uint32_t v25 = 2;
                goto LABEL_29;
              }
              break;
            case 1:
              v26 = sgLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = [v20 event];
                v28 = [v27 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v28;
                _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Add event %{private}@", buf, 0xCu);

                id v12 = v105;
              }

              long long v22 = [v20 event];
              [v18 addEvent:v22];
              break;
            case 2:
              v29 = sgLogHandle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = [v20 eventBatch];
                uint64_t v31 = [v30 count];
                v32 = v21[2](v21);
                *(_DWORD *)buf = 134218243;
                uint64_t v135 = v31;
                id v12 = v105;
                __int16 v136 = 2113;
                v137 = v32;
                _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Add event batch (count=%tu) %{private}@", buf, 0x16u);
              }
              long long v22 = [v20 eventBatch];
              [v18 addEvents:v22];
              break;
            case 3:
              v43 = sgLogHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                v44 = [v20 event];
                v45 = [v44 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v45;
                _os_log_impl(&dword_1CA650000, v43, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Cancel event %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 cancelEvent:v22];
              break;
            case 4:
              v46 = sgLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                v47 = [v20 eventBatch];
                uint64_t v48 = [v47 count];
                v49 = v21[2](v21);
                *(_DWORD *)buf = 134218243;
                uint64_t v135 = v48;
                __int16 v136 = 2113;
                v137 = v49;
                _os_log_impl(&dword_1CA650000, v46, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Cancel event batch (count=%tu) %{private}@", buf, 0x16u);

                id v12 = v105;
              }

              long long v22 = [v20 eventBatch];
              [v18 cancelEvents:v22];
              break;
            case 5:
              v33 = sgLogHandle();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = [v20 event];
                v35 = [v34 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v35;
                _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Confirm event from this device %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 confirmEventFromThisDevice:v22];
              break;
            case 6:
              v36 = sgLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = [v20 event];
                v38 = [v37 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v38;
                _os_log_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Confirm event from other device %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 confirmEventFromOtherDevice:v22];
              break;
            case 7:
              v39 = sgLogHandle();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = [v20 event];
                v41 = [v40 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v41;
                _os_log_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Reject event from this device %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 rejectEventFromThisDevice:v22];
              break;
            case 8:
              v50 = sgLogHandle();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                v51 = [v20 event];
                v52 = [v51 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v52;
                _os_log_impl(&dword_1CA650000, v50, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Reject event from other device %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 rejectEventFromOtherDevice:v22];
              break;
            case 10:
              v53 = sgLogHandle();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = [v20 event];
                v55 = [v54 duplicateKey];
                *(_DWORD *)buf = 138477827;
                uint64_t v135 = (uint64_t)v55;
                _os_log_impl(&dword_1CA650000, v53, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Event parent deletion %{private}@", buf, 0xCu);
              }
              long long v22 = [v20 event];
              [v18 orphanEvent:v22];
              break;
            default:
              long long v22 = sgLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                int v42 = [v20 operation];
                *(_DWORD *)buf = 67109120;
                LODWORD(v135) = v42;
                long long v23 = v22;
                v24 = "SGJournal-addEntry event non-nil, but unknown operation %u";
                uint32_t v25 = 8;
LABEL_29:
                _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
              }
              break;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v126 objects:v138 count:16];
      }
      while (v16);
      id v9 = v101;
    }
    id v10 = v103;
    id v11 = v104;
    goto LABEL_46;
  }
  long long v14 = [v12 eventBatch];

  if (v14) {
    goto LABEL_4;
  }
  v56 = [v12 contact];

  if (v56)
  {
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id obj = v10;
    uint64_t v57 = [obj countByEnumeratingWithState:&v120 objects:v133 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      id v102 = v9;
      uint64_t v59 = *(void *)v121;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v121 != v59) {
            objc_enumerationMutation(obj);
          }
          v61 = *(void **)(*((void *)&v120 + 1) + 8 * j);
          v62 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v63 = [v12 operation];
          switch(v63)
          {
            case 13:
              v67 = sgLogHandle();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v67, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject contact", buf, 2u);
              }

              v65 = [v12 contact];
              [v61 rejectContact:v65];
              break;
            case 12:
              v66 = sgLogHandle();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v66, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm contact", buf, 2u);
              }

              v65 = [v12 contact];
              [v61 confirmContact:v65];
              break;
            case 11:
              v64 = sgLogHandle();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v64, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Add contact", buf, 2u);
              }

              v65 = [v12 contact];
              [v61 addContact:v65];
              break;
            default:
              v65 = sgLogHandle();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                int v68 = [v12 operation];
                *(_DWORD *)buf = 67109120;
                LODWORD(v135) = v68;
                _os_log_error_impl(&dword_1CA650000, v65, OS_LOG_TYPE_ERROR, "SGJournal-addEntry contact non-nil, but unknown operation %u", buf, 8u);
              }
              break;
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v120 objects:v133 count:16];
      }
      while (v58);
LABEL_103:
      id v9 = v102;
      id v10 = v103;
LABEL_104:
      id v11 = v104;
      id v12 = v105;
    }
  }
  else
  {
    v69 = [v12 reminder];

    if (!v69)
    {
      if ([v12 operation] == 9)
      {
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id obj = v9;
        uint64_t v85 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
        if (!v85) {
          goto LABEL_46;
        }
        uint64_t v86 = v85;
        id v87 = v10;
        id v88 = v9;
        uint64_t v89 = *(void *)v113;
        do
        {
          for (uint64_t k = 0; k != v86; ++k)
          {
            if (*(void *)v113 != v89) {
              objc_enumerationMutation(obj);
            }
            v91 = *(void **)(*((void *)&v112 + 1) + 8 * k);
            v92 = (void *)MEMORY[0x1CB79B230]();
            v93 = sgLogHandle();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v93, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Suggested event calendar deleted", buf, 2u);
            }

            [v91 calendarDeleted];
          }
          uint64_t v86 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
        }
        while (v86);
      }
      else
      {
        if ([v12 operation] != 14) {
          goto LABEL_47;
        }
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id obj = v10;
        uint64_t v94 = [obj countByEnumeratingWithState:&v108 objects:v130 count:16];
        if (!v94) {
          goto LABEL_46;
        }
        uint64_t v95 = v94;
        id v87 = v10;
        id v88 = v9;
        uint64_t v96 = *(void *)v109;
        do
        {
          for (uint64_t m = 0; m != v95; ++m)
          {
            if (*(void *)v109 != v96) {
              objc_enumerationMutation(obj);
            }
            v98 = *(void **)(*((void *)&v108 + 1) + 8 * m);
            v99 = (void *)MEMORY[0x1CB79B230]();
            v100 = sgLogHandle();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v100, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Remove all stored pseudo-contacts", buf, 2u);
            }

            [v98 removeAllStoredPseudoContacts];
          }
          uint64_t v95 = [obj countByEnumeratingWithState:&v108 objects:v130 count:16];
        }
        while (v95);
      }
      id v9 = v88;
      id v10 = v87;
      goto LABEL_104;
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v11;
    uint64_t v70 = [obj countByEnumeratingWithState:&v116 objects:v132 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      id v102 = v9;
      uint64_t v72 = *(void *)v117;
      do
      {
        for (uint64_t n = 0; n != v71; ++n)
        {
          if (*(void *)v117 != v72) {
            objc_enumerationMutation(obj);
          }
          v74 = *(void **)(*((void *)&v116 + 1) + 8 * n);
          v75 = (void *)MEMORY[0x1CB79B230]();
          switch([v105 operation])
          {
            case 15:
              v76 = sgRemindersLogHandle();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v76, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Add reminder", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 addReminder:v77];
              break;
            case 16:
              v82 = sgRemindersLogHandle();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v82, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm Reminder from this device", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 confirmReminderFromThisDevice:v77];
              break;
            case 17:
              v78 = sgRemindersLogHandle();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v78, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject Reminder from this device", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 rejectReminderFromThisDevice:v77];
              break;
            case 18:
              v79 = sgRemindersLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v79, OS_LOG_TYPE_DEBUG, "SGJournal-reminderAlarmTriggered: Reminder alarm triggered from this device", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 reminderAlarmTriggeredFromThisDevice:v77];
              break;
            case 19:
              v80 = sgRemindersLogHandle();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v80, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm reminder from other device", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 confirmReminderFromOtherDevice:v77];
              break;
            case 20:
              v83 = sgRemindersLogHandle();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v83, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject reminder from other device", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 rejectReminderFromOtherDevice:v77];
              break;
            case 21:
              v84 = sgRemindersLogHandle();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v84, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reminder parent deletion", buf, 2u);
              }

              v77 = [v105 reminder];
              [v74 orphanReminder:v77];
              break;
            default:
              v77 = sgRemindersLogHandle();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                int v81 = [v105 operation];
                *(_DWORD *)buf = 67109120;
                LODWORD(v135) = v81;
                _os_log_error_impl(&dword_1CA650000, v77, OS_LOG_TYPE_ERROR, "SGJournal-addEntry reminder non-nil, but unknown operation %u", buf, 8u);
              }
              break;
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v116 objects:v132 count:16];
      }
      while (v71);
      goto LABEL_103;
    }
  }
LABEL_46:

LABEL_47:
}

id __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eventBatch];
  v2 = objc_msgSend(v1, "_pas_mappedArrayWithTransform:", &__block_literal_global_31187);

  return v2;
}

uint64_t __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 duplicateKey];
}

- (SGJournal)init
{
  v12.receiver = self;
  v12.super_class = (Class)SGJournal;
  v2 = [(SGJournal *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    calendarObservers = v2->_calendarObservers;
    v2->_calendarObservers = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    contactsObservers = v2->_contactsObservers;
    v2->_contactsObservers = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    remindersObservers = v2->_remindersObservers;
    v2->_remindersObservers = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    queuedOperations = v2->_queuedOperations;
    v2->_queuedOperations = (NSMutableArray *)v9;

    v2->_observersFrozeuint64_t n = 0;
  }
  return v2;
}

@end