uint64_t sub_100005350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100005360(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100005370(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100005380(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000053D8(id a1)
{
  id v1 = objc_alloc_init((Class)NSLock);
  v2 = (void *)qword_100030BC0;
  qword_100030BC0 = (uint64_t)v1;

  qword_100030BC8 = (uint64_t)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_1000054C4(void *a1)
{
  v2 = +[DMEnvironment sharedInstance];
  uint64_t v3 = [v2 userDataDispositionPref];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v6) {
    goto LABEL_5;
  }
  v7 = [v6 objectForKeyedSubscript:@"buildVersion"];
  if ((+[DMEnvironment isBuildVersion:v7 equalToBuildVersion:a1[4]] & 1) == 0)
  {
    v15 = v7;
    uint64_t v17 = a1[4];
    _DMLogFunc();
    uint64_t v8 = *(void *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
LABEL_5:
    v10 = +[DMEnvironment sharedInstance];
    v11 = [v10 context];
    uint64_t v12 = +[DMMigrator _dispositionDictFromContext:v11 buildVersion:a1[4] lastBuildVersion:a1[5]];
    uint64_t v13 = *(void *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v16 = *(void *)(*(void *)(a1[6] + 8) + 40);
    _DMLogFunc();
    id v18 = +[DMEnvironment sharedInstance];
    [v18 setUserDataDispositionPref:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
}

void sub_100005888(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_1000058E8(v3);

    id WeakRetained = v4;
  }
}

id sub_1000058E8(void *a1)
{
  id v1 = (void *)qword_100030BC0;
  id v2 = a1;
  [v1 lock];
  [(id)qword_100030BC8 removeObject:v2];

  if (![(id)qword_100030BC8 count]) {
    _DMLogFunc();
  }
  id v3 = (void *)qword_100030BC0;

  return [v3 unlock];
}

void sub_100005974(void *a1)
{
  id v1 = a1;
  id v2 = [[DMMigratorProxy alloc] initWithConnection:v1];
  if (qword_100030BD0 != -1) {
    dispatch_once(&qword_100030BD0, &stru_100024A18);
  }
  [(id)qword_100030BC0 lock];
  [(id)qword_100030BC8 addObject:v2];
  [(id)qword_100030BC0 unlock];
  objc_initWeak(&location, v2);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005888;
  v5[3] = &unk_1000247F0;
  objc_copyWeak(&v6, &location);
  [(DMMigratorProxy *)v2 setInvalidationHandler:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000EDE4;
  v3[3] = &unk_1000247F0;
  objc_copyWeak(&v4, &location);
  [(DMMigratorProxy *)v2 setInterruptionHandler:v3];
  [(DMMigratorProxy *)v2 resume];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_100005AF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100006B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_100006C20(uint64_t a1)
{
  id v2 = +[NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  id v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  _DMLogFunc();

  dispatch_time_t v3 = *(void *)(a1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EAC8;
  block[3] = &unk_1000249A8;
  id v6 = *(id *)(a1 + 32);
  int v9 = *(_DWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006DA4(id a1)
{
  qword_100030C80 = (uint64_t)dispatch_queue_create("com.apple.datamigrator.userDataDispositionQueue", 0);

  _objc_release_x1();
}

id sub_100006F9C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) += (unint64_t)[*(id *)(a1 + 32) secondsBeforeNextStackshot]/ 0x3C;
  [*(id *)(a1 + 32) _takeStackshot];
  objc_msgSend(*(id *)(a1 + 32), "setSecondsBeforeNextStackshot:", (char *)objc_msgSend(*(id *)(a1 + 32), "nextSecondsBeforeNextStackshotAdditionForUnitTesting")+ (void)objc_msgSend(*(id *)(a1 + 32), "secondsBeforeNextStackshot"));
  objc_msgSend(*(id *)(a1 + 32), "setSecondsBeforeNextStackshot:", 4 * (void)objc_msgSend(*(id *)(a1 + 32), "secondsBeforeNextStackshot"));
  id v2 = *(void **)(a1 + 32);

  return [v2 secondsBeforeNextStackshot];
}

uint64_t sub_100007460(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) lockdownModeManager];
  if (v1) {
    +[DMLockdownModeTask _enableLockdownModeIfNeededWithLockdownModeManager:v1];
  }

  return _objc_release_x1();
}

intptr_t sub_1000075BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    _DMLogFunc();
  }
  else
  {
    id v6 = +[NSNumber numberWithBool:a2];
    _DMLogFunc();
  }
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void sub_10000808C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000088F8(id a1, NSError *a2)
{
}

void sub_100008A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008B88(uint64_t a1)
{
  _DMLogFunc();
  [*(id *)(a1 + 32) submit];

  return _DMLogFunc();
}

Class sub_100008D30(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100030B90)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100008E5C;
    void v3[4] = &unk_1000247C8;
    v3[5] = v3;
    long long v4 = off_1000247B0;
    uint64_t v5 = 0;
    qword_100030B90 = _sl_dlopen();
  }
  if (!qword_100030B90) {
    sub_10001639C(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("OSASubmissionClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10001641C();
  }
  qword_100030B88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008E5C()
{
  uint64_t result = _sl_dlopen();
  qword_100030B90 = result;
  return result;
}

void sub_1000091F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t sub_10000920C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v3 = WeakRetained;
    if (([WeakRetained canceled] & 1) == 0) {
      [v3 _timerFired];
    }
  }

  return _objc_release_x1();
}

void sub_100009564(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanceled:1];
  id v2 = [*(id *)(a1 + 32) timer];
  dispatch_source_cancel(v2);
}

uint64_t DMDataMigratorMigrationStatisticsReadFrom(uint64_t a1, uint64_t a2)
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
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(_WORD *)(a1 + 48) |= 1u;
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
            goto LABEL_92;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_94;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_92:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_94:
        *(void *)(a1 + 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 48) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_98:
        uint64_t v61 = 24;
        goto LABEL_115;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 48) |= 4u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v20 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_102:
        uint64_t v61 = 28;
        goto LABEL_115;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 48) |= 8u;
        while (2)
        {
          unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1 || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v27;
            if (v30 < 0)
            {
              v27 += 7;
              BOOL v9 = v28++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_106:
        uint64_t v61 = 32;
        goto LABEL_115;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 48) |= 0x20u;
        while (2)
        {
          unint64_t v33 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              BOOL v9 = v32++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_110:
        uint64_t v61 = 40;
        goto LABEL_115;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 48) |= 0x10u;
        while (2)
        {
          unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1 || v37 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v20 |= (unint64_t)(v38 & 0x7F) << v35;
            if (v38 < 0)
            {
              v35 += 7;
              BOOL v9 = v36++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_114:
        uint64_t v61 = 36;
LABEL_115:
        *(_DWORD *)(a1 + v61) = v20;
        continue;
      case 7u:
        uint64_t v39 = PBReaderReadString();
        v40 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v39;

        continue;
      case 8u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0;
        *(_WORD *)(a1 + 48) |= 0x40u;
        while (2)
        {
          unint64_t v44 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v44 == -1 || v44 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v44);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
            v43 |= (unint64_t)(v45 & 0x7F) << v41;
            if (v45 < 0)
            {
              v41 += 7;
              BOOL v9 = v42++ >= 9;
              if (v9)
              {
                uint64_t v43 = 0;
                goto LABEL_119;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v43 = 0;
        }
LABEL_119:
        BOOL v62 = v43 != 0;
        uint64_t v63 = 44;
        goto LABEL_132;
      case 9u:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v48 = 0;
        *(_WORD *)(a1 + 48) |= 0x80u;
        while (2)
        {
          unint64_t v49 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v49 == -1 || v49 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v49);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49 + 1;
            v48 |= (unint64_t)(v50 & 0x7F) << v46;
            if (v50 < 0)
            {
              v46 += 7;
              BOOL v9 = v47++ >= 9;
              if (v9)
              {
                uint64_t v48 = 0;
                goto LABEL_123;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v48 = 0;
        }
LABEL_123:
        BOOL v62 = v48 != 0;
        uint64_t v63 = 45;
        goto LABEL_132;
      case 0xAu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v53 = 0;
        *(_WORD *)(a1 + 48) |= 0x100u;
        while (2)
        {
          unint64_t v54 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v54 == -1 || v54 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v54);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v54 + 1;
            v53 |= (unint64_t)(v55 & 0x7F) << v51;
            if (v55 < 0)
            {
              v51 += 7;
              BOOL v9 = v52++ >= 9;
              if (v9)
              {
                uint64_t v53 = 0;
                goto LABEL_127;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v53 = 0;
        }
LABEL_127:
        BOOL v62 = v53 != 0;
        uint64_t v63 = 46;
        goto LABEL_132;
      case 0xBu:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v58 = 0;
        *(_WORD *)(a1 + 48) |= 0x200u;
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
      unint64_t v59 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v59 == -1 || v59 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v60 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v59);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v59 + 1;
      v58 |= (unint64_t)(v60 & 0x7F) << v56;
      if ((v60 & 0x80) == 0) {
        goto LABEL_129;
      }
      v56 += 7;
      BOOL v9 = v57++ >= 9;
      if (v9)
      {
        uint64_t v58 = 0;
        goto LABEL_131;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_129:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v58 = 0;
    }
LABEL_131:
    BOOL v62 = v58 != 0;
    uint64_t v63 = 47;
LABEL_132:
    *(unsigned char *)(a1 + v63) = v62;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000B324(id a1)
{
  uint64_t v1 = [DMMigrationSentinelManager alloc];
  id v2 = +[NSFileManager defaultManager];
  unsigned int v5 = [(DMMigrationSentinelManager *)v1 initWithFileManager:v2];

  dispatch_time_t v3 = [[DMMigrationState alloc] initWithMigrationSentinelManager:v5];
  char v4 = (void *)qword_100030BA0;
  qword_100030BA0 = (uint64_t)v3;
}

void sub_10000BF54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_time_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) pid]);
  _DMLogFunc();

  objc_msgSend(*(id *)(a1 + 40), "resultsHandler", v2, v3);
  char v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v4[2](v4, 2);
}

void sub_10000C000(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) earlyResultsPluginIdentifier];
  dispatch_time_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) pid]);
  _DMLogFunc();

  objc_msgSend(*(id *)(a1 + 32), "resultsHandler", v2, v3);
  char v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v4[2](v4, 3);
}

