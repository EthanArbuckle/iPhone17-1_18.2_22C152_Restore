@interface KmlDeviceConfigurationData
- (BOOL)sharingPasswordRequired;
- (id)readerSupportedTransports;
- (uint64_t)initWithData:(int)a3 outerTag:;
- (uint64_t)initWithData:(uint64_t)result;
- (uint64_t)isFriendImmoTokenOrSlotOnline;
- (void)parseDeviceConfigData:(int)a3 outerTag:;
- (void)parseKeySharingConfigData:(unsigned char *)a1;
- (void)parseOemSpecificContent:(uint64_t)a1;
- (void)parseReaderBleConfigData:(uint64_t)a1;
- (void)parseSharingInAChainDeviceConfigMailboxSettingData;
- (void)parseSupportedRadiosData:(uint64_t)a1;
@end

@implementation KmlDeviceConfigurationData

- (uint64_t)initWithData:(uint64_t)result
{
  if (result) {
    return -[KmlDeviceConfigurationData initWithData:outerTag:](result, a2, 0);
  }
  return result;
}

- (uint64_t)initWithData:(int)a3 outerTag:
{
  id v5 = a2;
  if (a1)
  {
    v23.receiver = (id)a1;
    v23.super_class = (Class)KmlDeviceConfigurationData;
    v6 = objc_msgSendSuper2(&v23, sel_init);
    a1 = (uint64_t)v6;
    if (v6)
    {
      v6[9] = 1;
      *((unsigned char *)v6 + 29) = 0;
      *((unsigned char *)v6 + 20) = 0;
      v7 = (void *)*((void *)v6 + 4);
      *((void *)v6 + 4) = 0;

      v8 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      v9 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      v10 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      *(_WORD *)(a1 + 21) = 0;
      v11 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      v12 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      v13 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = 0;

      v14 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = 0;

      v15 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;

      v16 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = 0;

      v17 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = 0;

      *(_WORD *)(a1 + 16) = 0;
      *(_DWORD *)(a1 + 23) = 0;
      v18 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;

      v19 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = 0;

      *(_WORD *)(a1 + 27) = 0;
      uint64_t v20 = [MEMORY[0x263EFF980] array];
      v21 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v20;

      -[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:](a1, v5, a3);
    }
  }

  return a1;
}

- (void)parseDeviceConfigData:(int)a3 outerTag:
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    id v46 = v5;
    id v6 = v5;
    if (a3)
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v6);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v8) {
        goto LABEL_13;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(id **)(*((void *)&v51 + 1) + 8 * i);
          if (-[KmlTlv tag]((uint64_t)v12) == 32590)
          {
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:]", 240, @"Found device config data to parse in outer tag", v13, v14, v15, v16, v44);
            uint64_t v17 = -[KmlTlv value](v12);

            id v6 = (id)v17;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v9);
