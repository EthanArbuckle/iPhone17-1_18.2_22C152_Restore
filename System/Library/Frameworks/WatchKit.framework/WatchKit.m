uint64_t SPProtoSockPuppetObjectReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t result;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  SPProtoCacheMessage *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = 0x267F47000uLL;
  v8 = (int *)MEMORY[0x263F62268];
  v9 = 0x267F47000uLL;
  v10 = 0x267F47000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v3;
      v15 = *(void *)(a2 + v14);
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      v17 = *(unsigned char *)(*(void *)(a2 + *v8) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      v18 = v12++ >= 9;
      if (v18)
      {
        v13 = 0;
        v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = *v3;
          v25 = *(void *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
            break;
          }
          v27 = *(unsigned char *)(*(void *)(a2 + *v8) + v25);
          *(void *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_84;
          }
          v21 += 7;
          v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_86;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_84:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_86:
        v80 = *(int *)(v7 + 3436);
        goto LABEL_108;
      case 2u:
        v29 = 0;
        v30 = 0;
        v23 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 0x40u;
        while (2)
        {
          v31 = *v3;
          v32 = *(void *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(unsigned char *)(*(void *)(a2 + *v8) + v32);
            *(void *)(a2 + v31) = v33;
            v23 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v18 = v30++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_90:
        v80 = *(int *)(v10 + 3388);
        goto LABEL_108;
      case 3u:
        v35 = v9;
        v36 = v10;
        v37 = v7;
        v38 = objc_alloc_init(SPProtoCacheMessage);
        objc_storeStrong((id *)(a1 + 32), v38);
        if PBReaderPlaceMark() && (SPProtoCacheMessageReadFrom((uint64_t)v38, a2))
        {
          PBReaderRecallMark();

          v7 = v37;
          v10 = v36;
          v9 = v35;
LABEL_109:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        v39 = PBReaderReadString();
        v40 = 40;
        goto LABEL_82;
      case 5u:
        v39 = PBReaderReadString();
        v40 = 80;
        goto LABEL_82;
      case 6u:
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 1u;
        v41 = *v3;
        v42 = *(void *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(void *)(a2 + *v4))
        {
          v43 = *(void *)(*(void *)(a2 + *v8) + v42);
          *(void *)(a2 + v41) = v42 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          v43 = 0;
        }
        *(void *)(a1 + 8) = v43;
        goto LABEL_109;
      case 7u:
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 8u;
        v44 = *v3;
        v45 = *(void *)(a2 + v44);
        if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(void *)(a2 + *v4))
        {
          v46 = *(_DWORD *)(*(void *)(a2 + *v8) + v45);
          *(void *)(a2 + v44) = v45 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          v46 = 0;
        }
        *(_DWORD *)(a1 + 48) = v46;
        goto LABEL_109;
      case 8u:
        v47 = 0;
        v48 = 0;
        v49 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 2u;
        while (2)
        {
          v50 = *v3;
          v51 = *(void *)(a2 + v50);
          v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v53 = *(unsigned char *)(*(void *)(a2 + *v8) + v51);
            *(void *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              v18 = v48++ >= 9;
              if (v18)
              {
                v49 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          v49 = 0;
        }
LABEL_94:
        v81 = 16;
        goto LABEL_103;
      case 9u:
        v54 = 0;
        v55 = 0;
        v23 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 0x10u;
        while (2)
        {
          v56 = *v3;
          v57 = *(void *)(a2 + v56);
          v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v59 = *(unsigned char *)(*(void *)(a2 + *v8) + v57);
            *(void *)(a2 + v56) = v58;
            v23 |= (unint64_t)(v59 & 0x7F) << v54;
            if (v59 < 0)
            {
              v54 += 7;
              v18 = v55++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_98:
        v80 = 52;
        goto LABEL_108;
      case 0xAu:
        v60 = 0;
        v61 = 0;
        v49 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 4u;
        while (2)
        {
          v62 = *v3;
          v63 = *(void *)(a2 + v62);
          v64 = v63 + 1;
          if (v63 == -1 || v64 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v65 = *(unsigned char *)(*(void *)(a2 + *v8) + v63);
            *(void *)(a2 + v62) = v64;
            v49 |= (unint64_t)(v65 & 0x7F) << v60;
            if (v65 < 0)
            {
              v60 += 7;
              v18 = v61++ >= 9;
              if (v18)
              {
                v49 = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          v49 = 0;
        }
LABEL_102:
        v81 = 24;
LABEL_103:
        *(void *)(a1 + v81) = v49;
        goto LABEL_109;
      case 0xBu:
        v66 = 0;
        v67 = 0;
        v23 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 0x20u;
        while (2)
        {
          v68 = *v3;
          v69 = *(void *)(a2 + v68);
          v70 = v69 + 1;
          if (v69 == -1 || v70 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v71 = *(unsigned char *)(*(void *)(a2 + *v8) + v69);
            *(void *)(a2 + v68) = v70;
            v23 |= (unint64_t)(v71 & 0x7F) << v66;
            if (v71 < 0)
            {
              v66 += 7;
              v18 = v67++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_107:
        v80 = 56;
LABEL_108:
        *(_DWORD *)(a1 + v80) = v23;
        goto LABEL_109;
      case 0xCu:
        v72 = 0;
        v73 = 0;
        v74 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 3384)) |= 0x80u;
        while (2)
        {
          v75 = *v3;
          v76 = *(void *)(a2 + v75);
          v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v78 = *(unsigned char *)(*(void *)(a2 + *v8) + v76);
            *(void *)(a2 + v75) = v77;
            v74 |= (unint64_t)(v78 & 0x7F) << v72;
            if (v78 < 0)
            {
              v72 += 7;
              v18 = v73++ >= 9;
              if (v18)
              {
                v74 = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          v74 = 0;
        }
LABEL_114:
        *(unsigned char *)(a1 + 92) = v74 != 0;
        goto LABEL_109;
      case 0xDu:
        v39 = PBReaderReadData();
        v40 = 64;
LABEL_82:
        v79 = *(void **)(a1 + v40);
        *(void *)(a1 + v40) = v39;

        goto LABEL_109;
      default:
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_109;
    }
  }
}

BOOL SPProtoAudioFileQueuePlayerReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
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
        v17 = objc_alloc_init(SPProtoAudioFileQueuePlayerSetItems);
        objc_storeStrong(a1 + 10, v17);
        if (PBReaderPlaceMark() && SPProtoAudioFileQueuePlayerSetItemsReadFrom(v17, a2)) {
          goto LABEL_42;
        }
        goto LABEL_46;
      case 2u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 3;
        goto LABEL_36;
      case 3u:
        v17 = objc_alloc_init(SPProtoAudioFileQueuePlayerSetRate);
        objc_storeStrong(a1 + 8, v17);
        if (!PBReaderPlaceMark()
          || (SPProtoAudioFileQueuePlayerSetRateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_42;
      case 4u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        uint64_t v19 = 6;
        goto LABEL_40;
      case 5u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerStatus);
        objc_storeStrong(a1 + 9, v17);
        if (!PBReaderPlaceMark() || (SPProtoAudioFilePlayerStatusReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_42;
      case 6u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 1;
        goto LABEL_36;
      case 7u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        uint64_t v19 = 2;
        goto LABEL_40;
      case 8u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        uint64_t v19 = 5;
        goto LABEL_40;
      case 9u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 4;
LABEL_36:
        objc_storeStrong(&a1[v18], v17);
        if (!PBReaderPlaceMark() || (SPProtoObjectMessageReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_42;
      case 0xAu:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        uint64_t v19 = 7;
LABEL_40:
        objc_storeStrong(&a1[v19], v17);
        if (PBReaderPlaceMark()
          && SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)v17, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_43;
    }
  }
}

id _WKInterfaceObjectClassWithType(void *a1)
{
  uint64_t v1 = _WKInterfaceObjectClassWithType_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_WKInterfaceObjectClassWithType_onceToken, &__block_literal_global_0);
  }
  v3 = [(id)_WKInterfaceObjectClassWithType___interfaceClasses objectForKeyedSubscript:v2];

  return v3;
}

id _WKValidatedAttributedString(void *a1)
{
  id v1 = a1;
  id v2 = (void *)[v1 mutableCopy];
  uint64_t v3 = [v2 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___WKValidatedAttributedString_block_invoke;
  v9[3] = &unk_264598A68;
  id v10 = v1;
  id v4 = v2;
  id v11 = v4;
  id v5 = v1;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0x100000, v9);
  v6 = v11;
  id v7 = v4;

  return v7;
}

void sub_2211F9A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_264598A90;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2211F9B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2211F9D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2211F9E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRDevicePropertyLocalizedModel()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getNRDevicePropertyLocalizedModelSymbolLoc_ptr;
  uint64_t v7 = getNRDevicePropertyLocalizedModelSymbolLoc_ptr;
  if (!getNRDevicePropertyLocalizedModelSymbolLoc_ptr)
  {
    id v1 = (void *)NanoRegistryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "NRDevicePropertyLocalizedModel");
    getNRDevicePropertyLocalizedModelSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getNRDevicePropertyLocalizedModel_cold_1();
  }
  id v2 = *v0;

  return v2;
}

void sub_2211FA030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2211FA278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
  }
  getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __NanoRegistryLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_264598AB0;
    uint64_t v4 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary) {
    NanoRegistryLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRDevicePropertyMainScreenWidthSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyMainScreenWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyMainScreenWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyMainScreenHeightSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyMainScreenHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyMainScreenHeightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyScreenScaleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyScreenScale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyScreenScaleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIContentSizeCategorySmallSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIContentSizeCategorySmall");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIContentSizeCategorySmallSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __UIKitLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_264598AE8;
    uint64_t v4 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary) {
    UIKitLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getUIContentSizeCategoryLargeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIContentSizeCategoryLarge");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIContentSizeCategoryLargeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertySystemVersionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertySystemVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertySystemVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyLocalizedModelSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyLocalizedModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyLocalizedModelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertySystemNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertySystemName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertySystemNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SPProtoCacheAssetReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
              goto LABEL_40;
            }
            v19 += 7;
            BOOL v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_42:
          *(_DWORD *)(a1 + 32) = v21;
          continue;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          break;
        case 3u:
          uint64_t v34 = PBReaderReadString();
          v35 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v34;

          continue;
        case 4u:
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v38 = *(void *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v38 = 0;
          }
          *(void *)(a1 + 8) = v38;
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
        uint64_t v30 = *v3;
        uint64_t v31 = *(void *)(a2 + v30);
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0) {
          goto LABEL_44;
        }
        v27 += 7;
        BOOL v15 = v28++ >= 9;
        if (v15)
        {
          uint64_t v29 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_46:
      *(void *)(a1 + 16) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        char v19 = *(void **)(a1 + v18);
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

uint64_t SPProtoCacheAssetsReadFrom(void *a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = objc_alloc_init(SPProtoCacheAsset);
        [a1 addAssets:v17];
        if (!PBReaderPlaceMark() || (SPProtoCacheAssetReadFrom((uint64_t)v17, a2) & 1) == 0)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

BOOL SPProtoAudioFilePlayerMessageReadFrom(id *a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || !SPProtoAudioFileQueuePlayerReadFrom((id *)&v18->super.super.isa, a2))
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerAssetReadFrom((uint64_t)v18, a2)) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(SPProtoAudioFilePlayerItem);
    objc_storeStrong(a1 + 2, v18);
    if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerItemReadFrom((id *)&v18->super.super.isa, a2)) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getUIImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIImageClass_softClass;
  uint64_t v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_264598A90;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2211FE3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _applicationAccessibilityChanged()
{
  return +[SPRemoteInterface _updateAccessibility];
}

uint64_t _RunLoopHandler()
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([(id)__recordedValues count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(id)__recordedValues allKeys];
    uint64_t v0 = [obj countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v0)
    {
      uint64_t v2 = v0;
      uint64_t v23 = *(void *)v29;
      *(void *)&long long v1 = 136446722;
      long long v21 = v1;
      do
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v4 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v5 = objc_msgSend((id)__sharedRemoteInterface, "_interfaceControllerClientIDForControllerID:", v4, v21);
          if (v5)
          {
            uint64_t v6 = [(id)__sharedRemoteInterface _interfaceControllerWithID:v4];
            uint64_t v7 = [(id)__recordedValues objectForKeyedSubscript:v4];
            uint64_t v8 = [v7 count];

            unsigned int v9 = wk_default_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              char v13 = objc_opt_class();
              *(_DWORD *)buf = 136446978;
              char v33 = "_SendRecordedValues";
              __int16 v34 = 1024;
              int v35 = 422;
              __int16 v36 = 2048;
              uint64_t v37 = v8;
              __int16 v38 = 2114;
              v39 = v13;
              id v14 = v13;
              _os_log_debug_impl(&dword_2211F3000, v9, OS_LOG_TYPE_DEBUG, "%{public}s:%d: WatchKit: Send %lu setters to %{public}@", buf, 0x26u);
            }
            unint64_t v10 = (void *)__sharedRemoteInterface;
            uint64_t v11 = [(id)__recordedValues objectForKeyedSubscript:v4];
            v40 = v5;
            unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
            [v10 sendSetViewController:v4 values:v11 clientIdentifiers:v12];
          }
          else
          {
            uint64_t v6 = wk_default_log();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              char v33 = "_SendRecordedValues";
              __int16 v34 = 1024;
              int v35 = 416;
              __int16 v36 = 2114;
              uint64_t v37 = v4;
              _os_log_error_impl(&dword_2211F3000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ has no client identifier", buf, 0x1Cu);
            }
          }
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v2);
    }
  }
  [(id)__recordedValues removeAllObjects];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = (id)__performAfterSendSetViewControllers;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:buf count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * j) + 16))();
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:buf count:16];
    }
    while (v17);
  }

  [(id)__performAfterSendSetViewControllers removeAllObjects];
  return [(id)__cachedRunLoopValues removeAllObjects];
}

id getUNNotificationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUNNotificationClass_softClass;
  uint64_t v7 = getUNNotificationClass_softClass;
  if (!getUNNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUNNotificationClass_block_invoke;
    v3[3] = &unk_264598A90;
    v3[4] = &v4;
    __getUNNotificationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22120063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ArchiveWithArchiverDelegate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08910];
  id v2 = a1;
  long long v3 = (void *)[[v1 alloc] initRequiringSecureCoding:1];
  uint64_t v4 = objc_opt_new();
  [v3 setDelegate:v4];
  [v3 encodeObject:v2 forKey:*MEMORY[0x263F081D0]];

  uint64_t v5 = [v3 encodedData];

  return v5;
}

id SerializablePropertyValue(void *a1)
{
  id v1 = a1;
  if (([MEMORY[0x263F08AC0] propertyList:v1 isValidForFormat:200] & 1) == 0)
  {
    uint64_t v2 = ArchiveWithArchiverDelegate(v1);

    id v1 = (id)v2;
  }

  return v1;
}

void sub_221204914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_221204B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221204D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221204F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221205154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SEL SetterForProperty(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ((unint64_t)([v1 lengthOfBytesUsingEncoding:4] - 1) > 0x7C) {
    goto LABEL_5;
  }
  uint64_t v2 = (char *)v8 - ((MEMORY[0x270FA5388]() + 16) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(v1, "getCString:maxLength:encoding:", v2) & 1) == 0) {
    goto LABEL_5;
  }
  *uint64_t v2 = __toupper((char)*v2);
  long long v3 = NSString;
  uint64_t v4 = [NSString stringWithUTF8String:v2];
  uint64_t v5 = [v3 stringWithFormat:@"set%@:", v4];

  if (v5)
  {
    SEL v6 = NSSelectorFromString(v5);
  }
  else
  {
LABEL_5:
    SEL v6 = 0;
  }

  return v6;
}

