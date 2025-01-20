id symptomsLogHandle()
{
  void *v0;
  uint64_t vars8;

  if (symptomsLogHandle_symptomsPred != -1) {
    dispatch_once(&symptomsLogHandle_symptomsPred, &__block_literal_global_18);
  }
  v0 = (void *)symptomsLogHandle_symptomsHandle;

  return v0;
}

id xpcLogHandle()
{
  if (xpcLogHandle_xpcPred != -1) {
    dispatch_once(&xpcLogHandle_xpcPred, &__block_literal_global_10_0);
  }
  v0 = (void *)xpcLogHandle_xpcHandle;

  return v0;
}

id configurationLogHandle()
{
  if (configurationLogHandle_configurationPred != -1) {
    dispatch_once(&configurationLogHandle_configurationPred, &__block_literal_global_34);
  }
  v0 = (void *)configurationLogHandle_configurationHandle;

  return v0;
}

id adminLogHandle()
{
  if (adminLogHandle_adminPred != -1) {
    dispatch_once(&adminLogHandle_adminPred, &__block_literal_global_7);
  }
  v0 = (void *)adminLogHandle_adminHandle;

  return v0;
}

id objectanalyticsHandle()
{
  if (objectanalyticsHandle_analyticsHandlePred != -1) {
    dispatch_once(&objectanalyticsHandle_analyticsHandlePred, &__block_literal_global);
  }
  v0 = (void *)objectanalyticsHandle_analyticsHandle;

  return v0;
}

uint64_t __objectanalyticsHandle_block_invoke()
{
  objectanalyticsHandle_analyticsHandle = (uint64_t)os_log_create("com.apple.symptomsframework", "objectanalytics");

  return MEMORY[0x270F9A758]();
}

void sub_209DC000C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t assembleFullName(void *a1, void *a2, void *a3)
{
  v5 = a1;
  v6 = a2;
  if (v6)
  {
    v7 = v6;
    if (![(__CFString *)v6 isAbsolutePath])
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v7 = @"/var/wireless/Library/Databases/Symptoms";
  }
  if (!v5) {
    v5 = @"SymptomAnalytics";
  }
  v9 = [(__CFString *)v7 stringByAppendingPathComponent:v5];
  *a3 = [v9 stringByAppendingPathExtension:@"sqlite"];

  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

void sub_209DC1214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t isDBFileCorrupted(void *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [v3 domain];
  uint64_t v5 = *MEMORY[0x263EFF150];
  if ([v4 isEqualToString:*MEMORY[0x263EFF150]]) {
    BOOL v6 = [v3 code] == 11 || objc_msgSend(v3, "code") == 26;
  }
  else {
    BOOL v6 = 0;
  }

  v7 = [v3 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  if (v8) {
    BOOL v9 = [v8 intValue] == 11 || objc_msgSend(v8, "intValue") == 26;
  }
  else {
    BOOL v9 = 0;
  }
  v10 = [v3 domain];
  if ([v10 isEqualToString:*MEMORY[0x263F07F70]])
  {
    BOOL v11 = [v3 code] == 259;
  }
  else
  {
    v12 = [v3 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F08438]]) {
      BOOL v11 = [v3 code] == 259;
    }
    else {
      BOOL v11 = 0;
    }
  }
  if (v6 || v9 || v11)
  {
    v16 = objectanalyticsHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v3;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Confirming file corruption based on error: %@", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v15 = 1;
  }
  else
  {
    v13 = [v3 userInfo];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a2 <= 5) {
        uint64_t v15 = isDBFileCorrupted(v14, (a2 + 1));
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  return v15;
}

uint64_t ABCPbSigResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_35;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
              *(void *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_48:
          uint64_t v38 = 8;
          goto LABEL_53;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_52:
          uint64_t v38 = 12;
LABEL_53:
          *(_DWORD *)(a1 + v38) = v21;
          continue;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_35:
          v30 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 0xAu:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_55;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          uint64_t v34 = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v34 = 0;
      }
LABEL_57:
      *(unsigned char *)(a1 + 32) = v34 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsSignificantOperationalEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_60;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_62:
          uint64_t v48 = 16;
          goto LABEL_75;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 8u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_66:
          uint64_t v49 = 48;
          goto LABEL_80;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 24;
          goto LABEL_44;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v26 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_70:
          uint64_t v49 = 32;
          goto LABEL_80;
        case 5u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 40;
LABEL_44:
          char v37 = *(void **)(a1 + v31);
          *(void *)(a1 + v31) = v30;

          continue;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 1u;
          while (2)
          {
            uint64_t v40 = *v3;
            unint64_t v41 = *(void *)(a2 + v40);
            if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_74:
          uint64_t v48 = 8;
LABEL_75:
          *(void *)(a1 + v48) = v19;
          continue;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 0x10u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v45 = *v3;
        unint64_t v46 = *(void *)(a2 + v45);
        if (v46 == -1 || v46 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
        *(void *)(a2 + v45) = v46 + 1;
        v26 |= (unint64_t)(v47 & 0x7F) << v43;
        if ((v47 & 0x80) == 0) {
          goto LABEL_77;
        }
        v43 += 7;
        BOOL v14 = v44++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_79;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_79:
      uint64_t v49 = 52;
LABEL_80:
      *(_DWORD *)(a1 + v49) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ABCPbSummarySubmitResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsDiagnosticIncidentEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_61;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_63;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_63:
          uint64_t v48 = 8;
          goto LABEL_72;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 60) |= 0x10u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_67:
          uint64_t v49 = 56;
          goto LABEL_81;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 40;
          goto LABEL_59;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_71:
          uint64_t v48 = 16;
LABEL_72:
          *(void *)(a1 + v48) = v19;
          continue;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 60) |= 8u;
          while (2)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v40 + 1;
              v26 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_76:
          uint64_t v49 = 52;
          goto LABEL_81;
        case 6u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 60) |= 4u;
          break;
        case 7u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 24;
          goto LABEL_59;
        case 8u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 32;
LABEL_59:
          char v47 = *(void **)(a1 + v31);
          *(void *)(a1 + v31) = v30;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 == -1 || v45 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
        *(void *)(a2 + v44) = v45 + 1;
        v26 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0) {
          goto LABEL_78;
        }
        v42 += 7;
        BOOL v14 = v43++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_80;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_80:
      uint64_t v49 = 48;
