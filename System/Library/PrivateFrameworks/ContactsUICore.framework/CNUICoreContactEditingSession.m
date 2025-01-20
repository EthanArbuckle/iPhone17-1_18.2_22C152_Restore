@interface CNUICoreContactEditingSession
+ (BOOL)isEdiingStateOfContactValid:(int64_t)a3;
- (BOOL)containsAddedContactMatchingContact:(id)a3;
- (BOOL)containsRemovedContactMatchingContact:(id)a3;
- (BOOL)containsUpdatedContactMatchingContact:(id)a3;
- (BOOL)inProgress;
- (BOOL)isContactUnseen:(id)a3;
- (BOOL)wasContactAdded:(id)a3;
- (BOOL)wasContactRemoved:(id)a3;
- (BOOL)wasContactUpdated:(id)a3;
- (CNUICoreContactEditingSession)init;
- (CNUICoreContactScratchpad)contactsAdded;
- (CNUICoreContactScratchpad)contactsRemoved;
- (CNUICoreContactScratchpad)contactsUpdated;
- (NSArray)addedContacts;
- (NSArray)removedContacts;
- (NSArray)updatedContacts;
- (id)addedContactsMatchingContacts:(id)a3;
- (id)applyChangesToContacts:(id)a3;
- (id)description;
- (id)generateSaveRequest;
- (id)removedContactsMatchingContacts:(id)a3;
- (id)updatedContactsMatchingContacts:(id)a3;
- (int64_t)editingStateOfContact:(id)a3;
- (void)addContacts:(id)a3;
- (void)removeContacts:(id)a3;
- (void)setContactsAdded:(id)a3;
- (void)setContactsRemoved:(id)a3;
- (void)setContactsUpdated:(id)a3;
- (void)updateContacts:(id)a3;
@end

@implementation CNUICoreContactEditingSession

- (CNUICoreContactEditingSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNUICoreContactEditingSession;
  v2 = [(CNUICoreContactEditingSession *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[CNUICoreContactScratchpad emptyScratchpad];
    contactsAdded = v2->_contactsAdded;
    v2->_contactsAdded = (CNUICoreContactScratchpad *)v3;

    uint64_t v5 = +[CNUICoreContactScratchpad emptyScratchpad];
    contactsUpdated = v2->_contactsUpdated;
    v2->_contactsUpdated = (CNUICoreContactScratchpad *)v5;

    uint64_t v7 = +[CNUICoreContactScratchpad emptyScratchpad];
    contactsRemoved = v2->_contactsRemoved;
    v2->_contactsRemoved = (CNUICoreContactScratchpad *)v7;

    v9 = v2;
  }

  return v2;
}

- (BOOL)inProgress
{
  uint64_t v3 = *MEMORY[0x263F334D8];
  v4 = [(CNUICoreContactEditingSession *)self contactsAdded];
  uint64_t v5 = [v4 allContacts];
  if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v5))
  {
    v6 = [(CNUICoreContactEditingSession *)self contactsUpdated];
    uint64_t v7 = [v6 allContacts];
    if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v7))
    {
      v8 = [(CNUICoreContactEditingSession *)self contactsRemoved];
      v9 = [v8 allContacts];
      int v10 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v9) ^ 1;
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)addContacts:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_70);
    }
    uint64_t v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactEditingSession addContacts:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (void)v24))
        {
          case 1:
            v19 = [(CNUICoreContactEditingSession *)self contactsAdded];
            uint64_t v31 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v31;
            goto LABEL_15;
          case 2:
            v19 = [(CNUICoreContactEditingSession *)self contactsAdded];
            uint64_t v30 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v30;
LABEL_15:
            v22 = [v20 arrayWithObjects:v21 count:1];
            v23 = [v19 scratchpadByAddingContacts:v22];
            [(CNUICoreContactEditingSession *)self setContactsAdded:v23];
            goto LABEL_17;
          case 3:
            v19 = [(CNUICoreContactEditingSession *)self contactsUpdated];
            uint64_t v29 = v18;
            v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
            v23 = [v19 scratchpadByAddingContacts:v22];
            [(CNUICoreContactEditingSession *)self setContactsUpdated:v23];
            goto LABEL_17;
          case 4:
            v19 = [(CNUICoreContactEditingSession *)self contactsRemoved];
            uint64_t v28 = v18;
            v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
            v23 = [v19 scratchpadByRemovingContacts:v22];
            [(CNUICoreContactEditingSession *)self setContactsRemoved:v23];
LABEL_17:

            break;
          default:
            break;
        }
        [(CNUICoreContactEditingSession *)self verifyConsistencyOfEditingSessionForContact:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }
}

