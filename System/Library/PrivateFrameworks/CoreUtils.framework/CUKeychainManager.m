@interface CUKeychainManager
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)addItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)addOrUpdateOrReAddItem:(id)a3 flags:(unsigned int)a4 logCategory:(LogCategory *)a5 logLabel:(id)a6 error:(id *)a7;
- (BOOL)addOrUpdateOrReAddItem:(id)a3 logCategory:(LogCategory *)a4 logLabel:(id)a5 error:(id *)a6;
- (BOOL)removeItemMatchingItem:(id)a3 error:(id *)a4;
- (BOOL)removeItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 error:(id *)a5;
- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 flags:(unsigned int)a5 error:(id *)a6;
- (id)_copyItemsMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)_copyItemsMatchingItemSeparate:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)addItem:(id)a3 returnFlags:(unsigned int)a4 error:(id *)a5;
- (id)copyItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
@end

@implementation CUKeychainManager

- (id)_copyItemsMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 persistentRef];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3BD40]];
    [v9 setObject:*MEMORY[0x1E4F3BB88] forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC68]];
    if ((v6 & 8) != 0) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC78]];
    }
    if (v6) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
    }
LABEL_10:
    CFTypeRef result = 0;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    v18 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v55 = v9;
        v56 = v8;
        id v57 = v7;
        id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v61;
LABEL_14:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v61 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = objc_alloc_init(CUKeychainItem);
              id v59 = 0;
              BOOL v26 = [(CUKeychainItem *)v25 _updateWithAttributesDictionary:v24 flags:v6 error:&v59];
              id v27 = v59;
              v34 = v27;
              if (v26)
              {
                [v58 addObject:v25];
              }
              else if ((v6 & 2) == 0)
              {
                v8 = v56;
                id v7 = v57;
                id v9 = v55;
                v35 = v58;
                if (a5)
                {
                  if (v27)
                  {
                    *a5 = v27;
                  }
                  else
                  {
                    NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v28, v29, v30, v31, v32, v33, v54);
                    id v52 = objc_claimAutoreleasedReturnValue();
                    *a5 = v52;
                  }
                }

LABEL_43:
                goto LABEL_44;
              }
            }
            else if ((v6 & 2) == 0)
            {
              v8 = v56;
              id v7 = v57;
              id v9 = v55;
              v35 = v58;
              if (a5)
              {
                v45 = (objc_class *)objc_opt_class();
                NSStringFromClass(v45);
                v25 = (CUKeychainItem *)objc_claimAutoreleasedReturnValue();
                NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching array contained non-dictionary (%@)", v46, v47, v48, v49, v50, v51, (uint64_t)v25);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              }
LABEL_44:

              v36 = 0;
              goto LABEL_45;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
              if (v21) {
                goto LABEL_14;
              }
              break;
            }
          }
        }

        v35 = v58;
        v36 = (void *)[v58 copy];
        v8 = v56;
        id v7 = v57;
        id v9 = v55;
LABEL_45:

        goto LABEL_46;
      }
      if (a5)
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching returned non-array (%@)", v39, v40, v41, v42, v43, v44, (uint64_t)v38);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      if (v11) {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v11 = 4294941996;
      }
      NSErrorWithOSStatusF(v11, (uint64_t)"SecItemCopyMatching failed", v12, v13, v14, v15, v16, v17, v54);
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v36 = 0;
LABEL_46:

    goto LABEL_47;
  }
  if (v6) {
    int v10 = 458752;
  }
  else {
    int v10 = 327680;
  }
  id v9 = [v7 _attributesDictionaryWithFlags:v10 | (v6 & 8) error:a5];
  if (v9) {
    goto LABEL_10;
  }
  v36 = 0;
