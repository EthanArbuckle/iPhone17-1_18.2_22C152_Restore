@interface BLPurchaseDAAPParser
+ (id)decodeData:(id)a3;
+ (id)decodeHexString:(id)a3;
+ (id)sharedInstance;
+ (id)typeForDRCPValueType:(int64_t)a3;
- (id)parseBookletItem:(const char *)a3 count:(int64_t)a4;
- (id)parseBookletListing:(const char *)a3 count:(int64_t)a4;
- (id)parseBrowseResults:(const char *)a3 count:(int64_t)a4;
- (id)parseContentCodes:(const char *)a3 count:(int64_t)a4;
- (id)parseControlPromptCollection:(const char *)a3 count:(int64_t)a4;
- (id)parseControlPromptResponse:(const char *)a3 count:(int64_t)a4;
- (id)parseDACPPropertyResponse:(const char *)a3 count:(int64_t)a4;
- (id)parseDeletedIDsList:(const char *)a3 count:(int64_t)a4;
- (id)parseError:(const char *)a3 count:(int64_t)a4;
- (id)parseFlavor:(const char *)a3 size:(int64_t)a4;
- (id)parseFlavorListing:(const char *)a3 size:(int64_t)a4;
- (id)parseGetSpeakersResponse:(const char *)a3 count:(int64_t)a4;
- (id)parseListingCollection:(const char *)a3 count:(int64_t)a4 capacity:(int)a5;
- (id)parseListingHeader:(const char *)a3 count:(int64_t)a4;
- (id)parseListingItem:(const char *)a3 count:(int64_t)a4;
- (id)parseLogin:(const char *)a3 count:(int64_t)a4;
- (id)parseMACAddressListing:(const char *)a3 count:(int64_t)a4;
- (id)parseServerInfo:(const char *)a3 count:(int64_t)a4;
- (id)parseUTF8String:(const char *)a3 length:(int64_t)a4;
- (id)parseUnicodeCharacter:(const char *)a3 count:(int64_t)a4;
- (id)parseXMLContent:(const char *)a3 count:(int64_t)a4;
- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 count:(int64_t)a5;
- (unint64_t)SwapInt64BigToHost:(const char *)a3 size:(int64_t)a4;
- (void)parseDict:(const char *)a3 size:(int64_t)a4 intoDict:(id)a5;
- (void)setBool:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setDate:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setFloat32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setSInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setSInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setString:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt64:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6;
- (void)unknownCode:(unsigned int)a3 bytes:(const char *)a4 size:(int64_t)a5 context:(const char *)a6;
@end

@implementation BLPurchaseDAAPParser

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E000F04;
  block[3] = &unk_26448ACA0;
  block[4] = a1;
  if (qword_26AB400C8 != -1) {
    dispatch_once(&qword_26AB400C8, block);
  }
  v2 = (void *)qword_26AB3FFB0;

  return v2;
}

+ (id)decodeHexString:(id)a3
{
  v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, @" ", (uint64_t)&stru_26CED4330);
  id v5 = objc_alloc_init(MEMORY[0x263EFF990]);
  __int16 v22 = 0;
  if ((unint64_t)objc_msgSend_length(v4, v6, v7, v8) >= 2)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 1;
    do
    {
      __str[0] = objc_msgSend_characterAtIndex_(v4, v9, v12 - 1, v10);
      __str[1] = objc_msgSend_characterAtIndex_(v4, v13, v12, v14);
      HIBYTE(v22) = strtol(__str, 0, 16);
      objc_msgSend_appendBytes_length_(v5, v15, (uint64_t)&v22 + 1, 1);
      ++v11;
      v12 += 2;
    }
    while (v11 < (unint64_t)objc_msgSend_length(v4, v16, v17, v18) >> 1);
  }
  v19 = objc_msgSend_decodeData_(a1, v9, (uint64_t)v5, v10);

  return v19;
}

+ (id)decodeData:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(BLPurchaseDAAPParser, v4, v5, v6);
  unint64_t v11 = objc_msgSend_length(v3, v8, v9, v10);
  if (v11 <= 7)
  {
    uint64_t v12 = BLJaliscoLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      v13 = "DMAPParser processResponse: couldn't get 8-byte message header";
      uint64_t v14 = v12;
      uint32_t v15 = 2;
LABEL_7:
      _os_log_impl(&dword_21DFE3000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v27, v15);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unint64_t v16 = v11;
  id v17 = v3;
  v21 = (unsigned int *)objc_msgSend_bytes(v17, v18, v19, v20);
  unint64_t v23 = bswap32(v21[1]);
  unint64_t v24 = v16 - 8;
  if (v16 - 8 < v23)
  {
    uint64_t v12 = BLJaliscoLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315650;
      v28 = "+[BLPurchaseDAAPParser decodeData:]";
      __int16 v29 = 2048;
      unint64_t v30 = v23;
      __int16 v31 = 2048;
      unint64_t v32 = v24;
      v13 = "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld";
      uint64_t v14 = v12;
      uint32_t v15 = 32;
      goto LABEL_7;
    }
LABEL_8:

    v25 = 0;
    goto LABEL_10;
  }
  v25 = objc_msgSend_processResponseCode_bytes_count_(v7, v22, bswap32(*v21), (uint64_t)(v21 + 2), v23);
LABEL_10:

  return v25;
}

- (unint64_t)SwapInt64BigToHost:(const char *)a3 size:(int64_t)a4
{
  uint64_t v6 = malloc_type_malloc(a4, 0xB07F0A64uLL);
  memcpy(v6, a3, a4);
  unint64_t v7 = bswap64(*v6);
  free(v6);
  return v7;
}

- (id)parseUTF8String:(const char *)a3 length:(int64_t)a4
{
  if (a4 < 1)
  {
    uint64_t v9 = &stru_26CED4330;
  }
  else
  {
    if (a4 == 1 && !*a3)
    {
      uint64_t v9 = &stru_26CED4330;
    }
    else
    {
      id v7 = [NSString alloc];
      uint64_t v9 = (__CFString *)objc_msgSend_initWithBytes_length_encoding_(v7, v8, (uint64_t)a3, a4, 4);
    }
  }
  return v9;
}

- (id)parseUnicodeCharacter:(const char *)a3 count:(int64_t)a4
{
  if (a4 == 2)
  {
    id v6 = [NSString alloc];
    uint64_t v8 = objc_msgSend_initWithBytes_length_encoding_(v6, v7, (uint64_t)a3, 2, 2415919360);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)parseXMLContent:(const char *)a3 count:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a4 < 1)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3, a4);
    id v14 = 0;
    id v6 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v5, (uint64_t)v4, 0, 0, &v14);
    id v7 = v14;
    if (v7)
    {
      uint64_t v8 = BLJaliscoLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_msgSend_description(v7, v9, v10, v11);
        *(_DWORD *)buf = 138412290;
        unint64_t v16 = v12;
        _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Attempting to process XML response: %@", buf, 0xCu);
      }
    }
  }

  return v6;
}

- (id)parseFlavorListing:(const char *)a3 size:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_12:
    id v19 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          v25 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
          __int16 v26 = 2048;
          uint64_t v27 = 4;
          __int16 v28 = 2048;
          int64_t v29 = v9;
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
      unint64_t v10 = bswap32(*((_DWORD *)v5 + 1));
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          v25 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
          __int16 v26 = 2048;
          uint64_t v27 = v10;
          __int16 v28 = 2048;
          int64_t v29 = v11;
LABEL_20:
          _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
        }
        goto LABEL_21;
      }
      unsigned int v15 = *(_DWORD *)v5;
      uint64_t v14 = (uint64_t)(v5 + 8);
      unsigned int v13 = v15;
      if (v15 == 1718183265)
      {
        uint64_t v18 = objc_msgSend_parseFlavor_size_(self, v7, v14, v10);
        if (v18) {
          objc_msgSend_addObject_(v8, v16, (uint64_t)v18, v17);
        }
      }
      else
      {
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, bswap32(v13), v14, v10, "-[BLPurchaseDAAPParser parseFlavorListing:size:]");
      }
      uint64_t v5 = (const char *)(v14 + v10);
      if (v4 <= 0) {
        goto LABEL_12;
      }
    }
    uint64_t v20 = BLJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      v25 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
      __int16 v26 = 2048;
      uint64_t v27 = 4;
      __int16 v28 = 2048;
      int64_t v29 = v4;
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
    }

LABEL_22:
    id v19 = 0;
  }

  return v19;
}

- (id)parseFlavor:(const char *)a3 size:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v5 = (unsigned int *)a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_32:
    id v16 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        uint64_t v18 = BLJaliscoLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315650;
          __int16 v22 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
          __int16 v23 = 2048;
          uint64_t v24 = 4;
          __int16 v25 = 2048;
          int64_t v26 = v9;
          goto LABEL_40;
        }
LABEL_41:

        goto LABEL_42;
      }
      unint64_t v10 = bswap32(v5[1]);
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        uint64_t v18 = BLJaliscoLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315650;
          __int16 v22 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
          __int16 v23 = 2048;
          uint64_t v24 = v10;
          __int16 v25 = 2048;
          int64_t v26 = v11;
LABEL_40:
          _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
        }
        goto LABEL_41;
      }
      unsigned int v14 = *v5;
      uint64_t v13 = (uint64_t)(v5 + 2);
      int v15 = bswap32(v14);
      if (v15 > 1634952298)
      {
        if (v15 <= 1634954354)
        {
          if (v15 == 1634952299)
          {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songdatakind");
          }
          else if (v15 == 1634952813)
          {
            objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songformat");
          }
        }
        else
        {
          switch(v15)
          {
            case 1634954355:
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songlongsize");
              break;
            case 1634956146:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songsamplerate");
              break;
            case 1634956397:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songtime");
              break;
          }
        }
      }
      else if (v15 <= 1634951793)
      {
        if (v15 == 1634030192)
        {
          objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.item-redownload-param-2");
        }
        else if (v15 == 1634035300)
        {
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.item-flavor-id");
        }
      }
      else
      {
        switch(v15)
        {
          case 1634951794:
            objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songbitrate");
            break;
          case 1634952036:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songcodectype");
            break;
          case 1634952051:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.songcodecsubtype");
            break;
        }
      }
      uint64_t v5 = (unsigned int *)(v13 + v10);
      if (v4 <= 0) {
        goto LABEL_32;
      }
    }
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315650;
      __int16 v22 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
      __int16 v23 = 2048;
      uint64_t v24 = 4;
      __int16 v25 = 2048;
      int64_t v26 = v4;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
    }

LABEL_42:
    id v16 = 0;
  }

  return v16;
}

- (void)setBool:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  switch(a4)
  {
    case 1:
      int v11 = *(unsigned __int8 *)a3;
      goto LABEL_8;
    case 2:
      int v11 = *(unsigned __int16 *)a3;
      goto LABEL_8;
    case 4:
      int v11 = *(_DWORD *)a3;
LABEL_8:
      BOOL v13 = v11 == 0;
      goto LABEL_10;
    case 8:
      BOOL v13 = *(void *)a3 == 0;
LABEL_10:
      uint64_t v14 = !v13;
      id v15 = objc_alloc(NSNumber);
      uint64_t v18 = objc_msgSend_initWithBool_(v15, v16, v14, v17);
      objc_msgSend_setObject_forKey_(v9, v19, (uint64_t)v18, (uint64_t)v10);

      break;
    default:
      BOOL v12 = BLJaliscoLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134218242;
        int64_t v21 = a4;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "setBool being passed a %ld byte value for: <%@>!", (uint8_t *)&v20, 0x16u);
      }

      break;
  }
}

