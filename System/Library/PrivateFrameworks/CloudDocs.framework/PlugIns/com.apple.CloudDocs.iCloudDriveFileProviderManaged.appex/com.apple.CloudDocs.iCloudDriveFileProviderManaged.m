void sub_100004D20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000050A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000050E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    v7 = "-[ICDFileProviderClientSideCollaborationServiceProxy calculateCollaborationVersionForContents:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000051FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    id v7 = [objc_alloc((Class)ICDCollaborationVersion) initWithCollaborationSignature:v5];
  }
  else {
    id v7 = 0;
  }
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    id v11 = "-[ICDFileProviderClientSideCollaborationServiceProxy calculateCollaborationVersionForContents:reply:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v10, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000055A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000056CC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    id v10 = [objc_alloc((Class)ICDCollaborationVersion) initWithCollaborationSignature:v7];
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 136316162;
    __int16 v14 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionWithReply:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v13, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
}

void sub_100005D98(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if ((*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x8000000000000000) == 0) {
    +[BRPosixOperationsWrapper releaseSandboxExtensionHandle:](BRPosixOperationsWrapper, "releaseSandboxExtensionHandle:");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005E3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005F60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    __int16 v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]_block_invoke";
      __int16 v23 = 2112;
      v24 = 0;
      __int16 v25 = 2112;
      id v26 = 0;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    __int16 v12 = [*(id *)(a1 + 32) url];
    id v13 = [v7 lastPathComponent];
    __int16 v14 = [v12 URLByAppendingPathComponent:v13];

    __int16 v15 = +[NSFileManager defaultManager];
    id v20 = 0;
    unsigned __int8 v16 = [v15 moveItemAtURL:v7 toURL:v14 error:&v20];
    id v17 = v20;

    if (v16)
    {
      id v18 = brc_bread_crumbs();
      __int16 v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v22 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]_block_invoke";
        __int16 v23 = 2112;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = 0;
        __int16 v29 = 2112;
        v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
      }
    }
    else
    {
      id v18 = brc_bread_crumbs();
      __int16 v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v22 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]_block_invoke";
        __int16 v23 = 2112;
        v24 = 0;
        __int16 v25 = 2112;
        id v26 = 0;
        __int16 v27 = 2112;
        id v28 = v17;
        __int16 v29 = 2112;
        v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100006624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100006660(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderClientSideCollaborationServiceProxy uploadContents:baseVersion:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006778(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderClientSideCollaborationServiceProxy uploadContents:baseVersion:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    unsigned __int8 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006A80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100006CCC(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A930((uint64_t)v2, v3);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100006D48(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A9A8((uint64_t)v2, v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

NSString *__cdecl sub_100006EB0(BRFieldContentSignature *self, SEL a2)
{
  v7.receiver = self;
  v7.super_class = (Class)BRFieldContentSignature;
  id v3 = [(BRFieldContentSignature *)&v7 description];
  v4 = [(BRFieldContentSignature *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

uint64_t BRFieldContentSignatureReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
        goto LABEL_23;
      case 2u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
        goto LABEL_23;
      case 3u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 24;
LABEL_23:
        __int16 v15 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      case 4u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v19 == -1 || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
      v18 |= (unint64_t)(v20 & 0x7F) << v16;
      if ((v20 & 0x80) == 0) {
        goto LABEL_32;
      }
      v16 += 7;
      BOOL v9 = v17++ >= 9;
      if (v9)
      {
        uint64_t v18 = 0;
        goto LABEL_34;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v18 = 0;
    }
LABEL_34:
    *(void *)(a1 + 8) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

NSString *__cdecl sub_10000787C(BRFieldStructureSignature *self, SEL a2)
{
  v7.receiver = self;
  v7.super_class = (Class)BRFieldStructureSignature;
  id v3 = [(BRFieldStructureSignature *)&v7 description];
  char v4 = [(BRFieldStructureSignature *)self dictionaryRepresentation];
  unsigned int v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

BOOL BRFieldStructureSignatureReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 16;
LABEL_21:
        id v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadString();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100008174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000081A4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  BOOL v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218498;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] trashed items enumerator received next page %llu items=%@%@", (uint8_t *)&v16, 0x20u);
  }

  if (v8)
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      sub_10002AA78((uint64_t)v8, (uint64_t)v11, v12);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = objc_msgSend(v8, "br_fileProviderError");
    [v13 finishEnumeratingWithError:v14];
  }
  else
  {
    [*(id *)(a1 + 32) didEnumerateItems:v7];
    __int16 v15 = *(void **)(a1 + 32);
    id v14 = +[NSData br_pageTokenFromSortOrder:offset:](NSData, "br_pageTokenFromSortOrder:offset:", objc_msgSend(*(id *)(a1 + 40), "br_pageTokenSortOrder"), a3);
    [v15 finishEnumeratingUpToPage:v14];
  }
}

void sub_10000836C(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "br_fileProviderError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishEnumeratingWithError:v3];
}

id sub_10000852C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) didEnumerateItems:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 finishEnumeratingUpToPage:0];
}

_BRFileProviderShareOperationWrapper *sub_100008918(void *a1)
{
  id v1 = a1;
  v2 = [[_BRFileProviderShareOperationWrapper alloc] initWithOperation:v1];

  return v2;
}

void sub_100008D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100008D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  unsigned int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008EBC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000092B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000092EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  unsigned int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009404(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000097E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100009818(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009924(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100009C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100009CB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316674;
    id v7 = "-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v6, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009DF4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = 136316674;
    id v19 = "-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v18, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000A264(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A37C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000A790(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    __int16 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A8A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000ABBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000B04C(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@";"];
  v2 = [v1 firstObject];

  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_10000B378(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 versionIdentifier];
  id v6 = [v4 versionIdentifier];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) != 0
    || [v3 hasOldVersionIdentifier]
    && ([v3 oldVersionIdentifier],
        int v9 = objc_claimAutoreleasedReturnValue(),
        [v4 versionIdentifier],
        __int16 v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v9 isEqualToString:v10],
        v10,
        v9,
        (v11 & 1) != 0))
  {
    uint64_t v8 = 1;
  }
  else if ([v4 hasOldVersionIdentifier])
  {
    id v12 = [v4 oldVersionIdentifier];
    __int16 v13 = [v3 versionIdentifier];
    uint64_t v8 = (uint64_t)[v12 isEqualToString:v13];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_10000B990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B9B4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v8)
  {
    if (!v9) {
      goto LABEL_7;
    }
    __int16 v10 = *(void (**)(void))(v9 + 16);
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    __int16 v10 = *(void (**)(void))(v9 + 16);
  }
  v10();
LABEL_7:
}

void sub_10000BA74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t sub_10000BD1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000BD2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_10000C060(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_10000C098(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_1000547D0 != -1) {
      dispatch_once(&qword_1000547D0, &stru_1000448A8);
    }
    id v3 = (id)qword_1000547D8;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  id v6 = [v5 currentPersona];

  id v23 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v22 = 0;
    id v12 = [v6 copyCurrentPersonaContextWithError:&v22];
    id v13 = v22;
    id v14 = v23;
    id v23 = v12;

    if (v13)
    {
      __int16 v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      id v17 = brc_bread_crumbs();
      int v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v17 = brc_bread_crumbs();
      int v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    __int16 v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  __int16 v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002ABF0();
  }

  [*(id *)(a1 + 40) invalidate];
  _BRRestorePersona();
}

void sub_10000C428(_Unwind_Exception *a1)
{
}

void sub_10000C474(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_1000547D8;
  qword_1000547D8 = v1;
}

void sub_10000C4D4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_1000547E0 != -1) {
      dispatch_once(&qword_1000547E0, &stru_1000448F0);
    }
    id v3 = (id)qword_1000547E8;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  id v6 = [v5 currentPersona];

  id v24 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v6 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      __int16 v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      int v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v9;
        __int16 v29 = 2112;
        __int16 v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      int v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  __int16 v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002AD90();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  _BRRestorePersona();
}

void sub_10000C870(_Unwind_Exception *a1)
{
}

void sub_10000C8BC(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_1000547E8;
  qword_1000547E8 = v1;
}

void sub_10000C970(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000C9B0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

id sub_10000CB00(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [[BRThumbnailRequest alloc] initWithIdentifier:*(void *)(*((void *)&v23 + 1) + 8 * i) version:0];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000DF8C;
  v21[3] = &unk_100044940;
  id v22 = v9;
  id v18 = v9;
  uint64_t v19 = sub_10000CD10(v11, v8, v21, v10);

  return v19;
}

id sub_10000CD10(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  v90 = a2;
  id v99 = a3;
  id v91 = a4;
  v92 = +[NSProgress progressWithTotalUnitCount:0];
  id v94 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  memset(v167, 0, sizeof(v167));
  sub_10001E454(0, (uint64_t)"BRBaseFetchThumbnailsWithThumbnailRequests", 78, v167);
  brc_bread_crumbs();
  id v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v177 = 134218498;
    *(void *)&v177[4] = v167[0];
    *(_WORD *)&v177[12] = 2112;
    *(void *)&v177[14] = v7;
    *(_WORD *)&v177[22] = 2112;
    v178 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting fetch thumbnail for %@%@", v177, 0x20u);
  }

  id v98 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v164;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v164 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v163 + 1) + 8 * i);
        id v14 = [v13 identifier];
        uint64_t v15 = +[BRFileObjectID fileObjectIDWithString:v14];
        __int16 v16 = v15;
        if (!v15)
        {
          if (!v99) {
            goto LABEL_17;
          }
          id v17 = [v13 version];
          id v18 = +[NSError brc_errorItemNotFound:v14];
          uint64_t v19 = objc_msgSend(v18, "br_fileProviderError");
          (*((void (**)(id, void *, void *, void, void, void *))v99 + 2))(v99, v14, v17, 0, 0, v19);

          goto LABEL_13;
        }
        if ([v15 type] == 2)
        {
          [v94 addObject:v16];
          id v17 = [v13 version];
          id v18 = [v13 identifier];
          [v98 setObject:v17 forKeyedSubscript:v18];
LABEL_13:

          goto LABEL_16;
        }
        if (!v99) {
          goto LABEL_17;
        }
        id v17 = [v13 version];
        (*((void (**)(id, void *, void *, void, void, void))v99 + 2))(v99, v14, v17, 0, 0, 0);