uint64_t sub_10000C0C0(uint64_t a1)
{
  _DMLogFunc();
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }

  return _DMLogFunc();
}

id sub_10000C134(uint64_t a1)
{
  return [*(id *)(a1 + 32) progressHostIsReady];
}

void sub_10000C3E4(id a1)
{
}

void sub_10000CD8C(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  dispatch_time_t v3 = [*(id *)(a1 + 40) identifier];
  char v4 = [v2 objectForKeyedSubscript:v3];
  unsigned int v5 = [v4 objectForKeyedSubscript:@"kDMMigrationPluginResultsPhaseDescription"];

  unsigned int v6 = [v5 isEqualToString:@"kDMMigrationPhaseDescriptionRunning"];
  unint64_t v7 = [*(id *)(a1 + 40) rep];
  uint64_t v8 = [v7 path];
  BOOL v9 = (void *)v8;
  if (v6)
  {
    uint64_t v19 = v8;
    _DMLogFunc();

    int v10 = +[NSDate date];
    [v10 timeIntervalSinceDate:*(void *)(a1 + 48)];
    double v12 = v11;

    v20[0] = @"kDMMigrationPluginResultsBundlePathKey";
    unsigned int v13 = [*(id *)(a1 + 40) rep];
    uint64_t v14 = [v13 path];
    v21[0] = v14;
    v20[1] = @"kDMMigrationPluginResultsDuration";
    unint64_t v15 = +[NSNumber numberWithDouble:v12];
    v20[2] = @"kDMMigrationPluginResultsPhaseDescription";
    v21[1] = v15;
    v21[2] = @"kDMMigrationPhaseDescriptionRunning";
    char v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 104);
    char v18 = [*(id *)(a1 + 40) identifier];
    [v17 setObject:v16 forKey:v18];
  }
  else
  {
    _DMLogFunc();

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
}