- (void)setSInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (a4 == 1)
  {
    uint64_t v11 = *a3;
    id v12 = objc_alloc(NSNumber);
    id v15 = objc_msgSend_initWithChar_(v12, v13, v11, v14);
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v15, (uint64_t)v10);
  }
  else
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "setSInt8 being passed a %ld byte value for: <%@>!", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)setUInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (a4 == 1)
  {
    uint64_t v11 = *(unsigned __int8 *)a3;
    id v12 = objc_alloc(NSNumber);
    id v15 = objc_msgSend_initWithUnsignedChar_(v12, v13, v11, v14);
    objc_msgSend_setValue_forKey_(v9, v16, (uint64_t)v15, (uint64_t)v10);
  }
  else
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "setUInt8 being passed a %ld byte value for: <%@>!", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)setSInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (a4 == 2)
  {
    int v11 = bswap32(*(unsigned __int16 *)a3);
    id v12 = objc_alloc(NSNumber);
    id v15 = objc_msgSend_initWithShort_(v12, v13, (v11 >> 16), v14);
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v15, (uint64_t)v10);
  }
  else
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "setSInt16 being passed a %ld byte value for: <%@>!", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)setUInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (a4 == 2)
  {
    uint64_t v11 = bswap32(*(unsigned __int16 *)a3) >> 16;
    id v12 = objc_alloc(NSNumber);
    id v15 = objc_msgSend_initWithUnsignedShort_(v12, v13, v11, v14);
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v15, (uint64_t)v10);
  }
  else
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "setUInt16 being passed a %ld byte value for: <%@>!", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)setDate:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  if (a4 == 4)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF910];
    double v9 = (double)bswap32(*(_DWORD *)a3);
    id v10 = a6;
    id v11 = a5;
    objc_msgSend_dateWithTimeIntervalSince1970_(v8, v12, v13, v14, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v11, v15, (uint64_t)v16, (uint64_t)v10);
  }
}

- (void)setUInt32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  if (a4 == 4)
  {
    uint64_t v8 = bswap32(*(_DWORD *)a3);
    double v9 = (objc_class *)NSNumber;
    id v10 = a6;
    id v11 = a5;
    id v12 = [v9 alloc];
    id v16 = (id)objc_msgSend_initWithUnsignedInt_(v12, v13, v8, v14);
    objc_msgSend_setObject_forKey_(v11, v15, (uint64_t)v16, (uint64_t)v10);
  }
}

- (void)setFloat32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (a4 == 4)
  {
    int v11 = *(_DWORD *)a3;
    id v12 = objc_alloc(NSNumber);
    LODWORD(v13) = v11;
    uint64_t v17 = objc_msgSend_initWithFloat_(v12, v14, v15, v16, v13);
    objc_msgSend_setObject_forKey_(v9, v18, (uint64_t)v17, (uint64_t)v10);
  }
  else
  {
    int64_t v19 = BLJaliscoLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134218242;
      int64_t v21 = a4;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "setFloat32 being passed a %ld byte value for: <%@>!", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)setUInt64:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v12 = a6;
  if (a4 == 8)
  {
    uint64_t v13 = objc_msgSend_SwapInt64BigToHost_size_(self, v11, (uint64_t)a3, 8);
    id v14 = objc_alloc(NSNumber);
    uint64_t v17 = objc_msgSend_initWithUnsignedLongLong_(v14, v15, v13, v16);
    objc_msgSend_setObject_forKey_(v10, v18, (uint64_t)v17, (uint64_t)v12);
  }
  else
  {
    int64_t v19 = BLJaliscoLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134218242;
      int64_t v21 = a4;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "setUInt64 being passed a %ld byte value for: <%@>!", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)setString:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  if (a4 >= 1)
  {
    id v11 = a6;
    id v12 = a5;
    objc_msgSend_parseUTF8String_length_(self, v13, (uint64_t)a3, a4);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v12, v14, (uint64_t)v15, (uint64_t)v11);
  }
}

- (void)unknownCode:(unsigned int)a3 bytes:(const char *)a4 size:(int64_t)a5 context:(const char *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3 == 1634028888)
  {
    id v7 = BLJaliscoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      int64_t v19 = a6;
      uint64_t v8 = "Unexpected xmlcode! at %s";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_20:
      _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, v10);
    }
  }
  else
  {
    switch(a5)
    {
      case 0:
        id v7 = BLJaliscoLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316418;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = 0;
          uint64_t v8 = "Unknown code at %s: '%c%c%c%c', size=%ld";
          goto LABEL_19;
        }
        break;
      case 1:
        id v7 = BLJaliscoLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v14 = *(unsigned __int8 *)a4;
          int v18 = 136316674;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = 1;
          __int16 v30 = 1024;
          LODWORD(v31) = v14;
          uint64_t v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=%u";
          goto LABEL_16;
        }
        break;
      case 2:
        id v7 = BLJaliscoLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v15 = *(unsigned __int16 *)a4;
          int v18 = 136316674;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = 2;
          __int16 v30 = 1024;
          LODWORD(v31) = v15;
          uint64_t v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=%u";
          goto LABEL_16;
        }
        break;
      case 4:
        id v7 = BLJaliscoLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v17 = *(_DWORD *)a4;
          int v18 = 136316674;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = 4;
          __int16 v30 = 1024;
          LODWORD(v31) = v17;
          uint64_t v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=0x%x";
LABEL_16:
          id v9 = v7;
          uint32_t v10 = 52;
          goto LABEL_20;
        }
        break;
      case 8:
        id v7 = BLJaliscoLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316418;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = 8;
          uint64_t v8 = "Unknown code at %s: '%c%c%c%c', size=%ld";
LABEL_19:
          id v9 = v7;
          uint32_t v10 = 46;
          goto LABEL_20;
        }
        break;
      default:
        id v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)a4, a5);
        uint64_t v16 = BLJaliscoLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316674;
          int64_t v19 = a6;
          __int16 v20 = 1024;
          int v21 = (int)a3 >> 24;
          __int16 v22 = 1024;
          int v23 = (int)(a3 << 8) >> 24;
          __int16 v24 = 1024;
          int v25 = (__int16)a3 >> 8;
          __int16 v26 = 1024;
          int v27 = (char)a3;
          __int16 v28 = 2048;
          int64_t v29 = a5;
          __int16 v30 = 2112;
          __int16 v31 = v7;
          _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_ERROR, "Unknown code at %s: '%c%c%c%c', size=%ld, value=%@", (uint8_t *)&v18, 0x38u);
        }

        break;
    }
  }
}

- (id)parseMACAddressListing:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_10:
    id v22 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        __int16 v24 = BLJaliscoLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v27 = 136315650;
          __int16 v28 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
          __int16 v29 = 2048;
          uint64_t v30 = 4;
          __int16 v31 = 2048;
          int64_t v32 = v9;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v10 = bswap32(*((_DWORD *)v5 + 1));
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        __int16 v24 = BLJaliscoLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v27 = 136315650;
          __int16 v28 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
          __int16 v29 = 2048;
          uint64_t v30 = v10;
          __int16 v31 = 2048;
          int64_t v32 = v11;
LABEL_18:
          _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v27, 0x20u);
        }
        goto LABEL_19;
      }
      unsigned int v15 = *(_DWORD *)v5;
      uint64_t v14 = (uint64_t)(v5 + 8);
      unsigned int v13 = v15;
      if (v15 == 1634562925)
      {
        uint64_t v16 = objc_msgSend_SwapInt64BigToHost_size_(self, v7, v14, v10);
        int64_t v19 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v17, v16, v18);
        objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21);
      }
      else
      {
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, bswap32(v13), v14, v10, "-[BLPurchaseDAAPParser parseMACAddressListing:count:]");
      }
      uint64_t v5 = (const char *)(v14 + v10);
      if (v4 <= 0) {
        goto LABEL_10;
      }
    }
    int v23 = BLJaliscoLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315650;
      __int16 v28 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
      __int16 v29 = 2048;
      uint64_t v30 = 4;
      __int16 v31 = 2048;
      int64_t v32 = v4;
      _os_log_impl(&dword_21DFE3000, v23, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v27, 0x20u);
    }

LABEL_20:
    id v22 = 0;
  }

  return v22;
}

- (id)parseServerInfo:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v5 = (unsigned int *)a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, a4);
  if (v4 < 1 || !v5)
  {
LABEL_110:
    id v18 = v8;
    goto LABEL_121;
  }
  while ((unint64_t)v4 > 3)
  {
    int64_t v9 = v4 - 4;
    if ((unint64_t)(v4 - 4) <= 3)
    {
      __int16 v20 = BLJaliscoLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315650;
        __int16 v24 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
        __int16 v25 = 2048;
        uint64_t v26 = 4;
        __int16 v27 = 2048;
        int64_t v28 = v9;
        goto LABEL_118;
      }
LABEL_119:

      goto LABEL_120;
    }
    unint64_t v10 = bswap32(v5[1]);
    int64_t v11 = v4 - 8;
    BOOL v12 = v4 - 8 >= v10;
    int64_t v4 = v4 - 8 - v10;
    if (!v12)
    {
      __int16 v20 = BLJaliscoLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315650;
        __int16 v24 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
        __int16 v25 = 2048;
        uint64_t v26 = v10;
        __int16 v27 = 2048;
        int64_t v28 = v11;
LABEL_118:
        _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v23, 0x20u);
      }
      goto LABEL_119;
    }
    unsigned int v14 = *v5;
    uint64_t v13 = (uint64_t)(v5 + 2);
    uint64_t v15 = bswap32(v14);
    if ((int)v15 > 1836278130)
    {
      if ((int)v15 > 1836281195)
      {
        if ((int)v15 > 1836282988)
        {
          if ((int)v15 <= 1836282995)
          {
            if (v15 == 1836282989)
            {
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.timeoutinterval");
            }
            else
            {
              if (v15 != 1836282991) {
                goto LABEL_109;
              }
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.utcoffset");
            }
          }
          else
          {
            switch(v15)
            {
              case 0x7070726F:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"ppro");
                break;
              case 0x6D737570:
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsupdate");
                break;
              case 0x6D737474:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.status");
                break;
              default:
                goto LABEL_109;
            }
          }
        }
        else if ((int)v15 <= 1836282232)
        {
          if (v15 == 1836281196)
          {
            uint64_t v16 = objc_msgSend_parseMACAddressListing_count_(self, v7, v13, v10);
            objc_msgSend_setValue_forKey_(v8, v17, (uint64_t)v16, @"macAddresses");
          }
          else
          {
            if (v15 != 1836281961) {
              goto LABEL_109;
            }
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportspersistentids");
          }
        }
        else
        {
          switch(v15)
          {
            case 0x6D737179:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsquery");
              break;
            case 0x6D737273:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsresolve");
              break;
            case 0x6D737463:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.utctime");
              break;
            default:
              goto LABEL_109;
          }
        }
      }
      else if ((int)v15 > 1836279159)
      {
        if ((int)v15 <= 1836280183)
        {
          if (v15 == 1836279160)
          {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsextensions");
            goto LABEL_107;
          }
          if (v15 != 1836280169) {
            goto LABEL_109;
          }
          objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsinlinecontaineritems");
        }
        else
        {
          switch(v15)
          {
            case 0x6D736978:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsindex");
              break;
            case 0x6D736C69:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportslongitemid");
              break;
            case 0x6D736C72:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.loginrequired");
              break;
            default:
              goto LABEL_109;
          }
        }
      }
      else if ((int)v15 <= 1836278385)
      {
        if (v15 == 1836278131)
        {
          objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.authenticationschemes");
        }
        else
        {
          if (v15 != 1836278133) {
            goto LABEL_109;
          }
          objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.authenticationmethod");
        }
      }
      else
      {
        switch(v15)
        {
          case 0x6D736272:
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsbrowse");
            break;
          case 0x6D736463:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.databasescount");
            break;
          case 0x6D736564:
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"supportsEditing");
            break;
          default:
            goto LABEL_109;
        }
      }
    }
    else if ((int)v15 > 1635013461)
    {
      if ((int)v15 > 1835626092)
      {
        if ((int)v15 <= 1835888229)
        {
          if (v15 == 1835626093)
          {
            objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.itemname");
            goto LABEL_107;
          }
          if (v15 != 1835885676) {
            goto LABEL_109;
          }
          objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"model");
        }
        else
        {
          switch(v15)
          {
            case 0x6D6D6E66:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"manufacturer");
              break;
            case 0x6D70726F:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.protocolversion");
              break;
            case 0x6D73616C:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.supportsautologout");
              break;
            default:
              goto LABEL_109;
          }
        }
      }
      else if ((int)v15 <= 1685484664)
      {
        if (v15 == 1635013462)
        {
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"Client-ATV-Sharing-Version");
        }
        else
        {
          if (v15 != 1635018084) {
            goto LABEL_109;
          }
          objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.supportsextradata");
        }
      }
      else
      {
        switch(v15)
        {
          case 0x64767479:
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"deviceType");
            break;
          case 0x6D656473:
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.editcommandssupported");
            break;
          case 0x6D696C64:
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, v13, v10, v8, @"dmap.longitemid");
            break;
          default:
            goto LABEL_109;
        }
      }
    }
    else if ((int)v15 > 1634030423)
    {
      if ((int)v15 <= 1634759278)
      {
        if (v15 == 1634030424)
        {
          objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.supportedextensions");
          goto LABEL_107;
        }
        if (v15 != 1634038895) {
          goto LABEL_109;
        }
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.cloud-purchase-token");
      }
      else
      {
        switch(v15)
        {
          case 0x6170726F:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.protocolversion");
            break;
          case 0x61736772:
            objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.supportsgroups");
            break;
          case 0x61737365:
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"daap.supportssetproperty");
            break;
          default:
LABEL_109:
            objc_msgSend_unknownCode_bytes_size_context_(self, v7, v15, v13, v10, "-[BLPurchaseDAAPParser parseServerInfo:count:]");
            break;
        }
      }
    }
    else if ((int)v15 <= 1634027089)
    {
      if (v15 == 1634026320)
      {
        objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"supportsPurchases");
        goto LABEL_107;
      }
      if (v15 != 1634027088) {
        goto LABEL_109;
      }
      objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.req-fplay");
    }
    else
    {
      switch(v15)
      {
        case 0x61654652:
          objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.supports-fprap");
          break;
        case 0x61654D51:
          objc_msgSend_setBool_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.playlist-contains-media-type");
          break;
        case 0x61655356:
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, v13, v10, v8, @"com.apple.itunes.music-sharing-version");
          break;
        default:
          goto LABEL_109;
      }
    }
