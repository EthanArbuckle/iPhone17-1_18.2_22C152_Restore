id __atxlog_handle_home_screen()
{
  void *v0;
  uint64_t vars8;

  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59_0);
  }
  v0 = (void *)__atxlog_handle_home_screen_log;

  return v0;
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  v0 = (void *)__atxlog_handle_app_library_log;

  return v0;
}

uint64_t ATXPBStackLocationForLocation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return dword_1A7A9DA70[a1 - 1];
  }
}

uint64_t ATXPBStackLayoutSizeForLayoutSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4) {
    return 1;
  }
  else {
    return (a1 + 1);
  }
}

uint64_t ATXPBStackKindForKind(uint64_t result)
{
  if ((unint64_t)(result - 1) < 7) {
    return result;
  }
  else {
    return 0;
  }
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)__atxlog_handle_blending_log;

  return v0;
}

id ATXSettingsActionsInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE0D078];
  v1 = (void *)MEMORY[0x1AD0D3C30]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_suggestedActionsWithRequest_completionHandler_ argumentIndex:0 ofReply:0];

  v3 = (void *)MEMORY[0x1AD0D3C30]();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_recentActionsWithRequest_completionHandler_ argumentIndex:0 ofReply:0];

  v5 = (void *)MEMORY[0x1AD0D3C30]();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_suggestedActionsWithRequest_completionHandler_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1AD0D3C30]();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_recentActionsWithRequest_completionHandler_ argumentIndex:0 ofReply:1];

  return v0;
}

id ATXAVFoundationRoutingSessionManager()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAVRoutingSessionManagerClass_softClass;
  uint64_t v7 = getAVRoutingSessionManagerClass_softClass;
  if (!getAVRoutingSessionManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVRoutingSessionManagerClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getAVRoutingSessionManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7917130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ATXAVFoundationOutputDevice()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAVOutputDeviceClass_softClass;
  uint64_t v7 = getAVOutputDeviceClass_softClass;
  if (!getAVOutputDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVOutputDeviceClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getAVOutputDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7917214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVRoutingSessionManagerClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVRoutingSessionManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAVRoutingSessionManagerClass_block_invoke_cold_1();
  }
  getAVRoutingSessionManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AVFoundationLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __AVFoundationLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5D04E48;
    uint64_t v2 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AVFoundationLibraryCore_frameworkLibrary) {
    AVFoundationLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAVOutputDeviceClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVOutputDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAVOutputDeviceClass_block_invoke_cold_1();
  }
  getAVOutputDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXPBActivitySuggestionFeedbackEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 44) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_66;
      case 2u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_54:
        uint64_t v42 = 24;
        goto LABEL_63;
      case 3u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 44) |= 8u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v24 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v15 = v30++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_58:
        uint64_t v42 = 40;
        goto LABEL_63;
      case 4u:
        v35 = objc_alloc_init(ATXPBActivity);
        objc_storeStrong((id *)(a1 + 16), v35);
        if PBReaderPlaceMark() && (ATXPBActivityReadFrom((uint64_t)v35, a2))
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_66:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        PBReaderReadData();
        v35 = (ATXPBActivity *)objc_claimAutoreleasedReturnValue();
        if (v35) {
          -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](a1, v35);
        }
        goto LABEL_43;
      case 6u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 44) |= 4u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v24 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v15 = v37++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_62:
        uint64_t v42 = 28;
LABEL_63:
        *(_DWORD *)(a1 + v42) = v24;
        goto LABEL_66;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_66;
    }
  }
}

uint64_t ATXPBDigestOnboardingAppSelectionLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          goto LABEL_21;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_21:
          unint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 52) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          uint64_t v54 = 8;
          goto LABEL_82;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_73:
          uint64_t v54 = 12;
          goto LABEL_82;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 52) |= 4u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_77:
          uint64_t v54 = 16;
          goto LABEL_82;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 52) |= 8u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_81:
          uint64_t v54 = 32;
LABEL_82:
          *(_DWORD *)(a1 + v54) = v22;
          continue;
        case 8u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          *(unsigned char *)(a1 + 52) |= 0x10u;
          while (2)
          {
            uint64_t v45 = *v3;
            unint64_t v46 = *(void *)(a2 + v45);
            if (v46 == -1 || v46 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v14 = v43++ >= 9;
                if (v14)
                {
                  uint64_t v44 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v44 = 0;
          }
LABEL_86:
          BOOL v55 = v44 != 0;
          uint64_t v56 = 48;
          goto LABEL_91;
        case 9u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          *(unsigned char *)(a1 + 52) |= 0x20u;
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
        uint64_t v51 = *v3;
        unint64_t v52 = *(void *)(a2 + v51);
        if (v52 == -1 || v52 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
        *(void *)(a2 + v51) = v52 + 1;
        v50 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0) {
          goto LABEL_88;
        }
        v48 += 7;
        BOOL v14 = v49++ >= 9;
        if (v14)
        {
          uint64_t v50 = 0;
          goto LABEL_90;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_88:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v50 = 0;
      }
LABEL_90:
      BOOL v55 = v50 != 0;
      uint64_t v56 = 49;
LABEL_91:
      *(unsigned char *)(a1 + v56) = v55;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ATXPBPredictableParametersReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        if (v17) {
          [a1 addParameterKeys:v17];
        }
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

void *allModes()
{
  return &unk_1EFDF48C0;
}

void *allModesForTraining()
{
  return &unk_1EFDF48D8;
}

void *allModesForModeSetupPrediction()
{
  return &unk_1EFDF48F0;
}

__CFString *ATXModeToString(unint64_t a1)
{
  if (a1 > 0xF) {
    return @"Unknown";
  }
  else {
    return off_1E5D05010[a1];
  }
}

uint64_t ATXStringToMode(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Default"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Home"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Working"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Exercising"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Driving"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Bedtime"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Gaming"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Reading"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"FirstDigest"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"LastDigest"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"OtherDigest"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"UnspecifiedDigest"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"Custom"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"DND"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"Mindfulness"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"ReduceInterruptions"])
  {
    uint64_t v2 = 15;
  }
  else
  {
    uint64_t v2 = 16;
  }

  return v2;
}

uint64_t ATXModeFromActivityType(unint64_t a1)
{
  if (a1 > 0x11) {
    return 0;
  }
  else {
    return qword_1A7A9D568[a1];
  }
}

uint64_t ATXActivityTypeFromMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE) {
    return 14;
  }
  else {
    return qword_1A7A9D5F8[a1 - 1];
  }
}

__CFString *ATXAppDirectoryCategoryToStringForITunesGenreID(uint64_t a1)
{
  if ((unint64_t)(a1 - 6000) > 0x1B) {
    return @"Unknown";
  }
  else {
    return off_1E5D050F8[a1 - 6000];
  }
}

id ATXAppDirectoryInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDFC9A0];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_categoriesWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A79245B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A7925D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7926860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7926DD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t ATXMPBFeedbackUserInteractionsTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

__CFString *ATXDigestOnboardingEntrySourceToString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D054D8[(int)a1];
  }

  return v1;
}

__CFString *ATXDigestOnboardingOutcomeToString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D054F0[(int)a1];
  }

  return v1;
}

__CFString *ATXDigestOnboardingFinalUIShownToString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D05510[(int)a1];
  }

  return v1;
}

void sub_1A792A5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

id loadLazyOrRegularPlist(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1AD0D3C30]();
  id v15 = 0;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v1 options:1 error:&v15];
  id v4 = v15;
  if (!v3)
  {
    uint64_t v11 = __atxlog_handle_trial_assets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      loadLazyOrRegularPlist_cold_1();
    }
    char v8 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)[v3 length] >= 3
    && ((v5 = v3, uint64_t v6 = [v5 bytes], *(_WORD *)v6 == 19536)
      ? (BOOL v7 = *(unsigned char *)(v6 + 2) == 80)
      : (BOOL v7 = 0),
        v7))
  {
    id v14 = v4;
    char v8 = [MEMORY[0x1E4F93B50] dictionaryWithData:v5 error:&v14];
    unsigned int v9 = v14;
  }
  else
  {
    char v13 = 0;
    char v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v13];
    unsigned int v9 = v13;
  }
  id v10 = v9;

  if (!v8)
  {
    uint64_t v11 = __atxlog_handle_trial_assets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      loadLazyOrRegularPlist_cold_2();
    }
    id v4 = v10;
LABEL_15:

    id v10 = v4;
  }

  return v8;
}

void sub_1A792AB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792AD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A792B9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1A792BB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792BD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792BEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXUnarchiverZip(NSURL *a1, NSURL *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  id v5 = v4;
  uint64_t v6 = 0;
  if (!v3 || !v4) {
    goto LABEL_14;
  }
  if (![(NSURL *)v3 isFileURL])
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
    goto LABEL_12;
  }
  BOOL v7 = v3;
  int v8 = open([(NSURL *)v7 fileSystemRepresentation], 4);
  if (v8 < 0)
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
LABEL_12:
    uint64_t v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  int v9 = v8;
  uint64_t v6 = ATXUnarchiverZip(v8, v5);
  if (close(v9))
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      ATXUnarchiverZip((uint64_t)v7, v9, v10);
    }
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

uint64_t ATXUnarchiverZip(int a1, NSURL *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 < 0 || !v3) {
    goto LABEL_17;
  }
  uint64_t Archive = PPCreateReadArchive();
  if (!Archive)
  {
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = Archive;
  NSPageSize();
  if (archive_read_open_fd())
  {
    int v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = PPZipUnarchive(v7, v4);
    if (!archive_read_close()) {
      goto LABEL_13;
    }
    int v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
  }

LABEL_13:
  if (archive_read_free())
  {
    int v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      ATXUnarchiverZip();
    }
  }
LABEL_17:

  return v5;
}

uint64_t ATXUnarchiverZip(NSData *a1, NSURL *a2)
{
  if (!a1 || !a2) {
    return 0;
  }
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = [(NSData *)v5 bytes];
  unint64_t v7 = [(NSData *)v5 length];

  uint64_t v8 = ATXUnarchiverZip(v6, v7, v4);
  return v8;
}

uint64_t ATXUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (!a1 || !v4) {
    goto LABEL_17;
  }
  uint64_t Archive = PPCreateReadArchive();
  if (!Archive)
  {
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = Archive;
  if (archive_read_open_memory())
  {
    int v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = PPZipUnarchive(v8, v5);
    if (!archive_read_close()) {
      goto LABEL_13;
    }
    int v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ATXUnarchiverZip();
    }
  }

LABEL_13:
  if (archive_read_free())
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      ATXUnarchiverZip();
    }
  }
LABEL_17:

  return v6;
}

uint64_t PPCreateReadArchive()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = archive_read_new();
  if (!v0) {
    return v0;
  }
  if (archive_read_support_format_zip())
  {
    id v1 = __atxlog_handle_default();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446210;
      uint64_t v8 = archive_error_string();
      _os_log_impl(&dword_1A790D000, v1, OS_LOG_TYPE_DEFAULT, "ATXUnarchiver: archive_read unable to set supported formats - %{public}s.", (uint8_t *)&v7, 0xCu);
    }

LABEL_6:
    if (archive_read_free())
    {
      uint64_t v2 = __atxlog_handle_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        PPCreateReadArchive_cold_1();
      }
    }
    return 0;
  }
  int support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20)
  {
    int v5 = support_filter_all;
    if (support_filter_all)
    {
      uint64_t v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        PPCreateReadArchive_cold_2();
      }

      if (v5) {
        goto LABEL_6;
      }
    }
  }
  return v0;
}

uint64_t PPZipUnarchive(uint64_t a1, void *a2)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v50 = *MEMORY[0x1E4F28330];
  v51[0] = &unk_1EFDF4050;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  v46[0] = 0;
  char v5 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:0 attributes:v4 error:v46];
  uint64_t v6 = v46[0];

  if ((v5 & 1) == 0)
  {
    int v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 516) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PPZipUnarchive_cold_12();
    }

    goto LABEL_18;
  }
LABEL_4:

  if (!archive_write_disk_new()) {
    goto LABEL_20;
  }
  if (archive_write_disk_set_standard_lookup())
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      PPZipUnarchive_cold_11();
    }
  }
  else
  {
    if (!archive_write_disk_set_options())
    {
      char v13 = [v2 path];
      if (v13)
      {
        uint64_t v6 = v13;
        id v15 = realpath_DARWIN_EXTSN((const char *)[v6 fileSystemRepresentation], 0);
        if (v15)
        {
          int v16 = v15;
          uint64_t v17 = [[NSString alloc] initWithUTF8String:v15];

          free(v16);
          uint64_t v6 = v17;
        }
        else
        {
          unsigned int v18 = __atxlog_handle_default();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            PPZipUnarchive_cold_8();
          }
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
      *(void *)&long long v14 = 134218240;
      long long v45 = v14;
      while (1)
      {
        int next_header = archive_read_next_header();
        if (next_header) {
          break;
        }
        int v20 = archive_entry_filetype();
        unint64_t v21 = (void *)MEMORY[0x1AD0D3C30]();
        uint64_t v22 = archive_entry_pathname_utf8();
        if (!v22)
        {
          uint64_t v38 = __atxlog_handle_default();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            PPZipUnarchive_cold_4(v38);
          }

LABEL_74:
          goto LABEL_55;
        }
        uint64_t v23 = (const char *)v22;
        uint64_t v24 = 0;
        do
          int v25 = *(unsigned __int8 *)(v22 + v24++);
        while (v25 == 47);
        uint64_t v26 = v24 - 1;
        if (v24 != 1)
        {
          unsigned int v27 = __atxlog_handle_default();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            size_t v33 = strlen(v23);
            *(_DWORD *)buf = v45;
            *(void *)&buf[4] = v26;
            __int16 v48 = 2048;
            size_t v49 = v33;
            _os_log_error_impl(&dword_1A790D000, v27, OS_LOG_TYPE_ERROR, "ATXUnarchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
          }
        }
        uint64_t v28 = (void *)[[NSString alloc] initWithUTF8String:&v23[v26]];
        uint64_t v29 = [v28 length];
        if (!v29 && v20 != 0x4000)
        {
          unint64_t v39 = __atxlog_handle_default();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            PPZipUnarchive_cold_7(v39);
          }

          goto LABEL_74;
        }
        char v30 = -[NSObject stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v28, v45, 0);

        id v31 = v30;
        [v31 fileSystemRepresentation];
        archive_entry_update_pathname_utf8();

        archive_entry_perm();
        archive_entry_set_perm();
        if (v29)
        {
          if (archive_write_header())
          {
            char v42 = __atxlog_handle_default();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v40;
              char v41 = "ATXUnarchiver: archive_write_header failed - %{public}s.";
              goto LABEL_79;
            }
LABEL_80:

            goto LABEL_55;
          }
          if (!archive_entry_size_is_set() || archive_entry_size() >= 1)
          {
            while (1)
            {
              v46[2] = 0;
              *(void *)buf = 0;
              v46[1] = 0;
              int data_block = archive_read_data_block();
              if (data_block) {
                break;
              }
              if (archive_write_data_block() < 0)
              {
                unint64_t v34 = __atxlog_handle_default();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                  PPZipUnarchive_cold_6();
                }
                goto LABEL_54;
              }
            }
            if (data_block == 1) {
              goto LABEL_48;
            }
            unint64_t v34 = __atxlog_handle_default();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              PPZipUnarchive_cold_5();
            }
LABEL_54:

LABEL_55:
            uint64_t v11 = 0;
            goto LABEL_56;
          }
LABEL_48:
          if (archive_write_finish_entry())
          {
            char v42 = __atxlog_handle_default();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v44 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v44;
              char v41 = "ATXUnarchiver: archive_write_finish_entry failed - %{public}s.";
LABEL_79:
              _os_log_impl(&dword_1A790D000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
            }
            goto LABEL_80;
          }
        }
      }
      if (next_header != 1)
      {
        unint64_t v34 = __atxlog_handle_default();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          PPZipUnarchive_cold_3();
        }
        goto LABEL_54;
      }
      uint64_t v11 = 1;
LABEL_56:
      if (archive_write_close())
      {
        char v36 = __atxlog_handle_default();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          PPZipUnarchive_cold_2();
        }

        uint64_t v11 = 0;
      }
      if (archive_write_free())
      {
        unsigned int v37 = __atxlog_handle_default();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          PPZipUnarchive_cold_1();
        }
      }
      goto LABEL_19;
    }
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      PPZipUnarchive_cold_10();
    }
  }

  if (!archive_write_free())
  {
LABEL_20:
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    PPZipUnarchive_cold_1();
  }
LABEL_18:
  uint64_t v11 = 0;
LABEL_19:

LABEL_21:
  return v11;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A792D9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792DC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792E01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A792ED90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 32);
}

id ATXLockScreenNotificationRankerXPCInterface()
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDFB1F0];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_rankNotificationArrays_reply_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_rankNotificationArrays_reply_ argumentIndex:0 ofReply:1];

  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply_ argumentIndex:0 ofReply:0];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  unint64_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_1A79304F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t ATXPBNotificationSuggestionInteractionEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  char v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_40;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_42;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_42:
          uint64_t v37 = 20;
          goto LABEL_47;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          break;
        case 3u:
          uint64_t v32 = PBReaderReadString();
          size_t v33 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v32;

          continue;
        case 4u:
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          *(void *)(a1 + 8) = v36;
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
        uint64_t v28 = *v3;
        uint64_t v29 = *(void *)(a2 + v28);
        unint64_t v30 = v29 + 1;
        if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v30;
        v20 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_44;
        }
        v26 += 7;
        BOOL v15 = v27++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_46:
      uint64_t v37 = 16;
LABEL_47:
      *(_DWORD *)(a1 + v37) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ATXPBTurnOffNotificationsForAppSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  char v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

id actionsToIndexSet(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  char v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(v4, "indexOfObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  unint64_t v12 = (void *)[v5 copy];

  return v12;
}

void sub_1A7934240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7934594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringForATXWidgetEngagementType(unint64_t a1)
{
  int v1 = a1;
  if (a1 < 4) {
    return off_1E5D05A48[a1];
  }
  id v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    NSStringForATXWidgetEngagementType_cold_1(v1, v3);
  }

  return @"unknown";
}

uint64_t ATXMPBFeedbackRecordedTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  char v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

BOOL ATXPBLinkActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  char v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A793887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t ATXActivityTypeToDNDModeSemanticType()
{
  return MEMORY[0x1F4145F28]();
}

id OUTLINED_FUNCTION_0_7(id a1)
{
  return a1;
}

uint64_t ATXActionPredictionInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDF9288];
}

id ATXUserEducationSuggestionClientXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE24070];
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_didReceiveUserEducationSuggestionEvent_ argumentIndex:0 ofReply:0];

  return v0;
}

id ATXUserEducationSuggestionServerXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE35BD0];
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_logUserEducationSuggestionFeedback_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

uint64_t ATXPBERMEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  char v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 60) |= 4u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v48 = 24;
          goto LABEL_69;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 60) |= 8u;
          while (2)
          {
            uint64_t v25 = *v3;
            uint64_t v26 = *(void *)(a2 + v25);
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
              *(void *)(a2 + v25) = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v15 = v23++ >= 9;
                if (v15)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v24) = 0;
          }
