@interface BUZipArchive
+ (void)test_setForceZipEntriesRecalculationOnRead:(BOOL)a3;
- (BOOL)extractToURL:(id)a3 error:(id *)a4;
- (BOOL)extractToURL:(id)a3 error:(id *)a4 shouldExtractEntry:(id)a5 didExtractEntry:(id)a6;
- (BOOL)hasNonEmptyEntries;
- (BOOL)isValid;
- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5;
- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5;
- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6;
- (BUZipArchive)init;
- (BUZipArchive)initWithOptions:(unint64_t)a3;
- (NSMutableDictionary)entriesMap;
- (NSMutableOrderedSet)entries;
- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)debugDescription;
- (id)entryForName:(id)a3;
- (id)newArchiveReadChannel;
- (id)normalizeEntryName:(id)a3;
- (id)readChannelForEntry:(id)a3;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)streamReadChannelForEntry:(id)a3;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (int64_t)endOfLastEntry;
- (unint64_t)archiveLength;
- (unint64_t)entriesCount;
- (unint64_t)options;
- (unint64_t)totalSize;
- (void)addEntry:(id)a3;
- (void)collapseCommonRootDirectory;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)readArchiveWithQueue:(id)a3 completion:(id)a4;
- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5;
- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7;
- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8;
- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5;
- (void)setEndOfLastEntry:(int64_t)a3;
- (void)setEntries:(id)a3;
- (void)setEntriesMap:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)test_removeEntryWithName:(id)a3;
@end

@implementation BUZipArchive

- (BUZipArchive)init
{
  return (BUZipArchive *)MEMORY[0x270F9A6D0](self, sel_initWithOptions_, 0);
}

- (BUZipArchive)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BUZipArchive;
  v4 = [(BUZipArchive *)&v11 init];
  if (v4)
  {
    v5 = BUZipLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_21E1F1534();
    }

    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entriesMap = v4->_entriesMap;
    v4->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    entries = v4->_entries;
    v4->_entries = v8;
  }
  return v4;
}

+ (void)test_setForceZipEntriesRecalculationOnRead:(BOOL)a3
{
  byte_267D29908 = a3;
}

- (void)test_removeEntryWithName:(id)a3
{
}

- (unint64_t)entriesCount
{
  return objc_msgSend_count(self->_entries, a2, v2);
}

- (BOOL)hasNonEmptyEntries
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E1DCEEC;
  v4[3] = &unk_26449DE98;
  v4[4] = &v5;
  objc_msgSend_enumerateEntriesUsingBlock_(self, a2, (uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  v6 = a3;
  id v7 = a4;
  char v8 = BUZipLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_21E1F15B4();
  }

  uint64_t v11 = objc_msgSend_archiveLength(self, v9, v10);
  Channel = objc_msgSend_newArchiveReadChannel(self, v12, v13);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_21E1DD1F8;
  v33[3] = &unk_26449DEC0;
  id v15 = v7;
  id v34 = v15;
  v16 = (void *)MEMORY[0x223C22A70](v33);
  v17 = v16;
  if (Channel)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_21E1DD2D8;
    v29[3] = &unk_26449DF10;
    v18 = (id *)v30;
    id v19 = Channel;
    v30[0] = v19;
    v30[1] = self;
    v31 = v6;
    id v32 = v17;
    v21 = (void *)MEMORY[0x223C22A70](v29);
    if (byte_267D29908 && BUIsRunningTests() || (self->_options & 8) != 0)
    {
      objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(self, v20, (uint64_t)v19, 0, 0, 0, 0, v21);
    }
    else
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = sub_21E1DD3EC;
      v25[3] = &unk_26449DF60;
      v25[4] = self;
      uint64_t v28 = v11 - 22;
      id v26 = v19;
      id v27 = v21;
      objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v22, (uint64_t)v26, v11 - 22, 22, v25);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1DD62C;
    block[3] = &unk_26449D6C8;
    v18 = &v24;
    id v24 = v16;
    dispatch_async(v6, block);
  }
}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *))a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v13 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v29 = @"BUZipArchiveErrorDescription";
    v30[0] = @"Wrong data size for BUZipEndOfCentralDirectoryRecord";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v30, &v29, 1);
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    id v27 = @"BUZipArchiveErrorDescription";
    uint64_t v28 = @"Don't support end of central directory comments";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v28, &v27, 1);
    id v15 = LABEL_8:;
    v17 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v14, v16, (uint64_t)v15);

    if (v17)
    {
      v11[2](v11, v17);
    }
    else
    {
      id v19 = objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v18, 0);
      v11[2](v11, v19);
    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v25 = @"BUZipArchiveErrorDescription";
    id v26 = @"Don't support multi-disk";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v26, &v25, 1);
    goto LABEL_8;
  }
  uint64_t v20 = *((unsigned __int16 *)buffer_ptr + 5);
  if (v20 == 0xFFFF || *((_DWORD *)buffer_ptr + 4) == -1 || *((_DWORD *)buffer_ptr + 3) == -1) {
    objc_msgSend_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion_(self, v12, (uint64_t)v10, a4, v11);
  }
  else {
    objc_msgSend_readCentralDirectoryWithEntryCount_offset_size_channel_completion_(self, v12, v20);
  }
