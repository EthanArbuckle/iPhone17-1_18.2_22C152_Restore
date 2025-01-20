@interface FBWorkspaceEventQueue
+ (id)sharedInstance;
- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4;
- (void)_noteQueueDidLock;
- (void)_noteQueueDidUnlock;
- (void)_noteWillCancelEventsWithName:(id)a3 count:(unint64_t)a4;
- (void)_noteWillExecuteEvent:(id)a3;
- (void)_noteWillPendEvents:(id)a3 atPosition:(int)a4;
- (void)executeOrAppendEvent:(id)a3;
- (void)executeOrPrependEvent:(id)a3;
- (void)executeOrPrependEvents:(id)a3;
@end

@implementation FBWorkspaceEventQueue

- (void)_noteQueueDidLock
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "Queue locked.", v1, 2u);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) { {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_16);
  }
  }
  v2 = (void *)sharedInstance___instance_1;

  return v2;
}

- (void)_noteQueueDidUnlock
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "Queue unlocked.", v1, 2u);
}

- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6
    && ([v6 name],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v5 name],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    v11 = FBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventQueue _shouldProcessEvent:enqueuedDuringExecutionOfEvent:](v7, v11);
    }
    }

    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)executeOrAppendEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[BSEventQueue executeOrInsertEvents:atPosition:](self, "executeOrInsertEvents:atPosition:", v6, 1, v7, v8);
}

- (void)_noteWillPendEvents:(id)a3 atPosition:(int)a4
{
  id v5 = a3;
  id v6 = FBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) { {
    -[FBWorkspaceEventQueue _noteWillPendEvents:atPosition:](v5, a4, v6);
  }
  }
}

- (void)_noteWillExecuteEvent:(id)a3
{
  id v3 = a3;
  v4 = FBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) { {
    -[FBWorkspaceEventQueue _noteWillExecuteEvent:]((uint64_t)v3, v4);
  }
  }
}

void __39__FBWorkspaceEventQueue_sharedInstance__block_invoke()
{
  v0 = [FBWorkspaceEventQueue alloc];
  uint64_t v1 = [(BSEventQueue *)v0 initWithName:@"FBWorkspaceEventQueue" onQueue:MEMORY[0x1E4F14428]];
  v2 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = v1;
}

- (void)executeOrPrependEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[FBWorkspaceEventQueue executeOrPrependEvents:](self, "executeOrPrependEvents:", v6, v7, v8);
}

- (void)executeOrPrependEvents:(id)a3
{
}

- (void)_noteWillCancelEventsWithName:(id)a3 count:(unint64_t)a4
{
  id v5 = a3;
  id v6 = FBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) { {
    -[FBWorkspaceEventQueue _noteWillCancelEventsWithName:count:]((uint64_t)v5, a4, v6);
  }
  }
}

- (void)_shouldProcessEvent:(void *)a1 enqueuedDuringExecutionOfEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 name];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "Event \"%{public}@\" queued an identically named event while still executing. Dropping it.", (uint8_t *)&v4, 0xCu);
}

- (void)_noteWillPendEvents:(NSObject *)a3 atPosition:.cold.1(void *a1, int a2, NSObject *a3)
{
  id v5 = a1;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 count];
  if (v6 == 1)
  {
    id v5 = [v5 lastObject];
  }
  id v7 = @"front";
  if (a2 == 1) { {
    id v7 = @"back";
  }
  }
  int v8 = 138543618;
  v9 = v5;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_DEBUG, "Pending: %{public}@; queue position: %@",
    (uint8_t *)&v8,
    0x16u);
  if (v6 == 1) { {
}
  }
  }

- (void)_noteWillCancelEventsWithName:(os_log_t)log count:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "Removing %lu event(s) named \"%{public}@\"", (uint8_t *)&v3, 0x16u);
}

- (void)_noteWillExecuteEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_DEBUG, "Executing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end