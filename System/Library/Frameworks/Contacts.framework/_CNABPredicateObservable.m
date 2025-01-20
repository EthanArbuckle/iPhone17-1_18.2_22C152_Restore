@interface _CNABPredicateObservable
+ (id)makeSerialFetchSchedulerUsingSchedulerProvider:(uint64_t)a1;
+ (id)observableWithPredicates:(int)a3 sortOrdering:(uint64_t)a4 options:(uint64_t)a5 addressBook:(void *)a6 environment:;
+ (id)schedulerForIdentifier:(void *)a3 provider:;
- (BOOL)predicateShouldContinue:(id)a3;
- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4;
- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 metadata:(id)a5;
- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 moreComing:(BOOL)a5;
- (id)initWithPredicate:(int)a3 sortOrdering:(void *)a4 options:(const void *)a5 addressBook:(void *)a6 environment:;
- (id)subscribe:(id)a3;
- (void)dealloc;
- (void)setObserver:(uint64_t)a1;
@end

@implementation _CNABPredicateObservable

+ (id)observableWithPredicates:(int)a3 sortOrdering:(uint64_t)a4 options:(uint64_t)a5 addressBook:(void *)a6 environment:
{
  id v10 = a6;
  id v11 = a2;
  uint64_t v12 = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98___CNABPredicateObservable_observableWithPredicates_sortOrdering_options_addressBook_environment___block_invoke;
  v19[3] = &unk_1E56B8960;
  int v24 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  id v20 = v10;
  uint64_t v21 = v12;
  id v13 = v10;
  v14 = objc_msgSend(v11, "_cn_map:", v19);

  v15 = (void *)MEMORY[0x1E4F5A480];
  v16 = [v13 schedulerProvider];
  v17 = [v15 merge:v14 schedulerProvider:v16];

  return v17;
}

- (id)initWithPredicate:(int)a3 sortOrdering:(void *)a4 options:(const void *)a5 addressBook:(void *)a6 environment:
{
  id v12 = a2;
  id v13 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)_CNABPredicateObservable;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong(a1 + 4, a2);
      }
      *((_DWORD *)a1 + 6) = a3;
      if (a5) {
        CFTypeRef v14 = CFRetain(a5);
      }
      else {
        CFTypeRef v14 = 0;
      }
      a1[2] = (id)v14;
      id v15 = objc_alloc_init(MEMORY[0x1E4F5A368]);
      id v16 = a1[7];
      a1[7] = v15;

      a1[5] = a4;
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CNABPredicateObservable;
  [(_CNABPredicateObservable *)&v4 dealloc];
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  if (self) {
    predicate = self->_predicate;
  }
  else {
    predicate = 0;
  }
  if (predicate)
  {
    -[_CNABPredicateObservable setObserver:]((uint64_t)self, v4);
    if (self) {
      environment = self->_environment;
    }
    else {
      environment = 0;
    }
    v7 = [(CNContactsEnvironment *)environment schedulerProvider];
    if (self) {
      v8 = self->_environment;
    }
    else {
      v8 = 0;
    }
    v9 = v8;
    id v10 = [(CNContactsEnvironment *)v9 abPredicateRunner];

    if (self) {
      id v11 = self->_predicate;
    }
    else {
      id v11 = 0;
    }
    id v12 = [(ABPredicate *)v11 querySerializationIdentifier];
    id v13 = +[_CNABPredicateObservable schedulerForIdentifier:provider:]((uint64_t)_CNABPredicateObservable, v12, v7);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __38___CNABPredicateObservable_subscribe___block_invoke;
    uint64_t v23 = &unk_1E56B8988;
    id v24 = v10;
    v25 = self;
    id v14 = v10;
    id v15 = [v13 performCancelableBlock:&v20];
    if (self) {
      cancelationToken = self->_cancelationToken;
    }
    else {
      cancelationToken = 0;
    }
    -[CNCancelationToken addCancelable:](cancelationToken, "addCancelable:", v15, v20, v21, v22, v23);
  }
  else
  {
    v7 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    [v4 observerDidFailWithError:v7];
  }

  if (self) {
    v17 = self->_cancelationToken;
  }
  else {
    v17 = 0;
  }
  objc_super v18 = v17;

  return v18;
}

- (void)setObserver:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

+ (id)schedulerForIdentifier:(void *)a3 provider:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v7 = [v5 backgroundSchedulerWithQualityOfService:4];
  }
  else
  {
    if (schedulerForIdentifier_provider__cn_once_token_0 != -1) {
      dispatch_once(&schedulerForIdentifier_provider__cn_once_token_0, &__block_literal_global_114);
    }
    v8 = (void *)schedulerForIdentifier_provider__cn_once_object_0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke_2;
    v11[3] = &unk_1E56B89B0;
    uint64_t v13 = v6;
    id v12 = v5;
    id v9 = v8;
    v7 = [v9 objectForKey:v4 onCacheMiss:v11];
  }

  return v7;
}

+ (id)makeSerialFetchSchedulerUsingSchedulerProvider:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = (void *)[v2 newSerialSchedulerWithName:@"com.apple.contacts.seralized.predicate"];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5A4C8]) initWithScheduler:v3 qualityOfService:4];

  return v4;
}

- (BOOL)predicateShouldContinue:(id)a3
{
  if (self) {
    self = (_CNABPredicateObservable *)self->_cancelationToken;
  }
  return [(_CNABPredicateObservable *)self isCanceled] ^ 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  return [(_CNABPredicateObservable *)self predicateShouldContinue:a3 afterFindingRecord:a4 metadata:0];
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 metadata:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    id v10 = self ? self->_cancelationToken : 0;
    if (([(CNCancelationToken *)v10 isCanceled] & 1) == 0)
    {
      if (v9)
      {
        id v12 = v9;
      }
      else
      {
        id v12 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v13 = v12;
      v17[0] = a4;
      v17[1] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      [(CNObserver *)self->_observer observerDidReceiveResult:v14];

      goto LABEL_11;
    }
  }
  if (self)
  {
LABEL_11:
    cancelationToken = self->_cancelationToken;
    goto LABEL_12;
  }
  cancelationToken = 0;
LABEL_12:
  char v15 = [(CNCancelationToken *)cancelationToken isCanceled];

  return v15 ^ 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 moreComing:(BOOL)a5
{
  if (![(_CNABPredicateObservable *)self predicateShouldContinue:a3 afterFindingRecord:a4]|| a5)
  {
    if (!self)
    {
      cancelationToken = 0;
      return [(CNCancelationToken *)cancelationToken isCanceled] ^ 1;
    }
  }
  else
  {
    [(CNObserver *)self->_observer observerDidComplete];
  }
  cancelationToken = self->_cancelationToken;
  return [(CNCancelationToken *)cancelationToken isCanceled] ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end