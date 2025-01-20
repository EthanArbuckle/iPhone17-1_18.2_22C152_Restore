@interface BUZipWriter
- (BOOL)calculateCRC;
- (BOOL)calculateSize;
- (BOOL)force32BitSize;
- (BOOL)isClosed;
- (BURandomWriteChannel)writeChannel;
- (BUZipWriter)init;
- (BUZipWriter)initWithOptions:(unint64_t)a3;
- (BUZipWriterEntry)currentEntry;
- (NSArray)sortedEntries;
- (NSDate)lastModificationDateIfSizeAndCRCMatches;
- (NSDate)updatedEntryLastModificationDate;
- (NSError)error;
- (NSMutableArray)entries;
- (NSMutableArray)entryDatas;
- (NSMutableDictionary)entriesMap;
- (OS_dispatch_data)localFileHeaderData;
- (OS_dispatch_group)writeChannelCompletionGroup;
- (OS_dispatch_queue)channelQueue;
- (OS_dispatch_queue)writeQueue;
- (id)entryWithName:(id)a3;
- (id)localFileHeaderDataForEntry:(id)a3;
- (id)p_writeChannel;
- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3;
- (id)sortedEntriesImpl;
- (int64_t)currentOffset;
- (int64_t)writtenOffset;
- (unint64_t)archiveLength;
- (unint64_t)entriesCount;
- (unint64_t)entriesCountImpl;
- (unint64_t)entryDataSize;
- (unint64_t)options;
- (unint64_t)sizeToMatch;
- (unsigned)CRCToMatch;
- (void)addBarrier:(id)a3;
- (void)addData:(id)a3;
- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addExistingEntry:(id)a3;
- (void)addExistingEntryImpl:(id)a3;
- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8;
- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8;
- (void)closeWithQueue:(id)a3 completion:(id)a4;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)finishEntry;
- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4;
- (void)flushEntryData;
- (void)handleWriteError:(id)a3;
- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5;
- (void)setCRCToMatch:(unsigned int)a3;
- (void)setCalculateCRC:(BOOL)a3;
- (void)setCalculateSize:(BOOL)a3;
- (void)setChannelQueue:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setCurrentEntry:(id)a3;
- (void)setCurrentOffset:(int64_t)a3;
- (void)setEntries:(id)a3;
- (void)setEntriesMap:(id)a3;
- (void)setEntryDataSize:(unint64_t)a3;
- (void)setEntryDatas:(id)a3;
- (void)setEntryInsertionOffset:(int64_t)a3;
- (void)setEntryInsertionOffsetImpl:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setForce32BitSize:(BOOL)a3;
- (void)setLastModificationDateIfSizeAndCRCMatches:(id)a3;
- (void)setLocalFileHeaderData:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSizeToMatch:(unint64_t)a3;
- (void)setUpdatedEntryLastModificationDate:(id)a3;
- (void)setWriteChannel:(id)a3;
- (void)setWriteChannelCompletionGroup:(id)a3;
- (void)setWriteQueue:(id)a3;
- (void)setWrittenOffset:(int64_t)a3;
- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4;
- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4;
- (void)truncateToOffset:(int64_t)a3 completion:(id)a4;
- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4;
- (void)writeCentralDirectory;
- (void)writeCentralFileHeaderDataForEntry:(id)a3;
- (void)writeData:(id)a3;
- (void)writeData:(id)a3 offset:(int64_t)a4;
- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9;
- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3;
- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5;
@end

@implementation BUZipWriter

- (BUZipWriter)init
{
  return (BUZipWriter *)MEMORY[0x270F9A6D0](self, sel_initWithOptions_, 0);
}

