@interface CoreDAVMoveTask
- (NSString)previousETag;
- (id)additionalHeaderValues;
- (id)description;
- (id)httpMethod;
- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setPreviousETag:(id)a3;
@end

@implementation CoreDAVMoveTask

- (void)dealloc
{
  [(CoreDAVTask *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVMoveTask;
  [(CoreDAVTask *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMoveTask;
  v4 = [(CoreDAVCopyOrMoveTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVMoveTask *)self previousETag];
  [v3 appendFormat:@"| Previous ETag: [%@]", v5];

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"MOVE";
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMoveTask;
  v4 = [(CoreDAVCopyOrMoveTask *)&v7 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(CoreDAVMoveTask *)self previousETag];
  if (v5) {
    [v3 setObject:v5 forKey:@"If-Match"];
  }

  return v3;
}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_super v7 = [(CoreDAVTask *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CoreDAVTask *)self delegate];
    [v9 moveTask:self parsedResponses:v10 error:v6];

    [(CoreDAVTask *)self setDelegate:0];
  }
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end