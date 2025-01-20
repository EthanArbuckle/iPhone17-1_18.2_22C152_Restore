@interface ASDMediaClipTaskResponseDecoder
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation ASDMediaClipTaskResponseDecoder

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
    if ([v8 statusCode] == 401
      || [v8 statusCode] == 403
      || [v8 statusCode] == 404)
    {
      v10 = AMSError();
    }
    else if (objc_msgSend(v9, "containsIndex:", objc_msgSend(v8, "statusCode")))
    {
      v10 = 0;
    }
    else
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Response status code is: %lu", objc_msgSend(v8, "statusCode"));
      v10 = AMSError();
    }
    if (!v10) {
      goto LABEL_13;
    }
  }
  else
  {
    v10 = AMSError();
    if (!v10)
    {
LABEL_13:
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F4DD38]) initWithResult:v5];
      goto LABEL_14;
    }
  }
  v11 = 0;
  if (a4) {
    *a4 = v10;
  }
LABEL_14:

  return v11;
}

@end