LABEL_47:

  return v36;
}

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 secrets];

  id v13 = [(CUKeychainManager *)self copyItemMatchingItem:v11 flags:(v12 != 0) | v7 error:a6];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 _mergeItem:v10];
    CFDictionaryRef v15 = [v14 _attributesDictionaryWithFlags:v7 | 0x80000 error:a6];
    if (v15)
    {
      CFDictionaryRef v16 = [v11 _attributesDictionaryWithFlags:v7 error:a6];
      CFDictionaryRef v17 = v16;
      if (v16)
      {
        uint64_t v18 = SecItemUpdate(v16, v15);
        BOOL v25 = v18 == 0;
        if (a6 && v18)
        {
          NSErrorWithOSStatusF(v18, (uint64_t)"SecItemUpdate failed", v19, v20, v21, v22, v23, v24, v27);
          BOOL v25 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 error:(id *)a5
{
  return [(CUKeychainManager *)self updateItem:a3 matchingItem:a4 flags:0 error:a5];
}

- (BOOL)removeItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 persistentRef];
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v39 = *MEMORY[0x1E4F3BD40];
    v40[0] = v8;
    CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v11 = SecItemDelete(v10);
    BOOL v18 = v11 == 0;
    if (!a5 || !v11) {
      goto LABEL_6;
    }
    NSErrorWithOSStatusF(v11, (uint64_t)"SecItemDelete failed", v12, v13, v14, v15, v16, v17, v38);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v21 = [v7 identifier];
  if (v21)
  {
    uint64_t v28 = (void *)v21;
    uint64_t v29 = [v7 type];

    if (v29)
    {
      CFDictionaryRef v30 = [v7 _attributesDictionaryWithFlags:v6 error:a5];
      CFDictionaryRef v10 = v30;
      if (!v30)
      {
        BOOL v18 = 0;
        goto LABEL_6;
      }
      uint64_t v31 = SecItemDelete(v30);
      BOOL v18 = v31 == 0;
      if (!a5 || !v31) {
        goto LABEL_6;
      }
      NSErrorWithOSStatusF(v31, (uint64_t)"SecItemDelete failed", v32, v33, v34, v35, v36, v37, v38);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v18 = 0;
LABEL_5:
      *a5 = v19;
LABEL_6:

      goto LABEL_7;
    }
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No type and ID or persistent ref", v22, v23, v24, v25, v26, v27, v38);
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_7:

  return v18;
}

- (BOOL)removeItemMatchingItem:(id)a3 error:(id *)a4
{
  return [(CUKeychainManager *)self removeItemMatchingItem:a3 flags:0 error:a4];
}

- (BOOL)addOrUpdateOrReAddItem:(id)a3 flags:(unsigned int)a4 logCategory:(LogCategory *)a5 logLabel:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v53 = 0;
  BOOL v14 = [(CUKeychainManager *)self addItem:v12 flags:v10 error:&v53];
  id v19 = v53;
  if (!v14)
  {
    uint64_t v20 = objc_alloc_init(CUKeychainItem);
    uint64_t v21 = [v12 accessGroup];
    [(CUKeychainItem *)v20 setAccessGroup:v21];

    uint64_t v22 = [v12 identifier];
    [(CUKeychainItem *)v20 setIdentifier:v22];

    -[CUKeychainItem setLegacy:](v20, "setLegacy:", [v12 legacy]);
    -[CUKeychainItem setSyncType:](v20, "setSyncType:", [v12 syncType]);
    uint64_t v23 = [v12 type];
    [(CUKeychainItem *)v20 setType:v23];

    uint64_t v24 = [v12 viewHint];
    [(CUKeychainItem *)v20 setViewHint:v24];

    if ([v19 code] == -25299)
    {
      id v52 = v19;
      BOOL v29 = [(CUKeychainManager *)self updateItem:v12 matchingItem:v20 flags:v10 error:&v52];
      id v30 = v52;

      int var0 = a5->var0;
      if (v29)
      {
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
          LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ updated: %@\n", v31, v32, v33, v34, (uint64_t)v13);
        }
        goto LABEL_40;
      }
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ update failed: %@, %{error}\n", v31, v32, v33, v34, (uint64_t)v13);
      }
    }
    else
    {
      if (a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ add failed: %@, %{error}\n", v25, v26, v27, v28, (uint64_t)v13);
      }
      id v30 = v19;
    }
    id v51 = v30;
    BOOL v37 = [(CUKeychainManager *)self removeItemMatchingItem:v20 flags:v10 error:&v51];
    id v38 = v51;

    if (!v37 && a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
      LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ delete to re-add failed: %@, %{error}\n", v39, v40, v41, v42, (uint64_t)v13);
    }
    id v50 = v38;
    BOOL v43 = [(CUKeychainManager *)self addItem:v12 flags:v10 error:&v50];
    id v30 = v50;

    int v48 = a5->var0;
    if (!v43)
    {
      if (v48 <= 90 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ re-add failed: %@, %{error}\n", v44, v45, v46, v47, (uint64_t)v13);
      }
      if (a7)
      {
        id v30 = v30;
        BOOL v36 = 0;
        *a7 = v30;
      }
      else
      {
        BOOL v36 = 0;
      }
      goto LABEL_41;
    }
    if (v48 <= 30 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
      LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ deleted and re-added: %@\n", v44, v45, v46, v47, (uint64_t)v13);
    }
LABEL_40:
    BOOL v36 = 1;
LABEL_41:

    id v19 = v30;
    goto LABEL_42;
  }
  if (a5->var0 <= 30 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
    LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ added: %@\n", v15, v16, v17, v18, (uint64_t)v13);
  }
  BOOL v36 = 1;