LABEL_55:
          uint64_t v47 = 40;
          goto LABEL_64;
        case 3u:
          *(unsigned char *)(a1 + 60) |= 1u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v48 = 8;
LABEL_69:
          *(void *)(a1 + v48) = v20;
          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  uint64_t v33 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_59:
          *(void *)(a1 + 16) = v33;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 60) |= 0x10u;
          break;
        case 6u:
          uint64_t v44 = PBReaderReadData();
          long long v45 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v44;

          continue;
        case 7u:
          unint64_t v46 = PBReaderReadString();
          if (v46) {
            -[ATXPBERMEvent addClientModelId:](a1, v46);
          }

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
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v24 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_61;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_63;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_63:
      uint64_t v47 = 56;
LABEL_64:
      *(_DWORD *)(a1 + v47) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A7943768(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
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

void sub_1A7943AA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A7944700(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7945D5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *plistableReplacementFor(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA98] null];

  if (v2 == v1)
  {
    id v4 = &stru_1EFD9E7E8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [v1 UUIDString];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = [v1 absoluteString];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = 0u;
          long long v15 = 0u;
          long long v12 = 0u;
          long long v13 = 0u;
          id v5 = v1;
          uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = 0;
            uint64_t v9 = *(void *)v13;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v13 != v9) {
                  objc_enumerationMutation(v5);
                }
                v8 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hash", (void)v12);
              }
              uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
            }
            while (v7);
          }
          else
          {
            uint64_t v8 = 0;
          }

          id v3 = [NSNumber numberWithUnsignedInteger:v8];
        }
        else
        {
          id v3 = (__CFString *)v1;
        }
      }
    }
    id v4 = v3;
  }

  return v4;
}

void reportInvalidActionTypeAndCrash(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void reportInvalidActionTypeAndCrash(ATXActionType)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXAction.m", 910, @"Invalid action type for action found: %lu (max: %lu)", a1, 6);

  __break(1u);
}

void sub_1A79482F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _decodeOrFail(void *a1, uint64_t a2, void *a3, int a4, unsigned char *a5)
{
  id v9 = a3;
  id v18 = 0;
  uint64_t v10 = [a1 decodeTopLevelObjectOfClass:a2 forKey:v9 error:&v18];
  unint64_t v11 = (unint64_t)v18;
  long long v12 = (void *)v11;
  if (v10 || !v11)
  {
    if (v10 | v11)
    {
      id v15 = (id)v10;
      goto LABEL_17;
    }
    if (a4)
    {
      int v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        _decodeOrFail_cold_2();
      }
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  if (a4) {
    goto LABEL_14;
  }
  long long v13 = [(id)v11 domain];
  if (([v13 isEqual:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v14 = [v12 code];

  if (v14 == 4865)
  {
LABEL_12:
    id v15 = 0;
    goto LABEL_17;
  }
LABEL_14:
  int v16 = __atxlog_handle_default();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    _decodeOrFail_cold_1();
  }
LABEL_16:

  id v15 = 0;
  *a5 = 1;
LABEL_17:

  return v15;
}

uint64_t __sortArrayOfData_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 length];
  if (v8 >= [v7 length])
  {
    unint64_t v10 = [v6 length];
    if (v10 <= [v7 length])
    {
      id v11 = v6;
      uint64_t v9 = memcmp((const void *)[v11 bytes], (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v11, "length"));
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void OUTLINED_FUNCTION_0_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id -[ATXDefaultHomeScreenItemOnboardingStacksProducer _blockedWidgetPersonalities](ATXDefaultHomeScreenItemOnboardingStacksProducer *self, SEL a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  if ((self->_adblDrainClassification & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v4 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:@"personalizedOnboardingDefaultStackADBLDenyListWidgets"];

    id v3 = (void *)v4;
  }
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: deny list personalities: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v7 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_94);
  unint64_t v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  unint64_t v10 = objc_opt_new();
  char v11 = [v10 isTodayWidgetPermittedForLocale:v9];

  if ((v11 & 1) == 0)
  {
    long long v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: in a region (%{public}@) that does not allow news widget, adding news to deny list", (uint8_t *)&v14, 0xCu);
    }

    [v8 addObject:@"com.apple.news.widget:today"];
    [v8 addObject:@"com.apple.news.widget:topic"];
  }

  return v8;
}

void __folderIndexesForPage_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = *(void **)(a1 + 32);
    [v7 addIndex:a3];
  }
}

void OUTLINED_FUNCTION_0_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
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

uint64_t ATXPBInfoEngineCachedSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        if (v24) {
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:](a1, v24);
        }
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
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
                goto LABEL_36;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_38;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_38:
            *(void *)(a1 + 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        if (v24) {
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:](a1, v24);
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A795440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id ATXSuggestedPagesInterface()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDFBD18];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_suggestedPagesWithFilter_layoutOptions_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  id v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_suggestedPagesWithFilter_layoutOptions_completionHandler_ argumentIndex:0 ofReply:0];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  unsigned int v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_suggestedPagesWithFilter_layoutOptions_completionHandler_ argumentIndex:1 ofReply:0];

  return v0;
}

id ATXHomeScreenSuggestionServerXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE0F020];
  id v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion_ argumentIndex:0 ofReply:0];

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  unsigned int v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler_ argumentIndex:1 ofReply:1];

  return v0;
}

id ATXHomeScreenSuggestionClientXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE35C90];
  id v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems_ argumentIndex:0 ofReply:0];

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems_ argumentIndex:2 ofReply:0];

  return v0;
}

uint64_t ATXPBHomeScreenEventMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(unsigned char *)(a1 + 76) |= 1u;
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
            goto LABEL_71;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_73;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_73:
        *(void *)(a1 + 8) = v19;
        goto LABEL_91;
      case 2u:
        PBReaderReadString();
        uint64_t v24 = (ATXPBHomeScreenWidgetIdentifiable *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          -[ATXPBHomeScreenEventMetadata addStackIds:](a1, v24);
        }
        goto LABEL_52;
      case 3u:
        uint64_t v24 = objc_alloc_init(ATXPBHomeScreenWidgetIdentifiable);
        -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](a1, v24);
        goto LABEL_32;
      case 4u:
        uint64_t v24 = objc_alloc_init(ATXPBHomeScreenWidgetIdentifiable);
        -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](a1, v24);
LABEL_32:
        if (!PBReaderPlaceMark()
          || (ATXPBHomeScreenWidgetIdentifiableReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_93;
        }
        goto LABEL_51;
      case 5u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 76) |= 8u;
        while (2)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v27 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_77:
        BOOL v51 = v27 != 0;
        uint64_t v52 = 73;
        goto LABEL_86;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 76) |= 0x10u;
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
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                uint64_t v33 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v33 = 0;
        }
LABEL_81:
        BOOL v51 = v33 != 0;
        uint64_t v52 = 74;
        goto LABEL_86;
      case 7u:
        uint64_t v24 = objc_alloc_init(ATXPBCGRectWrapper);
        objc_storeStrong((id *)(a1 + 48), v24);
        if (PBReaderPlaceMark() && ATXPBCGRectWrapperReadFrom((uint64_t)v24, a2))
        {
LABEL_51:
          PBReaderRecallMark();
LABEL_52:

LABEL_91:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_93:

        return 0;
      case 8u:
        uint64_t v37 = PBReaderReadString();
        char v38 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v37;

        goto LABEL_91;
      case 9u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 76) |= 4u;
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
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v14 = v40++ >= 9;
              if (v14)
              {
                uint64_t v41 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_85:
        BOOL v51 = v41 != 0;
        uint64_t v52 = 72;
LABEL_86:
        *(unsigned char *)(a1 + v52) = v51;
        goto LABEL_91;
      case 0xAu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(unsigned char *)(a1 + 76) |= 2u;
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
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v14 = v46++ >= 9;
              if (v14)
              {
                LODWORD(v47) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v47) = 0;
        }
LABEL_90:
        *(_DWORD *)(a1 + 40) = v47;
        goto LABEL_91;
      case 0xBu:
        PBReaderReadString();
        uint64_t v24 = (ATXPBHomeScreenWidgetIdentifiable *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          -[ATXPBHomeScreenEventMetadata addBundleIds:](a1, v24);
        }
        goto LABEL_52;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_91;
    }
  }
}

__CFString *NSStringForATXHomeScreenWidgetExplicitFeedback(unint64_t a1)
{
  int v1 = a1;
  if (a1 < 4) {
    return off_1E5D06668[a1];
  }
  uint64_t v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    NSStringForATXHomeScreenWidgetExplicitFeedback_cold_1(v1, v3);
  }

  return @"unknown";
}

__CFString *NSStringForATXHomeScreenStackChangeReason(unint64_t a1)
{
  int v1 = a1;
  if (a1 < 0xA) {
    return off_1E5D06688[a1];
  }
  uint64_t v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    NSStringForATXHomeScreenStackChangeReason_cold_1(v1, v3);
  }

  return @"unknown";
}

void sub_1A7958E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id allowedFeatureVectorClasses()
{
  uint64_t v0 = (void *)MEMORY[0x1AD0D3C30]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);

  return v5;
}

void sub_1A795A0A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A795A204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A795A2F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBModeConfigurationUIFlowLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 72) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          *(void *)(a1 + 8) = v20;
          continue;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          char v23 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v22;

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 72) |= 8u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_58:
          uint64_t v44 = 48;
          goto LABEL_67;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 72) |= 2u;
          while (2)
          {
            uint64_t v33 = *v3;
            uint64_t v34 = *(void *)(a2 + v33);
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v35;
              v26 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_62:
          uint64_t v44 = 40;
          goto LABEL_67;
        case 5u:
          uint64_t v37 = PBReaderReadString();
          if (v37) {
            [(id)a1 addPreviousEntityIdentifiers:v37];
          }
          goto LABEL_54;
        case 6u:
          uint64_t v37 = PBReaderReadString();
          if (v37) {
            [(id)a1 addSuggestedEntityIdentifiers:v37];
          }
          goto LABEL_54;
        case 7u:
          uint64_t v37 = PBReaderReadString();
          if (v37) {
            [(id)a1 addCurrentEntityIdentifiers:v37];
          }
          goto LABEL_54;
        case 8u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
          break;
        case 9u:
          uint64_t v37 = PBReaderReadString();
          if (v37) {
            [(id)a1 addCandidateEntityIdentifiers:v37];
          }
LABEL_54:

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
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v26 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_64;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_66;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_66:
      uint64_t v44 = 44;
LABEL_67:
      *(_DWORD *)(a1 + v44) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id dateToJson(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
    uint64_t v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v2 setTimeZone:v3];

    uint64_t v4 = [v2 stringFromDate:v1];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }

  return v4;
}

uint64_t getMGBool(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))getMGGetBoolAnswerSymbolLoc_ptr;
  char v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_1E5D04E28;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    id v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    getMGBool_cold_1();
  }
  return v2(a1);
}

void sub_1A7961C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v10 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __libMobileGestaltLibraryCore_block_invoke;
    v4[4] = &unk_1E5D068E8;
    uint64_t v5 = &v7;
    id v6 = v4;
    long long v11 = xmmword_1E5D068C8;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(v5[1] + 24);
    id v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "MGGetBoolAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A7962330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXPBDigestOnboardingSuggestionLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
      }
      else if (v18 == 2)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0) {
            goto LABEL_35;
          }
          v24 += 7;
          BOOL v15 = v25++ >= 9;
          if (v15)
          {
            LODWORD(v26) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 16) = v26;
      }
      else if (v18 == 1)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;
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

uint64_t ATXPBUserNotificationDigestLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 28) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
      }
      else if (v18 == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0) {
            goto LABEL_37;
          }
          v23 += 7;
          BOOL v15 = v24++ >= 9;
          if (v15)
          {
            LODWORD(v25) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 24) = v25;
      }
      else if (v18 == 1)
      {
        uint64_t v19 = objc_alloc_init(ATXPBUserNotificationDigest);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationDigestReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t ATXPBDigestOnboardingLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = *(void **)(a1 + 40);
          *(void *)(a1 + 40) = v18;

          continue;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 4u;
          while (2)
          {
            uint64_t v24 = *v3;
            uint64_t v25 = *(void *)(a2 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_59:
          uint64_t v51 = 28;
          goto LABEL_68;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          while (2)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v32;
              v23 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_63:
          uint64_t v51 = 24;
          goto LABEL_68;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 8u;
          while (2)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v38;
              v23 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v15 = v35++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_67:
          uint64_t v51 = 32;
LABEL_68:
          *(_DWORD *)(a1 + v51) = v23;
          continue;
        case 5u:
          *(unsigned char *)(a1 + 52) |= 1u;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v42 = *(void *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v42 = 0;
          }
          *(void *)(a1 + 8) = v42;
          continue;
        case 6u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)(a1 + 52) |= 0x10u;
          break;
        case 7u:
          char v50 = PBReaderReadString();
          if (v50) {
            [(id)a1 addDeliveryTimes:v50];
          }

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
        uint64_t v46 = *v3;
        uint64_t v47 = *(void *)(a2 + v46);
        unint64_t v48 = v47 + 1;
        if (v47 == -1 || v48 > *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
        *(void *)(a2 + v46) = v48;
        v45 |= (unint64_t)(v49 & 0x7F) << v43;
        if ((v49 & 0x80) == 0) {
          goto LABEL_70;
        }
        v43 += 7;
        BOOL v15 = v44++ >= 9;
        if (v15)
        {
          uint64_t v45 = 0;
          goto LABEL_72;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_70:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v45 = 0;
      }
LABEL_72:
      *(unsigned char *)(a1 + 48) = v45 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t ATXPBSpotlightEventMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v18 = 24;
          goto LABEL_38;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_42:
          *(unsigned char *)(a1 + 40) = v22 != 0;
          continue;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_38;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_38:
          unint64_t v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

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
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_44;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          uint64_t v28 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v28 = 0;
      }
LABEL_46:
      *(void *)(a1 + 8) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

float *OUTLINED_FUNCTION_1_6(float *result, uint64_t a2, void *a3, float a4)
{
  *uint64_t result = a4;
  *a3 = a2;
  return result;
}

uint64_t ATXPBFaceGalleryConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ATXPBFaceGallerySection);
        -[ATXPBFaceGalleryConfiguration addSections:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBFaceGallerySectionReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t ATXPBMissedNotificationRankingLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
      }
      else if (v18 == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0) {
            goto LABEL_37;
          }
          v23 += 7;
          BOOL v15 = v24++ >= 9;
          if (v15)
          {
            LODWORD(v25) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if (v18 == 1)
      {
        unsigned int v19 = objc_alloc_init(ATXPBMissedNotificationRanking);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || (ATXPBMissedNotificationRankingReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

id ATXSleepSuggestionInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDFD338];
  uint64_t v1 = (void *)MEMORY[0x1AD0D3C30]();
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_predictedSleepSuggestionWithCompletionHandler_ argumentIndex:0 ofReply:1];

  return v0;
}

BOOL ATXPBCGRectWrapperReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v21 = 0;
          }
          unint64_t v28 = &OBJC_IVAR___ATXPBCGRectWrapper__x;
          goto LABEL_41;
        case 2u:
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v21 = 0;
          }
          unint64_t v28 = &OBJC_IVAR___ATXPBCGRectWrapper__y;
          goto LABEL_41;
        case 3u:
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v21 = 0;
          }
          unint64_t v28 = &OBJC_IVAR___ATXPBCGRectWrapper__width;
          goto LABEL_41;
        case 4u:
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v21 = 0;
          }
          unint64_t v28 = &OBJC_IVAR___ATXPBCGRectWrapper__height;
LABEL_41:
          *(void *)(a1 + *v28) = v21;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ATXAppPredictionXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE35CF0];
  uint64_t v1 = (void *)MEMORY[0x1AD0D3C30]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = self;
  uint64_t v4 = self;
  uint64_t v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  [v0 setClasses:v5 forSelector:sel_approvedSiriKitIntentsWithReply_ argumentIndex:0 ofReply:1];

  id v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  char v8 = self;
  unsigned int v9 = self;
  unint64_t v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

  [v0 setClasses:v10 forSelector:sel_getWebsitePredictionsForContextType_limit_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1A7972D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7973A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7974054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void *__getAPUIRegisterCardServicesIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AppPredictionUILibrary();
  uint64_t result = dlsym(v2, "APUIRegisterCardServicesIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppPredictionUILibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AppPredictionUILibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __AppPredictionUILibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5D06C20;
    uint64_t v4 = 0;
    AppPredictionUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AppPredictionUILibraryCore_frameworkLibrary;
  if (!AppPredictionUILibraryCore_frameworkLibrary) {
    AppPredictionUILibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AppPredictionUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AppPredictionUILibrary();
  uint64_t result = dlsym(v2, "APUIRegisterCardKitProvidersIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCRSCardRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D06C38;
    uint64_t v5 = 0;
    CardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CardServicesLibraryCore_frameworkLibrary) {
    __getCRSCardRequestClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CRSCardRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCRSCardRequestClass_block_invoke_cold_2();
  }
  getCRSCardRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getATXProactiveSuggestionBuilderClass_block_invoke(uint64_t a1)
{
  AppPredictionInternalLibrary();
  Class result = objc_getClass("ATXProactiveSuggestionBuilder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getATXProactiveSuggestionBuilderClass_block_invoke_cold_1();
  }
  getATXProactiveSuggestionBuilderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AppPredictionInternalLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!AppPredictionInternalLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __AppPredictionInternalLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5D06C50;
    uint64_t v2 = 0;
    AppPredictionInternalLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionInternalLibraryCore_frameworkLibrary) {
    AppPredictionInternalLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __AppPredictionInternalLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionInternalLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *ATXUserEducationSuggestionTypeToString(unint64_t a1)
{
  if (a1 < 4) {
    return off_1E5D06C68[a1];
  }
  uint64_t v3 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    ATXUserEducationSuggestionTypeToString_cold_1(a1, v3);
  }

  return @"ATXUserEducationSuggestionType_Error";
}

__CFString *ATXTimeEventSourceTypeToDisplayName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x15) {
    return @"Calendar Events";
  }
  else {
    return off_1E5D06C88[a1 - 1];
  }
}

__CFString *ATXUserNotificationDigestDeliveryTimeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"firstDigest";
  }
  else {
    return off_1E5D06DC0[a1 - 1];
  }
}

uint64_t ATXStringToATXUserNotificationDigestDeliveryTime(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"firstDigest"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"lastDigest"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"otherDigest"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"unspecifiedDigest"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 4;
  }

  return v2;
}

