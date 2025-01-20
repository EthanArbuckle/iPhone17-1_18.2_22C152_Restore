@interface FKAddressBook
+ (id)sharedInstance;
+ (void)performBlock:(id)a3;
- (FKAddressBook)init;
- (OS_dispatch_queue)operationQueue;
- (void)addressBook;
- (void)dealloc;
- (void)setAddressBook:(void *)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation FKAddressBook

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__sharedFKAddressBook;

  return v2;
}

uint64_t __31__FKAddressBook_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance__sharedFKAddressBook;
  sharedInstance__sharedFKAddressBook = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (FKAddressBook)init
{
  v12.receiver = self;
  v12.super_class = (Class)FKAddressBook;
  v2 = [(FKAddressBook *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("FriendKitAddressBookQueue", v3);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v4;

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v6 = v2->_operationQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __21__FKAddressBook_init__block_invoke;
    v8[3] = &unk_264438040;
    v10 = v11;
    v9 = v2;
    dispatch_sync(v6, v8);

    _Block_object_dispose(v11, 8);
  }
  return v2;
}

void __21__FKAddressBook_init__block_invoke(uint64_t a1)
{
  CFErrorRef error = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABAddressBookCreateWithOptions(0, &error);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v2)
  {
    v3 = _FKGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __21__FKAddressBook_init__block_invoke_cold_1((uint64_t *)&error, v3);
    }

    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *(void *)(*(void *)(a1 + 32) + 8) = v2;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)FKAddressBook;
  [(FKAddressBook *)&v4 dealloc];
}

+ (void)performBlock:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_super v4 = [(id)objc_opt_class() sharedInstance];
    v5 = [v4 operationQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__FKAddressBook_performBlock___block_invoke;
    v7[3] = &unk_264438068;
    id v8 = v4;
    id v9 = v3;
    id v6 = v4;
    dispatch_sync(v5, v7);
  }
}

uint64_t __30__FKAddressBook_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) addressBook];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __21__FKAddressBook_init__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315650;
  objc_super v4 = "-[FKAddressBook init]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 44;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_21CBC2000, a2, OS_LOG_TYPE_ERROR, "%s (%d) \"FriendKit failed to create an address book instance: %@\"", (uint8_t *)&v3, 0x1Cu);
}

@end