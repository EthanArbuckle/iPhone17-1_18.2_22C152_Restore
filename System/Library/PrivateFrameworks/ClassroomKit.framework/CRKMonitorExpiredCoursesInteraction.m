@interface CRKMonitorExpiredCoursesInteraction
- (BOOL)isAsynchronous;
- (CATSerialOperationQueue)serialOperationQueue;
- (CRKCourseEnrollmentController)enrollmentController;
- (CRKExpiredCoursesInteractionDelegate)expiredCoursesInteractionDelegate;
- (CRKMonitorExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 enrollmentController:(id)a4 expiredCoursesInteractionDelegate:(id)a5;
- (CRKRequestPerformingProtocol)studentDaemonProxy;
- (NSMutableSet)expiredCoursesToPresent;
- (void)beginInteractionWithExpiredCourses:(id)a3;
- (void)cancel;
- (void)expiredCoursesInteractionDidFinish:(id)a3;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateWithCourses:(id)a3;
@end

@implementation CRKMonitorExpiredCoursesInteraction

- (CRKMonitorExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 enrollmentController:(id)a4 expiredCoursesInteractionDelegate:(id)a5
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
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 42, @"Invalid parameter not satisfying: %@", @"enrollmentController" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 41, @"Invalid parameter not satisfying: %@", @"studentDaemonProxy" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 43, @"Invalid parameter not satisfying: %@", @"expiredCoursesInteractiondelegate" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
  v13 = [(CRKMonitorExpiredCoursesInteraction *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_studentDaemonProxy, a3);
    objc_storeStrong((id *)&v14->_enrollmentController, a4);
    objc_storeStrong((id *)&v14->_expiredCoursesInteractionDelegate, a5);
    uint64_t v15 = objc_opt_new();
    expiredCoursesToPresent = v14->_expiredCoursesToPresent;
    v14->_expiredCoursesToPresent = (NSMutableSet *)v15;

    uint64_t v17 = objc_opt_new();
    serialOperationQueue = v14->_serialOperationQueue;
    v14->_serialOperationQueue = (CATSerialOperationQueue *)v17;
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
  v4.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
  [(CRKMonitorExpiredCoursesInteraction *)&v4 cancel];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CRKMonitorExpiredCoursesInteraction_cancel__block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

void __45__CRKMonitorExpiredCoursesInteraction_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (v2[376])
    {
      v3 = [v2 enrollmentController];
      [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"courses" context:@"MonitorExpirationsIt"];

      v2 = *(unsigned char **)(a1 + 32);
    }
    objc_super v4 = [v2 serialOperationQueue];
    [v4 cancelAllOperations];

    v5 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 endOperationWithError:v6];
  }
}

- (void)main
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__CRKMonitorExpiredCoursesInteraction_main__block_invoke;
  v2[3] = &unk_2646F35C0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v2);
}

void __43__CRKMonitorExpiredCoursesInteraction_main__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 376) = 1;
  id v2 = [*(id *)(a1 + 32) enrollmentController];
  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"courses" options:4 context:@"MonitorExpirationsIt"];
}

- (void)updateWithCourses:(id)a3
{
  id v5 = a3;
  id v12 = v5;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 92, @"Invalid parameter not satisfying: %@", @"courses" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v5];
  v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_99];
  v8 = [v6 filteredSetUsingPredicate:v7];
  v9 = (void *)[v8 mutableCopy];

  id v10 = [(CRKMonitorExpiredCoursesInteraction *)self expiredCoursesToPresent];
  [v9 minusSet:v10];

  if ([v9 count]) {
    [(CRKMonitorExpiredCoursesInteraction *)self beginInteractionWithExpiredCourses:v9];
  }
}

uint64_t __57__CRKMonitorExpiredCoursesInteraction_updateWithCourses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 1) {
    uint64_t v3 = [v2 isExpired];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)beginInteractionWithExpiredCourses:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 106, @"Invalid parameter not satisfying: %@", @"courses" object file lineNumber description];
  }
  id v5 = [CRKExpiredCoursesInteraction alloc];
  id v6 = [(CRKMonitorExpiredCoursesInteraction *)self studentDaemonProxy];
  v7 = [(CRKMonitorExpiredCoursesInteraction *)self expiredCoursesInteractionDelegate];
  v8 = [(CRKExpiredCoursesInteraction *)v5 initWithStudentDaemonProxy:v6 delegate:v7 courses:v12];

  [(CRKExpiredCoursesInteraction *)v8 addTarget:self selector:sel_expiredCoursesInteractionDidFinish_ forOperationEvents:6];
  v9 = [(CRKMonitorExpiredCoursesInteraction *)self expiredCoursesToPresent];
  [v9 unionSet:v12];

  id v10 = [(CRKMonitorExpiredCoursesInteraction *)self serialOperationQueue];
  [v10 addOperation:v8];
}

- (void)expiredCoursesInteractionDidFinish:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKMonitorExpiredCoursesInteraction.m", 115, @"Invalid parameter not satisfying: %@", @"expiredCoursesInteraction" object file lineNumber description];
  }
  if ([(CRKMonitorExpiredCoursesInteraction *)self isExecuting])
  {
    id v6 = [v5 error];

    if (v6)
    {
      if (_CRKLogGeneral_onceToken_31 != -1) {
        dispatch_once(&_CRKLogGeneral_onceToken_31, &__block_literal_global_75);
      }
      v7 = (void *)_CRKLogGeneral_logObj_31;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_31, OS_LOG_TYPE_ERROR)) {
        -[CRKMonitorExpiredCoursesInteraction expiredCoursesInteractionDidFinish:](v7, v5);
      }
    }
    v8 = [(CRKMonitorExpiredCoursesInteraction *)self expiredCoursesToPresent];
    v9 = [v5 courses];
    [v8 minusSet:v9];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == @"MonitorExpirationsIt")
  {
    id v12 = [(CRKMonitorExpiredCoursesInteraction *)self enrollmentController];
    if (v12 == v11)
    {
      int v13 = [v10 isEqualToString:@"courses"];

      if (v13)
      {
        if ([(CRKMonitorExpiredCoursesInteraction *)self isExecuting])
        {
          v14 = [(CRKMonitorExpiredCoursesInteraction *)self enrollmentController];
          uint64_t v15 = [v14 courses];

          if (v15)
          {
            v16 = [(CRKMonitorExpiredCoursesInteraction *)self enrollmentController];
            uint64_t v17 = [v16 courses];
            [(CRKMonitorExpiredCoursesInteraction *)self updateWithCourses:v17];
          }
        }
      }
    }
    else
    {
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
    [(CRKMonitorExpiredCoursesInteraction *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (CRKExpiredCoursesInteractionDelegate)expiredCoursesInteractionDelegate
{
  return self->_expiredCoursesInteractionDelegate;
}

- (CRKCourseEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (NSMutableSet)expiredCoursesToPresent
{
  return self->_expiredCoursesToPresent;
}

- (CATSerialOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_expiredCoursesToPresent, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_expiredCoursesInteractionDelegate, 0);

  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

- (void)expiredCoursesInteractionDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  objc_super v4 = [a2 error];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to complete expired course interaction: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end