LABEL_16:

LABEL_17:
      }
      id v10 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
    }
    while (v10);
  }

  if ([v94 count])
  {
    uint64_t v20 = +[BRDaemonConnection defaultConnection];
    id v21 = [v20 newSyncProxy];

    *(void *)v177 = 0;
    *(void *)&v177[8] = v177;
    *(void *)&v177[16] = 0x3032000000;
    v178 = sub_10000E02C;
    v179 = sub_10000E03C;
    id v180 = 0;
    uint64_t v157 = 0;
    v158 = &v157;
    uint64_t v159 = 0x3032000000;
    v160 = sub_10000E02C;
    v161 = sub_10000E03C;
    id v162 = 0;
    uint64_t v151 = 0;
    v152 = &v151;
    uint64_t v153 = 0x3032000000;
    v154 = sub_10000E02C;
    v155 = sub_10000E03C;
    id v156 = 0;
    uint64_t v145 = 0;
    v146 = &v145;
    uint64_t v147 = 0x3032000000;
    v148 = sub_10000E02C;
    v149 = sub_10000E03C;
    id v150 = 0;
    uint64_t v139 = 0;
    v140 = &v139;
    uint64_t v141 = 0x3032000000;
    v142 = sub_10000E02C;
    v143 = sub_10000E03C;
    id v144 = 0;
    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_10000E044;
    v132[3] = &unk_100044968;
    id v133 = v21;
    v134 = &v139;
    v135 = v177;
    v136 = &v157;
    v137 = &v151;
    v138 = &v145;
    id v89 = v133;
    [v133 resolveFileObjectIDsToContentRecordIDsForThumbnails:v94 reply:v132];
    if (v140[5])
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v95 = (id)v152[5];
      id v22 = [v95 countByEnumeratingWithState:&v128 objects:v170 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v129;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v129 != v23) {
              objc_enumerationMutation(v95);
            }
            long long v25 = *(void **)(*((void *)&v128 + 1) + 8 * (void)j);
            long long v26 = brc_bread_crumbs();
            __int16 v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v172 = v25;
              __int16 v173 = 2112;
              v174 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't resolve file objectID %@%@", buf, 0x16u);
            }

            __int16 v28 = [v25 asString];
            __int16 v29 = [v25 asString];
            __int16 v30 = [v98 objectForKeyedSubscript:v29];
            v31 = [v25 asString];
            v32 = +[NSError brc_errorItemNotFound:v31];
            v33 = objc_msgSend(v32, "br_fileProviderError");
            (*((void (**)(id, void *, void *, void, void, void *))v99 + 2))(v99, v28, v30, 0, 0, v33);
          }
          id v22 = [v95 countByEnumeratingWithState:&v128 objects:v170 count:16];
        }
        while (v22);
      }

      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v34 = (id)v158[5];
      id v35 = [v34 countByEnumeratingWithState:&v124 objects:v169 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v125;
        do
        {
          for (k = 0; k != v35; k = (char *)k + 1)
          {
            if (*(void *)v125 != v36) {
              objc_enumerationMutation(v34);
            }
            v38 = *(void **)(*((void *)&v124 + 1) + 8 * (void)k);
            v39 = [v38 asString];
            v40 = [v38 asString];
            v41 = [v98 objectForKeyedSubscript:v40];
            (*((void (**)(id, void *, void *, void, void, void))v99 + 2))(v99, v39, v41, 0, 0, 0);
          }
          id v35 = [v34 countByEnumeratingWithState:&v124 objects:v169 count:16];
        }
        while (v35);
      }

      if ([(id)v140[5] count] || objc_msgSend(*(id *)(*(void *)&v177[8] + 40), "count"))
      {
        long long v120 = 0uLL;
        uint64_t v121 = 0;
        sub_10001E454(0, (uint64_t)"BRBaseFetchThumbnailsWithThumbnailRequests", 147, &v120);
        v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v87 = (void *)v140[5];
          *(_DWORD *)buf = 134218498;
          id v172 = (id)v120;
          __int16 v173 = 2112;
          v174 = v87;
          __int16 v175 = 2112;
          v176 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx fetching the thumbnails for: %@%@", buf, 0x20u);
        }

        long long v122 = v120;
        uint64_t v123 = v121;
        id v44 = objc_alloc((Class)NSMutableArray);
        id v93 = objc_msgSend(v44, "initWithCapacity:", objc_msgSend(*(id *)(*(void *)&v177[8] + 40), "count"));
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v45 = *(id *)(*(void *)&v177[8] + 40);
        id v46 = [v45 countByEnumeratingWithState:&v116 objects:v168 count:16];
        if (v46)
        {
          id v96 = *(id *)v117;
          do
          {
            for (m = 0; m != v46; m = (char *)m + 1)
            {
              if (*(id *)v117 != v96) {
                objc_enumerationMutation(v45);
              }
              v48 = *(void **)(*((void *)&v116 + 1) + 8 * (void)m);
              v49 = [v48 asString];
              v50 = [v98 objectForKey:v49];

              if (v50)
              {
                v51 = [(id)v146[5] objectForKey:v48];
                v52 = [BRFieldContentSignature alloc];
                v53 = [v50 contentVersion];
                v54 = [(BRFieldContentSignature *)v52 initWithData:v53];
                v55 = [(BRFieldContentSignature *)v54 etag];

                if (v51 && [v51 isEqualToString:v55])
                {
                  [v93 addObject:v48];
                }
                else
                {
                  v56 = brc_bread_crumbs();
                  v57 = brc_default_log();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v172 = v48;
                    __int16 v173 = 2112;
                    v174 = v56;
                    _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] Asked for remote version thumbnail for fileID %@%@", buf, 0x16u);
                  }

                  v58 = [v48 asString];
                  v59 = [v48 asString];
                  v60 = [v98 objectForKeyedSubscript:v59];
                  (*((void (**)(id, void *, void *, void, void, void))v99 + 2))(v99, v58, v60, 0, 0, 0);
                }
              }
              else
              {
                [v93 addObject:v48];
              }
            }
            id v46 = [v45 countByEnumeratingWithState:&v116 objects:v168 count:16];
          }
          while (v46);
        }

        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = sub_10000E170;
        v113[3] = &unk_100044990;
        id v61 = v99;
        id v115 = v61;
        id v62 = v98;
        id v114 = v62;
        v90[2](v90, v93, v113);
        if ([(id)v140[5] count])
        {
          v63 = objc_opt_new();
          v64 = (void *)v140[5];
          v111[0] = _NSConcreteStackBlock;
          v111[1] = 3221225472;
          v111[2] = sub_10000E264;
          v111[3] = &unk_1000449B8;
          id v65 = v63;
          id v112 = v65;
          [v64 enumerateKeysAndObjectsUsingBlock:v111];
          v66 = +[CKOperationGroup br_downloadThumbnailsUserInitiated];
          id v67 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v65, "count"));
          id v68 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v65, "count"));
          v69 = +[CKContainer containerWithIdentifier:BRUbiquitousCloudKitContainerIdentifier];
          [v69 setSourceApplicationBundleIdentifier:BRDaemonBundleID];
          v102[0] = _NSConcreteStackBlock;
          v102[1] = 3221225472;
          v102[2] = sub_10000E3A8;
          v102[3] = &unk_100044A30;
          id v70 = v67;
          id v103 = v70;
          id v71 = v68;
          id v104 = v71;
          id v105 = v62;
          id v72 = v65;
          id v106 = v72;
          long long v109 = v122;
          uint64_t v110 = v123;
          id v108 = v61;
          id v73 = v66;
          id v107 = v73;
          [v72 enumerateKeysAndObjectsUsingBlock:v102];
          sub_10000EDC4(v70, v71, v69, 0, v91);
          [v92 setCancellable:1];
          v100[0] = _NSConcreteStackBlock;
          v100[1] = 3221225472;
          v100[2] = sub_10000F1C8;
          v100[3] = &unk_1000446B0;
          id v74 = v70;
          id v101 = v74;
          [v92 setCancellationHandler:v100];
          id v75 = v92;
        }
        else
        {
          (*((void (**)(id, void))v91 + 2))(v91, 0);
          id v83 = v92;
        }

        id v78 = v92;
      }
      else
      {
        v85 = brc_bread_crumbs();
        v86 = brc_default_log();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v172 = v85;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "[WARNING] No thumbnails left to fetch after attempting to resolve content record ids%@", buf, 0xCu);
        }

        (*((void (**)(id, void))v91 + 2))(v91, 0);
        id v78 = 0;
      }
    }
    else
    {
      v79 = brc_bread_crumbs();
      v80 = brc_default_log();
      if (os_log_type_enabled(v80, (os_log_type_t)0x90u))
      {
        v88 = [v89 error];
        *(_DWORD *)buf = 138412802;
        id v172 = v94;
        __int16 v173 = 2112;
        v174 = v88;
        __int16 v175 = 2112;
        v176 = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v80, (os_log_type_t)0x90u, "[ERROR] can't get the record ids for %@: %@%@", buf, 0x20u);
      }
      v81 = [v89 error];
      v82 = objc_msgSend(v81, "br_fileProviderError");
      (*((void (**)(id, void *))v91 + 2))(v91, v82);

      id v78 = v92;
    }

    _Block_object_dispose(&v139, 8);
    _Block_object_dispose(&v145, 8);

    _Block_object_dispose(&v151, 8);
    _Block_object_dispose(&v157, 8);

    _Block_object_dispose(v177, 8);
  }
  else
  {
    v76 = brc_bread_crumbs();
    v77 = brc_default_log();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
      sub_10002ADF8();
    }

    (*((void (**)(id, void))v91 + 2))(v91, 0);
    id v78 = v92;
  }

  sub_10001E628(v167);

  return v78;
}

void sub_10000DE84(_Unwind_Exception *a1)
{
}

