@interface MPServerObjectDatabaseMediaKitImportRequest
+ (id)_childKeyForParentType:(id)a3 type:(id)a4;
+ (id)_entityTypeForObject:(id)a3;
+ (id)_unsupportedMediaKitTypes;
+ (id)_unsupportedParentChildRelationships;
- (MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3;
- (id)_sinfDataFromSinfType:(int64_t)a3 payload:(id)a4;
- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4;
- (int64_t)_sinfTypeFromPayload:(id)a3;
@end

@implementation MPServerObjectDatabaseMediaKitImportRequest

- (id)_sinfDataFromSinfType:(int64_t)a3 payload:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = a4;
  if (!a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabaseImportRequest.m" lineNumber:384 description:@"Cannot extract sinfData from invalid synfType"];
  }
  if (![v7 count])
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_FAULT, "No valid sinfs in payload", buf, 2u);
    }
    v8 = 0;
    goto LABEL_20;
  }
  if (a3 == 2)
  {
    v10 = [v7 firstObject];
    v11 = [v10 valueForKey:@"sinf2"];
    if (v11)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
    }
    else
    {
      v12 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects_Oversize");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "Missing miniSinf from sinfDictionary=%{public}@", buf, 0xCu);
      }

      v8 = 0;
    }
    goto LABEL_19;
  }
  if (a3 != 1)
  {
    v8 = 0;
    goto LABEL_21;
  }
  id v15 = 0;
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v15];
  v9 = v15;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects_Oversize");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "Could not serialize sinfs from payload=%{public}@, error=%{public}@", buf, 0x16u);
    }
LABEL_19:
  }
LABEL_20:

LABEL_21:

  return v8;
}

- (int64_t)_sinfTypeFromPayload:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if _NSIsNSString() && ([v3 isEqualToString:@"miniSinf"]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
  v8 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  v9 = [(MPServerObjectDatabaseImportRequest *)self userIdentity];
  v10 = [v8 DSIDForUserIdentity:v9 outError:0];
  v11 = [v10 stringValue];
  [(MPMediaKitEntityTranslatorContext *)v7 setPersonID:v11];

  v12 = [(MPMediaKitEntityTranslatorContext *)v7 personID];
  uint64_t v13 = [v12 length];

  if (!v13) {
    [(MPMediaKitEntityTranslatorContext *)v7 setPersonID:*MEMORY[0x1E4FB8580]];
  }
  v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__9658;
  v44 = __Block_byref_object_dispose__9659;
  id v45 = 0;
  v16 = [(MPServerObjectDatabaseImportRequest *)self payload];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke;
  v34[3] = &unk_1E57EF148;
  v34[4] = self;
  v17 = v7;
  v35 = v17;
  v39 = &v40;
  id v18 = v6;
  id v36 = v18;
  id v19 = v15;
  id v37 = v19;
  id v20 = v14;
  id v38 = v20;
  _MPServerObjectDatabaseMetadataImportEnumerateObjects(v16, a4, @"type", 0, 0, 0, 0, v34);

  v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = [v19 count];
    uint64_t v23 = v41[5];
    *(_DWORD *)buf = 67109378;
    int v47 = v22;
    __int16 v48 = 2114;
    uint64_t v49 = v23;
    _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: importing [Media API payload] childRelationsCount=%d collectionVersionHash=%{public}@", buf, 0x12u);
  }

  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_196;
  v31 = &unk_1E57EF170;
  id v24 = v18;
  id v32 = v24;
  v33 = &v40;
  [v19 enumerateObjectsUsingBlock:&v28];
  v25 = [MPServerObjectDatabaseImportResult alloc];
  v26 = -[MPServerObjectDatabaseImportResult initWithAnnotatedPayload:playableAssetIdentifiers:error:](v25, "initWithAnnotatedPayload:playableAssetIdentifiers:error:", a4, v20, 0, v28, v29, v30, v31);

  _Block_object_dispose(&v40, 8);

  return v26;
}

