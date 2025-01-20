id SWFrameworkBundle()
{
  void *v0;
  uint64_t vars8;

  if (SWFrameworkBundle_onceToken != -1) {
    dispatch_once(&SWFrameworkBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)SWFrameworkBundle_sBundle;

  return v0;
}

uint64_t __SWFrameworkBundle_block_invoke()
{
  SWFrameworkBundle_sBundle = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.SharedWithYou"];

  return MEMORY[0x1F41817F8]();
}

id SWCoreFrameworkBundle()
{
  if (SWCoreFrameworkBundle_onceToken != -1) {
    dispatch_once(&SWCoreFrameworkBundle_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)SWCoreFrameworkBundle_sBundle;

  return v0;
}

uint64_t __SWCoreFrameworkBundle_block_invoke()
{
  SWCoreFrameworkBundle_sBundle = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.SharedWithYouCore"];

  return MEMORY[0x1F41817F8]();
}

void sub_18C0E7EBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C0E8058(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SWFileProviderCollaborationProvidingInterface()
{
  if (SWFileProviderCollaborationProvidingInterface_once != -1) {
    dispatch_once(&SWFileProviderCollaborationProvidingInterface_once, &__block_literal_global_0);
  }
  v0 = (void *)SWFileProviderCollaborationProvidingInterface_interface;

  return v0;
}

id SWFileProviderCollaborationProvidingInterfaceEntitled()
{
  if (SWFileProviderCollaborationProvidingInterfaceEntitled_once != -1) {
    dispatch_once(&SWFileProviderCollaborationProvidingInterfaceEntitled_once, &__block_literal_global_129);
  }
  v0 = (void *)SWFileProviderCollaborationProvidingInterfaceEntitled_interface;

  return v0;
}

void SWCollaborationMetadataForDocumentURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __SWCollaborationMetadataForDocumentURL_block_invoke;
  v7[3] = &unk_1E54D8478;
  id v8 = v3;
  id v9 = v4;
  id v5 = v3;
  id v6 = v4;
  withServiceProxy(v5, @"com.apple.SocialServices.MessagesCollaborationService", v7);
}

void withServiceProxy(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  id v8 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __withServiceProxy_block_invoke;
  v11[3] = &unk_1E54D84F0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  [v8 synchronouslyGetFileProviderServiceWithName:v9 forItemAtURL:v7 completionHandler:v11];
}

void __SWCollaborationMetadataForDocumentURL_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __SWCollaborationMetadataForDocumentURL_block_invoke_2;
    v8[3] = &unk_1E54D8450;
    id v9 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    id v10 = 0;
    id v11 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v7 collaborationMetadataWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

void __SWCollaborationMetadataForDocumentURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __SWCollaborationMetadataForDocumentURL_block_invoke_2_cold_1(a1, v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void SWPerformActionForDocumentURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __SWPerformActionForDocumentURL_block_invoke;
  v11[3] = &unk_1E54D84A0;
  id v13 = v6;
  id v14 = v7;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  id v10 = v7;
  withServiceProxy(v9, @"com.apple.SocialServices.MessagesCollaborationService.Entitled", v11);
}

void __SWPerformActionForDocumentURL_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __SWPerformActionForDocumentURL_block_invoke_2;
    v8[3] = &unk_1E54D8450;
    id v9 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    id v10 = 0;
    id v11 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v7 performAction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

void __SWPerformActionForDocumentURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __SWPerformActionForDocumentURL_block_invoke_2_cold_1(a1, v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __SWFileProviderCollaborationProvidingInterface_block_invoke()
{
  SWFileProviderCollaborationProvidingInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9A3718];

  return MEMORY[0x1F41817F8]();
}

uint64_t __SWFileProviderCollaborationProvidingInterfaceEntitled_block_invoke()
{
  SWFileProviderCollaborationProvidingInterfaceEntitled_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9A37B0];

  return MEMORY[0x1F41817F8]();
}

void __withServiceProxy_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __withServiceProxy_block_invoke_2;
    v9[3] = &unk_1E54D84C8;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v5 getFileProviderConnectionWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __withServiceProxy_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if ([v5 isEqualToString:@"com.apple.SocialServices.MessagesCollaborationService.Entitled"])SWFileProviderCollaborationProvidingInterfaceEntitled(); {
  else
  }
  uint64_t v7 = SWFileProviderCollaborationProvidingInterface();
  [v10 setRemoteObjectInterface:v7];

  [v10 resume];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v10 remoteObjectProxy];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id getSLCollaborationSigningControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSLCollaborationSigningControllerClass_softClass;
  uint64_t v7 = getSLCollaborationSigningControllerClass_softClass;
  if (!getSLCollaborationSigningControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSLCollaborationSigningControllerClass_block_invoke;
    v3[3] = &unk_1E54D8548;
    v3[4] = &v4;
    __getSLCollaborationSigningControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18C0E9114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationSigningControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SocialLayerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E54D8568;
    uint64_t v5 = 0;
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SocialLayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSLCollaborationSigningControllerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SLCollaborationSigningController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSLCollaborationSigningControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SWCollaborationClearNoticeTransmissionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
        if (v17) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = (v10 & 7) == 4;
        }
        if (!v18)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v19 = 0;
              unsigned int v20 = 0;
              uint64_t v21 = 0;
              break;
            case 2u:
              uint64_t v27 = PBReaderReadString();
              uint64_t v28 = 24;
              goto LABEL_30;
            case 3u:
              uint64_t v27 = PBReaderReadString();
              uint64_t v28 = 16;