LABEL_107:
    uint64_t v5 = (unsigned int *)(v13 + v10);
    if (v4 <= 0) {
      goto LABEL_110;
    }
  }
  int64_t v19 = BLJaliscoLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v23 = 136315650;
    __int16 v24 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
    __int16 v25 = 2048;
    uint64_t v26 = 4;
    __int16 v27 = 2048;
    int64_t v28 = v4;
    _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v23, 0x20u);
  }

LABEL_120:
  id v18 = 0;
LABEL_121:

  return v18;
}

- (id)parseContentCodes:(const char *)a3 count:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a4 < 1)
  {
LABEL_9:
    int v17 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v7, (uint64_t)v9, v8);
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      int64_t v10 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        int64_t v19 = BLJaliscoLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315650;
          int v23 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
          __int16 v24 = 2048;
          uint64_t v25 = 4;
          __int16 v26 = 2048;
          int64_t v27 = v10;
          goto LABEL_17;
        }
LABEL_18:

        goto LABEL_19;
      }
      unint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v12 = a4 - 8;
      BOOL v13 = a4 - 8 >= v11;
      a4 = a4 - 8 - v11;
      if (!v13)
      {
        int64_t v19 = BLJaliscoLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315650;
          int v23 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
          __int16 v24 = 2048;
          uint64_t v25 = v11;
          __int16 v26 = 2048;
          int64_t v27 = v12;
LABEL_17:
          _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_18;
      }
      unsigned int v16 = *(_DWORD *)a3;
      uint64_t v15 = a3 + 8;
      unsigned int v14 = v16;
      if (v16 != 1953788781) {
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, bswap32(v14), (uint64_t)v15, v11, "-[BLPurchaseDAAPParser parseContentCodes:count:]");
      }
      a3 = &v15[v11];
      if (a4 <= 0) {
        goto LABEL_9;
      }
    }
    id v18 = BLJaliscoLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315650;
      int v23 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
      __int16 v24 = 2048;
      uint64_t v25 = 4;
      __int16 v26 = 2048;
      int64_t v27 = a4;
      _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
    }

LABEL_19:
    int v17 = 0;
  }

  return v17;
}

- (id)parseError:(const char *)a3 count:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a4 >= 9)
  {
    int64_t v4 = a4;
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    unint64_t v11 = objc_msgSend_initWithCapacity_(v7, v8, 2, v9);
    while (1)
    {
      if ((unint64_t)v4 <= 3)
      {
        __int16 v20 = BLJaliscoLog();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        int v23 = 136315650;
        __int16 v24 = "-[BLPurchaseDAAPParser parseError:count:]";
        __int16 v25 = 2048;
        uint64_t v26 = 4;
        __int16 v27 = 2048;
        int64_t v28 = v4;
        goto LABEL_21;
      }
      if ((unint64_t)(v4 - 4) <= 3)
      {
        __int16 v20 = BLJaliscoLog();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        int v23 = 136315650;
        __int16 v24 = "-[BLPurchaseDAAPParser parseError:count:]";
        __int16 v25 = 2048;
        uint64_t v26 = 4;
        __int16 v27 = 2048;
        int64_t v28 = v4 - 4;
        goto LABEL_21;
      }
      unint64_t v12 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v13 = v4 - 8;
      BOOL v14 = v4 - 8 >= v12;
      int64_t v4 = v4 - 8 - v12;
      if (!v14) {
        break;
      }
      unsigned int v16 = *(_DWORD *)a3;
      uint64_t v15 = a3 + 8;
      uint64_t v17 = bswap32(v16);
      if (v17 == 1634030147)
      {
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v10, (uint64_t)v15, v12, v11, @"com.apple.itunes.reconnect-interval");
      }
      else if (v17 == 1836282996)
      {
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v10, (uint64_t)v15, v12, v11, @"dmap.status");
      }
      else
      {
        objc_msgSend_unknownCode_bytes_size_context_(self, v10, v17, (uint64_t)v15, v12, "-[BLPurchaseDAAPParser parseError:count:]");
      }
      a3 = &v15[v12];
      if (v4 < 1)
      {
        int64_t v19 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v10, (uint64_t)v11, v18);

        goto LABEL_24;
      }
    }
    __int16 v20 = BLJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315650;
      __int16 v24 = "-[BLPurchaseDAAPParser parseError:count:]";
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      int64_t v28 = v13;
LABEL_21:
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v23, 0x20u);
    }
LABEL_22:
  }
  int64_t v19 = 0;
LABEL_24:

  return v19;
}

- (id)parseLogin:(const char *)a3 count:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a4 < 1)
  {
    id v6 = 0;
LABEL_12:
    id v6 = v6;
    unint64_t v12 = v6;
  }
  else
  {
    int64_t v4 = a4;
    id v6 = 0;
    while ((unint64_t)v4 > 3)
    {
      int64_t v7 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        BOOL v14 = BLJaliscoLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315650;
          uint64_t v17 = "-[BLPurchaseDAAPParser parseLogin:count:]";
          __int16 v18 = 2048;
          uint64_t v19 = 4;
          __int16 v20 = 2048;
          int64_t v21 = v7;
          _os_log_impl(&dword_21DFE3000, v14, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v16, 0x20u);
        }

        goto LABEL_19;
      }
      uint64_t v8 = bswap32(*(_DWORD *)a3);
      uint64_t v9 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v10 = (unsigned int *)(a3 + 8);
      if (v8 != 1836282996)
      {
        if (v8 == 1835821412)
        {
          uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, a2, (int)bswap32(*v10), a4);

          id v6 = (id)v11;
        }
        else
        {
          objc_msgSend_unknownCode_bytes_size_context_(self, a2, v8, (uint64_t)v10, v9, "-[BLPurchaseDAAPParser parseLogin:count:]");
        }
      }
      a3 = (char *)v10 + v9;
      int64_t v4 = v4 - 8 - v9;
      if (v4 <= 0) {
        goto LABEL_12;
      }
    }
    int64_t v13 = BLJaliscoLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      uint64_t v17 = "-[BLPurchaseDAAPParser parseLogin:count:]";
      __int16 v18 = 2048;
      uint64_t v19 = 4;
      __int16 v20 = 2048;
      int64_t v21 = v4;
      _os_log_impl(&dword_21DFE3000, v13, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v16, 0x20u);
    }

LABEL_19:
    unint64_t v12 = 0;
  }

  return v12;
}

