@interface IDSSessionInfoMetadataSerializer
+ (id)_readArrayFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5;
+ (id)_readDictionaryFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5;
+ (id)deserializeSessionInfoMetadata:(id)a3;
+ (id)serializeSessionInfoMetadata:(id)a3;
+ (void)_writeArrayToByteBuffer:(id)a3 buffer:(id *)a4;
+ (void)_writeDictionaryToByteBuffer:(id)a3 buffer:(id *)a4;
+ (void)_writeNumberToByteBuffer:(id)a3 buffer:(id *)a4;
+ (void)_writeStringToByteBuffer:(id)a3 buffer:(id *)a4;
@end

@implementation IDSSessionInfoMetadataSerializer

+ (id)serializeSessionInfoMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x4810000000;
  v18 = &unk_19DBF8FDD;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[0] = v4;
  v19[1] = v4;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  IDSByteBufferInitForWrite((uint64_t)v19);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19DB4EA90;
  v14[3] = &unk_1E5975B10;
  v14[4] = &v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v5, (uint64_t)v14, COERCE_DOUBLE(3221225472));
  v8 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v6, v16[4], v7, (unsigned __int16)(*((_WORD *)v16 + 24) - v16[4]));
  double v9 = IDSByteBufferRelease((uint64_t)(v16 + 4));
  v12 = objc_msgSend__CUTCopyGzippedData(v8, v10, v11, v9);

  _Block_object_dispose(&v15, 8);
  return v12;
}

+ (void)_writeStringToByteBuffer:(id)a3 buffer:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  size_t v10 = v9 + 2;
  unint64_t v11 = (v9 + 17) & 0xFFFFFFFFFFFFFFF0;
  v12 = (_WORD *)((char *)v20 - v11);
  if (v9 != -2) {
    memset((char *)v20 - v11, 170, v10);
  }
  if (v5
    && (v13 = v5, (uint64_t v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16)) != 0))
  {
    v18 = v17;
    unsigned int v19 = strlen(v17);
    _WORD *v12 = bswap32(v19) >> 16;
    if ((_WORD)v19) {
      memcpy(v12 + 1, v18, (unsigned __int16)v19);
    }
  }
  else
  {
    _WORD *v12 = 0;
  }
  IDSByteBufferWriteField((uint64_t)a4, 1, v12, (unsigned __int16)v10);
}

+ (void)_writeNumberToByteBuffer:(id)a3 buffer:(id *)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = bswap64(objc_msgSend_unsignedLongLongValue(a3, a2, (uint64_t)a3, v4));
  IDSByteBufferWriteField((uint64_t)a4, 2, v6, 8uLL);
}

+ (void)_writeDictionaryToByteBuffer:(id)a3 buffer:(id *)a4
{
  id v6 = a3;
  __int16 __src = bswap32(objc_msgSend_count(v6, v7, v8, v9)) >> 16;
  IDSByteBufferWriteField((uint64_t)a4, 4, &__src, 2uLL);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19DB4EE08;
  v11[3] = &unk_1E5975B30;
  v11[4] = a1;
  v11[5] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v10, (uint64_t)v11, COERCE_DOUBLE(3221225472));
}

+ (void)_writeArrayToByteBuffer:(id)a3 buffer:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 __src = bswap32(objc_msgSend_count(v6, v7, v8, v9)) >> 16;
  IDSByteBufferWriteField((uint64_t)a4, 3, &__src, 2uLL);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v12, v24, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend__writeNumberToByteBuffer_buffer_(a1, v14, *(void *)(*((void *)&v19 + 1) + 8 * v18++), v15, a4, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v19, v15, v24, 16);
    }
    while (v16);
  }
}