LABEL_13:
    }
    v45 = v6;
    v18 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v6);
    [*(id *)(a1 + 8) removeAllObjects];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (!v20) {
      goto LABEL_52;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
LABEL_16:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v48 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(id **)(*((void *)&v47 + 1) + 8 * v23);
      int v25 = -[KmlTlv tag]((uint64_t)v24);
      if (v25 > 215)
      {
        if (v25 > 32584)
        {
          switch(v25)
          {
            case 32610:
              v38 = -[KmlTlv value](v24);
              -[KmlDeviceConfigurationData parseReaderBleConfigData:](a1, v38);

              *(unsigned char *)(a1 + 29) = 1;
              [*(id *)(a1 + 8) addObject:v24];
              KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:]", 303, @"UWB is disabled for local use, but available for sharing.", v39, v40, v41, v42, (uint64_t)v45);
              break;
            case 32608:
              v30 = -[KmlTlv value](v24);
              -[KmlDeviceConfigurationData parseKeySharingConfigData:]((unsigned char *)a1, v30);
              goto LABEL_50;
            case 32585:
              v30 = -[KmlTlv value](v24);
              -[KmlDeviceConfigurationData parseSupportedRadiosData:](a1, v30);
LABEL_50:

              break;
          }
        }
        else
        {
          switch(v25)
          {
            case 216:
              *(unsigned char *)(a1 + 22) = -[KmlTlv valueAsUnsignedShort]((uint64_t)v24);
              uint64_t v33 = -[KmlTlv asData]((uint64_t)v24);
              v27 = *(void **)(a1 + 120);
              *(void *)(a1 + 120) = v33;
              goto LABEL_43;
            case 217:
              uint64_t v34 = -[KmlTlv value](v24);
              v27 = *(void **)(a1 + 72);
              *(void *)(a1 + 72) = v34;
              goto LABEL_43;
            case 32554:
              v28 = -[KmlTlv value](v24);
              -[KmlDeviceConfigurationData parseOemSpecificContent:](a1, v28);

              uint64_t v29 = -[KmlTlv asData]((uint64_t)v24);
              v27 = *(void **)(a1 + 128);
              *(void *)(a1 + 128) = v29;
              goto LABEL_43;
          }
        }
      }
      else if (v25 > 90)
      {
        switch(v25)
        {
          case 91:
            uint64_t v35 = -[KmlTlv asData]((uint64_t)v24);
            v27 = *(void **)(a1 + 144);
            *(void *)(a1 + 144) = v35;
            goto LABEL_43;
          case 96:
            uint64_t v36 = -[KmlTlv asData]((uint64_t)v24);
            v37 = *(void **)(a1 + 112);
            *(void *)(a1 + 112) = v36;

            -[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData](a1);
            goto LABEL_44;
          case 215:
            *(unsigned char *)(a1 + 21) = -[KmlTlv valueAsUnsignedShort]((uint64_t)v24) == 1;
LABEL_44:
            objc_msgSend(*(id *)(a1 + 8), "addObject:", v24, v45);
            break;
        }
      }
      else
      {
        switch(v25)
        {
          case 'J':
            uint64_t v31 = -[KmlTlv value](v24);
            v27 = *(void **)(a1 + 80);
            *(void *)(a1 + 80) = v31;
            goto LABEL_43;
          case 'K':
            uint64_t v32 = -[KmlTlv value](v24);
            v27 = *(void **)(a1 + 88);
            *(void *)(a1 + 88) = v32;
            goto LABEL_43;
          case 'T':
            uint64_t v26 = -[KmlTlv asData]((uint64_t)v24);
            v27 = *(void **)(a1 + 152);
            *(void *)(a1 + 152) = v26;
LABEL_43:

            goto LABEL_44;
        }
      }
      if (v21 == ++v23)
      {
        uint64_t v43 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
        uint64_t v21 = v43;
        if (!v43)
        {
LABEL_52:

          id v5 = v46;
          break;
        }
        goto LABEL_16;
      }
    }
  }
}

- (uint64_t)isFriendImmoTokenOrSlotOnline
{
  if (result)
  {
    unsigned int v1 = *(unsigned __int8 *)(result + 23);
    BOOL v2 = v1 > 5;
    unsigned int v3 = (0x3Au >> v1) & 1;
    if (v2) {
      return 0;
    }
    else {
      return v3;
    }
  }
  return result;
}