- (int64_t)editingStateOfContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self isContactUnseen:v4];
  BOOL v6 = [(CNUICoreContactEditingSession *)self wasContactAdded:v4];
  BOOL v7 = [(CNUICoreContactEditingSession *)self wasContactUpdated:v4];
  BOOL v8 = [(CNUICoreContactEditingSession *)self wasContactRemoved:v4];

  if (v5 && !v6)
  {
    if (v8)
    {
      int64_t v9 = 1;
      if (!v5) {
        int64_t v9 = 2;
      }
      if (v7) {
        int64_t result = v9;
      }
      else {
        int64_t result = 5;
      }
      if (!v7 || v5) {
        return result;
      }
LABEL_26:
      int64_t v14 = 4;
      if (!v8) {
        int64_t v14 = 0;
      }
      if (v7) {
        return 3;
      }
      else {
        return v14;
      }
    }
    goto LABEL_20;
  }
  int v11 = v5 || !v6;
  if (((v11 | v8) & 1) == 0)
  {
LABEL_20:
    if (v7) {
      return 5;
    }
LABEL_22:
    if (v5) {
      int64_t result = 1;
    }
    else {
      int64_t result = 2;
    }
    if (v5 || v6) {
      return result;
    }
    goto LABEL_26;
  }
  if ((v5 || !v6) && v8 && !v7) {
    goto LABEL_22;
  }
  int v12 = v11 & v8 | !v7;
  int64_t v13 = 1;
  if (!v5) {
    int64_t v13 = 2;
  }
  if (v12) {
    int64_t result = 5;
  }
  else {
    int64_t result = v13;
  }
  if (((v12 | (v5 || v6)) & 1) == 0) {
    goto LABEL_26;
  }
  return result;
}

- (BOOL)isContactUnseen:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self contactsAdded];
  if ([v5 containsContact:v4])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v7 = [(CNUICoreContactEditingSession *)self contactsUpdated];
    if ([v7 containsContact:v4])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      BOOL v8 = [(CNUICoreContactEditingSession *)self contactsRemoved];
      int v6 = [v8 containsContact:v4] ^ 1;
    }
  }

  return v6;
}

- (BOOL)wasContactAdded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self contactsAdded];
  char v6 = [v5 containsContact:v4];

  return v6;
}

- (BOOL)wasContactUpdated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self contactsUpdated];
  char v6 = [v5 containsContact:v4];

  return v6;
}

- (BOOL)wasContactRemoved:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self contactsRemoved];
  char v6 = [v5 containsContact:v4];

  return v6;
}

