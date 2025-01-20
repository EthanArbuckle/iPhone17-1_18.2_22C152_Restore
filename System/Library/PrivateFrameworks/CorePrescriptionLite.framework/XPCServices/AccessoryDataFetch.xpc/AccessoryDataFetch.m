int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3;
  void *v4;
  void *v5;
  void *v6;

  MASetAccessoryDataFetchLogger();
  v3 = os_log_create("com.apple.CorePrescription", "AccessoryDataFetch");
  v4 = off_100028CD0;
  off_100028CD0 = v3;

  v5 = objc_opt_new();
  v6 = +[NSXPCListener serviceListener];
  [v6 setDelegate:v5];
  [v6 resume];

  return 0;
}

uint64_t MASetAccessoryDataFetchLogger()
{
  off_100028DF8 = os_log_create("com.apple.CorePrescription", "AccessoryDataFetch");
  return _objc_release_x1();
}

id createManagedAssetError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  id v14 = a5;
  id v15 = [objc_alloc((Class)NSMutableString) initWithFormat:v14 arguments:&a9];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = v16;
  if (v15) {
    [v16 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      v18 = +[NSString stringWithUTF8String:a1];
      [v17 setObject:v18 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      v19 = +[NSNumber numberWithInt:a2];
      [v17 setObject:v19 forKeyedSubscript:@"SourceLine"];
    }
  }
  v20 = +[NSError errorWithDomain:@"com.apple.ManagedAsset.ErrorDomain" code:a3 userInfo:v17];

  return v20;
}

void sub_10000306C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000030A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000030B4(uint64_t a1)
{
}

void sub_1000030BC(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v10 = 0;
  unsigned __int8 v4 = [v2 deriveRecIdEncryptKey:v3 derivedOut:&v10 error:&v9];
  id v5 = v10;
  id v6 = v10;
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v5);
  }
}

id sub_100003174(unsigned __int8 *a1, int a2)
{
  unsigned __int8 v4 = +[NSMutableString stringWithCapacity:(2 * a2)];
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    do
    {
      unsigned int v6 = *a1++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v6);
      --v5;
    }
    while (v5);
  }
  return v4;
}

void sub_100003334(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = off_100028DF8;
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v47 = a2;
    *(_WORD *)&v47[4] = 2112;
    *(void *)&v47[6] = v7;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "got server response: status=%d message=%@, data=%@", buf, 0x1Cu);
    if (a2) {
      goto LABEL_3;
    }
LABEL_14:
    id v19 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v8 options:1];
    v20 = (unsigned __int8 *)[v19 bytes];
    id v24 = [v19 length];
    uint64_t v25 = (uint64_t)v24 - 32;
    if ((unint64_t)v24 > 0x20)
    {
      if (*v20 == 1)
      {
        v40[1] = v20 + 4;
        id v26 = [*(id *)(a1 + 56) bytes];
        v40[2] = v40;
        v40[0] = v26;
        v27 = (char *)v40 - (((unint64_t)v24 - 17) & 0xFFFFFFFFFFFFFFF0);
        ccaes_gcm_decrypt_mode();
        uint64_t v28 = ccgcm_one_shot();
        if (v28)
        {
          createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:]_block_invoke", 469, kMASDDecryptionError, 0, @"failed to decrypt the data from the server, ret=%d", v29, v30, v31, v28);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
            sub_10001C790();
          }
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }
        else
        {
          memset_s(v40[0], 0x20uLL, 0, 0x20uLL);
          if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG)) {
            sub_10001C7F8();
          }
          id v42 = 0;
          id v43 = 0;
          id v41 = 0;
          BOOL v34 = sub_100003888((uint64_t)v27, v25, &v43, &v42, 0, &v41, v32, v33);
          id v35 = v43;
          id v36 = v42;
          id v18 = v41;
          if (v34)
          {
            v37 = off_100028DF8;
            if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_INFO))
            {
              uint64_t v38 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              *(void *)v47 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "fetch data succeeded, recId=%@", buf, 0xCu);
            }
            v39 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
          }
          else
          {
            v39 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
          }
          v39();
        }
        goto LABEL_33;
      }
      createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:]_block_invoke", 448, kMASDBadServerDataError, 0, @"bad data from the server, uknown encryption type=%u", v21, v22, v23, *v20);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
    }
    else
    {
      createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:]_block_invoke", 439, kMASDBadServerDataError, 0, @"bad data from the server, size=%lu", v21, v22, v23, (uint64_t)v24);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
LABEL_23:
      }
        sub_10001C790();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_33:

    goto LABEL_34;
  }
  if (!a2) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v13 = createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:]_block_invoke", 403, kMASDDataFetchingError, 0, @"error fetching data from the server, status=%d, message=%@", v10, v11, v12, a2);
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
    sub_10001C790();
  }
  if (*(unsigned char *)(a1 + 72))
  {
    if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG)) {
      sub_10001C860();
    }
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v44 = v13;
    id v45 = 0;
    unsigned __int8 v16 = [v14 serverConnectionWithOptions:v15 defaultEnvironment:1 hasEnvironmentOption:0 serverConnection:&v45 error:&v44];
    id v17 = v45;
    id v18 = v44;

    if (v16) {
      objc_msgSend(*(id *)(a1 + 40), "fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:", v17, *(void *)(a1 + 32), *(void *)(a1 + 56), 0, 0, *(void *)(a1 + 64));
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v18 = v13;
  }
LABEL_34:
}

BOOL sub_100003888(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *(unsigned int *)(a1 + 4);
  if (v9 > 0xA00000)
  {
    createManagedAssetError((uint64_t)"parseCompressedData", 253, kMASDBadCompressedDataError, 0, @"invalid data from the server, decompressedDataLen=%u", (uint64_t)a6, a7, a8, v9);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10001C5E0();
      return 0;
    }
    return result;
  }
  unsigned __int8 v16 = off_100028DF8;
  BOOL v17 = os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG);
  if (v17) {
    sub_10001C900((unsigned __int8 *)a1, v9, v16);
  }
  uint64_t v39 = (uint64_t)&v39;
  __chkstk_darwin(v17);
  id v18 = (uint8_t *)&v39 - ((v9 + 15) & 0x1FFFFFFF0);
  size_t v19 = compression_decode_buffer(v18, v9, (const uint8_t *)(a1 + 8), a2 - 8, 0, (compression_algorithm)0x505u);
  if (v19 != v9)
  {
    createManagedAssetError((uint64_t)"parseCompressedData", 270, kMASDDecompressionError, 0, @"failed to decompress the data from the server, len=%zu expects: %d", v20, v21, v22, v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG)) {
    sub_10001C8CC();
  }
  if (v9 < 0x14 || *v18 != 1)
  {
    createManagedAssetError((uint64_t)"parseCompressedData", 281, kMASDBadDecompressedDataError, 0, @"unknown decompressed data format from the server, type=%u expects: 1", v23, v24, v25, *v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
LABEL_33:
    sub_10001C5E0();
    return 0;
  }
  uint64_t v26 = *((unsigned int *)v18 + 1);
  uint64_t v27 = *((unsigned int *)v18 + 2);
  uint64_t v29 = *((unsigned int *)v18 + 3);
  uint64_t v28 = *((unsigned int *)v18 + 4);
  BOOL v33 = v26 != 20
     || v9 < v27
     || v9 < v29
     || v9 < v28
     || (int)v27 + 20 > v29;
  uint64_t v34 = (v28 + v29);
  if (v33 || v9 < v34)
  {
    createManagedAssetError((uint64_t)"parseCompressedData", 301, kMASDBadDecompressedDataError, 0, @"invalid data header (%u, %u, %u, %u) in decompressed data from the server", v23, v24, v25, v26);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    goto LABEL_33;
  }
  if (v27)
  {
    id v36 = [objc_alloc((Class)NSString) initWithBytes:v18 + 20 length:v27 encoding:1];
    uint64_t v34 = (v28 + v29);
    *a3 = v36;
  }
  if (v28)
  {
    uint64_t v37 = v34;
    id v38 = [objc_alloc((Class)NSString) initWithBytes:&v18[v29] length:v28 encoding:1];
    uint64_t v34 = v37;
    *a4 = v38;
  }
  BOOL result = 1;
  if (a5 && v9 != v34)
  {
    *a5 = +[NSData dataWithBytes:&v18[v29 + v28] length:v9 - v34];
    return 1;
  }
  return result;
}

void sub_100003FC8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  size_t v9 = off_100028DF8;
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = a2;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "got server response: status=%d message=%@, data=%@", buf, 0x1Cu);
    if (a2) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v19 = ccec_cp_384();
    uint64_t v20 = __chkstk_darwin(v19);
    *(void *)((char *)v52 - v21) = v20;
    id v22 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v8 options:1];
    uint64_t v23 = [v22 bytes];
    uint64_t v27 = (char *)[v22 length];
    if ((unint64_t)v27 <= *(void *)(a1 + 72) + 20)
    {
      createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 611, kMASDBadServerDataError, 0, @"bad data from the server, size=%lu", v24, v25, v26, (uint64_t)v27);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
    }
    else if (*v23 == 2)
    {
      v52[4] = v52;
      uint64_t v63 = 0;
      memset(buf, 0, sizeof(buf));
      ccsha384_di();
      ccaes_gcm_decrypt_mode();
      uint64_t v28 = ccecies_decrypt_gcm_setup();
      if (v28)
      {
        createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 638, kMASDInternalError, 0, @"failed to ccecies_decrypt_gcm_setup, rc=%d", v29, v30, v31, v28);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
          sub_10001C790();
        }
        goto LABEL_24;
      }
      v52[3] = *(void *)(a1 + 72);
      v52[2] = [*(id *)(a1 + 56) bytes];
      [*(id *)(a1 + 56) length];
      [*(id *)(a1 + 56) bytes];
      uint64_t v32 = ccec_x963_import_priv();
      if (v32)
      {
        createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 652, kMASDInputError, 0, @"failed to import the private key, ret=%d", v33, v34, v35, v32);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      id v36 = v27 - 4;
      uint64_t v57 = ccecies_decrypt_gcm_plaintext_size();
      __chkstk_darwin(v57);
      id v38 = (char *)v52 - v37;
      v52[1] = v36;
      uint64_t v39 = ccecies_decrypt_gcm();
      cc_clear();
      if (!v39)
      {
        if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG)) {
          sub_10001C7F8();
        }
        id v55 = 0;
        id v56 = 0;
        id v53 = 0;
        id v54 = 0;
        BOOL v45 = sub_100003888((uint64_t)v38, v57, &v56, &v55, &v54, &v53, v43, v44);
        id v46 = v56;
        id v47 = v55;
        id v48 = v54;
        id v18 = v53;
        if (v45)
        {
          id v49 = off_100028DF8;
          if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_INFO))
          {
            uint64_t v50 = *(void *)(a1 + 32);
            *(_DWORD *)v60 = 138412290;
            uint64_t v61 = v50;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "fetch data succeeded, keyhash=%@", v60, 0xCu);
          }
          v51 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        else
        {
          v51 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        v51();

        goto LABEL_25;
      }
      createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 667, kMASDDecryptionError, 0, @"failed to decrypt the data from the server, ret=%d", v40, v41, v42, v39);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
LABEL_23:
      }
        sub_10001C790();
    }
    else
    {
      createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 621, kMASDBadServerDataError, 0, @"bad data from the server, uknown encryption type=%u", v24, v25, v26, *v23);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
    }
LABEL_24:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_25:

    goto LABEL_26;
  }
  if (!a2) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v13 = createManagedAssetError((uint64_t)"-[AccessoryDataFetch fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:]_block_invoke", 567, kMASDDataFetchingError, 0, @"error fetching data from the server, status=%d, message=%@", v10, v11, v12, a2);
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_ERROR)) {
    sub_10001C790();
  }
  if (*(unsigned char *)(a1 + 80))
  {
    if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_DEBUG)) {
      sub_10001C9F4();
    }
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v58 = v13;
    id v59 = 0;
    unsigned __int8 v16 = [v14 serverConnectionWithOptions:v15 defaultEnvironment:1 hasEnvironmentOption:0 serverConnection:&v59 error:&v58];
    id v17 = v59;
    id v18 = v58;

    if (v16) {
      [*(id *)(a1 + 40) fetchDataByFullKeyFromServer:v17 keyhash:*(void *)(a1 + 32) fullKey:*(void *)(a1 + 56) pubkeyLen:*(void *)(a1 + 72) retryServerEnvironment:0 options:0 withReply:*(void *)(a1 + 64)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v18 = v13;
  }
LABEL_26:
}

void sub_1000047C8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v6 = [v5 integerValue] - 4;
    if (v6 > 6) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = qword_10001DEF8[v6];
    }
    id v8 = +[NSNumber numberWithInteger:v7];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v9];
    }
  }
}

void sub_100004980(uint64_t a1)
{
  v2 = off_100028DF8;
  if (os_log_type_enabled((os_log_t)off_100028DF8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fetching primary Apple account info", buf, 2u);
  }
  uint64_t v3 = +[ACAccountStore defaultStore];
  unsigned __int8 v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v4)
  {
    id v5 = [v4 username];
    unsigned int v6 = (const char *)[v5 UTF8String];

    CC_LONG v7 = strlen(v6);
    CC_SHA1(v6, v7, buf);
    id v8 = +[NSMutableString stringWithCapacity:40];
    for (uint64_t i = 0; i != 20; ++i)
      objc_msgSend(v8, "appendFormat:", @"%02X", buf[i]);
    uint64_t v10 = +[NSString stringWithString:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = objc_msgSend(v4, "aa_firstName");
  (*(void (**)(uint64_t, void *, void *, void))(v11 + 16))(v11, v10, v12, 0);
}

void sub_100004B2C(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.managedassets.accessorydatafetch.scrypt.serial", v3);
  v2 = (void *)qword_100029CE0;
  qword_100029CE0 = (uint64_t)v1;
}

void sub_100004B90(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.managedassets.accessorydatafetch.account.serial", v3);
  v2 = (void *)qword_100029CF0;
  qword_100029CF0 = (uint64_t)v1;
}

void sub_100004BF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004C28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100004C44(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100004C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100004C88(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t sub_100004CB4()
{
  sub_10000587C();
  uint64_t result = sub_10001CEF0();
  qword_100028E30 = result;
  return result;
}

AccessoryDataFetch::MuseAccessoryDataConnection::Environment_optional __swiftcall MuseAccessoryDataConnection.Environment.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 2) {
    v1.value = AccessoryDataFetch_MuseAccessoryDataConnection_Environment_production;
  }
  else {
    v1.value = AccessoryDataFetch_MuseAccessoryDataConnection_Environment_unknownDefault;
  }
  if (rawValue == 1) {
    return 0;
  }
  else {
    return v1;
  }
}

uint64_t MuseAccessoryDataConnection.Environment.rawValue.getter(char a1)
{
  return (a1 & 1u) + 1;
}

BOOL sub_100004D40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100004D58()
{
  int v1 = *v0;
  sub_10001CFF0();
  if (v1) {
    Swift::UInt v2 = 2;
  }
  else {
    Swift::UInt v2 = 1;
  }
  sub_10001D000(v2);
  return sub_10001D020();
}

void sub_100004DA8()
{
  if (*v0) {
    Swift::UInt v1 = 2;
  }
  else {
    Swift::UInt v1 = 1;
  }
  sub_10001D000(v1);
}

Swift::Int sub_100004DE0()
{
  int v1 = *v0;
  sub_10001CFF0();
  if (v1) {
    Swift::UInt v2 = 2;
  }
  else {
    Swift::UInt v2 = 1;
  }
  sub_10001D000(v2);
  return sub_10001D020();
}

void *sub_100004E2C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 2) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 1) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_100004E4C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1;
  if (*v1) {
    uint64_t v2 = 2;
  }
  *a1 = v2;
}

uint64_t variable initialization expression of SerialNumberMappingResult.serialNumber()
{
  return 0;
}

uint64_t variable initialization expression of SerialNumberMappingResult.result()
{
  return 0;
}

void *variable initialization expression of GetSNResponse.results()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of PutSNResponse.status()
{
  return 0;
}

uint64_t variable initialization expression of PutSNRequest._mapping@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SerialNumberMapping(0);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

