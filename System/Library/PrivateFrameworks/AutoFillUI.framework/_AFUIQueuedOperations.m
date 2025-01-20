@interface _AFUIQueuedOperations
+ (id)queuedOperationsWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6;
- (NSString)secureAppID;
- (RTITextOperations)textOperations;
- (_AFUIQueuedOperations)initWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6;
- (id)completionHandler;
- (int)processID;
@end

@implementation _AFUIQueuedOperations

+ (id)queuedOperationsWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSecureAppID:v11 processID:v7 textOperations:v10 completionHandler:v9];

  return v12;
}

- (_AFUIQueuedOperations)initWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_AFUIQueuedOperations;
  v13 = [(_AFUIQueuedOperations *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    secureAppID = v13->_secureAppID;
    v13->_secureAppID = (NSString *)v14;

    v13->_processID = a4;
    objc_storeStrong((id *)&v13->_textOperations, a5);
    uint64_t v16 = MEMORY[0x24C589E40](v12);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v16;
  }
  return v13;
}

- (NSString)secureAppID
{
  return self->_secureAppID;
}

- (int)processID
{
  return self->_processID;
}

- (RTITextOperations)textOperations
{
  return self->_textOperations;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);

  objc_storeStrong((id *)&self->_secureAppID, 0);
}

@end