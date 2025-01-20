@interface MPCQueueControllerBehaviorMusicIdentifierComponents
+ (id)itemComponentsWithSectionID:(id)a3 itemID:(id)a4;
+ (id)placeholderComponentsWithLoadingSectionID:(id)a3;
- (BOOL)isPlaceholder;
- (NSString)contentItemID;
- (NSString)deferredNextContentItemID;
- (NSString)description;
- (NSString)itemID;
- (NSString)itemSpecificContentItemID;
- (NSString)loadingSectionID;
- (NSString)sectionID;
- (id)_copy;
- (id)_initWithContentItemID:(id)a3 sectionID:(id)a4 itemID:(id)a5 repeatIteration:(int64_t)a6 type:(int64_t)a7 loadingSectionID:(id)a8 itemSpecificContentItemID:(id)a9 deferredNextContentItemID:(id)a10;
- (id)copyAsDeferredWithLoadingSectionID:(id)a3;
- (id)copyAsPlaceholder;
- (id)copyWithBehaviorFlags:(unsigned __int16)a3;
- (id)copyWithRepeatIteration:(int64_t)a3;
- (int64_t)repeatIteration;
- (int64_t)type;
- (unint64_t)uid;
- (unsigned)behaviorFlags;
@end

@implementation MPCQueueControllerBehaviorMusicIdentifierComponents

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (int64_t)repeatIteration
{
  return self->_repeatIteration;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (id)copyWithBehaviorFlags:(unsigned __int16)a3
{
  if (self->_behaviorFlags == a3)
  {
    return self;
  }
  else
  {
    id result = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)self _copy];
    *((_WORD *)result + 4) = a3;
  }
  return result;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredNextContentItemID, 0);
  objc_storeStrong((id *)&self->_itemSpecificContentItemID, 0);
  objc_storeStrong((id *)&self->_loadingSectionID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);

  objc_storeStrong((id *)&self->_contentItemID, 0);
}

- (id)_initWithContentItemID:(id)a3 sectionID:(id)a4 itemID:(id)a5 repeatIteration:(int64_t)a6 type:(int64_t)a7 loadingSectionID:(id)a8 itemSpecificContentItemID:(id)a9 deferredNextContentItemID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)MPCQueueControllerBehaviorMusicIdentifierComponents;
  v22 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    contentItemID = v22->_contentItemID;
    v22->_contentItemID = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    sectionID = v22->_sectionID;
    v22->_sectionID = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    itemID = v22->_itemID;
    v22->_itemID = (NSString *)v27;

    v22->_repeatIteration = a6;
    v22->_type = a7;
    uint64_t v29 = [v19 copy];
    loadingSectionID = v22->_loadingSectionID;
    v22->_loadingSectionID = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    itemSpecificContentItemID = v22->_itemSpecificContentItemID;
    v22->_itemSpecificContentItemID = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    deferredNextContentItemID = v22->_deferredNextContentItemID;
    v22->_deferredNextContentItemID = (NSString *)v33;
  }
  return v22;
}

