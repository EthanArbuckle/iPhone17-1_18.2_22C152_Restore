int main(int argc, const char **argv, const char **envp)
{
  +[ImageConversionService run];
  return 0;
}

void sub_100004F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004F8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F9C(uint64_t a1)
{
}

void sub_100004FA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v7 = (void *)qword_10003CD00;
    uint64_t v24 = qword_10003CD00;
    if (!qword_10003CD00)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10000526C;
      v26 = &unk_100034CB8;
      v27 = &v21;
      sub_10000526C((uint64_t)buf);
      v7 = (void *)v22[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v21, 8);
    if (objc_opt_isKindOfClass()) {
      v9 = v5;
    }
    else {
      v9 = 0;
    }
    v10 = *(void **)(a1 + 32);
    v11 = [v9 image];
    id v12 = [v11 cgImage];
    v13 = [*(id *)(a1 + 40) lastPathComponent];
    id v20 = 0;
    uint64_t v14 = [v10 _blastDoorStoreTemporarySourceImageWithImageRef:v12 sourceURL:v13 error:&v20];
    id v15 = v20;
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v14;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      [*(id *)(a1 + 32) setError:v15];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Failed to generate URL from blast door video reference from sourceURL %@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setError:v6];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Unable to access blast door reference from sourceURL %@. Error: %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000524C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000526C(uint64_t a1)
{
  sub_100005334();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BlastDoorVideoPreview");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10003CD00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = +[NSAssertionHandler currentHandler];
    v3 = +[NSString stringWithUTF8String:"Class getBlastDoorVideoPreviewClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 33, @"Unable to find class %s", "BlastDoorVideoPreview");

    __break(1u);
  }
}

