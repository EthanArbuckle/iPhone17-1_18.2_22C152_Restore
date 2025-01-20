@interface APConfigurationDecompressor
- (APConfigurationDecompressor)init;
- (BOOL)untarFileAtPath:(id)a3;
- (BOOL)unzipContentsOfFileAtPath:(id)a3 toPath:(id)a4;
- (NSFileManager)filemanager;
- (char)typeForObject:(id)a3 atOffset:(unint64_t)a4;
- (id)dataForObject:(id)a3 inLocation:(unint64_t)a4 andLength:(unint64_t)a5;
- (id)nameForObject:(id)a3 atOffset:(unint64_t)a4;
- (id)unzipData:(id)a3;
- (int64_t)decompressTarAtPath:(id)a3 toPath:(id)a4;
- (unint64_t)sizeForFileAtPath:(id)a3;
- (unint64_t)sizeForObject:(id)a3 atOffset:(unint64_t)a4;
- (void)removeFileAtPath:(id)a3;
- (void)setFilemanager:(id)a3;
- (void)writeFileDataForFile:(id)a3 atLocation:(unint64_t)a4 withLength:(unint64_t)a5 atPath:(id)a6;
@end

@implementation APConfigurationDecompressor

- (APConfigurationDecompressor)init
{
  v8.receiver = self;
  v8.super_class = (Class)APConfigurationDecompressor;
  v4 = [(APConfigurationDecompressor *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v2, v3);
    filemanager = v4->_filemanager;
    v4->_filemanager = (NSFileManager *)v5;
  }
  return v4;
}

- (int64_t)decompressTarAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_filemanager(self, v8, v9);
  char v12 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v6);

  if (v12)
  {
    if (objc_msgSend_unzipContentsOfFileAtPath_toPath_(self, v13, (uint64_t)v6, v7))
    {
      if (objc_msgSend_untarFileAtPath_(self, v14, (uint64_t)v7))
      {
        objc_msgSend_removeFileAtPath_(self, v15, (uint64_t)v7);
        int64_t v16 = 1200;
      }
      else
      {
        v19 = APLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_24718C000, v19, OS_LOG_TYPE_ERROR, "Error: Could not untar file.", v21, 2u);
        }

        int64_t v16 = 1506;
      }
    }
    else
    {
      v18 = APLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_24718C000, v18, OS_LOG_TYPE_ERROR, "Error: Could not decompress file.", v22, 2u);
      }

      int64_t v16 = 1505;
    }
  }
  else
  {
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24718C000, v17, OS_LOG_TYPE_ERROR, "Error: File doesn't exist.", buf, 2u);
    }

    int64_t v16 = 1504;
  }

  return v16;
}

- (BOOL)unzipContentsOfFileAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v8 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v7, (uint64_t)a3);
  v10 = objc_msgSend_unzipData_(self, v9, (uint64_t)v8);

  if (objc_msgSend_length(v10, v11, v12))
  {
    id v22 = 0;
    objc_msgSend_writeToFile_options_error_(v10, v13, (uint64_t)v6, 0x10000000, &v22);
    id v14 = v22;
    if (!v14)
    {
      BOOL v20 = 1;
      goto LABEL_8;
    }
    v15 = v14;
    int64_t v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend_description(v15, v17, v18);
      *(_DWORD *)buf = 138478083;
      id v24 = v6;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_24718C000, v16, OS_LOG_TYPE_ERROR, "Error: Unable to create decompressed file: %{private}@, error: %{public}@.", buf, 0x16u);
    }
  }
  BOOL v20 = 0;
LABEL_8:

  return v20;
}

- (id)unzipData:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  memset(&v40.avail_in, 0, 104);
  v40.avail_in = objc_msgSend_length(v3, v4, v5);
  id v6 = v3;
  v40.next_in = (Bytef *)objc_msgSend_bytes(v6, v7, v8);
  v40.avail_out = 0;
  int v9 = inflateInit2_(&v40, 47, "1.2.12", 112);
  if (v9)
  {
    int v12 = v9;
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v42 = v12;
      _os_log_impl(&dword_24718C000, v13, OS_LOG_TYPE_ERROR, "Error: Could not unzip, error: %d", buf, 8u);
    }

    id v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x263EFF990];
    uint64_t v16 = objc_msgSend_length(v6, v10, v11);
    uint64_t v18 = objc_msgSend_dataWithCapacity_(v15, v17, 2 * v16);
    do
    {
      v19 = (void *)MEMORY[0x24C54AC10]();
      uLong total_out = v40.total_out;
      if (total_out >= objc_msgSend_length(v18, v21, v22))
      {
        unint64_t v25 = objc_msgSend_length(v6, v23, v24);
        uint64_t v28 = objc_msgSend_length(v18, v26, v27);
        objc_msgSend_setLength_(v18, v29, v28 + (v25 >> 1));
      }
      id v14 = v18;
      uint64_t v32 = objc_msgSend_mutableBytes(v14, v30, v31);
      v40.next_out = (Bytef *)(v32 + v40.total_out);
      int v35 = objc_msgSend_length(v14, v33, v34);
      v40.avail_out = v35 - LODWORD(v40.total_out);
      int v36 = inflate(&v40, 2);
    }
    while (!v36);
    int v37 = inflateEnd(&v40);
    if (v36 == 1 && !v37) {
      objc_msgSend_setLength_(v14, v38, v40.total_out);
    }
  }

  return v14;
}

