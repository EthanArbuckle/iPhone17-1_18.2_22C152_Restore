@interface AMSMediaResponseDecoder
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation AMSMediaResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 response];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 200, 100);
    uint64_t v10 = [v8 statusCode];
    if (v10 == 401)
    {
      v11 = @"Media token is expired.";
    }
    else
    {
      uint64_t v10 = [v8 statusCode];
      if (v10 == 403)
      {
        v11 = @"Media token is invalid.";
      }
      else
      {
        if ([v8 statusCode] != 404)
        {
          if (objc_msgSend(v9, "containsIndex:", objc_msgSend(v8, "statusCode")))
          {
            v12 = 0;
          }
          else
          {
            v15 = objc_msgSend(NSString, "stringWithFormat:", @"Response status code is: %lu", objc_msgSend(v8, "statusCode"));
            v12 = AMSError(301, @"Invalid Status Code", v15, 0);
          }
LABEL_13:

          if (!v12) {
            goto LABEL_14;
          }
          goto LABEL_5;
        }
        v11 = @"Media resource not found.";
        uint64_t v10 = 405;
      }
    }
    v12 = AMSError(v10, @"Invalid Status Code", v11, 0);
    goto LABEL_13;
  }
  v12 = AMSError(301, @"Invalid Response", @"Response is not of type NSHTTPURLResponse.", 0);
  if (!v12)
  {
LABEL_14:
    v13 = [[AMSMediaResult alloc] initWithResult:v5];
    goto LABEL_15;
  }
LABEL_5:
  v13 = 0;
  if (a4) {
    *a4 = v12;
  }
LABEL_15:

  return v13;
}

@end