unint64_t sub_100004F08()
{
  unint64_t result = qword_100028EB8;
  if (!qword_100028EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028EB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MuseAccessoryDataConnection()
{
  return &type metadata for MuseAccessoryDataConnection;
}

unsigned char *initializeBufferWithCopyOfBuffer for MuseAccessoryDataConnection.Environment(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MuseAccessoryDataConnection.Environment(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MuseAccessoryDataConnection.Environment(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000050D8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005100(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000510C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MuseAccessoryDataConnection.Environment()
{
  return &type metadata for MuseAccessoryDataConnection.Environment;
}

id sub_100005128()
{
  return *v0;
}

uint64_t sub_100005130@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *sub_100005138@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005148(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005154()
{
  return sub_10001CE50();
}

uint64_t sub_100005164()
{
  sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  return sub_10001CB00();
}

uint64_t sub_1000051D0(uint64_t a1)
{
  uint64_t v2 = sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000523C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  id v5 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000052CC()
{
  id v1 = *v0;
  uint64_t v2 = sub_10001CEE0();

  return v2;
}

uint64_t sub_100005304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005380()
{
  return sub_10001D020();
}

uint64_t sub_1000053E0(uint64_t a1)
{
  uint64_t v2 = sub_100005960(&qword_100028EE8, type metadata accessor for CKError);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000544C(uint64_t a1)
{
  uint64_t v2 = sub_100005960(&qword_100028EE8, type metadata accessor for CKError);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000054BC(uint64_t a1)
{
  uint64_t v2 = sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005960(&qword_100028F20, type metadata accessor for CKError);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_1000055AC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000055C0(uint64_t a1, char a2)
{
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = objc_allocWithZone((Class)CKContainerID);
  NSString v5 = sub_10001CE40();
  id v6 = [v4 initWithContainerIdentifier:v5 environment:v3];

  id v7 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v6];
  NSString v8 = sub_10001CE40();
  id v9 = [v7 codeServiceWithName:v8 databaseScope:a1];

  if (qword_100028E28 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_100028E30;
  id v11 = v9;
  os_log_type_t v12 = sub_10001CEA0();
  if (os_log_type_enabled(v10, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    id v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    id v15 = v11;
    sub_10001CF10();
    *id v14 = v11;

    _os_log_impl((void *)&_mh_execute_header, v10, v12, "created codeService: %@", v13, 0xCu);
    sub_100005838(&qword_100028EC0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  type metadata accessor for MuseAccessoryDataAPIAsyncClient();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v11;
  return result;
}

uint64_t sub_100005838(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000587C()
{
  unint64_t result = qword_100028EC8;
  if (!qword_100028EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028EC8);
  }
  return result;
}

void type metadata accessor for CKError(uint64_t a1)
{
}

uint64_t sub_1000058D0()
{
  return sub_100005960(&qword_100028ED8, type metadata accessor for CKError);
}

uint64_t sub_100005918()
{
  return sub_100005960(&qword_100028EE0, type metadata accessor for CKError);
}

uint64_t sub_100005960(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000059A8()
{
  return sub_100005960(&qword_100028EE8, type metadata accessor for CKError);
}

uint64_t sub_1000059F0()
{
  return sub_100005960(&qword_100028EF0, type metadata accessor for CKError);
}

uint64_t sub_100005A38()
{
  return sub_100005960(&qword_100028EF8, type metadata accessor for CKError);
}

uint64_t sub_100005A80()
{
  return sub_100005960(&qword_100028F00, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100005ADC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005B24()
{
  return sub_100005960(&qword_100028F08, type metadata accessor for Code);
}

unint64_t sub_100005B70()
{
  unint64_t result = qword_100028F10;
  if (!qword_100028F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028F10);
  }
  return result;
}

uint64_t sub_100005BC4()
{
  return sub_100005960(&qword_100028F18, type metadata accessor for Code);
}

uint64_t sub_100005C0C()
{
  return sub_100005960(&qword_100028F20, type metadata accessor for CKError);
}

uint64_t MuseAccessoryDataAPIAsyncClient.__allocating_init(codeService:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t MuseAccessoryDataAPI.PutOperation.__allocating_init(request:)(uint64_t a1)
{
  return sub_100005CF0(a1, &qword_100028F30);
}

uint64_t MuseAccessoryDataAPI.PutOperation.init(request:)(uint64_t a1)
{
  return sub_100005DCC(a1, &qword_100028F30);
}

void MuseAccessoryDataAPI.PutOperation.init(functionName:request:)()
{
}

uint64_t MuseAccessoryDataAPI.GetOperation.__allocating_init(request:)(uint64_t a1)
{
  return sub_100005CF0(a1, &qword_100028F38);
}

uint64_t sub_100005CF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = sub_100005838(a2);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone(v2);
  sub_100007418(a1, (uint64_t)v7, a2);
  uint64_t v9 = sub_10001CB60();
  sub_10000747C(a1, a2);
  return v9;
}

uint64_t MuseAccessoryDataAPI.GetOperation.init(request:)(uint64_t a1)
{
  return sub_100005DCC(a1, &qword_100028F38);
}

uint64_t sub_100005DCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100005838(a2);
  __chkstk_darwin(v4 - 8);
  sub_100007418(a1, (uint64_t)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  uint64_t v6 = sub_10001CB60();
  sub_10000747C(a1, a2);
  return v6;
}

void MuseAccessoryDataAPI.GetOperation.init(functionName:request:)()
{
}

uint64_t MuseAccessoryDataAPI.PutsnOperation.__allocating_init(request:)(uint64_t a1)
{
  return sub_100005CF0(a1, &qword_100028F40);
}

uint64_t MuseAccessoryDataAPI.PutsnOperation.init(request:)(uint64_t a1)
{
  return sub_100005DCC(a1, &qword_100028F40);
}

void MuseAccessoryDataAPI.PutsnOperation.init(functionName:request:)()
{
}

uint64_t MuseAccessoryDataAPI.GetsnOperation.__allocating_init(request:)(uint64_t a1)
{
  return sub_100005CF0(a1, &qword_100028F48);
}

uint64_t MuseAccessoryDataAPI.GetsnOperation.init(request:)(uint64_t a1)
{
  return sub_100005DCC(a1, &qword_100028F48);
}

void MuseAccessoryDataAPI.GetsnOperation.init(functionName:request:)()
{
}

void sub_100005F48()
{
}

id _s18AccessoryDataFetch04MuseaB3APIO14PutsnOperationCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t MuseAccessoryDataAPIAsync.put(requestID:timestamp:clientVersion:items:pubkeyEncItems:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v26 = a9;
  uint64_t v24 = a8;
  uint64_t v25 = a10;
  uint64_t v27 = a11;
  uint64_t v19 = type metadata accessor for PutRequest(0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  uint64_t v35 = v24;
  sub_100006A74(&qword_100028F50, (void (*)(uint64_t))type metadata accessor for PutRequest);
  sub_10001CC80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a12 + 8))(v21, v26, v25, v27, a12);
  return sub_1000075A4((uint64_t)v21, type metadata accessor for PutRequest);
}

uint64_t sub_100006124(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = (void *)result;
  if (a3)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    *id v14 = a2;
    v14[1] = a3;
  }
  if (a5)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v14[2] = a4;
    v14[3] = a5;
  }
  if (a7)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v14[4] = a6;
    v14[5] = a7;
  }
  if (*(void *)(a8 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v14[6] = a8;
  }
  if (*(void *)(a9 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v14[7] = a9;
  }
  return result;
}

uint64_t MuseAccessoryDataAPIAsync.get(requestID:recordID:keyhash:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v22 = a8;
  uint64_t v21 = a7;
  uint64_t Request = type metadata accessor for GetRequest(0);
  __chkstk_darwin(Request);
  id v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  sub_100006A74(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
  sub_10001CC80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a10 + 16))(v18, v21, v22, a9, a10);
  return sub_1000075A4((uint64_t)v18, type metadata accessor for GetRequest);
}

uint64_t sub_100006384(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)result;
  if (a3)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v11 = a2;
    v11[1] = a3;
  }
  if (a5)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v11[2] = a4;
    v11[3] = a5;
  }
  if (a7)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v11[4] = a6;
    v11[5] = a7;
  }
  return result;
}

uint64_t MuseAccessoryDataAPIAsync.putsn(requestID:clientVersion:mapping:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = a8;
  uint64_t v16 = type metadata accessor for PutSNRequest(0);
  __chkstk_darwin(v16);
  id v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  sub_100006A74(&qword_100028F60, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
  sub_10001CC80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 24))(v18, a6, a7, v21, a9);
  return sub_1000075A4((uint64_t)v18, type metadata accessor for PutSNRequest);
}

uint64_t sub_100006594(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a4;
  uint64_t v23 = a6;
  uint64_t v10 = sub_100005838(&qword_100029170);
  __chkstk_darwin(v10 - 8);
  os_log_type_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v22 - v18;
  if (a3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
  }
  if (a5)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    a1[2] = v22;
    a1[3] = a5;
  }
  sub_100007418(v23, (uint64_t)v12, &qword_100029170);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_10000747C((uint64_t)v12, &qword_100029170);
  }
  sub_1000074D8((uint64_t)v12, (uint64_t)v19);
  sub_10000753C((uint64_t)v19, (uint64_t)v17, type metadata accessor for SerialNumberMapping);
  uint64_t v21 = (uint64_t)a1 + *(int *)(type metadata accessor for PutSNRequest(0) + 28);
  sub_10000747C(v21, &qword_100029170);
  sub_1000074D8((uint64_t)v17, v21);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v21, 0, 1, v13);
  return sub_1000075A4((uint64_t)v19, type metadata accessor for SerialNumberMapping);
}

uint64_t MuseAccessoryDataAPIAsync.getsn(requestID:serialNumbers:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  SNuint64_t Request = type metadata accessor for GetSNRequest(0);
  __chkstk_darwin(SNRequest);
  uint64_t v16 = &v18[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_100006A74(&qword_100028F68, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
  sub_10001CC80();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 32))(v16, a4, a5, a6, a7);
  return sub_1000075A4((uint64_t)v16, type metadata accessor for GetSNRequest);
}

uint64_t sub_10000694C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  if (a3)
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v5 = a2;
    v5[1] = a3;
  }
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    v5[2] = a4;
  }
  return result;
}

uint64_t MuseAccessoryDataAPIAsyncClient.init(codeService:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_1000069D8(uint64_t a1)
{
  return sub_100006124(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_100006A0C(uint64_t a1)
{
  return sub_100006384(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_100006A30(void *a1)
{
  return sub_100006594(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_100006A54(uint64_t a1)
{
  return sub_10000694C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100006A74(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void MuseAccessoryDataAPIAsyncClient.put(_:completion:)(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_100028F30);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v11 - v6;
  sub_10000753C(a1, (uint64_t)&v11 - v6, type metadata accessor for PutRequest);
  uint64_t v8 = type metadata accessor for PutRequest(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  objc_allocWithZone((Class)type metadata accessor for MuseAccessoryDataAPI.PutOperation(0));
  sub_100007418((uint64_t)v7, (uint64_t)v5, &qword_100028F30);
  uint64_t v9 = (void *)sub_10001CB60();
  sub_10000747C((uint64_t)v7, &qword_100028F30);
  id v10 = v9;
  swift_retain();
  sub_10001CB50();

  sub_10001CE90();
}

uint64_t type metadata accessor for MuseAccessoryDataAPI.PutOperation(uint64_t a1)
{
  return sub_100007238(a1, (uint64_t *)&unk_100028F70);
}

void MuseAccessoryDataAPIAsyncClient.get(_:completion:)(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_100028F38);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v17 - v6;
  sub_10000753C(a1, (uint64_t)&v17 - v6, type metadata accessor for GetRequest);
  uint64_t Request = type metadata accessor for GetRequest(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(Request - 8) + 56))(v7, 0, 1, Request);
  objc_allocWithZone((Class)type metadata accessor for MuseAccessoryDataAPI.GetOperation(0));
  sub_100007418((uint64_t)v7, (uint64_t)v5, &qword_100028F38);
  uint64_t v9 = (void *)sub_10001CB60();
  sub_10000747C((uint64_t)v7, &qword_100028F38);
  id v10 = v9;
  swift_retain();
  sub_10001CB50();

  id v11 = [v10 configuration];
  if (!v11)
  {
    __break(1u);
    goto LABEL_6;
  }
  os_log_type_t v12 = v11;
  [v11 setDiscretionaryNetworkBehavior:0];

  id v13 = [v10 configuration];
  if (!v13)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  [v13 setAutomaticallyRetryNetworkFailures:0];

  [v10 setQualityOfService:17];
  id v15 = [v10 configuration];
  if (v15)
  {
    uint64_t v16 = v15;
    [v15 setPreferAnonymousRequests:1];

    sub_10001CE90();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t type metadata accessor for MuseAccessoryDataAPI.GetOperation(uint64_t a1)
{
  return sub_100007238(a1, (uint64_t *)&unk_100028FC0);
}

void MuseAccessoryDataAPIAsyncClient.putsn(_:completion:)(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_100028F40);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v11 - v6;
  sub_10000753C(a1, (uint64_t)&v11 - v6, type metadata accessor for PutSNRequest);
  uint64_t v8 = type metadata accessor for PutSNRequest(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  objc_allocWithZone((Class)type metadata accessor for MuseAccessoryDataAPI.PutsnOperation(0));
  sub_100007418((uint64_t)v7, (uint64_t)v5, &qword_100028F40);
  uint64_t v9 = (void *)sub_10001CB60();
  sub_10000747C((uint64_t)v7, &qword_100028F40);
  id v10 = v9;
  swift_retain();
  sub_10001CB50();

  sub_10001CE90();
}

uint64_t type metadata accessor for MuseAccessoryDataAPI.PutsnOperation(uint64_t a1)
{
  return sub_100007238(a1, (uint64_t *)&unk_100029010);
}

void MuseAccessoryDataAPIAsyncClient.getsn(_:completion:)(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_100028F48);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v11 - v6;
  sub_10000753C(a1, (uint64_t)&v11 - v6, type metadata accessor for GetSNRequest);
  SNuint64_t Request = type metadata accessor for GetSNRequest(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(SNRequest - 8) + 56))(v7, 0, 1, SNRequest);
  objc_allocWithZone((Class)type metadata accessor for MuseAccessoryDataAPI.GetsnOperation(0));
  sub_100007418((uint64_t)v7, (uint64_t)v5, &qword_100028F48);
  uint64_t v9 = (void *)sub_10001CB60();
  sub_10000747C((uint64_t)v7, &qword_100028F48);
  id v10 = v9;
  swift_retain();
  sub_10001CB50();

  sub_10001CE90();
}

uint64_t type metadata accessor for MuseAccessoryDataAPI.GetsnOperation(uint64_t a1)
{
  return sub_100007238(a1, (uint64_t *)&unk_100029060);
}

uint64_t sub_100007238(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MuseAccessoryDataAPIAsyncClient.deinit()
{
  return v0;
}

uint64_t MuseAccessoryDataAPIAsyncClient.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

void sub_1000072C8(uint64_t a1)
{
}

void sub_1000072EC(uint64_t a1)
{
}

void sub_100007310(uint64_t a1)
{
}

void sub_100007334(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for MuseAccessoryDataAPI()
{
  return &type metadata for MuseAccessoryDataAPI;
}

uint64_t sub_100007368()
{
  return sub_1000073B0();
}

uint64_t sub_100007374()
{
  return type metadata accessor for MuseAccessoryDataAPI.PutOperation(0);
}

uint64_t sub_10000737C()
{
  return sub_1000073B0();
}

uint64_t sub_100007388()
{
  return type metadata accessor for MuseAccessoryDataAPI.GetOperation(0);
}

uint64_t sub_100007390()
{
  return sub_1000073B0();
}

uint64_t sub_10000739C()
{
  return type metadata accessor for MuseAccessoryDataAPI.PutsnOperation(0);
}

uint64_t sub_1000073A4()
{
  return sub_1000073B0();
}

uint64_t sub_1000073B0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000073EC()
{
  return type metadata accessor for MuseAccessoryDataAPI.GetsnOperation(0);
}

uint64_t type metadata accessor for MuseAccessoryDataAPIAsyncClient()
{
  return self;
}

uint64_t sub_100007418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005838(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000747C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005838(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000074D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SerialNumberMapping(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000753C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000075A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007604()
{
  sub_10000C9CC(0, (unint64_t *)&qword_100028EC8);
  uint64_t result = sub_10001CEF0();
  qword_100029178 = result;
  return result;
}

BOOL sub_10000767C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100007690()
{
  Swift::UInt32 v1 = *v0;
  sub_10001CFF0();
  sub_10001D010(v1);
  return sub_10001D020();
}

void sub_1000076D8()
{
  sub_10001D010(*v0);
}

Swift::Int sub_100007704()
{
  Swift::UInt32 v1 = *v0;
  sub_10001CFF0();
  sub_10001D010(v1);
  return sub_10001D020();
}

unint64_t sub_100007748@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10000BBDC(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_10000777C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

double sub_100007788()
{
  sub_100005838(&qword_1000291E8);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_10001E3B0;
  *(_DWORD *)(v0 + 32) = 6;
  qword_100029180 = v0;
  return result;
}

id sub_1000077D0(uint64_t a1)
{
  char v2 = a1 != 1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_1000055C0(1, v2);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_client] = v4;
  *(void *)&v3[OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_container] = v6;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ServerConnection();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t sub_100007898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = a9;
  uint64_t v21 = a8;
  uint64_t Request = type metadata accessor for GetRequest(0);
  __chkstk_darwin(Request);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = a4;
  v18[7] = a5;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v26 = v21;
  uint64_t v27 = v20;
  sub_10000CA2C(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10001CC80();
  MuseAccessoryDataAPIAsyncClient.get(_:completion:)((uint64_t)v17);
  sub_10000C908((uint64_t)v17, type metadata accessor for GetRequest);
  swift_release();
  return swift_release();
}

uint64_t sub_100007A68(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, long long *, uint64_t), uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v56 = a4;
  uint64_t v57 = a6;
  uint64_t Response = type metadata accessor for GetResponse(0);
  uint64_t v13 = __chkstk_darwin(Response - 8);
  id v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v51 - v16;
  uint64_t v18 = sub_100005838(&qword_1000291D8);
  __chkstk_darwin(v18);
  uint64_t v20 = (uint64_t *)((char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100007418(a1, (uint64_t)v20, &qword_1000291D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = *v20;
    swift_getErrorValue();
    uint64_t v22 = sub_10001CFD0();
    uint64_t v24 = v23;
    long long v59 = 0u;
    long long v60 = 0u;
    swift_errorRetain();
    a2(0, v22, v24, &v59, v21);
    swift_errorRelease();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v55 = a3;
    sub_10000C8A4((uint64_t)v20, (uint64_t)v17);
    uint64_t v25 = *((unsigned int *)v17 + 4);
    if (v25)
    {
      unint64_t v26 = sub_10000BBDC(*((_DWORD *)v17 + 4));
      if ((v26 & 0x100000000) != 0)
      {
        strcpy((char *)&v59, "unkownError(");
        BYTE13(v59) = 0;
        HIWORD(v59) = -5120;
        LODWORD(v58) = v25;
        v61._countAndFlagsBits = sub_10001CF90();
        sub_10001CE60(v61);
        swift_bridgeObjectRelease();
        v62._countAndFlagsBits = 41;
        v62._object = (void *)0xE100000000000000;
        sub_10001CE60(v62);
      }
      else
      {
        *(void *)&long long v59 = 0;
        *((void *)&v59 + 1) = 0xE000000000000000;
        LODWORD(v58) = v26;
        sub_10001CF60();
      }
      long long v30 = v59;
      if (qword_100028E40 != -1) {
        swift_once();
      }
      if ((sub_100008250(v25, qword_100029180) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        return sub_10000C908((uint64_t)v17, type metadata accessor for GetResponse);
      }
      if (qword_100028E38 != -1) {
        swift_once();
      }
      uint64_t v31 = qword_100029178;
      sub_10000C968((uint64_t)v17, (uint64_t)v15);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      os_log_type_t v32 = sub_10001CEA0();
      int v33 = v32;
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v52 = v30;
        uint64_t v35 = v34;
        uint64_t v54 = swift_slowAlloc();
        *(void *)&long long v59 = v54;
        *(_DWORD *)uint64_t v35 = 136316162;
        os_log_t v53 = v31;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v56, a5, (uint64_t *)&v59);
        LODWORD(v56) = v33;
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v57, a7, (uint64_t *)&v59);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 22) = 1024;
        LODWORD(v58) = v25;
        sub_10001CF10();
        *(_WORD *)(v35 + 28) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v52, *((unint64_t *)&v30 + 1), (uint64_t *)&v59);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 38) = 2080;
        uint64_t v36 = *((void *)v15 + 3);
        unint64_t v37 = *((void *)v15 + 4);
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v36, v37, (uint64_t *)&v59);
        sub_10001CF10();
        swift_bridgeObjectRelease();
        sub_10000C908((uint64_t)v15, type metadata accessor for GetResponse);
        _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v56, "failed to fetch record from CKCode server with uncoverable error, record: %s requestId: %s, errorCode:%d error:%s message:%s", (uint8_t *)v35, 0x30u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        sub_10000C908((uint64_t)v15, type metadata accessor for GetResponse);
      }
      uint64_t v47 = *((void *)v17 + 3);
      uint64_t v48 = *((void *)v17 + 4);
      uint64_t v49 = *((void *)v17 + 5);
      uint64_t v50 = *((void *)v17 + 6);
      *((void *)&v60 + 1) = &type metadata for String;
      *(void *)&long long v59 = v49;
      *((void *)&v59 + 1) = v50;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v44 = v25;
      uint64_t v45 = v47;
      uint64_t v46 = v48;
    }
    else
    {
      if (qword_100028E38 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_100029178;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      os_log_type_t v28 = sub_10001CEA0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        *(void *)&long long v59 = swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v56, a5, (uint64_t *)&v59);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10000B584(v57, a7, (uint64_t *)&v59);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "fetched record successfully from CKCode server record: %s requestId: %s", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v39 = *((unsigned int *)v17 + 4);
      uint64_t v41 = *((void *)v17 + 3);
      uint64_t v40 = *((void *)v17 + 4);
      uint64_t v42 = *((void *)v17 + 5);
      uint64_t v43 = *((void *)v17 + 6);
      *((void *)&v60 + 1) = &type metadata for String;
      *(void *)&long long v59 = v42;
      *((void *)&v59 + 1) = v43;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v44 = v39;
      uint64_t v45 = v41;
      uint64_t v46 = v40;
    }
    a2(v44, v45, v46, &v59, 0);
    swift_bridgeObjectRelease();
    sub_10000C908((uint64_t)v17, type metadata accessor for GetResponse);
  }
  return sub_10000747C((uint64_t)&v59, &qword_1000291E0);
}

uint64_t sub_100008250(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000082B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_100007418(a4, (uint64_t)v15, &qword_1000291E0);
  if (v16)
  {
    int v9 = swift_dynamicCast();
    if (v9) {
      uint64_t v10 = v13;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v9) {
      uint64_t v11 = v14;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    sub_10000747C((uint64_t)v15, &qword_1000291E0);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  a5(a1, a2, a3, v10, v11);
  return swift_bridgeObjectRelease();
}

void sub_100008448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v9 = sub_10001CE40();
  if (a5) {
    NSString v10 = sub_10001CE40();
  }
  else {
    NSString v10 = 0;
  }
  id v11 = v10;
  (*(void (**)(uint64_t, uint64_t, NSString))(a6 + 16))(a6, a1, v9);
}

void sub_1000084EC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void (*a7)(void, void), unint64_t a8, void *a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t, uint64_t, unint64_t, long long *), uint64_t a13)
{
  v156 = a7;
  uint64_t v157 = a6;
  v158 = a12;
  uint64_t v19 = sub_10001CD90();
  uint64_t v154 = *(void *)(v19 - 8);
  uint64_t v155 = v19;
  __chkstk_darwin(v19);
  v151 = (char *)&v133 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10001CDC0();
  uint64_t v152 = *(void *)(v21 - 8);
  uint64_t v153 = v21;
  __chkstk_darwin(v21);
  v148 = (char *)&v133 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_10001CDE0();
  uint64_t v149 = *(void *)(v150 - 8);
  uint64_t v23 = __chkstk_darwin(v150);
  v146 = (char *)&v133 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v147 = (char *)&v133 - v25;
  uint64_t v26 = sub_10001CDA0();
  uint64_t v27 = __chkstk_darwin(v26);
  long long v30 = (char *)&v133 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    v142 = v30;
    uint64_t v143 = v28;
    uint64_t v144 = v27;
    uint64_t v145 = a10;
    v141 = a9;
    *(void *)&long long aBlock = a5;
    swift_errorRetain();
    sub_100005838(&qword_1000291C0);
    type metadata accessor for CKError(0);
    if (swift_dynamicCast())
    {
      uint64_t v139 = a11;
      unint64_t v31 = a8;
      os_log_type_t v32 = v158;
      int v33 = (void *)v163;
      *(void *)&long long aBlock = v163;
      sub_10000CA2C(&qword_100028F20, type metadata accessor for CKError);
      sub_10001CAF0();
      uint64_t v140 = sub_10001CE10();
      unint64_t v35 = v34;
      swift_bridgeObjectRelease();
      double v36 = COERCE_DOUBLE(sub_10001CE00());
      char v38 = v37;
      *(void *)&long long aBlock = v33;
      uint64_t v39 = sub_10001CB00();

      if (v39 == 3)
      {
        if (v157 >= 2)
        {
          uint64_t v40 = a13;
          if (qword_100028E38 != -1) {
            swift_once();
          }
          uint64_t v41 = qword_100029178;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          os_log_type_t v42 = sub_10001CEA0();
          if (os_log_type_enabled(v41, v42))
          {
            uint64_t v43 = swift_slowAlloc();
            *(void *)&long long aBlock = swift_slowAlloc();
            *(_DWORD *)uint64_t v43 = 136315650;
            swift_bridgeObjectRetain();
            uint64_t v44 = v156;
            uint64_t v163 = sub_10000B584((uint64_t)v156, a8, (uint64_t *)&aBlock);
            uint64_t v138 = a13;
            sub_10001CF10();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v43 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v163 = sub_10000B584(v140, v35, (uint64_t *)&aBlock);
            sub_10001CF10();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v43 + 22) = 2048;
            uint64_t v45 = v157;
            uint64_t v163 = v157 - 1;
            uint64_t v40 = v138;
            sub_10001CF10();
            _os_log_impl((void *)&_mh_execute_header, v41, v42, "CKCode error - requestId: %s got error: %s, will retry up to %ld times after network is available", (uint8_t *)v43, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            uint64_t v44 = v156;
            uint64_t v45 = v157;
          }
          uint64_t v104 = v139;
          sub_10001CD60();
          swift_allocObject();
          sub_10001CD50();
          uint64_t v105 = swift_allocObject();
          swift_weakInit();
          v106 = (void *)swift_allocObject();
          v107 = v141;
          v106[2] = v105;
          v106[3] = v107;
          v106[4] = v145;
          v106[5] = v104;
          v106[6] = v45;
          v106[7] = v44;
          v106[8] = a8;
          v106[9] = v32;
          v106[10] = v40;
          swift_bridgeObjectRetain();
          swift_retain();
          id v108 = v107;
          swift_retain();
          swift_retain();
          sub_10000CC40((uint64_t)sub_10000CC08);
          sub_10001CD20();
          swift_release();
          swift_release();
          sub_10000C9CC(0, &qword_1000291F0);
          uint64_t v109 = v143;
          v110 = v142;
          uint64_t v111 = v144;
          (*(void (**)(char *, void, uint64_t))(v143 + 104))(v142, enum case for DispatchQoS.QoSClass.default(_:), v144);
          v112 = (void *)sub_10001CED0();
          (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
          sub_10001CD30();
          swift_release();

          return;
        }
        goto LABEL_24;
      }
      uint64_t v50 = v157;
      if (v157 <= 1)
      {
LABEL_24:
        uint64_t v51 = a13;
        v64 = v32;
        uint64_t v63 = v156;
        uint64_t v48 = v140;
        goto LABEL_25;
      }
      if (v38) {
        double v53 = 0.3;
      }
      else {
        double v53 = v36;
      }
      uint64_t v51 = a13;
      uint64_t v52 = v139;
    }
    else
    {
      swift_getErrorValue();
      uint64_t v47 = sub_10001CFD0();
      uint64_t v48 = v47;
      unint64_t v35 = v49;
      uint64_t v50 = v157;
      uint64_t v51 = a13;
      if (v157 <= 1)
      {
        uint64_t v63 = v156;
        v64 = v158;
        unint64_t v31 = a8;
LABEL_25:
        if (qword_100028E38 != -1) {
          swift_once();
        }
        v65 = qword_100029178;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        os_log_type_t v66 = sub_10001CEA0();
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = swift_slowAlloc();
          *(void *)&long long aBlock = swift_slowAlloc();
          *(_DWORD *)uint64_t v67 = 136315394;
          uint64_t v138 = v51;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_10000B584((uint64_t)v63, v31, (uint64_t *)&aBlock);
          sub_10001CF10();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v67 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_10000B584(v48, v35, (uint64_t *)&aBlock);
          sub_10001CF10();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "CKCode error - requestId: %s, final error: %s", (uint8_t *)v67, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        long long aBlock = 0u;
        long long v160 = 0u;
        v64(0xFFFFFFFFLL, v48, v35, &aBlock);
        swift_bridgeObjectRelease();
        sub_10000747C((uint64_t)&aBlock, &qword_1000291E0);
        return;
      }
      uint64_t v52 = a11;
      uint64_t v140 = v47;
      double v53 = 0.3;
      unint64_t v31 = a8;
    }
    if (qword_100028E38 != -1)
    {
      uint64_t v132 = v50;
      swift_once();
      uint64_t v50 = v132;
    }
    uint64_t v54 = v50;
    uint64_t v55 = qword_100029178;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    os_log_type_t v56 = sub_10001CEA0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v139 = v52;
      uint64_t v58 = v57;
      uint64_t v59 = swift_slowAlloc();
      uint64_t v138 = v51;
      *(void *)&long long aBlock = v59;
      *(_DWORD *)uint64_t v58 = 136315906;
      swift_bridgeObjectRetain();
      long long v60 = v156;
      uint64_t v163 = sub_10000B584((uint64_t)v156, v31, (uint64_t *)&aBlock);
      sub_10001CF10();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v58 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v163 = sub_10000B584(v140, v35, (uint64_t *)&aBlock);
      sub_10001CF10();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v58 + 22) = 2048;
      uint64_t v163 = v54 - 1;
      sub_10001CF10();
      *(_WORD *)(v58 + 32) = 2048;
      uint64_t v163 = *(void *)&v53;
      sub_10001CF10();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "CKCode error - requestId: %s got error: %s, will retry up to %ld times after delay %f seconds", (uint8_t *)v58, 0x2Au);
      swift_arrayDestroy();
      uint64_t v61 = v138;
      swift_slowDealloc();
      uint64_t v52 = v139;
      swift_slowDealloc();
      Swift::String v62 = v60;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      Swift::String v62 = v156;
      uint64_t v61 = v51;
    }
    sub_10000C9CC(0, &qword_1000291F0);
    uint64_t v81 = v143;
    v82 = v142;
    uint64_t v83 = v144;
    (*(void (**)(char *, void, uint64_t))(v143 + 104))(v142, enum case for DispatchQoS.QoSClass.default(_:), v144);
    v84 = (void *)sub_10001CED0();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v83);
    v85 = v146;
    sub_10001CDD0();
    v86 = v147;
    sub_10001CDF0();
    v156 = *(void (**)(void, void))(v149 + 8);
    uint64_t v87 = v150;
    v156(v85, v150);
    v88 = (void *)swift_allocObject();
    v89 = v141;
    uint64_t v90 = v145;
    v88[2] = v141;
    v88[3] = v90;
    uint64_t v91 = v157;
    v88[4] = v52;
    v88[5] = v91;
    v88[6] = v62;
    v88[7] = v31;
    v88[8] = v158;
    v88[9] = v61;
    v161 = sub_10000CB1C;
    v162 = v88;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v160 = sub_10000A7D0;
    *((void *)&v160 + 1) = &unk_100025048;
    v92 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    id v93 = v89;
    swift_retain();
    swift_retain();
    v94 = v148;
    sub_10001CDB0();
    uint64_t v163 = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10000CA2C(&qword_1000291F8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005838(&qword_100029200);
    sub_10000CA74();
    v95 = v151;
    uint64_t v96 = v155;
    sub_10001CF30();
    sub_10001CEB0();
    _Block_release(v92);

    (*(void (**)(char *, uint64_t))(v154 + 8))(v95, v96);
    (*(void (**)(char *, uint64_t))(v152 + 8))(v94, v153);
    v156(v86, v87);
LABEL_63:
    swift_release();
    return;
  }
  v141 = a4;
  uint64_t v137 = a2;
  uint64_t v140 = a3;
  if (a1)
  {
    v142 = v30;
    uint64_t v143 = v28;
    uint64_t v144 = v27;
    unint64_t v46 = sub_10000BBDC(a1);
    uint64_t v145 = a10;
    if ((v46 & 0x100000000) != 0)
    {
      strcpy((char *)&aBlock, "unkownError(");
      BYTE13(aBlock) = 0;
      HIWORD(aBlock) = -5120;
      LODWORD(v163) = a1;
      v164._countAndFlagsBits = sub_10001CF90();
      sub_10001CE60(v164);
      swift_bridgeObjectRelease();
      v165._countAndFlagsBits = 41;
      v165._object = (void *)0xE100000000000000;
      sub_10001CE60(v165);
    }
    else
    {
      *(void *)&long long aBlock = 0;
      *((void *)&aBlock + 1) = 0xE000000000000000;
      LODWORD(v163) = v46;
      sub_10001CF60();
    }
    long long v71 = aBlock;
    v72 = (void (*)(uint64_t, uint64_t, uint64_t, void *))v158;
    uint64_t v73 = a11;
    unint64_t v74 = a8;
    if (qword_100028E40 != -1) {
      swift_once();
    }
    if (sub_100008250(a1, qword_100029180))
    {
      if (qword_100028E38 != -1) {
        swift_once();
      }
      v75 = qword_100029178;
      swift_bridgeObjectRetain_n();
      uint64_t v76 = v140;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      os_log_type_t v77 = sub_10001CEA0();
      if (os_log_type_enabled(v75, v77))
      {
        uint64_t v78 = swift_slowAlloc();
        uint64_t v155 = swift_slowAlloc();
        *(void *)&long long aBlock = v155;
        *(_DWORD *)uint64_t v78 = 136315906;
        uint64_t v157 = v71;
        swift_bridgeObjectRetain();
        uint64_t v163 = sub_10000B584((uint64_t)v156, v74, (uint64_t *)&aBlock);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v78 + 12) = 1024;
        LODWORD(v163) = a1;
        sub_10001CF10();
        *(_WORD *)(v78 + 18) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v163 = sub_10000B584(v157, *((unint64_t *)&v71 + 1), (uint64_t *)&aBlock);
        v72 = (void (*)(uint64_t, uint64_t, uint64_t, void *))v158;
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v78 + 28) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v79 = v137;
        uint64_t v163 = sub_10000B584(v137, v140, (uint64_t *)&aBlock);
        uint64_t v76 = v140;
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        v80 = "failed to fetch record from CKCode server with uncoverable error, requestId: %s, errorCode:%d error:%s message:%s";
LABEL_56:
        _os_log_impl((void *)&_mh_execute_header, v75, v77, v80, (uint8_t *)v78, 0x26u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
LABEL_58:
        v72(a1, v79, v76, v141);
        return;
      }
    }
    else
    {
      if (v157 >= 2)
      {
        if (qword_100028E38 != -1) {
          swift_once();
        }
        v141 = a9;
        v97 = qword_100029178;
        swift_bridgeObjectRetain_n();
        unint64_t v98 = v140;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        os_log_type_t v99 = sub_10001CEA0();
        int v100 = v99;
        BOOL v101 = os_log_type_enabled(v97, v99);
        uint64_t v138 = a13;
        if (v101)
        {
          uint64_t v102 = swift_slowAlloc();
          int v136 = v100;
          uint64_t v103 = v102;
          uint64_t v135 = swift_slowAlloc();
          *(void *)&long long aBlock = v135;
          *(_DWORD *)uint64_t v103 = 136316418;
          os_log_t v134 = v97;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_10000B584((uint64_t)v156, v74, (uint64_t *)&aBlock);
          uint64_t v139 = a11;
          sub_10001CF10();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v103 + 12) = 1024;
          LODWORD(v163) = a1;
          sub_10001CF10();
          *(_WORD *)(v103 + 18) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_10000B584(v71, *((unint64_t *)&v71 + 1), (uint64_t *)&aBlock);
          sub_10001CF10();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v103 + 28) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_10000B584(v137, v98, (uint64_t *)&aBlock);
          sub_10001CF10();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v103 + 38) = 2048;
          uint64_t v163 = v157 - 1;
          sub_10001CF10();
          *(_WORD *)(v103 + 48) = 2048;
          uint64_t v163 = 0x3FD3333333333333;
          uint64_t v73 = v139;
          sub_10001CF10();
          _os_log_impl((void *)&_mh_execute_header, v134, (os_log_type_t)v136, "error fetching record from CKCode server, requestId: %s, errorCode:%d error:%s message:%s, will retry up to %ld times after delay %f seconds", (uint8_t *)v103, 0x3Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        v113 = v156;
        sub_10000C9CC(0, &qword_1000291F0);
        uint64_t v114 = v143;
        v115 = v142;
        uint64_t v116 = v144;
        (*(void (**)(char *, void, uint64_t))(v143 + 104))(v142, enum case for DispatchQoS.QoSClass.default(_:), v144);
        v156 = (void (*)(void, void))sub_10001CED0();
        (*(void (**)(char *, uint64_t))(v114 + 8))(v115, v116);
        v117 = v146;
        sub_10001CDD0();
        v118 = v147;
        sub_10001CDF0();
        v119 = *(void (**)(char *, uint64_t))(v149 + 8);
        uint64_t v120 = v150;
        v119(v117, v150);
        v121 = (void *)swift_allocObject();
        v122 = v141;
        uint64_t v123 = v145;
        v121[2] = v141;
        v121[3] = v123;
        uint64_t v124 = v157;
        v121[4] = v73;
        v121[5] = v124;
        v121[6] = v113;
        v121[7] = v74;
        uint64_t v125 = v138;
        v121[8] = v72;
        v121[9] = v125;
        v161 = sub_10000CA0C;
        v162 = v121;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v160 = sub_10000A7D0;
        *((void *)&v160 + 1) = &unk_100024FF8;
        v126 = _Block_copy(&aBlock);
        swift_bridgeObjectRetain();
        id v127 = v122;
        swift_retain();
        swift_retain();
        v128 = v148;
        sub_10001CDB0();
        uint64_t v163 = (uint64_t)&_swiftEmptyArrayStorage;
        sub_10000CA2C(&qword_1000291F8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_100005838(&qword_100029200);
        sub_10000CA74();
        v129 = v151;
        uint64_t v130 = v155;
        sub_10001CF30();
        v131 = v156;
        sub_10001CEB0();
        _Block_release(v126);

        (*(void (**)(char *, uint64_t))(v154 + 8))(v129, v130);
        (*(void (**)(char *, uint64_t))(v152 + 8))(v128, v153);
        v119(v118, v120);
        goto LABEL_63;
      }
      if (qword_100028E38 != -1) {
        swift_once();
      }
      v75 = qword_100029178;
      swift_bridgeObjectRetain_n();
      uint64_t v76 = v140;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      os_log_type_t v77 = sub_10001CEA0();
      if (os_log_type_enabled(v75, v77))
      {
        uint64_t v78 = swift_slowAlloc();
        uint64_t v155 = swift_slowAlloc();
        *(void *)&long long aBlock = v155;
        *(_DWORD *)uint64_t v78 = 136315906;
        uint64_t v157 = v71;
        swift_bridgeObjectRetain();
        uint64_t v163 = sub_10000B584((uint64_t)v156, v74, (uint64_t *)&aBlock);
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v78 + 12) = 1024;
        LODWORD(v163) = a1;
        sub_10001CF10();
        *(_WORD *)(v78 + 18) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v163 = sub_10000B584(v157, *((unint64_t *)&v71 + 1), (uint64_t *)&aBlock);
        v72 = (void (*)(uint64_t, uint64_t, uint64_t, void *))v158;
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v78 + 28) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v79 = v137;
        uint64_t v163 = sub_10000B584(v137, v140, (uint64_t *)&aBlock);
        uint64_t v76 = v140;
        sub_10001CF10();
        swift_bridgeObjectRelease_n();
        v80 = "failed to fetch record from CKCode server after retries, requestId: %s, errorCode:%d error:%s message:%s";
        goto LABEL_56;
      }
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v79 = v137;
    goto LABEL_58;
  }
  if (qword_100028E38 != -1) {
    swift_once();
  }
  v68 = qword_100029178;
  swift_bridgeObjectRetain_n();
  os_log_type_t v69 = sub_10001CEA0();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long aBlock = swift_slowAlloc();
    *(_DWORD *)v70 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v163 = sub_10000B584((uint64_t)v156, a8, (uint64_t *)&aBlock);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "fetched record successfully from CKCode server record - requestId: %s", v70, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  v158(0, v137, v140, (long long *)v141);
}

uint64_t sub_100009FF4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v64 = a6;
  uint64_t v65 = a7;
  os_log_type_t v66 = a3;
  uint64_t v67 = a5;
  uint64_t v68 = a10;
  uint64_t v69 = a8;
  uint64_t v62 = a9;
  uint64_t v63 = a4;
  uint64_t v11 = sub_10001CD90();
  uint64_t v72 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001CDC0();
  uint64_t v71 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  v70 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_10001CDA0();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v59 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001CD80();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(sub_10001CD70() + 16);
  swift_bridgeObjectRelease();
  if (v21)
  {
    uint64_t v57 = v13;
    if (qword_100028E38 != -1) {
      swift_once();
    }
    uint64_t v22 = &ObjC resilient class stub for MuseAccessoryDataAPI.GetOperation;
    uint64_t v23 = qword_100029178;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, a1, v17);
    os_log_type_t v24 = sub_10001CEA0();
    os_log_t v56 = v23;
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v58 = v14;
    if (v25)
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      aBlock[0] = v54;
      *(_DWORD *)uint64_t v26 = 136315138;
      v53[1] = v26 + 4;
      sub_10001CD70();
      sub_10001CD10();
      uint64_t v27 = sub_10001CE80();
      uint64_t v55 = v11;
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      aBlock[6] = sub_10000B584(v27, v29, aBlock);
      uint64_t v22 = &ObjC resilient class stub for MuseAccessoryDataAPI.GetOperation;
      sub_10001CF10();
      uint64_t v11 = v55;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      _os_log_impl((void *)&_mh_execute_header, v56, v24, "network interfaces: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    unint64_t v35 = v57;
    if (Strong)
    {
      sub_10001CD40();
      swift_release();
    }
    double v36 = *((void *)v22 + 47);
    os_log_type_t v37 = sub_10001CEA0();
    if (os_log_type_enabled(v36, v37))
    {
      char v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "network is ready, scheduling a retry fetch", v38, 2u);
      swift_slowDealloc();
    }
    sub_10000C9CC(0, &qword_1000291F0);
    uint64_t v39 = v60;
    uint64_t v40 = v59;
    uint64_t v41 = v61;
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, enum case for DispatchQoS.QoSClass.default(_:), v61);
    os_log_type_t v42 = (void *)sub_10001CED0();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
    uint64_t v43 = (void *)swift_allocObject();
    uint64_t v45 = v66;
    uint64_t v44 = v67;
    uint64_t v46 = v63;
    v43[2] = v66;
    v43[3] = v46;
    uint64_t v47 = v64;
    v43[4] = v44;
    v43[5] = v47;
    uint64_t v49 = v68;
    uint64_t v48 = v69;
    v43[6] = v65;
    v43[7] = v48;
    v43[8] = v62;
    v43[9] = v49;
    aBlock[4] = (uint64_t)sub_10000CCA4;
    aBlock[5] = (uint64_t)v43;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000A7D0;
    aBlock[3] = (uint64_t)&unk_1000250E8;
    uint64_t v50 = _Block_copy(aBlock);
    id v51 = v45;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v52 = v70;
    sub_10001CDB0();
    uint64_t v73 = &_swiftEmptyArrayStorage;
    sub_10000CA2C(&qword_1000291F8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005838(&qword_100029200);
    sub_10000CA74();
    sub_10001CF30();
    sub_10001CEC0();
    _Block_release(v50);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v35, v11);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v52, v58);
    return swift_release();
  }
  else
  {
    if (qword_100028E38 != -1) {
      swift_once();
    }
    long long v30 = qword_100029178;
    os_log_type_t v31 = sub_10001CEA0();
    uint64_t result = os_log_type_enabled(v30, v31);
    if (result)
    {
      int v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "network no available interfaces", v33, 2u);
      return swift_slowDealloc();
    }
  }
  return result;
}