void sub_10000DF8C(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v9 = a6;
  if (a4)
  {
    a4 = +[NSData dataWithContentsOfURL:a4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000E02C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E03C(uint64_t a1)
{
}

void sub_10000E044(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  [*(id *)(a1 + 32) setError:a7];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v13;
  id v31 = v13;

  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v14;
  id v22 = v14;

  uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v15;
  id v25 = v15;

  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v16;
  id v28 = v16;

  uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
  __int16 v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v17;
}

void sub_10000E170(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v17 = [v13 asString];
  id v14 = *(void **)(a1 + 32);
  id v15 = [v13 asString];

  id v16 = [v14 objectForKeyedSubscript:v15];
  (*(void (**)(uint64_t, id, void *, id, id, id))(v9 + 16))(v9, v17, v16, v12, v11, v10);
}

void sub_10000E264(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 zoneID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = *(void **)(a1 + 32);
    id v11 = [v6 zoneID];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  id v12 = [v9 objectForKeyedSubscript:v6];

  if (v12)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10002AE60();
    }
  }
  id v13 = [v5 asString];
  [v9 setObject:v13 forKeyedSubscript:v6];
}

void sub_10000E3A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 allKeys];
  id v8 = [v7 mutableCopy];
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_10000E690;
  uint64_t v23 = &unk_100044A08;
  id v24 = *(id *)(a1 + 32);
  id v25 = *(id *)(a1 + 40);
  id v19 = v5;
  id v26 = v19;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v9 = v6;
  id v29 = v9;
  long long v32 = *(_OWORD *)(a1 + 80);
  uint64_t v33 = *(void *)(a1 + 96);
  id v31 = *(id *)(a1 + 72);
  id v30 = *(id *)(a1 + 64);
  id v10 = v8;
  id v11 = &v20;
  id v12 = +[BRCUserDefaults defaultsForMangledID:0];
  unsigned int v13 = [v12 maxRecordCountInFetchRecordsOperation];

  if ([v10 count])
  {
    *(void *)&long long v14 = 67109378;
    long long v18 = v14;
    while ((unint64_t)objc_msgSend(v10, "count", v18, v19, v20, v21) >= v13)
    {
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v18;
        unsigned int v35 = v13;
        __int16 v36 = 2112;
        v37 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching thumbnails for more than %u item identifiers, batching request%@", buf, 0x12u);
      }

      id v17 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      v22((uint64_t)v11, v17);

      objc_msgSend(v10, "removeObjectsInRange:", 0, v13);
      if (![v10 count]) {
        goto LABEL_9;
      }
    }
    v22((uint64_t)v11, v10);
  }
LABEL_9:
}

void sub_10000E690(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)BRFetchRecordsOperation);
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  [v4 setRecordIDs:v3];
  id v5 = +[CKRecord desiredKeysWithMask:16];
  [v4 setDesiredKeys:v5];

  [v4 setQualityOfService:17];
  id v6 = [v4 configuration];
  [v6 setDiscretionaryNetworkBehavior:0];

  id v7 = [v4 configuration];
  [v7 setAutomaticallyRetryNetworkFailures:0];

  uint64_t v8 = BRDaemonBundleID;
  id v9 = [v4 configuration];
  [v9 setSourceApplicationBundleIdentifier:v8];

  id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v16 = *(void **)(a1 + 56);
        id v17 = [*(id *)(a1 + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];
        long long v18 = [v17 objectForKeyedSubscript:v15];
        id v19 = [v16 objectForKeyedSubscript:v18];

        if (v19)
        {
          uint64_t v20 = [BRFieldContentSignature alloc];
          uint64_t v21 = [v19 contentVersion];
          id v22 = [(BRFieldContentSignature *)v20 initWithData:v21];

          uint64_t v23 = [(BRFieldContentSignature *)v22 etag];

          if (v23)
          {
            id v24 = [(BRFieldContentSignature *)v22 etag];
            [v10 setObject:v24 forKeyedSubscript:v15];
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v12);
  }

  if ([v10 count]) {
    [v4 setRecordIDsToVersionETags:v10];
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000EAB8;
  v35[3] = &unk_1000449E0;
  id v36 = *(id *)(a1 + 72);
  long long v39 = *(_OWORD *)(a1 + 96);
  uint64_t v40 = *(void *)(a1 + 112);
  id v38 = *(id *)(a1 + 88);
  id v37 = *(id *)(a1 + 56);
  [v4 setPerRecordCompletionBlock:v35];
  [v4 setGroup:*(void *)(a1 + 80)];
  id v25 = [v4 configuration];
  id v26 = [v25 additionalRequestHTTPHeaders];
  id v27 = [v26 mutableCopy];
  id v28 = v27;
  if (v27) {
    id v29 = v27;
  }
  else {
    id v29 = (id)objc_opt_new();
  }
  id v30 = v29;

  id v31 = objc_alloc_init((Class)BRCDeviceConfiguration);
  long long v32 = [v31 getDeviceConfigurationString];
  [v30 setObject:v32 forKeyedSubscript:@"X-APPLE-BR-DEVICE-CONFIGURATION"];

  uint64_t v33 = [v4 configuration];
  [v33 setAdditionalRequestHTTPHeaders:v30];
}

void sub_10000EAB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 objectForKeyedSubscript:kBRRecordKeyThumbnail1024x1024];
  id v11 = [v10 fileURL];
  id v12 = [v7 objectForKeyedSubscript:kBRRecordKeyThumbnailQuickLookMetadata];
  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  long long v21 = *(_OWORD *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 72);
  long long v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v24 = (void *)v21;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received a thumbnail callback for %@%@", buf, 0x20u);
  }

  if (v11)
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10002AED4();
    }
  }
  else
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v17, (os_log_type_t)0x90u, "[ERROR] error when fetching thumbnail for %@: %@%@", buf, 0x20u);
    }
  }

  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
  uint64_t v20 = objc_msgSend(v9, "br_fileProviderError");
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v18 + 16))(v18, v13, v19, v11, v12, v20);

  sub_10001E628((uint64_t *)&v21);
}

void sub_10000ED88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000EDC4(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10000E02C;
  void v35[4] = sub_10000E03C;
  id v13 = v11;
  id v36 = v13;
  long long v14 = [v9 firstObject];
  if (v14)
  {
    uint64_t v15 = [v10 firstObject];
    if (v15)
    {
      [v9 removeObjectAtIndex:0];
      [v10 removeObjectAtIndex:0];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000F2B4;
      v28[3] = &unk_100044A58;
      id v16 = v15;
      id v29 = v16;
      id v34 = v35;
      id v30 = v9;
      id v31 = v10;
      id v17 = v27;
      id v32 = v17;
      id v33 = v12;
      [v14 setFetchRecordsCompletionBlock:v28];
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v38 = v14;
        __int16 v39 = 2112;
        id v40 = v16;
        __int16 v41 = 2112;
        long long v42 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling operation %@ for zone: %@%@", buf, 0x20u);
      }

      uint64_t v20 = [v16 ownerName];
      unsigned int v21 = [v20 isEqualToString:CKCurrentUserDefaultName];

      if (v21) {
        [v17 privateCloudDatabase];
      }
      else {
      uint64_t v22 = [v17 sharedCloudDatabase];
      }
      [v22 addOperation:v14];
    }
    else
    {
      __int16 v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        sub_10002AFBC();
      }

      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    uint64_t v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
      sub_10002AF48();
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }

  _Block_object_dispose(v35, 8);
}

void sub_10000F18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F1C8(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * (void)v5), "cancel", (void)v6);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_10000F2B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = brc_bread_crumbs();
  long long v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002B100(a1, (uint64_t)v6, v7);
  }

  if (v5)
  {
    long long v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, (os_log_type_t)0x90u, "[ERROR] error while fetching thumbnail batch for %@: %@%@", (uint8_t *)&v17, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  if ([*(id *)(a1 + 40) count] && objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002B098();
    }

    sub_10000EDC4(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 64));
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002B030();
    }

    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "br_fileProviderError");
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_10000F518(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000F910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000F944(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    long long v7 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingInfoWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FA68(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingInfoWithReply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000FE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000FE9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingAccessTokenWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FFC0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingAccessTokenWithReply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000103C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000103F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyShortTokenWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001050C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyShortTokenWithReply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000108A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000108D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderShareOperationProxy createSharingInfoWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    __int16 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000109EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderShareOperationProxy createSharingInfoWithReply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100010E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toModifyRecordWithAllowAccess:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010F28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderShareOperationProxy startOperation:toModifyRecordWithAllowAccess:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001135C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyParticipantTokenWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011480(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyParticipantTokenWithReply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000118B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toPrepFolderForSharingWithReply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000119C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toPrepFolderForSharingWithReply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100011DCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toProcessSubitemsWithMaxSubsharesFailures:processType:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011ED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderShareOperationProxy startOperation:toProcessSubitemsWithMaxSubsharesFailures:processType:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000122D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10001230C(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002B17C((uint64_t)v2, v3);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100012388(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002B1F4((uint64_t)v2, v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_1000125BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] can't register connection with domainID %@ - %@%@", (uint8_t *)&v7, 0x20u);
  }
}

void sub_1000126B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      int v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] Received reply that we can't register connection with domainID %@ - %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002B26C(a1, (uint64_t)v4, v5);
    }
  }
}

id sub_1000128F0(void *a1)
{
  id v1 = [objc_alloc((Class)BRDaemonConnection) _initUsingUserLocalDaemonWithDomainIdentifier:a1[4] databaseID:a1[5] backChannel:a1[6]];

  return v1;
}

id sub_100012A38(void *a1)
{
  id v1 = [objc_alloc((Class)BRDaemonConnection) _initUsingUserLocalDaemonWithDomainIdentifier:a1[4] databaseID:a1[5] backChannel:a1[6]];

  return v1;
}

