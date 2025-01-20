@interface SGReverseTemplatesJSDataDetectors
- (SGReverseTemplatesJSDataDetectors)init;
- (id)_result:(__DDResult *)a3 containsTypes:(id)a4;
- (id)runDataDetectors:(id)a3 locale:(id)a4 epoch:(double)a5 metadataForTypes:(id)a6;
- (void)_result:(__DDResult *)a3 containsTypes:(id)a4 foundTypes:(id)a5;
- (void)dealloc;
@end

@implementation SGReverseTemplatesJSDataDetectors

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noTimeFormatter, 0);
  objc_storeStrong((id *)&self->_naiveDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_scanners, 0);
}

- (void)_result:(__DDResult *)a3 containsTypes:(id)a4 foundTypes:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v15, (void)v19) & 1) == 0)
          {
            if (DDResultHasType())
            {
              [v9 addObject:v15];
            }
            else
            {
              CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
              if (SubResults)
              {
                CFArrayRef v17 = SubResults;
                if (CFArrayGetCount(SubResults) >= 1)
                {
                  for (unint64_t j = 0; j < CFArrayGetCount(v17); ++j)
                    [(SGReverseTemplatesJSDataDetectors *)self _result:CFArrayGetValueAtIndex(v17, j) containsTypes:v10 foundTypes:v9];
                }
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (id)_result:(__DDResult *)a3 containsTypes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 count])
  {
    v7 = objc_opt_new();
    id v8 = objc_opt_new();
    [(SGReverseTemplatesJSDataDetectors *)self _result:a3 containsTypes:v6 foundTypes:v8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "containsObject:", v14, (void)v18));
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    v16 = (void *)[v7 copy];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)runDataDetectors:(id)a3 locale:(id)a4 epoch:(double)a5 metadataForTypes:(id)a6
{
  buf[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:a5];
  uint64_t v15 = objc_opt_new();
  if (!v11 || (uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v11]) == 0)
  {
    uint64_t v24 = v14;
    long long v21 = (void *)[[NSString alloc] initWithFormat:@"No locale found for: %@", v11];
    long long v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v21;
      _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)buf, 0xCu);
    }
    id v17 = 0;
    goto LABEL_11;
  }
  id v17 = (id)v16;
  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v24 = v14;
  long long v18 = objc_opt_new();
  [v15 setObject:v18 forKeyedSubscript:@"extractions"];
  long long v19 = [(NSMutableDictionary *)self->_scanners objectForKeyedSubscript:v17];
  uint64_t v20 = [v19 pointerValue];

  if (v20)
  {
    long long v21 = 0;
LABEL_10:
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__SGReverseTemplatesJSDataDetectors_runDataDetectors_locale_epoch_metadataForTypes___block_invoke;
    v25[3] = &unk_1E65BB310;
    id v26 = v13;
    id v27 = v24;
    id v17 = v17;
    id v28 = v17;
    v29 = self;
    id v30 = v12;
    long long v18 = v18;
    v31 = v18;
    SGDataDetectorsScan(v20, v26, 0, v25);

    goto LABEL_11;
  }
  buf[0] = 0;
  uint64_t v20 = DDScannerCreateWithLocale();
  long long v21 = 0;
  long long v22 = [MEMORY[0x1E4F29238] valueWithPointer:v20];
  [(NSMutableDictionary *)self->_scanners setObject:v22 forKeyedSubscript:v17];

  if (v20) {
    goto LABEL_10;
  }
LABEL_11:

  if (v21)
  {
    [v15 setObject:v21 forKeyedSubscript:@"error"];
  }
  uint64_t v14 = v24;
LABEL_14:

  return v15;
}

