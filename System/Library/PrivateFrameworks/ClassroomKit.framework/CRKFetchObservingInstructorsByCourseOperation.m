@interface CRKFetchObservingInstructorsByCourseOperation
- (BOOL)isAsynchronous;
- (CATRemoteTaskOperation)fetchCoursesOperation;
- (CATRemoteTaskOperation)fetchInstructorsOperation;
- (CRKFetchObservingInstructorsByCourseOperation)initWithRequestPerformer:(id)a3;
- (CRKRequestPerformingProtocol)requestPerformer;
- (void)cancel;
- (void)compileResultsWithFetchCoursesResult:(id)a3 fetchScreenObserversResult:(id)a4;
- (void)main;
- (void)operationsDidComplete:(id)a3;
- (void)setFetchCoursesOperation:(id)a3;
- (void)setFetchInstructorsOperation:(id)a3;
@end

@implementation CRKFetchObservingInstructorsByCourseOperation

- (CRKFetchObservingInstructorsByCourseOperation)initWithRequestPerformer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchObservingInstructorsByCourseOperation;
  v6 = [(CRKFetchObservingInstructorsByCourseOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestPerformer, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKFetchObservingInstructorsByCourseOperation;
  [(CRKFetchObservingInstructorsByCourseOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CRKFetchObservingInstructorsByCourseOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__CRKFetchObservingInstructorsByCourseOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) fetchCoursesOperation];
    [v2 cancel];

    v3 = [*(id *)(a1 + 32) fetchInstructorsOperation];
    [v3 cancel];

    objc_super v4 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 endOperationWithError:v5];
  }
}

- (void)main
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    objc_super v4 = [(CRKFetchObservingInstructorsByCourseOperation *)self requestPerformer];
    id v5 = objc_opt_new();
    v6 = [v4 operationForRequest:v5];
    [(CRKFetchObservingInstructorsByCourseOperation *)self setFetchCoursesOperation:v6];

    v7 = [(CRKFetchObservingInstructorsByCourseOperation *)self requestPerformer];
    v8 = objc_opt_new();
    objc_super v9 = [v7 operationForRequest:v8];
    [(CRKFetchObservingInstructorsByCourseOperation *)self setFetchInstructorsOperation:v9];

    id v17 = (id)objc_opt_new();
    v10 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchCoursesOperation];
    [v17 addDependency:v10];

    v11 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchInstructorsOperation];
    [v17 addDependency:v11];

    [v17 addTarget:self selector:sel_operationsDidComplete_ forOperationEvents:6];
    v12 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    v13 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchCoursesOperation];
    [v12 addOperation:v13];

    v14 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    v15 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchInstructorsOperation];
    [v14 addOperation:v15];

    v16 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    [v16 addOperation:v17];
  }
  else
  {
    [(CRKFetchObservingInstructorsByCourseOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)operationsDidComplete:(id)a3
{
  if (![(CRKFetchObservingInstructorsByCourseOperation *)self isExecuting]) {
    return;
  }
  objc_super v4 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchCoursesOperation];
  id v5 = [v4 error];

  if (v5)
  {
    v6 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchCoursesOperation];
  }
  else
  {
    v7 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchInstructorsOperation];
    v8 = [v7 error];

    if (!v8)
    {
      v10 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchCoursesOperation];
      id v24 = [v10 resultObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = [MEMORY[0x263F08690] currentHandler];
        v13 = [NSString stringWithUTF8String:"-[CRKFetchObservingInstructorsByCourseOperation operationsDidComplete:]"];
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        [v12 handleFailureInFunction:v13, @"CRKFetchObservingInstructorsByCourseOperation.m", 99, @"expected %@, got %@", v15, v17 file lineNumber description];
      }
      v11 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchInstructorsOperation];
      objc_super v9 = [v11 resultObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = [MEMORY[0x263F08690] currentHandler];
        v19 = [NSString stringWithUTF8String:"-[CRKFetchObservingInstructorsByCourseOperation operationsDidComplete:]"];
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        [v18 handleFailureInFunction:v19, @"CRKFetchObservingInstructorsByCourseOperation.m", 100, @"expected %@, got %@", v21, v23 file lineNumber description];
      }
      [(CRKFetchObservingInstructorsByCourseOperation *)self compileResultsWithFetchCoursesResult:v24 fetchScreenObserversResult:v9];
      goto LABEL_8;
    }
    v6 = [(CRKFetchObservingInstructorsByCourseOperation *)self fetchInstructorsOperation];
  }
  id v24 = v6;
  objc_super v9 = [v6 error];
  [(CRKFetchObservingInstructorsByCourseOperation *)self endOperationWithError:v9];
LABEL_8:
}

- (void)compileResultsWithFetchCoursesResult:(id)a3 fetchScreenObserversResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKFetchObservingInstructorsByCourseOperation.m", 105, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  objc_super v9 = [v7 courses];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_2;
  v14[3] = &unk_2646F4480;
  id v15 = v8;
  id v10 = v8;
  v11 = objc_msgSend(v9, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_45, v14);

  [(CRKFetchObservingInstructorsByCourseOperation *)self endOperationWithResultObject:v11];
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) instructors];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_3;
  v17[3] = &unk_2646F4410;
  id v5 = v3;
  id v18 = v5;
  v6 = objc_msgSend(v4, "crk_mapUsingBlock:", v17);

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_4;
  id v15 = &unk_2646F4438;
  id v16 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "crk_mapUsingBlock:", &v12);
  objc_super v9 = objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_25, v12, v13, v14, v15);

  if ([v9 count]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 isObservingStudentScreen]) {
    goto LABEL_4;
  }
  objc_super v4 = [v3 sessionIdentifier];
  id v5 = [v4 groupIdentifier];
  v6 = [*(id *)(a1 + 32) courseIdentifier];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [v3 userIdentifier];
  }
  else
  {
LABEL_4:
    id v8 = 0;
  }

  return v8;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_super v4 = [v2 instructorsByIdentifier];
  id v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

uint64_t __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 userIdentifier];
  v6 = [v4 userIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (CRKRequestPerformingProtocol)requestPerformer
{
  return self->_requestPerformer;
}

- (CATRemoteTaskOperation)fetchInstructorsOperation
{
  return self->_fetchInstructorsOperation;
}

- (void)setFetchInstructorsOperation:(id)a3
{
}

- (CATRemoteTaskOperation)fetchCoursesOperation
{
  return self->_fetchCoursesOperation;
}

- (void)setFetchCoursesOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCoursesOperation, 0);
  objc_storeStrong((id *)&self->_fetchInstructorsOperation, 0);

  objc_storeStrong((id *)&self->_requestPerformer, 0);
}

@end