void sub_100012C58(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4[2]) {
    goto LABEL_13;
  }
  unint64_t v5 = 0;
  *(void *)&long long v3 = 134218242;
  long long v19 = v3;
  while (1)
  {
    uint64_t v6 = objc_msgSend(v4, "_getDatabaseIDFromDomain", v19);

    if (v6 || v5 > 9) {
      break;
    }
    ++v5;
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v19;
      unint64_t v22 = v5;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Database ID from domain is nil, retry number: %lu%@", buf, 0x16u);
    }

    usleep(0x186A0u);
    uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "br_getFPDomainWithIdentifier:withError:", v2, 0);
    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = v9;

    uint64_t v4 = *(void **)(a1 + 32);
    if (!v4[2]) {
      goto LABEL_13;
    }
  }
  int v12 = *(void **)(a1 + 32);
  if (v12[2])
  {
    id v13 = [v12 _getDatabaseIDFromDomain];

    if (v13)
    {
      __int16 v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002B3D0((uint64_t)v14, v5, v15);
      }
    }
    else
    {
      __int16 v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        unint64_t v22 = v5;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Didn't find Database ID after %lu retries%@", buf, 0x16u);
      }
    }

    __int16 v18 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012F94;
    block[3] = &unk_1000446B0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v18, block);
  }
  else
  {
LABEL_13:
    __int16 v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      sub_10002B368();
    }

    +[BRPosixOperationsWrapper exitProcess:1];
  }
}

id sub_100012F94(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getAsyncProxyWithErrorHandler:&stru_100044B88];
}

void sub_1000133FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100013CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
}

void sub_100013D54(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  unint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316418;
    int v7 = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", (uint8_t *)&v6, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013E88(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013F80;
  block[3] = &unk_100044CB0;
  uint64_t v10 = *(void *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 48);
  uint64_t v18 = v10;
  uint64_t v19 = a3;
  id v14 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);
}

void sub_100013F80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asFileProviderItem];
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 80);
    int v6 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
    *(_DWORD *)buf = 134219522;
    uint64_t v13 = v10;
    __int16 v14 = 2080;
    id v15 = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]_block_invoke_2";
    __int16 v16 = 2112;
    long long v17 = v2;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 2112;
    __int16 v23 = v6;
    __int16 v24 = 2112;
    __int16 v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] ┳%llx %s: reply(%@, %lu, %d, %@)%@", buf, 0x44u);
  }
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, void *, uint64_t, void, void *))(v8 + 16))(v8, v2, v7, 0, v9);

  sub_10001E628((uint64_t *)&v10);
}

void sub_100014120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100014554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

void sub_100014594(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[ICDFileProviderExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000146A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001476C;
  block[3] = &unk_100044D00;
  uint64_t v10 = *(void *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_10001476C(uint64_t a1)
{
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "br_fileProviderError");
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v7;
    __int16 v11 = 2080;
    id v12 = "-[ICDFileProviderExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]_block_invoke_2";
    __int16 v13 = 2112;
    __int16 v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] ┳%llx %s: reply(%@)%@", buf, 0x2Au);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = objc_msgSend(*(id *)(a1 + 32), "br_fileProviderError");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  sub_10001E628((uint64_t *)&v7);
}

void sub_1000148BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100014F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

void sub_100014F94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    long long v7 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000150B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000151B8;
  block[3] = &unk_100044D50;
  id v12 = v5;
  id v8 = *(id *)(a1 + 40);
  long long v16 = *(_OWORD *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 72);
  id v13 = v8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void sub_1000151B8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"item"];
  uint64_t v4 = [v3 asFileProviderItem];

  id v5 = [*v2 objectForKeyedSubscript:@"url"];
  id v6 = brc_bread_crumbs();
  long long v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v13 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    int v21 = v13;
    __int16 v22 = 2112;
    __int16 v23 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning back to FPFS with item = %@, url = %@, etag = %@%@", buf, 0x2Au);
  }

  long long v14 = *(_OWORD *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 80);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_msgSend(*(id *)(a1 + 48), "br_fileProviderError");
    *(_DWORD *)buf = 134219266;
    uint64_t v17 = (void *)v14;
    __int16 v18 = 2080;
    uint64_t v19 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    int v21 = v5;
    __int16 v22 = 2112;
    __int16 v23 = v4;
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┳%llx %s: reply(%@, %@, %@)%@", buf, 0x3Eu);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = objc_msgSend(*(id *)(a1 + 48), "br_fileProviderError");
  (*(void (**)(uint64_t, char *, void *, void *))(v11 + 16))(v11, v5, v4, v12);

  sub_10001E628((uint64_t *)&v14);
}

void sub_100015408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100015644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001565C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100016074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  sub_10001E628((uint64_t *)(v40 - 200));
  _Unwind_Resume(a1);
}

uint64_t sub_100016100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016110(uint64_t a1)
{
}

void sub_100016118(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000161B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v5 asFileProviderItem];
    id v11 = objc_msgSend(v6, "br_fileProviderError");
    int v17 = 136316162;
    __int16 v18 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVersi"
          "on:request:completionHandler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v14 = a1 + 32;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v14 + 8);
  uint64_t v15 = [v5 asFileProviderItem];
  long long v16 = objc_msgSend(v6, "br_fileProviderError");
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v13 + 16))(v13, v12, v15, v16);
}

void sub_100016350(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100016100;
  v15[4] = sub_100016110;
  id v16 = v6;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100016488;
  v10[3] = &unk_100044E18;
  uint64_t v14 = v15;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  _Block_object_dispose(v15, 8);
}

void sub_100016488(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    id v4 = v3;
    id v5 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v4;
  }
  else
  {
    uint64_t v6 = +[NSError brc_errorRequestedVersionHasLocalEdits];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) asFileProviderItem];
    id v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "br_fileProviderError");
    int v17 = 136316162;
    __int16 v18 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVersi"
          "on:request:completionHandler:]_block_invoke_2";
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    __int16 v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = [*(id *)(a1 + 40) asFileProviderItem];
  id v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v13 + 16))(v13, v14, v15, v16);
}

void sub_100016CC4(_Unwind_Exception *a1)
{
}

void sub_100016D10(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  uint64_t v2 = (void *)qword_1000547F8;
  qword_1000547F8 = v1;
}

void sub_100016D70(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_10002B6CC();
    }
  }
}

void sub_1000174C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000174F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000175FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100017D88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100016100;
  v17[4] = sub_100016110;
  id v18 = v6;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017ED4;
  block[3] = &unk_100044EA8;
  id v11 = v5;
  uint64_t v14 = v17;
  id v12 = *(id *)(a1 + 40);
  long long v15 = *(_OWORD *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  _Block_object_dispose(v17, 8);
}

void sub_100017ED4(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) asFileProviderItem];
  id v4 = (void *)v3;
  if (*v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v13 = [*(id *)(a1 + 40) asString];
    uint64_t v14 = +[NSError brc_errorItemNotFound:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002B804();
  }

  long long v17 = *(_OWORD *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 80);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "br_fileProviderError");
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = v17;
    __int16 v21 = 2080;
    __int16 v22 = "-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]_block_invoke";
    __int16 v23 = 2112;
    __int16 v24 = v4;
    __int16 v25 = 2112;
    __int16 v26 = v10;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┳%llx %s: reply(%@, %@)%@", buf, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v4, v12);

  sub_10001E628((uint64_t *)&v17);
}

void sub_100018100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100018A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
}

void sub_100018AD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  BOOL v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316418;
    uint64_t v7 = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    long long v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", (uint8_t *)&v6, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018C04(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018CFC;
  block[3] = &unk_100044CB0;
  uint64_t v10 = *(void *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 48);
  uint64_t v18 = v10;
  uint64_t v19 = a3;
  id v14 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);
}

void sub_100018CFC(uint64_t a1)
{
  long long v11 = *(_OWORD *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) asFileProviderItem];
    uint64_t v5 = *(void *)(a1 + 80);
    int v6 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
    *(_DWORD *)buf = 134219522;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    id v16 = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke_2";
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v5;
    __int16 v21 = 1024;
    int v22 = 0;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] ┳%llx %s: reply(%@, %lu, %d, %@)%@", buf, 0x44u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) asFileProviderItem];
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, void *, uint64_t, void, void *))(v7 + 16))(v7, v8, v9, 0, v10);

  sub_10001E628((uint64_t *)&v11);
}

void sub_100018EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1000190AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000190C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000190E0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (!v5 || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002B8D4(a1);
    }
  }
  else
  {
    int v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      sub_10002B86C();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100019440(void *a1, int a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(a1[7] + 16);
    v4();
  }
  else
  {
    int v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    if (a2)
    {
      id v8 = [[ICDFileProviderShareOperationServiceSource alloc] initWithFileProviderExtension:a1[4] itemIdentifier:a1[5] operationQueue:v6];
      [v7 addObject:v8];

      uint64_t v9 = [[ICDSharingClient alloc] initWithFileProviderExtension:a1[4] itemIdentifier:a1[5] operationQueue:v6];
      [v7 addObject:v9];

      uint64_t v10 = +[BRFileObjectID fileObjectIDWithString:a1[5]];
      if ([v10 type] == 2)
      {
        long long v11 = brc_bread_crumbs();
        uint64_t v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_10002B948();
        }

        int v13 = [[ICDFileProvideriWorkCollaborationServiceSource alloc] initWithFileProviderExtension:a1[4] itemIdentifier:a1[5] operationQueue:v6];
        [v7 addObject:v13];

        if (_os_feature_enabled_impl())
        {
          uint64_t v14 = [[ICDFileProviderClientSideCollaborationServiceSource alloc] initWithItemIdentifier:a1[5] domainIdentifier:a1[6] operationQueue:v6];
          [v7 addObject:v14];
        }
      }
    }
    __int16 v15 = [[ICDFileProviderItemServiceSource alloc] initWithItemIdentifier:a1[5] domainIdentifier:a1[6] operationQueue:v6];
    [v7 addObject:v15];

    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t sub_1000198EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000198FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000199B8;
  v6[3] = &unk_100044F48;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t sub_1000199B8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to notify bird of fpfs migration completion%@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

void sub_10001A214(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A2F0;
  block[3] = &unk_100044F70;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void sub_10001A2F0(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002BB58(a1, (uint64_t)v2, v3);
  }

  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
    int v11 = 136315906;
    id v12 = "-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);
}

void sub_10001A478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    __int16 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A590(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A66C;
  block[3] = &unk_100044F70;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void sub_10001A66C(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) asFileProviderItem];
    id v5 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) asFileProviderItem];
  id v8 = objc_msgSend(*(id *)(a1 + 40), "br_fileProviderError");
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
}

