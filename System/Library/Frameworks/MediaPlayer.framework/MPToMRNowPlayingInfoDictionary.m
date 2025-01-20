@interface MPToMRNowPlayingInfoDictionary
@end

@implementation MPToMRNowPlayingInfoDictionary

void ___MPToMRNowPlayingInfoDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v168[0] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _MPNowPlayingInfoPropertyToMRMediaRemoteNowPlayingInfoPropertyMapping();
  v8 = [v7 objectForKey:v5];

  if ([v5 isEqualToString:@"artwork"])
  {
    id v9 = v6;
    v10 = [*(id *)(a1 + 32) artworkIdentifier];
    v11 = [*(id *)(a1 + 32) artworkData];
    id v12 = [*(id *)(a1 + 32) artwork];

    if (v12 == v9)
    {
LABEL_147:
      if ([v11 length])
      {
        [*(id *)(a1 + 40) setObject:v11 forKey:*MEMORY[0x1E4F77440]];
        [*(id *)(a1 + 40) setObject:@"image/jpeg" forKey:*MEMORY[0x1E4F77460]];
        [*(id *)(a1 + 40) setObject:v10 forKey:*MEMORY[0x1E4F77458]];
        [*(id *)(a1 + 40) setObject:&unk_1EE6EE410 forKey:*MEMORY[0x1E4F77450]];
        [*(id *)(a1 + 40) setObject:&unk_1EE6EE410 forKey:*MEMORY[0x1E4F77448]];
      }

      goto LABEL_150;
    }
    uint64_t v146 = a1;
    v147 = v10;
    id v145 = v5;
    v13 = v8;
    id v148 = v6;
    id v14 = v9;
    v15 = objc_msgSend(v9, "jpegDataWithSize:", 768.0, 768.0);

    unint64_t v16 = *MEMORY[0x1E4F778E8];
    id v17 = v15;
    long long v163 = 0u;
    long long v162 = 0u;
    long long v161 = 0u;
    long long v160 = 0u;
    long long v159 = 0u;
    long long v158 = 0u;
    long long v157 = 0u;
    long long v156 = 0u;
    unint64_t v18 = v16 + 0x60EA27EEADC0B5D6;
    unint64_t v19 = v16 - 0x3D4D51C2D82B14B1;
    unint64_t v20 = v16 + 0x61C8864E7A143579;
    long long v150 = xmmword_195689830;
    v151.i64[0] = v16 + 0x60EA27EEADC0B5D6;
    v151.i64[1] = v16 - 0x3D4D51C2D82B14B1;
    unint64_t v152 = v16;
    unint64_t v153 = v16 + 0x61C8864E7A143579;
    v21 = (uint64_t *)v154;
    memset(v154, 0, sizeof(v154));
    uint64_t v155 = 0;
    id v22 = v17;
    v23 = (char *)[v22 bytes];
    v149 = v22;
    int64_t v24 = [v22 length];
    if (v23)
    {
      int v25 = v24;
      *((void *)&v150 + 1) = v24;
      if ((unint64_t)v24 <= 0x1F)
      {
        memcpy(v154, v23, v24);
        int v26 = v155 + v25;
LABEL_25:
        LODWORD(v155) = v26;
        goto LABEL_26;
      }
      v34 = &v23[v24];
      if (v24 >= 32)
      {
        do
        {
          unint64_t v18 = 0x9E3779B185EBCA87 * __ROR8__(v18 - 0x3D4D51C2D82B14B1 * *(void *)v23, 33);
          unint64_t v19 = 0x9E3779B185EBCA87 * __ROR8__(v19 - 0x3D4D51C2D82B14B1 * *((void *)v23 + 1), 33);
          unint64_t v16 = 0x9E3779B185EBCA87 * __ROR8__(v16 - 0x3D4D51C2D82B14B1 * *((void *)v23 + 2), 33);
          unint64_t v20 = 0x9E3779B185EBCA87 * __ROR8__(v20 - 0x3D4D51C2D82B14B1 * *((void *)v23 + 3), 33);
          v23 += 32;
        }
        while (v23 <= v34 - 32);
        v151.i64[0] = v18;
        v151.i64[1] = v19;
        unint64_t v152 = v16;
        unint64_t v153 = v20;
      }
      if (v23 < v34)
      {
        int v26 = v34 - v23;
        __memcpy_chk();
        goto LABEL_25;
      }
    }
LABEL_26:
    v11 = v149;

    memset(&v164[8], 0, 64);
    *(void *)v164 = v150;
    if ((uint64_t)v150 > 3000)
    {
      v8 = v13;
      id v9 = v14;
      v35 = v147;
      if ((uint64_t)v150 > 4000)
      {
        a1 = v146;
        if ((void)v150 != 4001)
        {
          id v5 = v145;
          if ((void)v150 == 4256)
          {
            CC_SHA256_Final(&v164[8], (CC_SHA256_CTX *)((char *)&v150 + 8));
          }
          else if ((void)v150 == 4512)
          {
            CC_SHA512_Final(&v164[8], (CC_SHA512_CTX *)((char *)&v150 + 8));
          }
          goto LABEL_100;
        }
        CC_SHA1_Final(&v164[8], (CC_SHA1_CTX *)((char *)&v150 + 8));
LABEL_58:
        id v5 = v145;
        goto LABEL_100;
      }
      a1 = v146;
      if ((void)v150 != 3001)
      {
        id v5 = v145;
        if ((void)v150 == 4000) {
          CC_MD5_Final(&v164[8], (CC_MD5_CTX *)((char *)&v150 + 8));
        }
LABEL_100:
        v165[0] = *(_OWORD *)v164;
        v165[1] = *(_OWORD *)&v164[16];
        v165[2] = *(_OWORD *)&v164[32];
        v165[3] = *(_OWORD *)&v164[48];
        uint64_t v166 = *(void *)&v164[64];
        if (*(uint64_t *)v164 > 3999)
        {
          if (*(uint64_t *)v164 > 4255)
          {
            if (*(void *)v164 == 4256)
            {
              v137 = (unsigned __int8 *)v165 + 8;
              v138 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v139 = v138;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v141 = *v137++;
                v142 = &v138[i];
                char *v142 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v141 >> 4];
                v142[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v141 & 0xF];
              }
              id v108 = [NSString alloc];
              v109 = v139;
              uint64_t v110 = 64;
            }
            else
            {
              if (*(void *)v164 != 4512) {
                goto LABEL_152;
              }
              v115 = (unsigned __int8 *)v165 + 8;
              v116 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v117 = v116;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v119 = *v115++;
                v120 = &v116[j];
                char *v120 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v119 >> 4];
                v120[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v119 & 0xF];
              }
              id v108 = [NSString alloc];
              v109 = v117;
              uint64_t v110 = 128;
            }
          }
          else if (*(void *)v164 == 4000)
          {
            v127 = (unsigned __int8 *)v165 + 8;
            v128 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v129 = v128;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v131 = *v127++;
              v132 = &v128[k];
              char *v132 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v131 >> 4];
              v132[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v131 & 0xF];
            }
            id v108 = [NSString alloc];
            v109 = v129;
            uint64_t v110 = 32;
          }
          else
          {
            if (*(void *)v164 != 4001) {
              goto LABEL_152;
            }
            v102 = (unsigned __int8 *)v165 + 8;
            v103 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v104 = v103;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v106 = *v102++;
              v107 = &v103[m];
              char *v107 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v106 >> 4];
              v107[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v106 & 0xF];
            }
            id v108 = [NSString alloc];
            v109 = v104;
            uint64_t v110 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v164 <= 2999)
          {
            if (*(void *)v164 == 1000)
            {
              uint64_t v121 = *((void *)&v165[0] + 1);
              v122 = (char *)v168 + 1;
              uint64_t quot = *((void *)&v165[0] + 1);
              do
              {
                lldiv_t v124 = lldiv(quot, 10);
                uint64_t quot = v124.quot;
                if (v124.rem >= 0) {
                  LOBYTE(v125) = v124.rem;
                }
                else {
                  uint64_t v125 = -v124.rem;
                }
                *(v122 - 2) = v125 + 48;
                v126 = (const UInt8 *)(v122 - 2);
                --v122;
              }
              while (v124.quot);
              id v6 = v148;
              if (v121 < 0)
              {
                *(v122 - 2) = 45;
                v126 = (const UInt8 *)(v122 - 2);
              }
              v10 = (__CFString *)CFStringCreateWithBytes(0, v126, (char *)v168 - (char *)v126, 0x8000100u, 0);
              v11 = v149;
              goto LABEL_146;
            }
            if (*(void *)v164 == 2000)
            {
              uint64_t v97 = DWORD2(v165[0]);
              v98 = (const UInt8 *)v168;
              do
              {
                ldiv_t v99 = ldiv(v97, 10);
                uint64_t v97 = v99.quot;
                if (v99.rem >= 0) {
                  LOBYTE(v100) = v99.rem;
                }
                else {
                  uint64_t v100 = -v99.rem;
                }
                *--v98 = v100 + 48;
              }
              while (v99.quot);
              CFStringRef v101 = CFStringCreateWithBytes(0, v98, (char *)v168 - (char *)v98, 0x8000100u, 0);
              goto LABEL_144;
            }
LABEL_152:
            v143 = [MEMORY[0x1E4F28B00] currentHandler];
            v144 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v143 handleFailureInFunction:v144 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            v10 = &stru_1EE680640;
            goto LABEL_145;
          }
          if (*(void *)v164 == 3000)
          {
            LODWORD(v167[0]) = bswap32(DWORD2(v165[0]));
            v133 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v134 = 0;
            v135 = v133 + 1;
            do
            {
              unint64_t v136 = *((unsigned __int8 *)v167 + v134);
              *(v135 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v136 >> 4];
              unsigned char *v135 = MSVFastHexStringFromBytes_hexCharacters_53728[v136 & 0xF];
              v135 += 2;
              ++v134;
            }
            while (v134 != 4);
            id v108 = [NSString alloc];
            v109 = v133;
            uint64_t v110 = 8;
          }
          else
          {
            if (*(void *)v164 != 3001) {
              goto LABEL_152;
            }
            v167[0] = bswap64(*((unint64_t *)&v165[0] + 1));
            v111 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v112 = 0;
            v113 = v111 + 1;
            do
            {
              unint64_t v114 = *((unsigned __int8 *)v167 + v112);
              *(v113 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v114 >> 4];
              unsigned char *v113 = MSVFastHexStringFromBytes_hexCharacters_53728[v114 & 0xF];
              v113 += 2;
              ++v112;
            }
            while (v112 != 8);
            id v108 = [NSString alloc];
            v109 = v111;
            uint64_t v110 = 16;
          }
        }
        CFStringRef v101 = (CFStringRef)[v108 initWithBytesNoCopy:v109 length:v110 encoding:4 freeWhenDone:1];
