@interface BUZipEntry
- (BOOL)extractFromArchive:(id)a3 destinationURL:(id)a4 error:(id *)a5;
- (BOOL)isCompressed;
- (BOOL)isSymLink;
- (NSDate)lastModificationDate;
- (NSString)collapsedName;
- (NSString)name;
- (_xmlDoc)xmlDocumentFromArchive:(id)a3;
- (id)_dataFromArchive:(id)a3 error:(id *)a4;
- (id)_extractFromArchiveData:(id)a3 destinationURL:(id)a4 allowEntriesOutsideRoot:(BOOL)a5 error:(id *)a6;
- (id)dataFromArchive:(id)a3;
- (id)description;
- (id)extractFromArchive:(id)a3;
- (id)plistFromArchive:(id)a3;
- (id)stringFromArchive:(id)a3;
- (id)usableName;
- (unint64_t)compressedSize;
- (unint64_t)fileHeaderLength;
- (unint64_t)offset;
- (unint64_t)size;
- (unsigned)CRC;
- (unsigned)externalFileAttributes;
- (unsigned)extraFieldsLength;
- (unsigned)nameLength;
- (void)_beginStreamingWriteForArchive:(id)a3 forDestinationURL:(id)a4 completion:(id)a5;
- (void)setCRC:(unsigned int)a3;
- (void)setCollapsedName:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setCompressedSize:(unint64_t)a3;
- (void)setExternalFileAttributes:(unsigned int)a3;
- (void)setExtraFieldsLength:(unsigned __int16)a3;
- (void)setFileHeaderLength:(unint64_t)a3;
- (void)setLastModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNameLength:(unsigned __int16)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation BUZipEntry

- (id)description
{
  v3 = NSString;
  v4 = BUObjectReferenceDescription(self);
  v7 = objc_msgSend_name(self, v5, v6);
  v10 = objc_msgSend_collapsedName(self, v8, v9);
  uint64_t v13 = objc_msgSend_size(self, v11, v12);
  uint64_t v16 = objc_msgSend_compressedSize(self, v14, v15);
  uint64_t v19 = objc_msgSend_CRC(self, v17, v18);
  uint64_t v22 = objc_msgSend_offset(self, v20, v21);
  unsigned int v25 = objc_msgSend_extraFieldsLength(self, v23, v24);
  v27 = objc_msgSend_stringWithFormat_(v3, v26, @"<%@> %@ (%@) size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu", v4, v7, v10, v13, v16, v19, v22, v25);

  return v27;
}

- (BOOL)isSymLink
{
  return objc_msgSend_externalFileAttributes(self, a2, v2) >> 28 == 10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void)setLastModificationDate:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (NSString)collapsedName
{
  return self->_collapsedName;
}

- (void)setCollapsedName:(id)a3
{
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (unint64_t)compressedSize
{
  return self->_compressedSize;
}

- (void)setCompressedSize:(unint64_t)a3
{
  self->_compressedSize = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unsigned)nameLength
{
  return self->_nameLength;
}

- (void)setNameLength:(unsigned __int16)a3
{
  self->_nameLength = a3;
}

- (unsigned)extraFieldsLength
{
  return self->_extraFieldsLength;
}

- (void)setExtraFieldsLength:(unsigned __int16)a3
{
  self->_extraFieldsLength = a3;
}

- (unint64_t)fileHeaderLength
{
  return self->_fileHeaderLength;
}

- (void)setFileHeaderLength:(unint64_t)a3
{
  self->_fileHeaderLength = a3;
}

- (unsigned)externalFileAttributes
{
  return self->_externalFileAttributes;
}

- (void)setExternalFileAttributes:(unsigned int)a3
{
  self->_externalFileAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedName, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)usableName
{
  v4 = objc_msgSend_collapsedName(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_name(self, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)_dataFromArchive:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_readChannelForEntry_(v6, v7, (uint64_t)self);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_21E1E9D38;
  v30 = sub_21E1E9D48;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_21E1E9D38;
  uint64_t v24 = sub_21E1E9D48;
  id v25 = 0;
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E1E9D50;
  v16[3] = &unk_26449E4B0;
  uint64_t v18 = &v26;
  uint64_t v19 = &v20;
  v10 = v9;
  v17 = v10;
  objc_msgSend_readWithHandler_(v8, v11, (uint64_t)v16);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_close(v8, v12, v13);
  if (a4) {
    *a4 = (id) v21[5];
  }
  id v14 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)stringFromArchive:(id)a3
{
  id v13 = 0;
  v3 = objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v13);
  id v4 = v13;
  if (v3)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    dispatch_data_t v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    id v6 = [NSString alloc];
    id v8 = objc_msgSend_initWithBytes_length_encoding_(v6, v7, (uint64_t)buffer_ptr, size_ptr, 4);
  }
  else
  {
    uint64_t v9 = BUZipLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F24EC();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)dataFromArchive:(id)a3
{
  id v13 = 0;
  v3 = objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v13);
  id v4 = v13;
  if (v3)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    dispatch_data_t v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v8 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v5);
  }
  else
  {
    uint64_t v9 = BUZipLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F24EC();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)plistFromArchive:(id)a3
{
  id v15 = 0;
  v3 = objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v15);
  id v4 = v15;
  if (v3)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    dispatch_data_t v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    id v12 = 0;
    v7 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v6, (uint64_t)v5, 0, 0, &v12);
    id v8 = v12;
    if (v8)
    {
      uint64_t v9 = BUZipLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2554();
      }

      v7 = 0;
    }
  }
  else
  {
    v10 = BUZipLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21E1F24EC();
    }

    v7 = 0;
  }

  return v7;
}