void sub_10001A8F8(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x570], 8) = a1;
}

uint64_t sub_10001A9E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001ABFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001ACF8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    id v16 = v15;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v13)
    {
      id v18 = 0;
      __int16 v17 = +[NSData dataWithContentsOfURL:v13 options:1 error:&v18];
      id v16 = v18;
    }
    else
    {
      id v16 = 0;
      __int16 v17 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001B2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_10001B2FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B30C(uint64_t a1)
{
}

void sub_10001B314(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412802;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, (os_log_type_t)0x90u, "[ERROR] failed to get thumbnail for batch %@ with error %@%@", (uint8_t *)&v8, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10001B434(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10001B6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B708(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10001B2FC;
  id v29 = sub_10001B30C;
  id v30 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001BA78;
  v24[3] = &unk_100045038;
  v24[4] = &v25;
  id v15 = [v7 _getAsyncProxyWithErrorHandler:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v10);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        if (v26[5])
        {
          (*((void (**)(id, void *, void, void))v6 + 2))(v6, v11, 0, 0);
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }
        else
        {
          __int16 v12 = brc_bread_crumbs();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v11 asString];
            *(_DWORD *)buf = 138412546;
            id v32 = v14;
            __int16 v33 = 2112;
            id v34 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] generating thumbnail for small file %@ using download%@", buf, 0x16u);
          }
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10001BB10;
          v17[3] = &unk_100045060;
          id v19 = v6;
          v17[4] = v11;
          id v18 = *(id *)(a1 + 40);
          [v15 generateSmallItemThumbnailForFileObject:v11 reply:v17];
        }
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v35 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v25, 8);
}

void sub_10001BA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_10001BA78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002BBEC((uint64_t)v3, (uint64_t)v4, v5);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_10001BB10(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void sub_10001BB64(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10001BBC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_10001BCC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001BFE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001BFF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] error refreshing state for item identifier %@: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002BCDC(a1, (uint64_t)v4, v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10001C2B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C2C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C414(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C770(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C87C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10001CBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001CBF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = [v5 participants];
    int v13 = 138413314;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2048;
    id v18 = [v5 publicPermission];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    long long v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %ld, %@)%@", (uint8_t *)&v13, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v5 participants];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, [v5 publicPermission], v6);
}

void sub_10001CE98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001D390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_10001D408(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  uint64_t v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138413058;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001D560(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_10001D814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001D844(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v20;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      __int16 v33 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", location, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  if ([v5 isKnownToServer])
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:CKShareTypeKey];
    if ([v9 isEqual:_BRFolderShareType])
    {
      unsigned int v10 = [*(id *)(*(void *)(a1 + 32) + 8) characterAtIndex:0];

      if (v10 != 105)
      {
        uint64_t v11 = brc_bread_crumbs();
        int v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_10002BDCC((uint64_t *)(a1 + 32), (uint64_t)v11, v12);
        }

        uint64_t v13 = *(void *)(a1 + 48);
        __int16 v14 = +[NSError br_errorWithPOSIXCode:45];
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = 0;

    [*(id *)(a1 + 40) setCompletedUnitCount:1];
    id v19 = [objc_alloc((Class)BRShareDestroyOperation) initWithShare:v5 fileURL:*(void *)(*(void *)(a1 + 32) + 24)];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001DC30;
    v26[3] = &unk_100045128;
    v26[4] = *(void *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    [v19 setShareDestroyCompletionBlock:v26];
    objc_initWeak((id *)location, v19);
    __int16 v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    long long v23 = sub_10001DD44;
    __int16 v24 = &unk_1000446D8;
    objc_copyWeak(&v25, (id *)location);
    [*(id *)(a1 + 40) setCancellationHandler:&v21];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addOperation:", v19, v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);

    goto LABEL_16;
  }
  id v15 = brc_bread_crumbs();
  __int16 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002BE98(a1, (uint64_t)v15, v16);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

void sub_10001DC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001DC30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setCompletedUnitCount:2];
}

void sub_10001DD44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

id sub_10001DD84(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_10001E004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E454(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  if (qword_100054810 != -1) {
    dispatch_once(&qword_100054810, &stru_100045170);
  }
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E5D4;
  v8[3] = &unk_100045198;
  v8[4] = &v10;
  char v9 = a1;
  dispatch_sync((dispatch_queue_t)qword_100054808, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

void sub_10001E54C(id a1)
{
  id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("create-log-section", v1);

  id v3 = (void *)qword_100054808;
  qword_100054808 = (uint64_t)v2;
}

uint64_t sub_10001E5D4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_100054800 + 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(unsigned char *)(result + 40) != ((v2 & 1) == 0))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  qword_100054800 = v2;
  return result;
}

void sub_10001E628(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      uint64_t v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      id v4 = v3;
      if (v1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          sub_10002BF2C((uint64_t)v2, v1, v4);
        }
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 134218242;
        uint64_t v6 = v1;
        __int16 v7 = 2112;
        uint64_t v8 = v2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

void sub_10001E86C(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002BFB4();
  }

  id v4 = +[BRDaemonConnection defaultConnection];
  id v5 = [v4 newFPFSSyncProxy];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E978;
  v7[3] = &unk_100044728;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v5 boostFilePresenterForItemIdentifier:v6 reply:v7];
}

void sub_10001E978(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 8);
      int v8 = 138413058;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Received an error while boosting item %@ in ICDFileEnumerator - %@%@", (uint8_t *)&v8, 0x2Au);
    }
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
    objc_sync_exit(v4);
  }
}

void sub_10001ECB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001ED90(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C120();
  }

  id v4 = +[BRDaemonConnection defaultConnection];
  id v5 = [v4 newFPFSSyncProxy];

  uint64_t v6 = +[NSArray arrayWithObject:*(void *)(*(void *)(a1 + 32) + 8)];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EEBC;
  v7[3] = &unk_100044728;
  void v7[4] = *(void *)(a1 + 32);
  [v5 unboostFilePresenterForItemIdentifiers:v6 reply:v7];
}

void sub_10001EEBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 8);
      int v8 = 138413058;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Received an error while unboosting item %@ in ICDFileEnumerator - %@%@", (uint8_t *)&v8, 0x2Au);
    }
  }
}

void sub_10001F000(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_10001F368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001F398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = [v5 participants];
    int v13 = 138413314;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    id v18 = [v5 publicPermission];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %ld, %@)%@", (uint8_t *)&v13, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  __int16 v10 = [v5 participants];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, [v5 publicPermission], v6);
}

void sub_10001F658(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001FA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(v25);
  objc_destroyWeak(&a25);
  sub_10001E628(&a22);
  _Unwind_Resume(a1);
}

void sub_10001FB04(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    int v13 = [*(id *)(a1 + 32) itemIdentifier];
    BRSharingCreateShareForItemWithIdentifier();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v9;

    id v9 = v14;
    if (v8) {
      goto LABEL_3;
    }
  }
  [*(id *)(a1 + 32) setCachedShare:v7];
LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setTotalUnitCount:1];

  if (v9)
  {
    uint64_t v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = 0;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001FD58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_10002008C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_100020108(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v11, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002024C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_1000206BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_100020738(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  [*(id *)(a1 + 32) setCachedShare:v5];
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v11, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100020888(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_100020B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100020B88(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v22 = a1[4];
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v22;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      unsigned int v35 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", location, 0x20u);
    }

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_16;
  }
  if ([v5 isKnownToServer])
  {
    id v9 = [v5 objectForKeyedSubscript:CKShareTypeKey];
    if ([v9 isEqual:_BRFolderShareType])
    {
      uint64_t v10 = [a1[4] itemIdentifier];
      unsigned int v11 = [v10 characterAtIndex:0];

      if (v11 != 105)
      {
        uint64_t v12 = brc_bread_crumbs();
        __int16 v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_10002C26C((uint64_t *)a1 + 4, (uint64_t)v12, v13);
        }

        id v14 = (void (**)(id, void *))a1[6];
        __int16 v15 = +[NSError br_errorWithPOSIXCode:45];
        v14[2](v14, v15);

        goto LABEL_16;
      }
    }
    else
    {
    }
    [a1[4] setCachedShare:0];
    [a1[5] setCompletedUnitCount:1];
    id v18 = objc_alloc((Class)BRShareDestroyOperation);
    __int16 v19 = [a1[4] fileURL];
    id v20 = [v18 initWithShare:v5 fileURL:v19];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100020FAC;
    v28[3] = &unk_100045128;
    void v28[4] = a1[4];
    id v30 = a1[6];
    id v29 = a1[5];
    [v20 setShareDestroyCompletionBlock:v28];
    objc_initWeak((id *)location, v20);
    __int16 v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_1000210C0;
    __int16 v26 = &unk_1000446D8;
    objc_copyWeak(&v27, (id *)location);
    [a1[5] setCancellationHandler:&v23];
    __int16 v21 = objc_msgSend(a1[4], "operationQueue", v23, v24, v25, v26);
    [v21 addOperation:v20];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);

    goto LABEL_16;
  }
  id v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10002BE98((uint64_t)a1, (uint64_t)v16, v17);
  }

  (*((void (**)(void))a1[6] + 2))();
LABEL_16:
}

void sub_100020F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020FAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setCompletedUnitCount:2];
}

void sub_1000210C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

id sub_100021100(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100021370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021390(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000213A0(uint64_t a1)
{
}

void sub_1000213A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      sub_10002C3A0(a1, (uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000216B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1000216E8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100054818 != -1) {
      dispatch_once(&qword_100054818, &stru_100045230);
    }
    id v3 = (id)qword_100054820;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v23 = 0;
  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    __int16 v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v22 = 0;
    id v12 = [v6 copyCurrentPersonaContextWithError:&v22];
    id v13 = v22;
    id v14 = v23;
    id v23 = v12;

    if (v13)
    {
      __int16 v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    __int16 v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      __int16 v9 = 0;
      goto LABEL_29;
    }
    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    __int16 v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002C454();
  }

  [*(id *)(a1 + 40) invalidate];
  _BRRestorePersona();
}

void sub_100021A78(_Unwind_Exception *a1)
{
}

void sub_100021AC4(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054820;
  qword_100054820 = v1;
}

void sub_100021B24(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100054828 != -1) {
      dispatch_once(&qword_100054828, &stru_100045250);
    }
    id v3 = (id)qword_100054830;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v24 = 0;
  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    __int16 v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v6 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      id v16 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    __int16 v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v9;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      __int16 v9 = 0;
      goto LABEL_29;
    }
    __int16 v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    __int16 v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002C4BC();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  _BRRestorePersona();
}

