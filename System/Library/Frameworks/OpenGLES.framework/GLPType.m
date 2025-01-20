@interface GLPType
@end

@implementation GLPType

void __deserialize_GLPType_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(v2 + 260);
  unint64_t v4 = *(unsigned int *)(v2 + 256);
  if (v3 >= v4) {
LABEL_286:
  }
    glpDeserialError(v2, 1u);
  uint64_t v5 = *(void *)(v2 + 248);
  int v6 = *(char *)(v5 + v3);
  unint64_t v7 = *(unsigned __int8 *)(v5 + v3);
  uint64_t v8 = v3 + 1;
  *(_DWORD *)(v2 + 260) = v3 + 1;
  if (v6 < 0)
  {
    uint64_t v9 = (v7 >> 1) & 7;
    switch(v9)
    {
      case 1:
        if (v3 + 3 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(unsigned __int16 *)(v5 + v8);
        LODWORD(v8) = v3 + 3;
        goto LABEL_23;
      case 2:
        unsigned int v11 = v3 + 4;
        if (v11 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(unsigned __int16 *)(v5 + v8) | (*(unsigned __int8 *)(v5 + v8 + 2) << 16);
        *(_DWORD *)(v2 + 260) = v11;
        LODWORD(v8) = v11;
        goto LABEL_24;
      case 3:
        if (v3 + 5 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(_DWORD *)(v5 + v8);
        LODWORD(v8) = v3 + 5;
        goto LABEL_23;
      case 4:
        if (v3 + 5 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(_DWORD *)(v5 + v8);
        *(_DWORD *)(v2 + 260) = v3 + 5;
        if ((int)v3 + 5 >= v4) {
          goto LABEL_286;
        }
        LODWORD(v8) = v3 + 6;
        goto LABEL_23;
      case 5:
        if (v3 + 5 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(_DWORD *)(v5 + v8);
        uint64_t v12 = (v3 + 5);
        *(_DWORD *)(v2 + 260) = v12;
        if (v12 + 2 > v4) {
          goto LABEL_286;
        }
        LODWORD(v8) = v3 + 7;
        goto LABEL_23;
      case 6:
        if (v3 + 5 > v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(_DWORD *)(v5 + v8);
        *(_DWORD *)(v2 + 260) = v3 + 5;
        LODWORD(v8) = v3 + 8;
        if ((int)v3 + 8 > v4) {
          goto LABEL_286;
        }
        goto LABEL_23;
      case 7:
        if (v3 + 9 > v4) {
          goto LABEL_286;
        }
        uint64_t v10 = *(void *)(v5 + v8);
        LODWORD(v8) = v3 + 9;
        goto LABEL_23;
      default:
        if (v8 >= v4) {
          goto LABEL_286;
        }
        LODWORD(v10) = *(unsigned __int8 *)(v5 + v8);
        LODWORD(v8) = v3 + 2;
LABEL_23:
        *(_DWORD *)(v2 + 260) = v8;
LABEL_24:
        if (v6) {
          uint64_t v13 = -256 << (8 * v9);
        }
        else {
          LODWORD(v13) = 0;
        }
        LODWORD(v7) = v10 | v13;
        break;
    }
  }
  switch((int)v7)
  {
    case 0:
      if (v8 >= v4) {
        goto LABEL_286;
      }
      int v14 = *(char *)(v5 + v8);
      unint64_t v15 = *(unsigned __int8 *)(v5 + v8);
      uint64_t v16 = v8 + 1;
      *(_DWORD *)(v2 + 260) = v16;
      if (v14 < 0)
      {
        uint64_t v17 = (v15 >> 1) & 7;
        unint64_t v15 = -256 << (8 * v17);
        switch(v17)
        {
          case 1:
            if ((unint64_t)v8 + 3 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v16);
            unsigned int v18 = v8 + 3;
            break;
          case 2:
            unsigned int v18 = v8 + 4;
            if (v18 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v16) | (*(unsigned __int8 *)(v5 + v16 + 2) << 16);
            break;
          case 3:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v16);
            unsigned int v18 = v8 + 5;
            break;
          case 4:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v16);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            if ((int)v8 + 5 >= v4) {
              goto LABEL_286;
            }
            unsigned int v18 = v8 + 6;
            break;
          case 5:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v16);
            uint64_t v49 = (v8 + 5);
            *(_DWORD *)(v2 + 260) = v49;
            if (v49 + 2 > v4) {
              goto LABEL_286;
            }
            unsigned int v18 = v8 + 7;
            break;
          case 6:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v16);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            unsigned int v18 = v8 + 8;
            if (v18 > v4) {
              goto LABEL_286;
            }
            break;
          case 7:
            if ((unint64_t)v8 + 9 > v4) {
              goto LABEL_286;
            }
            uint64_t v5 = *(void *)(v5 + v16);
            unsigned int v18 = v8 + 9;
            break;
          default:
            if (v16 >= v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int8 *)(v5 + v16);
            unsigned int v18 = v8 + 2;
            break;
        }
        *(_DWORD *)(v2 + 260) = v18;
        if ((v14 & 1) == 0) {
          LODWORD(v15) = 0;
        }
        LODWORD(v15) = v5 | v15;
      }
      if (v15 >= 0x4F) {
        glpDeserialError(v2, 8u);
      }
      glpGetPrimitiveType(v15);
      return;
    case 1:
      if (v8 >= v4) {
        goto LABEL_286;
      }
      int v19 = *(char *)(v5 + v8);
      unint64_t v20 = *(unsigned __int8 *)(v5 + v8);
      uint64_t v21 = v8 + 1;
      *(_DWORD *)(v2 + 260) = v21;
      if (v19 < 0)
      {
        uint64_t v22 = (v20 >> 1) & 7;
        switch(v22)
        {
          case 1:
            if ((unint64_t)v8 + 3 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v21);
            unsigned int v23 = v8 + 3;
            break;
          case 2:
            unsigned int v23 = v8 + 4;
            if (v23 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v21) | (*(unsigned __int8 *)(v5 + v21 + 2) << 16);
            break;
          case 3:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v21);
            unsigned int v23 = v8 + 5;
            break;
          case 4:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v21);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            if ((int)v8 + 5 >= v4) {
              goto LABEL_286;
            }
            unsigned int v23 = v8 + 6;
            break;
          case 5:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v21);
            uint64_t v50 = (v8 + 5);
            *(_DWORD *)(v2 + 260) = v50;
            if (v50 + 2 > v4) {
              goto LABEL_286;
            }
            unsigned int v23 = v8 + 7;
            break;
          case 6:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v21);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            unsigned int v23 = v8 + 8;
            if (v23 > v4) {
              goto LABEL_286;
            }
            break;
          case 7:
            if ((unint64_t)v8 + 9 > v4) {
              goto LABEL_286;
            }
            uint64_t v5 = *(void *)(v5 + v21);
            unsigned int v23 = v8 + 9;
            break;
          default:
            if (v21 >= v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int8 *)(v5 + v21);
            unsigned int v23 = v8 + 2;
            break;
        }
        *(_DWORD *)(v2 + 260) = v23;
        if (v19) {
          uint64_t v51 = -256 << (8 * v22);
        }
        else {
          LODWORD(v51) = 0;
        }
        LODWORD(v20) = v5 | v51;
      }
      uint64_t v52 = v20;
      uint64_t v130 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(v2 + 240) + 8))(**(void **)(v2 + 240), 8 * v20, "Deserialized");
      uint64_t v128 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * v20, "Deserialized");
      uint64_t v126 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * v20, "Deserialized");
      unsigned int v123 = v20;
      uint64_t v124 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 16 * v20, "Deserialized");
      if (!v20) {
        goto LABEL_131;
      }
      uint64_t v53 = MEMORY[0x263EF8330];
      v54 = (void *)v126;
      v55 = (void *)(v124 + 8);
      v56 = (unint64_t *)v128;
      v57 = (void *)v130;
      do
      {
        v58 = *(void **)(a1 + 32);
        uint64_t v132 = v53;
        uint64_t v133 = 0x40000000;
        v134 = __deserialize_GLPType_block_invoke;
        v135 = &__block_descriptor_tmp_12;
        v136 = v58;
        deserialize_pointer(v58, (uint64_t)&v132, v57);
        uint64_t v2 = *(void *)(a1 + 32);
        uint64_t v59 = *(unsigned int *)(v2 + 260);
        unint64_t v60 = *(unsigned int *)(v2 + 256);
        if (v59 >= v60) {
          goto LABEL_286;
        }
        uint64_t v61 = *(void *)(v2 + 248);
        int v62 = *(char *)(v61 + v59);
        unint64_t v63 = *(unsigned __int8 *)(v61 + v59);
        uint64_t v64 = v59 + 1;
        *(_DWORD *)(v2 + 260) = v59 + 1;
        if (v62 < 0)
        {
          uint64_t v65 = (v63 >> 1) & 7;
          switch(v65)
          {
            case 1:
              if (v59 + 3 > v60) {
                goto LABEL_286;
              }
              unint64_t v66 = *(unsigned __int16 *)(v61 + v64);
              unsigned int v67 = v59 + 3;
              goto LABEL_125;
            case 2:
              unsigned int v67 = v59 + 4;
              if (v67 > v60) {
                goto LABEL_286;
              }
              unint64_t v66 = *(unsigned __int16 *)(v61 + v64) | ((unint64_t)*(unsigned __int8 *)(v61 + v64 + 2) << 16);
              goto LABEL_125;
            case 3:
              if (v59 + 5 > v60) {
                goto LABEL_286;
              }
              unint64_t v66 = *(unsigned int *)(v61 + v64);
              unsigned int v67 = v59 + 5;
              goto LABEL_125;
            case 4:
              if (v59 + 5 > v60) {
                goto LABEL_286;
              }
              uint64_t v68 = *(unsigned int *)(v61 + v64);
              *(_DWORD *)(v2 + 260) = v59 + 5;
              if ((int)v59 + 5 >= v60) {
                goto LABEL_286;
              }
              uint64_t v69 = *(unsigned __int8 *)(v61 + (v59 + 5));
              unsigned int v70 = v59 + 6;
              goto LABEL_122;
            case 5:
              if (v59 + 5 > v60) {
                goto LABEL_286;
              }
              uint64_t v68 = *(unsigned int *)(v61 + v64);
              uint64_t v71 = (v59 + 5);
              *(_DWORD *)(v2 + 260) = v71;
              if (v71 + 2 > v60) {
                goto LABEL_286;
              }
              uint64_t v69 = *(unsigned __int16 *)(v61 + v71);
              unsigned int v70 = v59 + 7;
              goto LABEL_122;
            case 6:
              if (v59 + 5 > v60) {
                goto LABEL_286;
              }
              uint64_t v68 = *(unsigned int *)(v61 + v64);
              unsigned int v72 = v59 + 5;
              *(_DWORD *)(v2 + 260) = v59 + 5;
              unsigned int v70 = v59 + 8;
              if (v70 > v60) {
                goto LABEL_286;
              }
              uint64_t v69 = *(unsigned __int16 *)(v61 + v72) | (*(unsigned __int8 *)(v61 + v72 + 2) << 16);
LABEL_122:
              *(_DWORD *)(v2 + 260) = v70;
              unint64_t v66 = v68 | (v69 << 32);
              goto LABEL_126;
            case 7:
              if (v59 + 9 > v60) {
                goto LABEL_286;
              }
              unint64_t v66 = *(void *)(v61 + v64);
              unsigned int v67 = v59 + 9;
              goto LABEL_125;
            default:
              if (v64 >= v60) {
                goto LABEL_286;
              }
              unint64_t v66 = *(unsigned __int8 *)(v61 + v64);
              unsigned int v67 = v59 + 2;
LABEL_125:
              *(_DWORD *)(v2 + 260) = v67;
LABEL_126:
              if (v62) {
                uint64_t v73 = -256 << (8 * v65);
              }
              else {
                uint64_t v73 = 0;
              }
              unint64_t v63 = v66 | v73;
              break;
          }
        }
        *v56++ = v63;
        uint64_t v132 = MEMORY[0x263EF8330];
        uint64_t v133 = 0x40000000;
        v134 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
        v135 = &__block_descriptor_tmp_3;
        v136 = (void *)v2;
        deserialize_pointer((void *)v2, (uint64_t)&v132, v54);
        *(v55 - 1) = deserialize_GLPString(*(void *)(a1 + 32));
        void *v55 = v74;
        ++v57;
        ++v54;
        v55 += 2;
        --v52;
      }
      while (v52);
