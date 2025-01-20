@interface CNTestableObserver
+ (id)observerWithScheduler:(id)a3;
- (CNTestableObserver)initWithScheduler:(id)a3;
- (NSArray)resultValues;
- (NSArray)results;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation CNTestableObserver

+ (id)observerWithScheduler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithScheduler:v4];

  return v5;
}

- (CNTestableObserver)initWithScheduler:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNTestableObserver;
  v6 = [(CNTestableObserver *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v7->_results;
    v7->_results = v8;

    v10 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v7->_enforcement;
    v7->_enforcement = v10;

    v12 = v7;
  }

  return v7;
}

- (NSArray)resultValues
{
  v2 = [(CNTestableObserver *)self results];
  v3 = objc_msgSend(v2, "_cn_filter:", CNObservedResultIsResultFilter);
  id v4 = objc_msgSend(v3, "_cn_map:", CNObservedResultValueTransform);

  return (NSArray *)v4;
}

- (void)observerDidReceiveResult:(id)a3
{
  enforcement = self->_enforcement;
  id v5 = a3;
  [(CNObservableContractEnforcement *)enforcement observerDidReceiveResult:v5];
  results = self->_results;
  id v7 = +[CNObservedResult resultWithTime:[(CNVirtualScheduler *)self->_scheduler clock] value:v5];

  [(NSMutableArray *)results addObject:v7];
}

- (void)observerDidComplete
{
  [(CNObservableContractEnforcement *)self->_enforcement observerDidComplete];
  results = self->_results;
  id v4 = +[CNObservedResult completionResultWithTime:[(CNVirtualScheduler *)self->_scheduler clock]];
  [(NSMutableArray *)results addObject:v4];
}

- (void)observerDidFailWithError:(id)a3
{
  enforcement = self->_enforcement;
  id v5 = a3;
  [(CNObservableContractEnforcement *)enforcement observerDidFailWithError:v5];
  results = self->_results;
  id v7 = +[CNObservedResult failureWithError:v5 time:[(CNVirtualScheduler *)self->_scheduler clock]];

  [(NSMutableArray *)results addObject:v7];
}

- (NSArray)results
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end