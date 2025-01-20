@interface FBKUploadTask
+ (id)entityName;
- (BOOL)allSessionsHaveReportedState;
- (BOOL)allSessionsHaveReportedUploadSize;
- (BOOL)allSessionsHaveState:(int64_t)a3;
- (BOOL)isBugSessionBacked;
- (id)filerForm;
- (id)formID;
- (int64_t)taskState;
- (unint64_t)localSubmissionStage;
- (unint64_t)newSubmissionStageAfterBugSessionUpdate;
- (void)addFBKSessionsWithDEDSessions:(id)a3;
- (void)setLocalSubmissionStage:(unint64_t)a3;
- (void)setTaskState:(int64_t)a3;
- (void)updateBytesToUploadAndUploadedAfterBugSessionUpdate;
@end

@implementation FBKUploadTask

- (BOOL)isBugSessionBacked
{
  v3 = [(FBKUploadTask *)self fileURL];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(FBKUploadTask *)self bugSessions];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)updateBytesToUploadAndUploadedAfterBugSessionUpdate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(FBKUploadTask *)self bugSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 bytesToUpload];
        v7 += [v11 integerValue];

        v12 = [v10 bytesUploaded];
        v6 += [v12 integerValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  v13 = [NSNumber numberWithUnsignedInteger:v7];
  [(FBKUploadTask *)self setBytesToUpload:v13];

  v14 = [NSNumber numberWithUnsignedInteger:v6];
  [(FBKUploadTask *)self setBytesUploaded:v14];
}

- (unint64_t)newSubmissionStageAfterBugSessionUpdate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(FBKUploadTask *)self allSessionsHaveReportedUploadSize])
  {
    v3 = [(FBKUploadTask *)self bytesToUpload];
    int v4 = [v3 unsignedIntValue];
    uint64_t v5 = [(FBKUploadTask *)self bytesUploaded];
    int v6 = [v5 unsignedIntValue];

    if (v4 == v6)
    {
      uint64_t v7 = +[FBKLog ded];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(FBKUploadTask *)self taskIdentifier];
        int v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "finished upload for all bug sessions on task %@", (uint8_t *)&v10, 0xCu);
      }
      return 6;
    }
    return 4;
  }
  if ([(FBKUploadTask *)self allSessionsHaveState:6]) {
    return 4;
  }
  if ([(FBKUploadTask *)self allSessionsHaveState:4]
    || [(FBKUploadTask *)self allSessionsHaveState:5])
  {
    return 2;
  }
  if ([(FBKUploadTask *)self allSessionsHaveState:7]
    || [(FBKUploadTask *)self allSessionsHaveState:1])
  {
    return 6;
  }
  return 8;
}

- (void)addFBKSessionsWithDEDSessions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKUploadTask *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke;
  v7[3] = &unk_264874270;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    long long v15 = &v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", v15);
        int v10 = +[FBKBugSession bugSessionWithDEDBugSession:v8 inContext:v9];

        if (!v10)
        {
          v11 = +[FBKLog ded];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_2(v21, v8, v15, v11);
          }
        }
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) setBugSessions:v2];
  uint64_t v12 = [*(id *)(a1 + 40) managedObjectContext];
  id v16 = 0;
  [v12 save:&v16];
  id v13 = v16;

  if (v13)
  {
    v14 = +[FBKLog appHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_1(v13, v14);
    }
  }
}

- (id)filerForm
{
  id v3 = [(FBKUploadTask *)self formResponse];

  if (v3) {
    [(FBKUploadTask *)self formResponse];
  }
  else {
  uint64_t v4 = [(FBKUploadTask *)self feedbackFollowup];
  }

  return v4;
}

+ (id)entityName
{
  return @"UploadTask";
}

- (id)formID
{
  v2 = [(FBKUploadTask *)self filerForm];
  id v3 = [v2 filerFormID];

  return v3;
}

- (int64_t)taskState
{
  [(FBKUploadTask *)self willAccessValueForKey:@"taskState"];
  id v3 = [(FBKUploadTask *)self primitiveTaskState];
  int64_t v4 = [v3 integerValue];

  [(FBKUploadTask *)self didAccessValueForKey:@"taskState"];
  return v4;
}

- (void)setTaskState:(int64_t)a3
{
  [(FBKUploadTask *)self willChangeValueForKey:@"taskState"];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [(FBKUploadTask *)self setPrimitiveTaskState:v5];

  [(FBKUploadTask *)self didChangeValueForKey:@"taskState"];
}

- (unint64_t)localSubmissionStage
{
  [(FBKUploadTask *)self willAccessValueForKey:@"localSubmissionStage"];
  id v3 = [(FBKUploadTask *)self primitiveLocalSubmissionStage];
  unint64_t v4 = [v3 unsignedIntegerValue];

  [(FBKUploadTask *)self didAccessValueForKey:@"localSubmissionStage"];
  return v4;
}

- (void)setLocalSubmissionStage:(unint64_t)a3
{
  [(FBKUploadTask *)self willChangeValueForKey:@"localSubmissionStage"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  [(FBKUploadTask *)self setPrimitiveLocalSubmissionStage:v5];

  [(FBKUploadTask *)self didChangeValueForKey:@"localSubmissionStage"];
}

- (BOOL)allSessionsHaveReportedState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(FBKUploadTask *)self bugSessions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) state])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)allSessionsHaveReportedUploadSize
{
  uint64_t v3 = [(FBKUploadTask *)self bugSessions];
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_39];
  uint64_t v5 = [v3 filteredSetUsingPredicate:v4];
  uint64_t v6 = [v5 count];

  BOOL v7 = [(FBKUploadTask *)self bugSessions];
  LOBYTE(v3) = [v7 count] == v6;

  return (char)v3;
}

uint64_t __50__FBKUploadTask_allSessionsHaveReportedUploadSize__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasNumberOfBytesToUpload];
}

- (BOOL)allSessionsHaveState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(FBKUploadTask *)self bugSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) state] == a3) {
          ++v8;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v11 = [(FBKUploadTask *)self bugSessions];
  BOOL v12 = [v11 count] == v8;

  return v12;
}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error saving bug sessions [%{public}@]", (uint8_t *)&v4, 0xCu);
}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_22A36D000, a4, OS_LOG_TYPE_ERROR, "could not create bug session for id %{public}@", a1, 0xCu);
}

@end