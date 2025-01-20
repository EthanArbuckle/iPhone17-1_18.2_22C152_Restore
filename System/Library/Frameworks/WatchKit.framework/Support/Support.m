uint64_t SPProtoCacheAssetReadFrom(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  char v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      v10 = v5++ >= 9;
      if (v10)
      {
        v6 = 0;
        v11 = OBJC_IVAR___PBDataReader__error;
        v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = OBJC_IVAR___PBDataReader__error;
    v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0;
    }
LABEL_13:
    if (v12 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        v14 = 0;
        v15 = 0;
        v16 = 0;
        while (1)
        {
          v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          v18 = v17 + 1;
          if (v17 == -1 || v18 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18;
          v16 |= (unint64_t)(v19 & 0x7F) << v14;
          if ((v19 & 0x80) == 0) {
            goto LABEL_39;
          }
          v14 += 7;
          v10 = v15++ >= 9;
          if (v10)
          {
            LODWORD(v16) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v16) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 32) = v16;
        continue;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        break;
      case 3u:
        v27 = PBReaderReadString();
        v28 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v27;

        continue;
      case 4u:
        v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          v30 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v11) = 1;
          v30 = 0;
        }
        *(void *)(a1 + 8) = v30;
        continue;
      default:
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v25 = v24 + 1;
      if (v24 == -1 || v25 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25;
      v23 |= (unint64_t)(v26 & 0x7F) << v21;
      if ((v26 & 0x80) == 0) {
        goto LABEL_43;
      }
      v21 += 7;
      v10 = v22++ >= 9;
      if (v10)
      {
        v23 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v23 = 0;
    }
LABEL_45:
    *(void *)(a1 + 16) = v23;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t start()
{
  v1 = objc_alloc_init(SPCompanionAppServer);
  [(SPCompanionAppServer *)v1 setup];
  v2 = +[NSRunLoop currentRunLoop];
  [v2 run];

  v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    v6 = "main";
    __int16 v7 = 1024;
    int v8 = 25;
    __int16 v9 = 2114;
    v10 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Exiting from server object %{public}@", (uint8_t *)&v5, 0x1Cu);
  }

  return 1;
}

void sub_100003A9C(id a1)
{
  qword_1000524C8 = objc_alloc_init(SPPowerLog);

  _objc_release_x1();
}

void sub_100003C34(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    v3 = [v2 logQueue];
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    __int16 v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 16);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003D38;
    handler[3] = &unk_1000447A0;
    handler[4] = v9;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

id sub_100003D38(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  dispatch_source_t v4 = *(void **)(a1 + 32);

  return [v4 updatePowerLogs];
}

void sub_100003E3C(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"application"];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"action"];
  v3 = +[NSString stringWithFormat:@"%@_%@", v7, v2];
  dispatch_source_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:v7];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [*(id *)(a1 + 40) newEventFromEvent:v5 usingLogEvent:*(void *)(a1 + 32)];
  if (!v4)
  {
    dispatch_source_t v4 = +[NSMutableDictionary dictionaryWithCapacity:5];
  }
  [v4 setObject:v6 forKeyedSubscript:v3];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:v4 forKeyedSubscript:v7];
  [*(id *)(a1 + 40) startLogUpdateTimer];
}

uint64_t SPProtoCacheMessageReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_42;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_44;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_44:
        uint64_t v26 = 40;
        goto LABEL_49;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v14 |= (unint64_t)(v21 & 0x7F) << v18;
            if (v21 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_48:
        uint64_t v26 = 24;
LABEL_49:
        *(_DWORD *)(a1 + v26) = v14;
        goto LABEL_50;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 16;
        goto LABEL_37;
      case 4u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
        goto LABEL_37;
      case 5u:
        uint64_t v22 = PBReaderReadData();
        uint64_t v23 = 8;
LABEL_37:
        v24 = *(void **)(a1 + v23);
        *(void *)(a1 + v23) = v22;

        goto LABEL_50;
      case 6u:
        v25 = objc_alloc_init(SPProtoCacheSyncData);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark() && SPProtoCacheSyncDataReadFrom((uint64_t)v25, a2))
        {
          PBReaderRecallMark();

LABEL_50:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_50;
    }
  }
}

uint64_t SPProtoSockPuppetObjectReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  char v4 = &selRef_unsignedIntegerValue;
  unsigned int v5 = &selRef_unsignedIntegerValue;
  unint64_t v6 = &selRef_unsignedIntegerValue;
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v11 = v10 + 1;
      if (v10 == -1 || v11 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v12 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v10);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v11;
      v9 |= (unint64_t)(v12 & 0x7F) << v7;
      if ((v12 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      BOOL v13 = v8++ >= 9;
      if (v13)
      {
        unint64_t v9 = 0;
        int v14 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    int v14 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v9 = 0;
    }
LABEL_14:
    if (v14 || (v9 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v9 >> 3))
    {
      case 1u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        while (1)
        {
          uint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v20 = v19 + 1;
          if (v19 == -1 || v20 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20;
          v18 |= (unint64_t)(v21 & 0x7F) << v16;
          if ((v21 & 0x80) == 0) {
            goto LABEL_84;
          }
          v16 += 7;
          BOOL v13 = v17++ >= 9;
          if (v13)
          {
            LODWORD(v18) = 0;
            goto LABEL_86;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_84:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_86:
        uint64_t v66 = *((int *)v4 + 425);
        goto LABEL_108;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 0x40u;
        while (2)
        {
          uint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
            v18 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v13 = v24++ >= 9;
              if (v13)
              {
                LODWORD(v18) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_90:
        uint64_t v66 = *((int *)v6 + 413);
        goto LABEL_108;
      case 3u:
        v28 = v5;
        v29 = v6;
        v30 = v4;
        v31 = objc_alloc_init(SPProtoCacheMessage);
        objc_storeStrong((id *)(a1 + 32), v31);
        if PBReaderPlaceMark() && (SPProtoCacheMessageReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

          char v4 = v30;
          unint64_t v6 = v29;
          unsigned int v5 = v28;
LABEL_109:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 40;
        goto LABEL_82;
      case 5u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 80;
        goto LABEL_82;
      case 6u:
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 1u;
        unint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v35 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v34);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v34 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v35 = 0;
        }
        *(void *)(a1 + 8) = v35;
        goto LABEL_109;
      case 7u:
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 8u;
        unint64_t v36 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v37 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v36);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v36 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v37 = 0;
        }
        *(_DWORD *)(a1 + 48) = v37;
        goto LABEL_109;
      case 8u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 2u;
        while (2)
        {
          uint64_t v41 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v41);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v42;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v13 = v39++ >= 9;
              if (v13)
              {
                uint64_t v40 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v40 = 0;
        }
LABEL_94:
        uint64_t v67 = 16;
        goto LABEL_103;
      case 9u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 0x10u;
        while (2)
        {
          uint64_t v46 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v46);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v47;
            v18 |= (unint64_t)(v48 & 0x7F) << v44;
            if (v48 < 0)
            {
              v44 += 7;
              BOOL v13 = v45++ >= 9;
              if (v13)
              {
                LODWORD(v18) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_98:
        uint64_t v66 = 52;
        goto LABEL_108;
      case 0xAu:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 4u;
        while (2)
        {
          uint64_t v51 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v51);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v52;
            v40 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v13 = v50++ >= 9;
              if (v13)
              {
                uint64_t v40 = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v40 = 0;
        }
LABEL_102:
        uint64_t v67 = 24;
LABEL_103:
        *(void *)(a1 + v67) = v40;
        goto LABEL_109;
      case 0xBu:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 0x20u;
        while (2)
        {
          uint64_t v56 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v57 = v56 + 1;
          if (v56 == -1 || v57 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v56);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v57;
            v18 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v13 = v55++ >= 9;
              if (v13)
              {
                LODWORD(v18) = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_107:
        uint64_t v66 = 56;
LABEL_108:
        *(_DWORD *)(a1 + v66) = v18;
        goto LABEL_109;
      case 0xCu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v61 = 0;
        *(unsigned char *)(a1 + *((int *)v5 + 412)) |= 0x80u;
        while (2)
        {
          uint64_t v62 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v63 = v62 + 1;
          if (v62 == -1 || v63 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v62);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v63;
            v61 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              BOOL v13 = v60++ >= 9;
              if (v13)
              {
                uint64_t v61 = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v61 = 0;
        }
LABEL_114:
        *(unsigned char *)(a1 + 92) = v61 != 0;
        goto LABEL_109;
      case 0xDu:
        uint64_t v32 = PBReaderReadData();
        uint64_t v33 = 64;
LABEL_82:
        v65 = *(void **)(a1 + v33);
        *(void *)(a1 + v33) = v32;

        goto LABEL_109;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_109;
    }
  }
}

uint64_t SPProtoSockPuppetPlistReadFrom(void *a1, uint64_t a2)
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
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = objc_alloc_init(SPProtoSockPuppetObject);
      [a1 addObject:v12];
      if (!PBReaderPlaceMark() || (SPProtoSockPuppetObjectReadFrom((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t SPProtoCacheAssetsReadFrom(void *a1, uint64_t a2)
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
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = objc_alloc_init(SPProtoCacheAsset);
      [a1 addAssets:v12];
      if (!PBReaderPlaceMark() || (SPProtoCacheAssetReadFrom((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000975C(uint64_t a1)
{
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100029930();
  }

  memset(v27, 0, sizeof(v27));
  int v28 = 0;
  memset(v25, 0, sizeof(v25));
  int v26 = 0;
  v3 = [*(id *)(a1 + 32) appUsageTrack];
  char v4 = [v3 keyEnumerator];

  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    unint64_t v7 = (void *)v5;
    *(void *)&long long v6 = 136446723;
    long long v18 = v6;
    do
    {
      char v8 = objc_msgSend(*(id *)(a1 + 32), "appUsageTrack", v18);
      unint64_t v9 = [v8 objectForKey:v7];

      int v10 = (char *)[v9 toGizmoArray];
      unint64_t v11 = (char *)[v9 toCompArray];
      char v12 = wk_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v20 = "-[SPUsageTrack _logUsageData]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 222;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ", buf, 0x12u);
      }

      BOOL v13 = wk_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v18;
        unint64_t v20 = "-[SPUsageTrack _logUsageData]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 223;
        __int16 v23 = 2113;
        unsigned int v24 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s:%d:   %{private}@", buf, 0x1Cu);
      }

      [*(id *)(a1 + 32) _printString:"    Bytes," fromArray:dword_10003EEB8];
      [*(id *)(a1 + 32) _printSeparator];
      [*(id *)(a1 + 32) _printString:" To Gizmo," fromArray:v10];
      objc_msgSend(*(id *)(a1 + 32), "_printString:fromArray:", " To Comp, ", v11);
      for (uint64_t i = 0; i != 52; i += 4)
      {
        *(_DWORD *)((char *)v27 + i) += *(_DWORD *)&v10[i];
        *(_DWORD *)((char *)v25 + i) += *(_DWORD *)&v11[i];
      }

      uint64_t v15 = [v4 nextObject];

      unint64_t v7 = (void *)v15;
    }
    while (v15);
  }
  char v16 = wk_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000298B0();
  }

  unsigned int v17 = wk_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100029830();
  }

  [*(id *)(a1 + 32) _printString:"    Bytes," fromArray:dword_10003EEB8];
  [*(id *)(a1 + 32) _printSeparator];
  [*(id *)(a1 + 32) _printString:" To Gizmo," fromArray:v27];
  objc_msgSend(*(id *)(a1 + 32), "_printString:fromArray:", " To Comp, ", v25);
}

id sub_100009B64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDataCount:*(void *)(a1 + 48) application:*(void *)(a1 + 40) toGizmo:1];
}

id sub_100009C20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDataCount:*(void *)(a1 + 48) application:*(void *)(a1 + 40) toGizmo:0];
}

void sub_10000A478(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    uint64_t v5 = +[NSDate date];
    [*(id *)(a1 + 32) setDateOfFirstUnlock:v5];

    long long v6 = *(void **)(a1 + 32);
    [v6 sendFirstUnlockStatusToGizmo];
  }
  else if (!strcmp(string, "com.apple.pairedsync.syncDidComplete"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sockpuppet.applications.updated", 0, 0, 1u);
  }
  else if (!strcmp(string, (const char *)[@"com.apple.sockpuppet.activeComplicationsPreferencesChangedNotification" UTF8String]))
  {
    char v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446978;
      unint64_t v9 = "-[SPCompanionAppServer init]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 430;
      __int16 v12 = 2114;
      CFStringRef v13 = @"NativeComplications";
      __int16 v14 = 2114;
      CFStringRef v15 = @"com.apple.sockpuppet.activeComplicationsPreferencesChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@ stream com.apple.notifyd.matching received %{public}@", (uint8_t *)&v8, 0x26u);
    }

    if ((byte_1000524D0 & 1) == 0)
    {
      byte_1000524D0 = 1;
      sub_100016190();
    }
  }
}

void sub_10000A690(id a1, OS_xpc_object *a2)
{
  xdict = a2;
  uint64_t v2 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, "Name")];
  if (([v2 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"] & 1) != 0
    || [v2 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"])
  {
    v3 = xpc_dictionary_get_value(xdict, "UserInfo");
    char v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if ([v2 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
    {
      uint64_t v5 = +[SPApplicationManager sharedInstance];
      [v5 handleInstallationsReportedByLaunchServices:v4];
    }
  }
}

void sub_10000A784()
{
  byte_1000524D0 = 1;
  v0 = wk_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446978;
    uint64_t v2 = "_activeComplicationsChanged";
    __int16 v3 = 1024;
    int v4 = 2078;
    __int16 v5 = 2114;
    CFStringRef v6 = @"NativeComplications";
    __int16 v7 = 2114;
    CFStringRef v8 = @"com.apple.sockpuppet.activeComplications";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@ active complications have changed in domain %{public}@", (uint8_t *)&v1, 0x26u);
  }

  sub_100016190();
}

id sub_10000A8FC(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A96C;
  v3[3] = &unk_1000454E8;
  v3[4] = v1;
  return [v1 fetchInstalledApplicationsWithCompletion:v3];
}

void sub_10000A96C(uint64_t a1, void *a2)
{
  id v2 = a2;
  __int16 v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v26 = "-[SPCompanionAppServer _setupSignalHandlers]_block_invoke_2";
    __int16 v27 = 1024;
    int v28 = 542;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ======== Companion Daemon companionappd", buf, 0x12u);
  }

  int v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v26 = "-[SPCompanionAppServer _setupSignalHandlers]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 543;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -------- Installed Applications", buf, 0x12u);
  }

  __int16 v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v26 = "-[SPCompanionAppServer _setupSignalHandlers]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 544;
    __int16 v29 = 2114;
    id v30 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@", buf, 0x1Cu);
  }

  CFStringRef v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v26 = "-[SPCompanionAppServer _setupSignalHandlers]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 545;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -------- PlugInKit Extensions", buf, 0x12u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v2;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        CFStringRef v13 = v12;
        if (v12)
        {
          __int16 v14 = [v12 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
          if (v14)
          {
            CFStringRef v15 = +[PKHost defaultHost];
            char v16 = [v15 activePlugInForIdentifier:v14];

            if (v16)
            {
              unsigned int v17 = wk_default_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                int v26 = "-[SPCompanionAppServer _setupSignalHandlers]_block_invoke";
                __int16 v27 = 1024;
                int v28 = 557;
                __int16 v29 = 2114;
                id v30 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@", buf, 0x1Cu);
              }
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  long long v18 = [*(id *)(a1 + 32) usageTrack];
  [v18 _logUsageData];
}

uint64_t sub_10000AE40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000B508(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void (*)(id))off_100052510;
  uint64_t v10 = off_100052510;
  if (!off_100052510)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100015E68;
    v6[3] = &unk_100045AD8;
    v6[4] = &v7;
    sub_100015E68((uint64_t)v6);
    id v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    __int16 v5 = (_Unwind_Exception *)sub_100029B78();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  __int16 v3 = v2(v1);

  return v3;
}

void sub_10000B608(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localConnections];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10000B65C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localConnections];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10000B8B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[SPApplicationManager sharedInstance];
  __int16 v5 = [v4 pluginIdentifierForProtocolIdentifier:*(void *)(a1 + 32)];

  CFStringRef v6 = [v3 objectForKeyedSubscript:@"error"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 code])
  {
    uint64_t v7 = [v6 domain];
    unsigned int v8 = [v7 isEqual:@"com.apple.watchkit.errors"];

    uint64_t v9 = wk_default_log();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446722;
        long long v18 = "-[SPCompanionAppServer sendProtobuf:sender:timeOut:securityType:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 709;
        __int16 v21 = 2114;
        long long v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Got WatchKit error %{public}@", (uint8_t *)&v17, 0x1Cu);
      }
LABEL_15:

      goto LABEL_16;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100029D1C();
    }

    if (v5)
    {
      if ([*(id *)(a1 + 40) shouldKillExtensionOnError:v5])
      {
        int v11 = +[SPApplicationManager sharedInstance];
        [v11 markPluginWithIdentifierNeedsBeginUsing:v5];

        __int16 v12 = +[PKHost defaultHost];
        uint64_t v10 = [v12 activePlugInForIdentifier:v5];

        CFStringRef v13 = [v10 pluginConnection];
        pid_t v14 = [v13 processIdentifier];

        CFStringRef v15 = wk_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100029C1C();
        }

        if (v14)
        {
          kill(v14, 9);
          [*(id *)(a1 + 40) setLastExtensionKilledDateForPluginIdentifier:v5];
        }
        goto LABEL_15;
      }
      char v16 = wk_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100029C9C();
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) clearLastResetDateForPluginIdentifier:v5];
  }
LABEL_16:
}

