@interface MPCModelGenericAVItemTimedMetadataRequest
+ (BOOL)supportsSecureCoding;
+ (NSArray)metadataIdentifiers;
- (ICStoreRequestContext)storeRequestContext;
- (MPCModelGenericAVItemTimedMetadataRequest)initWithGenericObject:(id)a3 timedMetadataGroups:(id)a4 storeRequestContext:(id)a5;
- (MPCModelGenericAVItemTimedMetadataResponse)previousResponse;
- (MPModelGenericObject)genericObject;
- (NSArray)timedMetadataGroups;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setPreviousResponse:(id)a3;
@end

@implementation MPCModelGenericAVItemTimedMetadataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataGroups, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);

  objc_storeStrong((id *)&self->_previousResponse, 0);
}

- (NSArray)timedMetadataGroups
{
  return self->_timedMetadataGroups;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (void)setPreviousResponse:(id)a3
{
}

- (MPCModelGenericAVItemTimedMetadataResponse)previousResponse
{
  return self->_previousResponse;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v5 = a3;
  v6 = (void *)[(MPCModelGenericAVItemTimedMetadataRequest *)self copy];
  id v7 = objc_alloc(MEMORY[0x263F11D48]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke;
  v12[3] = &unk_2643C6908;
  id v13 = v6;
  v14 = self;
  id v15 = v5;
  SEL v16 = a2;
  id v8 = v5;
  id v9 = v6;
  v10 = (void *)[v7 initWithStartHandler:v12];

  return v10;
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v62 = a2;
  v63 = [*(id *)(a1 + 32) previousResponse];
  uint64_t v64 = a1;
  [*(id *)(a1 + 32) timedMetadataGroups];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v70 = [obj countByEnumeratingWithState:&v117 objects:v124 count:16];
  if (v70)
  {
    v67 = 0;
    v76 = 0;
    v77 = 0;
    v87 = 0;
    v89 = 0;
    v3 = 0;
    uint64_t v69 = *(void *)v118;
    uint64_t v4 = *MEMORY[0x263EF9E80];
    uint64_t v5 = *MEMORY[0x263EF9E00];
    uint64_t v88 = *MEMORY[0x263EF9DF0];
    uint64_t v86 = *MEMORY[0x263EF9DE8];
    uint64_t v82 = *MEMORY[0x263EF9DF8];
    uint64_t v78 = *MEMORY[0x263EF9E00];
    uint64_t v79 = *MEMORY[0x263EF9E08];
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v118 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v6;
        id v7 = *(void **)(*((void *)&v117 + 1) + 8 * v6);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v8 = [v7 items];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v113 objects:v123 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v114 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              v14 = [v13 keySpace];
              int v15 = [v14 isEqualToString:v4];

              if (v15)
              {
                SEL v16 = [v13 key];
                if ([v16 isEqual:v5])
                {
                  [v13 stringValue];
                  v3 = v17 = v3;
                  goto LABEL_55;
                }
                if ([v16 isEqual:v88])
                {
                  [v13 stringValue];
                  v89 = v17 = v89;
                  goto LABEL_55;
                }
                if ([v16 isEqual:v86])
                {
                  [v13 stringValue];
                  v87 = v17 = v87;
                  goto LABEL_55;
                }
                if ([v16 isEqual:v82])
                {
                  v17 = [v13 extraAttributes];
                  v18 = [v17 objectForKey:@"info"];
                  v80 = v18;
                  if ([v18 isEqual:@"com.apple.radio.explicit"])
                  {
                    id v19 = [v13 value];
                    objc_opt_class();
                    v83 = v3;
                    if (objc_opt_isKindOfClass())
                    {
                      id v20 = v19;
                      uint64_t v5 = v78;
                      if ([v20 length])
                      {
                        char v112 = 0;
                        [v20 getBytes:&v112 length:1];
                        uint64_t v74 = [NSNumber numberWithInt:v112 == 1];

                        id v19 = v20;
                        v21 = (void *)v74;
                        goto LABEL_41;
                      }
                      id v19 = v20;
                    }
                    else
                    {
                      uint64_t v5 = v78;
                      if (objc_opt_respondsToSelector())
                      {
                        objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "charValue") == 1);
                        v77 = id v20 = v77;
                      }
                      else
                      {
                        id v20 = v77;
                        v21 = (void *)MEMORY[0x263EFFA80];
LABEL_41:
                        v77 = v21;
                      }
                    }
LABEL_44:

                    v3 = v83;
                    goto LABEL_45;
                  }
                  if ([v18 isEqual:@"com.apple.radio.adamid"])
                  {
                    v31 = [v13 dataValue];
                    uint64_t v5 = v78;
                    if (v31)
                    {
                      v83 = v3;
                      id v19 = v31;
                      id v20 = v76;
                      v76 = v19;
                      goto LABEL_44;
                    }
                    id v19 = 0;
LABEL_45:
                  }
                  else
                  {
                    uint64_t v5 = v78;
                  }

LABEL_55:
                }
                else if ([v16 isEqual:v79])
                {
                  v84 = v3;
                  v17 = [v13 extraAttributes];
                  v22 = [v17 objectForKey:@"info"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v81 = [MEMORY[0x263F08B08] scannerWithString:v22];
                    if ([v81 scanString:@"artworkURL_" intoString:0])
                    {
                      v23 = [v13 stringValue];
                      if (v23)
                      {
                        v75 = v23;
                        v24 = [NSURL URLWithString:v23];
                        v25 = v81;
                        if (v24)
                        {
                          id v72 = v24;
                          id v111 = 0;
                          int v26 = [v81 scanUpToString:@"x" intoString:&v111];
                          id v27 = v111;
                          if (v26)
                          {
                            v71 = v27;
                            v25 = v81;
                            if (([v81 isAtEnd] & 1) == 0)
                            {
                              uint64_t v28 = [v71 integerValue];
                              v122[0] = v75;
                              v121[0] = @"url";
                              v121[1] = @"width";
                              v65 = [NSNumber numberWithInteger:v28];
                              v122[1] = v65;
                              v121[2] = @"height";
                              v29 = [NSNumber numberWithInteger:v28];
                              v122[2] = v29;
                              v66 = [NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];

                              id v30 = v67;
                              if (!v67) {
                                id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
                              }
                              v67 = v30;
                              [v30 addObject:v66];

                              v25 = v81;
                            }
                            id v27 = v71;
                          }
                          else
                          {
                            v25 = v81;
                          }

                          v24 = v72;
                        }

                        v23 = v75;
                      }
                      else
                      {
                        v25 = v81;
                      }
                    }
                    else
                    {
                      v25 = v81;
                    }
                  }
                  v3 = v84;
                  goto LABEL_55;
                }

                continue;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v113 objects:v123 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v73 + 1;
      }
      while (v73 + 1 != v70);
      uint64_t v70 = [obj countByEnumeratingWithState:&v117 objects:v124 count:16];
      if (!v70) {
        goto LABEL_63;
      }
    }
  }
  v67 = 0;
  v76 = 0;
  v77 = 0;
  v87 = 0;
  v89 = 0;
  v3 = 0;