void sub_10000D320(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DMSuppressMigrationFailureAlert", @"com.apple.migration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v2 = AppBooleanValue == 0;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = !v2;
  byte_100030BB0 = v3;
}

void sub_10000D62C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (a2 & 0xFFFFFFFFFFFFFFFELL) != 2;
  id v3 = +[DMMigrationState sharedInstance];
  [v3 _userDidRespondToMigrationFailureNotificationToFileRadar:v2];
}

id sub_10000E204(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telemetryDictionaryForPluginIdentifier:*(void *)(a1 + 40) duration:*(void *)(a1 + 48) incident:*(void *)(a1 + 72) countOfAttempts:*(void *)(a1 + 56) previousBuildVersion:*(unsigned int *)(a1 + 80) userDataDisposition:*(unsigned int *)(a1 + 84) userCategory:*(double *)(a1 + 64)];
}

id sub_10000E894(uint64_t a1)
{
  WORD2(v2) = *(_WORD *)(a1 + 80);
  LODWORD(v2) = *(_DWORD *)(a1 + 76);
  return objc_msgSend(*(id *)(a1 + 32), "_telemetryDictionaryMigrationDidCompleteWithDuration:fastPluginDuration:pluginCrashCount:pluginWatchdogCount:pluginReturnedFalseCount:previousBuildVersion:userDataDisposition:pluginCategories:userCategory:inAppleStore:isFromFactory:", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(void *)(a1 + 40), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72), *(double *)(a1 + 48), *(double *)(*(void *)(a1 + 32) + 120), v2);
}

void sub_10000EAC0(uint64_t a1)
{
}

void sub_10000EAC8(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 32);
  int v10 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  _DMLogFunc();

  char v4 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + OBJC_IVAR___DMXPCConnection__connection);
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_10000EC54;
  barrier[3] = &unk_100024980;
  id v5 = *(id *)(a1 + 32);
  int v15 = *(_DWORD *)(a1 + 64);
  id v13 = v5;
  dispatch_semaphore_t v14 = v2;
  unsigned int v6 = v2;
  xpc_connection_send_barrier(v4, barrier);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  BOOL v9 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(void *)(a1 + 56), v3, v10);
  double v11 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  _DMLogFunc();

  xpc_transaction_exit_clean();
}

intptr_t sub_10000EC54(uint64_t a1)
{
  char v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  _DMLogFunc();

  dispatch_semaphore_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

void sub_10000ECD8(uint64_t a1, int64_t a2)
{
  char v4 = +[NSNumber numberWithLongLong:a2];
  id v5 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  _DMLogFunc();

  xpc_object_t message = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_int64(message, "migrationResult", a2);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 40) + OBJC_IVAR___DMXPCConnection__connection), message);
}

void sub_10000EDBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_semaphore_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000EDE4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_1000058E8(v3);

    id WeakRetained = v4;
  }
}

void sub_10000EE98(id a1)
{
  qword_100030BD8 = objc_alloc_init(DMAnalytics);

  _objc_release_x1();
}

void sub_10000EFD4(id a1)
{
  qword_100030BE8 = objc_alloc_init(DMDiagnostics);

  _objc_release_x1();
}

void sub_10000F144(id a1)
{
  uint64_t v1 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
  if (v1)
  {
    dispatch_semaphore_t v2 = v1;
    off_100030BF8 = dlsym(v1, "WriteStackshotReportWithPID_async");
    off_100030C00 = dlsym(v2, "WriteStackshotReportWithPID");
  }
  else
  {
    _DMLogFunc();
  }
}

void sub_10000F478(id a1)
{
  uint64_t v1 = (void *)qword_100030C10;
  qword_100030C10 = (uint64_t)&off_100028EA8;
}

void sub_10000F4E4(id a1)
{
  uint64_t v1 = (void *)qword_100030C20;
  qword_100030C20 = (uint64_t)&off_100028EC0;
}

void sub_10000F550(id a1)
{
  uint64_t v1 = (void *)qword_100030C30;
  qword_100030C30 = (uint64_t)&off_100028ED8;
}

void sub_10000F750(id a1)
{
}

void sub_10000F898(uint64_t a1, uint64_t a2)
{
  if ((+[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:a2] & 2) != 0)
  {
    sleep(5u);
    id v3 = [*(id *)(a1 + 32) userManager];
    +[DMUserVolumeMigrationTask _migrateSharedAndPrimaryUserVolumeWithUserManager:v3];
  }
}

void sub_10000FBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FF18()
{
  if (!qword_100030C50) {
    qword_100030C50 = _sl_dlopen();
  }
  return qword_100030C50;
}

uint64_t sub_10000FFE8()
{
  uint64_t result = _sl_dlopen();
  qword_100030C50 = result;
  return result;
}

