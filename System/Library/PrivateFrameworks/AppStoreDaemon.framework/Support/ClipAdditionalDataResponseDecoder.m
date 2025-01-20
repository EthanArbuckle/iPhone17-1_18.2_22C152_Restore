@interface ClipAdditionalDataResponseDecoder
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation ClipAdditionalDataResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  self;
  v6 = [v5 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 response];
    id v9 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 200, 100);
    unsigned int v10 = objc_msgSend(v9, "containsIndex:", objc_msgSend(v8, "statusCode"));
    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid Status Code: %lu", [v8 statusCode]);
      ASDErrorWithDescription();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = v11;
    if (v10)
    {
      id v15 = v5;
      self;
      v16 = [v15 object];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        v18 = [v15 object];
        id v19 = sub_1002687B0(v18, @"status", 0);
        id v20 = v13;
        if (v19)
        {
          v21 = +[NSString stringWithFormat:@"Invalid Response Status: %lu", v19];
          ASDErrorWithDescription();
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        ASDErrorWithDescription();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v22 = v20;
      id v13 = v22;
    }
  }
  else
  {
    ASDErrorWithDescription();
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = v12;
  }
  if (v13)
  {
    v23 = 0;
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    v23 = [[ClipAdditionalDataResult alloc] initWithResult:v5];
  }

  return v23;
}

@end