@interface MPCSiriSelfLogger
+ (void)sendMetrics:(id)a3;
@end

@implementation MPCSiriSelfLogger

+ (void)sendMetrics:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 siriRefId];
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v6);

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SELFLoggerSendMetrics", "", buf, 2u);
  }

  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2050000000;
  v11 = (void *)getSASelfLoggerClass_softClass;
  uint64_t v131 = getSASelfLoggerClass_softClass;
  if (!getSASelfLoggerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSASelfLoggerClass_block_invoke;
    v133 = &unk_2643C57E0;
    v134 = &v128;
    __getSASelfLoggerClass_block_invoke((uint64_t)buf);
    v11 = (void *)v129[3];
  }
  v12 = v11;
  _Block_object_dispose(&v128, 8);
  id v13 = objc_alloc_init(v12);
  v14 = [v13 getSiriRequestUUIDFor:v6];
  if (!v14)
  {
    v126 = [MEMORY[0x263F08690] currentHandler];
    v127 = [v5 siriRefId];
    [v126 handleFailureInMethod:a2, a1, @"MPCSiriSelfLogger.m", 233, @"MPCSiriSelfLogger: siriReferenceIdentifier is not recognized by SASelfLogger: %@", v127 object file lineNumber description];
  }
  [v13 emitVMCPUStatsWithStage:5 requestId:v14];
  v15 = [v5 checkpointMRSetQueueBegin];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    v17 = [v5 checkpointMRSetQueueBegin];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 3, v14, objc_msgSend(v17, "longLongValue"));
  }
  v18 = [v5 checkpointRateZero];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    v20 = [v5 checkpointRateZero];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 4, v14, objc_msgSend(v20, "longLongValue"));
  }
  v21 = [v5 checkpointSetQueueBegin];
  BOOL v22 = v21 == 0;

  if (!v22)
  {
    v23 = [v5 checkpointSetQueueBegin];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 26, v14, objc_msgSend(v23, "longLongValue"));
  }
  v24 = [v5 checkpointSetQueueEnd];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    v26 = [v5 checkpointSetQueueEnd];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 6, v14, objc_msgSend(v26, "longLongValue"));
  }
  v27 = [v5 checkpointMRPlay];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v29 = [v5 checkpointMRPlay];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 19, v14, objc_msgSend(v29, "longLongValue"));
  }
  v30 = [v5 checkpointAssetLoadBegin];
  BOOL v31 = v30 == 0;

  if (!v31)
  {
    v32 = [v5 checkpointAssetLoadBegin];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 7, v14, objc_msgSend(v32, "longLongValue"));
  }
  v33 = [v5 checkpointAssetLoadEnd];
  BOOL v34 = v33 == 0;

  if (!v34)
  {
    v35 = [v5 checkpointAssetLoadEnd];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 8, v14, objc_msgSend(v35, "longLongValue"));
  }
  v36 = [v5 checkpointLikelyToKeepUp];
  BOOL v37 = v36 == 0;

  if (!v37)
  {
    v38 = [v5 checkpointLikelyToKeepUp];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 14, v14, objc_msgSend(v38, "longLongValue"));
  }
  v39 = [v5 checkpointReadyToPlay];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    v41 = [v5 checkpointReadyToPlay];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 15, v14, objc_msgSend(v41, "longLongValue"));
  }
  v42 = [v5 checkpointPlay];
  BOOL v43 = v42 == 0;

  if (!v43)
  {
    v44 = [v5 checkpointPlay];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 27, v14, objc_msgSend(v44, "longLongValue"));
  }
  v45 = [v5 checkpointRateOne];
  BOOL v46 = v45 == 0;

  if (!v46)
  {
    v47 = [v5 checkpointRateOne];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 20, v14, objc_msgSend(v47, "longLongValue"));
  }
  v48 = [v5 checkpointFirstAudioFrame];
  BOOL v49 = v48 == 0;

  if (!v49)
  {
    v50 = [v5 checkpointFirstAudioFrame];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 28, v14, objc_msgSend(v50, "longLongValue"));

    v51 = [v5 checkpointFirstAudioFrame];
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 25, v14, objc_msgSend(v51, "longLongValue"));
  }
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2050000000;
  v52 = (void *)getSASelfLoggerMWTMusicMetadataClass_softClass;
  uint64_t v131 = getSASelfLoggerMWTMusicMetadataClass_softClass;
  if (!getSASelfLoggerMWTMusicMetadataClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSASelfLoggerMWTMusicMetadataClass_block_invoke;
    v133 = &unk_2643C57E0;
    v134 = &v128;
    __getSASelfLoggerMWTMusicMetadataClass_block_invoke((uint64_t)buf);
    v52 = (void *)v129[3];
  }
  v53 = v52;
  _Block_object_dispose(&v128, 8);
  id v54 = objc_alloc_init(v53);
  v55 = [v5 isShuffled];
  objc_msgSend(v54, "setIsShuffled:", objc_msgSend(v55, "BOOLValue"));

  id v56 = v5;
  v57 = [v56 assetType];
  uint64_t v58 = [v57 integerValue];

  if ((unint64_t)(v58 - 1) > 4) {
    uint64_t v59 = 0;
  }
  else {
    uint64_t v59 = dword_21BEF1928[v58 - 1];
  }

  [v54 setStreamingContentType:v59];
  id v60 = v56;
  v61 = [v60 formatInfo];
  v62 = [v61 objectForKeyedSubscript:@"codec"];
  int v63 = [v62 integerValue];

  if (v63 > 1634492790)
  {
    if (v63 > 1835623528)
    {
      if (v63 > 1935767393)
      {
        if (v63 <= 1953986160)
        {
          if (v63 == 1935767394)
          {
            uint64_t v64 = 32;
            goto LABEL_125;
          }
          if (v63 == 1953066341)
          {
            uint64_t v64 = 19;
            goto LABEL_125;
          }
        }
        else
        {
          switch(v63)
          {
            case 1953986161:
              uint64_t v64 = 8;
              goto LABEL_125;
            case 1970037111:
              uint64_t v64 = 11;
              goto LABEL_125;
            case 1970495843:
              uint64_t v64 = 30;
              goto LABEL_125;
          }
        }
      }
      else if (v63 <= 1836253232)
      {
        if (v63 == 1835623529)
        {
          uint64_t v64 = 20;
          goto LABEL_125;
        }
        if (v63 == 1836253201)
        {
          uint64_t v64 = 35;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1836253233:
            uint64_t v64 = 36;
            goto LABEL_125;
          case 1869641075:
            uint64_t v64 = 40;
            goto LABEL_125;
          case 1935764850:
            uint64_t v64 = 31;
            goto LABEL_125;
        }
      }
    }
    else if (v63 > 1718378850)
    {
      if (v63 <= 1768710754)
      {
        if (v63 == 1718378851)
        {
          uint64_t v64 = 39;
          goto LABEL_125;
        }
        if (v63 == 1752594531)
        {
          uint64_t v64 = 7;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1768710755:
            uint64_t v64 = 34;
            goto LABEL_125;
          case 1768775988:
            uint64_t v64 = 4;
            goto LABEL_125;
          case 1819304813:
            uint64_t v64 = 1;
            goto LABEL_125;
        }
      }
    }
    else if (v63 <= 1667326770)
    {
      if (v63 == 1634492791)
      {
        uint64_t v64 = 12;
        goto LABEL_125;
      }
      if (v63 == 1634760307)
      {
        uint64_t v64 = 21;
        goto LABEL_125;
      }
    }
    else
    {
      switch(v63)
      {
        case 1667326771:
          uint64_t v64 = 3;
          goto LABEL_125;
        case 1667591280:
          uint64_t v64 = 6;
          goto LABEL_125;
        case 1700998451:
          uint64_t v64 = 38;
          goto LABEL_125;
      }
    }
    goto LABEL_124;
  }
  if (v63 <= 1633772388)
  {
    if (v63 > 1296122677)
    {
      if (v63 <= 1363430722)
      {
        if (v63 == 1296122678)
        {
          uint64_t v64 = 10;
          goto LABEL_125;
        }
        if (v63 == 1363430706)
        {
          uint64_t v64 = 14;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1363430723:
            uint64_t v64 = 13;
            goto LABEL_125;
          case 1365470320:
            uint64_t v64 = 15;
            goto LABEL_125;
          case 1633772320:
            uint64_t v64 = 5;
            goto LABEL_125;
        }
      }
    }
    else if (v63 <= 778924082)
    {
      if (v63 == 778924081)
      {
        uint64_t v64 = 16;
        goto LABEL_125;
      }
      if (v63 == 778924082)
      {
        uint64_t v64 = 17;
        goto LABEL_125;
      }
    }
    else
    {
      switch(v63)
      {
        case 778924083:
          uint64_t v64 = 18;
          goto LABEL_125;
        case 1096107074:
          uint64_t v64 = 33;
          goto LABEL_125;
        case 1296122675:
          uint64_t v64 = 9;
          goto LABEL_125;
      }
    }
    goto LABEL_124;
  }
  if (v63 > 1633889586)
  {
    switch(v63)
    {
      case 1633889587:
        uint64_t v64 = 2;
        goto LABEL_125;
      case 1634038579:
        uint64_t v64 = 37;
        goto LABEL_125;
      case 1634492771:
        uint64_t v64 = 22;
        goto LABEL_125;
    }
LABEL_124:
    uint64_t v64 = 0;
    goto LABEL_125;
  }
  switch(v63)
  {
    case 1633772389:
      uint64_t v64 = 25;
      break;
    case 1633772390:
      uint64_t v64 = 26;
      break;
    case 1633772391:
      uint64_t v64 = 27;
      break;
    case 1633772392:
      uint64_t v64 = 23;
      break;
    case 1633772396:
      uint64_t v64 = 24;
      break;
    case 1633772400:
      uint64_t v64 = 28;
      break;
    case 1633772403:
      uint64_t v64 = 29;
      break;
    default:
      goto LABEL_124;
  }