LABEL_11:
}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v10 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_21E1DDA44;
    v16[3] = &unk_26449DF88;
    v16[4] = self;
    id v17 = v8;
    id v18 = v10;
    objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v15, (uint64_t)v17, a4 - 20, 20, v16);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    id v19 = @"BUZipArchiveErrorDescription";
    v20[0] = @"File isn't long enough for Zip64 locator";
    v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v20, &v19, 1);
    v14 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v11, v13, (uint64_t)v12);
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    id v24 = @"BUZipArchiveErrorDescription";
    v25[0] = @"Wrong data size for BUZip64EndOfCentralDirectoryLocatorRecord";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v25, &v24, 1);
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      objc_msgSend_readZip64EndOfCentralDirectoryWithChannel_offset_completion_(self, v10, (uint64_t)v8, *((void *)buffer_ptr + 1), v9);
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = @"BUZipArchiveErrorDescription";
    v21 = @"Multi-disk is not supported";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v21, &v20, 1);
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v22 = @"BUZipArchiveErrorDescription";
    v23 = @"Zip64 end of central directory locator record signature not found";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v23, &v22, 1);
  dispatch_data_t v13 = };
  id v15 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);

  if (v15)
  {
    v9[2](v9, v15);
  }
  else
  {
    id v17 = objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v16, 0);
    v9[2](v9, v17);
  }
LABEL_12:
}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E1DDD3C;
  v13[3] = &unk_26449DF88;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v12, (uint64_t)v11, a4, 56, v13);
}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    id v24 = @"BUZipArchiveErrorDescription";
    v25[0] = @"Wrong data size for BUZip64EndOfCentralDirectoryRecord";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v25, &v24, 1);
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      objc_msgSend_readCentralDirectoryWithEntryCount_offset_size_channel_completion_(self, v10, *((void *)buffer_ptr + 4), *((void *)buffer_ptr + 6), *((void *)buffer_ptr + 5), v8, v9);
      goto LABEL_11;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = @"BUZipArchiveErrorDescription";
    v21 = @"Multi-disk is not supported";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v21, &v20, 1);
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v22 = @"BUZipArchiveErrorDescription";
    v23 = @"Zip64 end of central directory record signature not found";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v23, &v22, 1);
  dispatch_data_t v13 = };
  id v15 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);

  if (v15)
  {
    v9[2](v9, v15);
  }
  else
  {
    id v17 = objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v16, 0);
    v9[2](v9, v17);
  }