- (id)parseListingItem:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v5 = (unsigned int *)a3;
  uint64_t v83 = *MEMORY[0x263EF8340];
  int64_t v10 = objc_msgSend_item(BLPurchaseDAAPItem, a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_379:
    objc_msgSend_freeze(v10, v7, v8, v9);
    id v70 = v10;
    goto LABEL_387;
  }
  uint64_t v74 = 0;
  uint64_t v11 = @"booklets";
  while ((unint64_t)v4 > 3)
  {
    int64_t v12 = v4 - 4;
    if ((unint64_t)(v4 - 4) <= 3)
    {
      v72 = BLJaliscoLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v78 = "-[BLPurchaseDAAPParser parseListingItem:count:]";
        __int16 v79 = 2048;
        uint64_t v80 = 4;
        __int16 v81 = 2048;
        int64_t v82 = v12;
        _os_log_impl(&dword_21DFE3000, v72, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
      }

      goto LABEL_386;
    }
    unsigned int v14 = *v5;
    unsigned int v13 = v5[1];
    uint64_t v15 = v5 + 2;
    uint64_t v8 = bswap32(v14);
    uint64_t v16 = bswap32(v13);
    if ((int)v8 > 1634952812)
    {
      if ((int)v8 <= 1668116593)
      {
        if ((int)v8 <= 1667328367)
        {
          if ((int)v8 > 1634956148)
          {
            if ((int)v8 <= 1634956651)
            {
              if ((int)v8 > 1634956396)
              {
                if (v8 == 1634956397)
                {
                  objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songtime");
                }
                else
                {
                  if (v8 != 1634956398) {
                    goto LABEL_345;
                  }
                  objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songtracknumber");
                }
              }
              else if (v8 == 1634956149)
              {
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.sortalbum");
              }
              else
              {
                if (v8 != 1634956387) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songtrackcount");
              }
            }
            else if ((int)v8 <= 1634957681)
            {
              if (v8 == 1634956652)
              {
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdataurl");
              }
              else
              {
                if (v8 != 1634956658) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songuserrating");
              }
            }
            else
            {
              switch(v8)
              {
                case 0x61737972:
                  objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songyear");
                  break;
                case 0x63616870:
                  objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"hasPassword");
                  break;
                case 0x63616961:
                  objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"selected");
                  break;
                default:
                  goto LABEL_345;
              }
            }
          }
          else if ((int)v8 <= 1634954338)
          {
            if ((int)v8 > 1634953327)
            {
              if (v8 == 1634953328)
              {
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songhasbeenplayed");
              }
              else
              {
                if (v8 != 1634954096) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songuserskipcount");
              }
            }
            else if (v8 == 1634952813)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songformat");
            }
            else
            {
              if (v8 != 1634953070) {
                goto LABEL_345;
              }
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songgenre");
            }
          }
          else if ((int)v8 <= 1634955380)
          {
            if (v8 == 1634954339)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songlongcontentdescription");
            }
            else
            {
              if (v8 != 1634955363) {
                goto LABEL_345;
              }
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songuserplaycount");
            }
          }
          else
          {
            switch(v8)
            {
              case 0x61737075:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songpodcasturl");
                break;
              case 0x61737361:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.sortartist");
                break;
              case 0x6173736E:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.sortname");
                break;
              default:
                goto LABEL_345;
            }
          }
        }
        else
        {
          if ((int)v8 > 1667584855)
          {
            if ((int)v8 <= 1668114787)
            {
              if ((int)v8 <= 1668113004)
              {
                if (v8 == 1667584856)
                {
                  objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"kExtDACPSupportediTunesExtensionsCode");
                }
                else
                {
                  if (v8 != 1668112996) {
                    goto LABEL_345;
                  }
                  objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"libraryDisplayName");
                }
              }
              else
              {
                switch(v8)
                {
                  case 0x636D626D:
                    objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"libraryServiceDomain");
                    break;
                  case 0x636D6273:
                    objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"libraryServiceName");
                    break;
                  case 0x636D6274:
                    objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"libraryServiceType");
                    break;
                  default:
                    goto LABEL_345;
                }
              }
              goto LABEL_372;
            }
            if ((int)v8 > 1668115821)
            {
              switch(v8)
              {
                case 0x636D6D6E:
                  objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"minimum");
                  break;
                case 0x636D6D78:
                  objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"maximum");
                  break;
                case 0x636D6E6D:
                  objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"name");
                  break;
                default:
                  goto LABEL_345;
              }
              goto LABEL_372;
            }
            if (v8 == 1668114788)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"identifier");
              goto LABEL_372;
            }
            int v32 = 1668114795;
            goto LABEL_221;
          }
          if ((int)v8 <= 1667330930)
          {
            if ((int)v8 > 1667329909)
            {
              if (v8 == 1667329910)
              {
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsMultiSpeakerVolume");
              }
              else
              {
                if (v8 != 1667330162) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dacp.protocolversion");
              }
            }
            else if (v8 == 1667328368)
            {
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"isPlaying");
            }
            else
            {
              if (v8 != 1667328374) {
                goto LABEL_345;
              }
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsVideo");
            }
          }
          else if ((int)v8 <= 1667331683)
          {
            if (v8 == 1667330931)
            {
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsSpeakerSelection");
            }
            else
            {
              if (v8 != 1667330933) {
                goto LABEL_345;
              }
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsSetUserRating");
            }
          }
          else
          {
            switch(v8)
            {
              case 0x63617664:
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"selectedForVideo");
                break;
              case 0x63655157:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.playqueue-warning-threshold");
                break;
              case 0x63655347:
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.supports-genius-control");
                break;
              default:
                goto LABEL_345;
            }
          }
        }
      }
      else if ((int)v8 > 1835624552)
      {
        if ((int)v8 <= 1836216433)
        {
          if ((int)v8 <= 1835625826)
          {
            if ((int)v8 > 1835625315)
            {
              if (v8 == 1835625316)
              {
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.itemkind");
              }
              else
              {
                if (v8 != 1835625572) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.longitemid");
              }
            }
            else
            {
              if (v8 != 1835624553)
              {
                if (v8 == 1835624804)
                {
                  if (v16 == 8)
                  {
                    uint64_t v66 = objc_msgSend_SwapInt64BigToHost_size_(self, v7, (uint64_t)v15, 8);
                    objc_msgSend_setItemID_(v10, v67, v66, v68);
                  }
                  else if (v16 == 4)
                  {
                    objc_msgSend_setItemID_(v10, v7, bswap32(*v15), v9);
                  }
                  goto LABEL_372;
                }
LABEL_345:
                objc_msgSend_unknownCode_bytes_size_context_(self, v7, v8, (uint64_t)v15, v16, "-[BLPurchaseDAAPParser parseListingItem:count:]");
                goto LABEL_372;
              }
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.itemhidden");
            }
          }
          else if ((int)v8 <= 1835821427)
          {
            if (v8 == 1835625827)
            {
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.itemcount");
            }
            else
            {
              if (v8 != 1835626093) {
                goto LABEL_345;
              }
              if (v13)
              {
                uint64_t v17 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)v15, v16);
                objc_msgSend_setName_(v10, v33, (uint64_t)v17, v34);
                goto LABEL_364;
              }
            }
          }
          else if (v8 != 1835821428)
          {
            if (v8 == 1836082031)
            {
              if (v16 == 8)
              {
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, 8, v10, @"dmap.parentcontainerid");
              }
              else if (v16 == 4)
              {
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, 4, v10, @"dmap.parentcontainerid");
              }
              goto LABEL_372;
            }
            if (v8 != 1836082546) {
              goto LABEL_345;
            }
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.persistentid");
          }
        }
        else if ((int)v8 > 1836279917)
        {
          if ((int)v8 <= 1836282995)
          {
            if (v8 == 1836279918)
            {
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"headerItemCount");
            }
            else
            {
              if (v8 != 1836281185) {
                goto LABEL_345;
              }
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"macAddress");
            }
          }
          else
          {
            switch(v8)
            {
              case 0x6D737474:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.status");
                break;
              case 0x70617370:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"aspectRatio");
                break;
              case 0x70666474:
                uint64_t v17 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v7, (uint64_t)v15, v16);
                objc_msgSend_setObject_forKey_(v10, v31, (uint64_t)v17, @"fileData");
                goto LABEL_364;
              default:
                goto LABEL_345;
            }
          }
        }
        else if ((int)v8 <= 1836278132)
        {
          if (v8 == 1836216434)
          {
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.remotepersistentid");
          }
          else
          {
            if (v8 != 1836278131) {
              goto LABEL_345;
            }
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.authenticationschemes");
          }
        }
        else
        {
          switch(v8)
          {
            case 0x6D736175:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.authenticationmethod");
              break;
            case 0x6D736863:
              uint64_t v17 = objc_msgSend_parseUnicodeCharacter_count_(self, v7, (uint64_t)v15, v16);
              objc_msgSend_setObject_forKey_(v10, v43, (uint64_t)v17, @"headerItemCharacter");
              goto LABEL_364;
            case 0x6D736869:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"headerItemIndex");
              break;
            default:
              goto LABEL_345;
          }
        }
      }
      else if ((int)v8 <= 1668444011)
      {
        if ((int)v8 <= 1668117359)
        {
          if ((int)v8 > 1668117345)
          {
            if (v8 == 1668117346)
            {
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsBonjourSourcesUpdates");
            }
            else
            {
              if (v8 != 1668117347) {
                goto LABEL_345;
              }
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsControlPromptRequests");
            }
          }
          else if (v8 == 1668116594)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmcp.protocolversion");
          }
          else
          {
            if (v8 != 1668117100) {
              goto LABEL_345;
            }
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsRemoteLibrarySelection");
          }
        }
        else if ((int)v8 <= 1668118123)
        {
          if (v8 == 1668117360)
          {
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsPlayStatusUpdate");
          }
          else
          {
            if (v8 != 1668117366) {
              goto LABEL_345;
            }
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"supportsVolume");
          }
        }
        else
        {
          if (v8 == 1668118124)
          {
            uint64_t v17 = objc_msgSend_parseListingCollection_count_capacity_(self, v7, (uint64_t)v15, v16, 0);
            objc_msgSend_setObject_forKey_(v10, v44, (uint64_t)v17, @"context");
            goto LABEL_364;
          }
          if (v8 == 1668118127)
          {
            float v45 = (float)bswap32(*v15) / 100.0;
            id v46 = objc_alloc(NSNumber);
            *(float *)&double v47 = v45;
            uint64_t v17 = objc_msgSend_initWithFloat_(v46, v48, v49, v50, v47);
            objc_msgSend_setObject_forKey_(v10, v51, (uint64_t)v17, @"volume");
            goto LABEL_364;
          }
          if (v8 != 1668118132) {
            goto LABEL_345;
          }
          if (v13 == 0x2000000)
          {
            uint64_t v25 = bswap32(*(unsigned __int16 *)v15) >> 16;
            uint64_t v26 = objc_opt_class();
            uint64_t v74 = v25;
            uint64_t v17 = objc_msgSend_typeForDRCPValueType_(v26, v27, v25, v28);
            objc_msgSend_setValue_forKey_(v10, v29, (uint64_t)v17, @"type");
            goto LABEL_364;
          }
        }
      }
      else if ((int)v8 > 1835295338)
      {
        if ((int)v8 <= 1835299699)
        {
          if (v8 == 1835295339)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.databasekind");
          }
          else
          {
            if (v8 != 1835295596) {
              goto LABEL_345;
            }
            objc_msgSend_parseDict_size_intoDict_(self, v7, (uint64_t)v15, v16, v10);
          }
        }
        else
        {
          switch(v8)
          {
            case 0x6D647374:
              objc_msgSend_setDownloadStatus_(v10, v7, *(unsigned __int8 *)v15, v9);
              break;
            case 0x6D657272:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.errorresponse");
              break;
            case 0x6D676473:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.groupdownloadstatus");
              break;
            default:
              goto LABEL_345;
          }
        }
      }
      else if ((int)v8 <= 1835103851)
      {
        if (v8 != 1668444012)
        {
          if (v8 == 1668702572)
          {
            switch(v74)
            {
              case 1:
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"value");
                uint64_t v69 = 1;
                goto LABEL_378;
              case 2:
                objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"value");
                uint64_t v69 = 2;
                goto LABEL_378;
              case 3:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"value");
                uint64_t v69 = 3;
                goto LABEL_378;
              case 4:
                objc_msgSend_setFloat32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"value");
                uint64_t v69 = 4;