LABEL_30:
              v29 = *(void **)(a1 + v28);
              *(void *)(a1 + v28) = v27;

              goto LABEL_40;
            case 4u:
              uint64_t v30 = *v3;
              unint64_t v31 = *(void *)(a2 + v30);
              if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v31);
                *(void *)(a2 + v30) = v31 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + v16) = 1;
                uint64_t v32 = 0;
              }
              *(void *)(a1 + 8) = v32;
              goto LABEL_40;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_40:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
          *(_DWORD *)(a1 + 32) = v21;
          goto LABEL_40;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SWCollaborationNoticeTransmissionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
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
              goto LABEL_42;
            }
            v19 += 7;
            BOOL v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_44;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_44:
          *(_DWORD *)(a1 + 40) = v21;
          continue;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 24;
          goto LABEL_30;
        case 3u:
          uint64_t v27 = PBReaderReadData();
          uint64_t v28 = 32;
LABEL_30:
          v29 = *(void **)(a1 + v28);
          *(void *)(a1 + v28) = v27;

          continue;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          break;
        case 5u:
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v39 = *(void *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v39 = 0;
          }
          *(void *)(a1 + 8) = v39;
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
        uint64_t v33 = *v3;
        uint64_t v34 = *(void *)(a2 + v33);
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_46;
        }
        v30 += 7;
        BOOL v15 = v31++ >= 9;
        if (v15)
        {
          uint64_t v32 = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v32 = 0;
      }