uint64_t digestTimeToMode(unint64_t a1)
{
  if (a1 >= 4) {
    return 11;
  }
  else {
    return a1 + 8;
  }
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

void removeCacheFile(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28CB8];
  id v2 = a1;
  uint64_t v3 = [v1 defaultManager];
  id v8 = 0;
  char v4 = [v3 removeItemAtPath:v2 error:&v8];

  id v5 = v8;
  uint64_t v6 = v5;
  if (v4)
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 4)
  {
    uint64_t v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      removeCacheFile_cold_1();
    }
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t ATXPBUserNotificationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(_DWORD *)(a1 + 216) |= 0x20u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v127 = 48;
        goto LABEL_216;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 200;
        goto LABEL_94;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 176;
        goto LABEL_94;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 144;
        goto LABEL_94;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 64;
        goto LABEL_94;
      case 6u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(_DWORD *)(a1 + 216) |= 2u;
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
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v15 = v24++ >= 9;
              if (v15)
              {
                uint64_t v25 = 0;
                goto LABEL_154;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_154:
        uint64_t v123 = 16;
        goto LABEL_191;
      case 7u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 192;
        goto LABEL_94;
      case 8u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 72;
        goto LABEL_94;
      case 9u:
        unint64_t v30 = objc_alloc_init(ATXPBUserNotificationDerivedData);
        objc_storeStrong((id *)(a1 + 96), v30);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationDerivedDataReadFrom(v30, a2) & 1) == 0) {
          goto LABEL_219;
        }
        goto LABEL_73;
      case 0xAu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 168;
        goto LABEL_94;
      case 0xBu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 80;
        goto LABEL_94;
      case 0xCu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 128;
        goto LABEL_94;
      case 0xDu:
        PBReaderReadString();
        unint64_t v30 = (ATXPBUserNotificationDerivedData *)objc_claimAutoreleasedReturnValue();
        if (v30) {
          [(id)a1 addContactIDs:v30];
        }
        goto LABEL_79;
      case 0xEu:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(_DWORD *)(a1 + 216) |= 0x400u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if (v37 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                uint64_t v33 = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v33 = 0;
        }
LABEL_158:
        BOOL v124 = v33 != 0;
        uint64_t v125 = 208;
        goto LABEL_209;
      case 0xFu:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 216) |= 0x200u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v40 |= (unint64_t)(v44 & 0x7F) << v38;
            if (v44 < 0)
            {
              v38 += 7;
              BOOL v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_162:
        uint64_t v126 = 184;
        goto LABEL_200;
      case 0x10u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(_DWORD *)(a1 + 216) |= 0x800u;
        while (2)
        {
          uint64_t v48 = *v3;
          uint64_t v49 = *(void *)(a2 + v48);
          unint64_t v50 = v49 + 1;
          if (v49 == -1 || v50 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v48) = v50;
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              BOOL v15 = v46++ >= 9;
              if (v15)
              {
                uint64_t v47 = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v47 = 0;
        }
LABEL_166:
        BOOL v124 = v47 != 0;
        uint64_t v125 = 209;
        goto LABEL_209;
      case 0x11u:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 216) |= 0x40u;
        while (2)
        {
          uint64_t v54 = *v3;
          uint64_t v55 = *(void *)(a2 + v54);
          unint64_t v56 = v55 + 1;
          if (v55 == -1 || v56 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
            *(void *)(a2 + v54) = v56;
            v40 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v52 += 7;
              BOOL v15 = v53++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_170:
        uint64_t v126 = 56;
        goto LABEL_200;
      case 0x12u:
        unint64_t v30 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 136), v30);
        if (PBReaderPlaceMark()
          && (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v30, a2) & 1) != 0)
        {
LABEL_73:
          PBReaderRecallMark();
LABEL_79:

LABEL_217:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_219:

        return 0;
      case 0x13u:
        *(_DWORD *)(a1 + 216) |= 1u;
        uint64_t v58 = *v3;
        unint64_t v59 = *(void *)(a2 + v58);
        if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v59);
          *(void *)(a2 + v58) = v59 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v127 = 8;
        goto LABEL_216;
      case 0x14u:
        PBReaderReadString();
        unint64_t v30 = (ATXPBUserNotificationDerivedData *)objc_claimAutoreleasedReturnValue();
        if (v30) {
          [(id)a1 addRawIdentifiers:v30];
        }
        goto LABEL_79;
      case 0x15u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 104;
        goto LABEL_94;
      case 0x16u:
        *(_DWORD *)(a1 + 216) |= 0x10u;
        uint64_t v60 = *v3;
        unint64_t v61 = *(void *)(a2 + v60);
        if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v61);
          *(void *)(a2 + v60) = v61 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v127 = 40;
LABEL_216:
        *(void *)(a1 + v127) = v20;
        goto LABEL_217;
      case 0x1Eu:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v65 = 0;
        *(_DWORD *)(a1 + 216) |= 0x10000u;
        while (2)
        {
          uint64_t v66 = *v3;
          uint64_t v67 = *(void *)(a2 + v66);
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v68;
            v65 |= (unint64_t)(v69 & 0x7F) << v63;
            if (v69 < 0)
            {
              v63 += 7;
              BOOL v15 = v64++ >= 9;
              if (v15)
              {
                uint64_t v65 = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v65 = 0;
        }
LABEL_174:
        BOOL v124 = v65 != 0;
        uint64_t v125 = 214;
        goto LABEL_209;
      case 0x1Fu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 152;
LABEL_94:
        v70 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_217;
      case 0x21u:
        char v71 = 0;
        unsigned int v72 = 0;
        uint64_t v73 = 0;
        *(_DWORD *)(a1 + 216) |= 0x2000u;
        while (2)
        {
          uint64_t v74 = *v3;
          uint64_t v75 = *(void *)(a2 + v74);
          unint64_t v76 = v75 + 1;
          if (v75 == -1 || v76 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v77 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
            *(void *)(a2 + v74) = v76;
            v73 |= (unint64_t)(v77 & 0x7F) << v71;
            if (v77 < 0)
            {
              v71 += 7;
              BOOL v15 = v72++ >= 9;
              if (v15)
              {
                uint64_t v73 = 0;
                goto LABEL_178;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v73 = 0;
        }
LABEL_178:
        BOOL v124 = v73 != 0;
        uint64_t v125 = 211;
        goto LABEL_209;
      case 0x22u:
        char v78 = 0;
        unsigned int v79 = 0;
        uint64_t v80 = 0;
        *(_DWORD *)(a1 + 216) |= 0x8000u;
        while (2)
        {
          uint64_t v81 = *v3;
          uint64_t v82 = *(void *)(a2 + v81);
          unint64_t v83 = v82 + 1;
          if (v82 == -1 || v83 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v84 = *(unsigned char *)(*(void *)(a2 + *v7) + v82);
            *(void *)(a2 + v81) = v83;
            v80 |= (unint64_t)(v84 & 0x7F) << v78;
            if (v84 < 0)
            {
              v78 += 7;
              BOOL v15 = v79++ >= 9;
              if (v15)
              {
                uint64_t v80 = 0;
                goto LABEL_182;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v80 = 0;
        }
LABEL_182:
        BOOL v124 = v80 != 0;
        uint64_t v125 = 213;
        goto LABEL_209;
      case 0x23u:
        char v85 = 0;
        unsigned int v86 = 0;
        uint64_t v25 = 0;
        *(_DWORD *)(a1 + 216) |= 8u;
        while (2)
        {
          uint64_t v87 = *v3;
          uint64_t v88 = *(void *)(a2 + v87);
          unint64_t v89 = v88 + 1;
          if (v88 == -1 || v89 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
            *(void *)(a2 + v87) = v89;
            v25 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              v85 += 7;
              BOOL v15 = v86++ >= 9;
              if (v15)
              {
                uint64_t v25 = 0;
                goto LABEL_186;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_186:
        uint64_t v123 = 32;
        goto LABEL_191;
      case 0x24u:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v25 = 0;
        *(_DWORD *)(a1 + 216) |= 4u;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v25 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              BOOL v15 = v92++ >= 9;
              if (v15)
              {
                uint64_t v25 = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_190:
        uint64_t v123 = 24;
LABEL_191:
        *(void *)(a1 + v123) = v25;
        goto LABEL_217;
      case 0x26u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 216) |= 0x80u;
        while (2)
        {
          uint64_t v99 = *v3;
          uint64_t v100 = *(void *)(a2 + v99);
          unint64_t v101 = v100 + 1;
          if (v100 == -1 || v101 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v102 = *(unsigned char *)(*(void *)(a2 + *v7) + v100);
            *(void *)(a2 + v99) = v101;
            v40 |= (unint64_t)(v102 & 0x7F) << v97;
            if (v102 < 0)
            {
              v97 += 7;
              BOOL v15 = v98++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_195;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_195:
        uint64_t v126 = 112;
        goto LABEL_200;
      case 0x27u:
        char v103 = 0;
        unsigned int v104 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 216) |= 0x100u;
        while (2)
        {
          uint64_t v105 = *v3;
          uint64_t v106 = *(void *)(a2 + v105);
          unint64_t v107 = v106 + 1;
          if (v106 == -1 || v107 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v108 = *(unsigned char *)(*(void *)(a2 + *v7) + v106);
            *(void *)(a2 + v105) = v107;
            v40 |= (unint64_t)(v108 & 0x7F) << v103;
            if (v108 < 0)
            {
              v103 += 7;
              BOOL v15 = v104++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_199;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_199:
        uint64_t v126 = 160;
LABEL_200:
        *(_DWORD *)(a1 + v126) = v40;
        goto LABEL_217;
      case 0x28u:
        char v109 = 0;
        unsigned int v110 = 0;
        uint64_t v111 = 0;
        *(_DWORD *)(a1 + 216) |= 0x4000u;
        while (2)
        {
          uint64_t v112 = *v3;
          uint64_t v113 = *(void *)(a2 + v112);
          unint64_t v114 = v113 + 1;
          if (v113 == -1 || v114 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v113);
            *(void *)(a2 + v112) = v114;
            v111 |= (unint64_t)(v115 & 0x7F) << v109;
            if (v115 < 0)
            {
              v109 += 7;
              BOOL v15 = v110++ >= 9;
              if (v15)
              {
                uint64_t v111 = 0;
                goto LABEL_204;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v111 = 0;
        }
LABEL_204:
        BOOL v124 = v111 != 0;
        uint64_t v125 = 212;
        goto LABEL_209;
      case 0x29u:
        char v116 = 0;
        unsigned int v117 = 0;
        uint64_t v118 = 0;
        *(_DWORD *)(a1 + 216) |= 0x1000u;
        while (2)
        {
          uint64_t v119 = *v3;
          uint64_t v120 = *(void *)(a2 + v119);
          unint64_t v121 = v120 + 1;
          if (v120 == -1 || v121 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v122 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
            *(void *)(a2 + v119) = v121;
            v118 |= (unint64_t)(v122 & 0x7F) << v116;
            if (v122 < 0)
            {
              v116 += 7;
              BOOL v15 = v117++ >= 9;
              if (v15)
              {
                uint64_t v118 = 0;
                goto LABEL_208;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v118 = 0;
        }
LABEL_208:
        BOOL v124 = v118 != 0;
        uint64_t v125 = 210;
LABEL_209:
        *(unsigned char *)(a1 + v125) = v124;
        goto LABEL_217;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_217;
    }
  }
}

uint64_t ATXMPBContextMenuFeedbackTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
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
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 48) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 8;
              goto LABEL_32;
            case 3u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 24;
              goto LABEL_32;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 16;
              goto LABEL_32;
            case 5u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 40;
LABEL_32:
              uint64_t v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_37:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
              goto LABEL_34;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_36:
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A79837EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_1A7984014(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7984398(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79846E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7984A64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7984DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7986B64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79873DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t ATXStackLayoutSizeToProto(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4) {
    return 1;
  }
  else {
    return (a1 + 1);
  }
}

uint64_t ATXStackLayoutSizeFromProto(int a1)
{
  uint64_t v1 = (a1 - 2);
  if (v1 < 4) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

void sub_1A79895A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A798965C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7989C3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7989EA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ATXPBDigestOnboardingLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1A798D8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id ATXUsageInsightsInterface()
{
  v33[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE11760];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_fetchAllDeliveredNotificationsWithCompletion_ argumentIndex:0 ofReply:1];

  char v4 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion_ argumentIndex:0 ofReply:1];

  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  unsigned int v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  unint64_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_fetchUsageInsightsInferredATXModeEventsWithCompletion_ argumentIndex:0 ofReply:1];

  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  BOOL v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_fetchAllInterruptingAppSessionsWithCompletion_ argumentIndex:0 ofReply:1];

  BOOL v16 = (void *)MEMORY[0x1E4F1CAD0];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  unsigned int v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_fetchAllPhubbingSessionsWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  unint64_t v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_fetchAllMindlessCyclingSessionsWithCompletion_ argumentIndex:0 ofReply:1];

  char v22 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v24 = [v22 setWithArray:v23];
  [v0 setClasses:v24 forSelector:sel_fetchAllContinuousUsageSessionsWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

BOOL ATXPBSendToDigestSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

__CFString *ATXDigestOnboardingSuggestionOutcomeToString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D07310[(int)a1];
  }

  return v1;
}

BOOL ATXPBDigestOnboardingSuggestionLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

__CFString *NSStringForATXAppDirectoryInteractionEvent(unint64_t a1)
{
  if (a1 > 9) {
    return @"unknown";
  }
  else {
    return off_1E5D073B8[a1];
  }
}

BOOL ATXIsSessionStartedByEvent(uint64_t a1)
{
  return a1 == 0;
}

uint64_t ATXIsSessionEndedByEvent(unint64_t a1)
{
  return (a1 < 9) & (0x178u >> a1);
}

uint64_t ATXDefaultWidgetSuggesterInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE35D50];
}

uint64_t ATXPBNotificationGroupEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 8) = v28;
      }
      else if (v18 == 2)
      {
        uint64_t v29 = PBReaderReadString();
        unint64_t v30 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v29;
      }
      else if (v18 == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 16) = v21;
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

void sub_1A7992E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1A79930A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A799329C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7993CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A79962E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7996B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

__CFString *ATXUserEducationSuggestionEventTypeToString(uint64_t a1)
{
  if (!a1) {
    return @"Show suggestion";
  }
  if (a1 == 1) {
    return @"Dismiss Suggestion";
  }
  uint64_t v3 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    ATXUserEducationSuggestionEventTypeToString_cold_1(a1, v3);
  }

  return @"Error";
}

void sub_1A799D2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A799E238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1A799F5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A799F898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A799F9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A799FBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79A3E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A79A4254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1A79AAECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id joinedDisplayNames(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "displayName", (void)v13);

        if (v9)
        {
          uint64_t v10 = [v8 displayName];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [v2 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v11 = [v2 componentsJoinedByString:@", "];

  return v11;
}

id stringWithGeohash(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 9uLL, "%x", a1);
  id v1 = [NSString stringWithUTF8String:__str];

  return v1;
}

id roundedDecimal(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x1E4F28C30];
    id v2 = a1;
    id v3 = [v1 decimalNumberHandlerWithRoundingMode:0 scale:0xFFFFFFFFLL raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    uint64_t v4 = [v2 decimalNumberByRoundingAccordingToBehavior:v3];

    uint64_t v5 = [v4 stringValue];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t ATXPBAppDirectoryEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 104) |= 8u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 32) = v20;
        goto LABEL_102;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 0x10u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_80:
        uint64_t v63 = 40;
        goto LABEL_101;
      case 3u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 2u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_84:
        uint64_t v63 = 16;
        goto LABEL_101;
      case 4u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 4u;
        while (2)
        {
          uint64_t v36 = *v3;
          uint64_t v37 = *(void *)(a2 + v36);
          unint64_t v38 = v37 + 1;
          if (v37 == -1 || v38 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v38;
            v23 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_88:
        uint64_t v63 = 24;
        goto LABEL_101;
      case 5u:
        uint64_t v40 = PBReaderReadString();
        uint64_t v41 = 72;
        goto LABEL_66;
      case 6u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 1u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v46;
            v23 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_92;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_92:
        uint64_t v63 = 8;
        goto LABEL_101;
      case 7u:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 0x20u;
        while (2)
        {
          uint64_t v50 = *v3;
          uint64_t v51 = *(void *)(a2 + v50);
          unint64_t v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v52;
            v23 |= (unint64_t)(v53 & 0x7F) << v48;
            if (v53 < 0)
            {
              v48 += 7;
              BOOL v15 = v49++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_96:
        uint64_t v63 = 48;
        goto LABEL_101;
      case 8u:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 104) |= 0x40u;
        while (2)
        {
          uint64_t v56 = *v3;
          uint64_t v57 = *(void *)(a2 + v56);
          unint64_t v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v58;
            v23 |= (unint64_t)(v59 & 0x7F) << v54;
            if (v59 < 0)
            {
              v54 += 7;
              BOOL v15 = v55++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_100:
        uint64_t v63 = 56;
LABEL_101:
        *(void *)(a1 + v63) = v23;
        goto LABEL_102;
      case 9u:
        uint64_t v40 = PBReaderReadString();
        uint64_t v41 = 64;
LABEL_66:
        uint64_t v60 = *(void **)(a1 + v41);
        *(void *)(a1 + v41) = v40;

        goto LABEL_102;
      case 0xBu:
        PBReaderReadString();
        v62 = (ATXPBAppDirectoryEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v62) {
          -[ATXPBAppDirectoryEvent addShownSuggestionIds:](a1, v62);
        }
        goto LABEL_76;
      case 0xCu:
        PBReaderReadString();
        v62 = (ATXPBAppDirectoryEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v62) {
          -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](a1, v62);
        }
        goto LABEL_76;
      case 0xDu:
        v62 = objc_alloc_init(ATXPBAppDirectoryEventMetadata);
        objc_storeStrong((id *)(a1 + 88), v62);
        if (PBReaderPlaceMark() && ATXPBAppDirectoryEventMetadataReadFrom((uint64_t)v62, a2))
        {
          PBReaderRecallMark();
LABEL_76:

LABEL_102:
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
        goto LABEL_102;
    }
  }
}

BOOL ATXPBModeConfigurationLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL ATXPBUserNotificationAppDigestReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        unint64_t v19 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        [a1 addAppMarqueeGroups:v19];
LABEL_24:
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        unint64_t v19 = (ATXPBUserNotificationDigestNotificationGroup *)a1[2];
        a1[2] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v19 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
    [a1 addNonAppMarqueeGroups:v19];
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBFaceGalleryEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = objc_alloc_init(ATXPBFaceGalleryItem);
        -[ATXPBFaceGalleryEvent addItems:](a1, v24);
        if (!PBReaderPlaceMark() || !ATXPBFaceGalleryItemReadFrom((uint64_t)v24, a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
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
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = objc_alloc_init(ATXPBFaceGalleryConfiguration);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ATXPBFaceGalleryConfigurationReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ATXMPBHomeScreenAppPanelLaunchRatioTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
            goto LABEL_41;
          }
        }
        uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
        goto LABEL_41;
      }
    }
    uint64_t v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A79B44D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A79B4880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A79B4B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79B4DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79B60D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A79B65A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t ATXPBUserNotificationDigestNotificationGroupReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_28;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 56;
        goto LABEL_28;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_28;
      case 4u:
        *(unsigned char *)(a1 + 64) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
        goto LABEL_37;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
LABEL_28:
        uint64_t v24 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_37;
      case 6u:
        char v25 = objc_alloc_init(ATXPBUserNotification);
        [(id)a1 addRankedNotifications:v25];
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationReadFrom((uint64_t)v25, a2) & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_34;
      case 7u:
        char v25 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_37:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_39:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_37;
    }
  }
}

uint64_t ATXPBActionCriteriaReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 36) |= 2u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v33 = 16;
          goto LABEL_43;
        case 2u:
          *(unsigned char *)(a1 + 36) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v33 = 8;
LABEL_43:
          *(void *)(a1 + v33) = v20;
          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        case 4u:
          uint64_t v31 = PBReaderReadData();
          unint64_t v32 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v31;

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
        uint64_t v27 = *v3;
        uint64_t v28 = *(void *)(a2 + v27);
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
        *(void *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0) {
          goto LABEL_36;
        }
        v24 += 7;
        BOOL v15 = v25++ >= 9;
        if (v15)
        {
          uint64_t v26 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v26 = 0;
      }
LABEL_38:
      *(unsigned char *)(a1 + 32) = v26 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBExecutableReferenceCacheReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(ATXPBExecutableReferenceKey);
        -[ATXPBExecutableReferenceCache addKeys:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBExecutableReferenceKeyReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

void sub_1A79C151C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

BOOL ATXPBUrgencyTuningSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t ATXPBUserNotificationDerivedDataReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(ATXPBUserNotificationModelScore);
        [a1 addScores:v17];
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationModelScoreReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

BOOL ATXPBHeuristicMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = 8;
LABEL_22:
        unint64_t v19 = *(void **)(a1 + v18);
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
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBMissedNotificationRankingReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 64) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_39;
      case 2u:
        uint64_t v22 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        [(id)a1 addRankedGroups:v22];
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v22, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 56;
        goto LABEL_30;
      case 4u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 40;
        goto LABEL_30;
      case 5u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 24;
LABEL_30:
        unsigned int v25 = *(void **)(a1 + v24);
        *(void *)(a1 + v24) = v23;

        goto LABEL_39;
      case 6u:
        uint64_t v22 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 48), v22);
        if (!PBReaderPlaceMark()
          || (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v22, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 7u:
        uint64_t v22 = objc_alloc_init(ATXPBDigestTimeline);
        objc_storeStrong((id *)(a1 + 16), v22);
        if (PBReaderPlaceMark() && ATXPBDigestTimelineReadFrom((uint64_t)v22, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

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

uint64_t ATXPBFaceGallerySectionReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 != 2)
      {
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_49;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        a1[24] |= 2u;
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
            goto LABEL_41;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_43:
        uint64_t v31 = 20;
        goto LABEL_48;
      }
      unint64_t v29 = objc_alloc_init(ATXPBFaceGalleryItem);
      [a1 addItems:v29];
      if (!PBReaderPlaceMark() || !ATXPBFaceGalleryItemReadFrom((uint64_t)v29, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v20 = 0;
    a1[24] |= 1u;
    while (1)
    {
      uint64_t v26 = *v3;
      unint64_t v27 = *(void *)(a2 + v26);
      if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
      *(void *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_45;
      }
      v24 += 7;
      BOOL v14 = v25++ >= 9;
      if (v14)
      {
        LODWORD(v20) = 0;
        goto LABEL_47;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
    if (*(unsigned char *)(a2 + *v5)) {
      LODWORD(v20) = 0;
    }
LABEL_47:
    uint64_t v31 = 16;
LABEL_48:
    *(_DWORD *)&a1[v31] = v20;
    goto LABEL_49;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ATXSportsInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE12128];
  id v1 = (void *)MEMORY[0x1AD0D3C30]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_requestedSchedulesForTeamsWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1A79C8E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79C8E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *ATXUserEducationSuggestionFeedbackTypeToString(unint64_t a1)
{
  if (a1 < 0xB) {
    return off_1E5D08248[a1];
  }
  uint64_t v3 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    ATXUserEducationSuggestionFeedbackTypeToString_cold_1(a1, v3);
  }

  return @"Error";
}

void sub_1A79CAF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79CB168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

__CFString *ATXModeConfigurationUIToString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5D08388[(int)a1];
  }

  return v1;
}

void sub_1A79CFF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

uint64_t ATXPBAVRouteInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_36:
        *(unsigned char *)(a1 + 24) = v22 != 0;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
        }
        uint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __ATXHomeScreenStackConfigFromATXWidgetStack_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [v2 chsWidget];
  uint64_t v5 = [v4 extensionIdentity];
  uint64_t v6 = [v5 extensionBundleIdentifier];
  [v3 setExtensionBundleId:v6];

  int v7 = [v2 chsWidget];
  char v8 = [v7 kind];
  [v3 setWidgetKind:v8];

  unsigned int v9 = [v2 chsWidget];

  unint64_t v10 = [v9 extensionIdentity];
  uint64_t v11 = [v10 containerBundleIdentifier];
  [v3 setAppBundleId:v11];

  return v3;
}

void sub_1A79D432C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

uint64_t __OSIntelligenceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OSIntelligenceLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A79D5CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBSendMessagesToDigestSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_1A79D94FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A79D99DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79D9A54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79D9ACC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXModeForDNDSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 0xA) {
    return 0;
  }
  else {
    return qword_1A7A9D9A8[a1 + 1];
  }
}

void sub_1A79DA920(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79DA99C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A79DAB2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXCacheAppendInteger(void *a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return [a1 appendBytes:&v3 length:8];
}

uint64_t ATXCacheAppendUnsignedInteger(void *a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return [a1 appendBytes:&v3 length:8];
}

uint64_t ATXCacheAppendBoolean(void *a1, char a2)
{
  char v3 = a2;
  return [a1 appendBytes:&v3 length:1];
}

void ATXCacheAppendString(void *a1, id a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = (const char *)[v3 UTF8String];
  size_t v6 = strlen(v5);
  size_t v7 = v6;
  [v4 appendBytes:&v7 length:8];
  [v4 appendBytes:v5 length:v6];
}

void ATXCacheAppendData(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 length];
  uint64_t v8 = v5;
  [v4 appendBytes:&v8 length:8];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];

  [v4 appendBytes:v7 length:v5];
}