- (_xmlDoc)xmlDocumentFromArchive:(id)a3
{
  id v4 = a3;
  id v38 = 0;
  id v6 = objc_msgSend__dataFromArchive_error_(self, v5, (uint64_t)v4, &v38);
  id v7 = v38;
  if (v6)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    id v8 = dispatch_data_create_map(v6, (const void **)&buffer_ptr, &size_ptr);
    int v11 = objc_msgSend_length(v8, v9, v10);
    int v13 = v11;
    if (v11 >= 4) {
      int v14 = 4;
    }
    else {
      int v14 = v11;
    }
    if (size_ptr >> 31) {
      objc_msgSend_raise_format_(MEMORY[0x263EFF940], v12, @"BUDataRepresentationError", @"Overflow in xmlDocument %ld", size_ptr);
    }
    id v15 = v8;
    uint64_t v18 = (const char *)objc_msgSend_bytes(v15, v16, v17);
    xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(0, 0, v18, v14, 0);
    if (!PushParserCtxt) {
      objc_msgSend_raise_format_(MEMORY[0x263EFF940], v19, @"BUDataRepresentationError", @"xmlCreatePushParserCtxt() failed");
    }
    if (size_ptr)
    {
      uint64_t v21 = v15;
      uint64_t v24 = objc_msgSend_bytes(v21, v22, v23);
      uint64_t v25 = xmlParseChunk(PushParserCtxt, (const char *)(v24 + v14), v13 - v14, 0);
      if (v25) {
        objc_msgSend_raise_format_(MEMORY[0x263EFF940], v26, @"BUDataRepresentationError", @"xmlParseChunk() failed: %d", v25);
      }
    }
    v27 = v15;
    v30 = (const char *)objc_msgSend_bytes(v27, v28, v29);
    uint64_t v31 = xmlParseChunk(PushParserCtxt, v30, 0, 1);
    if (v31) {
      objc_msgSend_raise_format_(MEMORY[0x263EFF940], v32, @"BUDataRepresentationError", @"xmlParseChunk() failed: %d", v31);
    }
    myDoc = PushParserCtxt->myDoc;
    if (!PushParserCtxt->wellFormed) {
      objc_msgSend_raise_format_(MEMORY[0x263EFF940], v32, @"BUDataRepresentationError", @"XML document is not well formed.");
    }
    xmlFreeParserCtxt(PushParserCtxt);
  }
  else
  {
    v34 = BUZipLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_21E1F24EC();
    }

    myDoc = 0;
  }

  return myDoc;
}

- (id)extractFromArchive:(id)a3
{
  id v4 = a3;
  dispatch_data_t v5 = [BUTemporaryDirectory alloc];
  id v46 = 0;
  id v7 = objc_msgSend_initWithError_(v5, v6, (uint64_t)&v46);
  id v10 = v46;
  if (v7)
  {
    int v11 = objc_msgSend_URL(v7, v8, v9);
    unint64_t v14 = objc_msgSend_options(v4, v12, v13);
    id v15 = NSURL;
    uint64_t v18 = objc_msgSend_usableName(self, v16, v17);
    uint64_t v20 = objc_msgSend_fileURLWithPath_relativeToURL_(v15, v19, (uint64_t)v18, v11);

    if ((v14 & 0x10) != 0 || objc_msgSend_bu_isContainedWithinFileURL_(v20, v21, (uint64_t)v11))
    {
      id v45 = v10;
      uint64_t v22 = objc_msgSend__dataFromArchive_error_(self, v21, (uint64_t)v4, &v45);
      id v23 = v45;

      if (v22)
      {
        id v42 = v23;
        uint64_t v26 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v24, v25);
        v43 = v20;
        uint64_t v29 = objc_msgSend_URLByDeletingLastPathComponent(v20, v27, v28);
        id v44 = 0;
        char v31 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v26, v30, (uint64_t)v29, 1, 0, &v44);
        id v32 = v44;

        if (v31)
        {
          v34 = objc_msgSend__extractFromArchiveData_destinationURL_allowEntriesOutsideRoot_error_(self, v33, (uint64_t)v22, v11, (v14 >> 4) & 1, 0);

          if (v34) {
            objc_msgSend_leakTemporaryDirectory(v7, v35, v36);
          }
        }
        else
        {
          v40 = BUZipLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_21E1F268C(v43, (const char *)v32, (uint64_t)v40);
          }

          v34 = 0;
        }
        id v23 = v42;
        uint64_t v20 = v43;
      }
      else
      {
        v37 = BUZipLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_21E1F24EC();
        }

        v34 = 0;
      }
    }
    else
    {
      BUZipLog();
      id v38 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
        sub_21E1F272C(self, v38, v39);
      }

      v34 = 0;
      id v23 = v10;
    }

    id v10 = v23;
  }
  else
  {
    int v11 = BUZipLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2624();
    }
    v34 = 0;
  }

  return v34;
}

