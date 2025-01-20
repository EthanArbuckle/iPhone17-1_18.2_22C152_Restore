@interface IMDDatabaseLegacyXPCBridge
- (id)_attachmentRecordsCopiedFromXPCArray:(id)a3;
- (id)_chatRecordsCopiedFromXPCArray:(id)a3;
- (id)_codableDictionaryCopiedFromXPCDictionary:(id)a3 objectClass:(Class)a4;
- (id)_codableObjectsCopiedFromXPCArray:(id)a3 objectClass:(Class)a4;
- (id)_handleRecordsCopiedFromXPCArray:(id)a3;
- (id)_messageRecordsCopiedFromXPCArray:(id)a3;
- (id)_xpcArrayWithAttachmentRecords:(id)a3;
- (id)_xpcArrayWithChatRecords:(id)a3;
- (id)_xpcArrayWithCodableObjects:(id)a3;
- (id)_xpcArrayWithHandleRecords:(id)a3;
- (id)_xpcArrayWithMessageRecords:(id)a3;
- (id)_xpcDictionaryWithCodableObjects:(id)a3;
@end

@implementation IMDDatabaseLegacyXPCBridge

- (id)_xpcArrayWithChatRecords:(id)a3
{
  CFArrayRef v3 = (const __CFArray *)a3;
  xpc_object_t empty = xpc_array_create_empty();
  _IMDChatRecordCopyChatsToXPCArray(v3, empty, 0, 0, 1, 1);

  return empty;
}

- (id)_xpcDictionaryWithCodableObjects:(id)a3
{
  id v3 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFBBA010;
  v7[3] = &unk_1E5F95710;
  id v5 = empty;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)_codableDictionaryCopiedFromXPCDictionary:(id)a3 objectClass:(Class)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:xpc_dictionary_get_count(v5)];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFBBA358;
    applier[3] = &unk_1E5F95788;
    id v11 = v6;
    id v12 = v5;
    Class v13 = a4;
    id v7 = v6;
    xpc_dictionary_apply(v12, applier);
    id v8 = (void *)[v7 copy];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)_chatRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
  {
    id v4 = _IMDChatRecordCopyChatsFromXPCArray(a3);
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_xpcArrayWithMessageRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v11 = xpc_dictionary_create_empty();
        _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
        xpc_array_append_value(empty, v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithAttachmentRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v11 = xpc_dictionary_create_empty();
        _IMDAttachmentRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
        xpc_array_append_value(empty, v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithHandleRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v11 = xpc_dictionary_create_empty();
        _IMDHandleRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
        xpc_array_append_value(empty, v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithCodableObjects:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v11 = xpc_dictionary_create_empty();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        xpc_array_append_value(empty, v11);
      }
      uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v10, 0);
    }
    while (v7);
  }

  return empty;
}

- (id)_handleRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
  {
    id v4 = _IMDHandleRecordCopyHandlesFromXPCArray(a3);
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_messageRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = (void *)[[v3 alloc] initWithCapacity:xpc_array_get_count(v4)];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFBBA1C8;
    applier[3] = &unk_1E5F95738;
    id v10 = v5;
    id v6 = v5;
    xpc_array_apply(v4, applier);

    uint64_t v7 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (id)_codableObjectsCopiedFromXPCArray:(id)a3 objectClass:(Class)a4
{
  if (a3)
  {
    id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithCapacity:xpc_array_get_count(v6)];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = sub_1AFBBA304;
    long long v14 = &unk_1E5F95760;
    id v15 = v7;
    Class v16 = a4;
    id v8 = v7;
    xpc_array_apply(v6, &v11);

    v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

- (id)_attachmentRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = (void *)[[v3 alloc] initWithCapacity:xpc_array_get_count(v4)];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFBBA4C4;
    applier[3] = &unk_1E5F95738;
    id v10 = v5;
    id v6 = v5;
    xpc_array_apply(v4, applier);

    uint64_t v7 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

@end