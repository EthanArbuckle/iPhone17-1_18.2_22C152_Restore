@interface _LSDRebuildClient
- (_LSDRebuildClient)initWithXPCConnection:(id)a3;
- (void)noteMigratorRunningWithReply:(id)a3;
- (void)performRebuildRegistration:(id)a3 personaUniqueStrings:(id)a4 reply:(id)a5;
@end

@implementation _LSDRebuildClient

- (_LSDRebuildClient)initWithXPCConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [v5 isEqualToString:@"com.apple.DataMigrator"];

    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v7 = [v4 _xpcConnection];
  int v8 = _LSCheckEntitlementForXPCConnection(v7, @"com.apple.private.coreservices.can-perform-rebuild-registration");

  if (v8)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)_LSDRebuildClient;
    v9 = [(_LSDClient *)&v12 initWithXPCConnection:v4];
    goto LABEL_10;
  }
  v10 = _LSDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_LSDRebuildClient initWithXPCConnection:](buf, [v4 processIdentifier], v10);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (void)performRebuildRegistration:(id)a3 personaUniqueStrings:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v25 = v8;
  v26 = (void (**)(id, id))a5;
  if (!v8) {
    goto LABEL_14;
  }
  id v28 = 0;
  id v9 = v7;
  id v24 = v8;
  v10 = +[_LSPersonaDatabase sharedInstance]();
  v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
  objc_super v12 = -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v10, v11, &v28);

  if (v12)
  {
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) mutableCopy];
          [v17 setObject:v12 forKeyedSubscript:@"LSPersonaUniqueStrings"];
          v18 = (void *)[v17 copy];
          [v7 addObject:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v7 = 0;
  }

  id v19 = v28;
  if (v7)
  {

LABEL_14:
    id v27 = 0;
    BOOL v20 = _LSServer_PerformExternalRebuildRegistration(v7, &v27);
    id v21 = v27;
    if (!v20)
    {
      v22 = _LSInstallLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[_LSDRebuildClient performRebuildRegistration:personaUniqueStrings:reply:]((uint64_t)v21, v22);
      }
    }
    v26[2](v26, v21);

    goto LABEL_22;
  }
  v23 = _LSDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[_LSDRebuildClient performRebuildRegistration:personaUniqueStrings:reply:]((uint64_t)v24, (uint64_t)v19, v23);
  }

  v26[2](v26, v19);
  id v7 = v19;
LABEL_22:
}

- (void)noteMigratorRunningWithReply:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Noting migrator running.", v5, 2u);
  }

  _LSServer_NoteMigratorRunningInMigration();
  v3[2](v3, 0);
}

- (void)initWithXPCConnection:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Connecting pid %d is not entitled to perform rebuild registrations.", buf, 8u);
}

- (void)performRebuildRegistration:(uint64_t)a1 personaUniqueStrings:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "could not perform rebuild registration: %@", (uint8_t *)&v2, 0xCu);
}

- (void)performRebuildRegistration:(uint64_t)a1 personaUniqueStrings:(uint64_t)a2 reply:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Could not look up personas given unique strings %@: %@", (uint8_t *)&v3, 0x16u);
}

@end