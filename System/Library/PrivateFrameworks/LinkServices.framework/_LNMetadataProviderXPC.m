@interface _LNMetadataProviderXPC
- (NSXPCConnection)connection;
- (_LNMetadataProviderXPC)initWithConnection:(id)a3;
- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsWithError:(id *)a3;
- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4;
- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
@end

@implementation _LNMetadataProviderXPC

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2228;
  v27 = __Block_byref_object_dispose__2229;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78___LNMetadataProviderXPC_actionForBundleIdentifier_andActionIdentifier_error___block_invoke;
  v16[3] = &unk_1E5B3A3E8;
  v16[4] = &v23;
  v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___LNMetadataProviderXPC_actionForBundleIdentifier_andActionIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E5B38FA0;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 actionsForBundleIdentifier:v8 andActionIdentifier:v9 reply:v15];

  v12 = (void *)v18[5];
  if (v12) {
    id v13 = v12;
  }
  else {
    *a5 = (id) v24[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (void).cxx_destruct
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66___LNMetadataProviderXPC_examplePhrasesForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___LNMetadataProviderXPC_examplePhrasesForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B38FA0;
  v12[4] = &v14;
  v12[5] = &v20;
  [v8 examplePhrasesForBundleIdentifier:v6 reply:v12];

  id v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v6 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "%@ not supported via XPC", (uint8_t *)&v9, 0xCu);
    }
    NSErrorFromMetadataProviderError(9000);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67___LNMetadataProviderXPC_metadataVersionForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E5B3A3E8;
  v12[4] = &v17;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___LNMetadataProviderXPC_metadataVersionForBundleIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E5B389A0;
  v11[4] = &v13;
  v11[5] = &v17;
  [v8 metadataVersionForBundleIdentifier:v6 reply:v11];

  *a4 = (id) v18[5];
  int64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60___LNMetadataProviderXPC_entitiesForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60___LNMetadataProviderXPC_entitiesForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B38FA0;
  v12[4] = &v14;
  void v12[5] = &v20;
  [v8 entitiesForBundleIdentifier:v6 reply:v12];

  int64_t v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)entitiesWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  uint64_t v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___LNMetadataProviderXPC_entitiesWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___LNMetadataProviderXPC_entitiesWithError___block_invoke_2;
  v9[3] = &unk_1E5B39198;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 entitiesWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57___LNMetadataProviderXPC_enumsForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57___LNMetadataProviderXPC_enumsForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B38FA0;
  v12[4] = &v14;
  void v12[5] = &v20;
  [v8 enumsForBundleIdentifier:v6 reply:v12];

  int64_t v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)enumsWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  uint64_t v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41___LNMetadataProviderXPC_enumsWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___LNMetadataProviderXPC_enumsWithError___block_invoke_2;
  v9[3] = &unk_1E5B39198;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 enumsWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2228;
  v27 = __Block_byref_object_dispose__2229;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66___LNMetadataProviderXPC_queriesForBundleIdentifier_ofType_error___block_invoke;
  v16[3] = &unk_1E5B3A3E8;
  v16[4] = &v23;
  uint64_t v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66___LNMetadataProviderXPC_queriesForBundleIdentifier_ofType_error___block_invoke_2;
  v15[3] = &unk_1E5B38FA0;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 queriesForBundleIdentifier:v8 ofType:v9 reply:v15];

  v12 = (void *)v18[5];
  if (v12) {
    id v13 = v12;
  }
  else {
    *a5 = (id) v24[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (id)queriesWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  uint64_t v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_queriesWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43___LNMetadataProviderXPC_queriesWithError___block_invoke_2;
  v9[3] = &unk_1E5B39198;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 queriesWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  uint64_t v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55___LNMetadataProviderXPC_bundleRegistrationsWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55___LNMetadataProviderXPC_bundleRegistrationsWithError___block_invoke_2;
  v9[3] = &unk_1E5B38FA0;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 bundleRegistrationsWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (id)bundlesWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  uint64_t v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_bundlesWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43___LNMetadataProviderXPC_bundlesWithError___block_invoke_2;
  v9[3] = &unk_1E5B38FA0;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 bundlesWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__2228;
  v26 = __Block_byref_object_dispose__2229;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2228;
  uint64_t v20 = __Block_byref_object_dispose__2229;
  id v21 = 0;
  connection = self->_connection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69___LNMetadataProviderXPC_entityIdentifiersForBundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E5B3A3E8;
  v15[4] = &v22;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69___LNMetadataProviderXPC_entityIdentifiersForBundleIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E5B38FA0;
  v14[4] = &v16;
  v14[5] = &v22;
  [v8 entityIdentifiersForBundleIdentifier:v6 reply:v14];

  id v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v23[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__2228;
  v26 = __Block_byref_object_dispose__2229;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2228;
  uint64_t v20 = __Block_byref_object_dispose__2229;
  id v21 = 0;
  connection = self->_connection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69___LNMetadataProviderXPC_actionIdentifiersForBundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E5B3A3E8;
  v15[4] = &v22;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69___LNMetadataProviderXPC_actionIdentifiersForBundleIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E5B38FA0;
  v14[4] = &v16;
  v14[5] = &v22;
  [v8 actionIdentifiersForBundleIdentifier:v6 reply:v14];

  id v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v23[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  uint64_t v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___LNMetadataProviderXPC_actionsWithFullyQualifiedIdentifiers_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69___LNMetadataProviderXPC_actionsWithFullyQualifiedIdentifiers_error___block_invoke_2;
  v12[3] = &unk_1E5B39198;
  v12[4] = &v14;
  void v12[5] = &v20;
  [v8 actionsWithFullyQualifiedIdentifiers:v6 reply:v12];

  id v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2228;
  id v27 = __Block_byref_object_dispose__2229;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  id v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79___LNMetadataProviderXPC_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke;
  v16[3] = &unk_1E5B3A3E8;
  v16[4] = &v23;
  uint64_t v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79___LNMetadataProviderXPC_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E5B38FA0;
  v15[4] = &v17;
  void v15[5] = &v23;
  [v11 actionsForBundleIdentifier:v8 andActionIdentifier:v9 reply:v15];

  v12 = (void *)v18[5];
  if (v12) {
    id v13 = v12;
  }
  else {
    *a5 = (id) v24[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  uint64_t v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59___LNMetadataProviderXPC_actionsForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59___LNMetadataProviderXPC_actionsForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B38FA0;
  v12[4] = &v14;
  void v12[5] = &v20;
  [v8 actionsForBundleIdentifier:v6 reply:v12];

  id v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2228;
  v30 = __Block_byref_object_dispose__2229;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  connection = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105___LNMetadataProviderXPC_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke;
  v19[3] = &unk_1E5B3A3E8;
  v19[4] = &v26;
  uint64_t v14 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105___LNMetadataProviderXPC_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke_2;
  v18[3] = &unk_1E5B39198;
  v18[4] = &v20;
  v18[5] = &v26;
  [v14 actionsConformingToSystemProtocol:v10 withParametersOfTypes:v11 bundleIdentifier:v12 reply:v18];

  uint64_t v15 = (void *)v21[5];
  if (v15) {
    id v16 = v15;
  }
  else {
    *a6 = (id) v27[5];
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2228;
  uint64_t v18 = __Block_byref_object_dispose__2229;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84___LNMetadataProviderXPC_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E5B3A3E8;
  v13[4] = &v20;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84___LNMetadataProviderXPC_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E5B39198;
  v12[4] = &v14;
  void v12[5] = &v20;
  [v8 actionsAndSystemProtocolDefaultsForBundleIdentifier:v6 reply:v12];

  id v9 = (void *)v15[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    *a4 = (id) v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__2228;
  v29 = __Block_byref_object_dispose__2229;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2228;
  uint64_t v23 = __Block_byref_object_dispose__2229;
  id v24 = 0;
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96___LNMetadataProviderXPC_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke;
  v18[3] = &unk_1E5B3A3E8;
  v18[4] = &v25;
  id v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96___LNMetadataProviderXPC_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke_2;
  v17[3] = &unk_1E5B39198;
  v17[4] = &v19;
  v17[5] = &v25;
  [v13 actionsConformingToSystemProtocols:v10 logicalType:a4 bundleIdentifier:v11 reply:v17];

  uint64_t v14 = (void *)v20[5];
  if (v14) {
    id v15 = v14;
  }
  else {
    *a6 = (id) v26[5];
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)actionsWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2228;
  uint64_t v21 = __Block_byref_object_dispose__2229;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2228;
  id v15 = __Block_byref_object_dispose__2229;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_actionsWithError___block_invoke;
  v10[3] = &unk_1E5B3A3E8;
  v10[4] = &v17;
  v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43___LNMetadataProviderXPC_actionsWithError___block_invoke_2;
  v9[3] = &unk_1E5B39198;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 actionsWithReply:v9];

  id v6 = (void *)v12[5];
  if (v6) {
    id v7 = v6;
  }
  else {
    *a3 = (id) v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (_LNMetadataProviderXPC)initWithConnection:(id)a3
{
  v4 = (NSXPCConnection *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_LNMetadataProviderXPC;
  v5 = [(_LNMetadataProviderXPC *)&v8 init];
  connection = v5->_connection;
  v5->_connection = v4;

  return v5;
}

@end