uint64_t ATXCacheAppendFloats(void *a1, const char *a2, uint64_t a3)
{
  return [a1 appendBytes:a2 length:4 * a3];
}

uint64_t ATXCacheAppendDoubles(void *a1, const char *a2, uint64_t a3)
{
  return [a1 appendBytes:a2 length:8 * a3];
}

unint64_t *ATXCacheReadInteger(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = *result + 8;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void *)*result;
    *uint64_t result = v2;
    return (unint64_t *)v3;
  }
  return result;
}

unint64_t *ATXCacheReadUnsignedInteger(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = *result + 8;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void *)*result;
    *uint64_t result = v2;
    return (unint64_t *)v3;
  }
  return result;
}

unint64_t *ATXCacheReadBoolean(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = *result + 1;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    char v3 = *(unsigned char *)*result;
    *uint64_t result = v2;
    return (unint64_t *)(v3 & 1);
  }
  return result;
}

unint64_t *ATXCacheReadString(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = *result + 8;
  if (v2 > a2 || (v3 = result, uint64_t v4 = *(void *)*result, *result = v2, v2 + v4 > a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithBytes:*result length:v4 encoding:4];
    *v3 += v4;
    return (unint64_t *)v5;
  }
  return result;
}

unint64_t *ATXCacheReadData(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = *result + 8;
  if (v2 > a2 || (v3 = result, uint64_t v4 = *(void *)*result, *result = v2, v2 + v4 > a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*result length:v4];
    *v3 += v4;
    return (unint64_t *)v5;
  }
  return result;
}

const void **ATXCacheReadFloats(const void **result, unint64_t a2, void *__dst, uint64_t a4)
{
  if ((unint64_t)*result + 4 * a4 > a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    uint64_t v5 = 4 * a4;
    uint64_t result = (const void **)memcpy(__dst, *result, 4 * a4);
    int *v4 = (char *)*v4 + v5;
  }
  return result;
}

const void **ATXCacheReadDoubles(const void **result, unint64_t a2, void *__dst, uint64_t a4)
{
  if ((unint64_t)*result + 8 * a4 > a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    uint64_t v5 = 8 * a4;
    uint64_t result = (const void **)memcpy(__dst, *result, 8 * a4);
    int *v4 = (char *)*v4 + v5;
  }
  return result;
}

uint64_t ATXPBActionReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_53;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 156) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_72:
        uint64_t v47 = 8;
        goto LABEL_81;
      case 3u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 80;
        goto LABEL_53;
      case 4u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_53;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 156) |= 8u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_76:
        *(unsigned char *)(a1 + 152) = v30 != 0;
        goto LABEL_84;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_53;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_53;
      case 8u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 156) |= 4u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v23 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_80:
        uint64_t v47 = 24;
LABEL_81:
        *(void *)(a1 + v47) = v23;
        goto LABEL_84;
      case 9u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
        goto LABEL_53;
      case 0xAu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 136;
        goto LABEL_53;
      case 0xBu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_53;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_53;
      case 0xDu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96;
        goto LABEL_53;
      case 0xEu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 48;
LABEL_53:
        uint64_t v41 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_84;
      case 0xFu:
        char v42 = objc_alloc_init(ATXPBActionCriteria);
        objc_storeStrong((id *)(a1 + 56), v42);
        if (!PBReaderPlaceMark() || (ATXPBActionCriteriaReadFrom((uint64_t)v42, a2) & 1) == 0) {
          goto LABEL_86;
        }
        goto LABEL_68;
      case 0x10u:
        char v42 = objc_alloc_init(ATXPBAVRouteInfo);
        objc_storeStrong((id *)(a1 + 112), v42);
        if (!PBReaderPlaceMark() || (ATXPBAVRouteInfoReadFrom((uint64_t)v42, a2) & 1) == 0) {
          goto LABEL_86;
        }
        goto LABEL_68;
      case 0x11u:
        char v42 = objc_alloc_init(ATXPBHeuristicMetadata);
        [(id)a1 addHeuristicMetadata:v42];
        if (!PBReaderPlaceMark() || !ATXPBHeuristicMetadataReadFrom((uint64_t)v42, a2)) {
          goto LABEL_86;
        }
        goto LABEL_68;
      case 0x12u:
        *(unsigned char *)(a1 + 156) |= 2u;
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v45 = v44 + 8, v44 + 8 <= *(void *)(a2 + *v4)))
        {
          uint64_t v46 = *(void *)(*(void *)(a2 + *v7) + v44);
          *(void *)(a2 + v43) = v45;
        }
        else
        {
          uint64_t v46 = 0;
          *(unsigned char *)(a2 + *v5) = 1;
        }
        *(void *)(a1 + 16) = v46;
        goto LABEL_84;
      case 0x13u:
        char v42 = objc_alloc_init(ATXPBPredictableParameters);
        [(id)a1 addPredictableParameterCombinations:v42];
        if PBReaderPlaceMark() && (ATXPBPredictableParametersReadFrom(v42, a2))
        {
LABEL_68:
          PBReaderRecallMark();

LABEL_84:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_86:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_84;
    }
  }
}

uint64_t ATXPBUserNotificationDigestReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 88) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_43;
      case 2u:
        char v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        [(id)a1 addMessageGroups:v21];
        goto LABEL_34;
      case 3u:
        char v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        [(id)a1 addHighlightedGroups:v21];
        goto LABEL_34;
      case 4u:
        char v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        [(id)a1 addRankedGroups:v21];
LABEL_34:
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_48;
        }
        goto LABEL_42;
      case 5u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 80;
        goto LABEL_39;
      case 6u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 64;
        goto LABEL_39;
      case 7u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 48;
LABEL_39:
        uint64_t v25 = *(void **)(a1 + v23);
        *(void *)(a1 + v23) = v22;

        goto LABEL_43;
      case 8u:
        char v21 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 72), v21);
        if (!PBReaderPlaceMark()
          || (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_48;
        }
        goto LABEL_42;
      case 9u:
        char v21 = objc_alloc_init(ATXPBDigestTimeline);
        objc_storeStrong((id *)(a1 + 24), v21);
        if (PBReaderPlaceMark() && ATXPBDigestTimelineReadFrom((uint64_t)v21, a2)) {
          goto LABEL_42;
        }
        goto LABEL_48;
      case 0xAu:
        char v21 = objc_alloc_init(ATXPBUserNotificationAppDigest);
        [(id)a1 addAppDigests:v21];
        if (PBReaderPlaceMark() && ATXPBUserNotificationAppDigestReadFrom(v21, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_48:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

void sub_1A79E7638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79EE840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1A79EF6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBExecutableReferenceKeyReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
            goto LABEL_47;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_49;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_49:
        *(_DWORD *)(a1 + 48) = v19;
        goto LABEL_44;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v24;

        goto LABEL_44;
      case 3u:
        unint64_t v26 = objc_alloc_init(ATXPBAction);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (ATXPBActionReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_43;
      case 4u:
        unint64_t v26 = (ATXPBAction *)objc_alloc_init(MEMORY[0x1E4F67E78]);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (!PBReaderPlaceMark() || (ATXPBHeroAppPredictionReadFrom() & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_43;
      case 5u:
        unint64_t v26 = objc_alloc_init(ATXPBExecutableReferenceEntry);
        -[ATXPBExecutableReferenceKey addReferences:](a1, v26);
        if (!PBReaderPlaceMark() || (ATXPBExecutableReferenceEntryReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_43;
      case 6u:
        unint64_t v26 = (ATXPBAction *)objc_alloc_init(MEMORY[0x1E4F93930]);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (ATXPBInfoSuggestionReadFrom() & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_43;
      case 7u:
        unint64_t v26 = objc_alloc_init(ATXPBLinkAction);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (PBReaderPlaceMark() && ATXPBLinkActionReadFrom((uint64_t)v26, a2))
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_51:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

BOOL ATXPBNotificationQuietingSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  id v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_1A79F575C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_1A79F7680(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_1A79F7C5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F7F0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F8288(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F85B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F88F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79F8C3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F8F9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F9234(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F9488(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79F9850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A79F9EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A79FA4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

void sub_1A79FAAA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FAD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FAFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FB53C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FB78C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FBA98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FBE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FC398(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FC7FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FCBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FCEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FD08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FD434(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FD7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FDBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A79FE094(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FE3E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FE6B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FE934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A79FEE8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FF280(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FF620(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FFA90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A79FFEC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A00298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A00870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1A7A00F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A013FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A01628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A0189C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A01C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A01F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A02274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A02610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A029D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A02D00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A030A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A03498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A0384C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A03BB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A03FC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A044F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A049B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A04BE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A04DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A051E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A054FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A057C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A062D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A06724(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A0699C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A06C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A06F48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A07104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A07344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A07570(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A07784(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

void OUTLINED_FUNCTION_28(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_29(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void OUTLINED_FUNCTION_32(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_33(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x34u);
}

void OUTLINED_FUNCTION_34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

id ATXAllowedEngagementRecordManagerClasses()
{
  uint64_t v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ATXAction", @"NSString", @"ATXHeroData", @"ATXInfoSuggestion", @"ATXLinkActionContainer", 0);

  return v1;
}

ATXExecutableIdentifier *ATXExecutableIdentifierForSuggestion(void *a1)
{
  id v1 = a1;
  unint64_t v2 = (void *)MEMORY[0x1AD0D3C30]();
  char v3 = [v1 executableSpecification];
  uint64_t v4 = [v3 executableObject];

  if (!v4)
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      ATXExecutableIdentifierForSuggestion_cold_1();
    }
    goto LABEL_33;
  }
  uint64_t v5 = [v1 executableSpecification];
  id v6 = [v5 executableClassString];
  Class v7 = NSClassFromString(v6);

  if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        ATXExecutableIdentifierForSuggestion_cold_2();
      }
      goto LABEL_33;
    }
    uint64_t v10 = [[ATXExecutableIdentifier alloc] initWithAction:v4];
    goto LABEL_28;
  }
  if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        ATXExecutableIdentifierForSuggestion_cold_3();
      }
      goto LABEL_33;
    }
    uint64_t v10 = [[ATXExecutableIdentifier alloc] initWithString:v4];
    goto LABEL_28;
  }
  if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        ATXExecutableIdentifierForSuggestion_cold_4();
      }
      goto LABEL_33;
    }
    uint64_t v10 = [[ATXExecutableIdentifier alloc] initWithHeroAppPrediction:v4];
    goto LABEL_28;
  }
  if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        ATXExecutableIdentifierForSuggestion_cold_5();
      }
      goto LABEL_33;
    }
    uint64_t v10 = [[ATXExecutableIdentifier alloc] initWithInfoSuggestion:v4];
LABEL_28:
    uint64_t v11 = v10;
    goto LABEL_35;
  }
  if (v7 != (Class)objc_opt_class())
  {
    uint64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      ATXExecutableIdentifierForSuggestion_cold_7((uint64_t)v7, v8);
    }

    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [[ATXExecutableIdentifier alloc] initWithLinkAction:v4];
    goto LABEL_28;
  }
  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    ATXExecutableIdentifierForSuggestion_cold_6();
  }
LABEL_33:

LABEL_34:
  uint64_t v12 = [ATXExecutableIdentifier alloc];
  uint64_t v13 = [v1 executableSpecification];
  uint64_t v14 = [v13 executableIdentifier];
  uint64_t v11 = [(ATXExecutableIdentifier *)v12 initWithString:v14];

LABEL_35:

  return v11;
}

id initializeDNDToggleDoNotDisturbIntent()
{
  uint64_t v0 = (void *)MEMORY[0x1AD0D3C30]();
  id v1 = loadIntentWithBundleIdAndName(@"com.apple.DoNotDisturb.Intents", @"DNDToggleDoNotDisturbIntent");
  unint64_t v2 = v1;
  if (v1)
  {
    [v1 _setExtensionBundleId:@"com.apple.DoNotDisturb.Intents"];
    char v3 = [MEMORY[0x1E4F304C0] imageNamed:@"DoNotDisturb"];
    [v3 _setBundleIdentifier:@"com.apple.DoNotDisturb.Intents"];
    [v2 setImage:v3 forParameterNamed:@"state"];
    id v4 = objc_alloc(MEMORY[0x1E4F30568]);
    uint64_t v5 = DNDModeLocalizedNameForSemanticType();
    id v6 = (void *)[v4 initWithIdentifier:@"com.apple.donotdisturb.mode.default" displayString:v5];
    [v2 setValue:v6 forKey:@"mode"];

    id v7 = v2;
  }

  return v2;
}

id personFromCallRecipient(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  int v8 = [v5 containsString:@"@"];
  uint64_t v9 = __atxlog_handle_heuristic();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      personFromCallRecipient_cold_1();
    }
    uint64_t v11 = 1;
  }
  else
  {
    if (v10) {
      personFromCallRecipient_cold_2();
    }
    uint64_t v11 = 2;
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F305B8]) initWithValue:v5 type:v11];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v12 nameComponents:0 displayName:v6 image:0 contactIdentifier:v7 customIdentifier:v5];

  return v13;
}

NSObject *loadIntentWithBundleIdAndName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v13 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v3 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F30688] schemaWithBundleRecord:v5 fallbackToSystemSchema:0];
    if (v7)
    {
      int v8 = [objc_alloc(MEMORY[0x1E4F304D0]) _initWithIdentifier:0 schema:v7 name:v4 data:0];
      uint64_t v9 = v8;
      if (v8)
      {
        uint64_t v9 = v8;
        BOOL v10 = v9;
      }
      else
      {
        uint64_t v11 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          loadIntentWithBundleIdAndName_cold_3();
        }

        BOOL v10 = 0;
      }
    }
    else
    {
      uint64_t v9 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        loadIntentWithBundleIdAndName_cold_2();
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    id v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      loadIntentWithBundleIdAndName_cold_1();
    }
    BOOL v10 = 0;
  }

  return v10;
}