- (id)readerSupportedTransports
{
  if (a1)
  {
    BOOL v2 = [MEMORY[0x263EFF980] array];
    unsigned int v3 = v2;
    if (*(unsigned char *)(a1 + 19)) {
      [v2 addObject:&unk_26C5BD600];
    }
    if (*(unsigned char *)(a1 + 18)) {
      [v3 addObject:&unk_26C5BD618];
    }
    if (![v3 count]) {
      [v3 addObject:&unk_26C5BD630];
    }
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (void)parseSupportedRadiosData:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  *(_WORD *)(a1 + 18) = 0;
  *(unsigned char *)(a1 + 29) = 0;
  *(unsigned char *)(a1 + 20) = 0;
  v4 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  id v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;

  id v6 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;

  id v7 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  uint64_t v8 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v3);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(id **)(*((void *)&v18 + 1) + 8 * i);
      int v15 = -[KmlTlv tag]((uint64_t)v14);
      if (v15 <= 32591)
      {
        if (v15 != 24400)
        {
          if (v15 != 24401) {
            continue;
          }
LABEL_14:
          char v11 = 1;
          *(unsigned char *)(a1 + 19) = 1;
          *(unsigned char *)(a1 + 29) = 0;
          continue;
        }
LABEL_15:
        char v11 = 1;
        *(unsigned char *)(a1 + 18) = 1;
        continue;
      }
      switch(v15)
      {
        case 32594:
          uint64_t v16 = -[KmlTlv value](v14);
          -[KmlDeviceConfigurationData parseReaderBleConfigData:](a1, v16);

          char v11 = 1;
          break;
        case 32593:
          goto LABEL_14;
        case 32592:
          goto LABEL_15;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v10);
  if (v11)
  {
    char v17 = 1;
    goto LABEL_22;
  }
LABEL_21:
  char v17 = 0;
  *(unsigned char *)(a1 + 18) = 1;
LABEL_22:
  *(unsigned char *)(a1 + 16) = v17;

LABEL_23:
}