BOOL __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  v218[0] = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v185 = a4;
  id v186 = a5;
  id v17 = a6;
  id v18 = +[MPMediaKitEntityTranslator translatorForType:v15];
  id v19 = v18;
  if (v18)
  {
    id v20 = [v18 identifiersForPayload:v16 context:*(void *)(a1 + 40)];
    *a8 = v20;
    if (v20)
    {
      if (v17)
      {
        v21 = [(id)objc_opt_class() _childKeyForParentType:v186 type:v15];
        if (v21 && [v185 containsObject:@"relationships"])
        {
          uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          if (v22)
          {
            if (!a7)
            {
              [*(id *)(a1 + 48) removeRelationshipsForParentIdentifiers:v17 childKey:v21];
              uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            }
            [*(id *)(a1 + 48) relateIdentifiers:v20 toParentIdentifiers:v17 parentVersionHash:v22 childKey:v21 order:a7];
          }
          else
          {
            v25 = [[MPServerObjectDatabaseMediaAPIImportChildRelation alloc] initWithItemIdentifiers:v20 parentIdentifiers:v17 childKey:v21 relativeOrder:a7];
            [*(id *)(a1 + 56) addObject:v25];
          }
        }
      }
      uint64_t v198 = 0;
      v199 = &v198;
      uint64_t v200 = 0x2020000000;
      char v201 = 0;
      v26 = [v16 objectForKeyedSubscript:@"attributes"];
      BOOL v27 = v26 == 0;

      if (v27) {
        goto LABEL_178;
      }
      uint64_t v28 = *(void **)(a1 + 48);
      uint64_t v29 = [*(id *)(a1 + 32) expirationDate];
      char v30 = [v28 importObject:v16 type:v15 identifiers:v20 source:1 expiration:v29];
      *((unsigned char *)v199 + 24) = v30;

      v184 = [v16 valueForKeyPath:@"attributes.playParams"];

      if (([v15 isEqualToString:@"playlists"] & 1) != 0
        || [v15 isEqualToString:@"albums"])
      {
        uint64_t v31 = [v16 valueForKeyPath:@"attributes.versionHash"];
        uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
        v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v31;

        if (![*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) length])
        {
          uint64_t v34 = [v16 valueForKeyPath:@"attributes.playParams.versionHash"];
          uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
          id v36 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = v34;
        }
        if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) length])
        {
          id v37 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v38;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1952E8000, v37, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: Media API payload contains collectionPlaylistVersionHash=%{public}@ for type=%{public}@", buf, 0x16u);
          }
        }
      }
      v39 = [v16 valueForKeyPath:@"attributes.extendedAssetUrls"];
      uint64_t v40 = v39;
      if (v39)
      {
        id v182 = v39;
      }
      else
      {
        id v182 = [v16 valueForKeyPath:@"attributes.assetUrls"];
      }

      v193[0] = MEMORY[0x1E4F143A8];
      v193[1] = 3221225472;
      v193[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_167;
      v193[3] = &unk_1E57EF0F8;
      id v194 = *(id *)(a1 + 48);
      id v41 = v20;
      uint64_t v42 = *(void *)(a1 + 32);
      id v183 = v41;
      id v195 = v41;
      uint64_t v196 = v42;
      id v43 = v16;
      id v197 = v43;
      [v182 enumerateKeysAndObjectsUsingBlock:v193];
      v44 = [v43 valueForKeyPath:@"attributes.assets"];
      uint64_t v180 = [v44 count];
      v181 = v44;
      id v45 = [v183 personalizedStore];
      v46 = [v45 personID];

      id v47 = v46;
      long long v213 = 0u;
      long long v212 = 0u;
      long long v211 = 0u;
      long long v210 = 0u;
      long long v209 = 0u;
      long long v208 = 0u;
      long long v207 = 0u;
      long long v206 = 0u;
      long long v205 = 0u;
      long long v204 = 0u;
      long long v203 = 0u;
      memset(&buf[8], 0, 32);
      *(void *)buf = 4001;
      CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
      id v48 = v47;
      uint64_t v49 = (unsigned char *)[v48 UTF8String];
      unint64_t v50 = [v48 length];
      int v51 = v50;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(void *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v49, v50);
          }
          else if (*(void *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v49, v50);
          }
        }
        else if (*(void *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v49, v50);
        }
        else if (*(void *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v49, v50);
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
              int v52 = (((v50 + buf[19]) & 3) - buf[19]);
              v53 = &buf[buf[19] + 16];
              switch(v52)
              {
                case 0:
                  break;
                case 1:
                  unsigned char *v53 = *v49;
                  break;
                case 2:
                  __int16 v73 = *(_WORD *)v49;
                  goto LABEL_80;
                case 3:
                  __int16 v73 = *(_WORD *)v49;
                  buf[buf[19] + 18] = v49[2];
LABEL_80:
                  *(_WORD *)v53 = v73;
                  break;
                default:
                  memcpy(v53, v49, (((v51 + buf[19]) & 3) - buf[19]));
                  break;
              }
              *(_DWORD *)&buf[12] += v51;
            }
          }
          else
          {
            v55 = [MEMORY[0x1E4F28B00] currentHandler];
            v56 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
            [v55 handleFailureInFunction:v56 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
          }
          goto LABEL_82;
        }
        if (*(void *)buf == 3000)
        {
          if (!v49) {
            goto LABEL_82;
          }
          BOOL v58 = v50 > 0xF || (*(_DWORD *)&buf[8] + v50) > 0xF;
          *(_DWORD *)&buf[8] += v50;
          *(_DWORD *)&buf[12] |= v58;
          if (v50 + DWORD2(v203) > 0xF)
          {
            v65 = &v49[v50];
            if (DWORD2(v203))
            {
              v179 = &v49[v50];
              memcpy(&buf[DWORD2(v203) + 32], v49, (16 - DWORD2(v203)));
              v65 = v179;
              HIDWORD(v66) = *(_DWORD *)&buf[16] - 2048144777 * *(_DWORD *)&buf[32];
              LODWORD(v66) = HIDWORD(v66);
              int v67 = -1640531535 * (v66 >> 19);
              HIDWORD(v66) = *(_DWORD *)&buf[20] - 2048144777 * *(_DWORD *)&buf[36];
              LODWORD(v66) = HIDWORD(v66);
              *(_DWORD *)&buf[16] = v67;
              *(_DWORD *)&buf[20] = -1640531535 * (v66 >> 19);
              HIDWORD(v66) = *(_DWORD *)&buf[24] - 2048144777 * v203;
              LODWORD(v66) = HIDWORD(v66);
              *(_DWORD *)&buf[24] = -1640531535 * (v66 >> 19);
              HIDWORD(v66) = *(_DWORD *)&buf[28] - 2048144777 * DWORD1(v203);
              LODWORD(v66) = HIDWORD(v66);
              v49 += (16 - DWORD2(v203));
              *(_DWORD *)&buf[28] = -1640531535 * (v66 >> 19);
              DWORD2(v203) = 0;
            }
            if (v49 <= v65 - 16)
            {
              int v68 = *(_DWORD *)&buf[16];
              int v69 = *(_DWORD *)&buf[20];
              int v70 = *(_DWORD *)&buf[24];
              int v71 = *(_DWORD *)&buf[28];
              do
              {
                HIDWORD(v72) = v68 - 2048144777 * *(_DWORD *)v49;
                LODWORD(v72) = HIDWORD(v72);
                int v68 = -1640531535 * (v72 >> 19);
                HIDWORD(v72) = v69 - 2048144777 * *((_DWORD *)v49 + 1);
                LODWORD(v72) = HIDWORD(v72);
                int v69 = -1640531535 * (v72 >> 19);
                HIDWORD(v72) = v70 - 2048144777 * *((_DWORD *)v49 + 2);
                LODWORD(v72) = HIDWORD(v72);
                int v70 = -1640531535 * (v72 >> 19);
                HIDWORD(v72) = v71 - 2048144777 * *((_DWORD *)v49 + 3);
                LODWORD(v72) = HIDWORD(v72);
                int v71 = -1640531535 * (v72 >> 19);
                v49 += 16;
              }
              while (v49 <= v65 - 16);
              *(_DWORD *)&buf[16] = v68;
              *(_DWORD *)&buf[20] = v69;
              *(_DWORD *)&buf[24] = v70;
              *(_DWORD *)&buf[28] = v71;
            }
            if (v49 >= v65) {
              goto LABEL_82;
            }
            int v59 = v65 - v49;
            __memcpy_chk();
          }
          else
          {
            memcpy(&buf[DWORD2(v203) + 32], v49, v50);
            int v59 = DWORD2(v203) + v51;
          }
          DWORD2(v203) = v59;
          goto LABEL_82;
        }
        if (*(void *)buf != 3001 || !v49) {
          goto LABEL_82;
        }
        *(void *)&buf[8] += v50;
        if (v50 + DWORD2(v205) <= 0x1F)
        {
          memcpy((char *)&v203 + DWORD2(v205) + 8, v49, v50);
          int v54 = DWORD2(v205) + v51;
LABEL_67:
          DWORD2(v205) = v54;
          goto LABEL_82;
        }
        unint64_t v60 = (unint64_t)&v49[v50];
        if (DWORD2(v205))
        {
          v178 = &v49[v50];
          memcpy((char *)&v203 + DWORD2(v205) + 8, v49, (32 - DWORD2(v205)));
          unint64_t v60 = (unint64_t)v178;
          *(void *)&buf[16] = 0x9E3779B185EBCA87
                              * __ROR8__(*(void *)&buf[16] - 0x3D4D51C2D82B14B1 * *((void *)&v203 + 1), 33);
          *(void *)&buf[24] = 0x9E3779B185EBCA87 * __ROR8__(*(void *)&buf[24] - 0x3D4D51C2D82B14B1 * v204, 33);
          *(void *)&buf[32] = 0x9E3779B185EBCA87
                              * __ROR8__(*(void *)&buf[32] - 0x3D4D51C2D82B14B1 * *((void *)&v204 + 1), 33);
          *(void *)&long long v203 = 0x9E3779B185EBCA87 * __ROR8__(v203 - 0x3D4D51C2D82B14B1 * v205, 33);
          v49 += (32 - DWORD2(v205));
          DWORD2(v205) = 0;
        }
        if ((unint64_t)(v49 + 32) <= v60)
        {
          unint64_t v62 = *(void *)&buf[24];
          unint64_t v61 = *(void *)&buf[16];
          unint64_t v64 = *(void *)&buf[32];
          unint64_t v63 = v203;
          do
          {
            unint64_t v61 = 0x9E3779B185EBCA87 * __ROR8__(v61 - 0x3D4D51C2D82B14B1 * *(void *)v49, 33);
            unint64_t v62 = 0x9E3779B185EBCA87 * __ROR8__(v62 - 0x3D4D51C2D82B14B1 * *((void *)v49 + 1), 33);
            unint64_t v64 = 0x9E3779B185EBCA87 * __ROR8__(v64 - 0x3D4D51C2D82B14B1 * *((void *)v49 + 2), 33);
            unint64_t v63 = 0x9E3779B185EBCA87 * __ROR8__(v63 - 0x3D4D51C2D82B14B1 * *((void *)v49 + 3), 33);
            v49 += 32;
          }
          while ((unint64_t)v49 <= v60 - 32);
          *(void *)&buf[16] = v61;
          *(void *)&buf[24] = v62;
          *(void *)&buf[32] = v64;
          *(void *)&long long v203 = v63;
        }
        if ((unint64_t)v49 < v60)
        {
          int v54 = v60 - v49;
          __memcpy_chk();
          goto LABEL_67;
        }
      }