Class sub_10001005C(uint64_t a1)
{
  id v3 = 0;
  if (!sub_10000FF18()) {
    sub_100016498(&v3);
  }
  Class result = objc_getClass("LockdownModeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100016518();
  }
  qword_100030C58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _executePluginsSemaphore()
{
  if (qword_100030C68 != -1) {
    dispatch_once(&qword_100030C68, &stru_100024B58);
  }
  v0 = (void *)qword_100030C60;

  return v0;
}

void sub_100010A14(id a1)
{
  qword_100030C60 = (uint64_t)dispatch_semaphore_create(0);

  _objc_release_x1();
}

void _excecutePluginsNotificationCallback()
{
  _DMLogFunc();
  v0 = _executePluginsSemaphore();
  dispatch_semaphore_signal(v0);
}

void sub_100010B34(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_excecutePluginsNotificationCallback, @"com.apple.migration.executePlugins", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_100011818(_Unwind_Exception *a1)
{
}

void sub_1000118B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 existsAndShouldRun])
  {
    id v4 = +[DMMigrationState sharedInstance];
    id v5 = [v3 description];
    unsigned int v6 = +[NSString stringWithFormat:@"Running plugin %@", v5];
    [v4 pluginWillRun:v3 migrationPhaseDescription:v6];

    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    uint64_t v7 = [DMProgressWorkItem alloc];
    uint64_t v8 = [v3 name];
    BOOL v9 = [(DMProgressWorkItem *)v7 initWithName:v8 startTimestamp:+[DMTimeManager currentTimestamp]];

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v9];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      *(void *)(*(void *)(a1 + 32) + 24) = [(DMProgressWorkItem *)v9 startTimestamp];
    }
    unint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
    id v11 = [(DMProgressWorkItem *)v9 startTimestamp];
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = *(float *)(v12 + 32);
    double v14 = *(float *)(v12 + 36);
    [v3 timeEstimate];
    double v43 = v15;
    _DMLogFunc();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "unlock", v11, *(void *)&v13, *(void *)&v14, *(void *)&v43);
    unint64_t v44 = +[DMTimeManager currentTimestamp];
    [v3 timeEstimate];
    double v42 = v16;
    _DMLogFunc();
    uint64_t v17 = [DMMigrationWatchdog alloc];
    char v18 = objc_msgSend(v3, "description", v3, *(void *)&v42);
    uint64_t v19 = [(DMMigrationWatchdog *)v17 initWithMigrationPluginDescription:v18 userDataDisposition:*(void *)(a1 + 40) migrationStartTime:(double)v10];

    [(DMMigrationWatchdog *)v19 resume];
    [*(id *)(a1 + 32) _artificialHangTimeIntervalForPlugin:v3];
    double v21 = v20;
    [v3 appropriateTimeIntervalBeforeReboot];
    double v23 = v22;
    unsigned int v24 = [v3 rep];
    unint64_t v25 = [v24 path];
    char v26 = [v25 lastPathComponent];
    char v27 = +[DMEnvironment sharedInstance];
    unsigned int v28 = +[DMRebootTimer createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:v26 pluginName:v27 environment:v23];

    [v28 resume];
    if (v21 > 0.0)
    {
      _DMLogFunc();
      sleep(v21);
    }
    uint64_t v46 = 0;
    unint64_t v29 = [v3 performMigrationWithParameters:*(void *)(a1 + 48) watchdogCoordinator:*(void *)(a1 + 56) countOfAttempts:&v46];
    [v28 cancel];
    char v45 = v19;
    [(DMMigrationWatchdog *)v19 cancel];
    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) &= v29 == 0;
    [*(id *)(*(void *)(a1 + 32) + 8) unlock];
    +[DMTimeManager intervalSinceTimestamp:v44];
    double v31 = v30;
    if (v29)
    {
      unsigned int v32 = [v29 details];
      unint64_t v33 = +[NSString stringWithFormat:@" %@", v32];
    }
    else
    {
      unint64_t v33 = &stru_1000259A0;
    }
    _DMLogFunc();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "lock", v3, *(void *)&v31, v29 == 0, v33);
    [v3 timeEstimate];
    *(float *)(*(void *)(a1 + 32) + 32) = *(float *)(*(void *)(a1 + 32) + 32) - v34;
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 8) unlock];
    char v35 = +[DMMigrationState sharedInstance];
    unsigned int v36 = [v3 description];
    unint64_t v37 = +[NSString stringWithFormat:@"Finished plugin %@", v36];
    [v35 pluginDidFinish:v3 withSuccess:v29 == 0 duration:v29 incident:v37 migrationPhaseDescription:v31];

    char v38 = +[DMMigrationState sharedInstance];
    uint64_t v39 = [v3 identifier];
    [v38 reportTelemetryForPluginIdentifier:v39 duration:v29 incident:v46 countOfAttempts:*(void *)(a1 + 40) userDataDisposition:*(unsigned int *)(a1 + 80) userCategory:v31];
  }
  v40 = +[DMMigrationState sharedInstance];
  char v41 = [v3 identifier];
  [v40 sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:v41];
}

uint64_t sub_100011DE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100011DF8(id a1)
{
}

void sub_1000122B0(uint64_t a1)
{
}

id sub_100012554(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _migrateWithTestMigrationInfrastructureOnly:*(unsigned __int8 *)(a1 + 48) buildVersion:*(void *)(a1 + 40) lastBuildVersion:a2];
}

void sub_100012FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013024(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) _createProgressWindow];
  [*(id *)(a1 + 32) setProgressWindow:v2];

  id v3 = [*(id *)(a1 + 32) progressWindow];
  uint64_t v4 = [v3 errorDescription];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) progressWindow];
  [v7 setVisible:1];

  uint64_t v8 = [*(id *)(a1 + 32) progressWindow];
  [v8 setProgressValue:0.0];

  if (os_variant_has_internal_content())
  {
    BOOL v9 = [*(id *)(a1 + 32) progressWindow];
    [v9 setStatusText:@" "];
  }

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

id sub_100013124(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013198;
  v2[3] = &unk_100024C80;
  return [*(id *)(a1 + 32) currentProgressInfo:v2];
}

void sub_100013198(uint64_t a1, void *a2, float a3)
{
  id v8 = a2;
  if (*(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != a3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) progressWindow];
    *(float *)&double v6 = a3;
    [v5 setProgressValue:v6];

    *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  uint64_t v7 = [*(id *)(a1 + 32) progressWindow];
  [v7 setStatusText:v8];
}

void sub_100013240(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didReceiveHIDEvent:v4];
}

uint64_t sub_10001329C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) progressWindow];
  LODWORD(v2) = 1.0;
  [v1 setProgressValue:v2];

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

BOOL sub_1000135C0(id a1, DataMigrationPlugin *a2, unint64_t a3, BOOL *a4)
{
  return [(DataMigrationPlugin *)a2 existsAndShouldRun];
}

void sub_100013878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_1000138A0(uint64_t a1)
{
  id v2 = objc_alloc((Class)PUIProgressWindow);
  LODWORD(v3) = 1161527296;
  id v4 = [v2 initWithProgressBarVisibility:*(unsigned __int8 *)(a1 + 40) level:*(unsigned __int8 *)(a1 + 41) forceInverted:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setVisible:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:0.0];

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

void sub_100013944(id a1)
{
}

id sub_100013960(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:a2];
}

uint64_t sub_100013978(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:a2];

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

