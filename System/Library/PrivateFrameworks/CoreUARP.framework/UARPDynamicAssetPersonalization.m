@interface UARPDynamicAssetPersonalization
- (BOOL)compareTssResponse:(id)a3;
- (BOOL)prepareDynamicAsset:(id)a3 error:(id *)a4;
- (BOOL)processDynamicAsset:(id *)a3;
- (BOOL)processTssResponse:(id)a3;
- (BOOL)tssRequest:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (NSURL)tatsuServerURL;
- (NSURL)url;
- (UARPAssetTag)tagIM4M;
- (UARPDynamicAssetPersonalization)init;
- (UARPDynamicAssetPersonalization)initWithEndpoint:(id)a3 url:(id)a4 tatsuServerURL:(id)a5;
- (UARPUploaderEndpoint)endpoint;
- (id)buildKey:(id)a3 forPayload:(id)a4;
- (id)buildTicketPrefixForPayload:(id)a3;
- (int64_t)assetNumber;
@end

@implementation UARPDynamicAssetPersonalization

- (UARPDynamicAssetPersonalization)init
{
  return 0;
}

- (UARPDynamicAssetPersonalization)initWithEndpoint:(id)a3 url:(id)a4 tatsuServerURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)UARPDynamicAssetPersonalization;
  v12 = [(UARPDynamicAssetPersonalization *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_tatsuServerURL, a5);
    os_log_t v14 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.UARP.UARPPersonalization", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (char *)uarpAssetTagStructPersonalization();
    v19 = [[UARPAssetTag alloc] initWithChar1:*v18 char2:v18[1] char3:v18[2] char4:v18[3]];
    tagIM4M = v13->_tagIM4M;
    v13->_tagIM4M = v19;
  }
  return v13;
}

- (int64_t)assetNumber
{
  v2 = [(UARPSuperBinaryAsset *)self->_im4mAsset tlvs];
  v3 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403906 tlvs:v2];

  if (v3)
  {
    v4 = [v3 valueAsNumber];
    v5 = v4;
    if (v4) {
      int64_t v6 = [v4 integerValue];
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (NSDictionary)options
{
  v2 = NSDictionary;
  v3 = [(NSMutableArray *)self->_options firstObject];
  v4 = [v2 dictionaryWithDictionary:v3];

  return (NSDictionary *)v4;
}

- (id)buildTicketPrefixForPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 tlvs];
  v5 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403907 tlvs:v4];

  if (v5)
  {
    int64_t v6 = [v5 valueAsString];
  }
  else
  {
    int64_t v6 = 0;
  }
  v7 = [v3 tlvs];
  v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403942 tlvs:v7];

  if (v8)
  {
    id v9 = [v8 valueAsNumber];
    BOOL v10 = [v9 unsignedCharValue] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = [v3 tlvs];
  v12 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403941 tlvs:v11];

  if (v12)
  {
    v13 = [v12 valueAsNumber];
    uint64_t v14 = [v13 unsignedLongValue];
  }
  else
  {
    uint64_t v14 = 1;
  }
  v15 = [MEMORY[0x263F089D8] stringWithFormat:@"%@", v6];
  dispatch_queue_t v16 = v15;
  if (v10) {
    objc_msgSend(v15, "appendFormat:", @"%lu", v14);
  }
  v17 = [NSString stringWithString:v16];

  return v17;
}