LABEL_378:
                uint64_t v74 = v69;
                break;
              case 5:
              case 6:
              case 7:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"value");
                break;
              default:
                goto LABEL_372;
            }
            goto LABEL_372;
          }
          goto LABEL_345;
        }
        objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"readOnly");
      }
      else
      {
        switch(v8)
        {
          case 0x6D61766C:
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.itemavailable");
            break;
          case 0x6D637463:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"dmap.containercount");
            break;
          case 0x6D637469:
            objc_msgSend_setContainerItemID_(v10, v7, bswap32(*v15), v9);
            break;
          default:
            goto LABEL_345;
        }
      }
    }
    else if ((int)v8 <= 1634030404)
    {
      if ((int)v8 <= 1634027587)
      {
        if ((int)v8 > 1634026336)
        {
          if ((int)v8 <= 1634026356)
          {
            if ((int)v8 > 1634026353)
            {
              if (v8 == 1634026354)
              {
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.copyright");
              }
              else
              {
                if (v8 != 1634026355) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-connect-status");
              }
            }
            else if (v8 == 1634026337)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-artwork-url");
            }
            else
            {
              if (v8 != 1634026340) {
                goto LABEL_345;
              }
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-id");
            }
          }
          else if ((int)v8 <= 1634026834)
          {
            if (v8 == 1634026357)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.chapter-metadata-url");
            }
            else
            {
              if (v8 != 1634026830) {
                goto LABEL_345;
              }
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.episode-num-str");
            }
          }
          else
          {
            switch(v8)
            {
              case 0x61654553:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.episode-sort");
                break;
              case 0x61654652:
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.supports-fprap");
                break;
              case 0x61654843:
                if (*(unsigned char *)v15 == 1) {
                  objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.has-chapter-data");
                }
                break;
              default:
                goto LABEL_345;
            }
          }
        }
        else
        {
          if ((int)v8 > 1634025832)
          {
            switch((int)v8)
            {
              case 1634026322:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.content-rating");
                goto LABEL_372;
              case 1634026323:
                if (v13 == 0x4000000)
                {
                  uint64_t v53 = bswap32(*v15);
                  id v54 = objc_alloc(NSNumber);
                  uint64_t v17 = objc_msgSend_initWithUnsignedInt_(v54, v55, v53, v56);
                  objc_msgSend_stringValue(v17, v57, v58, v59);
                  v20 = uint64_t v19 = v11;
                  objc_msgSend_setValue_forKey_(v10, v60, (uint64_t)v20, @"com.apple.itunes.artworkchecksum");
                  goto LABEL_356;
                }
                uint64_t v17 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)v15, v16);
                objc_msgSend_setValue_forKey_(v10, v65, (uint64_t)v17, @"com.apple.itunes.artworkchecksum");
                goto LABEL_364;
              case 1634026324:
                objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-artwork-token");
                goto LABEL_372;
              case 1634026325:
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-user-id");
                goto LABEL_372;
              default:
                if (v8 == 1634025833)
                {
                  objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.adam-id");
                }
                else
                {
                  if (v8 != 1634026308) {
                    goto LABEL_345;
                  }
                  objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.flat-chapter-data");
                }
                break;
            }
            goto LABEL_372;
          }
          switch(v8)
          {
            case 0x6162706C:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.baseplaylist");
              break;
            case 0x61654144:
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.adam-ids-array");
              break;
            case 0x61654149:
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.itms-artistid");
              break;
            default:
              goto LABEL_345;
          }
        }
      }
      else
      {
        if ((int)v8 > 1634029650)
        {
          if ((int)v8 > 1634029679)
          {
            switch((int)v8)
            {
              case 1634030157:
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.remote-itunes-machine-id");
                goto LABEL_372;
              case 1634030158:
              case 1634030159:
              case 1634030161:
              case 1634030162:
              case 1634030164:
                goto LABEL_345;
              case 1634030160:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.rental-pb-start");
                goto LABEL_372;
              case 1634030163:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.rental-start");
                goto LABEL_372;
              case 1634030165:
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.rental-pb-duration");
                goto LABEL_372;
              default:
                if (v8 == 1634029680)
                {
                  objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.publication-is-picture-book");
                }
                else
                {
                  if (v8 != 1634030148) {
                    goto LABEL_345;
                  }
                  objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.rental-duration");
                }
                break;
            }
            goto LABEL_372;
          }
          switch(v8)
          {
            case 0x61655053:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.special-playlist");
              break;
            case 0x61655061:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.publication-contains-audio");
              break;
            case 0x6165506C:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.publication-is-read-aloud");
              break;
            default:
              goto LABEL_345;
          }
          goto LABEL_372;
        }
        if ((int)v8 <= 1634028874)
        {
          if ((int)v8 <= 1634027605)
          {
            if (v8 == 1634027588)
            {
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.is-hd-video");
            }
            else
            {
              if (v8 != 1634027603) {
                goto LABEL_345;
              }
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.is-homeshare");
            }
          }
          else
          {
            switch(v8)
            {
              case 0x61654856:
                if (*(unsigned char *)v15 == 1) {
                  objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.has-video");
                }
                goto LABEL_372;
              case 0x6165494D:
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.itunes-machine-id");
                break;
              case 0x61654D49:
                objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.mastered-for-itunes");
                break;
              default:
                goto LABEL_345;
            }
          }
          goto LABEL_372;
        }
        if ((int)v8 > 1634028906)
        {
          if (v8 == 1634028907)
          {
            if (v16 == 4)
            {
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, 4, v10, @"com.apple.itunes.extended-media-kind");
            }
            else if (v16 == 1)
            {
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, 1, v10, @"com.apple.itunes.extended-media-kind");
            }
            goto LABEL_372;
          }
          if (v8 == 1634029635)
          {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.is-podcast");
            goto LABEL_372;
          }
          unsigned __int16 v30 = 20553;
LABEL_145:
          int v32 = v30 | 0x61650000;
LABEL_221:
          if (v8 != v32) {
            goto LABEL_345;
          }
          goto LABEL_372;
        }
        if (v8 != 1634028875)
        {
          if (v8 == 1634028888)
          {
            uint64_t v17 = objc_msgSend_parseXMLContent_count_(self, v7, (uint64_t)v15, v16);
            if (v17)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend_setObject_forKey_(v10, v35, (uint64_t)v17, @"com.apple.itunes.movie-info-xml");
              }
            }
            goto LABEL_364;
          }
          goto LABEL_345;
        }
        objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.mediakind");
      }
    }
    else
    {
      if ((int)v8 > 1634951520)
      {
        if ((int)v8 > 1634952289)
        {
          switch((int)v8)
          {
            case 1634952290:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdisabled");
              break;
            case 1634952291:
              objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdisccount");
              break;
            case 1634952299:
              goto LABEL_372;
            case 1634952301:
              objc_msgSend_setDate_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdatemodified");
              break;
            case 1634952302:
              objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdiscnumber");
              break;
            case 1634952304:
              objc_msgSend_setDate_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdatepurchased");
              break;
            case 1634952306:
              objc_msgSend_setDate_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdatereleased");
              break;
            case 1634952308:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songdescription");
              break;
            default:
              goto LABEL_345;
          }
          goto LABEL_372;
        }
        if ((int)v8 > 1634951786)
        {
          switch((int)v8)
          {
            case 1634952046:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songcontentdescription");
              goto LABEL_372;
            case 1634952047:
            case 1634952049:
            case 1634952051:
              goto LABEL_345;
            case 1634952048:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songcomposer");
              goto LABEL_372;
            case 1634952050:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songcontentrating");
              goto LABEL_372;
            case 1634952052:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songcategory");
              goto LABEL_372;
            default:
              if (v8 == 1634951787)
              {
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.bookmarkable");
              }
              else
              {
                if (v8 != 1634951791) {
                  goto LABEL_345;
                }
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songbookmark");
              }
              break;
          }
          goto LABEL_372;
        }
        if ((int)v8 <= 1634951528)
        {
          if (v8 == 1634951521)
          {
            if (v13)
            {
              uint64_t v17 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)v15, v16);
              objc_msgSend_setSongalbumartist_(v10, v41, (uint64_t)v17, v42);
              goto LABEL_364;
            }
          }
          else
          {
            if (v8 != 1634951523) {
              goto LABEL_345;
            }
            objc_msgSend_setUInt16_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songartworkcount");
          }
        }
        else
        {
          switch(v8)
          {
            case 0x61736169:
              uint64_t v36 = objc_msgSend_SwapInt64BigToHost_size_(self, v7, (uint64_t)v15, v16);
              objc_msgSend_setSongalbumid_(v10, v37, v36, v38);
              break;
            case 0x6173616C:
              if (v13)
              {
                uint64_t v17 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)v15, v16);
                objc_msgSend_setSongalbum_(v10, v39, (uint64_t)v17, v40);
                goto LABEL_364;
              }
              break;
            case 0x61736172:
              if (v13)
              {
                uint64_t v17 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)v15, v16);
                objc_msgSend_setSongartist_(v10, v23, (uint64_t)v17, v24);
LABEL_364:

                goto LABEL_372;
              }
              break;
            default:
              goto LABEL_345;
          }
        }
        goto LABEL_372;
      }
      if ((int)v8 <= 1634165090)
      {
        if ((int)v8 <= 1634030420)
        {
          switch((int)v8)
          {
            case 1634030405:
              objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.store-pers-id");
              goto LABEL_372;
            case 1634030407:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.saved-genius");
              goto LABEL_372;
            case 1634030409:
              if (v16 == 8)
              {
                uint64_t v61 = objc_msgSend_SwapInt64BigToHost_size_(self, v7, (uint64_t)v15, 8);
                uint64_t v17 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v62, v61, v63);
                objc_msgSend_setObject_forKey_(v10, v64, (uint64_t)v17, @"com.apple.itunes.itms-songid");
                goto LABEL_364;
              }
              if (v16 == 4) {
                objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, 4, v10, @"com.apple.itunes.itms-songid");
              }
              break;
            case 1634030414:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.series-name");
              goto LABEL_372;
            case 1634030416:
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.smart-playlist");
              goto LABEL_372;
            default:
              goto LABEL_345;
          }
          goto LABEL_372;
        }
        if ((int)v8 <= 1634035307)
        {
          if (v8 == 1634030421)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.season-num");
            goto LABEL_372;
          }
          unsigned __int16 v30 = 21618;
          goto LABEL_145;
        }
        if (v8 == 1634035308)
        {
          uint64_t v17 = objc_msgSend_parseFlavorListing_size_(self, v7, (uint64_t)v15, v16);
          objc_msgSend_setObject_forKey_(v10, v52, (uint64_t)v17, @"com.apple.itunes.item-flavor-listing");
          goto LABEL_364;
        }
        if (v8 != 1634038895) {
          goto LABEL_345;
        }
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.cloud-purchased-token");
      }
      else if ((int)v8 > 1634354531)
      {
        if ((int)v8 <= 1634363508)
        {
          if (v8 == 1634354532)
          {
            objc_msgSend_setDate_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.preorder-expected-date");
            goto LABEL_372;
          }
          if (v8 != 1634355312) {
            goto LABEL_345;
          }
          objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.store.supports-hls-playback");
        }
        else
        {
          switch(v8)
          {
            case 0x616A6875:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"com.apple.itunes.store.hls-playback-url");
              break;
            case 0x6170726D:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.playlistrepeatmode");
              break;
            case 0x6170736D:
              objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.playlistshufflemode");
              break;
            default:
              goto LABEL_345;
          }
        }
      }
      else if ((int)v8 <= 1634168168)
      {
        if (v8 == 1634165091)
        {
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.groupalbumcount");
        }
        else
        {
          if (v8 != 1634168161) {
            goto LABEL_345;
          }
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.groupmatchedqueryalbumcount");
        }
      }
      else
      {
        switch(v8)
        {
          case 0x61676D69:
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.groupmatchedqueryitemcount");
            break;
          case 0x61677270:
            objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v15, v16, v10, @"daap.songgrouping");
            break;
          case 0x616A424C:
            uint64_t v17 = objc_msgSend_parseBookletListing_count_(self, v7, (uint64_t)v15, v16);
            v75 = v11;
            v76 = v17;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)&v76, (uint64_t)&v75, 1);
            v20 = uint64_t v19 = v11;
            objc_msgSend_updateItemWithDictionary_(v10, v21, (uint64_t)v20, v22);
LABEL_356:

            uint64_t v11 = v19;
            goto LABEL_364;
          default:
            goto LABEL_345;
        }
      }
    }
LABEL_372:
    uint64_t v5 = (unsigned int *)((char *)v15 + v16);
    int64_t v4 = v4 - 8 - v16;
    if (v4 <= 0) {
      goto LABEL_379;
    }
  }
  v71 = BLJaliscoLog();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v78 = "-[BLPurchaseDAAPParser parseListingItem:count:]";
    __int16 v79 = 2048;
    uint64_t v80 = 4;
    __int16 v81 = 2048;
    int64_t v82 = v4;
    _os_log_impl(&dword_21DFE3000, v71, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
  }

LABEL_386:
  id v70 = 0;
LABEL_387:

  return v70;
}

- (id)parseBookletListing:(const char *)a3 count:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_opt_new();
  if (a4 < 1)
  {
LABEL_10:
    id v19 = v8;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      int64_t v9 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        int64_t v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          uint64_t v25 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
          __int16 v26 = 2048;
          uint64_t v27 = 4;
          __int16 v28 = 2048;
          int64_t v29 = v9;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v10 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v11 = a4 - 8;
      BOOL v12 = a4 - 8 >= v10;
      a4 = a4 - 8 - v10;
      if (!v12)
      {
        int64_t v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          uint64_t v25 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
          __int16 v26 = 2048;
          uint64_t v27 = v10;
          __int16 v28 = 2048;
          int64_t v29 = v11;
LABEL_18:
          _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
        }
        goto LABEL_19;
      }
      unsigned int v15 = *(_DWORD *)a3;
      unsigned int v14 = a3 + 8;
      unsigned int v13 = v15;
      if (v15 == 1765960289)
      {
        uint64_t v16 = objc_msgSend_parseBookletItem_count_(self, v7, (uint64_t)v14, v10);
        objc_msgSend_addObject_(v8, v17, (uint64_t)v16, v18);
      }
      else
      {
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, bswap32(v13), (uint64_t)v14, v10, "-[BLPurchaseDAAPParser parseBookletListing:count:]");
      }
      a3 = &v14[v10];
      if (a4 <= 0) {
        goto LABEL_10;
      }
    }
    __int16 v20 = BLJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      uint64_t v25 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
      __int16 v26 = 2048;
      uint64_t v27 = 4;
      __int16 v28 = 2048;
      int64_t v29 = a4;
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
    }

LABEL_20:
    id v19 = 0;
  }

  return v19;
}