LABEL_63:
  v32 = (void *)[*(id *)(v64 + 32) copy];
  [v32 setPreviousResponse:0];
  if (v3 || v87 || v89 || v67 || (v33 = 0, v77))
  {
    v33 = objc_alloc_init(MPCModelGenericAVItemTimedMetadataStreamFields);
    [(MPCModelGenericAVItemTimedMetadataStreamFields *)v33 setAlbum:v87];
    [(MPCModelGenericAVItemTimedMetadataStreamFields *)v33 setArtist:v89];
    -[MPCModelGenericAVItemTimedMetadataStreamFields setExplicitContent:](v33, "setExplicitContent:", [v77 BOOLValue]);
    [(MPCModelGenericAVItemTimedMetadataStreamFields *)v33 setTitle:v3];
    [(MPCModelGenericAVItemTimedMetadataStreamFields *)v33 setArtworkDictionaries:v67];
  }
  v34 = [v63 adamIDData];
  v35 = v76;
  v85 = v3;
  if ((v76 == v34 || [v76 isEqual:v34]) && v76 && v63)
  {
    int v36 = 0;
    v37 = v62;
  }
  else
  {
    v38 = [v63 streamFields];
    if (v33 == v38 || [(MPCModelGenericAVItemTimedMetadataStreamFields *)v33 isEqual:v38])
    {
      int v36 = 0;
      v37 = v62;
    }
    else
    {
      v39 = [*(id *)(v64 + 32) genericObject];
      if (v33)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_2;
        aBlock[3] = &unk_2643C67F0;
        id v106 = v89;
        id v107 = v67;
        id v108 = v87;
        id v109 = v3;
        v110 = v33;
        v40 = _Block_copy(aBlock);
        uint64_t v41 = [v39 type];
        if ((v41 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v61 = [MEMORY[0x263F08690] currentHandler];
          objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v64 + 56), *(void *)(v64 + 40), @"MPCModelGenericAVItemTimedMetadataRequest.m", 226, @"MPCModelGenericAVItemTimedMetadataRequest: unexepected genericObject type: %ld", v41);
        }
        v42 = [v39 anyObject];
        v43 = [v39 identifiers];
        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_7;
        v102[3] = &unk_2643C6840;
        id v103 = v40;
        uint64_t v104 = v41;
        id v44 = v40;
        v45 = (void *)[v42 copyWithIdentifiers:v43 block:v102];

        uint64_t v46 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v45];

        v39 = (void *)v46;
      }
      v47 = [[MPCModelGenericAVItemTimedMetadataResponse alloc] initWithRequest:v32 personalizationResponse:0 firstResponse:1 finalResponse:0];
      id v48 = objc_alloc_init(MEMORY[0x263F120D8]);
      [v48 appendSection:&stru_26CBCA930];
      [v48 appendItem:v39];
      [(MPModelResponse *)v47 setResults:v48];
      [(MPCModelGenericAVItemTimedMetadataResponse *)v47 setStreamFields:v33];
      uint64_t v49 = *(void *)(v64 + 48);
      v37 = v62;
      if (v49) {
        (*(void (**)(uint64_t, MPCModelGenericAVItemTimedMetadataResponse *, void))(v49 + 16))(v49, v47, 0);
      }

      int v36 = 1;
      v35 = v76;
    }
  }
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_9;
  v99[3] = &unk_2643C6868;
  id v101 = *(id *)(v64 + 48);
  id v50 = v37;
  id v100 = v50;
  v51 = _Block_copy(v99);
  v94[0] = MEMORY[0x263EF8330];
  v94[1] = 3221225472;
  v94[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_10;
  v94[3] = &unk_2643C68B8;
  id v52 = v32;
  id v95 = v52;
  id v53 = v35;
  id v96 = v53;
  v54 = v33;
  v97 = v54;
  id v55 = v51;
  id v98 = v55;
  v56 = _Block_copy(v94);
  if (v53 && ([v53 isEqual:v34] & 1) == 0)
  {
    id v58 = objc_alloc_init(MEMORY[0x263F89288]);
    [v58 setQualityOfService:25];
    [v58 setTimedMetadataData:v53];
    v59 = [*(id *)(v64 + 32) storeRequestContext];
    [v58 setStoreRequestContext:v59];

    v90[0] = MEMORY[0x263EF8330];
    v90[1] = 3221225472;
    v90[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_12;
    v90[3] = &unk_2643C68E0;
    id v91 = *(id *)(v64 + 32);
    id v92 = v50;
    id v93 = v56;
    [v58 performWithResponseHandler:v90];

    goto LABEL_94;
  }
  if (([v53 isEqual:v34] & 1) == 0 && v36 == 1)
  {
    [v50 finish];
LABEL_94:
    v57 = v63;
    goto LABEL_95;
  }
  v57 = v63;
  if (v63 && ([v63 isValid] & 1) == 0)
  {
    v60 = [v63 unpersonalizedContentDescriptors];
    (*((void (**)(void *, void *))v56 + 2))(v56, v60);
  }
  else
  {
    [v63 setFirstResponse:0];
    (*((void (**)(id, void *, void))v55 + 2))(v55, v63, 0);
  }
LABEL_95:
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_3;
  aBlock[3] = &unk_2643C6750;
  id v32 = *(id *)(a1 + 32);
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = [v3 artist];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 identifiers];
    uint64_t v8 = [v6 copyWithIdentifiers:v7 block:v4];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F11E90]);
    id v7 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    uint64_t v8 = [v9 initWithIdentifiers:v7 block:v4];
  }
  uint64_t v10 = (void *)v8;

  v24 = v10;
  [v3 setArtist:v10];
  v23 = (void *)[objc_alloc(MEMORY[0x263F89310]) initWithArtworkResponseArray:*(void *)(a1 + 40)];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F12258], "tokenWithImageArtworkInfo:");
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_4;
  v29[3] = &unk_2643C6778;
  id v12 = v11;
  id v30 = v12;
  id v13 = _Block_copy(v29);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_5;
  v25[3] = &unk_2643C67C8;
  id v26 = *(id *)(a1 + 48);
  id v14 = v4;
  id v27 = v14;
  id v15 = v13;
  id v28 = v15;
  SEL v16 = _Block_copy(v25);
  v17 = [v3 album];
  v18 = v17;
  if (v17)
  {
    id v19 = [v17 identifiers];
    uint64_t v20 = [v18 copyWithIdentifiers:v19 block:v16];
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x263F11E80]);
    id v19 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    uint64_t v20 = [v21 initWithIdentifiers:v19 block:v16];
  }
  v22 = (void *)v20;

  [v3 setAlbum:v22];
  [v3 setTitle:*(void *)(a1 + 56)];
  objc_msgSend(v3, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 64), "isExplicitContent"));
  [v3 setArtworkCatalogBlock:v15];
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263F11F78];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_8;
  v7[3] = &unk_2643C6818;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performWithoutEnforcement:v7];
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v5 = v7;
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_10(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F122B0]) initWithUnpersonalizedRequest:a1[4] unpersonalizedContentDescriptors:v3];
  [v4 setMatchAlbumArtistsOnNameAndStoreID:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_11;
  v6[3] = &unk_2643C6890;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = v3;
  id v11 = a1[7];
  id v5 = v3;
  [v4 performWithResponseHandler:v6];
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = [a2 allStorePlatformMetadata];
  uint64_t v6 = [v5 firstObject];

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [*(id *)(a1 + 32) itemProperties];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = (void *)v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F12070]) initWithRequestedProperties:v7];
  id v10 = [*(id *)(a1 + 40) userIdentity];
  id v11 = [v9 genericObjectForStorePlatformMetadata:v6 radioStationContainsVideo:0 userIdentity:v10];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F120D8]);
    [v12 appendSection:&stru_26CBCA930];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F122A8]) initWithModel:v11 personalizationStyle:1];
    [v12 appendItem:v13];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_5:
    [*(id *)(a1 + 40) finishWithError:v14];
  }
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_11(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[MPCModelGenericAVItemTimedMetadataResponse alloc] initWithRequest:a1[4] personalizationResponse:v3 firstResponse:0 finalResponse:1];

  [(MPCModelGenericAVItemTimedMetadataResponse *)v4 setAdamIDData:a1[5]];
  [(MPCModelGenericAVItemTimedMetadataResponse *)v4 setStreamFields:a1[6]];
  [(MPCModelGenericAVItemTimedMetadataResponse *)v4 setUnpersonalizedContentDescriptors:a1[7]];
  (*(void (**)(void))(a1[8] + 16))();
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 5)
  {
    id v5 = *(id *)(a1 + 32);
    if ([v5 type] == 1)
    {
      uint64_t v4 = [v5 song];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else if (v2 == 1)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

uint64_t __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setName:*(void *)(a1 + 32)];
}