LABEL_81:
      *(_DWORD *)(a1 + v49) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsDiagnosticIncidentReportReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        a1[152] |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_85;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_87;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_85:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_87:
        uint64_t v56 = 40;
        goto LABEL_100;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        a1[152] |= 0x10u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v26) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_91:
        uint64_t v57 = 96;
        goto LABEL_105;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v20 = 0;
        a1[152] |= 1u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_95:
        uint64_t v56 = 32;
        goto LABEL_100;
      case 4u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 104;
        goto LABEL_69;
      case 5u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 72;
        goto LABEL_69;
      case 6u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 144;
        goto LABEL_69;
      case 7u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 128;
        goto LABEL_69;
      case 8u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 136;
        goto LABEL_69;
      case 9u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 64;
        goto LABEL_69;
      case 0xAu:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 80;
        goto LABEL_69;
      case 0xBu:
        PBReaderReadString();
        char v37 = (AWDSymptomsDiagnosticIncidentEvent *)objc_claimAutoreleasedReturnValue();
        if (v37) {
          [a1 addRelatedNames:v37];
        }
        goto LABEL_67;
      case 0xCu:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v39 = 0;
            unsigned int v40 = 0;
            uint64_t v41 = 0;
            while (1)
            {
              uint64_t v42 = *v3;
              unint64_t v43 = *(void *)(a2 + v42);
              if (v43 == -1 || v43 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_63;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
            PBRepeatedUInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          while (1)
          {
            uint64_t v61 = *v3;
            unint64_t v62 = *(void *)(a2 + v61);
            if (v62 == -1 || v62 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
            *(void *)(a2 + v61) = v62 + 1;
            v60 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v58 += 7;
              BOOL v14 = v59++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_117;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_117:
          PBRepeatedUInt64Add();
        }
        goto LABEL_106;
      case 0xDu:
        char v37 = objc_alloc_init(AWDSymptomsDiagnosticIncidentEvent);
        [a1 addIncidentEvents:v37];
        if (PBReaderPlaceMark()
          && (AWDSymptomsDiagnosticIncidentEventReadFrom((uint64_t)v37, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_67:

LABEL_106:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0xEu:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 88;
LABEL_69:
        unint64_t v45 = *(void **)&a1[v36];
        *(void *)&a1[v36] = v35;

        goto LABEL_106;
      case 0xFu:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v20 = 0;
        a1[152] |= 4u;
        while (2)
        {
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v48) = v49 + 1;
            v20 |= (unint64_t)(v50 & 0x7F) << v46;
            if (v50 < 0)
            {
              v46 += 7;
              BOOL v14 = v47++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_99;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_99:
        uint64_t v56 = 48;
LABEL_100:
        *(void *)&a1[v56] = v20;
        goto LABEL_106;
      case 0x10u:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v26 = 0;
        a1[152] |= 8u;
        while (2)
        {
          uint64_t v53 = *v3;
          unint64_t v54 = *(void *)(a2 + v53);
          if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
            *(void *)(a2 + v53) = v54 + 1;
            v26 |= (unint64_t)(v55 & 0x7F) << v51;
            if (v55 < 0)
            {
              v51 += 7;
              BOOL v14 = v52++ >= 9;
              if (v14)
              {
                LODWORD(v26) = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_104:
        uint64_t v57 = 56;
LABEL_105:
        *(_DWORD *)&a1[v57] = v26;
        goto LABEL_106;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_106;
    }
  }
}

uint64_t ABCPbSummarySubmitRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_36;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_38;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 40) = v19;
        goto LABEL_39;
      case 2u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 24;
        goto LABEL_29;
      case 3u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 8;
        goto LABEL_29;
      case 4u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 16;
LABEL_29:
        unsigned int v25 = *(void **)(a1 + v24);
        *(void *)(a1 + v24) = v23;

        goto LABEL_39;
      case 0xAu:
        uint64_t v27 = objc_alloc_init(ABCPbSummarySignatureRequest);
        [(id)a1 addSigRequest:v27];
        if PBReaderPlaceMark() && (ABCPbSummarySignatureRequestReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t AWDSymptomsDiagnosticNotificationTokenReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209DD05CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigGrantRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_35;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_38;
      case 5u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
        goto LABEL_30;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
LABEL_30:
        uint64_t v26 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_38;
      case 0xAu:
        uint64_t v27 = objc_alloc_init(ABCPbSigRequest);
        [(id)a1 addSigRequest:v27];
        if PBReaderPlaceMark() && (ABCPbSigRequestReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

void sub_209DDB394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DDB41C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DDB590(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DDB6FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DDB868(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DDC9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_209DDDE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209DDEE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_209DDF618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id load_embedded_xml_plist(const char *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t size = 0;
  if (!a1 || !*a1)
  {
    BOOL v6 = configurationLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = (unint64_t)a1;
      unint64_t v12 = "Will NOT load embedded configuration. Invalid identifier: %s";
      char v13 = v6;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
      uint32_t v15 = 12;
LABEL_20:
      _os_log_impl(&dword_209DBA000, v13, v14, v12, buf, v15);
    }
LABEL_21:
    char v8 = 0;
    uint64_t v9 = 0;
    id v10 = 0;
    goto LABEL_22;
  }
  v2 = configurationLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v22 = (unint64_t)a1;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Loading embedded configuration with identifier: %s", buf, 0xCu);
  }

  id v3 = getsectiondata((const mach_header_64 *)&dword_209DBA000, "__TEXT", a1, &size);
  unint64_t v4 = size;
  uint64_t v5 = configurationLogHandle();
  BOOL v6 = v5;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = (unint64_t)a1;
      unint64_t v12 = "Unable to get section data for identifier: %s";
      char v13 = v6;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v22 = size;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Found embedded configuration data of size %lu", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v3 length:size freeWhenDone:0];
  if (!v7)
  {
    BOOL v6 = configurationLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    unint64_t v12 = "Failed to create NSData from embedded section data";
    char v13 = v6;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 2;
    goto LABEL_20;
  }
  char v8 = (void *)v7;
  id v19 = 0;
  uint64_t v9 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:2 format:0 error:&v19];
  id v10 = v19;
  uint64_t v11 = configurationLogHandle();
  BOOL v6 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = (unint64_t)a1;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded embedded configuration plist with identifier: %s", buf, 0xCu);
    }

    BOOL v6 = configurationLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v22 = (unint64_t)v9;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Configuration plist is %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v10 description];
      uint64_t v18 = [v17 UTF8String];
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = v18;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Failed to serialize configuration data into plist: %s", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }
LABEL_22:

  return v9;
}

id iso8601date_string_from_NSDate(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (iso8601date_string_from_NSDate_sharedInstancePred == -1)
  {
    if (v1)
    {
LABEL_3:
      id v3 = [(id)iso8601date_string_from_NSDate_iso8601DateFormatter stringFromDate:v2];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&iso8601date_string_from_NSDate_sharedInstancePred, &__block_literal_global_3);
    if (v2) {
      goto LABEL_3;
    }
  }
  id v3 = 0;
LABEL_6:

  return v3;
}

id formattedDateStringForTimeInterval(double a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)id v10 = 0;
  uint64_t v11 = 0;
  __int16 v13 = 0;
  uint64_t v12 = 0;
  time_t v7 = (uint64_t)a1;
  if ((uint64_t)a1 <= 0 && (time(&v7), v7 < 1))
  {
    uint64_t v5 = basicLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      time_t v9 = *(void *)&a1;
      BOOL v6 = "formattedDateStringForTimeInterval: Invalid timestamp of %.3lf (did the call to time() fail?)";
LABEL_12:
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, v6, buf, 0xCu);
    }
  }
  else
  {
    v2 = localtime(&v7);
    if (strftime(v10, 0x1AuLL, "%Y-%m-%d %H:%M:%S %z", v2))
    {
      id v3 = [NSString stringWithCString:v10 encoding:1];
      goto LABEL_5;
    }
    uint64_t v5 = basicLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      time_t v9 = v7;
      BOOL v6 = "formattedDateStringForTimeInterval: Failed strftime with '%ld'";
      goto LABEL_12;
    }
  }

  id v3 = 0;
LABEL_5:

  return v3;
}

id sanitizedJSONDictionary(void *a1, char a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a1;
  uint64_t v5 = [v3 dictionary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __sanitizedJSONDictionary_block_invoke;
  v8[3] = &unk_263FC36B0;
  id v6 = v5;
  id v9 = v6;
  char v10 = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __sanitizedJSONDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = sanitizedJSONDictionary(v6, *(unsigned __int8 *)(a1 + 40));
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      int v12 = *(unsigned __int8 *)(a1 + 40);
      if (isKindOfClass)
      {
        uint64_t v10 = sanitizedJSONArray(v6, v12 != 0);
      }
      else
      {
        __int16 v13 = basicLogHandle();
        uint64_t v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            int v19 = 138412802;
            id v20 = v18;
            __int16 v21 = 2112;
            id v22 = v5;
            __int16 v23 = 2112;
            id v24 = v6;
            _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible dictionary object of class %@ for key %@: %@", (uint8_t *)&v19, 0x20u);
          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint32_t v15 = (objc_class *)objc_opt_class();
          int v16 = NSStringFromClass(v15);
          int v19 = 138412802;
          id v20 = v5;
          __int16 v21 = 2112;
          id v22 = v16;
          __int16 v23 = 2112;
          id v24 = v6;
          _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "Detected JSON incompatible dictionary value (for key %@) of class %@: %@", (uint8_t *)&v19, 0x20u);
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v14 = &stru_26BDE2C70;
          goto LABEL_20;
        }
        uint64_t v10 = [v6 description];
      }
    }
    uint64_t v14 = v10;