+ (id)deserializeSessionInfoMetadata:(id)a3
{
  id v3 = a3;
  char v58 = -86;
  v57 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v56 = -21846;
  unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54[0] = v4;
  v54[1] = v4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v52 = v3;
  objc_msgSend__CUTDecompressData(v3, v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_bytes(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_length(v9, v14, v15, v16);
  IDSByteBufferInitForRead((uint64_t)v54, v13, v17);
  if (IDSByteBufferReadField((uint64_t)v54, &v58, &v57, &v56))
  {
    long long v20 = &stru_1EEFDAD58;
    while (2)
    {
      switch(v58)
      {
        case 1:
          int isEqualToString = objc_msgSend_isEqualToString_(v20, v18, (uint64_t)&stru_1EEFDAD58, v19);
          unsigned int v24 = v56 - 2;
          if (isEqualToString)
          {
            if (v56 < 2u
              || ((uint64_t v25 = (uint64_t)v57 + 2, v26 = __rev16(*(unsigned __int16 *)v57), v26)
                ? (BOOL v27 = v24 >= v26)
                : (BOOL v27 = 0),
                  !v27))
            {

              long long v20 = 0;
              goto LABEL_18;
            }
            id v37 = [NSString alloc];
            uint64_t v40 = objc_msgSend_initWithBytes_length_encoding_(v37, v38, v25, v39, v26, 4);

            if (v40)
            {
              v57 = (unint64_t *)(v25 + v26);
              unsigned __int16 v56 = v24 - v26;
              long long v20 = (__CFString *)v40;
              goto LABEL_18;
            }
            v51 = OSLogHandleForTransportCategory();
            v48 = v52;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"IDSNetworking", @"IDS", @"Could not read NSString from byte array");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"IDSNetworking", @"Could not read NSString from byte array");
                }
              }
            }
            long long v20 = 0;
            goto LABEL_51;
          }
          if (v56 >= 2u
            && ((uint64_t v33 = (uint64_t)v57 + 2, v34 = __rev16(*(unsigned __int16 *)v57), v34)
              ? (BOOL v35 = v24 >= v34)
              : (BOOL v35 = 0),
                v35))
          {
            id v41 = [NSString alloc];
            uint64_t v44 = objc_msgSend_initWithBytes_length_encoding_(v41, v42, v33, v43, v34, 4);
            if (!v44)
            {
              v50 = OSLogHandleForTransportCategory();
              v48 = v52;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(@"IDSNetworking", @"IDS", @"Could not read NSString from byte array");
                  if (_IDSShouldLog()) {
                    _IDSLogV(0, @"IDSFoundation", @"IDSNetworking", @"Could not read NSString from byte array");
                  }
                }
              }
LABEL_51:
              id v47 = 0;
              goto LABEL_34;
            }
            v36 = (void *)v44;
            v57 = (unint64_t *)(v33 + v34);
            unsigned __int16 v56 = v24 - v34;
            objc_msgSend_setObject_forKeyedSubscript_(v5, v45, v44, v46, v20);
          }
          else
          {
            v36 = 0;
            objc_msgSend_setObject_forKeyedSubscript_(v5, v22, 0, v23, v20);
          }

          goto LABEL_17;
        case 2:
          uint64_t v31 = bswap64(*v57++);
          uint64_t v28 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v18, v31, v19);
          goto LABEL_16;
        case 3:
          uint64_t v28 = objc_msgSend__readArrayFromByteArray_fieldByteSize_byteBuffer_(IDSSessionInfoMetadataSerializer, v18, (uint64_t)v57, v19, v56, v54);
          if (!v28) {
            goto LABEL_37;
          }
          goto LABEL_16;
        case 4:
          uint64_t v28 = objc_msgSend__readDictionaryFromByteArray_fieldByteSize_byteBuffer_(IDSSessionInfoMetadataSerializer, v18, (uint64_t)v57, v19, v56, v54);
          if (!v28)
          {
LABEL_37:
            IDSByteBufferRelease((uint64_t)v54);
            id v47 = 0;
            goto LABEL_33;
          }
LABEL_16:
          v32 = (void *)v28;
          objc_msgSend_setObject_forKeyedSubscript_(v5, v29, v28, v30, v20);

LABEL_17:
          long long v20 = &stru_1EEFDAD58;
LABEL_18:
          if (!IDSByteBufferReadField((uint64_t)v54, &v58, &v57, &v56)) {
            goto LABEL_32;
          }
          continue;
        default:
          goto LABEL_18;
      }
    }
  }
  long long v20 = &stru_1EEFDAD58;
LABEL_32:
  IDSByteBufferRelease((uint64_t)v54);
  id v47 = v5;
LABEL_33:
  v48 = v52;
LABEL_34:

  return v47;
}

