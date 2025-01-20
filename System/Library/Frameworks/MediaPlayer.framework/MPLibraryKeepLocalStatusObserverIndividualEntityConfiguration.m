@interface MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration
- (BOOL)hasNonPurgeableAsset;
- (BOOL)isCollectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreRedownloadable;
- (id)description;
- (int64_t)managedStatus;
- (unint64_t)hash;
- (void)setCollectionType:(BOOL)a3;
- (void)setHasNonPurgeableAsset:(BOOL)a3;
- (void)setManagedStatus:(int64_t)a3;
- (void)setStoreRedownloadable:(BOOL)a3;
@end

@implementation MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration

- (void)setStoreRedownloadable:(BOOL)a3
{
  self->_storeRedownloadable = a3;
}

- (BOOL)isStoreRedownloadable
{
  return self->_storeRedownloadable;
}

- (void)setHasNonPurgeableAsset:(BOOL)a3
{
  self->_hasNonPurgeableAsset = a3;
}

- (BOOL)hasNonPurgeableAsset
{
  return self->_hasNonPurgeableAsset;
}

- (void)setManagedStatus:(int64_t)a3
{
  self->_managedStatus = a3;
}

- (int64_t)managedStatus
{
  return self->_managedStatus;
}

- (void)setCollectionType:(BOOL)a3
{
  self->_collectionType = a3;
}

- (BOOL)isCollectionType
{
  return self->_collectionType;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: [isCollection=%d, managedStatus=%ld, hasNonPurgeableAsset=%d, storeRedownloadable=%d]>", objc_opt_class(), self, self->_collectionType, self->_managedStatus, self->_hasNonPurgeableAsset, self->_storeRedownloadable];
}