LABEL_82:

      memset(&v214[8], 0, 64);
      *(void *)v214 = *(void *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf > 4000)
        {
          switch(*(void *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v214[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v214[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v214[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
          goto LABEL_129;
        }
        if (*(void *)buf != 3001)
        {
          if (*(void *)buf == 4000) {
            CC_MD5_Final(&v214[8], (CC_MD5_CTX *)&buf[8]);
          }
LABEL_129:
          v215[0] = *(_OWORD *)v214;
          v215[1] = *(_OWORD *)&v214[16];
          v215[2] = *(_OWORD *)&v214[32];
          v215[3] = *(_OWORD *)&v214[48];
          uint64_t v216 = *(void *)&v214[64];
          if (*(uint64_t *)v214 > 3999)
          {
            if (*(uint64_t *)v214 > 4255)
            {
              if (*(void *)v214 == 4256)
              {
                v165 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
                v134 = v165;
                uint64_t v166 = 0;
                v167 = (unsigned __int8 *)v215 + 8;
                do
                {
                  unsigned int v168 = *v167++;
                  v169 = &v165[v166];
                  char *v169 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v168 >> 4];
                  v169[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v168 & 0xF];
                  v166 += 2;
                }
                while (v166 != 64);
                id v139 = [NSString alloc];
                uint64_t v140 = 64;
              }
              else
              {
                if (*(void *)v214 != 4512) {
                  goto LABEL_180;
                }
                v145 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
                v134 = v145;
                uint64_t v146 = 0;
                v147 = (unsigned __int8 *)v215 + 8;
                do
                {
                  unsigned int v148 = *v147++;
                  v149 = &v145[v146];
                  char *v149 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v148 >> 4];
                  v149[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v148 & 0xF];
                  v146 += 2;
                }
                while (v146 != 128);
                id v139 = [NSString alloc];
                uint64_t v140 = 128;
              }
            }
            else if (*(void *)v214 == 4000)
            {
              v156 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
              v134 = v156;
              uint64_t v157 = 0;
              v158 = (unsigned __int8 *)v215 + 8;
              do
              {
                unsigned int v159 = *v158++;
                v160 = &v156[v157];
                char *v160 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v159 >> 4];
                v160[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v159 & 0xF];
                v157 += 2;
              }
              while (v157 != 32);
              id v139 = [NSString alloc];
              uint64_t v140 = 32;
            }
            else
            {
              if (*(void *)v214 != 4001) {
                goto LABEL_180;
              }
              v133 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
              v134 = v133;
              uint64_t v135 = 0;
              v136 = (unsigned __int8 *)v215 + 8;
              do
              {
                unsigned int v137 = *v136++;
                v138 = &v133[v135];
                char *v138 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v137 >> 4];
                v138[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v137 & 0xF];
                v135 += 2;
              }
              while (v135 != 40);
              id v139 = [NSString alloc];
              uint64_t v140 = 40;
            }
            CFStringRef v132 = (CFStringRef)[v139 initWithBytesNoCopy:v134 length:v140 encoding:4 freeWhenDone:1];
          }
          else
          {
            if (*(uint64_t *)v214 <= 2999)
            {
              if (*(void *)v214 == 1000)
              {
                uint64_t v150 = *((void *)&v215[0] + 1);
                v151 = (char *)v218 + 1;
                uint64_t quot = *((void *)&v215[0] + 1);
                do
                {
                  lldiv_t v153 = lldiv(quot, 10);
                  uint64_t quot = v153.quot;
                  if (v153.rem >= 0) {
                    LOBYTE(v154) = v153.rem;
                  }
                  else {
                    uint64_t v154 = -v153.rem;
                  }
                  *(v151 - 2) = v154 + 48;
                  v155 = (const UInt8 *)(v151 - 2);
                  --v151;
                }
                while (v153.quot);
                if (v150 < 0)
                {
                  *(v151 - 2) = 45;
                  v155 = (const UInt8 *)(v151 - 2);
                }
                CFStringRef v132 = CFStringCreateWithBytes(0, v155, (char *)v218 - (char *)v155, 0x8000100u, 0);
                goto LABEL_173;
              }
              if (*(void *)v214 == 2000)
              {
                uint64_t v128 = DWORD2(v215[0]);
                v129 = (const UInt8 *)v218;
                do
                {
                  ldiv_t v130 = ldiv(v128, 10);
                  uint64_t v128 = v130.quot;
                  if (v130.rem >= 0) {
                    LOBYTE(v131) = v130.rem;
                  }
                  else {
                    uint64_t v131 = -v130.rem;
                  }
                  *--v129 = v131 + 48;
                }
                while (v130.quot);
                CFStringRef v132 = CFStringCreateWithBytes(0, v129, (char *)v218 - (char *)v129, 0x8000100u, 0);
                goto LABEL_173;
              }
LABEL_180:
              v176 = [MEMORY[0x1E4F28B00] currentHandler];
              v177 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
              [v176 handleFailureInFunction:v177 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

              v170 = &stru_1EE680640;
LABEL_174:

              v171 = [(__CFString *)v170 substringToIndex:7];

              v187[0] = MEMORY[0x1E4F143A8];
              v187[1] = 3221225472;
              v187[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_181;
              v187[3] = &unk_1E57EF120;
              v187[4] = *(void *)(a1 + 32);
              v192 = &v198;
              id v188 = *(id *)(a1 + 48);
              id v172 = v183;
              id v189 = v172;
              id v173 = v48;
              id v190 = v173;
              id v174 = v171;
              id v191 = v174;
              [v181 enumerateObjectsUsingBlock:v187];
              if (v184 && v180) {
                [*(id *)(a1 + 64) addObject:v172];
              }

LABEL_178:
              BOOL v24 = *((unsigned char *)v199 + 24) != 0;
              _Block_object_dispose(&v198, 8);
              goto LABEL_179;
            }
            if (*(void *)v214 == 3000)
            {
              LODWORD(v217[0]) = bswap32(DWORD2(v215[0]));
              v161 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v162 = 0;
              v163 = v161 + 1;
              do
              {
                unint64_t v164 = *((unsigned __int8 *)v217 + v162);
                *(v163 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v164 >> 4];
                unsigned char *v163 = MSVFastHexStringFromBytes_hexCharacters_53728[v164 & 0xF];
                v163 += 2;
                ++v162;
              }
              while (v162 != 4);
              CFStringRef v132 = (CFStringRef)[[NSString alloc] initWithBytesNoCopy:v161 length:8 encoding:4 freeWhenDone:1];
            }
            else
            {
              if (*(void *)v214 != 3001) {
                goto LABEL_180;
              }
              v217[0] = bswap64(*((unint64_t *)&v215[0] + 1));
              v141 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v142 = 0;
              v143 = v141 + 1;
              do
              {
                unint64_t v144 = *((unsigned __int8 *)v217 + v142);
                *(v143 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v144 >> 4];
                unsigned char *v143 = MSVFastHexStringFromBytes_hexCharacters_53728[v144 & 0xF];
                v143 += 2;
                ++v142;
              }
              while (v142 != 8);
              CFStringRef v132 = (CFStringRef)[[NSString alloc] initWithBytesNoCopy:v141 length:16 encoding:4 freeWhenDone:1];
            }
          }
LABEL_173:
          v170 = (__CFString *)v132;
          goto LABEL_174;
        }
        if (*(void *)&buf[8] < 0x20uLL) {
          uint64_t v108 = *(void *)&buf[32] + 0x27D4EB2F165667C5;
        }
        else {
          uint64_t v108 = 0x85EBCA77C2B2AE63
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
                       + __ROR8__(v203, 46)) ^ (0x9E3779B185EBCA87
                                              * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[16], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[24], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(void *)&buf[32], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v203, 33)));
        unint64_t v110 = v108 + *(void *)&buf[8];
        v111 = (uint64_t *)&v203 + 1;
        unint64_t v112 = buf[8] & 0x1F;
        if (v112 >= 8)
        {
          do
          {
            uint64_t v113 = *v111++;
            unint64_t v110 = 0x85EBCA77C2B2AE63
                 - 0x61C8864E7A143579
                 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v113, 33)) ^ v110, 37);
            v112 -= 8;
          }
          while (v112 > 7);
        }
        if (v112 >= 4)
        {
          unsigned int v114 = *(_DWORD *)v111;
          v111 = (uint64_t *)((char *)v111 + 4);
          unint64_t v110 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v114) ^ v110, 41);
          v112 -= 4;
        }
        for (; v112; --v112)
        {
          unsigned int v115 = *(unsigned __int8 *)v111;
          v111 = (uint64_t *)((char *)v111 + 1);
          unint64_t v110 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v115) ^ v110, 53);
        }
        unint64_t v116 = 0x165667B19E3779F9
             * ((0xC2B2AE3D27D4EB4FLL * (v110 ^ (v110 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v110 ^ (v110 >> 33))) >> 29));
        unint64_t v104 = v116 ^ HIDWORD(v116);