void sub_10000BC24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) lastExtensionKilledDates];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_10000BD28(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastExtensionKilledDates];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10000BE64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastExtensionKilledDates];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v5;
  if (!v5 || ([v5 timeIntervalSinceNow], id v3 = v5, v4 < -30.0)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_10000BFD4(uint64_t *a1)
{
  id v2 = +[SPApplicationManager sharedInstance];
  id v3 = [v2 pluginIdentifierForProtocolIdentifier:a1[4]];

  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = +[SPApplicationManager sharedInstance];
    uint64_t v6 = a1[4];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C1E0;
    v20[3] = &unk_1000455D8;
    id v21 = v3;
    id v7 = (id)a1[4];
    uint64_t v8 = a1[5];
    id v22 = v7;
    uint64_t v23 = v8;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C5D8;
    v15[3] = &unk_100045600;
    uint64_t v9 = v4;
    char v16 = v9;
    id v10 = (id)a1[4];
    uint64_t v11 = a1[5];
    __int16 v12 = (void *)a1[6];
    id v17 = v10;
    uint64_t v18 = v11;
    id v19 = v12;
    [v5 getOrBeginActivePlugInForApplication:v6 setupBlock:v20 completion:v15];

    dispatch_time_t v13 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v9, v13))
    {
      pid_t v14 = wk_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100029E14();
      }
    }
  }
  else
  {
    uint64_t v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100029D98();
    }
  }
}

void sub_10000C1E0(uint64_t a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C2A4;
  v7[3] = &unk_1000455B0;
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = a2;
  [v6 setNotificationBlock:v7];
  [v6 setHostPrincipal:*(void *)(a1 + 48) withProtocol:&OBJC_PROTOCOL___SPCompanionAppServerProtocol];
}

void sub_10000C2A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[SPApplicationManager sharedInstance];
  unsigned int v7 = [v6 pluginHasFinishedBeginUsing:*(void *)(a1 + 32)];

  id v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    uint64_t v23 = "-[SPCompanionAppServer sendToRemoteInterface:call:]_block_invoke_3";
    __int16 v24 = 1024;
    int v25 = 792;
    __int16 v26 = 1024;
    unsigned int v27 = [v5 active];
    __int16 v28 = 1024;
    unsigned int v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sendToRemoteInterface, notificationBlock: %d, finishedBeginUsing=%d", buf, 0x1Eu);
  }

  char v9 = v7 ^ 1;
  if (a3) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0 && ([v5 active] & 1) == 0)
  {
    uint64_t v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029F10();
    }

    uint64_t v11 = +[SPApplicationManager sharedInstance];
    unsigned __int8 v12 = [v11 wasExtensionKilledDueToAppDeath:*(void *)(a1 + 40)];

    if ((v12 & 1) == 0)
    {
      dispatch_time_t v13 = wk_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100029E94();
      }

      v20[0] = @"c";
      v20[1] = @"i";
      uint64_t v14 = *(void *)(a1 + 40);
      CFStringRef v15 = *(void **)(a1 + 48);
      v21[0] = @"et";
      v21[1] = v14;
      char v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      [v15 sendPlist:v16 securityType:1];
    }
    id v17 = +[SPApplicationManager sharedInstance];
    [v17 markPluginWithIdentifierNeedsBeginUsing:*(void *)(a1 + 32)];
  }
  if ([v5 active])
  {
    uint64_t v18 = [*(id *)(a1 + 48) processAssertionForXcodeQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C554;
    block[3] = &unk_1000447A0;
    block[4] = *(void *)(a1 + 48);
    dispatch_async(v18, block);
  }
}

void sub_10000C554(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) plugInIdentifierForXcodeProcessAssertion];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 plugInIdentifierForXcodeProcessAssertion];
    [v3 takeProcessAssertionForXcode:v4];
  }
}

void sub_10000C5D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    id v4 = [*(id *)(a1 + 48) processAssertionForXcodeQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C6E0;
    block[3] = &unk_1000447A0;
    block[4] = *(void *)(a1 + 48);
    dispatch_async(v4, block);

    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [v3 plugInPrincipal];
    (*(void (**)(uint64_t, NSObject *))(v5 + 16))(v5, v6);
  }
  else
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100029F90();
    }
  }
}

void sub_10000C6E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) plugInIdentifierForXcodeProcessAssertion];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 plugInIdentifierForXcodeProcessAssertion];
    [v3 takeProcessAssertionForXcode:v4];
  }
}

void sub_10000C92C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    id v6 = "-[SPCompanionAppServer sendData:toCompanionApplication:fromIdentifier:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 838;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:->ComF remoteProxy=%{public}@", (uint8_t *)&v5, 0x1Cu);
  }

  [v3 receiveData:*(void *)(a1 + 32) fromIdentifier:*(void *)(a1 + 40)];
}

void sub_10000CBD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    id v6 = "-[SPCompanionAppServer sendProtoData:toCompanionApplication:fromIdentifier:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 850;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:->ComF remoteProxy=%{public}@", (uint8_t *)&v5, 0x1Cu);
  }

  [v3 receiveProtoData:*(void *)(a1 + 32) fromIdentifier:*(void *)(a1 + 40)];
}

void sub_10000D23C(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v1 persistentDomainForName:@"com.apple.companionappd"];
  id v3 = [v2 objectForKey:@"SPMaxSecsToWaitForInstallBeforeLaunch"];
  [v3 doubleValue];
  qword_1000524E8 = v4;

  if (*(double *)&qword_1000524E8 <= 0.0)
  {
    qword_1000524E8 = 0x4072C00000000000;
    int v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446722;
      int v8 = "-[SPCompanionAppServer launchSockPuppetAppForCompanionAppWithIdentifier:options:completion:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 902;
      __int16 v11 = 2048;
      uint64_t v12 = qword_1000524E8;
      id v6 = "%{public}s:%d: maxSecsToWaitForInstallBeforeLaunch=%1.0f. No custom defaults value, so using built-in value";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446722;
      int v8 = "-[SPCompanionAppServer launchSockPuppetAppForCompanionAppWithIdentifier:options:completion:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 904;
      __int16 v11 = 2048;
      uint64_t v12 = qword_1000524E8;
      id v6 = "%{public}s:%d: maxSecsToWaitForInstallBeforeLaunch=%1.0f loaded from custom defaults value";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10000D3E0(id *a1)
{
  if (([*((id *)a1[4] + 22) isEqualToString:a1[5]] & 1) == 0)
  {
    id v2 = a1[4];
    if (v2[22])
    {
      [v2 _cancelLaunchSockPuppetAppTimeout];
      id v2 = a1[4];
    }
    id v3 = [v2 launchSockPuppetAppQueue];
    uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);

    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)&qword_1000524E8 * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000D628;
    handler[3] = &unk_1000447A0;
    handler[4] = a1[4];
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(v4);
    objc_storeStrong((id *)a1[4] + 25, v4);
    objc_storeStrong((id *)a1[4] + 22, a1[5]);
    objc_storeStrong((id *)a1[4] + 23, a1[6]);
    id v6 = [a1[7] copy];
    int v7 = a1[4];
    int v8 = (void *)v7[24];
    v7[24] = v6;

    [a1[4] _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:*((void *)a1[4] + 22) options:*((void *)a1[4] + 23) acxRetryGeneration:0 completion:*((void *)a1[4] + 24)];
    __int16 v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_time_t v13 = "-[SPCompanionAppServer launchSockPuppetAppForCompanionAppWithIdentifier:options:completion:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 932;
      __int16 v16 = 2114;
      CFStringRef v17 = @"com.apple.sockpuppet.applications.updated";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Adding observer for %{public}@ notification", buf, 0x1Cu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1[4], (CFNotificationCallback)sub_10000D6B8, @"com.apple.sockpuppet.applications.updated", 0, (CFNotificationSuspensionBehavior)0);
  }
}

void sub_10000D628(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelLaunchSockPuppetAppTimeout];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 192);
  if (v2)
  {
    id v3 = +[SPError errorWithCode:12];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
  }
}

void sub_10000D6B8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 launchSockPuppetAppQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001601C;
  block[3] = &unk_1000447A0;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void sub_10000D974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) launchSockPuppetAppQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA8C;
  block[3] = &unk_100045760;
  id v15 = v5;
  id v16 = v6;
  int v8 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 64);
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = *(void **)(a1 + 40);
  id v20 = v9;
  uint64_t v17 = v10;
  id v18 = v11;
  id v19 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, block);
}

void sub_10000DA8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allKeys];
  id v3 = [v2 firstObject];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    unsigned int v5 = [v4 intValue];

    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v73 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options:a"
            "cxRetryGeneration:completion:]_block_invoke";
      __int16 v74 = 1024;
      int v75 = 990;
      __int16 v76 = 1024;
      LODWORD(v77) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: installState=%d", buf, 0x18u);
    }

    if (v5 != 2)
    {
      if (v5 == 8)
      {
        int v7 = wk_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10002A1A0();
        }

        uint64_t v8 = *(void *)(a1 + 72);
        id v9 = +[SPError errorWithCode:22];
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

        [*(id *)(a1 + 48) _cancelLaunchSockPuppetAppTimeout];
      }
      goto LABEL_52;
    }
    [*(id *)(a1 + 48) _cancelLaunchSockPuppetAppTimeout];
    __int16 v24 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"SPServerHoldCompanionExtensionProcessAssertion"];
    unsigned int v25 = [v24 BOOLValue];

    __int16 v26 = *(void **)(a1 + 48);
    if (v25)
    {
      [v26 setApplicationIDForXcodeProcessAssertion:v3];
    }
    else
    {
      unsigned int v27 = [v26 processAssertionForXcodeQueue];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10000E424;
      v64[3] = &unk_1000447A0;
      v64[4] = *(void *)(a1 + 48);
      dispatch_async(v27, v64);
    }
    id v28 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"WK_APP_LAUNCH_MODE"];
    if ([v28 isEqualToString:@"COMPLICATION"])
    {
      unsigned int v29 = SPLaunchGizmoAppModeComplication;
LABEL_31:
      uint64_t v21 = *v29;
      unint64_t v36 = 0;
      goto LABEL_32;
    }
    if ([v28 isEqualToString:@"GLANCE"])
    {
      unsigned int v29 = SPLaunchGizmoAppModeGlance;
      goto LABEL_31;
    }
    if (![v28 isEqualToString:@"NOTIFICATION"])
    {
      unsigned int v29 = SPLaunchGizmoAppModeApp;
      goto LABEL_31;
    }
    uint64_t v21 = @"lN";

    id v30 = +[NSUUID UUID];
    v31 = [v30 UUIDString];

    uint64_t v32 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"WK_NOTIF_CONTEXT"];
    uint64_t v33 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"WK_NOTIF_FORCE_STATIC"];
    unsigned __int8 v34 = [v33 isEqualToString:@"YES"];

    if ([v32 count])
    {
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10000E42C;
      v58[3] = &unk_100045710;
      id v59 = v31;
      id v60 = v32;
      id v61 = *(id *)(a1 + 56);
      id v62 = v3;
      unsigned __int8 v63 = v34;
      id v35 = v32;
      id v28 = v31;
      unint64_t v36 = objc_retainBlock(v58);

LABEL_32:
      v70[0] = @"c";
      v70[1] = @"gi";
      v71[0] = @"lg";
      v71[1] = v3;
      v70[2] = @"lm";
      v71[2] = v21;
      int v37 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];
      id v38 = [v37 mutableCopy];

      unsigned int v39 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"lgbl"];

      if (v39)
      {
        uint64_t v40 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"lgbl"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v38 setObject:v40 forKeyedSubscript:@"lgbl"];
        }
        else
        {
          uint64_t v41 = wk_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10002A21C((uint64_t)v40, v41);
          }
        }
      }
      unint64_t v42 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"xle"];

      if (v42)
      {
        char v43 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"xle"];
        [v38 setObject:v43 forKeyedSubscript:@"xle"];
      }
      char v44 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"xla"];

      if (v44)
      {
        unsigned int v45 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"xla"];
        [v38 setObject:v45 forKeyedSubscript:@"xla"];
      }
      uint64_t v46 = wk_default_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136446722;
        v73 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options"
              ":acxRetryGeneration:completion:]_block_invoke";
        __int16 v74 = 1024;
        int v75 = 1056;
        __int16 v76 = 2114;
        uint64_t v77 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sending SPLaunchGizmoAppCommand for companionAppIdentifier=\"%{public}@\"", buf, 0x1Cu);
      }

      char v48 = *(void **)(a1 + 48);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10000E67C;
      v55[3] = &unk_100045738;
      id v56 = v36;
      id v57 = *(id *)(a1 + 72);
      char v49 = v36;
      unsigned int v50 = objc_retainBlock(v55);
      [v48 sendAndTrackTransactionDict:v38 withCompletion:v50];

      goto LABEL_52;
    }
    unint64_t v52 = wk_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10002A2C8();
    }

    uint64_t v53 = *(void *)(a1 + 72);
    char v54 = +[SPError errorWithCode:27];
    (*(void (**)(uint64_t, void, void *))(v53 + 16))(v53, 0, v54);

LABEL_19:
    goto LABEL_52;
  }
  uint64_t v10 = [*(id *)(a1 + 40) domain];
  unsigned int v11 = [v10 isEqualToString:NSCocoaErrorDomain];

  if (!v11) {
    goto LABEL_17;
  }
  id v12 = [*(id *)(a1 + 40) code];
  if (v12 == (id)4101 || v12 == (id)4099) {
    goto LABEL_49;
  }
  if (v12 != (id)4097)
  {
LABEL_17:
    wk_default_log();
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446978;
      v73 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options:a"
            "cxRetryGeneration:completion:]_block_invoke_2";
      __int16 v74 = 1024;
      int v75 = 985;
      __int16 v76 = 2114;
      uint64_t v77 = v22;
      __int16 v78 = 2114;
      uint64_t v79 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -[ACXDeviceConnection fetchApplicationWithContainingApplicationBundleID:completion:] returned no apps for companionAppIdentifier %{public}@. Error %{public}@. Will wait for another notification", buf, 0x26u);
    }
    goto LABEL_19;
  }
  unint64_t v13 = *(void *)(a1 + 80);
  __int16 v14 = wk_default_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v13 < 5)
  {
    if (v15) {
      sub_10002A010();
    }

    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E40C;
    block[3] = &unk_1000456C0;
    uint64_t v17 = *(void **)(a1 + 56);
    void block[4] = *(void *)(a1 + 48);
    id v66 = v17;
    id v18 = *(id *)(a1 + 64);
    id v20 = *(void **)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 80);
    id v67 = v18;
    uint64_t v69 = v19;
    id v68 = v20;
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_52;
  }
  if (v15) {
    sub_10002A118();
  }

LABEL_49:
  uint64_t v51 = wk_default_log();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    sub_10002A09C();
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_52:
}

id sub_10000E40C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:*(void *)(a1 + 40) options:*(void *)(a1 + 48) acxRetryGeneration:*(void *)(a1 + 64) + 1 completion:*(void *)(a1 + 56)];
}

id sub_10000E424(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseProcessAssertionForXcode];
}

void sub_10000E42C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136447234;
    uint64_t v17 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options:acx"
          "RetryGeneration:completion:]_block_invoke_2";
    __int16 v18 = 1024;
    int v19 = 1023;
    __int16 v20 = 2114;
    CFStringRef v21 = @"WK_NOTIF_CONTEXT";
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: setting notification context via %{public}@ for %{public}@ to %{public}@", buf, 0x30u);
  }

  int v7 = +[SPCompanionNotificationHandler sharedInstance];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 64);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E5D4;
  v14[3] = &unk_1000456E8;
  id v15 = v3;
  id v13 = v3;
  [v7 injectBulletinWithSectionID:v8 gizmoAppIdentifier:v9 bulletinID:v10 remoteNotificationContext:v11 forceStatic:v12 completion:v14];
}

void sub_10000E5D4(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
  else
  {
    id v5 = +[SPError errorWithCode:1];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

uint64_t sub_10000E67C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_10000EA2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseProcessAssertionForXcode];
}

id sub_10000EA34(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelLaunchSockPuppetAppTimeout];
}

void sub_10000EA3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) launchSockPuppetAppQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EB18;
  v8[3] = &unk_100045698;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void sub_10000EB18(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 allKeys];
    uint64_t v4 = [v3 firstObject];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) processAssertionQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000EE28;
      block[3] = &unk_1000447C8;
      void block[4] = *(void *)(a1 + 40);
      id v6 = v4;
      id v26 = v6;
      dispatch_async(v5, block);

      id v7 = +[SPApplicationManager sharedInstance];
      uint64_t v8 = [v7 pluginIdentifierForProtocolIdentifier:v6];

      id v9 = [*(id *)(a1 + 40) remoteInterfaceProcessAssertionsQueue];
      int v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      CFStringRef v21 = sub_10000EE34;
      __int16 v22 = &unk_1000447C8;
      uint64_t v23 = *(void *)(a1 + 40);
      id v10 = v8;
      id v24 = v10;
      dispatch_sync(v9, &v19);

      id v11 = wk_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136446722;
        id v30 = "-[SPCompanionAppServer terminateSockPuppetAppForCompanionAppWithIdentifier:completion:]_block_invoke";
        __int16 v31 = 1024;
        int v32 = 1118;
        __int16 v33 = 2114;
        uint64_t v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sending SPTerminateGizmoAppCommand for companionAppIdentifier=\"%{public}@\"", buf, 0x1Cu);
      }

      id v13 = *(void **)(a1 + 40);
      v27[0] = @"c";
      v27[1] = @"gi";
      v28[0] = @"kg";
      v28[1] = v6;
      __int16 v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2, v19, v20, v21, v22, v23);
      id v15 = objc_retainBlock(*(id *)(a1 + 56));
      [v13 sendAndTrackTransactionDict:v14 withCompletion:v15];
    }
    else
    {
      dispatch_time_t v16 = wk_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002A348();
      }

      uint64_t v17 = *(void *)(a1 + 56);
      __int16 v18 = +[SPError errorWithCode:5];
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
    }
  }
}