+ (BOOL)isEdiingStateOfContactValid:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 5;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)updateContacts:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_70);
    }
    BOOL v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactEditingSession updateContacts:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (void)v29))
        {
          case 1:
            v19 = [(CNUICoreContactEditingSession *)self contactsUpdated];
            uint64_t v37 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v37;
            goto LABEL_14;
          case 2:
            v19 = [(CNUICoreContactEditingSession *)self contactsAdded];
            uint64_t v36 = v18;
            long long v24 = (void *)MEMORY[0x263EFF8C0];
            long long v25 = &v36;
            goto LABEL_17;
          case 3:
            v19 = [(CNUICoreContactEditingSession *)self contactsUpdated];
            uint64_t v35 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v35;
LABEL_14:
            v22 = [v20 arrayWithObjects:v21 count:1];
            v23 = [v19 scratchpadByAddingContacts:v22];
            [(CNUICoreContactEditingSession *)self setContactsUpdated:v23];
            goto LABEL_18;
          case 4:
            long long v26 = [(CNUICoreContactEditingSession *)self contactsRemoved];
            uint64_t v34 = v18;
            long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
            uint64_t v28 = [v26 scratchpadByRemovingContacts:v27];
            [(CNUICoreContactEditingSession *)self setContactsRemoved:v28];

            v19 = [(CNUICoreContactEditingSession *)self contactsAdded];
            uint64_t v33 = v18;
            long long v24 = (void *)MEMORY[0x263EFF8C0];
            long long v25 = &v33;
LABEL_17:
            v22 = [v24 arrayWithObjects:v25 count:1];
            v23 = [v19 scratchpadByAddingContacts:v22];
            [(CNUICoreContactEditingSession *)self setContactsAdded:v23];
LABEL_18:

            break;
          default:
            break;
        }
        [(CNUICoreContactEditingSession *)self verifyConsistencyOfEditingSessionForContact:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }
}

- (void)removeContacts:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_70);
    }
    BOOL v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactEditingSession removeContacts:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (void)v27))
        {
          case 1:
            v19 = [(CNUICoreContactEditingSession *)self contactsRemoved];
            uint64_t v35 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v35;
            goto LABEL_16;
          case 2:
            v19 = [(CNUICoreContactEditingSession *)self contactsAdded];
            uint64_t v34 = v18;
            long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
            long long v26 = [v19 scratchpadByRemovingContacts:v25];
            [(CNUICoreContactEditingSession *)self setContactsAdded:v26];
            goto LABEL_17;
          case 3:
            v22 = [(CNUICoreContactEditingSession *)self contactsUpdated];
            uint64_t v33 = v18;
            v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
            long long v24 = [v22 scratchpadByRemovingContacts:v23];
            [(CNUICoreContactEditingSession *)self setContactsUpdated:v24];

            v19 = [(CNUICoreContactEditingSession *)self contactsRemoved];
            uint64_t v32 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v32;
            goto LABEL_16;
          case 4:
            v19 = [(CNUICoreContactEditingSession *)self contactsRemoved];
            uint64_t v31 = v18;
            v20 = (void *)MEMORY[0x263EFF8C0];
            v21 = &v31;
LABEL_16:
            long long v25 = [v20 arrayWithObjects:v21 count:1];
            long long v26 = [v19 scratchpadByAddingContacts:v25];
            [(CNUICoreContactEditingSession *)self setContactsRemoved:v26];
LABEL_17:

            break;
          default:
            break;
        }
        [(CNUICoreContactEditingSession *)self verifyConsistencyOfEditingSessionForContact:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }
}

- (NSArray)addedContacts
{
  v2 = [(CNUICoreContactEditingSession *)self contactsAdded];
  BOOL v3 = [v2 allContacts];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (NSArray)updatedContacts
{
  v2 = [(CNUICoreContactEditingSession *)self contactsUpdated];
  BOOL v3 = [v2 allContacts];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (NSArray)removedContacts
{
  v2 = [(CNUICoreContactEditingSession *)self contactsRemoved];
  BOOL v3 = [v2 allContacts];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (BOOL)containsAddedContactMatchingContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self addedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  uint64_t v7 = [v4 identifier];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (BOOL)containsUpdatedContactMatchingContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self updatedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  uint64_t v7 = [v4 identifier];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (BOOL)containsRemovedContactMatchingContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self removedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  uint64_t v7 = [v4 identifier];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (id)addedContactsMatchingContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self addedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__CNUICoreContactEditingSession_addedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_2640176B8;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v4, "_cn_compactMap:", v10);

  return v8;
}

id __63__CNUICoreContactEditingSession_addedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

- (id)updatedContactsMatchingContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self updatedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CNUICoreContactEditingSession_updatedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_2640176B8;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v4, "_cn_compactMap:", v10);

  return v8;
}

