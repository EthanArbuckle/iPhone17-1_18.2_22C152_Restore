@interface AMSBagURLParser
+ (_NSRange)_rangeOfTemplateInURLString:(id)a3;
+ (_NSRange)_rangeofSubstringWithOpeningTag:(id)a3 closingTag:(id)a4 inString:(id)a5;
+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingBlock:(id)a4;
+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingPromiseBlock:(id)a4;
+ (id)_URLBySubstitutingVariablesInURLString:(id)a3 range:(_NSRange)a4 usingPromiseBlock:(id)a5;
+ (id)_firstVariableInTemplate:(id)a3 includeTags:(BOOL)a4;
@end

@implementation AMSBagURLParser

id __82__AMSBagURLParser__URLBySubstitutingVariablesInURLString_range_usingPromiseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a2 value];
  id v8 = *(id *)(a1 + 32);
  if (v6)
  {
    v9 = +[AMSLogConfig sharedBagConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = AMSLogKey();
      v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v3 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v3];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      v15 = };
      v16 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      __int16 v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get value for variable. Placeholder will be removed from URL string. error = %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = (void *)v3;
      }
    }
  }
  if (v7)
  {
    v17 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", @"{", &stru_1EDCA7308, 0, *(void *)(a1 + 64), *(void *)(a1 + 72));

    v18 = objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", @"}", &stru_1EDCA7308, 0, *(void *)(a1 + 64), *(void *)(a1 + 72) - 1);

    id v8 = [*(id *)(a1 + 56) _firstVariableInTemplate:*(void *)(a1 + 40) includeTags:1];
    v19 = objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", v8, v7, 0, *(void *)(a1 + 64), *(void *)(a1 + 72) - 2);
  }
  else
  {
    v19 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", *(void *)(a1 + 40), &stru_1EDCA7308, 0, *(void *)(a1 + 64), *(void *)(a1 + 72));
  }

  uint64_t v20 = [*(id *)(a1 + 56) _rangeOfTemplateInURLString:v19];
  v22 = objc_msgSend(*(id *)(a1 + 56), "_URLBySubstitutingVariablesInURLString:range:usingPromiseBlock:", v19, v20, v21, *(void *)(a1 + 48));

  return v22;
}

+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingPromiseBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _rangeOfTemplateInURLString:v7];
  v10 = objc_msgSend(a1, "_URLBySubstitutingVariablesInURLString:range:usingPromiseBlock:", v7, v8, v9, v6);

  return v10;
}

+ (_NSRange)_rangeofSubstringWithOpeningTag:(id)a3 closingTag:(id)a4 inString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 rangeOfString:a3];
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v12 = v9;
    unint64_t v13 = objc_msgSend(v8, "rangeOfString:options:range:", v7, 0, v9 + 1, objc_msgSend(v8, "length") - (v9 + 1));
    BOOL v14 = v13 != 0x7FFFFFFFFFFFFFFFLL && v13 > v12;
    if (v14) {
      uint64_t v10 = v12;
    }
    if (v14) {
      uint64_t v11 = v13 - v12 + 1;
    }
    else {
      uint64_t v11 = 0;
    }
  }

  NSUInteger v15 = v10;
  NSUInteger v16 = v11;
  result.length = v16;
  result.location = v15;
  return result;
}