- (id)parseBookletItem:(const char *)a3 count:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_opt_new();
  if (a4 < 1)
  {
LABEL_19:
    id v16 = v8;
    goto LABEL_30;
  }
  while ((unint64_t)a4 > 3)
  {
    int64_t v9 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      uint64_t v18 = BLJaliscoLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315650;
        uint64_t v22 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
        __int16 v23 = 2048;
        uint64_t v24 = 4;
        __int16 v25 = 2048;
        int64_t v26 = v9;
        goto LABEL_27;
      }
LABEL_28:

      goto LABEL_29;
    }
    unint64_t v10 = bswap32(*((_DWORD *)a3 + 1));
    int64_t v11 = a4 - 8;
    BOOL v12 = a4 - 8 >= v10;
    a4 = a4 - 8 - v10;
    if (!v12)
    {
      uint64_t v18 = BLJaliscoLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315650;
        uint64_t v22 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
        __int16 v23 = 2048;
        uint64_t v24 = v10;
        __int16 v25 = 2048;
        int64_t v26 = v11;
LABEL_27:
        _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
      }
      goto LABEL_28;
    }
    unsigned int v14 = *(_DWORD *)a3;
    unsigned int v13 = a3 + 8;
    uint64_t v15 = bswap32(v14);
    if ((int)v15 > 1634353773)
    {
      if (v15 == 1634353779)
      {
        objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"com.apple.itunes.store.booklet-item-size");
        goto LABEL_18;
      }
      if (v15 == 1634353774)
      {
        objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"com.apple.itunes.store.booklet-item-name");
        goto LABEL_18;
      }
LABEL_17:
      objc_msgSend_unknownCode_bytes_size_context_(self, v7, v15, (uint64_t)v13, v10, "-[BLPurchaseDAAPParser parseBookletItem:count:]");
      goto LABEL_18;
    }
    if (v15 == 1634353761)
    {
      objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"com.apple.itunes.store.booklet-item-store-id");
    }
    else
    {
      if (v15 != 1634353764) {
        goto LABEL_17;
      }
      objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"com.apple.itunes.store.booklet-item-redownload-param");
    }
LABEL_18:
    a3 = &v13[v10];
    if (a4 <= 0) {
      goto LABEL_19;
    }
  }
  uint64_t v17 = BLJaliscoLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315650;
    uint64_t v22 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
    __int16 v23 = 2048;
    uint64_t v24 = 4;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
  }

LABEL_29:
  id v16 = 0;
LABEL_30:

  return v16;
}

- (id)parseListingCollection:(const char *)a3 count:(int64_t)a4 capacity:(int)a5
{
  int64_t v5 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  int64_t v9 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], a2, a5, a4);
  if (v5 < 1)
  {
LABEL_11:
    id v20 = v9;
  }
  else
  {
    while ((unint64_t)v5 > 3)
    {
      int64_t v10 = v5 - 4;
      if ((unint64_t)(v5 - 4) <= 3)
      {
        uint64_t v22 = BLJaliscoLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136315650;
          int64_t v26 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
          __int16 v27 = 2048;
          uint64_t v28 = 4;
          __int16 v29 = 2048;
          int64_t v30 = v10;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      unint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v12 = v5 - 8;
      BOOL v13 = v5 - 8 >= v11;
      int64_t v5 = v5 - 8 - v11;
      if (!v13)
      {
        uint64_t v22 = BLJaliscoLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136315650;
          int64_t v26 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
          __int16 v27 = 2048;
          uint64_t v28 = v11;
          __int16 v29 = 2048;
          int64_t v30 = v12;
LABEL_19:
          _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v25, 0x20u);
        }
        goto LABEL_20;
      }
      unsigned int v15 = *(_DWORD *)a3;
      unsigned int v14 = a3 + 8;
      uint64_t v16 = bswap32(v15);
      if (v16 != 1836282996)
      {
        if (v16 == 1835821428)
        {
          uint64_t v17 = objc_msgSend_parseListingItem_count_(self, v8, (uint64_t)v14, v11);
          objc_msgSend_addObject_(v9, v18, (uint64_t)v17, v19);
        }
        else
        {
          objc_msgSend_unknownCode_bytes_size_context_(self, v8, v16, (uint64_t)v14, v11, "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]");
        }
      }
      a3 = &v14[v11];
      if (v5 <= 0) {
        goto LABEL_11;
      }
    }
    int v21 = BLJaliscoLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315650;
      int64_t v26 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
      __int16 v27 = 2048;
      uint64_t v28 = 4;
      __int16 v29 = 2048;
      int64_t v30 = v5;
      _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v25, 0x20u);
    }

LABEL_21:
    id v20 = 0;
  }

  return v20;
}

- (id)parseBrowseResults:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v5 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_10:
    id v27 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        __int16 v29 = BLJaliscoLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          int v32 = 136315650;
          uint64_t v33 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
          __int16 v34 = 2048;
          uint64_t v35 = 4;
          __int16 v36 = 2048;
          int64_t v37 = v9;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v10 = bswap32(*((_DWORD *)v5 + 1));
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        __int16 v29 = BLJaliscoLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          int v32 = 136315650;
          uint64_t v33 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
          __int16 v34 = 2048;
          uint64_t v35 = v10;
          __int16 v36 = 2048;
          int64_t v37 = v11;
LABEL_18:
          _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v32, 0x20u);
        }
        goto LABEL_19;
      }
      unsigned int v15 = *(_DWORD *)v5;
      uint64_t v14 = (uint64_t)(v5 + 8);
      unsigned int v13 = v15;
      if (v15 == 1953066093)
      {
        uint64_t v16 = objc_alloc_init(BLPurchaseDAAPItem);
        id v17 = [NSString alloc];
        uint64_t v19 = objc_msgSend_initWithBytes_length_encoding_(v17, v18, v14, v10, 4);
        objc_msgSend_setName_(v16, v20, (uint64_t)v19, v21);
        objc_msgSend_freeze(v16, v22, v23, v24);
        objc_msgSend_addObject_(v8, v25, (uint64_t)v16, v26);
      }
      else
      {
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, bswap32(v13), v14, v10, "-[BLPurchaseDAAPParser parseBrowseResults:count:]");
      }
      int64_t v5 = (const char *)(v14 + v10);
      if (v4 <= 0) {
        goto LABEL_10;
      }
    }
    uint64_t v28 = BLJaliscoLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136315650;
      uint64_t v33 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
      __int16 v34 = 2048;
      uint64_t v35 = 4;
      __int16 v36 = 2048;
      int64_t v37 = v4;
      _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v32, 0x20u);
    }

LABEL_20:
    id v27 = 0;
  }

  return v27;
}

- (id)parseListingHeader:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], a2, 6, a4);
  if (v4 < 1)
  {
LABEL_39:
    id v21 = v8;
    goto LABEL_50;
  }
  uint64_t v9 = 0;
  while (1)
  {
    if ((unint64_t)v4 <= 3)
    {
      uint64_t v22 = BLJaliscoLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315650;
        id v27 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
        __int16 v28 = 2048;
        uint64_t v29 = 4;
        __int16 v30 = 2048;
        int64_t v31 = v4;
LABEL_44:
        _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v26, 0x20u);
      }
LABEL_45:

      goto LABEL_49;
    }
    if ((unint64_t)(v4 - 4) <= 3)
    {
      uint64_t v22 = BLJaliscoLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315650;
        id v27 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
        __int16 v28 = 2048;
        uint64_t v29 = 4;
        __int16 v30 = 2048;
        int64_t v31 = v4 - 4;
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    unint64_t v10 = bswap32(*((_DWORD *)a3 + 1));
    int64_t v11 = v4 - 8;
    BOOL v12 = v4 - 8 >= v10;
    int64_t v4 = v4 - 8 - v10;
    if (!v12) {
      break;
    }
    unsigned int v14 = *(_DWORD *)a3;
    unsigned int v13 = (unsigned int *)(a3 + 8);
    uint64_t v15 = bswap32(v14);
    if ((int)v15 <= 1836213102)
    {
      if ((int)v15 > 1633838957)
      {
        if (v15 != 1633838958)
        {
          if (v15 == 1668113010)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmcp.bonjoursourcesrevision");
            goto LABEL_38;
          }
          if (v15 != 1835819884) {
            goto LABEL_37;
          }
          uint64_t v16 = objc_msgSend_parseListingCollection_count_capacity_(self, v7, (uint64_t)v13, v10, v9);
          objc_msgSend_setObject_forKey_(v8, v18, (uint64_t)v16, @"dmap.listing");
          goto LABEL_27;
        }
      }
      else if (v15 != 1633837420 && v15 != 1633837426 && v15 != 1633837936)
      {
        goto LABEL_37;
      }
      uint64_t v16 = objc_msgSend_parseBrowseResults_count_(self, v7, (uint64_t)v13, v10);
      objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v16, @"items");
LABEL_27:

      goto LABEL_38;
    }
    if ((int)v15 <= 1836344174)
    {
      if (v15 == 1836213103)
      {
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmap.returnedcount");
        uint64_t v9 = bswap32(*v13);
        goto LABEL_38;
      }
      if (v15 == 1836279916)
      {
        uint64_t v16 = objc_msgSend_parseListingCollection_count_capacity_(self, v7, (uint64_t)v13, v10, 30);
        objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v16, @"headers");
        goto LABEL_27;
      }
      if (v15 != 1836282996) {
        goto LABEL_37;
      }
      objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmap.status");
    }
    else
    {
      if ((int)v15 <= 1836413809)
      {
        if (v15 == 1836344175)
        {
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmap.specifiedtotalcount");
          goto LABEL_38;
        }
        if (v15 != 1836409964) {
          goto LABEL_37;
        }
        uint64_t v16 = objc_msgSend_parseDeletedIDsList_count_(self, v7, (uint64_t)v13, v10);
        objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, @"dmap.deletedidlisting");
        goto LABEL_27;
      }
      if (v15 == 1836413810)
      {
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmap.serverrevision");
        goto LABEL_38;
      }
      if (v15 != 1836414073)
      {
LABEL_37:
        objc_msgSend_unknownCode_bytes_size_context_(self, v7, v15, (uint64_t)v13, v10, "-[BLPurchaseDAAPParser parseListingHeader:count:]");
        goto LABEL_38;
      }
      objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)v13, v10, v8, @"dmap.updatetype");
    }
LABEL_38:
    a3 = (char *)v13 + v10;
    if (v4 <= 0) {
      goto LABEL_39;
    }
  }
  uint64_t v23 = BLJaliscoLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315650;
    id v27 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    int64_t v31 = v11;
    _os_log_impl(&dword_21DFE3000, v23, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v26, 0x20u);
  }

LABEL_49:
  id v21 = 0;
LABEL_50:

  return v21;
}

