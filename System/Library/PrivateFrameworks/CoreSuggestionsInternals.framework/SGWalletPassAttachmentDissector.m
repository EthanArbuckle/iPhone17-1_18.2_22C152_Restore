@interface SGWalletPassAttachmentDissector
+ (BOOL)canAddPass:(id)a3;
+ (BOOL)isPassAvailable:(id)a3;
- (id)_enrichmentsForWalletPassDictionary:(id)a3 filePath:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6;
- (id)_extractPassInformation:(id)a3 filePath:(id)a4 state:(int)a5;
- (id)_extractRelevantSemanticTagsFromPass:(id)a3;
- (id)_filteredWalletPassAttachmentsFrom:(id)a3;
- (id)_passDataForFilePath:(id)a3;
- (void)_dissectMessage:(id)a3 entity:(id)a4;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGWalletPassAttachmentDissector

+ (BOOL)isPassAvailable:(id)a3
{
  id v3 = a3;
  if ([getPKPassLibraryClass() isPassLibraryAvailable])
  {
    v4 = [getPKPassLibraryClass() sharedInstance];
    char v5 = [v4 containsPass:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)canAddPass:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getPKAddPassesViewControllerClass_softClass;
  uint64_t v11 = getPKAddPassesViewControllerClass_softClass;
  if (!getPKAddPassesViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPKAddPassesViewControllerClass_block_invoke;
    v7[3] = &unk_1E65C0148;
    v7[4] = &v8;
    __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  LOBYTE(v5) = [v5 canAddPasses];

  return (char)v5;
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGWalletPassAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGWalletPassAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v45 = a4;
  v6 = [v44 attachments];
  v39 = [(SGWalletPassAttachmentDissector *)self _filteredWalletPassAttachmentsFrom:v6];

  v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = [v44 attachments];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v38 count];
    *(_WORD *)&buf[22] = 2048;
    v60 = (void *)[v39 count];
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "%@: Message with %tu attachments (%tu downloaded wallet pass attachments)", buf, 0x20u);
  }
  if ([v39 count])
  {
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v39;
    uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v8) {
      goto LABEL_41;
    }
    uint64_t v48 = *(void *)v51;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1CB79B230]();
        v12 = [v10 path];
        if (v12)
        {
          v13 = [(SGWalletPassAttachmentDissector *)self _passDataForFilePath:v12];
          if (v13)
          {
            uint64_t v54 = 0;
            v55 = &v54;
            uint64_t v56 = 0x2050000000;
            v14 = (void *)getPKPassClass_softClass;
            uint64_t v57 = getPKPassClass_softClass;
            if (!getPKPassClass_softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getPKPassClass_block_invoke;
              v60 = &unk_1E65C0148;
              v61 = &v54;
              __getPKPassClass_block_invoke((uint64_t)buf);
              v14 = (void *)v55[3];
            }
            v15 = v14;
            _Block_object_dispose(&v54, 8);
            id v16 = [v15 alloc];
            id v49 = 0;
            v17 = (void *)[v16 initWithData:v13 error:&v49];
            v18 = v49;
            v19 = v18;
            if (!v17 || v18)
            {
              v26 = sgLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v27 = (objc_class *)objc_opt_class();
                v40 = NSStringFromClass(v27);
                v28 = [v19 localizedDescription];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v28;
                _os_log_error_impl(&dword_1CA650000, v26, OS_LOG_TYPE_ERROR, "%@: Error encountered while initializing Wallet Pass from NSData: %@", buf, 0x16u);
              }
            }
            else
            {
              if ([(id)objc_opt_class() isPassAvailable:v17])
              {
                v20 = sgLogHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  v30 = (objc_class *)objc_opt_class();
                  v41 = NSStringFromClass(v30);
                  v31 = [v17 serialNumber];
                  *(_DWORD *)buf = 138412547;
                  *(void *)&buf[4] = v41;
                  *(_WORD *)&buf[12] = 2113;
                  *(void *)&buf[14] = v31;
                  _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "%@, Wallet Pass with Serial No. %{private}@ exists, setting state duplicate", buf, 0x16u);
                }
                uint64_t v21 = 3;
                goto LABEL_30;
              }
              if ([(id)objc_opt_class() canAddPass:v17])
              {
                uint64_t v21 = 1;
              }
              else
              {
                v20 = sgLogHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  v34 = (objc_class *)objc_opt_class();
                  v43 = NSStringFromClass(v34);
                  v35 = [v17 serialNumber];
                  *(_DWORD *)buf = 138412547;
                  *(void *)&buf[4] = v43;
                  *(_WORD *)&buf[12] = 2113;
                  *(void *)&buf[14] = v35;
                  _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "%@, Cannot add wallet pass with Serial No. %{private}@ exists", buf, 0x16u);
                }
                uint64_t v21 = 1;