LABEL_11:
}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = a6;
  id v14 = BUZipLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    _os_log_debug_impl(&dword_21E1C7000, v14, OS_LOG_TYPE_DEBUG, "%@: reading central directory of size %zu with %tu entries", buf, 0x20u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21E1DE0D4;
  v17[3] = &unk_26449DFB0;
  id v18 = v12;
  unint64_t v19 = a3;
  v17[4] = self;
  id v15 = v12;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v16, (uint64_t)v13, a4, a5, v17);
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  id v11 = 0;
  if (!a4) {
    goto LABEL_7;
  }
  unint64_t v12 = 1;
  do
  {
    id v13 = v11;
    id v16 = v11;
    int v14 = objc_msgSend_readCentralFileHeaderWithBuffer_dataSize_error_(self, v9, (uint64_t)&buffer_ptr, &size_ptr, &v16);
    id v11 = v16;

    if (!v14) {
      break;
    }
  }
  while (v12++ < a4);
  if ((v14 & 1) == 0)
  {
    if (!v11)
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v9, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, v11);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }
}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  v53[1] = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(BUZipEntry);
  id v11 = v9;
  if (*a4 <= 0x2D)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    v52 = @"BUZipArchiveErrorDescription";
    v53[0] = @"Central directory too short";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v53, &v52, 1);
    goto LABEL_9;
  }
  unint64_t v12 = (unsigned __int16 *)*a3;
  id v13 = (char *)*a3 + 46;
  int v14 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v13;
  if (v14 != 33639248)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    v50 = @"BUZipArchiveErrorDescription";
    v51 = @"Central directory file header has bad signature";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v51, &v50, 1);
    goto LABEL_9;
  }
  if (v12[4])
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    v48 = @"BUZipArchiveErrorDescription";
    v49 = @"Encrypted files are not supported";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v49, &v48, 1);
    goto LABEL_9;
  }
  if (v12[17])
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    v46 = @"BUZipArchiveErrorDescription";
    v47 = @"No multi-disk support";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v47, &v46, 1);
    id v16 = LABEL_9:;
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v15, v17, (uint64_t)v16);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  int v21 = v12[5];
  if (v12[5]) {
    BOOL v22 = v21 == (unsigned __int16)BUZipDeflateCompressionMethod;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    v44 = @"BUZipArchiveErrorDescription";
    v45 = @"Unsupported compression method";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v45, &v44, 1);
    goto LABEL_9;
  }
  objc_msgSend_setCompressed_(v9, v10, v21 == (unsigned __int16)BUZipDeflateCompressionMethod);
  id v23 = objc_alloc(MEMORY[0x263EFF910]);
  unint64_t v25 = objc_msgSend_bu_initWithDOSTime_(v23, v24, v12[7] | ((unint64_t)v12[6] << 16));
  objc_msgSend_setLastModificationDate_(v11, v26, (uint64_t)v25);

  objc_msgSend_setCRC_(v11, v27, *((unsigned int *)v12 + 4));
  objc_msgSend_setCompressedSize_(v11, v28, *((unsigned int *)v12 + 5));
  objc_msgSend_setSize_(v11, v29, *((unsigned int *)v12 + 6));
  objc_msgSend_setOffset_(v11, v30, *(unsigned int *)(v12 + 21));
  objc_msgSend_setNameLength_(v11, v31, v12[14]);
  objc_msgSend_setExtraFieldsLength_(v11, v32, v12[15]);
  objc_msgSend_setExternalFileAttributes_(v11, v33, *(unsigned int *)(v12 + 19));
  uint64_t v34 = v12[14];
  id v43 = 0;
  LODWORD(v25) = objc_msgSend_readFilenameFromBuffer_nameLength_entry_dataSize_error_(self, v35, (uint64_t)a3, v34, v11, a4, &v43);
  id v36 = v43;
  id v18 = v36;
  if (v25)
  {
    if (!v12[15]
      || (v42 = v36,
          ExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error = objc_msgSend_readExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error_(self, v37, (uint64_t)a3), v39 = v42, v18, id v18 = v39, ExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error))
    {
      if (!v12[16]
        || (FileCommentFromBuffer_fileCommentLength_entry_dataSize_error = objc_msgSend_readFileCommentFromBuffer_fileCommentLength_entry_dataSize_error_(self, v37, (uint64_t)a3), v41 = v18, v18, id v18 = v41, FileCommentFromBuffer_fileCommentLength_entry_dataSize_error))
      {
        objc_msgSend_addEntry_(self, v37, (uint64_t)v11);
        BOOL v19 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    id v18 = v18;
    BOOL v19 = 0;
    *a5 = v18;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_13:

  return v19;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  v30[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  if (*a6 < v9)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    id v27 = @"BUZipArchiveErrorDescription";
    uint64_t v28 = @"Central directory too short";
    int v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)&v28, &v27, 1);
    id v16 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v13, v15, (uint64_t)v14);
LABEL_6:
    BOOL v22 = 0;
    goto LABEL_7;
  }
  uint64_t v17 = v9;
  id v18 = [NSString alloc];
  int v14 = objc_msgSend_initWithBytes_length_encoding_(v18, v19, (uint64_t)*a3, v9, 4);
  objc_msgSend_setName_(v12, v20, (uint64_t)v14);
  *a6 -= v17;
  *a3 = (char *)*a3 + v17;
  BOOL v22 = v14 != 0;
  if (!v14)
  {
    id v23 = (void *)MEMORY[0x263F087E8];
    v29 = @"BUZipArchiveErrorDescription";
    v30[0] = @"Couldn't read name";
    __int16 v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v30, &v29, 1);
    id v16 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v23, v25, (uint64_t)v24);

    goto LABEL_6;
  }
  id v16 = 0;