LABEL_20:
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v5];
LABEL_21:

    goto LABEL_9;
  }
  time_t v7 = basicLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible dictionary key of class %@: %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_9:
}

id sanitizedJSONArray(void *a1, char a2)
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a1;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __sanitizedJSONArray_block_invoke;
  v8[3] = &unk_263FC36D8;
  id v6 = v5;
  id v9 = v6;
  char v10 = a2;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __sanitizedJSONArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) addObject:v3];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = sanitizedJSONDictionary(v3, *(unsigned __int8 *)(a1 + 40));
LABEL_15:
    char v8 = (void *)v4;
    [*(id *)(a1 + 32) addObject:v4];

    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = sanitizedJSONArray(v3, *(unsigned __int8 *)(a1 + 40) != 0);
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = symptomsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      time_t v7 = NSStringFromClass(v6);
      int v12 = 138412546;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Detected JSON incompatible array value of class %@: %@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v3 description];
      goto LABEL_15;
    }
  }
  else
  {
    id v9 = basicLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = 138412546;
      __int16 v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible array object of class %@: %@", (uint8_t *)&v12, 0x16u);
    }
  }
LABEL_5:
}

id sanitizedJSONCollectionObject(void *a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = sanitizedJSONDictionary(v3, a2);
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = sanitizedJSONArray(v3, a2);
    goto LABEL_5;
  }
  id v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    time_t v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "JSON Object Sanitizer: %@ is not a collections class! JSON requires the root object to be a dictionary or array. %@", (uint8_t *)&v10, 0x16u);
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