void sub_100021EC0(_Unwind_Exception *a1)
{
}

void sub_100021F0C(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054830;
  qword_100054830 = v1;
}

void sub_1000220D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000220F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022100(uint64_t a1)
{
}

void sub_100022108(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = +[CKAllowedSharingOptions standardOptions];
  [v8 setSupportAllowingAddedParticipantsToInviteOthers:1];
  if (v6)
  {
    uint64_t v9 = +[CKAllowedSharingOptions resolvedOptionsFromOptions:v8 forExistingShare:v6];
    uint64_t v10 = *(void *)(a1[6] + 8);
    __int16 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002C524((uint64_t)v7, (uint64_t)v12, v13);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  }
  id v14 = [*(id *)(*(void *)(a1[6] + 8) + 40) shareOptions];
  id v15 = [objc_alloc((Class)_SWCollaborationMetadata) initWithLocalIdentifier:a1[4] collaborationIdentifier:&stru_1000456C0 title:0 defaultShareOptions:v14 initiatorHandle:0 initiatorNameComponents:0];
  (*(void (**)(void))(a1[5] + 16))();
}

void sub_10002232C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      sub_10002C5AC((uint64_t)v6, v7);
    }

    [*(id *)(a1 + 32) fail];
  }
  else
  {
    uint64_t v8 = +[CKAllowedSharingOptions standardOptions];
    [v8 setSupportAllowingAddedParticipantsToInviteOthers:1];
    uint64_t v9 = [v8 shareOptions];
    id v10 = [objc_alloc((Class)_SWCollaborationMetadata) initWithCollaborationIdentifier:v5 title:0 defaultShareOptions:v9 initiatorHandle:0 initiatorNameComponents:0];
    __int16 v11 = *(void **)(a1 + 32);
    id v12 = objc_opt_new();
    [v11 fulfillUsingURL:v12 updatedMetadata:v10];
  }
}

void sub_1000226A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000226C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v8)
  {
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v9 + 16);
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v9 + 16);
  }
  v10();
LABEL_7:
}

void sub_100022788(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t sub_100022964(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100022974(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100022CB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_100022CEC(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100054838 != -1) {
      dispatch_once(&qword_100054838, &stru_1000452C0);
    }
    id v3 = (id)qword_100054840;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  id v6 = [v5 currentPersona];

  id v23 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v22 = 0;
    id v12 = [v6 copyCurrentPersonaContextWithError:&v22];
    id v13 = v22;
    id v14 = v23;
    id v23 = v12;

    if (v13)
    {
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        __int16 v27 = v9;
        __int16 v28 = 2112;
        __int16 v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002ABF0();
  }

  [*(id *)(a1 + 40) invalidate];
  _BRRestorePersona();
}

void sub_10002307C(_Unwind_Exception *a1)
{
}

void sub_1000230C8(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054840;
  qword_100054840 = v1;
}

void sub_100023128(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100054848 != -1) {
      dispatch_once(&qword_100054848, &stru_1000452E0);
    }
    id v3 = (id)qword_100054850;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  id v6 = [v5 currentPersona];

  id v24 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v6 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      id v16 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v9;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    __int16 v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002AD90();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  _BRRestorePersona();
}

void sub_1000234C4(_Unwind_Exception *a1)
{
}

void sub_100023510(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054850;
  qword_100054850 = v1;
}

void sub_100023910(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] %@ - failed to signal enumerator for root container: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void sub_100023C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023C64(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C7A4();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  [*(id *)(a1 + 32) invalidateChangeToken];
  uint64_t v6 = [*(id *)(a1 + 40) domain];
  unsigned int v7 = [v6 isEqualToString:BRCloudDocsErrorDomain];

  if (v7) {
    [*(id *)(a1 + 32) _signalChange];
  }
}

uint64_t sub_100024064(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 74) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10002407C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002408C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Received notification sender %@ error %@%@", buf, 0x2Au);
  }

  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100024238;
  v15[3] = &unk_100045350;
  id v16 = v7;
  id v11 = *(id *)(a1 + 40);
  id v18 = v6;
  id v19 = v11;
  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v15);
}

void sub_100024238(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v3 + 73))
    {
      uint64_t v4 = brc_bread_crumbs();
      id v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10002C8E4();
      }

      [*(id *)(a1 + 48) invalidate];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      int v6 = *(unsigned __int8 *)(v3 + 72);
      id v7 = *(void **)(a1 + 48);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002448C;
      v22[3] = &unk_100044728;
      v22[4] = v3;
      uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v22];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v8;

      [*(id *)(*(void *)(a1 + 40) + 24) boostPriority:&stru_100045300];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10002449C;
      v21[3] = &unk_100044728;
      void v21[4] = *(void *)(a1 + 40);
      id v11 = objc_retainBlock(v21);
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_1000244A8;
      id v18 = &unk_100045328;
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = v11;
      id v12 = v11;
      id v13 = objc_retainBlock(&v15);
      if (v6) {
        uint64_t v14 = 7;
      }
      else {
        uint64_t v14 = 3;
      }
      objc_msgSend(*(id *)(a1 + 40), "watchItemWithUpdateSender:options:errorHandler:gatherReply:", *(void *)(a1 + 48), v14, v12, v13, v15, v16, v17, v18, v19);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

id sub_10002448C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNotificationError:a2];
}

id sub_10002449C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNotificationError:a2];
}

void sub_1000244A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v6 = a1 + 32;
    id v4 = v7;
    objc_sync_enter(v4);
    *(unsigned char *)(*(void *)v6 + 112) = 1;
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002C950();
    }

    if (*(void *)(*(void *)v6 + 96))
    {
      if ([*(id *)(*(void *)v6 + 32) count])
      {
        id v10 = *(void **)(*(void *)v6 + 96);
        id v11 = [*(id *)(*(void *)v6 + 32) allValues];
        [v10 didEnumerateItems:v11];
      }
      [*(id *)(*(void *)v6 + 96) finishEnumeratingUpToPage:0];
      id v12 = *(void **)(*(void *)v6 + 96);
      *(void *)(*(void *)v6 + 96) = 0;
    }
    objc_sync_exit(v4);
    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(*(void *)(a1 + 32) + 96))
  {
    brc_bread_crumbs();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10002C9E0();
    }

LABEL_13:
  }
}

void sub_10002462C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000246E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupNotificationReceivingIfNeededWithCompletion:*(void *)(a1 + 40)];
}

void sub_100024AE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100024F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

void sub_100024F8C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "br_fileProviderError");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishEnumeratingWithError:v13];
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "br_pageTokenCompletedInitialEnumeration"))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    [v4 enumerateNextGatherBatchWithObserver:v6 fromPage:v5];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000251B8;
    v16[3] = &unk_1000453A0;
    long long v19 = *(_OWORD *)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 80);
    id v7 = *(void **)(a1 + 56);
    v16[4] = *(void *)(a1 + 48);
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    char v21 = *(unsigned char *)(a1 + 88);
    uint64_t v8 = objc_retainBlock(v16);
    id v9 = [*(id *)(a1 + 32) suggestedPageSize];
    if ((unint64_t)v9 >= 0xC8) {
      uint64_t v10 = 200;
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    id v11 = +[BRDaemonConnection defaultConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002548C;
    v14[3] = &unk_100044728;
    id v15 = *(id *)(a1 + 32);
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v14];
    objc_msgSend(v12, "enumerateItemsInFolder:sortOrder:offset:limit:completion:", *(void *)(*(void *)(a1 + 48) + 16), *(unsigned __int8 *)(a1 + 88), objc_msgSend(*(id *)(a1 + 40), "br_pageTokenOffset"), v10, v8);
  }
}

void sub_1000251B8(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  long long v21 = *(_OWORD *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 72);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = "";
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    if (a4) {
      id v17 = " (waiting for gather complete)";
    }
    *(_DWORD *)buf = 134219522;
    uint64_t v24 = v21;
    __int16 v25 = 2112;
    id v26 = v18;
    __int16 v27 = 2048;
    __int16 v28 = a3;
    __int16 v29 = 2080;
    id v30 = v17;
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ - received next page %llu%s for %@ items=%@%@", buf, 0x48u);
  }

  if (v10)
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      __int16 v28 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, (os_log_type_t)0x90u, "[ERROR] %@ - there was an error when listing items: %@%@", buf, 0x20u);
    }

    id v15 = *(void **)(a1 + 48);
    uint64_t v16 = objc_msgSend(v10, "br_fileProviderError");
    [v15 finishEnumeratingWithError:v16];
  }
  else
  {
    [*(id *)(a1 + 48) didEnumerateItems:v9];
    uint64_t v16 = +[NSData br_pageTokenFromSortOrder:*(unsigned __int8 *)(a1 + 80) offset:a3];
    if (v16)
    {
      [*(id *)(a1 + 48) finishEnumeratingUpToPage:v16];
    }
    else
    {
      if (a4)
      {
        uint64_t v16 = +[NSData br_pageTokenFromSortOrder:*(unsigned __int8 *)(a1 + 80) gatherBatch:0];
      }
      else
      {
        uint64_t v16 = 0;
      }
      objc_msgSend(*(id *)(a1 + 48), "finishEnumeratingUpToPage:", v16, v21, v22);
    }
  }

  sub_10001E628((uint64_t *)&v21);
}

void sub_100025454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10002548C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "br_fileProviderError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishEnumeratingWithError:v3];
}

void sub_100025948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  objc_sync_exit(v10);
  sub_10001E628(&a10);
  _Unwind_Resume(a1);
}

void sub_100025DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026284(_Unwind_Exception *a1)
{
}

void sub_1000262E4(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054860;
  qword_100054860 = v1;
}

void sub_100026754(_Unwind_Exception *a1)
{
}

