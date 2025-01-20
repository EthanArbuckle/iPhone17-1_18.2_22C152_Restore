@interface DMTTaskOperation
- (BOOL)isAsynchronous;
- (void)main;
- (void)run;
@end

@implementation DMTTaskOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
}

- (void)run
{
  if ([(DMTTaskOperation *)self isExecuting])
  {
    if ([(DMTTaskOperation *)self isCanceled])
    {
      CATErrorWithCodeAndUserInfo();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      -[DMTTaskOperation endOperationWithError:](self, "endOperationWithError:");
    }
    else
    {
      id v3 = [(CATTaskOperation *)self request];
      -[DMTTaskOperation runWithRequest:](self, "runWithRequest:");
    }
  }
}

@end