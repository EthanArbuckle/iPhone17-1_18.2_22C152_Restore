@interface LibraryQueryPlanner
- (void)visitPredicate:(id)a3;
@end

@implementation LibraryQueryPlanner

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 subpredicates];
    id v7 = [v6 count];

    if (v7)
    {
      v8 = sub_10001A034(self->_stack, (uint64_t)v7);
      if ([v5 compoundPredicateType] == (id)1)
      {
        v9 = [LibraryLazyResultsEnumerator alloc];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000169FC;
        v24[3] = &unk_1005299A8;
        id v25 = v8;
        id v27 = v7;
        id v26 = v5;
        v10 = sub_10001584C(v9, 1, v24);
        stack = self->_stack;
        if (stack) {
          [(NSMutableArray *)stack addObject:v10];
        }

        id v12 = v25;
      }
      else if ([v5 compoundPredicateType] == (id)2)
      {
        v14 = [LibraryLazyResultsEnumerator alloc];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100368EE0;
        v22[3] = &unk_1005299D0;
        id v23 = v8;
        v15 = sub_10001584C(v14, 2, v22);
        v16 = self->_stack;
        if (v16) {
          [(NSMutableArray *)v16 addObject:v15];
        }

        id v12 = v23;
      }
      else
      {
        classifier = self->_classifier;
        id v21 = 0;
        v18 = sub_1000143E8((uint64_t)classifier, v5, (uint64_t)&v21);
        id v12 = v21;
        v19 = self->_stack;
        if (v18)
        {
          if (v19) {
            [(NSMutableArray *)v19 addObject:v18];
          }
        }
        else
        {
          v20 = sub_100242D14((id *)[LibraryErrorResultEnumerator alloc], v12);
          if (v19) {
            [(NSMutableArray *)v19 addObject:v20];
          }
        }
      }
    }
  }
  else
  {
    sub_1000143E8((uint64_t)self->_classifier, v4, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v13 = self->_stack;
      if (v13) {
        [(NSMutableArray *)v13 addObject:v5];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
}

@end