id sub_10000EE28(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseProcessAssertion:*(void *)(a1 + 40)];
}

void sub_10000EE34(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteInterfaceProcessAssertions];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 136446722;
      id v9 = "-[SPCompanionAppServer terminateSockPuppetAppForCompanionAppWithIdentifier:completion:]_block_invoke_6";
      __int16 v10 = 1024;
      int v11 = 1111;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: immediately releasing remoteInterface process assertion for pluginIdentifier %{public}@", (uint8_t *)&v8, 0x1Cu);
    }

    id v6 = [v3 objectForKeyedSubscript:@"assertion"];
    [v6 invalidate];
    id v7 = [*(id *)(a1 + 32) remoteInterfaceProcessAssertions];
    [v7 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void sub_10000F0EC(uint64_t a1, void *a2)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = a2;
  id v3 = [v17 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      id v9 = [v17 objectForKeyedSubscript:v8];
      __int16 v10 = [v9 objectForKeyedSubscript:@"SPContainerAppBundleId"];
      unsigned __int8 v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

      if (v11) {
        break;
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v8;

    if (!v12) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    v22[0] = @"c";
    v22[1] = @"gi";
    v23[0] = @"gs";
    v23[1] = v12;
    __int16 v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v15 = objc_retainBlock(*(id *)(a1 + 48));
    [v13 sendAndTrackTransactionDict:v14 withCompletion:v15];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v16 = *(void *)(a1 + 48);
    id v12 = +[SPError errorWithCode:5];
    (*(void (**)(uint64_t, id, void))(v16 + 16))(v16, v12, 0);
  }
}

void sub_10000F47C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = objc_msgSend(v3, "allKeys", 0);
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * v8)];
      __int16 v10 = [v9 objectForKeyedSubscript:@"SPContainerAppBundleId"];
      unsigned __int8 v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

      if (v11) {
        break;
      }

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = [v9 objectForKeyedSubscript:@"SPPluginBundleIdKey"];

    if (!v12) {
      goto LABEL_12;
    }
    uint64_t v13 = +[PKHost defaultHost];
    __int16 v14 = [v13 activePlugInForIdentifier:v12];

    id v15 = [v14 pluginConnection];
    [v15 processIdentifier];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v16 = wk_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      id v24 = "-[SPCompanionAppServer getCompanionExtensionPIDForCompanionAppWithIdentifier:completion:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1173;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Couldn't find companionExtensionBundleID for companionAppIdentifier %{public}@", buf, 0x1Cu);
    }

    uint64_t v18 = *(void *)(a1 + 40);
    id v12 = +[SPError errorWithCode:5];
    (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v12, 0);
  }
}

void sub_10000FF88(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timingTest_IDSReceiveTime");
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setValue:v3 forKey:@".scd"];

  id v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timingTest_IDSSendTime");
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setValue:v5 forKey:@".ecd"];

  id v6 = *(void **)(a1 + 32);
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "timingTest_IDSSendSize"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v7 forKey:@".bcd"];
}

id sub_100010078(uint64_t a1, void *a2)
{
  return [a2 replyTimingData:*(void *)(a1 + 32)];
}

id sub_1000104D0(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "timingTest_IDSSendTime");
  if (v3 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTimingTest_IDSSendTime:", *(double *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "setTimingTest_IDSSendSize:", v4);
  }
  return result;
}

id sub_1000105BC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimingTest_IDSReceiveTime:", *(double *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setTimingTest_IDSSendTime:", 0.0);
}

id sub_1000115A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseProcessAssertion:*(void *)(a1 + 40)];
}

void sub_1000115B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 1408;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerApplicationTerminatedCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 applicationDidTerminate:*(void *)(a1 + 32)];
}

void sub_100011690(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1416;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerLaunchCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 applicationContentsDidReset:*(void *)(a1 + 32)];
}

void sub_10001176C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1421;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerLaunchCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 applicationDidFinishConnecting:*(void *)(a1 + 32)];
}

void sub_100011848(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1427;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerActivateCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 applicationDidBecomeActive:*(void *)(a1 + 32)];
}

id sub_100011924(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int16 v7 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1433;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerDeactivateCommand", (uint8_t *)&v6, 0x12u);
  }

  [v3 applicationWillResignActive:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _applicationDeactivated:*(void *)(a1 + 48)];
}

void sub_100011A08(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1443;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerActivateCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 dataInterfaceDidBecomeActive:*(void *)(a1 + 32)];
}

void sub_100011AE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1448;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerDeactivateCommand", (uint8_t *)&v5, 0x12u);
  }

  [v3 dataInterfaceWillResignActive:*(void *)(a1 + 32)];
}

void sub_100011BC0(id a1, SPRemoteInterfaceProtocol *a2)
{
  uint64_t v2 = a2;
  id v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1488;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPServerActivateCommand", (uint8_t *)&v4, 0x12u);
  }

  [(SPRemoteInterfaceProtocol *)v2 applicationIsStillActive];
}

void sub_100011C8C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 objectForKeyedSubscript:@"V"];
  __int16 v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Tk"];
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Ui"];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSUUID UUID];
  }
  __int16 v10 = v9;

  unsigned __int8 v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    int v14 = 136447746;
    id v15 = "-[SPCompanionAppServer handleIncomingPlist:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1501;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    __int16 v25 = v6;
    __int16 v26 = 2114;
    __int16 v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-IDS SPGizmoAppHandleWatchTaskKeys for application=%{public}@, clientIdentifier=%{public}@, vcIdentifier=%{public}@, taskKeys=%{public}@, barTaskUUID=%{public}@", (uint8_t *)&v14, 0x44u);
  }

  [v4 applicationHandleWatchTaskKeys:v6 reasonForSnapshot:0 visibleVCID:v5 barTaskUUID:v10 clientIdentifier:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) extensionDidEndSnapshot:*(void *)(a1 + 64)];
}

void sub_100011E44(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"d"];
  LODWORD(v2) = [v2 _isApplicationViewControllerActivate:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _sendTextSizeToApplication:v5 onlyIfChanged:1];
  }
}

id sub_1000120B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseProcessAssertion:*(void *)(a1 + 40)];
}

id sub_1000120C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseRemoteInterfaceAssertionsForPluginIdentifer:*(void *)(a1 + 40)];
}

id sub_1000122BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_100012498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000124C4(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[4];
    *(_DWORD *)buf = 136446978;
    uint64_t v13 = "-[SPCompanionAppServer setApplicationIDForXcodeProcessAssertion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 1572;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 1024;
    unsigned int v19 = [v3 active];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: setting plugInIdentifierForXcodeProcessAssertion to %{public}@, plugin.active=%d", buf, 0x22u);
  }

  __int16 v6 = [a1[5] processAssertionForXcodeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012654;
  block[3] = &unk_100045950;
  objc_copyWeak(&v11, a1 + 6);
  id v9 = a1[4];
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void sub_100012654(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPlugInIdentifierForXcodeProcessAssertion:v2];

  if ([*(id *)(a1 + 40) active])
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 takeProcessAssertionForXcode:*(void *)(a1 + 32)];
  }
}

void sub_100012900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001292C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002A918();
    }
  }
  uint64_t v5 = [v3 pluginConnection];
  __int16 v6 = (void *)v5;
  if (v3 && !v5)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A89C();
    }
  }
  id v8 = [v6 processIdentifier];
  id v9 = v8;
  if (v6 && !v8)
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A820();
    }
  }
  id v11 = objc_alloc((Class)BKSProcessAssertion);
  uint64_t v12 = *(void *)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_100012B88;
  v20[3] = &unk_100045A18;
  objc_copyWeak(&v22, (id *)(a1 + 48));
  int8x16_t v17 = *(int8x16_t *)(a1 + 32);
  id v13 = (id)v17.i64[0];
  int8x16_t v21 = vextq_s8(v17, v17, 8uLL);
  int v23 = (int)v9;
  id v14 = [v11 initWithPID:v9 flags:15 reason:9 name:v12 withHandler:v20];
  uint64_t v15 = *(void *)(a1 + 40);
  __int16 v16 = *(void **)(v15 + 128);
  *(void *)(v15 + 128) = v14;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012FBC;
  v18[3] = &unk_1000459A0;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 40) + 128) setInvalidationHandler:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
}

void sub_100012B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012B88(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100012C58;
    v4[3] = &unk_1000459F0;
    objc_copyWeak(&v5, (id *)(a1 + 48));
    v4[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
  }
  else
  {
    id v3 = wk_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002A998();
    }
  }
}

void sub_100012C58(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained batteryStateObserver];

  if (!v4)
  {
    id v5 = +[UIDevice currentDevice];
    [v5 setBatteryMonitoringEnabled:1];

    __int16 v6 = +[NSNotificationCenter defaultCenter];
    id v7 = +[NSOperationQueue mainQueue];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_100012DC8;
    id v13 = &unk_1000459C8;
    uint64_t v14 = *(void *)(a1 + 32);
    objc_copyWeak(&v15, v2);
    id v8 = [v6 addObserverForName:UIDeviceBatteryStateDidChangeNotification object:0 queue:v7 usingBlock:&v10];
    id v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "setBatteryStateObserver:", v8, v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
  }
}

void sub_100012DB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012DC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 batteryState];

  if (v5 == (id)1)
  {
    __int16 v6 = [*(id *)(a1 + 32) launchSockPuppetAppQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012F3C;
    block[3] = &unk_1000459A0;
    id v7 = (id *)(a1 + 40);
    objc_copyWeak(&v12, (id *)(a1 + 40));
    dispatch_async(v6, block);

    id v8 = [*(id *)(a1 + 32) processAssertionForXcodeQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012F7C;
    v9[3] = &unk_1000459A0;
    objc_copyWeak(&v10, v7);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
  }
}

void sub_100012F28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012F3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelLaunchSockPuppetAppTimeout];
}

void sub_100012F7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseProcessAssertionForXcode];
}

void sub_100012FBC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained processAssertionForXcodeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013074;
  block[3] = &unk_1000459A0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void sub_100013074(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseProcessAssertionForXcode];
}

void sub_100013230(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) batteryStateObserver];

  if (v2)
  {
    id v3 = +[UIDevice currentDevice];
    [v3 setBatteryMonitoringEnabled:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    id v5 = [*(id *)(a1 + 32) batteryStateObserver];
    [v4 removeObserver:v5];

    __int16 v6 = *(void **)(a1 + 32);
    [v6 setBatteryStateObserver:0];
  }
}

id sub_1000132F0(void *a1, int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    id v5 = [v3 stringByAppendingString:@"-bg"];
  }
  else
  {
    id v5 = v3;
  }
  __int16 v6 = v5;

  return v6;
}

void sub_100013408(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = sub_1000132F0(*(void **)(a1 + 32), 0);
  v27[0] = v2;
  id v3 = sub_1000132F0(*(void **)(a1 + 32), 1);
  v27[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v27 count:2];

  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 136446722;
    long long v16 = v6;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "remoteInterfaceProcessAssertions", v16, (void)v17);
        id v12 = [v11 objectForKeyedSubscript:v10];

        id v13 = [v12 objectForKeyedSubscript:@"assertion"];
        [v13 invalidate];
        if (v13)
        {
          uint64_t v14 = wk_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            id v22 = "-[SPCompanionAppServer releaseRemoteInterfaceAssertionsForPluginIdentifer:]_block_invoke";
            __int16 v23 = 1024;
            int v24 = 1686;
            __int16 v25 = 2114;
            uint64_t v26 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: early releasing remoteInterface process assertion for pluginIdentifier %{public}@", buf, 0x1Cu);
          }
        }
        id v15 = [*(id *)(a1 + 40) remoteInterfaceProcessAssertions];
        [v15 removeObjectForKey:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v7);
  }
}

void sub_100013984(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableCopy];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 nextTransactionID];
  [v3 setNextTransactionID:(v4 + 1)];
  id v5 = +[NSNumber numberWithUnsignedInt:v4];
  [v2 setObject:v5 forKeyedSubscript:@"tid"];
  id v6 = [v2 objectForKeyedSubscript:@"c"];
  if (v6)
  {
    if (qword_100052528 != -1) {
      dispatch_once(&qword_100052528, &stru_100045B30);
    }
    unsigned int v7 = [(id)qword_100052520 containsObject:v6];

    if (v7) {
      [v2 setObject:@".XC" forKeyedSubscript:@"i"];
    }
  }
  id v8 = [v2 copy];
  id v9 = v2;
  uint64_t v10 = *(void **)(a1 + 48);
  if (v10)
  {
    id v11 = [v10 copy];
    [v9 setObject:v11 forKeyedSubscript:@"completion"];
  }
  id v12 = +[NSDate date];
  [v9 setObject:v12 forKeyedSubscript:@"date"];

  id v13 = [*(id *)(a1 + 40) outstandingtransactions];

  if (!v13)
  {
    uint64_t v14 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 40) setOutstandingtransactions:v14];
  }
  id v15 = [*(id *)(a1 + 40) outstandingtransactions];
  [v15 setObject:v9 forKeyedSubscript:v5];

  [*(id *)(a1 + 40) sendPlist:v8 securityType:1];
  long long v16 = wk_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"c"];
    long long v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"gi"];
    long long v19 = [*(id *)(a1 + 40) outstandingtransactions];
    int v20 = 136447490;
    int8x16_t v21 = "-[SPCompanionAppServer sendAndTrackTransactionDict:withCompletion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 1763;
    __int16 v24 = 2114;
    __int16 v25 = v17;
    __int16 v26 = 2114;
    __int16 v27 = v18;
    __int16 v28 = 2114;
    unsigned int v29 = v5;
    __int16 v30 = 2114;
    __int16 v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sending transactionDict with command=%{public}@ SPGizmoAppIdentifier=%{public}@ for transactionID=%{public}@\noutstandingtransactions is %{public}@", (uint8_t *)&v20, 0x3Au);
  }
}

void sub_100013DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013DEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013DFC(uint64_t a1)
{
}

void sub_100013E04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outstandingtransactions];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(unsigned char *)(a1 + 56) && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) outstandingtransactions];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
  unsigned int v7 = wk_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"c"];
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"gi"];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) outstandingtransactions];
    int v12 = 136447490;
    id v13 = "-[SPCompanionAppServer transactionDictForID:removeFromOutstanding:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 1774;
    __int16 v16 = 2114;
    long long v17 = v8;
    __int16 v18 = 2114;
    long long v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    int v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: returning transactionDict with command=%{public}@ SPGizmoAppIdentifier=%{public}@ for transactionID=%{public}@\noutstandingtransactions is %{public}@", (uint8_t *)&v12, 0x3Au);
  }
}

void sub_100014CDC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 216) objectForKeyedSubscript:*(void *)(a1 + 40)];
  unsigned int v3 = [v2 intValue];

  uint64_t v4 = +[NSNumber numberWithInt:v3 + 1];
  [*(id *)(*(void *)(a1 + 32) + 216) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v5 = wk_bg_app_refresh_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 136446722;
      id v8 = "-[SPCompanionAppServer extensionDidBeginSnapshot:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1944;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Extension %{public}@ did begin snapshot or background glance update", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100014E00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 224);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100014E94;
  v3[3] = &unk_1000447C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_barrier_async(v2, v3);
}

void sub_100014E94(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 216) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v3 = [v2 intValue];

  if (v3 >= 1)
  {
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ABBC();
    }

    [*(id *)(*(void *)(a1 + 32) + 216) setObject:&off_10004AC78 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_100014FD4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 216) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v3 = [v2 intValue];

  uint64_t v4 = (v3 - 1);
  if (v3 < 1)
  {
    id v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002AC58();
    }

    uint64_t v4 = 0;
  }
  uint64_t v6 = +[NSNumber numberWithInt:v4];
  [*(id *)(*(void *)(a1 + 32) + 216) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  if (!v4)
  {
    int v7 = wk_bg_app_refresh_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136446722;
      int v10 = "-[SPCompanionAppServer extensionDidEndSnapshot:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1974;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Extension %{public}@ did end snapshot or background glance update", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_100015218(void *a1)
{
  id v2 = [*(id *)(a1[4] + 216) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (int)[v2 intValue] > 0;
}

void sub_100015390(id a1)
{
  qword_100052500 = (uint64_t)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.UIKit"];

  _objc_release_x1();
}

void sub_100015478(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _textSizeChanged];
  }
  else {
  uint64_t v4 = [v3 _textSize];
  }
  id v5 = v4;
  if (v4)
  {
    int v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001553C;
    v8[3] = &unk_100045868;
    id v9 = v4;
    [v7 sendToRemoteInterface:v6 call:v8];
  }
}

id sub_10001553C(uint64_t a1, void *a2)
{
  return [a2 preferredContentSizeCategory:*(void *)(a1 + 32)];
}

void sub_100015DD4()
{
  v0 = wk_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    int v2 = "_handleLanguageOrLocaleChange";
    __int16 v3 = 1024;
    int v4 = 528;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: SPCompanionAppServer, restarting companionappd due to language or locale change", (uint8_t *)&v1, 0x12u);
  }

  exit(0);
}

void *sub_100015E68(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100052518)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100015FA8;
    v5[4] = &unk_100045B10;
    v5[5] = v5;
    long long v6 = off_100045AF8;
    uint64_t v7 = 0;
    qword_100052518 = _sl_dlopen();
    __int16 v3 = (void *)v5[0];
    int v2 = (void *)qword_100052518;
    if (qword_100052518)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      __int16 v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  int v2 = (void *)qword_100052518;
