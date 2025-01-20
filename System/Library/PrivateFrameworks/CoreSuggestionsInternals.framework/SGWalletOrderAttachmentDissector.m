@interface SGWalletOrderAttachmentDissector
- (BOOL)orderAttachmentsCompletelyDownloaded:(id)a3;
- (BOOL)shouldIgnoreEntity:(id)a3;
- (id)_downloadWalletOrderAttachmentsFrom:(id)a3;
- (id)_enrichmentsForWalletOrderDictionary:(id)a3 orderData:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6;
- (void)_dissectMessage:(id)a3 entity:(id)a4;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGWalletOrderAttachmentDissector

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGWalletOrderAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGWalletOrderAttachmentDissector *)self _dissectMessage:v11 entity:v8];
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v6 = a4;
  v49 = self;
  if (![(SGWalletOrderAttachmentDissector *)self shouldIgnoreEntity:v6])
  {
    v46 = v6;
    v7 = [v47 attachments];
    BOOL v8 = [(SGWalletOrderAttachmentDissector *)self orderAttachmentsCompletelyDownloaded:v7];

    if (v8)
    {
      id v9 = [v47 attachments];
      id obj = [(SGWalletOrderAttachmentDissector *)v49 _downloadWalletOrderAttachmentsFrom:v9];

      v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = [v47 attachments];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v44 count];
        *(_WORD *)&buf[22] = 2048;
        v65 = (void *)[obj count];
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "%@: Message with %tu attachments (%tu downloaded wallet orders)", buf, 0x20u);
      }
      if ([obj count])
      {
        id v11 = [v46 tags];
        v12 = [MEMORY[0x1E4F5D9F0] requiresDeferredDissection];
        int v13 = [v11 containsObject:v12];

        if (v13)
        {
          v14 = [MEMORY[0x1E4F5D9F0] requiresDeferredDissection];
          [v46 removeTag:v14];
        }
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id obj = obj;
        uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v15)
        {
          uint64_t v51 = *(void *)v54;
          *(void *)&long long v16 = 138412290;
          long long v45 = v16;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v54 != v51) {
                objc_enumerationMutation(obj);
              }
              v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v19 = (void *)MEMORY[0x1CB79B230]();
              v20 = [v18 path];
              if (v20)
              {
                v21 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v20];
                uint64_t v57 = 0;
                v58 = &v57;
                uint64_t v59 = 0x2050000000;
                v22 = (void *)getFKSuggestionsWalletOrderAttachmentClass_softClass;
                uint64_t v60 = getFKSuggestionsWalletOrderAttachmentClass_softClass;
                if (!getFKSuggestionsWalletOrderAttachmentClass_softClass)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getFKSuggestionsWalletOrderAttachmentClass_block_invoke;
                  v65 = &unk_1E65C0148;
                  v66 = &v57;
                  __getFKSuggestionsWalletOrderAttachmentClass_block_invoke((uint64_t)buf);
                  v22 = (void *)v58[3];
                }
                id v23 = v22;
                _Block_object_dispose(&v57, 8);
                id v52 = 0;
                v24 = [v23 readContentsOfOrderAtURL:v21 error:&v52];
                id v25 = v52;
                if (v25)
                {
                  v26 = sgLogHandle();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    v27 = (objc_class *)objc_opt_class();
                    v28 = NSStringFromClass(v27);
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = v28;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v25;
                    _os_log_error_impl(&dword_1CA650000, v26, OS_LOG_TYPE_ERROR, "%@: Unable to parse file owing to this error: %@", buf, 0x16u);
                  }
                }
                else
                {
                  unint64_t v31 = [v24 orderState];
                  if (v31 < 3) {
                    int v32 = v31 + 1;
                  }
                  else {
                    int v32 = 0;
                  }
                  v61[0] = @"serial";
                  v33 = objc_msgSend(v24, "fullyQualifiedOrderIdentifier", v45);
                  v62[0] = v33;
                  v61[1] = @"orderState";
                  v34 = walletOrderStateDescription(v32);
                  v61[2] = @"filePath";
                  v62[1] = v34;
                  v62[2] = v20;
                  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];

                  uint64_t v35 = [v24 data];
                  v36 = (void *)v35;
                  if (v26 && v35)
                  {
                    v37 = [(SGWalletOrderAttachmentDissector *)v49 _enrichmentsForWalletOrderDictionary:v26 orderData:v35 parentMessage:v47 parentEntity:v46];
                    if ((unint64_t)[v48 count] <= 9) {
                      [v48 addObjectsFromArray:v37];
                    }
                  }
                }
              }
              else
              {
                v21 = sgLogHandle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  v29 = (objc_class *)objc_opt_class();
                  v30 = NSStringFromClass(v29);
                  *(_DWORD *)buf = v45;
                  *(void *)&buf[4] = v30;
                  _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "%@: Path is nil for wallet order attachment. Skipping this order", buf, 0xCu);
                }
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v15);
        }

        [v46 addEnrichments:v48];
      }
    }
    else
    {
      v38 = sgLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = [v47 attachments];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v41 count];
        _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "%@: Message with %tu attachments are incompletely downloaded. Marking this entity as requiring dissection)", buf, 0x16u);
      }
      id obj = [MEMORY[0x1E4F5D9F0] requiresDeferredDissection];
      [v46 addTag:obj];
    }

    id v6 = v46;
  }
}