LABEL_48:
      *(void *)(a1 + 16) = v32;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getSLPersonClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSLPersonClass_softClass;
  uint64_t v7 = getSLPersonClass_softClass;
  if (!getSLPersonClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSLPersonClass_block_invoke;
    v3[3] = &unk_1E54D8548;
    v3[4] = &v4;
    __getSLPersonClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18C0EF52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLPersonClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SocialLayerLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SocialLayerLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E54D85D0;
    uint64_t v6 = 0;
    SocialLayerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SocialLayerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SLPerson");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSLPersonClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSLPersonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLayerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SWGeneralTelemetryLogHandle()
{
  if (SWGeneralTelemetryLogHandle_onceToken != -1) {
    dispatch_once(&SWGeneralTelemetryLogHandle_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)SWGeneralTelemetryLogHandle_osLog;

  return v0;
}

uint64_t __SWGeneralTelemetryLogHandle_block_invoke()
{
  SWGeneralTelemetryLogHandle_osLog = (uint64_t)os_log_create("com.apple.SharedWithYou.telemetry", "General");

  return MEMORY[0x1F41817F8]();
}

id SWFrameworkLogHandle()
{
  if (SWFrameworkLogHandle_onceToken != -1) {
    dispatch_once(&SWFrameworkLogHandle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SWFrameworkLogHandle_osLog;

  return v0;
}

uint64_t __SWFrameworkLogHandle_block_invoke()
{
  SWFrameworkLogHandle_osLog = (uint64_t)os_log_create("com.apple.SharedWithYou", "General");

  return MEMORY[0x1F41817F8]();
}

id SWShareableContentLogHandle()
{
  if (SWShareableContentLogHandle_onceToken != -1) {
    dispatch_once(&SWShareableContentLogHandle_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)SWShareableContentLogHandle_osLog;

  return v0;
}

uint64_t __SWShareableContentLogHandle_block_invoke()
{
  SWShareableContentLogHandle_osLog = (uint64_t)os_log_create("com.apple.SharedWithYou", "ShareableContent");

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_18C0F1EEC(void *a1)
{
  sub_18C0F20D4();
  id v3 = v1;
  uint64_t v4 = NSStringFromSelector(sel_collaborationIdentifier);
  sub_18C0F2628();

  long long v5 = (void *)sub_18C0F2648();
  swift_bridgeObjectRelease();
  if (v5)
  {
    uint64_t v7 = 0;
    sub_18C0F2618();
  }
  type metadata accessor for SWClearMessagesAction();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_18C0F2068()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SWClearMessagesAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SWClearMessagesAction()
{
  return self;
}

unint64_t sub_18C0F20D4()
{
  unint64_t result = qword_1E916B480;
  if (!qword_1E916B480)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E916B480);
  }
  return result;
}

void __swiftcall SWCollaborationOption.init(title:identifier:subtitle:selected:requiredOptionsIdentifiers:)(SWCollaborationOption *__return_ptr retstr, Swift::String title, Swift::String identifier, Swift::String subtitle, Swift::Bool selected, Swift::OpaquePointer requiredOptionsIdentifiers)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  char v8 = (void *)sub_18C0F2608();
  swift_bridgeObjectRelease();
  unsigned int v9 = (void *)sub_18C0F2608();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(ObjCClassFromMetadata, sel_optionWithTitle_identifier_, v8, v9);

  id v11 = v10;
  uint64_t v12 = (void *)sub_18C0F2608();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setSubtitle_, v12);

  objc_msgSend(v11, sel_setSelected_, selected);
  unint64_t v13 = (void *)sub_18C0F2638();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setRequiredOptionsIdentifiers_, v13);
}

void __SWCollaborationMetadataForDocumentURL_block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18C0DE000, v5, v6, "[ERROR] Cannot fetch share options for item at %@. Error: %@", v7, v8, v9, v10, v11);
}

void __SWPerformActionForDocumentURL_block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18C0DE000, v5, v6, "[ERROR] Cannot perform share operation for item at %@. Error: %@", v7, v8, v9, v10, v11);
}

void __getSLCollaborationSigningControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[SWCollaborationClearNoticeTransmissionMessage writeTo:](v0);
}

uint64_t __getSLPersonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SWCollaborationCoordinator _sendStartCollaborationAction:](v0);
}

uint64_t sub_18C0F2608()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_18C0F2618()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_18C0F2628()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_18C0F2638()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_18C0F2648()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t FPNotSupportedError()
{
  return MEMORY[0x1F40E0B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSUnimplemented_()
{
  return MEMORY[0x1F40E72D0]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

uint64_t fp_current_or_default_log()
{
  return MEMORY[0x1F40E0C70]();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}