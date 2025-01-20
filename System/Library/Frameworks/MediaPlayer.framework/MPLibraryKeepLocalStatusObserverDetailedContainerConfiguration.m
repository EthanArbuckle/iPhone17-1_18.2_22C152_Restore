@interface MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration
- (BOOL)isEqual:(id)a3;
- (NSArray)pendingItemIdentifiers;
- (id)description;
- (int64_t)downloadEnabledItemCount;
- (int64_t)nonPurgeableItemCount;
- (int64_t)redownloadableItemCount;
- (unint64_t)hash;
- (void)setDownloadEnabledItemCount:(int64_t)a3;
- (void)setNonPurgeableItemCount:(int64_t)a3;
- (void)setPendingItemIdentifiers:(id)a3;
- (void)setRedownloadableItemCount:(int64_t)a3;
@end

@implementation MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration

- (void).cxx_destruct
{
}

- (void)setRedownloadableItemCount:(int64_t)a3
{
  self->_redownloadableItemCount = a3;
}

- (int64_t)redownloadableItemCount
{
  return self->_redownloadableItemCount;
}

- (void)setNonPurgeableItemCount:(int64_t)a3
{
  self->_nonPurgeableItemCount = a3;
}

- (int64_t)nonPurgeableItemCount
{
  return self->_nonPurgeableItemCount;
}

- (void)setDownloadEnabledItemCount:(int64_t)a3
{
  self->_downloadEnabledItemCount = a3;
}

- (int64_t)downloadEnabledItemCount
{
  return self->_downloadEnabledItemCount;
}

- (void)setPendingItemIdentifiers:(id)a3
{
}

- (NSArray)pendingItemIdentifiers
{
  return self->_pendingItemIdentifiers;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: [downloadEnabledItemCount=%ld, nonPurgeableItemCount=%ld, redownloadableItemCount=%ld]>", objc_opt_class(), self, self->_downloadEnabledItemCount, self->_nonPurgeableItemCount, self->_redownloadableItemCount];
}

