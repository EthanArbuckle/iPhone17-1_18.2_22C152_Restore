@interface SFPersonaManager
+ (id)currentPersonaId;
+ (id)sharedInstance;
+ (void)runAsPersona:(id)a3 block:(id)a4;
- (BOOL)personaMatchesEnrolledUser:(id)a3;
- (NSSet)personaIds;
- (id)_initWithQueue:(id)a3;
@end

@implementation SFPersonaManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIds, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSSet)personaIds
{
  return self->_personaIds;
}

- (id)_initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFPersonaManager;
  v6 = [(SFPersonaManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    [(SFPersonaManager *)v7 _initializeUserProfileStore];
  }

  return v7;
}

- (BOOL)personaMatchesEnrolledUser:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFPersonaManager *)self personaIds];
  int v6 = [v5 containsObject:v4];

  v7 = SFLogFramework;
  BOOL v8 = os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v11 = 136315394;
      v12 = "-[SFPersonaManager personaMatchesEnrolledUser:]";
      __int16 v13 = 2112;
      id v14 = v4;
      objc_super v9 = "%s Persona (%@) matches an enrolled user.";
LABEL_6:
      _os_log_impl(&dword_1B709D000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v8)
  {
    int v11 = 136315394;
    v12 = "-[SFPersonaManager personaMatchesEnrolledUser:]";
    __int16 v13 = 2112;
    id v14 = v4;
    objc_super v9 = "%s Persona (%@) does not match an enrolled user.";
    goto LABEL_6;
  }

  return v6;
}

+ (void)runAsPersona:(id)a3 block:(id)a4
{
  if (!a3)
  {
    if (a4) {
      (*((void (**)(id))a4 + 2))(a4);
    }
  }
}

+ (id)currentPersonaId
{
  return 0;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFPersonaManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1710 != -1) {
    dispatch_once(&sharedInstance_onceToken_1710, block);
  }
  v2 = (void *)sharedInstance_sharedManager_1711;

  return v2;
}

void __34__SFPersonaManager_sharedInstance__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = objc_claimAutoreleasedReturnValue();
  v2 = (const char *)[v1 cStringUsingEncoding:4];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v7 = dispatch_queue_create(v2, v4);

  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) _initWithQueue:v7];
  int v6 = (void *)sharedInstance_sharedManager_1711;
  sharedInstance_sharedManager_1711 = v5;
}

@end