id WKInterfaceControllerClass()
{
  if (WKInterfaceControllerClass_onceToken != -1) {
    dispatch_once(&WKInterfaceControllerClass_onceToken, &__block_literal_global_465);
  }
  uint64_t v0 = (void *)WKInterfaceControllerClass___wkInterfaceControllerClass;

  return v0;
}

Class __WKInterfaceControllerClass_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Wkinterfacecon.isa);
  WKInterfaceControllerClass___wkInterfaceControllerClass = (uint64_t)result;
  return result;
}

id SPInterfaceObjectWithType(void *a1)
{
  uint64_t v1 = SPInterfaceObjectWithType_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&SPInterfaceObjectWithType_onceToken, &__block_literal_global_812);
  }
  long long v3 = [(id)SPInterfaceObjectWithType___interfaceClasses objectForKeyedSubscript:v2];

  return v3;
}

void sub_221207E40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_221208F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __abort_with_reason(uint64_t a1)
{
  uint64_t v5 = 0;
  SEL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))getabort_with_reasonSymbolLoc_ptr;
  uint64_t v8 = getabort_with_reasonSymbolLoc_ptr;
  if (!getabort_with_reasonSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getabort_with_reasonSymbolLoc_block_invoke;
    v4[3] = &unk_264598A90;
    v4[4] = &v5;
    __getabort_with_reasonSymbolLoc_block_invoke((uint64_t)v4);
    id v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    __abort_with_reason_cold_1();
  }
  return v2(22, 1, a1, 2);
}

void sub_221209374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUNUserNotificationCenterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUNUserNotificationCenterClass_softClass;
  uint64_t v7 = getUNUserNotificationCenterClass_softClass;
  if (!getUNUserNotificationCenterClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUNUserNotificationCenterClass_block_invoke;
    v3[3] = &unk_264598A90;
    v3[4] = &v4;
    __getUNUserNotificationCenterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22120A0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22120B128(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_22120B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264598FB0;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary_0) {
    __getUIImageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIImageClass_block_invoke_cold_2();
  }
  getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getUNNotificationClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUNNotificationClass_block_invoke_cold_1();
  }
  getUNNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UserNotificationsLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __UserNotificationsLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_264598FC8;
    uint64_t v4 = 0;
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = UserNotificationsLibraryCore_frameworkLibrary;
  if (!UserNotificationsLibraryCore_frameworkLibrary) {
    UserNotificationsLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __UserNotificationsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserNotificationsLibraryCore_frameworkLibrary = result;
  return result;
}

void __SPInterfaceObjectWithType_block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = @"button";
  v3[0] = objc_opt_class();
  v2[1] = @"switch";
  v3[1] = objc_opt_class();
  v2[2] = @"image";
  v3[2] = objc_opt_class();
  v2[3] = @"label";
  v3[3] = objc_opt_class();
  v2[4] = @"list";
  v3[4] = objc_opt_class();
  v2[5] = @"table";
  void v3[5] = objc_opt_class();
  v2[6] = @"group";
  v3[6] = objc_opt_class();
  v2[7] = @"map";
  v3[7] = objc_opt_class();
  v2[8] = @"slider";
  v3[8] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)SPInterfaceObjectWithType___interfaceClasses;
  SPInterfaceObjectWithType___interfaceClasses = v0;
}

void *__getabort_with_reasonSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SystemLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __SystemLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_264598FE0;
    uint64_t v6 = 0;
    SystemLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)SystemLibraryCore_frameworkLibrary;
  if (!SystemLibraryCore_frameworkLibrary) {
    __getabort_with_reasonSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "abort_with_reason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getabort_with_reasonSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SystemLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNUserNotificationCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
  }
  getUNUserNotificationCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)UserNotificationsLibrary();
  Class result = dlsym(v2, "UNNotificationDefaultActionIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUNNotificationDefaultActionIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUNNotificationResponseClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNNotificationResponse");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUNNotificationResponseClass_block_invoke_cold_1();
  }
  getUNNotificationResponseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 1_Block_object_dispose(&a9, 8) = 2114;
  *(void *)(a3 + 20) = result;
  *(_WORD *)(a3 + 2_Block_object_dispose(&a9, 8) = 2114;
  *(void *)(a3 + 30) = a2;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t SPProtoAudioFilePlayerCurrentTimeReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  long long v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
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
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v21;
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

uint64_t SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  long long v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 32;
              goto LABEL_30;
            case 2u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 56;
              goto LABEL_30;
            case 3u:
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
              *(void *)(a1 + _Block_object_dispose(&a9, 8) = v23;
              goto LABEL_31;
            case 4u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 48;
              goto LABEL_30;
            case 5u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 16;
              goto LABEL_30;
            case 6u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 24;
              goto LABEL_30;
            case 7u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 40;
LABEL_30:
              long long v24 = *(void **)(a1 + v19);
              *(void *)(a1 + v19) = v18;

              goto LABEL_31;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_31:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SPProtoCacheSyncDataReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  long long v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v19 = objc_alloc_init(SPProtoCacheAssets);
        uint64_t v20 = 16;
LABEL_24:
        objc_storeStrong((id *)(a1 + v20), v19);
        if (!PBReaderPlaceMark() || (SPProtoCacheAssetsReadFrom(v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(SPProtoCacheAssets **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v18;
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
    uint64_t v19 = objc_alloc_init(SPProtoCacheAssets);
    uint64_t v20 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SPProtoCacheMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  long long v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
            goto LABEL_43;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_45:
        uint64_t v33 = 40;
        goto LABEL_50;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
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
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_49:
        uint64_t v33 = 24;
LABEL_50:
        *(_DWORD *)(a1 + v33) = v19;
        goto LABEL_51;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 16;
        goto LABEL_38;
      case 4u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 32;
        goto LABEL_38;
      case 5u:
        uint64_t v29 = PBReaderReadData();
        uint64_t v30 = 8;
LABEL_38:
        long long v31 = *(void **)(a1 + v30);
        *(void *)(a1 + v30) = v29;

        goto LABEL_51;
      case 6u:
        unint64_t v32 = objc_alloc_init(SPProtoCacheSyncData);
        objc_storeStrong((id *)(a1 + 48), v32);
        if (PBReaderPlaceMark() && SPProtoCacheSyncDataReadFrom((uint64_t)v32, a2))
        {
          PBReaderRecallMark();

LABEL_51:
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
        goto LABEL_51;
    }
  }
}

uint64_t SPProtoAudioFilePlayerStatusReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  long long v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
          uint64_t v18 = 32;
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
                  LODWORD(v22) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_42:
          *(_DWORD *)(a1 + 40) = v22;
          continue;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_38;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
LABEL_38:
          unint64_t v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

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
      *(void *)(a1 + _Block_object_dispose(&a9, 8) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22121150C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
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

void sub_221212CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_0(uint64_t a1)
{
  NanoRegistryLibrary_0();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1_0();
  }
  getNRPairedDeviceRegistryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary_0()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __NanoRegistryLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_264599AB0;
    uint64_t v4 = 0;
    NanoRegistryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary_0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_0) {
    NanoRegistryLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getNRDevicePropertyCurrentUserLocaleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary_0();
  uint64_t result = dlsym(v2, "NRDevicePropertyCurrentUserLocale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getXcodeSupportRemoteObjectProxy(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v15 = "getXcodeSupportRemoteObjectProxy";
    __int16 v16 = 1024;
    int v17 = 80;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ", buf, 0x12u);
  }

  long long v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.companionappd" options:4096];
  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D322C60];
  [v3 setRemoteObjectInterface:v4];

  uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D321D88];
  [v3 setExportedInterface:v5];

  uint64_t v6 = objc_alloc_init(SPXcodeSupport);
  [v3 setExportedObject:v6];

  [v3 resume];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __getXcodeSupportRemoteObjectProxy_block_invoke;
  v12[3] = &unk_264599B48;
  id v7 = v1;
  id v13 = v7;
  char v8 = [v3 remoteObjectProxyWithErrorHandler:v12];
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getXcodeSupportRemoteObjectProxy_block_invoke_99;
    v9[3] = &unk_264599B70;
    id v11 = v7;
    id v10 = v8;
    spUtils_dispatchAsyncToMainThread(v9);
  }
}

void __getXcodeSupportRemoteObjectProxy_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __getXcodeSupportRemoteObjectProxy_block_invoke_2;
  v5[3] = &unk_264598F18;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  spUtils_dispatchAsyncToMainThread(v5);
}