void sub_209DE0EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_209DE1790(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 184));
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209DE1A14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209DE25DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ABCPbSigConfigReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    time_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_25;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_25;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_25:
          int v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209DE705C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209DE90F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSummarySignatureRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x267603000uLL;
  unint64_t v8 = 0x267603000uLL;
  unint64_t v9 = 0x267603000uLL;
  unint64_t v10 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v7 + 936);
        goto LABEL_47;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v8 + 940);
        goto LABEL_47;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v9 + 944);
        goto LABEL_47;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 144;
        goto LABEL_47;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 88;
        goto LABEL_47;
      case 6u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 128;
        goto LABEL_47;
      case 7u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_47;
      case 8u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
        goto LABEL_47;
      case 9u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 80;
        goto LABEL_47;
      case 0xAu:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 164) |= 4u;
        while (2)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v10) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v18 = v24++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_65:
        *(_DWORD *)(a1 + 120) = v25;
        goto LABEL_48;
      case 0xBu:
        *(unsigned char *)(a1 + 164) |= 1u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v10) + v31);
          *(void *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v48 = 8;
        goto LABEL_74;
      case 0xCu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_47;
      case 0xDu:
        *(unsigned char *)(a1 + 164) |= 2u;
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v10) + v34);
          *(void *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v48 = 16;
LABEL_74:
        *(void *)(a1 + v48) = v32;
        goto LABEL_48;
      case 0xEu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 56;
        goto LABEL_47;
      case 0xFu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 64;
        goto LABEL_47;
      case 0x10u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 72;
        goto LABEL_47;
      case 0x11u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 96;
        goto LABEL_47;
      case 0x12u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 104;
LABEL_47:
        uint64_t v35 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_48;
      case 0x13u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v38 = 0;
        *(unsigned char *)(a1 + 164) |= 8u;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v10) + v40);
            *(void *)(a2 + v39) = v41;
            v38 |= (unint64_t)(v42 & 0x7F) << v36;
            if (v42 < 0)
            {
              v36 += 7;
              BOOL v18 = v37++ >= 9;
              if (v18)
              {
                uint64_t v38 = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v38 = 0;
        }
LABEL_69:
        *(unsigned char *)(a1 + 160) = v38 != 0;
        goto LABEL_48;
      case 0x1Eu:
        unint64_t v44 = v9;
        unint64_t v45 = v8;
        unint64_t v46 = v7;
        unsigned int v47 = objc_alloc_init(ABCPbSummaryAttachmentRequest);
        [(id)a1 addAttachments:v47];
        if PBReaderPlaceMark() && (ABCPbSummaryAttachmentRequestReadFrom((uint64_t)v47, a2))
        {
          PBReaderRecallMark();

          unint64_t v7 = v46;
          unint64_t v8 = v45;
          unint64_t v9 = v44;
LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

void sub_209DEC604(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209DED4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_209DF3C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_209DF68A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void _settingsChanged(uint64_t a1, void *a2, const __CFString *a3)
{
  id v4 = a2;
  CFComparisonResult v5 = CFStringCompare(a3, @"com.apple.autobugcapture.UserConsentYES", 0);
  if (v5 == kCFCompareEqualTo)
  {
    id v6 = configurationLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Auto Bug Capture is explicitly set to ON", buf, 2u);
    }
    unint64_t v7 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
    goto LABEL_9;
  }
  if (CFEqual(a3, @"com.apple.autobugcapture.UserConsentNO"))
  {
    id v6 = configurationLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Auto Bug Capture is explicitly set to OFF", v8, 2u);
    }
    unint64_t v7 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
LABEL_9:

    CFPreferencesSetValue(@"ABCUserConsent", *v7, @"com.apple.symptomsd-diag", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    CFPreferencesAppSynchronize(@"com.apple.symptomsd-diag");
    [v4 setAbcUIUserConsent:v5 == kCFCompareEqualTo];
    objc_msgSend(v4, "setABCUserConsent:", objc_msgSend(v4, "abcUIUserConsent"));
  }
}

void sub_209DF8300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_209DF83D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_209DF84CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DF85DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209DFCB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_209DFCFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209DFE3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_209DFEA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209DFFC14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_209E00978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E00F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E03BD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_209E06BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E08A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209E09374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigConfigWhitelistReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  CFComparisonResult v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_36;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_38;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_39;
      case 2u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 8;
        goto LABEL_29;
      case 3u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 16;
        goto LABEL_29;
      case 4u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 24;
LABEL_29:
        uint64_t v25 = *(void **)(a1 + v24);
        *(void *)(a1 + v24) = v23;

        goto LABEL_39;
      case 0xAu:
        uint64_t v27 = objc_alloc_init(ABCPbSigConfig);
        [(id)a1 addSigConfig:v27];
        if (PBReaderPlaceMark() && ABCPbSigConfigReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t ABCPbSummaryAttachmentRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  CFComparisonResult v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209E0E834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_209E0EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_209E10598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E107B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  CFComparisonResult v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_30;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 80;
          goto LABEL_30;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_30;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_30;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_30;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_30;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_30;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_30;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_30:
          unsigned int v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 0xAu:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 88) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_41;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_43:
      *(_DWORD *)(a1 + 48) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *diagnosticErrorStringForCode(unsigned int a1)
{
  if (a1 > 0x29) {
    return @"Unknown error code";
  }
  else {
    return off_263FC4CC0[a1];
  }
}

id responseDict(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
  char v13 = [NSNumber numberWithBool:a1];
  BOOL v14 = [NSNumber numberWithInteger:a2];
  int v15 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"success", v14, @"reason", 0);

  if ([v9 count]) {
    [v15 addEntriesFromDictionary:v9];
  }
  if ([v10 length]) {
    [v15 setObject:v10 forKeyedSubscript:@"session"];
  }
  if ([v11 length]) {
    [v15 setObject:v11 forKeyedSubscript:@"groupID"];
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = diagnosticErrorStringForCode(a2);
    [v15 setObject:v16 forKeyedSubscript:@"reasonStr"];
  }

  return v15;
}

void sub_209E16258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigGrantResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  CFComparisonResult v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 9)
      {
        if (v17 == 10)
        {
          unsigned int v20 = objc_alloc_init(ABCPbSigResponse);
          [(id)a1 addSigResponse:v20];
          if (!PBReaderPlaceMark() || (ABCPbSigResponseReadFrom((uint64_t)v20, a2) & 1) == 0)
          {
LABEL_45:

            return 0;
          }
        }
        else
        {
          if (v17 != 11)
          {
LABEL_37:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          unsigned int v20 = objc_alloc_init(ABCPbSigConfigWhitelist);
          objc_storeStrong((id *)(a1 + 16), v20);
          if (!PBReaderPlaceMark() || (ABCPbSigConfigWhitelistReadFrom((uint64_t)v20, a2) & 1) == 0) {
            goto LABEL_45;
          }
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (1)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v14 = v22++ >= 9;
          if (v14)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_42:
        *(_DWORD *)(a1 + 8) = v23;
      }
      else
      {
        if (v17 != 2) {
          goto LABEL_37;
        }
        uint64_t v18 = PBReaderReadString();
        char v19 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209E1B4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E1B6E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209E1C280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E1DCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E1E0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t __symptomsLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "symptoms");
  uint64_t v1 = symptomsLogHandle_symptomsHandle;
  symptomsLogHandle_symptomsHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id basicLogHandle()
{
  if (basicLogHandle_basicPred != -1) {
    dispatch_once(&basicLogHandle_basicPred, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)basicLogHandle_basicHandle;

  return v0;
}

uint64_t __basicLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "basic");
  uint64_t v1 = basicLogHandle_basicHandle;
  basicLogHandle_basicHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __adminLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "admin");
  uint64_t v1 = adminLogHandle_adminHandle;
  adminLogHandle_adminHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __xpcLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "xpc");
  uint64_t v1 = xpcLogHandle_xpcHandle;
  xpcLogHandle_xpcHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id diagextLogHandle()
{
  if (diagextLogHandle_diagextPred != -1) {
    dispatch_once(&diagextLogHandle_diagextPred, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)diagextLogHandle_diagextHandle;

  return v0;
}

uint64_t __diagextLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticExtensions");
  uint64_t v1 = diagextLogHandle_diagextHandle;
  diagextLogHandle_diagextHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id diagcollectLogHandle()
{
  if (diagcollectLogHandle_diagcollectPred != -1) {
    dispatch_once(&diagcollectLogHandle_diagcollectPred, &__block_literal_global_16);
  }
  os_log_t v0 = (void *)diagcollectLogHandle_diagcollectHandle;

  return v0;
}

uint64_t __diagcollectLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticCollection");
  uint64_t v1 = diagcollectLogHandle_diagcollectHandle;
  diagcollectLogHandle_diagcollectHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id diagreportLogHandle()
{
  if (diagreportLogHandle_diagreportPred != -1) {
    dispatch_once(&diagreportLogHandle_diagreportPred, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)diagreportLogHandle_diagreportHandle;

  return v0;
}

uint64_t __diagreportLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticReports");
  uint64_t v1 = diagreportLogHandle_diagreportHandle;
  diagreportLogHandle_diagreportHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id diagcaseLogHandle()
{
  if (diagcaseLogHandle_diagcasePred != -1) {
    dispatch_once(&diagcaseLogHandle_diagcasePred, &__block_literal_global_22);
  }
  os_log_t v0 = (void *)diagcaseLogHandle_diagcaseHandle;

  return v0;
}

uint64_t __diagcaseLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticCase");
  uint64_t v1 = diagcaseLogHandle_diagcaseHandle;
  diagcaseLogHandle_diagcaseHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id casemanagementLogHandle()
{
  if (casemanagementLogHandle_casemanagementPred != -1) {
    dispatch_once(&casemanagementLogHandle_casemanagementPred, &__block_literal_global_25);
  }
  os_log_t v0 = (void *)casemanagementLogHandle_casemanagementHandle;

  return v0;
}

uint64_t __casemanagementLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "caseManagement");
  uint64_t v1 = casemanagementLogHandle_casemanagementHandle;
  casemanagementLogHandle_casemanagementHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id archiverLogHandle()
{
  if (archiverLogHandle_archiverPred != -1) {
    dispatch_once(&archiverLogHandle_archiverPred, &__block_literal_global_28_0);
  }
  os_log_t v0 = (void *)archiverLogHandle_archiverHandle;

  return v0;
}

uint64_t __archiverLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "archiver");
  uint64_t v1 = archiverLogHandle_archiverHandle;
  archiverLogHandle_archiverHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id storageLogHandle()
{
  if (storageLogHandle_storagePred != -1) {
    dispatch_once(&storageLogHandle_storagePred, &__block_literal_global_31);
  }
  os_log_t v0 = (void *)storageLogHandle_storageHandle;

  return v0;
}