- (unint64_t)uid
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  if (self->_type <= 1uLL)
  {
    itemID = self->_itemID;
    *(void *)&long long v123 = self->_sectionID;
    *((void *)&v123 + 1) = &stru_26CBCA930;
    v124.i64[0] = (uint64_t)itemID;
    v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = itemID;
    id v6 = (id)v123;
    v7 = [v4 arrayWithObjects:&v123 count:3];

    v8 = objc_msgSend(v7, "componentsJoinedByString:", @":", v123, v124.i64[0]);

    unint64_t v9 = *MEMORY[0x263F54E90];
    long long v137 = 0u;
    long long v136 = 0u;
    long long v135 = 0u;
    long long v134 = 0u;
    long long v133 = 0u;
    long long v132 = 0u;
    long long v131 = 0u;
    long long v130 = 0u;
    long long v123 = xmmword_21BEF1620;
    uint32x4_t v124 = (uint32x4_t)vaddq_s64(vdupq_n_s64(v9), (int64x2_t)xmmword_21BEF1690);
    v10 = &v125;
    unint64_t v125 = v9;
    unint64_t v126 = v9 + 0x61C8864E7A143579;
    v11 = (uint64_t *)&v127;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v129 = 0;
    id v12 = v8;
    v13 = (unsigned char *)[v12 UTF8String];
    unint64_t v14 = [v12 length];
    int v15 = v14;
    if ((uint64_t)v123 > 3999)
    {
      if ((uint64_t)v123 > 4255)
      {
        if ((void)v123 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)((char *)&v123 + 8), v13, v14);
        }
        else if ((void)v123 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)((char *)&v123 + 8), v13, v14);
        }
      }
      else if ((void)v123 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)((char *)&v123 + 8), v13, v14);
      }
      else if ((void)v123 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)((char *)&v123 + 8), v13, v14);
      }
    }
    else
    {
      if ((uint64_t)v123 <= 2999)
      {
        if ((void)v123)
        {
          if ((void)v123 == 2000)
          {
            int v16 = (((v14 + v124.i8[3]) & 3) - v124.i8[3]);
            id v17 = &v124.i8[v124.u8[3]];
            switch(v16)
            {
              case 0:
                break;
              case 1:
                *id v17 = *v13;
                break;
              case 2:
                __int16 v38 = *(_WORD *)v13;
                goto LABEL_54;
              case 3:
                __int16 v38 = *(_WORD *)v13;
                v17[2] = v13[2];
LABEL_54:
                *(_WORD *)id v17 = v38;
                break;
              default:
                memcpy(v17, v13, (((v15 + v124.i8[3]) & 3) - v124.i8[3]));
                break;
            }
            HIDWORD(v123) += v15;
          }
        }
        else
        {
          id v20 = [MEMORY[0x263F08690] currentHandler];
          id v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          [v20 handleFailureInFunction:v21 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
        goto LABEL_56;
      }
      if ((void)v123 == 3000)
      {
        if (!v13) {
          goto LABEL_56;
        }
        BOOL v23 = v14 > 0xF || (DWORD2(v123) + v14) > 0xF;
        DWORD2(v123) += v14;
        HIDWORD(v123) |= v23;
        if (v14 + v127 > 0xF)
        {
          v30 = &v13[v14];
          if (v127)
          {
            memcpy((char *)&v125 + v127, v13, (16 - v127));
            HIDWORD(v31) = v124.i32[0] - 2048144777 * v125;
            LODWORD(v31) = HIDWORD(v31);
            __int32 v32 = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[1] - 2048144777 * HIDWORD(v125);
            LODWORD(v31) = HIDWORD(v31);
            v124.i32[0] = v32;
            v124.i32[1] = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[2] - 2048144777 * v126;
            LODWORD(v31) = HIDWORD(v31);
            v124.i32[2] = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[3] - 2048144777 * HIDWORD(v126);
            LODWORD(v31) = HIDWORD(v31);
            v13 += (16 - v127);
            v124.i32[3] = -1640531535 * (v31 >> 19);
            LODWORD(v127) = 0;
          }
          if (v13 <= v30 - 16)
          {
            __int32 v33 = v124.i32[0];
            __int32 v34 = v124.i32[1];
            __int32 v35 = v124.i32[2];
            __int32 v36 = v124.i32[3];
            do
            {
              HIDWORD(v37) = v33 - 2048144777 * *(_DWORD *)v13;
              LODWORD(v37) = HIDWORD(v37);
              __int32 v33 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v34 - 2048144777 * *((_DWORD *)v13 + 1);
              LODWORD(v37) = HIDWORD(v37);
              __int32 v34 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v35 - 2048144777 * *((_DWORD *)v13 + 2);
              LODWORD(v37) = HIDWORD(v37);
              __int32 v35 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v36 - 2048144777 * *((_DWORD *)v13 + 3);
              LODWORD(v37) = HIDWORD(v37);
              __int32 v36 = -1640531535 * (v37 >> 19);
              v13 += 16;
            }
            while (v13 <= v30 - 16);
            v124.i64[0] = __PAIR64__(v34, v33);
            v124.i64[1] = __PAIR64__(v36, v35);
          }
          if (v13 >= v30) {
            goto LABEL_56;
          }
          int v24 = v30 - v13;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v125 + v127, v13, v14);
          int v24 = v127 + v15;
        }
        LODWORD(v127) = v24;
        goto LABEL_56;
      }
      if ((void)v123 != 3001 || !v13) {
        goto LABEL_56;
      }
      *((void *)&v123 + 1) += v14;
      if (v14 + v129 <= 0x1F)
      {
        memcpy((char *)&v127 + v129, v13, v14);
        int v19 = v129 + v15;
LABEL_41:
        LODWORD(v129) = v19;
        goto LABEL_56;
      }
      unint64_t v25 = (unint64_t)&v13[v14];
      if (v129)
      {
        memcpy((char *)&v127 + v129, v13, (32 - v129));
        v124.i64[0] = 0x9E3779B185EBCA87 * __ROR8__(v124.i64[0] - 0x3D4D51C2D82B14B1 * v127, 33);
        v124.i64[1] = 0x9E3779B185EBCA87 * __ROR8__(v124.i64[1] - 0x3D4D51C2D82B14B1 * *((void *)&v127 + 1), 33);
        unint64_t v125 = 0x9E3779B185EBCA87 * __ROR8__(v125 - 0x3D4D51C2D82B14B1 * v128, 33);
        unint64_t v126 = 0x9E3779B185EBCA87 * __ROR8__(v126 - 0x3D4D51C2D82B14B1 * *((void *)&v128 + 1), 33);
        v13 += (32 - v129);
        LODWORD(v129) = 0;
      }
      if ((unint64_t)(v13 + 32) <= v25)
      {
        unint64_t v27 = v124.u64[1];
        unint64_t v26 = v124.i64[0];
        unint64_t v29 = v125;
        unint64_t v28 = v126;
        do
        {
          unint64_t v26 = 0x9E3779B185EBCA87 * __ROR8__(v26 - 0x3D4D51C2D82B14B1 * *(void *)v13, 33);
          unint64_t v27 = 0x9E3779B185EBCA87 * __ROR8__(v27 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 1), 33);
          unint64_t v29 = 0x9E3779B185EBCA87 * __ROR8__(v29 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 2), 33);
          unint64_t v28 = 0x9E3779B185EBCA87 * __ROR8__(v28 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 3), 33);
          v13 += 32;
        }
        while ((unint64_t)v13 <= v25 - 32);
        v124.i64[0] = v26;
        v124.i64[1] = v27;
        unint64_t v125 = v29;
        unint64_t v126 = v28;
      }
      if ((unint64_t)v13 < v25)
      {
        int v19 = v25 - v13;
        __memcpy_chk();
        goto LABEL_41;
      }
    }
