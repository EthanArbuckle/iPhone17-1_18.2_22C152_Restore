@interface _LNAutoShortcutsProviderXPC
- (_LNAutoShortcutsProviderXPC)initWithConnection:(id)a3;
- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4;
- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4;
- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _LNAutoShortcutsProviderXPC

- (_LNAutoShortcutsProviderXPC)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LNAutoShortcutsProviderXPC;
  v6 = [(_LNAutoShortcutsProviderXPC *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5018;
  v24 = __Block_byref_object_dispose__5019;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5018;
  v18 = __Block_byref_object_dispose__5019;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62___LNAutoShortcutsProviderXPC_propertiesForIdentifiers_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62___LNAutoShortcutsProviderXPC_propertiesForIdentifiers_error___block_invoke_2;
  v12[3] = &unk_1E5B39198;
  v12[4] = &v14;
  v12[5] = &v20;
  [v8 propertiesForIdentifiers:v6 completionHandler:v12];

  v9 = (void *)v15[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5018;
  v24 = __Block_byref_object_dispose__5019;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5018;
  v18 = __Block_byref_object_dispose__5019;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B39198;
  v12[4] = &v14;
  v12[5] = &v20;
  [v8 autoShortcutsForLocaleIdentifier:v6 completionHandler:v12];

  v9 = (void *)v15[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E5B3A550;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 autoShortcutsForLocaleIdentifier:v9 completionHandler:v8];
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92___LNAutoShortcutsProviderXPC_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5B3A550;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  [v13 autoShortcutsForBundleIdentifier:v12 localeIdentifier:v11 completionHandler:v10];
}

@end