- (unint64_t)hash
{
  uint64_t v259 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  memset(&v255.hash[3], 0, 168);
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v254 = 1000;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v17 = v14 + v13;
  v255.hash[0] = __ROR8__(v17, 32);
  v255.hash[1] = v16 ^ __ROR8__(v15, 43);
  v255.count[0] = v16 ^ v11;
  v255.count[1] = v17 ^ __ROR8__(v13, 47);
  v255.hash[2] = 0x800000000000000;

  v253.receiver = self;
  v253.super_class = (Class)MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration;
  unint64_t v18 = [(MPLibraryKeepLocalStatusObserverConfiguration *)&v253 hash];
  *(void *)&data[0] = v18;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v28 = (char *)BYTE3(v255.count[1]);
        unint64_t v29 = (BYTE3(v255.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            unint64_t v30 = v18 >> 8;
            unint64_t v31 = v18 >> 16;
            unsigned __int8 v32 = v18;
            unint64_t v33 = v18 >> 24;
            goto LABEL_33;
          case 1:
            unint64_t v31 = v18 >> 8;
            unsigned __int8 v32 = v255.count[1];
            LOBYTE(v30) = v18;
            unint64_t v33 = v18 >> 16;
            goto LABEL_33;
          case 2:
            LOBYTE(v31) = v18;
            unint64_t v33 = v18 >> 8;
            unsigned __int8 v32 = v255.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v255.count[1]));
LABEL_33:
            LODWORD(v18) = v33;
            break;
          case 3:
            unsigned __int8 v32 = v255.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v255.count[1]));
            LOBYTE(v31) = BYTE2(v255.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v30) = 0;
            unsigned __int8 v32 = 0;
            LOBYTE(v31) = 0;
            LODWORD(v18) = 0;
            break;
        }
        int v41 = (v31 << 16) | (v18 << 24) | v32 | (v30 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v255.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        int v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v255.count[0]) = v43;
        v44 = (char *)((char *)data - v28 + 4);
        v28 = (char *)(v29 + (char *)data - v28);
        if (v29 >= 5)
        {
          do
          {
            int v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            unint64_t v29 = 5 * (v46 >> 19);
            int v43 = v29 - 430675100;
          }
          while (v44 < v28);
          LODWORD(v255.count[0]) = v29 - 430675100;
        }
        switch((int)v28)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v255.count[1]) = *v28;
            break;
          case 2:
            LOWORD(v255.count[1]) = *(_WORD *)v28;
            break;
          case 3:
            LOWORD(v255.count[1]) = *(_WORD *)v28;
            BYTE2(v255.count[1]) = v28[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v255.count[1]) &= 3u;
        HIDWORD(v255.count[0]) += 8;
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v255, (char *)data, 8uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        unint64_t v19 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            unint64_t v249 = v18;
            v234 = [MEMORY[0x1E4F28B00] currentHandler];
            v235 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v234, "handleFailureInFunction:file:lineNumber:description:", v235, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v255.hash[2]);

            unint64_t v18 = v249;
            unint64_t v19 = v255.hash[2];
          }
          uint64_t v34 = v19 & 0xFFFFFFFFFFFFFFLL | (v18 << 32);
          CC_LONG64 v35 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          CC_LONG64 v36 = v255.hash[0] + (v34 ^ v255.hash[1]);
          uint64_t v37 = __ROR8__(v34 ^ v255.hash[1], 48);
          CC_LONG64 v38 = (v36 ^ v37) + __ROR8__(v255.count[0] + v255.count[1], 32);
          CC_LONG64 v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          CC_LONG64 v40 = v36 + v35;
          v255.hash[0] = __ROR8__(v40, 32);
          v255.hash[1] = v39;
          v255.count[0] = v38 ^ v34;
          v255.count[1] = v40 ^ __ROR8__(v35, 47);
          unint64_t v19 = v19 & 0xFF00000000000000 | HIDWORD(v18);
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unint64_t v245 = v18;
            v223 = [MEMORY[0x1E4F28B00] currentHandler];
            v224 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v223 handleFailureInFunction:v224, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v255.hash[2] file lineNumber description];

            unint64_t v18 = v245;
            unint64_t v19 = v255.hash[2];
          }
          CC_LONG64 v20 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          CC_LONG64 v21 = v255.hash[0] + (v255.hash[1] ^ v18);
          uint64_t v22 = __ROR8__(v255.hash[1] ^ v18, 48);
          CC_LONG64 v23 = (v21 ^ v22) + __ROR8__(v255.count[0] + v255.count[1], 32);
          CC_LONG64 v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
          CC_LONG64 v25 = v21 + v20;
          v255.hash[0] = __ROR8__(v25, 32);
          v255.hash[1] = v24;
          v255.count[0] = v23 ^ v18;
          v255.count[1] = v25 ^ __ROR8__(v20, 47);
        }
        v255.hash[2] = v19 + 0x800000000000000;
      }
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v26 handleFailureInFunction:v27 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v255, (char *)data, 8uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  unsigned int v47 = [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)self isCollectionType];
  LODWORD(data[0]) = v47;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v52 = (char *)BYTE3(v255.count[1]);
        unint64_t v53 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            int v54 = 0;
            unsigned int v55 = 0;
            unsigned __int8 v56 = v47;
            goto LABEL_77;
          case 1:
            unsigned int v55 = 0;
            unsigned __int8 v56 = v255.count[1];
            int v54 = v47;
            goto LABEL_77;
          case 2:
            unsigned __int8 v56 = v255.count[1];
            int v54 = HIBYTE(LOWORD(v255.count[1]));
            unsigned int v55 = v47;
            goto LABEL_77;
          case 3:
            unsigned __int8 v56 = v255.count[1];
            int v54 = HIBYTE(LOWORD(v255.count[1]));
            unsigned int v55 = BYTE2(v255.count[1]);
            goto LABEL_79;
          default:
            while (2)
            {
              int v54 = 0;
              unsigned __int8 v56 = 0;
              unsigned int v55 = 0;
LABEL_77:
              unsigned int v47 = 0;
LABEL_79:
              int v65 = (v55 << 16) | (v47 << 24) | v56 | (v54 << 8);
              HIDWORD(v66) = (461845907 * ((380141568 * v65) | ((-862048943 * v65) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v66) = HIDWORD(v66);
              int v67 = 5 * (v66 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v67;
              v68 = (char *)((char *)data - v52 + 4);
              v52 = (char *)(v53 + (char *)data - v52);
              if (v53 >= 5)
              {
                do
                {
                  int v69 = *(_DWORD *)v68;
                  v68 += 4;
                  HIDWORD(v70) = (461845907 * ((380141568 * v69) | ((-862048943 * v69) >> 17))) ^ v67;
                  LODWORD(v70) = HIDWORD(v70);
                  unint64_t v53 = 5 * (v70 >> 19);
                  int v67 = v53 - 430675100;
                }
                while (v68 < v52);
                LODWORD(v255.count[0]) = v53 - 430675100;
              }
              switch((int)v52)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v52;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v52;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v52;
                  BYTE2(v255.count[1]) = v52[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        CC_LONG64 v48 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            unsigned int v250 = v47;
            v236 = [MEMORY[0x1E4F28B00] currentHandler];
            v237 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            objc_msgSend(v236, "handleFailureInFunction:file:lineNumber:description:", v237, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v255.hash[2]);

            unsigned int v47 = v250;
            CC_LONG64 v48 = v255.hash[2];
          }
          uint64_t v57 = 0x100000000;
          if (!v47) {
            uint64_t v57 = 0;
          }
          uint64_t v58 = v48 & 0xFFFFFFFFFFFFFFLL | v57;
          CC_LONG64 v59 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          CC_LONG64 v60 = v255.hash[0] + (v58 ^ v255.hash[1]);
          uint64_t v61 = __ROR8__(v58 ^ v255.hash[1], 48);
          CC_LONG64 v62 = (v60 ^ v61) + __ROR8__(v255.count[0] + v255.count[1], 32);
          CC_LONG64 v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
          CC_LONG64 v64 = v60 + v59;
          v255.hash[0] = __ROR8__(v64, 32);
          v255.hash[1] = v63;
          v255.count[0] = v62 ^ v58;
          v255.count[1] = v64 ^ __ROR8__(v59, 47);
          unint64_t v49 = v48 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unsigned int v246 = v47;
            v225 = [MEMORY[0x1E4F28B00] currentHandler];
            v226 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            [v225 handleFailureInFunction:v226, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v255.hash[2] file lineNumber description];

            unsigned int v47 = v246;
            CC_LONG64 v48 = v255.hash[2];
          }
          unint64_t v49 = v48 | v47;
        }
        v255.hash[2] = v49 + 0x400000000000000;
      }
    }
    else
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      [v50 handleFailureInFunction:v51 file:@"MSVHasher+Algorithms.h" lineNumber:192 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  unsigned int v71 = [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)self isStoreRedownloadable];
  LODWORD(data[0]) = v71;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v76 = (char *)BYTE3(v255.count[1]);
        unint64_t v77 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            int v78 = 0;
            unsigned int v79 = 0;
            unsigned __int8 v80 = v71;
            goto LABEL_121;
          case 1:
            unsigned int v79 = 0;
            unsigned __int8 v80 = v255.count[1];
            int v78 = v71;
            goto LABEL_121;
          case 2:
            unsigned __int8 v80 = v255.count[1];
            int v78 = HIBYTE(LOWORD(v255.count[1]));
            unsigned int v79 = v71;
            goto LABEL_121;
          case 3:
            unsigned __int8 v80 = v255.count[1];
            int v78 = HIBYTE(LOWORD(v255.count[1]));
            unsigned int v79 = BYTE2(v255.count[1]);
            goto LABEL_123;
          default:
            while (2)
            {
              int v78 = 0;
              unsigned __int8 v80 = 0;
              unsigned int v79 = 0;
LABEL_121:
              unsigned int v71 = 0;
LABEL_123:
              int v89 = (v79 << 16) | (v71 << 24) | v80 | (v78 << 8);
              HIDWORD(v90) = (461845907 * ((380141568 * v89) | ((-862048943 * v89) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v90) = HIDWORD(v90);
              int v91 = 5 * (v90 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v91;
              v92 = (char *)((char *)data - v76 + 4);
              v76 = (char *)(v77 + (char *)data - v76);
              if (v77 >= 5)
              {
                do
                {
                  int v93 = *(_DWORD *)v92;
                  v92 += 4;
                  HIDWORD(v94) = (461845907 * ((380141568 * v93) | ((-862048943 * v93) >> 17))) ^ v91;
                  LODWORD(v94) = HIDWORD(v94);
                  unint64_t v77 = 5 * (v94 >> 19);
                  int v91 = v77 - 430675100;
                }
                while (v92 < v76);
                LODWORD(v255.count[0]) = v77 - 430675100;
              }
              switch((int)v76)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v76;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v76;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v76;
                  BYTE2(v255.count[1]) = v76[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        CC_LONG64 v72 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            unsigned int v251 = v71;
            v238 = [MEMORY[0x1E4F28B00] currentHandler];
            v239 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            objc_msgSend(v238, "handleFailureInFunction:file:lineNumber:description:", v239, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v255.hash[2]);

            unsigned int v71 = v251;
            CC_LONG64 v72 = v255.hash[2];
          }
          uint64_t v81 = 0x100000000;
          if (!v71) {
            uint64_t v81 = 0;
          }
          uint64_t v82 = v72 & 0xFFFFFFFFFFFFFFLL | v81;
          CC_LONG64 v83 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          CC_LONG64 v84 = v255.hash[0] + (v82 ^ v255.hash[1]);
          uint64_t v85 = __ROR8__(v82 ^ v255.hash[1], 48);
          CC_LONG64 v86 = (v84 ^ v85) + __ROR8__(v255.count[0] + v255.count[1], 32);
          CC_LONG64 v87 = v86 ^ __ROR8__(v84 ^ v85, 43);
          CC_LONG64 v88 = v84 + v83;
          v255.hash[0] = __ROR8__(v88, 32);
          v255.hash[1] = v87;
          v255.count[0] = v86 ^ v82;
          v255.count[1] = v88 ^ __ROR8__(v83, 47);
          unint64_t v73 = v72 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unsigned int v247 = v71;
            v227 = [MEMORY[0x1E4F28B00] currentHandler];
            v228 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            [v227 handleFailureInFunction:v228, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v255.hash[2] file lineNumber description];

            unsigned int v71 = v247;
            CC_LONG64 v72 = v255.hash[2];
          }
          unint64_t v73 = v72 | v71;
        }
        v255.hash[2] = v73 + 0x400000000000000;
      }
    }
    else
    {
      v74 = [MEMORY[0x1E4F28B00] currentHandler];
      v75 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      [v74 handleFailureInFunction:v75 file:@"MSVHasher+Algorithms.h" lineNumber:192 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  uint64_t hasNonPurgeableAsset = self->_hasNonPurgeableAsset;
  LODWORD(data[0]) = self->_hasNonPurgeableAsset;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v100 = (char *)BYTE3(v255.count[1]);
        unint64_t v101 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            int v102 = 0;
            int v103 = 0;
            unsigned __int8 v104 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 1:
            int v103 = 0;
            unsigned __int8 v104 = v255.count[1];
            int v102 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 2:
            unsigned __int8 v104 = v255.count[1];
            int v102 = HIBYTE(LOWORD(v255.count[1]));
            int v103 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 3:
            unsigned __int8 v104 = v255.count[1];
            int v102 = HIBYTE(LOWORD(v255.count[1]));
            int v103 = BYTE2(v255.count[1]);
            goto LABEL_165;
          default:
            while (2)
            {
              int v102 = 0;
              unsigned __int8 v104 = 0;
              int v103 = 0;
LABEL_163:
              LODWORD(hasNonPurgeableAsset) = 0;
LABEL_165:
              HIDWORD(v112) = (461845907
                             * ((380141568 * ((v103 << 16) | (hasNonPurgeableAsset << 24) | v104 | (v102 << 8))) | ((-862048943 * ((v103 << 16) | (hasNonPurgeableAsset << 24) | v104 | (v102 << 8))) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v112) = HIDWORD(v112);
              int v113 = 5 * (v112 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v113;
              v114 = (char *)((char *)data - v100 + 4);
              v100 = (char *)(v101 + (char *)data - v100);
              if (v101 >= 5)
              {
                do
                {
                  int v115 = *(_DWORD *)v114;
                  v114 += 4;
                  unint64_t v101 = 461845907 * ((380141568 * v115) | ((-862048943 * v115) >> 17));
                  HIDWORD(v116) = v101 ^ v113;
                  LODWORD(v116) = v101 ^ v113;
                  int v113 = 5 * (v116 >> 19) - 430675100;
                }
                while (v114 < v100);
                LODWORD(v255.count[0]) = v113;
              }
              switch((int)v100)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v100;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v100;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v100;
                  BYTE2(v255.count[1]) = v100[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        CC_LONG64 v96 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            uint64_t v252 = hasNonPurgeableAsset;
            v240 = [MEMORY[0x1E4F28B00] currentHandler];
            v241 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            objc_msgSend(v240, "handleFailureInFunction:file:lineNumber:description:", v241, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v255.hash[2]);

            uint64_t hasNonPurgeableAsset = v252;
            CC_LONG64 v96 = v255.hash[2];
          }
          uint64_t v105 = v96 & 0xFFFFFFFFFFFFFFLL | (hasNonPurgeableAsset << 32);
          CC_LONG64 v106 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          CC_LONG64 v107 = v255.hash[0] + (v105 ^ v255.hash[1]);
          uint64_t v108 = __ROR8__(v105 ^ v255.hash[1], 48);
          CC_LONG64 v109 = (v107 ^ v108) + __ROR8__(v255.count[0] + v255.count[1], 32);
          CC_LONG64 v110 = v109 ^ __ROR8__(v107 ^ v108, 43);
          CC_LONG64 v111 = v107 + v106;
          v255.hash[0] = __ROR8__(v111, 32);
          v255.hash[1] = v110;
          v255.count[0] = v109 ^ v105;
          v255.count[1] = v111 ^ __ROR8__(v106, 47);
          unint64_t v97 = v96 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            uint64_t v248 = hasNonPurgeableAsset;
            v229 = [MEMORY[0x1E4F28B00] currentHandler];
            v230 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            [v229 handleFailureInFunction:v230, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v255.hash[2] file lineNumber description];

            uint64_t hasNonPurgeableAsset = v248;
            CC_LONG64 v96 = v255.hash[2];
          }
          unint64_t v97 = v96 | hasNonPurgeableAsset;
        }
        v255.hash[2] = v97 + 0x400000000000000;
      }
    }
    else
    {
      v98 = [MEMORY[0x1E4F28B00] currentHandler];
      v99 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      [v98 handleFailureInFunction:v99 file:@"MSVHasher+Algorithms.h" lineNumber:192 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  unint64_t managedStatus = self->_managedStatus;
  *(void *)&data[0] = managedStatus;
  uint64_t v118 = v254;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v128 = (char *)BYTE3(v255.count[1]);
        unint64_t v129 = (BYTE3(v255.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            unint64_t v130 = managedStatus >> 8;
            unint64_t v131 = managedStatus >> 16;
            unsigned __int8 v132 = managedStatus;
            managedStatus >>= 24;
            break;
          case 1:
            unint64_t v131 = managedStatus >> 8;
            unsigned __int8 v132 = v255.count[1];
            LOBYTE(v130) = managedStatus;
            managedStatus >>= 16;
            break;
          case 2:
            LOBYTE(v131) = managedStatus;
            managedStatus >>= 8;
            unsigned __int8 v132 = v255.count[1];
            LODWORD(v130) = HIBYTE(LOWORD(v255.count[1]));
            break;
          case 3:
            unsigned __int8 v132 = v255.count[1];
            LODWORD(v130) = HIBYTE(LOWORD(v255.count[1]));
            LOBYTE(v131) = BYTE2(v255.count[1]);
            break;
          default:
LABEL_202:
            LOBYTE(v130) = 0;
            unsigned __int8 v132 = 0;
            LOBYTE(v131) = 0;
            LODWORD(managedStatus) = 0;
            break;
        }
        int v140 = (v131 << 16) | (managedStatus << 24) | v132 | (v130 << 8);
        HIDWORD(v141) = (461845907 * ((380141568 * v140) | ((-862048943 * v140) >> 17))) ^ LODWORD(v255.count[0]);
        LODWORD(v141) = HIDWORD(v141);
        int v142 = 5 * (v141 >> 19) - 430675100;
        LODWORD(v255.count[0]) = v142;
        v143 = (char *)((char *)data - v128 + 4);
        v128 = (char *)(v129 + (char *)data - v128);
        if (v129 >= 5)
        {
          do
          {
            int v144 = *(_DWORD *)v143;
            v143 += 4;
            unint64_t v129 = 461845907 * ((380141568 * v144) | ((-862048943 * v144) >> 17));
            HIDWORD(v145) = v129 ^ v142;
            LODWORD(v145) = v129 ^ v142;
            int v142 = 5 * (v145 >> 19) - 430675100;
          }
          while (v143 < v128);
          LODWORD(v255.count[0]) = v142;
        }
        switch((int)v128)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v255.count[1]) = *v128;
            break;
          case 2:
            LOWORD(v255.count[1]) = *(_WORD *)v128;
            break;
          case 3:
            LOWORD(v255.count[1]) = *(_WORD *)v128;
            BYTE2(v255.count[1]) = v128[2];
            break;
          default:
            goto LABEL_202;
        }
        BYTE3(v255.count[1]) &= 3u;
        HIDWORD(v255.count[0]) += 8;
      }
      else
      {
        if (v254 != 3000) {
          goto LABEL_216;
        }
        _MSV_XXH_XXH32_update_16631(&v255, (char *)data, 8uLL);
      }
    }
    else if (v254)
    {
      if (v254 != 1000) {
        goto LABEL_216;
      }
      unint64_t v119 = v255.hash[2];
      if ((v255.hash[2] & 0x400000000000000) != 0)
      {
        if ((v255.hash[2] & 0x300000000000000) != 0)
        {
          unint64_t v242 = managedStatus;
          v243 = [MEMORY[0x1E4F28B00] currentHandler];
          v244 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          objc_msgSend(v243, "handleFailureInFunction:file:lineNumber:description:", v244, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v255.hash[2]);

          unint64_t managedStatus = v242;
          unint64_t v119 = v255.hash[2];
        }
        uint64_t v133 = v119 & 0xFFFFFFFFFFFFFFLL | (managedStatus << 32);
        CC_LONG64 v134 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
        CC_LONG64 v135 = v255.hash[0] + (v133 ^ v255.hash[1]);
        uint64_t v136 = __ROR8__(v133 ^ v255.hash[1], 48);
        CC_LONG64 v137 = (v135 ^ v136) + __ROR8__(v255.count[0] + v255.count[1], 32);
        CC_LONG64 v138 = v137 ^ __ROR8__(v135 ^ v136, 43);
        CC_LONG64 v139 = v135 + v134;
        v255.hash[0] = __ROR8__(v139, 32);
        v255.hash[1] = v138;
        v255.count[0] = v137 ^ v133;
        v255.count[1] = v139 ^ __ROR8__(v134, 47);
        unint64_t v119 = v119 & 0xFF00000000000000 | HIDWORD(managedStatus);
      }
      else
      {
        if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          unint64_t v231 = managedStatus;
          v232 = [MEMORY[0x1E4F28B00] currentHandler];
          v233 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          [v232 handleFailureInFunction:v233, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v255.hash[2] file lineNumber description];

          unint64_t managedStatus = v231;
          unint64_t v119 = v255.hash[2];
        }
        CC_LONG64 v120 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
        CC_LONG64 v121 = v255.hash[0] + (v255.hash[1] ^ managedStatus);
        uint64_t v122 = __ROR8__(v255.hash[1] ^ managedStatus, 48);
        CC_LONG64 v123 = (v121 ^ v122) + __ROR8__(v255.count[0] + v255.count[1], 32);
        CC_LONG64 v124 = v123 ^ __ROR8__(v121 ^ v122, 43);
        CC_LONG64 v125 = v121 + v120;
        v255.hash[0] = __ROR8__(v125, 32);
        v255.hash[1] = v124;
        v255.count[0] = v123 ^ managedStatus;
        v255.count[1] = v125 ^ __ROR8__(v120, 47);
      }
      v255.hash[2] = v119 + 0x800000000000000;
    }
    else
    {
      v126 = [MEMORY[0x1E4F28B00] currentHandler];
      v127 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v126 handleFailureInFunction:v127 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v255, (char *)data, 8uLL);
    }
    else
    {
      if (v254 != 4000) {
        goto LABEL_216;
      }
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
      default:
        goto LABEL_216;
    }
  }
  uint64_t v118 = v254;