- (id)buildKey:(id)a3 forPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 tlvs];
  v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403907 tlvs:v7];

  if (v8)
  {
    id v9 = [v8 valueAsString];
  }
  else
  {
    id v9 = 0;
  }
  v26 = v5;
  BOOL v10 = [v6 tlvs];
  id v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403937 tlvs:v10];

  if (v11)
  {
    v12 = [v11 valueAsNumber];
    BOOL v13 = [v12 unsignedCharValue] != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  uint64_t v14 = [v6 tlvs];
  v15 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403938 tlvs:v14];

  if (v15)
  {
    dispatch_queue_t v16 = [v15 valueAsNumber];
    BOOL v17 = [v16 unsignedCharValue] != 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  v18 = [v6 tlvs];
  v19 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403941 tlvs:v18];

  if (v19)
  {
    v20 = [v19 valueAsNumber];
    uint64_t v21 = [v20 unsignedLongValue];
  }
  else
  {
    uint64_t v21 = 1;
  }
  objc_super v22 = [MEMORY[0x263F089D8] stringWithFormat:@"%@", v9];
  v23 = v22;
  if (v13) {
    objc_msgSend(v22, "appendFormat:", @"%lu", v21);
  }
  [v23 appendFormat:@",%@", v26];
  if (v17) {
    objc_msgSend(v23, "appendFormat:", @",%lu", v21);
  }
  v24 = [NSString stringWithString:v23];

  return v24;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v4 = self;
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v5 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  im4mAsset = v4->_im4mAsset;
  v4->_im4mAsset = v5;

  BOOL v7 = [(UARPSuperBinaryAsset *)v4->_im4mAsset expandHeadersAndTLVs:a3];
  if (v7)
  {
    BOOL v90 = v7;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    options = v4->_options;
    v4->_options = v8;

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = [(UARPSuperBinaryAsset *)v4->_im4mAsset payloads];
    uint64_t v93 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
    if (v93)
    {
      uint64_t v92 = *(void *)v110;
      v97 = v4;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v110 != v92) {
            objc_enumerationMutation(obj);
          }
          uint64_t v95 = v10;
          id v11 = *(void **)(*((void *)&v109 + 1) + 8 * v10);
          id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v100 = v11;
          uint64_t v13 = [(UARPDynamicAssetPersonalization *)v4 buildTicketPrefixForPayload:v11];
          if (v13)
          {
            uint64_t v14 = [NSString stringWithFormat:@"%@,%@", v13, @"Ticket"];
            keyNameManifest = v4->_keyNameManifest;
            v4->_keyNameManifest = (NSString *)v14;

            uint64_t v16 = [NSString stringWithFormat:@"@%@", v4->_keyNameManifest];
            keyNameTicket = v4->_keyNameTicket;
            v4->_keyNameTicket = (NSString *)v16;

            [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v4->_keyNameTicket];
          }
          v94 = (void *)v13;
          uint64_t v18 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"BoardID" forPayload:v11];
          keyNameBoardID = v4->_keyNameBoardID;
          v4->_keyNameBoardID = (NSString *)v18;

          v20 = [v11 tlvs];
          uint64_t v21 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403908 tlvs:v20];

          if (v4->_keyNameBoardID && v21)
          {
            objc_super v22 = [v21 valueAsNumber];
            [v12 setObject:v22 forKeyedSubscript:v4->_keyNameBoardID];
          }
          uint64_t v23 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"ChipID" forPayload:v100];
          keyNameChipID = v4->_keyNameChipID;
          v4->_keyNameChipID = (NSString *)v23;

          v25 = [v100 tlvs];
          v26 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403909 tlvs:v25];

          if (v4->_keyNameChipID && v26)
          {
            v27 = [v26 valueAsNumber];
            [v12 setObject:v27 forKeyedSubscript:v4->_keyNameChipID];
          }
          uint64_t v28 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"ECID" forPayload:v100];
          keyNameECID = v4->_keyNameECID;
          v4->_keyNameECID = (NSString *)v28;

          v30 = [v100 tlvs];
          v31 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403910 tlvs:v30];

          if (v4->_keyNameECID && v31)
          {
            v32 = [v31 valueAsNumber];
            [v12 setObject:v32 forKeyedSubscript:v4->_keyNameECID];
          }
          uint64_t v33 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"Nonce" forPayload:v100];
          keyNameNonce = v4->_keyNameNonce;
          v4->_keyNameNonce = (NSString *)v33;

          v35 = [v100 tlvs];
          v36 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403912 tlvs:v35];

          if (v4->_keyNameNonce && v36)
          {
            v37 = [v36 valueAsData];
            [v12 setObject:v37 forKeyedSubscript:v4->_keyNameNonce];
          }
          uint64_t v38 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"ProductionMode" forPayload:v100];
          keyNameProductionMode = v4->_keyNameProductionMode;
          v4->_keyNameProductionMode = (NSString *)v38;

          v40 = [v100 tlvs];
          v41 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403915 tlvs:v40];

          if (v4->_keyNameProductionMode && v41)
          {
            v42 = [v41 valueAsNumber];
            if ([v42 BOOLValue]) {
              uint64_t v43 = MEMORY[0x263EFFA88];
            }
            else {
              uint64_t v43 = MEMORY[0x263EFFA80];
            }
            [v12 setObject:v43 forKeyedSubscript:v4->_keyNameProductionMode];
          }
          uint64_t v44 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"SecurityDomain" forPayload:v100];
          keyNameSecurityDomain = v4->_keyNameSecurityDomain;
          v4->_keyNameSecurityDomain = (NSString *)v44;

          v46 = [v100 tlvs];
          v47 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403913 tlvs:v46];

          if (v4->_keyNameSecurityDomain && v47)
          {
            v48 = [v47 valueAsNumber];
            [v12 setObject:v48 forKeyedSubscript:v4->_keyNameSecurityDomain];
          }
          uint64_t v49 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"SecurityMode" forPayload:v100];
          keyNameSecurityMode = v4->_keyNameSecurityMode;
          v4->_keyNameSecurityMode = (NSString *)v49;

          v51 = [v100 tlvs];
          v52 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403914 tlvs:v51];

          if (v4->_keyNameSecurityMode && v52)
          {
            v53 = [v52 valueAsNumber];
            if ([v53 BOOLValue]) {
              uint64_t v54 = MEMORY[0x263EFFA88];
            }
            else {
              uint64_t v54 = MEMORY[0x263EFFA80];
            }
            [v12 setObject:v54 forKeyedSubscript:v4->_keyNameSecurityMode];
          }
          uint64_t v55 = [(UARPDynamicAssetPersonalization *)v4 buildKey:@"SocLiveNonce" forPayload:v100];
          keyNameSoCLiveNonce = v4->_keyNameSoCLiveNonce;
          v4->_keyNameSoCLiveNonce = (NSString *)v55;

          v57 = [v100 tlvs];
          v58 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403928 tlvs:v57];

          if (v4->_keyNameSoCLiveNonce && v58)
          {
            v59 = [v58 valueAsNumber];
            if ([v59 BOOLValue]) {
              uint64_t v60 = MEMORY[0x263EFFA88];
            }
            else {
              uint64_t v60 = MEMORY[0x263EFFA80];
            }
            [v12 setObject:v60 forKeyedSubscript:v4->_keyNameSoCLiveNonce];
          }
          v61 = [v100 tlvs];
          v62 = +[UARPSuperBinaryAssetTLV findTLVsWithType:2293403920 tlvs:v61];

          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          id v96 = v62;
          uint64_t v101 = [v96 countByEnumeratingWithState:&v105 objects:v115 count:16];
          if (v101)
          {
            uint64_t v98 = *(void *)v106;
            v99 = v12;
            do
            {
              for (uint64_t i = 0; i != v101; ++i)
              {
                if (*(void *)v106 != v98) {
                  objc_enumerationMutation(v96);
                }
                v64 = [*(id *)(*((void *)&v105 + 1) + 8 * i) valueAsTLVs];
                id v65 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                v66 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403922 tlvs:v64];
                v102 = [v66 valueAsString];

                v67 = [NSString stringWithFormat:@"%@", @"Digest"];
                v68 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403923 tlvs:v64];
                v69 = [v68 valueAsData];
                [v65 setObject:v69 forKeyedSubscript:v67];

                v70 = [NSString stringWithFormat:@"%@", @"EPRO"];
                v71 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403926 tlvs:v64];
                v72 = v71;
                if (v71)
                {
                  v73 = [v71 valueAsNumber];
                  if ([v73 BOOLValue]) {
                    uint64_t v74 = MEMORY[0x263EFFA88];
                  }
                  else {
                    uint64_t v74 = MEMORY[0x263EFFA80];
                  }
                  [v65 setObject:v74 forKeyedSubscript:v70];
                }
                v75 = [NSString stringWithFormat:@"%@", @"ESEC"];
                v76 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403925 tlvs:v64];
                v77 = v76;
                if (v76)
                {
                  v78 = [v76 valueAsNumber];
                  if ([v78 BOOLValue]) {
                    uint64_t v79 = MEMORY[0x263EFFA88];
                  }
                  else {
                    uint64_t v79 = MEMORY[0x263EFFA80];
                  }
                  [v65 setObject:v79 forKeyedSubscript:v75];
                }
                v80 = [NSString stringWithFormat:@"%@", @"Trusted"];
                v81 = +[UARPSuperBinaryAssetTLV findTLVWithType:2293403927 tlvs:v64];
                v82 = v81;
                if (v81)
                {
                  v83 = [v81 valueAsNumber];
                  if ([v83 BOOLValue]) {
                    uint64_t v84 = MEMORY[0x263EFFA88];
                  }
                  else {
                    uint64_t v84 = MEMORY[0x263EFFA80];
                  }
                  [v65 setObject:v84 forKeyedSubscript:v80];
                }
                v4 = v97;
                v85 = [(UARPDynamicAssetPersonalization *)v97 buildKey:v102 forPayload:v100];
                id v12 = v99;
                [v99 setObject:v65 forKeyedSubscript:v85];
              }
              uint64_t v101 = [v96 countByEnumeratingWithState:&v105 objects:v115 count:16];
            }
            while (v101);
          }

          log = v4->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            [(UARPDynamicAssetPersonalization *)&v103 processDynamicAsset:log];
          }
          v87 = v4->_log;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v114 = v12;
            _os_log_debug_impl(&dword_21E079000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          v88 = [NSDictionary dictionaryWithDictionary:v12];
          [(NSMutableArray *)v4->_options addObject:v88];

          uint64_t v10 = v95 + 1;
        }
        while (v95 + 1 != v93);
        uint64_t v93 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
      }
      while (v93);
    }

    LOBYTE(v7) = v90;
  }
  return v7;
}