LABEL_5:
  id result = dlsym(v2, "BSBundleIDForXPCConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100052510 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100015FA8()
{
  uint64_t result = _sl_dlopen();
  qword_100052518 = result;
  return result;
}

void sub_10001601C(uint64_t a1)
{
  int v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v3 = [*(id *)(a1 + 32) launchSockPuppetAppCompanionAppIdentifer];
    int v4 = [*(id *)(a1 + 32) launchSockPuppetAppOptions];
    int v9 = 136447234;
    int v10 = "_sockPuppetAppListUpdated_block_invoke";
    __int16 v11 = 1024;
    int v12 = 940;
    __int16 v13 = 2114;
    CFStringRef v14 = @"com.apple.sockpuppet.applications.updated";
    __int16 v15 = 2114;
    __int16 v16 = v3;
    __int16 v17 = 2114;
    __int16 v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Got %{public}@ notification launchSockPuppetAppCompanionAppIdentifer=%{public}@, launchSockPuppetAppOptions=%{public}@", (uint8_t *)&v9, 0x30u);
  }
  id v5 = *(void **)(a1 + 32);
  long long v6 = [v5 launchSockPuppetAppCompanionAppIdentifer];
  uint64_t v7 = [*(id *)(a1 + 32) launchSockPuppetAppOptions];
  uint64_t v8 = [*(id *)(a1 + 32) launchSockPuppetAppCompletion];
  [v5 _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:v6 options:v7 acxRetryGeneration:0 completion:v8];
}

void sub_100016190()
{
  v0 = wk_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446722;
    __int16 v3 = "_sendActiveComplicationsChangedNotification";
    __int16 v4 = 1024;
    int v5 = 2084;
    __int16 v6 = 2114;
    CFStringRef v7 = @"NativeComplications";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@", (uint8_t *)&v2, 0x1Cu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sockpuppet.complications.updated", 0, 0, 1u);
}

void sub_100016280(id a1)
{
  v4[0] = @"lg";
  v4[1] = @"kg";
  v4[2] = @"gs";
  int v1 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v2 = +[NSSet setWithArray:v1];
  __int16 v3 = (void *)qword_100052520;
  qword_100052520 = v2;
}

void sub_100016354(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100016384(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1000163C4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

void sub_1000163E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_100016460(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_10001648C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100017EE8(id a1)
{
  qword_100052530 = spUtils_allowedClassesForUserActivity();

  _objc_release_x1();
}

void sub_1000180A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000180BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000180CC(uint64_t a1)
{
}

id sub_1000180D4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setConnection:0];
}

void sub_1000180E8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  __int16 v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002ADD8(v2, v3);
  }
}

void sub_1000182D0(id a1)
{
  qword_100052550 = objc_alloc_init(SPApplicationManager);

  _objc_release_x1();
}

void sub_1000186C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000186F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CFStringRef v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002AE80();
    }
  }
  uint64_t v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);
  int v10 = [WeakRetained pkPluginManagementQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018814;
  v12[3] = &unk_100045D28;
  id v13 = v5;
  id v11 = v5;
  objc_copyWeak(&v14, v8);
  dispatch_sync(v10, v12);

  objc_destroyWeak(&v14);
}

void sub_100018814(uint64_t a1)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v2)
  {
    uint64_t v4 = (id *)(a1 + 40);
    uint64_t v24 = *(void *)v29;
    *(void *)&long long v3 = 136447234;
    long long v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        CFStringRef v7 = objc_msgSend(v6, "identifier", v22);
        uint64_t v8 = [v6 uuid];
        id WeakRetained = objc_loadWeakRetained(v4);
        int v10 = [WeakRetained continuouslyDiscoveredPlugins];
        id v11 = [v10 objectForKeyedSubscript:v7];

        int v12 = [[SPPlugInExtension alloc] initWithPlugin:v6];
        if (v11)
        {
          id v13 = [v11 objectForKeyedSubscript:@"uuid"];
          unsigned __int8 v14 = [v8 isEqual:v13];

          if (v14) {
            goto LABEL_18;
          }
          [v11 removeObjectForKey:@"startedBeginUsing"];
          [v11 removeObjectForKey:@"finishedBeginUsing"];
          __int16 v15 = [v11 objectForKeyedSubscript:@"plugin"];
          __int16 v16 = wk_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            __int16 v33 = "-[SPApplicationManager registerForContinuousPluginDiscovery]_block_invoke";
            __int16 v34 = 1024;
            int v35 = 266;
            __int16 v36 = 2114;
            int v37 = v7;
            __int16 v38 = 2114;
            unsigned int v39 = v6;
            __int16 v40 = 2114;
            uint64_t v41 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: about to replace plugin for %{public}@ with %{public}@. old plugin is %{public}@", buf, 0x30u);
          }

          [v11 setObject:v15 forKeyedSubscript:@"previousPlugin"];
          [v11 setObject:v6 forKeyedSubscript:@"plugin"];
          if (v12) {
            [v11 setObject:v12 forKeyedSubscript:@"extension"];
          }
          [v11 setObject:v8 forKeyedSubscript:@"uuid"];
          __int16 v17 = [v11 objectForKeyedSubscript:@"generation"];
          unsigned int v18 = [v17 unsignedIntValue];

          long long v19 = +[NSNumber numberWithUnsignedInt:v18 + 1];
          [v11 setObject:v19 forKeyedSubscript:@"generation"];

          [v15 setNotificationBlock:0];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100018D14;
          _OWORD v25[3] = &unk_100045D00;
          id v26 = v7;
          objc_copyWeak(&v27, v4);
          [v15 endUsing:v25];
          objc_destroyWeak(&v27);
        }
        else
        {
          id v11 = +[NSMutableDictionary dictionaryWithCapacity:3];
          [v11 setObject:v6 forKeyedSubscript:@"plugin"];
          [v11 setObject:v8 forKeyedSubscript:@"uuid"];
          [v11 setObject:&off_10004AC90 forKeyedSubscript:@"generation"];
          if (v12) {
            [v11 setObject:v12 forKeyedSubscript:@"extension"];
          }
          id v20 = objc_loadWeakRetained(v4);
          uint64_t v21 = [v20 continuouslyDiscoveredPlugins];
          [v21 setObject:v11 forKeyedSubscript:v7];

          __int16 v15 = wk_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            __int16 v33 = "-[SPApplicationManager registerForContinuousPluginDiscovery]_block_invoke";
            __int16 v34 = 1024;
            int v35 = 261;
            __int16 v36 = 2114;
            int v37 = v7;
            __int16 v38 = 2114;
            unsigned int v39 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: initially populated plugin for %{public}@ with %{public}@", buf, 0x26u);
          }
        }

LABEL_18:
      }
      id v2 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v2);
  }
}

void sub_100018CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
}

void sub_100018D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002AEFC();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained pkPluginManagementQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018E2C;
  v7[3] = &unk_1000459F0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v9);
}

void sub_100018E2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained callEndUsingCompletionsForPluginWithIdentifier:*(void *)(a1 + 32)];
}

void sub_1000190D8(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.companionappd"];
  uint64_t v4 = [v3 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = *(void **)(a1 + 32);
      id v8 = objc_retainBlock(*(id *)(a1 + 48));
      int v18 = 136446978;
      long long v19 = "-[SPApplicationManager callEndUsingCompletionsForPluginWithIdentifier:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 305;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2048;
      uint64_t v25 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: pluginIdentifier %{public}@ later calling completion %p", (uint8_t *)&v18, 0x26u);
    }
    id v9 = (void *)qword_100052540;
    id v10 = objc_retainBlock(*(id *)(a1 + 48));
    id v11 = +[NSValue valueWithNonretainedObject:v10];
    [v9 removeObjectForKey:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  int v12 = +[NSUserDefaults standardUserDefaults];
  id v13 = [v12 persistentDomainForName:@"com.apple.companionappd"];
  unsigned __int8 v14 = [v13 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    __int16 v16 = wk_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(id)qword_100052540 count];
      int v18 = 136446978;
      long long v19 = "-[SPApplicationManager callEndUsingCompletionsForPluginWithIdentifier:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 312;
      __int16 v22 = 2048;
      id v23 = v17;
      __int16 v24 = 2114;
      uint64_t v25 = qword_100052540;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: sAllOutstandingCompletions has %lu entries: %{public}@", (uint8_t *)&v18, 0x26u);
    }
  }
}

void sub_100019464(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100019478(id *a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.companionappd"];
  uint64_t v4 = [v3 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    if (qword_100052558 != -1) {
      dispatch_once(&qword_100052558, &stru_100045D98);
    }
    id v6 = (void *)qword_100052540;
    id v7 = a1[4];
    id v8 = objc_retainBlock(a1[5]);
    id v9 = +[NSValue valueWithNonretainedObject:v8];
    [v6 setObject:v7 forKeyedSubscript:v9];

    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = a1[4];
      id v12 = objc_retainBlock(a1[5]);
      *(_DWORD *)buf = 136446978;
      __int16 v36 = "-[SPApplicationManager waitForPreviousPluginToFinishEnding:toComplete:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 330;
      __int16 v39 = 2114;
      id v40 = v11;
      __int16 v41 = 2048;
      uint64_t v42 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: waiting for pluginIdentifier %{public}@ with completion %p", buf, 0x26u);
    }
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(id)qword_100052540 count];
      *(_DWORD *)buf = 136446978;
      __int16 v36 = "-[SPApplicationManager waitForPreviousPluginToFinishEnding:toComplete:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 331;
      __int16 v39 = 2048;
      id v40 = v14;
      __int16 v41 = 2114;
      uint64_t v42 = qword_100052540;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: sAllOutstandingCompletions has %lu entries: %{public}@", buf, 0x26u);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  __int16 v16 = [WeakRetained continuouslyDiscoveredPlugins];
  id v17 = [v16 objectForKeyedSubscript:a1[4]];

  int v18 = [v17 objectForKeyedSubscript:@"previousPlugin"];

  if (!v18)
  {
    id v27 = [v17 objectForKeyedSubscript:@"plugin"];
    id v28 = objc_loadWeakRetained(a1 + 6);
    long long v29 = [v28 pkPluginCompletionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019948;
    block[3] = &unk_100045D78;
    int v32 = a1[4];
    id v30 = a1[5];
    id v33 = v27;
    id v34 = v30;
    id v19 = v27;
    dispatch_async(v29, block);

    uint64_t v25 = v32;
LABEL_16:

    goto LABEL_17;
  }
  id v19 = [v17 objectForKeyedSubscript:@"didEndCompletions"];
  if (!v19)
  {
    id v19 = +[NSMutableArray array];
    [v17 setObject:v19 forKeyedSubscript:@"didEndCompletions"];
  }
  id v20 = [a1[5] copy];
  [v19 addObject:v20];

  int v21 = +[NSUserDefaults standardUserDefaults];
  __int16 v22 = [v21 persistentDomainForName:@"com.apple.companionappd"];
  id v23 = [v22 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v24 = [v23 BOOLValue];

  if (v24)
  {
    uint64_t v25 = wk_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = a1[4];
      *(_DWORD *)buf = 136446722;
      __int16 v36 = "-[SPApplicationManager waitForPreviousPluginToFinishEnding:toComplete:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 345;
      __int16 v39 = 2114;
      id v40 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: pluginIdentifier %{public}@ has a previous SPPluginManagementPreviousPluginKey entry. storing completion", buf, 0x1Cu);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void sub_100019908(id a1)
{
  qword_100052540 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

void sub_100019948(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.companionappd"];
  uint64_t v4 = [v3 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = objc_retainBlock(*(id *)(a1 + 48));
      int v18 = 136446978;
      id v19 = "-[SPApplicationManager waitForPreviousPluginToFinishEnding:toComplete:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 353;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2048;
      uint64_t v25 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: pluginIdentifier %{public}@ inline calling completion %p", (uint8_t *)&v18, 0x26u);
    }
    id v9 = (void *)qword_100052540;
    id v10 = objc_retainBlock(*(id *)(a1 + 48));
    id v11 = +[NSValue valueWithNonretainedObject:v10];
    [v9 removeObjectForKey:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v12 = +[NSUserDefaults standardUserDefaults];
  id v13 = [v12 persistentDomainForName:@"com.apple.companionappd"];
  id v14 = [v13 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    __int16 v16 = wk_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(id)qword_100052540 count];
      int v18 = 136446978;
      id v19 = "-[SPApplicationManager waitForPreviousPluginToFinishEnding:toComplete:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 360;
      __int16 v22 = 2048;
      id v23 = v17;
      __int16 v24 = 2114;
      uint64_t v25 = qword_100052540;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: sAllOutstandingCompletions has %lu entries: %{public}@", (uint8_t *)&v18, 0x26u);
    }
  }
}

void sub_100019CE0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100019CF4(id *a1)
{
  id v2 = [a1[4] identifier];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v4 = [WeakRetained continuouslyDiscoveredPlugins];
  unsigned int v5 = [v4 objectForKeyedSubscript:v2];

  id v6 = [v5 objectForKeyedSubscript:@"startedBeginUsing"];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = [v5 objectForKeyedSubscript:@"finishedBeginUsing"];
  unsigned int v9 = [v8 BOOLValue];

  if ((v7 & v9) == 1)
  {
    id v10 = [a1[5] pkPluginCompletionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A310;
    block[3] = &unk_100045510;
    id v48 = a1[6];
    dispatch_async(v10, block);

    id v11 = v48;
  }
  else
  {
    id v11 = [v5 objectForKeyedSubscript:@"didBeginCompletions"];
    if (v11)
    {
      if (v7) {
        goto LABEL_12;
      }
    }
    else
    {
      id v11 = +[NSMutableArray array];
      [v5 setObject:v11 forKeyedSubscript:@"didBeginCompletions"];
      id v12 = [a1[6] copy];
      [v11 addObject:v12];

      if (v7) {
        goto LABEL_12;
      }
    }
    id v13 = a1[4];
    id v14 = [a1[5] pkPluginManagementQueue];
    [v13 setReplyQueue:v14];

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"startedBeginUsing"];
    id v30 = +[NSUUID UUID];
    unsigned int v15 = wk_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [a1[4] identifier];
      id v17 = a1[4];
      *(_DWORD *)buf = 136447234;
      unsigned int v50 = "-[SPApplicationManager beginUsingPlugin:withCompletion:]_block_invoke";
      __int16 v51 = 1024;
      int v52 = 395;
      __int16 v53 = 2114;
      char v54 = v16;
      __int16 v55 = 2048;
      id v56 = v17;
      __int16 v57 = 2114;
      char v58 = v30;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: calling beginUsing: for plugin %{public}@ %p with beginUsingInstanceUUID %{public}@", buf, 0x30u);
    }
    int v18 = [a1[5] currentXcodeControlledPlugin];
    unsigned __int8 v19 = [v18 isEqualToString:v2];

    __int16 v20 = "v24@0:8@\"NSString\"16" + 3;
    if ((v19 & 1) == 0)
    {
      int v21 = [a1[5] pkPluginBeginUsingTimerQueue];
      dispatch_source_t v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v21);

      id v23 = [a1[5] pkPluginBeginUsingTimerQueue];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10001A324;
      v44[3] = &unk_100045560;
      v44[4] = a1[5];
      id v24 = v30;
      id v45 = v24;
      dispatch_source_t v46 = v22;
      uint64_t v25 = v22;
      dispatch_sync(v23, v44);

      dispatch_time_t v26 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001A380;
      handler[3] = &unk_100045E10;
      handler[4] = a1[5];
      id v27 = v24;
      id v40 = v27;
      id v41 = v5;
      objc_copyWeak(&v43, a1 + 7);
      id v42 = v2;
      dispatch_source_set_event_handler(v25, handler);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001A724;
      v37[3] = &unk_1000447C8;
      v37[4] = a1[5];
      id v38 = v27;
      dispatch_source_set_cancel_handler(v25, v37);
      dispatch_resume(v25);

      objc_destroyWeak(&v43);
      __int16 v20 = "@0:8@\"NSString\"16";
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = *((void *)v20 + 460);
    v31[2] = sub_10001A778;
    v31[3] = &unk_100045E38;
    id v28 = a1[4];
    v31[4] = a1[5];
    id v29 = v30;
    id v32 = v29;
    id v33 = a1[4];
    id v34 = v5;
    objc_copyWeak(&v36, a1 + 7);
    id v35 = v2;
    [v28 beginUsing:v31];

    objc_destroyWeak(&v36);
  }
LABEL_12:
}

void sub_10001A2F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A324(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) pkPluginBeginUsingTimers];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_10001A380(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pkPluginBeginUsingTimers];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002B00C();
    }

    unsigned int v5 = [*(id *)(a1 + 32) pkPluginManagementQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A4BC;
    v8[3] = &unk_100045DE8;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v11 = *(id *)(a1 + 56);
    dispatch_async(v5, v8);

    objc_destroyWeak(&v12);
  }
}

void sub_10001A4BC(id *a1)
{
  [a1[4] removeObjectForKey:@"startedBeginUsing"];
  [a1[4] removeObjectForKey:@"finishedBeginUsing"];
  uint64_t v2 = [a1[5] pkPluginCompletionQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A59C;
  v3[3] = &unk_1000459F0;
  objc_copyWeak(&v5, a1 + 7);
  id v4 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void sub_10001A59C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v5 = [v4 objectForKeyedSubscript:@"didBeginCompletions"];
  [v4 removeObjectForKey:@"didBeginCompletions"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        id v12 = +[SPError errorWithCode:](SPError, "errorWithCode:", 15, (void)v13);
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void sub_10001A724(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pkPluginBeginUsingTimers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10001A778(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pkPluginBeginUsingTimerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA88;
  block[3] = &unk_1000447C8;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v21 = v5;
  dispatch_async(v4, block);

  id v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 48) identifier];
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    id v23 = "-[SPApplicationManager beginUsingPlugin:withCompletion:]_block_invoke_4";
    __int16 v24 = 1024;
    int v25 = 440;
    __int16 v26 = 2114;
    id v27 = v7;
    __int16 v28 = 2048;
    uint64_t v29 = v8;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: beginUsing: for plugin %{public}@ %p with beginUsingInstanceUUID %{public}@ succeeded", buf, 0x30u);
  }
  uint64_t v10 = wk_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 48) identifier];
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    id v23 = "-[SPApplicationManager beginUsingPlugin:withCompletion:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 442;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2048;
    uint64_t v29 = v12;
    __int16 v30 = 2114;
    id v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: beginUsing: completion called for plugin %{public}@ %p with error %{public}@", buf, 0x30u);
  }
  long long v13 = *(void **)(a1 + 56);
  if (v3)
  {
    [v13 removeObjectForKey:@"startedBeginUsing"];
    [*(id *)(a1 + 56) removeObjectForKey:@"finishedBeginUsing"];
  }
  else
  {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"finishedBeginUsing"];
  }
  long long v14 = [*(id *)(a1 + 32) pkPluginCompletionQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001AB14;
  v16[3] = &unk_100045950;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  id v17 = *(id *)(a1 + 64);
  id v18 = v3;
  id v15 = v3;
  dispatch_async(v14, v16);

  objc_destroyWeak(&v19);
}