id __65__CNUICoreContactEditingSession_updatedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

- (id)removedContactsMatchingContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNUICoreContactEditingSession *)self removedContacts];
  uint64_t v6 = objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CNUICoreContactEditingSession_removedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_2640176B8;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v4, "_cn_compactMap:", v10);

  return v8;
}

id __65__CNUICoreContactEditingSession_removedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

- (id)generateSaveRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263EFEB48]);
  id v4 = [(CNUICoreContactEditingSession *)self addedContacts];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke;
  v17[3] = &unk_264017A08;
  id v5 = v3;
  id v18 = v5;
  objc_msgSend(v4, "_cn_each:", v17);

  uint64_t v6 = [(CNUICoreContactEditingSession *)self updatedContacts];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_2;
  v15[3] = &unk_264017A08;
  id v7 = v5;
  id v16 = v7;
  objc_msgSend(v6, "_cn_each:", v15);

  uint64_t v8 = [(CNUICoreContactEditingSession *)self removedContacts];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_3;
  v13[3] = &unk_264017A08;
  id v9 = v7;
  id v14 = v9;
  objc_msgSend(v8, "_cn_each:", v13);

  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 mutableCopy];
  [v2 addContact:v3 toContainerWithIdentifier:0];
}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 mutableCopy];
  [v2 updateContact:v3];
}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 mutableCopy];
  [v2 deleteContact:v3];
}

- (id)applyChangesToContacts:(id)a3
{
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v6 = [(CNUICoreContactEditingSession *)self removedContacts];
    id v7 = objc_msgSend(v6, "_cn_indexBy:", kCNUICoreContactToIdentifier);

    uint64_t v8 = [(CNUICoreContactEditingSession *)self updatedContacts];
    id v9 = objc_msgSend(v8, "_cn_indexBy:", kCNUICoreContactToIdentifier);

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke;
    v21[3] = &unk_2640176E0;
    id v22 = v7;
    id v10 = v7;
    id v11 = objc_msgSend(v4, "_cn_filter:", v21);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke_2;
    v19 = &unk_2640176B8;
    id v20 = v9;
    id v12 = v9;
    id v13 = objc_msgSend(v11, "_cn_map:", &v16);
    id v14 = [(CNUICoreContactEditingSession *)self addedContacts];
    id v5 = [v13 arrayByAddingObjectsFromArray:v14];
  }
  return v5;
}

BOOL __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

id __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  BOOL v5 = [v2 objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (!v5) {
    BOOL v5 = v3;
  }
  id v7 = v5;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreContactEditingSession *)self contactsAdded];
  BOOL v5 = [v4 allContacts];
  id v6 = (id)[v3 appendObject:v5 withName:@"contactsAdded"];

  id v7 = [(CNUICoreContactEditingSession *)self contactsUpdated];
  uint64_t v8 = [v7 allContacts];
  id v9 = (id)[v3 appendObject:v8 withName:@"contactsUpdated"];

  id v10 = [(CNUICoreContactEditingSession *)self contactsRemoved];
  id v11 = [v10 allContacts];
  id v12 = (id)[v3 appendObject:v11 withName:@"contactsRemoved"];

  id v13 = [v3 build];

  return v13;
}

- (CNUICoreContactScratchpad)contactsAdded
{
  return self->_contactsAdded;
}

- (void)setContactsAdded:(id)a3
{
}

- (CNUICoreContactScratchpad)contactsUpdated
{
  return self->_contactsUpdated;
}

- (void)setContactsUpdated:(id)a3
{
}

- (CNUICoreContactScratchpad)contactsRemoved
{
  return self->_contactsRemoved;
}

- (void)setContactsRemoved:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsRemoved, 0);
  objc_storeStrong((id *)&self->_contactsUpdated, 0);
  objc_storeStrong((id *)&self->_contactsAdded, 0);
}

- (void)addContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end