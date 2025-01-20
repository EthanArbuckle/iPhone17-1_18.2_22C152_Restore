@interface MPModelSortDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)sortDescriptorWithKeyPath:(id)a3 ascending:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (MPModelSortDescriptor)initWithCoder:(id)a3;
- (NSArray)keyPath;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyPath:(id)a3;
@end

@implementation MPModelSortDescriptor

- (void).cxx_destruct
{
}

- (void)setKeyPath:(id)a3
{
}

- (NSArray)keyPath
{
  return self->_keyPath;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPModelSortDescriptor;
  id v4 = a3;
  [(MPModelSortDescriptor *)&v6 encodeWithCoder:v4];
  v5 = [(MPModelSortDescriptor *)self keyPath];
  [v4 encodeObject:v5 forKey:@"keyPath"];
}

- (MPModelSortDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelSortDescriptor;
  v5 = [(MPModelSortDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keyPath"];
    [(MPModelSortDescriptor *)v5 setKeyPath:v9];
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  memset(&v157.hash[3], 0, 168);
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v156 = 1000;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v17 = v14 + v13;
  v157.hash[0] = __ROR8__(v17, 32);
  v157.hash[1] = v16 ^ __ROR8__(v15, 43);
  v157.count[0] = v16 ^ v11;
  v157.count[1] = v17 ^ __ROR8__(v13, 47);
  v157.hash[2] = 0x800000000000000;

  v155.receiver = self;
  v155.super_class = (Class)MPModelSortDescriptor;
  unint64_t v18 = [(MPModelSortDescriptor *)&v155 hash];
  *(void *)&data[0] = v18;
  if (v156 <= 3000)
  {
    unint64_t v19 = v18;
    if (v156 > 1999)
    {
      if (v156 == 2000)
      {
        v29 = (char *)BYTE3(v157.count[1]);
        unint64_t v30 = (BYTE3(v157.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v157.count[1]))
        {
          case 0:
            unint64_t v31 = v18 >> 8;
            unint64_t v32 = v18 >> 16;
            unsigned __int8 v33 = v18;
            unint64_t v19 = v18 >> 24;
            break;
          case 1:
            unint64_t v32 = v18 >> 8;
            unsigned __int8 v33 = v157.count[1];
            LOBYTE(v31) = v18;
            unint64_t v19 = v18 >> 16;
            break;
          case 2:
            LOBYTE(v32) = v18;
            unint64_t v19 = v18 >> 8;
            unsigned __int8 v33 = v157.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v157.count[1]));
            break;
          case 3:
            unsigned __int8 v33 = v157.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v157.count[1]));
            LOBYTE(v32) = BYTE2(v157.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v31) = 0;
            unsigned __int8 v33 = 0;
            LOBYTE(v32) = 0;
            LODWORD(v19) = 0;
            break;
        }
        int v41 = (v32 << 16) | (v19 << 24) | v33 | (v31 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v157.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        int v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v157.count[0]) = v43;
        v44 = (char *)((char *)data - v29 + 4);
        v29 = (char *)(v30 + (char *)data - v29);
        if (v30 >= 5)
        {
          do
          {
            int v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            unint64_t v30 = 5 * (v46 >> 19);
            int v43 = v30 - 430675100;
          }
          while (v44 < v29);
          LODWORD(v157.count[0]) = v30 - 430675100;
        }
        switch((int)v29)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v157.count[1]) = *v29;
            break;
          case 2:
            LOWORD(v157.count[1]) = *(_WORD *)v29;
            break;
          case 3:
            LOWORD(v157.count[1]) = *(_WORD *)v29;
            BYTE2(v157.count[1]) = v29[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v157.count[1]) &= 3u;
        HIDWORD(v157.count[0]) += 8;
      }
      else if (v156 == 3000)
      {
        _MSV_XXH_XXH32_update_12030(&v157, (char *)data, 8uLL);
      }
    }
    else if (v156)
    {
      if (v156 == 1000)
      {
        unint64_t v20 = v157.hash[2];
        if ((v157.hash[2] & 0x400000000000000) != 0)
        {
          if ((v157.hash[2] & 0x300000000000000) != 0)
          {
            v148 = [MEMORY[0x1E4F28B00] currentHandler];
            v149 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v148, "handleFailureInFunction:file:lineNumber:description:", v149, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v157.hash[2]);

            unint64_t v20 = v157.hash[2];
          }
          uint64_t v34 = v20 & 0xFFFFFFFFFFFFFFLL | (v19 << 32);
          CC_LONG64 v35 = (v157.count[0] + v157.count[1]) ^ __ROR8__(v157.count[1], 51);
          CC_LONG64 v36 = v157.hash[0] + (v34 ^ v157.hash[1]);
          uint64_t v37 = __ROR8__(v34 ^ v157.hash[1], 48);
          CC_LONG64 v38 = (v36 ^ v37) + __ROR8__(v157.count[0] + v157.count[1], 32);
          CC_LONG64 v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          CC_LONG64 v40 = v36 + v35;
          v157.hash[0] = __ROR8__(v40, 32);
          v157.hash[1] = v39;
          v157.count[0] = v38 ^ v34;
          v157.count[1] = v40 ^ __ROR8__(v35, 47);
          unint64_t v20 = v20 & 0xFF00000000000000 | HIDWORD(v19);
        }
        else
        {
          if ((v157.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v146 = [MEMORY[0x1E4F28B00] currentHandler];
            v147 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v146 handleFailureInFunction:v147, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v157.hash[2] file lineNumber description];

            unint64_t v20 = v157.hash[2];
          }
          CC_LONG64 v21 = (v157.count[0] + v157.count[1]) ^ __ROR8__(v157.count[1], 51);
          CC_LONG64 v22 = v157.hash[0] + (v157.hash[1] ^ v19);
          uint64_t v23 = __ROR8__(v157.hash[1] ^ v19, 48);
          CC_LONG64 v24 = (v22 ^ v23) + __ROR8__(v157.count[0] + v157.count[1], 32);
          CC_LONG64 v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
          CC_LONG64 v26 = v22 + v21;
          v157.hash[0] = __ROR8__(v26, 32);
          v157.hash[1] = v25;
          v157.count[0] = v24 ^ v19;
          v157.count[1] = v26 ^ __ROR8__(v21, 47);
        }
        v157.hash[2] = v20 + 0x800000000000000;
      }
    }
    else
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v27 handleFailureInFunction:v28 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v156 <= 4000)
  {
    if (v156 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v157, (char *)data, 8uLL);
    }
    else if (v156 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v157, data, 4u);
    }
  }
  else
  {
    switch(v156)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v157, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v157, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v157, data, 4u);
        break;
    }
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  obuint64_t j = [(MPModelSortDescriptor *)self keyPath];
  uint64_t v47 = [obj countByEnumeratingWithState:&v151 objects:v158 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v152;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v152 != v49) {
          objc_enumerationMutation(obj);
        }
        id v51 = *(id *)(*((void *)&v151 + 1) + 8 * i);
        v52 = (char *)[v51 UTF8String];
        uint64_t v53 = [v51 length];
        int v54 = v53;
        if (v156 > 3999)
        {
          if (v156 > 4255)
          {
            if (v156 == 4256)
            {
              CC_SHA256_Update((CC_SHA256_CTX *)&v157, v52, v53);
            }
            else if (v156 == 4512)
            {
              CC_SHA512_Update(&v157, v52, v53);
            }
          }
          else if (v156 == 4000)
          {
            CC_MD5_Update((CC_MD5_CTX *)&v157, v52, v53);
          }
          else if (v156 == 4001)
          {
            CC_SHA1_Update((CC_SHA1_CTX *)&v157, v52, v53);
          }
        }
        else if (v156 > 2999)
        {
          if (v156 == 3000)
          {
            _MSV_XXH_XXH32_update_12030(&v157, v52, v53);
          }
          else if (v156 == 3001)
          {
            _MSV_XXH_XXH64_update_12031((char *)&v157, v52, v53);
          }
        }
        else if (v156)
        {
          if (v156 == 2000)
          {
            int v55 = (((v53 + BYTE3(v157.count[1])) & 3) - BYTE3(v157.count[1]));
            v56 = (char *)&v157.hash[-1] + BYTE3(v157.count[1]);
            switch(v55)
            {
              case 0:
                break;
              case 1:
                char *v56 = *v52;
                break;
              case 2:
                __int16 v59 = *(_WORD *)v52;
                goto LABEL_71;
              case 3:
                __int16 v59 = *(_WORD *)v52;
                v56[2] = v52[2];
LABEL_71:
                *(_WORD *)v56 = v59;
                break;
              default:
                memcpy(v56, v52, (((v54 + BYTE3(v157.count[1])) & 3) - BYTE3(v157.count[1])));
                break;
            }
            HIDWORD(v157.count[0]) += v54;
          }
        }
        else
        {
          v57 = [MEMORY[0x1E4F28B00] currentHandler];
          v58 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          [v57 handleFailureInFunction:v58 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v151 objects:v158 count:16];
    }
    while (v48);
  }

  memset(&v159[8], 0, 64);
  *(void *)v159 = v156;
  if (v156 <= 3000)
  {
    if (v156 <= 1999)
    {
      if (!v156)
      {
        v93 = [MEMORY[0x1E4F28B00] currentHandler];
        v94 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v93 handleFailureInFunction:v94 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_122;
      }
      if (v156 != 1000) {
        goto LABEL_122;
      }
      CC_LONG64 v60 = (v157.count[0] + v157.count[1]) ^ __ROR8__(v157.count[1], 51);
      CC_LONG64 v61 = v157.hash[0] + (v157.hash[1] ^ v157.hash[2]);
      uint64_t v62 = __ROR8__(v157.hash[1] ^ v157.hash[2], 48);
      CC_LONG64 v63 = (v61 ^ v62) + __ROR8__(v157.count[0] + v157.count[1], 32);
      CC_LONG64 v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
      CC_LONG64 v65 = v61 + v60;
      CC_LONG64 v66 = v65 ^ __ROR8__(v60, 47);
      CC_LONG64 v67 = (v63 ^ v157.hash[2]) + v66;
      CC_LONG64 v68 = v67 ^ __ROR8__(v66, 51);
      CC_LONG64 v69 = (__ROR8__(v65, 32) ^ 0xFFLL) + v64;
      uint64_t v70 = __ROR8__(v64, 48);
      uint64_t v71 = __ROR8__(v67, 32) + (v69 ^ v70);
      uint64_t v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
      CC_LONG64 v73 = v68 + v69;
      CC_LONG64 v74 = v73 ^ __ROR8__(v68, 47);
      CC_LONG64 v75 = v74 + v71;
      uint64_t v76 = v75 ^ __ROR8__(v74, 51);
      uint64_t v77 = __ROR8__(v73, 32) + v72;
      uint64_t v78 = __ROR8__(v72, 48);
      uint64_t v79 = __ROR8__(v75, 32) + (v77 ^ v78);
      uint64_t v80 = v79 ^ __ROR8__(v77 ^ v78, 43);
      uint64_t v81 = v76 + v77;
      uint64_t v82 = v81 ^ __ROR8__(v76, 47);
      uint64_t v83 = v82 + v79;
      uint64_t v84 = v83 ^ __ROR8__(v82, 51);
      uint64_t v85 = __ROR8__(v81, 32) + v80;
      uint64_t v86 = __ROR8__(v80, 48);
      CC_LONG64 v87 = __ROR8__(v83, 32) + (v85 ^ v86);
      CC_LONG64 v88 = v87 ^ __ROR8__(v85 ^ v86, 43);
      uint64_t v89 = v84 + v85;
      v157.count[0] = v87;
      v157.count[1] = v89 ^ __ROR8__(v84, 47);
      v157.hash[0] = __ROR8__(v89, 32);
      v157.hash[1] = v88;
      CC_LONG64 v90 = v157.count[1] ^ v87 ^ v157.hash[0] ^ v88;
      goto LABEL_109;
    }
    if (v156 != 2000)
    {
      if (v156 != 3000) {
        goto LABEL_122;
      }
      v91 = &v157.hash[1];
      if (HIDWORD(v157.count[0])) {
        int v92 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v157.count[1], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v157.count[1], (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        int v92 = LODWORD(v157.hash[0]) + 374761393;
      }
      unsigned int v104 = LODWORD(v157.count[0]) + v92;
      unint64_t v105 = v157.hash[3] & 0xF;
      if (v105 >= 4)
      {
        do
        {
          int v106 = *(_DWORD *)v91;
          v91 = (CC_LONG64 *)((char *)v91 + 4);
          HIDWORD(v107) = v104 - 1028477379 * v106;
          LODWORD(v107) = HIDWORD(v107);
          unsigned int v104 = 668265263 * (v107 >> 15);
          v105 -= 4;
        }
        while (v105 > 3);
      }
      for (; v105; --v105)
      {
        int v108 = *(unsigned __int8 *)v91;
        v91 = (CC_LONG64 *)((char *)v91 + 1);
        HIDWORD(v109) = v104 + 374761393 * v108;
        LODWORD(v109) = HIDWORD(v109);
        unsigned int v104 = -1640531535 * (v109 >> 21);
      }
      unsigned int v110 = -1028477379 * ((-2048144777 * (v104 ^ (v104 >> 15))) ^ ((-2048144777 * (v104 ^ (v104 >> 15))) >> 13));
      unsigned int v111 = v110 ^ HIWORD(v110);
      goto LABEL_121;
    }
    switch(BYTE3(v157.count[1]))
    {
      case 1u:
        int v97 = LOBYTE(v157.count[1]);
        break;
      case 2u:
        int v97 = LOWORD(v157.count[1]);
        break;
      case 3u:
        int v97 = LOWORD(v157.count[1]) | (BYTE2(v157.count[1]) << 16);
        break;
      default:
        unsigned int v112 = v157.count[0];
        goto LABEL_120;
    }
    unsigned int v112 = (461845907 * ((380141568 * v97) | ((-862048943 * v97) >> 17))) ^ LODWORD(v157.count[0]);
LABEL_120:
    unsigned int v113 = -2048144789 * (v112 ^ HIDWORD(v157.count[0]) ^ ((v112 ^ HIDWORD(v157.count[0])) >> 16));
    unsigned int v111 = (-1028477387 * (v113 ^ (v113 >> 13))) ^ ((-1028477387 * (v113 ^ (v113 >> 13))) >> 16);
    LODWORD(v157.count[0]) = v111;
LABEL_121:
    *(_DWORD *)&v159[8] = v111;
    goto LABEL_122;
  }
  if (v156 > 4000)
  {
    switch(v156)
    {
      case 4001:
        CC_SHA1_Final(&v159[8], (CC_SHA1_CTX *)&v157);
        break;
      case 4256:
        CC_SHA256_Final(&v159[8], (CC_SHA256_CTX *)&v157);
        break;
      case 4512:
        CC_SHA512_Final(&v159[8], &v157);
        break;
    }
    goto LABEL_122;
  }
  if (v156 == 3001)
  {
    v95 = &v157.hash[3];
    if (v157.count[0] < 0x20) {
      CC_LONG64 v96 = v157.hash[1] + 0x27D4EB2F165667C5;
    }
    else {
      CC_LONG64 v96 = 0x9E3779B185EBCA87
    }
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((__ROR8__(v157.hash[0], 57)
                  + __ROR8__(v157.count[1], 63)
                  + __ROR8__(v157.hash[1], 52)
                  + __ROR8__(v157.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v157.count[1], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v157.hash[0], 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v157.hash[1], 33)))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v157.hash[2], 33)))
          - 0x7A1435883D4D519DLL;
    unint64_t v98 = v96 + v157.count[0];
    unint64_t v99 = v157.count[0] & 0x1F;
    if (v99 >= 8)
    {
      do
      {
        uint64_t v100 = *v95++;
        unint64_t v98 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v100, 33)) ^ v98, 37);
        v99 -= 8;
      }
      while (v99 > 7);
    }
    if (v99 >= 4)
    {
      unsigned int v101 = *(_DWORD *)v95;
      v95 = (CC_LONG64 *)((char *)v95 + 4);
      unint64_t v98 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v101) ^ v98, 41);
      v99 -= 4;
    }
    for (; v99; --v99)
    {
      unsigned int v102 = *(unsigned __int8 *)v95;
      v95 = (CC_LONG64 *)((char *)v95 + 1);
      unint64_t v98 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v102) ^ v98, 53);
    }
    unint64_t v103 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v98 ^ (v98 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v98 ^ (v98 >> 33))) >> 29));
    CC_LONG64 v90 = v103 ^ HIDWORD(v103);