LABEL_216:
  memset(&v256[8], 0, 64);
  *(void *)v256 = v118;
  if (v118 > 3000)
  {
    if (v118 <= 4000)
    {
      if (v118 == 3001)
      {
        *(void *)&v256[8] = _MSV_XXH_XXH64_digest(&v255);
      }
      else if (v118 == 4000)
      {
        CC_MD5_Final(&v256[8], (CC_MD5_CTX *)&v255);
      }
    }
    else
    {
      switch(v118)
      {
        case 4001:
          CC_SHA1_Final(&v256[8], (CC_SHA1_CTX *)&v255);
          break;
        case 4256:
          CC_SHA256_Final(&v256[8], (CC_SHA256_CTX *)&v255);
          break;
        case 4512:
          CC_SHA512_Final(&v256[8], &v255);
          break;
      }
    }
    goto LABEL_253;
  }
  if (v118 > 1999)
  {
    if (v118 != 2000)
    {
      if (v118 != 3000) {
        goto LABEL_253;
      }
      v176 = &v255.hash[1];
      if (HIDWORD(v255.count[0])) {
        int v177 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v255.count[1], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v255.count[1], (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        int v177 = LODWORD(v255.hash[0]) + 374761393;
      }
      unsigned int v181 = LODWORD(v255.count[0]) + v177;
      unint64_t v182 = v255.hash[3] & 0xF;
      if (v182 >= 4)
      {
        do
        {
          int v183 = *(_DWORD *)v176;
          v176 = (CC_LONG64 *)((char *)v176 + 4);
          HIDWORD(v184) = v181 - 1028477379 * v183;
          LODWORD(v184) = HIDWORD(v184);
          unsigned int v181 = 668265263 * (v184 >> 15);
          v182 -= 4;
        }
        while (v182 > 3);
      }
      for (; v182; --v182)
      {
        int v185 = *(unsigned __int8 *)v176;
        v176 = (CC_LONG64 *)((char *)v176 + 1);
        HIDWORD(v186) = v181 + 374761393 * v185;
        LODWORD(v186) = HIDWORD(v186);
        unsigned int v181 = -1640531535 * (v186 >> 21);
      }
      unsigned int v187 = -1028477379 * ((-2048144777 * (v181 ^ (v181 >> 15))) ^ ((-2048144777 * (v181 ^ (v181 >> 15))) >> 13));
      unsigned int v188 = v187 ^ HIWORD(v187);
      goto LABEL_252;
    }
    switch(BYTE3(v255.count[1]))
    {
      case 1u:
        int v180 = LOBYTE(v255.count[1]);
        break;
      case 2u:
        int v180 = LOWORD(v255.count[1]);
        break;
      case 3u:
        int v180 = LOWORD(v255.count[1]) | (BYTE2(v255.count[1]) << 16);
        break;
      default:
        unsigned int v189 = v255.count[0];
        goto LABEL_251;
    }
    unsigned int v189 = (461845907 * ((380141568 * v180) | ((-862048943 * v180) >> 17))) ^ LODWORD(v255.count[0]);
LABEL_251:
    unsigned int v190 = -2048144789 * (v189 ^ HIDWORD(v255.count[0]) ^ ((v189 ^ HIDWORD(v255.count[0])) >> 16));
    unsigned int v188 = (-1028477387 * (v190 ^ (v190 >> 13))) ^ ((-1028477387 * (v190 ^ (v190 >> 13))) >> 16);
    LODWORD(v255.count[0]) = v188;
LABEL_252:
    *(_DWORD *)&v256[8] = v188;
    goto LABEL_253;
  }
  if (v118)
  {
    if (v118 == 1000)
    {
      CC_LONG64 v146 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
      CC_LONG64 v147 = v255.hash[0] + (v255.hash[1] ^ v255.hash[2]);
      uint64_t v148 = __ROR8__(v255.hash[1] ^ v255.hash[2], 48);
      CC_LONG64 v149 = (v147 ^ v148) + __ROR8__(v255.count[0] + v255.count[1], 32);
      CC_LONG64 v150 = v149 ^ __ROR8__(v147 ^ v148, 43);
      CC_LONG64 v151 = v147 + v146;
      CC_LONG64 v152 = v151 ^ __ROR8__(v146, 47);
      CC_LONG64 v153 = (v149 ^ v255.hash[2]) + v152;
      CC_LONG64 v154 = v153 ^ __ROR8__(v152, 51);
      CC_LONG64 v155 = (__ROR8__(v151, 32) ^ 0xFFLL) + v150;
      uint64_t v156 = __ROR8__(v150, 48);
      uint64_t v157 = __ROR8__(v153, 32) + (v155 ^ v156);
      uint64_t v158 = v157 ^ __ROR8__(v155 ^ v156, 43);
      CC_LONG64 v159 = v154 + v155;
      CC_LONG64 v160 = v159 ^ __ROR8__(v154, 47);
      CC_LONG64 v161 = v160 + v157;
      uint64_t v162 = v161 ^ __ROR8__(v160, 51);
      uint64_t v163 = __ROR8__(v159, 32) + v158;
      uint64_t v164 = __ROR8__(v158, 48);
      uint64_t v165 = __ROR8__(v161, 32) + (v163 ^ v164);
      uint64_t v166 = v165 ^ __ROR8__(v163 ^ v164, 43);
      uint64_t v167 = v162 + v163;
      uint64_t v168 = v167 ^ __ROR8__(v162, 47);
      uint64_t v169 = v168 + v165;
      uint64_t v170 = v169 ^ __ROR8__(v168, 51);
      uint64_t v171 = __ROR8__(v167, 32) + v166;
      uint64_t v172 = __ROR8__(v166, 48);
      CC_LONG64 v173 = __ROR8__(v169, 32) + (v171 ^ v172);
      CC_LONG64 v174 = v173 ^ __ROR8__(v171 ^ v172, 43);
      uint64_t v175 = v170 + v171;
      v255.count[0] = v173;
      v255.count[1] = v175 ^ __ROR8__(v170, 47);
      v255.hash[0] = __ROR8__(v175, 32);
      v255.hash[1] = v174;
      *(void *)&v256[8] = v255.count[1] ^ v173 ^ v255.hash[0] ^ v174;
    }
  }
  else
  {
    v178 = [MEMORY[0x1E4F28B00] currentHandler];
    v179 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v178 handleFailureInFunction:v179 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_253:
  data[0] = *(_OWORD *)v256;
  data[1] = *(_OWORD *)&v256[16];
  data[2] = *(_OWORD *)&v256[32];
  data[3] = *(_OWORD *)&v256[48];
  uint64_t v258 = *(void *)&v256[64];
  if (*(uint64_t *)v256 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(void *)&data[0] == 4256)
      {
        v213 = (unsigned __int8 *)data + 8;
        v214 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v215 = v214;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v217 = *v213++;
          v218 = &v214[i];
          char *v218 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v217 >> 4];
          v218[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v217 & 0xF];
        }
        id v197 = [NSString alloc];
        v198 = v215;
        uint64_t v199 = 64;
      }
      else
      {
        if (*(void *)&data[0] != 4512) {
          goto LABEL_281;
        }
        v201 = (unsigned __int8 *)data + 8;
        v202 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v203 = v202;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v205 = *v201++;
          v206 = &v202[j];
          char *v206 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v205 >> 4];
          v206[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v205 & 0xF];
        }
        id v197 = [NSString alloc];
        v198 = v203;
        uint64_t v199 = 128;
      }
    }
    else if (*(void *)&data[0] == 4000)
    {
      v207 = (unsigned __int8 *)data + 8;
      v208 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v209 = v208;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v211 = *v207++;
        v212 = &v208[k];
        char *v212 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v211 >> 4];
        v212[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v211 & 0xF];
      }
      id v197 = [NSString alloc];
      v198 = v209;
      uint64_t v199 = 32;
    }
    else
    {
      if (*(void *)&data[0] != 4001) {
        goto LABEL_281;
      }
      v191 = (unsigned __int8 *)data + 8;
      v192 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v193 = v192;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v195 = *v191++;
        v196 = &v192[m];
        char *v196 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v195 >> 4];
        v196[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v195 & 0xF];
      }
      id v197 = [NSString alloc];
      v198 = v193;
      uint64_t v199 = 40;
    }
    v219 = (void *)[v197 initWithBytesNoCopy:v198 length:v199 encoding:4 freeWhenDone:1];
    unint64_t v200 = [v219 hash];

    return v200;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(void *)&data[0] != 1000)
    {
      if (*(void *)&data[0] != 2000) {
        goto LABEL_281;
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
LABEL_281:
    v221 = [MEMORY[0x1E4F28B00] currentHandler];
    v222 = [NSString stringWithUTF8String:"NSUInteger _MSVHashGetHash(MSVHash)"];
    [v221 handleFailureInFunction:v222 file:@"MSVHasher+Algorithms.h" lineNumber:301 description:@"Cannot obtain hash from unknown hasher algorithm"];

    return 0;
  }
  return *((void *)&data[0] + 1);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration;
    BOOL v8 = [(MPLibraryKeepLocalStatusObserverConfiguration *)&v10 isEqual:v5]
      && (BOOL v6 = [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)self isCollectionType], v6 == [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v5 isCollectionType])&& !self->_hasNonPurgeableAsset != v5->_hasNonPurgeableAsset&& (v7 = [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)self isStoreRedownloadable], v7 == [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v5 isStoreRedownloadable])&& self->_managedStatus == v5->_managedStatus;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end