LABEL_56:

    memset(&v138[8], 0, 64);
    *(void *)v138 = v123;
    if ((uint64_t)v123 > 3000)
    {
      if ((uint64_t)v123 > 4000)
      {
        switch((void)v123)
        {
          case 0xFA1:
            CC_SHA1_Final(&v138[8], (CC_SHA1_CTX *)((char *)&v123 + 8));
            break;
          case 0x10A0:
            CC_SHA256_Final(&v138[8], (CC_SHA256_CTX *)((char *)&v123 + 8));
            break;
          case 0x11A0:
            CC_SHA512_Final(&v138[8], (CC_SHA512_CTX *)((char *)&v123 + 8));
            break;
        }
        goto LABEL_103;
      }
      if ((void)v123 != 3001)
      {
        if ((void)v123 == 4000) {
          CC_MD5_Final(&v138[8], (CC_MD5_CTX *)((char *)&v123 + 8));
        }
LABEL_103:
        v139[0] = *(_OWORD *)v138;
        v139[1] = *(_OWORD *)&v138[16];
        v139[2] = *(_OWORD *)&v138[32];
        v139[3] = *(_OWORD *)&v138[48];
        uint64_t v140 = *(void *)&v138[64];
        if (*(uint64_t *)v138 <= 3999)
        {
          if (*(uint64_t *)v138 <= 2999)
          {
            if (*(void *)v138 != 1000)
            {
              if (*(void *)v138 != 2000) {
                goto LABEL_132;
              }
              goto LABEL_122;
            }
            goto LABEL_116;
          }
          if (*(void *)v138 == 3000)
          {
LABEL_122:
            uint64_t v100 = DWORD2(v139[0]);
            goto LABEL_130;
          }
          if (*(void *)v138 == 3001)
          {
LABEL_116:
            uint64_t v100 = *((void *)&v139[0] + 1);
LABEL_130:
            unint64_t v18 = LOBYTE(self->_repeatIteration) | v100 & 0xFFFFFFFFFFFFFF00;

            return v18;
          }
LABEL_132:
          v121 = [MEMORY[0x263F08690] currentHandler];
          v122 = [NSString stringWithUTF8String:"uint64_t _MSVHashGetUInt64Hash(MSVHash)"];
          [v121 handleFailureInFunction:v122 file:@"MSVHasher+Algorithms.h" lineNumber:327 description:@"Cannot obtain hash from unknown hasher algorithm"];

          uint64_t v100 = 0;
          goto LABEL_130;
        }
        if (*(uint64_t *)v138 > 4255)
        {
          if (*(void *)v138 == 4256)
          {
            v113 = (unsigned __int8 *)v139 + 8;
            v114 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v115 = v114;
            for (uint64_t i = 0; i != 64; i += 2)
            {
              unsigned int v117 = *v113++;
              v118 = &v114[i];
              char *v118 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v117 >> 4];
              v118[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v117 & 0xF];
            }
            id v97 = [NSString alloc];
            v98 = v115;
            uint64_t v99 = 64;
          }
          else
          {
            if (*(void *)v138 != 4512) {
              goto LABEL_132;
            }
            v101 = (unsigned __int8 *)v139 + 8;
            v102 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v103 = v102;
            for (uint64_t j = 0; j != 128; j += 2)
            {
              unsigned int v105 = *v101++;
              v106 = &v102[j];
              char *v106 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v105 >> 4];
              v106[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v105 & 0xF];
            }
            id v97 = [NSString alloc];
            v98 = v103;
            uint64_t v99 = 128;
          }
        }
        else if (*(void *)v138 == 4000)
        {
          v107 = (unsigned __int8 *)v139 + 8;
          v108 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v109 = v108;
          for (uint64_t k = 0; k != 32; k += 2)
          {
            unsigned int v111 = *v107++;
            v112 = &v108[k];
            char *v112 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v111 >> 4];
            v112[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v111 & 0xF];
          }
          id v97 = [NSString alloc];
          v98 = v109;
          uint64_t v99 = 32;
        }
        else
        {
          if (*(void *)v138 != 4001) {
            goto LABEL_132;
          }
          v91 = (unsigned __int8 *)v139 + 8;
          v92 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v93 = v92;
          for (uint64_t m = 0; m != 40; m += 2)
          {
            unsigned int v95 = *v91++;
            v96 = &v92[m];
            char *v96 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v95 >> 4];
            v96[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v95 & 0xF];
          }
          id v97 = [NSString alloc];
          v98 = v93;
          uint64_t v99 = 40;
        }
        v119 = (void *)[v97 initWithBytesNoCopy:v98 length:v99 encoding:4 freeWhenDone:1];
        uint64_t v100 = [v119 hash];

        goto LABEL_130;
      }
      if (*((void *)&v123 + 1) < 0x20uLL) {
        unint64_t v73 = v125 + 0x27D4EB2F165667C5;
      }
      else {
        unint64_t v73 = 0x9E3779B185EBCA87
      }
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((__ROR8__(v124.i64[1], 57) + __ROR8__(v124.i64[0], 63) + __ROR8__(v125, 52) + __ROR8__(v126, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v124.i64[0], 33)))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v124.i64[1], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v125, 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v126, 33)))
            - 0x7A1435883D4D519DLL;
      unint64_t v75 = v73 + *((void *)&v123 + 1);
      unint64_t v76 = BYTE8(v123) & 0x1F;
      if (v76 >= 8)
      {
        do
        {
          uint64_t v77 = *v11++;
          unint64_t v75 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v77, 33)) ^ v75, 37);
          v76 -= 8;
        }
        while (v76 > 7);
      }
      if (v76 >= 4)
      {
        unsigned int v78 = *(_DWORD *)v11;
        v11 = (uint64_t *)((char *)v11 + 4);
        unint64_t v75 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v78) ^ v75, 41);
        v76 -= 4;
      }
      for (; v76; --v76)
      {
        unsigned int v79 = *(unsigned __int8 *)v11;
        v11 = (uint64_t *)((char *)v11 + 1);
        unint64_t v75 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v79) ^ v75, 53);
      }
      unint64_t v80 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) >> 29));
      uint64_t v69 = v80 ^ HIDWORD(v80);
