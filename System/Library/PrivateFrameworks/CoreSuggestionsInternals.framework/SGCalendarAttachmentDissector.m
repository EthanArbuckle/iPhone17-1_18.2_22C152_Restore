@interface SGCalendarAttachmentDissector
+ (id)baseAttachmentFrom:(id)a3 includingEvents:(id)a4 withRanges:(id)a5;
+ (id)splitAttachment:(id)a3 intoEvents:(id)a4 withTimezones:(id)a5;
+ (int64_t)replaceTzid:(id)a3 inDocument:(id)a4 fromOriginal:(id)a5 withBaseLength:(unint64_t)a6 withEventRange:(_NSRange)a7;
- (BOOL)hasCalendarAccountForOneOf:(id)a3;
- (BOOL)shouldIgnoreEntity:(id)a3;
- (SGCalendarAttachmentDissector)init;
- (SGMEventICSSourceType_)accountTypeFor:(id)a3;
- (id)downloadedCalendarAttachmentsFrom:(id)a3;
- (id)enrichmentsFromData:(id)a3 inDocument:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6;
- (void)_dissectMessage:(id)a3 entity:(id)a4;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGCalendarAttachmentDissector

- (void).cxx_destruct
{
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGCalendarAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGCalendarAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39 = self;
  if (![(SGCalendarAttachmentDissector *)self shouldIgnoreEntity:v7])
  {
    if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents])
    {
      id v8 = [v6 attachments];
      id v9 = [(SGCalendarAttachmentDissector *)self downloadedCalendarAttachmentsFrom:v8];

      v10 = sgLogHandle();
      id v38 = v6;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v35 = [v6 attachments];
        *(_DWORD *)buf = 134218240;
        uint64_t v51 = [v35 count];
        __int16 v52 = 2048;
        uint64_t v53 = [v9 count];
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "Message with %lu attachments (%lu downloaded ics)", buf, 0x16u);

        id v6 = v38;
      }

      if ([v9 count])
      {
        v37 = v7;
        v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        obj = v9;
        uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          v13 = 0;
          v14 = 0;
          v40 = 0;
          uint64_t v42 = *(void *)v46;
          while (1)
          {
            uint64_t v15 = 0;
            v16 = v13;
            do
            {
              if (*(void *)v46 != v42) {
                objc_enumerationMutation(obj);
              }
              v17 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
              v18 = (void *)MEMORY[0x1CB79B230]();
              id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
              v20 = [v17 path];
              id v44 = 0;
              v13 = (void *)[v19 initWithContentsOfFile:v20 options:1 error:&v44];
              id v21 = v44;

              if (v21 || !v13)
              {
                v30 = sgLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = [v17 path];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v51 = (uint64_t)v31;
                  __int16 v52 = 2112;
                  uint64_t v53 = (uint64_t)v21;
                  _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Error when reading attachment at %@:\n%@", buf, 0x16u);
                }
LABEL_25:

LABEL_26:
                goto LABEL_27;
              }
              id v22 = objc_alloc(MEMORY[0x1E4FB7F48]);
              id v43 = 0;
              v23 = (void *)[v22 initWithData:v13 options:0 error:&v43];
              id v21 = v43;

              if (v21 || !v23)
              {
                v30 = sgLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v32 = [v17 path];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v51 = (uint64_t)v32;
                  __int16 v52 = 2112;
                  uint64_t v53 = (uint64_t)v21;
                  _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Error when instantiating ICSDocument for attachment at %@:\n%@", buf, 0x16u);
                }
                v14 = v23;
                goto LABEL_25;
              }
              v24 = [v23 calendar];

              uint64_t v25 = [v24 calscale];
              if (!v25
                || (v26 = (void *)v25,
                    [v24 calscale],
                    v27 = objc_claimAutoreleasedReturnValue(),
                    int v28 = [v27 isEqualToString:@"GREGORIAN"],
                    v27,
                    v26,
                    v28))
              {
                id v6 = v38;
                -[SGCalendarAttachmentDissector enrichmentsFromData:inDocument:parentMessage:parentEntity:](v39, "enrichmentsFromData:inDocument:parentMessage:parentEntity:", v13, v23, v38, v37, v36);
                id v21 = (id)objc_claimAutoreleasedReturnValue();
                if (!v21
                  || (uint64_t v29 = [v36 count], (unint64_t)(objc_msgSend(v21, "count") + v29) >= 0xB))
                {

                  id v9 = obj;

                  v34 = v36;
                  id v7 = v37;
                  goto LABEL_37;
                }
                [v36 addObjectsFromArray:v21];
                v40 = v24;
                v14 = v23;
                goto LABEL_26;
              }
              v40 = v24;
              v14 = v23;
LABEL_27:
              ++v15;
              v16 = v13;
            }
            while (v12 != v15);
            uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
            uint64_t v12 = v33;
            if (!v33) {
              goto LABEL_36;
            }
          }
        }
        v13 = 0;
        v14 = 0;
        v40 = 0;