- (BOOL)tssRequest:(id)a3 error:(id *)a4
{
  options = self->_options;
  id v6 = a3;
  BOOL v7 = [(NSMutableArray *)options firstObject];
  v8 = UARPPersonalizationTSSRequestWithSigningServer(v7, v6);

  if (v8) {
    BOOL v9 = [(UARPDynamicAssetPersonalization *)self processTssResponse:v8];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)processTssResponse:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(UARPSuperBinaryAsset *)self->_im4mAsset payloads];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v8 = [(UARPDynamicAssetPersonalization *)self buildTicketPrefixForPayload:v7];
        BOOL v9 = [NSString stringWithFormat:@"%@,%@", v8, @"Ticket"];
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          __int16 v28 = 2112;
          v29 = v9;
          _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: rebuilt ticket name is %@", buf, 0x16u);
        }
        id v11 = self->_log;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          keyNameManifest = self->_keyNameManifest;
          *(_DWORD *)buf = 136315394;
          v27 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          __int16 v28 = 2112;
          v29 = keyNameManifest;
          _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: composed ticket name is %@", buf, 0x16u);
        }
        uint64_t v13 = [v21 objectForKeyedSubscript:v9];
        uint64_t v14 = self->_log;
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetPersonalization processTssResponse:](v14);
          }
          goto LABEL_24;
        }
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_INFO, "IM4M: TSS Response Bundle is ", buf, 2u);
        }
        v15 = self->_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl(&dword_21E079000, v15, OS_LOG_TYPE_INFO, "IM4M: %@", buf, 0xCu);
        }
        if (([v7 setPayloadToData:v13] & 1) == 0)
        {
          BOOL v17 = self->_log;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetPersonalization processTssResponse:](v17);
          }