void sub_1A7A0A45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A0A908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTUpdateAlarmIntentClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  Class result = objc_getClass("MTUpdateAlarmIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMTUpdateAlarmIntentClass_block_invoke_cold_1();
  }
  getMTUpdateAlarmIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void MobileTimerLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __MobileTimerLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5D09640;
    uint64_t v2 = 0;
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerLibraryCore_frameworkLibrary) {
    MobileTimerLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __MobileTimerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileTimerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMTCreateAlarmIntentClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  Class result = objc_getClass("MTCreateAlarmIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMTCreateAlarmIntentClass_block_invoke_cold_1();
  }
  getMTCreateAlarmIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_10(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x20u);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return [v0 captureType];
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return v0;
}

void sub_1A7A0CD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A0E120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1A7A0E534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBSpotlightEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 80) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_50;
      case 2u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 80) |= 2u;
        while (2)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_47;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_47:
        *(_DWORD *)(a1 + 64) = v24;
        goto LABEL_50;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 48;
        goto LABEL_35;
      case 4u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 24;
        goto LABEL_35;
      case 5u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 40;
        goto LABEL_35;
      case 6u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 16;
LABEL_35:
        uint64_t v31 = *(void **)(a1 + v30);
        *(void *)(a1 + v30) = v29;

        goto LABEL_50;
      case 7u:
        PBReaderReadString();
        uint64_t v32 = (ATXPBSpotlightEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v32) {
          -[ATXPBSpotlightEvent addAppSuggestionIds:](a1, v32);
        }
        goto LABEL_43;
      case 8u:
        PBReaderReadString();
        uint64_t v32 = (ATXPBSpotlightEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v32) {
          -[ATXPBSpotlightEvent addActionSuggestionIds:](a1, v32);
        }
        goto LABEL_43;
      case 9u:
        uint64_t v32 = objc_alloc_init(ATXPBSpotlightEventMetadata);
        objc_storeStrong((id *)(a1 + 72), v32);
        if PBReaderPlaceMark() && (ATXPBSpotlightEventMetadataReadFrom((uint64_t)v32, a2))
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_50:
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
        goto LABEL_50;
    }
  }
}

BOOL ATXPBDigestTimelineReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 40) |= 8u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unint64_t v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstUpcomingViewTimestamp;
          goto LABEL_41;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 2u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unint64_t v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstCollapsedViewTimestamp;
          goto LABEL_41;
        case 3u:
          *(unsigned char *)(a1 + 40) |= 4u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unint64_t v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstScheduledViewTimestamp;
          goto LABEL_41;
        case 4u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unint64_t v27 = &OBJC_IVAR___ATXPBDigestTimeline__digestRemovedTimestamp;
LABEL_41:
          *(void *)(a1 + *v27) = v20;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

ATXComplication *ATXComplicationFromCHSWidget(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = [ATXComplication alloc];
    uint64_t v3 = [v1 extensionIdentity];
    id v4 = [v3 extensionBundleIdentifier];
    id v5 = [v1 kind];
    id v6 = [v1 extensionIdentity];
    id v7 = [v6 containerBundleIdentifier];
    uint64_t v8 = [v1 family];
    unsigned int v9 = [v1 intentReference];

    unint64_t v10 = [v9 intent];
    uint64_t v11 = [(ATXComplication *)v2 initWithExtensionBundleIdentifier:v4 kind:v5 containerBundleIdentifier:v7 widgetFamily:v8 intent:v10 source:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id CHSWidgetFromATXComplication(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x1E4F58DD8];
    id v2 = a1;
    id v3 = [v1 alloc];
    id v4 = objc_alloc(MEMORY[0x1E4F58CC0]);
    id v5 = [v2 extensionBundleIdentifier];
    id v6 = [v2 containerBundleIdentifier];
    id v7 = (void *)[v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:0];
    uint64_t v8 = [v2 kind];
    uint64_t v9 = [v2 widgetFamily];
    unint64_t v10 = [v2 intent];

    uint64_t v11 = (void *)[v3 initWithExtensionIdentity:v7 kind:v8 family:v9 intent:v10 activityIdentifier:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id errorWithDescription(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = (objc_class *)MEMORY[0x1E4F28C58];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = (void *)[v3 initWithDomain:@"ATXComplication" code:1 userInfo:v4];

  return v5;
}

void OUTLINED_FUNCTION_2_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL ATXPBNotificationSmartPauseSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v23 = &OBJC_IVAR___ATXPBNotificationSmartPauseSuggestion__expirationTimestamp;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 2u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    uint64_t v23 = &OBJC_IVAR___ATXPBNotificationSmartPauseSuggestion__pauseDuration;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return *(void *)(v0 + 48);
}

uint64_t ATXPBUserNotificationLoggingEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = objc_alloc_init(ATXPBUserNotification);
          objc_storeStrong((id *)(a1 + 40), v18);
          if PBReaderPlaceMark() && (ATXPBUserNotificationReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          while (1)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_50;
            }
            v20 += 7;
            BOOL v15 = v21++ >= 9;
            if (v15)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_52:
          uint64_t v44 = 24;
          goto LABEL_61;
        case 3u:
          *(unsigned char *)(a1 + 48) |= 1u;
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v29 = 0;
          }
          *(void *)(a1 + 8) = v29;
          continue;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v30;

          continue;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          uint64_t v44 = 16;
          goto LABEL_61;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
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
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v22 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_58;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v22) = 0;
          goto LABEL_60;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_60:
      uint64_t v44 = 20;
LABEL_61:
      *(_DWORD *)(a1 + v44) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A7A17A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A1D3C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7A1FCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_1A7A1FDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A1FEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A1FF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A20058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A21B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBUserNotificationModelScoreReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
          goto LABEL_37;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 56) |= 1u;
          break;
        case 3u:
          *(unsigned char *)(a1 + 56) |= 2u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v34 = 16;
          goto LABEL_46;
        case 4u:
          *(unsigned char *)(a1 + 56) |= 4u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v34 = 24;
LABEL_46:
          *(void *)(a1 + v34) = v30;
          continue;
        case 5u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_37;
        case 6u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 40;
LABEL_37:
          unsigned int v33 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

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
        uint64_t v24 = *v3;
        uint64_t v25 = *(void *)(a2 + v24);
        unint64_t v26 = v25 + 1;
        if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v26;
        v23 |= (unint64_t)(v27 & 0x7F) << v21;
        if ((v27 & 0x80) == 0) {
          goto LABEL_39;
        }
        v21 += 7;
        BOOL v15 = v22++ >= 9;
        if (v15)
        {
          uint64_t v23 = 0;
          goto LABEL_41;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_41:
      *(void *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *NSStringFromATXSuggestedPageType(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1E5D09C68[a1];
  }
}

void sub_1A7A24FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A250C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A251BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A255F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7A25A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

id keyForStrings(void *a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = a1;
  id v6 = (void *)[[v3 alloc] initWithFormat:@"%@-%@", v5, v4];

  return v6;
}

id extensionBundleIdAndKindKey(void *a1)
{
  id v1 = a1;
  id v2 = [v1 extensionBundleIdentifier];
  id v3 = [v1 kind];

  id v4 = keyForStrings(v2, v3);

  return v4;
}

uint64_t ATXPBHomeScreenEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 124) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_87;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
        goto LABEL_46;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 56;
        goto LABEL_46;
      case 4u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
        goto LABEL_46;
      case 5u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 64;
        goto LABEL_46;
      case 6u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 88;
        goto LABEL_46;
      case 7u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 96;
        goto LABEL_46;
      case 8u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 124) |= 8u;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v15 = v25++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_71:
        uint64_t v52 = 104;
        goto LABEL_80;
      case 9u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 40;
        goto LABEL_46;
      case 0xAu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 112;
        goto LABEL_46;
      case 0xBu:
        PBReaderReadString();
        uint64_t v31 = (ATXPBHomeScreenEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v31) {
          -[ATXPBHomeScreenEvent addSuggestionIds:](a1, v31);
        }
        goto LABEL_44;
      case 0xCu:
        uint64_t v31 = objc_alloc_init(ATXPBHomeScreenEventMetadata);
        objc_storeStrong((id *)(a1 + 48), v31);
        if PBReaderPlaceMark() && (ATXPBHomeScreenEventMetadataReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();
LABEL_44:

LABEL_87:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0xDu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 16;
LABEL_46:
        unint64_t v32 = *(void **)(a1 + v23);
        *(void *)(a1 + v23) = v22;

        goto LABEL_87;
      case 0xEu:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 124) |= 2u;
        while (2)
        {
          uint64_t v35 = *v3;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v26 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v15 = v34++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_75;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_75:
        uint64_t v52 = 72;
        goto LABEL_80;
      case 0xFu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 124) |= 4u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v26 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v15 = v40++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_79:
        uint64_t v52 = 76;
LABEL_80:
        *(_DWORD *)(a1 + v52) = v26;
        goto LABEL_87;
      case 0x10u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(unsigned char *)(a1 + 124) |= 0x10u;
        while (2)
        {
          uint64_t v48 = *v3;
          uint64_t v49 = *(void *)(a2 + v48);
          unint64_t v50 = v49 + 1;
          if (v49 == -1 || v50 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v48) = v50;
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              BOOL v15 = v46++ >= 9;
              if (v15)
              {
                uint64_t v47 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v47 = 0;
        }
LABEL_84:
        *(unsigned char *)(a1 + 120) = v47 != 0;
        goto LABEL_87;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_87;
    }
  }
}

void sub_1A7A2B5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBUIEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = 8;
LABEL_22:
        unint64_t v19 = *(void **)(a1 + v18);
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
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ATXNotificationSuggestionScopeToString(uint64_t a1)
{
  if (a1 >= 6)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
  }
  else
  {
    id v1 = *(&off_1E5D09EA8 + (int)a1);
  }

  return v1;
}

id ATXSuggestionTypeToString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
  }
  else
  {
    id v1 = *(&off_1E5D09ED8 + (int)a1);
  }

  return v1;
}

id ATXNotificationSuggestionEventTypeToString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
  }
  else
  {
    id v1 = *(&off_1E5D09F30 + (int)a1);
  }

  return v1;
}

id ATXNotificationGroupEventTypeToString(uint64_t a1)
{
  if (a1 >= 0x16)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
  }
  else
  {
    id v1 = *(&off_1E5D09F80 + (int)a1);
  }

  return v1;
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return objc_opt_class();
}

__CFString *ATXStringForStackLayoutSize(unint64_t a1)
{
  if (a1 < 5) {
    return *(&off_1E5D0A030 + a1);
  }
  id v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    ATXStringForStackLayoutSize_cold_1(v2);
  }

  return @"Unknown";
}

__CFString *ATXStringForStackKind(unint64_t a1)
{
  if (a1 > 7) {
    return @"ATXStackLayoutKindPinnedWidget";
  }
  else {
    return *(&off_1E5D0A058 + a1);
  }
}

__CFString *ATXStringForStackLocation(unint64_t a1)
{
  if (a1 > 5) {
    return @"ATXStackLayoutLocationTodayPage";
  }
  else {
    return *(&off_1E5D0A098 + a1);
  }
}

__CFString *ATXCAStringForStackLocation(unint64_t a1)
{
  if (a1 > 5) {
    return @"TodayPage";
  }
  else {
    return *(&off_1E5D0A0C8 + a1);
  }
}

__CFString *ATXCAStringForStackLayoutSize(unint64_t a1)
{
  if (a1 < 5) {
    return *(&off_1E5D0A0F8 + a1);
  }
  id v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    ATXCAStringForStackLayoutSize_cold_1(v2);
  }

  return @"Unknown";
}

uint64_t ATXStackLayoutSizeForNSString(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"ATXStackLayoutSize2x2"] & 1) == 0)
  {
    if ([v1 isEqualToString:@"ATXStackLayoutSize2x4"])
    {
      uint64_t v2 = 1;
      goto LABEL_11;
    }
    if ([v1 isEqualToString:@"ATXStackLayoutSize4x4"])
    {
      uint64_t v2 = 2;
      goto LABEL_11;
    }
    if ([v1 isEqualToString:@"ATXStackLayoutSize6x4"])
    {
      uint64_t v2 = 3;
      goto LABEL_11;
    }
    if ([v1 isEqualToString:@"ATXStackLayoutSize4x8"])
    {
      uint64_t v2 = 4;
      goto LABEL_11;
    }
    id v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      ATXStackLayoutSizeForNSString_cold_1((uint64_t)v1, v4);
    }
  }
  uint64_t v2 = 0;
LABEL_11:

  return v2;
}

BOOL ATXStackLocationIsTodayPage(unint64_t a1)
{
  return a1 > 5 || (a1 & 0x3F) == 1;
}

uint64_t ATXStackLocationForPageAndIndex(void *a1, unint64_t a2)
{
  uint64_t v3 = [a1 pageIndex];
  uint64_t v4 = a2 + 2;
  if (a2 >= 3) {
    uint64_t v4 = 5;
  }
  if (v3 == 20000) {
    return 1;
  }
  else {
    return v4;
  }
}

uint64_t ATXStackKindForStack(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 widgets];
  uint64_t v3 = [v2 count];

  if (v3 == 1)
  {
    uint64_t v4 = 1;
  }
  else if [v1 allowsSmartRotate] && (objc_msgSend(v1, "allowsNewWidget"))
  {
    uint64_t v4 = 4;
  }
  else if ([v1 allowsSmartRotate] && !objc_msgSend(v1, "allowsNewWidget"))
  {
    uint64_t v4 = 6;
  }
  else if (([v1 allowsSmartRotate] & 1) != 0 || (objc_msgSend(v1, "allowsNewWidget") & 1) == 0)
  {
    uint64_t v4 = 7;
  }
  else
  {
    uint64_t v4 = 5;
  }

  return v4;
}

uint64_t ATXStackLayoutSizeForPBLayoutSize(int a1)
{
  uint64_t v1 = (a1 - 2);
  if (v1 < 4) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t ATXStackKindForPBKind(int a1)
{
  uint64_t v1 = (a1 - 1);
  if (v1 < 7) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t ATXStackLocationForPBLocation(int a1)
{
  if ((a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1A7A9DA88[a1 - 1];
  }
}

BOOL ATXStackLocationIsHomeScreen(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

uint64_t CHSWidgetFamilyFromATXStackLayoutSize(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_1A7A9DAB0[a1];
  }
}

uint64_t ATXStackLayoutSizeFromCHSWidgetFamily(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 4) {
    return 0;
  }
  else {
    return qword_1A7A9DAD8[a1 - 2];
  }
}

uint64_t ATXPBExecutableReferenceEntryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 28) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          *(void *)(a1 + 8) = v20;
          continue;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v22;

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  uint64_t v26 = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_49:
          BOOL v45 = v26 != 0;
          uint64_t v46 = 24;
          goto LABEL_58;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  uint64_t v33 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_53:
          BOOL v45 = v33 != 0;
          uint64_t v46 = 25;
          goto LABEL_58;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 28) |= 8u;
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
        uint64_t v41 = *v3;
        uint64_t v42 = *(void *)(a2 + v41);
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
        *(void *)(a2 + v41) = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0) {
          goto LABEL_55;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          uint64_t v40 = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v40 = 0;
      }
LABEL_57:
      BOOL v45 = v40 != 0;
      uint64_t v46 = 26;