LABEL_131:
      uint64_t v75 = deserialize_GLPString(*(void *)(a1 + 32));
      glpMakeStructType(*(void **)(*(void *)(a1 + 32) + 240), v75, v76, v123, v124, v130, v128, v126);
      return;
    case 2:
      uint64_t v131 = 0;
      uint64_t v132 = MEMORY[0x263EF8330];
      uint64_t v133 = 0x40000000;
      v134 = __deserialize_GLPType_block_invoke;
      v135 = &__block_descriptor_tmp_12;
      v136 = (void *)v2;
      deserialize_pointer((void *)v2, (uint64_t)&v132, &v131);
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v24 = *(unsigned int *)(v2 + 260);
      unint64_t v25 = *(unsigned int *)(v2 + 256);
      if (v24 >= v25) {
        goto LABEL_286;
      }
      uint64_t v26 = *(void *)(v2 + 248);
      int v27 = *(char *)(v26 + v24);
      unint64_t v28 = *(unsigned __int8 *)(v26 + v24);
      uint64_t v29 = v24 + 1;
      *(_DWORD *)(v2 + 260) = v24 + 1;
      if (v27 < 0)
      {
        uint64_t v30 = (v28 >> 1) & 7;
        switch(v30)
        {
          case 1:
            if (v24 + 3 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(unsigned __int16 *)(v26 + v29);
            LODWORD(v29) = v24 + 3;
            goto LABEL_149;
          case 2:
            unsigned int v77 = v24 + 4;
            if (v77 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(unsigned __int16 *)(v26 + v29) | (*(unsigned __int8 *)(v26 + v29 + 2) << 16);
            *(_DWORD *)(v2 + 260) = v77;
            LODWORD(v29) = v77;
            goto LABEL_150;
          case 3:
            if (v24 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(_DWORD *)(v26 + v29);
            LODWORD(v29) = v24 + 5;
            goto LABEL_149;
          case 4:
            if (v24 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(_DWORD *)(v26 + v29);
            *(_DWORD *)(v2 + 260) = v24 + 5;
            if ((int)v24 + 5 >= v25) {
              goto LABEL_286;
            }
            LODWORD(v29) = v24 + 6;
            goto LABEL_149;
          case 5:
            if (v24 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(_DWORD *)(v26 + v29);
            uint64_t v78 = (v24 + 5);
            *(_DWORD *)(v2 + 260) = v78;
            if (v78 + 2 > v25) {
              goto LABEL_286;
            }
            LODWORD(v29) = v24 + 7;
            goto LABEL_149;
          case 6:
            if (v24 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(_DWORD *)(v26 + v29);
            *(_DWORD *)(v2 + 260) = v24 + 5;
            LODWORD(v29) = v24 + 8;
            if ((int)v24 + 8 > v25) {
              goto LABEL_286;
            }
            goto LABEL_149;
          case 7:
            if (v24 + 9 > v25) {
              goto LABEL_286;
            }
            uint64_t v31 = *(void *)(v26 + v29);
            LODWORD(v29) = v24 + 9;
            goto LABEL_149;
          default:
            if (v29 >= v25) {
              goto LABEL_286;
            }
            LODWORD(v31) = *(unsigned __int8 *)(v26 + v29);
            LODWORD(v29) = v24 + 2;
LABEL_149:
            *(_DWORD *)(v2 + 260) = v29;
LABEL_150:
            if (v27) {
              uint64_t v79 = -256 << (8 * v30);
            }
            else {
              LODWORD(v79) = 0;
            }
            LODWORD(v28) = v31 | v79;
            break;
        }
      }
      if (v29 >= v25) {
        goto LABEL_286;
      }
      int v80 = *(char *)(v26 + v29);
      unint64_t v81 = *(unsigned __int8 *)(v26 + v29);
      uint64_t v82 = v29 + 1;
      *(_DWORD *)(v2 + 260) = v82;
      if (v80 < 0)
      {
        uint64_t v83 = (v81 >> 1) & 7;
        switch(v83)
        {
          case 1:
            if ((unint64_t)v29 + 3 > v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(unsigned __int16 *)(v26 + v82);
            int v84 = v29 + 3;
            goto LABEL_256;
          case 2:
            unsigned int v117 = v29 + 4;
            if (v117 > v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(unsigned __int16 *)(v26 + v82) | (*(unsigned __int8 *)(v26 + v82 + 2) << 16);
LABEL_253:
            *(_DWORD *)(v2 + 260) = v117;
            goto LABEL_257;
          case 3:
            if ((unint64_t)v29 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(_DWORD *)(v26 + v82);
            int v84 = v29 + 5;
            goto LABEL_256;
          case 4:
            if ((unint64_t)v29 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(_DWORD *)(v26 + v82);
            *(_DWORD *)(v2 + 260) = v29 + 5;
            if ((int)v29 + 5 >= v25) {
              goto LABEL_286;
            }
            int v84 = v29 + 6;
            goto LABEL_256;
          case 5:
            if ((unint64_t)v29 + 5 > v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(_DWORD *)(v26 + v82);
            uint64_t v118 = (v29 + 5);
            *(_DWORD *)(v2 + 260) = v118;
            if (v118 + 2 > v25) {
              goto LABEL_286;
            }
            int v84 = v29 + 7;
            goto LABEL_256;
          case 6:
            if ((unint64_t)v29 + 5 <= v25)
            {
              LODWORD(v26) = *(_DWORD *)(v26 + v82);
              *(_DWORD *)(v2 + 260) = v29 + 5;
              unsigned int v117 = v29 + 8;
              if (v117 <= v25) {
                goto LABEL_253;
              }
            }
            goto LABEL_286;
          case 7:
            if ((unint64_t)v29 + 9 > v25) {
              goto LABEL_286;
            }
            uint64_t v26 = *(void *)(v26 + v82);
            int v84 = v29 + 9;
            goto LABEL_256;
          default:
            if (v82 >= v25) {
              goto LABEL_286;
            }
            LODWORD(v26) = *(unsigned __int8 *)(v26 + v82);
            int v84 = v29 + 2;
LABEL_256:
            *(_DWORD *)(v2 + 260) = v84;
LABEL_257:
            if (v80) {
              uint64_t v119 = -256 << (8 * v83);
            }
            else {
              LODWORD(v119) = 0;
            }
            LODWORD(v81) = v26 | v119;
            break;
        }
      }
      glpMakeArrayType(*(void *)(v2 + 240), v131, v28, v81);
      return;
    case 3:
      uint64_t v131 = 0;
      uint64_t v132 = MEMORY[0x263EF8330];
      uint64_t v133 = 0x40000000;
      v134 = __deserialize_GLPType_block_invoke;
      v135 = &__block_descriptor_tmp_12;
      v136 = (void *)v2;
      deserialize_pointer((void *)v2, (uint64_t)&v132, &v131);
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v32 = *(unsigned int *)(v2 + 260);
      unint64_t v33 = *(unsigned int *)(v2 + 256);
      if (v32 >= v33) {
        goto LABEL_286;
      }
      uint64_t v34 = *(void *)(v2 + 248);
      int v35 = *(char *)(v34 + v32);
      unint64_t v36 = *(unsigned __int8 *)(v34 + v32);
      uint64_t v37 = v32 + 1;
      *(_DWORD *)(v2 + 260) = v32 + 1;
      if (v35 < 0)
      {
        uint64_t v38 = (v36 >> 1) & 7;
        switch(v38)
        {
          case 1:
            if (v32 + 3 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(unsigned __int16 *)(v34 + v37);
            LODWORD(v37) = v32 + 3;
            goto LABEL_176;
          case 2:
            unsigned int v85 = v32 + 4;
            if (v85 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(unsigned __int16 *)(v34 + v37) | (*(unsigned __int8 *)(v34 + v37 + 2) << 16);
            *(_DWORD *)(v2 + 260) = v85;
            LODWORD(v37) = v85;
            goto LABEL_177;
          case 3:
            if (v32 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(_DWORD *)(v34 + v37);
            LODWORD(v37) = v32 + 5;
            goto LABEL_176;
          case 4:
            if (v32 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(_DWORD *)(v34 + v37);
            *(_DWORD *)(v2 + 260) = v32 + 5;
            if ((int)v32 + 5 >= v33) {
              goto LABEL_286;
            }
            LODWORD(v37) = v32 + 6;
            goto LABEL_176;
          case 5:
            if (v32 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(_DWORD *)(v34 + v37);
            uint64_t v86 = (v32 + 5);
            *(_DWORD *)(v2 + 260) = v86;
            if (v86 + 2 > v33) {
              goto LABEL_286;
            }
            LODWORD(v37) = v32 + 7;
            goto LABEL_176;
          case 6:
            if (v32 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(_DWORD *)(v34 + v37);
            *(_DWORD *)(v2 + 260) = v32 + 5;
            LODWORD(v37) = v32 + 8;
            if ((int)v32 + 8 > v33) {
              goto LABEL_286;
            }
            goto LABEL_176;
          case 7:
            if (v32 + 9 > v33) {
              goto LABEL_286;
            }
            uint64_t v39 = *(void *)(v34 + v37);
            LODWORD(v37) = v32 + 9;
            goto LABEL_176;
          default:
            if (v37 >= v33) {
              goto LABEL_286;
            }
            LODWORD(v39) = *(unsigned __int8 *)(v34 + v37);
            LODWORD(v37) = v32 + 2;
LABEL_176:
            *(_DWORD *)(v2 + 260) = v37;
LABEL_177:
            if (v35) {
              uint64_t v87 = -256 << (8 * v38);
            }
            else {
              LODWORD(v87) = 0;
            }
            LODWORD(v36) = v39 | v87;
            break;
        }
      }
      if (v37 >= v33) {
        goto LABEL_286;
      }
      int v88 = *(char *)(v34 + v37);
      unint64_t v89 = *(unsigned __int8 *)(v34 + v37);
      uint64_t v90 = v37 + 1;
      *(_DWORD *)(v2 + 260) = v90;
      if (v88 < 0)
      {
        uint64_t v91 = (v89 >> 1) & 7;
        switch(v91)
        {
          case 1:
            if ((unint64_t)v37 + 3 > v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(unsigned __int16 *)(v34 + v90);
            int v92 = v37 + 3;
            goto LABEL_279;
          case 2:
            unsigned int v120 = v37 + 4;
            if (v120 > v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(unsigned __int16 *)(v34 + v90) | (*(unsigned __int8 *)(v34 + v90 + 2) << 16);
LABEL_276:
            *(_DWORD *)(v2 + 260) = v120;
            goto LABEL_280;
          case 3:
            if ((unint64_t)v37 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(_DWORD *)(v34 + v90);
            int v92 = v37 + 5;
            goto LABEL_279;
          case 4:
            if ((unint64_t)v37 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(_DWORD *)(v34 + v90);
            *(_DWORD *)(v2 + 260) = v37 + 5;
            if ((int)v37 + 5 >= v33) {
              goto LABEL_286;
            }
            int v92 = v37 + 6;
            goto LABEL_279;
          case 5:
            if ((unint64_t)v37 + 5 > v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(_DWORD *)(v34 + v90);
            uint64_t v121 = (v37 + 5);
            *(_DWORD *)(v2 + 260) = v121;
            if (v121 + 2 > v33) {
              goto LABEL_286;
            }
            int v92 = v37 + 7;
            goto LABEL_279;
          case 6:
            if ((unint64_t)v37 + 5 <= v33)
            {
              LODWORD(v34) = *(_DWORD *)(v34 + v90);
              *(_DWORD *)(v2 + 260) = v37 + 5;
              unsigned int v120 = v37 + 8;
              if (v120 <= v33) {
                goto LABEL_276;
              }
            }
            goto LABEL_286;
          case 7:
            if ((unint64_t)v37 + 9 > v33) {
              goto LABEL_286;
            }
            uint64_t v34 = *(void *)(v34 + v90);
            int v92 = v37 + 9;
            goto LABEL_279;
          default:
            if (v90 >= v33) {
              goto LABEL_286;
            }
            LODWORD(v34) = *(unsigned __int8 *)(v34 + v90);
            int v92 = v37 + 2;
LABEL_279:
            *(_DWORD *)(v2 + 260) = v92;
LABEL_280:
            if (v88) {
              uint64_t v122 = -256 << (8 * v91);
            }
            else {
              LODWORD(v122) = 0;
            }
            LODWORD(v89) = v34 | v122;
            break;
        }
      }
      glpMakeBankType(*(void *)(v2 + 240), v89, v131, v36);
      return;
    case 4:
      if (v8 >= v4) {
        goto LABEL_286;
      }
      int v40 = *(char *)(v5 + v8);
      unint64_t v41 = *(unsigned __int8 *)(v5 + v8);
      uint64_t v42 = v8 + 1;
      *(_DWORD *)(v2 + 260) = v42;
      if (v40 < 0)
      {
        uint64_t v43 = (v41 >> 1) & 7;
        switch(v43)
        {
          case 1:
            if ((unint64_t)v8 + 3 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v42);
            unsigned int v44 = v8 + 3;
            break;
          case 2:
            unsigned int v44 = v8 + 4;
            if (v44 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int16 *)(v5 + v42) | (*(unsigned __int8 *)(v5 + v42 + 2) << 16);
            break;
          case 3:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v42);
            unsigned int v44 = v8 + 5;
            break;
          case 4:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v42);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            if ((int)v8 + 5 >= v4) {
              goto LABEL_286;
            }
            unsigned int v44 = v8 + 6;
            break;
          case 5:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v42);
            uint64_t v93 = (v8 + 5);
            *(_DWORD *)(v2 + 260) = v93;
            if (v93 + 2 > v4) {
              goto LABEL_286;
            }
            unsigned int v44 = v8 + 7;
            break;
          case 6:
            if ((unint64_t)v8 + 5 > v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(_DWORD *)(v5 + v42);
            *(_DWORD *)(v2 + 260) = v8 + 5;
            unsigned int v44 = v8 + 8;
            if (v44 > v4) {
              goto LABEL_286;
            }
            break;
          case 7:
            if ((unint64_t)v8 + 9 > v4) {
              goto LABEL_286;
            }
            uint64_t v5 = *(void *)(v5 + v42);
            unsigned int v44 = v8 + 9;
            break;
          default:
            if (v42 >= v4) {
              goto LABEL_286;
            }
            LODWORD(v5) = *(unsigned __int8 *)(v5 + v42);
            unsigned int v44 = v8 + 2;
            break;
        }
        *(_DWORD *)(v2 + 260) = v44;
        if (v40) {
          uint64_t v94 = -256 << (8 * v43);
        }
        else {
          LODWORD(v94) = 0;
        }
        LODWORD(v41) = v5 | v94;
      }
      uint64_t v129 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(v2 + 240) + 8))(**(void **)(v2 + 240), 8 * v41, "Deserialized");
      uint64_t v127 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * v41, "Deserialized");
      uint64_t v125 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 8 * v41, "Deserialized");
      if (!v41) {
        goto LABEL_238;
      }
      uint64_t v95 = MEMORY[0x263EF8330];
      v96 = (void *)v129;
      uint64_t v97 = v41;
      v98 = (void *)v125;
      v99 = (unint64_t *)v127;
      break;
    case 5:
      uint64_t v45 = deserialize_GLPString(v2);
      uint64_t v47 = v46;
      v48 = *(void **)(a1 + 32);
      uint64_t v131 = 0;
      uint64_t v132 = MEMORY[0x263EF8330];
      uint64_t v133 = 0x40000000;
      v134 = (uint64_t (*)())__deserialize_GLPFunctionObject_block_invoke;
      v135 = &__block_descriptor_tmp_5;
      v136 = v48;
      deserialize_pointer(v48, (uint64_t)&v132, &v131);
      glpMakeSubroutineType(*(void *)(*(void *)(a1 + 32) + 240), v45, v47, v131);
      return;
    default:
      glpDeserialError(v2, 7u);
  }
  do
  {
    v100 = *(void **)(a1 + 32);
    uint64_t v132 = v95;
    uint64_t v133 = 0x40000000;
    v134 = __deserialize_GLPType_block_invoke;
    v135 = &__block_descriptor_tmp_12;
    v136 = v100;
    deserialize_pointer(v100, (uint64_t)&v132, v96);
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v101 = *(unsigned int *)(v2 + 260);
    unint64_t v102 = *(unsigned int *)(v2 + 256);
    if (v101 >= v102) {
      goto LABEL_286;
    }
    uint64_t v103 = *(void *)(v2 + 248);
    int v104 = *(char *)(v103 + v101);
    unint64_t v105 = *(unsigned __int8 *)(v103 + v101);
    uint64_t v106 = v101 + 1;
    *(_DWORD *)(v2 + 260) = v101 + 1;
    if (v104 < 0)
    {
      uint64_t v107 = (v105 >> 1) & 7;
      switch(v107)
      {
        case 1:
          if (v101 + 3 > v102) {
            goto LABEL_286;
          }
          unint64_t v108 = *(unsigned __int16 *)(v103 + v106);
          unsigned int v109 = v101 + 3;
          goto LABEL_232;
        case 2:
          unsigned int v109 = v101 + 4;
          if (v109 > v102) {
            goto LABEL_286;
          }
          unint64_t v108 = *(unsigned __int16 *)(v103 + v106) | ((unint64_t)*(unsigned __int8 *)(v103 + v106 + 2) << 16);
          goto LABEL_232;
        case 3:
          if (v101 + 5 > v102) {
            goto LABEL_286;
          }
          unint64_t v108 = *(unsigned int *)(v103 + v106);
          unsigned int v109 = v101 + 5;
          goto LABEL_232;
        case 4:
          if (v101 + 5 > v102) {
            goto LABEL_286;
          }
          uint64_t v110 = *(unsigned int *)(v103 + v106);
          *(_DWORD *)(v2 + 260) = v101 + 5;
          if ((int)v101 + 5 >= v102) {
            goto LABEL_286;
          }
          uint64_t v111 = *(unsigned __int8 *)(v103 + (v101 + 5));
          unsigned int v112 = v101 + 6;
          goto LABEL_229;
        case 5:
          if (v101 + 5 > v102) {
            goto LABEL_286;
          }
          uint64_t v110 = *(unsigned int *)(v103 + v106);
          uint64_t v113 = (v101 + 5);
          *(_DWORD *)(v2 + 260) = v113;
          if (v113 + 2 > v102) {
            goto LABEL_286;
          }
          uint64_t v111 = *(unsigned __int16 *)(v103 + v113);
          unsigned int v112 = v101 + 7;
          goto LABEL_229;
        case 6:
          if (v101 + 5 > v102) {
            goto LABEL_286;
          }
          uint64_t v110 = *(unsigned int *)(v103 + v106);
          unsigned int v114 = v101 + 5;
          *(_DWORD *)(v2 + 260) = v101 + 5;
          unsigned int v112 = v101 + 8;
          if (v112 > v102) {
            goto LABEL_286;
          }
          uint64_t v111 = *(unsigned __int16 *)(v103 + v114) | (*(unsigned __int8 *)(v103 + v114 + 2) << 16);
LABEL_229:
          *(_DWORD *)(v2 + 260) = v112;
          unint64_t v108 = v110 | (v111 << 32);
          goto LABEL_233;
        case 7:
          if (v101 + 9 > v102) {
            goto LABEL_286;
          }
          unint64_t v108 = *(void *)(v103 + v106);
          unsigned int v109 = v101 + 9;
          goto LABEL_232;
        default:
          if (v106 >= v102) {
            goto LABEL_286;
          }
          unint64_t v108 = *(unsigned __int8 *)(v103 + v106);
          unsigned int v109 = v101 + 2;
LABEL_232:
          *(_DWORD *)(v2 + 260) = v109;
LABEL_233:
          if (v104) {
            uint64_t v115 = -256 << (8 * v107);
          }
          else {
            uint64_t v115 = 0;
          }
          unint64_t v105 = v108 | v115;
          break;
      }
    }
    *v99++ = v105;
    uint64_t v132 = MEMORY[0x263EF8330];
    uint64_t v133 = 0x40000000;
    v134 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
    v135 = &__block_descriptor_tmp_3;
    v136 = (void *)v2;
    deserialize_pointer((void *)v2, (uint64_t)&v132, v98);
    ++v96;
    ++v98;
    --v97;
  }
  while (v97);
LABEL_238:
  v116 = *(void **)(a1 + 32);
  uint64_t v131 = 0;
  uint64_t v132 = MEMORY[0x263EF8330];
  uint64_t v133 = 0x40000000;
  v134 = __deserialize_GLPType_block_invoke;
  v135 = &__block_descriptor_tmp_12;
  v136 = v116;
  deserialize_pointer(v116, (uint64_t)&v132, &v131);
  glpMakeFunctionType(*(void **)(*(void *)(a1 + 32) + 240), v131, v41, v129, v127, v125);
}

@end