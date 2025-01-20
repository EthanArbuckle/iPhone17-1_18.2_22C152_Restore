@interface WFCoercionHandler
+ (id)asynchronousBlock:(id)a3;
+ (id)asynchronousBlock:(id)a3 availabilityCheck:(id)a4;
+ (id)block:(id)a3;
+ (id)block:(id)a3 availabilityCheck:(id)a4;
+ (id)keyPath:(id)a3;
+ (id)keyPath:(id)a3 availabilityCheck:(id)a4;
+ (id)keyPath:(id)a3 unavailableIfNilOrEmpty:(BOOL)a4;
- (BOOL)coercionIsAvailableForItem:(id)a3;
- (BOOL)hasAvailabilityCheck;
- (NSString)keyPath;
- (WFCoercionHandler)initWithBlock:(id)a3 asynchronousBlock:(id)a4 keyPath:(id)a5 availabilityCheck:(id)a6;
- (id)asynchronousBlock;
- (id)availabilityCheck;
- (id)block;
- (id)performSynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 error:(id *)a6;
- (int64_t)concurrencyMode;
- (void)performAsynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 completionHandler:(id)a6;
@end

@implementation WFCoercionHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availabilityCheck, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_asynchronousBlock, 0);
  objc_storeStrong(&self->_block, 0);
}

- (id)availabilityCheck
{
  return self->_availabilityCheck;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)asynchronousBlock
{
  return self->_asynchronousBlock;
}

- (id)block
{
  return self->_block;
}

- (void)performAsynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (self->_asynchronousBlock)
  {
    v15 = [[WFCoercionContext alloc] initWithRequestedType:v11 options:v12];
    asynchronousBlock = self->_asynchronousBlock;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __98__WFCoercionHandler_performAsynchronousCoercionWithContentItem_forType_options_completionHandler___block_invoke;
    v19[3] = &unk_26428B0B8;
    v20 = v15;
    id v21 = v14;
    v17 = (void (*)(void *, id, WFCoercionContext *, void *))asynchronousBlock[2];
    v18 = v15;
    v17(asynchronousBlock, v10, v18, v19);
  }
  else
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

void __98__WFCoercionHandler_performAsynchronousCoercionWithContentItem_forType_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = a3;
  uint64_t v5 = WFRepresentationsFromCoercionHandlerResult(a2);
  if (!(v7 | v5))
  {
    v6 = [*(id *)(a1 + 32) requestedType];
    uint64_t v7 = +[WFContentItem badCoercionErrorForType:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)performSynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_block)
  {
    id v12 = [[WFCoercionContext alloc] initWithRequestedType:v10 options:v11];
    id v13 = (*((void (**)(void))self->_block + 2))();
  }
  else if (self->_keyPath)
  {
    id v13 = objc_msgSend(v9, "valueForKeyPath:");
  }
  else
  {
    id v13 = 0;
  }
  v14 = WFRepresentationsFromCoercionHandlerResult(v13);

  return v14;
}

- (int64_t)concurrencyMode
{
  return self->_asynchronousBlock != 0;
}

- (BOOL)coercionIsAvailableForItem:(id)a3
{
  availabilityCheck = (uint64_t (**)(id, id))self->_availabilityCheck;
  if (availabilityCheck) {
    return availabilityCheck[2](availabilityCheck, a3);
  }
  else {
    return 1;
  }
}

- (BOOL)hasAvailabilityCheck
{
  return self->_availabilityCheck != 0;
}

- (WFCoercionHandler)initWithBlock:(id)a3 asynchronousBlock:(id)a4 keyPath:(id)a5 availabilityCheck:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && !v12 && !v13)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFCoercion.m", 95, @"Invalid parameter not satisfying: %@", @"block || asynchronousBlock || keyPath" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)WFCoercionHandler;
  v15 = [(WFCoercionHandler *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    id block = v15->_block;
    v15->_id block = (id)v16;

    uint64_t v18 = [v12 copy];
    id asynchronousBlock = v15->_asynchronousBlock;
    v15->_id asynchronousBlock = (id)v18;

    uint64_t v20 = [v13 copy];
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    id availabilityCheck = v15->_availabilityCheck;
    v15->_id availabilityCheck = (id)v22;

    v24 = v15;
  }

  return v15;
}

+ (id)keyPath:(id)a3 unavailableIfNilOrEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFCoercionHandler_keyPath_unavailableIfNilOrEmpty___block_invoke;
    aBlock[3] = &unk_26428B090;
    id v12 = v6;
    v8 = _Block_copy(aBlock);
  }
  else
  {
    v8 = 0;
  }
  id v9 = [a1 keyPath:v7 availabilityCheck:v8];

  return v9;
}

uint64_t __53__WFCoercionHandler_keyPath_unavailableIfNilOrEmpty___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = [v2 count] == 0;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  uint64_t v4 = !v3;

  return v4;
}

+ (id)keyPath:(id)a3 availabilityCheck:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithBlock:0 asynchronousBlock:0 keyPath:v7 availabilityCheck:v6];

  return v8;
}

+ (id)asynchronousBlock:(id)a3 availabilityCheck:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithBlock:0 asynchronousBlock:v7 keyPath:0 availabilityCheck:v6];

  return v8;
}

+ (id)block:(id)a3 availabilityCheck:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithBlock:v7 asynchronousBlock:0 keyPath:0 availabilityCheck:v6];

  return v8;
}

+ (id)keyPath:(id)a3
{
  return (id)[a1 keyPath:a3 availabilityCheck:0];
}

+ (id)asynchronousBlock:(id)a3
{
  return (id)[a1 asynchronousBlock:a3 availabilityCheck:0];
}

+ (id)block:(id)a3
{
  return (id)[a1 block:a3 availabilityCheck:0];
}

@end