- (void)parseKeySharingConfigData:(unsigned char *)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    a1[17] = 1;
    id v3 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, a2);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          int v9 = -[KmlTlv tag]((uint64_t)v8);
          switch(v9)
          {
            case 218:
              a1[23] = -[KmlTlv valueAsUnsignedShort]((uint64_t)v8);
              break;
            case 219:
              a1[24] = 1;
              break;
            case 220:
              a1[25] = 1;
              break;
            case 221:
              unsigned int v10 = -[KmlTlv valueAsUnsignedChar](v8);
              if (v10 >= 0x10) {
                char v11 = 16;
              }
              else {
                char v11 = v10;
              }
              a1[26] = v11;
              break;
            case 222:
              a1[27] = 1;
              break;
            default:
              if (v9 == 192) {
                a1[28] = 1;
              }
              break;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)parseOemSpecificContent:(uint64_t)a1
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v78 = a1;
  if (!a1) {
    goto LABEL_50;
  }
  uint64_t v4 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v3);
  uint64_t v5 = [@"AAPL" dataUsingEncoding:4];
  v85 = [@"DFLT" dataUsingEncoding:4];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 493, @"Looking for %@, or back up %@", v6, v7, v8, v9, (uint64_t)v5);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v97 objects:v103 count:16];
  if (!v11)
  {
    id v82 = 0;
    v65 = v10;
LABEL_48:

    goto LABEL_49;
  }
  uint64_t v12 = v11;
  id v77 = v3;
  id v82 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v98;
  long long v15 = "-[KmlDeviceConfigurationData parseOemSpecificContent:]";
  uint64_t v79 = *(void *)v98;
  id v80 = v10;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v81 = v12;
    do
    {
      uint64_t v17 = v13;
      if (*(void *)v98 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v83 = v16;
      long long v18 = *(id **)(*((void *)&v97 + 1) + 8 * v16);
      unsigned int v19 = -[KmlTlv tag]((uint64_t)v18);
      v73 = -[KmlTlv value](v18);
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 495, @"TLV: %02x : %@", v20, v21, v22, v23, v19);

      if (-[KmlTlv tag]((uint64_t)v18) != 97)
      {
        uint64_t v13 = v17;
        uint64_t v55 = v83;
        goto LABEL_41;
      }
      v24 = -[KmlTlv value](v18);
      int v25 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v24);

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v93 objects:v102 count:16];
      v84 = v26;
      if (v27)
      {
        uint64_t v28 = v27;
        char v86 = 0;
        v87 = 0;
        uint64_t v88 = *(void *)v94;
        uint64_t v29 = v17;
        v30 = v26;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v94 != v88) {
              objc_enumerationMutation(v30);
            }
            uint64_t v32 = *(id **)(*((void *)&v93 + 1) + 8 * i);
            unsigned int v33 = -[KmlTlv tag]((uint64_t)v32);
            v74 = -[KmlTlv value](v32);
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 500, @"TLV: %02x : %@", v34, v35, v36, v37, v33);

            if (-[KmlTlv tag]((uint64_t)v32) == 64)
            {
              v38 = -[KmlTlv value](v32);
              char v39 = [v5 isEqualToData:v38];

              if (v39)
              {
                char v86 = 1;
              }
              else
              {
                long long v51 = -[KmlTlv value](v32);
                int v52 = [v85 isEqualToData:v51];

                uint64_t v29 = v52 | v29;
              }
            }
            else if (-[KmlTlv tag]((uint64_t)v32) == 49)
            {
              uint64_t v40 = -[KmlTlv value](v32);
              uint64_t v41 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v40);

              long long v91 = 0u;
              long long v92 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              id v42 = v41;
              uint64_t v43 = [v42 countByEnumeratingWithState:&v89 objects:v101 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v45 = v29;
                id v46 = v15;
                long long v47 = v5;
                uint64_t v48 = *(void *)v90;
                while (2)
                {
                  for (uint64_t j = 0; j != v44; ++j)
                  {
                    if (*(void *)v90 != v48) {
                      objc_enumerationMutation(v42);
                    }
                    long long v50 = *(id **)(*((void *)&v89 + 1) + 8 * j);
                    if (-[KmlTlv tag]((uint64_t)v50) == 80)
                    {
                      uint64_t v53 = -[KmlTlv value](v50);

                      v87 = (void *)v53;
                      goto LABEL_28;
                    }
                  }
                  uint64_t v44 = [v42 countByEnumeratingWithState:&v89 objects:v101 count:16];
                  if (v44) {
                    continue;
                  }
                  break;
                }
LABEL_28:
                uint64_t v5 = v47;
                long long v15 = v46;
                uint64_t v29 = v45;
                v30 = v84;
              }
            }
          }
          uint64_t v28 = [v30 countByEnumeratingWithState:&v93 objects:v102 count:16];
        }
        while (v28);

        if (v86)
        {
          v76 = kmlUtilHexStringFromData(v87);
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 519, @"Found oem specific data for %@ : (%@)", v66, v67, v68, v69, @"AAPL");

          v70 = *(void **)(v78 + 136);
          *(void *)(v78 + 136) = v87;
          id v71 = v87;

          id v10 = v80;
          v65 = v80;
          goto LABEL_46;
        }
        id v10 = v80;
        id v54 = v87;
        if ((v29 & 1) == 0)
        {
          uint64_t v13 = 0;
          uint64_t v14 = v79;
          uint64_t v12 = v81;
          goto LABEL_40;
        }
        uint64_t v14 = v79;
        uint64_t v12 = v81;
      }
      else
      {

        id v54 = 0;
        if ((v17 & 1) == 0)
        {
          uint64_t v13 = 0;
          goto LABEL_40;
        }
      }
      v75 = kmlUtilHexStringFromData(v54);
      uint64_t v13 = 1;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 523, @"Found default product plan data for %@ : (%@)", v56, v57, v58, v59, @"DFLT");

      id v54 = v54;
      id v82 = v54;
LABEL_40:
      uint64_t v55 = v83;

LABEL_41:
      uint64_t v16 = v55 + 1;
    }
    while (v16 != v12);
    uint64_t v12 = [v10 countByEnumeratingWithState:&v97 objects:v103 count:16];
    if (v12) {
      continue;
    }
    break;
  }

  if (v13)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 530, @"Only found default product plan data, so using it", v60, v61, v62, v63, v72);
    id v64 = v82;
    v65 = *(void **)(v78 + 136);
    id v82 = v64;
    *(void *)(v78 + 136) = v64;
