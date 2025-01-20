@interface HAP2CancelableObject
- (HAP2CancelableObject)init;
- (HAP2PropertyLock)propertyLock;
- (NSError)cancelError;
- (void)cancelWithError:(id)a3;
- (void)setCancelError:(id)a3;
@end

@implementation HAP2CancelableObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);

  objc_storeStrong((id *)&self->_cancelError, 0);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void)setCancelError:(id)a3
{
}

- (NSError)cancelError
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9298;
  v11 = __Block_byref_object_dispose__9299;
  id v12 = 0;
  v3 = [(HAP2CancelableObject *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HAP2CancelableObject_cancelError__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __35__HAP2CancelableObject_cancelError__block_invoke(uint64_t a1)
{
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2CancelableObject *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2CancelableObject_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

void __40__HAP2CancelableObject_cancelWithError___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  }
}

- (HAP2CancelableObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)HAP2CancelableObject;
  v2 = [(HAP2CancelableObject *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HAP2PropertyLock lockWithName:@"HAP2CancelableObject.propertyLock"];
    propertyLock = v2->_propertyLock;
    v2->_propertyLock = (HAP2PropertyLock *)v3;
  }
  return v2;
}

@end