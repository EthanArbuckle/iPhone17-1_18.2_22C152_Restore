@interface GLPLayoutPair
@end

@implementation GLPLayoutPair

uint64_t __deserialize_GLPLayoutPair_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 24, "Deserialized");
  v3 = *(void **)(a1 + 32);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 0x40000000;
  v33[2] = __deserialize_GLPLayoutPair_block_invoke;
  v33[3] = &__block_descriptor_tmp_4_0;
  v33[4] = v3;
  deserialize_pointer(v3, (uint64_t)v33, (void *)v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(v4 + 260);
  unint64_t v6 = *(unsigned int *)(v4 + 256);
  if (v5 >= v6) {
    goto LABEL_85;
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
          goto LABEL_85;
        }
        LODWORD(v12) = *(unsigned __int16 *)(v7 + v10);
        LODWORD(v10) = v5 + 3;
        goto LABEL_23;
      case 2:
        unsigned int v13 = v5 + 4;
        if (v13 > v6) {
          goto LABEL_85;
        }
        LODWORD(v12) = *(unsigned __int16 *)(v7 + v10) | (*(unsigned __int8 *)(v7 + v10 + 2) << 16);
        *(_DWORD *)(v4 + 260) = v13;
        LODWORD(v10) = v13;
        goto LABEL_24;
      case 3:
        if (v5 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        LODWORD(v10) = v5 + 5;
        goto LABEL_23;
      case 4:
        if (v5 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        if ((int)v5 + 5 >= v6) {
          goto LABEL_85;
        }
        LODWORD(v10) = v5 + 6;
        goto LABEL_23;
      case 5:
        if (v5 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        uint64_t v14 = (v5 + 5);
        *(_DWORD *)(v4 + 260) = v14;
        if (v14 + 2 > v6) {
          goto LABEL_85;
        }
        LODWORD(v10) = v5 + 7;
        goto LABEL_23;
      case 6:
        if (v5 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v12) = *(_DWORD *)(v7 + v10);
        *(_DWORD *)(v4 + 260) = v5 + 5;
        LODWORD(v10) = v5 + 8;
        if ((int)v5 + 8 > v6) {
          goto LABEL_85;
        }
        goto LABEL_23;
      case 7:
        if (v5 + 9 > v6) {
          goto LABEL_85;
        }
        uint64_t v12 = *(void *)(v7 + v10);
        LODWORD(v10) = v5 + 9;
        goto LABEL_23;
      default:
        if (v10 >= v6) {
          goto LABEL_85;
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
    goto LABEL_85;
  }
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
          goto LABEL_85;
        }
        LODWORD(v20) = *(unsigned __int16 *)(v7 + v18);
        LODWORD(v18) = v10 + 3;
        goto LABEL_50;
      case 2:
        unsigned int v21 = v10 + 4;
        if (v21 > v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(unsigned __int16 *)(v7 + v18) | (*(unsigned __int8 *)(v7 + v18 + 2) << 16);
        *(_DWORD *)(v4 + 260) = v21;
        LODWORD(v18) = v21;
        goto LABEL_51;
      case 3:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(_DWORD *)(v7 + v18);
        LODWORD(v18) = v10 + 5;
        goto LABEL_50;
      case 4:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(_DWORD *)(v7 + v18);
        *(_DWORD *)(v4 + 260) = v10 + 5;
        if ((int)v10 + 5 >= v6) {
          goto LABEL_85;
        }
        LODWORD(v18) = v10 + 6;
        goto LABEL_50;
      case 5:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(_DWORD *)(v7 + v18);
        uint64_t v22 = (v10 + 5);
        *(_DWORD *)(v4 + 260) = v22;
        if (v22 + 2 > v6) {
          goto LABEL_85;
        }
        LODWORD(v18) = v10 + 7;
        goto LABEL_50;
      case 6:
        if ((unint64_t)v10 + 5 > v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(_DWORD *)(v7 + v18);
        *(_DWORD *)(v4 + 260) = v10 + 5;
        LODWORD(v18) = v10 + 8;
        if ((int)v10 + 8 > v6) {
          goto LABEL_85;
        }
        goto LABEL_50;
      case 7:
        if ((unint64_t)v10 + 9 > v6) {
          goto LABEL_85;
        }
        uint64_t v20 = *(void *)(v7 + v18);
        LODWORD(v18) = v10 + 9;
        goto LABEL_50;
      default:
        if (v18 >= v6) {
          goto LABEL_85;
        }
        LODWORD(v20) = *(unsigned __int8 *)(v7 + v18);
        LODWORD(v18) = v10 + 2;
LABEL_50:
        *(_DWORD *)(v4 + 260) = v18;
LABEL_51:
        if (v16) {
          uint64_t v23 = -256 << (8 * v19);
        }
        else {
          LODWORD(v23) = 0;
        }
        LODWORD(v17) = v20 | v23;
        break;
    }
  }
  *(_DWORD *)(v2 + 12) = v17;
  if (v17 == 1)
  {
    if (v18 < v6)
    {
      int v24 = *(char *)(v7 + v18);
      unint64_t v25 = *(unsigned __int8 *)(v7 + v18);
      uint64_t v26 = v18 + 1;
      *(_DWORD *)(v4 + 260) = v26;
      if (v24 < 0)
      {
        uint64_t v27 = (v25 >> 1) & 7;
        switch(v27)
        {
          case 1:
            if ((unint64_t)v18 + 3 > v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(unsigned __int16 *)(v7 + v26);
            int v28 = v18 + 3;
            goto LABEL_78;
          case 2:
            unsigned int v29 = v18 + 4;
            if (v29 > v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(unsigned __int16 *)(v7 + v26) | (*(unsigned __int8 *)(v7 + v26 + 2) << 16);
LABEL_75:
            *(_DWORD *)(v4 + 260) = v29;
            goto LABEL_79;
          case 3:
            if ((unint64_t)v18 + 5 > v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(_DWORD *)(v7 + v26);
            int v28 = v18 + 5;
            goto LABEL_78;
          case 4:
            if ((unint64_t)v18 + 5 > v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(_DWORD *)(v7 + v26);
            *(_DWORD *)(v4 + 260) = v18 + 5;
            if ((int)v18 + 5 >= v6) {
              goto LABEL_85;
            }
            int v28 = v18 + 6;
            goto LABEL_78;
          case 5:
            if ((unint64_t)v18 + 5 > v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(_DWORD *)(v7 + v26);
            uint64_t v30 = (v18 + 5);
            *(_DWORD *)(v4 + 260) = v30;
            if (v30 + 2 > v6) {
              goto LABEL_85;
            }
            int v28 = v18 + 7;
            goto LABEL_78;
          case 6:
            if ((unint64_t)v18 + 5 <= v6)
            {
              LODWORD(v7) = *(_DWORD *)(v7 + v26);
              *(_DWORD *)(v4 + 260) = v18 + 5;
              unsigned int v29 = v18 + 8;
              if (v29 <= v6) {
                goto LABEL_75;
              }
            }
            goto LABEL_85;
          case 7:
            if ((unint64_t)v18 + 9 > v6) {
              goto LABEL_85;
            }
            uint64_t v7 = *(void *)(v7 + v26);
            int v28 = v18 + 9;
            goto LABEL_78;
          default:
            if (v26 >= v6) {
              goto LABEL_85;
            }
            LODWORD(v7) = *(unsigned __int8 *)(v7 + v26);
            int v28 = v18 + 2;
LABEL_78:
            *(_DWORD *)(v4 + 260) = v28;
LABEL_79:
            if (v24) {
              uint64_t v31 = -256 << (8 * v27);
            }
            else {
              LODWORD(v31) = 0;
            }
            LODWORD(v25) = v7 | v31;
            break;
        }
      }
      *(_DWORD *)(v2 + 16) = v25;
      return v2;
    }
LABEL_85:
    glpDeserialError(v4, 1u);
  }
  return v2;
}

@end