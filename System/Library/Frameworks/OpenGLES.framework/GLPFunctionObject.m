@interface GLPFunctionObject
@end

@implementation GLPFunctionObject

uint64_t __deserialize_GLPFunctionObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 168, "Deserialized");
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(void *)(v2 + 160) = 0;
  v3 = *(void **)(a1 + 32);
  uint64_t v62 = MEMORY[0x263EF8330];
  uint64_t v63 = 0x40000000;
  v64 = (uint64_t (*)(uint64_t))__deserialize_GLPType_block_invoke;
  v65 = &__block_descriptor_tmp_12;
  v66 = v3;
  deserialize_pointer(v3, (uint64_t)&v62, (void *)v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(v4 + 260);
  unint64_t v6 = *(unsigned int *)(v4 + 256);
  if (v5 >= v6) {
    goto LABEL_117;
  }
  uint64_t v7 = *(void *)(v4 + 248);
  int v8 = *(char *)(v7 + v5);
  unint64_t v9 = *(unsigned __int8 *)(v7 + v5);
  uint64_t v10 = v5 + 1;
  *(_DWORD *)(v4 + 260) = v5 + 1;
  if (v8 < 0)
  {
    uint64_t v11 = (v9 >> 1) & 7;
    switch(v11)
    {
      case 1:
        if (v5 + 3 > v6) {
          goto LABEL_117;
        }
        unint64_t v12 = *(unsigned __int16 *)(v7 + v10);
        LODWORD(v10) = v5 + 3;
        goto LABEL_24;
      case 2:
        unsigned int v13 = v5 + 4;
        if (v13 > v6) {
          goto LABEL_117;
        }
        unint64_t v12 = *(unsigned __int16 *)(v7 + v10) | ((unint64_t)*(unsigned __int8 *)(v7 + v10 + 2) << 16);
        *(_DWORD *)(v4 + 260) = v13;
        LODWORD(v10) = v13;
        goto LABEL_25;
      case 3:
        if (v5 + 5 > v6) {
          goto LABEL_117;
        }
        unint64_t v12 = *(unsigned int *)(v7 + v10);
        LODWORD(v10) = v5 + 5;
        goto LABEL_24;
      case 4:
        if (v5 + 5 > v6) {
          goto LABEL_117;
        }
        uint64_t v14 = *(unsigned int *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        if ((int)v5 + 5 >= v6) {
          goto LABEL_117;
        }
        uint64_t v15 = *(unsigned __int8 *)(v7 + (v5 + 5));
        LODWORD(v10) = v5 + 6;
        goto LABEL_18;
      case 5:
        if (v5 + 5 > v6) {
          goto LABEL_117;
        }
        uint64_t v14 = *(unsigned int *)(v7 + v10);
        uint64_t v10 = (v5 + 5);
        *(_DWORD *)(v4 + 260) = v10;
        if (v10 + 2 > v6) {
          goto LABEL_117;
        }
        uint64_t v15 = *(unsigned __int16 *)(v7 + v10);
        LODWORD(v10) = v5 + 7;
LABEL_18:
        *(_DWORD *)(v4 + 260) = v10;
        unint64_t v12 = v14 | (v15 << 32);
        goto LABEL_25;
      case 6:
        if (v5 + 5 > v6) {
          goto LABEL_117;
        }
        uint64_t v16 = *(unsigned int *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        LODWORD(v10) = v5 + 8;
        if ((int)v5 + 8 > v6) {
          goto LABEL_117;
        }
        uint64_t v17 = *(unsigned __int16 *)(v7 + (v5 + 5)) | (*(unsigned __int8 *)(v7 + (v5 + 5) + 2) << 16);
        *(_DWORD *)(v4 + 260) = v10;
        unint64_t v12 = v16 | (v17 << 32);
        goto LABEL_25;
      case 7:
        if (v5 + 9 > v6) {
          goto LABEL_117;
        }
        unint64_t v12 = *(void *)(v7 + v10);
        LODWORD(v10) = v5 + 9;
        goto LABEL_24;
      default:
        if (v10 >= v6) {
          goto LABEL_117;
        }
        unint64_t v12 = *(unsigned __int8 *)(v7 + v10);
        LODWORD(v10) = v5 + 2;
LABEL_24:
        *(_DWORD *)(v4 + 260) = v10;
LABEL_25:
        if (v8) {
          uint64_t v18 = -256 << (8 * v11);
        }
        else {
          uint64_t v18 = 0;
        }
        unint64_t v9 = v12 | v18;
        break;
    }
  }
  *(void *)(v2 + 8) = v9;
  if ((v9 & 0x4000) != 0)
  {
    if (v10 >= v6) {
      goto LABEL_117;
    }
    int v19 = *(char *)(v7 + v10);
    unint64_t v20 = *(unsigned __int8 *)(v7 + v10);
    uint64_t v21 = v10 + 1;
    *(_DWORD *)(v4 + 260) = v21;
    if (v19 < 0)
    {
      uint64_t v22 = (v20 >> 1) & 7;
      switch(v22)
      {
        case 1:
          if ((unint64_t)v10 + 3 > v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(unsigned __int16 *)(v7 + v21);
          int v23 = v10 + 3;
          goto LABEL_52;
        case 2:
          unsigned int v24 = v10 + 4;
          if (v24 > v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(unsigned __int16 *)(v7 + v21) | (*(unsigned __int8 *)(v7 + v21 + 2) << 16);
LABEL_49:
          *(_DWORD *)(v4 + 260) = v24;
          goto LABEL_53;
        case 3:
          if ((unint64_t)v10 + 5 > v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(_DWORD *)(v7 + v21);
          int v23 = v10 + 5;
          goto LABEL_52;
        case 4:
          if ((unint64_t)v10 + 5 > v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(_DWORD *)(v7 + v21);
          *(_DWORD *)(v4 + 260) = v10 + 5;
          if ((int)v10 + 5 >= v6) {
            goto LABEL_117;
          }
          int v23 = v10 + 6;
          goto LABEL_52;
        case 5:
          if ((unint64_t)v10 + 5 > v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(_DWORD *)(v7 + v21);
          uint64_t v25 = (v10 + 5);
          *(_DWORD *)(v4 + 260) = v25;
          if (v25 + 2 > v6) {
            goto LABEL_117;
          }
          int v23 = v10 + 7;
          goto LABEL_52;
        case 6:
          if ((unint64_t)v10 + 5 <= v6)
          {
            LODWORD(v7) = *(_DWORD *)(v7 + v21);
            *(_DWORD *)(v4 + 260) = v10 + 5;
            unsigned int v24 = v10 + 8;
            if (v24 <= v6) {
              goto LABEL_49;
            }
          }
          goto LABEL_117;
        case 7:
          if ((unint64_t)v10 + 9 > v6) {
            goto LABEL_117;
          }
          uint64_t v7 = *(void *)(v7 + v21);
          int v23 = v10 + 9;
          goto LABEL_52;
        default:
          if (v21 >= v6) {
            goto LABEL_117;
          }
          LODWORD(v7) = *(unsigned __int8 *)(v7 + v21);
          int v23 = v10 + 2;
LABEL_52:
          *(_DWORD *)(v4 + 260) = v23;
LABEL_53:
          if (v19) {
            uint64_t v26 = -256 << (8 * v22);
          }
          else {
            LODWORD(v26) = 0;
          }
          LODWORD(v20) = v7 | v26;
          break;
      }
    }
    *(_DWORD *)(v2 + 92) = v20;
  }
  *(void *)(v2 + 24) = deserialize_GLPString(v4);
  *(void *)(v2 + 32) = v27;
  *(void *)(v2 + 40) = deserialize_GLPString(*(void *)(a1 + 32));
  *(void *)(v2 + 48) = v28;
  v29 = *(void **)(a1 + 32);
  uint64_t v62 = MEMORY[0x263EF8330];
  uint64_t v63 = 0x40000000;
  v64 = __deserialize_GLPASTNode_block_invoke;
  v65 = &__block_descriptor_tmp_16_0;
  v66 = v29;
  deserialize_pointer(v29, (uint64_t)&v62, (void *)(v2 + 56));
  v30 = *(void **)(a1 + 32);
  uint64_t v62 = MEMORY[0x263EF8330];
  uint64_t v63 = 0x40000000;
  v64 = __deserialize_GLPASTNode_block_invoke;
  v65 = &__block_descriptor_tmp_16_0;
  v66 = v30;
  deserialize_pointer(v30, (uint64_t)&v62, (void *)(v2 + 64));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v31 = *(unsigned int *)(v4 + 260);
  unint64_t v32 = *(unsigned int *)(v4 + 256);
  if (v31 >= v32) {
    goto LABEL_117;
  }
  uint64_t v33 = *(void *)(v4 + 248);
  int v34 = *(char *)(v33 + v31);
  unint64_t v35 = *(unsigned __int8 *)(v33 + v31);
  uint64_t v36 = v31 + 1;
  *(_DWORD *)(v4 + 260) = v31 + 1;
  if (v34 < 0)
  {
    uint64_t v37 = (v35 >> 1) & 7;
    switch(v37)
    {
      case 1:
        if (v31 + 3 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(unsigned __int16 *)(v33 + v36);
        unsigned int v38 = v31 + 3;
        break;
      case 2:
        unsigned int v38 = v31 + 4;
        if (v38 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(unsigned __int16 *)(v33 + v36) | (*(unsigned __int8 *)(v33 + v36 + 2) << 16);
        break;
      case 3:
        if (v31 + 5 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(_DWORD *)(v33 + v36);
        unsigned int v38 = v31 + 5;
        break;
      case 4:
        if (v31 + 5 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(_DWORD *)(v33 + v36);
        *(_DWORD *)(v4 + 260) = v31 + 5;
        if ((int)v31 + 5 >= v32) {
          goto LABEL_117;
        }
        unsigned int v38 = v31 + 6;
        break;
      case 5:
        if (v31 + 5 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(_DWORD *)(v33 + v36);
        uint64_t v39 = (v31 + 5);
        *(_DWORD *)(v4 + 260) = v39;
        if (v39 + 2 > v32) {
          goto LABEL_117;
        }
        unsigned int v38 = v31 + 7;
        break;
      case 6:
        if (v31 + 5 > v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(_DWORD *)(v33 + v36);
        *(_DWORD *)(v4 + 260) = v31 + 5;
        unsigned int v38 = v31 + 8;
        if (v38 > v32) {
          goto LABEL_117;
        }
        break;
      case 7:
        if (v31 + 9 > v32) {
          goto LABEL_117;
        }
        uint64_t v33 = *(void *)(v33 + v36);
        unsigned int v38 = v31 + 9;
        break;
      default:
        if (v36 >= v32) {
          goto LABEL_117;
        }
        LODWORD(v33) = *(unsigned __int8 *)(v33 + v36);
        unsigned int v38 = v31 + 2;
        break;
    }
    *(_DWORD *)(v4 + 260) = v38;
    if (v34) {
      uint64_t v40 = -256 << (8 * v37);
    }
    else {
      LODWORD(v40) = 0;
    }
    LODWORD(v35) = v33 | v40;
  }
  *(_DWORD *)(v2 + 88) = v35;
  uint64_t v62 = MEMORY[0x263EF8330];
  uint64_t v63 = 0x40000000;
  v64 = __deserialize_GLPVariableObject_block_invoke;
  v65 = &__block_descriptor_tmp_6;
  v66 = (void *)v4;
  deserialize_pointer((void *)v4, (uint64_t)&v62, (void *)(v2 + 72));
  *(void *)(v2 + 80) = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32)
                                                                                              + 240)
                                                                                  + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * v35, "Deserialized");
  if (v35)
  {
    uint64_t v41 = 0;
    uint64_t v42 = MEMORY[0x263EF8330];
    uint64_t v43 = 8 * v35;
    do
    {
      v44 = *(void **)(a1 + 32);
      v45 = (void *)(*(void *)(v2 + 80) + v41);
      uint64_t v62 = v42;
      uint64_t v63 = 0x40000000;
      v64 = __deserialize_GLPVariableObject_block_invoke;
      v65 = &__block_descriptor_tmp_6;
      v66 = v44;
      deserialize_pointer(v44, (uint64_t)&v62, v45);
      v41 += 8;
    }
    while (v43 != v41);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v46 = *(unsigned int *)(v4 + 260);
  unint64_t v47 = *(unsigned int *)(v4 + 256);
  if (v46 >= v47) {
LABEL_117:
  }
    glpDeserialError(v4, 1u);
  uint64_t v48 = *(void *)(v4 + 248);
  int v49 = *(char *)(v48 + v46);
  unint64_t v50 = *(unsigned __int8 *)(v48 + v46);
  uint64_t v51 = v46 + 1;
  *(_DWORD *)(v4 + 260) = v46 + 1;
  if (v49 < 0)
  {
    uint64_t v52 = (v50 >> 1) & 7;
    switch(v52)
    {
      case 1:
        if (v46 + 3 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(unsigned __int16 *)(v48 + v51);
        unsigned int v53 = v46 + 3;
        break;
      case 2:
        unsigned int v53 = v46 + 4;
        if (v53 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(unsigned __int16 *)(v48 + v51) | (*(unsigned __int8 *)(v48 + v51 + 2) << 16);
        break;
      case 3:
        if (v46 + 5 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(_DWORD *)(v48 + v51);
        unsigned int v53 = v46 + 5;
        break;
      case 4:
        if (v46 + 5 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(_DWORD *)(v48 + v51);
        *(_DWORD *)(v4 + 260) = v46 + 5;
        if ((int)v46 + 5 >= v47) {
          goto LABEL_117;
        }
        unsigned int v53 = v46 + 6;
        break;
      case 5:
        if (v46 + 5 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(_DWORD *)(v48 + v51);
        uint64_t v54 = (v46 + 5);
        *(_DWORD *)(v4 + 260) = v54;
        if (v54 + 2 > v47) {
          goto LABEL_117;
        }
        unsigned int v53 = v46 + 7;
        break;
      case 6:
        if (v46 + 5 > v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(_DWORD *)(v48 + v51);
        *(_DWORD *)(v4 + 260) = v46 + 5;
        unsigned int v53 = v46 + 8;
        if (v53 > v47) {
          goto LABEL_117;
        }
        break;
      case 7:
        if (v46 + 9 > v47) {
          goto LABEL_117;
        }
        uint64_t v48 = *(void *)(v48 + v51);
        unsigned int v53 = v46 + 9;
        break;
      default:
        if (v51 >= v47) {
          goto LABEL_117;
        }
        LODWORD(v48) = *(unsigned __int8 *)(v48 + v51);
        unsigned int v53 = v46 + 2;
        break;
    }
    *(_DWORD *)(v4 + 260) = v53;
    if (v49) {
      uint64_t v55 = -256 << (8 * v52);
    }
    else {
      LODWORD(v55) = 0;
    }
    LODWORD(v50) = v48 | v55;
  }
  *(_DWORD *)(v2 + 96) = v50;
  *(void *)(v2 + 104) = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(v4 + 240) + 8))(**(void **)(v4 + 240), 8 * v50, "Deserialized");
  if (v50)
  {
    uint64_t v56 = 0;
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 8 * v50;
    do
    {
      v59 = *(void **)(a1 + 32);
      v60 = (void *)(*(void *)(v2 + 104) + v56);
      uint64_t v62 = v57;
      uint64_t v63 = 0x40000000;
      v64 = (uint64_t (*)(uint64_t))__deserialize_GLPType_block_invoke;
      v65 = &__block_descriptor_tmp_12;
      v66 = v59;
      deserialize_pointer(v59, (uint64_t)&v62, v60);
      v56 += 8;
    }
    while (v58 != v56);
  }
  return v2;
}

@end