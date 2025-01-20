@interface BUZipReadChannel
- (BOOL)isValid;
- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6;
- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4;
- (BOOL)validateCRC;
- (BUReadChannel)archiveReadChannel;
- (BUZipArchive)archive;
- (BUZipEntry)entry;
- (BUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4;
- (void)readWithHandler:(id)a3;
- (void)setArchive:(id)a3;
- (void)setArchiveReadChannel:(id)a3;
- (void)setEntry:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)setValidateCRC:(BOOL)a3;
@end

@implementation BUZipReadChannel

- (BUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BUZipReadChannel;
  v11 = [(BUZipReadChannel *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    uint64_t Channel = objc_msgSend_newArchiveReadChannel(v10, v13, v14);
    archiveReaduint64_t Channel = v12->_archiveReadChannel;
    v12->_archiveReaduint64_t Channel = (BUReadChannel *)Channel;

    if (!v12->_archiveReadChannel)
    {

      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUZipReadChannel;
  [(BUZipReadChannel *)&v4 dealloc];
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_compressedSize(self->_entry, v5, v6);
  uint64_t v10 = objc_msgSend_fileHeaderLength(self->_entry, v8, v9);
  if (v10)
  {
    objc_msgSend_readWithFileHeaderLength_handler_(self, v11, v10, v4);
  }
  else
  {
    unsigned int v13 = objc_msgSend_nameLength(self->_entry, v11, v12);
    unsigned int v16 = objc_msgSend_extraFieldsLength(self->_entry, v14, v15);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_21E1E39E8;
    v37[4] = sub_21E1E39F8;
    v17 = (void *)MEMORY[0x263EF8388];
    id v18 = MEMORY[0x263EF8388];
    id v38 = v17;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 1;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    int v32 = 0;
    int v32 = crc32(0, 0, 0);
    archiveReaduint64_t Channel = self->_archiveReadChannel;
    uint64_t v22 = objc_msgSend_offset(self->_entry, v20, v21);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_21E1E3A00;
    v24[3] = &unk_26449E190;
    v26 = v33;
    v24[4] = self;
    id v25 = v4;
    v27 = v37;
    v28 = v35;
    v29 = v31;
    unint64_t v30 = v13 + (unint64_t)v16 + 30;
    objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v23, v22, v30 + v7, v24);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a5;
  unint64_t v11 = objc_msgSend_compressedSize(self->_entry, v9, v10);
  unint64_t v14 = v11;
  if (a3 < 0 || v11 < a3)
  {
    uint64_t v15 = BUZipLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend_name(self->_entry, v16, v17);
      *(_DWORD *)buf = 138412802;
      char v34 = v28;
      __int16 v35 = 2048;
      unint64_t v36 = v14;
      __int16 v37 = 2048;
      int64_t v38 = a3;
      _os_log_error_impl(&dword_21E1C7000, v15, OS_LOG_TYPE_ERROR, "Requested range is not within the entry: %@. Size: %llu. Requested offset: %llu", buf, 0x20u);
    }
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1, MEMORY[0x263EF8388], 0);
  }
  else
  {
    if (v11 - a3 < a4) {
      a4 = v11 - a3;
    }
    if (a3 || a4 != v11)
    {
      uint64_t v18 = objc_msgSend_fileHeaderLength(self->_entry, v12, v13);
      if (v18)
      {
        uint64_t v21 = v18;
        archiveReaduint64_t Channel = self->_archiveReadChannel;
        uint64_t v23 = objc_msgSend_offset(self->_entry, v19, v20);
        objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v24, v21 + a3 + v23, a4, v8);
      }
      else
      {
        id v25 = self->_archiveReadChannel;
        uint64_t v26 = objc_msgSend_offset(self->_entry, v19, v20);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = sub_21E1E3E70;
        v29[3] = &unk_26449E1B8;
        v29[4] = self;
        int64_t v31 = a3;
        unint64_t v32 = a4;
        id v30 = v8;
        objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v27, (uint64_t)v25, v26, 30, v29);
      }
    }
    else
    {
      objc_msgSend_readWithHandler_(self, v12, (uint64_t)v8);
    }
  }
}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  uint64_t v6 = a3;
  size_t size = dispatch_data_get_size(v6);
  if (size == 30)
  {
    subrange = v6;
    goto LABEL_5;
  }
  if (size >= 0x1F)
  {
    subrange = dispatch_data_create_subrange(v6, 0, 0x1EuLL);
LABEL_5:
    uint64_t v9 = (char *)subrange;
    size_t v24 = 0;
    buffer_ptr = 0;
    dispatch_data_t v12 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v24);
    uint64_t v13 = (unsigned __int16 *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      int v14 = *((unsigned __int16 *)buffer_ptr + 4);
      if (*((_WORD *)buffer_ptr + 4)) {
        BOOL v15 = v14 == (unsigned __int16)BUZipDeflateCompressionMethod;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15
        && (((v14 != (unsigned __int16)BUZipDeflateCompressionMethod) ^ objc_msgSend_isCompressed(self->_entry, v10, v11)) & 1) != 0)
      {
        unint64_t v17 = v13[13] + (unint64_t)v13[14] + 30;
        *a4 = v17;
        objc_msgSend_setFileHeaderLength_(self->_entry, v16, v17);
        BOOL v18 = 1;
LABEL_18:

        goto LABEL_22;
      }
      BUZipLog();
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_21E1F1D58((uint64_t)self, v19, v21);
      }
    }
    else
    {
      BUZipLog();
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_21E1F1DE0((uint64_t)self, v19, v20);
      }
    }

    BOOL v18 = 0;
    goto LABEL_18;
  }
  BUZipLog();
  uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    sub_21E1F1E68((uint64_t)self, v9, v22);
  }
  BOOL v18 = 0;