LABEL_116:
        *(void *)&v214[8] = v104;
        goto LABEL_129;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (!*(void *)buf)
        {
          v106 = [MEMORY[0x1E4F28B00] currentHandler];
          v107 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
          [v106 handleFailureInFunction:v107 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

          goto LABEL_129;
        }
        if (*(void *)buf != 1000) {
          goto LABEL_129;
        }
        uint64_t v74 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
        uint64_t v75 = *(void *)&buf[24] + (*(void *)&buf[32] ^ v203);
        uint64_t v76 = __ROR8__(*(void *)&buf[32] ^ v203, 48);
        uint64_t v77 = (v75 ^ v76) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
        uint64_t v78 = v77 ^ __ROR8__(v75 ^ v76, 43);
        uint64_t v79 = v75 + v74;
        uint64_t v80 = v79 ^ __ROR8__(v74, 47);
        uint64_t v81 = (v77 ^ v203) + v80;
        uint64_t v82 = v81 ^ __ROR8__(v80, 51);
        uint64_t v83 = (__ROR8__(v79, 32) ^ 0xFFLL) + v78;
        uint64_t v84 = __ROR8__(v78, 48);
        uint64_t v85 = __ROR8__(v81, 32) + (v83 ^ v84);
        uint64_t v86 = v85 ^ __ROR8__(v83 ^ v84, 43);
        uint64_t v87 = v82 + v83;
        uint64_t v88 = v87 ^ __ROR8__(v82, 47);
        uint64_t v89 = v88 + v85;
        uint64_t v90 = v89 ^ __ROR8__(v88, 51);
        uint64_t v91 = __ROR8__(v87, 32) + v86;
        uint64_t v92 = __ROR8__(v86, 48);
        uint64_t v93 = __ROR8__(v89, 32) + (v91 ^ v92);
        uint64_t v94 = v93 ^ __ROR8__(v91 ^ v92, 43);
        uint64_t v95 = v90 + v91;
        uint64_t v96 = v95 ^ __ROR8__(v90, 47);
        uint64_t v97 = v96 + v93;
        uint64_t v98 = v97 ^ __ROR8__(v96, 51);
        uint64_t v99 = __ROR8__(v95, 32) + v94;
        uint64_t v100 = __ROR8__(v94, 48);
        uint64_t v101 = __ROR8__(v97, 32) + (v99 ^ v100);
        uint64_t v102 = v101 ^ __ROR8__(v99 ^ v100, 43);
        uint64_t v103 = v98 + v99;
        *(void *)&buf[8] = v101;
        *(void *)&buf[16] = v103 ^ __ROR8__(v98, 47);
        *(void *)&buf[24] = __ROR8__(v103, 32);
        *(void *)&buf[32] = v102;
        unint64_t v104 = *(void *)&buf[16] ^ v101 ^ *(void *)&buf[24] ^ v102;
        goto LABEL_116;
      }
      if (*(void *)buf != 2000)
      {
        if (*(void *)buf != 3000) {
          goto LABEL_129;
        }
        if (*(_DWORD *)&buf[12]) {
          int v105 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1956897D0)));
        }
        else {
          int v105 = *(_DWORD *)&buf[24] + 374761393;
        }
        unsigned int v117 = *(_DWORD *)&buf[8] + v105;
        v118 = &buf[32];
        unint64_t v119 = BYTE8(v203) & 0xF;
        if (v119 >= 4)
        {
          do
          {
            int v120 = *(_DWORD *)v118;
            v118 += 4;
            HIDWORD(v121) = v117 - 1028477379 * v120;
            LODWORD(v121) = HIDWORD(v121);
            unsigned int v117 = 668265263 * (v121 >> 15);
            v119 -= 4;
          }
          while (v119 > 3);
        }
        for (; v119; --v119)
        {
          int v122 = *v118++;
          HIDWORD(v123) = v117 + 374761393 * v122;
          LODWORD(v123) = HIDWORD(v123);
          unsigned int v117 = -1640531535 * (v123 >> 21);
        }
        unsigned int v124 = (-2048144777 * (v117 ^ (v117 >> 15))) ^ ((-2048144777 * (v117 ^ (v117 >> 15))) >> 13);
        unsigned int v125 = (-1028477379 * v124) ^ ((-1028477379 * v124) >> 16);
        goto LABEL_128;
      }
      switch(buf[19])
      {
        case 1:
          int v109 = buf[16];
          break;
        case 2:
          int v109 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          int v109 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          unsigned int v126 = *(_DWORD *)&buf[8];
          goto LABEL_127;
      }
      unsigned int v126 = (461845907 * ((380141568 * v109) | ((-862048943 * v109) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_127:
      unsigned int v127 = -2048144789 * (v126 ^ *(_DWORD *)&buf[12] ^ ((v126 ^ *(_DWORD *)&buf[12]) >> 16));
      unsigned int v125 = (-1028477387 * (v127 ^ (v127 >> 13))) ^ ((-1028477387 * (v127 ^ (v127 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v125;
LABEL_128:
      *(_DWORD *)&v214[8] = v125;
      goto LABEL_129;
    }
  }
  else
  {
    id v20 = [(id)objc_opt_class() _unsupportedMediaKitTypes];
    if (([v20 containsObject:v15] & 1) == 0)
    {
      [v20 addObject:v15];
      uint64_t v23 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_FAULT, "Encountered unsupported MediaKit type: %@", buf, 0xCu);
      }
    }
  }
  BOOL v24 = 0;
LABEL_179:

  return v24;
}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_196(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (![v11 relativeOrder])
  {
    id v3 = *(void **)(a1 + 32);
    int64_t v4 = [v11 parentIdentifiers];
    v5 = [v11 childKey];
    [v3 removeRelationshipsForParentIdentifiers:v4 childKey:v5];
  }
  id v6 = *(void **)(a1 + 32);
  v7 = [v11 identifiers];
  v8 = [v11 parentIdentifiers];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    v9 = &stru_1EE680640;
  }
  v10 = [v11 childKey];
  objc_msgSend(v6, "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v7, v8, v9, v10, objc_msgSend(v11, "relativeOrder"));
}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    id v7 = v5;
    if ([&unk_1EE6ED6B8 containsObject:v7])
    {
      uint64_t v8 = 1;
    }
    else if ([&unk_1EE6ED6D0 containsObject:v7])
    {
      uint64_t v8 = 2;
    }
    else if ([&unk_1EE6ED6E8 containsObject:v7])
    {
      uint64_t v8 = 3;
    }
    else if ([&unk_1EE6ED700 containsObject:v7])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    v14 = (void *)v13;
    if (v8 && v13)
    {
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = [*(id *)(a1 + 48) assetURLExpirationDate];
      [v15 importAssetURL:v14 forIdentifiers:v16 flavor:v8 expirationDate:v17];
    }
    else
    {
      if (![v7 isEqualToString:@"enhancedHls"] || !v14) {
        goto LABEL_29;
      }
      id v17 = [*(id *)(a1 + 56) valueForKeyPath:@"meta.redeliveryId"];
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = [v17 longLongValue];
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = *MEMORY[0x1E4FB84A0];
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = [*(id *)(a1 + 48) assetURLExpirationDate];
      [v20 importHLSAssetURL:v14 keyCertificateURL:0 keyServerURL:0 redeliveryId:v18 protocolType:v19 isiTunesStoreStream:1 forIdentifiers:v21 expirationDate:v22];
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5 || !_NSIsNSString())
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      *(_DWORD *)buf = 138544130;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      id v28 = v5;
      __int16 v29 = 2114;
      id v30 = v6;
      id v12 = v26;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assetURLs [MediaKit]: flavorStringType=%{public}@ urlStringType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x2Au);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v6;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "May have found Stereo HLS in assets but ignored [MediaKit]: urlString=%{public}@", buf, 0xCu);
    }
  }

