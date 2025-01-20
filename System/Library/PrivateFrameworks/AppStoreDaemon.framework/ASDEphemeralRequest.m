@interface ASDEphemeralRequest
+ (BOOL)supportsSecureCoding;
+ (int64_t)requestType;
- (ASDEphemeralRequest)init;
- (ASDEphemeralRequest)initWithCoder:(id)a3;
- (ASDRequestOptions)options;
- (void)_initWithOptions:(void *)a1;
- (void)_startWithCompletionHandler:(void *)result;
- (void)encodeWithCoder:(id)a3;
- (void)receiveResponse:(id)a3;
@end

@implementation ASDEphemeralRequest

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDEphemeralRequest;
  id v4 = a3;
  [(ASDRequest *)&v6 encodeWithCoder:v4];
  v5 = [(ASDEphemeralRequest *)self options];
  [v4 encodeObject:v5 forKey:@"options"];
}

- (ASDRequestOptions)options
{
  return self->_options;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)_startWithCompletionHandler:(void *)result
{
  if (result)
  {
    v2 = result;
    objc_setProperty_atomic_copy(result, newValue, newValue, 32);
    v3 = +[ASDRequest _sharedBroker];
    -[ASDRequestBroker markRequestAsActive:](v3, v2);

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__ASDEphemeralRequest__startWithCompletionHandler___block_invoke;
    v4[3] = &unk_1E58B2F08;
    v4[4] = v2;
    return (void *)[v2 _startWithErrorHandler:v4];
  }
  return result;
}

void __58__ASDEphemeralRequest__callCompletionHandlerWithResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) success];
  id v4 = *(void **)(a1 + 32);
  v5 = [v4 error];
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  id v6 = +[ASDRequest _sharedBroker];
  -[ASDRequestBroker markRequestAsComplete:](v6, *(void **)(a1 + 40));
}

- (void)_initWithOptions:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASDEphemeralRequest;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[5];
      a1[5] = v4;
    }
  }

  return a1;
}

- (ASDEphemeralRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDEphemeralRequest;
  v5 = [(ASDRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    options = v5->_options;
    v5->_options = (ASDRequestOptions *)v6;
  }
  return v5;
}

- (void)receiveResponse:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id v6 = objc_getProperty(self, v4, 32, 1);
    if (v6)
    {
      objc_super v7 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__ASDEphemeralRequest__callCompletionHandlerWithResponse___block_invoke;
      block[3] = &unk_1E58B3068;
      id v13 = v6;
      id v11 = v5;
      v12 = self;
      dispatch_async(v7, block);

      objc_setProperty_atomic_copy(self, v8, 0, 32);
    }
    else
    {
      objc_super v9 = +[ASDRequest _sharedBroker];
      -[ASDRequestBroker markRequestAsComplete:](v9, self);
    }
  }
}

uint64_t __51__ASDEphemeralRequest__startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v5 = a2;
    if (v3)
    {
      id v6 = objc_getProperty(v3, v4, 32, 1);
      if (v6)
      {
        objc_super v7 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__ASDEphemeralRequest__failCompletionHandlerWithError___block_invoke;
        block[3] = &unk_1E58B3068;
        id v14 = v6;
        id v12 = v5;
        id v13 = v3;
        dispatch_async(v7, block);
      }
      else
      {
        SEL v8 = +[ASDRequest _sharedBroker];
        -[ASDRequestBroker markRequestAsComplete:](v8, v3);
      }
    }
  }
  objc_super v9 = *(void **)(a1 + 32);
  return [v9 setProxy:0];
}

- (ASDEphemeralRequest)init
{
  return (ASDEphemeralRequest *)-[ASDEphemeralRequest _initWithOptions:](self, 0);
}

+ (int64_t)requestType
{
  return -1;
}

void __55__ASDEphemeralRequest__failCompletionHandlerWithError___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = +[ASDRequest _sharedBroker];
  -[ASDRequestBroker markRequestAsComplete:](v2, *(void **)(a1 + 40));
}

@end