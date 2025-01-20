@interface GLPBufferObject
@end

@implementation GLPBufferObject

uint64_t __deserialize_GLPBufferObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 32, "Deserialized");
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  v3 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 0x40000000;
  v25[2] = __deserialize_GLPType_block_invoke;
  v25[3] = &__block_descriptor_tmp_12;
  v25[4] = v3;
  deserialize_pointer(v3, (uint64_t)v25, (void *)v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(v4 + 260);
  unint64_t v6 = *(unsigned int *)(v4 + 256);
  if (v5 >= v6) {
    goto LABEL_56;
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
          goto LABEL_56;
        }
        LODWORD(v12) = *(unsigned __int16 *)(v7 + v10);
        LODWORD(v10) = v5 + 3;
        goto LABEL_23;
      case 2:
        unsigned int v13 = v5 + 4;
        if (v13 > v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(unsigned __int16 *)(v7 + v10) | (*(unsigned __int8 *)(v7 + v10 + 2) << 16);
        *(_DWORD *)(v4 + 260) = v13;
        LODWORD(v10) = v13;
        goto LABEL_24;
      case 3:
        if (v5 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        LODWORD(v10) = v5 + 5;
        goto LABEL_23;
      case 4:
        if (v5 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        if ((int)v5 + 5 >= v6) {
          goto LABEL_56;
        }
        LODWORD(v10) = v5 + 6;
        goto LABEL_23;
      case 5:
        if (v5 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        uint64_t v14 = (v5 + 5);
        *(_DWORD *)(v4 + 260) = v14;
        if (v14 + 2 > v6) {
          goto LABEL_56;
        }
        LODWORD(v10) = v5 + 7;
        goto LABEL_23;
      case 6:
        if (v5 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        LODWORD(v10) = v5 + 8;
        if ((int)v5 + 8 > v6) {
          goto LABEL_56;
        }
        goto LABEL_23;
      case 7:
        if (v5 + 9 > v6) {
          goto LABEL_56;
        }
        uint64_t v12 = *(void *)(v7 + v10);
        LODWORD(v10) = v5 + 9;
        goto LABEL_23;
      default:
        if (v10 >= v6) {
          goto LABEL_56;
        }
        LODWORD(v12) = *(unsigned __int8 *)(v7 + v10);
        LODWORD(v10) = v5 + 2;
LABEL_23:
        *(_DWORD *)(v4 + 260) = v10;
LABEL_24:
        if (v8) {
          uint64_t v15 = -256 << (8 * v11);
        }
        else {
          LODWORD(v15) = 0;
        }
        LODWORD(v9) = v12 | v15;
        break;
    }
  }
  *(_DWORD *)(v2 + 8) = v9;
  if (v10 >= v6) {
LABEL_56:
  }
    glpDeserialError(v4, 1u);
  int v16 = *(char *)(v7 + v10);
  unint64_t v17 = *(unsigned __int8 *)(v7 + v10);
  uint64_t v18 = v10 + 1;
  *(_DWORD *)(v4 + 260) = v18;
  if (v16 < 0)
  {
    uint64_t v19 = (v17 >> 1) & 7;
    switch(v19)
    {
      case 1:
        if ((unint64_t)v10 + 3 > v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(unsigned __int16 *)(v7 + v18);
        int v20 = v10 + 3;
        goto LABEL_50;
      case 2:
        unsigned int v21 = v10 + 4;
        if (v21 > v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(unsigned __int16 *)(v7 + v18) | (*(unsigned __int8 *)(v7 + v18 + 2) << 16);
LABEL_47:
        *(_DWORD *)(v4 + 260) = v21;
        goto LABEL_51;
      case 3:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(_DWORD *)(v7 + v18);
        int v20 = v10 + 5;
        goto LABEL_50;
      case 4:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(_DWORD *)(v7 + v18);
        *(_DWORD *)(v4 + 260) = v10 + 5;
        if ((int)v10 + 5 >= v6) {
          goto LABEL_56;
        }
        int v20 = v10 + 6;
        goto LABEL_50;
      case 5:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(_DWORD *)(v7 + v18);
        uint64_t v22 = (v10 + 5);
        *(_DWORD *)(v4 + 260) = v22;
        if (v22 + 2 > v6) {
          goto LABEL_56;
        }
        int v20 = v10 + 7;
        goto LABEL_50;
      case 6:
        if ((unint64_t)v10 + 5 <= v6)
        {
          LODWORD(v7) = *(_DWORD *)(v7 + v18);
          *(_DWORD *)(v4 + 260) = v10 + 5;
          unsigned int v21 = v10 + 8;
          if (v21 <= v6) {
            goto LABEL_47;
          }
        }
        goto LABEL_56;
      case 7:
        if ((unint64_t)v10 + 9 > v6) {
          goto LABEL_56;
        }
        uint64_t v7 = *(void *)(v7 + v18);
        int v20 = v10 + 9;
        goto LABEL_50;
      default:
        if (v18 >= v6) {
          goto LABEL_56;
        }
        LODWORD(v7) = *(unsigned __int8 *)(v7 + v18);
        int v20 = v10 + 2;
LABEL_50:
        *(_DWORD *)(v4 + 260) = v20;
LABEL_51:
        if (v16) {
          uint64_t v23 = -256 << (8 * v19);
        }
        else {
          LODWORD(v23) = 0;
        }
        LODWORD(v17) = v7 | v23;
        break;
    }
  }
  *(_DWORD *)(v2 + 12) = v17;
  return v2;
}

@end