uint64_t sub_10000A7D0(uint64_t a1)
{
  Swift::UInt32 v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_10000A814(uint64_t result, void (*a2)(uint64_t, void *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10 = a4 - 1;
  if (__OFSUB__(a4, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = (void *)result;
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v10;
    v18[3] = a5;
    v18[4] = a6;
    v18[5] = v17;
    v18[6] = a2;
    v18[7] = a3;
    v18[8] = a7;
    v18[9] = a8;
    swift_bridgeObjectRetain();
    id v19 = v17;
    swift_retain();
    swift_retain();
    a2(a10, v18);
    return swift_release();
  }
  return result;
}

void sub_10000A8DC(void *a1, uint64_t a2, void (*a3)(void, void, void, void, uint64_t), uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    aBlock[0] = a2;
    swift_errorRetain();
    sub_100005838(&qword_1000291C0);
    type metadata accessor for CKError(0);
    if (swift_dynamicCast())
    {
      sub_10000CA2C(&qword_100028F20, type metadata accessor for CKError);
      sub_10001CAD0();
      if (aBlock[0] == 9)
      {
        a3(0, 0, 0, 0, 0);

        return;
      }
    }
    a3(0, 0, 0, 0, a2);
  }
  else
  {
    NSString v9 = *(void **)(a5 + OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_container);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a3;
    v10[3] = a4;
    v10[4] = a1;
    aBlock[4] = sub_10000B464;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000AED4;
    aBlock[3] = &unk_100024EE0;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = a1;
    swift_retain();
    swift_release();
    [v9 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v11];
    _Block_release(v11);
  }
}

void sub_10000AAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a6, void *a7)
{
  uint64_t v11 = sub_100005838(&qword_1000291C8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    if (qword_100028E38 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_100029178;
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v15 = sub_10001CEA0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      swift_errorRetain();
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v29 = v18;
      sub_10001CF10();
      void *v17 = v18;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "error looking up CK user info: %@", v16, 0xCu);
      sub_100005838(&qword_100028EC0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v29 = a4;
    swift_errorRetain();
    sub_100005838(&qword_1000291C0);
    type metadata accessor for CKError(0);
    if (swift_dynamicCast())
    {
      uint64_t v22 = v28;
      sub_10000CA2C(&qword_100028F20, type metadata accessor for CKError);
      sub_10001CAD0();
      if (v29 == 9)
      {
        a5(0, 0, 0, 0, 0);

        return;
      }
    }
    a5(0, 0, 0, 0, a4);
  }
  else
  {
    if (a7)
    {
      id v19 = [a7 recordName];
      a7 = (void *)sub_10001CE50();
      uint64_t v21 = v20;
    }
    else
    {
      uint64_t v21 = 0;
    }
    sub_100007418(a1, (uint64_t)v13, &qword_1000291C8);
    uint64_t v23 = sub_10001CA80();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v13, 1, v23) == 1)
    {
      sub_10000747C((uint64_t)v13, &qword_1000291C8);
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v25 = sub_10001CA60();
      uint64_t v26 = v27;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v23);
    }
    a5(a7, v21, v25, v26, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000AED4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100005838(&qword_1000291C8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10001CA70();
    uint64_t v12 = sub_10001CA80();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_10001CA80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  if (a3)
  {
    uint64_t v14 = sub_10001CE50();
    a3 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  swift_retain();
  id v16 = a4;
  v11(v10, v14, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return sub_10000747C((uint64_t)v10, &qword_1000291C8);
}

void sub_10000B054(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000B224(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  NSString v8 = a4;
  if (a2)
  {
    NSString v9 = sub_10001CE40();
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  NSString v9 = 0;
  if (a4) {
LABEL_3:
  }
    NSString v8 = sub_10001CE40();
LABEL_4:
  if (a5) {
    uint64_t v10 = sub_10001CB10();
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (id)v10;
  (*(void (**)(uint64_t, NSString, NSString))(a6 + 16))(a6, v9, v8);
}

id sub_10000B314()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServerConnection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ServerConnection()
{
  return self;
}

uint64_t sub_10000B3B8()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000B3F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  sub_10000B224(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

void sub_10000B3FC(void *a1, uint64_t a2)
{
  sub_10000A8DC(a1, a2, *(void (**)(void, void, void, void, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10000B408(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B418()
{
  return swift_release();
}

uint64_t sub_10000B424()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000B464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000AAD4(a1, a2, a3, a4, *(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16), *(void *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_10000B470(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000B480(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_10000B4BC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_10000B4CC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_10001CF10();
  *a1 = v7;
  NSString v8 = *a2;
  if (*a2)
  {
    *NSString v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10000B584(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B658(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C844((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000C844((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000C7F4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B658(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_10001CF20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000B814(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_10001CF50();
  if (!v8)
  {
    sub_10001CF70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001CF80();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000B814(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B8AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BA8C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000BA8C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B8AC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000BA24(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001CF40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001CF70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001CE70();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001CF80();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001CF70();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000BA24(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005838(&qword_1000291D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000BA8C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005838(&qword_1000291D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10001CF80();
  __break(1u);
  return result;
}

unint64_t sub_10000BBDC(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 0u:
      uint64_t v2 = 0;
      unsigned __int8 v1 = 0;
      break;
    case 1u:
      return v2 | ((unint64_t)v1 << 32);
    case 2u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2;
      break;
    case 3u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 3;
      break;
    case 4u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4;
      break;
    case 5u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 5;
      break;
    case 6u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 6;
      break;
    case 7u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 7;
      break;
    case 8u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 8;
      break;
    case 9u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 9;
      break;
    case 0xAu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 10;
      break;
    default:
      uint64_t v2 = 0;
      unsigned __int8 v1 = 1;
      break;
  }
  return v2 | ((unint64_t)v1 << 32);
}

void sub_10000BCD4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, void (**a6)(const void *, uint64_t, NSString, void))
{
  uint64_t v48 = a5;
  uint64_t v52 = a3;
  uint64_t Request = type metadata accessor for GetRequest(0);
  __chkstk_darwin(Request);
  uint64_t v50 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001CB40();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = a6;
  uint64_t v47 = a6;
  _Block_copy(a6);
  sub_10001CB30();
  uint64_t v15 = sub_10001CB20();
  unint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (qword_100028E38 != -1) {
    swift_once();
  }
  uint64_t v18 = &ObjC resilient class stub for MuseAccessoryDataAPI.GetOperation;
  id v19 = qword_100029178;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v20 = sub_10001CEA0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    id v51 = (void *)a1;
    v55[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584(v15, v17, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584((uint64_t)v51, a2, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584(v52, a4, v55);
    uint64_t v18 = &ObjC resilient class stub for MuseAccessoryDataAPI.GetOperation;
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "requestId: %s recordId: %s keyhash: %s", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    a1 = (uint64_t)v51;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v23 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v23 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    uint64_t v24 = v52;
LABEL_16:
    os_log_type_t v31 = (void *)swift_allocObject();
    os_log_type_t v32 = v48;
    v31[2] = v48;
    v31[3] = v15;
    v31[4] = v17;
    v31[5] = a1;
    v31[6] = a2;
    v31[7] = v24;
    v31[8] = a4;
    uint64_t v33 = swift_allocObject();
    uint64_t v34 = v53;
    *(void *)(v33 + 16) = sub_10000C700;
    *(void *)(v33 + 24) = v34;
    uint64_t v35 = v33;
    uint64_t v52 = v33;
    double v36 = (void *)swift_allocObject();
    v36[2] = 5;
    v36[3] = v15;
    v36[4] = v17;
    v36[5] = v32;
    v36[6] = sub_10000C758;
    v36[7] = v31;
    v36[8] = sub_10000C7C4;
    v36[9] = v35;
    uint64_t v47 = *(void (***)(const void *, uint64_t, NSString, void))&v32[OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_client];
    os_log_type_t v37 = (void *)swift_allocObject();
    id v51 = v46;
    v37[2] = sub_10000C7D0;
    v37[3] = v36;
    v37[4] = a1;
    v37[5] = a2;
    v37[6] = v15;
    v37[7] = v17;
    __chkstk_darwin(v37);
    v46[-6] = v15;
    v46[-5] = v17;
    v46[-4] = v38;
    v46[-3] = a2;
    v46[-2] = v24;
    v46[-1] = a4;
    v46[1] = a4;
    sub_10000CA2C(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v39 = v32;
    swift_bridgeObjectRetain_n();
    uint64_t v48 = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v40 = (uint64_t)v50;
    sub_10001CC80();
    MuseAccessoryDataAPIAsyncClient.get(_:completion:)(v40);
    sub_10000C908(v40, type metadata accessor for GetRequest);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return;
  }
  uint64_t v25 = *((void *)v18 + 47);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v26 = sub_10001CEA0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    id v51 = (void *)a1;
    v46[0] = v28;
    v55[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584(v15, v17, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584((uint64_t)v51, a2, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v29 = v52;
    uint64_t v54 = sub_10000B584(v52, a4, v55);
    uint64_t v24 = v29;
    uint64_t v18 = &ObjC resilient class stub for MuseAccessoryDataAPI.GetOperation;
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "fetch by keyhash requestId: %s recordId: %s keyhash: %s", (uint8_t *)v27, 0x20u);
    swift_arrayDestroy();
    a1 = (uint64_t)v51;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v24 = v52;
  }
  uint64_t v30 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v30 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (v30) {
    goto LABEL_16;
  }
  uint64_t v41 = *((void *)v18 + 47);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  os_log_type_t v42 = sub_10001CEA0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    v55[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584(a1, a2, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v43 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10000B584(v15, v17, v55);
    sub_10001CF10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v43 + 22) = 2080;
    uint64_t v54 = sub_10000B584(0xD000000000000023, 0x80000001000205A0, v55);
    sub_10001CF10();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "CKCode error record: %s requestId: %s, error: %s", (uint8_t *)v43, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v44 = v47;
  NSString v45 = sub_10001CE40();
  v44[2](v44, 4294967294, v45, 0);
  swift_release();
}

void sub_10000C700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100008448(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_10000C708()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000C758(uint64_t a1, uint64_t a2)
{
  return sub_100007898(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8]);
}

uint64_t sub_10000C78C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000082B4(a1, a2, a3, a4, *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16));
}

uint64_t sub_10000C7DC(uint64_t a1)
{
  return sub_100006A0C(a1);
}

uint64_t sub_10000C7F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C8A4(uint64_t a1, uint64_t a2)
{
  uint64_t Response = type metadata accessor for GetResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Response - 8) + 32))(a2, a1, Response);
  return a2;
}

uint64_t sub_10000C908(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C968(uint64_t a1, uint64_t a2)
{
  uint64_t Response = type metadata accessor for GetResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Response - 8) + 16))(a2, a1, Response);
  return a2;
}

uint64_t sub_10000C9CC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000CA0C()
{
  return sub_10000CB3C((uint64_t)&unk_100025170, (uint64_t)sub_10000C7D0);
}

uint64_t sub_10000CA2C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000CA74()
{
  unint64_t result = qword_100029208;
  if (!qword_100029208)
  {
    sub_10000CAD0(&qword_100029200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029208);
  }
  return result;
}

uint64_t sub_10000CAD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000CB1C()
{
  return sub_10000CB3C((uint64_t)&unk_100025148, (uint64_t)sub_10000C7D0);
}

uint64_t sub_10000CB3C(uint64_t a1, uint64_t a2)
{
  return sub_10000A814(*(void *)(v2 + 16), *(void (**)(uint64_t, void *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72), a1, a2);
}

uint64_t sub_10000CB78()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CBB0()
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10000CC08(uint64_t a1)
{
  return sub_100009FF4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80));
}

uint64_t sub_10000CC40(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000CC54()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000CCA4()
{
  return sub_10000CB3C((uint64_t)&unk_100025120, (uint64_t)sub_10000C7D0);
}

uint64_t sub_10000CCD0()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 80, 7);
}

void sub_10000CD20(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  sub_1000084EC(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void (**)(void, void))(v5 + 24), *(void *)(v5 + 32), *(void **)(v5 + 40), *(void *)(v5 + 48), *(void *)(v5 + 56), *(void (**)(uint64_t, uint64_t, unint64_t, long long *))(v5 + 64), *(void *)(v5 + 72));
}

uint64_t sub_10000CD60()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000CDA8(uint64_t a1)
{
  return sub_100007A68(a1, *(void (**)(uint64_t, uint64_t, uint64_t, long long *, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

ValueMetadata *type metadata accessor for MuseAccessoryDataStatus()
{
  return &type metadata for MuseAccessoryDataStatus;
}

unint64_t sub_10000CDCC()
{
  unint64_t result = qword_100029210;
  if (!qword_100029210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029210);
  }
  return result;
}

uint64_t PutSNRequest.mapping.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PutSNRequest(0) + 28);
  sub_10000747C(v3, &qword_100029170);
  sub_1000074D8(a1, v3);
  uint64_t v4 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

uint64_t type metadata accessor for PutSNRequest(uint64_t a1)
{
  return sub_100007238(a1, (uint64_t *)&unk_100029A18);
}

uint64_t type metadata accessor for SerialNumberMapping(uint64_t a1)
{
  return sub_100007238(a1, qword_1000294A8);
}

uint64_t (*SerialNumberMappingResult.serialNumber.modify())()
{
  return nullsub_1;
}

uint64_t (*SerialNumberMappingResult.result.modify())()
{
  return nullsub_1;
}

uint64_t CalDataEntry.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for CalDataEntry, a1);
}

uint64_t type metadata accessor for CalDataEntry(uint64_t a1)
{
  return sub_100007238(a1, qword_100029410);
}

uint64_t CalDataEntry.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for CalDataEntry);
}

uint64_t (*CalDataEntry.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t CalDataEntry.init()@<X0>(void *a1@<X8>)
{
  return sub_10000D198((void (*)(void))type metadata accessor for CalDataEntry, a1);
}

uint64_t SerialNumberMapping.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for SerialNumberMapping, a1);
}

uint64_t sub_10000D024@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 24);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t SerialNumberMapping.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for SerialNumberMapping);
}

uint64_t sub_10000D0BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 24);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*SerialNumberMapping.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SerialNumberMapping.init()@<X0>(void *a1@<X8>)
{
  return sub_10000D198((void (*)(void))type metadata accessor for SerialNumberMapping, a1);
}

uint64_t sub_10000D198@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = 0;
  a2[3] = 0xE000000000000000;
  a1(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t SerialNumberMappingResult.result.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_10000D228(v1, *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  return v1;
}

uint64_t sub_10000D228(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_10000D240(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_10000D240(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t SerialNumberMappingResult.result.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = sub_10000D294(*(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32));
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(unsigned char *)(v3 + 32) = a3;
  return result;
}

uint64_t sub_10000D294(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_10000D2AC(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_10000D2AC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t SerialNumberMappingResult.accPayload.getter()
{
  if (*(unsigned char *)(v0 + 32)) {
    return 0;
  }
  uint64_t v2 = v0 + 16;
  uint64_t v1 = *(void *)(v0 + 16);
  sub_10000D240(v1, *(void *)(v2 + 8), 0);
  return v1;
}

uint64_t SerialNumberMappingResult.accPayload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10000D294(*(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  *(unsigned char *)(v2 + 32) = 0;
  return result;
}

uint64_t (*SerialNumberMappingResult.accPayload.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0xE000000000000000;
  }
  else
  {
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v4 = *(void *)(v1 + 24);
    sub_10000D240(v3, v4, 0);
  }
  *a1 = v3;
  a1[1] = v4;
  return sub_10000D3BC;
}

uint64_t sub_10000D3BC(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  unsigned __int8 v7 = *(unsigned char *)(v3 + 32);
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_10000D294(v5, v6, v7);
    *(void *)(v3 + 16) = v4;
    *(void *)(v3 + 24) = v2;
    *(unsigned char *)(v3 + 32) = 0;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = sub_10000D294(*(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32));
    *(void *)(v3 + 16) = v4;
    *(void *)(v3 + 24) = v2;
    *(unsigned char *)(v3 + 32) = 0;
  }
  return result;
}

uint64_t SerialNumberMappingResult.status.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if ((v1 & 1) == 0 || v1 == 255) {
    return 0;
  }
  else {
    return *(unsigned int *)(v0 + 16);
  }
}

uint64_t SerialNumberMappingResult.status.setter(unsigned int a1)
{
  uint64_t v2 = a1;
  uint64_t result = sub_10000D294(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  return result;
}

uint64_t (*SerialNumberMappingResult.status.modify(uint64_t a1))(unsigned int *a1)
{
  *(void *)a1 = v1;
  int v2 = *(_DWORD *)(v1 + 16);
  int v3 = *(unsigned __int8 *)(v1 + 32);
  if ((v3 & 1) == 0 || v3 == 255) {
    int v2 = 0;
  }
  *(_DWORD *)(a1 + 8) = v2;
  return sub_10000D4F0;
}

uint64_t sub_10000D4F0(unsigned int *a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = a1[2];
  uint64_t result = sub_10000D294(*(void *)(*(void *)a1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  return result;
}

uint64_t SerialNumberMappingResult.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for SerialNumberMappingResult, a1);
}

uint64_t type metadata accessor for SerialNumberMappingResult(uint64_t a1)
{
  return sub_100007238(a1, qword_100029540);
}

uint64_t SerialNumberMappingResult.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for SerialNumberMappingResult);
}

uint64_t (*SerialNumberMappingResult.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t static SerialNumberMappingResult.OneOf_Result.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    return (a6 & 1) != 0 && a1 == a4;
  }
  else if (a6)
  {
    return 0;
  }
  else if (a1 == a4 && a2 == a5)
  {
    return 1;
  }
  else
  {
    return sub_10001CFA0();
  }
}

uint64_t sub_10000D610(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  if (a1[2])
  {
    return (a2[2] & 1) != 0 && v3 == v4;
  }
  else if (a2[2])
  {
    return 0;
  }
  else
  {
    uint64_t v6 = a1[1];
    if (v3 == v4 && v6 == a2[1]) {
      return 1;
    }
    else {
      return sub_10001CFA0();
    }
  }
}

uint64_t SerialNumberMappingResult.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = -1;
  type metadata accessor for SerialNumberMappingResult(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t PubkeyEncryptedData.keyhash.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PubkeyEncryptedData.keyhash.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t PubkeyEncryptedData.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PubkeyEncryptedData.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t PubkeyEncryptedData.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for PubkeyEncryptedData, a1);
}

uint64_t type metadata accessor for PubkeyEncryptedData(uint64_t a1)
{
  return sub_100007238(a1, qword_1000295D8);
}

uint64_t PubkeyEncryptedData.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for PubkeyEncryptedData);
}

uint64_t (*PubkeyEncryptedData.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PubkeyEncryptedData.init()@<X0>(void *a1@<X8>)
{
  return sub_10000D198((void (*)(void))type metadata accessor for PubkeyEncryptedData, a1);
}

uint64_t (*PutRequest.clientVersion.modify())()
{
  return nullsub_1;
}

uint64_t PutRequest.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PutRequest.items.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*PutResponse.pubkeyEncItems.modify())()
{
  return nullsub_1;
}

uint64_t PutRequest.pubkeyEncItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PutRequest.pubkeyEncItems.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*PutRequest.pubkeyEncItems.modify())()
{
  return nullsub_1;
}

uint64_t PutRequest.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DD94(type metadata accessor for PutRequest, a1);
}

uint64_t type metadata accessor for PutRequest(uint64_t a1)
{
  return sub_100007238(a1, qword_100029670);
}

uint64_t PutRequest.unknownFields.setter(uint64_t a1)
{
  return sub_10000DE4C(a1, type metadata accessor for PutRequest);
}

uint64_t (*PutRequest.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PutRequest.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = &_swiftEmptyArrayStorage;
  a1[7] = &_swiftEmptyArrayStorage;
  type metadata accessor for PutRequest(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t CalDataStatus.status.getter()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t CalDataStatus.status.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 16) = result;
  return result;
}

uint64_t CalDataStatus.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CalDataStatus.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PutSNResponse.message.modify())()
{
  return nullsub_1;
}

uint64_t CalDataStatus.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB48(type metadata accessor for CalDataStatus, a1);
}

uint64_t type metadata accessor for CalDataStatus(uint64_t a1)
{
  return sub_100007238(a1, qword_100029710);
}

uint64_t CalDataStatus.unknownFields.setter(uint64_t a1)
{
  return sub_10000DC00(a1, type metadata accessor for CalDataStatus);
}

uint64_t (*CalDataStatus.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t CalDataStatus.init()@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DCDC((void (*)(void))type metadata accessor for CalDataStatus, a1);
}

uint64_t PubkeyEncDataStatus.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB48(type metadata accessor for PubkeyEncDataStatus, a1);
}

uint64_t sub_10000DB48@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 28);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for PubkeyEncDataStatus(uint64_t a1)
{
  return sub_100007238(a1, qword_1000297A8);
}

uint64_t PubkeyEncDataStatus.unknownFields.setter(uint64_t a1)
{
  return sub_10000DC00(a1, type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_10000DC00(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 28);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*PubkeyEncDataStatus.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PubkeyEncDataStatus.init()@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DCDC((void (*)(void))type metadata accessor for PubkeyEncDataStatus, a1);
}

uint64_t sub_10000DCDC@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(_DWORD *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0xE000000000000000;
  a1(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t PutResponse.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PutResponse.items.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*GetSNResponse.results.modify())()
{
  return nullsub_1;
}

uint64_t PutResponse.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DD94(type metadata accessor for PutResponse, a1);
}

uint64_t sub_10000DD94@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for PutResponse(uint64_t a1)
{
  return sub_100007238(a1, qword_100029840);
}

uint64_t PutResponse.unknownFields.setter(uint64_t a1)
{
  return sub_10000DE4C(a1, type metadata accessor for PutResponse);
}

uint64_t sub_10000DE4C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*PutResponse.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PutResponse.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 48) = &_swiftEmptyArrayStorage;
  type metadata accessor for PutResponse(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t GetRequest.keyhash.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GetRequest.keyhash.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t GetRequest.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB48(type metadata accessor for GetRequest, a1);
}

uint64_t type metadata accessor for GetRequest(uint64_t a1)
{
  return sub_100007238(a1, qword_1000298E0);
}

uint64_t GetRequest.unknownFields.setter(uint64_t a1)
{
  return sub_10000DC00(a1, type metadata accessor for GetRequest);
}

uint64_t (*GetRequest.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t GetRequest.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  type metadata accessor for GetRequest(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t GetResponse.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GetResponse.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t GetResponse.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000EA5C(type metadata accessor for GetResponse, a1);
}

uint64_t type metadata accessor for GetResponse(uint64_t a1)
{
  return sub_100007238(a1, qword_100029978);
}

uint64_t GetResponse.unknownFields.setter(uint64_t a1)
{
  return sub_10000EB14(a1, type metadata accessor for GetResponse);
}

uint64_t (*GetResponse.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t GetResponse.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  type metadata accessor for GetResponse(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t PutSNRequest.mapping.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_100005838(&qword_100029170);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PutSNRequest(0);
  sub_10000E2F8(v1 + *(int *)(v6 + 28), (uint64_t)v5);
  uint64_t v7 = type metadata accessor for SerialNumberMapping(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_1000074D8((uint64_t)v5, (uint64_t)a1);
  }
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_10000747C((uint64_t)v5, &qword_100029170);
}

uint64_t sub_10000E2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005838(&qword_100029170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void (*PutSNRequest.mapping.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_100005838(&qword_100029170);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for SerialNumberMapping(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for PutSNRequest(0) + 28);
  *((_DWORD *)v3 + 12) = v11;
  sub_10000E2F8(v1 + v11, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = 0;
    v10[1] = 0xE000000000000000;
    v10[2] = 0;
    v10[3] = 0xE000000000000000;
    _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    sub_10000747C((uint64_t)v5, &qword_100029170);
  }
  else
  {
    sub_1000074D8((uint64_t)v5, (uint64_t)v10);
  }
  return sub_10000E4E0;
}

void sub_10000E4E0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  uint64_t v8 = *(void **)(*(void *)a1 + 8);
  uint64_t v9 = **(void **)a1 + v3;
  if (a2)
  {
    sub_10001C448(*(void *)(*(void *)a1 + 40), (uint64_t)v4, type metadata accessor for SerialNumberMapping);
    sub_10000747C(v9, &qword_100029170);
    sub_1000074D8((uint64_t)v4, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    sub_10001C4B0((uint64_t)v5, type metadata accessor for SerialNumberMapping);
  }
  else
  {
    sub_10000747C(**(void **)a1 + v3, &qword_100029170);
    sub_1000074D8((uint64_t)v5, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);
  free(v2);
}

BOOL PutSNRequest.hasMapping.getter()
{
  uint64_t v1 = sub_100005838(&qword_100029170);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PutSNRequest(0);
  sub_10000E2F8(v0 + *(int *)(v4 + 28), (uint64_t)v3);
  uint64_t v5 = type metadata accessor for SerialNumberMapping(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_10000747C((uint64_t)v3, &qword_100029170);
  return v6;
}

Swift::Void __swiftcall PutSNRequest.clearMapping()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for PutSNRequest(0) + 28);
  sub_10000747C(v1, &qword_100029170);
  uint64_t v2 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t PutSNRequest.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for PutSNRequest, a1);
}

uint64_t PutSNRequest.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for PutSNRequest);
}

uint64_t (*PutSNRequest.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PutSNRequest.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  uint64_t v2 = type metadata accessor for PutSNRequest(0);
  _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 28);
  uint64_t v4 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 1, 1, v4);
}

uint64_t PutSNResponse.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB48(type metadata accessor for PutSNResponse, a1);
}

uint64_t type metadata accessor for PutSNResponse(uint64_t a1)
{
  return sub_100007238(a1, qword_100029AB8);
}

uint64_t PutSNResponse.unknownFields.setter(uint64_t a1)
{
  return sub_10000DC00(a1, type metadata accessor for PutSNResponse);
}

uint64_t (*PutSNResponse.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PutSNResponse.init()@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DCDC((void (*)(void))type metadata accessor for PutSNResponse, a1);
}

uint64_t GetSNRequest.serialNumbers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GetSNRequest.serialNumbers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t GetSNRequest.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D024(type metadata accessor for GetSNRequest, a1);
}

uint64_t type metadata accessor for GetSNRequest(uint64_t a1)
{
  return sub_100007238(a1, qword_100029B50);
}

uint64_t GetSNRequest.unknownFields.setter(uint64_t a1)
{
  return sub_10000D0BC(a1, type metadata accessor for GetSNRequest);
}

uint64_t (*GetSNRequest.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t GetSNRequest.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = &_swiftEmptyArrayStorage;
  type metadata accessor for GetSNRequest(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t GetSNResponse.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000EA5C(type metadata accessor for GetSNResponse, a1);
}

uint64_t sub_10000EA5C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 32);
  uint64_t v5 = sub_10001CB90();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for GetSNResponse(uint64_t a1)
{
  return sub_100007238(a1, qword_100029BE8);
}

uint64_t GetSNResponse.unknownFields.setter(uint64_t a1)
{
  return sub_10000EB14(a1, type metadata accessor for GetSNResponse);
}

uint64_t sub_10000EB14(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 32);
  uint64_t v5 = sub_10001CB90();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*GetSNResponse.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t GetSNResponse.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = &_swiftEmptyArrayStorage;
  type metadata accessor for GetSNResponse(0);
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

const char *CalDataEntry.protoMessageName.unsafeMutableAddressor()
{
  return "CalDataEntry";
}

uint64_t static CalDataEntry.protoMessageName.getter()
{
  return 0x45617461446C6143;
}

uint64_t sub_10000EC54(uint64_t a1)
{
  return sub_10000FDE4(a1, static CalDataEntry._protobuf_nameMap, (uint64_t)"recordId", 8);
}

uint64_t CalDataEntry._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E48, (uint64_t)static CalDataEntry._protobuf_nameMap);
}

uint64_t sub_10000EC90(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static CalDataEntry._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E48, (uint64_t)static CalDataEntry._protobuf_nameMap, a1);
}

uint64_t SerialNumberMapping.decodeMessage<A>(decoder:)()
{
  return sub_10000FFDC();
}

uint64_t CalDataEntry.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F1F8(a1, a2, a3, (void (*)(void))type metadata accessor for CalDataEntry);
}

uint64_t static CalDataEntry.== infix(_:_:)(char *a1, char *a2)
{
  return sub_100016E14(a1, a2, type metadata accessor for CalDataEntry) & 1;
}

Swift::Int CalDataEntry.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for CalDataEntry, &qword_100029218, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
}

