@interface MADServiceVideoProcessingSubtask
+ (Class)taskClassForRequest:(id)a3;
+ (id)taskWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (MADServiceVideoProcessingSubtask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (NSString)signpostPayload;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADServiceVideoProcessingSubtask

+ (Class)taskClassForRequest:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isMemberOfClass:objc_opt_class()];

  if (v4) {
    v5 = objc_opt_class();
  }
  else {
    v5 = 0;
  }
  return (Class)v5;
}

+ (id)taskWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "taskClassForRequest:", v16)), "initWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:", v16, v15, v14, v13, v12);

  return v17;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  id v3 = a3;
  [NSString stringWithFormat:@"[MADServiceVideoProcessingSubtask %@] should not be called", v3];
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NotImplementedException" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v4);
}

- (MADServiceVideoProcessingSubtask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  return 0;
}

@end