@interface RETextureLoaderASTCHelper
+ (int64_t)isASTCHDRData:(id)a3 textureType:(unint64_t)a4 error:(id *)a5;
@end

@implementation RETextureLoaderASTCHelper

+ (int64_t)isASTCHDRData:(id)a3 textureType:(unint64_t)a4 error:(id *)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__RETextureLoaderASTCHelper_isASTCHDRData_textureType_error___block_invoke;
  v12[3] = &unk_264BE8178;
  v12[4] = &v13;
  v12[5] = a4;
  [a3 enumerateByteRangesUsingBlock:v12];
  v6 = v14;
  if (a5 && v14[3] == -1)
  {
    uint64_t v7 = *MEMORY[0x263F08320];
    v17[0] = @"MTKTextureLoaderErrorKey";
    v17[1] = v7;
    v18[0] = @"Could not load ASTC texture, data is malformed";
    v18[1] = @"Could not load ASTC texture, data is malformed";
    v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MTKTextureLoaderErrorDomain" code:-1 userInfo:v8];

    *a5 = v9;
    v6 = v14;
  }
  int64_t v10 = v6[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __61__RETextureLoaderASTCHelper_isASTCHDRData_textureType_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if ((a4 & 0xF) != 0)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -1;
    *a5 = 1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 1;
  do
  {
    uint64_t v7 = v5 + 16;
    if (v5 + 16 > a4) {
      break;
    }
    int16x8_t v8 = *(int16x8_t *)(a2 + v5);
    int16x8_t v66 = v8;
    unsigned int v9 = v66.u8[0] | ((v66.i8[1] & 7) << 8);
    if ((v66.u8[0] | ((v66.i8[1] & 7) << 8) & 0x1FF) == 0x1FC)
    {
      if ((v66.i8[1] & 2) != 0) {
        goto LABEL_102;
      }
      goto LABEL_76;
    }
    unint64_t v10 = ((unint64_t)v66.u8[1] >> 3) & 3;
    if (!v10)
    {
      unsigned int v22 = ((v66.u8[1] | (v66.u8[2] << 8)) >> 5) & 0xF;
LABEL_16:
      unsigned int v23 = v22 - 2;
      if (v23 < 0xE && ((0x3223u >> v23) & 1) != 0) {
        goto LABEL_102;
      }
      goto LABEL_76;
    }
    unsigned int v11 = ((v66.u8[2] | (v66.u8[3] << 8)) >> 7) & 3;
    if (!v11)
    {
      unsigned int v22 = (v66.u8[3] >> 1) & 0xF;
      goto LABEL_16;
    }
    unsigned int v12 = (v66.i8[1] & 7) << 8;
    unsigned int v13 = v12 >> 9;
    int v14 = (v12 >> 9) & 1;
    unsigned int v15 = v12 >> 10;
    int v16 = (v66.u8[0] >> 5) & 3;
    int v17 = v66.i8[0] & 3;
    if (*(void *)(result + 40) == 7)
    {
      if ((v66.i8[0] & 3) != 0)
      {
        int v18 = v16 + 2;
        int v19 = ((v9 >> 7) & 3) + 2;
        int v20 = ((v66.u8[0] >> 2) & 3) + 2;
      }
      else
      {
        int v17 = (v66.u8[0] >> 2) & 3;
        if (!v17) {
          goto LABEL_101;
        }
        switch((v9 >> 7) & 3)
        {
          case 0u:
            int v19 = v13 + 2;
            int v20 = v16 + 2;
            int v18 = 6;
            break;
          case 1u:
            int v18 = v16 + 2;
            int v20 = v13 + 2;
            int v19 = 6;
            break;
          case 2u:
            int v18 = v16 + 2;
            int v19 = v13 + 2;
            int v20 = 6;
            break;
          case 3u:
            if (v16 == 3) {
              goto LABEL_101;
            }
            int v19 = 2;
            int v18 = 6;
            int v20 = 2;
            break;
          default:
            JUMPOUT(0);
        }
      }
      unsigned int v21 = (v18 + v18 * v15) * v19 * v20;
    }
    else
    {
      if ((v66.i8[0] & 3) != 0)
      {
        int v24 = (v9 >> 7) & 3;
        switch((v66.u8[0] >> 2) & 3)
        {
          case 1:
            int v25 = v24 | 8;
            goto LABEL_29;
          case 2:
            int v25 = v16 + 2;
            int v26 = v24 | 8;
            break;
          case 3:
            int v27 = (v9 >> 7) & 1;
            int v28 = v16 + 2;
            int v26 = v27 | 6;
            int v25 = v27 | 2;
            if (v66.i8[1]) {
              int v26 = v28;
            }
            else {
              int v25 = v28;
            }
            break;
          default:
            int v25 = v24 | 4;
LABEL_29:
            int v26 = v16 + 2;
            break;
        }
      }
      else
      {
        int v17 = (v66.u8[0] >> 2) & 3;
        if (!v17)
        {
LABEL_101:
          uint64_t v6 = -1;
LABEL_102:
          *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
          *a5 = 1;
          return result;
        }
        switch((v9 >> 7) & 3)
        {
          case 1u:
            int v25 = v16 + 2;
            int v26 = 12;
            break;
          case 2u:
            int v14 = 0;
            unsigned int v15 = 0;
            int v25 = v16 + 6;
            int v26 = v13 + 6;
            break;
          case 3u:
            if ((v66.i8[0] & 0x40) != 0) {
              goto LABEL_101;
            }
            int v26 = 10;
            int v25 = 6;
            break;
          default:
            int v26 = v16 + 2;
            int v25 = 12;
            break;
        }
      }
      unsigned int v21 = (v25 + v25 * v15) * v26;
    }
    switch(((v66.u8[0] >> 4) | 0xFFFFFFFE) + 6 * v14 + 2 * v17)
    {
      case 0u:
        goto LABEL_58;
      case 1u:
        unsigned int v29 = 13108 * ((8 * v21) | 4);
        goto LABEL_54;
      case 2u:
        v21 *= 2;
        goto LABEL_58;
      case 3u:
        int v30 = 152922;
        goto LABEL_53;
      case 4u:
        int v31 = 13;
        goto LABEL_56;
      case 5u:
        v21 *= 3;
        goto LABEL_58;
      case 6u:
        int v30 = 218460;
        goto LABEL_53;
      case 7u:
        int v31 = 18;
        goto LABEL_56;
      case 8u:
        v21 *= 4;
        goto LABEL_58;
      case 9u:
        int v30 = 283998;
LABEL_53:
        unsigned int v29 = v21 * v30 + 43692;
LABEL_54:
        unsigned int v21 = HIWORD(v29);
        goto LABEL_58;
      case 0xAu:
        int v31 = 23;
LABEL_56:
        unsigned int v21 = (26215 * (v21 * v31 + 4)) >> 17;
        goto LABEL_58;
      case 0xBu:
        v21 *= 5;
LABEL_58:
        if (v21 - 129 < 0xFFFFFF80) {
          goto LABEL_101;
        }
        if (v10 == 3)
        {
          if (v21 >= 0x79) {
            goto LABEL_68;
          }
          v8.i64[0] = *(void *)&vshl_u16((uint16x4_t)vdup_n_s16(v66.u8[3]), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
          unsigned __int32 v61 = vmovn_s16(v8).u32[0];
          v35 = &v66.u8[(unint64_t)(120 - v21) >> 3];
          unsigned int v36 = (120 - (_BYTE)v21) & 7;
          if (v36 >= 6) {
            int v37 = v35[1] << 8;
          }
          else {
            int v37 = 0;
          }
          __int16 v62 = ((v37 | *v35) >> v36) & 3;
          v46 = &v66.u8[(unint64_t)(122 - v21) >> 3];
          unsigned int v47 = (122 - (_BYTE)v21) & 7;
          if (v47 >= 6) {
            int v48 = v46[1] << 8;
          }
          else {
            int v48 = 0;
          }
          __int16 v63 = ((v48 | *v46) >> v47) & 3;
          v52 = &v66.u8[(unint64_t)(124 - v21) >> 3];
          unsigned int v53 = (124 - (_BYTE)v21) & 7;
          if (v53 >= 6) {
            int v54 = v52[1] << 8;
          }
          else {
            int v54 = 0;
          }
          __int16 v64 = ((v54 | *v52) >> v53) & 3;
          v58 = &v66.u8[(unint64_t)(126 - v21) >> 3];
          unsigned int v59 = (126 - (_BYTE)v21) & 7;
          if (v59 >= 6) {
            int v60 = v58[1] << 8;
          }
          else {
            int v60 = 0;
          }
          __int16 v65 = ((v60 | *v58) >> v59) & 3;
        }
        else if (v10 == 2)
        {
          if (v21 >= 0x7C)
          {
LABEL_68:
            *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -1;
            *a5 = 1;
            goto LABEL_69;
          }
          LOBYTE(v61) = (v66.i8[3] & 2) != 0;
          BYTE1(v61) = (v66.i8[3] & 4) != 0;
          BYTE2(v61) = (v66.i8[3] & 8) != 0;
          v43 = &v66.u8[(unint64_t)(123 - v21) >> 3];
          int v44 = (123 - (_BYTE)v21) & 7;
          if (v44 == 7) {
            int v45 = v43[1] << 8;
          }
          else {
            int v45 = 0;
          }
          __int16 v62 = ((v66.i8[3] & 0x10) != 0) | (unsigned __int16)(2 * (((v45 | *v43) >> v44) & 1));
          v49 = &v66.u8[(unint64_t)(124 - v21) >> 3];
          unsigned int v50 = (124 - (_BYTE)v21) & 7;
          if (v50 >= 6) {
            int v51 = v49[1] << 8;
          }
          else {
            int v51 = 0;
          }
          __int16 v63 = ((v51 | *v49) >> v50) & 3;
          v55 = &v66.u8[(unint64_t)(126 - v21) >> 3];
          unsigned int v56 = (126 - (_BYTE)v21) & 7;
          if (v56 >= 6) {
            int v57 = v55[1] << 8;
          }
          else {
            int v57 = 0;
          }
          __int16 v64 = ((v57 | *v55) >> v56) & 3;
        }
        else
        {
          if (v21 >= 0x7F) {
            goto LABEL_68;
          }
          LOBYTE(v61) = (v66.i8[3] & 2) != 0;
          BYTE1(v61) = (v66.i8[3] & 4) != 0;
          __int16 v62 = (v66.i8[3] >> 3) & 3;
          v32 = &v66.u8[(unint64_t)(126 - v21) >> 3];
          unsigned int v33 = (126 - (_BYTE)v21) & 7;
          if (v33 >= 6) {
            int v34 = v32[1] << 8;
          }
          else {
            int v34 = 0;
          }
          __int16 v63 = ((v34 | *v32) >> v33) & 3;
        }
LABEL_69:
        uint64_t v38 = 0;
        do
        {
          unsigned int v39 = (*(&v62 + v38) + 4 * (v11 + 63 + *((unsigned char *)&v61 + v38)));
          BOOL v40 = v39 > 0xF;
          int v41 = (1 << v39) & 0xC88C;
          if (!v40 && v41 != 0)
          {
            *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
            *a5 = 1;
          }
          ++v38;
        }
        while (v10 + 1 != v38);
        break;
      default:
        goto LABEL_101;
    }
LABEL_76:
    uint64_t v5 = v7;
  }
  while (!*a5);
  return result;
}

@end