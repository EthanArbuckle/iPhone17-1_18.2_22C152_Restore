@interface MPIdentifierSet(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPIdentifierSet(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"_empty"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [a1 emptyIdentifierSet];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F11F10];
    v9 = [v4 objectForKeyedSubscript:@"kind"];
    v10 = [v8 payloadValueFromJSONValue:v9];

    v11 = [v4 objectForKeyedSubscript:@"sources"];
    id v12 = objc_alloc((Class)a1);
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = &unk_26CC19670;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke;
    v15[3] = &unk_2643C49D8;
    id v16 = v4;
    v7 = (void *)[v12 _initWithSources:v13 modelKind:v10 block:v15];
  }

  return v7;
}

- (id)mpc_jsonValue
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() emptyIdentifierSet];

  if (v2 == a1)
  {
    v3 = &unk_26CC19480;
  }
  else
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = [a1 modelKind];
    v5 = objc_msgSend(v4, "mpc_jsonValue");
    [v3 setObject:v5 forKeyedSubscript:@"kind"];

    int v6 = [a1 sources];
    [v3 setObject:v6 forKeyedSubscript:@"sources"];

    v7 = [a1 library];
    if (v7)
    {
      v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
      v9 = [v7 databaseID];
      [v8 setObject:v9 forKeyedSubscript:@"db-id"];

      uint64_t quot = [v7 persistentID];
      uint64_t v11 = quot;
      id v12 = (char *)&v101 + 1;
      do
      {
        lldiv_t v13 = lldiv(quot, 10);
        uint64_t quot = v13.quot;
        if (v13.rem >= 0) {
          LOBYTE(v14) = v13.rem;
        }
        else {
          uint64_t v14 = -v13.rem;
        }
        *(v12 - 2) = v14 + 48;
        v15 = (const UInt8 *)(v12 - 2);
        --v12;
      }
      while (v13.quot);
      if (v11 < 0)
      {
        *(v12 - 2) = 45;
        v15 = (const UInt8 *)(v12 - 2);
      }
      id v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v101 - (char *)v15, 0x8000100u, 0);
      [v8 setObject:v16 forKeyedSubscript:@"pid"];

      if ([v7 containedPersistentID])
      {
        uint64_t v17 = [v7 containedPersistentID];
        uint64_t v18 = v17;
        v19 = (char *)&v101 + 1;
        do
        {
          lldiv_t v20 = lldiv(v17, 10);
          uint64_t v17 = v20.quot;
          if (v20.rem >= 0) {
            LOBYTE(v21) = v20.rem;
          }
          else {
            uint64_t v21 = -v20.rem;
          }
          *(v19 - 2) = v21 + 48;
          v22 = (const UInt8 *)(v19 - 2);
          --v19;
        }
        while (v20.quot);
        if (v18 < 0)
        {
          *(v19 - 2) = 45;
          v22 = (const UInt8 *)(v19 - 2);
        }
        v23 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)&v101 - (char *)v22, 0x8000100u, 0);
        [v8 setObject:v23 forKeyedSubscript:@"contained-pid"];
      }
      else
      {
        [v8 setObject:0 forKeyedSubscript:@"contained-pid"];
      }
      if ([v7 syncID])
      {
        uint64_t v24 = [v7 syncID];
        uint64_t v25 = v24;
        v26 = (char *)&v101 + 1;
        do
        {
          lldiv_t v27 = lldiv(v24, 10);
          uint64_t v24 = v27.quot;
          if (v27.rem >= 0) {
            LOBYTE(v28) = v27.rem;
          }
          else {
            uint64_t v28 = -v27.rem;
          }
          *(v26 - 2) = v28 + 48;
          v29 = (const UInt8 *)(v26 - 2);
          --v26;
        }
        while (v27.quot);
        if (v25 < 0)
        {
          *(v26 - 2) = 45;
          v29 = (const UInt8 *)(v26 - 2);
        }
        v30 = (__CFString *)CFStringCreateWithBytes(0, v29, (char *)&v101 - (char *)v29, 0x8000100u, 0);
        [v8 setObject:v30 forKeyedSubscript:@"sync"];
      }
      else
      {
        [v8 setObject:0 forKeyedSubscript:@"sync"];
      }
      [v3 setObject:v8 forKeyedSubscript:@"library"];
    }
    v31 = [a1 personalizedStore];
    if (v31)
    {
      v32 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
      v33 = [v31 personID];
      [v32 setObject:v33 forKeyedSubscript:@"person-id"];

      if ([v31 cloudID])
      {
        uint64_t v34 = [v31 cloudID];
        uint64_t v35 = v34;
        v36 = (char *)&v101 + 1;
        do
        {
          lldiv_t v37 = lldiv(v34, 10);
          uint64_t v34 = v37.quot;
          if (v37.rem >= 0) {
            LOBYTE(v38) = v37.rem;
          }
          else {
            uint64_t v38 = -v37.rem;
          }
          *(v36 - 2) = v38 + 48;
          v39 = (const UInt8 *)(v36 - 2);
          --v36;
        }
        while (v37.quot);
        if (v35 < 0)
        {
          *(v36 - 2) = 45;
          v39 = (const UInt8 *)(v36 - 2);
        }
        v40 = (__CFString *)CFStringCreateWithBytes(0, v39, (char *)&v101 - (char *)v39, 0x8000100u, 0);
        [v32 setObject:v40 forKeyedSubscript:@"cloud"];
      }
      else
      {
        [v32 setObject:0 forKeyedSubscript:@"cloud"];
      }
      v41 = [v31 cloudAlbumID];
      [v32 setObject:v41 forKeyedSubscript:@"cloud-album"];

      v42 = [v31 recommendationID];
      [v32 setObject:v42 forKeyedSubscript:@"reco-id"];

      [v3 setObject:v32 forKeyedSubscript:@"personal"];
    }
    v43 = [a1 universalStore];
    if (v43)
    {
      v44 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
      v45 = [v43 globalPlaylistID];
      [v44 setObject:v45 forKeyedSubscript:@"global-playlist"];

      if ([v43 adamID])
      {
        uint64_t v46 = [v43 adamID];
        uint64_t v47 = v46;
        v48 = (char *)&v101 + 1;
        do
        {
          lldiv_t v49 = lldiv(v46, 10);
          uint64_t v46 = v49.quot;
          if (v49.rem >= 0) {
            LOBYTE(v50) = v49.rem;
          }
          else {
            uint64_t v50 = -v49.rem;
          }
          *(v48 - 2) = v50 + 48;
          v51 = (const UInt8 *)(v48 - 2);
          --v48;
        }
        while (v49.quot);
        if (v47 < 0)
        {
          *(v48 - 2) = 45;
          v51 = (const UInt8 *)(v48 - 2);
        }
        v52 = (__CFString *)CFStringCreateWithBytes(0, v51, (char *)&v101 - (char *)v51, 0x8000100u, 0);
        [v44 setObject:v52 forKeyedSubscript:@"adam"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"adam"];
      }
      v53 = [v43 formerAdamIDs];
      if ([v53 count])
      {
        v54 = [v43 formerAdamIDs];
        v55 = objc_msgSend(v54, "msv_map:", &__block_literal_global_217);
        [v44 setObject:v55 forKeyedSubscript:@"former-ids"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"former-ids"];
      }

      v56 = [v43 universalCloudLibraryID];
      [v44 setObject:v56 forKeyedSubscript:@"ulid"];

      if ([v43 purchasedAdamID])
      {
        uint64_t v57 = [v43 purchasedAdamID];
        uint64_t v58 = v57;
        v59 = (char *)&v101 + 1;
        do
        {
          lldiv_t v60 = lldiv(v57, 10);
          uint64_t v57 = v60.quot;
          if (v60.rem >= 0) {
            LOBYTE(v61) = v60.rem;
          }
          else {
            uint64_t v61 = -v60.rem;
          }
          *(v59 - 2) = v61 + 48;
          v62 = (const UInt8 *)(v59 - 2);
          --v59;
        }
        while (v60.quot);
        if (v58 < 0)
        {
          *(v59 - 2) = 45;
          v62 = (const UInt8 *)(v59 - 2);
        }
        v63 = (__CFString *)CFStringCreateWithBytes(0, v62, (char *)&v101 - (char *)v62, 0x8000100u, 0);
        [v44 setObject:v63 forKeyedSubscript:@"purchased"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"purchased"];
      }
      if ([v43 subscriptionAdamID])
      {
        uint64_t v64 = [v43 subscriptionAdamID];
        uint64_t v65 = v64;
        v66 = (char *)&v101 + 1;
        do
        {
          lldiv_t v67 = lldiv(v64, 10);
          uint64_t v64 = v67.quot;
          if (v67.rem >= 0) {
            LOBYTE(v68) = v67.rem;
          }
          else {
            uint64_t v68 = -v67.rem;
          }
          *(v66 - 2) = v68 + 48;
          v69 = (const UInt8 *)(v66 - 2);
          --v66;
        }
        while (v67.quot);
        if (v65 < 0)
        {
          *(v66 - 2) = 45;
          v69 = (const UInt8 *)(v66 - 2);
        }
        v70 = (__CFString *)CFStringCreateWithBytes(0, v69, (char *)&v101 - (char *)v69, 0x8000100u, 0);
        [v44 setObject:v70 forKeyedSubscript:@"subscription"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"subscription"];
      }
      v71 = [v43 socialProfileID];
      [v44 setObject:v71 forKeyedSubscript:@"social-profile"];

      v72 = [v43 informalMediaClipID];
      [v44 setObject:v72 forKeyedSubscript:@"media-clip"];

      v73 = [v43 informalStaticAssetID];
      [v44 setObject:v73 forKeyedSubscript:@"static-asset"];

      if ([v43 reportingAdamID])
      {
        uint64_t v74 = [v43 reportingAdamID];
        uint64_t v75 = v74;
        v76 = (char *)&v101 + 1;
        do
        {
          lldiv_t v77 = lldiv(v74, 10);
          uint64_t v74 = v77.quot;
          if (v77.rem >= 0) {
            LOBYTE(v78) = v77.rem;
          }
          else {
            uint64_t v78 = -v77.rem;
          }
          *(v76 - 2) = v78 + 48;
          v79 = (const UInt8 *)(v76 - 2);
          --v76;
        }
        while (v77.quot);
        if (v75 < 0)
        {
          *(v76 - 2) = 45;
          v79 = (const UInt8 *)(v76 - 2);
        }
        v80 = (__CFString *)CFStringCreateWithBytes(0, v79, (char *)&v101 - (char *)v79, 0x8000100u, 0);
        [v44 setObject:v80 forKeyedSubscript:@"reporting-adam-id"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"reporting-adam-id"];
      }
      if ([v43 assetAdamID])
      {
        uint64_t v81 = [v43 assetAdamID];
        uint64_t v82 = v81;
        v83 = (char *)&v101 + 1;
        do
        {
          lldiv_t v84 = lldiv(v81, 10);
          uint64_t v81 = v84.quot;
          if (v84.rem >= 0) {
            LOBYTE(v85) = v84.rem;
          }
          else {
            uint64_t v85 = -v84.rem;
          }
          *(v83 - 2) = v85 + 48;
          v86 = (const UInt8 *)(v83 - 2);
          --v83;
        }
        while (v84.quot);
        if (v82 < 0)
        {
          *(v83 - 2) = 45;
          v86 = (const UInt8 *)(v83 - 2);
        }
        v87 = (__CFString *)CFStringCreateWithBytes(0, v86, (char *)&v101 - (char *)v86, 0x8000100u, 0);
        [v44 setObject:v87 forKeyedSubscript:@"asset-adam-id"];
      }
      else
      {
        [v44 setObject:0 forKeyedSubscript:@"asset-adam-id"];
      }
      [v3 setObject:v44 forKeyedSubscript:@"universal"];
    }
    v88 = [a1 radio];
    if (v88)
    {
      v89 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
      v90 = [v88 stationStringID];
      [v89 setObject:v90 forKeyedSubscript:@"station-string"];

      v91 = [v88 stationHash];
      [v89 setObject:v91 forKeyedSubscript:@"station-hash"];

      if ([v88 stationID])
      {
        v92 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v88, "stationID"));
        [v89 setObject:v92 forKeyedSubscript:@"station-id"];
      }
      else
      {
        [v89 setObject:0 forKeyedSubscript:@"station-id"];
      }
      [v3 setObject:v89 forKeyedSubscript:@"radio"];
    }
    v93 = [a1 containerUniqueID];
    [v3 setObject:v93 forKeyedSubscript:@"containerUniqueID"];

    v94 = [a1 handoffCorrelationID];
    [v3 setObject:v94 forKeyedSubscript:@"handoffCorrelationID"];

    v95 = [a1 contentItemID];
    [v3 setObject:v95 forKeyedSubscript:@"contentItemID"];

    v96 = [a1 lyricsID];
    [v3 setObject:v96 forKeyedSubscript:@"lyricsID"];

    v97 = [a1 vendorID];
    [v3 setObject:v97 forKeyedSubscript:@"vendorID"];

    v98 = [a1 opaqueID];
    [v3 setObject:v98 forKeyedSubscript:@"opaqueID"];

    v99 = [a1 versionHash];
    [v3 setObject:v99 forKeyedSubscript:@"versionHash"];
  }

  return v3;
}

@end