uint64_t __storageLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "storage");
  uint64_t v1 = storageLogHandle_storageHandle;
  storageLogHandle_storageHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __configurationLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "configuration");
  uint64_t v1 = configurationLogHandle_configurationHandle;
  configurationLogHandle_configurationHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id analyticsLogHandle()
{
  if (analyticsLogHandle_analyticsPred != -1) {
    dispatch_once(&analyticsLogHandle_analyticsPred, &__block_literal_global_37);
  }
  os_log_t v0 = (void *)analyticsLogHandle_analyticsHandle;

  return v0;
}

uint64_t __analyticsLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "analytics");
  uint64_t v1 = analyticsLogHandle_analyticsHandle;
  analyticsLogHandle_analyticsHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id uploadLogHandle()
{
  if (uploadLogHandle_uploadPred != -1) {
    dispatch_once(&uploadLogHandle_uploadPred, &__block_literal_global_40);
  }
  os_log_t v0 = (void *)uploadLogHandle_uploadHandle;

  return v0;
}

uint64_t __uploadLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "upload");
  uint64_t v1 = uploadLogHandle_uploadHandle;
  uploadLogHandle_uploadHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id summaryLogHandle()
{
  if (summaryLogHandle_summaryPred != -1) {
    dispatch_once(&summaryLogHandle_summaryPred, &__block_literal_global_43);
  }
  os_log_t v0 = (void *)summaryLogHandle_summaryHandle;

  return v0;
}

uint64_t __summaryLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "summary");
  uint64_t v1 = summaryLogHandle_summaryHandle;
  summaryLogHandle_summaryHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id liaisonLogHandle()
{
  if (liaisonLogHandle_liaisonPred != -1) {
    dispatch_once(&liaisonLogHandle_liaisonPred, &__block_literal_global_46);
  }
  os_log_t v0 = (void *)liaisonLogHandle_liaisonHandle;

  return v0;
}

uint64_t __liaisonLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "liaison");
  uint64_t v1 = liaisonLogHandle_liaisonHandle;
  liaisonLogHandle_liaisonHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id homekitLogHandle()
{
  if (homekitLogHandle_homekitPred != -1) {
    dispatch_once(&homekitLogHandle_homekitPred, &__block_literal_global_49);
  }
  os_log_t v0 = (void *)homekitLogHandle_homekitHandle;

  return v0;
}

uint64_t __homekitLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "homekit");
  uint64_t v1 = homekitLogHandle_homekitHandle;
  homekitLogHandle_homekitHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id crossdeviceLogHandle()
{
  if (crossdeviceLogHandle_crossdevicePred != -1) {
    dispatch_once(&crossdeviceLogHandle_crossdevicePred, &__block_literal_global_52);
  }
  os_log_t v0 = (void *)crossdeviceLogHandle_crossdeviceHandle;

  return v0;
}

uint64_t __crossdeviceLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "crossdevice");
  uint64_t v1 = crossdeviceLogHandle_crossdeviceHandle;
  crossdeviceLogHandle_crossdeviceHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id persistenceLogHandle()
{
  if (persistenceLogHandle_persistencePred != -1) {
    dispatch_once(&persistenceLogHandle_persistencePred, &__block_literal_global_55);
  }
  os_log_t v0 = (void *)persistenceLogHandle_persistenceHandle;

  return v0;
}

uint64_t __persistenceLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomsd-diag", "persistence");
  uint64_t v1 = persistenceLogHandle_persistenceHandle;
  persistenceLogHandle_persistenceHandle = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t AWDSymptomsDiagnosticRemoteUploadReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  CFComparisonResult v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = 0x267603000uLL;
    unint64_t v8 = 0x267603000uLL;
    unsigned int v9 = (int *)MEMORY[0x263F62268];
    unint64_t v10 = 0x267603000uLL;
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v11 = 0;
        unsigned int v12 = 0;
        unint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = *v3;
          unint64_t v15 = *(void *)(a2 + v14);
          if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
          *(void *)(a2 + v14) = v15 + 1;
          v13 |= (unint64_t)(v16 & 0x7F) << v11;
          if ((v16 & 0x80) == 0) {
            goto LABEL_12;
          }
          v11 += 7;
          BOOL v17 = v12++ >= 9;
          if (v17)
          {
            unint64_t v13 = 0;
            int v18 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v13 = 0;
        }
