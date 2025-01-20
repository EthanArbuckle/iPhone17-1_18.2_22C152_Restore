@interface CNContactFetchRequestExecutorPredicateEvaluator
- (id)copyFetchRequestWithPredicate:(id)a3;
- (id)evaluateSubpredicate:(id)a3;
- (id)initWithFetchRequestPrototype:(void *)a3 dataMapper:;
- (id)observable;
- (void)evaluatePredicate:(void *)a1;
- (void)visitAndPredicate:(id)a3;
- (void)visitCNPredicate:(id)a3;
- (void)visitFalsePredicate:(id)a3;
- (void)visitNSCompoundPredicate:(id)a3;
- (void)visitNSPredicate:(id)a3;
- (void)visitNotPredicate:(id)a3;
- (void)visitOrPredicate:(id)a3;
- (void)visitTruePredicate:(id)a3;
@end

@implementation CNContactFetchRequestExecutorPredicateEvaluator

- (void)visitNSPredicate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(CNContactFetchRequestExecutorPredicateEvaluator *)self visitTruePredicate:v4];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    int v8 = [v4 isEqual:v7];

    if (v8) {
      [(CNContactFetchRequestExecutorPredicateEvaluator *)self visitFalsePredicate:v4];
    }
  }
  v9 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self evaluateSubpredicate:0];
  if ([v9 isFailure])
  {
    v10 = (void *)MEMORY[0x1E4F5A480];
    v11 = [v9 error];
    v12 = [v10 observableWithError:v11];
    observable = self->_observable;
    self->_observable = v12;
  }
  else
  {
    v25 = self;
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = [v9 value];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v21 = [v20 first];
          int v22 = [v4 evaluateWithObject:v21];

          if (v22) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [MEMORY[0x1E4F5A480] observableWithResult:v14];
    v24 = v25->_observable;
    v25->_observable = (CNObservable *)v23;
  }
}

- (void)visitTruePredicate:(id)a3
{
}

- (id)evaluateSubpredicate:(id)a3
{
  id v4 = a3;
  v5 = -[CNContactFetchRequestExecutorPredicateEvaluator initWithFetchRequestPrototype:dataMapper:]((id *)[CNContactFetchRequestExecutorPredicateEvaluator alloc], self->_fetchRequest, self->_dataMapper);
  -[CNContactFetchRequestExecutorPredicateEvaluator evaluatePredicate:](v5, v4);

  int v6 = -[CNContactFetchRequestExecutorPredicateEvaluator observable](v5);
  id v12 = 0;
  v7 = [v6 allObjects:&v12];
  id v8 = v12;
  v9 = objc_msgSend(v7, "_cn_flatten");

  v10 = [MEMORY[0x1E4F5A4E0] resultWithValue:v9 orError:v8];

  return v10;
}

- (id)initWithFetchRequestPrototype:(void *)a3 dataMapper:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)CNContactFetchRequestExecutorPredicateEvaluator;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      uint64_t v9 = [MEMORY[0x1E4F5A480] emptyObservable];
      id v10 = a1[3];
      a1[3] = (id)v9;
    }
  }

  return a1;
}

- (void)evaluatePredicate:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    if (v3) {
      objc_msgSend(v3, "_cn_acceptVisitor:", a1);
    }
    else {
      [a1 visitCNPredicate:0];
    }
    id v3 = v4;
  }
}

- (void)visitCNPredicate:(id)a3
{
  id v6 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self copyFetchRequestWithPredicate:a3];
  id v4 = [(CNDataMapper *)self->_dataMapper contactObservableForFetchRequest:v6];
  observable = self->_observable;
  self->_observable = v4;
}

- (id)observable
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (id)copyFetchRequestWithPredicate:(id)a3
{
  fetchRequest = self->_fetchRequest;
  id v4 = a3;
  id v5 = (void *)[(CNContactFetchRequest *)fetchRequest copy];
  [v5 setPredicate:v4];

  return v5;
}