LABEL_30:
}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = [v3 valueForKey:@"flavor"];
  id v5 = [v3 valueForKey:@"sinfs"];
  id v6 = [v3 valueForKey:@"url"];
  if (_NSIsNSString() && _NSIsNSString() && _NSIsNSArray())
  {
    id v7 = [v3 valueForKey:@"kind"];
    id v8 = v4;
    if ([&unk_1EE6ED6B8 containsObject:v8])
    {
      uint64_t v9 = 1;
    }
    else if ([&unk_1EE6ED6D0 containsObject:v8])
    {
      uint64_t v9 = 2;
    }
    else if ([&unk_1EE6ED6E8 containsObject:v8])
    {
      uint64_t v9 = 3;
    }
    else
    {
      int v15 = [&unk_1EE6ED700 containsObject:v8];
      uint64_t v9 = 4;
      if (!v15) {
        uint64_t v9 = 0;
      }
    }
    uint64_t v24 = v9;

    uint64_t v16 = [*(id *)(a1 + 32) _sinfTypeFromPayload:v7];
    if (v16)
    {
      uint64_t v23 = v16;
      id v17 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      uint64_t v19 = *(void **)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      id v20 = [*(id *)(a1 + 32) assetURLExpirationDate];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v19 importAssetURL:v17 forIdentifiers:v18 flavor:v24 expirationDate:v20];

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v21 = [*(id *)(a1 + 32) _sinfDataFromSinfType:v23 payload:v5];
        uint64_t v22 = [*(id *)(a1 + 48) preferredStoreStringIdentifierForPersonID:*(void *)(a1 + 56)];
        if (v21) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) importAssetSinf:v21 type:v23 forIdentifier:v22 hashedPersonID:*(void *)(a1 + 64) flavor:v24 sinfPayload:v5];
        }
      }
      goto LABEL_13;
    }
    id v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v7;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_FAULT, "Encountered unsupported sinfKind in assets [MediaKit]: sinfKind=%{public}@", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4 || !_NSIsNSString())
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    v10 = objc_opt_class();
    id v11 = v10;
    id v12 = objc_opt_class();
    id v13 = v12;
    *(_DWORD *)buf = 138544386;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = (id)objc_opt_class();
    __int16 v31 = 2114;
    uint64_t v32 = v4;
    __int16 v33 = 2114;
    uint64_t v34 = v6;
    id v14 = v30;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assets [MediaKit]: flavorStringType=%{public}@ urlStringType=%{public}@ sinfsType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x34u);

    goto LABEL_12;
  }
  id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "May have found Stereo HLS in assets but ignored [MediaKit]: urlString=%{public}@", buf, 0xCu);
  }