LABEL_22:

  return v18;
}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  int v21 = crc32(0, 0, 0);
  archiveReaduint64_t Channel = self->_archiveReadChannel;
  uint64_t v10 = objc_msgSend_offset(self->_entry, v8, v9);
  uint64_t v13 = objc_msgSend_compressedSize(self->_entry, v11, v12);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E1E4240;
  v16[3] = &unk_26449E1E0;
  BOOL v18 = v22;
  v16[4] = self;
  id v14 = v6;
  id v17 = v14;
  v19 = v20;
  objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v15, v10 + a3, v13, v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v10 = a3;
  uint64_t v11 = (void (**)(id, BOOL, NSObject *, void))a6;
  if (a4
    && self->_validateCRC
    && (applier[0] = MEMORY[0x263EF8330],
        applier[1] = 3221225472,
        applier[2] = sub_21E1E443C,
        applier[3] = &unk_26449E200,
        applier[4] = a4,
        dispatch_data_apply(v10, applier),
        v7)
    && objc_msgSend_CRC(self->_entry, v12, v13) != *a4)
  {
    BUZipLog();
    unsigned int v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1EF0((void **)&self->_entry, v16, v17);
    }

    objc_msgSend_handleFailureWithHandler_error_(self, v18, (uint64_t)v11, 0);
    BOOL v14 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    BOOL v14 = 1;
  }

  return v14;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  if (a4)
  {
    v5 = (void (*)(void))*((void *)a3 + 2);
    id v9 = a3;
    v5();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    id v7 = a3;
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v6, v8, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void))a3 + 2))(v7, 1, 0);
  }
}

- (void)close
{
  objc_msgSend_close(self->_archiveReadChannel, a2, v2);
  archiveReaduint64_t Channel = self->_archiveReadChannel;
  self->_archiveReaduint64_t Channel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;
}

- (void)setLowWater:(unint64_t)a3
{
}

- (void)addBarrier:(id)a3
{
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUReadChannel *, char *))MEMORY[0x270F9A6D0])(self->_archiveReadChannel, sel_isValid);
}

- (BUZipEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (BUZipArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (BOOL)validateCRC
{
  return self->_validateCRC;
}

- (void)setValidateCRC:(BOOL)a3
{
  self->_validateCRC = a3;
}

- (BUReadChannel)archiveReadChannel
{
  return self->_archiveReadChannel;
}

- (void)setArchiveReadChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);

  objc_storeStrong((id *)&self->_entry, 0);
}

@end