LABEL_7:

  if (a7 && !v22) {
    *a7 = v16;
  }

  return v22;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v8 = a4;
  v33[1] = *MEMORY[0x263EF8340];
  id v29 = a5;
  if (*a6 >= v8)
  {
    id v15 = 0;
    uint64_t v17 = (char *)*a3 + v8;
    char Zip64ExtraFieldFromBuffer_dataLength_entry_error = 1;
    do
    {
      BOOL v19 = (unsigned __int16 *)*a3;
      uint64_t v20 = (char *)*a3 + 4;
      BOOL v16 = v20 > v17;
      if (v20 > v17) {
        break;
      }
      unint64_t v21 = *a6 - 4;
      *a6 = v21;
      *a3 = v20;
      uint64_t v22 = v19[1];
      if (&v20[v22] > v17)
      {
        __int16 v24 = (void *)MEMORY[0x263F087E8];
        id v32 = @"BUZipArchiveErrorDescription";
        v33[0] = @"Invalid Zip entry extra field length";
        id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v33, &v32, 1);
        uint64_t v26 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v24, v25, (uint64_t)v13);

        id v15 = (void *)v26;
        goto LABEL_11;
      }
      if (*v19 == (unsigned __int16)BUZip64ExtraFieldSignature)
      {
        char Zip64ExtraFieldFromBuffer_dataLength_entry_error = objc_msgSend_readZip64ExtraFieldFromBuffer_dataLength_entry_error_(self, v11, (uint64_t)v20);
        id v23 = v15;

        uint64_t v22 = v19[1];
        unint64_t v21 = *a6;
        id v15 = v23;
        uint64_t v20 = (char *)*a3;
      }
      *a6 = v21 - v22;
      *a3 = &v20[v22];
    }
    while ((Zip64ExtraFieldFromBuffer_dataLength_entry_error & 1) != 0);
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    v30 = @"BUZipArchiveErrorDescription";
    v31 = @"Central directory too short";
    id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)&v31, &v30, 1);
    id v15 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);
    BOOL v16 = 0;
