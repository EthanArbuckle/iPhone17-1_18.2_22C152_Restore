@interface MPAssistantSubscriptionStatusSyncHandler
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation MPAssistantSubscriptionStatusSyncHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientState, 0);

  objc_storeStrong((id *)&self->_postAnchor, 0);
}

- (void)syncDidEnd
{
  v3 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D422A000, v3, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (end): sync ended", v6, 2u);
  }

  postAnchor = self->_postAnchor;
  self->_postAnchor = 0;

  clientState = self->_clientState;
  self->_clientState = 0;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([a3 isEqualToString:self->_postAnchor] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [MEMORY[0x1E4F96628] uniqueObjectIdentifier];
    v9 = [v7 URLWithString:v8];
    [(SADynamiteClientState *)self->_clientState setIdentifier:v9];

    [v6 setObject:self->_clientState];
    v10 = _MPLogCategoryAssistant_Oversize();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(SADynamiteClientState *)self->_clientState dictionary];
      int v12 = 138477827;
      v13 = v11;
      _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (get): %{private}@", (uint8_t *)&v12, 0xCu);
    }
  }
  [v6 setPostAnchor:self->_postAnchor];
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  v205[0] = *MEMORY[0x1E4F143B8];
  id v173 = a3;
  id v172 = a4;
  id v170 = a5;
  id v171 = a6;
  v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v173;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v172;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (begin): anchor: %{private}@, validity: %{public}@", buf, 0x16u);
  }

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v181 = 0;
  v182 = &v181;
  uint64_t v183 = 0x3032000000;
  v184 = sub_1D4238028;
  v185 = sub_1D4238038;
  id v186 = 0;
  v178[0] = MEMORY[0x1E4F143A8];
  v178[1] = 3221225472;
  v178[2] = sub_1D4238040;
  v178[3] = &unk_1E69E2C20;
  v178[4] = self;
  v180 = &v181;
  int v12 = v11;
  v179 = v12;
  sub_1D4238040((uint64_t)v178, 0);
  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  v169 = v12;
  if (dispatch_semaphore_wait(v12, v13))
  {
    uint64_t v14 = (NSString *)v173;
    postAnchor = self->_postAnchor;
    self->_postAnchor = v14;
    goto LABEL_164;
  }
  v168 = [(id)v182[5] allKeys];
  v166 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v188 = v166;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
  v17 = [v168 sortedArrayUsingDescriptors:v16];

  v18 = [NSString string];
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v174 objects:v187 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v175;
    do
    {
      uint64_t v22 = 0;
      v23 = v18;
      do
      {
        if (*(void *)v175 != v21) {
          objc_enumerationMutation(v19);
        }
        v24 = [(id)v182[5] objectForKeyedSubscript:*(void *)(*((void *)&v174 + 1) + 8 * v22)];
        v18 = [v23 stringByAppendingFormat:@"%@:", v24];

        ++v22;
        v23 = v18;
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v174 objects:v187 count:16];
    }
    while (v20);
  }

  v167 = [v18 stringByAppendingString:@"END"];

  v25 = NSString;
  v26 = [(SADynamiteClientState *)self->_clientState defaultUserState];
  v27 = [v26 status];
  uint64_t v28 = [v27 isEqualToString:*MEMORY[0x1E4F96C98]];
  v29 = [(SADynamiteClientState *)self->_clientState expirationDate];
  v30 = [v29 date];
  [v30 timeIntervalSinceReferenceDate];
  uint64_t v32 = v31;
  v33 = [(SADynamiteClientState *)self->_clientState defaultUserState];
  v34 = [v33 userHistoryUnmodifiable];
  v35 = [v25 stringWithFormat:@"FuseEligibility_%d_%f:PL_%@_UserAnchors_%@", v28, v32, v34, v167];

  id v36 = v35;
  long long v200 = 0u;
  long long v199 = 0u;
  long long v198 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  long long v194 = 0u;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  memset(&buf[8], 0, 32);
  *(void *)buf = 4256;
  CC_SHA256_Init((CC_SHA256_CTX *)&buf[8]);
  id v37 = v36;
  v38 = (unsigned char *)[v37 UTF8String];
  unint64_t v39 = [v37 length];
  int v40 = v39;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v38, v39);
      }
      else if (*(void *)buf == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v38, v39);
      }
    }
    else if (*(void *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v38, v39);
    }
    else if (*(void *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v38, v39);
    }
  }
  else
  {
    if (*(uint64_t *)buf <= 2999)
    {
      if (*(void *)buf)
      {
        if (*(void *)buf == 2000)
        {
          int v41 = (((v39 + buf[19]) & 3) - buf[19]);
          v42 = &buf[buf[19] + 16];
          switch(v41)
          {
            case 0:
              break;
            case 1:
              unsigned char *v42 = *v38;
              break;
            case 2:
              __int16 v62 = *(_WORD *)v38;
              goto LABEL_63;
            case 3:
              __int16 v62 = *(_WORD *)v38;
              buf[buf[19] + 18] = v38[2];
LABEL_63:
              *(_WORD *)v42 = v62;
              break;
            default:
              memcpy(v42, v38, (((v40 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v40;
        }
      }
      else
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        v45 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        [v44 handleFailureInFunction:v45 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
      }
      goto LABEL_65;
    }
    if (*(void *)buf == 3000)
    {
      if (!v38) {
        goto LABEL_65;
      }
      BOOL v47 = v39 > 0xF || (*(_DWORD *)&buf[8] + v39) > 0xF;
      *(_DWORD *)&buf[8] += v39;
      *(_DWORD *)&buf[12] |= v47;
      if (v39 + DWORD2(v190) > 0xF)
      {
        v54 = &v38[v39];
        if (DWORD2(v190))
        {
          memcpy(&buf[DWORD2(v190) + 32], v38, (16 - DWORD2(v190)));
          HIDWORD(v55) = *(_DWORD *)&buf[16] - 2048144777 * *(_DWORD *)&buf[32];
          LODWORD(v55) = HIDWORD(v55);
          int v56 = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[20] - 2048144777 * *(_DWORD *)&buf[36];
          LODWORD(v55) = HIDWORD(v55);
          *(_DWORD *)&buf[16] = v56;
          *(_DWORD *)&buf[20] = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[24] - 2048144777 * v190;
          LODWORD(v55) = HIDWORD(v55);
          *(_DWORD *)&buf[24] = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[28] - 2048144777 * DWORD1(v190);
          LODWORD(v55) = HIDWORD(v55);
          v38 += (16 - DWORD2(v190));
          *(_DWORD *)&buf[28] = -1640531535 * (v55 >> 19);
          DWORD2(v190) = 0;
        }
        if (v38 <= v54 - 16)
        {
          int v57 = *(_DWORD *)&buf[16];
          int v58 = *(_DWORD *)&buf[20];
          int v59 = *(_DWORD *)&buf[24];
          int v60 = *(_DWORD *)&buf[28];
          do
          {
            HIDWORD(v61) = v57 - 2048144777 * *(_DWORD *)v38;
            LODWORD(v61) = HIDWORD(v61);
            int v57 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v58 - 2048144777 * *((_DWORD *)v38 + 1);
            LODWORD(v61) = HIDWORD(v61);
            int v58 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v59 - 2048144777 * *((_DWORD *)v38 + 2);
            LODWORD(v61) = HIDWORD(v61);
            int v59 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v60 - 2048144777 * *((_DWORD *)v38 + 3);
            LODWORD(v61) = HIDWORD(v61);
            int v60 = -1640531535 * (v61 >> 19);
            v38 += 16;
          }
          while (v38 <= v54 - 16);
          *(_DWORD *)&buf[16] = v57;
          *(_DWORD *)&buf[20] = v58;
          *(_DWORD *)&buf[24] = v59;
          *(_DWORD *)&buf[28] = v60;
        }
        if (v38 >= v54) {
          goto LABEL_65;
        }
        int v48 = v54 - v38;
        __memcpy_chk();
      }
      else
      {
        memcpy(&buf[DWORD2(v190) + 32], v38, v39);
        int v48 = DWORD2(v190) + v40;
      }
      DWORD2(v190) = v48;
      goto LABEL_65;
    }
    if (*(void *)buf != 3001 || !v38) {
      goto LABEL_65;
    }
    *(void *)&buf[8] += v39;
    if (v39 + DWORD2(v192) <= 0x1F)
    {
      memcpy((char *)&v190 + DWORD2(v192) + 8, v38, v39);
      int v43 = DWORD2(v192) + v40;
LABEL_50:
      DWORD2(v192) = v43;
      goto LABEL_65;
    }
    unint64_t v49 = (unint64_t)&v38[v39];
    if (DWORD2(v192))
    {
      memcpy((char *)&v190 + DWORD2(v192) + 8, v38, (32 - DWORD2(v192)));
      *(void *)&buf[16] = 0x9E3779B185EBCA87
                          * __ROR8__(*(void *)&buf[16] - 0x3D4D51C2D82B14B1 * *((void *)&v190 + 1), 33);
      *(void *)&buf[24] = 0x9E3779B185EBCA87 * __ROR8__(*(void *)&buf[24] - 0x3D4D51C2D82B14B1 * v191, 33);
      *(void *)&buf[32] = 0x9E3779B185EBCA87
                          * __ROR8__(*(void *)&buf[32] - 0x3D4D51C2D82B14B1 * *((void *)&v191 + 1), 33);
      *(void *)&long long v190 = 0x9E3779B185EBCA87 * __ROR8__(v190 - 0x3D4D51C2D82B14B1 * v192, 33);
      v38 += (32 - DWORD2(v192));
      DWORD2(v192) = 0;
    }
    if ((unint64_t)(v38 + 32) <= v49)
    {
      unint64_t v51 = *(void *)&buf[24];
      unint64_t v50 = *(void *)&buf[16];
      unint64_t v53 = *(void *)&buf[32];
      unint64_t v52 = v190;
      do
      {
        unint64_t v50 = 0x9E3779B185EBCA87 * __ROR8__(v50 - 0x3D4D51C2D82B14B1 * *(void *)v38, 33);
        unint64_t v51 = 0x9E3779B185EBCA87 * __ROR8__(v51 - 0x3D4D51C2D82B14B1 * *((void *)v38 + 1), 33);
        unint64_t v53 = 0x9E3779B185EBCA87 * __ROR8__(v53 - 0x3D4D51C2D82B14B1 * *((void *)v38 + 2), 33);
        unint64_t v52 = 0x9E3779B185EBCA87 * __ROR8__(v52 - 0x3D4D51C2D82B14B1 * *((void *)v38 + 3), 33);
        v38 += 32;
      }
      while ((unint64_t)v38 <= v49 - 32);
      *(void *)&buf[16] = v50;
      *(void *)&buf[24] = v51;
      *(void *)&buf[32] = v53;
      *(void *)&long long v190 = v52;
    }
    if ((unint64_t)v38 < v49)
    {
      int v43 = v49 - v38;
      __memcpy_chk();
      goto LABEL_50;
    }
  }
LABEL_65:

  memset(&v201[8], 0, 64);
  *(void *)v201 = *(void *)buf;
  if (*(uint64_t *)buf <= 3000)
  {
    if (*(uint64_t *)buf <= 1999)
    {
      if (!*(void *)buf)
      {
        v95 = [MEMORY[0x1E4F28B00] currentHandler];
        v96 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v95 handleFailureInFunction:v96 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_112;
      }
      if (*(void *)buf != 1000) {
        goto LABEL_112;
      }
      uint64_t v63 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
      uint64_t v64 = *(void *)&buf[24] + (*(void *)&buf[32] ^ v190);
      uint64_t v65 = __ROR8__(*(void *)&buf[32] ^ v190, 48);
      uint64_t v66 = (v64 ^ v65) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
      uint64_t v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
      uint64_t v68 = v64 + v63;
      uint64_t v69 = v68 ^ __ROR8__(v63, 47);
      uint64_t v70 = (v66 ^ v190) + v69;
      uint64_t v71 = v70 ^ __ROR8__(v69, 51);
      uint64_t v72 = (__ROR8__(v68, 32) ^ 0xFFLL) + v67;
      uint64_t v73 = __ROR8__(v67, 48);
      uint64_t v74 = __ROR8__(v70, 32) + (v72 ^ v73);
      uint64_t v75 = v74 ^ __ROR8__(v72 ^ v73, 43);
      uint64_t v76 = v71 + v72;
      uint64_t v77 = v76 ^ __ROR8__(v71, 47);
      uint64_t v78 = v77 + v74;
      uint64_t v79 = v78 ^ __ROR8__(v77, 51);
      uint64_t v80 = __ROR8__(v76, 32) + v75;
      uint64_t v81 = __ROR8__(v75, 48);
      uint64_t v82 = __ROR8__(v78, 32) + (v80 ^ v81);
      uint64_t v83 = v82 ^ __ROR8__(v80 ^ v81, 43);
      uint64_t v84 = v79 + v80;
      uint64_t v85 = v84 ^ __ROR8__(v79, 47);
      uint64_t v86 = v85 + v82;
      uint64_t v87 = v86 ^ __ROR8__(v85, 51);
      uint64_t v88 = __ROR8__(v84, 32) + v83;
      uint64_t v89 = __ROR8__(v83, 48);
      uint64_t v90 = __ROR8__(v86, 32) + (v88 ^ v89);
      uint64_t v91 = v90 ^ __ROR8__(v88 ^ v89, 43);
      uint64_t v92 = v87 + v88;
      *(void *)&buf[8] = v90;
      *(void *)&buf[16] = v92 ^ __ROR8__(v87, 47);
      *(void *)&buf[24] = __ROR8__(v92, 32);
      *(void *)&buf[32] = v91;
      unint64_t v93 = *(void *)&buf[16] ^ v90 ^ *(void *)&buf[24] ^ v91;
      goto LABEL_99;
    }
    if (*(void *)buf != 2000)
    {
      if (*(void *)buf != 3000) {
        goto LABEL_112;
      }
      if (*(_DWORD *)&buf[12]) {
        int v94 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1D4260A90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1D4260A80)));
      }
      else {
        int v94 = *(_DWORD *)&buf[24] + 374761393;
      }
      unsigned int v106 = *(_DWORD *)&buf[8] + v94;
      v107 = &buf[32];
      unint64_t v108 = BYTE8(v190) & 0xF;
      if (v108 >= 4)
      {
        do
        {
          int v109 = *(_DWORD *)v107;
          v107 += 4;
          HIDWORD(v110) = v106 - 1028477379 * v109;
          LODWORD(v110) = HIDWORD(v110);
          unsigned int v106 = 668265263 * (v110 >> 15);
          v108 -= 4;
        }
        while (v108 > 3);
      }
      for (; v108; --v108)
      {
        int v111 = *v107++;
        HIDWORD(v112) = v106 + 374761393 * v111;
        LODWORD(v112) = HIDWORD(v112);
        unsigned int v106 = -1640531535 * (v112 >> 21);
      }
      unsigned int v113 = (-2048144777 * (v106 ^ (v106 >> 15))) ^ ((-2048144777 * (v106 ^ (v106 >> 15))) >> 13);
      unsigned int v114 = (-1028477379 * v113) ^ ((-1028477379 * v113) >> 16);
      goto LABEL_111;
    }
    switch(buf[19])
    {
      case 1:
        int v98 = buf[16];
        break;
      case 2:
        int v98 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        int v98 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        unsigned int v115 = *(_DWORD *)&buf[8];
        goto LABEL_110;
    }
    unsigned int v115 = (461845907 * ((380141568 * v98) | ((-862048943 * v98) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_110:
    unsigned int v116 = -2048144789 * (v115 ^ *(_DWORD *)&buf[12] ^ ((v115 ^ *(_DWORD *)&buf[12]) >> 16));
    unsigned int v114 = (-1028477387 * (v116 ^ (v116 >> 13))) ^ ((-1028477387 * (v116 ^ (v116 >> 13))) >> 16);
    *(_DWORD *)&buf[8] = v114;
LABEL_111:
    *(_DWORD *)&v201[8] = v114;
    goto LABEL_112;
  }
  if (*(uint64_t *)buf > 4000)
  {
    switch(*(void *)buf)
    {
      case 0xFA1:
        CC_SHA1_Final(&v201[8], (CC_SHA1_CTX *)&buf[8]);
        break;
      case 0x10A0:
        CC_SHA256_Final(&v201[8], (CC_SHA256_CTX *)&buf[8]);
        break;
      case 0x11A0:
        CC_SHA512_Final(&v201[8], (CC_SHA512_CTX *)&buf[8]);
        break;
    }
    goto LABEL_112;
  }
  if (*(void *)buf == 3001)
  {
    if (*(void *)&buf[8] < 0x20uLL) {
      uint64_t v97 = *(void *)&buf[32] + 0x27D4EB2F165667C5;
    }
    else {
      uint64_t v97 = 0x85EBCA77C2B2AE63
    }
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((__ROR8__(*(void *)&buf[24], 57)
                  + __ROR8__(*(void *)&buf[16], 63)
                  + __ROR8__(*(void *)&buf[32], 52)
                  + __ROR8__(v190, 46)) ^ (0x9E3779B185EBCA87
                                         * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[16], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[24], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[32], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v190, 33)));
    unint64_t v99 = v97 + *(void *)&buf[8];
    v100 = (uint64_t *)&v190 + 1;
    unint64_t v101 = buf[8] & 0x1F;
    if (v101 >= 8)
    {
      do
      {
        uint64_t v102 = *v100++;
        unint64_t v99 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v102, 33)) ^ v99, 37);
        v101 -= 8;
      }
      while (v101 > 7);
    }
    if (v101 >= 4)
    {
      unsigned int v103 = *(_DWORD *)v100;
      v100 = (uint64_t *)((char *)v100 + 4);
      unint64_t v99 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v103) ^ v99, 41);
      v101 -= 4;
    }
    for (; v101; --v101)
    {
      unsigned int v104 = *(unsigned __int8 *)v100;
      v100 = (uint64_t *)((char *)v100 + 1);
      unint64_t v99 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v104) ^ v99, 53);
    }
    unint64_t v105 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v99 ^ (v99 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v99 ^ (v99 >> 33))) >> 29));
    unint64_t v93 = v105 ^ HIDWORD(v105);