LABEL_58:
      *(unsigned char *)(a1 + v46) = v45;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A7A30344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVSystemControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaExperienceLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __MediaExperienceLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D0A120;
    uint64_t v5 = 0;
    MediaExperienceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaExperienceLibraryCore_frameworkLibrary) {
    __getAVSystemControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AVSystemController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAVSystemControllerClass_block_invoke_cold_2();
  }
  getAVSystemControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaExperienceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaExperienceLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ATXPBHomeScreenWidgetIdentifiableReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_51;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 56;
          goto LABEL_51;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
          goto LABEL_51;
        case 4u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 32;
          goto LABEL_51;
        case 5u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 64;
          goto LABEL_51;
        case 6u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 76) |= 2u;
          while (2)
          {
            uint64_t v24 = *v3;
            uint64_t v25 = *(void *)(a2 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_55:
          *(_DWORD *)(a1 + 48) = v23;
          continue;
        case 7u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          *(unsigned char *)(a1 + 76) |= 8u;
          while (2)
          {
            uint64_t v31 = *v3;
            uint64_t v32 = *(void *)(a2 + v31);
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  uint64_t v30 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v30 = 0;
          }
LABEL_59:
          BOOL v46 = v30 != 0;
          uint64_t v47 = 73;
          goto LABEL_64;
        case 8u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          *(unsigned char *)(a1 + 76) |= 4u;
          break;
        case 9u:
          *(unsigned char *)(a1 + 76) |= 1u;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v44 = *(void *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v44 = 0;
          }
          *(void *)(a1 + 8) = v44;
          continue;
        case 0xAu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
LABEL_51:
          BOOL v45 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

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
        uint64_t v38 = *v3;
        uint64_t v39 = *(void *)(a2 + v38);
        unint64_t v40 = v39 + 1;
        if (v39 == -1 || v40 > *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
        *(void *)(a2 + v38) = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0) {
          goto LABEL_61;
        }
        v35 += 7;
        BOOL v15 = v36++ >= 9;
        if (v15)
        {
          uint64_t v37 = 0;
          goto LABEL_63;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v37 = 0;
      }
LABEL_63:
      BOOL v46 = v37 != 0;
      uint64_t v47 = 72;
LABEL_64:
      *(unsigned char *)(a1 + v47) = v46;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ATXTimeIntelligenceInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE15C80];
  uint64_t v1 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_predictedTimelineWithDate_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v3 = (void *)MEMORY[0x1AD0D3C30]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_predictedTimelineWithDate_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x1AD0D3C30]();
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_predictedDailyOverviewWithDate_options_completionHandler_ argumentIndex:0 ofReply:0];

  unsigned int v9 = (void *)MEMORY[0x1AD0D3C30]();
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_predictedDailyOverviewWithDate_options_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v12 forSelector:sel_predictedDailyOverviewWithDate_options_completionHandler_ argumentIndex:0 ofReply:1];

  unint64_t v13 = (void *)MEMORY[0x1AD0D3C30]();
  char v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v14 forSelector:sel_predictedFreeMomentsWithDateRange_options_completionHandler_ argumentIndex:0 ofReply:0];

  BOOL v15 = (void *)MEMORY[0x1AD0D3C30]();
  int v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v16 forSelector:sel_predictedFreeMomentsWithDateRange_options_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v17 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v18 forSelector:sel_predictedFreeMomentsWithDateRange_options_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v20 forSelector:sel_computeDailySummaryWithDate_completionHandler_ argumentIndex:0 ofReply:0];

  char v21 = (void *)MEMORY[0x1AD0D3C30]();
  id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
  [v0 setClasses:v24 forSelector:sel_computeDailySummaryWithDate_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v25 = (void *)MEMORY[0x1AD0D3C30]();
  id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v27 = objc_opt_class();
  char v28 = objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
  [v0 setClasses:v28 forSelector:sel_computeCompactTimeSummaryWithOptions_completionHandler_ argumentIndex:0 ofReply:1];

  unsigned int v29 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v30 forSelector:sel_invokeActionWithIdentifier_forEvent_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v31 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v32 forSelector:sel_invokeFeedbackOption_forEvent_referenceDate_completionHandler_ argumentIndex:0 ofReply:0];

  unint64_t v33 = (void *)MEMORY[0x1AD0D3C30]();
  char v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v34 forSelector:sel_invokeFeedbackOption_forEvent_referenceDate_completionHandler_ argumentIndex:1 ofReply:0];

  char v35 = (void *)MEMORY[0x1AD0D3C30]();
  unsigned int v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v36 forSelector:sel_rescheduleEvent_proposedDate_referenceDate_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v37 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v38 forSelector:sel_rescheduleEvent_proposedDate_referenceDate_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v39 = (void *)MEMORY[0x1AD0D3C30]();
  unint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v40 forSelector:sel_savePinnedTimeEvent_completionHandler_ argumentIndex:0 ofReply:0];

  char v41 = (void *)MEMORY[0x1AD0D3C30]();
  id v42 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_msgSend(v42, "initWithObjects:", v43, objc_opt_class(), 0);
  [v0 setClasses:v44 forSelector:sel_loadPinnedTimeEventsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  BOOL v45 = (void *)MEMORY[0x1AD0D3C30]();
  BOOL v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v46 forSelector:sel_saveScheduledPinnedTimeEvent_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v47 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v48 forSelector:sel_logDidInvokeWidgetForEvent_completionHandler_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t ATXTimeIntelligenceClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE15880];
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_87);
  }
  uint64_t v0 = (void *)__atxlog_handle_default_log;

  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  uint64_t v1 = __atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4_4);
  }
  os_log_t v0 = (void *)__atxlog_handle_xpc_log;

  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  uint64_t v1 = __atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7_3);
  }
  os_log_t v0 = (void *)__atxlog_handle_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  uint64_t v1 = __atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10_1);
  }
  os_log_t v0 = (void *)__atxlog_handle_notifications_log;

  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  uint64_t v1 = __atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13_3);
  }
  os_log_t v0 = (void *)__atxlog_handle_pmm_log;

  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  uint64_t v1 = __atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_dailyroutines_log;

  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  uint64_t v1 = __atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  os_log_t v0 = (void *)__atxlog_handle_feedback_log;

  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  uint64_t v1 = __atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23_2);
  }
  os_log_t v0 = (void *)__atxlog_handle_modes_log;

  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  uint64_t v1 = __atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26_1);
  }
  os_log_t v0 = (void *)__atxlog_handle_hero_log;

  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  uint64_t v1 = __atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29_1);
  }
  os_log_t v0 = (void *)__atxlog_handle_deletions_log;

  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  uint64_t v1 = __atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32_1);
  }
  os_log_t v0 = (void *)__atxlog_handle_gi_log;

  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  uint64_t v1 = __atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35_2);
  }
  os_log_t v0 = (void *)__atxlog_handle_timeline_log;

  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  uint64_t v1 = __atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  os_log_t v0 = (void *)__atxlog_handle_relevant_shortcut_log;

  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  uint64_t v1 = __atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  os_log_t v0 = (void *)__atxlog_handle_relevance_model_log;

  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  uint64_t v1 = __atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_watch_log;

  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  uint64_t v1 = __atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47_2);
  }
  os_log_t v0 = (void *)__atxlog_handle_ui_log;

  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  uint64_t v1 = __atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  uint64_t v1 = __atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  os_log_t v0 = (void *)__atxlog_handle_blending_internal_cache_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  uint64_t v1 = __atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  os_log_t v0 = (void *)__atxlog_handle_blending_ecosystem_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  uint64_t v1 = __atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  uint64_t v1 = __atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_sleep_schedule_log;

  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  uint64_t v1 = __atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  os_log_t v0 = (void *)__atxlog_handle_lock_screen_log;

  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  uint64_t v1 = __atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  os_log_t v0 = (void *)__atxlog_handle_anchor_log;

  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  uint64_t v1 = __atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  os_log_t v0 = (void *)__atxlog_handle_app_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  uint64_t v1 = __atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  os_log_t v0 = (void *)__atxlog_handle_action_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  uint64_t v1 = __atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  uint64_t v1 = __atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  os_log_t v0 = (void *)__atxlog_handle_app_install_log;

  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  uint64_t v1 = __atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_backup_log;

  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  uint64_t v1 = __atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  os_log_t v0 = (void *)__atxlog_handle_metrics_log;

  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  uint64_t v1 = __atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  os_log_t v0 = (void *)__atxlog_handle_trial_assets_log;

  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  uint64_t v1 = __atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  os_log_t v0 = (void *)__atxlog_handle_notification_management_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  uint64_t v1 = __atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  os_log_t v0 = (void *)__atxlog_handle_contextual_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  uint64_t v1 = __atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_intents_helper_log;

  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  uint64_t v1 = __atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  os_log_t v0 = (void *)__atxlog_handle_context_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  uint64_t v1 = __atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  os_log_t v0 = (void *)__atxlog_handle_zkw_hide_log;

  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  uint64_t v1 = __atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  os_log_t v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;

  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  uint64_t v1 = __atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  os_log_t v0 = (void *)__atxlog_handle_time_intelligence_log;

  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  uint64_t v1 = __atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  os_log_t v0 = (void *)__atxlog_handle_contextual_engine_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  uint64_t v1 = __atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  os_log_t v0 = (void *)__atxlog_handle_usage_insights_log;

  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  uint64_t v1 = __atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  os_log_t v0 = (void *)__atxlog_handle_notification_categorization_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  uint64_t v1 = __atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  os_log_t v0 = (void *)__atxlog_handle_settings_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  uint64_t v1 = __atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1A7A35774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A358F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A35AA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A36184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A36B94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSFSearchResult_SpotlightExtrasClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getSFSearchResult_SpotlightExtrasClass_softClass;
  uint64_t v7 = getSFSearchResult_SpotlightExtrasClass_softClass;
  if (!getSFSearchResult_SpotlightExtrasClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSFSearchResult_SpotlightExtrasClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getSFSearchResult_SpotlightExtrasClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7A36CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A36EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A372E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __SpotlightServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpotlightServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_4_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

BOOL ATXPBUserNotificationEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL ATXPBAppDirectoryEventMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0;
            uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
            goto LABEL_41;
          }
        }
        uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + *v24) = v19 != 0;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 12) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
        goto LABEL_41;
      }
    }
    uint64_t v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A7A3C33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void sub_1A7A3C4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A3D1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getINUISearchFoundationImageAdapterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getINUISearchFoundationImageAdapterClass_softClass;
  uint64_t v7 = getINUISearchFoundationImageAdapterClass_softClass;
  if (!getINUISearchFoundationImageAdapterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getINUISearchFoundationImageAdapterClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getINUISearchFoundationImageAdapterClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7A421C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINUISearchFoundationImageAdapterClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!IntentsUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __IntentsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D0A528;
    uint64_t v5 = 0;
    IntentsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsUILibraryCore_frameworkLibrary) {
    __getINUISearchFoundationImageAdapterClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("INUISearchFoundationImageAdapter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINUISearchFoundationImageAdapterClass_block_invoke_cold_2();
  }
  getINUISearchFoundationImageAdapterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntentsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntentsUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __WorkflowKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WorkflowKitLibraryCore_frameworkLibrary = result;
  return result;
}

unsigned char *OUTLINED_FUNCTION_1_11(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_6_5(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

id ATXFaceSuggestionClientXPCInterface()
{
  v67[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDF86A8];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v67[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_fetchFaceGalleryConfigurationWithCompletion_ argumentIndex:0 ofReply:1];

  long long v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_regenerateFaceGalleryConfigurationWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v65 = objc_opt_class();
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  unsigned int v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_fetchFaceSuggestionsForFocusMode_completion_ argumentIndex:0 ofReply:0];

  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  unint64_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_fetchFaceSuggestionsForFocusMode_completion_ argumentIndex:0 ofReply:1];

  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  v63[2] = objc_opt_class();
  v63[3] = objc_opt_class();
  char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
  int v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_fetchPosterDescriptorsAndSuggestionDataWithCompletion_ argumentIndex:0 ofReply:1];

  int v16 = (void *)MEMORY[0x1E4F1CAD0];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  unsigned int v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_fetchRankedPosterDescriptors_ argumentIndex:0 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1AD0D3C30]();
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v21 = objc_opt_class();
  char v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  [v0 setClasses:v22 forSelector:sel_fetchPosterConfigurationsWithCompletion_ argumentIndex:0 ofReply:1];

  BOOL v23 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v23 forSelector:sel_fetchComplicationSetsForFaceGalleryItem_completion_ argumentIndex:0 ofReply:0];

  uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  v61[2] = objc_opt_class();
  char v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  unsigned int v26 = [v24 setWithArray:v25];
  [v0 setClasses:v26 forSelector:sel_fetchComplicationSetsForFaceGalleryItem_completion_ argumentIndex:0 ofReply:1];

  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v27 forSelector:sel_fetchLandscapeComplicationSetsForFaceGalleryItem_completion_ argumentIndex:0 ofReply:0];

  unint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  v60[2] = objc_opt_class();
  v60[3] = objc_opt_class();
  char v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
  uint64_t v30 = [v28 setWithArray:v29];
  [v0 setClasses:v30 forSelector:sel_fetchLandscapeComplicationSetsForFaceGalleryItem_completion_ argumentIndex:0 ofReply:1];

  uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  v59[2] = objc_opt_class();
  v59[3] = objc_opt_class();
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
  unint64_t v33 = [v31 setWithArray:v32];
  [v0 setClasses:v33 forSelector:sel_posterBoardDidUpdateDescriptors_completion_ argumentIndex:0 ofReply:0];

  char v34 = (void *)MEMORY[0x1AD0D3C30]();
  id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
  [v0 setClasses:v37 forSelector:sel_posterBoardDidUpdateConfigurations_completion_ argumentIndex:0 ofReply:0];

  uint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  unint64_t v40 = [v38 setWithArray:v39];
  [v0 setClasses:v40 forSelector:sel_logPosterEdit_completion_ argumentIndex:0 ofReply:0];

  char v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v57 = objc_opt_class();
  id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  uint64_t v43 = [v41 setWithArray:v42];
  [v0 setClasses:v43 forSelector:sel_logPosterSwitch_completion_ argumentIndex:0 ofReply:0];

  uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v56 = objc_opt_class();
  BOOL v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  BOOL v46 = [v44 setWithArray:v45];
  [v0 setClasses:v46 forSelector:sel_synchronousDateOfLastGalleryAppearanceWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v47 = (void *)MEMORY[0x1E4F1CAD0];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  v55[2] = objc_opt_class();
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
  uint64_t v49 = [v47 setWithArray:v48];
  [v0 setClasses:v49 forSelector:sel_logComplicationsSeenInGalleryWithEngagements_completion_ argumentIndex:0 ofReply:0];

  unint64_t v50 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  char v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  uint64_t v52 = [v50 setWithArray:v51];
  [v0 setClasses:v52 forSelector:sel_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t ATXPBSharedDigestEngagementTrackingMetricsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          *(unsigned char *)(a1 + 72) |= 8u;
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
              goto LABEL_72;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_74;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_72:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_74:
          uint64_t v56 = 32;
          goto LABEL_99;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_78:
          uint64_t v56 = 24;
          goto LABEL_99;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 0x10u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_82:
          uint64_t v56 = 40;
          goto LABEL_99;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          id v35 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = v34;

          continue;
        case 5u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 0x20u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_86:
          uint64_t v56 = 48;
          goto LABEL_99;
        case 6u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 0x40u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_90:
          uint64_t v56 = 56;
          goto LABEL_99;
        case 7u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 2u;
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
              v19 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                BOOL v14 = v47++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_94:
          uint64_t v56 = 16;
          goto LABEL_99;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
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
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v19 |= (unint64_t)(v55 & 0x7F) << v51;
        if ((v55 & 0x80) == 0) {
          goto LABEL_96;
        }
        v51 += 7;
        BOOL v14 = v52++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_98;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_96:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_98:
      uint64_t v56 = 8;
LABEL_99:
      *(void *)(a1 + v56) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getSPSearchSuggestionResultClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getSPSearchSuggestionResultClass_softClass;
  uint64_t v7 = getSPSearchSuggestionResultClass_softClass;
  if (!getSPSearchSuggestionResultClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSPSearchSuggestionResultClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getSPSearchSuggestionResultClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7A47C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSPSearchContactEntityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getSPSearchContactEntityClass_softClass;
  uint64_t v7 = getSPSearchContactEntityClass_softClass;
  if (!getSPSearchContactEntityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSPSearchContactEntityClass_block_invoke;
    v3[3] = &unk_1E5D04E28;
    v3[4] = &v4;
    __getSPSearchContactEntityClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A7A48A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7A4AF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

Class __getSPSearchSuggestionResultClass_block_invoke(uint64_t a1)
{
  SpotlightServicesLibrary();
  Class result = objc_getClass("SPSearchSuggestionResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSPSearchSuggestionResultClass_block_invoke_cold_1();
  }
  getSPSearchSuggestionResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SpotlightServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!SpotlightServicesLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __SpotlightServicesLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5D0A580;
    uint64_t v2 = 0;
    SpotlightServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpotlightServicesLibraryCore_frameworkLibrary_0) {
    SpotlightServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __SpotlightServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpotlightServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getSPSearchContactEntityClass_block_invoke(uint64_t a1)
{
  SpotlightServicesLibrary();
  Class result = objc_getClass("SPSearchContactEntity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSPSearchContactEntityClass_block_invoke_cold_1();
  }
  getSPSearchContactEntityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXMPBBlendingCaptureRateTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v18 = 24;
          goto LABEL_38;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_42:
          *(unsigned char *)(a1 + 40) = v22 != 0;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_38;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_38:
          unint64_t v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

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
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_44;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v28) = 0;
      }
LABEL_46:
      *(_DWORD *)(a1 + 16) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getAsset()
{
  if (getAsset_onceToken != -1) {
    dispatch_once(&getAsset_onceToken, &__block_literal_global_46_0);
  }
  os_log_t v0 = (void *)getAsset_asset;

  return v0;
}

id getTrialAssets()
{
  if (getTrialAssets_onceToken != -1) {
    dispatch_once(&getTrialAssets_onceToken, &__block_literal_global_66);
  }
  os_log_t v0 = (void *)getTrialAssets_assets;

  return v0;
}

id loadLazyOrRegularPlist_0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1AD0D3C30]();
  id v15 = 0;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v1 options:1 error:&v15];
  id v4 = v15;
  if (v3)
  {
    if ((unint64_t)[v3 length] >= 3
      && ((v5 = v3, uint64_t v6 = [v5 bytes], *(_WORD *)v6 == 19536)
        ? (BOOL v7 = *(unsigned char *)(v6 + 2) == 80)
        : (BOOL v7 = 0),
          v7))
    {
      char v8 = (void *)MEMORY[0x1AD0D3C30]();
      id v14 = v4;
      unsigned int v9 = [MEMORY[0x1E4F93B50] dictionaryWithData:v5 error:&v14];
      unint64_t v10 = v14;
    }
    else
    {
      char v8 = (void *)MEMORY[0x1AD0D3C30]();
      char v13 = 0;
      unsigned int v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v13];
      unint64_t v10 = v13;
    }
    id v11 = v10;

    if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      loadLazyOrRegularPlist_cold_2_0();
    }
    id v4 = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      loadLazyOrRegularPlist_cold_1_0();
    }
    unsigned int v9 = 0;
  }

  return v9;
}

void __getAsset_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93AA8]);
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:@"/System/Library/DuetExpertCenter/Assets"];
  id v6 = [v1 pathForResource:@"Assets" ofType:@"bundle"];

  uint64_t v2 = dispatch_get_global_queue(9, 0);
  LOBYTE(v5) = 1;
  uint64_t v3 = [v0 initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.DuetExpertCenterAsset.plist" defaultBundlePath:v6 matchingKeysAndValues:0 notificationQueue:v2 logHandle:0 enableAssetUpdates:1 purgeObsoleteInstalledAssets:v5];
  id v4 = (void *)getAsset_asset;
  getAsset_asset = v3;
}

uint64_t __getTrialAssets_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = getTrialAssets_assets;
  getTrialAssets_assets = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

__CFString *NSStringForATXModeConfigurationType(uint64_t a1)
{
  if (!a1) {
    return @"allowlist";
  }
  int v1 = a1;
  if (a1 == 1) {
    return @"denylist";
  }
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    NSStringForATXModeConfigurationType_cold_1(v1, v3);
  }

  return @"unknown";
}

BOOL ATXPBNotificationPromotingSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  id v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_1A7A4ED3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A4EDBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7A4EF54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBActivityReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
          *(unsigned char *)(a1 + 72) |= 2u;
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
              goto LABEL_58;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_60;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_60:
          uint64_t v45 = 16;
          goto LABEL_69;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
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
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_64:
          *(_DWORD *)(a1 + 64) = v26;
          continue;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 24;
          goto LABEL_46;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 56;
          goto LABEL_46;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
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
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_68:
          uint64_t v45 = 8;
LABEL_69:
          *(void *)(a1 + v45) = v19;
          continue;
        case 6u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 40;
          goto LABEL_46;
        case 7u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 32;
LABEL_46:
          unsigned int v37 = *(void **)(a1 + v31);
          *(void *)(a1 + v31) = v30;

          continue;
        case 8u:
          uint64_t v38 = PBReaderReadData();
          if (v38) {
            -[ATXPBActivity addSerializedTriggers:](a1, v38);
          }

          continue;
        case 9u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)(a1 + 72) |= 8u;
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
        uint64_t v42 = *v3;
        unint64_t v43 = *(void *)(a2 + v42);
        if (v43 == -1 || v43 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
        *(void *)(a2 + v42) = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0) {
          goto LABEL_71;
        }
        v39 += 7;
        BOOL v14 = v40++ >= 9;
        if (v14)
        {
          uint64_t v41 = 0;
          goto LABEL_73;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v41 = 0;
      }
LABEL_73:
      *(unsigned char *)(a1 + 68) = v41 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *ATXUserNotificationDeliveryMethodToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"error_ATXUserNotificationDeliveryMethodTotal";
  }
  else {
    return off_1E5D0A628[a1];
  }
}

__CFString *ATXUserNotificationDeliveryUrgencyToString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E5D0A640[(int)a1];
  }

  return v1;
}