LABEL_24:

          BOOL v16 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      BOOL v16 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_25:

  return v16;
}

- (BOOL)prepareDynamicAsset:(id)a3 error:(id *)a4
{
  im4mAsset = self->_im4mAsset;
  if (im4mAsset) {
    LOBYTE(im4mAsset) = [(UARPSuperBinaryAsset *)im4mAsset writeToURL:a3 error:a4];
  }
  return (char)im4mAsset;
}

- (BOOL)compareTssResponse:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSString *)a3;
  uint64_t v5 = NSDictionary;
  id v6 = [(NSMutableArray *)self->_options firstObject];
  BOOL v7 = [v5 dictionaryWithDictionary:v6];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = v7;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s TSS Options %@", buf, 0x16u);
  }
  BOOL v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = v4;
    _os_log_impl(&dword_21E079000, v9, OS_LOG_TYPE_INFO, "%s TSS Response %@", buf, 0x16u);
  }
  uint64_t v10 = [(NSString *)v7 objectForKeyedSubscript:self->_keyNameBoardID];
  id v11 = [(NSString *)v4 objectForKeyedSubscript:self->_keyNameBoardID];
  id v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    keyNameBoardID = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = keyNameBoardID;
    __int16 v73 = 2112;
    uint64_t v74 = v10;
    __int16 v75 = 2112;
    v76 = v11;
    _os_log_impl(&dword_21E079000, v12, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
  }
  if (v10 && !v11)
  {
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = v15;
      __int16 v73 = 2112;
      uint64_t v74 = v10;
      BOOL v16 = "%s %@; %@, missing in TSS response";
      BOOL v17 = v14;
      uint32_t v18 = 32;
LABEL_20:
      _os_log_impl(&dword_21E079000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if ([v10 isEqualToNumber:v11])
  {
    v19 = [(NSString *)v7 objectForKeyedSubscript:self->_keyNameChipID];
    uint64_t v20 = [(NSString *)v4 objectForKeyedSubscript:self->_keyNameChipID];
    id v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      keyNameChipID = self->_keyNameChipID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = keyNameChipID;
      __int16 v73 = 2112;
      uint64_t v74 = v19;
      __int16 v75 = 2112;
      v76 = v20;
      _os_log_impl(&dword_21E079000, v21, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v19 && !v20)
    {
      long long v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v24;
        __int16 v73 = 2112;
        uint64_t v74 = v19;
        long long v25 = "%s %@; %@, missing in TSS response";
        v26 = v23;
        uint32_t v27 = 32;
LABEL_31:
        _os_log_impl(&dword_21E079000, v26, OS_LOG_TYPE_INFO, v25, buf, v27);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (([v19 isEqualToNumber:v20] & 1) == 0)
    {
      v40 = self->_log;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_keyNameChipID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v41;
        __int16 v73 = 2112;
        uint64_t v74 = v19;
        __int16 v75 = 2112;
        v76 = v20;
        long long v25 = "%s %@; NOT EQUAL %@ vs %@";
        v26 = v40;
        uint32_t v27 = 42;
        goto LABEL_31;
      }
LABEL_32:
      BOOL v30 = 0;
LABEL_66:

      goto LABEL_67;
    }
    uint64_t v31 = [(NSString *)v7 objectForKeyedSubscript:self->_keyNameECID];
    v32 = [(NSString *)v4 objectForKeyedSubscript:self->_keyNameECID];
    uint64_t v33 = self->_log;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      keyNameECID = self->_keyNameECID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = keyNameECID;
      __int16 v73 = 2112;
      uint64_t v74 = v31;
      __int16 v75 = 2112;
      v76 = v32;
      _os_log_impl(&dword_21E079000, v33, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v31 && !v32)
    {
      v35 = self->_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v36;
        __int16 v73 = 2112;
        uint64_t v74 = v31;
        v37 = "%s %@; %@, missing in TSS response";
        uint64_t v38 = v35;
        uint32_t v39 = 32;
LABEL_42:
        _os_log_impl(&dword_21E079000, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    if (([v31 isEqualToNumber:v32] & 1) == 0)
    {
      v50 = self->_log;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = self->_keyNameECID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v51;
        __int16 v73 = 2112;
        uint64_t v74 = v31;
        __int16 v75 = 2112;
        v76 = v32;
        v37 = "%s %@; NOT EQUAL %@ vs %@";
        uint64_t v38 = v50;
        uint32_t v39 = 42;
        goto LABEL_42;
      }
LABEL_43:
      BOOL v30 = 0;
LABEL_65:

      goto LABEL_66;
    }
    v67 = v32;
    v42 = [(NSString *)v7 objectForKeyedSubscript:self->_keyNameNonce];
    v68 = [(NSString *)v4 objectForKeyedSubscript:self->_keyNameNonce];
    uint64_t v43 = self->_log;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      keyNameNonce = self->_keyNameNonce;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = keyNameNonce;
      __int16 v73 = 2112;
      uint64_t v74 = v42;
      __int16 v75 = 2112;
      v76 = v68;
      _os_log_impl(&dword_21E079000, v43, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v42 && !v68)
    {
      v45 = self->_log;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
LABEL_54:
        BOOL v30 = 0;
LABEL_64:

        v32 = v67;
        goto LABEL_65;
      }
      v46 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = v46;
      __int16 v73 = 2112;
      uint64_t v74 = v42;
      v47 = "%s %@; %@, missing in TSS response";
      v48 = v45;
      uint32_t v49 = 32;
LABEL_53:
      _os_log_impl(&dword_21E079000, v48, OS_LOG_TYPE_INFO, v47, buf, v49);
      goto LABEL_54;
    }
    v66 = v42;
    if (([v42 isEqualToData:v68] & 1) == 0)
    {
      uint64_t v60 = self->_log;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = self->_keyNameNonce;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v61;
        __int16 v73 = 2112;
        uint64_t v74 = v42;
        __int16 v75 = 2112;
        v76 = v68;
        v47 = "%s %@; NOT EQUAL %@ vs %@";
        v48 = v60;
        uint32_t v49 = 42;
        goto LABEL_53;
      }
      BOOL v30 = 0;
LABEL_63:
      v42 = v66;
      goto LABEL_64;
    }
    v52 = [(NSString *)v7 objectForKeyedSubscript:self->_keyNameTicket];
    id v65 = [(NSString *)v4 objectForKeyedSubscript:self->_keyNameTicket];
    v53 = self->_log;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      keyNameTicket = self->_keyNameTicket;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = keyNameTicket;
      __int16 v73 = 2112;
      uint64_t v74 = v52;
      __int16 v75 = 2112;
      v76 = v65;
      _os_log_impl(&dword_21E079000, v53, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (!v52 || v65)
    {
      if (objc_msgSend(v52, "isEqualToNumber:", v65, v65))
      {
        BOOL v30 = 1;
LABEL_62:

        goto LABEL_63;
      }
      v62 = self->_log;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = self->_keyNameTicket;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v63;
        __int16 v73 = 2112;
        uint64_t v74 = v52;
        __int16 v75 = 2112;
        v76 = v65;
        v57 = "%s %@; NOT EQUAL %@ vs %@";
        v58 = v62;
        uint32_t v59 = 42;
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v55 = self->_log;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v56;
        __int16 v73 = 2112;
        uint64_t v74 = v52;
        v57 = "%s %@; %@, missing in TSS response";
        v58 = v55;
        uint32_t v59 = 32;
LABEL_60:
        _os_log_impl(&dword_21E079000, v58, OS_LOG_TYPE_INFO, v57, buf, v59);
      }
    }
    BOOL v30 = 0;
    goto LABEL_62;
  }
  __int16 v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = v29;
    __int16 v73 = 2112;
    uint64_t v74 = v10;
    __int16 v75 = 2112;
    v76 = v11;
    BOOL v16 = "%s %@; NOT EQUAL %@ vs %@";
    BOOL v17 = v28;
    uint32_t v18 = 42;
    goto LABEL_20;
  }