LABEL_30:
              }
              v26 = [(SGWalletPassAttachmentDissector *)self _extractPassInformation:v17 filePath:v12 state:v21];
              if (v26)
              {
                v29 = [(SGWalletPassAttachmentDissector *)self _enrichmentsForWalletPassDictionary:v26 filePath:v12 parentMessage:v44 parentEntity:v45];
                if ((unint64_t)[v46 count] <= 9) {
                  [v46 addObjectsFromArray:v29];
                }
              }
              else
              {
                v29 = sgLogHandle();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v32 = (objc_class *)objc_opt_class();
                  uint64_t v33 = NSStringFromClass(v32);
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v33;
                  v42 = (void *)v33;
                  _os_log_error_impl(&dword_1CA650000, v29, OS_LOG_TYPE_ERROR, "%@: Pass dictionary is nil. Skipping further processing of this pass", buf, 0xCu);
                }
              }
            }
          }
          else
          {
            v19 = sgLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v25;
              _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "%@: Attachment is not of type Wallet Pass", buf, 0xCu);
            }
          }

          goto LABEL_39;
        }
        v13 = sgLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v23;
          _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "%@: Path is nil for pass attachment. Skipping this pass", buf, 0xCu);
        }
LABEL_39:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v8)
      {
LABEL_41:

        [v45 addEnrichments:v46];
        break;
      }
    }
  }
}

- (id)_extractPassInformation:(id)a3 filePath:(id)a4 state:(int)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  id v11 = [v8 localizedDescription];
  if ([v11 length])
  {
    v12 = [v8 localizedDescription];
    [v10 setObject:v12 forKeyedSubscript:@"description"];
  }
  else
  {
    [v10 setObject:&stru_1F24EEF20 forKeyedSubscript:@"description"];
  }

  v13 = [v8 localizedName];
  if ([v13 length])
  {
    v14 = [v8 localizedName];
    [v10 setObject:v14 forKeyedSubscript:@"name"];
  }
  else
  {
    [v10 setObject:&stru_1F24EEF20 forKeyedSubscript:@"name"];
  }

  v15 = [v8 serialNumber];
  if ([v15 length])
  {
    id v16 = [v8 serialNumber];
    [v10 setObject:v16 forKeyedSubscript:@"serial"];
  }
  else
  {
    [v10 setObject:&stru_1F24EEF20 forKeyedSubscript:@"serial"];
  }

  v17 = [v8 organizationName];
  if ([v17 length])
  {
    v18 = [v8 organizationName];
    [v10 setObject:v18 forKeyedSubscript:@"organization"];
  }
  else
  {
    [v10 setObject:&stru_1F24EEF20 forKeyedSubscript:@"organization"];
  }

  v19 = [v8 passURL];
  v20 = [v19 absoluteString];
  if ([v20 length])
  {
    uint64_t v21 = [v8 passURL];
    v22 = [v21 absoluteString];
    [v10 setObject:v22 forKeyedSubscript:@"url"];
  }
  else
  {
    [v10 setObject:&stru_1F24EEF20 forKeyedSubscript:@"url"];
  }

  [v10 setObject:v9 forKeyedSubscript:@"filepath"];
  v23 = walletPassStateDescription(a5);
  [v10 setObject:v23 forKeyedSubscript:@"passState"];

  v24 = [v8 localizedName];
  int v25 = [v24 isEqualToString:@"BoardingPass"];

  v26 = [v8 allSemantics];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = [(SGWalletPassAttachmentDissector *)self _extractRelevantSemanticTagsFromPass:v8];
    [v10 setValuesForKeysWithDictionary:v28];
  }
  v29 = [v8 serialNumber];

  if (!v29)
  {
    v31 = sgLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      int v46 = 138412290;
      v47 = v42;
      _os_log_error_impl(&dword_1CA650000, v31, OS_LOG_TYPE_ERROR, "%@: Missing serial number. Skipping wallet pass", (uint8_t *)&v46, 0xCu);
    }
    goto LABEL_29;
  }
  if (v25)
  {
    v30 = getPKPassSemanticDateKeyOriginalDepartureDate();
    v31 = [v10 objectForKeyedSubscript:v30];

    if (!v31)
    {
      v36 = sgLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        id v45 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v45);
        v39 = [v8 localizedDescription];
        int v46 = 138412547;
        v47 = v38;
        __int16 v48 = 2113;
        id v49 = v39;
        v40 = "%@: Ignoring pass without departure date: %{private}@";
        goto LABEL_36;
      }