LABEL_109:
    *(void *)&v159[8] = v90;
    goto LABEL_122;
  }
  if (v156 == 4000) {
    CC_MD5_Final(&v159[8], (CC_MD5_CTX *)&v157);
  }
LABEL_122:
  data[0] = *(_OWORD *)v159;
  data[1] = *(_OWORD *)&v159[16];
  data[2] = *(_OWORD *)&v159[32];
  data[3] = *(_OWORD *)&v159[48];
  uint64_t v161 = *(void *)&v159[64];
  if (*(uint64_t *)v159 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(void *)&data[0] == 4256)
      {
        v136 = (unsigned __int8 *)data + 8;
        v137 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v138 = v137;
        for (uint64_t j = 0; j != 64; j += 2)
        {
          unsigned int v140 = *v136++;
          v141 = &v137[j];
          char *v141 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v140 >> 4];
          v141[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v140 & 0xF];
        }
        id v120 = [NSString alloc];
        v121 = v138;
        uint64_t v122 = 64;
      }
      else
      {
        if (*(void *)&data[0] != 4512) {
          goto LABEL_150;
        }
        v124 = (unsigned __int8 *)data + 8;
        v125 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v126 = v125;
        for (uint64_t k = 0; k != 128; k += 2)
        {
          unsigned int v128 = *v124++;
          v129 = &v125[k];
          char *v129 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v128 >> 4];
          v129[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v128 & 0xF];
        }
        id v120 = [NSString alloc];
        v121 = v126;
        uint64_t v122 = 128;
      }
    }
    else if (*(void *)&data[0] == 4000)
    {
      v130 = (unsigned __int8 *)data + 8;
      v131 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v132 = v131;
      for (uint64_t m = 0; m != 32; m += 2)
      {
        unsigned int v134 = *v130++;
        v135 = &v131[m];
        char *v135 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v134 >> 4];
        v135[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v134 & 0xF];
      }
      id v120 = [NSString alloc];
      v121 = v132;
      uint64_t v122 = 32;
    }
    else
    {
      if (*(void *)&data[0] != 4001) {
        goto LABEL_150;
      }
      v114 = (unsigned __int8 *)data + 8;
      v115 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v116 = v115;
      for (uint64_t n = 0; n != 40; n += 2)
      {
        unsigned int v118 = *v114++;
        v119 = &v115[n];
        char *v119 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v118 >> 4];
        v119[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v118 & 0xF];
      }
      id v120 = [NSString alloc];
      v121 = v116;
      uint64_t v122 = 40;
    }
    v142 = (void *)[v120 initWithBytesNoCopy:v121 length:v122 encoding:4 freeWhenDone:1];
    unint64_t v123 = [v142 hash];

    return v123;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(void *)&data[0] != 1000)
    {
      if (*(void *)&data[0] != 2000) {
        goto LABEL_150;
      }
      return DWORD2(data[0]);
    }
    return *((void *)&data[0] + 1);
  }
  if (*(void *)&data[0] == 3000) {
    return DWORD2(data[0]);
  }
  if (*(void *)&data[0] != 3001)
  {
LABEL_150:
    v144 = [MEMORY[0x1E4F28B00] currentHandler];
    v145 = [NSString stringWithUTF8String:"NSUInteger _MSVHashGetHash(MSVHash)"];
    [v144 handleFailureInFunction:v145 file:@"MSVHasher+Algorithms.h" lineNumber:301 description:@"Cannot obtain hash from unknown hasher algorithm"];

    return 0;
  }
  return *((void *)&data[0] + 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPModelSortDescriptor;
  if ([(MPModelSortDescriptor *)&v10 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MPModelSortDescriptor *)self keyPath];
      uint64_t v7 = [v5 keyPath];

      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sortDescriptorWithKeyPath:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = (objc_class *)objc_opt_class();
  char v8 = NSStringFromClass(v7);
  v9 = (void *)[v6 initWithKey:v8 ascending:v4];

  [v9 setKeyPath:v5];

  return v9;
}

@end