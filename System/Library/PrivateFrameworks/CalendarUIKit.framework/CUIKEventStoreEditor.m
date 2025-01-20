@interface CUIKEventStoreEditor
- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6;
- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4;
- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (OS_os_log)logHandle;
- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5;
- (void)performWithOptions:(id)a3 block:(id)a4;
- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4;
@end

@implementation CUIKEventStoreEditor

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    BOOL v27 = v6;
    v28 = a5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v32;
      char v13 = 1;
      do
      {
        uint64_t v14 = 0;
        v15 = v11;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v8);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
          v17 = [v16 eventStore];
          id v30 = v15;
          char v18 = [v17 saveEvent:v16 span:0 commit:0 error:&v30];
          id v11 = v30;

          if ((v18 & 1) == 0)
          {
            v19 = +[CUIKLogSubsystem eventStoreEditor];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v11;
              _os_log_error_impl(&dword_1BDF08000, v19, OS_LOG_TYPE_ERROR, "Failed to save new event: %@", buf, 0xCu);
            }

            char v13 = 0;
          }
          ++v14;
          v15 = v11;
        }
        while (v10 != v14);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
      char v13 = 1;
    }

    if (v27)
    {
      v21 = [v8 anyObject];
      v22 = [v21 eventStore];
      id v29 = v11;
      char v23 = [v22 commit:&v29];
      id v24 = v29;

      if ((v23 & 1) == 0)
      {
        v25 = +[CUIKLogSubsystem eventStoreEditor];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CUIKEventStoreEditor saveNewEvents:commit:error:]();
        }

        char v13 = 0;
      }
    }
    else
    {
      id v24 = v11;
    }
    if (v28 && v24) {
      id *v28 = v24;
    }

    BOOL v20 = v13 & 1;
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v26;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v9;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v6);
          }
          char v13 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
          uint64_t v14 = [v13 eventStore];
          id v24 = v12;
          char v15 = [v14 saveEvent:v13 span:a4 commit:0 error:&v24];
          id v9 = v24;

          if ((v15 & 1) == 0)
          {
            v16 = +[CUIKLogSubsystem eventStoreEditor];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v9;
              _os_log_error_impl(&dword_1BDF08000, v16, OS_LOG_TYPE_ERROR, "Failed to save new event: %@", buf, 0xCu);
            }
          }
          ++v11;
          uint64_t v12 = v9;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    v17 = [v6 anyObject];
    char v18 = [v17 eventStore];
    id v23 = v9;
    char v19 = [v18 commit:&v23];
    id v20 = v23;

    id v5 = v22;
    if ((v19 & 1) == 0)
    {
      v21 = +[CUIKLogSubsystem eventStoreEditor];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CUIKEventStoreEditor saveNewEvents:commit:error:]();
      }
    }
  }
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return [(CUIKEventStoreEditor *)self _saveEvent:a3 span:a4 commit:1 error:a5];
}

- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 eventStore];
  id v15 = 0;
  char v11 = [v10 saveEvent:v9 span:a4 commit:v7 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0)
  {
    char v13 = +[CUIKLogSubsystem eventStoreEditor];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CUIKEventStoreEditor _saveEvent:span:commit:error:]();
    }

    if (([v9 isNew] & 1) == 0) {
      [v9 rollback];
    }
  }
  if (a6) {
    *a6 = v12;
  }

  return v11;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return [(CUIKEventStoreEditor *)self _saveEvent:a3 span:a4 commit:0 error:a5];
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  id v5 = [a3 eventStore];
  LOBYTE(a4) = [v5 commitWithRollback:a4];

  return (char)a4;
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 eventStore];
  id v13 = 0;
  char v9 = [v8 removeEvent:v7 span:a4 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    char v11 = +[CUIKLogSubsystem eventStoreEditor];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CUIKEventStoreEditor deleteEvent:span:error:]();
    }

    [v7 rollback];
  }
  if (a5) {
    *a5 = v10;
  }

  return v9;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, id))a5;
  if (![v7 count])
  {
    id v21 = 0;
    uint64_t v22 = 1;
    if (!v8) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  long long v27 = v8;
  id v28 = v7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v32;
    char v14 = 1;
    do
    {
      uint64_t v15 = 0;
      v16 = v12;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
        char v18 = objc_msgSend(v17, "eventStore", v27, v28);
        id v30 = v16;
        char v19 = [v18 removeEvent:v17 span:a4 commit:0 error:&v30];
        id v12 = v30;

        if ((v19 & 1) == 0)
        {
          id v20 = +[CUIKLogSubsystem eventStoreEditor];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v12;
            _os_log_error_impl(&dword_1BDF08000, v20, OS_LOG_TYPE_ERROR, "Failed to remove event: %@", buf, 0xCu);
          }

          char v14 = 0;
        }
        ++v15;
        v16 = v12;
      }
      while (v11 != v15);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
    char v14 = 1;
  }

  id v23 = [v9 anyObject];
  id v24 = [v23 eventStore];
  id v29 = v12;
  char v25 = [v24 commit:&v29];
  id v21 = v29;

  if (v25)
  {
    uint64_t v22 = v14 & 1;
  }
  else
  {
    long long v26 = +[CUIKLogSubsystem eventStoreEditor];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CUIKEventStoreEditor deleteEvents:span:result:]();
    }

    uint64_t v22 = 0;
  }
  uint64_t v8 = v27;
  id v7 = v28;
  if (v27) {
LABEL_23:
  }
    v8[2](v8, v22, v21);
LABEL_24:
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 eventStore];
  id v11 = 0;
  char v7 = [v6 saveCalendar:v5 commit:1 error:&v11];

  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = +[CUIKLogSubsystem eventStoreEditor];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUIKEventStoreEditor saveCalendar:error:]();
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 eventStore];
  char v7 = v6;
  if (a4)
  {
    id v13 = 0;
    char v8 = [v6 deleteCalendar:v5 forEntityType:a4 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = +[CUIKLogSubsystem eventStoreEditor];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CUIKEventStoreEditor deleteCalendar:forEntityType:]();
      }
LABEL_8:
    }
  }
  else
  {
    id v12 = 0;
    char v11 = [v6 removeCalendar:v5 commit:1 error:&v12];
    id v9 = v12;

    if ((v11 & 1) == 0)
    {
      uint64_t v10 = +[CUIKLogSubsystem eventStoreEditor];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CUIKEventStoreEditor deleteCalendar:forEntityType:]();
      }
      goto LABEL_8;
    }
  }
}

- (void)performWithOptions:(id)a3 block:(id)a4
{
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
}

- (void)saveNewEvents:commit:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed commit event store after saving new events: %@", v2, v3, v4, v5, v6);
}

- (void)_saveEvent:span:commit:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to save event: %@", v2, v3, v4, v5, v6);
}

- (void)deleteEvent:span:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to delete event: %@", v2, v3, v4, v5, v6);
}

- (void)deleteEvents:span:result:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to commit event store after removing events: %@", v2, v3, v4, v5, v6);
}

- (void)saveCalendar:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to save calendar: %@", v2, v3, v4, v5, v6);
}

- (void)deleteCalendar:forEntityType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to remove calendar: %@", v2, v3, v4, v5, v6);
}

- (void)deleteCalendar:forEntityType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Failed to delete calendar: %@", v2, v3, v4, v5, v6);
}

@end