LABEL_14:
        int v19 = v13 & 7;
        if (!v18 && v19 != 4)
        {
          switch((v13 >> 3))
          {
            case 1u:
              char v21 = 0;
              unsigned int v22 = 0;
              uint64_t v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 8u;
              while (1)
              {
                uint64_t v24 = *v3;
                unint64_t v25 = *(void *)(a2 + v24);
                if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
                  break;
                }
                char v26 = *(unsigned char *)(*(void *)(a2 + *v9) + v25);
                *(void *)(a2 + v24) = v25 + 1;
                v23 |= (unint64_t)(v26 & 0x7F) << v21;
                if ((v26 & 0x80) == 0) {
                  goto LABEL_175;
                }
                v21 += 7;
                BOOL v17 = v22++ >= 9;
                if (v17)
                {
                  uint64_t v23 = 0;
                  goto LABEL_177;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_175:
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v23 = 0;
              }
LABEL_177:
              uint64_t v115 = *(int *)(v8 + 1744);
              goto LABEL_194;
            case 2u:
              char v27 = 0;
              unsigned int v28 = 0;
              uint64_t v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 2u;
              while (2)
              {
                uint64_t v29 = *v3;
                unint64_t v30 = *(void *)(a2 + v29);
                if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v31 = *(unsigned char *)(*(void *)(a2 + *v9) + v30);
                  *(void *)(a2 + v29) = v30 + 1;
                  v23 |= (unint64_t)(v31 & 0x7F) << v27;
                  if (v31 < 0)
                  {
                    v27 += 7;
                    BOOL v17 = v28++ >= 9;
                    if (v17)
                    {
                      uint64_t v23 = 0;
                      goto LABEL_181;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v23 = 0;
              }
LABEL_181:
              uint64_t v115 = *(int *)(v10 + 1748);
              goto LABEL_194;
            case 3u:
              char v32 = 0;
              unsigned int v33 = 0;
              uint64_t v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 4u;
              while (2)
              {
                uint64_t v34 = *v3;
                unint64_t v35 = *(void *)(a2 + v34);
                if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v36 = *(unsigned char *)(*(void *)(a2 + *v9) + v35);
                  *(void *)(a2 + v34) = v35 + 1;
                  v23 |= (unint64_t)(v36 & 0x7F) << v32;
                  if (v36 < 0)
                  {
                    v32 += 7;
                    BOOL v17 = v33++ >= 9;
                    if (v17)
                    {
                      uint64_t v23 = 0;
                      goto LABEL_185;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v23 = 0;
              }
LABEL_185:
              uint64_t v115 = 168;
              goto LABEL_194;
            case 4u:
              uint64_t v37 = PBReaderReadString();
              uint64_t v38 = (void *)a1[23];
              a1[23] = v37;

              goto LABEL_262;
            case 5u:
              char v39 = 0;
              unsigned int v40 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x80u;
              while (2)
              {
                uint64_t v42 = *v3;
                unint64_t v43 = *(void *)(a2 + v42);
                if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v44 = *(unsigned char *)(*(void *)(a2 + *v9) + v43);
                  *(void *)(a2 + v42) = v43 + 1;
                  v41 |= (unint64_t)(v44 & 0x7F) << v39;
                  if (v44 < 0)
                  {
                    v39 += 7;
                    BOOL v17 = v40++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_189;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_189:
              uint64_t v116 = 204;
              goto LABEL_215;
            case 6u:
              char v45 = 0;
              unsigned int v46 = 0;
              uint64_t v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 1u;
              while (2)
              {
                uint64_t v47 = *v3;
                unint64_t v48 = *(void *)(a2 + v47);
                if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
                  *(void *)(a2 + v47) = v48 + 1;
                  v23 |= (unint64_t)(v49 & 0x7F) << v45;
                  if (v49 < 0)
                  {
                    v45 += 7;
                    BOOL v17 = v46++ >= 9;
                    if (v17)
                    {
                      uint64_t v23 = 0;
                      goto LABEL_193;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v23 = 0;
              }
LABEL_193:
              uint64_t v115 = 152;
LABEL_194:
              *(void *)((char *)a1 + v115) = v23;
              goto LABEL_262;
            case 7u:
              char v50 = 0;
              unsigned int v51 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x200u;
              while (2)
              {
                uint64_t v52 = *v3;
                unint64_t v53 = *(void *)(a2 + v52);
                if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v54 = *(unsigned char *)(*(void *)(a2 + *v9) + v53);
                  *(void *)(a2 + v52) = v53 + 1;
                  v41 |= (unint64_t)(v54 & 0x7F) << v50;
                  if (v54 < 0)
                  {
                    v50 += 7;
                    BOOL v17 = v51++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_198;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_198:
              uint64_t v116 = 224;
              goto LABEL_215;
            case 8u:
              char v55 = 0;
              unsigned int v56 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x40u;
              while (2)
              {
                uint64_t v57 = *v3;
                unint64_t v58 = *(void *)(a2 + v57);
                if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v59 = *(unsigned char *)(*(void *)(a2 + *v9) + v58);
                  *(void *)(a2 + v57) = v58 + 1;
                  v41 |= (unint64_t)(v59 & 0x7F) << v55;
                  if (v59 < 0)
                  {
                    v55 += 7;
                    BOOL v17 = v56++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_202;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_202:
              uint64_t v116 = 200;
              goto LABEL_215;
            case 9u:
              char v60 = 0;
              unsigned int v61 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x10u;
              while (2)
              {
                uint64_t v62 = *v3;
                unint64_t v63 = *(void *)(a2 + v62);
                if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v64 = *(unsigned char *)(*(void *)(a2 + *v9) + v63);
                  *(void *)(a2 + v62) = v63 + 1;
                  v41 |= (unint64_t)(v64 & 0x7F) << v60;
                  if (v64 < 0)
                  {
                    v60 += 7;
                    BOOL v17 = v61++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_206;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_206:
              uint64_t v116 = 192;
              goto LABEL_215;
            case 0xAu:
              char v65 = 0;
              unsigned int v66 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x100u;
              while (2)
              {
                uint64_t v67 = *v3;
                unint64_t v68 = *(void *)(a2 + v67);
                if (v68 == -1 || v68 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v69 = *(unsigned char *)(*(void *)(a2 + *v9) + v68);
                  *(void *)(a2 + v67) = v68 + 1;
                  v41 |= (unint64_t)(v69 & 0x7F) << v65;
                  if (v69 < 0)
                  {
                    v65 += 7;
                    BOOL v17 = v66++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_210;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_210:
              uint64_t v116 = 208;
              goto LABEL_215;
            case 0xBu:
              char v70 = 0;
              unsigned int v71 = 0;
              uint64_t v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 1740)) |= 0x20u;
              while (2)
              {
                uint64_t v72 = *v3;
                unint64_t v73 = *(void *)(a2 + v72);
                if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v74 = *(unsigned char *)(*(void *)(a2 + *v9) + v73);
                  *(void *)(a2 + v72) = v73 + 1;
                  v41 |= (unint64_t)(v74 & 0x7F) << v70;
                  if (v74 < 0)
                  {
                    v70 += 7;
                    BOOL v17 = v71++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_214;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v41) = 0;
              }
LABEL_214:
              uint64_t v116 = 196;
LABEL_215:
              *(_DWORD *)((char *)a1 + v116) = v41;
              goto LABEL_262;
            case 0xCu:
              if (v19 != 2)
              {
                char v117 = 0;
                unsigned int v118 = 0;
                uint64_t v119 = 0;
                while (1)
                {
                  uint64_t v120 = *v3;
                  unint64_t v121 = *(void *)(a2 + v120);
                  if (v121 == -1 || v121 >= *(void *)(a2 + *v4)) {
                    goto LABEL_251;
                  }
                  char v122 = *(unsigned char *)(*(void *)(a2 + *v9) + v121);
                  *(void *)(a2 + v120) = v121 + 1;
                  v119 |= (unint64_t)(v122 & 0x7F) << v117;
                  if (v122 < 0)
                  {
                    v117 += 7;
                    BOOL v17 = v118++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_252;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v75 = 0;
                unsigned int v76 = 0;
                uint64_t v77 = 0;
                while (1)
                {
                  uint64_t v78 = *v3;
                  unint64_t v79 = *(void *)(a2 + v78);
                  if (v79 == -1 || v79 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v80 = *(unsigned char *)(*(void *)(a2 + *v9) + v79);
                  *(void *)(a2 + v78) = v79 + 1;
                  v77 |= (unint64_t)(v80 & 0x7F) << v75;
                  if (v80 < 0)
                  {
                    v75 += 7;
                    BOOL v17 = v76++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_104;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedInt64Add();
              }
              goto LABEL_173;
            case 0xDu:
              if (v19 != 2)
              {
                char v123 = 0;
                unsigned int v124 = 0;
                uint64_t v125 = 0;
                while (1)
                {
                  uint64_t v126 = *v3;
                  unint64_t v127 = *(void *)(a2 + v126);
                  if (v127 == -1 || v127 >= *(void *)(a2 + *v4)) {
                    goto LABEL_260;
                  }
                  char v128 = *(unsigned char *)(*(void *)(a2 + *v9) + v127);
                  *(void *)(a2 + v126) = v127 + 1;
                  v125 |= (unint64_t)(v128 & 0x7F) << v123;
                  if (v128 < 0)
                  {
                    v123 += 7;
                    BOOL v17 = v124++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_261;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v81 = 0;
                unsigned int v82 = 0;
                uint64_t v83 = 0;
                while (1)
                {
                  uint64_t v84 = *v3;
                  unint64_t v85 = *(void *)(a2 + v84);
                  if (v85 == -1 || v85 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v86 = *(unsigned char *)(*(void *)(a2 + *v9) + v85);
                  *(void *)(a2 + v84) = v85 + 1;
                  v83 |= (unint64_t)(v86 & 0x7F) << v81;
                  if (v86 < 0)
                  {
                    v81 += 7;
                    BOOL v17 = v82++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_117;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_117:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0xEu:
              if (v19 != 2)
              {
                char v129 = 0;
                unsigned int v130 = 0;
                uint64_t v131 = 0;
                while (1)
                {
                  uint64_t v132 = *v3;
                  unint64_t v133 = *(void *)(a2 + v132);
                  if (v133 == -1 || v133 >= *(void *)(a2 + *v4)) {
                    goto LABEL_260;
                  }
                  char v134 = *(unsigned char *)(*(void *)(a2 + *v9) + v133);
                  *(void *)(a2 + v132) = v133 + 1;
                  v131 |= (unint64_t)(v134 & 0x7F) << v129;
                  if (v134 < 0)
                  {
                    v129 += 7;
                    BOOL v17 = v130++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_261;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v87 = 0;
                unsigned int v88 = 0;
                uint64_t v89 = 0;
                while (1)
                {
                  uint64_t v90 = *v3;
                  unint64_t v91 = *(void *)(a2 + v90);
                  if (v91 == -1 || v91 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v92 = *(unsigned char *)(*(void *)(a2 + *v9) + v91);
                  *(void *)(a2 + v90) = v91 + 1;
                  v89 |= (unint64_t)(v92 & 0x7F) << v87;
                  if (v92 < 0)
                  {
                    v87 += 7;
                    BOOL v17 = v88++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_130;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_130:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0xFu:
              if (v19 != 2)
              {
                char v135 = 0;
                unsigned int v136 = 0;
                uint64_t v137 = 0;
                while (1)
                {
                  uint64_t v138 = *v3;
                  unint64_t v139 = *(void *)(a2 + v138);
                  if (v139 == -1 || v139 >= *(void *)(a2 + *v4)) {
                    goto LABEL_260;
                  }
                  char v140 = *(unsigned char *)(*(void *)(a2 + *v9) + v139);
                  *(void *)(a2 + v138) = v139 + 1;
                  v137 |= (unint64_t)(v140 & 0x7F) << v135;
                  if (v140 < 0)
                  {
                    v135 += 7;
                    BOOL v17 = v136++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_261;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v93 = 0;
                unsigned int v94 = 0;
                uint64_t v95 = 0;
                while (1)
                {
                  uint64_t v96 = *v3;
                  unint64_t v97 = *(void *)(a2 + v96);
                  if (v97 == -1 || v97 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v98 = *(unsigned char *)(*(void *)(a2 + *v9) + v97);
                  *(void *)(a2 + v96) = v97 + 1;
                  v95 |= (unint64_t)(v98 & 0x7F) << v93;
                  if (v98 < 0)
                  {
                    v93 += 7;
                    BOOL v17 = v94++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_143;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_143:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0x10u:
              unint64_t v99 = v7;
              unint64_t v100 = v10;
              unint64_t v101 = v8;
              v102 = PBReaderReadString();
              if (v102) {
                [a1 addTaskErrorDomain:v102];
              }

              unint64_t v8 = v101;
              unint64_t v10 = v100;
              unint64_t v7 = v99;
              goto LABEL_262;
            case 0x11u:
              if (v19 != 2)
              {
                char v141 = 0;
                unsigned int v142 = 0;
                uint64_t v143 = 0;
                while (1)
                {
                  uint64_t v144 = *v3;
                  unint64_t v145 = *(void *)(a2 + v144);
                  if (v145 == -1 || v145 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v146 = *(unsigned char *)(*(void *)(a2 + *v9) + v145);
                  *(void *)(a2 + v144) = v145 + 1;
                  v143 |= (unint64_t)(v146 & 0x7F) << v141;
                  if (v146 < 0)
                  {
                    v141 += 7;
                    BOOL v17 = v142++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_252;
                }
LABEL_251:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_252:
                PBRepeatedInt64Add();
                goto LABEL_262;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v103 = 0;
                unsigned int v104 = 0;
                uint64_t v105 = 0;
                while (1)
                {
                  uint64_t v106 = *v3;
                  unint64_t v107 = *(void *)(a2 + v106);
                  if (v107 == -1 || v107 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v108 = *(unsigned char *)(*(void *)(a2 + *v9) + v107);
                  *(void *)(a2 + v106) = v107 + 1;
                  v105 |= (unint64_t)(v108 & 0x7F) << v103;
                  if (v108 < 0)
                  {
                    v103 += 7;
                    BOOL v17 = v104++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_159;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_159:
                PBRepeatedInt64Add();
              }
              goto LABEL_173;
            case 0x12u:
              if (v19 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v109 = 0;
                  unsigned int v110 = 0;
                  uint64_t v111 = 0;
                  while (1)
                  {
                    uint64_t v112 = *v3;
                    unint64_t v113 = *(void *)(a2 + v112);
                    if (v113 == -1 || v113 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v114 = *(unsigned char *)(*(void *)(a2 + *v9) + v113);
                    *(void *)(a2 + v112) = v113 + 1;
                    v111 |= (unint64_t)(v114 & 0x7F) << v109;
                    if (v114 < 0)
                    {
                      v109 += 7;
                      BOOL v17 = v110++ >= 9;
                      if (!v17) {
                        continue;
                      }
                    }
                    goto LABEL_172;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_172:
                  PBRepeatedInt32Add();
                }
LABEL_173:
                PBReaderRecallMark();
              }
              else
              {
                char v147 = 0;
                unsigned int v148 = 0;
                uint64_t v149 = 0;
                while (1)
                {
                  uint64_t v150 = *v3;
                  unint64_t v151 = *(void *)(a2 + v150);
                  if (v151 == -1 || v151 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v152 = *(unsigned char *)(*(void *)(a2 + *v9) + v151);
                  *(void *)(a2 + v150) = v151 + 1;
                  v149 |= (unint64_t)(v152 & 0x7F) << v147;
                  if (v152 < 0)
                  {
                    v147 += 7;
                    BOOL v17 = v148++ >= 9;
                    if (!v17) {
                      continue;
                    }
                  }
                  goto LABEL_261;
                }
LABEL_260:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_261:
                PBRepeatedInt32Add();
              }
LABEL_262:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_262;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209E2B7B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_209E2C4F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209E2D3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E2F47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *netdiag_str_array_find(const char **a1, char *__s2)
{
  id v3 = *a1;
  if (v3)
  {
    CFComparisonResult v5 = a1 + 1;
    do
    {
      if (!*v3) {
        break;
      }
      if (!strcmp(v3, __s2)) {
        return __s2;
      }
      id v6 = *v5++;
      id v3 = v6;
    }
    while (v6);
  }
  return 0;
}

char **netdiag_get_logging_keys(uint64_t *a1)
{
  uint64_t v1 = gNetDiagLoggingKeysCount;
  if (!gNetDiagLoggingKeysCount)
  {
    uint64_t v2 = gNetDiagLoggingKeys[0];
    if (gNetDiagLoggingKeys[0])
    {
      uint64_t v3 = 0;
      while (*v2)
      {
        uint64_t v1 = v3 + 1;
        uint64_t v2 = gNetDiagLoggingKeys[++v3];
        if (!v2) {
          goto LABEL_9;
        }
      }
      uint64_t v1 = v3;
    }
    else
    {
      uint64_t v1 = 0;
    }
LABEL_9:
    gNetDiagLoggingKeysCount = v1;
  }
  if (a1) {
    *a1 = v1;
  }
  return gNetDiagLoggingKeys;
}

char **netdiag_get_task_keys(uint64_t *a1)
{
  uint64_t v1 = gNetDiagTaskKeysCount;
  if (!gNetDiagTaskKeysCount)
  {
    uint64_t v2 = gNetDiagTaskKeys[0];
    if (gNetDiagTaskKeys[0])
    {
      uint64_t v3 = 0;
      while (*v2)
      {
        uint64_t v1 = v3 + 1;
        uint64_t v2 = gNetDiagTaskKeys[++v3];
        if (!v2) {
          goto LABEL_9;
        }
      }
      uint64_t v1 = v3;
    }
    else
    {
      uint64_t v1 = 0;
    }
LABEL_9:
    gNetDiagTaskKeysCount = v1;
  }
  if (a1) {
    *a1 = v1;
  }
  return gNetDiagTaskKeys;
}

char **netdiag_get_option_keys(uint64_t *a1)
{
  uint64_t v1 = gNetDiagOptionKeysCount;
  if (!gNetDiagOptionKeysCount)
  {
    uint64_t v2 = gNetDiagOptionKeys[0];
    if (gNetDiagOptionKeys[0])
    {
      uint64_t v3 = 0;
      while (*v2)
      {
        uint64_t v1 = v3 + 1;
        uint64_t v2 = gNetDiagOptionKeys[++v3];
        if (!v2) {
          goto LABEL_9;
        }
      }
      uint64_t v1 = v3;
    }
    else
    {
      uint64_t v1 = 0;
    }
LABEL_9:
    gNetDiagOptionKeysCount = v1;
  }
  if (a1) {
    *a1 = v1;
  }
  return gNetDiagOptionKeys;
}

const char *netdiag_xpc_type_str(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF86F0];
  uint64_t v3 = &qword_263FC5338;
  uint64_t result = "<XPC_TYPE_UNKNOWN>";
  while (v2 != a1)
  {
    uint64_t v5 = *v3;
    v3 += 2;
    uint64_t v2 = v5;
    if (!v5) {
      return result;
    }
  }
  return (const char *)*(v3 - 1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t CacheDeleteEnumerateRemovedFiles()
{
  return MEMORY[0x270F13098]();
}

uint64_t CacheDeleteInitPurgeMarker()
{
  return MEMORY[0x270F130A0]();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x270F130B0]();
}

uint64_t CacheDeleteRegisterPurgeNotification()
{
  return MEMORY[0x270F130C8]();
}

uint64_t DRSubmitLogs()
{
  return MEMORY[0x270F26080]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x270F24B58]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x270F58680]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x270F58688]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x270F58690]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x270F58698]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x270F586A0]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x270F586A8]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x270F586B8]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x270F586C0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x270F586C8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x270F586D0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x270F586D8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x270F586E0]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x270F58760]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x270F58768]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x270F58770]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x270F58778]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x270F58780]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x270F58788]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x270F97D18]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_errno()
{
  return MEMORY[0x270F97E50]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x270F97FA0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x270F98070]();
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void endgrent(void)
{
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

gid_t getgid(void)
{
  return MEMORY[0x270ED9C10]();
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x270ED9C28](a1);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x270ED9D60](mhp, segname, sectname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDA080](path, namebuff, size, *(void *)&options);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x270EDAB28]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9AAB8](proto, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB218](path, name, *(void *)&options);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x270F794F8]();
}

uint64_t symptom_new()
{
  return MEMORY[0x270F79508]();
}

uint64_t symptom_send()
{
  return MEMORY[0x270F79520]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x270F79530]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x270F79538]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}