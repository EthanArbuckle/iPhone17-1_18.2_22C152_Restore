@interface LACACMHelper
+ (id)createACMContext;
- (BOOL)setVariable:(unsigned int)a3 value:(id)a4 error:(id *)a5;
- (LACACMHelper)initWithACMContext:(__ACMHandle *)a3;
- (LACACMHelper)initWithExternalizedContext:(id)a3;
- (NSData)externalizedContext;
- (__ACMHandle)acmContext;
- (id)exchangeControlData:(id)a3 error:(id *)a4;
- (id)initAndCreateContext;
- (void)dealloc;
- (void)setAcmContext:(__ACMHandle *)a3;
@end

@implementation LACACMHelper

- (id)initAndCreateContext
{
  v3 = [(id)objc_opt_class() createACMContext];
  if (v3)
  {
    self = [(LACACMHelper *)self initWithExternalizedContext:v3];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (LACACMHelper)initWithACMContext:(__ACMHandle *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LACACMHelper;
  result = [(LACACMHelper *)&v5 init];
  if (result) {
    result->_acmContext = a3;
  }
  return result;
}

- (LACACMHelper)initWithExternalizedContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACACMHelper;
  objc_super v5 = [(LACACMHelper *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    v5->_acmContext = (__ACMHandle *)ACMContextCreateWithExternalForm((_OWORD *)[v6 bytes], objc_msgSend(v6, "length"));
    v5->_contextOwner = 1;
  }

  return v5;
}

- (void)dealloc
{
  acmContext = self->_acmContext;
  if (acmContext && self->_contextOwner) {
    ACMContextDelete(acmContext, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)LACACMHelper;
  [(LACACMHelper *)&v4 dealloc];
}

- (NSData)externalizedContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  acmContext = self->_acmContext;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__LACACMHelper_externalizedContext__block_invoke;
  v5[3] = &unk_2653B6C38;
  v5[4] = &v6;
  ACMContextGetExternalForm(acmContext, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

uint64_t __35__LACACMHelper_externalizedContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 length:a3];
  return MEMORY[0x270F9A758]();
}

- (BOOL)setVariable:(unsigned int)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = LACLogACM();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Setting ACM envrionment variable: %d", buf, 8u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  uint64_t bag_uuid = aks_get_bag_uuid(0, buf);
  if (bag_uuid)
  {
    if (!a5)
    {
LABEL_10:
      BOOL v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Unable to get keybag UUID with code: %d", bag_uuid, v17);
    v15 = LABEL_9:;
    *a5 = +[LACError errorWithCode:-1000 debugDescription:v15];

    goto LABEL_10;
  }
  acmContext = self->_acmContext;
  id v12 = v8;
  uint64_t v13 = ACMSetEnvironmentVariableWithAccessPolicy(v6, acmContext, buf, 16, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  BOOL v14 = v13 == 0;
  if (a5 && v13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unable to set variable: %d with status: %d", v6, v13);
    goto LABEL_9;
  }
LABEL_11:

  return v14;
}

- (id)exchangeControlData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  uint64_t v19 = __Block_byref_object_dispose__5;
  id v20 = (id)objc_opt_new();
  acmContext = self->_acmContext;
  id v8 = v6;
  v9 = (const void *)[v8 bytes];
  size_t v10 = [v8 length];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__LACACMHelper_exchangeControlData_error___block_invoke;
  v14[3] = &unk_2653B6C38;
  v14[4] = &v15;
  uint64_t v11 = ACMSEPControlEx((uint64_t)acmContext, 0, 0, v9, v10, (uint64_t)v14);
  if (v11)
  {
    if (a4)
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Control exchange data failed with error code: %d", v11);
      *a4 = +[LACError errorWithCode:-1000 debugDescription:v12];

      a4 = 0;
    }
  }
  else
  {
    a4 = (id *)(id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return a4;
}

uint64_t __42__LACACMHelper_exchangeControlData_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)createACMContext
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v7 = 0;
  int v2 = ACMContextCreate((uint64_t *)&v7);
  if (v2)
  {
    uint64_t v3 = LACLogACM();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v2;
      _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "Unable to create ACM context with status: %d", buf, 8u);
    }

    id v4 = 0;
  }
  else
  {
    *(void *)buf = 0;
    v9 = buf;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__5;
    id v12 = __Block_byref_object_dispose__5;
    id v13 = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__LACACMHelper_createACMContext__block_invoke;
    v6[3] = &unk_2653B6C38;
    v6[4] = buf;
    ACMContextGetExternalForm(v7, (uint64_t)v6);
    id v4 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

uint64_t __32__LACACMHelper_createACMContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 length:a3];
  return MEMORY[0x270F9A758]();
}

- (__ACMHandle)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(__ACMHandle *)a3
{
  self->_acmContext = a3;
}

@end