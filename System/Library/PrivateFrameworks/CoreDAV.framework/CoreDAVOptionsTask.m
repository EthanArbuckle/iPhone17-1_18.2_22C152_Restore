@interface CoreDAVOptionsTask
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVOptionsTask

- (id)httpMethod
{
  return @"OPTIONS";
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CoreDAVTask *)self delegate];
    [v7 optionsTask:self error:v4];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVOptionsTask;
  [(CoreDAVTask *)&v8 finishCoreDAVTaskWithError:v4];
}

@end