void sub_1000267A0(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100054870;
  qword_100054870 = v1;
}

void *sub_100026800(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (!result[3])
  {
    [result invalidateChangeToken];
    id v3 = *(void **)(a1 + 32);
    return [v3 _signalChange];
  }
  return result;
}

void sub_1000268FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000269E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100026A6C(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002CCD4();
  }

  return [*(id *)(a1 + 32) _invalidate];
}

void sub_100026E1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026EF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026FD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderItemServiceProxy boostFilePresenter:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027200(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderItemServiceProxy unboostFilePresenter:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027534(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    id v9 = "-[ICDFileProviderItemServiceProxy capabilityWhenTryingToReparentToNewParent:domain:reply:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027768(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  int v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderItemServiceProxy getBookmarkData:allowAccessByBundleID:documentID:isDirectory:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027998(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  int v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ICDFileProviderItemServiceProxy getPublishedURLForStreaming:requestedTTL:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027BC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderItemServiceProxy getAttributeValues:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027DB8(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 136316418;
    id v14 = "-[ICDFileProviderItemServiceProxy getiWorkPublishingInfo:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = a2;
    __int16 v17 = 1024;
    int v18 = a3;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %d, %@, %@)%@", (uint8_t *)&v13, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027FF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderItemServiceProxy setiWorkPublishingInfo:readonly:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000281C8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    id v9 = "-[ICDFileProviderItemServiceProxy getiWorkPublishingBadgingStatus:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000283B4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    id v9 = "-[ICDFileProviderItemServiceProxy getiWorkNeedsShareMigrate:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100028774(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderItemServiceProxy refreshSharingState:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028880(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ICDFileProviderItemServiceProxy refreshSharingState:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100028C2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderItemServiceProxy launchItemCountMismatchChecks:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", (uint8_t *)&v6, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028D48(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    int v9 = "-[ICDFileProviderItemServiceProxy launchItemCountMismatchChecks:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028F34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderItemServiceProxy copyShareIDWithReply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100029128(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[ICDFileProviderItemServiceProxy getCreatorNameComponents:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100029468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100029498(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316674;
    id v7 = "-[ICDFileProviderItemServiceProxy getClientSaltingVerificationKeys:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    __int16 v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v6, 0x44u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000297F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100029820(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316674;
    id v7 = "-[ICDFileProviderItemServiceProxy getServerSaltingKeys:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    __int16 v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v6, 0x44u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100029B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_10001E628((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100029BA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[ICDFileProviderItemServiceProxy getServerContentSignature:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100029EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002A154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10002A18C(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A930((uint64_t)v2, v3);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10002A208(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A9A8((uint64_t)v2, v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

id sub_10002A478(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishEnumeratingWithError:a2];
}

void sub_10002A484(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 domain];
    if ([v5 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v6 = [v9 code];

      if (v6 != (id)2)
      {
LABEL_6:
        id v7 = *(void **)(a1 + 32);
        __int16 v8 = objc_msgSend(v9, "br_fileProviderError");
        [v7 finishEnumeratingWithError:v8];

        goto LABEL_8;
      }
      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
      id v5 = v9;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_6;
  }
  [*(id *)(a1 + 32) finishEnumeratingUpToPage:0];
  id v9 = +[NSFileProviderManager br_sharedProviderManager];
  objc_msgSend(v9, "br_signalWorkingSetEnumeratorWithCompletionHandler:", &stru_100045590);
LABEL_8:
}

id sub_10002A734(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishEnumeratingWithError:a2];
}

void sub_10002A740(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = v10;
    __int16 v12 = [v10 domain];
    if ([v12 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v13 = [v11 code];

      if (v13 != (id)2)
      {
LABEL_6:
        __int16 v14 = *(void **)(a1 + 32);
        int v15 = objc_msgSend(v11, "br_fileProviderError");
        [v14 finishEnumeratingWithError:v15];

        goto LABEL_8;
      }
      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
      id v11 = v12 = v11;
    }

    goto LABEL_6;
  }
  [*(id *)(a1 + 32) didUpdateItems:a2];
  __int16 v16 = *(void **)(a1 + 32);
  id v17 = NSStringFromSelector("asString");
  __int16 v18 = [v19 valueForKey:v17];
  [v16 didDeleteItemsWithIdentifiers:v18];

  objc_msgSend(*(id *)(a1 + 32), "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v9, objc_msgSend(*(id *)(a1 + 40), "isEqualToData:", v9) ^ 1);
LABEL_8:
}

void sub_10002A930(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] BR Protocol service source connection invalidated%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002A9A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] BR Protocol service source connection interrupted%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002AA20()
{
  __assert_rtn("-[BRFieldContentSignature writeTo:]", "BRFieldContentSignature.m", 126, "nil != self->_versionIdentifier");
}

void sub_10002AA4C()
{
  __assert_rtn("-[BRFieldStructureSignature writeTo:]", "BRFieldStructureSignature.m", 87, "nil != self->_versionIdentifier");
}

void sub_10002AA78(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, (os_log_type_t)0x90u, "[ERROR] there was an error when listing trash items: %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_10002AB00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: should not be called by FP%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002AB78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: should be implemented by subclass%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002ABF0()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] collaboration service source connection invalidated%@", v2, v3, v4, v5, v6);
}

void sub_10002AC58()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] won't restore persona: %@%@");
}

void sub_10002ACC0()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v2, v3, v4, v5, v6);
}

void sub_10002AD28()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
}

void sub_10002AD90()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] collaboration service source connection interrupted%@", v2, v3, v4, v5, v6);
}

void sub_10002ADF8()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] no thumbnail left to fetch%@", v2, v3, v4, v5, v6);
}

void sub_10002AE60()
{
  sub_10000C98C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fileObjectIDByRecordIDs[recordID] == nil%@", v1, 0xCu);
}

void sub_10002AED4()
{
  sub_10000C98C();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] received a thumbnail for %@%@");
}

void sub_10002AF48()
{
  sub_10000C98C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] no new fetch thumbnail operation found, returning.%@", v1, 0xCu);
}

void sub_10002AFBC()
{
  sub_10000C98C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] no zone ID found, returning.%@", v1, 0xCu);
}

void sub_10002B030()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] finished fetching all thumbnail batches%@", v2, v3, v4, v5, v6);
}

void sub_10002B098()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] fetching next thumbnail batch%@", v2, v3, v4, v5, v6);
}

void sub_10002B100(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10000F518((void *)&_mh_execute_header, a2, a3, "[DEBUG] completed fetching thumbnail batch for %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002B17C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] share service source connection invalidated%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002B1F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] share service source connection interrupted%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002B26C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Registered connection with domainID %@%@", (uint8_t *)&v5, 0x20u);
}

void sub_10002B300()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] FPFS is not enabled%@", v2, v3, v4, v5, v6);
}

void sub_10002B368()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] Can't locate domain with identifier %@. Exiting the extension because domain was probably deleted%@");
}

void sub_10002B3D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_10000F518((void *)&_mh_execute_header, a2, a3, "[DEBUG] Found Database ID after %lu retries%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002B448()
{
  sub_10001A8F8(__stack_chk_guard);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10001A8E8();
  sub_10000F518((void *)&_mh_execute_header, v1, v2, "[DEBUG] ┣%llx calling bird%@", (void)v3, DWORD2(v3));
}

void sub_10002B4B8()
{
  sub_10000C98C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't parse etag from requested version%@", v1, 0xCu);
}

void sub_10002B52C()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Requested version has local edits, but we are no longer tracking that version. Failing the request%@", v2, v3, v4, v5, v6);
}

void sub_10002B594()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Requested version is different from existing version -- falling back to the fetch content flow%@", v2, v3, v4, v5, v6);
}

void sub_10002B5FC()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Requested version is equivalent to existing version -- just returning the existing version%@", v2, v3, v4, v5, v6);
}

void sub_10002B664()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] received account did update notification, signal changes to fileproviderd%@", v2, v3, v4, v5, v6);
}

void sub_10002B6CC()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] failed to signal enumerator for working set container: %@%@");
}

void sub_10002B734()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] waitForStabilizationWithCompletionHandler called while not in sync bubble. Nothing to do%@", v2, v3, v4, v5, v6);
}

void sub_10002B79C()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] Returning trash item %@%@");
}

void sub_10002B804()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] itemForIdentifier returning %@%@");
}

void sub_10002B86C()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed checking if item is sharable, consider item as not sharable. %@%@");
}

void sub_10002B8D4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_10001A8E8();
  sub_10000F518((void *)&_mh_execute_header, v1, v2, "[DEBUG] Item %@ is sharable. Adding sharing services.%@", (void)v3, DWORD2(v3));
}

void sub_10002B948()
{
  sub_10001A8F8(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10001A8E8();
  sub_10000F518((void *)&_mh_execute_header, v1, v2, "[DEBUG] Item %@ is a document, adding iWork collaboration service%@", (void)v3, DWORD2(v3));
}

void sub_10002B9B8()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Unexpected import notification on non-ciconia domain%@", v2, v3, v4, v5, v6);
}

void sub_10002BA20()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] Received notification that the import was finished%@", v2, v3, v4, v5, v6);
}

void sub_10002BA88()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] No bundleRecord was found for bundle identifer %@%@");
}

void sub_10002BAF0()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] bundle '%@' is not entitled to use iCloud Drive%@");
}

void sub_10002BB58(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] returning %@ with error - %@%@", (uint8_t *)&v5, 0x20u);
}

void sub_10002BBEC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed creating proxy with %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_10002BC74()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: should be implemented by subclass%@", v2, v3, v4, v5, v6);
}

void sub_10002BCDC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10000F518((void *)&_mh_execute_header, a2, a3, "[DEBUG] finished refreshing state for item identifier: %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002BD58()
{
  sub_10000C98C();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] Current account id is: %@%@");
}

void sub_10002BDCC(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *a1;
  uint8_t v6 = +[NSError br_errorWithPOSIXCode:45];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
}

void sub_10002BE98(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v4, 0x20u);
}

void sub_10002BF2C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