LABEL_21:
  BOOL v30 = 0;
LABEL_67:

  return v30;
}

- (UARPUploaderEndpoint)endpoint
{
  return (UARPUploaderEndpoint *)objc_getProperty(self, a2, 120, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (UARPAssetTag)tagIM4M
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIM4M, 0);
  objc_storeStrong((id *)&self->_tatsuServerURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_keyNameSoCLiveNonce, 0);
  objc_storeStrong((id *)&self->_keyNameSecurityMode, 0);
  objc_storeStrong((id *)&self->_keyNameSecurityDomain, 0);
  objc_storeStrong((id *)&self->_keyNameProductionMode, 0);
  objc_storeStrong((id *)&self->_keyNameNonce, 0);
  objc_storeStrong((id *)&self->_keyNameECID, 0);
  objc_storeStrong((id *)&self->_keyNameChipID, 0);
  objc_storeStrong((id *)&self->_keyNameBoardID, 0);
  objc_storeStrong((id *)&self->_keyNameTicket, 0);
  objc_storeStrong((id *)&self->_keyNameManifest, 0);
  objc_storeStrong((id *)&self->_im4mAsset, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)processDynamicAsset:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21E079000, log, OS_LOG_TYPE_DEBUG, "Personalization Options", buf, 2u);
}

- (void)processTssResponse:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "%s: tatsu response provides no manifest", (uint8_t *)&v1, 0xCu);
}

- (void)processTssResponse:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "%s: could not set payload data to bundle", (uint8_t *)&v1, 0xCu);
}

@end