LABEL_125:

  [v54 setFormatCodec:v64];
  v65 = [v60 formatInfo];
  v66 = [v65 objectForKeyedSubscript:@"bitrate"];
  objc_msgSend(v54, "setFormatBitrate:", objc_msgSend(v66, "integerValue"));

  v67 = [v60 formatInfo];
  v68 = [v67 objectForKeyedSubscript:@"bitDepth"];
  objc_msgSend(v54, "setFormatBitDepth:", objc_msgSend(v68, "integerValue"));

  v69 = [v60 formatInfo];
  v70 = [v69 objectForKeyedSubscript:@"channelLayout"];
  objc_msgSend(v54, "setFormatChannels:", (unsigned __int16)objc_msgSend(v70, "integerValue"));

  v71 = [v60 formatInfo];
  v72 = [v71 objectForKeyedSubscript:@"sampleRate"];
  objc_msgSend(v54, "setFormatSampleRate:", objc_msgSend(v72, "integerValue"));

  id v73 = v60;
  v74 = [v73 formatInfo];
  v75 = [v74 objectForKeyedSubscript:@"tier"];
  unint64_t v76 = [v75 integerValue];

  if (v76 < 5) {
    uint64_t v77 = (v76 + 1);
  }
  else {
    uint64_t v77 = 0;
  }

  [v54 setFormatTier:v77];
  v78 = [v73 hasAccountInfo];
  objc_msgSend(v54, "setIsAccountDataReady:", objc_msgSend(v78, "BOOLValue"));

  v79 = [v73 hasOnlinePlaybackKeys];
  objc_msgSend(v54, "setIsOnlineKeyReady:", objc_msgSend(v79, "BOOLValue"));

  v80 = [v73 hasOfflinePlaybackKeys];
  objc_msgSend(v54, "setIsOfflineKeyReady:", objc_msgSend(v80, "BOOLValue"));

  v81 = [v73 isReplacingPlayback];
  objc_msgSend(v54, "setIsInterruptingPlayback:", objc_msgSend(v81, "BOOLValue"));

  v82 = [v73 isRemoteSetQueue];
  objc_msgSend(v54, "setIsRemoteSetQueue:", objc_msgSend(v82, "BOOLValue"));

  v83 = [v73 isDelegatedPlayback];
  objc_msgSend(v54, "setIsDelegatedPlayback:", objc_msgSend(v83, "BOOLValue"));

  v84 = [v73 isAutoPlayEnabled];
  objc_msgSend(v54, "setIsAutoPlay:", objc_msgSend(v84, "BOOLValue"));

  v85 = [v73 isFirstPlay];
  objc_msgSend(v54, "setIsFirstPlayAfterAppLaunch:", objc_msgSend(v85, "BOOLValue"));

  v86 = [v73 isSharePlay];
  objc_msgSend(v54, "setIsSharePlayPlayback:", objc_msgSend(v86, "BOOLValue"));

  id v87 = v73;
  v88 = [v87 networkType];
  uint64_t v89 = [v88 integerValue];

  if (v89 > 99)
  {
    if (v89 > 1000)
    {
      if (v89 == 1001)
      {
        uint64_t v90 = 13;
        goto LABEL_150;
      }
      if (v89 == 2000)
      {
        uint64_t v90 = 14;
        goto LABEL_150;
      }
    }
    else
    {
      switch(v89)
      {
        case 100:
          uint64_t v90 = 10;
          goto LABEL_150;
        case 500:
          uint64_t v90 = 11;
          goto LABEL_150;
        case 1000:
          uint64_t v90 = 12;
          goto LABEL_150;
      }
    }
LABEL_138:
    uint64_t v90 = 0;
    goto LABEL_150;
  }
  uint64_t v90 = 1;
  switch(v89)
  {
    case 0:
      break;
    case 1:
      uint64_t v90 = 2;
      break;
    case 2:
      uint64_t v90 = 3;
      break;
    case 3:
      uint64_t v90 = 4;
      break;
    case 4:
      uint64_t v90 = 5;
      break;
    case 5:
      uint64_t v90 = 6;
      break;
    case 6:
      uint64_t v90 = 7;
      break;
    case 7:
      uint64_t v90 = 8;
      break;
    case 8:
      uint64_t v90 = 9;
      break;
    default:
      goto LABEL_138;
  }