- (BOOL)untarFileAtPath:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_stringByDeletingLastPathComponent(v4, v5, v6);
  unint64_t v9 = objc_msgSend_sizeForFileAtPath_(self, v8, (uint64_t)v4);
  v61 = v4;
  v13 = objc_msgSend_fileHandleForReadingAtPath_(MEMORY[0x263F08840], v10, (uint64_t)v4);
  if (v9)
  {
    unint64_t v15 = 0;
    *(void *)&long long v14 = 138478083;
    long long v60 = v14;
    v62 = v7;
    while (1)
    {
      uint64_t v16 = (void *)MEMORY[0x24C54AC10]();
      int v18 = objc_msgSend_typeForObject_atOffset_(self, v17, (uint64_t)v13, v15);
      if (v18 <= 52) {
        break;
      }
      if (v18 == 53)
      {
        z_stream v40 = objc_msgSend_nameForObject_atOffset_(self, v19, (uint64_t)v13, v15);
        int v42 = objc_msgSend_stringByAppendingPathComponent_(v7, v41, (uint64_t)v40);
        v45 = objc_msgSend_stringByStandardizingPath(v42, v43, v44);
        v48 = objc_msgSend_stringByResolvingSymlinksInPath(v45, v46, v47);

        if (objc_msgSend_hasPrefix_(v48, v49, (uint64_t)v7))
        {
          v52 = objc_msgSend_filemanager(self, v50, v51);
          id v63 = 0;
          objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v52, v53, (uint64_t)v48, 1, 0, &v63);
          id v54 = v63;

          if (v54)
          {
            v55 = APLogForCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v58 = objc_msgSend_description(v54, v56, v57);
              *(_DWORD *)buf = v60;
              v65 = v48;
              __int16 v66 = 2114;
              v67 = v58;
              _os_log_impl(&dword_24718C000, v55, OS_LOG_TYPE_ERROR, "Error: Unable to create directory: %{private}@, error: %{public}@.", buf, 0x16u);
            }
          }
        }
        else
        {
          id v54 = 0;
        }

        unint64_t v39 = 1;
        goto LABEL_25;
      }
      if (v18 != 120) {
        goto LABEL_14;
      }
      unint64_t v39 = 2;
LABEL_26:
      v15 += v39 << 9;
      if (v15 >= v9) {
        goto LABEL_27;
      }
    }
    if (!v18)
    {
      unint64_t v39 = 1;
      goto LABEL_26;
    }
    if (v18 == 48)
    {
      BOOL v20 = objc_msgSend_nameForObject_atOffset_(self, v19, (uint64_t)v13, v15);
      uint64_t v22 = objc_msgSend_stringByAppendingPathComponent_(v7, v21, (uint64_t)v20);
      unint64_t v25 = objc_msgSend_stringByStandardizingPath(v22, v23, v24);
      objc_msgSend_stringByResolvingSymlinksInPath(v25, v26, v27);
      v29 = uint64_t v28 = (uint64_t)v7;

      uint64_t v31 = objc_msgSend_sizeForObject_atOffset_(self, v30, (uint64_t)v13, v15);
      if (v31 && (uint64_t v33 = v31, objc_msgSend_hasPrefix_(v29, v32, v28)))
      {
        int v36 = objc_msgSend_lastPathComponent(v20, v34, v35);
        if (objc_msgSend_isEqualToString_(v36, v37, @"ConfigurationNode.json")) {
          objc_msgSend_writeFileDataForFile_atLocation_withLength_atPath_(self, v38, (uint64_t)v13, v15 + 512, v33, v29);
        }
        unint64_t v39 = ((unint64_t)(v33 - 1) >> 9) + 2;
      }
      else
      {
        unint64_t v39 = 1;
      }

LABEL_25:
      id v7 = v62;
      goto LABEL_26;
    }
LABEL_14:
    unint64_t v39 = (unint64_t)((double)((unint64_t)objc_msgSend_sizeForObject_atOffset_(self, v19, (uint64_t)v13, v15, v60) >> 9)+ 1.0);
    goto LABEL_26;
  }