void sub_10001AA88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pkPluginBeginUsingTimers];
  source = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (source)
  {
    id v3 = [*(id *)(a1 + 32) pkPluginBeginUsingTimers];
    [v3 removeObjectForKey:*(void *)(a1 + 40)];

    dispatch_source_cancel(source);
  }
}

void sub_10001AB14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v5 = [v4 objectForKeyedSubscript:@"didBeginCompletions"];
  [v4 removeObjectForKey:@"didBeginCompletions"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void sub_10001AE1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_10001AE38(uint64_t a1)
{
  uint64_t v2 = +[PKHost defaultHost];
  id v3 = [v2 activePlugInForIdentifier:*(void *)(a1 + 32)];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v5 = [WeakRetained pkPluginCompletionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AFD0;
    block[3] = &unk_100045E88;
    id v6 = &v18;
    id v18 = *(id *)(a1 + 56);
    id v7 = &v17;
    id v17 = v3;
    dispatch_async(v5, block);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001AFE4;
    v12[3] = &unk_100045ED8;
    id v6 = (id *)v13;
    id v10 = v8;
    v13[0] = v10;
    id v7 = &v14;
    id v11 = *(id *)(a1 + 64);
    v13[1] = *(void *)(a1 + 40);
    id v14 = v11;
    id v15 = *(id *)(a1 + 56);
    [v9 discoverPlugInForIdentifier:v10 found:v12];
  }
}

uint64_t sub_10001AFD0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001AFE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v13 = [v5 identifier];
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136447490;
      __int16 v20 = "-[SPApplicationManager getOrBeginActivePlugInForApplication:setupBlock:completion:]_block_invoke_3";
      __int16 v21 = 1024;
      int v22 = 481;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      __int16 v25 = 2048;
      id v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%d: found plugin %{public}@ %p for %{public}@, errors is %{public}@", buf, 0x3Au);
    }
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 identifier];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136447234;
      __int16 v20 = "-[SPApplicationManager getOrBeginActivePlugInForApplication:setupBlock:completion:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 485;
      __int16 v23 = 2114;
      __int16 v24 = v9;
      __int16 v25 = 2048;
      id v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: calling beginUsingPlugin:: for plugin %{public}@ %p for %{public}@", buf, 0x30u);
    }
    id v11 = *(void **)(a1 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001B2AC;
    v15[3] = &unk_100045EB0;
    void v15[4] = v11;
    id v16 = *(id *)(a1 + 32);
    id v17 = v5;
    id v18 = *(id *)(a1 + 56);
    [v11 beginUsingPlugin:v17 withCompletion:v15];
  }
  else
  {
    long long v12 = wk_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B130();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001B2AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002B1B8(a1, (uint64_t)v3, v4);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) setExtension:*(void *)(a1 + 40) wasKilledDueToAppDeath:0];
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 48) identifier];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      int v10 = 136447234;
      id v11 = "-[SPApplicationManager getOrBeginActivePlugInForApplication:setupBlock:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 489;
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: beginUsingPlugin: for plugin %{public}@ %p for %{public}@ succeeded", (uint8_t *)&v10, 0x30u);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v5();
}

id sub_10001B56C(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 120) && *(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = +[NSMutableSet set];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 120);
    *(void *)(v3 + 120) = v2;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 120);
  if (*(unsigned char *)(a1 + 48))
  {
    return [v6 addObject:v5];
  }
  else
  {
    return [v6 removeObject:v5];
  }
}

id sub_10001B6C8(void *a1)
{
  id result = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10001BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BAEC(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_10001BF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001BF48(uint64_t a1)
{
  uint64_t v2 = +[PKHost defaultHost];
  id v3 = [v2 activePlugInForIdentifier:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v4 = [v3 pluginConnection];
    unsigned int v5 = [v4 processIdentifier];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained continuouslyDiscoveredPlugins];
    uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];

    [v8 setObject:v3 forKeyedSubscript:@"previousPlugin"];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001C0B4;
    v9[3] = &unk_100045F50;
    unsigned int v12 = v5;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v10 = *(id *)(a1 + 32);
    [v3 endUsing:v9];

    objc_destroyWeak(&v11);
  }
}

void sub_10001C0A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001C0B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  pid_t v4 = *(_DWORD *)(a1 + 48);
  if (v4) {
    kill(v4, 9);
  }
  unsigned int v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    unsigned int v12 = "-[SPApplicationManager stopUsingPluginIfNecessary:]_block_invoke_2";
    __int16 v13 = 1024;
    int v14 = 621;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: stopUsingPluginIfNecessary, endUsing, error: %{public}@", buf, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained pkPluginManagementQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C248;
  v8[3] = &unk_100045D28;
  id v9 = *(id *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async(v7, v8);

  objc_destroyWeak(&v10);
}

void sub_10001C248(uint64_t a1)
{
  uint64_t v2 = +[SPApplicationManager sharedInstance];
  [v2 callEndUsingCompletionsForPluginWithIdentifier:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

void sub_10001C54C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002B2A8();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    }
  }
}

void sub_10001C660(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C6F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C790(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001CAD4()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100052560;
  uint64_t v7 = qword_100052560;
  if (!qword_100052560)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001DC04;
    v3[3] = &unk_100045AD8;
    void v3[4] = &v4;
    sub_10001DC04((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10001CBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001CBB8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100052570;
  uint64_t v7 = qword_100052570;
  if (!qword_100052570)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001DDCC;
    v3[3] = &unk_100045AD8;
    void v3[4] = &v4;
    sub_10001DDCC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10001CC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001CDC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  uint64_t v7 = [v5 pluginsFoundBlock];
  ((void (**)(void, id, id))v7)[2](v7, v8, v6);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001CFA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 pluginsFoundBlock];
  ((void (**)(void, id, id))v8)[2](v8, v7, v5);

  id v9 = [v7 anyObject];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v9 identifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001D0F8;
    v12[3] = &unk_100045FC8;
    id v13 = v9;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    [v10 waitForPreviousPluginToFinishEnding:v11 toComplete:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001D0F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = *(id *)(a1 + 32);
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001D2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001D300(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  [v4 removeObjectForKey:@"startedBeginUsing"];
  [v4 removeObjectForKey:@"finishedBeginUsing"];
}

void sub_10001D59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001D5B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  id v5 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v4 = [v5 objectForKeyedSubscript:@"extension"];
  [v4 notifyActive];
}

void sub_10001D7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10001D818(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained continuouslyDiscoveredPlugins];
  id v7 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v4 = [v7 objectForKeyedSubscript:@"extension"];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    [v4 notifyInactiveWithCompletion:v6];
  }
  else if (v6)
  {
    (*(void (**)(void))(v6 + 16))(*(void *)(a1 + 40));
  }
}

void sub_10001D948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D9E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DC04(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_CDClientContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100052560 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10002B43C();
    sub_10001DC5C();
  }
}

void sub_10001DC5C()
{
  v1[0] = 0;
  if (!qword_100052568)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10001DD58;
    v1[4] = &unk_100045B10;
    v1[5] = v1;
    long long v2 = off_100046010;
    uint64_t v3 = 0;
    qword_100052568 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100052568)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10001DD58()
{
  uint64_t result = _sl_dlopen();
  qword_100052568 = result;
  return result;
}

Class sub_10001DDCC(uint64_t a1)
{
  sub_10001DC5C();
  Class result = objc_getClass("_CDContextQueries");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100052570 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SPProtoCacheSyncData *)sub_10002B464();
    return (Class)[(SPProtoCacheSyncData *)v3 description];
  }
  return result;
}

BOOL SPProtoCacheSyncDataReadFrom(uint64_t a1, uint64_t a2)
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
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3) {
        break;
      }
      if (v12 == 2)
      {
        id v14 = objc_alloc_init(SPProtoCacheAssets);
        uint64_t v15 = 16;
LABEL_23:
        objc_storeStrong((id *)(a1 + v15), v14);
        if (!PBReaderPlaceMark() || (SPProtoCacheAssetsReadFrom(v14, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_26;
      }
      if (v12 == 1)
      {
        uint64_t v13 = PBReaderReadString();
        id v14 = *(SPProtoCacheAssets **)(a1 + 8);
        *(void *)(a1 + 8) = v13;
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    id v14 = objc_alloc_init(SPProtoCacheAssets);
    uint64_t v15 = 24;
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t SPProtoSockPuppetIDSObjectReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v18 = PBReaderReadString();
      uint64_t v19 = 16;
    }
    else
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          while (1)
          {
            unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_33;
            }
            v13 += 7;
            BOOL v9 = v14++ >= 9;
            if (v9)
            {
              LODWORD(v15) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v15) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 24) = v15;
        }
        else
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        continue;
      }
      uint64_t v18 = PBReaderReadData();
      uint64_t v19 = 8;
    }
    __int16 v20 = *(void **)(a1 + v19);
    *(void *)(a1 + v19) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10001EE50(id a1)
{
  qword_100052580 = objc_alloc_init(SPTransport);

  _objc_release_x1();
}

void sub_10001F1A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F2FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_10001F50C(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  char v4 = *(void **)(a1 + 32);

  return [v4 wifiTimeOut];
}

void sub_10001F650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_10001F740(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPlist:*(void *)(a1 + 40) timeOut:*(void *)(a1 + 64) securityType:0 retryExpiration:0 tryGeneration:*(void *)(a1 + 48) withCompletion:*(double *)(a1 + 56)];
}

void sub_10002042C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020460(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020538;
  block[3] = &unk_100046080;
  void block[4] = v2;
  id v7 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 80);
  id v8 = v4;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 56);
  dispatch_sync(v3, block);
}

id sub_100020538(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPlist:*(void *)(a1 + 40) timeOut:*(void *)(a1 + 72) securityType:*(void *)(a1 + 48) retryExpiration:*(void *)(a1 + 80) tryGeneration:*(void *)(a1 + 56) withCompletion:*(double *)(a1 + 64)];
}

void sub_100020550(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messages];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

id sub_1000206B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendData:*(void *)(a1 + 40) forApplication:*(void *)(a1 + 48) idsPriority:*(void *)(a1 + 72) installer:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 64)];
}

void sub_100020DB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messages];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

void sub_100020F28(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 removeOutgoingMessageBlockIfIdentiferMatches:*(void *)(a1 + 40) sendError:0];
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      unint64_t v6 = *(void **)(a1 + 48);
      id v7 = [*(id *)(a1 + 32) secureRemoteService];
      CFStringRef v8 = @"insecure";
      *(void *)&uint8_t buf[4] = "-[SPTransport service:account:identifier:didSendWithSuccess:error:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 422;
      *(_DWORD *)buf = 136446978;
      *(_WORD *)&buf[18] = 2114;
      if (v6 == v7) {
        CFStringRef v8 = @"secure";
      }
      *(void *)&buf[20] = v5;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Got success sending message with identifier %{public}@ on %{public}@ service", buf, 0x26u);
    }
  }
  else
  {
    id v9 = v3;
    objc_sync_enter(v9);
    uint64_t v10 = [*(id *)(a1 + 32) outgoingMessageBlockedUntil];
    unsigned int v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

    objc_sync_exit(v9);
    if ((v11 & 1) != 0
      || [*(id *)(a1 + 56) code] == (id)31
      && ([*(id *)(a1 + 56) domain],
          char v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v13 isEqualToString:IDSErrorDomain],
          v13,
          v14))
    {
      if ([*(id *)(a1 + 32) handleDataProtectionSendFailureOrRetryFailureOnService:*(void *)(a1 + 48) account:*(void *)(a1 + 64) identifier:*(void *)(a1 + 40) error:*(void *)(a1 + 56)])return; {
      uint64_t v12 = wk_default_log();
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 40);
        id v41 = [*(id *)(a1 + 48) accounts];
        id v42 = [v41 anyObject];
        uint64_t v43 = [v42 serviceName];
        char v44 = (void *)v43;
        *(void *)&uint8_t buf[4] = "-[SPTransport service:account:identifier:didSendWithSuccess:error:]_block_invoke";
        CFStringRef v45 = @"ARE NOT";
        uint64_t v46 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136447746;
        *(_WORD *)&buf[12] = 1024;
        if (v11) {
          CFStringRef v45 = @"ARE";
        }
        *(_DWORD *)&buf[14] = 435;
        *(_WORD *)&buf[18] = 2114;
        CFStringRef v47 = &stru_100049900;
        *(void *)&buf[20] = v40;
        if (v11) {
          CFStringRef v47 = @" Unblocking now.";
        }
        *(_WORD *)&buf[28] = 2114;
        *(void *)&buf[30] = v43;
        *(_WORD *)&buf[38] = 2114;
        *(void *)id v62 = v45;
        *(_WORD *)&v62[8] = 2114;
        *(void *)&v62[10] = v47;
        *(_WORD *)&v62[18] = 2114;
        *(void *)&v62[20] = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%d: Got failure sending message with identifier (%{public}@) on service (%{public}@). sends currently %{public}@ blocked until send of this message.%{public}@ error: %{public}@", buf, 0x44u);
      }
      [*(id *)(a1 + 32) removeOutgoingMessageBlockIfIdentiferMatches:*(void *)(a1 + 40) sendError:*(void *)(a1 + 56)];
    }
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      id v30 = [*(id *)(a1 + 48) accounts];
      id v31 = [v30 anyObject];
      id v32 = [v31 serviceName];
      int v33 = *(unsigned __int8 *)(a1 + 72);
      id v34 = [*(id *)(a1 + 56) domain];
      id v35 = [*(id *)(a1 + 56) code];
      *(_DWORD *)buf = 136447746;
      *(void *)&uint8_t buf[4] = "-[SPTransport service:account:identifier:didSendWithSuccess:error:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 439;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v29;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v32;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)id v62 = v33;
      *(_WORD *)&v62[4] = 2114;
      *(void *)&v62[6] = v34;
      *(_WORD *)&v62[14] = 2048;
      *(void *)&v62[16] = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%d: identifier (%{public}@), serviceName (%{public}@), success: %d error, domain: %{public}@, code: %ld", buf, 0x40u);
    }
  }

  if ([*(id *)(a1 + 56) code] == (id)27) {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  CFStringRef v59 = @"error";
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    unint64_t v16 = *(void **)(a1 + 56);
  }
  else
  {
    unint64_t v16 = +[NSNull null];
  }
  BOOL v17 = v15 == 0;
  id v60 = v16;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  if (v17) {

  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100021618;
  *(void *)&buf[32] = sub_100021628;
  *(void *)id v62 = 0;
  uint64_t v19 = *(void *)(a1 + 32);
  __int16 v20 = *(NSObject **)(v19 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021630;
  block[3] = &unk_100045A68;
  unsigned int v50 = buf;
  void block[4] = v19;
  id v49 = *(id *)(a1 + 40);
  dispatch_sync(v20, block);
  __int16 v21 = *(void **)(*(void *)&buf[8] + 40);
  if (v21)
  {
    uint64_t v22 = [v21 objectForKeyedSubscript:@"completion"];
    __int16 v23 = v22;
    if (v22)
    {
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v18);
    }
    else
    {
      uint64_t v28 = wk_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(a1 + 40);
        __int16 v37 = [*(id *)(a1 + 48) accounts];
        id v38 = [v37 anyObject];
        __int16 v39 = [v38 serviceName];
        *(_DWORD *)__int16 v51 = 136446978;
        int v52 = "-[SPTransport service:account:identifier:didSendWithSuccess:error:]_block_invoke_2";
        __int16 v53 = 1024;
        int v54 = 457;
        __int16 v55 = 2114;
        uint64_t v56 = v36;
        __int16 v57 = 2114;
        char v58 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - cannot find completion block for (%{public}@) serviceName: (%{public}@)", v51, 0x26u);
      }
    }
  }
  else
  {
    __int16 v23 = wk_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      __int16 v25 = [*(id *)(a1 + 48) accounts];
      id v26 = [v25 anyObject];
      __int16 v27 = [v26 serviceName];
      *(_DWORD *)__int16 v51 = 136446978;
      int v52 = "-[SPTransport service:account:identifier:didSendWithSuccess:error:]_block_invoke";
      __int16 v53 = 1024;
      int v54 = 460;
      __int16 v55 = 2114;
      uint64_t v56 = v24;
      __int16 v57 = 2114;
      char v58 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - cannot find message for (%{public}@) serviceName: (%{public}@)", v51, 0x26u);
    }
  }

  _Block_object_dispose(buf, 8);
}

void sub_1000215D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021628(uint64_t a1)
{
}

void sub_100021630(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) messages];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) messages];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_100021B9C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _sendProtobuf:*(void *)(a1 + 40) sender:*(void *)(a1 + 48) timeOut:*(void *)(a1 + 80) securityType:0 retryExpiration:0 tryGeneration:*(void *)(a1 + 56) withCompletion:*(double *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100022830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002285C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 104);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022948;
  v6[3] = &unk_100046120;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 88);
  id v9 = v4;
  uint64_t v13 = v5;
  id v10 = *(id *)(a1 + 64);
  dispatch_sync(v3, v6);
}