LABEL_11:
  }
  if (a7 && !v16) {
    *a7 = v15;
  }

  return v16;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7 = a4;
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  if (objc_msgSend_size(v9, v10, v11) == 0xFFFFFFFFLL)
  {
    BOOL v14 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v14)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      v30 = @"BUZipArchiveErrorDescription";
      v31[0] = @"Not enough room for Zip64 uncompressed size";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v31, &v30, 1);
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend_setSize_(v9, v12, v15);
  }
  if (objc_msgSend_compressedSize(v9, v12, v13) == 0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = @"BUZipArchiveErrorDescription";
      id v29 = @"Not enough room for Zip64 compressed size";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)&v29, &v28, 1);
      goto LABEL_14;
    }
    uint64_t v18 = *(void *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend_setCompressedSize_(v9, v16, v18);
    LOWORD(v7) = v7 - 8;
  }
  if (objc_msgSend_offset(v9, v16, v17) != 0xFFFFFFFFLL)
  {
LABEL_11:
    id v20 = 0;
    BOOL v21 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    objc_msgSend_setOffset_(v9, v19, *(void *)a3);
    goto LABEL_11;
  }
  uint64_t v22 = (void *)MEMORY[0x263F087E8];
  uint64_t v26 = @"BUZipArchiveErrorDescription";
  id v27 = @"Not enough room for Zip64 offset";
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v27, &v26, 1);
  id v23 = LABEL_14:;
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v22, v24, (uint64_t)v23);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a6 = v20;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_17:

  return v21;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  v21[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  unint64_t v13 = *a6;
  unint64_t v14 = v9;
  if (*a6 < v9)
  {
    BOOL v16 = (void *)MEMORY[0x263F087E8];
    id v20 = @"BUZipArchiveErrorDescription";
    v21[0] = @"Central directory too short";
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v21, &v20, 1);
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v16, v18, (uint64_t)v17);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a7)
    {
      id v15 = v15;
      *a7 = v15;
    }
  }
  else
  {
    id v15 = 0;
    *a6 = v13 - v14;
    *a3 = (char *)*a3 + v14;
  }

  return v13 >= v14;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = sub_21E1DED9C;
  v21[3] = &unk_26449E000;
  id v24 = v16;
  int64_t v25 = a4;
  v21[4] = self;
  id v22 = v14;
  BOOL v27 = a7;
  unsigned int v26 = a6;
  id v23 = v15;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v20, (uint64_t)v19, a4, 30, v21);
}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  v58[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v13 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    uint64_t v34 = (void *)MEMORY[0x263F087E8];
    v57 = @"BUZipArchiveErrorDescription";
    v58[0] = @"Wrong data size for BUZipLocalFileHeaderRecord";
    BOOL v35 = 1;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v58, &v57, 1);
    goto LABEL_13;
  }
  id v14 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    BOOL v35 = *(_DWORD *)buffer_ptr == 33639248;
    uint64_t v34 = (void *)MEMORY[0x263F087E8];
    v55 = @"BUZipArchiveErrorDescription";
    v56 = @"Local file header has bad signature";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v56, &v55, 1);
    id v36 = LABEL_13:;
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v34, v37, (uint64_t)v36);
    id v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(self->_entries, v38, v39))
    {
      (*((void (**)(id, void, void, BOOL))v11 + 2))(v11, 0, 0, v35);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  __int16 v15 = *((_WORD *)buffer_ptr + 3);
  if (v15)
  {
    id v41 = (void *)MEMORY[0x263F087E8];
    v53 = @"BUZipArchiveErrorDescription";
    v54 = @"Encrypted files are not supported";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v54, &v53, 1);
  }
  else if ((v15 & 8) != 0)
  {
    id v41 = (void *)MEMORY[0x263F087E8];
    v51 = @"BUZipArchiveErrorDescription";
    v52 = @"Local file header does not have the entry CRC and size";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v52, &v51, 1);
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4)) {
      BOOL v16 = *((unsigned __int16 *)buffer_ptr + 4) == (unsigned __int16)BUZipDeflateCompressionMethod;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      id v17 = objc_alloc_init(BUZipEntry);
      objc_msgSend_setCompressed_(v17, v18, v14[4] == (unsigned __int16)BUZipDeflateCompressionMethod);
      id v19 = objc_alloc(MEMORY[0x263EFF910]);
      BOOL v21 = objc_msgSend_bu_initWithDOSTime_(v19, v20, v14[6] | ((unint64_t)v14[5] << 16));
      objc_msgSend_setLastModificationDate_(v17, v22, (uint64_t)v21);

      objc_msgSend_setCRC_(v17, v23, *(unsigned int *)(v14 + 7));
      objc_msgSend_setCompressedSize_(v17, v24, *(unsigned int *)(v14 + 9));
      objc_msgSend_setSize_(v17, v25, *(unsigned int *)(v14 + 11));
      objc_msgSend_setOffset_(v17, v26, a4);
      objc_msgSend_setNameLength_(v17, v27, v14[13]);
      objc_msgSend_setExtraFieldsLength_(v17, v28, v14[14]);
      unint64_t v29 = v14[14] + (unint64_t)v14[13];
      objc_msgSend_setFileHeaderLength_(v17, v30, v29 + 30);
      int64_t v31 = a4 + 30;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = sub_21E1DF52C;
      v44[3] = &unk_26449DF88;
      v44[4] = self;
      v45 = v17;
      id v46 = v11;
      id v32 = v17;
      objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v33, (uint64_t)v10, v31, v29, v44);

      goto LABEL_21;
    }
    id v41 = (void *)MEMORY[0x263F087E8];
    v49 = @"BUZipArchiveErrorDescription";
    v50 = @"Unsupported compression method";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v50, &v49, 1);
  v42 = };
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v41, v43, (uint64_t)v42);
  id v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v32)
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v40, 0);
    id v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, void, BUZipEntry *, void))v11 + 2))(v11, 0, v32, 0);