uint64_t __getXcodeSupportRemoteObjectProxy_block_invoke_2(uint64_t a1)
{
  id v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __getXcodeSupportRemoteObjectProxy_block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __getXcodeSupportRemoteObjectProxy_block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void SPLaunchSockPuppetAppForCompanionAppWithIdentifier(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    int v17 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier";
    __int16 v18 = 1024;
    int v19 = 148;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_2211F3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@, options=%{public}@", buf, 0x26u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke;
  v12[3] = &unk_264599BE8;
  id v14 = v5;
  id v15 = v7;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  getXcodeSupportRemoteObjectProxy(v12);
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v24 = v6;
    if (SPHoldCompanionExtensionProcessAssertion_block_invoke_onceToken != -1) {
      dispatch_once(&SPHoldCompanionExtensionProcessAssertion_block_invoke_onceToken, &__block_literal_global_4);
    }
    char v26 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v24);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v8 = [*(id *)(a1 + 32) allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v14 = [(id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations objectForKeyedSubscript:v13];
          id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
          if ([(id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated containsObject:v13])
          {
            __int16 v16 = v15;
          }
          else if ([(id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues containsObject:v13])
          {
            int v17 = [v15 BOOLValue];
            __int16 v18 = @"NO";
            if (v17) {
              __int16 v18 = @"YES";
            }
            __int16 v16 = v18;
          }
          else
          {
            __int16 v16 = [(id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations objectForKeyedSubscript:v15];
          }
          int v19 = v16;
          if (v14) {
            BOOL v20 = v16 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20) {
            [v26 setObject:v16 forKeyedSubscript:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v10);
    }

    id v21 = *(void **)(a1 + 40);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_3;
    v27[3] = &unk_264599BC0;
    id v28 = v21;
    id v29 = *(id *)(a1 + 32);
    id v30 = *(id *)(a1 + 48);
    __int16 v22 = v26;
    [v5 launchSockPuppetAppForCompanionAppWithIdentifier:v28 options:v26 completion:v27];

    id v7 = v25;
  }
  else
  {
    id v23 = wk_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1();
    }

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_100;
    v35[3] = &unk_264599B70;
    id v37 = *(id *)(a1 + 48);
    id v36 = v7;
    spUtils_dispatchSyncToMainThread(v35);

    __int16 v22 = v37;
  }
}

uint64_t __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2()
{
  v9[10] = *MEMORY[0x263EF8340];
  v8[0] = @"SPXcodeSupportAppLaunchModeKey";
  v8[1] = @"SPXcodeSupportAppLaunchModeValueGlance";
  v9[0] = @"WK_APP_LAUNCH_MODE";
  v9[1] = @"GLANCE";
  void v8[2] = @"SPXcodeSupportAppLaunchModeValueComplication";
  v8[3] = @"SPXcodeSupportAppLaunchModeValueNotification";
  v9[2] = @"COMPLICATION";
  v9[3] = @"NOTIFICATION";
  v8[4] = @"SPXcodeSupportAppLaunchModeNotificationRemotePayloadKey";
  v8[5] = @"SPXcodeSupportAppLaunchModeNotificationForceStaticPresentationKey";
  void v9[4] = @"WK_NOTIF_CONTEXT";
  v9[5] = @"WK_NOTIF_FORCE_STATIC";
  v8[6] = @"SPDeviceBacklightAssertionTime";
  v8[7] = @"SPHoldCompanionExtensionProcessAssertion";
  v9[6] = @"lgbl";
  v9[7] = @"SPServerHoldCompanionExtensionProcessAssertion";
  v8[8] = @"SPXcodeSupportAppLaunchEnvironmentKey";
  v8[9] = @"SPXcodeSupportAppLaunchArgumentsKey";
  v9[8] = @"xle";
  v9[9] = @"xla";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:10];
  id v1 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations = v0;

  id v7 = @"SPXcodeSupportAppLaunchModeNotificationForceStaticPresentationKey";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  uint64_t v3 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues = v2;

  v6[0] = @"SPXcodeSupportAppLaunchModeNotificationRemotePayloadKey";
  v6[1] = @"SPSimulatorAppLaunchModeApplicationLaunchURLKey";
  v6[2] = @"SPDeviceBacklightAssertionTime";
  v6[3] = @"SPHoldCompanionExtensionProcessAssertion";
  v6[4] = @"SPXcodeSupportAppLaunchEnvironmentKey";
  v6[5] = @"SPXcodeSupportAppLaunchArgumentsKey";
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  id v5 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated = v4;
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_3(id *a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4;
  v7[3] = &unk_264599B98;
  char v12 = a2;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = v5;
  id v11 = a1[6];
  id v6 = v5;
  spUtils_dispatchSyncToMainThread(v7);
}

uint64_t __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = wk_default_log();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 136446978;
      id v9 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4";
      __int16 v10 = 1024;
      int v11 = 213;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully launched WatchKit app for companionAppIdentifier %{public}@ with options %{public}@", (uint8_t *)&v8, 0x26u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4_cold_1((void *)a1, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void SPTerminateSockPuppetAppForCompanionAppWithIdentifier(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v12 = "SPTerminateSockPuppetAppForCompanionAppWithIdentifier";
    __int16 v13 = 1024;
    int v14 = 224;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_264599C38;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  getXcodeSupportRemoteObjectProxy(v8);
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_113;
    v9[3] = &unk_264599B48;
    id v6 = &v10;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [a2 terminateSockPuppetAppForCompanionAppWithIdentifier:v7 completion:v9];
  }
  else
  {
    int v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1();
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_112;
    v11[3] = &unk_264599C10;
    id v6 = &v12;
    id v12 = v5;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    spUtils_dispatchSyncToMainThread(v11);
  }
}

uint64_t __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_112(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  id v3 = wk_default_log();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_112_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    int v7 = 136446722;
    int v8 = "SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke";
    __int16 v9 = 1024;
    int v10 = 246;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully terminated WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2;
  v6[3] = &unk_264599B70;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  spUtils_dispatchSyncToMainThread(v6);
}

uint64_t __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v12 = "SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier";
    __int16 v13 = 1024;
    int v14 = 263;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_264599CB0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v3;
  id v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_2;
    v11[3] = &unk_264599C88;
    id v7 = &v12;
    id v8 = v6;
    id v12 = v8;
    id v9 = &v13;
    id v13 = *(id *)(a1 + 40);
    [a2 getSockPuppetAppRunningStatusForCompanionAppWithIdentifier:v8 completion:v11];
  }
  else
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_cold_1();
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_114;
    v14[3] = &unk_264599B70;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v9 = &v15;
    id v15 = v5;
    spUtils_dispatchSyncToMainThread(v14);
  }
}

uint64_t __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3;
  v7[3] = &unk_264599C60;
  id v8 = v5;
  char v11 = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  spUtils_dispatchSyncToMainThread(v7);
}

uint64_t __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = wk_default_log();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 136446978;
    id v9 = "SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3";
    __int16 v10 = 1024;
    int v11 = 275;
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully got app running status=%d for WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v8, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void SPGetCompanionExtensionPIDForCompanionAppWithIdentifier(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  int v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v12 = "SPGetCompanionExtensionPIDForCompanionAppWithIdentifier";
    __int16 v13 = 1024;
    int v14 = 286;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_264599CB0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v3;
  id v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);
}