uint64_t ATXStringToUserNotificationDeliveryUrgency(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Critical"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"TimeSensitive"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Active"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Passive"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"None"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Priority"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *ATXUserNotificationAttachmentTypeToString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5D0A678[(int)a1];
  }

  return v1;
}

uint64_t ATXStringToUserNotificationAttachmentType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"None"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Image"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Audio"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Video"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Other"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *ATXUserNotificationPriorityStatusToString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5D0A6A8[(int)a1];
  }

  return v1;
}

uint64_t ATXStringToUserNotificationPriorityStatus(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"IsPriority"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"IsNotPriority"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"InferenceTimedOut"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Error"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Ineligible"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *ATXUserNotificationSummaryStatusToString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5D0A6E0[(int)a1];
  }

  return v1;
}

uint64_t ATXStringToUserNotificationSummaryStatus(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Summarized"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"InferenceTimedOut"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Error"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Ineligible"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A7A56328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t ATXMPBAppLaunchOverallCaptureRateTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
              goto LABEL_78;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_80;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_80:
          uint64_t v65 = 8;
          goto LABEL_85;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_84:
          uint64_t v65 = 12;
LABEL_85:
          *(_DWORD *)(a1 + v65) = v19;
          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)(a1 + 24) |= 0x20u;
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
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v31 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v31 = 0;
          }
LABEL_89:
          BOOL v66 = v31 != 0;
          uint64_t v67 = 19;
          goto LABEL_110;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                BOOL v14 = v36++ >= 9;
                if (v14)
                {
                  uint64_t v37 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v37 = 0;
          }
LABEL_93:
          BOOL v66 = v37 != 0;
          uint64_t v67 = 16;
          goto LABEL_110;
        case 5u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          *(unsigned char *)(a1 + 24) |= 8u;
          while (2)
          {
            uint64_t v44 = *v3;
            unint64_t v45 = *(void *)(a2 + v44);
            if (v45 == -1 || v45 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
              *(void *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  uint64_t v43 = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v43 = 0;
          }
LABEL_97:
          BOOL v66 = v43 != 0;
          uint64_t v67 = 17;
          goto LABEL_110;
        case 6u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *(unsigned char *)(a1 + 24) |= 0x10u;
          while (2)
          {
            uint64_t v50 = *v3;
            unint64_t v51 = *(void *)(a2 + v50);
            if (v51 == -1 || v51 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v14 = v48++ >= 9;
                if (v14)
                {
                  uint64_t v49 = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v49 = 0;
          }
LABEL_101:
          BOOL v66 = v49 != 0;
          uint64_t v67 = 18;
          goto LABEL_110;
        case 7u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          *(unsigned char *)(a1 + 24) |= 0x40u;
          while (2)
          {
            uint64_t v56 = *v3;
            unint64_t v57 = *(void *)(a2 + v56);
            if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
              *(void *)(a2 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v14 = v54++ >= 9;
                if (v14)
                {
                  uint64_t v55 = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v55 = 0;
          }
LABEL_105:
          BOOL v66 = v55 != 0;
          uint64_t v67 = 20;
          goto LABEL_110;
        case 8u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          *(unsigned char *)(a1 + 24) |= 0x80u;
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
        uint64_t v62 = *v3;
        unint64_t v63 = *(void *)(a2 + v62);
        if (v63 == -1 || v63 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
        *(void *)(a2 + v62) = v63 + 1;
        v61 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0) {
          goto LABEL_107;
        }
        v59 += 7;
        BOOL v14 = v60++ >= 9;
        if (v14)
        {
          uint64_t v61 = 0;
          goto LABEL_109;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_107:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v61 = 0;
      }
LABEL_109:
      BOOL v66 = v61 != 0;
      uint64_t v67 = 21;
LABEL_110:
      *(unsigned char *)(a1 + v67) = v66;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id allowedLeafIconClasses()
{
  uint64_t v0 = (void *)MEMORY[0x1AD0D3C30]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);

  return v6;
}

void sub_1A7A61714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

uint64_t ATXPBLockscreenEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          *(void *)(a1 + 8) = v20;
          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          unsigned int v30 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v29;

          continue;
        case 4u:
          uint64_t v31 = PBReaderReadString();
          if (v31) {
            -[ATXPBLockscreenEvent addSuggestionIds:](a1, v31);
          }

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
        uint64_t v25 = *v3;
        uint64_t v26 = *(void *)(a2 + v25);
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_36;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 24) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBNotificationDeliverySuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v18 = 0;
        do
        {
          uint64_t v19 = *v3;
          uint64_t v20 = *(void *)(a2 + v19);
          unint64_t v21 = v20 + 1;
          if (v20 == -1 || v21 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_66;
          }
          int v22 = *(char *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v21;
          if ((v22 & 0x80000000) == 0) {
            break;
          }
        }
        while (v18++ <= 8);
        goto LABEL_66;
      case 1u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 112;
        goto LABEL_39;
      case 2u:
        *(unsigned char *)(a1 + 120) |= 1u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 8) = v28;
        goto LABEL_66;
      case 3u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 120) |= 4u;
        while (2)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              BOOL v15 = v30++ >= 9;
              if (v15)
              {
                LODWORD(v31) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v31) = 0;
        }
LABEL_72:
        *(_DWORD *)(a1 + 56) = v31;
        goto LABEL_66;
      case 4u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
        goto LABEL_39;
      case 5u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 88;
LABEL_39:
        unsigned int v36 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_66;
      case 0xAu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 1;
        uint64_t v38 = objc_alloc_init(ATXPBNotificationSmartPauseSuggestion);
        objc_storeStrong((id *)(a1 + 80), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationSmartPauseSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xBu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 2;
        uint64_t v38 = objc_alloc_init(ATXPBNotificationQuietingSuggestion);
        objc_storeStrong((id *)(a1 + 48), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationQuietingSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xCu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 3;
        uint64_t v38 = objc_alloc_init(ATXPBNotificationPromotingSuggestion);
        objc_storeStrong((id *)(a1 + 40), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationPromotingSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xDu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 4;
        uint64_t v38 = objc_alloc_init(ATXPBInterruptionManagerTuningSuggestion);
        objc_storeStrong((id *)(a1 + 24), v38);
        if (!PBReaderPlaceMark()
          || (ATXPBInterruptionManagerTuningSuggestionReadFrom((uint64_t)v38, a2) & 1) == 0)
        {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xEu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 5;
        uint64_t v38 = objc_alloc_init(ATXPBSendToDigestSuggestion);
        objc_storeStrong((id *)(a1 + 72), v38);
        if (!PBReaderPlaceMark() || !ATXPBSendToDigestSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xFu:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 6;
        uint64_t v38 = objc_alloc_init(ATXPBUrgencyTuningSuggestion);
        objc_storeStrong((id *)(a1 + 104), v38);
        if (!PBReaderPlaceMark() || !ATXPBUrgencyTuningSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0x10u:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 7;
        uint64_t v38 = objc_alloc_init(ATXPBSendMessagesToDigestSuggestion);
        objc_storeStrong((id *)(a1 + 64), v38);
        if (!PBReaderPlaceMark() || !ATXPBSendMessagesToDigestSuggestionReadFrom((uint64_t)v38, a2)) {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0x11u:
        [(id)a1 clearOneofValuesForOneofNotificationDeliverySuggestion];
        *(unsigned char *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 8;
        uint64_t v38 = objc_alloc_init(ATXPBTurnOffNotificationsForAppSuggestion);
        objc_storeStrong((id *)(a1 + 96), v38);
        if (PBReaderPlaceMark() && ATXPBTurnOffNotificationsForAppSuggestionReadFrom((uint64_t)v38, a2))
        {
LABEL_65:
          PBReaderRecallMark();

LABEL_66:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_76:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_66;
    }
  }
}

BOOL ATXPBFaceGalleryItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 16;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id dateManipulationQueue()
{
  if (dateManipulationQueue_onceToken != -1) {
    dispatch_once(&dateManipulationQueue_onceToken, &__block_literal_global_97);
  }
  uint64_t v0 = (void *)dateManipulationQueue_dateManipulationQueue;

  return v0;
}

void swapMethodImplementations()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, "now");
  uint64_t v2 = class_getClassMethod(v0, sel__atx_now);
  method_exchangeImplementations(ClassMethod, v2);
  uint64_t v3 = class_getClassMethod(v0, sel_date);
  uint64_t v4 = class_getClassMethod(v0, sel__atx_date);
  method_exchangeImplementations(v3, v4);
  uint64_t v5 = class_getClassMethod(v0, sel_dateWithTimeIntervalSinceNow_);
  id v6 = class_getClassMethod(v0, sel__atx_dateWithTimeIntervalSinceNow_);
  method_exchangeImplementations(v5, v6);
  int v7 = class_getClassMethod(v0, sel_timeIntervalSinceReferenceDate);
  char v8 = class_getClassMethod(v0, sel__atx_timeIntervalSinceReferenceDate);
  method_exchangeImplementations(v7, v8);
  InstanceMethod = class_getInstanceMethod(v0, sel_timeIntervalSinceNow);
  unint64_t v10 = class_getInstanceMethod(v0, sel__atx_timeIntervalSinceNow);

  method_exchangeImplementations(InstanceMethod, v10);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __dateManipulationQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppPredictionClient.DateManipulationQueue", v2);
  id v1 = (void *)dateManipulationQueue_dateManipulationQueue;
  dateManipulationQueue_dateManipulationQueue = (uint64_t)v0;
}

uint64_t ATXPBInterruptionManagerTuningSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

id ATXNotificationCategorizationXPCInterface()
{
  v37[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFDFDA78];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_rankUserNotificationWithRequest_completion_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  id v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_rankUserNotificationWithRequest_completion_ argumentIndex:0 ofReply:1];

  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  unsigned int v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_collectDynamicBreakthroughFeaturesForNotification_completion_ argumentIndex:0 ofReply:0];

  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  unint64_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_collectDynamicBreakthroughFeaturesForNotification_completion_ argumentIndex:0 ofReply:1];

  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  int v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_collectCoreAnalyticsJsonForNotification_completion_ argumentIndex:0 ofReply:0];

  int v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  unsigned int v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_collectCoreAnalyticsJsonForNotification_completion_ argumentIndex:0 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v20 forSelector:sel_fetchContextForNotificationWithRequest_completion_ argumentIndex:0 ofReply:0];

  unint64_t v21 = (void *)MEMORY[0x1AD0D3C30]();
  char v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v22 forSelector:sel_fetchContextForNotificationWithRequest_completion_ argumentIndex:0 ofReply:1];

  unsigned int v23 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v24 forSelector:sel_fetchContextForMailWithRequest_completion_ argumentIndex:0 ofReply:0];

  uint64_t v25 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v26 forSelector:sel_fetchContextForMailWithRequest_completion_ argumentIndex:0 ofReply:1];

  unint64_t v27 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v28 forSelector:sel_fetchContextForMessageWithRequest_completion_ argumentIndex:0 ofReply:0];

  char v29 = (void *)MEMORY[0x1AD0D3C30]();
  unsigned int v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v30 forSelector:sel_fetchContextForMessageWithRequest_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1A7A6C900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_1A7A6CCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

id ATXSlotSetsSerialize(void *a1, void *a2)
{
  v103[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  context = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v5 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v6 = v4;
  obuint64_t j = v6;
  id v74 = (id)[v6 countByEnumeratingWithState:&v94 objects:v102 count:16];
  id v66 = v3;
  if (!v74)
  {
    int v67 = 0;
    uint64_t v8 = 8;
    goto LABEL_26;
  }
  id v7 = 0;
  int v67 = 0;
  uint64_t v71 = *(void *)v95;
  uint64_t v8 = 8;
  do
  {
    unsigned int v9 = 0;
    unint64_t v10 = v7;
    do
    {
      if (*(void *)v95 != v71) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(id *)(*((void *)&v94 + 1) + 8 * (void)v9);

      ++v8;
      uint64_t v11 = [v7 parameters];

      if (v11)
      {
        unint64_t v12 = [v7 parameters];
        v8 += [v12 count];

        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        char v13 = [v7 parameters];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v90 objects:v101 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v91;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v91 != v16) {
                objc_enumerationMutation(v13);
              }
              unsigned int v18 = *(void **)(*((void *)&v90 + 1) + 8 * i);
              uint64_t v19 = [v5 count];
              [v5 addObject:v18];
              if (v19 != [v5 count]) {
                v8 += strlen((const char *)[v18 UTF8String]);
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v90 objects:v101 count:16];
          }
          while (v15);
        }
      }
      else
      {
        int v67 = 1;
      }
      uint64_t v20 = [v7 uuid];

      if (v20) {
        v8 += 16;
      }
      unsigned int v9 = (char *)v9 + 1;
      unint64_t v10 = v7;
    }
    while (v9 != v74);
    id v74 = (id)[obj countByEnumeratingWithState:&v94 objects:v102 count:16];
  }
  while (v74);

  if (v67)
  {
    if ([obj count] != 1)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NSData * _Nullable ATXSlotSetsSerialize(ATXAction *__strong _Nonnull, NSSet<ATXSlotSet *> *__strong _Nonnull)");
      [v6 handleFailureInFunction:v21 file:@"ATXSlotSet.m" lineNumber:182 description:@"If there is an opaque slot set then it can be the only slot set in the set of slot sets. There cannot be an opaque slot set amongst other slot sets. This fact is leveraged in the deserialization code."];

      id v3 = v66;
LABEL_26:

      goto LABEL_29;
    }
  }
  else
  {
    int v67 = 0;
  }
  id v3 = v66;
LABEL_29:
  uint64_t v22 = [v5 count];
  unsigned int v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if ((unint64_t)[v5 count] >= 0xFF)
  {
    unint64_t v63 = [MEMORY[0x1E4F28B00] currentHandler];
    char v64 = objc_msgSend(NSString, "stringWithUTF8String:", "NSData * _Nullable ATXSlotSetsSerialize(ATXAction *__strong _Nonnull, NSSet<ATXSlotSet *> *__strong _Nonnull)");
    [v63 handleFailureInFunction:v64, @"ATXSlotSet.m", 189, @"Invalid parameter not satisfying: %@", @"referencedParams.count < UINT8_MAX" file lineNumber description];
  }
  uint64_t v24 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v25 = (void *)MEMORY[0x1AD0D3C30]();
  id v89 = 0;
  uint64_t v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v89];
  id v27 = v89;
  if (v26)
  {
    uint64_t v28 = [v26 length] - 8;
    char v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v8 + 2 * v22 + v28];
    LODWORD(v103[0]) = 0;
    [v29 appendBytes:v103 length:4];
    LODWORD(v103[0]) = [v5 count] | ((v28 & 0x7FFFFF) << 8) | (v67 << 31);
    [v29 appendBytes:v103 length:4];
    id v30 = v26;
    objc_msgSend(v29, "appendBytes:length:", objc_msgSend(v30, "bytes") + 8, v28);

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v75 = v5;
    uint64_t v31 = [v75 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = 0;
      uint64_t v34 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v86 != v34) {
            objc_enumerationMutation(v75);
          }
          uint64_t v36 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          uint64_t v37 = [NSNumber numberWithUnsignedInteger:v33 + j];
          [v23 setObject:v37 forKeyedSubscript:v36];

          id v38 = v36;
          id v39 = v29;
          char v40 = (const char *)[v38 UTF8String];
          size_t v41 = strlen(v40);
          __int16 v42 = v41;
          if (v41 >= 0xFFFF)
          {
            unsigned int v72 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(NSString, "stringWithUTF8String:", "void appendStr(NSMutableData *__strong, NSString *__strong)");
            id v68 = (id)objc_claimAutoreleasedReturnValue();
            [v72 handleFailureInFunction:v68, @"ATXSlotSet.m", 117, @"Invalid parameter not satisfying: %@", @"len < UINT16_MAX" file lineNumber description];
          }
          LOWORD(v103[0]) = v42;
          [v39 appendBytes:v103 length:2];
          [v39 appendBytes:v40 length:strlen(v40)];
        }
        uint64_t v32 = [v75 countByEnumeratingWithState:&v85 objects:v100 count:16];
        v33 += j;
      }
      while (v32);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v69 = obj;
    id v76 = (id)[v69 countByEnumeratingWithState:&v81 objects:v99 count:16];
    if (v76)
    {
      id v43 = 0;
      uint64_t v73 = *(void *)v82;
      do
      {
        uint64_t v44 = 0;
        unint64_t v45 = v43;
        do
        {
          if (*(void *)v82 != v73) {
            objc_enumerationMutation(v69);
          }
          id v43 = *(id *)(*((void *)&v81 + 1) + 8 * (void)v44);

          char v46 = [v43 uuid];

          char v47 = [v43 parameters];
          char v48 = [v47 count];

          LOBYTE(v103[0]) = v48 | ((v46 != 0) << 7);
          [v29 appendBytes:v103 length:1];
          if (v46)
          {
            uint64_t v49 = [v43 uuid];
            v103[0] = 0;
            v103[1] = 0;
            id v50 = v29;
            [v49 getUUIDBytes:v103];
            [v50 appendBytes:v103 length:16];
          }
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          unint64_t v51 = [v43 parameters];
          uint64_t v52 = [v51 countByEnumeratingWithState:&v77 objects:v98 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v78;
            do
            {
              for (uint64_t k = 0; k != v53; ++k)
              {
                if (*(void *)v78 != v54) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v56 = [v23 objectForKeyedSubscript:*(void *)(*((void *)&v77 + 1) + 8 * k)];
                LOBYTE(v103[0]) = [v56 unsignedCharValue];
                [v29 appendBytes:v103 length:1];
              }
              uint64_t v53 = [v51 countByEnumeratingWithState:&v77 objects:v98 count:16];
            }
            while (v53);
          }

          uint64_t v44 = (char *)v44 + 1;
          unint64_t v45 = v43;
        }
        while (v44 != v76);
        id v76 = (id)[v69 countByEnumeratingWithState:&v81 objects:v99 count:16];
      }
      while (v76);
    }
    id v57 = v29;
    int v58 = adler32(0, (const Bytef *)([v57 bytes] + 4), objc_msgSend(v57, "length") - 4);
    id v59 = v57;
    *(_DWORD *)[v59 mutableBytes] = v58;
    unsigned int v60 = (void *)[v59 copy];

    id v3 = v66;
  }
  else
  {
    uint64_t v61 = __atxlog_handle_default();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      ATXSlotSetsSerialize_cold_1((uint64_t)v3, (uint64_t)v27, v61);
    }

    unsigned int v60 = 0;
  }

  return v60;
}