uint64_t (*sub_10000EDB8())()
{
  return nullsub_1;
}

uint64_t sub_10000EDDC()
{
  return SerialNumberMapping.decodeMessage<A>(decoder:)();
}

uint64_t sub_10000EDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CalDataEntry.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_10000EE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C98, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000EE90@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E48, (uint64_t)static CalDataEntry._protobuf_nameMap, a1);
}

uint64_t sub_10000EEB4(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029238, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10000EF24()
{
  sub_100016DCC(&qword_100029238, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
  return sub_10001CC70();
}

void *SerialNumberMapping.protoMessageName.unsafeMutableAddressor()
{
  return &static SerialNumberMapping.protoMessageName;
}

unint64_t static SerialNumberMapping.protoMessageName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_10000EFCC()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static SerialNumberMapping._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static SerialNumberMapping._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E500;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "serialNumber";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "accPayload";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t SerialNumberMapping._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E50, (uint64_t)static SerialNumberMapping._protobuf_nameMap);
}

uint64_t static SerialNumberMapping._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E50, (uint64_t)static SerialNumberMapping._protobuf_nameMap, a1);
}

uint64_t SerialNumberMapping.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F1F8(a1, a2, a3, (void (*)(void))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_10000F1F8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  unint64_t v7 = v4[1];
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8 || (uint64_t result = sub_10001CCB0(), !v5))
  {
    unint64_t v10 = v4[3];
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v4[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v11 || (uint64_t result = sub_10001CCB0(), !v5))
    {
      a4(0);
      return sub_10001CB70();
    }
  }
  return result;
}