LABEL_90:
      *(void *)&v138[8] = v69;
      goto LABEL_103;
    }
    if ((uint64_t)v123 <= 1999)
    {
      if (!(void)v123)
      {
        v71 = [MEMORY[0x263F08690] currentHandler];
        v72 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v71 handleFailureInFunction:v72 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_103;
      }
      if ((void)v123 != 1000) {
        goto LABEL_103;
      }
      uint64_t v39 = (*((void *)&v123 + 1) + v124.i64[0]) ^ __ROR8__(v124.i64[0], 51);
      uint64_t v40 = v124.i64[1] + (v125 ^ v126);
      uint64_t v41 = __ROR8__(v125 ^ v126, 48);
      uint64_t v42 = (v40 ^ v41) + __ROR8__(*((void *)&v123 + 1) + v124.i64[0], 32);
      uint64_t v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
      uint64_t v44 = v40 + v39;
      uint64_t v45 = v44 ^ __ROR8__(v39, 47);
      unint64_t v46 = (v42 ^ v126) + v45;
      uint64_t v47 = v46 ^ __ROR8__(v45, 51);
      uint64_t v48 = (__ROR8__(v44, 32) ^ 0xFFLL) + v43;
      uint64_t v49 = __ROR8__(v43, 48);
      uint64_t v50 = __ROR8__(v46, 32) + (v48 ^ v49);
      uint64_t v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
      uint64_t v52 = v47 + v48;
      uint64_t v53 = v52 ^ __ROR8__(v47, 47);
      uint64_t v54 = v53 + v50;
      uint64_t v55 = v54 ^ __ROR8__(v53, 51);
      uint64_t v56 = __ROR8__(v52, 32) + v51;
      uint64_t v57 = __ROR8__(v51, 48);
      uint64_t v58 = __ROR8__(v54, 32) + (v56 ^ v57);
      uint64_t v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
      uint64_t v60 = v55 + v56;
      uint64_t v61 = v60 ^ __ROR8__(v55, 47);
      uint64_t v62 = v61 + v58;
      uint64_t v63 = v62 ^ __ROR8__(v61, 51);
      uint64_t v64 = __ROR8__(v60, 32) + v59;
      uint64_t v65 = __ROR8__(v59, 48);
      uint64_t v66 = __ROR8__(v62, 32) + (v64 ^ v65);
      unint64_t v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
      uint64_t v68 = v63 + v64;
      *((void *)&v123 + 1) = v66;
      v124.i64[0] = v68 ^ __ROR8__(v63, 47);
      v124.i64[1] = __ROR8__(v68, 32);
      unint64_t v125 = v67;
      uint64_t v69 = v124.i64[0] ^ v66 ^ v124.i64[1] ^ v67;
      goto LABEL_90;
    }
    if ((void)v123 != 2000)
    {
      if ((void)v123 != 3000) {
        goto LABEL_103;
      }
      if (HIDWORD(v123)) {
        __int32 v70 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v124, (uint32x4_t)xmmword_21BEF1640), (int8x16_t)vshlq_u32(v124, (uint32x4_t)xmmword_21BEF1630)));
      }
      else {
        __int32 v70 = v124.i32[2] + 374761393;
      }
      unsigned __int32 v81 = DWORD2(v123) + v70;
      unint64_t v82 = v127 & 0xF;
      if (v82 >= 4)
      {
        do
        {
          int v83 = *(_DWORD *)v10;
          v10 = (unint64_t *)((char *)v10 + 4);
          HIDWORD(v84) = v81 - 1028477379 * v83;
          LODWORD(v84) = HIDWORD(v84);
          unsigned __int32 v81 = 668265263 * (v84 >> 15);
          v82 -= 4;
        }
        while (v82 > 3);
      }
      for (; v82; --v82)
      {
        int v85 = *(unsigned __int8 *)v10;
        v10 = (unint64_t *)((char *)v10 + 1);
        HIDWORD(v86) = v81 + 374761393 * v85;
        LODWORD(v86) = HIDWORD(v86);
        unsigned __int32 v81 = -1640531535 * (v86 >> 21);
      }
      unsigned int v87 = (-2048144777 * (v81 ^ (v81 >> 15))) ^ ((-2048144777 * (v81 ^ (v81 >> 15))) >> 13);
      unsigned int v88 = (-1028477379 * v87) ^ ((-1028477379 * v87) >> 16);
      goto LABEL_102;
    }
    switch(v124.u8[3])
    {
      case 1u:
        int v74 = v124.u8[0];
        break;
      case 2u:
        int v74 = v124.u16[0];
        break;
      case 3u:
        int v74 = v124.u16[0] | (v124.u8[2] << 16);
        break;
      default:
        unsigned int v89 = DWORD2(v123);
        goto LABEL_101;
    }
    unsigned int v89 = (461845907 * ((380141568 * v74) | ((-862048943 * v74) >> 17))) ^ DWORD2(v123);