id ATXSlotSetsDeserialize(void *a1, void **a2)
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = [v3 length];
  int v6 = adler32(0, (const Bytef *)(v4 + 4), [v3 length] - 4);
  if ((v5 & 0x8000000000000000) != 0 || v5 < 4) {
    goto LABEL_3;
  }
  int v9 = v6;
  int v10 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 != v6)
  {
    unint64_t v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ATXSlotSetsDeserialize_cold_3(v10, v9, v12);
    }
    id v7 = 0;
    goto LABEL_50;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || v5 < 8
    || (v64 = *(unsigned int *)(v4 + 4), unint64_t v11 = (v64 >> 8) & 0x7FFFFF, v5 - 8 < v11))
  {
LABEL_3:
    id v7 = 0;
    goto LABEL_4;
  }
  unint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:(v11 + 8)];
  [v12 appendBytes:"bplist00" length:8];
  char v13 = (void *)MEMORY[0x1AD0D3C30]([v12 appendBytes:v4 + 8 length:v11]);
  id v65 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v65];
  id v15 = v65;
  if (v14)
  {
    unsigned int v60 = v14;
    unint64_t v16 = v4 + v5;
    char v17 = (unsigned __int16 *)(v4 + 8 + v11);
    int v18 = v64;
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v64];
    id v59 = v15;
    if ((_BYTE)v64)
    {
      while (1)
      {
        if (v16 < (unint64_t)v17
          || v16 - (unint64_t)v17 < 2
          || ((v22 = *v17, v21 = v17 + 1, (int64_t v20 = v22) != 0) ? (v23 = (unint64_t)v21 > v16) : (v23 = 1),
              v23 || (uint64_t)(v16 - (void)v21) < v20))
        {
          id v7 = 0;
          id v15 = v59;
          uint64_t v14 = v60;
          goto LABEL_65;
        }
        uint64_t v24 = [[NSString alloc] initWithBytes:v21 length:v20 encoding:4];
        if (!v24) {
          break;
        }
        uint64_t v25 = (void *)v24;
        char v17 = (unsigned __int16 *)((char *)v21 + v20);
        [v19 addObject:v24];

        if (!--v18) {
          goto LABEL_22;
        }
      }
      uint64_t v14 = v60;
      if (a2)
      {
        uint64_t v66 = *MEMORY[0x1E4F28568];
        v67[0] = @"Error decoding action parameters";
        uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
        uint64_t v55 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXActionDeserialization" code:1 userInfo:v54];
        uint64_t v56 = *a2;
        *a2 = (void *)v55;
      }
      id v27 = __atxlog_handle_default();
      id v15 = v59;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        ATXSlotSetsDeserialize_cold_2(v27);
      }
      id v7 = 0;
      goto LABEL_64;
    }
LABEL_22:
    uint64_t v26 = objc_opt_new();
    id v27 = v26;
    if ((unint64_t)v17 >= v16)
    {
LABEL_45:
      id v49 = objc_alloc(MEMORY[0x1E4F93BB8]);
      id v50 = [v27 copy];
      unint64_t v51 = v49;
      uint64_t v14 = v60;
      id v7 = (void *)[v51 initWithFirst:v60 second:v50];

LABEL_46:
      id v15 = v59;
LABEL_64:

      goto LABEL_65;
    }
    unsigned int v28 = v64;
    char v29 = (char *)v17;
    uint64_t v62 = v26;
    unint64_t v63 = v19;
    while (1)
    {
      int v30 = *v29++;
      unsigned int v31 = v30;
      if (v30 < 0)
      {
        if (v16 - (unint64_t)v29 < 0x10)
        {
          id v7 = 0;
          uint64_t v14 = v60;
          goto LABEL_46;
        }
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v29];
        char v29 = (char *)v17 + 17;
        v31 &= 0x7Fu;
      }
      else
      {
        uint64_t v32 = 0;
      }
      if ((v64 & 0x80000000) != 0 && !v31) {
        break;
      }
      if (!v31)
      {
        unint64_t v45 = [ATXSlotSet alloc];
        uint64_t v33 = (ATXSlotSet *)objc_opt_new();
        char v46 = [(ATXSlotSet *)v45 initWithParameters:v33 uuid:v32];
        char v47 = v62;
        [v62 addObject:v46];

        id v27 = v47;
        goto LABEL_39;
      }
      uint64_t v61 = &v57;
      uint64_t v34 = v31;
      MEMORY[0x1F4188790]();
      uint64_t v36 = (char *)&v57 - v35;
      bzero((char *)&v57 - v35, v37);
      int v38 = 0;
      if (v16 >= (unint64_t)v29 && (uint64_t)(v16 - (void)v29) >= v31)
      {
        uint64_t v39 = 0;
        char v40 = v63;
        while (1)
        {
          uint64_t v41 = v39;
          if (v29[v39] >= v28) {
            break;
          }
          uint64_t v42 = objc_msgSend(v40, "objectAtIndexedSubscript:");
          id v43 = *(void **)&v36[8 * v41];
          *(void *)&v36[8 * v41] = v42;

          uint64_t v39 = v41 + 1;
          if (v34 == v41 + 1)
          {
            int v58 = [ATXSlotSet alloc];
            uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v36 count:v34];
            int v58 = [(ATXSlotSet *)v58 initWithParameters:v44 uuid:v32];
            [v62 addObject:v58];

            v29 += v41 + 1;
            int v38 = 1;
            goto LABEL_41;
          }
        }
        int v38 = 0;
        v29 += v39 + 1;
      }
LABEL_41:
      uint64_t v48 = 8 * v34;
      do
      {

        v48 -= 8;
      }
      while (v48);

      id v27 = v62;
      if (!v38)
      {
        id v7 = 0;
        id v15 = v59;
        uint64_t v14 = v60;
        uint64_t v19 = v63;
        goto LABEL_64;
      }
LABEL_44:
      char v17 = (unsigned __int16 *)v29;
      uint64_t v19 = v63;
      if ((unint64_t)v29 >= v16) {
        goto LABEL_45;
      }
    }
    uint64_t v33 = [[ATXSlotSet alloc] initWithOpaqueParametersUuid:v32];
    [v27 addObject:v33];
LABEL_39:

    goto LABEL_44;
  }
  uint64_t v52 = __atxlog_handle_default();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    ATXSlotSetsDeserialize_cold_1((uint64_t)v15, v52);
  }

  if (a2)
  {
    id v53 = v15;
    id v7 = 0;
    uint64_t v19 = *a2;
    *a2 = v53;
LABEL_65:

    goto LABEL_66;
  }
  id v7 = 0;
LABEL_66:

LABEL_50:
LABEL_4:

  return v7;
}

void __getAVRoutingSessionManagerClass_block_invoke_cold_1()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAVRoutingSessionManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXAVFoundationWrapper.m", 15, @"Unable to find class %s", "AVRoutingSessionManager");

  __break(1u);
}

void AVFoundationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *AVFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXAVFoundationWrapper.m", 14, @"%s", *a1);

  __break(1u);
}

void __getAVOutputDeviceClass_block_invoke_cold_1()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAVOutputDeviceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXAVFoundationWrapper.m", 26, @"Unable to find class %s", "AVOutputDevice");

  __break(1u);
}

void loadLazyOrRegularPlist_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v0, v1, "Error loading plist %@: %@");
}

void loadLazyOrRegularPlist_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v0, v1, "Error parsing plist %@: %@");
}

void ATXUnarchiverZip()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2(&dword_1A790D000, v1, v2, "ATXUnarchiver: unable to open file %@ - %{public}s.", v3, v4, v5, v6, 2u);
}

{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "ATXUnarchiver: unable to open non-file URL %@.", v1, 0xCu);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to free archive_read (leaking) - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to close archive_read - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to open archive_read - %{public}s.", v2, v3, v4, v5, v6);
}

void ATXUnarchiverZip(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __error();
  id v7 = strerror(*v6);
  v8[0] = 67240706;
  v8[1] = a2;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2082;
  unint64_t v12 = v7;
  _os_log_fault_impl(&dword_1A790D000, a3, OS_LOG_TYPE_FAULT, "ATXUnarchiver: unable to close file descriptor %{public}d for %@ (leaking) - %{public}s.", (uint8_t *)v8, 0x1Cu);
}

void PPCreateReadArchive_cold_1()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to free archive_read (leaking) - %{public}s.", v2, v3, v4, v5, v6);
}

void PPCreateReadArchive_cold_2()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_read unable to set supported compression formats - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_1()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to free archive_write_disk (leaking) - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_2()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: unable to close archive_write_disk - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_3()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_read_next_header failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXUnarchiver: archive_entry with no path encountered.", v1, 2u);
}

void PPZipUnarchive_cold_5()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_read_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_6()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_write_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_7(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXUnarchiver: archive_entry with no path after sanitization encountered.", v1, 2u);
}

void PPZipUnarchive_cold_8()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2(&dword_1A790D000, v1, v2, "ATXUnarchiver: unable to resolve physical path for destination path %@ - %s.", v3, v4, v5, v6, 2u);
}

void PPZipUnarchive_cold_10()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_write_disk unable to set options - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_11()
{
  archive_error_string();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v0, v1, "ATXUnarchiver: archive_write_disk unable to set lookup functions - %{public}s.", v2, v3, v4, v5, v6);
}

void PPZipUnarchive_cold_12()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "ATXUnarchiver: failed to create directory at %@ - %@.", v2, 0x16u);
}

void NSStringForATXWidgetEngagementType_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "invalid input ATXWidgetEngagementType: %d", (uint8_t *)v2, 8u);
}

void _decodeOrFail_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "Unable to decode %@ for ATXAction: %@", v2, 0x16u);
}

void _decodeOrFail_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to decode %@ for ATXAction - found nil object but required nonnull", v2, v3, v4, v5, v6);
}

void NSStringForATXHomeScreenWidgetExplicitFeedback_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "invalid input ATXHomeScreenWidgetExplicitFeedback: %d", (uint8_t *)v2, 8u);
}

void NSStringForATXHomeScreenStackChangeReason_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "invalid input ATXHomeScreenStackChangeReason: %d", (uint8_t *)v2, 8u);
}

void getMGBool_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"_Bool _MGGetBoolAnswer(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionCriteria.m", 27, @"%s", dlerror());

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *libMobileGestaltLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXActionCriteria.m", 26, @"%s", *a1);

  __break(1u);
}

void AppPredictionUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppPredictionUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXActionSearchResult.m", 62, @"%s", *a1);

  __break(1u);
}

void __getCRSCardRequestClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXActionSearchResult.m", 58, @"%s", *a1);

  __break(1u);
}

void __getCRSCardRequestClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCRSCardRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionSearchResult.m", 59, @"Unable to find class %s", "CRSCardRequest");

  __break(1u);
}

void __getATXProactiveSuggestionBuilderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getATXProactiveSuggestionBuilderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionSearchResult.m", 396, @"Unable to find class %s", "ATXProactiveSuggestionBuilder");

  __break(1u);
}

void AppPredictionInternalLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppPredictionInternalLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXActionSearchResult.m", 394, @"%s", *a1);

  __break(1u);
}

void ATXUserEducationSuggestionTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "NSString * _Nonnull ATXUserEducationSuggestionTypeToString(ATXUserEducationSuggestionType)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized suggestionType: %ld", (uint8_t *)&v2, 0x16u);
}

void removeCacheFile_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to remove recent engagement cache: %@", v2, v3, v4, v5, v6);
}

void ATXUserEducationSuggestionEventTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "NSString * _Nonnull ATXUserEducationSuggestionEventTypeToString(ATXUserEducationSuggestionEventType)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized eventType: %ld", (uint8_t *)&v2, 0x16u);
}

void ATXUserEducationSuggestionFeedbackTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "NSString * _Nonnull ATXUserEducationSuggestionFeedbackTypeToString(ATXUserEducationSuggestionFeedbackType)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized feedbackType: %ld", (uint8_t *)&v2, 0x16u);
}

void ATXExecutableIdentifierForSuggestion_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: The executable object is missing. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXAction but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting a NSString but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXHeroData but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXInfoSuggestion but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXLinkActionContainer but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
}

void ATXExecutableIdentifierForSuggestion_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXExecutableIdentifierForSuggestion: unsupported class: %@", (uint8_t *)&v2, 0xCu);
}

void personFromCallRecipient_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "Using EmailAddress person handle type for handle: %@", v2, v3, v4, v5, v6);
}

void personFromCallRecipient_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "Using PhoneNumber person handle type for handle: %@", v2, v3, v4, v5, v6);
}

void loadIntentWithBundleIdAndName_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v0, v1, "Unable to load extension with bundle ID: %{public}@, %@");
}

void loadIntentWithBundleIdAndName_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Unable to load schema for bundle: '%@'", v1, 0xCu);
}

void loadIntentWithBundleIdAndName_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v0, v1, "Unable to initialize intent with name: '%{public}@' and schema: '%@'");
}

void __getMTUpdateAlarmIntentClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getMTUpdateAlarmIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXAction+Factory.m", 29, @"Unable to find class %s", "MTUpdateAlarmIntent");

  __break(1u);
}

void MobileTimerLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MobileTimerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXAction+Factory.m", 27, @"%s", *a1);

  __break(1u);
}

void __getMTCreateAlarmIntentClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getMTCreateAlarmIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXAction+Factory.m", 28, @"Unable to find class %s", "MTCreateAlarmIntent");

  __break(1u);
}

void ATXStringForStackLayoutSize_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXStringForStackLayoutSize: unknown ATXStackLayoutSize provided", v1, 2u);
}

void ATXCAStringForStackLayoutSize_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXCAStringForStackLayoutSize: unknown ATXStackLayoutSize provided", v1, 2u);
}

void ATXStackLayoutSizeForNSString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXStringForStackLayoutSize: unknown string provided: %@", (uint8_t *)&v2, 0xCu);
}

void __getAVSystemControllerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MediaExperienceLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXAVRoutingUtils.m", 17, @"%s", *a1);

  __break(1u);
}

void __getAVSystemControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getAVSystemControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXAVRoutingUtils.m", 18, @"Unable to find class %s", "AVSystemController");

  __break(1u);
}

void __getINUISearchFoundationImageAdapterClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IntentsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXSpotlightClient.m", 53, @"%s", *a1);

  __break(1u);
}

void __getINUISearchFoundationImageAdapterClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getINUISearchFoundationImageAdapterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXSpotlightClient.m", 54, @"Unable to find class %s", "INUISearchFoundationImageAdapter");

  __break(1u);
}

void __getSPSearchSuggestionResultClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getSPSearchSuggestionResultClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXSpotlightHidingUIController.m", 36, @"Unable to find class %s", "SPSearchSuggestionResult");

  __break(1u);
}

void SpotlightServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpotlightServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXSpotlightHidingUIController.m", 35, @"%s", *a1);

  __break(1u);
}

void __getSPSearchContactEntityClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getSPSearchContactEntityClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXSpotlightHidingUIController.m", 37, @"Unable to find class %s", "SPSearchContactEntity");

  __break(1u);
}

void loadLazyOrRegularPlist_cold_1_0()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error loading plist %@: %@", v0, 0x16u);
}

void loadLazyOrRegularPlist_cold_2_0()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error parsing plist %@: %@", v0, 0x16u);
}

void NSStringForATXModeConfigurationType_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Invalid input passed to NSStringForATXModeConfigurationType: %d", (uint8_t *)v2, 8u);
}

void ATXSlotSetsSerialize_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Error serializing action %@: %@", (uint8_t *)&v3, 0x16u);
}

void ATXSlotSetsDeserialize_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Error decoding: %@", (uint8_t *)&v2, 0xCu);
}

void ATXSlotSetsDeserialize_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Error decoding parameters.", v1, 2u);
}

void ATXSlotSetsDeserialize_cold_3(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Checksum mismatch: found %u, computed %u", (uint8_t *)v3, 0xEu);
}

uint64_t ATXActivityTypeToString()
{
  return MEMORY[0x1F4145F30]();
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId()
{
  return MEMORY[0x1F4108F68]();
}

uint64_t ATXBundleIdReplacementForBundleIdWithWebpageURLHint()
{
  return MEMORY[0x1F4108F78]();
}

uint64_t ATXCacheFileRead()
{
  return MEMORY[0x1F4108F88]();
}

uint64_t ATXCacheFileSplitChunks()
{
  return MEMORY[0x1F4108F90]();
}

uint64_t ATXCacheFileWrite()
{
  return MEMORY[0x1F4108F98]();
}

uint64_t ATXCreateProactiveSuggestionClientModelXPCInterface()
{
  return MEMORY[0x1F4146058]();
}

uint64_t ATXDeserializeTriggers()
{
  return MEMORY[0x1F4145F38]();
}

uint64_t ATXDetailedActionLoggingEnabled()
{
  return MEMORY[0x1F4108FA8]();
}

uint64_t ATXPBHeroAppPredictionReadFrom()
{
  return MEMORY[0x1F4121790]();
}

uint64_t ATXPBInfoSuggestionReadFrom()
{
  return MEMORY[0x1F4146068]();
}

uint64_t ATXSerializeTriggers()
{
  return MEMORY[0x1F4145F50]();
}

uint64_t ATXSpecialWidgetKindAppPredictions()
{
  return MEMORY[0x1F4108FC0]();
}

uint64_t ATXSpecialWidgetKindFiles()
{
  return MEMORY[0x1F4108FC8]();
}

uint64_t ATXSpecialWidgetKindShortcutsFolder()
{
  return MEMORY[0x1F4108FD0]();
}

uint64_t ATXSpecialWidgetKindShortcutsSingle()
{
  return MEMORY[0x1F4108FD8]();
}

uint64_t ATXSpecialWidgetKindSiriSuggestions()
{
  return MEMORY[0x1F4108FE0]();
}

uint64_t ATXSuggestionPredictionReasonEnumerateReasonCodes()
{
  return MEMORY[0x1F4146070]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BMInferredModeTypeToActivity()
{
  return MEMORY[0x1F4145F58]();
}

uint64_t BMUserFocusInferredModeOriginToLegacy()
{
  return MEMORY[0x1F4145F68]();
}

uint64_t BMUserFocusInferredModeTypeToActivity()
{
  return MEMORY[0x1F4145F80]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8B8](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CHSWidgetFamilyFromString()
{
  return MEMORY[0x1F4111790]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

uint64_t CHSWidgetFamilyMaskContainsFamily()
{
  return MEMORY[0x1F41117A8]();
}

uint64_t CHSWidgetFamilyMaskEnumerateFamilies()
{
  return MEMORY[0x1F41117B8]();
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1F41117C0]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DNDModeLocalizedNameForSemanticType()
{
  return MEMORY[0x1F41175D8]();
}

uint64_t DNDModeSemanticTypeToString()
{
  return MEMORY[0x1F41175E0]();
}

uint64_t INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity()
{
  return MEMORY[0x1F40E9AA0]();
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x1F40E9B10]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFixed64Field()
{
  return MEMORY[0x1F41471D0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1F415C308]();
}

uint64_t WFContextualActionIconDisplayStyleForLNImageDisplayStyle()
{
  return MEMORY[0x1F4168020]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x1F40DEE98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BA0](adler, buf, *(void *)&len);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1F417DFE8]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x1F417E008]();
}

uint64_t archive_entry_perm()
{
  return MEMORY[0x1F417E010]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1F417E060]();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return MEMORY[0x1F417E070]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1F417E098]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1F417E0A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_fd()
{
  return MEMORY[0x1F417E138]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1F417E158]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1F417E1A0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1F417E1D0]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1F417E1E0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1F417E1E8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1F417E1F0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E1F8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1F417E200]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t stringForATXSuggestionPredictionReasonCode()
{
  return MEMORY[0x1F4146078]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}