void *sub_100005334()
{
  v4[0] = 0;
  if (!qword_10003CCE8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100005488;
    v4[4] = &unk_100034CF0;
    v4[5] = v4;
    long long v5 = off_100034D10;
    uint64_t v6 = 0;
    qword_10003CCE8 = _sl_dlopen();
  }
  v0 = (void *)qword_10003CCE8;
  if (!qword_10003CCE8)
  {
    v0 = +[NSAssertionHandler currentHandler];
    v3 = +[NSString stringWithUTF8String:"void *BlastDoorLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 29, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100005488()
{
  uint64_t result = _sl_dlopen();
  qword_10003CCE8 = result;
  return result;
}

void sub_1000056D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1000056F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v7 = (void *)qword_10003CCF8;
    uint64_t v30 = qword_10003CCF8;
    if (!qword_10003CCF8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100005ABC;
      v32 = &unk_100034CB8;
      v33 = &v27;
      sub_100005ABC((uint64_t)buf);
      v7 = (void *)v28[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v27, 8);
    if (objc_opt_isKindOfClass()) {
      v9 = v5;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [v10 image];
    id v13 = [v12 cgImage];
    uint64_t v14 = [*(id *)(a1 + 40) lastPathComponent];
    id v26 = 0;
    uint64_t v15 = [v11 _blastDoorStoreTemporarySourceImageWithImageRef:v13 sourceURL:v14 error:&v26];
    id v16 = v26;
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v15;

    uint64_t v19 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v20 = [v10 metadata];
      uint64_t v21 = [v19 _blastDoorConvertImageMetadata:v20];
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
    else
    {
      [*(id *)(a1 + 32) setError:v16];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Failed to generate URL from blast door reference from sourceURL %@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setError:v6];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Unable to access blast door reference from sourceURL %@. Error: %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000059EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005ABC(uint64_t a1)
{
  sub_100005334();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BlastDoorLargeImage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10003CCF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = +[NSAssertionHandler currentHandler];
    v3 = +[NSString stringWithUTF8String:"Class getBlastDoorLargeImageClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 32, @"Unable to find class %s", "BlastDoorLargeImage");

    __break(1u);
  }
}

void sub_100005CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v7 = (void *)qword_10003CCF0;
    uint64_t v17 = qword_10003CCF0;
    if (!qword_10003CCF0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100005EE8;
      uint64_t v19 = &unk_100034CB8;
      id v20 = &v14;
      sub_100005EE8((uint64_t)buf);
      v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    if (objc_opt_isKindOfClass()) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_blastDoorConvertImageMetadata:", v9, v14);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    [*(id *)(a1 + 32) setError:v6];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Unable to access blast door reference from sourceURL %@. Error: %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100005EE8(uint64_t a1)
{
  sub_100005334();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BlastDoorMediaMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10003CCF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = +[NSAssertionHandler currentHandler];
    v3 = +[NSString stringWithUTF8String:"Class getBlastDoorMediaMetadataClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 34, @"Unable to find class %s", "BlastDoorMediaMetadata");

    __break(1u);
  }
}

void sub_100006164(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000064B4(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_10003CCD8)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_1000066F0;
    v6[4] = &unk_100034CF0;
    v6[5] = v6;
    long long v7 = off_100034CD8;
    uint64_t v8 = 0;
    qword_10003CCD8 = _sl_dlopen();
  }
  if (!qword_10003CCD8)
  {
    v3 = +[NSAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:"void *MessagesBlastDoorSupportLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 30, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("IMMessagesBlastDoorInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getIMMessagesBlastDoorInterfaceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 31, @"Unable to find class %s", "IMMessagesBlastDoorInterface");

LABEL_10:
    __break(1u);
  }
  qword_10003CCD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000066A0(uint64_t a1)
{
  v2 = sub_100005334();
  Class result = dlsym(v2, "BlastDoorInstanceTypeHubble");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10003CCE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000066F0()
{
  uint64_t result = _sl_dlopen();
  qword_10003CCD8 = result;
  return result;
}

void sub_1000075E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007614(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007624(uint64_t a1)
{
}

void sub_10000762C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  long long v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 URLByAppendingPathComponent:v9];
  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v12 + 40);
  unsigned __int8 v13 = [v11 copyURL:v8 forRole:v9 toDirectory:v10 error:&obj];

  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_100007790(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [a3 url];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

int64_t sub_10000797C(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_100007A98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v13 = 0;
  uint64_t v14 = 0;
  unsigned __int8 v6 = [a3 getFileSize:&v14 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:v14];
    id v9 = [v8 stringValue];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get file size for url with role %{public}@: %{public}@", buf, 0x16u);
    }
    id v9 = @"?";
  }
  uint64_t v10 = *(void **)(a1 + 32);
  v15[0] = v5;
  v15[1] = v9;
  uint64_t v11 = +[NSArray arrayWithObjects:v15 count:2];
  uint64_t v12 = [v11 componentsJoinedByString:@"="];
  [v10 addObject:v12];
}

void sub_100007D40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v14[0] = v5;
  int v8 = *(unsigned __int8 *)(a1 + 40);
  id v9 = [v6 path];
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (!v8)
  {
    uint64_t v11 = [v9 lastPathComponent];
  }
  v14[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v14 count:2];
  id v13 = [v12 componentsJoinedByString:@"="];
  [v7 addObject:v13];

  if (!v8) {
}
  }

void sub_100007F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007F38(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [a3 path];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isReadableFileAtPath:v7];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

void sub_100008104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008128(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v20 = 0;
  unsigned __int8 v10 = [v8 getFileSize:&v20 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v8 url];
      uint64_t v17 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      uint64_t v16 = "Unable to get file size for URL ref with role %{public}@ %@: %{public}@";
      goto LABEL_10;
    }
LABEL_7:
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
  if (!v20)
  {
    uint64_t v11 = (void *)a1[4];
    uint64_t v12 = [v8 url];
    uint64_t v13 = *(void *)(a1[5] + 8);
    id v18 = *(id *)(v13 + 40);
    LOBYTE(v11) = [v11 removeItemAtURL:v12 error:&v18];
    objc_storeStrong((id *)(v13 + 40), v18);

    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v8 url];
        uint64_t v15 = *(void *)(*(void *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543874;
        id v22 = v7;
        __int16 v23 = 2112;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        uint64_t v16 = "Unable to remove empty file for URL ref with role %{public}@ %@: %{public}@";
LABEL_10:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);

        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
LABEL_8:
}

void sub_1000084A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000084CC(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = [v6 url];
  id v8 = [v7 path];

  if ([*(id *)(a1 + 32) fileExistsAtPath:v8 isDirectory:0]) {
    goto LABEL_17;
  }
  uint64_t v9 = [v6 url];
  uint64_t v10 = [v9 URLByDeletingLastPathComponent];

  char v24 = 0;
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v10 path];
  LODWORD(v11) = [v11 fileExistsAtPath:v12 isDirectory:&v24];

  if (v11)
  {
    if (v24) {
      goto LABEL_9;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v8;
    uint64_t v13 = "Attempting to create empty destination output file at path %@ but the parent directory path exists and is not a directory";
    goto LABEL_19;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  NSFileAttributeKey v27 = NSFileOwnerAccountName;
  CFStringRef v28 = @"mobile";
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v16 + 40);
  LOBYTE(v14) = [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v15 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);

  if (v14) {
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v22;
    uint64_t v13 = "Attempting to create empty destination output file at path %@ but parent directory creation failed:";
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
  }
LABEL_8:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v17 = *(void **)(a1 + 32);
    NSFileAttributeKey v25 = NSFileOwnerAccountName;
    CFStringRef v26 = @"mobile";
    id v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    LOBYTE(v17) = [v17 createFileAtPath:v8 contents:0 attributes:v18];

    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create empty file at destination %@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    uint64_t v19 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:0];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_17:
}

void sub_100008A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008A7C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [a3 dictionaryRepresentationWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to encode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void sub_10000967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100009694(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = 0;
  id result = [a3 getPathHash:&v5 lastPathComponent:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= v5;
  return result;
}

int64_t sub_100009AA0(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_100009C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100009CBC(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = +[PAMediaConversionServiceResourceURLReference referenceWithDictionaryRepresentation:a3 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1[4] + 8) setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to decode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

void sub_10000A128(id a1)
{
  qword_10003CD08 = objc_alloc_init(PAMediaConversionServiceImageMetadataPolicy);
  _objc_release_x1();
}

void sub_10000A788(id a1)
{
  qword_10003CD18 = objc_alloc_init(PAMediaConversionServiceDefaultImageMetadataPolicy);
  _objc_release_x1();
}

void sub_10000B5BC(id a1)
{
  qword_10003CD28 = objc_alloc_init(PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy);
  _objc_release_x1();
}

void sub_10000BCF0(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
    id v7 = [v6 mutableCopy];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[NSMutableDictionary dictionary];
    }
    uint64_t v10 = v9;

    [v10 addEntriesFromDictionary:v5];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

uint64_t sub_10000C0AC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v18);
        __int16 v14 = [v6 objectForKeyedSubscript:v12];
        unsigned int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          uint64_t v16 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_11:

  return v16;
}

void sub_10000CEB8(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to send progress update for request %{public}@ to client: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10000D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D190(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 requestTracker];
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || ((6u >> v6) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void sub_10000D2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D2C0(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 requestTracker];
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || (v6 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void sub_10000D3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D3E8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id v4 = [a2 requestTracker];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 effectivePriority] == *(id *)(a1 + 40);
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
}

int64_t sub_10000D5D4(id a1, ClientRequest *a2, ClientRequest *a3)
{
  id v4 = a3;
  int v5 = [(ClientRequest *)a2 requestTracker];
  unint64_t v6 = [(ClientRequest *)v4 requestTracker];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10000D884(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 connectionIdentifier];
  id v4 = [v3 UUIDString];
  unsigned int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    unint64_t v6 = *(void **)(a1 + 40);
    id v7 = [v8 identifier];
    [v6 addObject:v7];
  }
}

void sub_10000DA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DA24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DA34(uint64_t a1)
{
}

void sub_10000DA3C(uint64_t a1, void *a2, unsigned char *a3)
{
  unsigned int v5 = [a2 requestTracker];
  uint64_t v6 = [v5 destinationURLCollection];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

void sub_10000DBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DBD8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 identifier];
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_10000DEBC(id a1, ClientRequest *a2, BOOL *a3)
{
  id v3 = [(ClientRequest *)a2 requestTracker];
  [v3 didDequeueAndStartProcessingRequest];
}

uint64_t sub_10000DFB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E9A4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 requestIdentifiersForConnectionIdentifier:*(void *)(a1 + 40)];
  [v2 addObjectsFromArray:v3];
}

void sub_10000EDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000EE28(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v12 = 0;
  uint64_t v7 = [v6 removeAndReturnClientRequestWithIdentifier:a1[4] remainingRequestCount:&v12];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v10)
  {
    [v10 setCancellationReasonDebugDescription:@"Client request"];
    *a3 = 1;
    if (!v12) {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[4];
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Found client request reference for cancelled request identifier %{public}@ in conversion %{public}@, remaining request count %lu", buf, 0x20u);
    }
  }
}

void sub_10000F0E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, long long a14)
{
  if (a2)
  {
    id v16 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v17 = v16;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        buf = 138543618;
        WORD2(a14) = 2114;
        *(void *)((char *)&a14 + 6) = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Exception while cancelling request with identifier %{public}@: %{public}@", (uint8_t *)&buf, 0x16u);
      }
      objc_end_catch();
      os_unfair_lock_unlock(v14);
      JUMPOUT(0x10000F054);
    }
    os_unfair_lock_unlock(v14);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_10000F35C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int buf, long long a18)
{
  if (a2)
  {
    _Block_object_dispose(&buf, 8);
    id v21 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v22 = v21;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        buf = 138543618;
        WORD2(a1_Block_object_dispose(&a9, 8) = 2114;
        *(void *)((char *)&a18 + 6) = v22;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Exception while modifying request with identifier %{public}@: %{public}@", (uint8_t *)&buf, 0x16u);
      }
      objc_end_catch();
      JUMPOUT(0x10000F2D0);
    }
    os_unfair_lock_unlock(v18);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_10000F41C(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 clientRequestForIdentifier:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a3 = 1;
  }
}