LABEL_36:
        id v9 = obj;

        v34 = v36;
        id v7 = v37;
        [v37 addEnrichments:v36];
        v24 = v40;
        v23 = v14;
        id v6 = v38;
LABEL_37:
      }
    }
    else
    {
      id v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "Skipping calendar attachment dissector: detectStructuredEvents is OFF", buf, 2u);
      }
    }
  }
}

- (id)enrichmentsFromData:(id)a3 inDocument:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v9 = a4;
  id v60 = a5;
  id v57 = a6;
  v62 = objc_opt_new();
  v58 = objc_opt_new();
  uint64_t v54 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v66 = v9;
  v10 = [v9 calendar];
  id obj = [v10 componentKeys];

  uint64_t v65 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v74;
    uint64_t v56 = *MEMORY[0x1E4F5DEE8];
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v74 != v64) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v73 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1CB79B230]();
      v14 = [v66 calendar];
      uint64_t v15 = [v14 componentForKey:v12];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_40:

      if (v65 == ++v11)
      {
        uint64_t v65 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
        if (v65) {
          goto LABEL_3;
        }
        goto LABEL_42;
      }
    }
    unsigned int v16 = [v15 method];
    if (!v16)
    {
      v17 = [v66 calendar];
      unsigned int v16 = [v17 method];
    }
    if (v16 > 2)
    {
LABEL_39:
      if ((unint64_t)[v62 count] > 0xA)
      {

        id v52 = 0;
        goto LABEL_44;
      }
      goto LABEL_40;
    }
    char v72 = 1;
    v18 = [v66 calendar];
    id v19 = [v15 enrichmentWithParentEntity:v57 withCalendar:v18 withCorrectnessFlag:&v72];

    uint64_t v20 = [v15 uid];
    id v21 = (void *)v20;
    id v22 = &stru_1F24EEF20;
    if (v20) {
      id v22 = (__CFString *)v20;
    }
    v63 = v22;

    if (v19)
    {
      if (([v58 containsObject:v63] & 1) == 0)
      {
        v24 = sgLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "Found event", buf, 2u);
        }

        [v62 addObject:v19];
        [v58 addObject:v63];
        *(void *)buf = 0;
        v69 = buf;
        uint64_t v70 = 0x2020000000;
        char v71 = 0;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __91__SGCalendarAttachmentDissector_enrichmentsFromData_inDocument_parentMessage_parentEntity___block_invoke;
        v67[3] = &unk_1E65B7D78;
        v67[4] = buf;
        objc_msgSend(MEMORY[0x1E4F25550], "sg_usingSharedStoreForReadingOnly:", v67);
        uint64_t v25 = [v19 timeRange];
        v26 = [v25 startTimeZone];
        v27 = [v26 name];
        int v28 = v27;
        if (!v27)
        {
          int v28 = @"floating";
          if (v69[24]) {
            int v28 = 0;
          }
        }
        uint64_t v29 = v28;

        if (v29)
        {
          v30 = [MEMORY[0x1E4F5D9F0] timezoneIdentifier:v29];
          [v19 addTag:v30];
        }
        if (!v72) {
          [v54 setValue:v29 forKey:v63];
        }
        v31 = [v60 accountHandles];
        v32 = [v31 firstObject];

        uint64_t v33 = [getMailAccountClass() activeAccounts];
        v34 = (void *)v33;
        if (v32 && v33)
        {
          v35 = [getMailAccountClass() accountContainingEmailAddress:v32];
          v36 = v35;
          if (v35 && [v35 sourceIsManaged])
          {
            v37 = [MEMORY[0x1E4F5D9F0] managedSourceAccount:@"MCAccountIsManaged"];
            [v19 addTag:v37];
          }
        }
        id v38 = [MEMORY[0x1E4F5D9F0] icsAttachmentData:v55];
        [v19 addTag:v38];

        _Block_object_dispose(buf, 8);
        goto LABEL_37;
      }
      if (![v58 containsObject:v63])
      {
LABEL_37:

        if (v16 == 2)
        {
          v39 = [v60 author];
          v40 = objc_msgSend(v39, "sg_emailAddress");
          v41.var0 = (unint64_t)[(SGCalendarAttachmentDissector *)self accountTypeFor:v40];

          uint64_t v42 = [v60 accountHandles];
          id v43 = [v42 firstObject];
          v44.var0 = (unint64_t)[(SGCalendarAttachmentDissector *)self accountTypeFor:v43];

          long long v45 = objc_opt_new();
          [v45 setSource:v41.var0];
          [v45 setRecipient:v44.var0];
          long long v46 = [v60 accountHandles];
          objc_msgSend(v45, "setAccountSetup:", -[SGCalendarAttachmentDissector hasCalendarAccountForOneOf:](self, "hasCalendarAccountForOneOf:", v46));

          long long v47 = [MEMORY[0x1E4F93728] sharedInstance];
          [v47 trackScalarForMessage:v45];

          id v48 = [NSString alloc];
          v49 = [v45 key];
          v50 = (void *)[v48 initWithFormat:@"%@.%@", v56, v49];

          uint64_t v51 = [v45 dictionaryRepresentation];
          AnalyticsSendEvent();
        }
        goto LABEL_39;
      }
      v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Ignoring event that has the same UID as another event in the same ics attachment.", buf, 2u);
      }
    }
    else
    {
      v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Failed to parse event from ics attachment.", buf, 2u);
      }
    }

    goto LABEL_37;
  }
