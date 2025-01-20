@interface IMDMessagePTaskXPCStore
- (BOOL)_networkCall_IMDMessagePTaskDeleteAllCompletedTask;
- (BOOL)_networkCall_IMDMessagePTaskUpdateTaskFlagsForGUID:(id)a3 taskFlags:(int64_t)a4;
- (BOOL)_networkCall_InsertRowGuid:(id)a3 taskFlags:(int64_t)a4;
- (BOOL)deleteAllCompletedTasks;
- (BOOL)storePTask:(id)a3;
- (BOOL)updateTaskFlagsForPTask:(id)a3;
- (id)_networkCall_IMDMessagePTaskSelectWithLimit:(int64_t)a3;
- (id)loadMostRecentMessagePTasks;
@end

@implementation IMDMessagePTaskXPCStore

- (BOOL)_networkCall_InsertRowGuid:(id)a3 taskFlags:(int64_t)a4
{
  return 1;
}

- (id)_networkCall_IMDMessagePTaskSelectWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1F41233E8](a3, a2);
}

- (BOOL)_networkCall_IMDMessagePTaskUpdateTaskFlagsForGUID:(id)a3 taskFlags:(int64_t)a4
{
  return 1;
}

- (BOOL)_networkCall_IMDMessagePTaskDeleteAllCompletedTask
{
  return 1;
}

- (BOOL)storePTask:(id)a3
{
  if (a3)
  {
    BOOL v3 = -[IMDMessagePTaskXPCStore _networkCall_InsertRowGuid:taskFlags:](self, "_networkCall_InsertRowGuid:taskFlags:", [a3 guid], objc_msgSend(a3, "taskFlags"));
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "__mainThreadPostNotificationName:object:", @"IMDMessagePTaskStoreAddedProcessingTask", 0);
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)loadMostRecentMessagePTasks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDMessagePTaskXPCStore *)self _networkCall_IMDMessagePTaskSelectWithLimit:100];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [[IMDMessagePTask alloc] initWithStoreDictionary:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v3 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)deleteAllCompletedTasks
{
  return MEMORY[0x1F4181798](self, sel__networkCall_IMDMessagePTaskDeleteAllCompletedTask);
}

- (BOOL)updateTaskFlagsForPTask:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a3 guid];
  [a3 taskFlags];

  return MEMORY[0x1F4181798](self, sel__networkCall_IMDMessagePTaskUpdateTaskFlagsForGUID_taskFlags_);
}

@end