uint64_t __84__SGReverseTemplatesJSDataDetectors_runDataDetectors_locale_epoch_metadataForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v65[8] = *MEMORY[0x1E4F143B8];
  uint64_t RangeForURLification = DDResultGetRangeForURLification();
  uint64_t v6 = v5;
  uint64_t Type = SGDataDetectorsGetType();
  id v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", RangeForURLification, v6);
  if (Type)
  {
    id v10 = (void *)MEMORY[0x1CB79B230]();
    v50 = objc_opt_new();
    addAddressResultsToComponents(a2, v50);
    if (Type != 8)
    {
      if (Type != 32)
      {
        v44 = v10;
        v64[0] = @"type";
        id v26 = @"NSTextCheckingTypeTransitInformation";
        id v27 = @"NSTextCheckingTypePhoneNumber";
        if (Type != 2048) {
          id v27 = 0;
        }
        if (Type != 4096) {
          id v26 = v27;
        }
        uint64_t v15 = &stru_1F24EEF20;
        uint64_t v16 = &stru_1F24EEF20;
        id v12 = &stru_1F24EEF20;
        id v13 = 0;
        if (Type == 16) {
          uint64_t v14 = @"NSTextCheckingTypeAddress";
        }
        else {
          uint64_t v14 = v26;
        }
        goto LABEL_35;
      }
      uint64_t v11 = DDResultCopyExtractedURL();
      if (v11)
      {
        id v12 = (__CFString *)v11;
        v44 = v10;
        id v13 = 0;
        v64[0] = @"type";
        uint64_t v14 = @"NSTextCheckingTypeLink";
        uint64_t v15 = &stru_1F24EEF20;
        uint64_t v16 = &stru_1F24EEF20;
LABEL_35:
        v33 = v14;
        v65[0] = v33;
        v64[1] = @"ddType";
        v34 = (void *)[(id)DDResultGetType() copy];
        v65[1] = v34;
        v65[2] = v9;
        v47 = v9;
        v49 = v15;
        v64[2] = @"text";
        v64[3] = @"iso8601";
        v65[3] = v15;
        v65[4] = v16;
        v64[4] = @"endIso8601";
        v64[5] = @"components";
        v65[5] = v50;
        v65[6] = v12;
        v64[6] = @"url";
        v64[7] = @"range";
        v62[0] = @"start";
        v35 = [NSNumber numberWithUnsignedInteger:RangeForURLification];
        v62[1] = @"end";
        v63[0] = v35;
        v36 = [NSNumber numberWithUnsignedInteger:RangeForURLification + v6];
        v63[1] = v36;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
        v65[7] = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:8];

        if (v13)
        {
          v39 = (void *)[v38 mutableCopy];
          [v39 setObject:v13 forKeyedSubscript:@"metadata"];
          uint64_t v40 = [v39 copy];

          v38 = (void *)v40;
        }
        [*(id *)(a1 + 72) addObject:v38];

        id v9 = v47;
        goto LABEL_39;
      }
      id v13 = 0;
      uint64_t v16 = &stru_1F24EEF20;
      goto LABEL_38;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    buf[0] = 0;
    if ((DDResultHasType() & 1) != 0 || DDResultHasType())
    {
      uint64_t v20 = v10;
      CFTimeZoneRef v21 = CFTimeZoneCreateWithTimeIntervalFromGMT(0, 0.0);
      id v54 = 0;
      id v55 = 0;
      id v52 = 0;
      id v53 = 0;
      CFTimeZoneRef v43 = v21;
      SGDataDetectorsGetIntervalDatesAndTimeZoneWithLocale(a2, v19, &v55, &v54, &v53, &v52, v18, buf);
      id v22 = v55;
      id v23 = v54;
      id v24 = v53;
      id v45 = v52;
      if (v21) {
        CFRelease(v21);
      }
      id v10 = v20;
      id v25 = v24;
    }
    else
    {
      id v51 = 0;
      SGDataDetectorsGetDateAndTimeZoneWithLocale(a2, v19, v18, &v51, buf);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = v51;
      id v25 = 0;
      id v45 = 0;
    }
    v46 = v23;
    if (buf[0])
    {
      uint64_t v28 = a1 + 56;
      uint64_t v48 = [*(id *)(*(void *)(a1 + 56) + 32) stringFromDate:v22];
      if (v25)
      {
        uint64_t v29 = 32;
LABEL_31:
        v31 = v22;
        objc_msgSend(*(id *)(*(void *)v28 + v29), "stringFromDate:", v25, v43, v45, v46);
        v32 = v25;
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v28 = a1 + 56;
      uint64_t v30 = *(void *)(a1 + 56);
      if (v23)
      {
        [*(id *)(v30 + 16) setTimeZone:v23];
        uint64_t v48 = [*(id *)(*(void *)v28 + 16) stringFromDate:v22];
        if (v25)
        {
          uint64_t v29 = 16;
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v48 = [*(id *)(v30 + 24) stringFromDate:v22];
        if (v25)
        {
          uint64_t v29 = 24;
          goto LABEL_31;
        }
      }
    }
    v31 = v22;
    v32 = v25;
    uint64_t v16 = &stru_1F24EEF20;
LABEL_33:
    id v13 = objc_msgSend(*(id *)(a1 + 56), "_result:containsTypes:", a2, *(void *)(a1 + 64), v43);

    if (v48)
    {
      v44 = v10;
      v64[0] = @"type";
      uint64_t v14 = @"NSTextCheckingTypeDate";
      id v12 = &stru_1F24EEF20;
      uint64_t v15 = (__CFString *)v48;
      goto LABEL_35;
    }
LABEL_38:

    goto LABEL_39;
  }
  id v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    int Category = DDResultGetCategory();
    __int16 v58 = 2112;
    id v59 = (id)DDResultGetType();
    __int16 v60 = 2112;
    v61 = v9;
    id v42 = v59;
    _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "No extraction for %d:%@ = %@", buf, 0x1Cu);
  }