LABEL_42:

  return v36;
}

- (BOOL)addOrUpdateOrReAddItem:(id)a3 logCategory:(LogCategory *)a4 logLabel:(id)a5 error:(id *)a6
{
  return [(CUKeychainManager *)self addOrUpdateOrReAddItem:a3 flags:0 logCategory:a4 logLabel:a5 error:a6];
}

- (id)addItem:(id)a3 returnFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];

  if (!v8)
  {
    if (a5)
    {
      uint64_t v28 = "No identifier";
LABEL_14:
      NSErrorWithOSStatusF(4294960591, (uint64_t)v28, v9, v10, v11, v12, v13, v14, v49);
      uint64_t v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_15:
    uint64_t v27 = 0;
    goto LABEL_31;
  }
  uint64_t v15 = [v7 type];

  if (!v15)
  {
    if (a5)
    {
      uint64_t v28 = "No type";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v6) {
    int v16 = 196608;
  }
  else {
    int v16 = 0x10000;
  }
  CFDictionaryRef v17 = [v7 _attributesDictionaryWithFlags:v16 | v6 error:a5];
  CFDictionaryRef v18 = v17;
  if (v17)
  {
    CFTypeRef result = 0;
    uint64_t v19 = SecItemAdd(v17, &result);
    uint64_t v26 = (void *)result;
    if (v19)
    {
      if (a5)
      {
        NSErrorWithOSStatusF(v19, (uint64_t)"SecItemAdd failed", v20, v21, v22, v23, v24, v25, v49);
        uint64_t v27 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

        goto LABEL_30;
      }
LABEL_22:
      uint64_t v27 = 0;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a5)
      {
        uint64_t v39 = (objc_class *)objc_opt_class();
        uint64_t v40 = NSStringFromClass(v39);
        NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemAdd returned non-dictionary (%@)", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_22;
    }
    BOOL v29 = objc_alloc_init(CUKeychainItem);
    id v50 = 0;
    BOOL v30 = [(CUKeychainItem *)v29 _updateWithAttributesDictionary:v26 flags:v6 error:&v50];
    id v31 = v50;
    id v38 = v31;
    if (v30)
    {
      uint64_t v27 = v29;
LABEL_28:

      goto LABEL_29;
    }
    if (a5)
    {
      if (v31)
      {
        uint64_t v27 = 0;
        *a5 = v31;
        goto LABEL_28;
      }
      NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v32, v33, v34, v35, v36, v37, v49);
      id v47 = objc_claimAutoreleasedReturnValue();
      *a5 = v47;
    }
    uint64_t v27 = 0;
    goto LABEL_28;
  }
  uint64_t v27 = 0;
LABEL_30:

LABEL_31:
  return v27;
}