LABEL_101:
    unsigned int v90 = -2048144789 * (v89 ^ HIDWORD(v123) ^ ((v89 ^ HIDWORD(v123)) >> 16));
    unsigned int v88 = (-1028477387 * (v90 ^ (v90 >> 13))) ^ ((-1028477387 * (v90 ^ (v90 >> 13))) >> 16);
    DWORD2(v123) = v88;
LABEL_102:
    *(_DWORD *)&v138[8] = v88;
    goto LABEL_103;
  }
  return 0;
}

+ (id)itemComponentsWithSectionID:(id)a3 itemID:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v11[0] = v5;
  v11[1] = &stru_26CBCA930;
  v11[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  v8 = [v7 componentsJoinedByString:@":"];

  id v9 = [[MPCQueueControllerBehaviorMusicIdentifierComponents alloc] _initWithContentItemID:v8 sectionID:v5 itemID:v6 repeatIteration:0 type:0 loadingSectionID:0 itemSpecificContentItemID:0 deferredNextContentItemID:0];

  return v9;
}

- (BOOL)isPlaceholder
{
  return (self->_type < 4uLL) & (0xEu >> (self->_type & 0xF));
}

- (unsigned)behaviorFlags
{
  return self->_behaviorFlags;
}

+ (id)placeholderComponentsWithLoadingSectionID:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"PLACEHOLDER", v3, 0, 0);
  id v5 = [v4 componentsJoinedByString:@"@"];

  id v6 = [[MPCQueueControllerBehaviorMusicIdentifierComponents alloc] _initWithContentItemID:v5 sectionID:v3 itemID:@"PLACEHOLDER_HEAD" repeatIteration:0 type:2 loadingSectionID:v3 itemSpecificContentItemID:0 deferredNextContentItemID:0];

  return v6;
}

