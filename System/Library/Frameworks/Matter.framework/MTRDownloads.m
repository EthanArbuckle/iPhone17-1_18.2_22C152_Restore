@interface MTRDownloads
- (MTRDownloads)init;
- (NSMutableArray)downloads;
- (id)add:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8;
- (id)get:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5;
- (void)abortDownloadsForController:(id)a3;
- (void)dealloc;
- (void)remove:(id)a3;
- (void)setDownloads:(id)a3;
@end

@implementation MTRDownloads

- (MTRDownloads)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDownloads;
  v2 = [(MTRDownloads *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    downloads = v2->_downloads;
    v2->_downloads = v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  LODWORD(v16) = 172;
  *((void *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "MTRDiagnosticLogsDownloader.mm";
  int v17 = 324;
  v3 = sub_244B26908((uint64_t)MTRError, &v16);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_downloads;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, v18, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_failure_(*(void **)(*((void *)&v12 + 1) + 8 * v9++), v6, (uint64_t)v3);
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v12, v18, 16);
    }
    while (v7);
  }

  downloads = self->_downloads;
  self->_downloads = 0;

  v11.receiver = self;
  v11.super_class = (Class)MTRDownloads;
  [(MTRDownloads *)&v11 dealloc];
}

- (id)get:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v11 = self->_downloads;
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v11);
        }
        int v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend_matches_fabricIndex_nodeID_(v17, v13, (uint64_t)v8, v9, v10, (void)v19))
        {
          id v14 = v17;
          goto LABEL_11;
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v19, v23, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

- (id)add:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 349);
  long long v19 = [MTRDownload alloc];
  long long v22 = objc_msgSend_initWithType_fabricIndex_nodeID_queue_completion_done_(v19, v20, a3, v14, v15, v16, v17, v18);
  if (v22)
  {
    objc_msgSend_addObject_(self->_downloads, v21, (uint64_t)v22);
    id v23 = v22;
  }

  return v22;
}

- (void)abortDownloadsForController:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v26 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 360);
  v4 = NSNumber;
  uint64_t v7 = objc_msgSend_fabricIndex(v26, v5, v6);
  id v9 = objc_msgSend_numberWithUnsignedChar_(v4, v8, v7);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v12 = objc_msgSend_copy(self->_downloads, v10, v11);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, v33, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v12);
        }
        long long v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v20 = objc_msgSend_fabricIndex(v19, v14, v15, v26);
        char isEqual = objc_msgSend_isEqual_(v20, v21, (uint64_t)v9);

        if (isEqual)
        {
          LODWORD(v27) = 116;
          *((void *)&v27 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framewo"
                                  "rk/CHIP/MTRDiagnosticLogsDownloader.mm";
          int v28 = 368;
          id v23 = sub_244B26908((uint64_t)MTRError, &v27);
          objc_msgSend_failure_(v19, v24, (uint64_t)v23);

          objc_msgSend_remove_(self, v25, (uint64_t)v19);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v29, v33, 16);
    }
    while (v16);
  }
}

- (void)remove:(id)a3
{
  id v5 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 375);
  objc_msgSend_removeObject_(self->_downloads, v4, (uint64_t)v5);
}

- (NSMutableArray)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end