LABEL_99:
    *(void *)&v201[8] = v93;
    goto LABEL_112;
  }
  if (*(void *)buf == 4000) {
    CC_MD5_Final(&v201[8], (CC_MD5_CTX *)&buf[8]);
  }
LABEL_112:
  v202[0] = *(_OWORD *)v201;
  v202[1] = *(_OWORD *)&v201[16];
  v202[2] = *(_OWORD *)&v201[32];
  v202[3] = *(_OWORD *)&v201[48];
  uint64_t v203 = *(void *)&v201[64];
  if (*(uint64_t *)v201 > 3999)
  {
    if (*(uint64_t *)v201 > 4255)
    {
      if (*(void *)v201 == 4256)
      {
        v154 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v123 = v154;
        uint64_t v155 = 0;
        v156 = (unsigned __int8 *)v202 + 8;
        do
        {
          unsigned int v157 = *v156++;
          v158 = &v154[v155];
          char *v158 = a0123456789abcd[(unint64_t)v157 >> 4];
          v158[1] = a0123456789abcd[v157 & 0xF];
          v155 += 2;
        }
        while (v155 != 64);
        id v128 = [NSString alloc];
        uint64_t v129 = 64;
      }
      else
      {
        if (*(void *)v201 != 4512) {
          goto LABEL_165;
        }
        v134 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v123 = v134;
        uint64_t v135 = 0;
        v136 = (unsigned __int8 *)v202 + 8;
        do
        {
          unsigned int v137 = *v136++;
          v138 = &v134[v135];
          char *v138 = a0123456789abcd[(unint64_t)v137 >> 4];
          v138[1] = a0123456789abcd[v137 & 0xF];
          v135 += 2;
        }
        while (v135 != 128);
        id v128 = [NSString alloc];
        uint64_t v129 = 128;
      }
    }
    else if (*(void *)v201 == 4000)
    {
      v145 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v123 = v145;
      uint64_t v146 = 0;
      v147 = (unsigned __int8 *)v202 + 8;
      do
      {
        unsigned int v148 = *v147++;
        v149 = &v145[v146];
        char *v149 = a0123456789abcd[(unint64_t)v148 >> 4];
        v149[1] = a0123456789abcd[v148 & 0xF];
        v146 += 2;
      }
      while (v146 != 32);
      id v128 = [NSString alloc];
      uint64_t v129 = 32;
    }
    else
    {
      if (*(void *)v201 != 4001) {
        goto LABEL_165;
      }
      v122 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v123 = v122;
      uint64_t v124 = 0;
      v125 = (unsigned __int8 *)v202 + 8;
      do
      {
        unsigned int v126 = *v125++;
        v127 = &v122[v124];
        char *v127 = a0123456789abcd[(unint64_t)v126 >> 4];
        v127[1] = a0123456789abcd[v126 & 0xF];
        v124 += 2;
      }
      while (v124 != 40);
      id v128 = [NSString alloc];
      uint64_t v129 = 40;
    }
    CFStringRef v121 = (CFStringRef)[v128 initWithBytesNoCopy:v123 length:v129 encoding:4 freeWhenDone:1];
  }
  else
  {
    if (*(uint64_t *)v201 <= 2999)
    {
      if (*(void *)v201 == 1000)
      {
        uint64_t v139 = *((void *)&v202[0] + 1);
        v140 = (char *)v205 + 1;
        uint64_t quot = *((void *)&v202[0] + 1);
        do
        {
          lldiv_t v142 = lldiv(quot, 10);
          uint64_t quot = v142.quot;
          if (v142.rem >= 0) {
            LOBYTE(v143) = v142.rem;
          }
          else {
            uint64_t v143 = -v142.rem;
          }
          *(v140 - 2) = v143 + 48;
          v144 = (const UInt8 *)(v140 - 2);
          --v140;
        }
        while (v142.quot);
        if (v139 < 0)
        {
          *(v140 - 2) = 45;
          v144 = (const UInt8 *)(v140 - 2);
        }
        CFStringRef v121 = CFStringCreateWithBytes(0, v144, (char *)v205 - (char *)v144, 0x8000100u, 0);
        goto LABEL_156;
      }
      if (*(void *)v201 == 2000)
      {
        uint64_t v117 = DWORD2(v202[0]);
        v118 = (const UInt8 *)v205;
        do
        {
          ldiv_t v119 = ldiv(v117, 10);
          uint64_t v117 = v119.quot;
          if (v119.rem >= 0) {
            LOBYTE(v120) = v119.rem;
          }
          else {
            uint64_t v120 = -v119.rem;
          }
          *--v118 = v120 + 48;
        }
        while (v119.quot);
        CFStringRef v121 = CFStringCreateWithBytes(0, v118, (char *)v205 - (char *)v118, 0x8000100u, 0);
        goto LABEL_156;
      }
LABEL_165:
      v164 = [MEMORY[0x1E4F28B00] currentHandler];
      v165 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
      [v164 handleFailureInFunction:v165 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

      v159 = &stru_1F2BFA380;
      goto LABEL_157;
    }
    if (*(void *)v201 == 3000)
    {
      LODWORD(v204[0]) = bswap32(DWORD2(v202[0]));
      v150 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v151 = 0;
      v152 = v150 + 1;
      do
      {
        unint64_t v153 = *((unsigned __int8 *)v204 + v151);
        *(v152 - 1) = a0123456789abcd[v153 >> 4];
        unsigned char *v152 = a0123456789abcd[v153 & 0xF];
        v152 += 2;
        ++v151;
      }
      while (v151 != 4);
      CFStringRef v121 = (CFStringRef)[[NSString alloc] initWithBytesNoCopy:v150 length:8 encoding:4 freeWhenDone:1];
    }
    else
    {
      if (*(void *)v201 != 3001) {
        goto LABEL_165;
      }
      v204[0] = bswap64(*((unint64_t *)&v202[0] + 1));
      v130 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v131 = 0;
      v132 = v130 + 1;
      do
      {
        unint64_t v133 = *((unsigned __int8 *)v204 + v131);
        *(v132 - 1) = a0123456789abcd[v133 >> 4];
        unsigned char *v132 = a0123456789abcd[v133 & 0xF];
        v132 += 2;
        ++v131;
      }
      while (v131 != 8);
      CFStringRef v121 = (CFStringRef)[[NSString alloc] initWithBytesNoCopy:v130 length:16 encoding:4 freeWhenDone:1];
    }
  }
LABEL_156:
  v159 = (__CFString *)v121;
LABEL_157:

  v160 = self->_postAnchor;
  self->_postAnchor = &v159->isa;

  if (![(NSString *)self->_postAnchor isEqualToString:v173])
  {
    v161 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D422A000, v161, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (anchor): anchor changed, sync expected", buf, 2u);
    }
  }
  v162 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
  {
    v163 = self->_postAnchor;
    *(_DWORD *)buf = 138477827;
    *(void *)&buf[4] = v163;
    _os_log_impl(&dword_1D422A000, v162, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (anchor): %{private}@", buf, 0xCu);
  }

  postAnchor = (NSString *)v168;
LABEL_164:

  _Block_object_dispose(&v181, 8);
}

@end