LABEL_13:
}

- (MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPServerObjectDatabaseMediaKitImportRequest;
  return (MPServerObjectDatabaseMediaKitImportRequest *)[(MPServerObjectDatabaseImportRequest *)&v4 _initWithPayload:a3];
}

+ (id)_entityTypeForObject:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"type"];
  objc_super v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"songs"] & 1) != 0
      || ([v4 isEqualToString:@"music-videos"] & 1) != 0
      || ([v4 isEqualToString:@"uploaded-audios"] & 1) != 0
      || ([v4 isEqualToString:@"uploaded-videos"] & 1) != 0)
    {
      id v5 = MPModelRelationshipGenericSong;
    }
    else if ([&unk_1EE6ED640 containsObject:v4])
    {
      id v5 = MPModelRelationshipGenericPlaylist;
    }
    else if ([v4 isEqualToString:@"artists"])
    {
      id v5 = MPModelRelationshipGenericArtist;
    }
    else if ([&unk_1EE6ED658 containsObject:v4])
    {
      id v5 = MPModelRelationshipGenericAlbum;
    }
    else if ([v4 isEqualToString:@"stations"])
    {
      id v5 = MPModelRelationshipGenericRadioStation;
    }
    else if ([v4 isEqualToString:@"station-events"])
    {
      id v5 = MPModelRelationshipGenericRadioStationEvent;
    }
    else if ([&unk_1EE6ED670 containsObject:v4])
    {
      id v5 = MPModelRelationshipGenericCurator;
    }
    else if ([v4 isEqualToString:@"tv-episodes"])
    {
      id v5 = MPModelRelationshipGenericTVEpisode;
    }
    else if ([v4 isEqualToString:@"tv-shows"])
    {
      id v5 = MPModelRelationshipGenericTVShow;
    }
    else if ([v4 isEqualToString:@"music-movies"])
    {
      id v5 = MPModelRelationshipGenericMovie;
    }
    else if ([&unk_1EE6ED688 containsObject:v4])
    {
      id v5 = MPModelRelationshipGenericSocialPerson;
    }
    else if ([v4 isEqualToString:@"record-labels"])
    {
      id v5 = MPModelRelationshipGenericRecordLabel;
    }
    else
    {
      if (![v4 isEqualToString:@"credit-artists"])
      {
        id v6 = 0;
        goto LABEL_8;
      }
      id v5 = MPModelRelationshipGenericCreditsArtist;
    }
    id v6 = *v5;