LABEL_150:

  [v54 setNetworkConnectionType:v90];
  v91 = [v87 isActiveAccount];
  objc_msgSend(v54, "setIsPrimaryUser:", objc_msgSend(v91, "BOOLValue"));

  v92 = [v87 errorSignature];
  [v54 setErrorResolutionType:v92];

  id v93 = v87;
  v94 = [v93 assetSource];
  uint64_t v95 = [v94 integerValue];

  [v54 setAssetSource:v95];
  id v96 = v93;
  v97 = [v96 assetLocation];
  uint64_t v98 = [v97 integerValue];

  [v54 setAssetLocation:v98];
  v99 = [v96 queueType];
  [v54 setAudioQueueType:v99];

  id v100 = v96;
  v101 = [v100 endpointType];
  uint64_t v102 = [v101 integerValue];

  [v54 setEndPointType:v102];
  v103 = [v100 bagWaitTime];
  [v103 doubleValue];
  [v54 setHasBagWaitTime:v104 > 0.0];

  v105 = [v100 leaseWaitTime];
  [v105 doubleValue];
  [v54 setHasLeaseWaitTime:v106 > 0.0];

  v107 = [v100 lookupWaitTime];
  [v107 doubleValue];
  [v54 setHasLookupWaitTime:v108 > 0.0];

  v109 = [v100 mediaRedownloadWaitTime];
  [v109 doubleValue];
  [v54 setHasMediaRedownloadWaitTime:v110 > 0.0];

  v111 = [v100 subscriptionAssetLoadWaitTime];
  [v111 doubleValue];
  [v54 setHasSubscriptionAssetLoadWaitTime:v112 > 0.0];

  v113 = [v100 suzeLeaseWaitTime];
  [v113 doubleValue];
  [v54 setHasSuzeLeaseWaitTime:v114 > 0.0];

  id v115 = v100;
  v116 = [v115 routeInfo];
  v117 = [v116 objectForKeyedSubscript:@"type"];
  uint64_t v118 = [v117 integerValue];

  [v54 setRouteType:v118];
  id v119 = v115;
  v120 = [v119 subscriptionType];
  uint64_t v121 = [v120 integerValue];

  [v54 setSubscriptionType:v121];
  [v13 emitMWTMusicMetadata:v54 requestId:v14];
  v122 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v123 = v122;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v122))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v123, OS_SIGNPOST_INTERVAL_END, v8, "SELFLoggerSendMetrics", "", buf, 2u);
  }

  v124 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    v125 = [v119 checkpointFirstAudioFrame];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v125;
    _os_log_impl(&dword_21BB87000, v124, OS_LOG_TYPE_DEFAULT, "Finished sending SELF checkpoints and metadata with siriReferenceIdentifier=%{public}@ firstAudioFrameTimeStamp=%@", buf, 0x16u);
  }
}

@end