- (id)copyWithRepeatIteration:(int64_t)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = self;
  switch(self->_type)
  {
    case 0:
      itemID = self->_itemID;
      v7 = self->_sectionID;
      v8 = itemID;
      uint64_t v43 = v7;
      if (a3)
      {
        id v9 = (char *)&v47 + 1;
        int64_t quot = a3;
        do
        {
          ldiv_t v11 = ldiv(quot, 10);
          int64_t quot = v11.quot;
          if (v11.rem >= 0) {
            LOBYTE(v12) = v11.rem;
          }
          else {
            uint64_t v12 = -v11.rem;
          }
          *(v9 - 2) = v12 + 48;
          v13 = (const UInt8 *)(v9 - 2);
          --v9;
        }
        while (v11.quot);
        if (a3 < 0)
        {
          *(v9 - 2) = 45;
          v13 = (const UInt8 *)(v9 - 2);
        }
        unint64_t v14 = (__CFString *)CFStringCreateWithBytes(0, v13, (char *)&v47 - (char *)v13, 0x8000100u, 0);
      }
      else
      {
        unint64_t v14 = &stru_26CBCA930;
      }
      uint64_t v44 = v14;
      uint64_t v45 = v8;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:3];
      uint64_t v31 = [v30 componentsJoinedByString:@":"];

      if (a3) {
      id v5 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)v5 _copy];
      }
      contentItemID = v5->_contentItemID;
      v5->_contentItemID = (NSString *)v31;

      v5->_repeatIteration = a3;
      break;
    case 1:
      int v15 = self->_itemID;
      int v16 = self->_sectionID;
      id v17 = v15;
      uint64_t v43 = v16;
      if (a3)
      {
        unint64_t v18 = (char *)&v47 + 1;
        int64_t v19 = a3;
        do
        {
          ldiv_t v20 = ldiv(v19, 10);
          int64_t v19 = v20.quot;
          if (v20.rem >= 0) {
            LOBYTE(v21) = v20.rem;
          }
          else {
            uint64_t v21 = -v20.rem;
          }
          *(v18 - 2) = v21 + 48;
          v22 = (const UInt8 *)(v18 - 2);
          --v18;
        }
        while (v20.quot);
        if (a3 < 0)
        {
          *(v18 - 2) = 45;
          v22 = (const UInt8 *)(v18 - 2);
        }
        BOOL v23 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)&v47 - (char *)v22, 0x8000100u, 0);
      }
      else
      {
        BOOL v23 = &stru_26CBCA930;
      }
      uint64_t v44 = v23;
      uint64_t v45 = v17;
      __int32 v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:3];
      __int32 v34 = [v33 componentsJoinedByString:@":"];

      if (a3) {
      v46[0] = @"PLACEHOLDER";
      }
      v46[1] = v34;
      __int32 v35 = (void *)MEMORY[0x263EFF8C0];
      id v36 = v34;
      unint64_t v37 = [v35 arrayWithObjects:v46 count:2];

      [v37 componentsJoinedByString:@"="];
      __int16 v38 = (NSString *)objc_claimAutoreleasedReturnValue();

      id v5 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)v5 _copy];
      uint64_t v39 = v5->_contentItemID;
      v5->_contentItemID = v38;
      uint64_t v40 = v38;

      v5->_repeatIteration = a3;
      itemSpecificContentItemID = v5->_itemSpecificContentItemID;
      v5->_itemSpecificContentItemID = (NSString *)v36;

      break;
    case 2:
      int v24 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v25 = v24;
      unint64_t v26 = @"Cannot change repeatIteration for SectionPlaceholder";
      SEL v27 = a2;
      unint64_t v28 = v5;
      uint64_t v29 = 201;
      goto LABEL_22;
    case 3:
      int v24 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v25 = v24;
      unint64_t v26 = @"Cannot change repeatIteration for EndOfQueuePlaceholder";
      SEL v27 = a2;
      unint64_t v28 = v5;
      uint64_t v29 = 198;