LABEL_21:
}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  size_t v10 = size_ptr;
  unsigned int v13 = objc_msgSend_nameLength(v8, v11, v12);
  if (v10 >= objc_msgSend_extraFieldsLength(v8, v14, v15) + (unint64_t)v13)
  {
    uint64_t v23 = objc_msgSend_nameLength(v8, v16, v17);
    id v34 = 0;
    int v25 = objc_msgSend_readFilenameFromBuffer_nameLength_entry_dataSize_error_(self, v24, (uint64_t)&buffer_ptr, v23, v8, &size_ptr, &v34);
    id v19 = v34;
    if (!v25)
    {
      char v22 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    if (!objc_msgSend_extraFieldsLength(v8, v26, v27))
    {
      char v22 = 1;
      goto LABEL_11;
    }
    uint64_t v30 = objc_msgSend_extraFieldsLength(v8, v28, v29);
    id v33 = v19;
    char v22 = objc_msgSend_readExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error_(self, v31, (uint64_t)&buffer_ptr, v30, v8, &size_ptr, &v33);
    id v21 = v33;
  }
  else
  {
    id v18 = (void *)MEMORY[0x263F087E8];
    v37 = @"BUZipArchiveErrorDescription";
    v38[0] = @"Wrong data size for BUZipLocalFileHeaderRecord filename and extra fields";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v38, &v37, 1);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v18, v20, (uint64_t)v19);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    char v22 = 0;
  }

  id v19 = v21;
  if (!a5) {
    goto LABEL_11;
  }
LABEL_9:
  if ((v22 & 1) == 0)
  {
    id v19 = v19;
    char v22 = 0;
    *a5 = v19;
  }
LABEL_11:

  return v22;
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  unsigned int v7 = v4;
  if (v4)
  {
    id v8 = objc_msgSend_name(v4, v5, v6);
    size_t v10 = objc_msgSend_normalizeEntryName_(self, v9, (uint64_t)v8);

    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v11, (uint64_t)v10);

    if (v12)
    {
      id v14 = BUZipLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_21E1F18B0();
      }
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_entriesMap, v13, (uint64_t)v7, v10);
      objc_msgSend_addObject_(self->_entries, v15, (uint64_t)v7);
    }
  }
}

- (id)readChannelForEntry:(id)a3
{
  return (id)objc_msgSend_readChannelForEntry_validateCRC_(self, a2, (uint64_t)a3, 1);
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_msgSend_containsObject_(self->_entries, v7, (uint64_t)v6))
  {
    unsigned int isCompressed = objc_msgSend_isCompressed(v6, v8, v9);
    id v11 = [BUZipReadChannel alloc];
    isCompressed ^= 1u;
    unsigned int v13 = objc_msgSend_initWithEntry_archive_validateCRC_(v11, v12, (uint64_t)v6, self, v4 & isCompressed);
    if ((isCompressed & 1) == 0)
    {
      id v14 = [BUBufferedReadChannel alloc];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = sub_21E1DF9E4;
      v18[3] = &unk_26449E028;
      id v19 = v6;
      BOOL v20 = v4;
      uint64_t ChannelBlock = objc_msgSend_initWithReadChannel_blockInfos_streamReadChannelBlock_(v14, v15, (uint64_t)v13, 0, v18);

      unsigned int v13 = (void *)ChannelBlock;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_streamReadChannelForEntry_validateCRC_, a3);
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_msgSend_containsObject_(self->_entries, v7, (uint64_t)v6))
  {
    int isCompressed = objc_msgSend_isCompressed(v6, v8, v9);
    id v11 = [BUZipReadChannel alloc];
    isCompressed ^= 1u;
    unsigned int v13 = objc_msgSend_initWithEntry_archive_validateCRC_(v11, v12, (uint64_t)v6, self, v4 & isCompressed);
    if ((isCompressed & 1) == 0)
    {
      id v14 = [BUZipInflateReadChannel alloc];
      objc_msgSend_size(v6, v15, v16);
      uint64_t v19 = objc_msgSend_size(v6, v17, v18);
      uint64_t v22 = objc_msgSend_CRC(v6, v20, v21);
      uint64_t Channel_uncompressedSize_CRC_validateCRC = objc_msgSend_initWithReadChannel_uncompressedSize_CRC_validateCRC_(v14, v23, (uint64_t)v13, v19, v22, v4);

      unsigned int v13 = (void *)Channel_uncompressedSize_CRC_validateCRC;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)MEMORY[0x270F9A6D0](BUContainedZipArchive, sel_zipArchiveFromEntry_zipArchive_options_error_, a3);
}