LABEL_28:

LABEL_29:
      id v43 = 0;
      goto LABEL_32;
    }
    char v32 = [MEMORY[0x1E4F5DAF0] showPastEvents];
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
    [v31 timeIntervalSinceDate:v33];
    double v35 = v34;

    if (v35 < 0.0 && (v32 & 1) == 0)
    {
      v36 = sgLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = [v8 localizedDescription];
        int v46 = 138412547;
        v47 = v38;
        __int16 v48 = 2113;
        id v49 = v39;
        v40 = "%@: Ignoring old pass: %{private}@";
LABEL_36:
        _os_log_debug_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEBUG, v40, (uint8_t *)&v46, 0x16u);

        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  id v43 = v10;
LABEL_32:

  return v43;
}

- (id)_extractRelevantSemanticTagsFromPass:(id)a3
{
  v117[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 allSemantics];

  v6 = getPKPassSemanticStringKeyEventType();
  v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 stringValue];
  id v9 = getPKPassSemanticStringKeyEventType();
  [v4 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = getPKPassSemanticStringKeyEventName();
  id v11 = [v5 objectForKeyedSubscript:v10];
  v12 = [v11 stringValue];
  v13 = getPKPassSemanticStringKeyEventName();
  [v4 setObject:v12 forKeyedSubscript:v13];

  v14 = getPKPassSemanticDateKeyEventStartDate();
  v15 = [v5 objectForKeyedSubscript:v14];
  id v16 = [v15 dateValue];
  v17 = getPKPassSemanticDateKeyEventStartDate();
  [v4 setObject:v16 forKeyedSubscript:v17];

  v18 = getPKPassSemanticDateKeyEventEndDate();
  v19 = [v5 objectForKeyedSubscript:v18];
  v20 = [v19 dateValue];
  uint64_t v21 = getPKPassSemanticDateKeyEventEndDate();
  [v4 setObject:v20 forKeyedSubscript:v21];

  v22 = getPKPassSemanticNumberKeySilenceRequested();
  v23 = [v5 objectForKeyedSubscript:v22];
  v24 = [v23 numberValue];
  int v25 = getPKPassSemanticNumberKeySilenceRequested();
  [v4 setObject:v24 forKeyedSubscript:v25];

  v26 = getPKPassSemanticStringKeyVenueName();
  uint64_t v27 = [v5 objectForKeyedSubscript:v26];
  v28 = [v27 stringValue];
  v29 = getPKPassSemanticStringKeyVenueName();
  [v4 setObject:v28 forKeyedSubscript:v29];

  v30 = getPKPassSemanticStringKeyVenueRoom();
  v31 = [v5 objectForKeyedSubscript:v30];
  char v32 = [v31 stringValue];
  uint64_t v33 = getPKPassSemanticStringKeyVenueRoom();
  [v4 setObject:v32 forKeyedSubscript:v33];

  double v34 = getPKPassSemanticStringKeyVenueEntrance();
  double v35 = [v5 objectForKeyedSubscript:v34];
  v36 = [v35 stringValue];
  v37 = getPKPassSemanticStringKeyVenueEntrance();
  [v4 setObject:v36 forKeyedSubscript:v37];

  v38 = getPKPassSemanticStringKeyVenuePhoneNumber();
  v39 = [v5 objectForKeyedSubscript:v38];
  v40 = [v39 stringValue];
  v41 = getPKPassSemanticStringKeyVenuePhoneNumber();
  [v4 setObject:v40 forKeyedSubscript:v41];

  v42 = getPKPassSemanticLocationKeyVenueLocation();
  id v43 = [v5 objectForKeyedSubscript:v42];
  id v44 = [v43 locationValue];

  if (v44)
  {
    v116[0] = @"lat";
    id v45 = NSNumber;
    [v44 coordinate];
    int v46 = objc_msgSend(v45, "numberWithDouble:");
    v116[1] = @"lon";
    v117[0] = v46;
    v47 = NSNumber;
    [v44 coordinate];
    id v49 = [v47 numberWithDouble:v48];
    v117[1] = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:2];
    long long v51 = getPKPassSemanticLocationKeyVenueLocation();
    [v4 setObject:v50 forKeyedSubscript:v51];
  }
  long long v52 = getPKPassSemanticDateKeyOriginalDepartureDate();
  long long v53 = [v5 objectForKeyedSubscript:v52];
  uint64_t v54 = [v53 dateValue];
  v55 = getPKPassSemanticDateKeyOriginalDepartureDate();
  [v4 setObject:v54 forKeyedSubscript:v55];

  uint64_t v56 = getPKPassSemanticDateKeyOriginalArrivalDate();
  uint64_t v57 = [v5 objectForKeyedSubscript:v56];
  v58 = [v57 dateValue];
  v59 = getPKPassSemanticDateKeyOriginalArrivalDate();
  [v4 setObject:v58 forKeyedSubscript:v59];

  v60 = getPKPassSemanticStringKeyDepartureLocationDescription();
  v61 = [v5 objectForKeyedSubscript:v60];
  uint64_t v62 = [v61 stringValue];
  v63 = getPKPassSemanticStringKeyDepartureLocationDescription();
  [v4 setObject:v62 forKeyedSubscript:v63];

  v64 = getPKPassSemanticLocationKeyDepartureLocation();
  v65 = [v5 objectForKeyedSubscript:v64];
  v66 = [v65 locationValue];

  if (v66)
  {
    v114[0] = @"lat";
    v67 = NSNumber;
    [v66 coordinate];
    v68 = objc_msgSend(v67, "numberWithDouble:");
    v114[1] = @"lon";
    v115[0] = v68;
    v69 = NSNumber;
    [v66 coordinate];
    v71 = [v69 numberWithDouble:v70];
    v115[1] = v71;
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
    v73 = getPKPassSemanticLocationKeyDepartureLocation();
    [v4 setObject:v72 forKeyedSubscript:v73];
  }
  v74 = getPKPassSemanticLocationKeyDestinationLocation();
  v75 = [v5 objectForKeyedSubscript:v74];
  v76 = [v75 locationValue];

  if (v76)
  {
    v112[0] = @"lat";
    v77 = NSNumber;
    [v76 coordinate];
    v78 = objc_msgSend(v77, "numberWithDouble:");
    v112[1] = @"lon";
    v113[0] = v78;
    v79 = NSNumber;
    [v76 coordinate];
    v81 = [v79 numberWithDouble:v80];
    v113[1] = v81;
    v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
    v83 = getPKPassSemanticLocationKeyDestinationLocation();
    [v4 setObject:v82 forKeyedSubscript:v83];
  }
  v84 = getPKPassSemanticStringKeyDestinationLocationDescription();
  v85 = [v5 objectForKeyedSubscript:v84];
  v86 = [v85 stringValue];
  v87 = getPKPassSemanticStringKeyDestinationLocationDescription();
  [v4 setObject:v86 forKeyedSubscript:v87];

  v88 = getPKPassSemanticStringKeyFlightCode();
  v89 = [v5 objectForKeyedSubscript:v88];
  v90 = [v89 stringValue];
  v91 = getPKPassSemanticStringKeyFlightCode();
  [v4 setObject:v90 forKeyedSubscript:v91];

  v92 = getPKPassSemanticNumberKeyFlightNumber();
  v93 = [v5 objectForKeyedSubscript:v92];
  v94 = [v93 numberValue];
  v95 = getPKPassSemanticNumberKeyFlightNumber();
  [v4 setObject:v94 forKeyedSubscript:v95];

  v96 = getPKPassSemanticStringKeyAirlineCode();
  v97 = [v5 objectForKeyedSubscript:v96];
  v98 = [v97 stringValue];
  v99 = getPKPassSemanticStringKeyAirlineCode();
  [v4 setObject:v98 forKeyedSubscript:v99];

  v100 = getPKPassSemanticStringKeyDepartureAirportCode();
  v101 = [v5 objectForKeyedSubscript:v100];
  v102 = [v101 stringValue];
  v103 = getPKPassSemanticStringKeyDepartureAirportCode();
  [v4 setObject:v102 forKeyedSubscript:v103];

  v104 = getPKPassSemanticStringKeyDestinationAirportCode();
  v105 = [v5 objectForKeyedSubscript:v104];
  v106 = [v105 stringValue];
  v107 = getPKPassSemanticStringKeyDestinationAirportCode();
  [v4 setObject:v106 forKeyedSubscript:v107];

  v108 = sgLogHandle();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    int v110 = 138477827;
    v111 = v4;
    _os_log_debug_impl(&dword_1CA650000, v108, OS_LOG_TYPE_DEBUG, "SGWalletPassAttachmentDissector: Extracted relevant semantic tags from pass: %{private}@", (uint8_t *)&v110, 0xCu);
  }

  return v4;
}