LABEL_42:

  id v52 = v62;
LABEL_44:

  return v52;
}

void __91__SGCalendarAttachmentDissector_enrichmentsFromData_inDocument_parentMessage_parentEntity___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 defaultCalendarForNewEvents];
  v3 = [v5 source];
  v4 = [v3 title];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 isEqualToString:@"Gmail"];
}

- (SGMEventICSSourceType_)accountTypeFor:(id)a3
{
  id v3 = a3;
  if (([v3 containsString:@"@icloud.com"] & 1) != 0
    || ([v3 containsString:@"@me.com"] & 1) != 0
    || ([v3 containsString:@"@mac.com"] & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E4F5DDB8];
  }
  else if (([v3 containsString:@"@gmail.com"] & 1) != 0 {
         || ([v3 containsString:@"@googlemail.com"] & 1) != 0
  }
         || ([v3 containsString:@"@google.com"] & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E4F5DDB0];
  }
  else if (([v3 containsString:@"@yahoo.com"] & 1) != 0 {
         || ([v3 containsString:@"@yahoo.co.uk"] & 1) != 0
  }
         || ([v3 containsString:@"@ymail.com"] & 1) != 0
         || ([v3 containsString:@"@sbcglobal.net"] & 1) != 0
         || ([v3 containsString:@"@rocketmail.com"] & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E4F5DDD0];
  }
  else if (([v3 containsString:@"@outlook.com"] & 1) != 0 {
         || ([v3 containsString:@"@hotmail.com"] & 1) != 0)
  }
  {
    v4 = (unint64_t *)MEMORY[0x1E4F5DDC0];
  }
  else
  {
    char v7 = [v3 containsString:@"@hotmail.co.uk"];
    v4 = (unint64_t *)MEMORY[0x1E4F5DDC0];
    if ((v7 & 1) == 0 && ![v3 containsString:@"@rocketmaill.com"]) {
      v4 = (unint64_t *)MEMORY[0x1E4F5DDC8];
    }
  }
  v5.var0 = *v4;

  return v5;
}

