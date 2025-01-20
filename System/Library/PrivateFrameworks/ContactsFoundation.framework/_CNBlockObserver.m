@interface _CNBlockObserver
- (_CNBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNBlockObserver

- (_CNBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CNBlockObserver;
  v11 = [(_CNBlockObserver *)&v22 init];
  if (v11)
  {
    if (!v8) {
      id v8 = &__block_literal_global_85;
    }
    if (!v9) {
      id v9 = &__block_literal_global_3_2;
    }
    if (!v10) {
      id v10 = &__block_literal_global_6_0;
    }
    uint64_t v12 = [v8 copy];
    id resultBlock = v11->_resultBlock;
    v11->_id resultBlock = (id)v12;

    uint64_t v14 = [v9 copy];
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = (id)v14;

    uint64_t v16 = [v10 copy];
    id failureBlock = v11->_failureBlock;
    v11->_id failureBlock = (id)v16;

    v18 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v11->_enforcement;
    v11->_enforcement = v18;

    v20 = v11;
  }

  return v11;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CNObservableContractEnforcement shouldSwizzleNilResults];
  if (!v4 && v5)
  {
    v6 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v6);
    }

    v7 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v7);
    }

    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  [(CNObservableContractEnforcement *)self->_enforcement observerDidReceiveResult:v4];
  (*((void (**)(void))self->_resultBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)observerDidFailWithError:(id)a3
{
  enforcement = self->_enforcement;
  id v5 = a3;
  [(CNObservableContractEnforcement *)enforcement observerDidFailWithError:v5];
  (*((void (**)(void))self->_failureBlock + 2))();
}

- (void)observerDidComplete
{
  [(CNObservableContractEnforcement *)self->_enforcement observerDidComplete];
  v3 = (void (*)(void))*((void *)self->_completionBlock + 2);

  v3();
}

@end