void sub_10002BFB4()
{
  sub_10001EFE0();
  sub_10001F000((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Sending boost file presenter for %@%@");
}

void sub_10002C030(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't watch an item without a sender%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C0A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating change token in extended enumerator%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C120()
{
  sub_10001EFE0();
  sub_10001F000((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Sending unboost file presenter for %@%@");
}

void sub_10002C19C()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: fetchSharingInfo doesn't work yet%@", v2, v3, v4, v5, v6);
}

void sub_10002C204()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: preflightCheckIfCurrentlyShareableWithCompletion doesn't work yet%@", v2, v3, v4, v5, v6);
}

void sub_10002C26C(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *a1;
  uint8_t v6 = +[NSError br_errorWithPOSIXCode:45];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
}

void sub_10002C338()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: manager not found%@", v2, v3, v4, v5, v6);
}

void sub_10002C3A0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) itemIdentifier];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, (os_log_type_t)0x90u, "[ERROR] there was an error retrieving the URL for %@%@", (uint8_t *)&v6, 0x16u);
}

void sub_10002C454()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] sharing service source connection invalidated%@", v2, v3, v4, v5, v6);
}

void sub_10002C4BC()
{
  sub_10000C98C();
  sub_10000C970((void *)&_mh_execute_header, v0, v1, "[DEBUG] sharing service source connection interrupted%@", v2, v3, v4, v5, v6);
}

void sub_10002C524(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Share lookup failed for collaboration metadata. Using default value - %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_10002C5AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] there was an error retrieving the share URL%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C624(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 itemIdentifier];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] fetchLatestRevisionWithCompletionHandler for item with identifier %@%@", (uint8_t *)&v6, 0x16u);
}

void sub_10002C6D4()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - signal changes to fileproviderd%@");
}

void sub_10002C73C()
{
  sub_10000C998();
  sub_10000C9B0((void *)&_mh_execute_header, v0, v1, "[ERROR] We had an error %@, but returning as if we didn't have an error to unblock materialization%@");
}

void sub_10002C7A4()
{
  sub_100026C3C();
  sub_10001F000((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - There was an error while fetching items: %@%@");
}

void sub_10002C814()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Setting up notifications%@");
}

void sub_10002C87C()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: !_isSettingUpNotificationReceiving%@", v2, v3, v4, v5, v6);
}

void sub_10002C8E4()
{
  sub_100026C58();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Finishing right away when invalidated%@");
}

void sub_10002C950()
{
  sub_100026C3C();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Completed gathering with items %@ observer %@%@", v4, 0x2Au);
}

void sub_10002C9E0()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: self->_gatherEnumerationObserver == nil%@", v2, v3, v4, v5, v6);
}

void sub_10002CA48()
{
  sub_10000C98C();
  sub_10001C87C((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: !self->_gatherEnumerationObserver%@", v2, v3, v4, v5, v6);
}

void sub_10002CAB0()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Already completed gather so finishing enumerating up to nil page token%@");
}

void sub_10002CB18()
{
  sub_10000C98C();
  sub_10001F000((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - token expired (current rank %llu)%@");
}

void sub_10002CB9C()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - no update to send back%@");
}

void sub_10002CC04()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - receiveProgressUpdates in the enumerator - just calling the reply.%@");
}

void sub_10002CC6C()
{
  sub_10000C998();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - invalidating change token%@");
}

void sub_10002CCD4()
{
  sub_100026C58();
  sub_10000F518((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Invalidating%@");
}

uint64_t BRCPrettyPrintBitmap()
{
  return _BRCPrettyPrintBitmap();
}

uint64_t BRCXPCBRItemServiceProtocolInterface()
{
  return _BRCXPCBRItemServiceProtocolInterface();
}

uint64_t BRCXPCSharingOperationInterface()
{
  return _BRCXPCSharingOperationInterface();
}

uint64_t BREntitledContainerIdentifiersForPropertyList()
{
  return _BREntitledContainerIdentifiersForPropertyList();
}

uint64_t BRFetchCollaborationIdentifierForItemWithIdentifier()
{
  return _BRFetchCollaborationIdentifierForItemWithIdentifier();
}

uint64_t BRSharingCreateShareForItemWithIdentifier()
{
  return _BRSharingCreateShareForItemWithIdentifier();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return _FPIsCloudDocsWithFPFSEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t _BRRestorePersona()
{
  return __BRRestorePersona();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

uint64_t getSharingServiceInterface()
{
  return _getSharingServiceInterface();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return _voucher_process_can_use_arbitrary_personas();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__getDatabaseIDFromDomain(void *a1, const char *a2, ...)
{
  return [a1 _getDatabaseIDFromDomain];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__isAppLibraryProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 _isAppLibraryProxyEntitled];
}

id objc_msgSend__isSandboxed(void *a1, const char *a2, ...)
{
  return [a1 _isSandboxed];
}

id objc_msgSend__localEditCounter(void *a1, const char *a2, ...)
{
  return [a1 _localEditCounter];
}

id objc_msgSend__oldVersionEtag(void *a1, const char *a2, ...)
{
  return [a1 _oldVersionEtag];
}

id objc_msgSend__oldVersionLocalEditCounter(void *a1, const char *a2, ...)
{
  return [a1 _oldVersionLocalEditCounter];
}

id objc_msgSend__scope(void *a1, const char *a2, ...)
{
  return [a1 _scope];
}

id objc_msgSend__signalChange(void *a1, const char *a2, ...)
{
  return [a1 _signalChange];
}

id objc_msgSend__startObservingAccountChangesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startObservingAccountChangesIfNeeded];
}

id objc_msgSend__startWaitingForDomainToBeFullySetup(void *a1, const char *a2, ...)
{
  return [a1 _startWaitingForDomainToBeFullySetup];
}

id objc_msgSend_additionalRequestHTTPHeaders(void *a1, const char *a2, ...)
{
  return [a1 additionalRequestHTTPHeaders];
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return [a1 allContainers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_appLibraryIDs(void *a1, const char *a2, ...)
{
  return [a1 appLibraryIDs];
}

id objc_msgSend_asFileProviderItem(void *a1, const char *a2, ...)
{
  return [a1 asFileProviderItem];
}

id objc_msgSend_asString(void *a1, const char *a2, ...)
{
  return [a1 asString];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_cachedShare(void *a1, const char *a2, ...)
{
  return [a1 cachedShare];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clientPrivilegesDescriptor(void *a1, const char *a2, ...)
{
  return [a1 clientPrivilegesDescriptor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collaborationMetadata(void *a1, const char *a2, ...)
{
  return [a1 collaborationMetadata];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_containsLocalEdits(void *a1, const char *a2, ...)
{
  return [a1 containsLocalEdits];
}

id objc_msgSend_contentSignature(void *a1, const char *a2, ...)
{
  return [a1 contentSignature];
}

id objc_msgSend_contentVersion(void *a1, const char *a2, ...)
{
  return [a1 contentVersion];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConnection(void *a1, const char *a2, ...)
{
  return [a1 defaultConnection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainIdentifier(void *a1, const char *a2, ...)
{
  return [a1 domainIdentifier];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return [a1 etag];
}

id objc_msgSend_fail(void *a1, const char *a2, ...)
{
  return [a1 fail];
}

id objc_msgSend_fileObjectID(void *a1, const char *a2, ...)
{
  return [a1 fileObjectID];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getDeviceConfigurationString(void *a1, const char *a2, ...)
{
  return [a1 getDeviceConfigurationString];
}

id objc_msgSend_hasContentSignature(void *a1, const char *a2, ...)
{
  return [a1 hasContentSignature];
}

id objc_msgSend_hasOldVersionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasOldVersionIdentifier];
}

id objc_msgSend_hasPopulatedVersionAndSignature(void *a1, const char *a2, ...)
{
  return [a1 hasPopulatedVersionAndSignature];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialSyncAnchor(void *a1, const char *a2, ...)
{
  return [a1 initialSyncAnchor];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateChangeToken(void *a1, const char *a2, ...)
{
  return [a1 invalidateChangeToken];
}

id objc_msgSend_isAutomationEntitled(void *a1, const char *a2, ...)
{
  return [a1 isAutomationEntitled];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isDead(void *a1, const char *a2, ...)
{
  return [a1 isDead];
}

id objc_msgSend_isFolderSharingProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 isFolderSharingProxyEntitled];
}

id objc_msgSend_isKnownToServer(void *a1, const char *a2, ...)
{
  return [a1 isKnownToServer];
}

id objc_msgSend_isPendingSignature(void *a1, const char *a2, ...)
{
  return [a1 isPendingSignature];
}

id objc_msgSend_isProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 isProxyEntitled];
}

id objc_msgSend_isSharingPrivateInterfaceEntitled(void *a1, const char *a2, ...)
{
  return [a1 isSharingPrivateInterfaceEntitled];
}

id objc_msgSend_isSharingProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 isSharingProxyEntitled];
}

id objc_msgSend_isSpeculativeDownload(void *a1, const char *a2, ...)
{
  return [a1 isSpeculativeDownload];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_maxRecordCountInFetchRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 maxRecordCountInFetchRecordsOperation];
}

id objc_msgSend_metadataVersion(void *a1, const char *a2, ...)
{
  return [a1 metadataVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newFPFSSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newFPFSSyncProxy];
}

id objc_msgSend_newSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newSyncProxy];
}

id objc_msgSend_oldVersionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 oldVersionIdentifier];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_perAppAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 perAppAccountIdentifier];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_publicPermission(void *a1, const char *a2, ...)
{
  return [a1 publicPermission];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_shareOptions(void *a1, const char *a2, ...)
{
  return [a1 shareOptions];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDatabase];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_standardOptions(void *a1, const char *a2, ...)
{
  return [a1 standardOptions];
}

id objc_msgSend_startAccountTokenChangeObserverIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startAccountTokenChangeObserverIfNeeded];
}

id objc_msgSend_suggestedBatchSize(void *a1, const char *a2, ...)
{
  return [a1 suggestedBatchSize];
}

id objc_msgSend_suggestedPageSize(void *a1, const char *a2, ...)
{
  return [a1 suggestedPageSize];
}

id objc_msgSend_symlinkTargetPath(void *a1, const char *a2, ...)
{
  return [a1 symlinkTargetPath];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 versionIdentifier];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}