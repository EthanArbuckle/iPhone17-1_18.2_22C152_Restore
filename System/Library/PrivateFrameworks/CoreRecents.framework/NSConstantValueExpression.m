@interface NSConstantValueExpression
- (id)cr_sqlBindings;
@end

@implementation NSConstantValueExpression

- (id)cr_sqlBindings
{
  id v4 = [(NSConstantValueExpression *)self constantValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [&stru_10002D398 copy];
    id v27 = v5;
    v6 = &v27;
LABEL_7:
    v7 = +[NSArray arrayWithObjects:v6 count:1];

    return v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000170E8;
    v23[3] = &unk_10002CBF0;
    v23[4] = v4;
    id v5 = [v23 copy];
    id v26 = v5;
    v6 = &v26;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100017138;
    v22[3] = &unk_10002CBF0;
    v22[4] = v4;
    id v5 = [v22 copy];
    id v25 = v5;
    v6 = &v25;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (NSArray *)+[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v4);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100006A3C;
          v17[3] = &unk_10002CBF0;
          v17[4] = v13;
          id v14 = [v17 copy];
          [(NSArray *)v7 addObject:v14];
        }
        id v10 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v15 = +[NSAssertionHandler currentHandler];
    v16 = (objc_class *)objc_opt_class();
    [(NSAssertionHandler *)v15 handleFailureInMethod:a2, self, @"NSPredicateBindings.m", 185, @"expected only NSString, NSNumber and NSNull types, got %@", NSStringFromClass(v16) object file lineNumber description];
    return 0;
  }
  return v7;
}

@end