- (id)_extractFromArchiveData:(id)a3 destinationURL:(id)a4 allowEntriesOutsideRoot:(BOOL)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v10 = a4;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  int v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  id v12 = NSURL;
  id v15 = objc_msgSend_usableName(self, v13, v14);
  uint64_t v17 = objc_msgSend_fileURLWithPath_relativeToURL_(v12, v16, (uint64_t)v15, v10);

  if (objc_msgSend_isSymLink(self, v18, v19))
  {
    id v21 = [NSString alloc];
    id v23 = (char *)objc_msgSend_initWithData_encoding_(v21, v22, (uint64_t)v11, 4);
    if (objc_msgSend_length(v23, v24, v25))
    {
      uint64_t v28 = objc_msgSend_URLByDeletingLastPathComponent(v17, v26, v27);
      v30 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v29, (uint64_t)v23, v28);
      v33 = v30;
      if (a5 || objc_msgSend_bu_isContainedWithinFileURL_(v30, v31, (uint64_t)v10))
      {
        v60 = v33;
        v34 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v31, v32);
        v37 = objc_msgSend_path(v17, v35, v36);
        id v62 = 0;
        int v39 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v34, v38, (uint64_t)v37, v23, &v62);
        id v40 = v62;

        if (v39)
        {
          id v41 = v17;
          id v42 = 0;
        }
        else
        {
          v53 = BUZipLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v59 = objc_msgSend_path(v17, v54, v55);
            *(_DWORD *)buf = 138412802;
            v66 = v59;
            __int16 v67 = 2112;
            v68 = v23;
            __int16 v69 = 2112;
            id v70 = v40;
            _os_log_error_impl(&dword_21E1C7000, v53, OS_LOG_TYPE_ERROR, "Error creating symlink at %@ with destination %@: %@", buf, 0x20u);
          }
          id v40 = v40;
          id v41 = 0;
          id v42 = v40;
        }
        v33 = v60;
      }
      else
      {
        v56 = BUZipLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_21E1F2830(self, v23, (uint64_t)v56);
        }

        id v40 = 0;
        id v42 = 0;
        id v41 = 0;
      }
    }
    else
    {
      uint64_t v28 = BUZipLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_21E1F27C0(v28, v46, v47, v48, v49, v50, v51, v52);
      }
      id v40 = 0;
      id v42 = 0;
      id v41 = 0;
    }

    id v44 = 0;
  }
  else
  {
    id v61 = 0;
    char v43 = objc_msgSend_writeToURL_options_error_(v11, v20, (uint64_t)v17, 268435457, &v61);
    id v44 = v61;
    if (v43)
    {
      id v41 = v17;
      id v42 = 0;
    }
    else
    {
      id v45 = BUZipLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_21E1F28C0();
      }

      id v42 = v44;
      id v41 = 0;
      id v44 = v42;
    }
  }
  if (a6) {
    *a6 = v42;
  }
  id v57 = v41;

  return v57;
}