void sub_10000F69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000F6C0(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) resourceURLForRole:v7];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v8 path];
    uint64_t v11 = [v9 path];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Copying conversion output %@ (role %@) to destination %@ for request %{public}@", buf, 0x2Au);
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy conversion request output - destination URL collection for request %{public}@ is missing URL for role %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    id v16 = +[NSString stringWithFormat:@"Failed to copy conversion output - destination URL collection is missing URL for role %@", v7];
    NSFileAttributeKey v25 = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    goto LABEL_11;
  }
  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v14 + 40);
  unsigned __int8 v15 = [v13 copyItemAtURL:v8 toURL:v9 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy conversion output for role %{public}@: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_11:
    *a4 = 1;
  }
}

int64_t sub_1000100D8(id a1, MediaConversionQueueEntry *a2, MediaConversionQueueEntry *a3)
{
  return [(MediaConversionQueueEntry *)a2 compareProcessingOrderToEntry:a3];
}

id sub_100010860(uint64_t a1)
{
  return [*(id *)(a1 + 32) processQueue];
}

uint64_t sub_100010998(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010EA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v33 = objc_begin_catch(exception_object);
      id v34 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v35 = [v29 identifier];
        *(_DWORD *)(v32 - 144) = 138543618;
        *(void *)(v31 + 4) = v35;
        *(_WORD *)(v32 - 132) = 2114;
        *(void *)(v31 + 14) = v33;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Exception while enqueueing new queue entry %{public}@: %{public}@", (uint8_t *)(v32 - 144), 0x16u);
      }
      objc_end_catch();
      JUMPOUT(0x100010C2CLL);
    }
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v30);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_100010FE0(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  unsigned __int8 v11 = 0;
  unsigned int v7 = [*(id *)(a1 + 32) taskTypeSupportsDeduplication];
  LOBYTE(v_Block_object_dispose(&a9, 8) = 0;
  if (v7)
  {
    unsigned int v8 = [v6 taskTypeSupportsDeduplication];
    if (v8) {
      LOBYTE(v_Block_object_dispose(&a9, 8) = [v6 clientRequestIsDuplicate:*(void *)(a1 + 40) identicalDestination:&v11];
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (![*(id *)(a1 + 40) requiresDeduplicationAgainstOriginalWithIdenticalOutput] || v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v9 = [*(id *)(a1 + 40) identifier];
        uint64_t v10 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138544130;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        unsigned __int8 v15 = v10;
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "New queue entry %{public}@ for request %{public}@ is duplicate of existing entry %{public}@ (identical output: %d), attached request to existing entry", buf, 0x26u);
      }
      [v6 addClientRequest:*(void *)(a1 + 40)];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_100012C78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unsigned int v7 = [a3 lastPathComponent];
  unsigned int v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
  id v9 = [v5 URLByAppendingPathComponent:v8];

  [*(id *)(a1 + 40) setResourceURL:v9 forRole:v6];
}

void sub_1000134E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013510(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100013980(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetadata:a2];
}

void sub_1000144A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1000144E0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_100015A64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100015AE0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPortraitInfo:v3];
  [v4 setStrength:*(float *)(a1 + 40)];
  [v4 setEnabled:1];
}

void sub_100015B4C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDepthInfo:v3];
  [v4 setAperture:*(float *)(a1 + 48)];
  [v4 setFocusRect:*(void *)(a1 + 40)];
  [v4 setEnabled:1];
}

CFTypeRef sub_10001736C(uint64_t a1, CGColorSpaceRef space)
{
  if ((unint64_t)(a1 - 1) >= 2)
  {
    if (a1) {
      return 0;
    }
    CGColorSpaceRef v2 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    if (!v2) {
      return 0;
    }
  }
  else
  {
    CGColorSpaceRef v2 = CGColorSpaceRetain(space);
    if (!v2) {
      return 0;
    }
  }
  return CFAutorelease(v2);
}

void sub_10001782C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017FCC(uint64_t a1, void *a2)
{
  CGColorSpaceRef v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 rectValue];
  objc_msgSend(v3, "setCropRect:");
  [v3 setEnabled:1];
}