+ (id)_URLBySubstitutingVariablesInURLString:(id)a3 range:(_NSRange)a4 usingPromiseBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  uint64_t v10 = (void (**)(id, void *))a5;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    if (v11)
    {
      unint64_t v12 = +[AMSPromise promiseWithResult:v11];
    }
    else
    {
      v18 = [NSString stringWithFormat:@"NSURL initializer returned nil. URL string = %@", v9];
      v19 = AMSError(2, @"Failed to create URL from URL string", v18, 0);
      unint64_t v12 = +[AMSPromise promiseWithError:v19];
    }
  }
  else
  {
    unint64_t v13 = objc_msgSend(v9, "substringWithRange:", location, length);
    uint64_t v11 = [a1 _firstVariableInTemplate:v13 includeTags:0];
    BOOL v14 = +[AMSOptional optionalWithNil];
    NSUInteger v15 = +[AMSPromise promiseWithResult:v14];

    if (v11)
    {
      uint64_t v16 = v10[2](v10, v11);

      NSUInteger v15 = (void *)v16;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__AMSBagURLParser__URLBySubstitutingVariablesInURLString_range_usingPromiseBlock___block_invoke;
    v21[3] = &unk_1E55A0040;
    id v25 = a1;
    NSUInteger v26 = location;
    NSUInteger v27 = length;
    id v22 = v9;
    id v23 = v13;
    v24 = v10;
    id v17 = v13;
    unint64_t v12 = [v15 continueWithBlock:v21];
  }
  return v12;
}

+ (_NSRange)_rangeOfTemplateInURLString:(id)a3
{
  NSUInteger v3 = [a1 _rangeofSubstringWithOpeningTag:@"{" closingTag:@"}" inString:a3];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

+ (id)_firstVariableInTemplate:(id)a3 includeTags:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _rangeofSubstringWithOpeningTag:@"$" closingTag:@"$" inString:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v6, "substringWithRange:", v7, v8);
    id v9 = v10;
    if (!a4)
    {
      uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"$" withString:&stru_1EDCA7308];

      id v9 = (void *)v11;
    }
  }

  return v9;
}

+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__AMSBagURLParser_URLBySubstitutingVariablesInURLString_usingBlock___block_invoke;
  v32[3] = &unk_1E55A0068;
  id v8 = v7;
  id v33 = v8;
  id v9 = [a1 URLBySubstitutingVariablesInURLString:v6 usingPromiseBlock:v32];
  id v31 = 0;
  uint64_t v10 = [v9 resultWithError:&v31];
  id v11 = v31;

  if (v11)
  {
    BOOL v12 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v13 = +[AMSLogConfig sharedBagConfig];
    BOOL v14 = (void *)v13;
    if (v12)
    {
      if (!v13)
      {
        BOOL v14 = +[AMSLogConfig sharedConfig];
      }
      NSUInteger v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = AMSLogKey();
        id v17 = NSString;
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = v18;
        if (v16)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          [v17 stringWithFormat:@"%@: [%@] ", v19, a1];
        }
        else
        {
          [v17 stringWithFormat:@"%@: ", v18];
        uint64_t v20 = };
        NSUInteger v27 = AMSLogableError(v11);
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        __int16 v36 = 2114;
        v37 = v27;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when substituting values into template URL string. Defaulting to original string with no substitution. error = %{public}@", buf, 0x16u);
        if (v16)
        {

          uint64_t v20 = a1;
        }
      }
      BOOL v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v21 = +[AMSLogConfig sharedBagConfig];
      [v14 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v21 userInfo:0];
    }
    else
    {
      if (!v13)
      {
        BOOL v14 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v21 = [v14 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        id v22 = AMSLogKey();
        id v23 = NSString;
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = v24;
        if (v22)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          [v23 stringWithFormat:@"%@: [%@] ", v25, a1];
        }
        else
        {
          [v23 stringWithFormat:@"%@: ", v24];
        NSUInteger v26 = };
        uint64_t v28 = AMSLogableError(v11);
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        __int16 v36 = 2114;
        v37 = v28;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when substituting values into template URL string. Defaulting to original string with no substitution. error = %{public}@", buf, 0x16u);
        if (v22)
        {

          NSUInteger v26 = a1;
        }
      }
    }

    uint64_t v29 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

    uint64_t v10 = (void *)v29;
  }

  return v10;
}

id __68__AMSBagURLParser_URLBySubstitutingVariablesInURLString_usingBlock___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = [[AMSOptional alloc] initWithValue:v1];
  NSUInteger v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

@end