- (BOOL)extractFromArchive:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_21E1E9D38;
  uint64_t v48 = sub_21E1E9D48;
  id v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  id v10 = NSURL;
  uint64_t v13 = objc_msgSend_path(v9, v11, v12);
  id v15 = objc_msgSend_fileURLWithPath_isDirectory_(v10, v14, v13, 1);

  LOBYTE(v13) = objc_msgSend_options(v8, v16, v17);
  id v18 = objc_alloc(NSURL);
  id v21 = objc_msgSend_usableName(self, v19, v20);
  inited = objc_msgSend_initFileURLWithPath_relativeToURL_(v18, v22, (uint64_t)v21, v15);
  unint64_t v24 = v13 & 0x10;

  if (v13 & 0x10) != 0 || (objc_msgSend_bu_isContainedWithinFileURL_(inited, v25, (uint64_t)v15))
  {
    uint64_t v26 = BUZipLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v8;
      _os_log_impl(&dword_21E1C7000, v26, OS_LOG_TYPE_DEFAULT, "Beginning streaming extraction for archive %@", buf, 0xCu);
    }

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_21E1EADA4;
    v34[3] = &unk_26449E4D8;
    v37 = &v44;
    v34[4] = self;
    id v35 = inited;
    char v39 = v24 >> 4;
    id v36 = v15;
    id v38 = &v40;
    objc_msgSend__beginStreamingWriteForArchive_forDestinationURL_completion_(self, v27, (uint64_t)v8, v35, v34);
    if (a5) {
      *a5 = (id) v45[5];
    }
    BOOL v28 = *((unsigned char *)v41 + 24) != 0;
  }
  else
  {
    uint64_t v29 = BUZipLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_msgSend_name(self, v30, v31);
      *(_DWORD *)buf = 138412290;
      id v51 = v32;
      _os_log_impl(&dword_21E1C7000, v29, OS_LOG_TYPE_DEFAULT, "Skipping entry because it is outside the root of the zip: %@", buf, 0xCu);
    }
    BOOL v28 = 0;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

- (void)_beginStreamingWriteForArchive:(id)a3 forDestinationURL:(id)a4 completion:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [BUTemporaryDirectory alloc];
  id v63 = 0;
  uint64_t v13 = objc_msgSend_initForWritingToURL_error_(v11, v12, (uint64_t)v9, &v63);
  id v16 = v63;
  if (v13)
  {
    uint64_t v17 = objc_msgSend_URL(v13, v14, v15);
    uint64_t v20 = objc_msgSend_lastPathComponent(v9, v18, v19);
    uint64_t v22 = objc_msgSend_URLByAppendingPathComponent_(v17, v21, (uint64_t)v20);

    id v45 = objc_msgSend_readChannelForEntry_(v8, v23, (uint64_t)self);
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = sub_21E1E9D38;
    id v61 = sub_21E1E9D48;
    unint64_t v24 = [BUFileIOChannel alloc];
    id v56 = 0;
    uint64_t v26 = objc_msgSend_initForStreamWritingURL_error_(v24, v25, (uint64_t)v22, &v56);
    id v27 = v56;
    id v62 = v26;
    if (v58[5])
    {
      uint64_t v50 = 0;
      id v51 = &v50;
      uint64_t v52 = 0x3032000000;
      v53 = sub_21E1E9D38;
      v54 = sub_21E1E9D48;
      id v55 = 0;
      BOOL v28 = dispatch_group_create();
      dispatch_group_enter(v28);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = sub_21E1EB5F4;
      v46[3] = &unk_26449E500;
      uint64_t v48 = &v50;
      uint64_t v29 = v28;
      uint64_t v47 = v29;
      id v49 = &v57;
      objc_msgSend_readWithHandler_(v45, v30, (uint64_t)v46);
      dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend_close(v45, v31, v32);
      objc_msgSend_close((void *)v58[5], v33, v34);
      if (v51[5])
      {
        id v35 = BUZipLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = v51[5];
          *(_DWORD *)buf = 138412802;
          id v65 = v8;
          __int16 v66 = 2112;
          __int16 v67 = v22;
          __int16 v68 = 2112;
          uint64_t v69 = v44;
          _os_log_error_impl(&dword_21E1C7000, v35, OS_LOG_TYPE_ERROR, "Failed to write archive %@ to URL %@. Error: %@", buf, 0x20u);
        }

        uint64_t v36 = MEMORY[0x223C22A70](v10);
        v37 = (void *)v36;
        if (v36) {
          (*(void (**)(uint64_t, void, uint64_t))(v36 + 16))(v36, 0, v51[5]);
        }
      }
      else
      {
        uint64_t v43 = MEMORY[0x223C22A70](v10);
        v37 = (void *)v43;
        if (v43) {
          (*(void (**)(uint64_t, void *, void))(v43 + 16))(v43, v22, 0);
        }
      }

      _Block_object_dispose(&v50, 8);
    }
    else
    {
      uint64_t v40 = BUZipLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2A8C();
      }

      uint64_t v41 = MEMORY[0x223C22A70](v10);
      uint64_t v42 = (void *)v41;
      if (v41) {
        (*(void (**)(uint64_t, void, id))(v41 + 16))(v41, 0, v27);
      }
    }
    _Block_object_dispose(&v57, 8);
  }
  else
  {
    id v38 = BUZipLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2A24();
    }

    uint64_t v39 = MEMORY[0x223C22A70](v10);
    uint64_t v22 = (void *)v39;
    if (v39) {
      (*(void (**)(uint64_t, void, id))(v39 + 16))(v39, 0, v16);
    }
  }
}

@end