id sub_100022948(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendProtobuf:*(void *)(a1 + 40) sender:*(void *)(a1 + 48) timeOut:*(void *)(a1 + 80) securityType:*(void *)(a1 + 56) retryExpiration:*(void *)(a1 + 88) tryGeneration:*(void *)(a1 + 64) withCompletion:*(double *)(a1 + 72)];
}

void sub_100022964(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messages];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

void sub_100022FF8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000230BC;
  v5[3] = &unk_1000447C8;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_after(v2, v4, v5);
}

void sub_1000230BC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 80) count] >= 0x15)
  {
    dispatch_time_t v2 = wk_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002BB58();
    }
  }
}

void sub_100023680(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1000236C0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) messages];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002372C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messages];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100023780(void *a1)
{
  id v2 = (void *)a1[4];
  id v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"protobuf"];
  uint64_t v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"sender"];
  id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"timeOut"];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"securityType"];
  id v8 = [v7 integerValue];
  uint64_t v9 = a1[7] + 1;
  uint64_t v10 = a1[5];
  uint64_t v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"completion"];
  [v2 _sendProtobuf:v12 sender:v3 timeOut:v8 securityType:v10 retryExpiration:v9 tryGeneration:v11 withCompletion:v6];
}

void sub_1000238CC(void *a1)
{
  id v2 = (void *)a1[4];
  id v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"propertyList"];
  uint64_t v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"timeOut"];
  [v3 doubleValue];
  double v5 = v4;
  double v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"securityType"];
  id v7 = [v6 integerValue];
  uint64_t v8 = a1[7] + 1;
  uint64_t v9 = a1[5];
  uint64_t v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"completion"];
  [v2 _sendPlist:v11 timeOut:v7 securityType:v9 retryExpiration:v8 tryGeneration:v10 withCompletion:v5];
}

void sub_100023C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023C60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0;
}

NSString *spUtils_uniqueNumber()
{
  ++word_100052588;
  v0 = +[NSProcessInfo processInfo];
  unsigned int v1 = [v0 processIdentifier];
  uint64_t v2 = (unsigned __int16)word_100052588 | (v1 << 16);

  return +[NSString stringWithFormat:@"%X", v2];
}

id spUtils_serializeObject(void *a1)
{
  if (a1)
  {
    var8[0] = 0;
    a1 = +[NSKeyedArchiver archivedDataWithRootObject:a1 requiringSecureCoding:1 error:var8];
    uint64_t v1 = var8[2];
  }
  return a1;
}

id spUtils_deserializeObject(void *a1, uint64_t a2)
{
  if (a1)
  {
    var8[0] = 0;
    a1 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:a2 fromData:a1 error:var8];
    uint64_t v2 = var8[2];
  }
  return a1;
}

id spUtils_allowedClassesForUserActivity()
{
  if (qword_100052598 != -1) {
    dispatch_once(&qword_100052598, &stru_100046310);
  }
  v0 = (void *)qword_100052590;

  return v0;
}

void sub_10002432C(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_100052590 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

id spUtils_localizedStringForSystemLanguage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSBundle bundleWithPath:v4];
  uint64_t v6 = +[NSLocale preferredLanguages];
  uint64_t v7 = [v6 firstObject];
  id v8 = v3;
  id v9 = v5;
  id v10 = v7;
  if (![v8 length] || !objc_msgSend(@"Localizable", "length") || !objc_msgSend(v10, "length")) {
    goto LABEL_9;
  }
  CFArrayRef v11 = [v9 localizations];
  CFArrayRef v12 = +[NSArray arrayWithObject:v10];
  CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (![(__CFArray *)v13 count]) {
    goto LABEL_7;
  }
  unsigned int v14 = [(__CFArray *)v13 objectAtIndex:0];
  uint64_t v15 = [v9 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v14];

  if (v15)
  {
    +[NSDictionary dictionaryWithContentsOfFile:v15];
    unint64_t v16 = v22 = v11;
    BOOL v17 = [v16 objectForKey:v8];

    CFArrayRef v11 = v22;
  }
  else
  {
LABEL_7:
    BOOL v17 = 0;
  }

  if (!v17)
  {
LABEL_9:
    BOOL v17 = [v9 localizedStringForKey:v8 value:&stru_100049900 table:@"Localizable"];
  }

  uint64_t v18 = v17;
  if (!v17)
  {
    uint64_t v19 = wk_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002BE28((uint64_t)v8, (uint64_t)v4, v19);
    }

    uint64_t v18 = v8;
  }
  id v20 = v18;

  return v20;
}

BOOL spUtils_appExtensionFirstUnlock()
{
  if (qword_1000525A0 != -1) {
    dispatch_once(&qword_1000525A0, &stru_100046330);
  }
  uint64_t state64 = 0;
  if (notify_get_state(dword_100052390, &state64))
  {
    v0 = wk_default_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_10002BF0C();
    }

    BOOL v1 = 1;
  }
  else
  {
    BOOL v1 = state64 != 0;
  }
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v6 = "spUtils_appExtensionFirstUnlock";
    __int16 v7 = 1024;
    int v8 = 190;
    __int16 v9 = 1024;
    BOOL v10 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: unlocked=%d", buf, 0x18u);
  }

  return v1;
}

void sub_1000247F0(id a1)
{
  if (notify_register_check((const char *)[@"com.apple.watchkit.notify.first_unlock" UTF8String], &dword_100052390))
  {
    BOOL v1 = 1;
  }
  else
  {
    BOOL v1 = dword_100052390 == -1;
  }
  if (v1)
  {
    uint64_t v2 = wk_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002BFA4();
    }
  }
}

NSString *spUtils_machTimeString()
{
  uint64_t v0 = mach_absolute_time();
  if (qword_1000525B0 != -1) {
    dispatch_once(&qword_1000525B0, &stru_100046350);
  }
  return +[NSString stringWithFormat:@" [%013.06f]", *(double *)&qword_1000525A8 * (double)v0];
}

void sub_1000248E8(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_1000525A8 = (double)v1 / (double)v2 / 1000000000.0;
}

BOOL spUtils_isRunningInF5DemoMode()
{
  if (qword_1000525C8 != -1) {
    dispatch_once(&qword_1000525C8, &stru_100046390);
  }
  return qword_1000525D0 == 5;
}

BOOL spUtils_isRunningInF201DemoMode()
{
  if (qword_1000525C8 != -1) {
    dispatch_once(&qword_1000525C8, &stru_100046390);
  }
  return qword_1000525D0 == 201;
}

uint64_t spUtils_isRunningInAnyDemoMode()
{
  if (qword_1000525C8 != -1) {
    dispatch_once(&qword_1000525C8, &stru_100046390);
  }
  return byte_1000525D8;
}

BOOL spUtils_isRTL()
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000525E0;
  uint64_t v9 = qword_1000525E0;
  if (!qword_1000525E0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100025764;
    v5[3] = &unk_100045AD8;
    v5[4] = &v6;
    sub_100025764((uint64_t)v5);
    uint64_t v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  unint64_t v2 = [v1 sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == (id)1;

  return v3;
}

void sub_100024AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id spUtils_SPURLQueryAllowedCharacterSet()
{
  if (qword_1000525C0 != -1) {
    dispatch_once(&qword_1000525C0, &stru_100046370);
  }
  uint64_t v0 = (void *)qword_1000525B8;

  return v0;
}

void sub_100024B58(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableCharacterSet);
  unint64_t v2 = (void *)qword_1000525B8;
  qword_1000525B8 = (uint64_t)v1;

  BOOL v3 = (void *)qword_1000525B8;
  id v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  uint64_t v5 = (void *)qword_1000525B8;

  [v5 removeCharactersInString:@"="];
}

id spUtils_companionConnectionClientIdentifier(int a1, int a2)
{
  if (a1 && a2)
  {
    id v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002C03C();
    }
  }
  uint64_t v5 = spUtils_uniqueNumber();
  uint64_t v6 = v5;
  if (!a1 || a2)
  {
    if (a2) {
      CFStringRef v7 = @"-";
    }
    else {
      CFStringRef v7 = @"_";
    }
    uint64_t v8 = [v5 stringByAppendingString:v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

uint64_t spUtils_isApplicationCompanionConnectionClientIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@"_"]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v1 hasSuffix:@"-"] ^ 1;
  }

  return v2;
}

id spUtils_isNotificationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return [a1 hasSuffix:@"-"];
}

id spUtils_isComplicationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return [a1 hasSuffix:@"_"];
}

void spUtils_dispatchSyncToMainThread(void *a1)
{
  block = a1;
  if (isRunningOnMainQueue()) {
    block[2]();
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

BOOL isRunningOnMainQueue()
{
  if (qword_1000525F8 != -1) {
    dispatch_once(&qword_1000525F8, &stru_1000463C8);
  }
  return dispatch_get_specific(&off_100052398) == &_dispatch_main_q;
}

void spUtils_dispatchAsyncToMainThread(void *a1)
{
  block = a1;
  if (isRunningOnMainQueue()) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

BOOL spUtils_subclassForObjectOverridesSelectorFromSuperclass(void *a1, uint64_t a2, void *a3)
{
  id v5 = [a1 methodForSelector:a2];
  return v5 != [a3 instanceMethodForSelector:a2];
}

id spUtils_UIColorFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (char *)[v1 rangeOfString:@"@"];
  if (v3)
  {
    id v4 = v2;
    double v5 = 1.0;
    if (v2 < (char *)[v1 length] - 1)
    {
      uint64_t v6 = [v1 substringFromIndex:v4 + 1];
      [v6 floatValue];
      double v8 = v7;

      double v9 = 0.0;
      if (v8 >= 0.0) {
        double v9 = v8;
      }
      double v5 = fmin(v9, 1.0);
    }
    BOOL v10 = [v1 substringToIndex:v4];
  }
  else
  {
    double v5 = 1.0;
    BOOL v10 = v1;
  }
  if (([v10 hasSuffix:@"Color"] & 1) == 0)
  {
    uint64_t v11 = [v10 stringByAppendingString:@"Color"];

    BOOL v10 = (void *)v11;
  }
  if ([v10 hasPrefix:@"_"])
  {
    do
    {
      CFArrayRef v12 = [v10 substringFromIndex:1];

      BOOL v10 = v12;
    }
    while (([v12 hasPrefix:@"_"] & 1) != 0);
  }
  else
  {
    CFArrayRef v12 = v10;
  }
  CFArrayRef v13 = NSSelectorFromString((NSString *)v12);
  sub_1000251C4();
  unsigned int v14 = (objc_class *)objc_opt_class();
  if (!class_getClassMethod(v14, v13))
  {

LABEL_21:
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    if ([v1 length])
    {
      switch(sscanf((const char *)[v1 cStringUsingEncoding:1], "%02x%02x%02x%02x", (char *)&v30 + 4, &v30, (char *)&v29 + 4, &v29))
      {
        case 1:
          id v18 = sub_1000251C4();
          double v19 = (double)SHIDWORD(v30) / 255.0;
          double v20 = 1.0;
          goto LABEL_25;
        case 2:
          id v18 = sub_1000251C4();
          double v19 = (double)SHIDWORD(v30) / 255.0;
          double v20 = (double)(int)v30 / 255.0;
LABEL_25:
          uint64_t v21 = [v18 colorWithWhite:v19 alpha:v20];
          goto LABEL_29;
        case 3:
          id v22 = sub_1000251C4();
          double v23 = (double)SHIDWORD(v30) / 255.0;
          double v24 = (double)(int)v30 / 255.0;
          double v25 = (double)SHIDWORD(v29) / 255.0;
          double v26 = 1.0;
          goto LABEL_28;
        case 4:
          id v22 = sub_1000251C4();
          double v23 = (double)SHIDWORD(v30) / 255.0;
          double v24 = (double)(int)v30 / 255.0;
          double v25 = (double)SHIDWORD(v29) / 255.0;
          double v26 = (double)(int)v29 / 255.0;
LABEL_28:
          uint64_t v21 = [v22 colorWithRed:v23 green:v24 blue:v25 alpha:v26];
LABEL_29:
          unint64_t v16 = (void *)v21;
          if (!v21) {
            break;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    __int16 v27 = wk_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002C0C8();
    }

    unint64_t v16 = 0;
    goto LABEL_33;
  }
  sub_1000251C4();
  uint64_t v15 = [(id)objc_opt_class() performSelector:v13];
  unint64_t v16 = v15;
  if (v15 && v5 < 1.0)
  {
    uint64_t v17 = [v15 colorWithAlphaComponent:v5];

    unint64_t v16 = (void *)v17;
  }

  if (!v16) {
    goto LABEL_21;
  }
LABEL_33:

  return v16;
}

id sub_1000251C4()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000525F0;
  uint64_t v7 = qword_1000525F0;
  if (!qword_1000525F0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10002592C;
    v3[3] = &unk_100045AD8;
    void v3[4] = &v4;
    sub_10002592C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100025290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025644(id a1)
{
  if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0))
  {
    byte_1000525D8 = 1;
    qword_1000525D0 = CFPreferencesGetAppIntegerValue(@"FProgramNumber", @"com.apple.demo-settings", 0);
  }
  id v1 = wk_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446978;
    uint64_t v3 = "DemoProgramNumber_block_invoke";
    __int16 v4 = 1024;
    int v5 = 234;
    __int16 v6 = 1024;
    int v7 = byte_1000525D8;
    __int16 v8 = 1024;
    int v9 = qword_1000525D0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Demo mode enabled = %d, Demo program number = %d", (uint8_t *)&v2, 0x1Eu);
  }
}

void sub_100025764(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIApplication");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000525E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10002C15C();
    sub_1000257BC();
  }
}

void sub_1000257BC()
{
  v1[0] = 0;
  if (!qword_1000525E8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_1000258B8;
    v1[4] = &unk_100045B10;
    v1[5] = v1;
    long long v2 = off_1000463B0;
    uint64_t v3 = 0;
    qword_1000525E8 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_1000525E8)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_1000258B8()
{
  uint64_t result = _sl_dlopen();
  qword_1000525E8 = result;
  return result;
}

void sub_10002592C(uint64_t a1)
{
  sub_1000257BC();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIColor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000525F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (void *)sub_10002C184();
    sub_100025984(v2);
  }
}

void sub_100025984(id a1)
{
}

Class sub_1000259A0(uint64_t a1)
{
  sub_1000257BC();
  Class result = objc_getClass("UIFont");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100052600 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10002C1AC();
    return (Class)sub_1000259F8(v3);
  }
  return result;
}

void sub_1000259F8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIFontDescriptor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100052608 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10002C1D4();
    sub_100025A50();
  }
}

id wk_default_log()
{
  if (qword_100052618 != -1) {
    dispatch_once(&qword_100052618, &stru_1000463E8);
  }
  uint64_t v0 = (void *)qword_100052610;

  return v0;
}

void sub_100025ABC(id a1)
{
  qword_100052610 = (uint64_t)os_log_create("com.apple.watchkit", "default");

  _objc_release_x1();
}

id wk_extension_loading_log()
{
  if (qword_100052628 != -1) {
    dispatch_once(&qword_100052628, &stru_100046408);
  }
  uint64_t v0 = (void *)qword_100052620;

  return v0;
}

void sub_100025B54(id a1)
{
  qword_100052620 = (uint64_t)os_log_create("com.apple.watchkit", "extension_loading");

  _objc_release_x1();
}

id wk_bg_app_refresh_log()
{
  if (qword_100052638 != -1) {
    dispatch_once(&qword_100052638, &stru_100046428);
  }
  uint64_t v0 = (void *)qword_100052630;

  return v0;
}

void sub_100025BEC(id a1)
{
  qword_100052630 = (uint64_t)os_log_create("com.apple.watchkit", "bg_app_refresh");

  _objc_release_x1();
}

void sub_100025CDC(id a1)
{
  qword_100052648 = objc_alloc_init(SPGizmoCacheManager);

  _objc_release_x1();
}

void sub_100025D6C(id a1)
{
  id v1 = NSHomeDirectory();
  v9[0] = v1;
  v9[1] = @"/Library/Caches/";
  v9[2] = @"com.apple.watchkit.imagecache";
  long long v2 = +[NSArray arrayWithObjects:v9 count:3];

  uint64_t v3 = +[NSString pathWithComponents:v2];
  __int16 v4 = (void *)qword_100052650;
  qword_100052650 = v3;

  int v5 = +[NSFileManager defaultManager];
  id v8 = 0;
  [v5 createDirectoryAtPath:qword_100052650 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v6 = v8;

  if (v6)
  {
    int v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002C1FC((uint64_t)v6, v7);
    }
  }
}