- (BUZipWriter)initWithOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)BUZipWriter;
  v4 = [(BUZipWriter *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    uint64_t v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = (NSMutableDictionary *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("BUZipWriter.Channel", 0);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("BUZipWriter.Write", 0);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v12;

    uint64_t v16 = objc_msgSend_date(MEMORY[0x263EFF910], v14, v15);
    updatedEntryLastModificationDate = v5->_updatedEntryLastModificationDate;
    v5->_updatedEntryLastModificationDate = (NSDate *)v16;
  }
  return v5;
}

- (unint64_t)entriesCount
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4 = objc_msgSend_writeQueue(self, a2, v2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1CD66C;
  v7[3] = &unk_26449D600;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)entriesCountImpl
{
  return objc_msgSend_count(self->_entriesMap, a2, v2);
}

- (id)p_writeChannel
{
  uint64_t v6 = objc_msgSend_channelQueue(self, a2, v2);
  if (v6 == (void *)MEMORY[0x263EF83A0]) {
    objc_msgSend_isMainThread(MEMORY[0x263F08B88], v4, v5);
  }

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    if (self->_writeChannelCompletionGroup)
    {
      BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 107, (uint64_t)"-[BUZipWriter p_writeChannel]", (uint64_t)"_writeChannelCompletionGroup == nil", @"Write channel dispatch group should not be initialized.", v7, v8, v9, v23);
      BUCrashBreakpoint();
      id result = (id)BUIsRunningTests();
      if (result) {
        BUCrashFinalThrow(@"Write channel dispatch group should not be initialized.", v12, v13, v14, v15, v16, v17, v18, v24);
      }
      __break(1u);
      return result;
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_21E1CD854;
    v30 = sub_21E1CD864;
    dispatch_group_t v31 = dispatch_group_create();
    dispatch_group_enter((dispatch_group_t)v27[5]);
    objc_msgSend_setWriteChannelCompletionGroup_(self, v19, v27[5]);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_21E1CD86C;
    v25[3] = &unk_26449D628;
    v25[4] = &v26;
    objc_msgSend_prepareWriteChannelWithCloseCompletionHandler_(self, v20, (uint64_t)v25);
    v21 = (BURandomWriteChannel *)objc_claimAutoreleasedReturnValue();
    v22 = self->_writeChannel;
    self->_writeChannel = v21;

    _Block_object_dispose(&v26, 8);
    writeChannel = self->_writeChannel;
  }

  return writeChannel;
}

- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  uint64_t v18 = objc_msgSend_writeQueue(self, v16, v17);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1CD980;
  block[3] = &unk_26449D650;
  block[4] = self;
  id v22 = v14;
  BOOL v26 = a4;
  id v23 = v15;
  unint64_t v24 = a6;
  unsigned int v25 = a7;
  BOOL v27 = a8;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v18, block);
}

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  BOOL v8 = a8;
  uLong v9 = *(void *)&a7;
  id v54 = a3;
  id v19 = (NSDate *)a5;
  if (self->_closed)
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 133, (uint64_t)"-[BUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]", (uint64_t)"!self->_closed", @"Already closed.", v16, v17, v18, v52);
    BUCrashBreakpoint();
    if (BUIsRunningTests()) {
      BUCrashFinalThrow(@"Already closed.", v20, v21, v22, v23, v24, v25, v26, v53);
    }
    __break(1u);
  }
  else
  {
    BOOL v27 = objc_msgSend_error(self, v14, v15);

    if (!v27)
    {
      objc_msgSend_finishEntry(self, v28, v29);
      dispatch_group_t v31 = objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v30, (uint64_t)v54);

      if (!v31)
      {
        v32 = objc_alloc_init(BUZipWriterEntry);
        currentEntry = self->_currentEntry;
        self->_currentEntry = v32;

        objc_msgSend_setName_(self->_currentEntry, v34, (uint64_t)v54);
        objc_msgSend_setOffset_(self->_currentEntry, v35, self->_currentOffset);
        if (a6) {
          BOOL v37 = v8;
        }
        else {
          BOOL v37 = 1;
        }
        self->_calculateSize = v37;
        if (v37) {
          objc_msgSend_setSize_(self->_currentEntry, v36, 0);
        }
        else {
          objc_msgSend_setSize_(self->_currentEntry, v36, a6);
        }
        BOOL v39 = self->_calculateSize && a4;
        self->_force32BitSize = v39;
        if (v9) {
          BOOL v40 = v8;
        }
        else {
          BOOL v40 = 1;
        }
        self->_calculateCRC = v40;
        uLong v41 = v9;
        if (v40) {
          uLong v41 = crc32(0, 0, 0);
        }
        objc_msgSend_setCRC_(self->_currentEntry, v38, v41);
        if (v8)
        {
          objc_msgSend_setLastModificationDate_(self->_currentEntry, v42, (uint64_t)self->_updatedEntryLastModificationDate);
          self->_sizeToMatch = a6;
          self->_CRCToMatch = v9;
          v43 = v19;
          lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
          self->_lastModificationDateIfSizeAndCRCMatches = v43;
        }
        else
        {
          updatedEntryLastModificationDate = v19;
          if (!v19) {
            updatedEntryLastModificationDate = self->_updatedEntryLastModificationDate;
          }
          objc_msgSend_setLastModificationDate_(self->_currentEntry, v42, (uint64_t)updatedEntryLastModificationDate);
          lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
          self->_sizeToMatch = 0;
          self->_lastModificationDateIfSizeAndCRCMatches = 0;
          self->_CRCToMatch = 0;
        }

        v48 = objc_msgSend_localFileHeaderDataForEntry_(self, v46, (uint64_t)self->_currentEntry);
        if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
        {
          objc_storeStrong((id *)&self->_localFileHeaderData, v48);
          v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
          entryDatas = self->_entryDatas;
          self->_entryDatas = v49;
        }
        else
        {
          objc_msgSend_writeData_(self, v47, (uint64_t)v48);
          localFileHeaderData = self->_localFileHeaderData;
          self->_localFileHeaderData = 0;

          entryDatas = self->_entryDatas;
          self->_entryDatas = 0;
        }

        self->_entryDataSize = 0;
      }
    }
  }
}

