@interface CRKExpiredCoursesInteraction
+ (id)new;
- (BOOL)isAsynchronous;
- (CRKExpiredCoursesInteraction)init;
- (CRKExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 delegate:(id)a4 courses:(id)a5;
- (CRKExpiredCoursesInteractionDelegate)delegate;
- (CRKRequestPerformingProtocol)studentDaemonProxy;
- (NSSet)courses;
- (void)cancel;
- (void)leaveControlGroupsOperationDidFinish:(id)a3;
- (void)main;
- (void)removeCourses:(id)a3;
@end

@implementation CRKExpiredCoursesInteraction

- (CRKExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 delegate:(id)a4 courses:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 35, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 34, @"Invalid parameter not satisfying: %@", @"studentDaemonProxy" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 36, @"Invalid parameter not satisfying: %@", @"courses" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)CRKExpiredCoursesInteraction;
  v13 = [(CRKExpiredCoursesInteraction *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_studentDaemonProxy, a3);
    objc_storeStrong((id *)&v14->_delegate, a4);
    uint64_t v15 = [v12 copy];
    courses = v14->_courses;
    v14->_courses = (NSSet *)v15;
  }
  return v14;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKExpiredCoursesInteraction;
  [(CRKExpiredCoursesInteraction *)&v4 cancel];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__CRKExpiredCoursesInteraction_cancel__block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

void __38__CRKExpiredCoursesInteraction_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    [*(id *)(*(void *)(a1 + 32) + 376) cancel];
    v2 = *(unsigned char **)(a1 + 32);
    if (v2[384])
    {
      v3 = [*(id *)(a1 + 32) delegate];
      [v3 interactionNoLongerWantsToPromptCourseExpiration:*(void *)(a1 + 32)];

      v2 = *(unsigned char **)(a1 + 32);
    }
    CATErrorWithCodeAndUserInfo();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v4];
  }
}

- (void)main
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__CRKExpiredCoursesInteraction_main__block_invoke;
  v2[3] = &unk_2646F35C0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v2);
}

void __36__CRKExpiredCoursesInteraction_main__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) courses];
    v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_48];
    id v4 = [v2 filteredSetUsingPredicate:v3];

    uint64_t v5 = [v4 count];
    v6 = *(unsigned char **)(a1 + 32);
    if (v5)
    {
      v6[384] = 1;
      v7 = [*(id *)(a1 + 32) delegate];
      uint64_t v8 = *(void *)(a1 + 32);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __36__CRKExpiredCoursesInteraction_main__block_invoke_3;
      v9[3] = &unk_2646F37F0;
      v9[4] = v8;
      id v10 = v4;
      [v7 interaction:v8 willRemoveExpiredCourses:v10 acknowledgementHandler:v9];
    }
    else
    {
      [v6 endOperationWithResultObject:0];
    }
  }
}

uint64_t __36__CRKExpiredCoursesInteraction_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 1) {
    uint64_t v3 = [v2 mustRequestUnenroll] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __36__CRKExpiredCoursesInteraction_main__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 384) = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 removeCourses:v4];
  }
  return result;
}

- (void)removeCourses:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 101, @"Invalid parameter not satisfying: %@", @"courses" object file lineNumber description];
  }
  uint64_t v5 = objc_opt_new();
  v6 = objc_msgSend(v12, "crk_mapUsingBlock:", &__block_literal_global_22);
  [v5 setGroupIdentifiers:v6];

  v7 = [(CRKExpiredCoursesInteraction *)self studentDaemonProxy];
  uint64_t v8 = [v7 operationForRequest:v5];
  mLeaveControlGroupsOperation = self->mLeaveControlGroupsOperation;
  self->mLeaveControlGroupsOperation = v8;

  [(CATRemoteTaskOperation *)self->mLeaveControlGroupsOperation addTarget:self selector:sel_leaveControlGroupsOperationDidFinish_ forOperationEvents:6];
  id v10 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v10 addOperation:self->mLeaveControlGroupsOperation];
}

uint64_t __46__CRKExpiredCoursesInteraction_removeCourses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 courseIdentifier];
}

- (void)leaveControlGroupsOperationDidFinish:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 114, @"Invalid parameter not satisfying: %@", @"leaveControlGroupsOperation" object file lineNumber description];
  }
  if ([(CRKExpiredCoursesInteraction *)self isExecuting])
  {
    v6 = [v5 error];

    if (v6)
    {
      if (_CRKLogGeneral_onceToken_11 != -1) {
        dispatch_once(&_CRKLogGeneral_onceToken_11, &__block_literal_global_63);
      }
      v7 = (void *)_CRKLogGeneral_logObj_11;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_11, OS_LOG_TYPE_ERROR)) {
        -[CRKExpiredCoursesInteraction leaveControlGroupsOperationDidFinish:](v7, v5);
      }
      uint64_t v8 = [v5 error];
      [(CRKExpiredCoursesInteraction *)self endOperationWithError:v8];

      v9 = [(CRKExpiredCoursesInteraction *)self delegate];
      id v10 = [v5 error];
      [v9 interaction:self didEncounterError:v10];
    }
    else
    {
      [(CRKExpiredCoursesInteraction *)self endOperationWithResultObject:0];
    }
  }
}

- (NSSet)courses
{
  return self->_courses;
}

- (CRKExpiredCoursesInteractionDelegate)delegate
{
  return self->_delegate;
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_courses, 0);

  objc_storeStrong((id *)&self->mLeaveControlGroupsOperation, 0);
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CRKExpiredCoursesInteraction.m", 137, @"%@ is unavailable for %@", v5, a1 object file lineNumber description];

  return 0;
}

- (CRKExpiredCoursesInteraction)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CRKExpiredCoursesInteraction.m", 142, @"%@ is unavailable for %@", v5, self object file lineNumber description];

  return 0;
}

- (void)leaveControlGroupsOperationDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to remove expired courses: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end