LABEL_27:
  objc_msgSend_closeFile(v13, v11, v12, v60);

  return 1;
}

- (unint64_t)sizeForFileAtPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_filemanager(self, v5, v6);
  id v20 = 0;
  unint64_t v9 = objc_msgSend_attributesOfItemAtPath_error_(v7, v8, (uint64_t)v4, &v20);
  id v10 = v20;

  if (v10)
  {
    uint64_t v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = objc_msgSend_description(v10, v13, v14);
      *(_DWORD *)buf = 138478083;
      id v22 = v4;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_impl(&dword_24718C000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get attributes for decompressed file: %{private}@, error: %{public}@.", buf, 0x16u);
    }
    unint64_t v16 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_objectForKey_(v9, v11, *MEMORY[0x263F080B8]);
    unint64_t v16 = objc_msgSend_unsignedLongLongValue(v12, v17, v18);
  }

  return v16;
}

- (void)removeFileAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_filemanager(self, v5, v6);
  id v14 = 0;
  objc_msgSend_removeItemAtPath_error_(v7, v8, (uint64_t)v4, &v14);
  id v9 = v14;

  if (v9)
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend_description(v9, v11, v12);
      *(_DWORD *)buf = 138478083;
      id v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      _os_log_impl(&dword_24718C000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to remove file: %{private}@, error: %{public}@.", buf, 0x16u);
    }
  }
}

- (char)typeForObject:(id)a3 atOffset:(unint64_t)a4
{
  id v4 = objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4 + 156, 1);
  if (objc_msgSend_length(v4, v5, v6))
  {
    id v7 = v4;
    char v10 = *(unsigned char *)objc_msgSend_bytes(v7, v8, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)nameForObject:(id)a3 atOffset:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4, 100);
  char v18 = 0;
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_bytes(v4, v5, v6);
  long long v9 = *(_OWORD *)(v7 + 16);
  long long v8 = *(_OWORD *)(v7 + 32);
  v16[0] = *(_OWORD *)v7;
  v16[1] = v9;
  v16[2] = v8;
  long long v11 = *(_OWORD *)(v7 + 64);
  long long v10 = *(_OWORD *)(v7 + 80);
  long long v12 = *(_OWORD *)(v7 + 48);
  int v17 = *(_DWORD *)(v7 + 96);
  v16[4] = v11;
  v16[5] = v10;
  v16[3] = v12;
  id v14 = objc_msgSend_stringWithCString_encoding_(NSString, v13, (uint64_t)v16, 1);

  return v14;
}

- (unint64_t)sizeForObject:(id)a3 atOffset:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4 + 124, 12);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_bytes(v4, v5, v6);
  char v12 = 0;
  *(void *)__str = *(void *)v7;
  int v11 = *(_DWORD *)(v7 + 8);
  unint64_t v8 = strtol(__str, 0, 8);

  return v8;
}

- (void)writeFileDataForFile:(id)a3 atLocation:(unint64_t)a4 withLength:(unint64_t)a5 atPath:(id)a6
{
  id v28 = a3;
  id v9 = a6;
  char v12 = objc_msgSend_data(MEMORY[0x263EFF8F8], v10, v11);
  int v14 = objc_msgSend_writeToFile_atomically_(v12, v13, (uint64_t)v9, 0);

  if (v14)
  {
    id v16 = objc_msgSend_fileHandleForWritingAtPath_(MEMORY[0x263F08840], v15, (uint64_t)v9);
    uint64_t v18 = objc_msgSend_seekToFileOffset_(v28, v17, a4);
    if (a5 >= 0xC801)
    {
      do
      {
        id v20 = (void *)MEMORY[0x24C54AC10](v18);
        id v22 = objc_msgSend_readDataOfLength_(v28, v21, 51200);
        objc_msgSend_writeData_(v16, v23, (uint64_t)v22);

        a5 -= 51200;
      }
      while (a5 > 0xC800);
    }
    uint64_t v24 = objc_msgSend_readDataOfLength_(v28, v19, a5);
    objc_msgSend_writeData_(v16, v25, (uint64_t)v24);

    objc_msgSend_closeFile(v16, v26, v27);
  }
}

- (id)dataForObject:(id)a3 inLocation:(unint64_t)a4 andLength:(unint64_t)a5
{
  id v7 = a3;
  objc_msgSend_seekToFileOffset_(v7, v8, a4);
  long long v10 = objc_msgSend_readDataOfLength_(v7, v9, a5);

  return v10;
}

- (NSFileManager)filemanager
{
  return self->_filemanager;
}

- (void)setFilemanager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end