- (id)normalizeEntryName:(id)a3
{
  id v4 = a3;
  unsigned int v7 = v4;
  if ((self->_options & 2) != 0)
  {
    uint64_t v8 = objc_msgSend_lowercaseString(v4, v5, v6);

    unsigned int v7 = (void *)v8;
  }
  uint64_t v9 = objc_msgSend_precomposedStringWithCanonicalMapping(v7, v5, v6);

  return v9;
}

- (id)entryForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v6 = v4;
    unsigned int v7 = objc_msgSend_normalizeEntryName_(self, v5, (uint64_t)v4);

    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v8, (uint64_t)v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_entries;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, v20, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v5);
      }
      unsigned int v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      id v14 = objc_msgSend_usableName(v13, v8, v9, (void)v15);
      v4[2](v4, v14, v13, &v19);

      if (v19) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v15, v20, 16);
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)collapseCommonRootDirectory
{
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  BOOL v35 = sub_21E1DFFD0;
  id v36 = sub_21E1DFFE0;
  id v37 = 0;
  v3 = (void *)MEMORY[0x223C22810](self, a2);
  entriesMap = self->_entriesMap;
  unint64_t v5 = (self->_options >> 1) & 1 | 2;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  void v31[2] = sub_21E1DFFE8;
  v31[3] = &unk_26449E050;
  v31[4] = &v32;
  v31[5] = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(entriesMap, v6, (uint64_t)v31);
  if (objc_msgSend_count((void *)v33[5], v7, v8))
  {
    uint64_t v11 = objc_msgSend_pathWithComponents_(NSString, v9, v33[5]);
    uint64_t v14 = objc_msgSend_length(v11, v12, v13);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v14 = objc_msgSend_length(0, v9, v10);
  }
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v19 = objc_msgSend_count(self->_entriesMap, v17, v18);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v16, v20, v19);
    uint64_t v22 = (void *)MEMORY[0x223C22810]();
    uint64_t v23 = self->_entriesMap;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_21E1E01C4;
    v27[3] = &unk_26449E078;
    uint64_t v30 = v15;
    id v24 = v21;
    uint64_t v28 = v24;
    uint64_t v29 = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v23, v25, (uint64_t)v27);

    unsigned int v26 = self->_entriesMap;
    self->_entriesMap = v24;
  }
  _Block_object_dispose(&v32, 8);
}

- (unint64_t)archiveLength
{
  char v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Abstract method", "-[BUZipArchive archiveLength]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)newArchiveReadChannel
{
  char v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Abstract method", "-[BUZipArchive newArchiveReadChannel]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isValid
{
  char v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Abstract method", "-[BUZipArchive isValid]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  unint64_t v5 = objc_msgSend_descriptionWithObject_class_(BUDescription, v4, (uint64_t)self, v3);
  uint64_t v8 = objc_msgSend_array(self->_entries, v6, v7);
  uint64_t v9 = BUArrayDescription(v8);
  objc_msgSend_addField_value_(v5, v10, @"entries", v9);

  uint64_t v13 = objc_msgSend_descriptionString(v5, v11, v12);

  return v13;
}

- (unint64_t)totalSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E1E05A0;
  v4[3] = &unk_26449DE98;
  v4[4] = &v5;
  objc_msgSend_enumerateEntriesUsingBlock_(self, a2, (uint64_t)v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)extractToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend_extractToURL_error_shouldExtractEntry_didExtractEntry_(self, a2, (uint64_t)a3, a4, 0, 0);
}