void __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_2;
    v11[3] = &unk_264599D00;
    id v7 = &v12;
    id v8 = v6;
    id v12 = v8;
    id v9 = &v13;
    id v13 = *(id *)(a1 + 40);
    [a2 getCompanionExtensionPIDForCompanionAppWithIdentifier:v8 completion:v11];
  }
  else
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_cold_1();
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_116;
    v14[3] = &unk_264599B70;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v9 = &v15;
    id v15 = v5;
    spUtils_dispatchSyncToMainThread(v14);
  }
}

uint64_t __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_3;
  v7[3] = &unk_264599CD8;
  id v8 = v5;
  int v11 = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  spUtils_dispatchSyncToMainThread(v7);
}

uint64_t __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = wk_default_log();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 136446978;
    id v9 = "SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_3";
    __int16 v10 = 1024;
    int v11 = 298;
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully got PID=%d for WK1 extension for companionAppIdentifier %{public}@", (uint8_t *)&v8, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  int v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v12 = "SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier";
    __int16 v13 = 1024;
    int v14 = 309;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke;
  v8[3] = &unk_264599CB0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v3;
  id v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_2;
    v11[3] = &unk_264599D28;
    id v7 = &v12;
    id v8 = v6;
    id v12 = v8;
    id v9 = &v13;
    id v13 = *(id *)(a1 + 40);
    [a2 xcodeWillInstallSockPuppetAppWithCompanionAppIdentifier:v8 completion:v11];
  }
  else
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_cold_1();
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_118;
    v14[3] = &unk_264599B70;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v9 = &v15;
    id v15 = v5;
    spUtils_dispatchSyncToMainThread(v14);
  }
}

uint64_t __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3;
  v5[3] = &unk_264599C10;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  spUtils_dispatchSyncToMainThread(v5);
}

uint64_t __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  id v3 = wk_default_log();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    int v7 = 136446722;
    id v8 = "SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3";
    __int16 v9 = 1024;
    int v10 = 321;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully handled willInstall for WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void OUTLINED_FUNCTION_5_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

uint64_t SPProtoObjectMessageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        __int16 v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;
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

id _WKInterfaceControllerCreateClass(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, double a7, double a8, double a9, double a10)
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  objc_storeStrong((id *)&__viewControllerID, a3);
  id v23 = a6;
  id v24 = a1;
  objc_storeStrong((id *)&__properties, a4);
  objc_storeStrong((id *)&__gestureDescriptions, a5);
  uint64_t v25 = MEMORY[0x223C7C250](v23);

  char v26 = (void *)__remoteSetup;
  __remoteSetup = v25;

  *(double *)&__contentFrame = a7;
  *((double *)&__contentFrame + 1) = a8;
  qword_267F486B8 = *(void *)&a9;
  unk_267F486C0 = *(void *)&a10;
  unsigned int v27 = NSClassFromString(v24);

  if ([(objc_class *)v27 isSubclassOfClass:objc_opt_class()])
  {
    id v28 = objc_alloc_init(v27);
LABEL_5:
    id v31 = v28;
    goto LABEL_7;
  }
  id v29 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v29, sel_initWithContext_);
  if (class_getInstanceMethod(v27, sel_initWithContext_) != InstanceMethod)
  {
    id v28 = (id)[[v27 alloc] initWithContext:v19];
    goto LABEL_5;
  }
  id v31 = objc_alloc_init(v27);
  [v31 awakeWithContext:v19];
LABEL_7:
  long long v32 = (void *)__viewControllerID;
  __viewControllerID = 0;

  long long v33 = (void *)__gestureDescriptions;
  __gestureDescriptions = 0;

  long long v34 = (void *)__properties;
  __properties = 0;

  int v35 = (void *)__remoteSetup;
  __remoteSetup = 0;

  long long v36 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  __contentFrame = *MEMORY[0x263F001A8];
  *(_OWORD *)&qword_267F486B8 = v36;

  return v31;
}

uint64_t spUtils_uniqueNumber()
{
  ++spUtils_uniqueNumber_counter;
  uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
  int v1 = [v0 processIdentifier];
  uint64_t v2 = (unsigned __int16)spUtils_uniqueNumber_counter | (v1 << 16);

  return objc_msgSend(NSString, "stringWithFormat:", @"%X", v2);
}

id spUtils_serializeObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v7 = 0;
    uint64_t v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v7];
    id v3 = v7;
    if (!v2)
    {
      uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
      id v6 = [NSString stringWithUTF8String:"NSData *spUtils_serializeObject(__strong id)"];
      [v5 handleFailureInFunction:v6, @"SPUtils.m", 89, @"Failed to archive object. Got error %@, object: %@", v3, v1 file lineNumber description];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id spUtils_deserializeObject(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v8 = 0;
    a1 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v3 fromData:a1 error:&v8];
    id v4 = v8;
    if (!a1)
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id spUtils_deserializeObject(NSData *__strong, NSSet<Class> *__strong)");
      [v6 handleFailureInFunction:v7, @"SPUtils.m", 101, @"failed to unarchive data as one of %@: %@", v3, v4 file lineNumber description];
    }
  }

  return a1;
}

id spUtils_allowedClassesForUserActivity()
{
  if (spUtils_allowedClassesForUserActivity_onceToken != -1) {
    dispatch_once(&spUtils_allowedClassesForUserActivity_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)spUtils_allowedClassesForUserActivity___allowedClasses;

  return v0;
}

uint64_t __spUtils_allowedClassesForUserActivity_block_invoke()
{
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  spUtils_allowedClassesForUserActivity___allowedClasses = objc_msgSend(v11, "setWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

id spUtils_localizedStringForSystemLanguage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  uint64_t v6 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v7 = [v6 firstObject];
  id v8 = v3;
  id v9 = v5;
  id v10 = v7;
  if (![v8 length] || !objc_msgSend(@"Localizable", "length") || !objc_msgSend(v10, "length")) {
    goto LABEL_9;
  }
  CFArrayRef v11 = [v9 localizations];
  CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
  CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (![(__CFArray *)v13 count]) {
    goto LABEL_7;
  }
  int v14 = [(__CFArray *)v13 objectAtIndex:0];
  int v15 = [v9 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v14];

  if (v15)
  {
    [NSDictionary dictionaryWithContentsOfFile:v15];
    id v16 = v22 = v11;
    uint64_t v17 = [v16 objectForKey:v8];

    CFArrayRef v11 = v22;
  }
  else
  {
LABEL_7:
    uint64_t v17 = 0;
  }

  if (!v17)
  {
LABEL_9:
    uint64_t v17 = [v9 localizedStringForKey:v8 value:&stru_26D3103D0 table:@"Localizable"];
  }

  __int16 v18 = v17;
  if (!v17)
  {
    id v19 = wk_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      spUtils_localizedStringForSystemLanguage_cold_1((uint64_t)v8, (uint64_t)v4, v19);
    }

    __int16 v18 = v8;
  }
  id v20 = v18;

  return v20;
}

BOOL spUtils_appExtensionFirstUnlock()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (spUtils_appExtensionFirstUnlock_onceToken != -1) {
    dispatch_once(&spUtils_appExtensionFirstUnlock_onceToken, &__block_literal_global_37);
  }
  uint64_t state64 = 0;
  if (notify_get_state(spUtils_appExtensionFirstUnlock_token, &state64))
  {
    uint64_t v0 = wk_default_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      spUtils_appExtensionFirstUnlock_cold_1();
    }

    BOOL v1 = 1;
  }
  else
  {
    BOOL v1 = state64 != 0;
  }
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v6 = "spUtils_appExtensionFirstUnlock";
    __int16 v7 = 1024;
    int v8 = 190;
    __int16 v9 = 1024;
    BOOL v10 = v1;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: unlocked=%d", buf, 0x18u);
  }

  return v1;
}

void __spUtils_appExtensionFirstUnlock_block_invoke()
{
  if (notify_register_check((const char *)[@"com.apple.watchkit.notify.first_unlock" UTF8String], &spUtils_appExtensionFirstUnlock_token))
  {
    BOOL v0 = 1;
  }
  else
  {
    BOOL v0 = spUtils_appExtensionFirstUnlock_token == -1;
  }
  if (v0)
  {
    BOOL v1 = wk_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __spUtils_appExtensionFirstUnlock_block_invoke_cold_1();
    }
  }
}

