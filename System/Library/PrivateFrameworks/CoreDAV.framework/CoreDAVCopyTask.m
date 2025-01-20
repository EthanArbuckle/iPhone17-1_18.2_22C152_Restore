@interface CoreDAVCopyTask
- (BOOL)validate:(id *)a3;
- (id)httpMethod;
- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4;
- (void)dealloc;
@end

@implementation CoreDAVCopyTask

- (id)httpMethod
{
  return @"COPY";
}

- (void)dealloc
{
  [(CoreDAVTask *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVCopyTask;
  [(CoreDAVTask *)&v3 dealloc];
}

- (BOOL)validate:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVCopyTask;
  unsigned int v5 = -[CoreDAVTask validate:](&v9, sel_validate_);
  if (v5)
  {
    unsigned int v5 = [(CoreDAVTask *)self depth];
    BOOL v6 = v5 >= 3;
    LOBYTE(v5) = v5 < 3;
    if (a3)
    {
      if (v6)
      {
        id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:5 userInfo:0];
        LOBYTE(v5) = 0;
        *a3 = v7;
      }
    }
  }
  return v5;
}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CoreDAVTask *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_super v9 = [(CoreDAVTask *)self delegate];
    [v9 copyTask:self parsedResponses:v10 error:v6];

    [(CoreDAVTask *)self setDelegate:0];
  }
}

@end