- (void)parseDict:(const char *)a3 size:(int64_t)a4 intoDict:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v34 = a5;
  unsigned int v13 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9, v10);
  if (a4 >= 1)
  {
    while (1)
    {
      if ((unint64_t)a4 <= 3)
      {
        int64_t v31 = BLJaliscoLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136315650;
        __int16 v36 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
        __int16 v37 = 2048;
        uint64_t v38 = 4;
        __int16 v39 = 2048;
        int64_t v40 = a4;
        goto LABEL_21;
      }
      if ((unint64_t)(a4 - 4) <= 3)
      {
        int64_t v31 = BLJaliscoLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136315650;
        __int16 v36 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
        __int16 v37 = 2048;
        uint64_t v38 = 4;
        __int16 v39 = 2048;
        int64_t v40 = a4 - 4;
        goto LABEL_21;
      }
      unint64_t v14 = bswap32(*((_DWORD *)a3 + 1));
      int64_t v15 = a4 - 8;
      BOOL v16 = a4 - 8 >= v14;
      a4 = a4 - 8 - v14;
      if (!v16) {
        break;
      }
      unsigned int v18 = *(_DWORD *)a3;
      id v17 = a3 + 8;
      unsigned int v19 = bswap32(v18);
      if (v19 == 1835297657)
      {
        objc_msgSend_setString_size_inDict_forKey_(self, v11, (uint64_t)v17, v14, v13, @"key");
      }
      else if (v19 == 1835300460)
      {
        objc_msgSend_setString_size_inDict_forKey_(self, v11, (uint64_t)v17, v14, v13, @"value");
      }
      uint64_t v20 = objc_msgSend_objectForKey_(v13, v11, @"key", v12);
      if (v20)
      {
        id v21 = (void *)v20;
        uint64_t v22 = objc_msgSend_objectForKey_(v13, v11, @"value", v12);

        if (v22)
        {
          uint64_t v23 = objc_msgSend_objectForKey_(v13, v11, @"value", v12);
          int v26 = objc_msgSend_objectForKey_(v13, v24, @"key", v25);
          objc_msgSend_setValue_forKey_(v34, v27, (uint64_t)v23, (uint64_t)v26);

          objc_msgSend_removeAllObjects(v13, v28, v29, v30);
        }
      }
      a3 = &v17[v14];
      if (a4 <= 0) {
        goto LABEL_23;
      }
    }
    int64_t v31 = BLJaliscoLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v36 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
      __int16 v37 = 2048;
      uint64_t v38 = v14;
      __int16 v39 = 2048;
      int64_t v40 = v15;
LABEL_21:
      _os_log_impl(&dword_21DFE3000, v31, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
    }
LABEL_22:
  }
LABEL_23:

  return 0;
}

- (id)parseDeletedIDsList:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v5 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  int64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, a4);
  uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10);
  if (v4 < 1)
  {
LABEL_12:
    id v26 = v12;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v13 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        __int16 v28 = BLJaliscoLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315650;
          uint64_t v32 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
          __int16 v33 = 2048;
          uint64_t v34 = 4;
          __int16 v35 = 2048;
          int64_t v36 = v13;
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
      unint64_t v14 = bswap32(*((_DWORD *)v5 + 1));
      int64_t v15 = v4 - 8;
      BOOL v16 = v4 - 8 >= v14;
      int64_t v4 = v4 - 8 - v14;
      if (!v16)
      {
        __int16 v28 = BLJaliscoLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315650;
          uint64_t v32 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
          __int16 v33 = 2048;
          uint64_t v34 = v14;
          __int16 v35 = 2048;
          int64_t v36 = v15;
LABEL_20:
          _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v31, 0x20u);
        }
        goto LABEL_21;
      }
      unsigned int v19 = *(_DWORD *)v5;
      uint64_t v18 = (uint64_t)(v5 + 8);
      unsigned int v17 = v19;
      if (v19 == 1684826477) {
        objc_msgSend_setUInt64_size_inDict_forKey_(self, v11, v18, v14, v7, @"dmap.longitemid");
      }
      else {
        objc_msgSend_unknownCode_bytes_size_context_(self, v11, bswap32(v17), v18, v14, "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]");
      }
      uint64_t v25 = objc_msgSend_objectForKey_(v7, v20, @"dmap.longitemid", v21);
      if (v25) {
        objc_msgSend_addObject_(v12, v22, (uint64_t)v25, v24);
      }
      objc_msgSend_removeAllObjects(v7, v22, v23, v24);
      int64_t v5 = (const char *)(v18 + v14);

      if (v4 <= 0) {
        goto LABEL_12;
      }
    }
    id v27 = BLJaliscoLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315650;
      uint64_t v32 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
      __int16 v33 = 2048;
      uint64_t v34 = 4;
      __int16 v35 = 2048;
      int64_t v36 = v4;
      _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v31, 0x20u);
    }

LABEL_22:
    id v26 = 0;
  }

  return v26;
}

- (id)parseControlPromptCollection:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v5 = (unsigned int *)a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_15:
    id v16 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        uint64_t v18 = BLJaliscoLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315650;
          uint64_t v22 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
          __int16 v23 = 2048;
          uint64_t v24 = 4;
          __int16 v25 = 2048;
          int64_t v26 = v9;
          goto LABEL_23;
        }
LABEL_24:

        goto LABEL_25;
      }
      unint64_t v10 = bswap32(v5[1]);
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        uint64_t v18 = BLJaliscoLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315650;
          uint64_t v22 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
          __int16 v23 = 2048;
          uint64_t v24 = v10;
          __int16 v25 = 2048;
          int64_t v26 = v11;
LABEL_23:
          _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
        }
        goto LABEL_24;
      }
      unsigned int v14 = *v5;
      uint64_t v13 = (uint64_t)(v5 + 2);
      uint64_t v15 = bswap32(v14);
      switch(v15)
      {
        case 0x636D6361:
          objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"attributes");
          break;
        case 0x636D6376:
          objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"value");
          break;
        case 0x636D6365:
          objc_msgSend_setString_size_inDict_forKey_(self, v7, v13, v10, v8, @"name");
          break;
        default:
          objc_msgSend_unknownCode_bytes_size_context_(self, v7, v15, v13, v10, "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]");
          break;
      }
      int64_t v5 = (unsigned int *)(v13 + v10);
      if (v4 <= 0) {
        goto LABEL_15;
      }
    }
    unsigned int v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315650;
      uint64_t v22 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
      __int16 v23 = 2048;
      uint64_t v24 = 4;
      __int16 v25 = 2048;
      int64_t v26 = v4;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
    }

LABEL_25:
    id v16 = 0;
  }

  return v16;
}

- (id)parseControlPromptResponse:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v5 = (unsigned int *)a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, a4);
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v4 < 1)
  {
LABEL_15:
    if (objc_msgSend_count(v11, v8, v9, v10)) {
      objc_msgSend_setObject_forKey_(v7, v22, (uint64_t)v11, @"items");
    }
    id v23 = v7;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v12 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        __int16 v25 = BLJaliscoLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v28 = 136315650;
          uint64_t v29 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
          __int16 v30 = 2048;
          uint64_t v31 = 4;
          __int16 v32 = 2048;
          int64_t v33 = v12;
          goto LABEL_25;
        }
LABEL_26:

        goto LABEL_27;
      }
      unsigned int v13 = v5[1];
      unint64_t v14 = bswap32(v13);
      int64_t v15 = v4 - 8;
      BOOL v16 = v4 - 8 >= v14;
      int64_t v4 = v4 - 8 - v14;
      if (!v16)
      {
        __int16 v25 = BLJaliscoLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v28 = 136315650;
          uint64_t v29 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
          __int16 v30 = 2048;
          uint64_t v31 = v14;
          __int16 v32 = 2048;
          int64_t v33 = v15;
LABEL_25:
          _os_log_impl(&dword_21DFE3000, v25, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v28, 0x20u);
        }
        goto LABEL_26;
      }
      unsigned int v18 = *v5;
      uint64_t v17 = (uint64_t)(v5 + 2);
      uint64_t v9 = bswap32(v18);
      if (v9 == 1835295596)
      {
        unsigned int v19 = objc_msgSend_parseControlPromptCollection_count_(self, v8, v17, v14);
        objc_msgSend_addObject_(v11, v20, (uint64_t)v19, v21);
      }
      else if (v9 != 1836282996)
      {
        if (v9 == 1835624804)
        {
          if (v13 == 0x4000000) {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v8, v17, 4, v7, @"dmap.itemid");
          }
          else {
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v8, v17, v14, v7, @"dmap.itemid");
          }
        }
        else
        {
          objc_msgSend_unknownCode_bytes_size_context_(self, v8, v9, v17, v14, "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]");
        }
      }
      int64_t v5 = (unsigned int *)(v17 + v14);
      if (v4 <= 0) {
        goto LABEL_15;
      }
    }
    uint64_t v24 = BLJaliscoLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315650;
      uint64_t v29 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
      __int16 v30 = 2048;
      uint64_t v31 = 4;
      __int16 v32 = 2048;
      int64_t v33 = v4;
      _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v28, 0x20u);
    }

LABEL_27:
    id v23 = 0;
  }

  return v23;
}

- (id)parseGetSpeakersResponse:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v5 = (unsigned int *)a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3, a4);
  if (v4 < 1)
  {
LABEL_11:
    id v19 = v8;
  }
  else
  {
    while ((unint64_t)v4 > 3)
    {
      int64_t v9 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        uint64_t v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          __int16 v25 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
          __int16 v26 = 2048;
          uint64_t v27 = 4;
          __int16 v28 = 2048;
          int64_t v29 = v9;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      unint64_t v10 = bswap32(v5[1]);
      int64_t v11 = v4 - 8;
      BOOL v12 = v4 - 8 >= v10;
      int64_t v4 = v4 - 8 - v10;
      if (!v12)
      {
        uint64_t v21 = BLJaliscoLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136315650;
          __int16 v25 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
          __int16 v26 = 2048;
          uint64_t v27 = v10;
          __int16 v28 = 2048;
          int64_t v29 = v11;
LABEL_19:
          _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
        }
        goto LABEL_20;
      }
      unsigned int v14 = *v5;
      uint64_t v13 = (uint64_t)(v5 + 2);
      uint64_t v15 = bswap32(v14);
      if (v15 != 1836282996)
      {
        if (v15 == 1835295596)
        {
          BOOL v16 = objc_msgSend_parseListingItem_count_(self, v7, v13, v10);
          objc_msgSend_addObject_(v8, v17, (uint64_t)v16, v18);
        }
        else
        {
          objc_msgSend_unknownCode_bytes_size_context_(self, v7, v15, v13, v10, "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]");
        }
      }
      int64_t v5 = (unsigned int *)(v13 + v10);
      if (v4 <= 0) {
        goto LABEL_11;
      }
    }
    uint64_t v20 = BLJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      __int16 v25 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
      __int16 v26 = 2048;
      uint64_t v27 = 4;
      __int16 v28 = 2048;
      int64_t v29 = v4;
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
    }

LABEL_21:
    id v19 = 0;
  }

  return v19;
}

