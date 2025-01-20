@interface CESRSpeechProfileAdminFactory
+ (id)sharedAdminFactory;
- (CESRSpeechProfileAdminFactory)init;
- (CESRSpeechProfileAdminFactory)initWithServiceProvider:(id)a3;
- (id)admin;
@end

@implementation CESRSpeechProfileAdminFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

- (id)admin
{
  v3 = [CESRSpeechProfileAdmin alloc];
  v4 = [(CESRSpeechProfileAdminServiceProvider *)self->_serviceProvider adminService];
  v5 = [(CESRSpeechProfileAdmin *)v3 initWithAdminService:v4 queue:self->_queue];

  return v5;
}

- (CESRSpeechProfileAdminFactory)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use - initWithServiceProvider" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CESRSpeechProfileAdminFactory)initWithServiceProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CESRSpeechProfileAdminFactory;
  v6 = [(CESRSpeechProfileAdminFactory *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_serviceProvider, a3);
  if (v7->_serviceProvider)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CESRSpeechProfileAdminQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  v12 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CESRSpeechProfileAdminFactory initWithServiceProvider:]";
    _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s Cannot initialize admin with nil service provider.", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

+ (id)sharedAdminFactory
{
  if (sharedAdminFactory_onceToken != -1) {
    dispatch_once(&sharedAdminFactory_onceToken, &__block_literal_global_45);
  }
  id v2 = (void *)sharedAdminFactory_sharedAdminFactory;

  return v2;
}

void __51__CESRSpeechProfileAdminFactory_sharedAdminFactory__block_invoke()
{
  v0 = [CESRSpeechProfileAdminFactory alloc];
  v3 = objc_alloc_init(CESRSpeechProfileAdminXPCServiceWrapper);
  uint64_t v1 = [(CESRSpeechProfileAdminFactory *)v0 initWithServiceProvider:v3];
  id v2 = (void *)sharedAdminFactory_sharedAdminFactory;
  sharedAdminFactory_sharedAdminFactory = v1;
}

@end