- (id)_passDataForFilePath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v14 = 0;
  v6 = [v4 dataWithContentsOfURL:v5 options:1 error:&v14];
  v7 = (__CFString *)v14;

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = &stru_1F24EEF20;
      *(_DWORD *)buf = 138412802;
      id v16 = v12;
      if (v7) {
        v13 = v7;
      }
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to read data for wallet pass: %@ - Error: %@", buf, 0x20u);
    }
  }

  return v6;
}

- (id)_enrichmentsForWalletPassDictionary:(id)a3 filePath:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [v8 objectForKeyedSubscript:@"serial"];
  v12 = [v10 duplicateKey];
  v13 = +[SGDuplicateKey duplicateKeyForWalletPassIdentifier:v11 parentKey:v12];

  id v14 = [SGPipelineEnrichment alloc];
  v15 = [v8 objectForKeyedSubscript:@"description"];
  id v16 = [(SGPipelineEnrichment *)v14 initWithDuplicateKey:v13 title:v15 parent:v10];

  id v32 = 0;
  __int16 v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:1 error:&v32];
  id v18 = v32;
  if (v17)
  {
    uint64_t v19 = [MEMORY[0x1E4F5D9F0] walletPassData:v17];
    if (v19)
    {
      v20 = v19;
      [(SGEntity *)v16 addTag:v19];
    }
    else
    {
      v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138412290;
        double v35 = v31;
        _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "%@: Entity tag is nil for wallet pass data. Skipping this order", buf, 0xCu);
      }
      v20 = 0;
    }
  }
  else
  {
    v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412802;
      double v35 = v22;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2112;
      id v39 = v18;
      _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "%@: Could not load data for file path: %@. Error: %@", buf, 0x20u);
    }
  }

  v24 = [MEMORY[0x1E4F5D9F0] walletPassDictionary:v8];
  if (v24)
  {
    [(SGEntity *)v16 addTag:v24];
    if (v16)
    {
LABEL_11:
      uint64_t v33 = v16;
      int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      goto LABEL_16;
    }
  }
  else
  {
    v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138412290;
      double v35 = v29;
      _os_log_error_impl(&dword_1CA650000, v26, OS_LOG_TYPE_ERROR, "%@: Entity tag is nil for wallet pass dictionary. Skipping this order", buf, 0xCu);
    }
    if (v16) {
      goto LABEL_11;
    }
  }
  int v25 = 0;
LABEL_16:

  return v25;
}

- (id)_filteredWalletPassAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

uint64_t __70__SGWalletPassAttachmentDissector__filteredWalletPassAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWalletPassMimeType])
  {
    uint64_t v3 = [v2 isDownloadedLocally];
  }
  else
  {
    v4 = [v2 path];
    id v5 = [v4 pathExtension];
    if ([v5 isEqualToString:@"pkpass"])
    {
      uint64_t v3 = [v2 isDownloadedLocally];
    }
    else
    {
      v6 = [v2 filename];
      v7 = [v6 pathExtension];
      if ([v7 isEqualToString:@"pkpass"]) {
        uint64_t v3 = [v2 isDownloadedLocally];
      }
      else {
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

@end