- (void)addData:(id)a3
{
}

- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_writeQueue(self, v11, v12);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21E1CDD00;
  v17[3] = &unk_26449D678;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = a5;
  if (!self->_closed)
  {
    uint64_t v23 = objc_msgSend_error(self, v10, v11);
    if (v23)
    {
      uint64_t v24 = (void (**)(void, void))MEMORY[0x223C22A70](v15);
      uint64_t v25 = v24;
      if (v24)
      {
        if (v9)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_21E1CE014;
          block[3] = &unk_26449D6A0;
          v46 = v24;
          id v45 = v23;
          dispatch_async(v9, block);
        }
        else
        {
          ((void (**)(void, void *))v24)[2](v24, v23);
        }
      }

LABEL_23:
      return;
    }
    size_t size = dispatch_data_get_size(v8);
    entryDatas = self->_entryDatas;
    if (entryDatas)
    {
      localFileHeaderData = self->_localFileHeaderData;
      if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
      {
        objc_msgSend_addObject_(entryDatas, v30, (uint64_t)v8);
        self->_entryDataSize += size;
        v36 = (void (**)(void, void))MEMORY[0x223C22A70](v15);
        BOOL v37 = v36;
        if (v36)
        {
          if (v9)
          {
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = sub_21E1CE028;
            v42[3] = &unk_26449D6C8;
            v43 = v36;
            dispatch_async(v9, v42);
          }
          else
          {
            v36[2](v36, 0);
          }
        }

        goto LABEL_19;
      }
      objc_msgSend_writeData_(self, v30, (uint64_t)localFileHeaderData);
      dispatch_group_t v31 = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      objc_msgSend_flushEntryData(self, v32, v33);
    }
    objc_msgSend_writeData_queue_completion_(self, v26, (uint64_t)v8, v9, v15);
LABEL_19:
    if (self->_calculateSize)
    {
      currentEntry = self->_currentEntry;
      uint64_t v39 = objc_msgSend_size(currentEntry, v34, v35);
      objc_msgSend_setSize_(currentEntry, v40, v39 + size);
    }
    if (self->_calculateCRC)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = (uint64_t)sub_21E1CE03C;
      v41[3] = (uint64_t)&unk_26449D6F0;
      v41[4] = (uint64_t)self;
      dispatch_data_apply(v8, v41);
    }
    goto LABEL_23;
  }
  BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 202, (uint64_t)"-[BUZipWriter addDataImpl:queue:completion:]", (uint64_t)"!self->_closed", @"Already closed.", v12, v13, v14, v41[0]);
  BUCrashBreakpoint();
  if (BUIsRunningTests()) {
    BUCrashFinalThrow(@"Already closed.", v16, v17, v18, v19, v20, v21, v22, v41[0]);
  }
  __break(1u);
}

- (void)flushEntryData
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_entryDatas;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_writeData_(self, v6, *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, v15, 16);
    }
    while (v7);
  }

  entryDatas = self->_entryDatas;
  self->_entryDatas = 0;

  self->_entryDataSize = 0;
}

- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_writeQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1CE29C;
  block[3] = &unk_26449D768;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)finishEntry
{
  currentEntry = self->_currentEntry;
  if (!currentEntry) {
    return;
  }
  if (self->_calculateSize || self->_calculateCRC)
  {
    if (self->_force32BitSize)
    {
      if ((unint64_t)objc_msgSend_size(self->_currentEntry, a2, (uint64_t)currentEntry) >> 32)
      {
        v4 = BUZipLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_21E1F0A20(v4, v5, v6, v7, v8, v9, v10, v11);
        }

        long long v13 = objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v12, 0);
        objc_msgSend_handleWriteError_(self, v14, (uint64_t)v13);

        return;
      }
      currentEntry = self->_currentEntry;
    }
    if (self->_lastModificationDateIfSizeAndCRCMatches)
    {
      uint64_t v15 = objc_msgSend_size(currentEntry, a2, (uint64_t)currentEntry);
      currentEntry = self->_currentEntry;
      if (v15 == self->_sizeToMatch)
      {
        int v16 = objc_msgSend_CRC(self->_currentEntry, a2, (uint64_t)currentEntry);
        currentEntry = self->_currentEntry;
        if (v16 == self->_CRCToMatch)
        {
          objc_msgSend_setLastModificationDate_(self->_currentEntry, a2, (uint64_t)self->_lastModificationDateIfSizeAndCRCMatches);
          currentEntry = self->_currentEntry;
        }
      }
    }
    uint64_t v19 = objc_msgSend_localFileHeaderDataForEntry_(self, a2, (uint64_t)currentEntry);
    if (self->_entryDatas)
    {
      objc_msgSend_writeData_(self, v17, (uint64_t)v19);
      localFileHeaderData = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      objc_msgSend_flushEntryData(self, v21, v22);
    }
    else
    {
      uint64_t v23 = objc_msgSend_offset(self->_currentEntry, v17, v18);
      objc_msgSend_writeData_offset_(self, v24, (uint64_t)v19, v23);
    }

    currentEntry = self->_currentEntry;
  }
  objc_msgSend_addObject_(self->_entries, a2, (uint64_t)currentEntry);
  entriesMap = self->_entriesMap;
  uint64_t v25 = self->_currentEntry;
  uint64_t v29 = objc_msgSend_name(v25, v27, v28);
  objc_msgSend_setObject_forKeyedSubscript_(entriesMap, v30, (uint64_t)v25, v29);

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

  v32 = self->_currentEntry;
  self->_currentEntry = 0;
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  BOOL v13 = a4;
  id v16 = a9;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21E1CE8DC;
  v19[3] = &unk_26449D790;
  id v20 = v16;
  id v17 = v16;
  objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler_(self, v18, (uint64_t)a3, v13, a5, a6, v10, a8, v19);
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  uint64_t v21 = objc_msgSend_writeQueue(self, v19, v20);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1CEAA4;
  block[3] = &unk_26449D7E0;
  void block[4] = self;
  id v27 = v15;
  BOOL v33 = a4;
  unsigned int v32 = a7;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  unint64_t v31 = a6;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_async(v21, block);
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
}