- (BOOL)hasCalendarAccountForOneOf:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[SGAccountsAdapter hasCalendarAccount:](self->_accountsAdapter, "hasCalendarAccount:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)shouldIgnoreEntity:(id)a3
{
  int v3 = [a3 hasEventEnrichment];
  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "Ignoring attachments because a structured event already found", v6, 2u);
    }
  }
  return v3;
}

- (id)downloadedCalendarAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

uint64_t __67__SGCalendarAttachmentDissector_downloadedCalendarAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCalendarMimeType]) {
    uint64_t v3 = [v2 isDownloadedLocally];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (SGCalendarAttachmentDissector)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGCalendarAttachmentDissector;
  id v2 = [(SGCalendarAttachmentDissector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SGAccountsAdapter sharedInstance];
    accountsAdapter = v2->_accountsAdapter;
    v2->_accountsAdapter = (SGAccountsAdapter *)v3;
  }
  return v2;
}

+ (id)splitAttachment:(id)a3 intoEvents:(id)a4 withTimezones:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v48 = a5;
  id v9 = v7;
  uint64_t v47 = [v9 bytes];
  long long v46 = v9;
  uint64_t v42 = objc_opt_new();
  v10 = [(id)objc_opt_class() baseAttachmentFrom:v9 includingEvents:v8 withRanges:v42];
  uint64_t v45 = [v10 length];
  id v11 = v10;
  [v11 appendBytes:"END:VCALENDAR\n" length:14];
  id v39 = (id)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v8;
  uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v43)
  {
    uint64_t v12 = 0;
    uint64_t v41 = *(void *)v54;
    id v38 = v63;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v13;
        uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v42, "objectForKeyedSubscript:", v14, v38);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v66 count:16];
        uint64_t v17 = v45;
        if (v16)
        {
          uint64_t v18 = v16;
          uint64_t v19 = *(void *)v50;
          uint64_t v17 = v45;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v50 != v19) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = [*(id *)(*((void *)&v49 + 1) + 8 * i) rangeValue];
              uint64_t v23 = v22;
              objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", v17, v12, v47 + v21, v22);
              v24 = [v48 objectForKeyedSubscript:v14];
              if (v24) {
                v17 += objc_msgSend((id)objc_opt_class(), "replaceTzid:inDocument:fromOriginal:withBaseLength:withEventRange:", v24, v11, v46, v17, v21, v23);
              }
              v17 += v23;

              uint64_t v12 = 0;
            }
            uint64_t v18 = [v15 countByEnumeratingWithState:&v49 objects:v66 count:16];
            uint64_t v12 = 0;
          }
          while (v18);
        }
        if (v15 && [v15 count])
        {
          id v25 = v11;
          v26 = objc_opt_new();
          uint64_t v61 = MEMORY[0x1E4F143A8];
          uint64_t v62 = 3221225472;
          v63[0] = __removeAttachments_block_invoke;
          v63[1] = &unk_1E65B6848;
          id v27 = v25;
          id v64 = v27;
          id v28 = v26;
          id v65 = v28;
          _PASEnumerateSimpleLinesInUTF8Data();
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          uint64_t v29 = [v28 reverseObjectEnumerator];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v58;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v58 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = [*(id *)(*((void *)&v57 + 1) + 8 * j) rangeValue];
                objc_msgSend(v27, "replaceBytesInRange:withBytes:length:", v34, v35, "", 0);
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v68 count:16];
            }
            while (v31);
          }

          v36 = (void *)[[NSString alloc] initWithData:v27 encoding:4];
          [v39 addObject:v36];
        }
        uint64_t v12 = v17 - v45;

        uint64_t v13 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v43);
  }

  return v39;
}

