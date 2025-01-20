@interface GLPInterfaceBlockObject
@end

@implementation GLPInterfaceBlockObject

uint64_t __deserialize_GLPInterfaceBlockObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 88, "Deserialized");
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(void *)(v2 + 80) = 0;
  *(void *)uint64_t v2 = deserialize_GLPString(*(void *)(a1 + 32));
  *(void *)(v2 + 8) = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(v4 + 260);
  if (v5 >= *(_DWORD *)(v4 + 256)) {
    goto LABEL_37;
  }
  int v6 = *(unsigned __int8 *)(*(void *)(v4 + 248) + v5);
  *(_DWORD *)(v4 + 260) = v5 + 1;
  *(unsigned char *)(v2 + 32) = v6;
  if (v6)
  {
    v7 = (const char *)deserialize_GLPString(v4);
  }
  else
  {
    unint64_t v8 = 0xDFA3F2CD0000004BLL;
    v7 = "<<BUG: printing instance name of interface block without an instance name>>";
  }
  *(void *)(v2 + 16) = v7;
  *(void *)(v2 + 24) = v8;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(v4 + 260);
  unint64_t v10 = *(unsigned int *)(v4 + 256);
  if (v9 >= v10) {
LABEL_37:
  }
    glpDeserialError(v4, 1u);
  uint64_t v11 = *(void *)(v4 + 248);
  int v12 = *(char *)(v11 + v9);
  unint64_t v13 = *(unsigned __int8 *)(v11 + v9);
  uint64_t v14 = v9 + 1;
  *(_DWORD *)(v4 + 260) = v9 + 1;
  if (v12 < 0)
  {
    uint64_t v15 = (v13 >> 1) & 7;
    switch(v15)
    {
      case 1:
        if (v9 + 3 > v10) {
          goto LABEL_37;
        }
        unint64_t v16 = *(unsigned __int16 *)(v11 + v14);
        unsigned int v17 = v9 + 3;
        goto LABEL_28;
      case 2:
        unsigned int v17 = v9 + 4;
        if (v17 > v10) {
          goto LABEL_37;
        }
        unint64_t v16 = *(unsigned __int16 *)(v11 + v14) | ((unint64_t)*(unsigned __int8 *)(v11 + v14 + 2) << 16);
        goto LABEL_28;
      case 3:
        if (v9 + 5 > v10) {
          goto LABEL_37;
        }
        unint64_t v16 = *(unsigned int *)(v11 + v14);
        unsigned int v17 = v9 + 5;
        goto LABEL_28;
      case 4:
        if (v9 + 5 > v10) {
          goto LABEL_37;
        }
        uint64_t v18 = *(unsigned int *)(v11 + v14);
        *(_DWORD *)(v4 + 260) = v9 + 5;
        if ((int)v9 + 5 >= v10) {
          goto LABEL_37;
        }
        uint64_t v19 = *(unsigned __int8 *)(v11 + (v9 + 5));
        unsigned int v20 = v9 + 6;
        goto LABEL_25;
      case 5:
        if (v9 + 5 > v10) {
          goto LABEL_37;
        }
        uint64_t v18 = *(unsigned int *)(v11 + v14);
        uint64_t v21 = (v9 + 5);
        *(_DWORD *)(v4 + 260) = v21;
        if (v21 + 2 > v10) {
          goto LABEL_37;
        }
        uint64_t v19 = *(unsigned __int16 *)(v11 + v21);
        unsigned int v20 = v9 + 7;
        goto LABEL_25;
      case 6:
        if (v9 + 5 > v10) {
          goto LABEL_37;
        }
        uint64_t v18 = *(unsigned int *)(v11 + v14);
        unsigned int v22 = v9 + 5;
        *(_DWORD *)(v4 + 260) = v9 + 5;
        unsigned int v20 = v9 + 8;
        if (v20 > v10) {
          goto LABEL_37;
        }
        uint64_t v19 = *(unsigned __int16 *)(v11 + v22) | (*(unsigned __int8 *)(v11 + v22 + 2) << 16);
LABEL_25:
        *(_DWORD *)(v4 + 260) = v20;
        unint64_t v16 = v18 | (v19 << 32);
        goto LABEL_29;
      case 7:
        if (v9 + 9 > v10) {
          goto LABEL_37;
        }
        unint64_t v16 = *(void *)(v11 + v14);
        unsigned int v17 = v9 + 9;
        goto LABEL_28;
      default:
        if (v14 >= v10) {
          goto LABEL_37;
        }
        unint64_t v16 = *(unsigned __int8 *)(v11 + v14);
        unsigned int v17 = v9 + 2;
LABEL_28:
        *(_DWORD *)(v4 + 260) = v17;
LABEL_29:
        if (v12) {
          uint64_t v23 = -256 << (8 * v15);
        }
        else {
          uint64_t v23 = 0;
        }
        unint64_t v13 = v16 | v23;
        break;
    }
  }
  *(void *)(v2 + 40) = v13;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 0x40000000;
  v36 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
  v37 = &__block_descriptor_tmp_3;
  v38 = (void *)v4;
  deserialize_pointer((void *)v4, (uint64_t)&v34, (void *)(v2 + 56));
  v24 = *(void **)(a1 + 32);
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 0x40000000;
  v36 = __deserialize_GLPType_block_invoke;
  v37 = &__block_descriptor_tmp_12;
  v38 = v24;
  deserialize_pointer(v24, (uint64_t)&v34, (void *)(v2 + 64));
  unsigned int IBVariableObjectCount = glpGetIBVariableObjectCount(*(void *)(v2 + 40), *(unsigned int **)(v2 + 64));
  *(void *)(v2 + 72) = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32)
                                                                                              + 240)
                                                                                  + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * IBVariableObjectCount, "Deserialized");
  if (IBVariableObjectCount)
  {
    uint64_t v26 = 0;
    uint64_t v27 = IBVariableObjectCount;
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 8 * v27;
    do
    {
      v30 = *(void **)(a1 + 32);
      v31 = (void *)(*(void *)(v2 + 72) + v26);
      uint64_t v34 = v28;
      uint64_t v35 = 0x40000000;
      v36 = __deserialize_GLPVariableObject_block_invoke;
      v37 = &__block_descriptor_tmp_6;
      v38 = v30;
      deserialize_pointer(v30, (uint64_t)&v34, v31);
      v26 += 8;
    }
    while (v29 != v26);
  }
  v32 = *(void **)(a1 + 32);
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 0x40000000;
  v36 = (uint64_t (*)())__deserialize_GLPBufferObject_block_invoke;
  v37 = &__block_descriptor_tmp_7;
  v38 = v32;
  deserialize_pointer(v32, (uint64_t)&v34, (void *)(v2 + 80));
  return v2;
}

@end