uint64_t static SerialNumberMapping.== infix(_:_:)(char *a1, char *a2)
{
  return sub_100016E14(a1, a2, type metadata accessor for SerialNumberMapping) & 1;
}

Swift::Int SerialNumberMapping.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for SerialNumberMapping, &qword_100029220, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_10000F35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SerialNumberMapping.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_10000F374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C90, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000F3F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E50, (uint64_t)static SerialNumberMapping._protobuf_nameMap, a1);
}

uint64_t sub_10000F414(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_1000292C8, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F480()
{
  sub_100016DCC(&qword_1000292C8, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
  return sub_10001CC70();
}

void *SerialNumberMappingResult.protoMessageName.unsafeMutableAddressor()
{
  return &static SerialNumberMappingResult.protoMessageName;
}

unint64_t static SerialNumberMappingResult.protoMessageName.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_10000F524()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static SerialNumberMappingResult._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static SerialNumberMappingResult._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "serialNumber";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "accPayload";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "status";
  *(void *)(v11 + 8) = 6;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t SerialNumberMappingResult._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E58, (uint64_t)static SerialNumberMappingResult._protobuf_nameMap);
}

uint64_t static SerialNumberMappingResult._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E58, (uint64_t)static SerialNumberMappingResult._protobuf_nameMap, a1);
}

uint64_t SerialNumberMappingResult.decodeMessage<A>(decoder:)(uint64_t a1)
{
  uint64_t v3 = v1;
  while (1)
  {
    uint64_t result = sub_10001CBC0();
    if (v2 || (v6 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        sub_10000F8F0();
        break;
      case 2:
        sub_10000F824(a1, v3);
        break;
      case 1:
        sub_10001CC20();
        break;
    }
  }
  return result;
}

uint64_t sub_10000F824(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10001CC10();
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  if (v8)
  {
    if (*(unsigned __int8 *)(a2 + 32) == 255)
    {
      unsigned __int8 v5 = -1;
    }
    else
    {
      sub_10001CBD0();
      unsigned __int8 v5 = *(unsigned char *)(a2 + 32);
    }
    uint64_t v6 = *(void *)(a2 + 16);
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = v8;
    *(unsigned char *)(a2 + 32) = 0;
    return sub_10000D294(v6, v7, v5);
  }
  return result;
}

uint64_t sub_10000F8F0()
{
  return sub_10001CBE0();
}

uint64_t SerialNumberMappingResult.traverse<A>(visitor:)()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    int v5 = *(unsigned __int8 *)(v0 + 32);
    if (v5 != 255)
    {
      if (v5)
      {
        uint64_t result = sub_10000FB28(v0);
        if (v1) {
          return result;
        }
      }
      else
      {
        uint64_t result = sub_10000FA90(v0);
        if (v1) {
          return result;
        }
      }
    }
    type metadata accessor for SerialNumberMappingResult(0);
    return sub_10001CB70();
  }
  return result;
}

uint64_t sub_10000FA90(uint64_t result)
{
  unsigned __int8 v1 = *(unsigned char *)(result + 32);
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void *)(result + 16);
    uint64_t v2 = *(void *)(result + 24);
    sub_10000D240(v3, v2, 0);
    sub_10001CCB0();
    return sub_10000D294(v3, v2, v1);
  }
  return result;
}

uint64_t sub_10000FB28(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 32);
  if (v1 != 255 && (v1 & 1) != 0) {
    return sub_10001CC90();
  }
  __break(1u);
  return result;
}

Swift::Int SerialNumberMappingResult.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for SerialNumberMappingResult, &qword_100029228, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
}

uint64_t sub_10000FBB8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = -1;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_10000FBEC(uint64_t a1)
{
  return SerialNumberMappingResult.decodeMessage<A>(decoder:)(a1);
}

uint64_t sub_10000FC04()
{
  return SerialNumberMappingResult.traverse<A>(visitor:)();
}

uint64_t sub_10000FC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C88, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000FC98@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E58, (uint64_t)static SerialNumberMappingResult._protobuf_nameMap, a1);
}

uint64_t sub_10000FCBC(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_1000292A0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FD28()
{
  sub_100016DCC(&qword_1000292A0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
  return sub_10001CC70();
}

void *PubkeyEncryptedData.protoMessageName.unsafeMutableAddressor()
{
  return &static PubkeyEncryptedData.protoMessageName;
}

unint64_t static PubkeyEncryptedData.protoMessageName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_10000FDCC(uint64_t a1)
{
  return sub_10000FDE4(a1, static PubkeyEncryptedData._protobuf_nameMap, (uint64_t)"keyhash", 7);
}

uint64_t sub_10000FDE4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_10001CD00();
  sub_10001C510(v7, a2);
  sub_10000EC90(v7, (uint64_t)a2);
  sub_100005838(&qword_100029CA8);
  uint64_t v8 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v9 = *(void *)(*(void *)v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001E500;
  uint64_t v12 = (void *)(v11 + v10);
  unint64_t v13 = v11 + v10 + v8[14];
  *uint64_t v12 = 1;
  *(void *)unint64_t v13 = a3;
  *(void *)(v13 + 8) = a4;
  *(unsigned char *)(v13 + 16) = 2;
  uint64_t v14 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v15 = sub_10001CCE0();
  unint64_t v16 = *(void (**)(void))(*(void *)(v15 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v16)(v13, v14, v15);
  unint64_t v17 = (char *)v12 + v9 + v8[14];
  *(void *)((char *)v12 + v9) = 2;
  *(void *)unint64_t v17 = "data";
  *((void *)v17 + 1) = 4;
  v17[16] = 2;
  v16();
  return sub_10001CCF0();
}

uint64_t PubkeyEncryptedData._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E60, (uint64_t)static PubkeyEncryptedData._protobuf_nameMap);
}

uint64_t static PubkeyEncryptedData._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E60, (uint64_t)static PubkeyEncryptedData._protobuf_nameMap, a1);
}

uint64_t sub_10000FFDC()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_10001CC20();
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t PubkeyEncryptedData.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F1F8(a1, a2, a3, (void (*)(void))type metadata accessor for PubkeyEncryptedData);
}

uint64_t static PubkeyEncryptedData.== infix(_:_:)(char *a1, char *a2)
{
  return sub_100016E14(a1, a2, type metadata accessor for PubkeyEncryptedData) & 1;
}

Swift::Int PubkeyEncryptedData.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PubkeyEncryptedData, &qword_100029230, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
}

uint64_t sub_100010114@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_100010140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PubkeyEncryptedData.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_100010158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C80, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000101D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E60, (uint64_t)static PubkeyEncryptedData._protobuf_nameMap, a1);
}

uint64_t sub_1000101F8(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029240, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100010264()
{
  sub_100016DCC(&qword_100029240, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
  return sub_10001CC70();
}

const char *PutRequest.protoMessageName.unsafeMutableAddressor()
{
  return "PutRequest";
}

uint64_t static PutRequest.protoMessageName.getter()
{
  return 0x6575716552747550;
}

uint64_t sub_100010308()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static PutRequest._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static PutRequest._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  int v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "timestamp";
  *(void *)(v10 + 8) = 9;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "clientVersion";
  *((void *)v12 + 1) = 13;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *unint64_t v13 = 4;
  *(void *)uint64_t v14 = "items";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "pubkeyEncItems";
  *(void *)(v15 + 8) = 14;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t PutRequest._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E68, (uint64_t)static PutRequest._protobuf_nameMap);
}

uint64_t static PutRequest._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E68, (uint64_t)static PutRequest._protobuf_nameMap, a1);
}

uint64_t PutRequest.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
          sub_10001CC20();
          break;
        case 4:
          type metadata accessor for CalDataEntry(0);
          sub_100016DCC(&qword_100029238, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
          goto LABEL_9;
        case 5:
          type metadata accessor for PubkeyEncryptedData(0);
          sub_100016DCC(&qword_100029240, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
LABEL_9:
          sub_10001CC30();
          break;
        default:
          break;
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t PutRequest.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = sub_10001CCB0(), !v1))
      {
        if (!*(void *)(v0[6] + 16)
          || (type metadata accessor for CalDataEntry(0),
              sub_100016DCC(&qword_100029238, (void (*)(uint64_t))type metadata accessor for CalDataEntry),
              uint64_t result = sub_10001CCC0(),
              !v1))
        {
          if (!*(void *)(v0[7] + 16)
            || (type metadata accessor for PubkeyEncryptedData(0),
                sub_100016DCC(&qword_100029240, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData), uint64_t result = sub_10001CCC0(), !v1))
          {
            type metadata accessor for PutRequest(0);
            return sub_10001CB70();
          }
        }
      }
    }
  }
  return result;
}

Swift::Int PutRequest.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PutRequest, &qword_100029248, (void (*)(uint64_t))type metadata accessor for PutRequest);
}

uint64_t sub_1000109D4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = &_swiftEmptyArrayStorage;
  a1[7] = &_swiftEmptyArrayStorage;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t (*sub_100010A18())()
{
  return nullsub_1;
}

uint64_t sub_100010A3C()
{
  return PutRequest.decodeMessage<A>(decoder:)();
}

uint64_t sub_100010A54()
{
  return PutRequest.traverse<A>(visitor:)();
}

uint64_t sub_100010A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C78, (void (*)(uint64_t))type metadata accessor for PutRequest);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100010AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E68, (uint64_t)static PutRequest._protobuf_nameMap, a1);
}

uint64_t sub_100010B0C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100028F50, (void (*)(uint64_t))type metadata accessor for PutRequest);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100010B78()
{
  sub_100016DCC(&qword_100028F50, (void (*)(uint64_t))type metadata accessor for PutRequest);
  return sub_10001CC70();
}

const char *CalDataStatus.protoMessageName.unsafeMutableAddressor()
{
  return "CalDataStatus";
}

uint64_t static CalDataStatus.protoMessageName.getter()
{
  return 0x53617461446C6143;
}

uint64_t sub_100010C24()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static CalDataStatus._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static CalDataStatus._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "recordId";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "status";
  *((void *)v10 + 1) = 6;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "message";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t CalDataStatus._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E70, (uint64_t)static CalDataStatus._protobuf_nameMap);
}

uint64_t static CalDataStatus._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E70, (uint64_t)static CalDataStatus._protobuf_nameMap, a1);
}

uint64_t PutSNResponse.decodeMessage<A>(decoder:)()
{
  return sub_1000137E8();
}

uint64_t CalDataStatus.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113B4(a1, a2, a3, (void (*)(void))type metadata accessor for CalDataStatus);
}

uint64_t static CalDataStatus.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_100016BC0(a1, a2, type metadata accessor for CalDataStatus) & 1;
}

Swift::Int CalDataStatus.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for CalDataStatus, &qword_100029250, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
}

uint64_t (*sub_100010F38())()
{
  return nullsub_1;
}

uint64_t sub_100010F5C()
{
  return PutSNResponse.decodeMessage<A>(decoder:)();
}

uint64_t sub_100010F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CalDataStatus.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_100010F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C70, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100011008@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E70, (uint64_t)static CalDataStatus._protobuf_nameMap, a1);
}

uint64_t sub_10001102C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029260, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100011098()
{
  sub_100016DCC(&qword_100029260, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
  return sub_10001CC70();
}

void *PubkeyEncDataStatus.protoMessageName.unsafeMutableAddressor()
{
  return &static PubkeyEncDataStatus.protoMessageName;
}

unint64_t static PubkeyEncDataStatus.protoMessageName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_10001113C()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static PubkeyEncDataStatus._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static PubkeyEncDataStatus._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "keyhash";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "status";
  *((void *)v10 + 1) = 6;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "message";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t PubkeyEncDataStatus._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E78, (uint64_t)static PubkeyEncDataStatus._protobuf_nameMap);
}

uint64_t static PubkeyEncDataStatus._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E78, (uint64_t)static PubkeyEncDataStatus._protobuf_nameMap, a1);
}