LABEL_46:
    id v3 = v77;
    goto LABEL_48;
  }
  id v3 = v77;
LABEL_49:

LABEL_50:
}

- (void)parseSharingInAChainDeviceConfigMailboxSettingData
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a1)
  {
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, *(void **)(a1 + 112));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = (void *)[v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(id **)(*((void *)&v26 + 1) + 8 * i);
          if (-[KmlTlv tag]((uint64_t)v6) == 96)
          {
            id v3 = -[KmlTlv value](v6);
            goto LABEL_12;
          }
        }
        id v3 = (void *)[v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (![v3 length]) {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData]", 585, @"No override found", v7, v8, v9, v10, v21);
    }
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData]", 588, @"SharingInAChain override %@", v7, v8, v9, v10, (uint64_t)v3);
    uint64_t v11 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v3);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(id **)(*((void *)&v22 + 1) + 8 * j);
          if (-[KmlTlv tag]((uint64_t)v16) == 74)
          {
            uint64_t v17 = -[KmlTlv value](v16);
            long long v18 = *(void **)(a1 + 96);
            *(void *)(a1 + 96) = v17;
          }
          if (-[KmlTlv tag]((uint64_t)v16) == 75)
          {
            uint64_t v19 = -[KmlTlv value](v16);
            uint64_t v20 = *(void **)(a1 + 104);
            *(void *)(a1 + 104) = v19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v13);
    }
  }
}

- (void)parseReaderBleConfigData:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v3 = +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, a2);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(id **)(*((void *)&v15 + 1) + 8 * i);
          switch(-[KmlTlv tag]((uint64_t)v8))
          {
            case 0xD0u:
              uint64_t v9 = -[KmlTlv value](v8);
              uint64_t v10 = *(void **)(a1 + 32);
              *(void *)(a1 + 32) = v9;
              goto LABEL_14;
            case 0xD1u:
              uint64_t v12 = -[KmlTlv value](v8);
              uint64_t v10 = *(void **)(a1 + 40);
              *(void *)(a1 + 40) = v12;
              goto LABEL_14;
            case 0xD2u:
              *(unsigned char *)(a1 + 20) = 1;
              continue;
            case 0xD3u:
              uint64_t v13 = -[KmlTlv value](v8);
              uint64_t v10 = *(void **)(a1 + 48);
              *(void *)(a1 + 48) = v13;
              goto LABEL_14;
            case 0xD4u:
              uint64_t v11 = -[KmlTlv value](v8);
              uint64_t v10 = *(void **)(a1 + 56);
              *(void *)(a1 + 56) = v11;
              goto LABEL_14;
            case 0xD5u:
              uint64_t v14 = -[KmlTlv value](v8);
              uint64_t v10 = *(void **)(a1 + 64);
              *(void *)(a1 + 64) = v14;
LABEL_14:

              break;
            default:
              continue;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)sharingPasswordRequired
{
  if (result) {
    return *(unsigned char *)(result + 21) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_mfiPPID, 0);
  objc_storeStrong((id *)&self->_oemSpecificContentAsData, 0);
  objc_storeStrong((id *)&self->_sharingPasswordLengthAsData, 0);
  objc_storeStrong((id *)&self->_additionalMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3PrivateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3ConfMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_privateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_confMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_supportedKeyProfiles, 0);
  objc_storeStrong((id *)&self->_onlineBleOOBMasterKeyOverride, 0);
  objc_storeStrong((id *)&self->_deviceBtIntroKey, 0);
  objc_storeStrong((id *)&self->_deviceBtOOBKey, 0);
  objc_storeStrong((id *)&self->_readerBtIdAddress, 0);
  objc_storeStrong((id *)&self->_readerBtIRK, 0);

  objc_storeStrong((id *)&self->_remainingTlvs, 0);
}

@end