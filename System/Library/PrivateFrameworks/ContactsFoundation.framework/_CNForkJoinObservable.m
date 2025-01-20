@interface _CNForkJoinObservable
+ (id)forkJoin:(id)a3;
+ (id)progressiveForkJoin:(id)a3;
- (_CNForkJoinObservable)initWithObservables:(id)a3 reportingStrategy:(id)a4;
- (id)subscribe:(id)a3;
@end

@implementation _CNForkJoinObservable

+ (id)forkJoin:(id)a3
{
  id v4 = a3;
  v5 = -[_CNForkJoinWhenCompleteResultObservationStrategy initWithCapacity:]([_CNForkJoinWhenCompleteResultObservationStrategy alloc], "initWithCapacity:", [v4 count]);
  v6 = (void *)[objc_alloc((Class)a1) initWithObservables:v4 reportingStrategy:v5];

  return v6;
}

+ (id)progressiveForkJoin:(id)a3
{
  id v4 = a3;
  v5 = -[_CNForkJoinProgressiveResultObservationStrategy initWithCapacity:]([_CNForkJoinProgressiveResultObservationStrategy alloc], "initWithCapacity:", [v4 count]);
  v6 = (void *)[objc_alloc((Class)a1) initWithObservables:v4 reportingStrategy:v5];

  return v6;
}

- (_CNForkJoinObservable)initWithObservables:(id)a3 reportingStrategy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNForkJoinObservable;
  v8 = [(_CNForkJoinObservable *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    observables = v8->_observables;
    v8->_observables = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_resultReportingStrategy, a4);
    v11 = v8;
  }

  return v8;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNCancelationToken);
  id v6 = self->_resultReportingStrategy;
  observables = self->_observables;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35___CNForkJoinObservable_subscribe___block_invoke;
  v14[3] = &unk_1E56A2758;
  v15 = v6;
  id v16 = v4;
  v8 = v5;
  v17 = v8;
  id v9 = v4;
  v10 = v6;
  [(NSArray *)observables enumerateObjectsUsingBlock:v14];
  v11 = v17;
  v12 = v8;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultReportingStrategy, 0);

  objc_storeStrong((id *)&self->_observables, 0);
}

@end