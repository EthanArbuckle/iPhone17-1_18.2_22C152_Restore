@interface ABBufferQueryCount
- (ABBufferQueryCount)initWithAddressBook:(void *)a3 predicate:(id)a4 includeLinkedContacts:(BOOL)a5 managedConfiguration:(id)a6;
@end

@implementation ABBufferQueryCount

- (ABBufferQueryCount)initWithAddressBook:(void *)a3 predicate:(id)a4 includeLinkedContacts:(BOOL)a5 managedConfiguration:(id)a6
{
  BOOL v7 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ABBufferQueryCount;
  v10 = [(ABBufferQueryCount *)&v24 init];
  if (v10)
  {
    if (a3 && (CPRecordStoreGetDatabase(), CPSqliteDatabaseConnectionForWriting()))
    {
      v10->super._managedConfiguration = (CNManagedConfiguration *)a6;
      v10->super._predicate = (ABSQLPredicate *)a4;
      if (v7) {
        v10->super._fetchLinkedContacts = v7;
      }
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      int v23 = 1;
      v10->super._sortOrder = -1;
      CFRetain(a3);
      v10->super._addressBook = a3;
      v11 = (const void *)[@"SELECT count() FROM preferredmatched;" mutableCopy];
      -[ABBufferQuery prependWithClauseToQueryString:whereClause:](v10, "prependWithClauseToQueryString:whereClause:", v11, [a4 query]);
      uint64_t v12 = CPSqliteConnectionStatementForSQL();
      uint64_t v13 = v12;
      if (v12)
      {
        if (*(void *)(v12 + 8))
        {
          ABRegulatoryLogReadContactsData((uint64_t)a3);
          [(ABBufferQuery *)v10 setStatement:v13];
          v14 = objc_opt_new();
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke;
          v21[3] = &unk_1E5989718;
          v21[4] = v22;
          v21[5] = v13;
          [v14 setIntBinder:v21];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_2;
          v20[3] = &unk_1E59890C0;
          v20[4] = v22;
          v20[5] = v13;
          [v14 setStringBinder:v20];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_3;
          v19[3] = &unk_1E5989740;
          v19[4] = v22;
          v19[5] = v13;
          [v14 setBlobBinder:v19];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_4;
          v18[3] = &unk_1E5989768;
          v18[4] = v22;
          v18[5] = v13;
          [v14 setPointerBinder:v18];
          if ([a4 bindBlock])
          {
            uint64_t v15 = [a4 bindBlock];
            (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v14);
          }
        }
      }
      else
      {
        v16 = ABOSLogGeneral();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ABBufferQuery initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:]((uint64_t)v11, v16);
        }
      }
      CFRelease(v11);
      _Block_object_dispose(v22, 8);
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(_DWORD *)(v4 + 24);
  if (a2)
  {
    v6 = (const char *)_CPCreateUTF8StringFromCFString();
    uint64_t result = sqlite3_bind_text(v3, v5, v6, -1, MEMORY[0x1E4F14838]);
  }
  else
  {
    uint64_t result = sqlite3_bind_null(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(v4 + 24));
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_3(uint64_t a1, void *a2, int n)
{
  uint64_t result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, n, 0);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), &v4, 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end