+ (int64_t)replaceTzid:(id)a3 inDocument:(id)a4 fromOriginal:(id)a5 withBaseLength:(unint64_t)a6 withEventRange:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  NSUInteger v14 = [v13 bytes] + location;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v14 length:length freeWhenDone:0];
  [v13 length];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v18 = v11;
  id v19 = v12;
  _PASEnumerateSimpleLinesInUTF8Data();
  int64_t v16 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __99__SGCalendarAttachmentDissector_replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange___block_invoke(uint64_t a1, uint64_t a2, size_t a3)
{
  size_t v6 = a2 + a3;
  if (a2 + a3 >= *(void *)(a1 + 56)
    || (result = 0, int v8 = *(unsigned __int8 *)(*(void *)(a1 + 64) + v6), v8 != 9) && v8 != 32)
  {
    uint64_t v9 = 0;
    char v10 = 0;
    do
    {
      int v11 = strlen(replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange__datelines[v9]);
      BOOL v12 = v11 <= (int)a3
         && strncmp((const char *)(*(void *)(a1 + 64) + (int)a2), replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange__datelines[v9], v11) == 0;
      v10 |= v12;
      ++v9;
    }
    while (v9 != 6);
    if ((v10 & 1) == 0) {
      return 1;
    }
    id v13 = strnstr((const char *)(*(void *)(a1 + 64) + a2), "TZID=", a3);
    if (v13)
    {
      NSUInteger v14 = v13;
      id v15 = *(id *)(a1 + 32);
      int64_t v16 = v14 + 5;
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1CB79B230]();
      [@";TZID=" stringByAppendingString:*(void *)(a1 + 32)];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int64_t v16 = strnstr((const char *)(*(void *)(a1 + 64) + a2), ":", a3);
      if (!v16)
      {
LABEL_15:

        return 1;
      }
    }
    id v18 = &v16[-*(void *)(a1 + 64)];
    id v19 = strnstr(v16, ":", v6 - (void)v18);
    if (v19)
    {
      int64_t v20 = v19 - v16;
      uint64_t v21 = &v18[*(void *)(a1 + 72) + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      id v15 = v15;
      uint64_t v22 = (const char *)[v15 UTF8String];
      size_t v23 = strlen(v22);
      objc_msgSend(*(id *)(a1 + 40), "replaceBytesInRange:withBytes:length:", v21, v20, v22, v23);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v23 - v20;
    }
    goto LABEL_15;
  }
  return result;
}

+ (id)baseAttachmentFrom:(id)a3 includingEvents:(id)a4 withRanges:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  [v10 bytes];
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3010000000;
  v19[4] = 0;
  v19[5] = 0;
  v19[3] = "";
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__5293;
  v17[4] = __Block_byref_object_dispose__5294;
  id v18 = 0;
  id v14 = (id)objc_opt_new();
  id v15 = v11;
  id v16 = v9;
  _PASEnumerateSimpleLinesInUTF8Data();
  id v12 = v14;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  return v12;
}