- (id)_enrichmentsForWalletOrderDictionary:(id)a3 orderData:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"serial"];
  v12 = [v8 duplicateKey];
  int v13 = +[SGDuplicateKey duplicateKeyForWalletOrderIdentifier:v11 parentKey:v12];

  v14 = [SGPipelineEnrichment alloc];
  uint64_t v15 = [v10 objectForKeyedSubscript:@"serial"];
  long long v16 = [(SGPipelineEnrichment *)v14 initWithDuplicateKey:v13 title:v15 parent:v8];

  v17 = [MEMORY[0x1E4F5D9F0] walletOrderData:v9];

  [(SGEntity *)v16 addTag:v17];
  v18 = [MEMORY[0x1E4F5D9F0] walletOrderDictionary:v10];

  [(SGEntity *)v16 addTag:v18];
  if (v16)
  {
    v21[0] = v16;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (id)_downloadWalletOrderAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

uint64_t __72__SGWalletOrderAttachmentDissector__downloadWalletOrderAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWalletOrderMimeType])
  {
    uint64_t v3 = [v2 isDownloadedLocally];
  }
  else
  {
    v4 = [v2 path];
    v5 = [v4 pathExtension];
    if ([v5 isEqualToString:@"order"])
    {
      uint64_t v3 = [v2 isDownloadedLocally];
    }
    else
    {
      id v6 = [v2 filename];
      v7 = [v6 pathExtension];
      if ([v7 isEqualToString:@"order"]) {
        uint64_t v3 = [v2 isDownloadedLocally];
      }
      else {
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

- (BOOL)orderAttachmentsCompletelyDownloaded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "isWalletOrderMimeType", (void)v14))
        {
          if (([v8 isDownloadedLocally] & 1) == 0) {
            goto LABEL_16;
          }
        }
        else
        {
          id v9 = [v8 filename];
          id v10 = [v9 pathExtension];
          if ([v10 isEqualToString:@"order"])
          {
            int v11 = [v8 isDownloadedLocally];

            if (!v11)
            {
LABEL_16:
              BOOL v12 = 0;
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)shouldIgnoreEntity:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v4 = sgLogHandle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "%@: Ignoring attachments because Orders feature is disabled", (uint8_t *)&v8, 0xCu);
LABEL_6:

    goto LABEL_8;
  }
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents]) {
    return 0;
  }
  uint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v7);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "%@: Skipping wallet order attachment dissector: detectStructuredEvents is OFF", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }
LABEL_8:

  return 1;
}

@end