uint64_t spUtils_machTimeString()
{
  uint64_t v0 = mach_absolute_time();
  if (spUtils_machTimeString_onceToken != -1) {
    dispatch_once(&spUtils_machTimeString_onceToken, &__block_literal_global_39);
  }
  return objc_msgSend(NSString, "stringWithFormat:", @" [%013.06f]", *(double *)&spUtils_machTimeString_mach_time_rate_i * (double)v0);
}

double __spUtils_machTimeString_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  spUtils_machTimeString_mach_time_rate_uint64_t i = *(void *)&result;
  return result;
}

BOOL spUtils_isRunningInF5DemoMode()
{
  if (DemoProgramNumber___onceToken != -1) {
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_142);
  }
  return DemoProgramNumber___fProgramNumber == 5;
}

BOOL spUtils_isRunningInF201DemoMode()
{
  if (DemoProgramNumber___onceToken != -1) {
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_142);
  }
  return DemoProgramNumber___fProgramNumber == 201;
}

uint64_t spUtils_isRunningInAnyDemoMode()
{
  if (DemoProgramNumber___onceToken != -1) {
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_142);
  }
  return DemoProgramNumber___demoModeEnabled;
}

BOOL spUtils_isRTL()
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2050000000;
  unint64_t v0 = (void *)getUIApplicationClass_softClass;
  uint64_t v9 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_264598A90;
    void v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    unint64_t v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  uint64_t v2 = [v1 sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

void sub_2212198A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id spUtils_SPURLQueryAllowedCharacterSet()
{
  if (spUtils_SPURLQueryAllowedCharacterSet_onceToken != -1) {
    dispatch_once(&spUtils_SPURLQueryAllowedCharacterSet_onceToken, &__block_literal_global_44);
  }
  unint64_t v0 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;

  return v0;
}

id spUtils_companionConnectionClientIdentifier(int a1, int a2)
{
  if (a1 && a2)
  {
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      spUtils_companionConnectionClientIdentifier_cold_1();
    }
  }
  uint64_t v5 = spUtils_uniqueNumber();
  uint64_t v6 = v5;
  if (!a1 || a2)
  {
    if (a2) {
      __int16 v7 = @"-";
    }
    else {
      __int16 v7 = @"_";
    }
    uint64_t v8 = [v5 stringByAppendingString:v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

uint64_t spUtils_isApplicationCompanionConnectionClientIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@"_"]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v1 hasSuffix:@"-"] ^ 1;
  }

  return v2;
}

uint64_t spUtils_isNotificationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return [a1 hasSuffix:@"-"];
}

uint64_t spUtils_isComplicationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return [a1 hasSuffix:@"_"];
}

void spUtils_dispatchSyncToMainThread(void *a1)
{
  block = a1;
  if (isRunningOnMainQueue()) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

BOOL isRunningOnMainQueue()
{
  if (_setupMainQueueSpecific_onceToken != -1) {
    dispatch_once(&_setupMainQueueSpecific_onceToken, &__block_literal_global_162);
  }
  return dispatch_get_specific(&kIsMainQueueKey) == (void *)MEMORY[0x263EF83A0];
}

void spUtils_dispatchAsyncToMainThread(void *a1)
{
  block = a1;
  if (isRunningOnMainQueue()) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

BOOL spUtils_subclassForObjectOverridesSelectorFromSuperclass(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a1 methodForSelector:a2];
  return v5 != [a3 instanceMethodForSelector:a2];
}

id spUtils_UIColorFromString(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 rangeOfString:@"@"];
  if (v3)
  {
    unint64_t v4 = v2;
    double v5 = 1.0;
    if (v2 < [v1 length] - 1)
    {
      uint64_t v6 = [v1 substringFromIndex:v4 + 1];
      [v6 floatValue];
      double v8 = v7;

      double v5 = fmin(fmax(v8, 0.0), 1.0);
    }
    uint64_t v9 = [v1 substringToIndex:v4];
  }
  else
  {
    double v5 = 1.0;
    uint64_t v9 = v1;
  }
  if (([v9 hasSuffix:@"Color"] & 1) == 0)
  {
    uint64_t v10 = [v9 stringByAppendingString:@"Color"];

    uint64_t v9 = (void *)v10;
  }
  if ([v9 hasPrefix:@"_"])
  {
    do
    {
      uint64_t v11 = [v9 substringFromIndex:1];

      uint64_t v9 = v11;
    }
    while (([v11 hasPrefix:@"_"] & 1) != 0);
  }
  else
  {
    uint64_t v11 = v9;
  }
  CFArrayRef v12 = NSSelectorFromString((NSString *)v11);
  getUIColorClass();
  CFArrayRef v13 = (objc_class *)objc_opt_class();
  if (!class_getClassMethod(v13, v12))
  {

LABEL_19:
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    if ([v1 length])
    {
      switch(sscanf((const char *)[v1 cStringUsingEncoding:1], "%02x%02x%02x%02x", (char *)&v29 + 4, &v29, (char *)&v28 + 4, &v28))
      {
        case 1:
          id UIColorClass = getUIColorClass();
          double v18 = (double)SHIDWORD(v29) / 255.0;
          double v19 = 1.0;
          goto LABEL_23;
        case 2:
          id UIColorClass = getUIColorClass();
          double v18 = (double)SHIDWORD(v29) / 255.0;
          double v19 = (double)(int)v29 / 255.0;
LABEL_23:
          uint64_t v20 = [UIColorClass colorWithWhite:v18 alpha:v19];
          goto LABEL_27;
        case 3:
          id v21 = getUIColorClass();
          double v22 = (double)SHIDWORD(v29) / 255.0;
          double v23 = (double)(int)v29 / 255.0;
          double v24 = (double)SHIDWORD(v28) / 255.0;
          double v25 = 1.0;
          goto LABEL_26;
        case 4:
          id v21 = getUIColorClass();
          double v22 = (double)SHIDWORD(v29) / 255.0;
          double v23 = (double)(int)v29 / 255.0;
          double v24 = (double)SHIDWORD(v28) / 255.0;
          double v25 = (double)(int)v28 / 255.0;
LABEL_26:
          uint64_t v20 = [v21 colorWithRed:v22 green:v23 blue:v24 alpha:v25];
LABEL_27:
          int v15 = (void *)v20;
          if (!v20) {
            break;
          }
          goto LABEL_31;
        default:
          break;
      }
    }
    char v26 = wk_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      spUtils_UIColorFromString_cold_1();
    }

    int v15 = 0;
    goto LABEL_31;
  }
  getUIColorClass();
  int v14 = [(id)objc_opt_class() performSelector:v12];
  int v15 = v14;
  if (v14 && v5 < 1.0)
  {
    uint64_t v16 = [v14 colorWithAlphaComponent:v5];

    int v15 = (void *)v16;
  }

  if (!v15) {
    goto LABEL_19;
  }
LABEL_31:

  return v15;
}

id getUIColorClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  unint64_t v0 = (void *)getUIColorClass_softClass;
  uint64_t v7 = getUIColorClass_softClass;
  if (!getUIColorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIColorClass_block_invoke;
    v3[3] = &unk_264598A90;
    v3[4] = &v4;
    __getUIColorClass_block_invoke((uint64_t)v3);
    unint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22121A048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22121A3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __DemoProgramNumber_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0))
  {
    DemoProgramNumber___demoModeEnabled = 1;
    DemoProgramNumber___fProgramNumber = CFPreferencesGetAppIntegerValue(@"FProgramNumber", @"com.apple.demo-settings", 0);
  }
  unint64_t v0 = wk_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446978;
    unint64_t v2 = "DemoProgramNumber_block_invoke";
    __int16 v3 = 1024;
    int v4 = 234;
    __int16 v5 = 1024;
    int v6 = DemoProgramNumber___demoModeEnabled;
    __int16 v7 = 1024;
    int v8 = DemoProgramNumber___fProgramNumber;
    _os_log_impl(&dword_2211F3000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Demo mode enabled = %d, Demo program number = %d", (uint8_t *)&v1, 0x1Eu);
  }
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIApplicationClass_block_invoke_cold_1();
  }
  getUIApplicationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void UIKitLibrary_0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_1)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __UIKitLibraryCore_block_invoke_1;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26459A170;
    uint64_t v2 = 0;
    UIKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary_1) {
    UIKitLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __UIKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getUIColorClass_block_invoke(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIColorClass_block_invoke_cold_1();
  }
  getUIColorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ___setupMainQueueSpecific_block_invoke()
{
}

Class __getUIFontClass_block_invoke(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIFont");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIFontClass_block_invoke_cold_1();
  }
  getUIFontClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIFontDescriptorClass_block_invoke(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIFontDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIFontDescriptorClass_block_invoke_cold_1();
  }
  getUIFontDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL SPProtoAudioFileQueuePlayerSetItemsReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  int v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    __int16 v7 = (int *)MEMORY[0x263F62268];
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
        double v18 = (void *)a1[1];
        a1[1] = v17;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    double v18 = PBReaderReadString();
    if (v18) {
      [a1 addPlayerItemIdentifiers:v18];
    }
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id wk_default_log()
{
  if (wk_default_log_onceToken != -1) {
    dispatch_once(&wk_default_log_onceToken, &__block_literal_global_7);
  }
  unint64_t v0 = (void *)wk_default_log___logger;

  return v0;
}

uint64_t __wk_default_log_block_invoke()
{
  wk_default_log___logger = (uint64_t)os_log_create("com.apple.watchkit", "default");

  return MEMORY[0x270F9A758]();
}

id wk_extension_loading_log()
{
  if (wk_extension_loading_log_onceToken != -1) {
    dispatch_once(&wk_extension_loading_log_onceToken, &__block_literal_global_4);
  }
  unint64_t v0 = (void *)wk_extension_loading_log___logger;

  return v0;
}

uint64_t __wk_extension_loading_log_block_invoke()
{
  wk_extension_loading_log___logger = (uint64_t)os_log_create("com.apple.watchkit", "extension_loading");

  return MEMORY[0x270F9A758]();
}

id wk_bg_app_refresh_log()
{
  if (wk_bg_app_refresh_log_onceToken != -1) {
    dispatch_once(&wk_bg_app_refresh_log_onceToken, &__block_literal_global_7);
  }
  unint64_t v0 = (void *)wk_bg_app_refresh_log___logger;

  return v0;
}

uint64_t __wk_bg_app_refresh_log_block_invoke()
{
  wk_bg_app_refresh_log___logger = (uint64_t)os_log_create("com.apple.watchkit", "bg_app_refresh");

  return MEMORY[0x270F9A758]();
}

void ____allowedClasses_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = spUtils_allowedClassesForUserActivity();
  long long v1 = (void *)__allowedClasses___allowedClasses;
  __allowedClasses___allowedClasses = v0;

  uint64_t v2 = (void *)__allowedClasses___allowedClasses;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  uint64_t v4 = objc_msgSend(v2, "setByAddingObjectsFromArray:", v3, v6, v7);
  __int16 v5 = (void *)__allowedClasses___allowedClasses;
  __allowedClasses___allowedClasses = v4;
}

uint64_t SPProtoAudioFileQueuePlayerSetRateReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + *v4))
        {
          int v23 = *(_DWORD *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          int v23 = 0;
        }
        *(_DWORD *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v19;
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

uint64_t SPProtoSockPuppetPlistReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        int v17 = objc_alloc_init(SPProtoSockPuppetObject);
        [a1 addObject:v17];
        if (!PBReaderPlaceMark() || (SPProtoSockPuppetObjectReadFrom((uint64_t)v17, a2) & 1) == 0)
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

BOOL SPProtoAudioFilePlayerAssetReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        int v17 = objc_alloc_init(SPProtoAudioFilePlayerAssetUpdateMetaData);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    int v17 = objc_alloc_init(SPProtoObjectMessage);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (SPProtoObjectMessageReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SPProtoAudioFilePlayerItemReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        int v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        objc_storeStrong(a1 + 8, v17);
        if (PBReaderPlaceMark()
          && SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)v17, a2))
        {
          goto LABEL_34;
        }
        goto LABEL_39;
      case 2u:
        int v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 1;
        goto LABEL_32;
      case 3u:
        int v17 = objc_alloc_init(SPProtoAudioFilePlayerStatus);
        objc_storeStrong(a1 + 7, v17);
        if (!PBReaderPlaceMark() || (SPProtoAudioFilePlayerStatusReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_34;
      case 4u:
        int v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 2;
        goto LABEL_32;
      case 5u:
        int v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 5;
        goto LABEL_32;
      case 6u:
        int v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 3;
        goto LABEL_32;
      case 7u:
        int v17 = objc_alloc_init(SPProtoObjectMessage);
        uint64_t v18 = 4;
LABEL_32:
        objc_storeStrong(&a1[v18], v17);
        if PBReaderPlaceMark() && (SPProtoObjectMessageReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_39;
      case 8u:
        int v17 = objc_alloc_init(SPProtoAudioFilePlayerItemSetCurrentTime);
        objc_storeStrong(a1 + 6, v17);
        if (PBReaderPlaceMark()
          && (SPProtoAudioFilePlayerItemSetCurrentTimeReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_35;
    }
  }
}

uint64_t SPProtoAudioFilePlayerItemSetCurrentTimeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v2dispatch_queue_set_specific(MEMORY[0x263EF83A0], &kIsMainQueueKey, MEMORY[0x263EF83A0], 0) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
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

BOOL SPProtoSockPuppetMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  __int16 v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        int v17 = objc_alloc_init(SPProtoSockPuppetPlist);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SPProtoSockPuppetPlistReadFrom(v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    int v17 = objc_alloc_init(SPProtoAudioFilePlayerMessage);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerMessageReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_221224268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2212242FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2212244F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22122484C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2212248F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224A00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_221224AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221224B60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  *(_DWORD *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 1_Block_object_dispose(&a9, 8) = 2114;
  *(void *)(a2 + 2dispatch_queue_set_specific(MEMORY[0x263EF83A0], &kIsMainQueueKey, MEMORY[0x263EF83A0], 0) = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  CTFontSetAltTextStyleSpec();
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2050000000;
  uint64_t v3 = (void *)getNRPairedDeviceRegistryClass_softClass_1;
  uint64_t v37 = getNRPairedDeviceRegistryClass_softClass_1;
  if (!getNRPairedDeviceRegistryClass_softClass_1)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getNRPairedDeviceRegistryClass_block_invoke_1;
    long long v32 = &unk_264598A90;
    long long v33 = &v34;
    __getNRPairedDeviceRegistryClass_block_invoke_1((uint64_t)&v29);
    uint64_t v3 = (void *)v35[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v34, 8);
  uint64_t v5 = [v4 sharedInstance];
  uint64_t v6 = [v5 getDevices];
  uint64_t v7 = [v6 firstObject];

  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2050000000;
  char v8 = (void *)getNPSDomainAccessorClass_softClass;
  uint64_t v37 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getNPSDomainAccessorClass_block_invoke;
    long long v32 = &unk_264598A90;
    long long v33 = &v34;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)&v29);
    char v8 = (void *)v35[3];
  }
  unsigned int v9 = v8;
  _Block_object_dispose(&v34, 8);
  unint64_t v10 = (void *)[[v9 alloc] initWithDomain:@".GlobalPreferences"];
  id v11 = (id)[v10 synchronize];
  unint64_t v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_msgSend(v12, "setBool:forKey:", objc_msgSend(v10, "BOOLForKey:", @"AppleICUForce24HourTime"), @"AppleICUForce24HourTime");

  char v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_msgSend(v13, "setBool:forKey:", objc_msgSend(v10, "BOOLForKey:", @"AppleICUForce12HourTime"), @"AppleICUForce12HourTime");

  char v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v15 = (void *)getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr;
  uint64_t v37 = getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr;
  if (!getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getNRDevicePropertyPreferredLanguagesSymbolLoc_block_invoke;
    long long v32 = &unk_264598A90;
    long long v33 = &v34;
    int v16 = (void *)NanoRegistryLibrary_1();
    int v17 = dlsym(v16, "NRDevicePropertyPreferredLanguages");
    *(void *)(v33[1] + 24) = v17;
    getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr = *(void *)(v33[1] + 24);
    int v15 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v15) {
    main_cold_1();
  }
  uint64_t v18 = [v7 valueForProperty:*v15];
  [v14 setObject:v18 forKey:@"AppleLanguages"];

  uint64_t v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v20 = (void *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0;
  uint64_t v37 = getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getNRDevicePropertyCurrentUserLocaleSymbolLoc_block_invoke_0;
    long long v32 = &unk_264598A90;
    long long v33 = &v34;
    unint64_t v21 = (void *)NanoRegistryLibrary_1();
    uint64_t v22 = dlsym(v21, "NRDevicePropertyCurrentUserLocale");
    *(void *)(v33[1] + 24) = v22;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0 = *(void *)(v33[1] + 24);
    uint64_t v20 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v20) {
    main_cold_2();
  }
  int v23 = [v7 valueForProperty:*v20];
  [v19 setObject:v23 forKey:@"AppleLocale"];

  double v24 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v24 synchronize];

  double v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 postNotificationName:*MEMORY[0x263EFF458] object:0];

  char v26 = [MEMORY[0x263F5E720] defaultService];
  unsigned int v27 = objc_alloc_init(SPPluginDelegate);
  [v26 setDelegate:v27];

  [v26 run];
  return 0;
}