uint64_t __79__SGCalendarAttachmentDissector_baseAttachmentFrom_includingEvents_withRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 104);
  id v7 = (const char *)(v6 + a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) += a3;
  }
  if ((int)a3 >= 6)
  {
    if (strncmp(v7, "BEGIN:", 6uLL)) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void *)(v11 + 24);
    *(void *)(v11 + 24) = v12 + 1;
    if (v12) {
      goto LABEL_11;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = a3;
    if (a3 >= 0xF)
    {
      if (!strncmp(v7 + 6, "VTIMEZONE", 9uLL))
      {
        BOOL v9 = 0;
        int v8 = 0;
        uint64_t v39 = *(void *)(a1 + 72);
        goto LABEL_57;
      }
      if (strncmp(v7 + 6, "VEVENT", 6uLL))
      {
        if (!strncmp(v7 + 6, "VCALENDAR", 9uLL))
        {
          BOOL v9 = 0;
          int v8 = 0;
          --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          goto LABEL_14;
        }
        goto LABEL_11;
      }
    }
    else if (a3 < 0xC || strncmp(v7 + 6, "VEVENT", 6uLL))
    {
      goto LABEL_11;
    }
    BOOL v9 = 0;
    int v8 = 0;
    uint64_t v39 = *(void *)(a1 + 80);
LABEL_57:
    *(unsigned char *)(*(void *)(v39 + 8) + 24) = 1;
    goto LABEL_14;
  }
  if ((int)a3 <= 3)
  {
    int v8 = 0;
    BOOL v9 = 0;
    uint64_t v10 = a1 + 80;
    goto LABEL_22;
  }
LABEL_7:
  if (strncmp(v7, "END:", 4uLL))
  {
LABEL_11:
    BOOL v9 = 0;
    int v8 = 0;
    goto LABEL_14;
  }
  BOOL v9 = a3 >= 0xD && strncmp(v7, "END:VCALENDAR", 0xDuLL) == 0;
  int v8 = 1;
LABEL_14:
  uint64_t v10 = a1 + 80;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && !strncmp(v7, "UID:", 4uLL))
  {
    uint64_t v13 = a2 + v6 - 1;
    uint64_t v14 = MEMORY[0x1E4F14390];
    uint64_t v15 = a3;
    do
    {
      uint64_t v16 = v15;
      unsigned int v17 = *(char *)(v13 + v15);
      if ((v17 & 0x80000000) != 0) {
        int v18 = __maskrune(v17, 0x4000uLL);
      }
      else {
        int v18 = *(_DWORD *)(v14 + 4 * v17 + 60) & 0x4000;
      }
      uint64_t v15 = v16 - 1;
    }
    while (v18);
    uint64_t v19 = [[NSString alloc] initWithBytes:v7 + 4 length:v16 - 4 encoding:4];
    uint64_t v20 = *(void *)(*(void *)(a1 + 88) + 8);
    char v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_22:
  uint64_t v22 = *(void *)(*(void *)(a1 + 96) + 8);
  if (*(unsigned char *)(v22 + 24)) {
    BOOL v23 = 0;
  }
  else {
    BOOL v23 = !v9;
  }
  if (v23)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      [*(id *)(a1 + 32) appendBytes:v7 length:a3];
    }
    char v24 = v8 ^ 1;
    if (!*(unsigned char *)(*(void *)(*(void *)v10 + 8) + 24)) {
      char v24 = 1;
    }
    if ((v24 & 1) == 0 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 88) + 8);
      id v28 = *(__CFString **)(v25 + 40);
      v26 = (id *)(v25 + 40);
      id v27 = v28;
      if (v28) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = &stru_1F24EEF20;
      }
      objc_storeStrong(v26, v29);
      if ([*(id *)(a1 + 40) containsObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)])
      {
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        uint64_t v31 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        uint64_t v32 = v31;
        if (v31)
        {
          [v31 addObject:v30];
        }
        else
        {
          uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v30, 0);
          [*(id *)(a1 + 48) setObject:v33 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        }
      }
      uint64_t v34 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = 0;
    }
    if (v8)
    {
      uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v37 = *(void *)(v36 + 24) - 1;
      *(void *)(v36 + 24) = v37;
      if (!v37)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(unsigned char *)(v22 + 24) = 1;
  }
  return 1;
}

@end