- (id)parseDACPPropertyResponse:(const char *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], a2, 5, a4);
  if (v4 < 1)
  {
LABEL_112:
    id v61 = v8;
    goto LABEL_123;
  }
  while ((unint64_t)v4 > 3)
  {
    int64_t v9 = v4 - 4;
    if ((unint64_t)(v4 - 4) <= 3)
    {
      uint64_t v63 = BLJaliscoLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        int v66 = 136315650;
        v67 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
        __int16 v68 = 2048;
        uint64_t v69 = 4;
        __int16 v70 = 2048;
        int64_t v71 = v9;
        goto LABEL_120;
      }
LABEL_121:

      goto LABEL_122;
    }
    unsigned int v10 = *((_DWORD *)a3 + 1);
    unint64_t v11 = bswap32(v10);
    int64_t v12 = v4 - 8;
    BOOL v13 = v4 - 8 >= v11;
    int64_t v4 = v4 - 8 - v11;
    if (!v13)
    {
      uint64_t v63 = BLJaliscoLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        int v66 = 136315650;
        v67 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
        __int16 v68 = 2048;
        uint64_t v69 = v11;
        __int16 v70 = 2048;
        int64_t v71 = v12;
LABEL_120:
        _os_log_impl(&dword_21DFE3000, v63, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v66, 0x20u);
      }
      goto LABEL_121;
    }
    uint64_t v14 = bswap32(*(_DWORD *)a3);
    uint64_t v15 = (unsigned int *)(a3 + 8);
    if ((int)v14 <= 1667331698)
    {
      if ((int)v14 <= 1667329643)
      {
        if ((int)v14 > 1667326322)
        {
          if ((int)v14 <= 1667327602)
          {
            if (v14 == 1667326323)
            {
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.availableshufflestates");
              goto LABEL_107;
            }
            if (v14 != 1667327589) {
              goto LABEL_76;
            }
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.fullscreenenabled");
          }
          else
          {
            if (v14 == 1667327603)
            {
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.fullscreen");
              goto LABEL_107;
            }
            if (v14 == 1667329633)
            {
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"daap.songartist");
              goto LABEL_107;
            }
            if (v14 != 1667329639) {
              goto LABEL_76;
            }
            objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"NPGenre");
          }
        }
        else
        {
          if ((int)v14 <= 1634030408)
          {
            if (v14 == 1634026323)
            {
              if (v10 == 0x4000000)
              {
                uint64_t v42 = bswap32(*v15);
                id v43 = objc_alloc(NSNumber);
                __int16 v26 = objc_msgSend_initWithUnsignedInt_(v43, v44, v42, v45);
                objc_msgSend_stringValue(v26, v46, v47, v48);
              }
              else
              {
                __int16 v26 = objc_msgSend_parseUTF8String_length_(self, v7, (uint64_t)(a3 + 8), v11);
                v52 = NSNumber;
                uint64_t v56 = objc_msgSend_longLongValue(v26, v53, v54, v55);
                objc_msgSend_numberWithLongLong_(v52, v57, v56, v58);
              uint64_t v59 = };
              objc_msgSend_setValue_forKey_(v8, v60, (uint64_t)v59, @"com.apple.itunes.artworkchecksum");

              goto LABEL_111;
            }
            if (v14 == 1634027587)
            {
              if (*(unsigned char *)v15 == 1) {
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.has-chapter-data");
              }
              goto LABEL_107;
            }
            goto LABEL_76;
          }
          if (v14 == 1634030409)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.itms-songid");
            goto LABEL_107;
          }
          if (v14 == 1634951529)
          {
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"daap.songalbumid");
            goto LABEL_107;
          }
          if (v14 != 1667326322) {
            goto LABEL_76;
          }
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.availablerepeatstates");
        }
      }
      else
      {
        if ((int)v14 <= 1667330671)
        {
          switch((int)v14)
          {
            case 1667329644:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"daap.songalbum");
              goto LABEL_107;
            case 1667329645:
            case 1667329647:
            case 1667329649:
            case 1667329650:
            case 1667329651:
              goto LABEL_76;
            case 1667329646:
              objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dmap.itemname");
              goto LABEL_107;
            case 1667329648:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), 4, v8, @"databaseID");
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v17, (uint64_t)(a3 + 12), 4, v8, @"com.apple.itunes.itms-playlistid");
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v18, (uint64_t)(a3 + 16), 4, v8, @"dmap.containeritemid");
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v19, (uint64_t)(a3 + 20), 4, v8, @"dmap.itemid");
              goto LABEL_107;
            case 1667329652:
              objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.playingtime");
              goto LABEL_107;
            default:
              if (v14 == 1667330156)
              {
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), 8, v8, @"databaseID");
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v49, (uint64_t)(a3 + 16), 8, v8, @"com.apple.itunes.itms-playlistid");
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v50, (uint64_t)(a3 + 24), 8, v8, @"dmap.containeritemid");
                objc_msgSend_setUInt64_size_inDict_forKey_(self, v51, (uint64_t)(a3 + 32), 8, v8, @"dmap.itemid");
              }
              else
              {
                if (v14 != 1667330163) {
                  goto LABEL_76;
                }
                objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.playerstate");
              }
              break;
          }
          goto LABEL_107;
        }
        if ((int)v14 > 1667330932)
        {
          if (v14 != 1667330933)
          {
            if (v14 == 1667331683)
            {
              objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.volumecontrollable");
              goto LABEL_107;
            }
            if (v14 != 1667331685) {
              goto LABEL_76;
            }
            objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.visualizerenabled");
          }
        }
        else
        {
          if (v14 == 1667330672)
          {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.repeatstate");
            goto LABEL_107;
          }
          if (v14 == 1667330920)
          {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.shufflestate");
            goto LABEL_107;
          }
          if (v14 != 1667330932) {
            goto LABEL_76;
          }
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"daap.songtime");
        }
      }
    }
    else if ((int)v14 > 1667584835)
    {
      if ((int)v14 > 1668115818)
      {
        if ((int)v14 <= 1668118126)
        {
          if (v14 == 1668115819)
          {
            objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"mediaKind");
            goto LABEL_107;
          }
          if (v14 != 1668117362) {
            goto LABEL_76;
          }
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dmcp.playstatusrevision");
        }
        else
        {
          if (v14 == 1668118127)
          {
            float v20 = (float)bswap32(*v15) / 100.0;
            id v21 = objc_alloc(NSNumber);
            *(float *)&double v22 = v20;
            __int16 v26 = objc_msgSend_initWithFloat_(v21, v23, v24, v25, v22);
            objc_msgSend_setObject_forKey_(v8, v27, (uint64_t)v26, @"volume");
LABEL_111:

            goto LABEL_107;
          }
          if (v14 == 1836082546)
          {
            objc_msgSend_setUInt64_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dmap.persistentid");
            goto LABEL_107;
          }
          if (v14 != 1836282996) {
            goto LABEL_76;
          }
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dmap.status");
        }
      }
      else if ((int)v14 <= 1668113004)
      {
        if (v14 == 1667584836)
        {
          __int16 v28 = objc_msgSend_parseXMLContent_count_(self, v7, (uint64_t)(a3 + 8), v11);
          if (v28)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v31 = objc_msgSend_objectForKey_(v28, v29, @"id", v30);
              if (objc_msgSend_length(v31, v32, v33, v34)) {
                objc_msgSend_setObject_forKey_(v8, v35, (uint64_t)v31, @"secondScreenAdamID");
              }
              uint64_t v37 = objc_msgSend_objectForKey_(v28, v35, @"url", v36);
              if (objc_msgSend_length(v37, v38, v39, v40)) {
                objc_msgSend_setObject_forKey_(v8, v41, (uint64_t)v31, @"secondScreenURL");
              }
            }
          }

          goto LABEL_107;
        }
        if (v14 != 1668112996) {
          goto LABEL_76;
        }
        objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"libraryDisplayName");
      }
      else
      {
        if (v14 == 1668113005)
        {
          objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"libraryServiceDomain");
          goto LABEL_107;
        }
        if (v14 == 1668113011)
        {
          objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"libraryServiceName");
          goto LABEL_107;
        }
        if (v14 != 1668113012) {
          goto LABEL_76;
        }
        objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"libraryServiceType");
      }
    }
    else if ((int)v14 <= 1667583568)
    {
      switch(v14)
      {
        case 0x63617673:
          objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"dacp.visualizer");
          break;
        case 0x63654753:
          objc_msgSend_setBool_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.can-be-genius-seed");
          break;
        case 0x63654D51:
          if (*(unsigned char *)v15 == 1) {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.manually-queued");
          }
          break;
        default:
LABEL_76:
          objc_msgSend_unknownCode_bytes_size_context_(self, v7, v14, (uint64_t)(a3 + 8), v11, "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]");
          break;
      }
    }
    else
    {
      uint64_t v16 = (v14 - 1667584329);
      if (v16 <= 0x2C)
      {
        if (((1 << (v14 - 73)) & 0x62041000001) != 0) {
          goto LABEL_107;
        }
        if (v16 == 14)
        {
          objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.playqueue-warning-threshold");
          goto LABEL_107;
        }
        if (v16 == 44)
        {
          if (*(unsigned char *)v15 == 1) {
            objc_msgSend_setUInt8_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.playqueue-mode");
          }
          goto LABEL_107;
        }
      }
      if (v14 == 1667583569)
      {
        objc_msgSend_setUInt32_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.num-manually-queued");
        goto LABEL_107;
      }
      if (v14 != 1667584326) {
        goto LABEL_76;
      }
      objc_msgSend_setString_size_inDict_forKey_(self, v7, (uint64_t)(a3 + 8), v11, v8, @"com.apple.itunes.active-queue-feed-name");
    }
LABEL_107:
    a3 = (char *)v15 + v11;
    if (v4 <= 0) {
      goto LABEL_112;
    }
  }
  v62 = BLJaliscoLog();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    int v66 = 136315650;
    v67 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
    __int16 v68 = 2048;
    uint64_t v69 = 4;
    __int16 v70 = 2048;
    int64_t v71 = v4;
    _os_log_impl(&dword_21DFE3000, v62, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v66, 0x20u);
  }

LABEL_122:
  id v61 = 0;
LABEL_123:

  return v61;
}

- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 count:(int64_t)a5
{
  if ((int)a3 > 1668113012)
  {
    if ((int)a3 <= 1835360879)
    {
      if ((int)a3 > 1668117363)
      {
        if (a3 != 1668117364)
        {
          if (a3 == 1668313712) {
            goto LABEL_36;
          }
          int v5 = 1835234412;
          goto LABEL_35;
        }
      }
      else
      {
        if (a3 == 1668113013) {
          goto LABEL_36;
        }
        if (a3 == 1668113264)
        {
          id v6 = objc_msgSend_parseControlPromptResponse_count_(self, a2, (uint64_t)a4, a5);
          goto LABEL_37;
        }
        if (a3 != 1668114292) {
          goto LABEL_51;
        }
      }
      id v6 = objc_msgSend_parseDACPPropertyResponse_count_(self, a2, (uint64_t)a4, a5);
      goto LABEL_37;
    }
    if ((int)a3 <= 1835822950)
    {
      if (a3 != 1835360880)
      {
        if (a3 != 1835361379)
        {
          if (a3 == 1835364978)
          {
            id v6 = objc_msgSend_parseError_count_(self, a2, (uint64_t)a4, a5);
            goto LABEL_37;
          }
          goto LABEL_51;
        }
        goto LABEL_46;
      }
LABEL_36:
      id v6 = objc_msgSend_parseListingHeader_count_(self, a2, (uint64_t)a4, a5);
      goto LABEL_37;
    }
    if ((int)a3 > 1836282485)
    {
      if (a3 != 1836413028)
      {
        if (a3 == 1836282486)
        {
          id v6 = objc_msgSend_parseServerInfo_count_(self, a2, (uint64_t)a4, a5);
          goto LABEL_37;
        }
        goto LABEL_51;
      }
      goto LABEL_36;
    }
    if (a3 == 1835822951)
    {
      id v6 = objc_msgSend_parseLogin_count_(self, a2, (uint64_t)a4, a5);
      goto LABEL_37;
    }
    int v5 = 1836278642;
LABEL_35:
    if (a3 != v5)
    {
LABEL_51:
      objc_msgSend_unknownCode_bytes_size_context_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, "-[BLPurchaseDAAPParser processResponseCode:bytes:count:]");
      goto LABEL_52;
    }
    goto LABEL_36;
  }
  if ((int)a3 <= 1634759534)
  {
    if ((int)a3 > 1634165099)
    {
      if (a3 == 1634165100 || a3 == 1634165106) {
        goto LABEL_36;
      }
      int v5 = 1634757753;
    }
    else
    {
      if (a3 == 1633841775 || a3 == 1633968755) {
        goto LABEL_36;
      }
      int v5 = 1634026066;
    }
    goto LABEL_35;
  }
  if ((int)a3 > 1667326824)
  {
    if ((int)a3 > 1667330927)
    {
      if (a3 == 1667330928)
      {
        id v6 = objc_msgSend_parseGetSpeakersResponse_count_(self, a2, (uint64_t)a4, a5);
        goto LABEL_37;
      }
      if (a3 == 1667581769)
      {
        id v6 = objc_msgSend_parseListingCollection_count_capacity_(self, a2, (uint64_t)a4, a5, 0);
        goto LABEL_37;
      }
      goto LABEL_51;
    }
    if (a3 != 1667326825)
    {
      if (a3 != 1667326834) {
        goto LABEL_51;
      }
LABEL_46:
      id v6 = objc_msgSend_parseListingItem_count_(self, a2, (uint64_t)a4, a5);
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (a3 == 1634759535) {
    goto LABEL_36;
  }
  if (a3 != 1634890614)
  {
    int v5 = 1635148898;
    goto LABEL_35;
  }
LABEL_52:
  id v6 = 0;
LABEL_37:

  return v6;
}

+ (id)typeForDRCPValueType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13) {
    return @"undefined";
  }
  else {
    return off_26448B9B0[a3 - 1];
  }
}

@end