Class sub_100013B48(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100030C98)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100013C74;
    void v3[4] = &unk_1000247C8;
    v3[5] = v3;
    long long v4 = off_100024D78;
    uint64_t v5 = 0;
    qword_100030C98 = _sl_dlopen();
  }
  if (!qword_100030C98) {
    sub_100016594(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("HIDEventSystemClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100016614();
  }
  qword_100030C90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100013C74()
{
  uint64_t result = _sl_dlopen();
  qword_100030C98 = result;
  return result;
}

void -[DMWrapperProcessWatchdogCoordinator _blockedByPendingWatchdogOfAnotherPluginOnQueue:](DMWrapperProcessWatchdogCoordinator *self, SEL a2, id a3)
{
}

void sub_100014360(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1000143A4(uint64_t a1)
{
}

void sub_1000143AC(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pluginStates", 0);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      double v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v6) plugin];
        unsigned __int8 v8 = [v7 isEqual:*(void *)(a1 + 40)];

        if (v8)
        {
          uint64_t v15 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Plugin to run already exists in watchdog coordinator state" userInfo:0];
          uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v15;

          goto LABEL_11;
        }
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = [[DMWrapperProcessWatchdogCoordinatorPluginState alloc] initWithPlugin:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v9;

  uint64_t v12 = [*(id *)(a1 + 32) pluginStates];
  [v12 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) queue];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  id v2 = *(void **)(v14 + 40);
  *(void *)(v14 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v13;
LABEL_11:
}

void sub_100014578(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_pluginStateThatBlocksNewRunEvents_onPropertyAccessQueue");
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v8 = v2;
    uint64_t v7 = [v2 plugin];
    _DMLogFunc();

    uint64_t v4 = objc_msgSend(v8, "queue", v3, v7);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    double v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v4;

    id v2 = v8;
  }
}

void sub_100014624(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setRunning:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) propertyAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000146F4;
  block[3] = &unk_100024DE0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_sync(v2, block);
}

id sub_1000146F4(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 32);
  _DMLogFunc();
  id v2 = objc_msgSend(*(id *)(a1 + 40), "pluginStates", v5);
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  id v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_killIfAppropriate_onPropertyAccessQueue");
}

void sub_1000148A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000148BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v17 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  _DMLogFunc();

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "pluginStates", v2, v17, 0);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
      uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      BOOL v9 = [v8 plugin];
      unsigned __int8 v10 = [v9 isEqual:*(void *)(a1 + 32)];

      if (v10) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v8;

    if (!v11) {
      goto LABEL_13;
    }
    if ([v11 watchdogged])
    {
      uint64_t v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Plugin to watchdog already scheduled for watchdog" userInfo:0];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v12;
    }
    else
    {
      [v11 setWatchdogged:1];
      [v11 setPid:*(unsigned int *)(a1 + 56)];
      objc_msgSend(*(id *)(a1 + 40), "_killIfAppropriate_onPropertyAccessQueue");
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    uint64_t v15 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Plugin to watchdog does not exist in watchdog coordinator state" userInfo:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v16 + 40);
    *(void *)(v16 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v15;
  }
}

void sub_100014EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014EB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pluginStates];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

void sub_1000157F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100015818(uint64_t a1)
{
}

void sub_100015820(uint64_t a1)
{
  id v2 = +[DMMigrationPluginWrapperConnection connection];
  [v2 resume];
  id v3 = dispatch_queue_create("com.apple.datamigrator.pluginCompletionSerialQueue", 0);
  id v4 = 0;
  if (*(double *)(a1 + 72) > 0.0)
  {
    id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 72) * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(a1 + 72) * 1000000000.0));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100015BE0;
    handler[3] = &unk_100024E80;
    uint64_t v55 = *(void *)(a1 + 56);
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v51 = v6;
    uint64_t v52 = v7;
    uint64_t v57 = *(void *)(a1 + 72);
    uint64_t v56 = *(void *)(a1 + 64);
    id v53 = v8;
    id v54 = *(id *)(a1 + 48);
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(v4);
  }
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x3032000000;
  unsigned int v47 = sub_100005380;
  uint64_t v48 = sub_100015818;
  dispatch_source_t v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  BOOL v9 = v45[5];
  [*(id *)(a1 + 32) pidReceiptTimeout];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  uint64_t v12 = v45[5];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100015E30;
  v38[3] = &unk_100024EA8;
  uint64_t v42 = *(void *)(a1 + 56);
  id v13 = v2;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  id v39 = v13;
  uint64_t v40 = v14;
  id v41 = v15;
  double v43 = &v44;
  dispatch_source_set_event_handler(v12, v38);
  dispatch_resume((dispatch_object_t)v45[5]);
  **(unsigned char **)(a1 + 8CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0;
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 16) path];
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
  char v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  unsigned int v28 = sub_100015FD4;
  unint64_t v29 = &unk_100024EF8;
  long long v19 = v3;
  double v30 = v19;
  long long v20 = v4;
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v34 = *(void *)(a1 + 56);
  char v35 = &v44;
  uint64_t v22 = *(void *)(a1 + 32);
  double v23 = *(void **)(a1 + 40);
  double v31 = v20;
  uint64_t v32 = v22;
  uint64_t v36 = v21;
  id v24 = v23;
  uint64_t v25 = *(void *)(a1 + 80);
  id v33 = v24;
  uint64_t v37 = v25;
  [v13 runPluginAtPath:v16 withIdentifier:v18 parameters:v17 completion:&v26];

  objc_msgSend(v13, "invalidate", v26, v27, v28, v29);
  _Block_object_dispose(&v44, 8);
}