LABEL_144:
        v10 = (__CFString *)v101;
LABEL_145:
        id v6 = v148;
LABEL_146:

        goto LABEL_147;
      }
      id v5 = v145;
      if (*((void *)&v150 + 1) < 0x20uLL) {
        unint64_t v78 = v152 + 0x27D4EB2F165667C5;
      }
      else {
        unint64_t v78 = 0x85EBCA77C2B2AE63
      }
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((__ROR8__(v151.i64[1], 57) + __ROR8__(v151.i64[0], 63) + __ROR8__(v152, 52) + __ROR8__(v153, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v151.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v151.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v152, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153, 33)));
      unint64_t v81 = v78 + *((void *)&v150 + 1);
      unint64_t v82 = BYTE8(v150) & 0x1F;
      if (v82 >= 8)
      {
        do
        {
          uint64_t v83 = *v21++;
          unint64_t v81 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v83, 33)) ^ v81, 37);
          v82 -= 8;
        }
        while (v82 > 7);
      }
      if (v82 >= 4)
      {
        unsigned int v84 = *(_DWORD *)v21;
        v21 = (uint64_t *)((char *)v21 + 4);
        unint64_t v81 = 0xC2B2AE3D27D4EB4FLL * __ROR8__((0x9E3779B185EBCA87 * v84) ^ v81, 41) + 0x165667B19E3779F9;
        v82 -= 4;
      }
      for (; v82; --v82)
      {
        unsigned int v85 = *(unsigned __int8 *)v21;
        v21 = (uint64_t *)((char *)v21 + 1);
        unint64_t v81 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v85) ^ v81, 53);
      }
      unint64_t v86 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v81 ^ (v81 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v81 ^ (v81 >> 33))) >> 29));
      uint64_t v66 = v86 ^ HIDWORD(v86);
      goto LABEL_85;
    }
    v8 = v13;
    id v9 = v14;
    v35 = v147;
    if ((uint64_t)v150 <= 1999)
    {
      a1 = v146;
      if (!(void)v150)
      {
        v73 = [MEMORY[0x1E4F28B00] currentHandler];
        v74 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v73 handleFailureInFunction:v74 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_58;
      }
      id v5 = v145;
      if ((void)v150 != 1000) {
        goto LABEL_100;
      }
      uint64_t v36 = (*((void *)&v150 + 1) + v151.i64[0]) ^ __ROR8__(v151.i64[0], 51);
      uint64_t v37 = v151.i64[1] + (v152 ^ v153);
      uint64_t v38 = __ROR8__(v152 ^ v153, 48);
      uint64_t v39 = (v37 ^ v38) + __ROR8__(*((void *)&v150 + 1) + v151.i64[0], 32);
      uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
      uint64_t v41 = v37 + v36;
      uint64_t v42 = v41 ^ __ROR8__(v36, 47);
      unint64_t v43 = (v39 ^ v153) + v42;
      uint64_t v44 = v43 ^ __ROR8__(v42, 51);
      uint64_t v45 = (__ROR8__(v41, 32) ^ 0xFFLL) + v40;
      uint64_t v46 = __ROR8__(v40, 48);
      uint64_t v47 = __ROR8__(v43, 32) + (v45 ^ v46);
      uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
      uint64_t v49 = v44 + v45;
      uint64_t v50 = v49 ^ __ROR8__(v44, 47);
      uint64_t v51 = v50 + v47;
      uint64_t v52 = v51 ^ __ROR8__(v50, 51);
      uint64_t v53 = __ROR8__(v49, 32) + v48;
      uint64_t v54 = __ROR8__(v48, 48);
      uint64_t v55 = __ROR8__(v51, 32) + (v53 ^ v54);
      uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
      uint64_t v57 = v52 + v53;
      uint64_t v58 = v57 ^ __ROR8__(v52, 47);
      uint64_t v59 = v58 + v55;
      uint64_t v60 = v59 ^ __ROR8__(v58, 51);
      uint64_t v61 = __ROR8__(v57, 32) + v56;
      uint64_t v62 = __ROR8__(v56, 48);
      uint64_t v63 = __ROR8__(v59, 32) + (v61 ^ v62);
      unint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
      uint64_t v65 = v60 + v61;
      *((void *)&v150 + 1) = v63;
      v151.i64[0] = v65 ^ __ROR8__(v60, 47);
      v151.i64[1] = __ROR8__(v65, 32);
      unint64_t v152 = v64;
      uint64_t v66 = v151.i64[0] ^ v63 ^ v151.i64[1] ^ v64;
LABEL_85:
      *(void *)&v164[8] = v66;
      goto LABEL_100;
    }
    a1 = v146;
    if ((void)v150 != 2000)
    {
      id v5 = v145;
      if ((void)v150 != 3000) {
        goto LABEL_100;
      }
      v67 = &v152;
      if (HIDWORD(v150)) {
        __int32 v68 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v151, (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(v151, (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        __int32 v68 = v151.i32[2] + 374761393;
      }
      unsigned __int32 v87 = DWORD2(v150) + v68;
      unint64_t v88 = v154[0] & 0xF;
      if (v88 >= 4)
      {
        do
        {
          int v89 = *(_DWORD *)v67;
          v67 = (unint64_t *)((char *)v67 + 4);
          HIDWORD(v90) = v87 - 1028477379 * v89;
          LODWORD(v90) = HIDWORD(v90);
          unsigned __int32 v87 = 668265263 * (v90 >> 15);
          v88 -= 4;
        }
        while (v88 > 3);
      }
      for (; v88; --v88)
      {
        int v91 = *(unsigned __int8 *)v67;
        v67 = (unint64_t *)((char *)v67 + 1);
        HIDWORD(v92) = v87 + 374761393 * v91;
        LODWORD(v92) = HIDWORD(v92);
        unsigned __int32 v87 = -1640531535 * (v92 >> 21);
      }
      unsigned int v93 = -1028477379 * ((-2048144777 * (v87 ^ (v87 >> 15))) ^ ((-2048144777 * (v87 ^ (v87 >> 15))) >> 13));
      unsigned int v94 = v93 ^ HIWORD(v93);
      goto LABEL_99;
    }
    id v5 = v145;
    switch(v151.u8[3])
    {
      case 1u:
        int v75 = v151.u8[0];
        break;
      case 2u:
        int v75 = v151.u16[0];
        break;
      case 3u:
        int v75 = v151.u16[0] | (v151.u8[2] << 16);
        break;
      default:
        unsigned int v95 = DWORD2(v150);
        goto LABEL_98;
    }
    unsigned int v95 = (461845907 * ((380141568 * v75) | ((-862048943 * v75) >> 17))) ^ DWORD2(v150);
LABEL_98:
    unsigned int v96 = -2048144789 * (v95 ^ HIDWORD(v150) ^ ((v95 ^ HIDWORD(v150)) >> 16));
    unsigned int v94 = (-1028477387 * (v96 ^ (v96 >> 13))) ^ ((-1028477387 * (v96 ^ (v96 >> 13))) >> 16);
    DWORD2(v150) = v94;
LABEL_99:
    *(_DWORD *)&v164[8] = v94;
    goto LABEL_100;
  }
  if ([v5 isEqualToString:@"mediaType"])
  {
    __int16 v27 = [v6 integerValue];
    if (v27)
    {
      v28 = (id *)MEMORY[0x1E4F773B8];
    }
    else if ((v27 & 0x402) != 0)
    {
      v28 = (id *)MEMORY[0x1E4F773C0];
    }
    else if ((v27 & 4) != 0)
    {
      v28 = (id *)MEMORY[0x1E4F773A0];
    }
    else if ((v27 & 0x1008) != 0)
    {
      v28 = (id *)MEMORY[0x1E4F773B0];
    }
    else
    {
      if ((v27 & 0x20) == 0) {
        goto LABEL_151;
      }
      v28 = (id *)MEMORY[0x1E4F773A8];
    }
LABEL_69:
    id v79 = *v28;
    if (v79)
    {
LABEL_70:
      id v9 = v79;
      v72 = *(void **)(a1 + 40);
LABEL_71:
      [v72 setObject:v9 forKey:v8];
LABEL_150:

      goto LABEL_151;
    }
    goto LABEL_151;
  }
  if ([v5 isEqualToString:@"MPNowPlayingInfoPropertyMediaType"])
  {
    uint64_t v29 = [v6 integerValue];
    if (v29 == 1)
    {
      v28 = (id *)MEMORY[0x1E4F77620];
    }
    else
    {
      if (v29 != 2) {
        goto LABEL_151;
      }
      v28 = (id *)MEMORY[0x1E4F77628];
    }
    goto LABEL_69;
  }
  if ([v5 isEqualToString:@"_MPNowPlayingInfoPropertyRepeatMode"])
  {
    uint64_t v30 = [v6 unsignedIntegerValue];
    if (v30 == 1) {
      unsigned int v31 = 2;
    }
    else {
      unsigned int v31 = 1;
    }
    BOOL v32 = v30 == 2;
    unsigned int v33 = 3;
LABEL_48:
    if (v32) {
      uint64_t v70 = v33;
    }
    else {
      uint64_t v70 = v31;
    }
    v71 = *(void **)(a1 + 40);
    id v9 = [NSNumber numberWithInt:v70];
    v72 = v71;
    goto LABEL_71;
  }
  if ([v5 isEqualToString:@"_MPNowPlayingInfoPropertyShuffleMode"])
  {
    uint64_t v69 = [v6 unsignedIntegerValue];
    if (v69 == 1) {
      unsigned int v31 = 3;
    }
    else {
      unsigned int v31 = 1;
    }
    BOOL v32 = v69 == 2;
    unsigned int v33 = 2;
    goto LABEL_48;
  }
  if ([v5 isEqualToString:@"MPNowPlayingInfoPropertyAvailableLanguageOptions"])
  {
    v76 = MRLanguageOptionGroupsFromMPNowPlayingLanguageOptionGroups(v6);
    uint64_t ExternalRepresentation = MRLanguageOptionGroupsCreateExternalRepresentation();
LABEL_74:
    v80 = (void *)ExternalRepresentation;
    if (ExternalRepresentation) {
      [*(id *)(a1 + 40) setObject:ExternalRepresentation forKey:v8];
    }
    CFRelease(v76);

    goto LABEL_151;
  }
  if ([v5 isEqualToString:@"MPNowPlayingInfoPropertyCurrentLanguageOption"])
  {
    v76 = MRLanguageOptionsFromMPNowPlayingLanguageOptions(v6);
    uint64_t ExternalRepresentation = MRLanguageOptionsCreateExternalRepresentation();
    goto LABEL_74;
  }
  if ([v5 isEqualToString:@"_MPNowPlayingInfoPropertyCollectionInfo"])
  {
    MPNowPlayingCollectionInfoToMediaRemote(v6);
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }
  if (v8) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v8];
  }
LABEL_151:
}

@end