- (BOOL)addItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];

  if (!v8)
  {
    if (a5)
    {
      uint64_t v26 = "No identifier";
LABEL_11:
      NSErrorWithOSStatusF(4294960591, (uint64_t)v26, v9, v10, v11, v12, v13, v14, v28);
      BOOL v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_12:
    BOOL v25 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = [v7 type];

  if (!v15)
  {
    if (a5)
    {
      uint64_t v26 = "No type";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  CFDictionaryRef v16 = [v7 _attributesDictionaryWithFlags:v6 error:a5];
  CFDictionaryRef v17 = v16;
  if (v16)
  {
    uint64_t v18 = SecItemAdd(v16, 0);
    BOOL v25 = v18 == 0;
    if (a5 && v18)
    {
      NSErrorWithOSStatusF(v18, (uint64_t)"SecItemAdd failed", v19, v20, v21, v22, v23, v24, v28);
      BOOL v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v25 = 0;
  }

LABEL_15:
  return v25;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  return [(CUKeychainManager *)self addItem:a3 flags:0 error:a4];
}

- (id)_copyItemsMatchingItemSeparate:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(CUKeychainManager *)self _copyItemsMatchingItem:v8 flags:v6 & 0xFFFFFFFE error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 count])
    {
      uint64_t v39 = a5;
      uint64_t v11 = objc_alloc_init(CUKeychainItem);
      uint64_t v12 = [v8 accessGroup];
      [(CUKeychainItem *)v11 setAccessGroup:v12];

      -[CUKeychainItem setLegacy:](v11, "setLegacy:", [v8 legacy]);
      -[CUKeychainItem setSyncType:](v11, "setSyncType:", [v8 syncType]);
      uint64_t v13 = [v8 type];
      [(CUKeychainItem *)v11 setType:v13];

      uint64_t v14 = [v8 viewHint];
      [(CUKeychainItem *)v11 setViewHint:v14];

      id v41 = v8;
      uint64_t v15 = [v8 type];

      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v40 = v10;
      id v16 = v10;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v42 = 0;
        uint64_t v19 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v22 = objc_msgSend(v21, "identifier", v39);

            if (v22)
            {
              uint64_t v23 = [v21 identifier];
              [(CUKeychainItem *)v11 setIdentifier:v23];

              if (!v15)
              {
                uint64_t v24 = [v21 type];
                [(CUKeychainItem *)v11 setType:v24];
              }
              BOOL v25 = [v21 viewHint];
              [(CUKeychainItem *)v11 setViewHint:v25];

              id v44 = 0;
              id v26 = [(CUKeychainManager *)self copyItemMatchingItem:v11 flags:v6 error:&v44];
              id v27 = v44;
              uint64_t v28 = v27;
              if (v26)
              {
                [v43 addObject:v26];
              }
              else if (!v42)
              {
                id v42 = v27;
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v18);
      }
      else
      {
        id v42 = 0;
      }

      if ([v43 count])
      {
        BOOL v29 = (void *)[v43 copy];
        uint64_t v10 = v40;
        id v8 = v41;
        uint64_t v35 = v42;
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v10 = v40;
      id v8 = v41;
      uint64_t v36 = v39;
      uint64_t v35 = v42;
      if (v39)
      {
        if (v42)
        {
          BOOL v29 = 0;
          *uint64_t v39 = v42;
          goto LABEL_29;
        }
        NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"No data-accessible items", v30, v31, v32, v33, v34, (uint64_t)v39);
        id v37 = objc_claimAutoreleasedReturnValue();
        id *v36 = v37;
      }
      BOOL v29 = 0;
      goto LABEL_29;
    }
    BOOL v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_30:

  return v29;
}

- (id)copyItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = [v7 persistentRef];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3BD40]];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC68]];
    if ((v6 & 8) != 0) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC78]];
    }
    if (v6) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
    }
LABEL_10:
    CFTypeRef result = 0;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    uint64_t v18 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = objc_alloc_init(CUKeychainItem);
        id v41 = 0;
        BOOL v20 = [(CUKeychainItem *)v19 _updateWithAttributesDictionary:v18 flags:v6 error:&v41];
        id v21 = v41;
        uint64_t v28 = v21;
        if (v20)
        {
          BOOL v29 = v19;
LABEL_28:

          goto LABEL_29;
        }
        if (a5)
        {
          if (v21)
          {
            BOOL v29 = 0;
            *a5 = v21;
            goto LABEL_28;
          }
          NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v22, v23, v24, v25, v26, v27, v40);
          id v38 = objc_claimAutoreleasedReturnValue();
          *a5 = v38;
        }
        BOOL v29 = 0;
        goto LABEL_28;
      }
      if (a5)
      {
        uint64_t v30 = (objc_class *)objc_opt_class();
        uint64_t v31 = NSStringFromClass(v30);
        NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching returned non-dictionary (%@)", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      if (v11) {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v11 = 4294941996;
      }
      NSErrorWithOSStatusF(v11, (uint64_t)"SecItemCopyMatching failed", v12, v13, v14, v15, v16, v17, v40);
      BOOL v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    BOOL v29 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (v6) {
    int v10 = 196608;
  }
  else {
    int v10 = 0x10000;
  }
  id v9 = [v7 _attributesDictionaryWithFlags:v10 | (v6 & 8) error:a5];
  if (v9) {
    goto LABEL_10;
  }
  BOOL v29 = 0;
LABEL_30:

  return v29;
}

@end