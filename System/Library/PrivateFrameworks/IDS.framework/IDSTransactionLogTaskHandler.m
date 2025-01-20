@interface IDSTransactionLogTaskHandler
+ (id)handlerWithTask:(id)a3 delegate:(id)a4 queue:(id)a5;
- (id)_init;
- (void)perform;
@end

@implementation IDSTransactionLogTaskHandler

+ (id)handlerWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isMemberOfClass:objc_opt_class()])
  {
    v12 = [[IDSTransactionLogBaseTaskHandler alloc] initWithTask:v9 delegate:v10 queue:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v9;
      v12 = [[IDSTransactionLogSyncTaskHandler alloc] initWithTask:v13 delegate:v10 queue:v11];
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:a1 file:@"IDSTransactionLogTaskHandler.m" lineNumber:55 description:@"Unexpected task type"];

      v12 = 0;
    }
  }

  return v12;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSTransactionLogTaskHandler;
  return [(IDSTransactionLogTaskHandler *)&v3 init];
}

- (void)perform
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"IDSTransactionLogTaskHandler.m" lineNumber:65 description:@"Abstract method"];
}

@end