- (BOOL)extractToURL:(id)a3 error:(id *)a4 shouldExtractEntry:(id)a5 didExtractEntry:(id)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v56 = a3;
  v62 = (unsigned int (**)(id, void *, void *))a5;
  id v55 = a6;
  v58 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  v59 = objc_msgSend_path(v56, v10, v11);
  v74[0] = 0;
  if (objc_msgSend_fileExistsAtPath_isDirectory_(v58, v12, (uint64_t)v59, v74))
  {
    id v14 = 0;
    if (!v74[0])
    {
      BOOL v15 = 0;
      id v60 = 0;
      goto LABEL_36;
    }
    goto LABEL_5;
  }
  id v73 = 0;
  char v16 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v13, (uint64_t)v59, 1, 0, &v73);
  id v14 = v73;
  if (v16)
  {
LABEL_5:
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = sub_21E1E0BEC;
    v71[3] = &unk_26449DD60;
    id v18 = v17;
    id v72 = v18;
    objc_msgSend_enumerateEntriesUsingBlock_(self, v19, (uint64_t)v71);
    objc_msgSend_sortUsingSelector_(v18, v20, (uint64_t)sel_compare_);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v18;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v67, v75, 16);
    if (v23)
    {
      id v60 = 0;
      uint64_t v24 = *(void *)v68;
      char v25 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v68 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v28 = objc_msgSend_entryForName_(self, v22, (uint64_t)v27);
          uint64_t v30 = objc_msgSend_stringByAppendingPathComponent_(v59, v29, (uint64_t)v27);
          id v31 = objc_alloc(NSURL);
          inited = objc_msgSend_initFileURLWithPath_(v31, v32, (uint64_t)v30);
          if (!v62 || v62[2](v62, v28, inited))
          {
            uint64_t v36 = objc_msgSend_length(v27, v33, v34);
            if (objc_msgSend_characterAtIndex_(v27, v37, v36 - 1) == 47)
            {
              v40 = objc_msgSend_path(inited, v38, v39);
              id v66 = v14;
              char v25 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v41, (uint64_t)v40, 1, 0, &v66);
              id v42 = v66;

              if (v42) {
                id v43 = v42;
              }
              else {
                id v43 = v60;
              }
              id v44 = v43;

              id v60 = v44;
              id v14 = v42;
            }
            else
            {
              v45 = objc_msgSend_stringByDeletingLastPathComponent(v30, v38, v39);
              id v65 = v14;
              char v25 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v46, (uint64_t)v45, 1, 0, &v65);
              id v47 = v65;

              char v64 = 0;
              id v63 = v47;
              LODWORD(v45) = objc_msgSend_extractFromArchive_destinationURL_error_(v28, v48, (uint64_t)self, v56, &v63);
              id v14 = v63;

              if (v45)
              {
                uint64_t v49 = MEMORY[0x223C22A70](v55);
                v50 = (void *)v49;
                if (v49) {
                  (*(void (**)(uint64_t, void *, void *, char *))(v49 + 16))(v49, v28, inited, &v64);
                }
              }
              else
              {
                v50 = v60;
                id v60 = v14;
              }

              if (v64)
              {

                goto LABEL_30;
              }
            }
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v67, v75, 16);
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v60 = 0;
      char v25 = 1;
    }
LABEL_30:

    BOOL v15 = v25 & 1;
    goto LABEL_31;
  }
  v51 = BUZipLog();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    sub_21E1F1A08(v51);
  }

  id v14 = v14;
  BOOL v15 = 0;
  id v60 = v14;
LABEL_31:
  if (v60)
  {
    v52 = BUZipLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      sub_21E1F1918();
    }
  }
  else
  {
    id v60 = 0;
  }
LABEL_36:
  if (a4) {
    *a4 = v60;
  }

  return v15;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
}

- (NSMutableOrderedSet)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void)setEndOfLastEntry:(int64_t)a3
{
  self->_endOfLastEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end