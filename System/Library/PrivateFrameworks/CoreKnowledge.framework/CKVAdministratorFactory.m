@interface CKVAdministratorFactory
+ (id)sharedAdministratorFactory;
- (CKVAdministratorFactory)init;
- (CKVAdministratorFactory)initWithServiceProvider:(id)a3;
- (id)administrator;
@end

@implementation CKVAdministratorFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

- (id)administrator
{
  v3 = [CKVocabularyAdministrator alloc];
  v4 = [(CKVAdminServiceProvider *)self->_serviceProvider adminService];
  v5 = [(CKVocabularyAdministrator *)v3 initWithAdminService:v4 queue:self->_queue];

  return v5;
}

- (CKVAdministratorFactory)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use - initWithServiceProvider" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVAdministratorFactory)initWithServiceProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKVAdministratorFactory;
  v6 = [(CKVAdministratorFactory *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_serviceProvider, a3);
  if (v7->_serviceProvider)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CKVAdministratorQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  v12 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CKVAdministratorFactory initWithServiceProvider:]";
    _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s Cannot initialize Administrator with nil service provider.", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

+ (id)sharedAdministratorFactory
{
  if (sharedAdministratorFactory_onceToken != -1) {
    dispatch_once(&sharedAdministratorFactory_onceToken, &__block_literal_global_649);
  }
  id v2 = (void *)sharedAdministratorFactory_sharedAdministratorFactory;
  return v2;
}

void __53__CKVAdministratorFactory_sharedAdministratorFactory__block_invoke()
{
  v0 = [CKVAdministratorFactory alloc];
  v3 = objc_alloc_init(CKVAdminXPCServiceWrapper);
  uint64_t v1 = [(CKVAdministratorFactory *)v0 initWithServiceProvider:v3];
  id v2 = (void *)sharedAdministratorFactory_sharedAdministratorFactory;
  sharedAdministratorFactory_sharedAdministratorFactory = v1;
}

@end