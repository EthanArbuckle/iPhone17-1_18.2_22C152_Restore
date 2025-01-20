@interface GLPVariableObject
@end

@implementation GLPVariableObject

uint64_t __deserialize_GLPVariableObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 160, "Deserialized");
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
  v3 = *(void **)(a1 + 32);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = __deserialize_GLPType_block_invoke;
  v53 = &__block_descriptor_tmp_12;
  v54 = v3;
  deserialize_pointer(v3, (uint64_t)&v50, (void *)v2);
  v4 = *(void **)(a1 + 32);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
  v53 = &__block_descriptor_tmp_3;
  v54 = v4;
  deserialize_pointer(v4, (uint64_t)&v50, (void *)(v2 + 8));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned int *)(v5 + 260);
  unint64_t v7 = *(unsigned int *)(v5 + 256);
  if (v6 >= v7) {
    goto LABEL_83;
  }
  uint64_t v8 = *(void *)(v5 + 248);
  int v9 = *(char *)(v8 + v6);
  unint64_t v10 = *(unsigned __int8 *)(v8 + v6);
  uint64_t v11 = v6 + 1;
  *(_DWORD *)(v5 + 260) = v6 + 1;
  if (v9 < 0)
  {
    uint64_t v12 = (v10 >> 1) & 7;
    switch(v12)
    {
      case 1:
        if (v6 + 3 > v7) {
          goto LABEL_83;
        }
        unint64_t v13 = *(unsigned __int16 *)(v8 + v11);
        unsigned int v14 = v6 + 3;
        goto LABEL_24;
      case 2:
        unsigned int v14 = v6 + 4;
        if (v14 > v7) {
          goto LABEL_83;
        }
        unint64_t v13 = *(unsigned __int16 *)(v8 + v11) | ((unint64_t)*(unsigned __int8 *)(v8 + v11 + 2) << 16);
        goto LABEL_24;
      case 3:
        if (v6 + 5 > v7) {
          goto LABEL_83;
        }
        unint64_t v13 = *(unsigned int *)(v8 + v11);
        unsigned int v14 = v6 + 5;
        goto LABEL_24;
      case 4:
        if (v6 + 5 > v7) {
          goto LABEL_83;
        }
        uint64_t v15 = *(unsigned int *)(v8 + v11);
        *(_DWORD *)(v5 + 260) = v6 + 5;
        if ((int)v6 + 5 >= v7) {
          goto LABEL_83;
        }
        uint64_t v16 = *(unsigned __int8 *)(v8 + (v6 + 5));
        unsigned int v17 = v6 + 6;
        goto LABEL_21;
      case 5:
        if (v6 + 5 > v7) {
          goto LABEL_83;
        }
        uint64_t v15 = *(unsigned int *)(v8 + v11);
        uint64_t v18 = (v6 + 5);
        *(_DWORD *)(v5 + 260) = v18;
        if (v18 + 2 > v7) {
          goto LABEL_83;
        }
        uint64_t v16 = *(unsigned __int16 *)(v8 + v18);
        unsigned int v17 = v6 + 7;
        goto LABEL_21;
      case 6:
        if (v6 + 5 > v7) {
          goto LABEL_83;
        }
        uint64_t v15 = *(unsigned int *)(v8 + v11);
        unsigned int v19 = v6 + 5;
        *(_DWORD *)(v5 + 260) = v6 + 5;
        unsigned int v17 = v6 + 8;
        if (v17 > v7) {
          goto LABEL_83;
        }
        uint64_t v16 = *(unsigned __int16 *)(v8 + v19) | (*(unsigned __int8 *)(v8 + v19 + 2) << 16);
LABEL_21:
        *(_DWORD *)(v5 + 260) = v17;
        unint64_t v13 = v15 | (v16 << 32);
        goto LABEL_25;
      case 7:
        if (v6 + 9 > v7) {
          goto LABEL_83;
        }
        unint64_t v13 = *(void *)(v8 + v11);
        unsigned int v14 = v6 + 9;
        goto LABEL_24;
      default:
        if (v11 >= v7) {
          goto LABEL_83;
        }
        unint64_t v13 = *(unsigned __int8 *)(v8 + v11);
        unsigned int v14 = v6 + 2;
LABEL_24:
        *(_DWORD *)(v5 + 260) = v14;
LABEL_25:
        if (v9) {
          uint64_t v20 = -256 << (8 * v12);
        }
        else {
          uint64_t v20 = 0;
        }
        unint64_t v10 = v13 | v20;
        break;
    }
  }
  *(void *)(v2 + 48) = v10;
  *(void *)(v2 + 16) = deserialize_GLPString(v5);
  *(void *)(v2 + 24) = v21;
  *(void *)(v2 + 32) = deserialize_GLPString(*(void *)(a1 + 32));
  *(void *)(v2 + 40) = v22;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v23 = *(unsigned int *)(v5 + 260);
  if (v23 >= *(_DWORD *)(v5 + 256)) {
    goto LABEL_83;
  }
  char v24 = *(unsigned char *)(*(void *)(v5 + 248) + v23);
  *(_DWORD *)(v5 + 260) = v23 + 1;
  *(unsigned char *)(v2 + 56) = v24;
  uint64_t v25 = *(void *)v2;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = (uint64_t (*)())__deserialize_GLPValue_block_invoke;
  v53 = &__block_descriptor_tmp_2;
  v54 = (void *)v5;
  uint64_t v55 = v25;
  deserialize_pointer((void *)v5, (uint64_t)&v50, (void *)(v2 + 64));
  v26 = *(void **)(a1 + 32);
  uint64_t v27 = *(void *)v2;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = (uint64_t (*)())__deserialize_GLPValue_block_invoke;
  v53 = &__block_descriptor_tmp_2;
  v54 = v26;
  uint64_t v55 = v27;
  deserialize_pointer(v26, (uint64_t)&v50, (void *)(v2 + 72));
  v28 = *(void **)(a1 + 32);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = (uint64_t (*)())__deserialize_GLPInterfaceBlockObject_block_invoke;
  v53 = &__block_descriptor_tmp_9;
  v54 = v28;
  deserialize_pointer(v28, (uint64_t)&v50, (void *)(v2 + 80));
  v29 = *(void **)(a1 + 32);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 0x40000000;
  v52 = (uint64_t (*)())__deserialize_GLPBufferObject_block_invoke;
  v53 = &__block_descriptor_tmp_7;
  v54 = v29;
  deserialize_pointer(v29, (uint64_t)&v50, (void *)(v2 + 88));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v30 = *(unsigned int *)(v5 + 260);
  unint64_t v31 = *(unsigned int *)(v5 + 256);
  if (v30 >= v31) {
    goto LABEL_83;
  }
  uint64_t v32 = *(void *)(v5 + 248);
  int v33 = *(char *)(v32 + v30);
  unint64_t v34 = *(unsigned __int8 *)(v32 + v30);
  uint64_t v35 = v30 + 1;
  *(_DWORD *)(v5 + 260) = v30 + 1;
  if (v33 < 0)
  {
    uint64_t v36 = (v34 >> 1) & 7;
    switch(v36)
    {
      case 1:
        if (v30 + 3 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(unsigned __int16 *)(v32 + v35);
        unsigned int v37 = v30 + 3;
        break;
      case 2:
        unsigned int v37 = v30 + 4;
        if (v37 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(unsigned __int16 *)(v32 + v35) | (*(unsigned __int8 *)(v32 + v35 + 2) << 16);
        break;
      case 3:
        if (v30 + 5 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(_DWORD *)(v32 + v35);
        unsigned int v37 = v30 + 5;
        break;
      case 4:
        if (v30 + 5 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(_DWORD *)(v32 + v35);
        *(_DWORD *)(v5 + 260) = v30 + 5;
        if ((int)v30 + 5 >= v31) {
          goto LABEL_83;
        }
        unsigned int v37 = v30 + 6;
        break;
      case 5:
        if (v30 + 5 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(_DWORD *)(v32 + v35);
        uint64_t v38 = (v30 + 5);
        *(_DWORD *)(v5 + 260) = v38;
        if (v38 + 2 > v31) {
          goto LABEL_83;
        }
        unsigned int v37 = v30 + 7;
        break;
      case 6:
        if (v30 + 5 > v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(_DWORD *)(v32 + v35);
        *(_DWORD *)(v5 + 260) = v30 + 5;
        unsigned int v37 = v30 + 8;
        if (v37 > v31) {
          goto LABEL_83;
        }
        break;
      case 7:
        if (v30 + 9 > v31) {
          goto LABEL_83;
        }
        uint64_t v35 = *(void *)(v32 + v35);
        unsigned int v37 = v30 + 9;
        break;
      default:
        if (v35 >= v31) {
          goto LABEL_83;
        }
        LODWORD(v35) = *(unsigned __int8 *)(v32 + v35);
        unsigned int v37 = v30 + 2;
        break;
    }
    *(_DWORD *)(v5 + 260) = v37;
    if (v33) {
      uint64_t v39 = -256 << (8 * v36);
    }
    else {
      LODWORD(v39) = 0;
    }
    LODWORD(v34) = v35 | v39;
  }
  *(_DWORD *)(v2 + 96) = v34;
  uint64_t v40 = *(unsigned int *)(v5 + 260);
  unint64_t v41 = *(unsigned int *)(v5 + 256);
  if (v40 >= v41) {
LABEL_83:
  }
    glpDeserialError(v5, 1u);
  int v42 = *(char *)(v32 + v40);
  unint64_t v43 = *(unsigned __int8 *)(v32 + v40);
  uint64_t v44 = v40 + 1;
  *(_DWORD *)(v5 + 260) = v40 + 1;
  if (v42 < 0)
  {
    uint64_t v45 = (v43 >> 1) & 7;
    switch(v45)
    {
      case 1:
        if (v40 + 3 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(unsigned __int16 *)(v32 + v44);
        unsigned int v46 = v40 + 3;
        break;
      case 2:
        unsigned int v46 = v40 + 4;
        if (v46 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(unsigned __int16 *)(v32 + v44) | (*(unsigned __int8 *)(v32 + v44 + 2) << 16);
        break;
      case 3:
        if (v40 + 5 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(_DWORD *)(v32 + v44);
        unsigned int v46 = v40 + 5;
        break;
      case 4:
        if (v40 + 5 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(_DWORD *)(v32 + v44);
        *(_DWORD *)(v5 + 260) = v40 + 5;
        if ((int)v40 + 5 >= v41) {
          goto LABEL_83;
        }
        unsigned int v46 = v40 + 6;
        break;
      case 5:
        if (v40 + 5 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(_DWORD *)(v32 + v44);
        uint64_t v47 = (v40 + 5);
        *(_DWORD *)(v5 + 260) = v47;
        if (v47 + 2 > v41) {
          goto LABEL_83;
        }
        unsigned int v46 = v40 + 7;
        break;
      case 6:
        if (v40 + 5 > v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(_DWORD *)(v32 + v44);
        *(_DWORD *)(v5 + 260) = v40 + 5;
        unsigned int v46 = v40 + 8;
        if (v46 > v41) {
          goto LABEL_83;
        }
        break;
      case 7:
        if (v40 + 9 > v41) {
          goto LABEL_83;
        }
        uint64_t v32 = *(void *)(v32 + v44);
        unsigned int v46 = v40 + 9;
        break;
      default:
        if (v44 >= v41) {
          goto LABEL_83;
        }
        LODWORD(v32) = *(unsigned __int8 *)(v32 + v44);
        unsigned int v46 = v40 + 2;
        break;
    }
    *(_DWORD *)(v5 + 260) = v46;
    if (v42) {
      uint64_t v48 = -256 << (8 * v45);
    }
    else {
      LODWORD(v48) = 0;
    }
    LODWORD(v43) = v32 | v48;
  }
  *(_DWORD *)(v2 + 100) = v43;
  return v2;
}

@end