@interface GLPValue
@end

@implementation GLPValue

char *__deserialize_GLPValue_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v55[1] = *MEMORY[0x263EF8340];
  MutableValue = glpMakeMutableValue(*(void *)(*(void *)(a1 + 32) + 240), *(unsigned int **)(a1 + 40), 0, a4, a5, a6, a7, a8, v55[0]);
  unsigned int v10 = glpABIGetTypeSize(0, *(void *)(a1 + 40), 0);
  uint64_t Size = glpTypeSizeGetSize(v10);
  unsigned int v12 = Size;
  MEMORY[0x270FA5388](Size);
  v14 = (char *)v55 - v13;
  glpTypeGetAppleVec4Types(*(unsigned int **)(a1 + 40), (uint64_t *)((char *)v55 - v13), 1, 0, 0, 0, 0, 0, 0);
  if (v12)
  {
    uint64_t v15 = 0;
    v16 = MutableValue;
    uint64_t v17 = v12;
    do
    {
      int ScalarType = glpPrimitiveTypeGetScalarType(*(unsigned int *)&v14[4 * v15]);
      unsigned int ScalarCount = glpPrimitiveTypeGetScalarCount(*(unsigned int *)&v14[4 * v15]);
      unsigned int v20 = ScalarCount;
      if (ScalarType <= 8)
      {
        if (ScalarType == 1)
        {
          if (ScalarCount)
          {
            uint64_t v52 = 0;
            uint64_t v53 = 4 * ScalarCount;
            do
            {
              *(float *)&v16[v52] = deserialize_float(*(void *)(a1 + 32));
              v52 += 4;
            }
            while (v53 != v52);
          }
        }
        else
        {
          if (ScalarType != 5) {
LABEL_84:
          }
            abort();
          if (ScalarCount)
          {
            uint64_t v26 = 0;
            uint64_t v22 = *(void *)(a1 + 32);
            uint64_t v27 = 4 * v20;
            while (1)
            {
              uint64_t v28 = *(unsigned int *)(v22 + 260);
              unint64_t v29 = *(unsigned int *)(v22 + 256);
              if (v28 >= v29) {
                break;
              }
              uint64_t v30 = *(void *)(v22 + 248);
              int v31 = *(char *)(v30 + v28);
              unint64_t v32 = *(unsigned __int8 *)(v30 + v28);
              uint64_t v33 = v28 + 1;
              *(_DWORD *)(v22 + 260) = v28 + 1;
              if (v31 < 0)
              {
                uint64_t v34 = (v32 >> 1) & 7;
                switch(v34)
                {
                  case 1:
                    if (v28 + 3 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(unsigned __int16 *)(v30 + v33);
                    unsigned int v35 = v28 + 3;
                    break;
                  case 2:
                    unsigned int v35 = v28 + 4;
                    if (v35 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(unsigned __int16 *)(v30 + v33) | (*(unsigned __int8 *)(v30 + v33 + 2) << 16);
                    break;
                  case 3:
                    if (v28 + 5 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(_DWORD *)(v30 + v33);
                    unsigned int v35 = v28 + 5;
                    break;
                  case 4:
                    if (v28 + 5 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(_DWORD *)(v30 + v33);
                    *(_DWORD *)(v22 + 260) = v28 + 5;
                    if ((int)v28 + 5 >= v29) {
                      goto LABEL_83;
                    }
                    unsigned int v35 = v28 + 6;
                    break;
                  case 5:
                    if (v28 + 5 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(_DWORD *)(v30 + v33);
                    uint64_t v36 = (v28 + 5);
                    *(_DWORD *)(v22 + 260) = v36;
                    if (v36 + 2 > v29) {
                      goto LABEL_83;
                    }
                    unsigned int v35 = v28 + 7;
                    break;
                  case 6:
                    if (v28 + 5 > v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(_DWORD *)(v30 + v33);
                    *(_DWORD *)(v22 + 260) = v28 + 5;
                    unsigned int v35 = v28 + 8;
                    if (v35 > v29) {
                      goto LABEL_83;
                    }
                    break;
                  case 7:
                    if (v28 + 9 > v29) {
                      goto LABEL_83;
                    }
                    uint64_t v30 = *(void *)(v30 + v33);
                    unsigned int v35 = v28 + 9;
                    break;
                  default:
                    if (v33 >= v29) {
                      goto LABEL_83;
                    }
                    LODWORD(v30) = *(unsigned __int8 *)(v30 + v33);
                    unsigned int v35 = v28 + 2;
                    break;
                }
                *(_DWORD *)(v22 + 260) = v35;
                if (v31) {
                  uint64_t v37 = -256 << (8 * v34);
                }
                else {
                  LODWORD(v37) = 0;
                }
                LODWORD(v32) = v30 | v37;
              }
              *(_DWORD *)&v16[v26] = v32;
              v26 += 4;
              if (v27 == v26) {
                goto LABEL_81;
              }
            }
LABEL_83:
            glpDeserialError(v22, 1u);
          }
        }
      }
      else
      {
        switch(ScalarType)
        {
          case 62:
            if (ScalarCount)
            {
              uint64_t v38 = 0;
              uint64_t v39 = 8 * ScalarCount;
              do
              {
                *(double *)&v16[v38] = deserialize_double(*(void *)(a1 + 32));
                v38 += 8;
              }
              while (v39 != v38);
            }
            break;
          case 36:
            if (ScalarCount)
            {
              uint64_t v40 = 0;
              uint64_t v22 = *(void *)(a1 + 32);
              uint64_t v41 = 4 * v20;
              while (1)
              {
                uint64_t v42 = *(unsigned int *)(v22 + 260);
                unint64_t v43 = *(unsigned int *)(v22 + 256);
                if (v42 >= v43) {
                  goto LABEL_83;
                }
                uint64_t v44 = *(void *)(v22 + 248);
                int v45 = *(char *)(v44 + v42);
                unint64_t v46 = *(unsigned __int8 *)(v44 + v42);
                uint64_t v47 = v42 + 1;
                *(_DWORD *)(v22 + 260) = v42 + 1;
                if (v45 < 0)
                {
                  uint64_t v48 = (v46 >> 1) & 7;
                  switch(v48)
                  {
                    case 1:
                      if (v42 + 3 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(unsigned __int16 *)(v44 + v47);
                      unsigned int v49 = v42 + 3;
                      break;
                    case 2:
                      unsigned int v49 = v42 + 4;
                      if (v49 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(unsigned __int16 *)(v44 + v47) | (*(unsigned __int8 *)(v44 + v47 + 2) << 16);
                      break;
                    case 3:
                      if (v42 + 5 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(_DWORD *)(v44 + v47);
                      unsigned int v49 = v42 + 5;
                      break;
                    case 4:
                      if (v42 + 5 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(_DWORD *)(v44 + v47);
                      *(_DWORD *)(v22 + 260) = v42 + 5;
                      if ((int)v42 + 5 >= v43) {
                        goto LABEL_83;
                      }
                      unsigned int v49 = v42 + 6;
                      break;
                    case 5:
                      if (v42 + 5 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(_DWORD *)(v44 + v47);
                      uint64_t v50 = (v42 + 5);
                      *(_DWORD *)(v22 + 260) = v50;
                      if (v50 + 2 > v43) {
                        goto LABEL_83;
                      }
                      unsigned int v49 = v42 + 7;
                      break;
                    case 6:
                      if (v42 + 5 > v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(_DWORD *)(v44 + v47);
                      *(_DWORD *)(v22 + 260) = v42 + 5;
                      unsigned int v49 = v42 + 8;
                      if (v49 > v43) {
                        goto LABEL_83;
                      }
                      break;
                    case 7:
                      if (v42 + 9 > v43) {
                        goto LABEL_83;
                      }
                      uint64_t v44 = *(void *)(v44 + v47);
                      unsigned int v49 = v42 + 9;
                      break;
                    default:
                      if (v47 >= v43) {
                        goto LABEL_83;
                      }
                      LODWORD(v44) = *(unsigned __int8 *)(v44 + v47);
                      unsigned int v49 = v42 + 2;
                      break;
                  }
                  *(_DWORD *)(v22 + 260) = v49;
                  if (v45) {
                    uint64_t v51 = -256 << (8 * v48);
                  }
                  else {
                    LODWORD(v51) = 0;
                  }
                  LODWORD(v46) = v44 | v51;
                }
                *(_DWORD *)&v16[v40] = v46;
                v40 += 4;
                if (v41 == v40) {
                  goto LABEL_81;
                }
              }
            }
            break;
          case 9:
            if (ScalarCount)
            {
              uint64_t v21 = 0;
              uint64_t v22 = *(void *)(a1 + 32);
              uint64_t v23 = 4 * v20;
              while (1)
              {
                uint64_t v24 = *(unsigned int *)(v22 + 260);
                if (v24 >= *(_DWORD *)(v22 + 256)) {
                  goto LABEL_83;
                }
                int v25 = *(unsigned __int8 *)(*(void *)(v22 + 248) + v24);
                *(_DWORD *)(v22 + 260) = v24 + 1;
                *(_DWORD *)&v16[v21] = v25 != 0;
                v21 += 4;
                if (v23 == v21) {
                  goto LABEL_81;
                }
              }
            }
            break;
          default:
            goto LABEL_84;
        }
      }
LABEL_81:
      ++v15;
      v16 += 16;
    }
    while (v15 != v17);
  }
  return MutableValue;
}

@end