void sub_100015BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_100015BE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(_DWORD *)(v1 + 24))
  {
    *(_DWORD *)(v1 + 24) = 1;
    id v3 = [*(id *)(a1 + 32) pidForWatchdog];
    uint64_t v4 = *(void *)(a1 + 40);
    dispatch_time_t v5 = +[NSNumber numberWithInt:v3];
    uint64_t v18 = +[NSNumber numberWithDouble:*(double *)(a1 + 80)];
    uint64_t v16 = v4;
    _DMLogFunc();

    if (os_variant_has_internal_content()) {
      _DMLogFunc();
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3, v16, v5, v18);
      uint64_t v8 = +[NSNumber numberWithDouble:*(double *)(a1 + 80)];
      id v19 = +[NSString stringWithFormat:@"%@ - Got Watchdogged, pid %@, after %@ seconds", v6, v7, v8];

      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 16);
      double v10 = [*(id *)(a1 + 48) dispositionSupersetOfContext];
      uint64_t v11 = +[DMIncident incidentWithKind:3 responsiblePluginRep:v9 userDataDisposition:v10 details:v19];
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v11;

      uint64_t v14 = +[DMDiagnostics sharedInstance];
      [v14 captureDiagnosticsForIncident:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) async:0];
    }
    else
    {
      uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 80), v16, v5, v18);
      id v19 = +[NSString stringWithFormat:@"%@ - Attempted watchdog failed (couldn't find the pid) after %@ seconds", v6, v15];

      id v17 = v19;
      _DMLogFunc();
    }
    objc_msgSend(*(id *)(a1 + 56), "watchdogPlugin:withPid:", *(void *)(a1 + 40), v3, v17);
  }
}

void sub_100015E30(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ([*(id *)(a1 + 32) didReceivePid] & 1) == 0)
  {
    [*(id *)(a1 + 40) pidReceiptTimeout];
    uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    _DMLogFunc();

    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 16);
    id v3 = objc_msgSend(*(id *)(a1 + 48), "dispositionSupersetOfContext", v12);
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 pidReceiptTimeout];
    dispatch_time_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v6 = +[NSString stringWithFormat:@"%@ - Did not receive pid after %@ seconds", v4, v5];
    uint64_t v7 = +[DMIncident incidentWithKind:4 responsiblePluginRep:v2 userDataDisposition:v3 details:v6];

    uint64_t v8 = +[DMDiagnostics sharedInstance];
    [v8 captureDiagnosticsForIncident:v7 async:0];
  }
  uint64_t v9 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v9)
  {
    dispatch_source_cancel(v9);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0;
  }
}

void sub_100015FD4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000160C4;
  block[3] = &unk_100024ED0;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v19 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  long long v17 = *(_OWORD *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v9 = (id)v11;
  long long v16 = v11;
  uint64_t v18 = *(void *)(a1 + 88);
  id v10 = v5;
  dispatch_sync(v6, block);
}

void sub_1000160C4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(_DWORD *)(v3 + 24)) {
    *(_DWORD *)(v3 + 24) = 2;
  }
  uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0;
  }
  if (!*(unsigned char *)(a1 + 96))
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 1)
    {
      _DMLogFunc();
    }
    else if (*(void *)(a1 + 48))
    {
      _DMLogFunc();
      **(unsigned char **)(a1 + 8_Block_object_dispose(&STACK[0x2E0], 8) = 1;
    }
    else
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 16);
      uint64_t v8 = [*(id *)(a1 + 56) dispositionSupersetOfContext];
      id v9 = +[NSString stringWithFormat:@"%@ - Returned NO from -performMigration:", *(void *)(a1 + 40)];
      uint64_t v10 = +[DMIncident incidentWithKind:1 responsiblePluginRep:v7 userDataDisposition:v8 details:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v10;

      id v13 = +[DMDiagnostics sharedInstance];
      [v13 captureDiagnosticsForIncident:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) async:1];
    }
  }
}

void sub_100016370()
{
  __assert_rtn("-[DMMigrationWatchdog resume]", "DMMigrationWatchdog.m", 54, "self.timer == nil");
}

void sub_10001639C(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *OSASubmissionClientLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DMRebootAnalyticsUploader.m", 17, @"%s", *a1);

  __break(1u);
}

void sub_10001641C()
{
  v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getOSASubmissionClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DMRebootAnalyticsUploader.m", 18, @"Unable to find class %s", "OSASubmissionClient");

  __break(1u);
}

void sub_100016498(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *LockdownModeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DMEnvironment+DataMigrator.m", 21, @"%s", *a1);

  __break(1u);
}

void sub_100016518()
{
  v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getLockdownModeManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DMEnvironment+DataMigrator.m", 22, @"Unable to find class %s", "LockdownModeManager");

  __break(1u);
}

void sub_100016594(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *HIDLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DMMigrator.m", 57, @"%s", *a1);

  __break(1u);
}