void sub_1000276C4(uint64_t a1)
{
  long long v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446722;
    double v26 = "-[SPGizmoCacheManager setupCacheWithIdentifier:completion:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 247;
    __int16 v29 = 2114;
    uint64_t v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: cache id: %{public}@", buf, 0x1Cu);
  }

  __int16 v4 = [*(id *)(a1 + 40) cacheDirectoryWithCacheIdentifier:*(void *)(a1 + 32) cacheType:1];
  int v5 = [*(id *)(a1 + 40) cacheAssets:v4 cacheType:1 cacheIdentifier:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    int v7 = [*(id *)(a1 + 40) cacheDirectoryWithCacheIdentifier:*(void *)(a1 + 32) cacheType:2];
    id v8 = [*(id *)(a1 + 40) cacheAssets:v7 cacheType:2 cacheIdentifier:*(void *)(a1 + 32)];
    if (v8)
    {
      int v9 = objc_opt_new();
      [v9 setCacheIdentifier:*(void *)(a1 + 32)];
      [v9 setPermanentCache:v5];
      [v9 setTransientCache:v8];
      if (*(void *)(a1 + 48))
      {
        BOOL v10 = wk_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10002C668();
        }
      }
      else
      {
        unint64_t v16 = *(void **)(a1 + 40);
        v19[0] = @"cmsg";
        v19[1] = @"s";
        v20[0] = &off_10004AD08;
        v20[1] = v9;
        BOOL v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
        [v16 sendCacheReply:v10 cacheIdentifier:*(void *)(a1 + 32)];
      }

      uint64_t v17 = wk_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446722;
        double v26 = "-[SPGizmoCacheManager setupCacheWithIdentifier:completion:]_block_invoke";
        __int16 v27 = 1024;
        int v28 = 276;
        __int16 v29 = 2114;
        uint64_t v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: done, cache id: %{public}@", buf, 0x1Cu);
      }
    }
    else
    {
      v21[0] = @"cmsg";
      v21[1] = @"e";
      CFArrayRef v13 = *(void **)(a1 + 40);
      v22[0] = &off_10004AD08;
      v22[1] = &off_10004ACA8;
      void v21[2] = @"t";
      void v22[2] = &off_10004AD38;
      unsigned int v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
      [v13 sendCacheReply:v14 cacheIdentifier:*(void *)(a1 + 32)];

      int v9 = wk_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446722;
        double v26 = "-[SPGizmoCacheManager setupCacheWithIdentifier:completion:]_block_invoke";
        __int16 v27 = 1024;
        int v28 = 261;
        __int16 v29 = 2114;
        uint64_t v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: error, transCache == nil, cache id: %{public}@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v23[0] = @"cmsg";
    v23[1] = @"e";
    v24[0] = &off_10004AD08;
    v24[1] = &off_10004ACA8;
    void v23[2] = @"t";
    v24[2] = &off_10004AD20;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    [v6 sendCacheReply:v11 cacheIdentifier:*(void *)(a1 + 32)];

    int v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      double v26 = "-[SPGizmoCacheManager setupCacheWithIdentifier:completion:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 253;
      __int16 v29 = 2114;
      uint64_t v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: error, permCache == nil, cache id: %{public}@", buf, 0x1Cu);
    }
  }
}

void sub_1000285C4(id a1, NSDictionary *a2)
{
  long long v2 = [(NSDictionary *)a2 objectForKeyedSubscript:&off_10004ACA8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = wk_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002C878();
    }
  }
}

void sub_10002901C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10002904C(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 objectForKeyedSubscript:@"title"];
  __int16 v4 = [v12 objectForKeyedSubscript:@"identifier"];
  int v5 = [v12 objectForKeyedSubscript:@"behavior"];
  id v6 = +[BBAction actionWithIdentifier:v4 title:v3];
  int v7 = [v12 objectForKeyedSubscript:@"destructive"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    int v9 = +[BBAppearance appearanceWithTitle:v3];
    [v9 setStyle:1];
    [v6 setAppearance:v9];
  }
  BOOL v10 = [v12 objectForKeyedSubscript:@"background"];
  unsigned int v11 = [v10 BOOLValue];

  [v6 setActivationMode:v11];
  if (v5) {
    objc_msgSend(v6, "setBehavior:", objc_msgSend(v5, "isEqualToString:", @"textInput"));
  }
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t sub_1000291CC(uint64_t a1, int a2)
{
  __int16 v4 = wk_default_log();
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      unsigned int v8 = "-[SPCompanionNotificationHandler injectBulletinWithSectionID:gizmoAppIdentifier:bulletinID:remoteNotification"
           "Context:forceStatic:completion:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 148;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -[BLTTestService addBulletin:::::] reported success", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10002C99C(v5);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002931C(id a1)
{
  qword_100052668 = objc_alloc_init(SPCompanionNotificationHandler);

  _objc_release_x1();
}

Class sub_10002939C(uint64_t a1)
{
  sub_1000293F4();
  Class result = objc_getClass("BBBulletinRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10002CA30();
  }
  qword_100052670 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000293F4()
{
  v3[0] = 0;
  if (!qword_100052678)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1000294F4;
    void v3[4] = &unk_100045B10;
    void v3[5] = v3;
    long long v4 = off_100046510;
    uint64_t v5 = 0;
    qword_100052678 = _sl_dlopen();
  }
  uint64_t v0 = qword_100052678;
  id v1 = (void *)v3[0];
  if (!qword_100052678)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000294F4()
{
  uint64_t result = _sl_dlopen();
  qword_100052678 = result;
  return result;
}

Class sub_100029568(uint64_t a1)
{
  sub_1000295C0();
  Class result = objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10002CA58();
  }
  qword_100052680 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000295C0()
{
  v1[0] = 0;
  if (!qword_100052688)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_1000296BC;
    v1[4] = &unk_100045B10;
    v1[5] = v1;
    long long v2 = off_100046528;
    uint64_t v3 = 0;
    qword_100052688 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_100052688)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_1000296BC()
{
  uint64_t result = _sl_dlopen();
  qword_100052688 = result;
  return result;
}

Class sub_100029730(uint64_t a1)
{
  sub_1000295C0();
  Class result = objc_getClass("UNNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10002CA80();
  }
  qword_100052690 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100029788(uint64_t a1)
{
  long long v2 = (void *)sub_1000293F4();
  Class result = dlsym(v2, "BLTBulletinContextArchivedUserNotificationKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100052698 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000297D8(uint64_t a1)
{
  sub_1000293F4();
  Class result = objc_getClass("BLTTestService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10002CAA8();
  }
  qword_1000526A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100029830()
{
  sub_100016344();
  sub_100016460((void *)&_mh_execute_header, v0, v1, "%{public}s:%d:   Total", v2, v3, v4, v5, 2u);
}

void sub_1000298B0()
{
  sub_100016344();
  sub_100016460((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: ", v2, v3, v4, v5, 2u);
}

void sub_100029930()
{
  sub_100016344();
  sub_100016460((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -------- IDS Data Transmitted (number of packets in each size)", v2, v3, v4, v5, 2u);
}

void sub_1000299B0()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Running in F5 demo mode", v2, v3, v4, v5, 2u);
}

void sub_100029A30()
{
  *(_DWORD *)uint64_t v3 = 136446722;
  sub_100016344();
  *(_DWORD *)&v3[7] = 575;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: *** Could not set up signal handler for %d.", (uint8_t *)v3, 0x18u);
}

void sub_100029AC0(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 processIdentifier];
  *(_DWORD *)int v7 = 136446978;
  sub_100016344();
  *(_DWORD *)&v7[7] = 657;
  v7[9] = 2114;
  uint64_t v8 = a1;
  __int16 v9 = v5;
  int v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: process %{public}@ with pid %d is not entitled. Rejecting connection", (uint8_t *)v7, 0x22u);
}

uint64_t sub_100029B78()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_100029B9C(v0);
}

void sub_100029B9C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: spPlistWithDictionary failed", v2, v3, v4, v5, 2u);
}

void sub_100029C1C()
{
  v2[0] = 136446978;
  sub_100016344();
  sub_1000163FC();
  sub_1000163E4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -[SPTransport sendProtobuf:::::] failed and it's been more than %1.0f seconds since the last kill of %{public}@, so killing the extension", (uint8_t *)v2);
}

void sub_100029C9C()
{
  v2[0] = 136446978;
  sub_100016344();
  sub_1000163FC();
  sub_1000163E4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -[SPTransport sendProtobuf:::::] failed, but it's been less than %1.0f seconds since the last reset of %{public}@, so just dropping the failure", (uint8_t *)v2);
}

void sub_100029D1C()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: sendProtobuf failed, error : %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100029D98()
{
  sub_10001648C(__stack_chk_guard);
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: sendToRemoteInterface, Unable to get plugin id for %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100029E14()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Semaphore timed out! Please file a radar.", v2, v3, v4, v5, 2u);
}

void sub_100029E94()
{
  sub_10001648C(__stack_chk_guard);
  int v2 = 136446978;
  sub_1000163A0();
  sub_100016420();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: ERROR: App extension not active: sending SPExtensionTerminatedCommand: %{public}@ %p", v2);
}

void sub_100029F10()
{
  int v2 = 136446978;
  sub_1000163A0();
  sub_100016420();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: ERROR: App extension not active:%{public}@ %p", v2);
}

void sub_100029F90()
{
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: activePlugInForIdentifier: returned nil for application %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A010()
{
  int v2 = 136446978;
  sub_10001647C();
  sub_100016440();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -[ACXDeviceConnection fetchApplicationWithContainingApplicationBundleID:completion:] returned %{public}@. will try %lu more times.", v2);
}

void sub_10002A09C()
{
  sub_10001648C(__stack_chk_guard);
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -[ACXDeviceConnection fetchApplicationWithContainingApplicationBundleID:completion:] returned fatal error %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A118()
{
  int v2 = 136446978;
  sub_10001647C();
  sub_100016440();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: -[ACXDeviceConnection fetchApplicationWithContainingApplicationBundleID:completion:] returned error %{public}@ after %lu tries. treating it as fatal", v2);
}

void sub_10002A1A0()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Installation of %{public}@ failed", v2, v3, v4, v5, 2u);
}

void sub_10002A21C(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  v8[0] = 136446978;
  sub_100016344();
  sub_100016370();
  __int16 v9 = v4;
  uint64_t v10 = a1;
  id v6 = v5;
  sub_1000163E4((void *)&_mh_execute_header, a2, v7, "%{public}s:%d: Got a value for SPDeviceBacklightAssertionTime that isn't an NSNumber. Ignoring it. Value has class %{public}@ and value %{public}@", (uint8_t *)v8);
}

void sub_10002A2C8()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: got empty remoteNotificationPayload. nothing to post", v2, v3, v4, v5, 2u);
}

void sub_10002A348()
{
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Got request to terminate Gizmo app for Companion app with identifier %{public}@, but no such app was found", v2, v3, v4, v5, 2u);
}

void sub_10002A3C8(const char *a1, NSObject *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  v4[0] = 136446722;
  sub_100016344();
  sub_100016370();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: %{public}@ was called with non-nil reply block on the companion side. The reply will never be called!", (uint8_t *)v4, 0x1Cu);
}

void sub_10002A470()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: This call is no longer supported", v2, v3, v4, v5, 2u);
}

void sub_10002A4F0()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Error - could not initialize protoPlist", v2, v3, v4, v5, 2u);
}

void sub_10002A570()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Error - could not deserialize protoPlist", v2, v3, v4, v5, 2u);
}

void sub_10002A5F0()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Error - could not send deserialize data (%{public}@)", v2, v3, v4, v5, 2u);
}

void sub_10002A66C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 logDictionary:a2];
  *(_DWORD *)id v6 = 136446723;
  sub_100016344();
  *(_DWORD *)&v6[7] = 1366;
  v6[9] = 2113;
  uint64_t v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ComD:<-IDS dictionary=%{private}@", (uint8_t *)v6, 0x1Cu);
}

void sub_10002A724()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A7A0()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: pluginIdentifier is nil. ignoring", v2, v3, v4, v5, 2u);
}

void sub_10002A820()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: processIdentifier is 0 for xpcConnection %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A89C()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: xpcConnection is nil for plugin %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A918()
{
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: waitForPreviousPluginToFinishEnding: provided nil for pluginIdentifier %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002A998()
{
  *(_DWORD *)uint64_t v4 = 136446978;
  sub_10001647C();
  *(_DWORD *)&v4[7] = 1639;
  v4[9] = 2114;
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to acquire process assertion for pluginIdentifier %{public}@ pid %d", (uint8_t *)v4, 0x22u);
}

void sub_10002AA3C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: unknown proto data", v2, v3, v4, v5, 2u);
}

void sub_10002AABC()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: unknown proto data", v2, v3, v4, v5, 2u);
}

void sub_10002AB3C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to deserialuze proto data", v2, v3, v4, v5, 2u);
}

void sub_10002ABBC()
{
  sub_10001648C(__stack_chk_guard);
  *(_DWORD *)uint64_t v3 = 136446978;
  sub_1000163A0();
  *(_DWORD *)&v3[7] = 1953;
  v3[9] = 2048;
  uint64_t v4 = 0x4039000000000000;
  __int16 v5 = 2114;
  uint64_t v6 = v0;
  sub_1000163E4((void *)&_mh_execute_header, v1, v2, "%{public}s:%d: After %1.1f seconds, %{public}@ is still marked as doing a bg update. Unmarking bg update status", (uint8_t *)v3);
}

void sub_10002AC58()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Would have ended up with a negative bgUpdateCount. Flooring to 0", v2, v3, v4, v5, 2u);
}

void sub_10002ACD8()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to initialize protoPlist", v2, v3, v4, v5, 2u);
}

void sub_10002AD58()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to deserialize dictionary", v2, v3, v4, v5, 2u);
}

void sub_10002ADD8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  v4[0] = 136446722;
  sub_100016344();
  sub_100016370();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: Unable to setup extension context - error: %{public}@", (uint8_t *)v4, 0x1Cu);
}

void sub_10002AE80()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Got errors %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002AEFC()
{
  int v2 = 136446978;
  sub_1000163A0();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Got error %{public}@ shutting down old plugin for %{public}@", v2);
}

void sub_10002AF90()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: plugin from dict %{public}@ is nil. this shouldn't happen!", v2, v3, v4, v5, 2u);
}

void sub_10002B00C()
{
  *(_DWORD *)uint64_t v2 = 136446978;
  sub_1000163A0();
  *(_DWORD *)&v2[7] = 409;
  v2[9] = 2048;
  uint64_t v3 = 0x4024000000000000;
  __int16 v4 = 2114;
  uint64_t v5 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: * * * After %1.1f secs, beginUsing: hasn't called us back for plugin with beginUsingInstanceUUID %{public}@", (uint8_t *)v2, 0x26u);
}

void sub_10002B0B4()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: [SPSharedApplicationManager pluginIdentifierForProtocolIdentifier:] return nil for %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B130()
{
  int v2 = 136446978;
  sub_1000163A0();
  sub_1000163B0();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Unable to locate plugin for '%{public}@' (%{public}@)", v2);
}

void sub_10002B1B8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [*(id *)(a1 + 48) identifier];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  int v9 = 136447490;
  uint64_t v10 = "-[SPApplicationManager getOrBeginActivePlugInForApplication:setupBlock:completion:]_block_invoke";
  __int16 v11 = 1024;
  int v12 = 492;
  __int16 v13 = 2114;
  unsigned int v14 = v6;
  __int16 v15 = 2048;
  uint64_t v16 = v7;
  __int16 v17 = 2114;
  uint64_t v18 = v8;
  __int16 v19 = 2114;
  uint64_t v20 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Unable to start plugin %{public}@ %p with identifier %{public}@ (%{public}@)", (uint8_t *)&v9, 0x3Au);
}

void sub_10002B2A8()
{
  sub_100016344();
  sub_100016370();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Failed to retrieve the list of installed applications. Error = %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B324()
{
  v1[0] = 136446466;
  sub_100016344();
  *(_DWORD *)((char *)&v1[3] + 2) = 730;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: Passed a nil duetSessionDictionary. This shouldn't have happened", (uint8_t *)v1, 0x12u);
}

void sub_10002B3B0()
{
  sub_1000163A0();
  sub_1000163B0();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: gizmoApplicationState is an unexpected value. duetSessionDictionary=%{public}@", v2, v3, v4, v5, 2u);
}

uint64_t sub_10002B43C()
{
  uint64_t v0 = abort_report_np();
  return sub_10002B464(v0);
}

uint64_t sub_10002B464()
{
  uint64_t v0 = abort_report_np();
  return sub_10002B48C(v0);
}

void sub_10002B48C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: canSend == NO", v2, v3, v4, v5, 2u);
}

void sub_10002B50C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: propertyList == nil", v2, v3, v4, v5, 2u);
}

void sub_10002B58C()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: IDS outgoingData == nil", v2, v3, v4, v5, 2u);
}

void sub_10002B60C()
{
  sub_100016344();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: dataWithPropertyListe error: (%{public}@)", v2, v3, v4, v5, 2u);
}

void sub_10002B694()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: canSend == NO", v2, v3, v4, v5, 2u);
}

void sub_10002B714()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: IDS outgoingData == nil", v2, v3, v4, v5, 2u);
}

void sub_10002B794()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: canSend == NO", v2, v3, v4, v5, 2u);
}

void sub_10002B814(void *a1, NSObject *a2)
{
  uint64_t v4 = spUtils_machTimeString();
  uint64_t v5 = [a1 data];
  [v5 length];
  *(_DWORD *)uint64_t v8 = 136446978;
  sub_100016344();
  *(_DWORD *)&int v8[7] = 577;
  v8[9] = 2114;
  int v9 = v4;
  __int16 v10 = v6;
  int v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s:%d: # # # # %{public}@ size=%d", (uint8_t *)v8, 0x22u);
}

void sub_10002B8F8()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: secure transport required, but haven't unlocked since boot. Tossing send request.", v2, v3, v4, v5, 2u);
}

void sub_10002B978()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Trying to send with insecure, but we have no insecure remote service.", v2, v3, v4, v5, 2u);
}