id __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc(MEMORY[0x263F11D30]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    id v5 = (void *)[v2 initWithToken:v3 dataSource:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:a1[4]];
  uint64_t v4 = [v3 artist];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identifiers];
    uint64_t v7 = [v5 copyWithIdentifiers:v6 block:a1[5]];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F11E90]);
    uint64_t v6 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    uint64_t v7 = [v8 initWithIdentifiers:v6 block:a1[5]];
  }
  id v9 = (void *)v7;

  [v3 setArtist:v9];
  [v3 setArtworkCatalogBlock:a1[6]];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v10 = (void *)MEMORY[0x263F11F78];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_6;
  id v15 = &unk_2643C67A0;
  v17 = &v18;
  id v11 = v3;
  id v16 = v11;
  [v10 performWithoutEnforcement:&v12];
  if (*((unsigned char *)v19 + 24)) {
    objc_msgSend(v11, "setYear:", 0, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) year];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPCModelGenericAVItemTimedMetadataRequest;
  uint64_t v4 = [(MPCModelGenericAVItemTimedMetadataRequest *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 11, self->_timedMetadataGroups);
    objc_storeStrong(v5 + 10, self->_storeRequestContext);
    objc_storeStrong(v5 + 8, self->_previousResponse);
    objc_storeStrong(v5 + 9, self->_genericObject);
  }
  return v5;
}

- (MPCModelGenericAVItemTimedMetadataRequest)initWithGenericObject:(id)a3 timedMetadataGroups:(id)a4 storeRequestContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCModelGenericAVItemTimedMetadataRequest;
  uint64_t v12 = [(MPCModelGenericAVItemTimedMetadataRequest *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_genericObject, a3);
    uint64_t v14 = [v10 copy];
    timedMetadataGroups = v13->_timedMetadataGroups;
    v13->_timedMetadataGroups = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    storeRequestContext = v13->_storeRequestContext;
    v13->_storeRequestContext = (ICStoreRequestContext *)v16;
  }
  return v13;
}

+ (NSArray)metadataIdentifiers
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EF9E20];
  v6[0] = *MEMORY[0x263EF9E30];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263EF9E18];
  v6[2] = *MEMORY[0x263EF9E10];
  v6[3] = v3;
  void v6[4] = *MEMORY[0x263EF9E28];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end