LABEL_39:

  return 1;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_scanners allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CFRelease((CFTypeRef)[*(id *)(*((void *)&v9 + 1) + 8 * v7++) pointerValue]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SGReverseTemplatesJSDataDetectors;
  [(SGReverseTemplatesJSDataDetectors *)&v8 dealloc];
}

- (SGReverseTemplatesJSDataDetectors)init
{
  v16.receiver = self;
  v16.super_class = (Class)SGReverseTemplatesJSDataDetectors;
  v2 = [(SGReverseTemplatesJSDataDetectors *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    scanners = v2->_scanners;
    v2->_scanners = (NSMutableDictionary *)v3;

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    objc_super v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v9 = objc_opt_new();
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = (NSDateFormatter *)v9;

    [(NSDateFormatter *)v2->_dateFormatter setLocale:v5];
    [(NSDateFormatter *)v2->_dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"];
    [(NSDateFormatter *)v2->_dateFormatter setCalendar:v8];
    uint64_t v11 = objc_opt_new();
    naiveDateFormatter = v2->_naiveDateFormatter;
    v2->_naiveDateFormatter = (NSDateFormatter *)v11;

    [(NSDateFormatter *)v2->_naiveDateFormatter setLocale:v5];
    [(NSDateFormatter *)v2->_naiveDateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss"];
    [(NSDateFormatter *)v2->_naiveDateFormatter setTimeZone:v6];
    [(NSDateFormatter *)v2->_naiveDateFormatter setCalendar:v8];
    uint64_t v13 = objc_opt_new();
    noTimeFormatter = v2->_noTimeFormatter;
    v2->_noTimeFormatter = (NSDateFormatter *)v13;

    [(NSDateFormatter *)v2->_noTimeFormatter setLocale:v5];
    [(NSDateFormatter *)v2->_noTimeFormatter setDateFormat:@"yyyy'-'MM'-'dd"];
    [(NSDateFormatter *)v2->_noTimeFormatter setTimeZone:v6];
    [(NSDateFormatter *)v2->_noTimeFormatter setCalendar:v8];
    DDForce24HrsFormatProcessWideForExtraction();
  }
  return v2;
}

@end