void sub_2212251CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_1(uint64_t a1)
{
  NanoRegistryLibrary_1();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1_1();
  }
  getNRPairedDeviceRegistryClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __NanoRegistryLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26459A1A8;
    uint64_t v4 = 0;
    NanoRegistryLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary_1;
  if (!NanoRegistryLibraryCore_frameworkLibrary_1) {
    NanoRegistryLibrary_cold_1_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26459A1C0;
    uint64_t v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary) {
    __getNPSDomainAccessorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("NPSDomainAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNPSDomainAccessorClass_block_invoke_cold_2();
  }
  getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRDevicePropertyPreferredLanguagesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary_1();
  uint64_t result = dlsym(v2, "NRDevicePropertyPreferredLanguages");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyCurrentUserLocaleSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary_1();
  uint64_t result = dlsym(v2, "NRDevicePropertyCurrentUserLocale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getNRDevicePropertyLocalizedModel_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyLocalizedModel(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 46, @"%s", dlerror());

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getNRPairedDeviceRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 40, @"Unable to find class %s", "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *NanoRegistryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WKInterfaceDevice.m", 39, @"%s", *a1);

  __break(1u);
}

void UIKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WKInterfaceDevice.m", 34, @"%s", *a1);

  __break(1u);
}

void __abort_with_reason_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void __abort_with_reason(uint32_t, uint64_t, const char *, uint64_t)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPUtils.h", 15, @"%s", dlerror());

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPRemoteInterface.m", 156, @"%s", *a1);

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getUIImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPRemoteInterface.m", 157, @"Unable to find class %s", "UIImage");

  __break(1u);
}

void __getUNNotificationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getUNNotificationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPRemoteInterface.m", 96, @"Unable to find class %s", "UNNotification");

  __break(1u);
}

void UserNotificationsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *UserNotificationsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPRemoteInterface.m", 87, @"%s", *a1);

  __break(1u);
}

void __getabort_with_reasonSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SystemLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPUtils.h", 14, @"%s", *a1);

  __break(1u);
}

void __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getUNUserNotificationCenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPRemoteInterface.m", 88, @"Unable to find class %s", "UNUserNotificationCenter");

  __break(1u);
}

void __getUNNotificationResponseClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getUNNotificationResponseClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPRemoteInterface.m", 90, @"Unable to find class %s", "UNNotificationResponse");

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getNRPairedDeviceRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPDeviceConnection.m", 42, @"Unable to find class %s", "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *NanoRegistryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPDeviceConnection.m", 41, @"%s", *a1);

  __break(1u);
}

void __getXcodeSupportRemoteObjectProxy_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4_cold_1(void *a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  int v5 = 136447234;
  uint64_t v6 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke";
  __int16 v7 = 1024;
  int v8 = 215;
  __int16 v9 = 2114;
  uint64_t v10 = v2;
  __int16 v11 = 2114;
  uint64_t v12 = v3;
  __int16 v13 = 2114;
  uint64_t v14 = v4;
  _os_log_error_impl(&dword_2211F3000, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to launch  WatchKit app for companionAppIdentifier %{public}@ with options %{public}@. Got error %{public}@", (uint8_t *)&v5, 0x30u);
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_112_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  int v2 = 136446978;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error terminating WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  int v2 = 136446978;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error getting app running status for WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
}

void __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
}

void __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  int v2 = 136446978;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error getting PID for WK1 extension for companionAppIdentifier %{public}@: %{public}@", v2);
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  int v2 = 136446978;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error handling willInstall for WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
}

void spUtils_localizedStringForSystemLanguage_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  [v6 fileExistsAtPath:a2];
  *(_DWORD *)__int16 v9 = 136447234;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v9[7] = 157;
  v9[9] = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  __int16 v13 = v7;
  int v14 = v8;
  _os_log_error_impl(&dword_2211F3000, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to localize key \"%{public}@\" in bundle at %{public}@. bundleExists=%d", (uint8_t *)v9, 0x2Cu);
}

void spUtils_appExtensionFirstUnlock_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = 136446978;
  int v2 = "spUtils_appExtensionFirstUnlock";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: notify_get_state failed with error=%d token=%d", (uint8_t *)&v1, 0x1Eu);
}

void __spUtils_appExtensionFirstUnlock_block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = 136446978;
  int v2 = "spUtils_appExtensionFirstUnlock_block_invoke";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: notify_register_check failed with error=%d token=%d", (uint8_t *)&v1, 0x1Eu);
}

void spUtils_companionConnectionClientIdentifier_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 280;
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: isApplication and isNotification can't both be true", (uint8_t *)v1, 0x12u);
}

void spUtils_UIColorFromString_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v2[7] = 364;
  void v2[9] = 2114;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2211F3000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - unable to parse string '%{public}@' as UIColor method or hex value", (uint8_t *)v2, 0x1Cu);
}

void __getUIApplicationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getUIApplicationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPUtils.m", 54, @"Unable to find class %s", "UIApplication");

  __break(1u);
}

void UIKitLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPUtils.m", 53, @"%s", *a1);

  __break(1u);
}

void __getUIColorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getUIColorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPUtils.m", 55, @"Unable to find class %s", "UIColor");

  __break(1u);
}

void __getUIFontClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getUIFontClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPUtils.m", 56, @"Unable to find class %s", "UIFont");

  __break(1u);
}

void __getUIFontDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getUIFontDescriptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPUtils.m", 57, @"Unable to find class %s", "UIFontDescriptor");

  __break(1u);
}

void main_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyPreferredLanguages(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"main.m", 30, @"%s", dlerror());

  __break(1u);
}

void main_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyCurrentUserLocale(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"main.m", 29, @"%s", dlerror());

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getNRPairedDeviceRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"main.m", 28, @"Unable to find class %s", "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *NanoRegistryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"main.m", 27, @"%s", *a1);

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *NanoPreferencesSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"main.m", 31, @"%s", *a1);

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getNPSDomainAccessorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"main.m", 32, @"Unable to find class %s", "NPSDomainAccessor");

  __break(1u);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E88](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

uint64_t CTFontSetAltTextStyleSpec()
{
  return MEMORY[0x270EE9CF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
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

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x270F76310]();
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x270F9A4F8](m);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

void srand(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}