LABEL_8:
    id v7 = +[MPServerObjectDatabaseEntityType entityTypeWithServerEntityType:v4 genericObjectRelationshipKey:v6];

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

+ (id)_childKeyForParentType:(id)a3 type:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"songs"] & 1) != 0
    || [v6 isEqualToString:@"music-videos"])
  {
    if ([&unk_1EE6ED5E0 containsObject:v7])
    {
      id v8 = @"MPModelChildSongAlbum";
LABEL_28:
      uint64_t v9 = v8;
      goto LABEL_29;
    }
    if ([v7 isEqualToString:@"artists"])
    {
      id v8 = @"MPModelChildSongArtists";
      goto LABEL_28;
    }
  }
  if ([&unk_1EE6ED5F8 containsObject:v6])
  {
    if (([v7 isEqualToString:@"songs"] & 1) != 0
      || [v7 isEqualToString:@"music-videos"])
    {
      id v8 = @"MPModelChildAlbumSongs";
      goto LABEL_28;
    }
    if ([v7 isEqualToString:@"artists"])
    {
      id v8 = @"MPModelChildAlbumArtists";
      goto LABEL_28;
    }
    if ([v7 isEqualToString:@"record-labels"])
    {
      id v8 = @"MPModelChildAlbumRecordLabels";
      goto LABEL_28;
    }
  }
  if ([v6 isEqualToString:@"credit-artists"]
    && [v7 isEqualToString:@"artists"])
  {
    id v8 = @"MPModelChildCreditsArtistRelatedArtist";
    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"artists"]
    && [&unk_1EE6ED610 containsObject:v7])
  {
    id v8 = @"MPModelChildArtistAlbums";
    goto LABEL_28;
  }
  if ([&unk_1EE6ED628 containsObject:v6]
    && (([v7 isEqualToString:@"songs"] & 1) != 0
     || [v7 isEqualToString:@"music-videos"]))
  {
    id v8 = @"MPModelChildPlaylistEntries";
    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"stations"]
    && [v7 isEqualToString:@"station-events"])
  {
    id v8 = @"MPModelChildRadioStationEvents";
    goto LABEL_28;
  }
  id v11 = [a1 _unsupportedParentChildRelationships];
  v19[0] = v6;
  v19[1] = v7;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v13 = [v12 componentsJoinedByString:@"|"];

  if (([v11 containsObject:v13] & 1) == 0)
  {
    [v11 addObject:v13];
    id v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "Encountered unexpected media kit relationship parent=%@ type=%@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v8 = 0;
LABEL_29:

  return v8;
}