LABEL_22:
      [v24 handleFailureInMethod:v27 object:v28 file:@"MPCQueueControllerBehaviorMusicIdentifierComponents.m" lineNumber:v29 description:v26];

      id v5 = 0;
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)_copy
{
  id v3 = objc_alloc_init(MPCQueueControllerBehaviorMusicIdentifierComponents);
  objc_storeStrong((id *)&v3->_contentItemID, self->_contentItemID);
  objc_storeStrong((id *)&v3->_sectionID, self->_sectionID);
  objc_storeStrong((id *)&v3->_itemID, self->_itemID);
  v3->_repeatIteration = self->_repeatIteration;
  v3->_type = self->_type;
  objc_storeStrong((id *)&v3->_loadingSectionID, self->_loadingSectionID);
  objc_storeStrong((id *)&v3->_itemSpecificContentItemID, self->_itemSpecificContentItemID);
  objc_storeStrong((id *)&v3->_deferredNextContentItemID, self->_deferredNextContentItemID);
  v3->_behaviorFlags = self->_behaviorFlags;
  return v3;
}

- (NSString)deferredNextContentItemID
{
  return self->_deferredNextContentItemID;
}

- (NSString)itemSpecificContentItemID
{
  return self->_itemSpecificContentItemID;
}

- (NSString)loadingSectionID
{
  return self->_loadingSectionID;
}

- (id)copyAsDeferredWithLoadingSectionID:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t type = self->_type;
  if ((unint64_t)(type - 1) >= 3)
  {
    if (!type)
    {
      itemID = self->_itemID;
      int64_t repeatIteration = self->_repeatIteration;
      ldiv_t v11 = self->_sectionID;
      uint64_t v12 = itemID;
      v28[0] = v11;
      if (repeatIteration)
      {
        v13 = (char *)&v29 + 1;
        uint64_t quot = repeatIteration;
        do
        {
          ldiv_t v15 = ldiv(quot, 10);
          uint64_t quot = v15.quot;
          if (v15.rem >= 0) {
            LOBYTE(v16) = v15.rem;
          }
          else {
            uint64_t v16 = -v15.rem;
          }
          *(v13 - 2) = v16 + 48;
          id v17 = (const UInt8 *)(v13 - 2);
          --v13;
        }
        while (v15.quot);
        if (repeatIteration < 0)
        {
          *(v13 - 2) = 45;
          id v17 = (const UInt8 *)(v13 - 2);
        }
        unint64_t v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)&v29 - (char *)v17, 0x8000100u, 0);
      }
      else
      {
        unint64_t v18 = &stru_26CBCA930;
      }
      v28[1] = v18;
      v28[2] = v12;
      int64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
      uint64_t v20 = [v19 componentsJoinedByString:@":"];

      if (repeatIteration) {
      uint64_t v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"PLACEHOLDER", v6, v20, 0, v28[0]);
      }
      v22 = [v21 componentsJoinedByString:@"@"];

      a2 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)self _copy];
      BOOL v23 = (void *)*((void *)a2 + 2);
      *((void *)a2 + 2) = v22;
      id v24 = v22;

      objc_storeStrong((id *)a2 + 3, a3);
      unint64_t v25 = (void *)*((void *)a2 + 4);
      *((void *)a2 + 4) = @"PLACEHOLDER_DEFERRED_NEXT_ITEM";

      *((void *)a2 + 5) = 3;
      objc_storeStrong((id *)a2 + 6, a3);
      unint64_t v26 = (void *)*((void *)a2 + 8);
      *((void *)a2 + 8) = v20;
    }
  }
  else
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPCQueueControllerBehaviorMusicIdentifierComponents.m" lineNumber:174 description:@"Cannot copy a placeholder as deferred"];

    a2 = 0;
  }

  return (id)a2;
}