id sub_10001802C(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32)];
}

void sub_10001976C(id a1, NSString *a2, NSString *a3)
{
  id v3 = [(NSString *)a2 UTF8String];
  unsetenv(v3);
}

void sub_1000198A4(id a1, NSString *a2, NSString *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = [(NSString *)v4 UTF8String];
  unsigned int v7 = v5;
  unsigned int v8 = [(NSString *)v7 UTF8String];

  setenv(v6, v8, 1);
}

void sub_100019BA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001BD00(uint64_t a1)
{
  CGColorSpaceRef v2 = 0;
  if (PFFigGetImageSourceImageIndexForContainerItemID())
  {
    CGColorSpaceRef v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    id v3 = +[NSNull null];
    unsigned int v4 = [v2 isEqual:v3];

    if (v4)
    {

      CGColorSpaceRef v2 = 0;
    }
  }
  return v2;
}

int64_t sub_10001E558(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_10001E72C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E758(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E768(uint64_t a1)
{
}

void sub_10001E770(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) resourceURLForRole:v7];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [*(id *)(a1 + 40) requestIdentifier];
    unsigned __int8 v11 = [*(id *)(a1 + 48) requestIdentifier];
    *(_DWORD *)buf = 138413314;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v9;
    __int16 v32 = 2114;
    id v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Copying destination URL (role %@) from original %@ (request %{public}@) to duplicate %@ (request %{public}@) ", buf, 0x34u);
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy duplicate request output - destination URL collection is missing URL for role %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
    unsigned __int8 v15 = +[NSString stringWithFormat:@"Failed to copy duplicate request output - destination URL collection is missing URL for role %@", v7];
    __int16 v23 = v15;
    __int16 v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
    int v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_11;
  }
  uint64_t v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v13 + 40);
  unsigned __int8 v14 = [v12 copyItemAtURL:v8 toURL:v9 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      long long v20 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy duplicate request output for role %{public}@: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_11:
    *a4 = 1;
  }
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return _CGColorSpaceRetain(space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithURL(url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return _CGImageSourceCopyProperties(isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return _CGImageSourceGetPrimaryImageIndex(isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return _CGImageSourceGetType(isrc);
}

uint64_t CMPhotoReleaseHardwareResources()
{
  return _CMPhotoReleaseHardwareResources();
}

uint64_t IPAOrientationFromClockwiseRotation()
{
  return _IPAOrientationFromClockwiseRotation();
}

uint64_t IPAOrientationIsValid()
{
  return _IPAOrientationIsValid();
}

uint64_t IPAOrientationMakeTransformWithSize()
{
  return _IPAOrientationMakeTransformWithSize();
}

uint64_t IPAOrientationTransformIntegralImageSize()
{
  return _IPAOrientationTransformIntegralImageSize();
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return _NSIsEmptyRect(aRect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t NUScaleFromDouble()
{
  return _NUScaleFromDouble();
}

uint64_t PFFigCopyImageFileWithPropertiesToData()
{
  return _PFFigCopyImageFileWithPropertiesToData();
}

uint64_t PFFigGetImageSourceImageIndexForContainerItemID()
{
  return _PFFigGetImageSourceImageIndexForContainerItemID();
}

uint64_t PFImageMetricComputeSSIMForCIImage()
{
  return _PFImageMetricComputeSSIMForCIImage();
}

uint64_t PFScaleFactorForMaximumPixelCount()
{
  return _PFScaleFactorForMaximumPixelCount();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __fpclassifyd(double a1)
{
  return ___fpclassifyd(a1);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
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

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

id objc_retainAutoreleasedReturnValue(id a1)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pc_session_begin()
{
  return _pc_session_begin();
}

uint64_t pc_session_create()
{
  return _pc_session_create();
}

uint64_t pc_session_destroy()
{
  return _pc_session_destroy();
}

uint64_t pc_session_end()
{
  return _pc_session_end();
}

uint64_t pc_session_get_value()
{
  return _pc_session_get_value();
}

uint64_t pc_session_set_procpid()
{
  return _pc_session_set_procpid();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

id objc_msgSend_IPTCCredit(void *a1, const char *a2, ...)
{
  return [a1 IPTCCredit];
}

id objc_msgSend_PICropAdjustmentKey(void *a1, const char *a2, ...)
{
  return [a1 PICropAdjustmentKey];
}

id objc_msgSend_PIDepthAdjustmentKey(void *a1, const char *a2, ...)
{
  return [a1 PIDepthAdjustmentKey];
}

id objc_msgSend_PIOrientationAdjustmentKey(void *a1, const char *a2, ...)
{
  return [a1 PIOrientationAdjustmentKey];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
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

id objc_msgSend__validate(void *a1, const char *a2, ...)
{
  return [a1 _validate];
}

id objc_msgSend__validateMetadata(void *a1, const char *a2, ...)
{
  return [a1 _validateMetadata];
}

id objc_msgSend__validateOrientation(void *a1, const char *a2, ...)
{
  return [a1 _validateOrientation];
}

id objc_msgSend__validateOutputSize(void *a1, const char *a2, ...)
{
  return [a1 _validateOutputSize];
}

id objc_msgSend__validateSource(void *a1, const char *a2, ...)
{
  return [a1 _validateSource];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_accessProviderDelegate(void *a1, const char *a2, ...)
{
  return [a1 accessProviderDelegate];
}

id objc_msgSend_accessibilityDescription(void *a1, const char *a2, ...)
{
  return [a1 accessibilityDescription];
}

id objc_msgSend_adjustmentConstants(void *a1, const char *a2, ...)
{
  return [a1 adjustmentConstants];
}

id objc_msgSend_adjustmentInformation(void *a1, const char *a2, ...)
{
  return [a1 adjustmentInformation];
}

id objc_msgSend_adjustmentSidecarDataResourceURL(void *a1, const char *a2, ...)
{
  return [a1 adjustmentSidecarDataResourceURL];
}

id objc_msgSend_adjustmentStack(void *a1, const char *a2, ...)
{
  return [a1 adjustmentStack];
}

id objc_msgSend_adjustments(void *a1, const char *a2, ...)
{
  return [a1 adjustments];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allRequestsAreBackground(void *a1, const char *a2, ...)
{
  return [a1 allRequestsAreBackground];
}

id objc_msgSend_allRequestsAreOptional(void *a1, const char *a2, ...)
{
  return [a1 allRequestsAreOptional];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_anyDestinationURLCollection(void *a1, const char *a2, ...)
{
  return [a1 anyDestinationURLCollection];
}

id objc_msgSend_apertureValue(void *a1, const char *a2, ...)
{
  return [a1 apertureValue];
}

id objc_msgSend_applySourceOrientationTransform(void *a1, const char *a2, ...)
{
  return [a1 applySourceOrientationTransform];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_avFPS(void *a1, const char *a2, ...)
{
  return [a1 avFPS];
}

id objc_msgSend_blastDoorError(void *a1, const char *a2, ...)
{
  return [a1 blastDoorError];
}

id objc_msgSend_blastDoorMainSourceProperties(void *a1, const char *a2, ...)
{
  return [a1 blastDoorMainSourceProperties];
}

id objc_msgSend_blastDoorSourceURL(void *a1, const char *a2, ...)
{
  return [a1 blastDoorSourceURL];
}

id objc_msgSend_blastDoorVideoComplementProperties(void *a1, const char *a2, ...)
{
  return [a1 blastDoorVideoComplementProperties];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_burstUuid(void *a1, const char *a2, ...)
{
  return [a1 burstUuid];
}

id objc_msgSend_cacheDestinationBookmarkCollectionSignature(void *a1, const char *a2, ...)
{
  return [a1 cacheDestinationBookmarkCollectionSignature];
}

id objc_msgSend_cacheSourceBookmarkCollectionSignatureAndFilename(void *a1, const char *a2, ...)
{
  return [a1 cacheSourceBookmarkCollectionSignatureAndFilename];
}

id objc_msgSend_canAccessSourceImageProperties(void *a1, const char *a2, ...)
{
  return [a1 canAccessSourceImageProperties];
}

id objc_msgSend_cancellationReasonDebugDescription(void *a1, const char *a2, ...)
{
  return [a1 cancellationReasonDebugDescription];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return [a1 caption];
}

id objc_msgSend_captureMode(void *a1, const char *a2, ...)
{
  return [a1 captureMode];
}

id objc_msgSend_captureModeTimelapse(void *a1, const char *a2, ...)
{
  return [a1 captureModeTimelapse];
}

id objc_msgSend_cgImage(void *a1, const char *a2, ...)
{
  return [a1 cgImage];
}

id objc_msgSend_ciffWhiteBalanceIndex(void *a1, const char *a2, ...)
{
  return [a1 ciffWhiteBalanceIndex];
}

id objc_msgSend_clientProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientProcessIdentifier];
}

id objc_msgSend_clientRequestsSnapshot(void *a1, const char *a2, ...)
{
  return [a1 clientRequestsSnapshot];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codecFourCharCode(void *a1, const char *a2, ...)
{
  return [a1 codecFourCharCode];
}

id objc_msgSend_colorspaceMode(void *a1, const char *a2, ...)
{
  return [a1 colorspaceMode];
}

id objc_msgSend_composition(void *a1, const char *a2, ...)
{
  return [a1 composition];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 connectionIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDumpDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 debugDumpDirectoryURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRasterizationDPI(void *a1, const char *a2, ...)
{
  return [a1 defaultRasterizationDPI];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateCanCancelCurrentlyProcessingRequestQueueEntry(void *a1, const char *a2, ...)
{
  return [a1 delegateCanCancelCurrentlyProcessingRequestQueueEntry];
}

id objc_msgSend_depthAdjustmentController(void *a1, const char *a2, ...)
{
  return [a1 depthAdjustmentController];
}

id objc_msgSend_depthInfo(void *a1, const char *a2, ...)
{
  return [a1 depthInfo];
}

id objc_msgSend_dequeueAndStartProcessingTime(void *a1, const char *a2, ...)
{
  return [a1 dequeueAndStartProcessingTime];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationData(void *a1, const char *a2, ...)
{
  return [a1 destinationData];
}

id objc_msgSend_destinationImageProperties(void *a1, const char *a2, ...)
{
  return [a1 destinationImageProperties];
}

id objc_msgSend_destinationResourceURLCollection(void *a1, const char *a2, ...)
{
  return [a1 destinationResourceURLCollection];
}

id objc_msgSend_destinationURLCollection(void *a1, const char *a2, ...)
{
  return [a1 destinationURLCollection];
}

id objc_msgSend_destinationURLsSignature(void *a1, const char *a2, ...)
{
  return [a1 destinationURLsSignature];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didCompleteRequest(void *a1, const char *a2, ...)
{
  return [a1 didCompleteRequest];
}

id objc_msgSend_didDequeueAndStartProcessingQueueEntry(void *a1, const char *a2, ...)
{
  return [a1 didDequeueAndStartProcessingQueueEntry];
}

id objc_msgSend_didDequeueAndStartProcessingRequest(void *a1, const char *a2, ...)
{
  return [a1 didDequeueAndStartProcessingRequest];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_effectivePriority(void *a1, const char *a2, ...)
{
  return [a1 effectivePriority];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_enqueueTime(void *a1, const char *a2, ...)
{
  return [a1 enqueueTime];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exifAuxFlashCompensation(void *a1, const char *a2, ...)
{
  return [a1 exifAuxFlashCompensation];
}

id objc_msgSend_exifDictionary(void *a1, const char *a2, ...)
{
  return [a1 exifDictionary];
}

id objc_msgSend_exifFlashFired(void *a1, const char *a2, ...)
{
  return [a1 exifFlashFired];
}

id objc_msgSend_exposureBiasValue(void *a1, const char *a2, ...)
{
  return [a1 exposureBiasValue];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flash(void *a1, const char *a2, ...)
{
  return [a1 flash];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_focalLenIn35mmFilm(void *a1, const char *a2, ...)
{
  return [a1 focalLenIn35mmFilm];
}

id objc_msgSend_focalLength(void *a1, const char *a2, ...)
{
  return [a1 focalLength];
}

id objc_msgSend_formatConversionOnly(void *a1, const char *a2, ...)
{
  return [a1 formatConversionOnly];
}

id objc_msgSend_generativeAIImageType(void *a1, const char *a2, ...)
{
  return [a1 generativeAIImageType];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_gifDelayTime(void *a1, const char *a2, ...)
{
  return [a1 gifDelayTime];
}

id objc_msgSend_gpsHPositioningError(void *a1, const char *a2, ...)
{
  return [a1 gpsHPositioningError];
}

id objc_msgSend_gpsSpeed(void *a1, const char *a2, ...)
{
  return [a1 gpsSpeed];
}

id objc_msgSend_gpsSpeedRef(void *a1, const char *a2, ...)
{
  return [a1 gpsSpeedRef];
}

id objc_msgSend_gpsTimestamp(void *a1, const char *a2, ...)
{
  return [a1 gpsTimestamp];
}

id objc_msgSend_graphDumpURLsForCurrentProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 graphDumpURLsForCurrentProcessIdentifier];
}

id objc_msgSend_hasHDRGainMap(void *a1, const char *a2, ...)
{
  return [a1 hasHDRGainMap];
}

id objc_msgSend_hasISOGainMap(void *a1, const char *a2, ...)
{
  return [a1 hasISOGainMap];
}

id objc_msgSend_hasLivePhotoSourceURLs(void *a1, const char *a2, ...)
{
  return [a1 hasLivePhotoSourceURLs];
}

id objc_msgSend_hasPhotosAdjustments(void *a1, const char *a2, ...)
{
  return [a1 hasPhotosAdjustments];
}

id objc_msgSend_hasSpatialAudio(void *a1, const char *a2, ...)
{
  return [a1 hasSpatialAudio];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hdrGain(void *a1, const char *a2, ...)
{
  return [a1 hdrGain];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageClientReplyHandler(void *a1, const char *a2, ...)
{
  return [a1 imageClientReplyHandler];
}

id objc_msgSend_imageDate(void *a1, const char *a2, ...)
{
  return [a1 imageDate];
}

id objc_msgSend_imageDestination(void *a1, const char *a2, ...)
{
  return [a1 imageDestination];
}

id objc_msgSend_imageDestinationData(void *a1, const char *a2, ...)
{
  return [a1 imageDestinationData];
}

id objc_msgSend_imageDirection(void *a1, const char *a2, ...)
{
  return [a1 imageDirection];
}

id objc_msgSend_imageDirectionRef(void *a1, const char *a2, ...)
{
  return [a1 imageDirectionRef];
}

id objc_msgSend_imageSource(void *a1, const char *a2, ...)
{
  return [a1 imageSource];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialRequestConversionOptions(void *a1, const char *a2, ...)
{
  return [a1 initialRequestConversionOptions];
}

id objc_msgSend_initialRequestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 initialRequestIdentifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_iptcDictionary(void *a1, const char *a2, ...)
{
  return [a1 iptcDictionary];
}

id objc_msgSend_isAlchemist(void *a1, const char *a2, ...)
{
  return [a1 isAlchemist];
}

id objc_msgSend_isAnimatedImage(void *a1, const char *a2, ...)
{
  return [a1 isAnimatedImage];
}

id objc_msgSend_isBlastDoorAccessRequired(void *a1, const char *a2, ...)
{
  return [a1 isBlastDoorAccessRequired];
}

id objc_msgSend_isCameraRunning(void *a1, const char *a2, ...)
{
  return [a1 isCameraRunning];
}

id objc_msgSend_isCustomRendered(void *a1, const char *a2, ...)
{
  return [a1 isCustomRendered];
}

id objc_msgSend_isFrontFacingCamera(void *a1, const char *a2, ...)
{
  return [a1 isFrontFacingCamera];
}

id objc_msgSend_isHDR(void *a1, const char *a2, ...)
{
  return [a1 isHDR];
}

id objc_msgSend_isPhotoBooth(void *a1, const char *a2, ...)
{
  return [a1 isPhotoBooth];
}

id objc_msgSend_isProRes(void *a1, const char *a2, ...)
{
  return [a1 isProRes];
}

id objc_msgSend_isRAWSourceUTI(void *a1, const char *a2, ...)
{
  return [a1 isRAWSourceUTI];
}

id objc_msgSend_isThreeImageStereoHEIC(void *a1, const char *a2, ...)
{
  return [a1 isThreeImageStereoHEIC];
}

id objc_msgSend_isVideoMontage(void *a1, const char *a2, ...)
{
  return [a1 isVideoMontage];
}

id objc_msgSend_isoRatingValue(void *a1, const char *a2, ...)
{
  return [a1 isoRatingValue];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lensMake(void *a1, const char *a2, ...)
{
  return [a1 lensMake];
}

id objc_msgSend_lensModel(void *a1, const char *a2, ...)
{
  return [a1 lensModel];
}

id objc_msgSend_lightSource(void *a1, const char *a2, ...)
{
  return [a1 lightSource];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_livePhotoPairingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 livePhotoPairingIdentifier];
}

id objc_msgSend_livePhotoPairingIdentifierMetadataKey(void *a1, const char *a2, ...)
{
  return [a1 livePhotoPairingIdentifierMetadataKey];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_logMessageSummary(void *a1, const char *a2, ...)
{
  return [a1 logMessageSummary];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_lossyCompressionQuality(void *a1, const char *a2, ...)
{
  return [a1 lossyCompressionQuality];
}

id objc_msgSend_mainSourceResourceURL(void *a1, const char *a2, ...)
{
  return [a1 mainSourceResourceURL];
}

id objc_msgSend_make(void *a1, const char *a2, ...)
{
  return [a1 make];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataPolicy(void *a1, const char *a2, ...)
{
  return [a1 metadataPolicy];
}

id objc_msgSend_meteringMode(void *a1, const char *a2, ...)
{
  return [a1 meteringMode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newComposition(void *a1, const char *a2, ...)
{
  return [a1 newComposition];
}

id objc_msgSend_nextRequestNumber(void *a1, const char *a2, ...)
{
  return [a1 nextRequestNumber];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_optimizeQueueAndDequeueNextRequestQueueEntry(void *a1, const char *a2, ...)
{
  return [a1 optimizeQueueAndDequeueNextRequestQueueEntry];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_orientationTransformBehavior(void *a1, const char *a2, ...)
{
  return [a1 orientationTransformBehavior];
}

id objc_msgSend_originalFileName(void *a1, const char *a2, ...)
{
  return [a1 originalFileName];
}

id objc_msgSend_originatingAssetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originatingAssetIdentifier];
}

id objc_msgSend_outputData(void *a1, const char *a2, ...)
{
  return [a1 outputData];
}

id objc_msgSend_outputFileType(void *a1, const char *a2, ...)
{
  return [a1 outputFileType];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_outputImageSize(void *a1, const char *a2, ...)
{
  return [a1 outputImageSize];
}

id objc_msgSend_outputInformation(void *a1, const char *a2, ...)
{
  return [a1 outputInformation];
}

id objc_msgSend_outputTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outputTypeIdentifier];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_photosAdjustmentData(void *a1, const char *a2, ...)
{
  return [a1 photosAdjustmentData];
}

id objc_msgSend_policies(void *a1, const char *a2, ...)
{
  return [a1 policies];
}

id objc_msgSend_portraitAdjustmentController(void *a1, const char *a2, ...)
{
  return [a1 portraitAdjustmentController];
}

id objc_msgSend_portraitInfo(void *a1, const char *a2, ...)
{
  return [a1 portraitInfo];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_processingFlags(void *a1, const char *a2, ...)
{
  return [a1 processingFlags];
}

id objc_msgSend_profileName(void *a1, const char *a2, ...)
{
  return [a1 profileName];
}

id objc_msgSend_protectedTemporaryItemsSubdirectoryName(void *a1, const char *a2, ...)
{
  return [a1 protectedTemporaryItemsSubdirectoryName];
}

id objc_msgSend_rasterizationDPI(void *a1, const char *a2, ...)
{
  return [a1 rasterizationDPI];
}

id objc_msgSend_rawOrientation(void *a1, const char *a2, ...)
{
  return [a1 rawOrientation];
}

id objc_msgSend_rawPixelHeight(void *a1, const char *a2, ...)
{
  return [a1 rawPixelHeight];
}

id objc_msgSend_rawPixelWidth(void *a1, const char *a2, ...)
{
  return [a1 rawPixelWidth];
}

id objc_msgSend_rawSourceMaximumPixelCountForBackgroundProcessing(void *a1, const char *a2, ...)
{
  return [a1 rawSourceMaximumPixelCountForBackgroundProcessing];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_registerPhotosAdjustmentsSubsystems(void *a1, const char *a2, ...)
{
  return [a1 registerPhotosAdjustmentsSubsystems];
}

id objc_msgSend_registeredPhotosSchemaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredPhotosSchemaIdentifier];
}

id objc_msgSend_requestCompletionPerfCheckExtraInformation(void *a1, const char *a2, ...)
{
  return [a1 requestCompletionPerfCheckExtraInformation];
}

id objc_msgSend_requestCompletionPerfCheckExtraInformationLogString(void *a1, const char *a2, ...)
{
  return [a1 requestCompletionPerfCheckExtraInformationLogString];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestNumber(void *a1, const char *a2, ...)
{
  return [a1 requestNumber];
}

id objc_msgSend_requestOptions(void *a1, const char *a2, ...)
{
  return [a1 requestOptions];
}

id objc_msgSend_requestOptionsSignatureString(void *a1, const char *a2, ...)
{
  return [a1 requestOptionsSignatureString];
}

id objc_msgSend_requestTracker(void *a1, const char *a2, ...)
{
  return [a1 requestTracker];
}

id objc_msgSend_requestedMaximumLongSideLength(void *a1, const char *a2, ...)
{
  return [a1 requestedMaximumLongSideLength];
}

id objc_msgSend_requestedMaximumPixelCount(void *a1, const char *a2, ...)
{
  return [a1 requestedMaximumPixelCount];
}

id objc_msgSend_requestedOrCalculatedMaximumLongSideLength(void *a1, const char *a2, ...)
{
  return [a1 requestedOrCalculatedMaximumLongSideLength];
}

id objc_msgSend_requiresDeduplicationAgainstOriginalWithIdenticalOutput(void *a1, const char *a2, ...)
{
  return [a1 requiresDeduplicationAgainstOriginalWithIdenticalOutput];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return [a1 scaleFactor];
}

id objc_msgSend_scaledSize(void *a1, const char *a2, ...)
{
  return [a1 scaledSize];
}

id objc_msgSend_scheduleQueueProcessing(void *a1, const char *a2, ...)
{
  return [a1 scheduleQueueProcessing];
}

id objc_msgSend_semanticStylePreset(void *a1, const char *a2, ...)
{
  return [a1 semanticStylePreset];
}

id objc_msgSend_semanticStyleRenderingVersion(void *a1, const char *a2, ...)
{
  return [a1 semanticStyleRenderingVersion];
}

id objc_msgSend_semanticStyleSceneBias(void *a1, const char *a2, ...)
{
  return [a1 semanticStyleSceneBias];
}

id objc_msgSend_semanticStyleWarmthBias(void *a1, const char *a2, ...)
{
  return [a1 semanticStyleWarmthBias];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupCoreImageGraphDumpCapture(void *a1, const char *a2, ...)
{
  return [a1 setupCoreImageGraphDumpCapture];
}

id objc_msgSend_setupPerfCheck(void *a1, const char *a2, ...)
{
  return [a1 setupPerfCheck];
}

id objc_msgSend_shouldCheckForOutputCorruption(void *a1, const char *a2, ...)
{
  return [a1 shouldCheckForOutputCorruption];
}

id objc_msgSend_shouldDump(void *a1, const char *a2, ...)
{
  return [a1 shouldDump];
}

id objc_msgSend_shouldUseEmbeddedImageAsSource(void *a1, const char *a2, ...)
{
  return [a1 shouldUseEmbeddedImageAsSource];
}

id objc_msgSend_shutterSpeed(void *a1, const char *a2, ...)
{
  return [a1 shutterSpeed];
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return [a1 signpostID];
}

id objc_msgSend_smartStyleCast(void *a1, const char *a2, ...)
{
  return [a1 smartStyleCast];
}

id objc_msgSend_smartStyleColorBias(void *a1, const char *a2, ...)
{
  return [a1 smartStyleColorBias];
}

id objc_msgSend_smartStyleIntensity(void *a1, const char *a2, ...)
{
  return [a1 smartStyleIntensity];
}

id objc_msgSend_smartStyleIsReversible(void *a1, const char *a2, ...)
{
  return [a1 smartStyleIsReversible];
}

id objc_msgSend_smartStyleRenderingVersion(void *a1, const char *a2, ...)
{
  return [a1 smartStyleRenderingVersion];
}

id objc_msgSend_smartStyleToneBias(void *a1, const char *a2, ...)
{
  return [a1 smartStyleToneBias];
}

id objc_msgSend_sourceImageProperties(void *a1, const char *a2, ...)
{
  return [a1 sourceImageProperties];
}

id objc_msgSend_sourceImageRef(void *a1, const char *a2, ...)
{
  return [a1 sourceImageRef];
}

id objc_msgSend_sourceImageSize(void *a1, const char *a2, ...)
{
  return [a1 sourceImageSize];
}

id objc_msgSend_sourceOrientation(void *a1, const char *a2, ...)
{
  return [a1 sourceOrientation];
}

id objc_msgSend_sourceRequiresRasterization(void *a1, const char *a2, ...)
{
  return [a1 sourceRequiresRasterization];
}

id objc_msgSend_sourceResourceURLCollection(void *a1, const char *a2, ...)
{
  return [a1 sourceResourceURLCollection];
}

id objc_msgSend_sourceURLCollection(void *a1, const char *a2, ...)
{
  return [a1 sourceURLCollection];
}

id objc_msgSend_sourceURLCollectionSignature(void *a1, const char *a2, ...)
{
  return [a1 sourceURLCollectionSignature];
}

id objc_msgSend_sourceURLFilenameOnlySummary(void *a1, const char *a2, ...)
{
  return [a1 sourceURLFilenameOnlySummary];
}

id objc_msgSend_sourceUTI(void *a1, const char *a2, ...)
{
  return [a1 sourceUTI];
}

id objc_msgSend_spatialOverCaptureIdentifier(void *a1, const char *a2, ...)
{
  return [a1 spatialOverCaptureIdentifier];
}

id objc_msgSend_standardPolicy(void *a1, const char *a2, ...)
{
  return [a1 standardPolicy];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startWatching(void *a1, const char *a2, ...)
{
  return [a1 startWatching];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stillImageCaptureFlags(void *a1, const char *a2, ...)
{
  return [a1 stillImageCaptureFlags];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_storeDebugDump(void *a1, const char *a2, ...)
{
  return [a1 storeDebugDump];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subsecTimeOriginal(void *a1, const char *a2, ...)
{
  return [a1 subsecTimeOriginal];
}

id objc_msgSend_taskTypeSupportsDeduplication(void *a1, const char *a2, ...)
{
  return [a1 taskTypeSupportsDeduplication];
}

id objc_msgSend_tiffDictionary(void *a1, const char *a2, ...)
{
  return [a1 tiffDictionary];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timezoneOffset(void *a1, const char *a2, ...)
{
  return [a1 timezoneOffset];
}

id objc_msgSend_uniformTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniformTypeIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlCount(void *a1, const char *a2, ...)
{
  return [a1 urlCount];
}

id objc_msgSend_urlReferencesByRole(void *a1, const char *a2, ...)
{
  return [a1 urlReferencesByRole];
}

id objc_msgSend_userComment(void *a1, const char *a2, ...)
{
  return [a1 userComment];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return [a1 valid];
}

id objc_msgSend_validateSourceAndOptions(void *a1, const char *a2, ...)
{
  return [a1 validateSourceAndOptions];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_variationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 variationIdentifier];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_videoClientReplyHandler(void *a1, const char *a2, ...)
{
  return [a1 videoClientReplyHandler];
}

id objc_msgSend_videoComplementDurationTimescale(void *a1, const char *a2, ...)
{
  return [a1 videoComplementDurationTimescale];
}

id objc_msgSend_videoComplementDurationValue(void *a1, const char *a2, ...)
{
  return [a1 videoComplementDurationValue];
}

id objc_msgSend_videoComplementImageDisplayTimescale(void *a1, const char *a2, ...)
{
  return [a1 videoComplementImageDisplayTimescale];
}

id objc_msgSend_videoComplementImageDisplayValue(void *a1, const char *a2, ...)
{
  return [a1 videoComplementImageDisplayValue];
}

id objc_msgSend_videoComplementMediaGroupId(void *a1, const char *a2, ...)
{
  return [a1 videoComplementMediaGroupId];
}

id objc_msgSend_videoContainsCinematicData(void *a1, const char *a2, ...)
{
  return [a1 videoContainsCinematicData];
}

id objc_msgSend_videoDurationTimescale(void *a1, const char *a2, ...)
{
  return [a1 videoDurationTimescale];
}

id objc_msgSend_videoDurationValue(void *a1, const char *a2, ...)
{
  return [a1 videoDurationValue];
}

id objc_msgSend_videoDynamicRange(void *a1, const char *a2, ...)
{
  return [a1 videoDynamicRange];
}

id objc_msgSend_wantsProgress(void *a1, const char *a2, ...)
{
  return [a1 wantsProgress];
}

id objc_msgSend_whiteBalance(void *a1, const char *a2, ...)
{
  return [a1 whiteBalance];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}