void sub_10002B9F8()
{
  sub_100016344();
  sub_100016354((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Trying to send with insecure, but we have no insecure remote service.", v2, v3, v4, v5, 2u);
}

void sub_10002BA78(void *a1, NSObject *a2)
{
  uint64_t v4 = spUtils_machTimeString();
  uint64_t v5 = [a1 data];
  [v5 length];
  *(_DWORD *)uint64_t v8 = 136446978;
  sub_100016344();
  *(_DWORD *)&int v8[7] = 702;
  v8[9] = 2114;
  int v9 = v4;
  __int16 v10 = v6;
  int v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s:%d: # # # # %{public}@ size=%d", (uint8_t *)v8, 0x22u);
}

void sub_10002BB58()
{
  sub_100016344();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: %lu retained IDSMessageContexts", v2, v3, v4, v5, 2u);
}

void sub_10002BBE0()
{
  *(_DWORD *)uint64_t v3 = 136446978;
  sub_100016344();
  *(_DWORD *)&v3[7] = 770;
  v3[9] = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2114;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: Got error re-trying to send the message we're blocked on, but we've done first unlock. Will try again in %1.0f seconds. %{public}@", (uint8_t *)v3, 0x26u);
}

void sub_10002BC80()
{
  sub_100016344();
  sub_100023E34();
  sub_100016384((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: Got data protection class send failure, but we've done first unlock. Giving up after %1.0f seconds", v2, v3, v4, v5, 2u);
}

void sub_10002BD00()
{
  v2[0] = 136446978;
  sub_100016344();
  sub_100023E34();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Got error re-trying to send the message we're blocked on, but we've done first unlock. Giving up after %1.0f seconds. %{public}@", (uint8_t *)v2, 0x26u);
}

void sub_10002BD94(os_log_t log)
{
  int v1 = 136446466;
  uint64_t v2 = "+[SPIDSProtobuf protobufWithSPPlist:identifier:]";
  __int16 v3 = 1024;
  int v4 = 33;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to serialize spList", (uint8_t *)&v1, 0x12u);
}

void sub_10002BE28(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = +[NSFileManager defaultManager];
  [v6 fileExistsAtPath:a2];
  *(_DWORD *)int v9 = 136447234;
  sub_100016344();
  *(_DWORD *)&v9[7] = 157;
  v9[9] = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  __int16 v13 = v7;
  int v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to localize key \"%{public}@\" in bundle at %{public}@. bundleExists=%d", (uint8_t *)v9, 0x2Cu);
}

void sub_10002BF0C()
{
  int v1 = 136446978;
  uint64_t v2 = "spUtils_appExtensionFirstUnlock";
  __int16 v3 = 1024;
  sub_100025A50();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: notify_get_state failed with error=%d token=%d", (uint8_t *)&v1, 0x1Eu);
}

void sub_10002BFA4()
{
  int v1 = 136446978;
  uint64_t v2 = "spUtils_appExtensionFirstUnlock_block_invoke";
  __int16 v3 = 1024;
  sub_100025A50();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: notify_register_check failed with error=%d token=%d", (uint8_t *)&v1, 0x1Eu);
}

void sub_10002C03C()
{
  v1[0] = 136446466;
  sub_100016344();
  *(_DWORD *)((char *)&v1[3] + 2) = 280;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: isApplication and isNotification can't both be true", (uint8_t *)v1, 0x12u);
}

void sub_10002C0C8()
{
  *(_DWORD *)uint64_t v2 = 136446722;
  sub_100016344();
  *(_DWORD *)&int v2[7] = 364;
  v2[9] = 2114;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - unable to parse string '%{public}@' as UIColor method or hex value", (uint8_t *)v2, 0x1Cu);
}

uint64_t sub_10002C15C()
{
  uint64_t v0 = abort_report_np();
  return sub_10002C184(v0);
}

uint64_t sub_10002C184()
{
  uint64_t v0 = abort_report_np();
  return sub_10002C1AC(v0);
}

uint64_t sub_10002C1AC()
{
  uint64_t v0 = abort_report_np();
  return sub_10002C1D4(v0);
}

uint64_t sub_10002C1D4()
{
  uint64_t v0 = abort_report_np();
  return sub_10002C1FC(v0);
}

void sub_10002C1FC(uint64_t a1, NSObject *a2)
{
  int v2 = 136446978;
  uint64_t v3 = "-[SPGizmoCacheManager cacheDirectory]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 56;
  __int16 v6 = 2114;
  uint64_t v7 = qword_100052650;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to create directory at %{public}@, error: %{public}@", (uint8_t *)&v2, 0x26u);
}

void sub_10002C2A8()
{
  v1[0] = 136446722;
  sub_100016344();
  sub_100016370();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to delete cache, error: %{public}@", (uint8_t *)v1, 0x1Cu);
}

void sub_10002C330(uint64_t a1, void *a2, NSObject *a3)
{
  int v5 = [a2 assetKey];
  *(_DWORD *)uint64_t v7 = 136446978;
  sub_100016344();
  *(_DWORD *)&v7[7] = 134;
  v7[9] = 2114;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: image not found for cache id: %{public}@, asset key: %{public}@", (uint8_t *)v7, 0x26u);
}

void sub_10002C3FC()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to write asset at: %{public}@, error: %{public}@", v2);
}

void sub_10002C478()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to write asset at: %{public}@, error: %{public}@", v2);
}

void sub_10002C4F4()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@", v2);
}

void sub_10002C570()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@", v2);
}

void sub_10002C5EC()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@", v2);
}

void sub_10002C668()
{
  v1[0] = 136446466;
  sub_100016344();
  *(_DWORD *)((char *)&v1[3] + 2) = 271;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: should not be called with completion", (uint8_t *)v1, 0x12u);
}

void sub_10002C6F4()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: contentsOfDirectoryAtURL failed at: %{public}@, error: %{public}@", v2);
}

void sub_10002C770()
{
  int v2 = 136446978;
  sub_100016344();
  sub_100028684();
  sub_1000163C4((void *)&_mh_execute_header, v0, v1, "%{public}s:%d: failed to create directory at: %{public}@, error: %{public}@", v2);
}

void sub_10002C7EC()
{
  v1[0] = 136446466;
  sub_100016344();
  *(_DWORD *)((char *)&v1[3] + 2) = 353;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: SPProtoSerializer failed", (uint8_t *)v1, 0x12u);
}

void sub_10002C878()
{
  v1[0] = 136446722;
  sub_100016344();
  sub_100016370();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: sendPlist, sendPlist failed, error : %{public}@", (uint8_t *)v1, 0x1Cu);
}

void sub_10002C900(uint64_t a1, NSObject *a2)
{
  int v2 = 136446722;
  uint64_t v3 = "-[SPCompanionNotificationHandler injectBulletinWithSectionID:gizmoAppIdentifier:bulletinID:remoteNotificationCont"
       "ext:forceStatic:completion:]";
  __int16 v4 = 1024;
  int v5 = 72;
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to archive a UNNotification: %{public}@", (uint8_t *)&v2, 0x1Cu);
}

void sub_10002C99C(os_log_t log)
{
  int v1 = 136446466;
  int v2 = "-[SPCompanionNotificationHandler injectBulletinWithSectionID:gizmoAppIdentifier:bulletinID:remoteNotificationCont"
       "ext:forceStatic:completion:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 150;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s:%d: -[BLTTestService addBulletin:::::] reported failure", (uint8_t *)&v1, 0x12u);
}

void sub_10002CA30()
{
  uint64_t v0 = abort_report_np();
  sub_10002CA58(v0);
}

void sub_10002CA58()
{
  uint64_t v0 = abort_report_np();
  sub_10002CA80(v0);
}

void sub_10002CA80()
{
  uint64_t v0 = abort_report_np();
  sub_10002CAA8(v0);
}

void sub_10002CAA8()
{
  CFArrayRef v0 = (const __CFArray *)abort_report_np();
  CFBundleCopyLocalizationsForPreferences(v0, v1);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return _CFBundleCopyLocalizationsForPreferences(locArray, prefArray);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return _PLShouldLogRegisteredEvent();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return _class_getClassMethod(cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__bareExtensionServiceConnection(void *a1, const char *a2, ...)
{
  return [a1 _bareExtensionServiceConnection];
}

id objc_msgSend__cancelLaunchSockPuppetAppTimeout(void *a1, const char *a2, ...)
{
  return [a1 _cancelLaunchSockPuppetAppTimeout];
}

id objc_msgSend__checkUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 _checkUnlockedSinceBoot];
}

id objc_msgSend__logUsageData(void *a1, const char *a2, ...)
{
  return [a1 _logUsageData];
}

id objc_msgSend__printSeparator(void *a1, const char *a2, ...)
{
  return [a1 _printSeparator];
}

id objc_msgSend__saveReceiveTime(void *a1, const char *a2, ...)
{
  return [a1 _saveReceiveTime];
}

id objc_msgSend__setupSignalHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupSignalHandlers];
}

id objc_msgSend__textSize(void *a1, const char *a2, ...)
{
  return [a1 _textSize];
}

id objc_msgSend__textSizeChanged(void *a1, const char *a2, ...)
{
  return [a1 _textSizeChanged];
}

id objc_msgSend__unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 _unlockedSinceBoot];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_accessDate(void *a1, const char *a2, ...)
{
  return [a1 accessDate];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return [a1 active];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appUsageTrack(void *a1, const char *a2, ...)
{
  return [a1 appUsageTrack];
}

id objc_msgSend_applicationID(void *a1, const char *a2, ...)
{
  return [a1 applicationID];
}

id objc_msgSend_applicationInstallationInfo(void *a1, const char *a2, ...)
{
  return [a1 applicationInstallationInfo];
}

id objc_msgSend_applicationIsStillActive(void *a1, const char *a2, ...)
{
  return [a1 applicationIsStillActive];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetData(void *a1, const char *a2, ...)
{
  return [a1 assetData];
}

id objc_msgSend_assetKey(void *a1, const char *a2, ...)
{
  return [a1 assetKey];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_assetsCount(void *a1, const char *a2, ...)
{
  return [a1 assetsCount];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_batteryStateObserver(void *a1, const char *a2, ...)
{
  return [a1 batteryStateObserver];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 cacheDirectory];
}

id objc_msgSend_cacheIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cacheIdentifier];
}

id objc_msgSend_cacheMessage(void *a1, const char *a2, ...)
{
  return [a1 cacheMessage];
}

id objc_msgSend_cacheType(void *a1, const char *a2, ...)
{
  return [a1 cacheType];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_clearAssets(void *a1, const char *a2, ...)
{
  return [a1 clearAssets];
}

id objc_msgSend_clearObjects(void *a1, const char *a2, ...)
{
  return [a1 clearObjects];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionAppIDsInstalledViaXcode(void *a1, const char *a2, ...)
{
  return [a1 companionAppIDsInstalledViaXcode];
}

id objc_msgSend_companionAppIDsInstalledViaXcodeLock(void *a1, const char *a2, ...)
{
  return [a1 companionAppIDsInstalledViaXcodeLock];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_continuouslyDiscoveredPlugins(void *a1, const char *a2, ...)
{
  return [a1 continuouslyDiscoveredPlugins];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentXcodeControlledPlugin(void *a1, const char *a2, ...)
{
  return [a1 currentXcodeControlledPlugin];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateOfFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 dateOfFirstUnlock];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultHost(void *a1, const char *a2, ...)
{
  return [a1 defaultHost];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didReceiveSecureData(void *a1, const char *a2, ...)
{
  return [a1 didReceiveSecureData];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainUpdateLock(void *a1, const char *a2, ...)
{
  return [a1 domainUpdateLock];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_extensionVendor(void *a1, const char *a2, ...)
{
  return [a1 extensionVendor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fontAttributes(void *a1, const char *a2, ...)
{
  return [a1 fontAttributes];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_gizmoCacheIdentifier(void *a1, const char *a2, ...)
{
  return [a1 gizmoCacheIdentifier];
}

id objc_msgSend_gizmoPersistentDomain(void *a1, const char *a2, ...)
{
  return [a1 gizmoPersistentDomain];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsPriority(void *a1, const char *a2, ...)
{
  return [a1 idsPriority];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_insecureRemoteService(void *a1, const char *a2, ...)
{
  return [a1 insecureRemoteService];
}

id objc_msgSend_installer(void *a1, const char *a2, ...)
{
  return [a1 installer];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_jobType(void *a1, const char *a2, ...)
{
  return [a1 jobType];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyPathForServicesAppearingForeground(void *a1, const char *a2, ...)
{
  return [a1 keyPathForServicesAppearingForeground];
}

id objc_msgSend_killWiFiTimer(void *a1, const char *a2, ...)
{
  return [a1 killWiFiTimer];
}

id objc_msgSend_lastExtensionKilledDates(void *a1, const char *a2, ...)
{
  return [a1 lastExtensionKilledDates];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchSockPuppetAppCompanionAppIdentifer(void *a1, const char *a2, ...)
{
  return [a1 launchSockPuppetAppCompanionAppIdentifer];
}

id objc_msgSend_launchSockPuppetAppCompletion(void *a1, const char *a2, ...)
{
  return [a1 launchSockPuppetAppCompletion];
}

id objc_msgSend_launchSockPuppetAppOptions(void *a1, const char *a2, ...)
{
  return [a1 launchSockPuppetAppOptions];
}

id objc_msgSend_launchSockPuppetAppQueue(void *a1, const char *a2, ...)
{
  return [a1 launchSockPuppetAppQueue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localConnections(void *a1, const char *a2, ...)
{
  return [a1 localConnections];
}

id objc_msgSend_localListener(void *a1, const char *a2, ...)
{
  return [a1 localListener];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logQueue(void *a1, const char *a2, ...)
{
  return [a1 logQueue];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return [a1 messages];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nBOOL(void *a1, const char *a2, ...)
{
  return [a1 nBOOL];
}

id objc_msgSend_ndouble(void *a1, const char *a2, ...)
{
  return [a1 ndouble];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextTransactionID(void *a1, const char *a2, ...)
{
  return [a1 nextTransactionID];
}

id objc_msgSend_nfloat(void *a1, const char *a2, ...)
{
  return [a1 nfloat];
}

id objc_msgSend_nint32(void *a1, const char *a2, ...)
{
  return [a1 nint32];
}

id objc_msgSend_nint64(void *a1, const char *a2, ...)
{
  return [a1 nint64];
}

id objc_msgSend_notifyActive(void *a1, const char *a2, ...)
{
  return [a1 notifyActive];
}

id objc_msgSend_nuint64(void *a1, const char *a2, ...)
{
  return [a1 nuint64];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectData(void *a1, const char *a2, ...)
{
  return [a1 objectData];
}

id objc_msgSend_objectsCount(void *a1, const char *a2, ...)
{
  return [a1 objectsCount];
}

id objc_msgSend_outgoingMessageBlockedUntil(void *a1, const char *a2, ...)
{
  return [a1 outgoingMessageBlockedUntil];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_outstandingtransactions(void *a1, const char *a2, ...)
{
  return [a1 outstandingtransactions];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return [a1 paired];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_permanentCache(void *a1, const char *a2, ...)
{
  return [a1 permanentCache];
}

id objc_msgSend_pkPluginBeginUsingTimerQueue(void *a1, const char *a2, ...)
{
  return [a1 pkPluginBeginUsingTimerQueue];
}

id objc_msgSend_pkPluginBeginUsingTimers(void *a1, const char *a2, ...)
{
  return [a1 pkPluginBeginUsingTimers];
}

id objc_msgSend_pkPluginCompletionQueue(void *a1, const char *a2, ...)
{
  return [a1 pkPluginCompletionQueue];
}

id objc_msgSend_pkPluginManagementQueue(void *a1, const char *a2, ...)
{
  return [a1 pkPluginManagementQueue];
}

id objc_msgSend_plugInIdentifierForXcodeProcessAssertion(void *a1, const char *a2, ...)
{
  return [a1 plugInIdentifierForXcodeProcessAssertion];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return [a1 plugInKitPlugins];
}

id objc_msgSend_plugInPrincipal(void *a1, const char *a2, ...)
{
  return [a1 plugInPrincipal];
}

id objc_msgSend_pluginConnection(void *a1, const char *a2, ...)
{
  return [a1 pluginConnection];
}

id objc_msgSend_pluginKitDictionary(void *a1, const char *a2, ...)
{
  return [a1 pluginKitDictionary];
}

id objc_msgSend_pluginsFoundBlock(void *a1, const char *a2, ...)
{
  return [a1 pluginsFoundBlock];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_processAssertionForXcodeQueue(void *a1, const char *a2, ...)
{
  return [a1 processAssertionForXcodeQueue];
}

id objc_msgSend_processAssertionQueue(void *a1, const char *a2, ...)
{
  return [a1 processAssertionQueue];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_publisherBulletinID(void *a1, const char *a2, ...)
{
  return [a1 publisherBulletinID];
}

id objc_msgSend_queueRemote(void *a1, const char *a2, ...)
{
  return [a1 queueRemote];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return [a1 receiver];
}

id objc_msgSend_registerForContinuousPluginDiscovery(void *a1, const char *a2, ...)
{
  return [a1 registerForContinuousPluginDiscovery];
}

id objc_msgSend_releaseProcessAssertionForXcode(void *a1, const char *a2, ...)
{
  return [a1 releaseProcessAssertionForXcode];
}

id objc_msgSend_remoteInterfaceProcessAssertions(void *a1, const char *a2, ...)
{
  return [a1 remoteInterfaceProcessAssertions];
}

id objc_msgSend_remoteInterfaceProcessAssertionsQueue(void *a1, const char *a2, ...)
{
  return [a1 remoteInterfaceProcessAssertionsQueue];
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

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_secureRemoteService(void *a1, const char *a2, ...)
{
  return [a1 secureRemoteService];
}

id objc_msgSend_sendFirstUnlockStatusToGizmo(void *a1, const char *a2, ...)
{
  return [a1 sendFirstUnlockStatusToGizmo];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startLogUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 startLogUpdateTimer];
}

id objc_msgSend_startWiFiTimer(void *a1, const char *a2, ...)
{
  return [a1 startWiFiTimer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return [a1 subtype];
}

id objc_msgSend_syncData(void *a1, const char *a2, ...)
{
  return [a1 syncData];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 threadIdentifier];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toCompArray(void *a1, const char *a2, ...)
{
  return [a1 toCompArray];
}

id objc_msgSend_toGizmoArray(void *a1, const char *a2, ...)
{
  return [a1 toGizmoArray];
}

id objc_msgSend_transactionQueue(void *a1, const char *a2, ...)
{
  return [a1 transactionQueue];
}

id objc_msgSend_transientCache(void *a1, const char *a2, ...)
{
  return [a1 transientCache];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uncompressedData(void *a1, const char *a2, ...)
{
  return [a1 uncompressedData];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_usageTrack(void *a1, const char *a2, ...)
{
  return [a1 usageTrack];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_xcodeWillInstallSockPuppetAppWithCompanionAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xcodeWillInstallSockPuppetAppWithCompanionAppID:");
}