- (void)visitNSCompoundPredicate:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 compoundPredicateType];
  if (!v4)
  {
    [(CNContactFetchRequestExecutorPredicateEvaluator *)self visitNotPredicate:v7];
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    [(CNContactFetchRequestExecutorPredicateEvaluator *)self visitAndPredicate:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 2;
  id v6 = v7;
  if (v5)
  {
    [(CNContactFetchRequestExecutorPredicateEvaluator *)self visitOrPredicate:v7];
LABEL_8:
    id v6 = v7;
  }
}

- (void)visitOrPredicate:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v25 = v3;
  obj = [v3 subpredicates];
  uint64_t v28 = [(CNObservable *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v37;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self evaluateSubpredicate:*(void *)(*((void *)&v36 + 1) + 8 * v6)];
        if ([v7 isFailure])
        {
          v21 = (void *)MEMORY[0x1E4F5A480];
          int v22 = [v7 error];
          uint64_t v23 = [v21 observableWithError:v22];
          observable = self->_observable;
          self->_observable = v23;

          v20 = obj;
          goto LABEL_20;
        }
        v30 = v7;
        uint64_t v31 = v6;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v8 = [v7 value];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v14 = [v13 first];
              v15 = [v14 identifier];
              char v16 = [v4 containsObject:v15];

              if ((v16 & 1) == 0)
              {
                uint64_t v17 = [v13 first];
                uint64_t v18 = [v17 identifier];
                [v4 addObject:v18];

                [v5 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v31 + 1;
      }
      while (v31 + 1 != v28);
      uint64_t v28 = [(CNObservable *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  v19 = [MEMORY[0x1E4F5A480] observableWithResult:v5];
  v20 = self->_observable;
  self->_observable = v19;
LABEL_20:
}

- (void)visitAndPredicate:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v35 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v27 = v3;
  obj = [v3 subpredicates];
  uint64_t v31 = [(CNObservable *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v31)
  {
    long long v29 = v4;
    uint64_t v30 = *(void *)v42;
    char v5 = 1;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self evaluateSubpredicate:*(void *)(*((void *)&v41 + 1) + 8 * v6)];
        if ([v7 isFailure])
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F5A480];
          id v8 = [v7 error];
          v24 = [v23 observableWithError:v8];
          observable = self->_observable;
          self->_observable = v24;
LABEL_23:

          int v22 = v27;
          v21 = obj;
          goto LABEL_24;
        }
        uint64_t v33 = v6;
        id v8 = [MEMORY[0x1E4F1CA48] array];
        observable = [MEMORY[0x1E4F1CA80] set];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v34 = v7;
        id v36 = [v7 value];
        uint64_t v10 = [v36 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v38;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v36);
              }
              v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
              if ((v5 & 1) != 0
                || ([*(id *)(*((void *)&v37 + 1) + 8 * v13) first],
                    v15 = objc_claimAutoreleasedReturnValue(),
                    [v15 identifier],
                    char v16 = objc_claimAutoreleasedReturnValue(),
                    int v17 = [v35 containsObject:v16],
                    v16,
                    v15,
                    v17))
              {
                uint64_t v18 = [v14 first];
                v19 = [v18 identifier];
                [observable addObject:v19];

                [v8 addObject:v14];
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v36 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v11);
        }

        uint64_t v4 = v29;
        [v29 setArray:v8];
        [v35 setSet:observable];
        if (![v35 count])
        {
          v25 = [MEMORY[0x1E4F5A480] emptyObservable];
          long long v26 = self->_observable;
          self->_observable = v25;

          id v7 = v34;
          goto LABEL_23;
        }

        char v5 = 0;
        uint64_t v6 = v33 + 1;
      }
      while (v33 + 1 != v31);
      char v5 = 0;
      uint64_t v31 = [(CNObservable *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  v20 = [MEMORY[0x1E4F5A480] observableWithResult:v4];
  v21 = self->_observable;
  self->_observable = v20;
  int v22 = v27;
LABEL_24:
}

- (void)visitNotPredicate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self evaluateSubpredicate:0];
  if ([v5 isFailure])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F5A480];
    id v7 = [v5 error];
    id v8 = [v6 observableWithError:v7];
    observable = self->_observable;
    self->_observable = v8;
  }
  else
  {
    long long v35 = v4;
    id v10 = objc_alloc_init(MEMORY[0x1E4F5A468]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v11 = [v5 value];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          int v17 = [v16 first];
          uint64_t v18 = [v17 identifier];
          [v10 setObject:v16 forKeyedSubscript:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v13);
    }

    id v4 = v35;
    v19 = [v35 subpredicates];
    v20 = [v19 firstObject];
    v21 = [(CNContactFetchRequestExecutorPredicateEvaluator *)self evaluateSubpredicate:v20];

    if ([v21 isFailure])
    {
      int v22 = (void *)MEMORY[0x1E4F5A480];
      uint64_t v23 = [v21 error];
      v24 = [v22 observableWithError:v23];
      v25 = self->_observable;
      self->_observable = v24;
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v26 = [v21 value];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v37 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = [*(id *)(*((void *)&v36 + 1) + 8 * j) first];
            long long v32 = [v31 identifier];
            [v10 setObject:0 forKeyedSubscript:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v28);
      }

      uint64_t v33 = (void *)MEMORY[0x1E4F5A480];
      uint64_t v23 = [v10 allObjects];
      long long v34 = [v33 observableWithResult:v23];
      v25 = self->_observable;
      self->_observable = v34;
      id v4 = v35;
    }
  }
}

- (void)visitFalsePredicate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F5A480], "emptyObservable", a3);
  self->_observable = (CNObservable *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

@end