uint64_t PubkeyEncDataStatus.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113B4(a1, a2, a3, (void (*)(void))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_1000113B4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  unint64_t v7 = *(void *)(v4 + 8);
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *(void *)v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8 || (uint64_t result = sub_10001CCB0(), !v5))
  {
    if (!*(_DWORD *)(v4 + 16) || (uint64_t result = sub_10001CC90(), !v5))
    {
      unint64_t v10 = *(void *)(v4 + 32);
      uint64_t v11 = HIBYTE(v10) & 0xF;
      if ((v10 & 0x2000000000000000) == 0) {
        uint64_t v11 = *(void *)(v4 + 24) & 0xFFFFFFFFFFFFLL;
      }
      if (!v11 || (uint64_t result = sub_10001CCB0(), !v5))
      {
        a4(0);
        return sub_10001CB70();
      }
    }
  }
  return result;
}

uint64_t static PubkeyEncDataStatus.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_100016BC0(a1, a2, type metadata accessor for PubkeyEncDataStatus) & 1;
}

Swift::Int PubkeyEncDataStatus.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PubkeyEncDataStatus, &qword_100029258, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_100011540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PubkeyEncDataStatus.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_100011558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C68, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000115D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E78, (uint64_t)static PubkeyEncDataStatus._protobuf_nameMap, a1);
}

uint64_t sub_1000115F8(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029268, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100011664()
{
  sub_100016DCC(&qword_100029268, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
  return sub_10001CC70();
}

const char *PutResponse.protoMessageName.unsafeMutableAddressor()
{
  return "PutResponse";
}

uint64_t static PutResponse.protoMessageName.getter()
{
  return 0x6F70736552747550;
}

uint64_t sub_10001170C()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static PutResponse._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static PutResponse._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "status";
  *(void *)(v10 + 8) = 6;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "message";
  *((void *)v12 + 1) = 7;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *unint64_t v13 = 4;
  *(void *)uint64_t v14 = "items";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "pubkeyEncItems";
  *(void *)(v15 + 8) = 14;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t PutResponse._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E80, (uint64_t)static PutResponse._protobuf_nameMap);
}

uint64_t static PutResponse._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E80, (uint64_t)static PutResponse._protobuf_nameMap, a1);
}

uint64_t PutResponse.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
          uint64_t v4 = v3;
          sub_10001CC20();
          goto LABEL_6;
        case 2:
          uint64_t v4 = v3;
          sub_10001CBF0();
          goto LABEL_6;
        case 4:
          type metadata accessor for CalDataStatus(0);
          sub_100016DCC(&qword_100029260, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
          goto LABEL_5;
        case 5:
          type metadata accessor for PubkeyEncDataStatus(0);
          sub_100016DCC(&qword_100029268, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
LABEL_5:
          uint64_t v4 = v3;
          sub_10001CC30();
LABEL_6:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t PutResponse.traverse<A>(visitor:)()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    if (!*(_DWORD *)(v0 + 16) || (uint64_t result = sub_10001CC90(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 32);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 24) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
      {
        if (!*(void *)(*(void *)(v0 + 40) + 16)
          || (type metadata accessor for CalDataStatus(0),
              sub_100016DCC(&qword_100029260, (void (*)(uint64_t))type metadata accessor for CalDataStatus),
              uint64_t result = sub_10001CCC0(),
              !v1))
        {
          if (!*(void *)(*(void *)(v0 + 48) + 16)
            || (type metadata accessor for PubkeyEncDataStatus(0),
                sub_100016DCC(&qword_100029268, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus), uint64_t result = sub_10001CCC0(), !v1))
          {
            type metadata accessor for PutResponse(0);
            return sub_10001CB70();
          }
        }
      }
    }
  }
  return result;
}

Swift::Int PutResponse.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PutResponse, &qword_100029270, (void (*)(uint64_t))type metadata accessor for PutResponse);
}

uint64_t sub_100011DCC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 48) = &_swiftEmptyArrayStorage;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_100011E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_100011E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_100011EE8()
{
  return PutResponse.decodeMessage<A>(decoder:)();
}

uint64_t sub_100011F00()
{
  return PutResponse.traverse<A>(visitor:)();
}

uint64_t sub_100011F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C60, (void (*)(uint64_t))type metadata accessor for PutResponse);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100011F94@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E80, (uint64_t)static PutResponse._protobuf_nameMap, a1);
}

uint64_t sub_100011FB8(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029330, (void (*)(uint64_t))type metadata accessor for PutResponse);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100012024()
{
  sub_100016DCC(&qword_100029330, (void (*)(uint64_t))type metadata accessor for PutResponse);
  return sub_10001CC70();
}

const char *GetRequest.protoMessageName.unsafeMutableAddressor()
{
  return "GetRequest";
}

uint64_t static GetRequest.protoMessageName.getter()
{
  return 0x6575716552746547;
}

uint64_t sub_1000120C8()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static GetRequest._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static GetRequest._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "recordId";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "keyhash";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t GetRequest._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E88, (uint64_t)static GetRequest._protobuf_nameMap);
}

uint64_t static GetRequest._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E88, (uint64_t)static GetRequest._protobuf_nameMap, a1);
}

uint64_t GetRequest.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3 || result == 2 || result == 1) {
        sub_10001CC20();
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t GetRequest.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = sub_10001CCB0(), !v1))
      {
        type metadata accessor for GetRequest(0);
        return sub_10001CB70();
      }
    }
  }
  return result;
}

Swift::Int GetRequest.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for GetRequest, &qword_100029278, (void (*)(uint64_t))type metadata accessor for GetRequest);
}

uint64_t sub_10001251C@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_10001254C()
{
  return GetRequest.decodeMessage<A>(decoder:)();
}

uint64_t sub_100012564()
{
  return GetRequest.traverse<A>(visitor:)();
}

uint64_t sub_10001257C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C58, (void (*)(uint64_t))type metadata accessor for GetRequest);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000125F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E88, (uint64_t)static GetRequest._protobuf_nameMap, a1);
}

uint64_t sub_10001261C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100012688()
{
  sub_100016DCC(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
  return sub_10001CC70();
}

const char *GetResponse.protoMessageName.unsafeMutableAddressor()
{
  return "GetResponse";
}

uint64_t static GetResponse.protoMessageName.getter()
{
  return 0x6F70736552746547;
}

uint64_t sub_100012730(uint64_t a1)
{
  return sub_1000142F8(a1, static GetResponse._protobuf_nameMap, (uint64_t)"data", 4);
}

uint64_t GetResponse._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E90, (uint64_t)static GetResponse._protobuf_nameMap);
}

uint64_t static GetResponse._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E90, (uint64_t)static GetResponse._protobuf_nameMap, a1);
}

uint64_t GetResponse.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
        case 4:
          sub_10001CC20();
          break;
        case 2:
          sub_10001CBF0();
          break;
        default:
          break;
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t GetResponse.traverse<A>(visitor:)()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    if (!*(_DWORD *)(v0 + 16) || (uint64_t result = sub_10001CC90(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 32);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 24) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
      {
        unint64_t v7 = *(void *)(v0 + 48);
        uint64_t v8 = HIBYTE(v7) & 0xF;
        if ((v7 & 0x2000000000000000) == 0) {
          uint64_t v8 = *(void *)(v0 + 40) & 0xFFFFFFFFFFFFLL;
        }
        if (!v8 || (uint64_t result = sub_10001CCB0(), !v1))
        {
          type metadata accessor for GetResponse(0);
          return sub_10001CB70();
        }
      }
    }
  }
  return result;
}

Swift::Int GetResponse.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for GetResponse, &qword_100029280, (void (*)(uint64_t))type metadata accessor for GetResponse);
}

uint64_t sub_1000129FC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t (*sub_100012A38())()
{
  return nullsub_1;
}

uint64_t sub_100012A5C()
{
  return GetResponse.decodeMessage<A>(decoder:)();
}

uint64_t sub_100012A74()
{
  return GetResponse.traverse<A>(visitor:)();
}

uint64_t sub_100012A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C50, (void (*)(uint64_t))type metadata accessor for GetResponse);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100012B08@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E90, (uint64_t)static GetResponse._protobuf_nameMap, a1);
}

uint64_t sub_100012B2C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029358, (void (*)(uint64_t))type metadata accessor for GetResponse);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100012B98()
{
  sub_100016DCC(&qword_100029358, (void (*)(uint64_t))type metadata accessor for GetResponse);
  return sub_10001CC70();
}

const char *PutSNRequest.protoMessageName.unsafeMutableAddressor()
{
  return "PutSNRequest";
}

uint64_t static PutSNRequest.protoMessageName.getter()
{
  return 0x7165524E53747550;
}

uint64_t sub_100012C40()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static PutSNRequest._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static PutSNRequest._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "clientVersion";
  *((void *)v10 + 1) = 13;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "mapping";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t PutSNRequest._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028E98, (uint64_t)static PutSNRequest._protobuf_nameMap);
}

uint64_t static PutSNRequest._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028E98, (uint64_t)static PutSNRequest._protobuf_nameMap, a1);
}

uint64_t PutSNRequest.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3)
      {
        sub_100012F44();
      }
      else if (result == 2 || result == 1)
      {
        sub_10001CC20();
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t sub_100012F44()
{
  return sub_10001CC40();
}

uint64_t PutSNRequest.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
    {
      uint64_t result = sub_1000130F0((uint64_t)v0);
      if (!v1)
      {
        type metadata accessor for PutSNRequest(0);
        return sub_10001CB70();
      }
    }
  }
  return result;
}

uint64_t sub_1000130F0(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_100029170);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PutSNRequest(0);
  sub_10000E2F8(a1 + *(int *)(v9 + 28), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_10000747C((uint64_t)v4, &qword_100029170);
  }
  sub_1000074D8((uint64_t)v4, (uint64_t)v8);
  sub_100016DCC(&qword_1000292C8, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
  sub_10001CCD0();
  return sub_10001C4B0((uint64_t)v8, type metadata accessor for SerialNumberMapping);
}

Swift::Int PutSNRequest.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PutSNRequest, &qword_100029288, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
}

uint64_t sub_100013324@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = 0;
  a2[3] = 0xE000000000000000;
  _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 28);
  uint64_t v5 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

uint64_t sub_1000133B4()
{
  return PutSNRequest.decodeMessage<A>(decoder:)();
}

uint64_t sub_1000133CC()
{
  return PutSNRequest.traverse<A>(visitor:)();
}

uint64_t sub_1000133E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C48, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100013460@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028E98, (uint64_t)static PutSNRequest._protobuf_nameMap, a1);
}

uint64_t sub_100013484(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100028F60, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_1000134F0()
{
  sub_100016DCC(&qword_100028F60, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
  return sub_10001CC70();
}

const char *PutSNResponse.protoMessageName.unsafeMutableAddressor()
{
  return "PutSNResponse";
}

uint64_t static PutSNResponse.protoMessageName.getter()
{
  return 0x7365524E53747550;
}

uint64_t sub_10001359C()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static PutSNResponse._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static PutSNResponse._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E510;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "status";
  *((void *)v10 + 1) = 6;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "message";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t PutSNResponse._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028EA0, (uint64_t)static PutSNResponse._protobuf_nameMap);
}

uint64_t static PutSNResponse._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028EA0, (uint64_t)static PutSNResponse._protobuf_nameMap, a1);
}

uint64_t sub_1000137E8()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while (1)
    {
      if (v2) {
        return result;
      }
      switch(result)
      {
        case 3:
          goto LABEL_10;
        case 2:
          sub_10001CBF0();
          break;
        case 1:
LABEL_10:
          sub_10001CC20();
          break;
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t PutSNResponse.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113B4(a1, a2, a3, (void (*)(void))type metadata accessor for PutSNResponse);
}

uint64_t static PutSNResponse.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_100016BC0(a1, a2, type metadata accessor for PutSNResponse) & 1;
}

Swift::Int PutSNResponse.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for PutSNResponse, &qword_100029290, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
}

uint64_t sub_100013944@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_100013974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1000139E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_100013A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PutSNResponse.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_100013A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C40, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100013AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028EA0, (uint64_t)static PutSNResponse._protobuf_nameMap, a1);
}

uint64_t sub_100013B0C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100029380, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100013B78()
{
  sub_100016DCC(&qword_100029380, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
  return sub_10001CC70();
}

const char *GetSNRequest.protoMessageName.unsafeMutableAddressor()
{
  return "GetSNRequest";
}

uint64_t static GetSNRequest.protoMessageName.getter()
{
  return 0x7165524E53746547;
}

uint64_t sub_100013C20()
{
  uint64_t v0 = sub_10001CD00();
  sub_10001C510(v0, static GetSNRequest._protobuf_nameMap);
  sub_10000EC90(v0, (uint64_t)static GetSNRequest._protobuf_nameMap);
  sub_100005838(&qword_100029CA8);
  uint64_t v1 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E500;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "requestId";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_10001CCE0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 3;
  *(void *)unint64_t v10 = "serialNumbers";
  *((void *)v10 + 1) = 13;
  v10[16] = 2;
  v9();
  return sub_10001CCF0();
}

uint64_t GetSNRequest._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028EA8, (uint64_t)static GetSNRequest._protobuf_nameMap);
}

uint64_t static GetSNRequest._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028EA8, (uint64_t)static GetSNRequest._protobuf_nameMap, a1);
}

uint64_t GetSNRequest.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3)
      {
        sub_10001CC00();
      }
      else if (result == 1)
      {
        sub_10001CC20();
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t GetSNRequest.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    if (!*(void *)(v0[2] + 16) || (uint64_t result = sub_10001CCA0(), !v1))
    {
      type metadata accessor for GetSNRequest(0);
      return sub_10001CB70();
    }
  }
  return result;
}

Swift::Int GetSNRequest.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for GetSNRequest, &qword_100029298, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
}

uint64_t sub_100013FE4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = &_swiftEmptyArrayStorage;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_100014018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_100014088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10001CB90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_1000140F8()
{
  return GetSNRequest.decodeMessage<A>(decoder:)();
}

uint64_t sub_100014110()
{
  return GetSNRequest.traverse<A>(visitor:)();
}

uint64_t sub_100014128(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C38, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000141A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028EA8, (uint64_t)static GetSNRequest._protobuf_nameMap, a1);
}

uint64_t sub_1000141C8(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_100028F68, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100014234()
{
  sub_100016DCC(&qword_100028F68, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
  return sub_10001CC70();
}

const char *GetSNResponse.protoMessageName.unsafeMutableAddressor()
{
  return "GetSNResponse";
}

uint64_t static GetSNResponse.protoMessageName.getter()
{
  return 0x7365524E53746547;
}

uint64_t sub_1000142E0(uint64_t a1)
{
  return sub_1000142F8(a1, static GetSNResponse._protobuf_nameMap, (uint64_t)"results", 7);
}

uint64_t sub_1000142F8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_10001CD00();
  sub_10001C510(v5, a2);
  sub_10000EC90(v5, (uint64_t)a2);
  sub_100005838(&qword_100029CA8);
  unint64_t v6 = (int *)(sub_100005838(&qword_100029CB0) - 8);
  uint64_t v7 = *(void *)(*(void *)v6 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001E530;
  unint64_t v10 = v9 + v8;
  unint64_t v11 = v9 + v8 + v6[14];
  *(void *)(v9 + v8) = 1;
  *(void *)unint64_t v11 = "requestId";
  *(void *)(v11 + 8) = 9;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v13 = sub_10001CCE0();
  uint64_t v14 = *(void (**)(void))(*(void *)(v13 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v14)(v11, v12, v13);
  unint64_t v15 = v10 + v7 + v6[14];
  *(void *)(v10 + v7) = 2;
  *(void *)unint64_t v15 = "status";
  *(void *)(v15 + 8) = 6;
  *(unsigned char *)(v15 + 16) = 2;
  v14();
  unint64_t v16 = (void *)(v10 + 2 * v7);
  unint64_t v17 = (char *)v16 + v6[14];
  *unint64_t v16 = 3;
  *(void *)unint64_t v17 = "message";
  *((void *)v17 + 1) = 7;
  v17[16] = 2;
  v14();
  uint64_t v18 = v6[14];
  id v19 = (void *)(v10 + 3 * v7);
  void *v19 = 4;
  os_log_type_t v20 = (char *)v19 + v18;
  *(void *)os_log_type_t v20 = a3;
  *((void *)v20 + 1) = a4;
  v20[16] = 2;
  v14();
  return sub_10001CCF0();
}

uint64_t GetSNResponse._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_100014550(&qword_100028EB0, (uint64_t)static GetSNResponse._protobuf_nameMap);
}

uint64_t sub_100014550(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10001CD00();
  return sub_10000EC90(v3, a2);
}

uint64_t static GetSNResponse._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000145C8(&qword_100028EB0, (uint64_t)static GetSNResponse._protobuf_nameMap, a1);
}

uint64_t sub_1000145C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10001CD00();
  uint64_t v6 = sub_10000EC90(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t GetSNResponse.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_10001CBC0();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
          uint64_t v4 = v3;
          sub_10001CC20();
          goto LABEL_5;
        case 2:
          uint64_t v4 = v3;
          sub_10001CBF0();
          goto LABEL_5;
        case 4:
          type metadata accessor for SerialNumberMappingResult(0);
          sub_100016DCC(&qword_1000292A0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
          uint64_t v4 = v3;
          sub_10001CC30();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_10001CBC0();
    }
  }
  return result;
}

uint64_t GetSNResponse.traverse<A>(visitor:)()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_10001CCB0(), !v1))
  {
    if (!*(_DWORD *)(v0 + 16) || (uint64_t result = sub_10001CC90(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 32);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 24) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_10001CCB0(), !v1))
      {
        if (!*(void *)(*(void *)(v0 + 40) + 16)
          || (type metadata accessor for SerialNumberMappingResult(0),
              sub_100016DCC(&qword_1000292A0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult), uint64_t result = sub_10001CCC0(), !v1))
        {
          type metadata accessor for GetSNResponse(0);
          return sub_10001CB70();
        }
      }
    }
  }
  return result;
}

Swift::Int GetSNResponse.hashValue.getter()
{
  return sub_10001498C((void (*)(void))type metadata accessor for GetSNResponse, &qword_1000292A8, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
}

Swift::Int sub_10001498C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_10001D020();
}

uint64_t sub_100014A14@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = &_swiftEmptyArrayStorage;
  return _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t sub_100014A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_100014AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 32);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_100014B30()
{
  return GetSNResponse.decodeMessage<A>(decoder:)();
}

uint64_t sub_100014B48()
{
  return GetSNResponse.traverse<A>(visitor:)();
}