+ (id)_unsupportedParentChildRelationships
{
  if (_unsupportedParentChildRelationships_onceToken != -1) {
    dispatch_once(&_unsupportedParentChildRelationships_onceToken, &__block_literal_global_252);
  }
  v2 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships;

  return v2;
}

uint64_t __83__MPServerObjectDatabaseMediaKitImportRequest__unsupportedParentChildRelationships__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships;
  _unsupportedParentChildRelationships_unsupportedParentChildRelationships = (uint64_t)v0;

  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"playlists|apple-curators"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"apple-curators|playlists"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"artists|stations"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"artists|songs"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"artists|playlists"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"station-events|apple-curators"];
  [(id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships addObject:@"albums|albums"];
  v2 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships;

  return [v2 addObject:@"albums|playlists"];
}

+ (id)_unsupportedMediaKitTypes
{
  if (_unsupportedMediaKitTypes_onceToken != -1) {
    dispatch_once(&_unsupportedMediaKitTypes_onceToken, &__block_literal_global_9810);
  }
  v2 = (void *)_unsupportedMediaKitTypes_unsupportedKinds;

  return v2;
}

uint64_t __72__MPServerObjectDatabaseMediaKitImportRequest__unsupportedMediaKitTypes__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_unsupportedMediaKitTypes_unsupportedKinds;
  _unsupportedMediaKitTypes_unsupportedKinds = (uint64_t)v0;

  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"personal-recommendation"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"marketing-items"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"buy"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"subscription"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"preorder"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"groupings"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"editorial-elements"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"rooms"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"targetedRadio"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"multirooms"];
  [(id)_unsupportedMediaKitTypes_unsupportedKinds addObject:@"normal"];
  v2 = (void *)_unsupportedMediaKitTypes_unsupportedKinds;

  return [v2 addObject:@"social-upsells"];
}

@end