+ (id)_readArrayFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5
{
  unsigned int v7 = a4;
  long long v21 = a3;
  unsigned __int16 v20 = a4;
  char v19 = -86;
  id v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, v5);
  if (v7 >= 2)
  {
    unsigned __int16 v20 = v7 - 2;
    unsigned int v11 = __rev16(*(unsigned __int16 *)a3);
    long long v21 = a3 + 2;
    if (v11)
    {
      while (1)
      {
        id v10 = 0;
        if (!IDSByteBufferReadField((uint64_t)a5, &v19, &v21, &v20) || v20 < 8u) {
          break;
        }
        uint64_t v14 = bswap64(*(void *)v21);
        v21 += 8;
        uint64_t v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v12, v14, v13);
        objc_msgSend_addObject_(v9, v16, (uint64_t)v15, v17);

        if (!--v11) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      id v10 = v9;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_readDictionaryFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5
{
  unsigned int v7 = a4;
  v53 = a3;
  unsigned __int16 v52 = a4;
  char v51 = -86;
  id v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, v5);
  if (v7 < 2) {
    goto LABEL_39;
  }
  unsigned __int16 v52 = v7 - 2;
  unsigned int v10 = __rev16(*(unsigned __int16 *)a3);
  v53 = a3 + 2;
  if (!v10)
  {
LABEL_36:
    id v45 = v9;
    goto LABEL_40;
  }
  int v11 = 0;
  while (1)
  {
    if (!IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52)) {
      goto LABEL_39;
    }
    if (v51 == 1) {
      break;
    }
    if (v51 != 2) {
      goto LABEL_14;
    }
    if (v52 < 8u)
    {
      uint64_t v15 = 0;
      goto LABEL_38;
    }
    v52 -= 8;
    uint64_t v14 = bswap64(*(void *)v53);
    v53 += 8;
    uint64_t v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v12, v14, v13);
LABEL_15:
    if (!IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52)) {
      goto LABEL_38;
    }
    if (v51 == 3)
    {
      if (v52 < 2u) {
        goto LABEL_38;
      }
      v52 -= 2;
      unsigned int v34 = __rev16(*(unsigned __int16 *)v53);
      v53 += 2;
      unsigned int v24 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22);
      if (v34)
      {
        while (IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52) && v52 >= 8u)
        {
          uint64_t v37 = bswap64(*(void *)v53);
          v53 += 8;
          v38 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v35, v37, v36);
          objc_msgSend_addObject_(v24, v39, (uint64_t)v38, v40);

          if (!--v34) {
            goto LABEL_29;
          }
        }

        goto LABEL_38;
      }
      goto LABEL_29;
    }
    if (v51 == 1 && (unsigned int v23 = v52 - 2, v52 >= 2u))
    {
      unsigned int v24 = 0;
      uint64_t v25 = (uint64_t)(v53 + 2);
      uint64_t v26 = __rev16(*(unsigned __int16 *)v53);
      if (v26)
      {
        unsigned __int16 v27 = v23 - v26;
        if (v23 >= v26)
        {
          id v28 = [NSString alloc];
          uint64_t v31 = objc_msgSend_initWithBytes_length_encoding_(v28, v29, v25, v30, v26, 4);
          if (v31)
          {
            unsigned int v24 = (void *)v31;
            v53 = (char *)(v25 + v26);
            unsigned __int16 v52 = v27;
LABEL_29:
            if (v15 && v24) {
              objc_msgSend_setObject_forKeyedSubscript_(v9, v32, (uint64_t)v24, v33, v15);
            }
            goto LABEL_32;
          }
          v48 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", v49, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"IDSNetworking", @"IDS", @"Could not read NSString from byte array");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"IDSNetworking", @"Could not read NSString from byte array");
              }
            }
          }
LABEL_38:

          goto LABEL_39;
        }
      }
    }
    else
    {
      unsigned int v24 = 0;
    }
LABEL_32:

    if (++v11 == v10) {
      goto LABEL_36;
    }
  }
  unsigned int v16 = v52 - 2;
  if (v52 < 2u
    || ((uint64_t v17 = (uint64_t)(v53 + 2), v18 = __rev16(*(unsigned __int16 *)v53), v18)
      ? (BOOL v19 = v16 >= v18)
      : (BOOL v19 = 0),
        !v19))
  {
LABEL_14:
    uint64_t v15 = 0;
    goto LABEL_15;
  }
  id v41 = [NSString alloc];
  uint64_t v44 = objc_msgSend_initWithBytes_length_encoding_(v41, v42, v17, v43, v18, 4);
  if (v44)
  {
    uint64_t v15 = (void *)v44;
    v53 = (char *)(v17 + v18);
    unsigned __int16 v52 = v16 - v18;
    goto LABEL_15;
  }
  id v47 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"IDSNetworking", @"IDS", @"Could not read NSString from byte array");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"IDSNetworking", @"Could not read NSString from byte array");
      }
    }
  }
LABEL_39:
  id v45 = 0;
LABEL_40:

  return v45;
}

@end