@interface ACHTemplateEntityWrapper
- (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver;
- (ACHTemplateEntityWrapper)initWithProfile:(id)a3;
- (BOOL)insertTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6;
- (BOOL)removeTemplates:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (id)allTemplatesWithError:(id *)a3;
- (void)setProfile:(id)a3;
- (void)setSyncedTemplatesObserver:(id)a3;
- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4;
@end

@implementation ACHTemplateEntityWrapper

- (ACHTemplateEntityWrapper)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACHTemplateEntityWrapper;
  v5 = [(ACHTemplateEntityWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (void)setSyncedTemplatesObserver:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_syncedTemplatesObserver, a3);
  if (a3) {
    v5 = self;
  }
  else {
    v5 = 0;
  }
  +[ACHTemplateEntity setSyncedTemplatesObserver:v5];
}

- (BOOL)insertTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = [(ACHTemplateEntityWrapper *)self profile];
  LOBYTE(a6) = +[ACHTemplateEntity insertTemplates:v11 provenance:a4 useLegacySyncIdentity:0 profile:v12 databaseContext:v10 error:a6];

  return (char)a6;
}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ACHTemplateEntityWrapper *)self profile];
  LOBYTE(a4) = +[ACHTemplateEntity removeTemplates:v6 profile:v7 error:a4];

  return (char)a4;
}

- (id)allTemplatesWithError:(id *)a3
{
  id v4 = [(ACHTemplateEntityWrapper *)self profile];
  v5 = +[ACHTemplateEntity allTemplatesWithProfile:v4 error:a3];

  return v5;
}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  v7 = ACHLogSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACHTemplateEntityWrapper templateEntityDidReceiveSyncedTemplates:provenance:](self, v7);
  }

  objc_super v8 = [(ACHTemplateEntityWrapper *)self syncedTemplatesObserver];
  [v8 templateEntityDidReceiveSyncedTemplates:v6 provenance:a4];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncedTemplatesObserver);
  return (ACHTemplateEntitySyncedTemplatesObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncedTemplatesObserver);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)templateEntityDidReceiveSyncedTemplates:(void *)a1 provenance:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 syncedTemplatesObserver];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Template Entity Wrapper got notified about newly synced templates, passing that along to syncedTemplatesObserver (%@)", (uint8_t *)&v4, 0xCu);
}

@end