void sub_100016614()
{
  v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getHIDEventSystemClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DMMigrator.m", 58, @"Unable to find class %s", "HIDEventSystemClient");

  __break(1u);
  JUMPOUT(0x100016690);
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t MKBDeviceLockAssertionConsume()
{
  return _MKBDeviceLockAssertionConsume();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBKeyBagKeyStashLoad()
{
  return _MKBKeyBagKeyStashLoad();
}

uint64_t MKBLockDevice()
{
  return _MKBLockDevice();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

uint64_t proc_set_cpumon_params()
{
  return _proc_set_cpumon_params();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

long double tanh(long double __x)
{
  return _tanh(__x);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_main(xpc_connection_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createHelperConnection(void *a1, const char *a2, ...)
{
  return [a1 _createHelperConnection];
}

id objc_msgSend__createProgressWindow(void *a1, const char *a2, ...)
{
  return [a1 _createProgressWindow];
}

id objc_msgSend__createRecursiveMutex(void *a1, const char *a2, ...)
{
  return [a1 _createRecursiveMutex];
}

id objc_msgSend__cwfInterface(void *a1, const char *a2, ...)
{
  return [a1 _cwfInterface];
}

id objc_msgSend__firstPointAfterEnteringEndOfMigrationCriticalSection(void *a1, const char *a2, ...)
{
  return [a1 _firstPointAfterEnteringEndOfMigrationCriticalSection];
}

id objc_msgSend__lastPointBeforeEnteringPotentialStartOfMigrationCriticalSection(void *a1, const char *a2, ...)
{
  return [a1 _lastPointBeforeEnteringPotentialStartOfMigrationCriticalSection];
}

id objc_msgSend__maximumRebootCount(void *a1, const char *a2, ...)
{
  return [a1 _maximumRebootCount];
}

id objc_msgSend__minimumCalculatedTimeIntervalBeforeReboot(void *a1, const char *a2, ...)
{
  return [a1 _minimumCalculatedTimeIntervalBeforeReboot];
}

id objc_msgSend__minimumTimeIntervalBetweenWatchdogAndReboot(void *a1, const char *a2, ...)
{
  return [a1 _minimumTimeIntervalBetweenWatchdogAndReboot];
}

id objc_msgSend__pluginAllowedList(void *a1, const char *a2, ...)
{
  return [a1 _pluginAllowedList];
}

id objc_msgSend__releaseMigrationFailureNotification(void *a1, const char *a2, ...)
{
  return [a1 _releaseMigrationFailureNotification];
}

id objc_msgSend__reportMigrationFailureIfApplicable(void *a1, const char *a2, ...)
{
  return [a1 _reportMigrationFailureIfApplicable];
}

id objc_msgSend__shouldRebootOnCurrentPlatform(void *a1, const char *a2, ...)
{
  return [a1 _shouldRebootOnCurrentPlatform];
}

id objc_msgSend__shouldSuppressMigrationFailureAlert(void *a1, const char *a2, ...)
{
  return [a1 _shouldSuppressMigrationFailureAlert];
}

id objc_msgSend__showIgnoreTapToRadarAlertOption(void *a1, const char *a2, ...)
{
  return [a1 _showIgnoreTapToRadarAlertOption];
}

id objc_msgSend__takeStackshot(void *a1, const char *a2, ...)
{
  return [a1 _takeStackshot];
}

id objc_msgSend__timerFired(void *a1, const char *a2, ...)
{
  return [a1 _timerFired];
}

id objc_msgSend__unlockKeyBagUseOfForceIsAuthorized(void *a1, const char *a2, ...)
{
  return [a1 _unlockKeyBagUseOfForceIsAuthorized];
}

id objc_msgSend__userDataDispositionDictionary(void *a1, const char *a2, ...)
{
  return [a1 _userDataDispositionDictionary];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allPlugins(void *a1, const char *a2, ...)
{
  return [a1 allPlugins];
}

id objc_msgSend_allPluginsInRunOrder(void *a1, const char *a2, ...)
{
  return [a1 allPluginsInRunOrder];
}

id objc_msgSend_allReps(void *a1, const char *a2, ...)
{
  return [a1 allReps];
}

id objc_msgSend_appropriateTimeIntervalBeforeReboot(void *a1, const char *a2, ...)
{
  return [a1 appropriateTimeIntervalBeforeReboot];
}

id objc_msgSend_blockUntilPreferencesFlush(void *a1, const char *a2, ...)
{
  return [a1 blockUntilPreferencesFlush];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return [a1 canceled];
}

id objc_msgSend_checkNecessity(void *a1, const char *a2, ...)
{
  return [a1 checkNecessity];
}

id objc_msgSend_clearContext(void *a1, const char *a2, ...)
{
  return [a1 clearContext];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_concurrentPlugins(void *a1, const char *a2, ...)
{
  return [a1 concurrentPlugins];
}

id objc_msgSend_concurrentUserSpecificPluginSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 concurrentUserSpecificPluginSpecifiers];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_continuousIntegrationMarkerPref(void *a1, const char *a2, ...)
{
  return [a1 continuousIntegrationMarkerPref];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentTimestamp(void *a1, const char *a2, ...)
{
  return [a1 currentTimestamp];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_deviceModeIsSharediPad(void *a1, const char *a2, ...)
{
  return [a1 deviceModeIsSharediPad];
}

id objc_msgSend_diagnosticMessage(void *a1, const char *a2, ...)
{
  return [a1 diagnosticMessage];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didReceivePid(void *a1, const char *a2, ...)
{
  return [a1 didReceivePid];
}

id objc_msgSend_dispositionSupersetOfContext(void *a1, const char *a2, ...)
{
  return [a1 dispositionSupersetOfContext];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_earlyResultsPluginIdentifier(void *a1, const char *a2, ...)
{
  return [a1 earlyResultsPluginIdentifier];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_errorDescription(void *a1, const char *a2, ...)
{
  return [a1 errorDescription];
}

id objc_msgSend_estimatedDurationTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 estimatedDurationTimeInterval];
}

id objc_msgSend_existsAndShouldRun(void *a1, const char *a2, ...)
{
  return [a1 existsAndShouldRun];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierOfDependency(void *a1, const char *a2, ...)
{
  return [a1 identifierOfDependency];
}

id objc_msgSend_implementMigrationPluginResults(void *a1, const char *a2, ...)
{
  return [a1 implementMigrationPluginResults];
}

id objc_msgSend_inAppleStore(void *a1, const char *a2, ...)
{
  return [a1 inAppleStore];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBundleValid(void *a1, const char *a2, ...)
{
  return [a1 isBundleValid];
}

id objc_msgSend_isConcurrent(void *a1, const char *a2, ...)
{
  return [a1 isConcurrent];
}

id objc_msgSend_isDeviceUsingEphemeralStorage(void *a1, const char *a2, ...)
{
  return [a1 isDeviceUsingEphemeralStorage];
}

id objc_msgSend_isFromFactory(void *a1, const char *a2, ...)
{
  return [a1 isFromFactory];
}

id objc_msgSend_isProgressHost(void *a1, const char *a2, ...)
{
  return [a1 isProgressHost];
}

id objc_msgSend_isProgressHostReady(void *a1, const char *a2, ...)
{
  return [a1 isProgressHostReady];
}

id objc_msgSend_isSentinelPresent(void *a1, const char *a2, ...)
{
  return [a1 isSentinelPresent];
}

id objc_msgSend_isUserAgnostic(void *a1, const char *a2, ...)
{
  return [a1 isUserAgnostic];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastBuildVersionPref(void *a1, const char *a2, ...)
{
  return [a1 lastBuildVersionPref];
}

id objc_msgSend_lastMigrationResultsPref(void *a1, const char *a2, ...)
{
  return [a1 lastMigrationResultsPref];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockdownModeManager(void *a1, const char *a2, ...)
{
  return [a1 lockdownModeManager];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_migrationDidEnd(void *a1, const char *a2, ...)
{
  return [a1 migrationDidEnd];
}

id objc_msgSend_migrationDidStart(void *a1, const char *a2, ...)
{
  return [a1 migrationDidStart];
}

id objc_msgSend_migrationPhaseDescription(void *a1, const char *a2, ...)
{
  return [a1 migrationPhaseDescription];
}

id objc_msgSend_migrationPluginResults(void *a1, const char *a2, ...)
{
  return [a1 migrationPluginResults];
}

id objc_msgSend_migrationPluginResultsPref(void *a1, const char *a2, ...)
{
  return [a1 migrationPluginResultsPref];
}

id objc_msgSend_migrationRebootCount(void *a1, const char *a2, ...)
{
  return [a1 migrationRebootCount];
}

id objc_msgSend_migrationSentinelManager(void *a1, const char *a2, ...)
{
  return [a1 migrationSentinelManager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_nextSecondsBeforeNextStackshotAdditionForUnitTesting(void *a1, const char *a2, ...)
{
  return [a1 nextSecondsBeforeNextStackshotAdditionForUnitTesting];
}

id objc_msgSend_orderedPluginIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 orderedPluginIdentifiers];
}

id objc_msgSend_orderedUserAgnosticPluginSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 orderedUserAgnosticPluginSpecifiers];
}

id objc_msgSend_orderedUserSpecificPluginSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 orderedUserSpecificPluginSpecifiers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 persistIfNecessary];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pidForWatchdog(void *a1, const char *a2, ...)
{
  return [a1 pidForWatchdog];
}

id objc_msgSend_pidReceiptTimeout(void *a1, const char *a2, ...)
{
  return [a1 pidReceiptTimeout];
}

id objc_msgSend_pidsKilled(void *a1, const char *a2, ...)
{
  return [a1 pidsKilled];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_pluginName(void *a1, const char *a2, ...)
{
  return [a1 pluginName];
}

id objc_msgSend_pluginResults(void *a1, const char *a2, ...)
{
  return [a1 pluginResults];
}

id objc_msgSend_pluginStates(void *a1, const char *a2, ...)
{
  return [a1 pluginStates];
}

id objc_msgSend_previousBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 previousBuildVersion];
}

id objc_msgSend_progressHostIsReady(void *a1, const char *a2, ...)
{
  return [a1 progressHostIsReady];
}

id objc_msgSend_progressWindow(void *a1, const char *a2, ...)
{
  return [a1 progressWindow];
}

id objc_msgSend_propertyAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 propertyAccessQueue];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return [a1 reboot];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeSentinelIfPresent(void *a1, const char *a2, ...)
{
  return [a1 removeSentinelIfPresent];
}

id objc_msgSend_rep(void *a1, const char *a2, ...)
{
  return [a1 rep];
}

id objc_msgSend_reportMigrationFailure(void *a1, const char *a2, ...)
{
  return [a1 reportMigrationFailure];
}

id objc_msgSend_responsiblePluginRep(void *a1, const char *a2, ...)
{
  return [a1 responsiblePluginRep];
}

id objc_msgSend_resultsHandler(void *a1, const char *a2, ...)
{
  return [a1 resultsHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_secondsBeforeNextStackshot(void *a1, const char *a2, ...)
{
  return [a1 secondsBeforeNextStackshot];
}

id objc_msgSend_sema(void *a1, const char *a2, ...)
{
  return [a1 sema];
}

id objc_msgSend_serialPluginsInRunOrder(void *a1, const char *a2, ...)
{
  return [a1 serialPluginsInRunOrder];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_setNeedsMigrationFailureReport(void *a1, const char *a2, ...)
{
  return [a1 setNeedsMigrationFailureReport];
}

id objc_msgSend_setProgressHostIsReady(void *a1, const char *a2, ...)
{
  return [a1 setProgressHostIsReady];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldImposePluginArtificialHang(void *a1, const char *a2, ...)
{
  return [a1 shouldImposePluginArtificialHang];
}

id objc_msgSend_shouldWatchdogPluginsAfterTimeout(void *a1, const char *a2, ...)
{
  return [a1 shouldWatchdogPluginsAfterTimeout];
}

id objc_msgSend_stackshotTimerLeewaySeconds(void *a1, const char *a2, ...)
{
  return [a1 stackshotTimerLeewaySeconds];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTimestamp(void *a1, const char *a2, ...)
{
  return [a1 startTimestamp];
}

id objc_msgSend_submissionBlock(void *a1, const char *a2, ...)
{
  return [a1 submissionBlock];
}

id objc_msgSend_submissionClient(void *a1, const char *a2, ...)
{
  return [a1 submissionClient];
}

id objc_msgSend_submit(void *a1, const char *a2, ...)
{
  return [a1 submit];
}

id objc_msgSend_telemetryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 telemetryIdentifier];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_timeEstimate(void *a1, const char *a2, ...)
{
  return [a1 timeEstimate];
}

id objc_msgSend_timeIntervalBeforeReboot(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalBeforeReboot];
}

id objc_msgSend_timeIntervalBeforeWatchdog(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalBeforeWatchdog];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_userDataDispositionAuxiliaryData(void *a1, const char *a2, ...)
{
  return [a1 userDataDispositionAuxiliaryData];
}

id objc_msgSend_userDataDispositionPref(void *a1, const char *a2, ...)
{
  return [a1 userDataDispositionPref];
}

id objc_msgSend_userManager(void *a1, const char *a2, ...)
{
  return [a1 userManager];
}

id objc_msgSend_userSessionIsLoginWindow(void *a1, const char *a2, ...)
{
  return [a1 userSessionIsLoginWindow];
}

id objc_msgSend_waitForExecutePluginsSignalMarkerPref(void *a1, const char *a2, ...)
{
  return [a1 waitForExecutePluginsSignalMarkerPref];
}

id objc_msgSend_waitUntilPreboardDidFinishUnlock(void *a1, const char *a2, ...)
{
  return [a1 waitUntilPreboardDidFinishUnlock];
}

id objc_msgSend_watchdogged(void *a1, const char *a2, ...)
{
  return [a1 watchdogged];
}

id objc_msgSend_willStartMigration(void *a1, const char *a2, ...)
{
  return [a1 willStartMigration];
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return [a1 workBlock];
}