- (id)copyAsPlaceholder
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int64_t type = self->_type;
  if ((unint64_t)(type - 1) >= 3)
  {
    if (!type)
    {
      itemID = self->_itemID;
      int64_t repeatIteration = self->_repeatIteration;
      v7 = self->_sectionID;
      v8 = itemID;
      v26[0] = v7;
      if (repeatIteration)
      {
        id v9 = (char *)&v28 + 1;
        uint64_t quot = repeatIteration;
        do
        {
          ldiv_t v11 = ldiv(quot, 10);
          uint64_t quot = v11.quot;
          if (v11.rem >= 0) {
            LOBYTE(v12) = v11.rem;
          }
          else {
            uint64_t v12 = -v11.rem;
          }
          *(v9 - 2) = v12 + 48;
          v13 = (const UInt8 *)(v9 - 2);
          --v9;
        }
        while (v11.quot);
        if (repeatIteration < 0)
        {
          *(v9 - 2) = 45;
          v13 = (const UInt8 *)(v9 - 2);
        }
        unint64_t v14 = (__CFString *)CFStringCreateWithBytes(0, v13, (char *)&v28 - (char *)v13, 0x8000100u, 0);
      }
      else
      {
        unint64_t v14 = &stru_26CBCA930;
      }
      v26[1] = v14;
      v26[2] = v8;
      ldiv_t v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 3, self);
      uint64_t v16 = [v15 componentsJoinedByString:@":"];

      if (repeatIteration) {
      v27[0] = @"PLACEHOLDER";
      }
      v27[1] = v16;
      id v17 = (void *)MEMORY[0x263EFF8C0];
      id v18 = v16;
      int64_t v19 = [v17 arrayWithObjects:v27 count:2];

      uint64_t v20 = [v19 componentsJoinedByString:@"="];

      v2 = (void *)[v25 _copy];
      uint64_t v21 = (void *)v2[2];
      v2[2] = v20;
      id v22 = v20;

      v2[5] = 1;
      BOOL v23 = (void *)v2[7];
      v2[7] = v18;
    }
    return v2;
  }
  else
  {
    return self;
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [NSString stringWithFormat:@"section=%@", self->_sectionID];
  [v3 addObject:v4];

  id v5 = [NSString stringWithFormat:@"item=%@", self->_itemID];
  [v3 addObject:v5];

  if (self->_repeatIteration >= 1)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"repeatIteration=%ld", self->_repeatIteration);
    [v3 addObject:v6];
  }
  if ([(NSString *)self->_loadingSectionID length])
  {
    v7 = [NSString stringWithFormat:@"loadingSection=%@", self->_loadingSectionID];
    [v3 addObject:v7];
  }
  if ([(NSString *)self->_itemSpecificContentItemID length])
  {
    v8 = [NSString stringWithFormat:@"itemSpecificContentItemID=%@", self->_itemSpecificContentItemID];
    [v3 addObject:v8];
  }
  if ([(NSString *)self->_deferredNextContentItemID length])
  {
    id v9 = [NSString stringWithFormat:@"deferredNextContentItemID=%@", self->_deferredNextContentItemID];
    [v3 addObject:v9];
  }
  unint64_t type = self->_type;
  if (type <= 3) {
    [v3 addObject:off_2643C4468[type]];
  }
  ldiv_t v11 = NSString;
  uint64_t v12 = [v3 componentsJoinedByString:@" "];
  v13 = [v11 stringWithFormat:@"<MPCQueueControllerBehaviorMusicIdentifierComponents: %p %@>", self, v12];

  return (NSString *)v13;
}

@end