- (unint64_t)hash
{
  uint64_t v268 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  memset(&v264.hash[3], 0, 168);
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v263 = 1000;
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
  v264.hash[0] = __ROR8__(v17, 32);
  v264.hash[1] = v16 ^ __ROR8__(v15, 43);
  v264.count[0] = v16 ^ v11;
  v264.count[1] = v17 ^ __ROR8__(v13, 47);
  v264.hash[2] = 0x800000000000000;

  v262.receiver = self;
  v262.super_class = (Class)MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration;
  unint64_t v18 = [(MPLibraryKeepLocalStatusObserverConfiguration *)&v262 hash];
  *(void *)&data[0] = v18;
  if (v263 <= 3000)
  {
    if (v263 > 1999)
    {
      if (v263 == 2000)
      {
        v28 = (char *)BYTE3(v264.count[1]);
        unint64_t v29 = (BYTE3(v264.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v264.count[1]))
        {
          case 0:
            unint64_t v30 = v18 >> 8;
            unint64_t v31 = v18 >> 16;
            unsigned __int8 v32 = v18;
            unint64_t v33 = v18 >> 24;
            goto LABEL_33;
          case 1:
            unint64_t v31 = v18 >> 8;
            unsigned __int8 v32 = v264.count[1];
            LOBYTE(v30) = v18;
            unint64_t v33 = v18 >> 16;
            goto LABEL_33;
          case 2:
            LOBYTE(v31) = v18;
            unint64_t v33 = v18 >> 8;
            unsigned __int8 v32 = v264.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v264.count[1]));
LABEL_33:
            LODWORD(v18) = v33;
            break;
          case 3:
            unsigned __int8 v32 = v264.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v264.count[1]));
            LOBYTE(v31) = BYTE2(v264.count[1]);
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
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v264.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        int v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v264.count[0]) = v43;
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
          LODWORD(v264.count[0]) = v29 - 430675100;
        }
        switch((int)v28)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v264.count[1]) = *v28;
            break;
          case 2:
            LOWORD(v264.count[1]) = *(_WORD *)v28;
            break;
          case 3:
            LOWORD(v264.count[1]) = *(_WORD *)v28;
            BYTE2(v264.count[1]) = v28[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v264.count[1]) &= 3u;
        HIDWORD(v264.count[0]) += 8;
      }
      else if (v263 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v264, (char *)data, 8uLL);
      }
    }
    else if (v263)
    {
      if (v263 == 1000)
      {
        unint64_t v19 = v264.hash[2];
        if ((v264.hash[2] & 0x400000000000000) != 0)
        {
          if ((v264.hash[2] & 0x300000000000000) != 0)
          {
            unint64_t v250 = v18;
            v251 = [MEMORY[0x1E4F28B00] currentHandler];
            v252 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v251, "handleFailureInFunction:file:lineNumber:description:", v252, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v264.hash[2]);

            unint64_t v18 = v250;
            unint64_t v19 = v264.hash[2];
          }
          uint64_t v34 = v19 & 0xFFFFFFFFFFFFFFLL | (v18 << 32);
          CC_LONG64 v35 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v36 = v264.hash[0] + (v34 ^ v264.hash[1]);
          uint64_t v37 = __ROR8__(v34 ^ v264.hash[1], 48);
          CC_LONG64 v38 = (v36 ^ v37) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          CC_LONG64 v40 = v36 + v35;
          v264.hash[0] = __ROR8__(v40, 32);
          v264.hash[1] = v39;
          v264.count[0] = v38 ^ v34;
          v264.count[1] = v40 ^ __ROR8__(v35, 47);
          unint64_t v19 = v19 & 0xFF00000000000000 | HIDWORD(v18);
        }
        else
        {
          if ((v264.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unint64_t v238 = v18;
            v239 = [MEMORY[0x1E4F28B00] currentHandler];
            v240 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v239 handleFailureInFunction:v240, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v264.hash[2] file lineNumber description];

            unint64_t v18 = v238;
            unint64_t v19 = v264.hash[2];
          }
          CC_LONG64 v20 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v21 = v264.hash[0] + (v264.hash[1] ^ v18);
          uint64_t v22 = __ROR8__(v264.hash[1] ^ v18, 48);
          CC_LONG64 v23 = (v21 ^ v22) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
          CC_LONG64 v25 = v21 + v20;
          v264.hash[0] = __ROR8__(v25, 32);
          v264.hash[1] = v24;
          v264.count[0] = v23 ^ v18;
          v264.count[1] = v25 ^ __ROR8__(v20, 47);
        }
        v264.hash[2] = v19 + 0x800000000000000;
      }
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v26 handleFailureInFunction:v27 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v263 <= 4000)
  {
    if (v263 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v264, (char *)data, 8uLL);
    }
    else if (v263 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v264, data, 4u);
    }
  }
  else
  {
    switch(v263)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v264, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v264, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v264, data, 4u);
        break;
    }
  }
  unint64_t downloadEnabledItemCount = self->_downloadEnabledItemCount;
  *(void *)&data[0] = downloadEnabledItemCount;
  if (v263 <= 3000)
  {
    if (v263 > 1999)
    {
      if (v263 == 2000)
      {
        v57 = (char *)BYTE3(v264.count[1]);
        unint64_t v58 = (BYTE3(v264.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v264.count[1]))
        {
          case 0:
            unint64_t v59 = downloadEnabledItemCount >> 8;
            unint64_t v60 = downloadEnabledItemCount >> 16;
            unsigned __int8 v61 = downloadEnabledItemCount;
            downloadEnabledItemCount >>= 24;
            break;
          case 1:
            unint64_t v60 = downloadEnabledItemCount >> 8;
            unsigned __int8 v61 = v264.count[1];
            LOBYTE(v59) = downloadEnabledItemCount;
            downloadEnabledItemCount >>= 16;
            break;
          case 2:
            LOBYTE(v60) = downloadEnabledItemCount;
            downloadEnabledItemCount >>= 8;
            unsigned __int8 v61 = v264.count[1];
            LODWORD(v59) = HIBYTE(LOWORD(v264.count[1]));
            break;
          case 3:
            unsigned __int8 v61 = v264.count[1];
            LODWORD(v59) = HIBYTE(LOWORD(v264.count[1]));
            LOBYTE(v60) = BYTE2(v264.count[1]);
            break;
          default:
LABEL_72:
            LOBYTE(v59) = 0;
            unsigned __int8 v61 = 0;
            LOBYTE(v60) = 0;
            LODWORD(downloadEnabledItemCount) = 0;
            break;
        }
        int v69 = (v60 << 16) | (downloadEnabledItemCount << 24) | v61 | (v59 << 8);
        HIDWORD(v70) = (461845907 * ((380141568 * v69) | ((-862048943 * v69) >> 17))) ^ LODWORD(v264.count[0]);
        LODWORD(v70) = HIDWORD(v70);
        int v71 = 5 * (v70 >> 19) - 430675100;
        LODWORD(v264.count[0]) = v71;
        v72 = (char *)((char *)data - v57 + 4);
        v57 = (char *)(v58 + (char *)data - v57);
        if (v58 >= 5)
        {
          do
          {
            int v73 = *(_DWORD *)v72;
            v72 += 4;
            HIDWORD(v74) = (461845907 * ((380141568 * v73) | ((-862048943 * v73) >> 17))) ^ v71;
            LODWORD(v74) = HIDWORD(v74);
            unint64_t v58 = 5 * (v74 >> 19);
            int v71 = v58 - 430675100;
          }
          while (v72 < v57);
          LODWORD(v264.count[0]) = v58 - 430675100;
        }
        switch((int)v57)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v264.count[1]) = *v57;
            break;
          case 2:
            LOWORD(v264.count[1]) = *(_WORD *)v57;
            break;
          case 3:
            LOWORD(v264.count[1]) = *(_WORD *)v57;
            BYTE2(v264.count[1]) = v57[2];
            break;
          default:
            goto LABEL_72;
        }
        BYTE3(v264.count[1]) &= 3u;
        HIDWORD(v264.count[0]) += 8;
      }
      else if (v263 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v264, (char *)data, 8uLL);
      }
    }
    else if (v263)
    {
      if (v263 == 1000)
      {
        unint64_t v48 = v264.hash[2];
        if ((v264.hash[2] & 0x400000000000000) != 0)
        {
          if ((v264.hash[2] & 0x300000000000000) != 0)
          {
            v253 = [MEMORY[0x1E4F28B00] currentHandler];
            v254 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v253, "handleFailureInFunction:file:lineNumber:description:", v254, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v264.hash[2]);

            unint64_t v48 = v264.hash[2];
          }
          uint64_t v62 = v48 & 0xFFFFFFFFFFFFFFLL | (downloadEnabledItemCount << 32);
          CC_LONG64 v63 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v64 = v264.hash[0] + (v62 ^ v264.hash[1]);
          uint64_t v65 = __ROR8__(v62 ^ v264.hash[1], 48);
          CC_LONG64 v66 = (v64 ^ v65) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
          CC_LONG64 v68 = v64 + v63;
          v264.hash[0] = __ROR8__(v68, 32);
          v264.hash[1] = v67;
          v264.count[0] = v66 ^ v62;
          v264.count[1] = v68 ^ __ROR8__(v63, 47);
          unint64_t v48 = v48 & 0xFF00000000000000 | HIDWORD(downloadEnabledItemCount);
        }
        else
        {
          if ((v264.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v241 = [MEMORY[0x1E4F28B00] currentHandler];
            v242 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v241 handleFailureInFunction:v242, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v264.hash[2] file lineNumber description];

            unint64_t v48 = v264.hash[2];
          }
          CC_LONG64 v49 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v50 = v264.hash[0] + (v264.hash[1] ^ downloadEnabledItemCount);
          uint64_t v51 = __ROR8__(v264.hash[1] ^ downloadEnabledItemCount, 48);
          CC_LONG64 v52 = (v50 ^ v51) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
          CC_LONG64 v54 = v50 + v49;
          v264.hash[0] = __ROR8__(v54, 32);
          v264.hash[1] = v53;
          v264.count[0] = v52 ^ downloadEnabledItemCount;
          v264.count[1] = v54 ^ __ROR8__(v49, 47);
        }
        v264.hash[2] = v48 + 0x800000000000000;
      }
    }
    else
    {
      v55 = [MEMORY[0x1E4F28B00] currentHandler];
      v56 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v55 handleFailureInFunction:v56 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v263 <= 4000)
  {
    if (v263 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v264, (char *)data, 8uLL);
    }
    else if (v263 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v264, data, 4u);
    }
  }
  else
  {
    switch(v263)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v264, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v264, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v264, data, 4u);
        break;
    }
  }
  unint64_t nonPurgeableItemCount = self->_nonPurgeableItemCount;
  *(void *)&data[0] = nonPurgeableItemCount;
  if (v263 <= 3000)
  {
    if (v263 > 1999)
    {
      if (v263 == 2000)
      {
        v85 = (char *)BYTE3(v264.count[1]);
        unint64_t v86 = (BYTE3(v264.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v264.count[1]))
        {
          case 0:
            unint64_t v87 = nonPurgeableItemCount >> 8;
            unint64_t v88 = nonPurgeableItemCount >> 16;
            unsigned __int8 v89 = nonPurgeableItemCount;
            nonPurgeableItemCount >>= 24;
            break;
          case 1:
            unint64_t v88 = nonPurgeableItemCount >> 8;
            unsigned __int8 v89 = v264.count[1];
            LOBYTE(v87) = nonPurgeableItemCount;
            nonPurgeableItemCount >>= 16;
            break;
          case 2:
            LOBYTE(v88) = nonPurgeableItemCount;
            nonPurgeableItemCount >>= 8;
            unsigned __int8 v89 = v264.count[1];
            LODWORD(v87) = HIBYTE(LOWORD(v264.count[1]));
            break;
          case 3:
            unsigned __int8 v89 = v264.count[1];
            LODWORD(v87) = HIBYTE(LOWORD(v264.count[1]));
            LOBYTE(v88) = BYTE2(v264.count[1]);
            break;
          default:
LABEL_114:
            LOBYTE(v87) = 0;
            unsigned __int8 v89 = 0;
            LOBYTE(v88) = 0;
            LODWORD(nonPurgeableItemCount) = 0;
            break;
        }
        int v97 = (v88 << 16) | (nonPurgeableItemCount << 24) | v89 | (v87 << 8);
        HIDWORD(v98) = (461845907 * ((380141568 * v97) | ((-862048943 * v97) >> 17))) ^ LODWORD(v264.count[0]);
        LODWORD(v98) = HIDWORD(v98);
        int v99 = 5 * (v98 >> 19) - 430675100;
        LODWORD(v264.count[0]) = v99;
        v100 = (char *)((char *)data - v85 + 4);
        v85 = (char *)(v86 + (char *)data - v85);
        if (v86 >= 5)
        {
          do
          {
            int v101 = *(_DWORD *)v100;
            v100 += 4;
            HIDWORD(v102) = (461845907 * ((380141568 * v101) | ((-862048943 * v101) >> 17))) ^ v99;
            LODWORD(v102) = HIDWORD(v102);
            unint64_t v86 = 5 * (v102 >> 19);
            int v99 = v86 - 430675100;
          }
          while (v100 < v85);
          LODWORD(v264.count[0]) = v86 - 430675100;
        }
        switch((int)v85)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v264.count[1]) = *v85;
            break;
          case 2:
            LOWORD(v264.count[1]) = *(_WORD *)v85;
            break;
          case 3:
            LOWORD(v264.count[1]) = *(_WORD *)v85;
            BYTE2(v264.count[1]) = v85[2];
            break;
          default:
            goto LABEL_114;
        }
        BYTE3(v264.count[1]) &= 3u;
        HIDWORD(v264.count[0]) += 8;
      }
      else if (v263 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v264, (char *)data, 8uLL);
      }
    }
    else if (v263)
    {
      if (v263 == 1000)
      {
        unint64_t v76 = v264.hash[2];
        if ((v264.hash[2] & 0x400000000000000) != 0)
        {
          if ((v264.hash[2] & 0x300000000000000) != 0)
          {
            v255 = [MEMORY[0x1E4F28B00] currentHandler];
            v256 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v255, "handleFailureInFunction:file:lineNumber:description:", v256, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v264.hash[2]);

            unint64_t v76 = v264.hash[2];
          }
          uint64_t v90 = v76 & 0xFFFFFFFFFFFFFFLL | (nonPurgeableItemCount << 32);
          CC_LONG64 v91 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v92 = v264.hash[0] + (v90 ^ v264.hash[1]);
          uint64_t v93 = __ROR8__(v90 ^ v264.hash[1], 48);
          CC_LONG64 v94 = (v92 ^ v93) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v95 = v94 ^ __ROR8__(v92 ^ v93, 43);
          CC_LONG64 v96 = v92 + v91;
          v264.hash[0] = __ROR8__(v96, 32);
          v264.hash[1] = v95;
          v264.count[0] = v94 ^ v90;
          v264.count[1] = v96 ^ __ROR8__(v91, 47);
          unint64_t v76 = v76 & 0xFF00000000000000 | HIDWORD(nonPurgeableItemCount);
        }
        else
        {
          if ((v264.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v243 = [MEMORY[0x1E4F28B00] currentHandler];
            v244 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v243 handleFailureInFunction:v244, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v264.hash[2] file lineNumber description];

            unint64_t v76 = v264.hash[2];
          }
          CC_LONG64 v77 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v78 = v264.hash[0] + (v264.hash[1] ^ nonPurgeableItemCount);
          uint64_t v79 = __ROR8__(v264.hash[1] ^ nonPurgeableItemCount, 48);
          CC_LONG64 v80 = (v78 ^ v79) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v81 = v80 ^ __ROR8__(v78 ^ v79, 43);
          CC_LONG64 v82 = v78 + v77;
          v264.hash[0] = __ROR8__(v82, 32);
          v264.hash[1] = v81;
          v264.count[0] = v80 ^ nonPurgeableItemCount;
          v264.count[1] = v82 ^ __ROR8__(v77, 47);
        }
        v264.hash[2] = v76 + 0x800000000000000;
      }
    }
    else
    {
      v83 = [MEMORY[0x1E4F28B00] currentHandler];
      v84 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v83 handleFailureInFunction:v84 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v263 <= 4000)
  {
    if (v263 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v264, (char *)data, 8uLL);
    }
    else if (v263 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v264, data, 4u);
    }
  }
  else
  {
    switch(v263)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v264, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v264, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v264, data, 4u);
        break;
    }
  }
  unint64_t redownloadableItemCount = self->_redownloadableItemCount;
  *(void *)&data[0] = redownloadableItemCount;
  if (v263 <= 3000)
  {
    if (v263 > 1999)
    {
      if (v263 == 2000)
      {
        v113 = (char *)BYTE3(v264.count[1]);
        unint64_t v114 = (BYTE3(v264.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v264.count[1]))
        {
          case 0:
            unint64_t v115 = redownloadableItemCount >> 8;
            unint64_t v116 = redownloadableItemCount >> 16;
            unsigned __int8 v117 = redownloadableItemCount;
            redownloadableItemCount >>= 24;
            break;
          case 1:
            unint64_t v116 = redownloadableItemCount >> 8;
            unsigned __int8 v117 = v264.count[1];
            LOBYTE(v115) = redownloadableItemCount;
            redownloadableItemCount >>= 16;
            break;
          case 2:
            LOBYTE(v116) = redownloadableItemCount;
            redownloadableItemCount >>= 8;
            unsigned __int8 v117 = v264.count[1];
            LODWORD(v115) = HIBYTE(LOWORD(v264.count[1]));
            break;
          case 3:
            unsigned __int8 v117 = v264.count[1];
            LODWORD(v115) = HIBYTE(LOWORD(v264.count[1]));
            LOBYTE(v116) = BYTE2(v264.count[1]);
            break;
          default:
LABEL_156:
            LOBYTE(v115) = 0;
            unsigned __int8 v117 = 0;
            LOBYTE(v116) = 0;
            LODWORD(redownloadableItemCount) = 0;
            break;
        }
        int v125 = (v116 << 16) | (redownloadableItemCount << 24) | v117 | (v115 << 8);
        HIDWORD(v126) = (461845907 * ((380141568 * v125) | ((-862048943 * v125) >> 17))) ^ LODWORD(v264.count[0]);
        LODWORD(v126) = HIDWORD(v126);
        int v127 = 5 * (v126 >> 19) - 430675100;
        LODWORD(v264.count[0]) = v127;
        v128 = (char *)((char *)data - v113 + 4);
        v113 = (char *)(v114 + (char *)data - v113);
        if (v114 >= 5)
        {
          do
          {
            int v129 = *(_DWORD *)v128;
            v128 += 4;
            HIDWORD(v130) = (461845907 * ((380141568 * v129) | ((-862048943 * v129) >> 17))) ^ v127;
            LODWORD(v130) = HIDWORD(v130);
            unint64_t v114 = 5 * (v130 >> 19);
            int v127 = v114 - 430675100;
          }
          while (v128 < v113);
          LODWORD(v264.count[0]) = v114 - 430675100;
        }
        switch((int)v113)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v264.count[1]) = *v113;
            break;
          case 2:
            LOWORD(v264.count[1]) = *(_WORD *)v113;
            break;
          case 3:
            LOWORD(v264.count[1]) = *(_WORD *)v113;
            BYTE2(v264.count[1]) = v113[2];
            break;
          default:
            goto LABEL_156;
        }
        BYTE3(v264.count[1]) &= 3u;
        HIDWORD(v264.count[0]) += 8;
      }
      else if (v263 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v264, (char *)data, 8uLL);
      }
    }
    else if (v263)
    {
      if (v263 == 1000)
      {
        unint64_t v104 = v264.hash[2];
        if ((v264.hash[2] & 0x400000000000000) != 0)
        {
          if ((v264.hash[2] & 0x300000000000000) != 0)
          {
            v257 = [MEMORY[0x1E4F28B00] currentHandler];
            v258 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v257, "handleFailureInFunction:file:lineNumber:description:", v258, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v264.hash[2]);

            unint64_t v104 = v264.hash[2];
          }
          uint64_t v118 = v104 & 0xFFFFFFFFFFFFFFLL | (redownloadableItemCount << 32);
          CC_LONG64 v119 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v120 = v264.hash[0] + (v118 ^ v264.hash[1]);
          uint64_t v121 = __ROR8__(v118 ^ v264.hash[1], 48);
          CC_LONG64 v122 = (v120 ^ v121) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v123 = v122 ^ __ROR8__(v120 ^ v121, 43);
          CC_LONG64 v124 = v120 + v119;
          v264.hash[0] = __ROR8__(v124, 32);
          v264.hash[1] = v123;
          v264.count[0] = v122 ^ v118;
          v264.count[1] = v124 ^ __ROR8__(v119, 47);
          unint64_t v104 = v104 & 0xFF00000000000000 | HIDWORD(redownloadableItemCount);
        }
        else
        {
          if ((v264.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v245 = [MEMORY[0x1E4F28B00] currentHandler];
            v246 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v245 handleFailureInFunction:v246, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v264.hash[2] file lineNumber description];

            unint64_t v104 = v264.hash[2];
          }
          CC_LONG64 v105 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v106 = v264.hash[0] + (v264.hash[1] ^ redownloadableItemCount);
          uint64_t v107 = __ROR8__(v264.hash[1] ^ redownloadableItemCount, 48);
          CC_LONG64 v108 = (v106 ^ v107) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v109 = v108 ^ __ROR8__(v106 ^ v107, 43);
          CC_LONG64 v110 = v106 + v105;
          v264.hash[0] = __ROR8__(v110, 32);
          v264.hash[1] = v109;
          v264.count[0] = v108 ^ redownloadableItemCount;
          v264.count[1] = v110 ^ __ROR8__(v105, 47);
        }
        v264.hash[2] = v104 + 0x800000000000000;
      }
    }
    else
    {
      v111 = [MEMORY[0x1E4F28B00] currentHandler];
      v112 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v111 handleFailureInFunction:v112 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v263 <= 4000)
  {
    if (v263 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v264, (char *)data, 8uLL);
    }
    else if (v263 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v264, data, 4u);
    }
  }
  else
  {
    switch(v263)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v264, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v264, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v264, data, 4u);
        break;
    }
  }
  v131 = self->_pendingItemIdentifiers;
  unint64_t v132 = [(NSArray *)v131 hash];
  *(void *)&data[0] = v132;
  if (v263 <= 3000)
  {
    if (v263 > 1999)
    {
      if (v263 == 2000)
      {
        v142 = (char *)BYTE3(v264.count[1]);
        unint64_t v143 = (BYTE3(v264.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v264.count[1]))
        {
          case 0:
            unint64_t v144 = v132 >> 8;
            unint64_t v145 = v132 >> 16;
            unsigned __int8 v146 = v132;
            unint64_t v147 = v132 >> 24;
            goto LABEL_201;
          case 1:
            unint64_t v145 = v132 >> 8;
            unsigned __int8 v146 = v264.count[1];
            LOBYTE(v144) = v132;
            unint64_t v147 = v132 >> 16;
            goto LABEL_201;
          case 2:
            LOBYTE(v145) = v132;
            unint64_t v147 = v132 >> 8;
            unsigned __int8 v146 = v264.count[1];
            LODWORD(v144) = HIBYTE(LOWORD(v264.count[1]));
LABEL_201:
            LODWORD(v132) = v147;
            break;
          case 3:
            unsigned __int8 v146 = v264.count[1];
            LODWORD(v144) = HIBYTE(LOWORD(v264.count[1]));
            LOBYTE(v145) = BYTE2(v264.count[1]);
            break;
          default:
LABEL_198:
            LOBYTE(v144) = 0;
            unsigned __int8 v146 = 0;
            LOBYTE(v145) = 0;
            LODWORD(v132) = 0;
            break;
        }
        int v155 = (v145 << 16) | (v132 << 24) | v146 | (v144 << 8);
        HIDWORD(v156) = (461845907 * ((380141568 * v155) | ((-862048943 * v155) >> 17))) ^ LODWORD(v264.count[0]);
        LODWORD(v156) = HIDWORD(v156);
        int v157 = 5 * (v156 >> 19) - 430675100;
        LODWORD(v264.count[0]) = v157;
        v158 = (char *)((char *)data - v142 + 4);
        v142 = (char *)(v143 + (char *)data - v142);
        if (v143 >= 5)
        {
          do
          {
            int v159 = *(_DWORD *)v158;
            v158 += 4;
            HIDWORD(v160) = (461845907 * ((380141568 * v159) | ((-862048943 * v159) >> 17))) ^ v157;
            LODWORD(v160) = HIDWORD(v160);
            unint64_t v143 = 5 * (v160 >> 19);
            int v157 = v143 - 430675100;
          }
          while (v158 < v142);
          LODWORD(v264.count[0]) = v143 - 430675100;
        }
        switch((int)v142)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v264.count[1]) = *v142;
            break;
          case 2:
            LOWORD(v264.count[1]) = *(_WORD *)v142;
            break;
          case 3:
            LOWORD(v264.count[1]) = *(_WORD *)v142;
            BYTE2(v264.count[1]) = v142[2];
            break;
          default:
            goto LABEL_198;
        }
        BYTE3(v264.count[1]) &= 3u;
        HIDWORD(v264.count[0]) += 8;
      }
      else if (v263 == 3000)
      {
        _MSV_XXH_XXH32_update_16631(&v264, (char *)data, 8uLL);
      }
    }
    else if (v263)
    {
      if (v263 == 1000)
      {
        unint64_t v133 = v264.hash[2];
        if ((v264.hash[2] & 0x400000000000000) != 0)
        {
          if ((v264.hash[2] & 0x300000000000000) != 0)
          {
            unint64_t v259 = v132;
            v260 = [MEMORY[0x1E4F28B00] currentHandler];
            v261 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v260, "handleFailureInFunction:file:lineNumber:description:", v261, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v264.hash[2]);

            unint64_t v132 = v259;
            unint64_t v133 = v264.hash[2];
          }
          uint64_t v148 = v133 & 0xFFFFFFFFFFFFFFLL | (v132 << 32);
          CC_LONG64 v149 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v150 = v264.hash[0] + (v148 ^ v264.hash[1]);
          uint64_t v151 = __ROR8__(v148 ^ v264.hash[1], 48);
          CC_LONG64 v152 = (v150 ^ v151) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v153 = v152 ^ __ROR8__(v150 ^ v151, 43);
          CC_LONG64 v154 = v150 + v149;
          v264.hash[0] = __ROR8__(v154, 32);
          v264.hash[1] = v153;
          v264.count[0] = v152 ^ v148;
          v264.count[1] = v154 ^ __ROR8__(v149, 47);
          unint64_t v133 = v133 & 0xFF00000000000000 | HIDWORD(v132);
        }
        else
        {
          if ((v264.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unint64_t v247 = v132;
            v248 = [MEMORY[0x1E4F28B00] currentHandler];
            v249 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v248 handleFailureInFunction:v249, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v264.hash[2] file lineNumber description];

            unint64_t v132 = v247;
            unint64_t v133 = v264.hash[2];
          }
          CC_LONG64 v134 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
          CC_LONG64 v135 = v264.hash[0] + (v264.hash[1] ^ v132);
          uint64_t v136 = __ROR8__(v264.hash[1] ^ v132, 48);
          CC_LONG64 v137 = (v135 ^ v136) + __ROR8__(v264.count[0] + v264.count[1], 32);
          CC_LONG64 v138 = v137 ^ __ROR8__(v135 ^ v136, 43);
          CC_LONG64 v139 = v135 + v134;
          v264.hash[0] = __ROR8__(v139, 32);
          v264.hash[1] = v138;
          v264.count[0] = v137 ^ v132;
          v264.count[1] = v139 ^ __ROR8__(v134, 47);
        }
        v264.hash[2] = v133 + 0x800000000000000;
      }
    }
    else
    {
      v140 = [MEMORY[0x1E4F28B00] currentHandler];
      v141 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v140 handleFailureInFunction:v141 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v263 <= 4000)
  {
    if (v263 == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v264, (char *)data, 8uLL);
    }
    else if (v263 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v264, data, 4u);
    }
  }
  else
  {
    switch(v263)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v264, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v264, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v264, data, 4u);
        break;
    }
  }

  memset(&v265[8], 0, 64);
  *(void *)v265 = v263;
  if (v263 > 3000)
  {
    if (v263 <= 4000)
    {
      if (v263 == 3001)
      {
        *(void *)&v265[8] = _MSV_XXH_XXH64_digest(&v264);
      }
      else if (v263 == 4000)
      {
        CC_MD5_Final(&v265[8], (CC_MD5_CTX *)&v264);
      }
    }
    else
    {
      switch(v263)
      {
        case 4001:
          CC_SHA1_Final(&v265[8], (CC_SHA1_CTX *)&v264);
          break;
        case 4256:
          CC_SHA256_Final(&v265[8], (CC_SHA256_CTX *)&v264);
          break;
        case 4512:
          CC_SHA512_Final(&v265[8], &v264);
          break;
      }
    }
    goto LABEL_248;
  }
  if (v263 > 1999)
  {
    if (v263 != 2000)
    {
      if (v263 != 3000) {
        goto LABEL_248;
      }
      v191 = &v264.hash[1];
      if (HIDWORD(v264.count[0])) {
        int v192 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v264.count[1], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v264.count[1], (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        int v192 = LODWORD(v264.hash[0]) + 374761393;
      }
      unsigned int v196 = LODWORD(v264.count[0]) + v192;
      unint64_t v197 = v264.hash[3] & 0xF;
      if (v197 >= 4)
      {
        do
        {
          int v198 = *(_DWORD *)v191;
          v191 = (CC_LONG64 *)((char *)v191 + 4);
          HIDWORD(v199) = v196 - 1028477379 * v198;
          LODWORD(v199) = HIDWORD(v199);
          unsigned int v196 = 668265263 * (v199 >> 15);
          v197 -= 4;
        }
        while (v197 > 3);
      }
      for (; v197; --v197)
      {
        int v200 = *(unsigned __int8 *)v191;
        v191 = (CC_LONG64 *)((char *)v191 + 1);
        HIDWORD(v201) = v196 + 374761393 * v200;
        LODWORD(v201) = HIDWORD(v201);
        unsigned int v196 = -1640531535 * (v201 >> 21);
      }
      unsigned int v202 = -1028477379 * ((-2048144777 * (v196 ^ (v196 >> 15))) ^ ((-2048144777 * (v196 ^ (v196 >> 15))) >> 13));
      unsigned int v203 = v202 ^ HIWORD(v202);
      goto LABEL_247;
    }
    switch(BYTE3(v264.count[1]))
    {
      case 1u:
        int v195 = LOBYTE(v264.count[1]);
        break;
      case 2u:
        int v195 = LOWORD(v264.count[1]);
        break;
      case 3u:
        int v195 = LOWORD(v264.count[1]) | (BYTE2(v264.count[1]) << 16);
        break;
      default:
        unsigned int v204 = v264.count[0];
        goto LABEL_246;
    }
    unsigned int v204 = (461845907 * ((380141568 * v195) | ((-862048943 * v195) >> 17))) ^ LODWORD(v264.count[0]);
LABEL_246:
    unsigned int v205 = -2048144789 * (v204 ^ HIDWORD(v264.count[0]) ^ ((v204 ^ HIDWORD(v264.count[0])) >> 16));
    unsigned int v203 = (-1028477387 * (v205 ^ (v205 >> 13))) ^ ((-1028477387 * (v205 ^ (v205 >> 13))) >> 16);
    LODWORD(v264.count[0]) = v203;
LABEL_247:
    *(_DWORD *)&v265[8] = v203;
    goto LABEL_248;
  }
  if (v263)
  {
    if (v263 == 1000)
    {
      CC_LONG64 v161 = (v264.count[0] + v264.count[1]) ^ __ROR8__(v264.count[1], 51);
      CC_LONG64 v162 = v264.hash[0] + (v264.hash[1] ^ v264.hash[2]);
      uint64_t v163 = __ROR8__(v264.hash[1] ^ v264.hash[2], 48);
      CC_LONG64 v164 = (v162 ^ v163) + __ROR8__(v264.count[0] + v264.count[1], 32);
      CC_LONG64 v165 = v164 ^ __ROR8__(v162 ^ v163, 43);
      CC_LONG64 v166 = v162 + v161;
      CC_LONG64 v167 = v166 ^ __ROR8__(v161, 47);
      CC_LONG64 v168 = (v164 ^ v264.hash[2]) + v167;
      CC_LONG64 v169 = v168 ^ __ROR8__(v167, 51);
      CC_LONG64 v170 = (__ROR8__(v166, 32) ^ 0xFFLL) + v165;
      uint64_t v171 = __ROR8__(v165, 48);
      uint64_t v172 = __ROR8__(v168, 32) + (v170 ^ v171);
      uint64_t v173 = v172 ^ __ROR8__(v170 ^ v171, 43);
      CC_LONG64 v174 = v169 + v170;
      CC_LONG64 v175 = v174 ^ __ROR8__(v169, 47);
      CC_LONG64 v176 = v175 + v172;
      uint64_t v177 = v176 ^ __ROR8__(v175, 51);
      uint64_t v178 = __ROR8__(v174, 32) + v173;
      uint64_t v179 = __ROR8__(v173, 48);
      uint64_t v180 = __ROR8__(v176, 32) + (v178 ^ v179);
      uint64_t v181 = v180 ^ __ROR8__(v178 ^ v179, 43);
      uint64_t v182 = v177 + v178;
      uint64_t v183 = v182 ^ __ROR8__(v177, 47);
      uint64_t v184 = v183 + v180;
      uint64_t v185 = v184 ^ __ROR8__(v183, 51);
      uint64_t v186 = __ROR8__(v182, 32) + v181;
      uint64_t v187 = __ROR8__(v181, 48);
      CC_LONG64 v188 = __ROR8__(v184, 32) + (v186 ^ v187);
      CC_LONG64 v189 = v188 ^ __ROR8__(v186 ^ v187, 43);
      uint64_t v190 = v185 + v186;
      v264.count[0] = v188;
      v264.count[1] = v190 ^ __ROR8__(v185, 47);
      v264.hash[0] = __ROR8__(v190, 32);
      v264.hash[1] = v189;
      *(void *)&v265[8] = v264.count[1] ^ v188 ^ v264.hash[0] ^ v189;
    }
  }
  else
  {
    v193 = [MEMORY[0x1E4F28B00] currentHandler];
    v194 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v193 handleFailureInFunction:v194 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_248:
  data[0] = *(_OWORD *)v265;
  data[1] = *(_OWORD *)&v265[16];
  data[2] = *(_OWORD *)&v265[32];
  data[3] = *(_OWORD *)&v265[48];
  uint64_t v267 = *(void *)&v265[64];
  if (*(uint64_t *)v265 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(void *)&data[0] == 4256)
      {
        v228 = (unsigned __int8 *)data + 8;
        v229 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v230 = v229;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v232 = *v228++;
          v233 = &v229[i];
          char *v233 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v232 >> 4];
          v233[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v232 & 0xF];
        }
        id v212 = [NSString alloc];
        v213 = v230;
        uint64_t v214 = 64;
      }
      else
      {
        if (*(void *)&data[0] != 4512) {
          goto LABEL_276;
        }
        v216 = (unsigned __int8 *)data + 8;
        v217 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v218 = v217;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v220 = *v216++;
          v221 = &v217[j];
          char *v221 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v220 >> 4];
          v221[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v220 & 0xF];
        }
        id v212 = [NSString alloc];
        v213 = v218;
        uint64_t v214 = 128;
      }
    }
    else if (*(void *)&data[0] == 4000)
    {
      v222 = (unsigned __int8 *)data + 8;
      v223 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v224 = v223;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v226 = *v222++;
        v227 = &v223[k];
        char *v227 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v226 >> 4];
        v227[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v226 & 0xF];
      }
      id v212 = [NSString alloc];
      v213 = v224;
      uint64_t v214 = 32;
    }
    else
    {
      if (*(void *)&data[0] != 4001) {
        goto LABEL_276;
      }
      v206 = (unsigned __int8 *)data + 8;
      v207 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v208 = v207;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v210 = *v206++;
        v211 = &v207[m];
        char *v211 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v210 >> 4];
        v211[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v210 & 0xF];
      }
      id v212 = [NSString alloc];
      v213 = v208;
      uint64_t v214 = 40;
    }
    v234 = (void *)[v212 initWithBytesNoCopy:v213 length:v214 encoding:4 freeWhenDone:1];
    unint64_t v215 = [v234 hash];

    return v215;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(void *)&data[0] != 1000)
    {
      if (*(void *)&data[0] != 2000) {
        goto LABEL_276;
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
LABEL_276:
    v236 = [MEMORY[0x1E4F28B00] currentHandler];
    v237 = [NSString stringWithUTF8String:"NSUInteger _MSVHashGetHash(MSVHash)"];
    [v236 handleFailureInFunction:v237 file:@"MSVHasher+Algorithms.h" lineNumber:301 description:@"Cannot obtain hash from unknown hasher algorithm"];

    return 0;
  }
  return *((void *)&data[0] + 1);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if ([(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration;
    if ([(MPLibraryKeepLocalStatusObserverConfiguration *)&v8 isEqual:v5]
      && self->_downloadEnabledItemCount == v5->_downloadEnabledItemCount
      && self->_nonPurgeableItemCount == v5->_nonPurgeableItemCount
      && self->_redownloadableItemCount == v5->_redownloadableItemCount)
    {
      char v6 = [(NSArray *)self->_pendingItemIdentifiers isEqual:v5->_pendingItemIdentifiers];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end