- (void)addExistingEntry:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_writeQueue(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1CEDCC;
  v9[3] = &unk_26449D808;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (void)addExistingEntryImpl:(id)a3
{
  id v34 = a3;
  id v4 = objc_alloc_init(BUZipWriterEntry);
  uint64_t v7 = objc_msgSend_name(v34, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_lastModificationDate(v34, v9, v10);
  objc_msgSend_setLastModificationDate_(v4, v12, (uint64_t)v11);

  if (objc_msgSend_isCompressed(v34, v13, v14)) {
    uint64_t v17 = objc_msgSend_compressedSize(v34, v15, v16);
  }
  else {
    uint64_t v17 = objc_msgSend_size(v34, v15, v16);
  }
  objc_msgSend_setSize_(v4, v18, v17);
  uint64_t v21 = objc_msgSend_offset(v34, v19, v20);
  objc_msgSend_setOffset_(v4, v22, v21);
  uint64_t v25 = objc_msgSend_CRC(v34, v23, v24);
  objc_msgSend_setCRC_(v4, v26, v25);
  objc_msgSend_addObject_(self->_entries, v27, (uint64_t)v4);
  entriesMap = self->_entriesMap;
  unint64_t v31 = objc_msgSend_name(v34, v29, v30);
  objc_msgSend_setObject_forKeyedSubscript_(entriesMap, v32, (uint64_t)v4, v31);

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;
}

- (void)setEntryInsertionOffset:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_writeQueue(self, a2, a3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_21E1CEFA0;
  v6[3] = &unk_26449D830;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)setEntryInsertionOffsetImpl:(int64_t)a3
{
  self->_currentOffset = a3;
  self->_writtenOffset = a3;
}

- (void)addBarrier:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_writeQueue(self, v4, v5);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_21E1CF070;
    v8[3] = &unk_26449D858;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_writeQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1CF338;
  block[3] = &unk_26449D768;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)writeCentralDirectory
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int64_t currentOffset = self->_currentOffset;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_entries;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_writeCentralFileHeaderDataForEntry_(self, v7, *(void *)(*((void *)&v16 + 1) + 8 * v10++), (void)v16);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, v20, 16);
    }
    while (v8);
  }

  int64_t v11 = self->_currentOffset - currentOffset;
  uint64_t v14 = objc_msgSend_count(self->_entries, v12, v13);
  objc_msgSend_writeEndOfCentralDirectoryDataWithOffset_size_entryCount_(self, v15, currentOffset, v11, v14);
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  objc_msgSend_name(v4, v5, v6);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);

  __src = v10;
  size_t v13 = strlen(v10);
  if (v13 >= 0x10000)
  {
    uint64_t v14 = BUZipLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0A58(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    size_t v13 = 0xFFFFLL;
  }
  unint64_t v22 = self->_options & 1;
  unint64_t v23 = v22 | ((unint64_t)objc_msgSend_size(v4, v11, v12) >> 32);
  BOOL v24 = v23 != 0;
  if (v23 || self->_calculateSize)
  {
    BOOL v48 = !self->_force32BitSize;
    if (self->_force32BitSize) {
      unsigned int v25 = 0;
    }
    else {
      unsigned int v25 = 20;
    }
  }
  else
  {
    BOOL v48 = 0;
    unsigned int v25 = 0;
  }
  uint64_t v26 = malloc_type_malloc(v13 + v25 + 30, 0xEBFD76E7uLL);
  id v27 = (char *)v26 + 30;
  *uint64_t v26 = 67324752;
  v26[1] = 20;
  *((_WORD *)v26 + 4) = 0;
  uint64_t v30 = objc_msgSend_lastModificationDate(v4, v28, v29);
  int v33 = objc_msgSend_bu_DOSTime(v30, v31, v32);

  HIDWORD(v34) = v33;
  LODWORD(v34) = v33;
  *(_DWORD *)((char *)v26 + 10) = v34 >> 16;
  *(_DWORD *)((char *)v26 + 14) = objc_msgSend_CRC(v4, v35, v36);
  if (!v24)
  {
    *(_DWORD *)((char *)v26 + 18) = objc_msgSend_size(v4, v37, v38);
LABEL_17:
    int v40 = objc_msgSend_size(v4, v37, v38);
    goto LABEL_18;
  }
  if (self->_force32BitSize) {
    int v39 = objc_msgSend_size(v4, v37, v38);
  }
  else {
    int v39 = -1;
  }
  *(_DWORD *)((char *)v26 + 18) = v39;
  if (self->_force32BitSize) {
    goto LABEL_17;
  }
  int v40 = -1;
LABEL_18:
  *(_DWORD *)((char *)v26 + 22) = v40;
  *((_WORD *)v26 + 13) = v13;
  *((_WORD *)v26 + 14) = v25;
  memcpy(v27, __src, v13);
  if (v48)
  {
    v43 = &v27[v13];
    *(_WORD *)v43 = BUZip64ExtraFieldSignature;
    *((_WORD *)v43 + 1) = 16;
    *(void *)(v43 + 4) = objc_msgSend_size(v4, v41, v42);
    *(void *)(v43 + 12) = objc_msgSend_size(v4, v44, v45);
  }
  dispatch_data_t v46 = dispatch_data_create(v26, v13 + v25 + 30, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);

  return v46;
}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  objc_msgSend_name(v4, v5, v6);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);

  size_t v13 = strlen(v10);
  if (v13 >= 0x10000)
  {
    uint64_t v14 = BUZipLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0A58(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    size_t v13 = 0xFFFFLL;
  }
  v56 = self;
  unint64_t v22 = self->_options & 2;
  unint64_t v23 = v22 | ((unint64_t)objc_msgSend_size(v4, v11, v12) >> 32);
  unint64_t v26 = v22 | ((unint64_t)objc_msgSend_offset(v4, v24, v25) >> 32);
  unsigned int v27 = 4 * ((v23 | v26) != 0);
  if (v23) {
    unsigned int v27 = 20;
  }
  BOOL v28 = v26 != 0;
  if (v26) {
    uint64_t v29 = v27 | 8;
  }
  else {
    uint64_t v29 = v27;
  }
  uint64_t size = v13 + v29 + 46;
  uint64_t v30 = (char *)malloc_type_malloc(size, 0x6AC2CF73uLL);
  unint64_t v31 = v30 + 46;
  *(_DWORD *)uint64_t v30 = 33639248;
  *(void *)(v30 + 4) = 1310782;
  unint64_t v34 = objc_msgSend_lastModificationDate(v4, v32, v33);
  int v37 = objc_msgSend_bu_DOSTime(v34, v35, v36);

  HIDWORD(v38) = v37;
  LODWORD(v38) = v37;
  *((_DWORD *)v30 + 3) = v38 >> 16;
  *((_DWORD *)v30 + 4) = objc_msgSend_CRC(v4, v39, v40);
  if (v23)
  {
    int v43 = -1;
    *((_DWORD *)v30 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v30 + 5) = objc_msgSend_size(v4, v41, v42);
    int v43 = objc_msgSend_size(v4, v44, v45);
  }
  *((_DWORD *)v30 + 6) = v43;
  *((_WORD *)v30 + 14) = v13;
  *((_WORD *)v30 + 15) = v29;
  *((void *)v30 + 4) = 0;
  *((_WORD *)v30 + 20) = 0;
  if (v28)
  {
    *(_DWORD *)(v30 + 42) = -1;
    memcpy(v31, v10, v13);
    *(_WORD *)&v31[v13] = BUZip64ExtraFieldSignature;
    BOOL v48 = (uint64_t *)&v31[v13 + 4];
    *(_WORD *)&v31[v13 + 2] = 0;
    v49 = &v31[v13 + 2];
    if (!v23) {
      goto LABEL_20;
    }
  }
  else
  {
    *(_DWORD *)(v30 + 42) = objc_msgSend_offset(v4, v41, v42);
    memcpy(v31, v10, v13);
    if (!v23) {
      goto LABEL_21;
    }
    BOOL v48 = (uint64_t *)&v31[v13 + 4];
    *(_WORD *)&v31[v13] = BUZip64ExtraFieldSignature;
    v49 = &v31[v13 + 2];
  }
  v50 = &v31[v13];
  *(_WORD *)v49 = 16;
  uint64_t *v48 = objc_msgSend_size(v4, v46, v47);
  *(void *)(v50 + 12) = objc_msgSend_size(v4, v51, v52);
  if (v28)
  {
    BOOL v48 = (uint64_t *)(v50 + 20);
LABEL_20:
    *(_WORD *)v49 += 8;
    uint64_t *v48 = objc_msgSend_offset(v4, v46, v47);
  }
LABEL_21:
  dispatch_data_t v53 = dispatch_data_create(v30, size, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  objc_msgSend_writeData_(v56, v54, (uint64_t)v53);
}

- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  __int16 v5 = a5;
  int v6 = a4;
  int v7 = a3;
  if (a5 > 0xFFFE) {
    int v9 = 1;
  }
  else {
    int v9 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if (a4 > 4294967294) {
    int v10 = 1;
  }
  else {
    int v10 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if (a3 > 4294967294) {
    int v11 = 1;
  }
  else {
    int v11 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if ((v9 & 1) != 0 || (v10 & 1) != 0 || v11)
  {
    int64_t currentOffset = self->_currentOffset;
    objc_msgSend_writeZip64EndOfCentralDirectoryWithOffset_size_entryCount_(self, a2, a3, a4, a5);
    objc_msgSend_writeZip64EndOfCentralDirectoryLocatorWithOffset_(self, v13, currentOffset);
  }
  uint64_t v14 = malloc_type_malloc(0x16uLL, 0x33859FF3uLL);
  *(void *)uint64_t v14 = 101010256;
  if (v9) {
    __int16 v15 = -1;
  }
  else {
    __int16 v15 = v5;
  }
  v14[4] = v15;
  v14[5] = v15;
  if (v10) {
    int v16 = -1;
  }
  else {
    int v16 = v6;
  }
  if (v11) {
    int v17 = -1;
  }
  else {
    int v17 = v7;
  }
  *((_DWORD *)v14 + 3) = v16;
  *((_DWORD *)v14 + 4) = v17;
  v14[10] = 0;
  dispatch_data_t v19 = dispatch_data_create(v14, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  objc_msgSend_writeData_(self, v18, (uint64_t)v19);
}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  int v9 = malloc_type_malloc(0x38uLL, 0xA2BE1896uLL);
  *(_DWORD *)int v9 = 101075792;
  *(void *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  void v9[5] = a4;
  v9[6] = a3;
  dispatch_data_t v11 = dispatch_data_create(v9, 0x38uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  objc_msgSend_writeData_(self, v10, (uint64_t)v11);
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  __int16 v5 = malloc_type_malloc(0x14uLL, 0xD99594C3uLL);
  _DWORD *v5 = 117853008;
  v5[1] = 0;
  *((void *)v5 + 1) = a3;
  v5[4] = 1;
  dispatch_data_t v7 = dispatch_data_create(v5, 0x14uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  objc_msgSend_writeData_(self, v6, (uint64_t)v7);
}

- (void)writeData:(id)a3
{
}

- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  size_t size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  int64_t writtenOffset = self->_writtenOffset;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E1D01C0;
  v15[3] = &unk_26449D8A8;
  id v16 = v8;
  id v17 = v9;
  id v12 = v8;
  id v13 = v9;
  objc_msgSend_p_writeData_offset_completion_(self, v14, (uint64_t)a3, writtenOffset, v15);
  self->_writtenOffset += size;
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
}

- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_channelQueue(self, v10, v11);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E1D03B0;
  v15[3] = &unk_26449D920;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  int64_t v18 = a4;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  dispatch_data_t v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"%@: %s", @"Abstract method", "-[BUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v4, v8, v5, v7, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (unint64_t)archiveLength
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = objc_msgSend_writeQueue(self, a2, v2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1D07B0;
  v7[3] = &unk_26449D600;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)handleWriteError:(id)a3
{
  id v4 = a3;
  dispatch_data_t v7 = v4;
  if (v4)
  {
    if (objc_msgSend_code(v4, v5, v6) != 3072
      || (objc_msgSend_domain(v7, v8, v9),
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          char isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x263F07F70]),
          v10,
          (isEqualToString & 1) == 0))
    {
      BUZipLog();
      __int16 v15 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_21E1F0A90(v7, v15, v16);
      }
    }
    id v17 = objc_msgSend_error(self, v13, v14);

    if (!v17)
    {
      uint64_t v20 = objc_msgSend_channelQueue(self, v18, v19);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_21E1D0914;
      block[3] = &unk_26449D948;
      void block[4] = self;
      dispatch_async(v20, block);

      objc_msgSend_setError_(self, v21, (uint64_t)v7);
    }
  }
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_data_t v7 = objc_msgSend_writeQueue(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1D0A0C;
  v9[3] = &unk_26449D858;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (id)sortedEntriesImpl
{
  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    objc_msgSend_sortedArrayUsingComparator_(self->_entries, a2, (uint64_t)&unk_26CF108B0);
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }

  return sortedEntries;
}

- (NSArray)sortedEntries
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_21E1CD854;
  id v12 = sub_21E1CD864;
  id v13 = 0;
  id v4 = objc_msgSend_writeQueue(self, a2, v2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1D0DD0;
  v7[3] = &unk_26449D600;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (BOOL)isClosed
{
  id v3 = self;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = objc_msgSend_writeQueue(self, a2, v2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_21E1D0EF4;
  v6[3] = &unk_26449D600;
  v6[4] = v3;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (id)entryWithName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_21E1CD854;
  int64_t v18 = sub_21E1CD864;
  id v19 = 0;
  uint64_t v7 = objc_msgSend_writeQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D104C;
  block[3] = &unk_26449D990;
  id v12 = v4;
  id v13 = &v14;
  void block[4] = self;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = objc_msgSend_writeQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D1174;
  block[3] = &unk_26449D9B8;
  id v12 = v6;
  unint64_t v13 = a3;
  void block[4] = self;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4
{
  id v34 = a4;
  if (objc_msgSend_entriesCountImpl(self, v6, v7) <= a3)
  {
    uint64_t v33 = MEMORY[0x223C22A70](v34);
    id v10 = (void *)v33;
    if (v33) {
      (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
    }
  }
  else
  {
    id v10 = objc_msgSend_sortedEntriesImpl(self, v8, v9);
    if (objc_msgSend_count(v10, v11, v12) > a3)
    {
      unint64_t v14 = a3;
      do
      {
        __int16 v15 = objc_msgSend_objectAtIndexedSubscript_(v10, v13, v14);
        objc_msgSend_removeObject_(self->_entries, v16, (uint64_t)v15);
        entriesMap = self->_entriesMap;
        uint64_t v20 = objc_msgSend_name(v15, v18, v19);
        objc_msgSend_removeObjectForKey_(entriesMap, v21, (uint64_t)v20);

        ++v14;
      }
      while (v14 < objc_msgSend_count(v10, v22, v23));
    }
    BOOL v24 = objc_msgSend_objectAtIndexedSubscript_(v10, v13, a3);
    uint64_t v27 = objc_msgSend_offset(v24, v25, v26);
    objc_msgSend_setEntryInsertionOffsetImpl_(self, v28, v27);
    uint64_t v31 = objc_msgSend_offset(v24, v29, v30);
    objc_msgSend_truncateToOffsetImpl_completion_(self, v32, v31, v34);
  }
}

- (void)truncateToOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_writeQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D1398;
  block[3] = &unk_26449D9B8;
  id v12 = v6;
  int64_t v13 = a3;
  void block[4] = self;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v7, @"%@: %s", @"Abstract method", "-[BUZipWriter truncateToOffsetImpl:completion:]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v9, v6, v8, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_queue)channelQueue
{
  return self->_channelQueue;
}

- (void)setChannelQueue:(id)a3
{
}

- (BURandomWriteChannel)writeChannel
{
  return self->_writeChannel;
}

- (void)setWriteChannel:(id)a3
{
}

- (OS_dispatch_group)writeChannelCompletionGroup
{
  return self->_writeChannelCompletionGroup;
}

- (void)setWriteChannelCompletionGroup:(id)a3
{
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
}

- (BUZipWriterEntry)currentEntry
{
  return self->_currentEntry;
}

- (void)setCurrentEntry:(id)a3
{
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (BOOL)calculateSize
{
  return self->_calculateSize;
}

- (void)setCalculateSize:(BOOL)a3
{
  self->_calculateSize = a3;
}

- (BOOL)force32BitSize
{
  return self->_force32BitSize;
}

- (void)setForce32BitSize:(BOOL)a3
{
  self->_force32BitSize = a3;
}

- (BOOL)calculateCRC
{
  return self->_calculateCRC;
}

- (void)setCalculateCRC:(BOOL)a3
{
  self->_calculateCRC = a3;
}

- (unint64_t)sizeToMatch
{
  return self->_sizeToMatch;
}

- (void)setSizeToMatch:(unint64_t)a3
{
  self->_sizeToMatch = a3;
}

- (unsigned)CRCToMatch
{
  return self->_CRCToMatch;
}

- (void)setCRCToMatch:(unsigned int)a3
{
  self->_CRCToMatch = a3;
}

- (NSDate)lastModificationDateIfSizeAndCRCMatches
{
  return self->_lastModificationDateIfSizeAndCRCMatches;
}

- (void)setLastModificationDateIfSizeAndCRCMatches:(id)a3
{
}

- (NSDate)updatedEntryLastModificationDate
{
  return self->_updatedEntryLastModificationDate;
}

- (void)setUpdatedEntryLastModificationDate:(id)a3
{
}

- (int64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(int64_t)a3
{
  self->_int64_t currentOffset = a3;
}

- (OS_dispatch_data)localFileHeaderData
{
  return self->_localFileHeaderData;
}

- (void)setLocalFileHeaderData:(id)a3
{
}

- (NSMutableArray)entryDatas
{
  return self->_entryDatas;
}

- (void)setEntryDatas:(id)a3
{
}

- (unint64_t)entryDataSize
{
  return self->_entryDataSize;
}

- (void)setEntryDataSize:(unint64_t)a3
{
  self->_entryDataSize = a3;
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
}

- (int64_t)writtenOffset
{
  return self->_writtenOffset;
}

- (void)setWrittenOffset:(int64_t)a3
{
  self->_int64_t writtenOffset = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_updatedEntryLastModificationDate, 0);
  objc_storeStrong((id *)&self->_lastModificationDateIfSizeAndCRCMatches, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_writeChannelCompletionGroup, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);

  objc_storeStrong((id *)&self->_sortedEntries, 0);
}

@end