uint64_t sub_100014B60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016DCC(&qword_100029C30, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100014BDC@<X0>(uint64_t a1@<X8>)
{
  return sub_100014C00(&qword_100028EB0, (uint64_t)static GetSNResponse._protobuf_nameMap, a1);
}

uint64_t sub_100014C00@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10001CD00();
  uint64_t v6 = sub_10000EC90(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_100014C9C(uint64_t a1)
{
  uint64_t v2 = sub_100016DCC(&qword_1000293A8, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100014D08()
{
  return sub_10001D020();
}

uint64_t sub_100014D60()
{
  sub_100016DCC(&qword_1000293A8, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
  return sub_10001CC70();
}

Swift::Int sub_100014DDC()
{
  return sub_10001D020();
}

uint64_t sub_100014E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SerialNumberMappingResult(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_30:
    char v19 = 0;
    return v19 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v24 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_10001C448(a1 + v12, (uint64_t)v10, type metadata accessor for SerialNumberMappingResult);
      sub_10001C448(a2 + v12, (uint64_t)v7, type metadata accessor for SerialNumberMappingResult);
      BOOL v14 = *(void *)v10 == *(void *)v7 && *((void *)v10 + 1) == *((void *)v7 + 1);
      if (!v14 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      int v15 = v10[32];
      int v16 = v7[32];
      if (v15 == 255)
      {
        if (v16 != 255) {
          break;
        }
      }
      else
      {
        if (v16 == 255) {
          break;
        }
        uint64_t v17 = *((void *)v10 + 2);
        uint64_t v18 = *((void *)v7 + 2);
        if (v15)
        {
          if ((v16 & 1) == 0 || v17 != v18) {
            break;
          }
        }
        else if ((v16 & 1) != 0 {
               || (v17 != v18 || *((void *)v10 + 3) != *((void *)v7 + 3)) && (sub_10001CFA0() & 1) == 0)
        }
        {
          break;
        }
      }
      sub_10001CB90();
      sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v19 = sub_10001CE30();
      sub_10001C4B0((uint64_t)v7, type metadata accessor for SerialNumberMappingResult);
      sub_10001C4B0((uint64_t)v10, type metadata accessor for SerialNumberMappingResult);
      BOOL v21 = v13-- != 0;
      if (v19)
      {
        v12 += v24;
        if (v21) {
          continue;
        }
      }
      return v19 & 1;
    }
    sub_10001C4B0((uint64_t)v7, type metadata accessor for SerialNumberMappingResult);
    sub_10001C4B0((uint64_t)v10, type metadata accessor for SerialNumberMappingResult);
    goto LABEL_30;
  }
  char v19 = 1;
  return v19 & 1;
}

uint64_t sub_1000150F0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_10001CFA0(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (uint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000151B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = a3(0);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14 == *(void *)(a2 + 16))
  {
    if (!v14 || a1 == a2) {
      return 1;
    }
    unint64_t v15 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v20 = *(void *)(v11 + 72);
    BOOL v21 = a4;
    while (1)
    {
      sub_10001C448(a1 + v15, (uint64_t)v13, a4);
      sub_10001C448(a2 + v15, (uint64_t)v10, a4);
      BOOL v16 = *(void *)v13 == *(void *)v10 && *((void *)v13 + 1) == *((void *)v10 + 1);
      if (!v16 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      if (*((_DWORD *)v13 + 4) != *((_DWORD *)v10 + 4)) {
        break;
      }
      BOOL v17 = *((void *)v13 + 3) == *((void *)v10 + 3) && *((void *)v13 + 4) == *((void *)v10 + 4);
      if (!v17 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      sub_10001CB90();
      sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v18 = sub_10001CE30();
      a4 = v21;
      if ((v18 & 1) == 0) {
        break;
      }
      sub_10001C4B0((uint64_t)v10, v21);
      sub_10001C4B0((uint64_t)v13, a4);
      v15 += v20;
      if (!--v14) {
        return 1;
      }
    }
    sub_10001C4B0((uint64_t)v10, a4);
    sub_10001C4B0((uint64_t)v13, a4);
  }
  return 0;
}

uint64_t sub_100015414(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v19 = a3(0);
  uint64_t v7 = __chkstk_darwin(v19);
  uint64_t v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  uint64_t v12 = (uint64_t *)((char *)&v18 - v11);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == *(void *)(a2 + 16))
  {
    if (!v13 || a1 == a2) {
      return 1;
    }
    unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v18 = *(void *)(v10 + 72);
    while (1)
    {
      sub_10001C448(a1 + v14, (uint64_t)v12, a4);
      sub_10001C448(a2 + v14, (uint64_t)v9, a4);
      BOOL v15 = *v12 == *v9 && v12[1] == v9[1];
      if (!v15 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      BOOL v16 = v12[2] == v9[2] && v12[3] == v9[3];
      if (!v16 && (sub_10001CFA0() & 1) == 0) {
        break;
      }
      sub_10001CB90();
      sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      if ((sub_10001CE30() & 1) == 0) {
        break;
      }
      sub_10001C4B0((uint64_t)v9, a4);
      sub_10001C4B0((uint64_t)v12, a4);
      v14 += v18;
      if (!--v13) {
        return 1;
      }
    }
    sub_10001C4B0((uint64_t)v9, a4);
    sub_10001C4B0((uint64_t)v12, a4);
  }
  return 0;
}

uint64_t _s18AccessoryDataFetch25SerialNumberMappingResultV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v21 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    int v13 = *(unsigned __int8 *)(a1 + 32);
    int v14 = *(unsigned __int8 *)(a2 + 32);
    if (v13 == 255)
    {
      if (v14 == 255)
      {
LABEL_8:
        uint64_t v15 = type metadata accessor for SerialNumberMappingResult(0);
        BOOL v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v16(v10, a1 + *(int *)(v15 + 24), v4);
        v16(v8, a2 + *(int *)(v15 + 24), v4);
        sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        char v12 = sub_10001CE30();
        BOOL v17 = *(void (**)(char *, uint64_t))(v5 + 8);
        v17(v8, v4);
        v17(v10, v4);
        return v12 & 1;
      }
LABEL_10:
      char v12 = 0;
      return v12 & 1;
    }
    if (v14 == 255) {
      goto LABEL_10;
    }
    uint64_t v19 = *(void *)(a1 + 16);
    uint64_t v20 = *(void *)(a2 + 16);
    if (v13)
    {
      char v12 = 0;
      if ((v14 & 1) != 0 && v19 == v20) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v14) {
        goto LABEL_10;
      }
      if (v19 == v20 && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
        goto LABEL_8;
      }
      char v12 = 0;
      if (sub_10001CFA0()) {
        goto LABEL_8;
      }
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch13GetSNResponseV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (*(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      goto LABEL_12;
    }
    if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
    {
      if (sub_100014E30(*(void *)(a1 + 40), *(void *)(a2 + 40)))
      {
        SNuint64_t Response = type metadata accessor for GetSNResponse(0);
        int v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v14(v10, a1 + *(int *)(SNResponse + 32), v4);
        v14(v8, a2 + *(int *)(SNResponse + 32), v4);
        sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        char v12 = sub_10001CE30();
        uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
        v15(v8, v4);
        v15(v10, v4);
        return v12 & 1;
      }
LABEL_12:
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch12PutSNRequestV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v43 = (char *)&v41 - v7;
  uint64_t v8 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v42 = (uint64_t *)((char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100005838(&qword_100029CB8);
  __chkstk_darwin(v11);
  int v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005838(&qword_100029170);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (uint64_t *)((char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v41 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v41 - v21;
  if (*a1 == *a2 && a1[1] == a2[1] || (char v23 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3] || (char v23 = 0, (sub_10001CFA0() & 1) != 0))
    {
      uint64_t v24 = type metadata accessor for PutSNRequest(0);
      sub_10000E2F8((uint64_t)a1 + *(int *)(v24 + 28), (uint64_t)v22);
      uint64_t v41 = v24;
      sub_10000E2F8((uint64_t)a2 + *(int *)(v24 + 28), (uint64_t)v20);
      uint64_t v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
      sub_10000E2F8((uint64_t)v22, (uint64_t)v13);
      sub_10000E2F8((uint64_t)v20, v25);
      os_log_type_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      if (v26((uint64_t)v13, 1, v8) == 1)
      {
        sub_10000747C((uint64_t)v20, &qword_100029170);
        sub_10000747C((uint64_t)v22, &qword_100029170);
        if (v26(v25, 1, v8) == 1)
        {
          sub_10000747C((uint64_t)v13, &qword_100029170);
LABEL_21:
          uint64_t v31 = v41;
          os_log_type_t v32 = (char *)a1 + *(int *)(v41 + 24);
          uint64_t v34 = v45;
          uint64_t v33 = v46;
          uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
          double v36 = v43;
          v35(v43, v32, v46);
          os_log_type_t v37 = (char *)a2 + *(int *)(v31 + 24);
          uint64_t v38 = v44;
          v35(v44, v37, v33);
          sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v23 = sub_10001CE30();
          uint64_t v39 = *(void (**)(char *, uint64_t))(v34 + 8);
          v39(v38, v33);
          v39(v36, v33);
          return v23 & 1;
        }
      }
      else
      {
        sub_10000E2F8((uint64_t)v13, (uint64_t)v17);
        if (v26(v25, 1, v8) != 1)
        {
          uint64_t v29 = v42;
          sub_1000074D8(v25, (uint64_t)v42);
          if (*v17 == *v29 && v17[1] == v29[1] || (sub_10001CFA0())
            && (v17[2] == v29[2] && v17[3] == v29[3] || (sub_10001CFA0() & 1) != 0))
          {
            sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
            char v30 = sub_10001CE30();
            sub_10001C4B0((uint64_t)v29, type metadata accessor for SerialNumberMapping);
            sub_10000747C((uint64_t)v20, &qword_100029170);
            sub_10000747C((uint64_t)v22, &qword_100029170);
            sub_10001C4B0((uint64_t)v17, type metadata accessor for SerialNumberMapping);
            sub_10000747C((uint64_t)v13, &qword_100029170);
            if ((v30 & 1) == 0)
            {
              char v23 = 0;
              return v23 & 1;
            }
            goto LABEL_21;
          }
          sub_10001C4B0((uint64_t)v29, type metadata accessor for SerialNumberMapping);
          sub_10000747C((uint64_t)v20, &qword_100029170);
          sub_10000747C((uint64_t)v22, &qword_100029170);
          sub_10001C4B0((uint64_t)v17, type metadata accessor for SerialNumberMapping);
          uint64_t v28 = (uint64_t)v13;
          uint64_t v27 = &qword_100029170;
          goto LABEL_13;
        }
        sub_10000747C((uint64_t)v20, &qword_100029170);
        sub_10000747C((uint64_t)v22, &qword_100029170);
        sub_10001C4B0((uint64_t)v17, type metadata accessor for SerialNumberMapping);
      }
      uint64_t v27 = &qword_100029CB8;
      uint64_t v28 = (uint64_t)v13;
LABEL_13:
      sub_10000747C(v28, v27);
      char v23 = 0;
    }
  }
  return v23 & 1;
}

uint64_t _s18AccessoryDataFetch12GetSNRequestV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (sub_1000150F0(*(void **)(a1 + 16), *(void **)(a2 + 16)))
    {
      SNuint64_t Request = type metadata accessor for GetSNRequest(0);
      uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v14(v10, a1 + *(int *)(SNRequest + 24), v4);
      v14(v8, a2 + *(int *)(SNRequest + 24), v4);
      sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v12 = sub_10001CE30();
      uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      v15(v8, v4);
      v15(v10, v4);
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch11PutResponseV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (*(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      goto LABEL_13;
    }
    if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
    {
      if (sub_1000151B8(*(void *)(a1 + 40), *(void *)(a2 + 40), type metadata accessor for CalDataStatus, type metadata accessor for CalDataStatus) & 1) != 0&& (sub_1000151B8(*(void *)(a1 + 48), *(void *)(a2 + 48), type metadata accessor for PubkeyEncDataStatus, type metadata accessor for PubkeyEncDataStatus))
      {
        uint64_t v13 = type metadata accessor for PutResponse(0);
        uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v14(v10, a1 + *(int *)(v13 + 36), v4);
        v14(v8, a2 + *(int *)(v13 + 36), v4);
        sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        char v12 = sub_10001CE30();
        uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
        v15(v8, v4);
        v15(v10, v4);
        return v12 & 1;
      }
LABEL_13:
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch11GetResponseV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (*(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
    {
      if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
        || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
      {
        if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48)
          || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
        {
          uint64_t Response = type metadata accessor for GetResponse(0);
          uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
          v14(v10, a1 + *(int *)(Response + 32), v4);
          v14(v8, a2 + *(int *)(Response + 32), v4);
          sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v12 = sub_10001CE30();
          uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
          v15(v8, v4);
          v15(v10, v4);
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch10PutRequestV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4) && *((void *)a1 + 5) == *((void *)a2 + 5)
        || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
      {
        if (sub_100015414(*((void *)a1 + 6), *((void *)a2 + 6), type metadata accessor for CalDataEntry, type metadata accessor for CalDataEntry) & 1) != 0&& (sub_100015414(*((void *)a1 + 7), *((void *)a2 + 7), type metadata accessor for PubkeyEncryptedData, type metadata accessor for PubkeyEncryptedData))
        {
          uint64_t v14 = type metadata accessor for PutRequest(0);
          uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v15(v10, &a1[*(int *)(v14 + 36)], v4);
          v15(v8, &a2[*(int *)(v14 + 36)], v4);
          sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v12 = sub_10001CE30();
          uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
          v16(v8, v4);
          v16(v10, v4);
        }
        else
        {
          char v12 = 0;
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t _s18AccessoryDataFetch10GetRequestV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_10001CB90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4) && *((void *)a1 + 5) == *((void *)a2 + 5)
        || (char v12 = 0, (sub_10001CFA0() & 1) != 0))
      {
        uint64_t Request = type metadata accessor for GetRequest(0);
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
        v15(v10, &a1[*(int *)(Request + 28)], v4);
        v15(v8, &a2[*(int *)(Request + 28)], v4);
        sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        char v12 = sub_10001CE30();
        uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
        v16(v8, v4);
        v16(v10, v4);
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_100016BC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_10001CB90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v12 = (char *)&v19 - v11;
  BOOL v13 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v13 || (char v14 = 0, (sub_10001CFA0() & 1) != 0))
  {
    if (*(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
    {
      if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
        || (char v14 = 0, (sub_10001CFA0() & 1) != 0))
      {
        uint64_t v15 = a3(0);
        uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
        v16(v12, a1 + *(int *)(v15 + 28), v6);
        v16(v10, a2 + *(int *)(v15 + 28), v6);
        sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        char v14 = sub_10001CE30();
        uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
        v17(v10, v6);
        v17(v12, v6);
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14 & 1;
}

uint64_t sub_100016DCC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016E14(char *a1, char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_10001CB90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v12 = (char *)&v20 - v11;
  BOOL v13 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v13 || (char v14 = 0, (sub_10001CFA0() & 1) != 0))
  {
    BOOL v15 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v15 || (char v14 = 0, (sub_10001CFA0() & 1) != 0))
    {
      uint64_t v16 = a3(0);
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      v17(v12, &a1[*(int *)(v16 + 24)], v6);
      v17(v10, &a2[*(int *)(v16 + 24)], v6);
      sub_100016DCC(&qword_100029CA0, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v14 = sub_10001CE30();
      uint64_t v18 = *(void (**)(char *, uint64_t))(v7 + 8);
      v18(v10, v6);
      v18(v12, v6);
    }
  }
  return v14 & 1;
}

uint64_t sub_100017004()
{
  return sub_100016DCC(&qword_1000292B0, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
}

uint64_t sub_10001704C()
{
  return sub_100016DCC(&qword_100029238, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
}

uint64_t sub_100017094()
{
  return sub_100016DCC(&qword_100029218, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
}

uint64_t sub_1000170DC()
{
  return sub_100016DCC(&qword_1000292B8, (void (*)(uint64_t))type metadata accessor for CalDataEntry);
}

uint64_t sub_100017124()
{
  return sub_100016DCC(&qword_1000292C0, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_10001716C()
{
  return sub_100016DCC(&qword_1000292C8, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_1000171B4()
{
  return sub_100016DCC(&qword_100029220, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_1000171FC()
{
  return sub_100016DCC(&qword_1000292D0, (void (*)(uint64_t))type metadata accessor for SerialNumberMapping);
}

uint64_t sub_100017244()
{
  return sub_100016DCC(&qword_1000292D8, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
}

uint64_t sub_10001728C()
{
  return sub_100016DCC(&qword_1000292A0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
}

uint64_t sub_1000172D4()
{
  return sub_100016DCC(&qword_100029228, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
}

uint64_t sub_10001731C()
{
  return sub_100016DCC(&qword_1000292E0, (void (*)(uint64_t))type metadata accessor for SerialNumberMappingResult);
}

uint64_t sub_100017364()
{
  return sub_100016DCC(&qword_1000292E8, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
}

uint64_t sub_1000173AC()
{
  return sub_100016DCC(&qword_100029240, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
}

uint64_t sub_1000173F4()
{
  return sub_100016DCC(&qword_100029230, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
}

uint64_t sub_10001743C()
{
  return sub_100016DCC(&qword_1000292F0, (void (*)(uint64_t))type metadata accessor for PubkeyEncryptedData);
}

uint64_t sub_100017484()
{
  return sub_100016DCC(&qword_1000292F8, (void (*)(uint64_t))type metadata accessor for PutRequest);
}

uint64_t sub_1000174CC()
{
  return sub_100016DCC(&qword_100028F50, (void (*)(uint64_t))type metadata accessor for PutRequest);
}

uint64_t sub_100017514()
{
  return sub_100016DCC(&qword_100029248, (void (*)(uint64_t))type metadata accessor for PutRequest);
}

uint64_t sub_10001755C()
{
  return sub_100016DCC(&qword_100029300, (void (*)(uint64_t))type metadata accessor for PutRequest);
}

uint64_t sub_1000175A4()
{
  return sub_100016DCC(&qword_100029308, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
}

uint64_t sub_1000175EC()
{
  return sub_100016DCC(&qword_100029260, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
}

uint64_t sub_100017634()
{
  return sub_100016DCC(&qword_100029250, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
}

uint64_t sub_10001767C()
{
  return sub_100016DCC(&qword_100029310, (void (*)(uint64_t))type metadata accessor for CalDataStatus);
}

uint64_t sub_1000176C4()
{
  return sub_100016DCC(&qword_100029318, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_10001770C()
{
  return sub_100016DCC(&qword_100029268, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_100017754()
{
  return sub_100016DCC(&qword_100029258, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_10001779C()
{
  return sub_100016DCC(&qword_100029320, (void (*)(uint64_t))type metadata accessor for PubkeyEncDataStatus);
}

uint64_t sub_1000177E4()
{
  return sub_100016DCC(&qword_100029328, (void (*)(uint64_t))type metadata accessor for PutResponse);
}

uint64_t sub_10001782C()
{
  return sub_100016DCC(&qword_100029330, (void (*)(uint64_t))type metadata accessor for PutResponse);
}

uint64_t sub_100017874()
{
  return sub_100016DCC(&qword_100029270, (void (*)(uint64_t))type metadata accessor for PutResponse);
}

uint64_t sub_1000178BC()
{
  return sub_100016DCC(&qword_100029338, (void (*)(uint64_t))type metadata accessor for PutResponse);
}

uint64_t sub_100017904()
{
  return sub_100016DCC(&qword_100029340, (void (*)(uint64_t))type metadata accessor for GetRequest);
}

uint64_t sub_10001794C()
{
  return sub_100016DCC(&qword_100028F58, (void (*)(uint64_t))type metadata accessor for GetRequest);
}

uint64_t sub_100017994()
{
  return sub_100016DCC(&qword_100029278, (void (*)(uint64_t))type metadata accessor for GetRequest);
}

uint64_t sub_1000179DC()
{
  return sub_100016DCC(&qword_100029348, (void (*)(uint64_t))type metadata accessor for GetRequest);
}

uint64_t sub_100017A24()
{
  return sub_100016DCC(&qword_100029350, (void (*)(uint64_t))type metadata accessor for GetResponse);
}

uint64_t sub_100017A6C()
{
  return sub_100016DCC(&qword_100029358, (void (*)(uint64_t))type metadata accessor for GetResponse);
}

uint64_t sub_100017AB4()
{
  return sub_100016DCC(&qword_100029280, (void (*)(uint64_t))type metadata accessor for GetResponse);
}

uint64_t sub_100017AFC()
{
  return sub_100016DCC(&qword_100029360, (void (*)(uint64_t))type metadata accessor for GetResponse);
}

uint64_t sub_100017B44()
{
  return sub_100016DCC(&qword_100029368, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
}

uint64_t sub_100017B8C()
{
  return sub_100016DCC(&qword_100028F60, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
}

uint64_t sub_100017BD4()
{
  return sub_100016DCC(&qword_100029288, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
}

uint64_t sub_100017C1C()
{
  return sub_100016DCC(&qword_100029370, (void (*)(uint64_t))type metadata accessor for PutSNRequest);
}

uint64_t sub_100017C64()
{
  return sub_100016DCC(&qword_100029378, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
}

uint64_t sub_100017CAC()
{
  return sub_100016DCC(&qword_100029380, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
}

uint64_t sub_100017CF4()
{
  return sub_100016DCC(&qword_100029290, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
}

uint64_t sub_100017D3C()
{
  return sub_100016DCC(&qword_100029388, (void (*)(uint64_t))type metadata accessor for PutSNResponse);
}

uint64_t sub_100017D84()
{
  return sub_100016DCC(&qword_100029390, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
}

uint64_t sub_100017DCC()
{
  return sub_100016DCC(&qword_100028F68, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
}

uint64_t sub_100017E14()
{
  return sub_100016DCC(&qword_100029298, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
}

uint64_t sub_100017E5C()
{
  return sub_100016DCC(&qword_100029398, (void (*)(uint64_t))type metadata accessor for GetSNRequest);
}

uint64_t sub_100017EA4()
{
  return sub_100016DCC(&qword_1000293A0, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
}

uint64_t sub_100017EEC()
{
  return sub_100016DCC(&qword_1000293A8, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
}

uint64_t sub_100017F34()
{
  return sub_100016DCC(&qword_1000292A8, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
}

uint64_t sub_100017F7C()
{
  return sub_100016DCC(&qword_1000293B0, (void (*)(uint64_t))type metadata accessor for GetSNResponse);
}

uint64_t getEnumTagSinglePayload for CalDataEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017FF0);
}

uint64_t storeEnumTagSinglePayload for CalDataEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018008);
}

uint64_t sub_10001800C()
{
  return sub_10001BCE4();
}

uint64_t getEnumTagSinglePayload for SerialNumberMapping(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001802C);
}

uint64_t storeEnumTagSinglePayload for SerialNumberMapping(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018044);
}

uint64_t initializeBufferWithCopyOfBuffer for SerialNumberMappingResult(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    int v8 = *((unsigned __int8 *)a2 + 32);
    swift_bridgeObjectRetain();
    if (v8 == 255)
    {
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    }
    else
    {
      char v10 = v8 & 1;
      uint64_t v11 = a2[2];
      uint64_t v12 = a2[3];
      sub_10000D240(v11, v12, v10);
      *(void *)(a1 + 16) = v11;
      *(void *)(a1 + 24) = v12;
      *(unsigned char *)(a1 + 32) = v10;
    }
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_10001CB90();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for SerialNumberMappingResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 != 255) {
    sub_10000D2AC(*(void *)(a1 + 16), *(void *)(a1 + 24), v4 & 1);
  }
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_10001CB90();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  int v7 = *(unsigned __int8 *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v7 == 255)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  else
  {
    char v8 = v7 & 1;
    uint64_t v9 = *(void *)(a2 + 16);
    uint64_t v10 = *(void *)(a2 + 24);
    sub_10000D240(v9, v10, v8);
    *(void *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v10;
    *(unsigned char *)(a1 + 32) = v8;
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (long long *)(a1 + 16);
  int v7 = (long long *)(a2 + 16);
  int v8 = *(unsigned __int8 *)(a2 + 32);
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    if (v8 == 255)
    {
      long long v10 = *v7;
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *uint64_t v6 = v10;
    }
    else
    {
      char v17 = v8 & 1;
      uint64_t v18 = *(void *)(a2 + 16);
      uint64_t v19 = *(void *)(a2 + 24);
      sub_10000D240(v18, v19, v8 & 1);
      *(void *)(a1 + 16) = v18;
      *(void *)(a1 + 24) = v19;
      *(unsigned char *)(a1 + 32) = v17;
    }
  }
  else if (v8 == 255)
  {
    sub_100018424(a1 + 16);
    char v9 = *(unsigned char *)(a2 + 32);
    *uint64_t v6 = *v7;
    *(unsigned char *)(a1 + 32) = v9;
  }
  else
  {
    char v11 = v8 & 1;
    uint64_t v12 = *(void *)(a2 + 16);
    uint64_t v13 = *(void *)(a2 + 24);
    sub_10000D240(v12, v13, v8 & 1);
    uint64_t v14 = *(void *)(a1 + 16);
    uint64_t v15 = *(void *)(a1 + 24);
    char v16 = *(unsigned char *)(a1 + 32);
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v13;
    *(unsigned char *)(a1 + 32) = v11;
    sub_10000D2AC(v14, v15, v16);
  }
  uint64_t v20 = *(int *)(a3 + 24);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t sub_100018424(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (_OWORD *)(a2 + 16);
  int v8 = *(unsigned __int8 *)(a1 + 32);
  if (v8 != 255)
  {
    int v9 = *(unsigned __int8 *)(a2 + 32);
    if (v9 != 255)
    {
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      *(_OWORD *)(a1 + 16) = *v7;
      *(unsigned char *)(a1 + 32) = v9 & 1;
      sub_10000D2AC(v10, v11, v8 & 1);
      goto LABEL_6;
    }
    sub_100018424(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
LABEL_6:
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000185DC);
}

uint64_t storeEnumTagSinglePayload for SerialNumberMappingResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000185F4);
}

uint64_t sub_1000185F8()
{
  return sub_10001BCE4();
}

uint64_t destroy for SerialNumberMappingResult.OneOf_Result(uint64_t a1)
{
  return sub_10000D2AC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s18AccessoryDataFetch25SerialNumberMappingResultV12OneOf_ResultOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000D240(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SerialNumberMappingResult.OneOf_Result(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000D240(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000D2AC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for SerialNumberMappingResult.OneOf_Result(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SerialNumberMappingResult.OneOf_Result(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000D2AC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SerialNumberMappingResult.OneOf_Result(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SerialNumberMappingResult.OneOf_Result(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000187A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000187AC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SerialNumberMappingResult.OneOf_Result()
{
  return &type metadata for SerialNumberMappingResult.OneOf_Result;
}

uint64_t *_s18AccessoryDataFetch12CalDataEntryVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    char v8 = (char *)a1 + v7;
    int v9 = (char *)a2 + v7;
    uint64_t v10 = sub_10001CB90();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t _s18AccessoryDataFetch12CalDataEntryVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *_s18AccessoryDataFetch12CalDataEntryVwcp_0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  char v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *_s18AccessoryDataFetch12CalDataEntryVwca_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  char v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *_s18AccessoryDataFetch12CalDataEntryVwtk_0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *_s18AccessoryDataFetch12CalDataEntryVwta_0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PubkeyEncryptedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018BD0);
}

uint64_t storeEnumTagSinglePayload for PubkeyEncryptedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018BE8);
}

uint64_t *initializeBufferWithCopyOfBuffer for PutRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v15 = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v11 = sub_10001CB90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v15, v10, v11);
  }
  return v3;
}

uint64_t destroy for PutRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for PutRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v13 = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v10 = sub_10001CB90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v13, v9, v10);
  return a1;
}

void *assignWithCopy for PutRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for PutRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

void *assignWithTake for PutRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for PutRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001910C);
}

uint64_t storeEnumTagSinglePayload for PutRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019124);
}

uint64_t sub_100019128()
{
  return sub_100019820();
}

uint64_t getEnumTagSinglePayload for CalDataStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019160);
}

uint64_t storeEnumTagSinglePayload for CalDataStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019178);
}

uint64_t sub_10001917C()
{
  return sub_10001B6BC();
}

uint64_t getEnumTagSinglePayload for PubkeyEncDataStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000191A0);
}

uint64_t storeEnumTagSinglePayload for PubkeyEncDataStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000191B8);
}

void *initializeBufferWithCopyOfBuffer for PutResponse(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v7 = a2[6];
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v11 = sub_10001CB90();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t destroy for PutResponse(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v10 = sub_10001CB90();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001969C);
}

uint64_t sub_1000196A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PutResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019764);
}

uint64_t sub_100019768(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001CB90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100019810()
{
  return sub_100019820();
}

uint64_t sub_100019820()
{
  uint64_t result = sub_10001CB90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GetRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_10001CB90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for GetRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for GetRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_10001CB90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for GetRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for GetRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for GetRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019D44);
}

uint64_t storeEnumTagSinglePayload for GetRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019D5C);
}

uint64_t sub_100019D60()
{
  return sub_10001B6BC();
}

void *initializeBufferWithCopyOfBuffer for GetResponse(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v7 = a2[6];
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (uint64_t)a2 + v8;
    uint64_t v10 = a1 + v8;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v11 = sub_10001CB90();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for GetResponse(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v10 = sub_10001CB90();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

uint64_t assignWithCopy for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A214);
}

uint64_t storeEnumTagSinglePayload for GetResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A22C);
}

uint64_t sub_10001A230()
{
  return sub_10001C3A0();
}

uint64_t *initializeBufferWithCopyOfBuffer for PutSNRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10001CB90();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 28);
    uint64_t v15 = (uint64_t *)((char *)v4 + v14);
    char v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = type metadata accessor for SerialNumberMapping(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_100005838(&qword_100029170);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v21 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v21;
      uint64_t v22 = v16[3];
      v15[2] = v16[2];
      v15[3] = v22;
      uint64_t v23 = *(int *)(v17 + 24);
      uint64_t v24 = (char *)v15 + v23;
      uint64_t v25 = (char *)v16 + v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13(v24, v25, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t destroy for PutSNRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10001CB90();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for SerialNumberMapping(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *initializeWithCopy for PutSNRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10001CB90();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_100005838(&qword_100029170);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v19;
    uint64_t v20 = v15[3];
    v14[2] = v15[2];
    v14[3] = v20;
    uint64_t v21 = *(int *)(v16 + 24);
    uint64_t v22 = (char *)v14 + v21;
    uint64_t v23 = (char *)v15 + v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v22, v23, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

void *assignWithCopy for PutSNRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  uint64_t v10 = *(void (**)(char *, char *))(v24 + 24);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12[2] = v13[2];
      uint64_t v12[3] = v13[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v10)((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v25);
      return a1;
    }
    sub_10001C4B0((uint64_t)v12, type metadata accessor for SerialNumberMapping);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v22 = sub_100005838(&qword_100029170);
    memcpy(v12, v13, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  v12[2] = v13[2];
  uint64_t v12[3] = v13[3];
  uint64_t v18 = *(int *)(v14 + 24);
  uint64_t v19 = (char *)v12 + v18;
  uint64_t v20 = (char *)v13 + v18;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21(v19, v20, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

_OWORD *initializeWithTake for PutSNRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10001CB90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (_OWORD *)((char *)a1 + v12);
  uint64_t v14 = (_OWORD *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_100005838(&qword_100029170);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    long long v18 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v18;
    v11((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

void *assignWithTake for PutSNRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10001CB90();
  uint64_t v25 = *(void *)(v11 - 8);
  uint64_t v26 = v11;
  uint64_t v12 = *(void (**)(char *, char *))(v25 + 40);
  v12(v9, v10);
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for SerialNumberMapping(0);
  uint64_t v17 = *(void *)(v16 - 8);
  long long v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      uint64_t v23 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v23;
      swift_bridgeObjectRelease();
      uint64_t v24 = v15[3];
      v14[2] = v15[2];
      v14[3] = v24;
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v12)((char *)v14 + *(int *)(v16 + 24), (char *)v15 + *(int *)(v16 + 24), v26);
      return a1;
    }
    sub_10001C4B0((uint64_t)v14, type metadata accessor for SerialNumberMapping);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v21 = sub_100005838(&qword_100029170);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  long long v20 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v20;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))((char *)v14 + *(int *)(v16 + 24), (char *)v15 + *(int *)(v16 + 24), v26);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PutSNRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001AD70);
}

uint64_t sub_10001AD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005838(&qword_100029170);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for PutSNRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001AEB4);
}

uint64_t sub_10001AEB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005838(&qword_100029170);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_10001AFE4()
{
  sub_10001CB90();
  if (v0 <= 0x3F)
  {
    sub_10001B0B8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10001B0B8()
{
  if (!qword_100029A28)
  {
    type metadata accessor for SerialNumberMapping(255);
    unint64_t v0 = sub_10001CF00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100029A28);
    }
  }
}

void *_s18AccessoryDataFetch13CalDataStatusVwCP_0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v6 = a2[4];
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v10 = sub_10001CB90();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t _s18AccessoryDataFetch13CalDataStatusVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t _s18AccessoryDataFetch13CalDataStatusVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10001CB90();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t _s18AccessoryDataFetch13CalDataStatusVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t _s18AccessoryDataFetch13CalDataStatusVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t _s18AccessoryDataFetch13CalDataStatusVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PutSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B548);
}

uint64_t sub_10001B54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PutSNResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B610);
}

uint64_t sub_10001B614(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001CB90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001B6BC()
{
  uint64_t result = sub_10001CB90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GetSNRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_10001CB90();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for GetSNRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for GetSNRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10001CB90();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for GetSNRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for GetSNRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for GetSNRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10001CB90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetSNRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001BB60);
}

uint64_t sub_10001BB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GetSNRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001BC28);
}

uint64_t sub_10001BC2C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001CB90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001BCD4()
{
  return sub_10001BCE4();
}

uint64_t sub_10001BCE4()
{
  uint64_t result = sub_10001CB90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for GetSNResponse(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(void *)(a1 + 40) = a2[5];
    uint64_t v10 = sub_10001CB90();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for GetSNResponse(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_10001CB90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v9 = sub_10001CB90();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10001CB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001C21C);
}

uint64_t sub_10001C220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10001CB90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GetSNResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001C2E4);
}

uint64_t sub_10001C2E8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001CB90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001C390()
{
  return sub_10001C3A0();
}

uint64_t sub_10001C3A0()
{
  uint64_t result = sub_10001CB90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10001C448(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001C4B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10001C510(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_10001C5AC()
{
  sub_100004CA8();
  sub_100004C6C((void *)&_mh_execute_header, v0, v1, "started to run scrypt", v2, v3, v4, v5, v6);
}

void sub_10001C5E0()
{
  sub_100004C44(__stack_chk_guard);
  sub_100004C1C();
  sub_100004BF4((void *)&_mh_execute_header, v0, v1, "failed with %@", v2, v3, v4, v5, v6);
}

void sub_10001C648()
{
  sub_100004CA8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "CloudKit is not supported on this platform.", v1, 2u);
}

void sub_10001C688()
{
  sub_100004C44(__stack_chk_guard);
  sub_100004C1C();
  sub_100004BF4((void *)&_mh_execute_header, v0, v1, "deriveRecIdEncryptKey failed with %@", v2, v3, v4, v5, v6);
}

void sub_10001C6F4()
{
  sub_100004C50();
  sub_100004C88((void *)&_mh_execute_header, v0, v1, "scrypt succeeded, recId=%@ retryServerEnvironment=%u");
}

void sub_10001C75C()
{
  sub_100004CA8();
  sub_100004C6C((void *)&_mh_execute_header, v0, v1, "dispatch scrypt", v2, v3, v4, v5, v6);
}

void sub_10001C790()
{
  sub_100004C10();
  sub_100004BF4((void *)&_mh_execute_header, v0, v1, "failed with %@", v2, v3, v4, v5, v6);
}

void sub_10001C7F8()
{
  sub_100004C10();
  sub_100004C28((void *)&_mh_execute_header, v0, v1, "decrypt succeeded: dataLen=%zu", v2, v3, v4, v5, v6);
}

void sub_10001C860()
{
  sub_100004C1C();
  sub_100004C28((void *)&_mh_execute_header, v0, v1, "retry fetch with dev server recId=%@", v2, v3, v4, v5, v6);
}

void sub_10001C8CC()
{
  sub_100004CA8();
  sub_100004C6C((void *)&_mh_execute_header, v0, v1, "decompress succeeded", v2, v3, v4, v5, v6);
}

void sub_10001C900(unsigned __int8 *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "begin uncompression origLen=%u type=%u", (uint8_t *)v4, 0xEu);
}

void sub_10001C98C()
{
  sub_100004C50();
  sub_100004C88((void *)&_mh_execute_header, v0, v1, "record keyhash=%@ retryServerEnvironment=%u");
}

void sub_10001C9F4()
{
  sub_100004C1C();
  sub_100004C28((void *)&_mh_execute_header, v0, v1, "retry fetch with dev server keyhash=%@", v2, v3, v4, v5, v6);
}

uint64_t sub_10001CA60()
{
  return PersonNameComponents.givenName.getter();
}

uint64_t sub_10001CA70()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001CA80()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_10001CAD0()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_10001CAF0()
{
  return _BridgedStoredNSError.userInfo.getter();
}

uint64_t sub_10001CB00()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t sub_10001CB10()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001CB20()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10001CB30()
{
  return UUID.init()();
}

uint64_t sub_10001CB40()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001CB50()
{
  return dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter();
}

uint64_t sub_10001CB60()
{
  return CKCodeOperation.init(functionName:request:)();
}

uint64_t sub_10001CB70()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t _s18AccessoryDataFetch25SerialNumberMappingResultV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return UnknownStorage.init()();
}

uint64_t sub_10001CB90()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t sub_10001CBA0()
{
  return _MessageImplementationBase._protobuf_generated_isEqualTo(other:)();
}

uint64_t sub_10001CBC0()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t sub_10001CBD0()
{
  return dispatch thunk of Decoder.handleConflictingOneOf()();
}

uint64_t sub_10001CBE0()
{
  return dispatch thunk of Decoder.decodeSingularInt32Field(value:)();
}

uint64_t sub_10001CBF0()
{
  return dispatch thunk of Decoder.decodeSingularInt32Field(value:)();
}

uint64_t sub_10001CC00()
{
  return dispatch thunk of Decoder.decodeRepeatedStringField(value:)();
}

uint64_t sub_10001CC10()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t sub_10001CC20()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t sub_10001CC30()
{
  return dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
}

uint64_t sub_10001CC40()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t sub_10001CC50()
{
  return Message.isInitialized.getter();
}

uint64_t sub_10001CC70()
{
  return Message.hash(into:)();
}

uint64_t sub_10001CC80()
{
  return static Message.with(_:)();
}

uint64_t sub_10001CC90()
{
  return dispatch thunk of Visitor.visitSingularInt32Field(value:fieldNumber:)();
}

uint64_t sub_10001CCA0()
{
  return dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)();
}

uint64_t sub_10001CCB0()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t sub_10001CCC0()
{
  return dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)();
}

uint64_t sub_10001CCD0()
{
  return dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
}

uint64_t sub_10001CCE0()
{
  return type metadata accessor for _NameMap.NameDescription();
}

uint64_t sub_10001CCF0()
{
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10001CD00()
{
  return type metadata accessor for _NameMap();
}

uint64_t sub_10001CD10()
{
  return type metadata accessor for NWInterface();
}

uint64_t sub_10001CD20()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t sub_10001CD30()
{
  return NWPathMonitor.start(queue:)();
}

void sub_10001CD40()
{
}

uint64_t sub_10001CD50()
{
  return NWPathMonitor.init()();
}

uint64_t sub_10001CD60()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t sub_10001CD70()
{
  return NWPath.availableInterfaces.getter();
}

uint64_t sub_10001CD80()
{
  return type metadata accessor for NWPath();
}

uint64_t sub_10001CD90()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001CDA0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_10001CDB0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001CDC0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001CDD0()
{
  return static DispatchTime.now()();
}

uint64_t sub_10001CDE0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10001CDF0()
{
  return + infix(_:_:)();
}

uint64_t sub_10001CE00()
{
  return related decl 'e' for CKErrorCode.retryAfterSeconds.getter();
}

uint64_t sub_10001CE10()
{
  return Dictionary.description.getter();
}

uint64_t sub_10001CE20()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10001CE30()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10001CE40()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001CE50()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_10001CE60(Swift::String a1)
{
}

Swift::Int sub_10001CE70()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001CE80()
{
  return Array.description.getter();
}

uint64_t sub_10001CE90()
{
  return CKCodeService.add<A, B>(_:)();
}

uint64_t sub_10001CEA0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001CEB0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10001CEC0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10001CED0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_10001CEE0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_10001CEF0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10001CF00()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001CF10()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001CF20()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001CF30()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001CF40()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001CF50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001CF60()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10001CF70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001CF80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001CF90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10001CFA0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001CFD0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10001CFE0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10001CFF0()
{
  return Hasher.init(_seed:)();
}

void sub_10001D000(Swift::UInt a1)
{
}

void sub_10001D010(Swift::UInt32 a1)
{
}

Swift::Int sub_10001D020()
{
  return Hasher._finalize()();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t cc_clear()
{
  return _cc_clear();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return _ccaes_gcm_decrypt_mode();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccec_cp_384()
{
  return _ccec_cp_384();
}

uint64_t ccec_x963_import_priv()
{
  return _ccec_x963_import_priv();
}

uint64_t ccecies_decrypt_gcm()
{
  return _ccecies_decrypt_gcm();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return _ccecies_decrypt_gcm_plaintext_size();
}

uint64_t ccecies_decrypt_gcm_setup()
{
  return _ccecies_decrypt_gcm_setup();
}

uint64_t ccgcm_one_shot()
{
  return _ccgcm_one_shot();
}

uint64_t ccscrypt()
{
  return _ccscrypt();
}

uint64_t ccscrypt_storage_size()
{
  return _ccscrypt_storage_size();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

uint64_t ccsha384_di()
{
  return _ccsha384_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_aa_firstName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_firstName");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_deriveRecIdEncryptKey_derivedOut_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deriveRecIdEncryptKey:derivedOut:error:");
}

id objc_msgSend_deriveWithScript_outputLen_outbuffer_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deriveWithScript:outputLen:outbuffer:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fetchCalDataWithRecId_keyhash_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCalDataWithRecId:keyhash:completion:");
}

id objc_msgSend_fetchDataByACCFromServer_recordId_id_key_holder_retryServerEnvironment_options_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDataByACCFromServer:recordId:id_key_holder:retryServerEnvironment:options:withReply:");
}

id objc_msgSend_fetchDataByFullKeyFromServer_keyhash_fullKey_pubkeyLen_retryServerEnvironment_options_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDataByFullKeyFromServer:keyhash:fullKey:pubkeyLen:retryServerEnvironment:options:withReply:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithEnv_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnv:version:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serverConnectionWithOptions_defaultEnvironment_hasEnvironmentOption_serverConnection_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverConnectionWithOptions:defaultEnvironment:hasEnvironmentOption:serverConnection:error:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}