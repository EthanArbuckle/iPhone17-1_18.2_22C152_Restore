id sub_10000618C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRAudioDecoder();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SRAudioDecoder()
{
  return self;
}

uint64_t sub_10000660C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2496);
  unint64_t v2 = (v1 + 1) % 0x270uLL;
  unsigned int v3 = *(_DWORD *)(a1 + 4 * ((v1 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(a1 + 4 * v2) & 0x7FFFFFFE | *(_DWORD *)(a1 + 4 * v1) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(a1 + 4 * v2) << 31) >> 31) & 0x9908B0DF;
  *(_DWORD *)(a1 + 4 * v1) = v3;
  *(void *)(a1 + 2496) = v2;
  LODWORD(v1) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (v1 << 15) & 0xEFC60000 ^ v1 ^ (((v1 << 15) & 0xEFC60000 ^ v1) >> 18);
}

uint64_t sub_1000066AC(uint64_t result, uint64_t a2, unint64_t a3)
{
  *(void *)result = a2;
  *(void *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0) {
    unint64_t v3 = (a3 >> 5) + 1;
  }
  else {
    unint64_t v3 = a3 >> 5;
  }
  unint64_t v4 = a3 / v3;
  *(void *)(result + 16) = a3 / v3;
  *(void *)(result + 24) = v3;
  unint64_t v5 = (-1 << (a3 / v3)) & (unint64_t)&_mh_execute_header;
  if (a3 / v3 >= 0x40) {
    unint64_t v5 = 0;
  }
  *(void *)(result + 40) = v5;
  if ((v5 ^ (unint64_t)&_mh_execute_header) > v5 / v3)
  {
    ++v3;
    unint64_t v4 = a3 / v3;
    *(void *)(result + 16) = a3 / v3;
    *(void *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      *(void *)(result + 32) = v3 - a3 + (v3 << 6);
      *(void *)(result + 40) = 0;
      LOBYTE(v4) = 64;
      goto LABEL_15;
    }
    *(void *)(result + 40) = (-1 << v4) & (unint64_t)&_mh_execute_header;
  }
  *(void *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 >= 0x3F)
  {
LABEL_15:
    *(void *)(result + 48) = 0;
    unsigned int v6 = -1;
    *(_DWORD *)(result + 56) = 0xFFFFFFFF >> -(char)v4;
    goto LABEL_16;
  }
  *(void *)(result + 48) = 0x80000000uLL >> v4 << (v4 + 1);
  unsigned int v6 = -1;
  unsigned int v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4) {
    unsigned int v7 = 0;
  }
  *(_DWORD *)(result + 56) = v7;
  if (v4 <= 0x1E) {
    unsigned int v6 = 0xFFFFFFFF >> ~(_BYTE)v4;
  }
LABEL_16:
  *(_DWORD *)(result + 60) = v6;
  return result;
}

uint64_t sub_100006798(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      do
        unsigned int v4 = sub_10000660C(*(void *)a1);
      while (*(void *)(a1 + 40) <= (unint64_t)v4);
      unint64_t v5 = *(void *)(a1 + 16);
      if (v5 >= 0x40) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v2 << v5;
      }
      uint64_t v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      unint64_t v7 = *(void *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    uint64_t v2 = 0;
    unint64_t v7 = 0;
  }
  for (; v7 < *(void *)(a1 + 24); ++v7)
  {
    do
      unsigned int v8 = sub_10000660C(*(void *)a1);
    while (*(void *)(a1 + 48) <= (unint64_t)v8);
    unint64_t v9 = *(void *)(a1 + 16);
    if (v9 >= 0x3F) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v2 << (v9 + 1);
    }
    uint64_t v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

void sub_100006E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, std::random_device a14, std::random_device a15)
{
  _Unwind_Resume(a1);
}

void sub_100006E7C(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  unint64_t v7 = (v5 - *a1) >> 2;
  if (a2 <= v7)
  {
    if (a2 < v7) {
      a1[1] = &v6[4 * a2];
    }
  }
  else
  {
    unint64_t v9 = a1[2];
    if (a2 - v7 <= (v9 - v5) >> 2)
    {
      v23 = &v5[4 * (a2 - v7)];
      uint64_t v24 = 4 * a2 - 4 * v7;
      do
      {
        *(_DWORD *)unint64_t v5 = *a3;
        v5 += 4;
        v24 -= 4;
      }
      while (v24);
      a1[1] = v23;
    }
    else
    {
      if (a2 >> 62) {
        sub_100006FA8();
      }
      unint64_t v10 = v9 - v6;
      unint64_t v11 = (v9 - v6) >> 1;
      if (v11 <= a2) {
        unint64_t v11 = a2;
      }
      if (v10 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      v13 = (char *)sub_1000070BC(v12);
      v15 = &v13[4 * v7];
      v16 = &v13[4 * a2];
      uint64_t v17 = 4 * a2 - 4 * v7;
      v18 = v15;
      do
      {
        *(_DWORD *)v18 = *a3;
        v18 += 4;
        v17 -= 4;
      }
      while (v17);
      v19 = &v13[4 * v14];
      v20 = *a1;
      for (i = a1[1]; i != v20; i -= 4)
      {
        int v22 = *((_DWORD *)i - 1);
        *((_DWORD *)v15 - 1) = v22;
        v15 -= 4;
      }
      *a1 = v15;
      a1[1] = v16;
      a1[2] = v19;
      if (v20)
      {
        operator delete(v20);
      }
    }
  }
}

void sub_100006FA8()
{
}

void *sub_100006FC0(unint64_t a1)
{
  if (a1 >> 61) {
    sub_100006FF8();
  }
  return operator new(8 * a1);
}

void sub_100006FF8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000702C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007088(exception, a1);
}

void sub_100007074(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100007088(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_1000070BC(unint64_t a1)
{
  if (a1 >> 62) {
    sub_100006FF8();
  }
  return operator new(4 * a1);
}

void *sub_1000070F4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000071A4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1000071A4()
{
}

void sub_1000072E4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007E28(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = sub_100008594;
    v58 = sub_1000085A4;
    id v59 = 0;
    unint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    unsigned int v4 = [v3 isFileURL];

    if (v4)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v5 = *(id *)(a1 + 32);
      id v6 = [v5 countByEnumeratingWithState:&v50 objects:v69 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v51;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v51 != v7) {
              objc_enumerationMutation(v5);
            }
            [v2 addObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          }
          id v6 = [v5 countByEnumeratingWithState:&v50 objects:v69 count:16];
        }
        while (v6);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      unint64_t v10 = NSTemporaryDirectory();
      uint64_t v11 = [v10 stringByAppendingPathComponent:@"nnlm-attachments"];
      v34 = +[NSURL fileURLWithPath:v11 isDirectory:1];

      unint64_t v12 = +[NSFileManager defaultManager];
      id v49 = 0;
      LOBYTE(v11) = [v12 createDirectoryAtURL:v34 withIntermediateDirectories:1 attributes:0 error:&v49];
      id v31 = v49;

      if (v11)
      {
        id v13 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v14 = dispatch_group_create();
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = *(id *)(a1 + 32);
        id v15 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v15)
        {
          uint64_t v33 = *(void *)v46;
          *(void *)&long long v16 = 138412546;
          long long v30 = v16;
LABEL_17:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v46 != v33) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
            dispatch_group_enter(v14);
            v19 = *(void **)(*(void *)(a1 + 40) + 16);
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1000085AC;
            v39[3] = &unk_10003C970;
            v39[4] = v18;
            id v40 = v34;
            v44 = &v54;
            id v41 = v2;
            id v13 = v13;
            id v42 = v13;
            v43 = v14;
            v20 = [v19 downloadTaskWithURL:v18 completionHandler:v39];
            if (v20)
            {
              v21 = qword_1000443B0;
              if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v20;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Starting attachment download %@", buf, 0xCu);
              }
              objc_msgSend(v20, "resume", v30);
              [v13 addObject:v20];
            }
            else
            {

              NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
              CFStringRef v61 = @"Fail to create download task";
              int v22 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
              uint64_t v23 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:155 userInfo:v22];
              uint64_t v24 = (void *)v55[5];
              v55[5] = v23;

              v25 = qword_1000443B0;
              if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_ERROR))
              {
                v26 = (void *)v55[5];
                *(_DWORD *)buf = v30;
                v66 = v18;
                __int16 v67 = 2114;
                id v68 = v26;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Fail to download attachment=%@ with error=%{public}@", buf, 0x16u);
              }
              id v13 = 0;
            }

            if (!v20) {
              break;
            }
            if (v15 == (id)++v17)
            {
              id v15 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
              if (v15) {
                goto LABEL_17;
              }
              break;
            }
          }
        }

        v27 = *(NSObject **)(*(void *)(a1 + 40) + 8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008984;
        block[3] = &unk_10003C998;
        id v37 = *(id *)(a1 + 48);
        id v36 = v2;
        v38 = &v54;
        dispatch_group_notify(v14, v27, block);
      }
      else
      {
        v28 = qword_1000443B0;
        if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v34;
          __int16 v67 = 2112;
          id v68 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not make temporary attachment directory at %@: %@", buf, 0x16u);
        }
        uint64_t v29 = *(void *)(a1 + 48);
        NSErrorUserInfoKey v63 = NSUnderlyingErrorKey;
        id v64 = v31;
        id v13 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v14 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:155 userInfo:v13];
        (*(void (**)(uint64_t, void *, NSObject *))(v29 + 16))(v29, &__NSArray0__struct, v14);
      }
    }
    _Block_object_dispose(&v54, 8);
  }
  else
  {
    unint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
  }
}

void sub_10000854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_100008594(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000085A4(uint64_t a1)
{
}

void sub_1000085AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = qword_1000443B0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v40 = v11;
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 2112;
      id v44 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Downloaded %@ to %@, response was %@", buf, 0x20u);
    }
    unint64_t v12 = *(void **)(a1 + 40);
    id v13 = [v8 suggestedFilename];
    uint64_t v14 = [v12 URLByAppendingPathComponent:v13];

    id v15 = +[NSFileManager defaultManager];
    id v35 = 0;
    unsigned __int8 v16 = [v15 moveItemAtURL:v7 toURL:v14 error:&v35];
    id v17 = v35;

    v18 = qword_1000443B0;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v7;
        __int16 v41 = 2112;
        id v42 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Moved %@ to %@", buf, 0x16u);
      }
      [*(id *)(a1 + 48) addObject:v14];
LABEL_16:

      goto LABEL_27;
    }
    if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v7;
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not move to %@: %@", buf, 0x16u);
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(void *)(v21 + 40)) {
      goto LABEL_16;
    }
    *(void *)(v21 + 40) = v17;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)qword_1000443B0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Attachment download failed %@: %@", buf, 0x16u);
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(void *)(v19 + 40))
  {
    if (v9)
    {
      id v20 = v9;
      uint64_t v14 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v20;
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 32);
      id v37 = NSURLErrorFailingURLErrorKey;
      uint64_t v38 = v22;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v23 = +[NSError errorWithDomain:NSURLErrorDomain code:-1011 userInfo:v14];
      uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
LABEL_19:

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = *(id *)(a1 + 56);
    id v27 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "cancel", (void)v31);
        }
        id v28 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v28);
    }

    [*(id *)(a1 + 56) removeAllObjects];
  }
LABEL_27:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t sub_100008984(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t sub_100009180(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet punctuationCharacterSet];
  if ([v1 length])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (uint64_t)objc_msgSend(v2, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", v3));
      if ((v4 & 1) == 0) {
        break;
      }
      ++v3;
    }
    while (v3 < (unint64_t)[v1 length]);
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

void sub_1000097B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sub_1000097F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009804(uint64_t a1)
{
}

void sub_10000980C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void sub_10000A874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,NSErrorUserInfoKey a58,uint64_t a59,NSErrorUserInfoKey a60,uint64_t a61)
{
  if (a2)
  {

    id v64 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      a58 = NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v64 + 16))(v64);
      v65 = +[NSString stringWithFormat:@"Exception in computeDelta: %s"];
      a59 = (uint64_t)v65;
      +[NSDictionary dictionaryWithObjects:&a59 forKeys:&a58 count:1];
    }
    else
    {
      a60 = NSLocalizedDescriptionKey;
      v65 = +[NSString stringWithFormat:@"Exception in computeDelta"];
      a61 = (uint64_t)v65;
      +[NSDictionary dictionaryWithObjects:&a61 forKeys:&a60 count:1];
    v66 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:153 userInfo:v66];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x10000A820);
  }
  _Unwind_Resume(exception_object);
}

id sub_10000AE0C(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v5 objectForKeyedSubscript:v6];
      a3 = [v10 BOOLValue];
    }
    else
    {
      uint64_t v11 = qword_1000443B8;
      if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 1024;
        int v16 = (int)a3;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "recipe[%@] cannot be parsed as a BOOL. Default value of %d is used. ", (uint8_t *)&v13, 0x12u);
      }
    }
  }

  return a3;
}

void sub_10000AF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AF94(void *a1)
{
}

void sub_10000B430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,NSErrorUserInfoKey a29,uint64_t a30,NSErrorUserInfoKey a31,uint64_t a32)
{
  if (a2)
  {

    long long v34 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      a29 = NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v34 + 16))(v34);
      id v35 = +[NSString stringWithFormat:@"Exception in evaluatePartialDelta: %s"];
      a30 = (uint64_t)v35;
      +[NSDictionary dictionaryWithObjects:&a30 forKeys:&a29 count:1];
    }
    else
    {
      a31 = NSLocalizedDescriptionKey;
      id v35 = +[NSString stringWithFormat:@"Exception in evaluatePartialDelta"];
      a32 = (uint64_t)v35;
      +[NSDictionary dictionaryWithObjects:&a32 forKeys:&a31 count:1];
    id v36 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v36];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x10000B3A8);
  }
  _Unwind_Resume(exception_object);
}

id sub_10000B754(void *a1, void *a2, uint64_t a3)
{
  id v4 = a1;
  id v29 = a2;
  id v28 = (id)objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      id v30 = v6;
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v9 = [v29 getTensorNamed:v8 directBind:1];
        uint64_t v10 = [v5 objectForKeyedSubscript:v8];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"offset"];
        signed int v12 = [v11 intValue];

        id v13 = [v9 dataPointer];
        id v14 = [v5 objectForKeyedSubscript:v8];
        __int16 v15 = [v14 objectForKeyedSubscript:@"size"];
        LODWORD(v11) = [v15 intValue];

        size_t v16 = 4 * (int)v11;
        id v17 = (void *)(a3 + 4 * v12);
        memcpy(v17, v13, v16);
        id v18 = objc_alloc((Class)ETDataTensor);
        uint64_t v19 = [v5 objectForKeyedSubscript:v8];
        id v20 = [v19 objectForKeyedSubscript:@"shape"];
        uint64_t v21 = [v5 objectForKeyedSubscript:v8];
        uint64_t v22 = [v21 objectForKeyedSubscript:@"strides"];
        id v23 = [v18 initWithData:v17 type:2 shape:v20 strides:v22];
        [v28 setObject:v23 forKeyedSubscript:v8];
      }
      id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  return v28;
}

void sub_10000B9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000C33C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a2)
  {

    v70 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      a63 = (uint64_t)NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v70 + 16))(v70);
      v71 = +[NSString stringWithFormat:@"Exception in train: %s"];
      a64 = (uint64_t)v71;
      +[NSDictionary dictionaryWithObjects:&a64 forKeys:&a63 count:1];
    }
    else
    {
      a65 = (uint64_t)NSLocalizedDescriptionKey;
      v71 = +[NSString stringWithFormat:@"Exception in train"];
      a66 = (uint64_t)v71;
      +[NSDictionary dictionaryWithObjects:&a66 forKeys:&a65 count:1];
    v72 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v72];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x10000C2E8);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000C730(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C740(uint64_t a1)
{
}

uint64_t sub_10000C748(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  double v43 = *(double *)&a2;
  double v6 = COERCE_DOUBLE(a3);
  id v44 = a4;
  for (unint64_t i = 0; i < (unint64_t)objc_msgSend(*(id *)&v6, "numberOfDataPoints", *(void *)&v43); ++i)
  {
    id v51 = 0;
    uint64_t v8 = [*(id *)&v6 dataPointAtIndex:i error:&v51];
    id v9 = v51;
    if (v9)
    {
      id v31 = v9;
      id v36 = qword_1000443B8;
      if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v54 = *(void *)&v43;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "epochCallback is unable to retrieve output of iteration %lu", buf, 0xCu);
      }
LABEL_38:

      uint64_t v35 = 0;
      goto LABEL_39;
    }
    uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    uint64_t v11 = [v8 objectForKeyedSubscript:v10];
    signed int v12 = (float *)[v11 dataPointer];

    id v13 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      double v15 = *v12;
      *(_DWORD *)buf = 134218240;
      unint64_t v54 = i;
      __int16 v55 = 2048;
      double v56 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Cost for batch %lu = %f", buf, 0x16u);
    }
    size_t v16 = *(void **)(a1 + 40);
    *(float *)&double v14 = *v12;
    id v17 = +[NSNumber numberWithFloat:v14];
    [v16 addObject:v17];
  }
  id v18 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v54 = *(void *)&v43;
    __int16 v55 = 2112;
    double v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Espresso training iteration=%lu result=%@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 96) shuffleSamples];
  [*(id *)(*(void *)(a1 + 48) + 104) setVectorsWithProcessor:*(void *)(*(void *)(a1 + 48) + 96)];
  uint64_t v19 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v54 = *(void *)&v43;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Finish running train epoch number %lu", buf, 0xCu);
  }
  float v20 = *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v20 > 0.0)
  {
    sub_100026DA0(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 1.0 / v20);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      float v21 = sub_100026EF4(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      float v22 = *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      if (v21 > v22) {
        sub_100026DA0(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v22 / v21);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    goto LABEL_31;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v8 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:@"trainingGlobals"];
  id v23 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v23) {
    goto LABEL_30;
  }
  uint64_t v45 = *(void *)v48;
  while (2)
  {
    for (j = 0; j != v23; j = (char *)j + 1)
    {
      if (*(void *)v48 != v45) {
        objc_enumerationMutation(v8);
      }
      unint64_t v25 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
      uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKey:v25];
      id v27 = (void *)v26;
      if (v20 > 0.0 && v26 != 0)
      {
        id v29 = [*(id *)(*(void *)(a1 + 48) + 144) objectForKeyedSubscript:v25];
        id v46 = 0;
        LODWORD(v30) = 1.0;
        [v27 applyToTensor:v29 scale:&v46 error:v30];
        id v31 = v46;

        if (v31)
        {
          uint64_t v37 = qword_1000443B8;
          if (!os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_37;
          }
          *(_WORD *)buf = 0;
          uint64_t v38 = "Unable to apply gradient";
          v39 = v37;
          uint32_t v40 = 2;
        }
        else
        {
          long long v32 = [v44 getTensorNamed:v25 directBind:1];
          long long v33 = [*(id *)(*(void *)(a1 + 48) + 144) objectForKeyedSubscript:v25];
          sub_10000D714(v32, v33);
          id v31 = (id)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            [v27 reset];
            goto LABEL_28;
          }
          uint64_t v41 = qword_1000443B8;
          if (!os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
          {
LABEL_37:

            goto LABEL_38;
          }
          *(_DWORD *)buf = 138412546;
          unint64_t v54 = v25;
          __int16 v55 = 2048;
          double v56 = v43;
          uint64_t v38 = "Unable to set %@ after epoch %lu";
          v39 = v41;
          uint32_t v40 = 22;
        }
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
        goto LABEL_37;
      }
LABEL_28:
    }
    id v23 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_30:

  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_31:
  id v34 = sub_10000B754(*(void **)(*(void *)(a1 + 48) + 152), *(void **)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 120));
  uint64_t v35 = 1;
LABEL_39:

  return v35;
}

void sub_10000CD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000CDAC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v62 = a4;
  id v75 = 0;
  double v56 = a2;
  v57 = v7;
  v58 = [v7 dataPointAtIndex:a2 error:&v75];
  id v8 = v75;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v78 = (uint64_t)a2;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "batchCallback is unable to retrieve outputs for batch %lu", buf, 0xCu);
    }
    goto LABEL_50;
  }
  uint64_t v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  uint64_t v63 = a1;
  signed int v12 = [v58 objectForKeyedSubscript:v11];

  float v13 = *(float *)[v12 dataPointer];
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13
                                                             + *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v14 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v78) = (int)v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "batchSize == %d", buf, 8u);
  }
  long long v74 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  double v15 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:@"trainingGlobals"];
  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v16)
  {
    uint64_t v60 = *(void *)v72;
    *(void *)&long long v17 = 138412546;
    long long v55 = v17;
    do
    {
      for (unint64_t i = 0; i != v16; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(*(void *)(v63 + 56) + 8) + 40), "objectForKey:", v19, v55);
        float v20 = (SMTGradientBuffer *)objc_claimAutoreleasedReturnValue();
        float v22 = [v62 getTensorNamed:v19 directBind:1];
        id v23 = [*(id *)(*(void *)(*(void *)(v63 + 64) + 8) + 40) containsObject:v19];
        if (v20)
        {
          uint64_t v24 = [*(id *)(*(void *)(v63 + 40) + 144) objectForKeyedSubscript:v19];
          id v69 = 0;
          *(float *)&double v25 = v13;
          [(SMTGradientBuffer *)v20 accumulateDifferenceBetweenTensorBefore:v24 andTensorAfter:v22 withScale:&v69 error:v25];
          id v9 = v69;
        }
        else
        {
          uint64_t v26 = [SMTGradientBuffer alloc];
          id v27 = [*(id *)(*(void *)(v63 + 40) + 144) objectForKeyedSubscript:v19];
          id v70 = 0;
          *(float *)&double v28 = v13;
          float v20 = [(SMTGradientBuffer *)v26 initWithTensorBefore:v27 tensorAfter:v22 withScale:v23 shouldSparsify:&v70 error:v28];
          id v9 = v70;

          [*(id *)(*(void *)(*(void *)(v63 + 56) + 8) + 40) setObject:v20 forKeyedSubscript:v19];
        }
        if (v9)
        {
          id v29 = qword_1000443B8;
          if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v78 = (uint64_t)v56;
            __int16 v79 = 2112;
            v80 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to accumulate gradient of batch %lu for %@", buf, 0x16u);
          }
        }
        else if (v23)
        {
          double v30 = (id)qword_1000443B8;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            id v31 = [(SMTGradientBuffer *)v20 description];
            *(_DWORD *)buf = v55;
            uint64_t v78 = (uint64_t)v19;
            __int16 v79 = 2112;
            v80 = v31;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
          }
        }

        if (v9)
        {

LABEL_50:
          uint64_t v46 = 0;
          goto LABEL_51;
        }
      }
      double v15 = obj;
      id v16 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v16);
  }

  long long v32 = (void *)v63;
  unint64_t v61 = ((unint64_t)v56 + 1) % *(int *)(v63 + 96);
  if (!v61)
  {
    sub_100026DA0(*(void **)(*(void *)(*(void *)(v63 + 56) + 8) + 40), 1.0 / *(float *)(*(void *)(*(void *)(v63 + 48) + 8) + 24));
    if (*(unsigned char *)(*(void *)(*(void *)(v63 + 72) + 8) + 24))
    {
      float v51 = sub_100026EF4(*(void **)(*(void *)(*(void *)(v63 + 56) + 8) + 40));
      float v52 = *(float *)(*(void *)(*(void *)(v63 + 80) + 8) + 24);
      if (v51 > v52) {
        sub_100026DA0(*(void **)(*(void *)(*(void *)(v63 + 56) + 8) + 40), v52 / v51);
      }
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v33 = [*(id *)(*(void *)(v63 + 40) + 8) objectForKeyedSubscript:@"trainingGlobals"];
  id v34 = v33;
  id v35 = [v33 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (!v35) {
    goto LABEL_39;
  }
  uint64_t v36 = *(void *)v66;
  while (2)
  {
    for (j = 0; j != v35; j = (char *)j + 1)
    {
      if (*(void *)v66 != v36) {
        objc_enumerationMutation(v33);
      }
      uint64_t v38 = *(void *)(*((void *)&v65 + 1) + 8 * (void)j);
      uint64_t v39 = [*(id *)(*(void *)(v32[7] + 8) + 40) objectForKeyedSubscript:v38];
      uint32_t v40 = (void *)v39;
      if (*(unsigned char *)(*(void *)(v32[11] + 8) + 24))
      {
        if (!v61 && v39)
        {
          uint64_t v41 = [*(id *)(v32[5] + 144) objectForKeyedSubscript:v38];
          id v64 = 0;
          LODWORD(v42) = 1.0;
          [v40 applyToTensor:v41 scale:&v64 error:v42];
          id v9 = v64;

          if (v9)
          {
            uint64_t v53 = qword_1000443B8;
            if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v78 = v38;
              long long v48 = "Unable to apply gradient for %@";
              long long v49 = v53;
              uint32_t v50 = 12;
              goto LABEL_53;
            }
LABEL_49:

            goto LABEL_50;
          }
          [v40 reset];
          long long v32 = (void *)v63;
          double v43 = qword_1000443B8;
          if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v78 = v38;
            _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Applied gradient on %@", buf, 0xCu);
          }
        }
        id v44 = [v62 getTensorNamed:v38 directBind:1];
        uint64_t v45 = [*(id *)(v32[5] + 144) objectForKeyedSubscript:v38];
        sub_10000D714(v44, v45);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!v9) {
          goto LABEL_37;
        }
        uint64_t v47 = qword_1000443B8;
        if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v78 = v38;
          __int16 v79 = 2048;
          v80 = v56;
          long long v48 = "Unable to set %@ after batch %lu";
          long long v49 = v47;
          uint32_t v50 = 22;
LABEL_53:
          _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
LABEL_37:

      long long v33 = v34;
      long long v32 = (void *)v63;
    }
    id v35 = [v34 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v35) {
      continue;
    }
    break;
  }
LABEL_39:

  id v9 = 0;
  if (!v61) {
    *(_DWORD *)(*(void *)(*(void *)(v63 + 48) + 8) + 24) = 0;
  }
  uint64_t v46 = 1;
LABEL_51:

  return v46;
}

void sub_10000D5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_10000D714(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 type] != (id)2 || objc_msgSend(v4, "type") != (id)2) {
    goto LABEL_14;
  }
  id v5 = [v3 shape];
  double v6 = [v4 shape];
  if (([v5 isEqual:v6] & 1) == 0)
  {

    goto LABEL_14;
  }
  id v7 = [v3 strides];
  id v8 = [v4 strides];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_14:
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Attempt to copy tensor of mismatch type/shape/strides";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    float v20 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v19];

    goto LABEL_15;
  }
  id __dst = [v4 dataPointer];
  id v10 = [v3 dataPointer];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v3 shape];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    int v14 = 1;
    do
    {
      for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v17 = [v16 intValue];

        v14 *= v17;
      }
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
    size_t v18 = 4 * v14;
  }
  else
  {
    size_t v18 = 4;
  }

  memcpy(__dst, v10, v18);
  float v20 = 0;
LABEL_15:

  return v20;
}

void sub_10000D998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,NSErrorUserInfoKey a55,uint64_t a56,NSErrorUserInfoKey a57,uint64_t a58)
{
  if (a2)
  {

    uint64_t v60 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      a55 = NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v60 + 16))(v60);
      unint64_t v61 = +[NSString stringWithFormat:@"Exception in evaluate: %s"];
      a56 = (uint64_t)v61;
      +[NSDictionary dictionaryWithObjects:&a56 forKeys:&a55 count:1];
    }
    else
    {
      a57 = NSLocalizedDescriptionKey;
      unint64_t v61 = +[NSString stringWithFormat:@"Exception in evaluate"];
      a58 = (uint64_t)v61;
      +[NSDictionary dictionaryWithObjects:&a58 forKeys:&a57 count:1];
    id v62 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v62];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x10000E250);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000E870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000F4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000101E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,NSErrorUserInfoKey a37,uint64_t a38,NSErrorUserInfoKey a39,uint64_t a40)
{
  if (a2)
  {

    uint64_t v47 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      a37 = NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v47 + 16))(v47);
      long long v48 = +[NSString stringWithFormat:@"Exception in setup: %s"];
      a38 = (uint64_t)v48;
      +[NSDictionary dictionaryWithObjects:&a38 forKeys:&a37 count:1];
    }
    else
    {
      a39 = NSLocalizedDescriptionKey;
      long long v48 = +[NSString stringWithFormat:@"Exception in setup"];
      a40 = (uint64_t)v48;
      +[NSDictionary dictionaryWithObjects:&a40 forKeys:&a39 count:1];
    long long v49 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v49];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x10000F828);
  }
  _Unwind_Resume(exception_object);
}

id sub_1000106C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) addTokenizedText:a2 length:*(void *)(a1 + 40)];
}

void sub_100010AF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,NSErrorUserInfoKey a27,uint64_t a28,NSErrorUserInfoKey a29,uint64_t a30)
{
  if (a2)
  {

    long long v33 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      a27 = NSLocalizedDescriptionKey;
      (*(void (**)(void *))(*(void *)v33 + 16))(v33);
      id v34 = +[NSString stringWithFormat:@"Exception in fetchData: %s"];
      a28 = (uint64_t)v34;
      +[NSDictionary dictionaryWithObjects:&a28 forKeys:&a27 count:1];
    }
    else
    {
      a29 = NSLocalizedDescriptionKey;
      id v34 = +[NSString stringWithFormat:@"Exception in fetchData"];
      a30 = (uint64_t)v34;
      +[NSDictionary dictionaryWithObjects:&a30 forKeys:&a29 count:1];
    id v35 = };
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v35];
    objc_claimAutoreleasedReturnValue();

    __cxa_end_catch();
    JUMPOUT(0x100010AA8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100010E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10001144C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001156C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100011594(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000115D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000123A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_1000123F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012400(uint64_t a1)
{
}

void sub_100012408(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = qword_1000443C0;
  if (os_log_type_enabled((os_log_t)qword_1000443C0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User Edit: Received ASR result", buf, 2u);
  }
  if (v5)
  {
    id v8 = qword_1000443C0;
    if (os_log_type_enabled((os_log_t)qword_1000443C0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "User Edit: ASR is successful", buf, 2u);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012A18;
    v12[3] = &unk_10003CA88;
    id v13 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    unsigned __int8 v9 = v13;
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:353 userInfo:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id sub_100012574(void *a1)
{
  id v1 = a1;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v1;
  id v15 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v2;
        id v3 = *(void **)(*((void *)&v23 + 1) + 8 * v2);
        id v17 = objc_alloc_init((Class)NSMutableArray);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v18 = v3;
        id v4 = [v18 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v4)
        {
          id v5 = v4;
          uint64_t v6 = *(void *)v20;
          do
          {
            for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v20 != v6) {
                objc_enumerationMutation(v18);
              }
              id v8 = *(id *)(*((void *)&v19 + 1) + 8 * i);
              +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"!\\exclamation-mark", @",\\comma", @".\\period", @";\\semicolon",
                @":\\colon",
                @"?\\question-mark",
                @"。\\ideographic-period",
                @"、\\ideographic-comma",
                @"¿\\inverted-question-mark",
                @"¡\\inverted-exclamation-mark",
                @",\\comma",
                @"?\\question-mark",
                @";\\semicolon",
                @":\\colon",
                @"!\\exclamation-mark",
                @"…\\horizontal-ellipsis",
              unsigned __int8 v9 = 0);
              unsigned __int8 v10 = [v9 containsObject:v8];

              if ((v10 & 1) == 0) {
                [v17 addObject:v8];
              }
            }
            id v5 = [v18 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v5);
        }

        if ([v17 count]) {
          [v13 addObject:v17];
        }

        uint64_t v2 = v16 + 1;
      }
      while ((id)(v16 + 1) != v15);
      id v15 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v15);
  }

  return v13;
}

uint64_t sub_100012824(void *a1, void *a2, void *a3, unint64_t a4, unint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v26 = a6;
  uint64_t v14 = 0;
  if ([v12 count] && a4)
  {
    unint64_t v15 = 0;
    unint64_t v25 = a4;
    while (!objc_msgSend(v13, "count", v25) || !a5)
    {
LABEL_11:
      ++v15;
      uint64_t v14 = 0;
      if ((unint64_t)[v12 count] <= v15 || v15 >= v25) {
        goto LABEL_15;
      }
    }
    unint64_t v16 = 0;
    while (1)
    {
      id v17 = [v12 objectAtIndex:v15];
      id v18 = [v13 objectAtIndex:v16];
      long long v19 = [v11 editDistanceWithRefTokens:v17 hypTokens:v18 caseInsensitive:1 removeWordSense:1];

      long long v20 = [v19 objectForKeyedSubscript:@"EditDistance"];
      long long v21 = v20;
      if (v20)
      {
        if (![v20 intValue]) {
          break;
        }
      }

      if ((unint64_t)[v13 count] <= ++v16 || v16 >= a5) {
        goto LABEL_11;
      }
    }
    long long v22 = +[NSNumber numberWithInt:v15];
    [v26 setObject:v22 forKeyedSubscript:@"sourceIndex"];

    long long v23 = +[NSNumber numberWithInt:v16];
    [v26 setObject:v23 forKeyedSubscript:@"targetIndex"];

    uint64_t v14 = 1;
  }
LABEL_15:

  return v14;
}

void sub_100012A18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
  }
}

void sub_100012E90(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:*(void *)(a1 + 40)];
  [v3 setObject:&off_10003F250 forKeyedSubscript:@"nbestAlignmentSourceBound"];
  [v3 setObject:&off_10003F250 forKeyedSubscript:@"nbestAlignmentTargetBound"];
  [*(id *)(a1 + 48) generateConfusionPairsWithUUID:*(void *)(a1 + 56) parameters:v3 language:*(void *)(a1 + 64) task:*(void *)(a1 + 72) samplingRate:*(void *)(a1 + 112) recognizedNbest:v2 recognizedText:*(void *)(a1 + 80) correctedText:*(void *)(a1 + 88) selectedAlternatives:*(void *)(a1 + 96) completion:*(void *)(a1 + 104)];
}

void sub_100012F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013174(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"distanceThreshold"];
  if ((int)[v2 intValue] < 1)
  {
    uint64_t v4 = 10;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"distanceThreshold"];
    uint64_t v4 = (int)[v3 intValue];
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"uttLengthThreshold"];
  if ((int)[v5 intValue] < 1)
  {
    uint64_t v7 = 30;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"uttLengthThreshold"];
    uint64_t v7 = (int)[v6 intValue];
  }
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"punctuationInsensitive"];

  unsigned __int8 v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"caseInsensitive"];

  unsigned __int8 v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"skipClassification"];

  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nbestAlignmentSourceBound"];
  if ((int)[v11 intValue] < 1)
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nbestAlignmentSourceBound"];
    uint64_t v13 = (int)[v12 intValue];
  }
  uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nbestAlignmentTargetBound"];
  if ((int)[v14 intValue] < 1)
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nbestAlignmentTargetBound"];
    uint64_t v16 = (int)[v15 intValue];
  }
  id v17 = [[EditCollectionParameters alloc] initWithDistanceThreshold:v4 uttLengthThreshold:v7 punctuationInsensitive:v8 != 0 caseInsensitive:v9 != 0 skipClassification:v10 != 0 nbestAlignmentSourceBound:v13 nbestAlignmentTargetBound:v16];
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 64);
  long long v24 = *(_OWORD *)(a1 + 72);
  uint64_t v22 = *(void *)(a1 + 88);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000134B4;
  v25[3] = &unk_10003D040;
  uint64_t v23 = *(void *)(a1 + 104);
  id v26 = *(id *)(a1 + 96);
  +[ConfusionPairBuilder generateConfusionPairsWithUUID:parameters:language:task:samplingRate:recognizedNbest:recognizedText:correctedText:selectedAlternatives:completion:](ConfusionPairBuilder, "generateConfusionPairsWithUUID:parameters:language:task:samplingRate:recognizedNbest:recognizedText:correctedText:selectedAlternatives:completion:", v18, v17, v19, v20, v23, v21, v24, v22, v25);
}

void sub_10001344C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000134B4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v25 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16, v4);
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v8);
        id v10 = objc_alloc_init((Class)NSMutableDictionary);
        id v11 = [v9 uttId];
        [v10 setObject:v11 forKeyedSubscript:@"uttId"];

        id v12 = [v9 recognizedTokens];
        [v10 setObject:v12 forKeyedSubscript:@"recognizedTokens"];

        uint64_t v13 = [v9 correctedTokens];
        [v10 setObject:v13 forKeyedSubscript:@"correctedTokens"];

        uint64_t v14 = [v9 leftContext];
        [v10 setObject:v14 forKeyedSubscript:@"leftContext"];

        unint64_t v15 = [v9 rightContext];
        [v10 setObject:v15 forKeyedSubscript:@"rightContext"];

        uint64_t v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 errorType]);
        [v10 setObject:v16 forKeyedSubscript:@"errorType"];

        id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 editMethod]);
        [v10 setObject:v17 forKeyedSubscript:@"editMethod"];

        uint64_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 index]);
        [v10 setObject:v18 forKeyedSubscript:@"index"];

        uint64_t v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 numInsertion]);
        [v10 setObject:v19 forKeyedSubscript:@"numInsertion"];

        uint64_t v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 numDeletion]);
        [v10 setObject:v20 forKeyedSubscript:@"numDeletion"];

        uint64_t v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 numSubstitution]);
        [v10 setObject:v21 forKeyedSubscript:@"numSubstitution"];

        uint64_t v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 alignedSourceIndex]);
        [v10 setObject:v22 forKeyedSubscript:@"alignedSourceIndex"];

        uint64_t v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 alignedTargetIndex]);
        [v10 setObject:v23 forKeyedSubscript:@"alignedTargetIndex"];

        [v5 addObject:v10];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000138B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100013A94(void *a1)
{
  uint64_t v2 = objc_alloc_init(SRAudioGenerator);
  id v3 = v2;
  if (v2)
  {
    id v4 = [(SRAudioGenerator *)v2 generateTTSAudiosFromTexts:a1[4] language:a1[5] downsample:1];
    if (v4)
    {
      (*(void (**)(void))(a1[6] + 16))();
      xpc_transaction_exit_clean();
    }
    else
    {
      uint64_t v7 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SRAudioGenerator: Failed to generate TTS audios", v10, 2u);
      }
      uint64_t v8 = a1[6];
      unsigned __int8 v9 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:401 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

      id v4 = 0;
    }
  }
  else
  {
    id v5 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SRAudioGenerator: Failed to generate TTS audios due to initialization error", buf, 2u);
    }
    uint64_t v6 = a1[6];
    id v4 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:401 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

void sub_100013C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013D34(uint64_t a1)
{
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_100015B28;
  v127[3] = &unk_10003CB28;
  id v128 = *(id *)(a1 + 48);
  uint64_t v2 = objc_retainBlock(v127);
  id v3 = objc_alloc_init(SMTSpeechAssets);
  uint64_t v4 = *(void *)(a1 + 32);
  id v126 = 0;
  v114 = v3;
  v115 = [(SMTSpeechAssets *)v3 fetchAssetPathForInstalledLanguage:v4 outError:&v126];
  id v5 = v126;
  uint64_t v6 = qword_1000443C8;
  if (!v5)
  {
    uint64_t v7 = (id)qword_1000443C8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v131 = (uint64_t)v115;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PM: Resolved asset=%@", buf, 0xCu);
    }

    if (![v115 length])
    {
      v113 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:0];
      ((void (*)(void *, void))v2[2])(v2, 0);

      goto LABEL_90;
    }
    id v112 = v115;
    uint64_t v8 = (id)qword_1000443C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v131 = (uint64_t)v112;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PM: modelRoot=%@", buf, 0xCu);
    }

    v111 = [v112 stringByAppendingPathComponent:@"mini.json"];
    unsigned __int8 v9 = (id)qword_1000443C8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v131 = (uint64_t)v111;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PM: Configuration=%@", buf, 0xCu);
    }

    id v125 = 0;
    uint64_t v10 = +[NSData dataWithContentsOfFile:v111 options:0 error:&v125];
    id v11 = v125;
    v109 = (void *)v10;
    if (!v10 || v11)
    {
      id v110 = v11;
      long long v28 = (id)qword_1000443C8;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = [v110 localizedDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "PM: Unable to load configuration: %@", buf, 0xCu);
      }
      long long v30 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:306 userInfo:0];
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v30);
      goto LABEL_89;
    }
    id v124 = 0;
    id v12 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v124];
    id v13 = v124;
    v108 = v12;
    id v110 = v13;
    if (!v12 || v13)
    {
      id v31 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v111;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "PM: Unable to create JSON data from %@", buf, 0xCu);
      }
      long long v32 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:306 userInfo:0];
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v32);
      goto LABEL_88;
    }
    uint64_t v107 = EARPhoneticMatchBuildingKey;
    uint64_t v14 = objc_msgSend(v12, "objectForKeyedSubscript:");
    BOOL v15 = v14 == 0;

    if (v15)
    {
      long long v33 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "PM: Phonetic Match building is not supported", buf, 2u);
      }
      long long v32 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:307 userInfo:0];
      id v110 = 0;
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v32);
      goto LABEL_88;
    }
    uint64_t v16 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v100 = [v16 firstObject];

    id v17 = [v100 stringByAppendingPathComponent:@"Assistant/SpeechPhoneticMatch"];
    v106 = [v17 stringByStandardizingPath];

    uint64_t v18 = (id)qword_1000443C8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v131 = (uint64_t)v106;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PM: phoneticMatchPath=%@", buf, 0xCu);
    }

    uint64_t v19 = +[NSFileManager defaultManager];
    char v123 = 0;
    v99 = v19;
    uint64_t v20 = v106;
    unsigned int v21 = [v19 fileExistsAtPath:v106 isDirectory:&v123];
    if (v123) {
      unsigned int v22 = 0;
    }
    else {
      unsigned int v22 = v21;
    }
    if (v22 == 1)
    {
      uint64_t v23 = (id)qword_1000443C8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v106;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "PM: Removing the existing file: %@", buf, 0xCu);
      }

      id v122 = 0;
      uint64_t v20 = v106;
      unsigned __int8 v24 = [v99 removeItemAtPath:v106 error:&v122];
      id v110 = v122;
      if ((v24 & 1) == 0)
      {
        id v25 = (id)qword_1000443C8;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = [v110 localizedDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v131 = (uint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "PM: Unable to remove the existing file: %@", buf, 0xCu);
        }
        long long v27 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:306 userInfo:0];
        ((void (*)(void *, void, void *))v2[2])(v2, 0, v27);
        goto LABEL_87;
      }
    }
    else
    {
      id v110 = 0;
      if (v21) {
        goto LABEL_42;
      }
    }
    id v121 = 0;
    unsigned __int8 v34 = [v99 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v121];
    id v35 = v121;
    if ((v34 & 1) == 0)
    {
      uint64_t v98 = (uint64_t)v35;
      uint64_t v63 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v20;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "PM: Unable to create phoneticMatchPath: %@", buf, 0xCu);
      }
      id v64 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:308 userInfo:0];
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v64);
      goto LABEL_86;
    }

LABEL_42:
    uint64_t v36 = [v108 objectForKeyedSubscript:v107];
    v90 = (void *)EARPhoneticMatchLGFstFileKey;
    uint64_t v98 = objc_msgSend(v36, "objectForKeyedSubscript:");

    uint64_t v37 = [v108 objectForKeyedSubscript:v107];
    v89 = (void *)EARPhoneticMatchLFstFileKey;
    uint64_t v93 = objc_msgSend(v37, "objectForKeyedSubscript:");

    uint64_t v38 = [v108 objectForKeyedSubscript:v107];
    uint64_t v88 = EARPhoneticMatchGOsymsFileKey;
    v95 = objc_msgSend(v38, "objectForKeyedSubscript:");

    if (!v98 || !v93 || !v95)
    {
      long long v65 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v131 = (uint64_t)v90;
        __int16 v132 = 2112;
        v133 = v89;
        __int16 v134 = 2112;
        uint64_t v135 = v88;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "PM: %@ or %@ or %@ key is not set in configuration", buf, 0x20u);
      }
      long long v66 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:306 userInfo:0];
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v66);
      goto LABEL_85;
    }
    uint64_t v87 = objc_msgSend(v106, "stringByAppendingPathComponent:");
    v86 = [v106 stringByAppendingPathComponent:v93];
    v85 = [v106 stringByAppendingPathComponent:v95];
    uint64_t v39 = (id)qword_1000443C8;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "PM: Loading data for building phonetic match ... ", buf, 2u);
    }

    id v97 = objc_alloc_init((Class)NSMutableArray);
    uint32_t v40 = [v108 objectForKeyedSubscript:v107];
    uint64_t v105 = EARPhoneticMatchOnDeviceDataSourcesKey;
    uint64_t v41 = objc_msgSend(v40, "objectForKeyedSubscript:");
    BOOL v42 = v41 == 0;

    if (v42)
    {
      long long v68 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:307 userInfo:0];
      ((void (*)(void *, void, void *))v2[2])(v2, 0, v68);
      goto LABEL_84;
    }
    double v43 = [v108 objectForKeyedSubscript:v107];
    uint64_t v101 = EARPhoneticMatchRankingMethodKey;
    v91 = objc_msgSend(v43, "objectForKeyedSubscript:");

    id v44 = v91;
    v103 = (void *)EARPhoneticMatchRankingMethodPlayCount;
    uint64_t v45 = v108;
    if ((objc_msgSend(v91, "isEqualToString:") & 1) == 0
      && ([v91 isEqualToString:EARPhoneticMatchRankingMethodMostRecentlyPlayed] & 1) == 0)
    {
      uint64_t v46 = (id)qword_1000443C8;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v91;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "PM: Invalid ranking method: '%@', switching to 'play-count'", buf, 0xCu);
      }

      id v44 = v103;
      uint64_t v45 = v108;
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v92 = v44;
    uint64_t v47 = [v45 objectForKeyedSubscript:v107];
    long long v48 = [v47 objectForKeyedSubscript:v105];
    id obj = [v48 allKeys];

    id v104 = [obj countByEnumeratingWithState:&v117 objects:v129 count:16];
    if (v104)
    {
      uint64_t v102 = *(void *)v118;
      uint64_t v94 = EARPhoneticMatchRankingMethodMostRecentlyPlayed;
LABEL_55:
      uint64_t v49 = 0;
      while (1)
      {
        if (*(void *)v118 != v102) {
          objc_enumerationMutation(obj);
        }
        uint32_t v50 = *(void **)(*((void *)&v117 + 1) + 8 * v49);
        if ([*(id *)(a1 + 40) shouldStop]) {
          break;
        }
        float v51 = [v108 objectForKeyedSubscript:v107];
        float v52 = [v51 objectForKeyedSubscript:v105];
        uint64_t v53 = [v52 objectForKeyedSubscript:v50];
        unint64_t v54 = [v53 objectForKeyedSubscript:v101];

        if (([v54 isEqualToString:v103] & 1) == 0
          && ([v54 isEqualToString:v94] & 1) == 0)
        {
          id v55 = v92;

          unint64_t v54 = v55;
        }
        double v56 = (id)qword_1000443C8;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v131 = (uint64_t)v50;
          __int16 v132 = 2112;
          v133 = v54;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "PM: Fetching %@ with rankingMethod: %@... ", buf, 0x16u);
        }

        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_100015BB0;
        v116[3] = &unk_10003CBA0;
        v116[4] = *(void *)(a1 + 40);
        v57 = +[SMTPhoneticMatchHelper fetchContentsWithConfiguration:v111 feedTypeString:v50 rankingMethod:v54 shouldStopBlock:v116];
        v58 = v57;
        if (v57)
        {
          [v57 expDecayPriors];
          [v58 normalizePriors];
          [v58 applyRegexEnumerations];
          [v58 addOsym];
          [v97 addObject:v58];
          if (*(unsigned char *)(a1 + 56))
          {
            id v59 = +[NSString stringWithFormat:@"%@.feed", v50];
            uint64_t v60 = [v106 stringByAppendingPathComponent:v59];
            [v58 writeTsv:v60];
          }
        }

        if (v104 == (id)++v49)
        {
          id v104 = [obj countByEnumeratingWithState:&v117 objects:v129 count:16];
          if (v104) {
            goto LABEL_55;
          }
          goto LABEL_69;
        }
      }
    }
    else
    {
LABEL_69:

      unint64_t v61 = (id)qword_1000443C8;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "PM: Creating pmBuilder ... ", buf, 2u);
      }

      id obj = [objc_alloc((Class)_EARPhoneticMatchBuilder) initWithModelRoot:v112 jsonConfigFile:v111 dataFeeds:v97];
      id v62 = (id)qword_1000443C8;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "PM: buildGFsts ... ", buf, 2u);
      }

      if (![*(id *)(a1 + 40) shouldStop])
      {
        if (([obj buildGFsts] & 1) == 0)
        {
          long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:301 userInfo:0];
          ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
          goto LABEL_82;
        }
        if (*(unsigned char *)(a1 + 56)) {
          [obj writeGFstsToDirectory:v106];
        }
        id v70 = (id)qword_1000443C8;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "PM: buildLFst ... ", buf, 2u);
        }

        if (![*(id *)(a1 + 40) shouldStop])
        {
          if (([obj buildLFst] & 1) == 0)
          {
            long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:302 userInfo:0];
            ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
            goto LABEL_82;
          }
          if (*(unsigned char *)(a1 + 56))
          {
            long long v71 = [v106 stringByAppendingPathComponent:@"music-orig.L.fst"];
            [obj writeLFstToPath:v71];
          }
          long long v72 = (id)qword_1000443C8;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "PM: composeLGFsts ... ", buf, 2u);
          }

          if (![*(id *)(a1 + 40) shouldStop])
          {
            if (([obj composeLGFsts] & 1) == 0)
            {
              long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:303 userInfo:0];
              ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
              goto LABEL_82;
            }
            if (*(unsigned char *)(a1 + 56)) {
              [obj writeIndividualLGFstsToDirectory:v106];
            }
            long long v73 = (id)qword_1000443C8;
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "PM: combineFsts ... ", buf, 2u);
            }

            if (![*(id *)(a1 + 40) shouldStop])
            {
              if (([obj combineFsts] & 1) == 0)
              {
                long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:304 userInfo:0];
                ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
                goto LABEL_82;
              }
              long long v74 = (id)qword_1000443C8;
              if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "PM: buildAlignedLFst ... ", buf, 2u);
              }

              if (![*(id *)(a1 + 40) shouldStop])
              {
                if ([obj buildAlignedLFst])
                {
                  id v75 = (id)qword_1000443C8;
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "PM: Saving FSTs ... ", buf, 2u);
                  }

                  if ([obj writeLGFstToPath:v87])
                  {
                    if ([obj writeAlignedLFstToPath:v86])
                    {
                      if ([obj writeOSymsToPath:v85 asText:0 quasarise:1])
                      {
                        v76 = +[NSString stringWithFormat:@"pm-model-override-%@.json", *(void *)(a1 + 32)];
                        long long v67 = [v106 stringByAppendingPathComponent:v76];

                        if ([obj writeMetadataToPath:v67])
                        {
                          if (*(unsigned char *)(a1 + 56))
                          {
                            v77 = [v106 stringByAppendingPathComponent:@"music.L.isyms.txt"];
                            [obj writeISymsToPath:v77 asText:1];

                            uint64_t v78 = [v106 stringByAppendingPathComponent:@"music.G.osyms.txt"];
                            [obj writeOSymsToPath:v78 asText:1 quasarise:0];
                          }
                          [obj reset];
                          __int16 v79 = (id)qword_1000443C8;
                          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "PM: Finished building Phonetic Match", buf, 2u);
                          }

                          id v80 = objc_alloc_init((Class)NSMutableDictionary);
                          [v80 setObject:v87 forKeyedSubscript:v90];
                          [v80 setObject:v86 forKeyedSubscript:v89];
                          [v80 setObject:v85 forKeyedSubscript:v88];
                          ((void (*)(void *, id, void))v2[2])(v2, v80, 0);
                        }
                        else
                        {
                          v84 = qword_1000443C8;
                          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            uint64_t v131 = (uint64_t)v67;
                            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "PM: Failed to write metadata: %@", buf, 0xCu);
                          }
                          id v80 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:309 userInfo:0];
                          ((void (*)(void *, void, id))v2[2])(v2, 0, v80);
                        }

                        goto LABEL_82;
                      }
                      v83 = qword_1000443C8;
                      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v131 = (uint64_t)v85;
                        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "PM: Failed to write output symbols: %@", buf, 0xCu);
                      }
                    }
                    else
                    {
                      v82 = qword_1000443C8;
                      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v131 = (uint64_t)v86;
                        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "PM: Failed to write Aligned-L fst: %@", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    v81 = qword_1000443C8;
                    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v131 = v87;
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "PM: Failed to write LG fst: %@", buf, 0xCu);
                    }
                  }
                  long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:309 userInfo:0];
                  ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
                }
                else
                {
                  long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:305 userInfo:0];
                  ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
                }
LABEL_82:

                long long v68 = v92;
LABEL_84:

                long long v66 = (void *)v87;
LABEL_85:

                id v64 = (void *)v93;
LABEL_86:

                long long v27 = (void *)v98;
LABEL_87:

                long long v32 = v100;
LABEL_88:

                long long v30 = v108;
LABEL_89:

                goto LABEL_90;
              }
            }
          }
        }
      }
    }
    long long v67 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
    ((void (*)(void *, void, void *))v2[2])(v2, 0, v67);
    goto LABEL_82;
  }
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v131 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "PM: Fetch asset error %@", buf, 0xCu);
  }
  ((void (*)(void *, void, id))v2[2])(v2, 0, v5);
LABEL_90:

  id v69 = (id)qword_1000443C8;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "PM: Exiting...", buf, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_1000155E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43)
{
  if (a2)
  {

    objc_begin_catch(a1);
    JUMPOUT(0x100014D04);
  }
  _Unwind_Resume(a1);
}

void sub_100015B28(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void sub_100015B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100015BB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldStop];
}

void sub_100015CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015CB8(uint64_t a1)
{
  id v2 = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
  id v3 = [*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015DDC;
  v5[3] = &unk_10003CFA0;
  id v4 = v2;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [v4 updateSpeechProfileWithLanguage:v3 modelOverridePath:0 completion:v5];
}

void sub_100015DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100015DDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_1000443C8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)unsigned __int8 v9 = 138412290;
      *(void *)&v9[4] = v3;
      id v6 = "Error while updating speech profile: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, v9, v8);
    }
  }
  else if (v5)
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    id v6 = "Successfully updated speech profile";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", *(_OWORD *)v9);
  xpc_transaction_exit_clean();
}

void sub_100015ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  uint64_t v47 = v45;

  _Block_object_dispose((const void *)(v46 - 224), 8);
  _Block_object_dispose(&a24, 8);

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v46 - 176), 8);

  _Unwind_Resume(a1);
}

void sub_10001672C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
  xpc_transaction_exit_clean();
}

void sub_1000167BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000167D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000167E8(uint64_t a1)
{
}

void sub_1000167F0(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1[4] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v18 = v8;

  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v15 = v9;

  uint64_t v16 = *(void *)(a1[6] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v10;
}

void sub_1000168AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = v3;
  BOOL v5 = [v3 prons];
  id v6 = [v7 orthography];
  [v4 setObject:v5 forKey:v6];
}

void sub_100016938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000169FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100016B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100016B3C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = qword_1000443C8;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      id v8 = "UaaP: Error while training temporary all-app LM: %@";
      id v9 = v6;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    LOWORD(v11) = 0;
    id v8 = "UaaP: Finished rebuilding temporary all-app LM";
    id v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
}

void sub_100016CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100016D04(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = qword_1000443C8;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      id v8 = "UaaP: Error while training all-app LM: %@";
      id v9 = v6;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    LOWORD(v11) = 0;
    id v8 = "UaaP: Finished rebuilding all-app LM";
    id v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
}

void sub_100016EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100016EE8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = sub_100016FAC(*(void **)(a1 + 32), @"pruned");
    [v6 enumerateObjectsUsingBlock:&stru_10003CED8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100016F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100016FAC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_1000173C0(v3);
  uint64_t v6 = +[NSFileManager defaultManager];
  id v18 = 0;
  id v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v18];
  id v8 = v18;

  if (v8)
  {
    id v9 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unsigned int v21 = 138412546;
      *(void *)&v21[4] = v5;
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to enumerate UaaP pron directory at %@: %@", v21, 0x16u);
    }
    id v10 = 0;
  }
  else
  {
    *(void *)unsigned int v21 = 0;
    *(void *)&v21[8] = v21;
    *(void *)&v21[16] = 0x3032000000;
    unsigned int v22 = sub_1000167D8;
    uint64_t v23 = sub_1000167E8;
    id v24 = +[NSMutableArray array];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000174C8;
    v14[3] = &unk_10003D0D0;
    id v15 = v5;
    id v16 = v4;
    id v17 = v21;
    [v7 enumerateObjectsUsingBlock:v14];
    int v11 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(*(void *)&v21[8] + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "UaaP: Arpa models files used for interpolation: %@", buf, 0xCu);
    }
    id v10 = *(id *)(*(void *)&v21[8] + 40);

    _Block_object_dispose(v21, 8);
  }

  return v10;
}

void sub_100017234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1000172A0(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v6 = [v5 removeItemAtPath:v4 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      int v11 = v4;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "UaaP: Error: failed to remove pruned LM at %@: %@", buf, 0x16u);
    }
  }
}

void sub_10001739C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000173C0(void *a1)
{
  id v1 = a1;
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];

  id v4 = +[NSString stringWithFormat:@"Assistant/SpeechModels/%@", v1];
  id v5 = [v3 stringByAppendingPathComponent:v4];
  unsigned __int8 v6 = [v5 stringByStandardizingPath];

  return v6;
}

void sub_100017488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000174C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"allApp"] & 1) == 0
    && ([v3 isEqualToString:@"tempAllApp"] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v3];
    id v5 = v4;
    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = objc_msgSend(v4, "stringByAppendingPathComponent:");

      id v5 = (void *)v6;
    }
    id v7 = +[NSFileManager defaultManager];
    unsigned int v8 = [v7 fileExistsAtPath:v5];

    if (v8)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
    }
    else
    {
      id v9 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        int v11 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find ARPA file: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

void sub_100017624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017770(uint64_t a1)
{
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100017FC4;
  v41[3] = &unk_10003CB28;
  id v42 = *(id *)(a1 + 64);
  id v2 = objc_retainBlock(v41);
  id v3 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UaaP: Interpolating %@ Lm.", (uint8_t *)&buf, 0xCu);
  }
  id v5 = sub_1000173C0(*(void **)(a1 + 40));
  uint64_t v6 = [v5 stringByAppendingPathComponent:*(void *)(a1 + 32)];

  if (![*(id *)(a1 + 40) length])
  {
    int v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:253 userInfo:0];
    ((void (*)(void *, void *, void *))v2[2])(v2, &__NSDictionary0__struct, v10);

LABEL_16:
    if ([v6 length]) {
      +[_EARNgramLmModel removeWithDirectory:v6];
    }
    goto LABEL_18;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = sub_1000167D8;
  uint32_t v50 = sub_1000167E8;
  id v51 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_1000167D8;
  uint64_t v39 = sub_1000167E8;
  id v40 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = sub_1000167D8;
  long long v33 = sub_1000167E8;
  id v34 = 0;
  uint64_t v8 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100018050;
  v28[3] = &unk_10003CDF8;
  v28[4] = &buf;
  v28[5] = &v35;
  v28[6] = &v29;
  [v7 _assetForLanguage:v8 completion:v28];
  if (v30[5])
  {
    ((void (*)(void *, void *))v2[2])(v2, &__NSDictionary0__struct);
    int v9 = 0;
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001810C;
    v25[3] = &unk_10003CE70;
    id v26 = *(id *)(a1 + 40);
    p_long long buf = &buf;
    uint64_t v23 = objc_retainBlock(v25);
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"language"];
    [v11 setObject:*(void *)(*((void *)&buf + 1) + 40) forKeyedSubscript:@"asset"];
    __int16 v12 = sub_100016FAC(*(void **)(a1 + 40), *(void **)(a1 + 56));
    [v11 setObject:v12 forKeyedSubscript:@"arpaLmPaths"];
    id v24 = +[NSDate date];
    id v13 = +[_EARLmInterpolator interpolateArpaFilePaths:v12 configPath:v36[5] dataRoot:@"app-lm.data" modelRoot:@"app-lm.NGRAM"];
    uint64_t v14 = +[NSDate date];
    [v14 timeIntervalSinceDate:v24];
    id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v15 forKeyedSubscript:@"executionTime"];

    [v13 setProtectionClass:NSFileProtectionNone];
    id v16 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "UaaP: Done with interpolation", v45, 2u);
    }
    if ([v13 writeToDirectory:v6])
    {
      int v9 = 1;
      ((void (*)(void *, id, void))v2[2])(v2, v11, 0);
    }
    else
    {
      id v17 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v45 = 138412290;
        uint64_t v46 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "UaaP: Write failure: %@", v45, 0xCu);
      }
      id v18 = +[NSString stringWithFormat:@"Write failure: %@", v6];
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      uint64_t v19 = ((void (*)(void *, void *))v23[2])(v23, v18);
      id v44 = v19;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      unsigned int v21 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:3 userInfo:v20];
      ((void (*)(void *, id, void *))v2[2])(v2, v11, v21);

      int v9 = 0;
    }
  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&buf, 8);

  if (!v9) {
    goto LABEL_16;
  }
LABEL_18:
  unsigned int v22 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "UaaP: Exiting...", (uint8_t *)&buf, 2u);
  }
  xpc_transaction_exit_clean();
}

void sub_100017DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *exc_buf, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  if (a2)
  {

    _Block_object_dispose(&a26, 8);
    _Block_object_dispose(&a32, 8);

    _Block_object_dispose((const void *)(v50 - 176), 8);
    objc_begin_catch(a1);
    JUMPOUT(0x100017D3CLL);
  }
  _Unwind_Resume(a1);
}

void sub_100017FC4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  xpc_transaction_exit_clean();
}

void sub_100018038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018050(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1[4] + 8);
  __int16 v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v18 = v8;

  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v15 = v9;

  uint64_t v16 = *(void *)(a1[6] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v10;
}

id sub_10001810C(uint64_t a1, uint64_t a2)
{
  id v2 = +[NSString stringWithFormat:@"language=%@ asset=%@: %@", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2];
  return v2;
}

void sub_1000182A8(uint64_t a1)
{
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100018BA0;
  v56[3] = &unk_10003CDD0;
  id v57 = *(id *)(a1 + 72);
  id v2 = objc_retainBlock(v56);
  id v3 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UaaP: Training AppLm.", buf, 2u);
  }
  if ([*(id *)(a1 + 32) length])
  {
    *(void *)long long buf = 0;
    id v51 = buf;
    uint64_t v52 = 0x3032000000;
    uint64_t v53 = sub_1000167D8;
    unint64_t v54 = sub_1000167E8;
    id v55 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = sub_1000167D8;
    uint64_t v48 = sub_1000167E8;
    id v49 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_1000167D8;
    id v42 = sub_1000167E8;
    id v43 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100018C4C;
    v37[3] = &unk_10003CDF8;
    v37[4] = buf;
    v37[5] = &v44;
    v37[6] = &v38;
    [v4 _assetForLanguage:v5 completion:v37];
    if (v39[5])
    {
      ((void (*)(void *, void *, void *))v2[2])(v2, &__NSDictionary0__struct, &__NSArray0__struct);
LABEL_23:
      _Block_object_dispose(&v38, 8);

      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_24;
    }
    id v7 = *(id *)(a1 + 48);
    id v8 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = v45[5];
      *(_DWORD *)v58 = 138412802;
      id v59 = v9;
      __int16 v60 = 2112;
      uint64_t v61 = v10;
      __int16 v62 = 2112;
      id v63 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "UaaP: Training with language=%@ configuration=%@ directory=%@", v58, 0x20u);
    }
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"language"];
    [v11 setObject:*((void *)v51 + 5) forKeyedSubscript:@"asset"];
    __int16 v12 = [*(id *)(a1 + 48) stringByDeletingLastPathComponent];
    uint64_t v13 = [*(id *)(a1 + 48) lastPathComponent];
    uint64_t v14 = +[NSString stringWithFormat:@".%@", v13];
    id v15 = [v12 stringByAppendingPathComponent:v14];

    uint64_t v16 = +[NSFileManager defaultManager];
    id v17 = [v15 stringByDeletingLastPathComponent];
    [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:0];

    if (+[_EARAppLmArtifact transitionArtifactAt:*(void *)(a1 + 56) toStage:5 configPath:v45[5] dataRoot:0 estimationRoot:0 minimize:1 saveTo:v15])
    {
      id v18 = +[NSFileManager defaultManager];
      [v18 removeItemAtPath:*(void *)(a1 + 48) error:0];

      uint64_t v19 = +[NSFileManager defaultManager];
      uint64_t v20 = *(void *)(a1 + 48);
      id v36 = 0;
      unsigned __int8 v21 = [v19 moveItemAtPath:v15 toPath:v20 error:&v36];
      id v22 = v36;

      if (v21)
      {
        uint64_t v23 = *(void *)(a1 + 56);
        uint64_t v24 = *(void *)(a1 + 64);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100018D08;
        v31[3] = &unk_10003CE20;
        id v25 = *(void **)(a1 + 40);
        id v32 = *(id *)(a1 + 48);
        id v33 = *(id *)(a1 + 56);
        id v34 = *(id *)(a1 + 32);
        id v35 = *(id *)(a1 + 64);
        [v25 extractBundledOovs:v23 appLmDataFileSandboxExtension:0 appBundleId:v24 completion:v31];

LABEL_20:
        long long v30 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v58 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "UaaP: Exiting...", v58, 2u);
        }
        xpc_transaction_exit_clean();

        goto LABEL_23;
      }
      long long v28 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v58 = 138412290;
        id v59 = v22;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "UaaP: Failed to rename temporary app lm model file: %@", v58, 0xCu);
      }
      uint64_t v29 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:251 userInfo:&__NSDictionary0__struct];
      ((void (*)(void *, void *, void *, void *))v2[2])(v2, &__NSDictionary0__struct, &__NSArray0__struct, v29);
    }
    else
    {
      id v26 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v58 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "UaaP: Failed to train app-specific LM", v58, 2u);
      }
      long long v27 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:251 userInfo:&__NSDictionary0__struct];
      ((void (*)(void *, void *, void *, void *))v2[2])(v2, &__NSDictionary0__struct, &__NSArray0__struct, v27);
    }
    if ([v7 length]) {
      +[_EARNgramLmModel removeWithDirectory:v7];
    }
    goto LABEL_20;
  }
  uint64_t v6 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:253 userInfo:0];
  ((void (*)(void *, void *, void *, void *))v2[2])(v2, &__NSDictionary0__struct, &__NSArray0__struct, v6);

LABEL_24:
}

void sub_1000189D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  if (a2)
  {

    objc_begin_catch(exception_object);
    JUMPOUT(0x1000188E4);
  }
  _Unwind_Resume(exception_object);
}

void sub_100018BA0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
  xpc_transaction_exit_clean();
}

void sub_100018C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018C4C(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1[4] + 8);
  __int16 v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v18 = v8;

  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v15 = v9;

  uint64_t v16 = *(void *)(a1[6] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v10;
}

void sub_100018D08(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc((Class)_EARAppLmArtifact) initWithPath:a1[4]];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 loadOovs];
  }
  else
  {
    id v10 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UaaP: Failed to read app lm artifact at %@", buf, 0xCu);
    }
    id v9 = v5;
  }
  __int16 v12 = v9;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v13 = a1[6];
    uint64_t v14 = a1[7];
    id v19 = 0;
    unsigned __int8 v15 = +[CESRUaapData writeUaapOovsForLanguage:v13 bundleId:v14 customProns:v6 newOovs:v12 error:&v19];
    id v16 = v19;
    if ((v15 & 1) == 0)
    {
      id v17 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = a1[7];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        id v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "UaaP: Error while writing OOVs for %@: %@", buf, 0x16u);
      }
    }
  }
}

void sub_100018ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  id v25 = v23;

  _Unwind_Resume(a1);
}

void sub_1000190AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = qword_1000443C8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      int v17 = 138412802;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v9;
      uint64_t v14 = "UaaP: UaaP: Error while building language model for %@ with locale %@: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0x20u);
    }
  }
  else if (v11)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = 138412802;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    id v22 = v7;
    uint64_t v14 = "UaaP: UaaP: Finished training app LM for %@ with locale %@: %@";
    goto LABEL_6;
  }
}

void sub_100019328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10001936C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = qword_1000443C8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      int v19 = 138412802;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v9;
      uint64_t v14 = "UaaP: UaaP: Error while building language model for %@ with locale %@: %@";
      uint64_t v15 = v10;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v19, v16);
    }
  }
  else if (v11)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    int v19 = 138412546;
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    uint64_t v14 = "UaaP: UaaP: Finished training app LM for %@ with locale %@";
    uint64_t v15 = v10;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

void sub_1000195BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000196C8(uint64_t a1)
{
  id v2 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:*(void *)(a1 + 32) assetType:3];
  id v3 = objc_alloc_init(SMTSpeechAssets);
  id v11 = 0;
  uint64_t v4 = [(SMTSpeechAssets *)v3 fetchAssetPathForAssetConfig:v2 outError:&v11];
  id v5 = v11;

  if (v4 && [v4 length])
  {
    id v6 = [v4 stringByAppendingPathComponent:@"mini.json"];
    id v7 = v4;
    id v8 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v6];
    id v9 = [v8 version];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v6 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, v6);
  }
}

void sub_100019838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019A80(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001CA90;
      v13[3] = &unk_10003CD80;
      id v15 = *(id *)(a1 + 32);
      id v14 = v9;
      [v10 completeWithJSONResult:v11 binaryResult:v12 completionHandler:v13];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      +[SMTUtils cleanupTemporaryDirectory];
      xpc_transaction_exit_clean();
    }
  }
}

void sub_100019BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100019BDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v6)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10001CA44;
      v8[3] = &unk_10003CD80;
      id v10 = *(id *)(a1 + 32);
      id v9 = v5;
      [v7 completeWithError:v9 completionHandler:v8];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      +[SMTUtils cleanupTemporaryDirectory];
      xpc_transaction_exit_clean();
    }
  }
}

void sub_100019CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100019D04(uint64_t a1)
{
  id v2 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Start Global NNLM training in queue", buf, 2u);
  }
  id v3 = objc_alloc((Class)DESRecipeEvaluationSession);
  uint64_t v4 = *(void *)(a1 + 32);
  id v55 = 0;
  id v5 = [v3 initWithResumptionURL:v4 error:&v55];
  id v34 = v55;
  id v6 = qword_1000443C8;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully reconstructed session from url: %@", buf, 0xCu);
    }
    id v8 = [v5 recipe];
    id v9 = [v8 recipeUserInfo];

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v58 = sub_1000167D8;
    id v59 = sub_1000167E8;
    id v60 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_1000167D8;
    v53[4] = sub_1000167E8;
    unint64_t v54 = [[SMTGlobalNNLM alloc] initWithRecipe:v9];
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.SpeechModelTrainingConnection.download", 0);
    id v10 = [v9 objectForKeyedSubscript:@"downloadTimeout"];
    [v10 doubleValue];
    if (v11 == 0.0) {
      double v12 = 60.0;
    }
    else {
      double v12 = v11;
    }

    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 0;
    uint64_t v13 = *(void **)(a1 + 40);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10001A380;
    v46[3] = &unk_10003CC68;
    double v50 = v12;
    id v49 = v51;
    v46[4] = v13;
    id v48 = *(id *)(a1 + 48);
    id v14 = v5;
    id v47 = v14;
    id v15 = [v13 createDispatchTimerWithInterval:v33 queue:v46 block:v12];
    uint32_t v16 = [v14 recipe];
    uint64_t v17 = [v16 attachments];

    uint64_t v18 = [v14 recipe];
    int v19 = [v18 attachments];
    uint64_t v20 = +[SMTGlobalNNLM compressedAttachmentURLFromRecipe:v9 attachments:v19];

    if (v20)
    {
      double v56 = v20;
      uint64_t v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1, context);

      uint64_t v17 = (void *)v21;
    }
    uint64_t v22 = [SMTAttachmentsDownload alloc];
    __int16 v23 = [(SMTAttachmentsDownload *)v22 initWithQueue:qword_1000443D0];
    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = *(void **)(v24 + 24);
    *(void *)(v24 + 24) = v23;

    id v26 = *(void **)(*(void *)(a1 + 40) + 24);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001A514;
    v35[3] = &unk_10003CD30;
    id v43 = v51;
    id v27 = v15;
    uint64_t v28 = *(void *)(a1 + 40);
    id v36 = v27;
    uint64_t v37 = v28;
    id v38 = v14;
    id v41 = *(id *)(a1 + 48);
    id v29 = v20;
    id v39 = v29;
    id v30 = v9;
    id v40 = v30;
    uint64_t v44 = v53;
    uint64_t v45 = buf;
    id v42 = *(id *)(a1 + 56);
    [v26 downloadAttachments:v17 completion:v35];

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to reconstruct session from url: %@ error: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001A254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10001A380(void *a1)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  id v2 = +[NSString stringWithFormat:@"Attachments download timeout after %.2f seconds", a1[8]];
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  id v9 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v4 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v3];

  id v5 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v7 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attachments download timed out: %@", buf, 0xCu);
  }
  [*(id *)(a1[4] + 24) cancel];
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10001A4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A514(uint64_t a1, void *a2, void *a3)
{
  id v125 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    goto LABEL_5;
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (([*(id *)(a1 + 40) shouldStop] & 1) != 0
    || [*(id *)(a1 + 48) taskIsDeferred])
  {
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, *(void *)(a1 + 48));

    goto LABEL_5;
  }
  if (!v5)
  {
    id v9 = v125;
    id v10 = v9;
    uint64_t v124 = a1;
    if (*(void *)(a1 + 56) && [v9 count])
    {
      double v11 = [v10 firstObject];
      id v157 = 0;
      char v123 = +[SMTUtils decompressArchiveWithURL:v11 outError:&v157];
      id v126 = v157;

      if (!v123 || v126)
      {
        id v63 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v126;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to extract test set: %@", buf, 0xCu);
        }
        (*(void (**)(void))(*(void *)(v124 + 72) + 16))();

        goto LABEL_105;
      }

      a1 = v124;
    }
    else
    {
      char v123 = v10;
    }
    id v122 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"trainingDataReplacement"];

    id v126 = (id)objc_opt_new();
    v129 = objc_opt_new();
    if (v122)
    {
      id v112 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"trainingDataReplacement"];
      +[SMTGlobalNNLM attachmentURL:v123 withName:v112];
      v114 = id v156 = 0;
      double v12 = +[NSString stringWithContentsOfURL:v114 encoding:4 error:&v156];
      id v116 = v156;
      long long v118 = v12;
      uint64_t v13 = +[NSCharacterSet newlineCharacterSet];
      long long v120 = [v12 componentsSeparatedByCharactersInSet:v13];

      uint64_t v14 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"splitOffsets"];
      id v15 = (void *)v14;
      uint32_t v16 = &off_10003F318;
      if (v14) {
        uint32_t v16 = (_UNKNOWN **)v14;
      }
      uint64_t v17 = v16;

      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id obj = v120;
      id v18 = [obj countByEnumeratingWithState:&v152 objects:v174 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v153;
        do
        {
          for (unint64_t i = 0; i != v18; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v153 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(id *)(*((void *)&v152 + 1) + 8 * i);
            uint64_t v22 = (char *)[v21 UTF8String];
            __int16 v23 = v17;
            uint64_t v24 = sub_1000070F4(buf, v22);
            unint64_t v25 = sub_10001BD18((uint64_t)v24);
            if (v178 < 0) {
              operator delete(*(void **)buf);
            }
            id v26 = [v23 objectAtIndexedSubscript:0];
            [v26 floatValue];
            float v27 = (float)(v25 % 0x3E8) / 1000.0;
            BOOL v29 = v27 > v28;

            if (v29)
            {
              id v30 = [v23 objectAtIndexedSubscript:1];
              [v30 floatValue];
              BOOL v32 = v27 > v31;

              if (v32) {
                uint64_t v33 = 2;
              }
              else {
                uint64_t v33 = 1;
              }
            }
            else
            {
              uint64_t v33 = 0;
            }

            id v34 = +[NSCharacterSet whitespaceCharacterSet];
            id v35 = [v21 componentsSeparatedByCharactersInSet:v34];

            if ([v35 count])
            {
              id v36 = v129;
              if (v33 == 2 || (id v36 = v126, !v33)) {
                [v36 addObject:v35];
              }
            }
          }
          id v18 = [obj countByEnumeratingWithState:&v152 objects:v174 count:16];
        }
        while (v18);
      }

      uint64_t v37 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "data from attachments loaded", buf, 2u);
      }
    }
    else
    {
      obja = objc_alloc_init(SMTSpeechAssets);
      id v47 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"language"];
      id v48 = v47;
      if (!v47) {
        id v47 = @"en-US";
      }
      id v49 = [(__CFString *)v47 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

      id v151 = 0;
      double v50 = [(SMTSpeechAssets *)obja fetchAssetPathForInstalledLanguage:v49 outError:&v151];
      id v119 = v151;
      id v121 = v50;
      if (v119 || ![v50 length])
      {
        NSErrorUserInfoKey v172 = NSLocalizedDescriptionKey;
        CFStringRef v173 = @"Unable to fetch asset";
        id v51 = +[NSDictionary dictionaryWithObjects:&v173 forKeys:&v172 count:1];
        char v52 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:v51];

        uint64_t v53 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v49;
          __int16 v176 = 2112;
          v177 = v52;
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to get asset for language %@: %@", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
        int v54 = 1;
      }
      else
      {
        id v64 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Found speech asset in %@", buf, 0xCu);
        }
        char v52 = [v50 stringByAppendingPathComponent:@"mini.json"];
        long long v65 = [*(id *)(v124 + 64) valueForKey:@"dataConfigFilename"];
        BOOL v66 = v65 == 0;

        if (v66)
        {
          NSErrorUserInfoKey v170 = NSLocalizedDescriptionKey;
          uint64_t v88 = +[NSString stringWithFormat:@"Unable to read recipe[%@]", @"dataConfigFilename"];
          v171 = v88;
          v89 = +[NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];
          v90 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v89];

          v91 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v90;
            _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Failed to find data config url: %@", buf, 0xCu);
          }
          (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
          int v54 = 1;
        }
        else
        {
          long long v67 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"dataConfigFilename"];
          long long v117 = +[SMTGlobalNNLM attachmentURL:v123 withName:v67];

          if (v117)
          {
            [v117 path];
            long long v149 = 0u;
            long long v150 = 0u;
            long long v147 = 0u;
            v166[0] = long long v148 = 0u;
            v166[1] = v52;
            v115 = (void *)v166[0];
            id v68 = +[NSArray arrayWithObjects:v166 count:2];
            id v69 = [v68 countByEnumeratingWithState:&v147 objects:v167 count:16];
            if (v69)
            {
              uint64_t v70 = *(void *)v148;
              while (2)
              {
                for (j = 0; j != v69; j = (char *)j + 1)
                {
                  if (*(void *)v148 != v70) {
                    objc_enumerationMutation(v68);
                  }
                  uint64_t v72 = *(void *)(*((void *)&v147 + 1) + 8 * (void)j);
                  long long v73 = +[NSFileManager defaultManager];
                  unsigned __int8 v74 = [v73 fileExistsAtPath:v72];

                  if ((v74 & 1) == 0)
                  {
                    NSErrorUserInfoKey v164 = NSLocalizedDescriptionKey;
                    v92 = +[NSString stringWithFormat:@"File does not exist %@", v72];
                    v165 = v92;
                    uint64_t v93 = +[NSDictionary dictionaryWithObjects:&v165 forKeys:&v164 count:1];
                    uint64_t v94 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:v93];

                    v95 = qword_1000443C8;
                    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      *(void *)&uint8_t buf[4] = v94;
                      _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Failed to load file: %@", buf, 0xCu);
                    }
                    (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
                    goto LABEL_83;
                  }
                }
                id v69 = [v68 countByEnumeratingWithState:&v147 objects:v167 count:16];
                if (v69) {
                  continue;
                }
                break;
              }
            }

            id v75 = [objc_alloc((Class)_EARLmData) initWithConfiguration:v115 recognizerConfiguration:v52];
            if (v75)
            {
              v145[0] = _NSConcreteStackBlock;
              v145[1] = 3221225472;
              v145[2] = sub_10001C168;
              v145[3] = &unk_10003CC90;
              id v68 = v75;
              id v146 = v68;
              v113 = objc_retainBlock(v145);
              v76 = [v68 sources];
              id v77 = [v68 queryLimit];
              [v68 maxAge];
              double v79 = v78;
              [v68 minAge];
              +[SMTUserData enumerateDocumentSources:v76 limit:v77 maxAge:v113 minAge:v79 block:v80];

              v143[0] = _NSConcreteStackBlock;
              v143[1] = 3221225472;
              v143[2] = sub_10001C218;
              v143[3] = &unk_10003CCB8;
              id v81 = v126;
              id v144 = v81;
              v111 = objc_retainBlock(v143);
              [v68 enumerateSentencesOfType:0 block:v111];
              id v82 = [v81 count];
              v83 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"minDataCount"];
              LODWORD(v82) = (unint64_t)v82 < [v83 unsignedIntValue];

              if (v82)
              {
                NSErrorUserInfoKey v160 = NSLocalizedDescriptionKey;
                v84 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Insufficient training data (%lu)", [v81 count]);
                v161 = v84;
                v85 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
                v86 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:2 userInfo:v85];

                uint64_t v87 = qword_1000443C8;
                if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412290;
                  *(void *)&uint8_t buf[4] = v86;
                  _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Insufficient training data: %@", buf, 0xCu);
                }
                (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
                int v54 = 1;
              }
              else
              {
                v141[0] = _NSConcreteStackBlock;
                v141[1] = 3221225472;
                v141[2] = sub_10001C324;
                v141[3] = &unk_10003CCB8;
                id v103 = v129;
                id v142 = v103;
                id v104 = objc_retainBlock(v141);
                [v68 enumerateSentencesOfType:2 block:v104];
                if ([v103 count])
                {
                  uint64_t v105 = qword_1000443C8;
                  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "data from device loaded", buf, 2u);
                  }
                  v106 = *(void **)(v124 + 40);
                  uint64_t v107 = *(void *)(v124 + 64);
                  v108 = [*(id *)(*(void *)(*(void *)(v124 + 96) + 8) + 40) vocab];
                  [v106 recordWordsAndOov:v107 data:v68 vocab:v108];
                  int v54 = 0;
                }
                else
                {
                  NSErrorUserInfoKey v158 = NSLocalizedDescriptionKey;
                  CFStringRef v159 = @"No data left for evaluation";
                  v109 = +[NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
                  v108 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:2 userInfo:v109];

                  id v110 = qword_1000443C8;
                  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)&uint8_t buf[4] = v108;
                    _os_log_error_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "Insufficient evaluation data: %@", buf, 0xCu);
                  }
                  (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
                  int v54 = 1;
                }

                v86 = v142;
              }

              uint64_t v94 = v146;
            }
            else
            {
              NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
              CFStringRef v163 = @"Unable to create data loader";
              uint64_t v101 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
              uint64_t v94 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v101];

              uint64_t v102 = qword_1000443C8;
              if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = v94;
                _os_log_error_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Failed to load LM data: %@", buf, 0xCu);
              }
              (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
              id v68 = 0;
LABEL_83:
              int v54 = 1;
            }

            v99 = v115;
          }
          else
          {
            NSErrorUserInfoKey v168 = NSLocalizedDescriptionKey;
            v96 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"dataConfigFilename"];
            id v97 = +[NSString stringWithFormat:@"No data-conf file attached: %@", v96];
            v169 = v97;
            uint64_t v98 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
            v99 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v98];

            v100 = qword_1000443C8;
            if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v99;
              _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Failed to load data config: %@", buf, 0xCu);
            }
            (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
            int v54 = 1;
          }

          v90 = v117;
        }
      }
      if (v54) {
        goto LABEL_103;
      }
    }
    uint64_t v38 = v124;
    [*(id *)(*(void *)(*(void *)(v124 + 96) + 8) + 40) setTrainData:v126];
    [*(id *)(*(void *)(*(void *)(v124 + 96) + 8) + 40) setEvalData:v129];
    if (v122) {
      goto LABEL_41;
    }
    id v55 = [*(id *)(v124 + 64) objectForKeyedSubscript:@"minDataCount"];
    double v56 = v55;
    if (!v55) {
      id v55 = &off_10003F238;
    }
    unsigned int v57 = [v55 unsignedIntValue];

    uint64_t v58 = +[SMTUserData checkDataAmountQuickly:v57];
    uint64_t v59 = *(void *)(*(void *)(v124 + 104) + 8);
    id v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = v58;

    uint64_t v61 = *(void *)(*(void *)(*(void *)(v124 + 104) + 8) + 40);
    uint64_t v38 = v124;
    if (!v61)
    {
LABEL_41:
      id v39 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Successfully downloaded attachments for Global NNLM training", buf, 2u);
      }
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_10001C430;
      v137[3] = &unk_10003CCE0;
      id v140 = *(id *)(v38 + 72);
      id v41 = *(void **)(v38 + 48);
      id v40 = (id *)(v38 + 48);
      id v42 = v41;
      uint64_t v43 = (uint64_t)*(v40 - 1);
      id v138 = v42;
      uint64_t v139 = v43;
      uint64_t v44 = objc_retainBlock(v137);
      uint64_t v45 = qword_1000443D0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C67C;
      block[3] = &unk_10003CD08;
      uint64_t v135 = *(void *)(v124 + 96);
      id v10 = v123;
      uint64_t v136 = *(void *)(v124 + 104);
      id v131 = v10;
      id v133 = v44;
      id v132 = *v40;
      id v134 = *(id *)(v124 + 80);
      uint64_t v46 = v44;
      dispatch_async(v45, block);

      goto LABEL_104;
    }
    __int16 v62 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(v124 + 72) + 16))();
LABEL_103:
    id v10 = v123;
LABEL_104:

LABEL_105:
    id v5 = 0;
    goto LABEL_5;
  }
  NSErrorUserInfoKey v8 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to download session attachments with error:%@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_5:
}

void sub_10001B990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56)
{
  _Unwind_Resume(a1);
}

unint64_t sub_10001BD18(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    uint64_t v4 = (uint64_t *)a1;
  }
  else {
    uint64_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      uint64_t v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      id v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      uint32_t v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

void sub_10001C168(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  id v11 = a2;
  id v9 = a3;
  id v10 = a4;
  [*(id *)(a1 + 32) addDocumentWithUUID:v11 content:v9 metadata:v10];
  *a5 = [*(id *)(a1 + 32) roomForMoreData] ^ 1;
}

void sub_10001C1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C218(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  uint64_t v4 = (id)qword_1000443C8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 componentsJoinedByString:@" "];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "training data: %@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001C300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C324(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  uint64_t v4 = (id)qword_1000443C8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 componentsJoinedByString:@" "];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "evaluation data: %@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001C40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001C430(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 40) && ![*(id *)(a1 + 32) taskIsDeferred])
    {
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v8 = +[NSString stringWithFormat:@"Training canceled after %@", v5];
    uint64_t v15 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:v9];

    id v11 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

void sub_10001C638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C67C(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAttachments:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) loadData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setup];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) evaluate];
      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
      {
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) train];
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
        {
          uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) evaluate];
          uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
          uint32_t v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
          {
            id v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            uint64_t v18 = [*(id *)(a1 + 40) recipe];
            uint64_t v19 = objc_msgSend(v17, "computeDelta:", objc_msgSend(v18, "pluginShouldAddNoiseAndEncryptResult"));
            uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
            uint64_t v21 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = v19;

            if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
            {
              uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) delta];
              uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) results];
              if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) deltaIsPartial]|| (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "evaluatePartialDelta"), uint64_t v24 = objc_claimAutoreleasedReturnValue(), v25 = *(void *)(*(void *)(a1 + 72) + 8), v26 = *(void **)(v25 + 40), *(void *)(v25 + 40) = v24, v26, ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0))
              {
                uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
                uint64_t v28 = *(void **)(v27 + 40);
                *(void *)(v27 + 40) = 0;

                uint64_t v29 = qword_1000443C8;
                if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                {
                  int v30 = 138412290;
                  uint64_t v31 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Training completed with result=%@", (uint8_t *)&v30, 0xCu);
                }
                (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
              }
            }
          }
        }
      }
    }
  }
}

void sub_10001CA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001CA44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  +[SMTUtils cleanupTemporaryDirectory];
  return xpc_transaction_exit_clean();
}

uint64_t sub_10001CA90(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  +[SMTUtils cleanupTemporaryDirectory];
  return xpc_transaction_exit_clean();
}

void sub_10001CF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

id sub_10001D008()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1000443E0;
  uint64_t v7 = qword_1000443E0;
  if (!qword_1000443E0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001D340;
    v3[3] = &unk_10003D240;
    v3[4] = &v4;
    sub_10001D340((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001D0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D0EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = 0;
  *(void *)&long long v8 = 138412290;
  long long v17 = v8;
  while (v7 < (int)objc_msgSend(v6, "intValue", v17))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v21 = v5;
    id v10 = +[NSArray arrayWithObjects:&v21 count:1];
    LOBYTE(v9) = [v9 record:v10];

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = v17;
        id v20 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "fail to save %@ for unigram statistics aggregation", buf, 0xCu);
      }
    }
    ++v7;
  }
  id v12 = [*(id *)(a1 + 40) indexForWord:v5];
  if (v12 == [*(id *)(a1 + 40) unknownWordIndex])
  {
    [*(id *)(a1 + 48) addObject:v5];
    for (int i = 0; i < (int)[v6 intValue]; ++i)
    {
      uint64_t v14 = *(void **)(a1 + 56);
      id v18 = v5;
      uint64_t v15 = +[NSArray arrayWithObjects:&v18 count:1];
      LOBYTE(v14) = [v14 record:v15];

      if ((v14 & 1) == 0)
      {
        uint32_t v16 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = v17;
          id v20 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "fail save OOV %@ for later analysis", buf, 0xCu);
        }
      }
    }
  }
}

void sub_10001D304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_10001D340(uint64_t a1)
{
  v7[0] = 0;
  if (!qword_1000443E8)
  {
    v7[1] = _NSConcreteStackBlock;
    v7[2] = (void *)3221225472;
    v7[3] = sub_10001D570;
    v7[4] = &unk_10003D278;
    v7[5] = v7;
    long long v8 = off_10003D0B0;
    uint64_t v9 = 0;
    qword_1000443E8 = _sl_dlopen();
  }
  if (!qword_1000443E8)
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *DifferentialPrivacyLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"SpeechModelTrainingConnection.mm", 32, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("_DPStringRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = +[NSAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:"Class get_DPStringRecorderClass()_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"SpeechModelTrainingConnection.mm", 33, @"Unable to find class %s", "_DPStringRecorder");

LABEL_10:
    __break(1u);
  }
  qword_1000443E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001D570()
{
  uint64_t result = _sl_dlopen();
  qword_1000443E8 = result;
  return result;
}

void sub_10001D79C(uint64_t a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_create("com.apple.SpeechModelTrainingWaiting", v2);

  dispatch_time_t v4 = dispatch_time(0, 240000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F510;
  block[3] = &unk_10003CB00;
  void block[4] = *(void *)(a1 + 32);
  uint64_t v98 = v3;
  dispatch_after(v4, v3, block);
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_10001F584;
  v121[3] = &unk_10003CB28;
  id v122 = *(id *)(a1 + 56);
  id v103 = objc_retainBlock(v121);
  id v5 = *(id *)(a1 + 40);
  id v100 = *(id *)(a1 + 48);
  id v6 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v105 = [v6 firstObject];

  int v7 = [v105 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM"];
  uint64_t v102 = [v7 stringByStandardizingPath];

  long long v8 = [v105 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM_Fides"];
  id v104 = [v8 stringByStandardizingPath];

  uint64_t v9 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v143 = v102;
    __int16 v144 = 2112;
    id v145 = v104;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PLM: personalizedLMPath=%@ fidesPersonalizedLMPath=%@", buf, 0x16u);
  }
  id v10 = qword_1000443C8;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65))
    {
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PLM: Client is DictationPersonalizationFidesPlugin", buf, 2u);
      }
      +[_EARLmModel removeWithDirectory:v104];
      uint64_t v11 = v104;
LABEL_12:
      id v12 = v11;
      goto LABEL_16;
    }
  }
  else if (*(unsigned char *)(a1 + 65))
  {
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PLM: Client is 24-hour job", buf, 2u);
    }
    +[_EARLmModel removeWithDirectory:v102];
    +[_EARLmModel removeWithDirectory:v104];
    uint64_t v11 = v102;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PLM: Client is PersonalizedLmFidesPlugin", buf, 2u);
  }
  id v12 = 0;
LABEL_16:
  v99 = v12;
  if (![*(id *)(a1 + 32) shouldStop])
  {
    uint64_t v13 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v143 = v5;
      __int16 v144 = 2112;
      id v145 = v100;
      __int16 v146 = 2112;
      id v147 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PLM: Training start with language=%@ configuration=%@ directory=%@", buf, 0x20u);
    }
    if (![v5 length])
    {
      id v97 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:204 userInfo:0];
      ((void (*)(void *, void))v103[2])(v103, 0);
      goto LABEL_26;
    }
    v96 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

    uint64_t v14 = objc_alloc_init(SMTSpeechAssets);
    id v120 = 0;
    uint64_t v94 = v14;
    v95 = [(SMTSpeechAssets *)v14 fetchAssetPathForInstalledLanguage:v96 outError:&v120];
    id v15 = v120;
    uint32_t v16 = qword_1000443C8;
    BOOL v17 = os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO);
    id v97 = v15;
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)long long buf = 138412290;
        id v143 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "PLM: Fetch asset error %@", buf, 0xCu);
      }
      ((void (*)(void *, void, id))v103[2])(v103, 0, v15);
      int v18 = 0;
      goto LABEL_71;
    }
    if (v17)
    {
      *(_DWORD *)long long buf = 138412290;
      id v143 = v95;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "PLM: Resolved asset=%@", buf, 0xCu);
    }
    if (![v95 length])
    {
      uint64_t v23 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:0];
      ((void (*)(void *, void, void *))v103[2])(v103, 0, v23);
      int v18 = 0;
LABEL_70:

LABEL_71:
      id v5 = v96;
      goto LABEL_72;
    }
    v92 = [v95 stringByAppendingPathComponent:@"mini.json"];
    id v19 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v92];
    id v20 = [v19 version];

    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_10001F60C;
    v117[3] = &unk_10003CB50;
    id v88 = v96;
    id v118 = v88;
    id v90 = v20;
    id v119 = v90;
    v91 = objc_retainBlock(v117);
    if (![v100 length])
    {
      id v24 = v92;

      id v100 = v24;
      goto LABEL_42;
    }
    id v21 = v100;
    uint64_t v22 = v21;
    if (v21)
    {
      id v101 = v21;
      if (realpath_DARWIN_EXTSN((const char *)[v101 fileSystemRepresentation], (char *)buf))
      {
        id v100 = +[NSString stringWithUTF8String:buf];
LABEL_40:

        if (![v100 hasPrefix:@"/private/var/tmp/com.apple.siri-distributed-evaluation/"]|| (objc_msgSend(v100, "hasSuffix:", @"/lm-personalize.json") & 1) == 0)
        {
          id v37 = [objc_alloc((Class)NSString) initWithFormat:@"Input configuration(%@) does not match expected path", v100];
          unint64_t v38 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543362;
            id v143 = v37;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "PLM: %{public}@", buf, 0xCu);
          }
          NSErrorUserInfoKey v138 = NSLocalizedDescriptionKey;
          id v139 = v37;
          id obj = v37;
          unint64_t v34 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
          id v35 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:206 userInfo:v34];
          ((void (*)(void *, void, id))v103[2])(v103, 0, v35);
          int v18 = 0;
          goto LABEL_69;
        }
LABEL_42:
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        uint64_t v136 = v92;
        id obj = +[NSArray arrayWithObjects:&v136 count:1];
        id v27 = [obj countByEnumeratingWithState:&v113 objects:v137 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v114;
          while (2)
          {
            for (int i = 0; i != v27; int i = (char *)i + 1)
            {
              if (*(void *)v114 != v28) {
                objc_enumerationMutation(obj);
              }
              int v30 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              uint64_t v31 = +[NSFileManager defaultManager];
              unsigned __int8 v32 = [v31 fileExistsAtPath:v30];

              if ((v32 & 1) == 0)
              {
                uint64_t v39 = qword_1000443C8;
                if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v143 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "PLM: File does not exist %@", buf, 0xCu);
                }
                unint64_t v34 = +[NSString stringWithFormat:@"File does not exist %@", v30];
                NSErrorUserInfoKey v134 = NSLocalizedDescriptionKey;
                ((void (*)(void *, void *))v91[2])(v91, v34);
                id v35 = (id)objc_claimAutoreleasedReturnValue();
                id v135 = v35;
                id v36 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
                unint64_t v40 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:v36];
                ((void (*)(void *, void, void *))v103[2])(v103, 0, v40);
                int v18 = 0;
                goto LABEL_61;
              }
            }
            id v27 = [obj countByEnumeratingWithState:&v113 objects:v137 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        uint64_t v33 = +[NSURL fileURLWithPath:v100];
        id v112 = 0;
        unint64_t v34 = +[NSString stringWithContentsOfURL:v33 encoding:4 error:&v112];
        id obj = v112;

        if (obj || ([v34 containsString:@"\"lm-personalize\""] & 1) == 0)
        {
          unint64_t v41 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "PLM: Disabled", buf, 2u);
          }
          id v35 = objc_alloc_init((Class)NSMutableDictionary);
          [v35 setObject:@"Disabled" forKeyedSubscript:NSLocalizedDescriptionKey];
          if (obj) {
            [v35 setObject:obj forKeyedSubscript:NSUnderlyingErrorKey];
          }
          id v36 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:202 userInfo:v35];
          ((void (*)(void *, void, id))v103[2])(v103, 0, v36);
          goto LABEL_67;
        }
        id v35 = [objc_alloc((Class)_EARLmData) initWithConfiguration:v100 recognizerConfiguration:v92];
        if (!v35)
        {
          uint64_t v43 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "PLM: Cannot create data", buf, 2u);
          }
          NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
          ((void (*)(void *, const __CFString *))v91[2])(v91, @"Cannot create data");
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          id v133 = v36;
          id v87 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
          uint64_t v44 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:201 userInfo:v87];
          ((void (*)(void *, void, void *))v103[2])(v103, 0, v44);
          int v18 = 0;
LABEL_117:

          id obj = 0;
          unint64_t v40 = v87;
LABEL_61:

          goto LABEL_68;
        }
        if ([*(id *)(a1 + 32) shouldStop])
        {
          id v36 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
          ((void (*)(void *, void, id))v103[2])(v103, 0, v36);
          id obj = 0;
LABEL_67:
          int v18 = 0;
LABEL_68:

LABEL_69:
          uint64_t v23 = v92;
          goto LABEL_70;
        }
        id v36 = [objc_alloc((Class)_EARLmModel) initWithConfiguration:v100];
        if (v36)
        {
          id v87 = [objc_alloc((Class)_EARLmEvaluator) initWithConfiguration:v100 recognizerConfiguration:v92];
          if (v87)
          {
            id v86 = objc_alloc_init((Class)NSMutableDictionary);
            [v86 setObject:v88 forKeyedSubscript:@"language"];
            [v86 setObject:v90 forKeyedSubscript:@"asset"];
            uint64_t v45 = qword_1000443C8;
            if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "PLM: Fetching data", buf, 2u);
            }
            uint64_t v46 = +[NSProcessInfo processInfo];
            [v46 systemUptime];
            double v48 = v47;

            uint64_t v49 = [v35 sources];
            id v50 = [v35 queryLimit];
            [v35 maxAge];
            double v52 = v51;
            [v35 minAge];
            double v54 = v53;
            v109[0] = _NSConcreteStackBlock;
            v109[1] = 3221225472;
            v109[2] = sub_10001F660;
            v109[3] = &unk_10003CB78;
            id v55 = v35;
            uint64_t v56 = *(void *)(a1 + 32);
            id v84 = v55;
            id v110 = v55;
            uint64_t v111 = v56;
            +[SMTUserData enumerateDocumentSources:v49 limit:v50 maxAge:v109 minAge:v52 block:v54];

            if ([*(id *)(a1 + 32) shouldStop])
            {
              uint64_t v57 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
              ((void (*)(void *, void, void *))v103[2])(v103, 0, v57);
              int v18 = 0;
LABEL_115:

              uint64_t v59 = v110;
              goto LABEL_116;
            }
            uint64_t v62 = +[NSProcessInfo processInfo];
            [v62 systemUptime];
            double v64 = v63;

            id v89 = objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v65 = [v84 metrics];
            [v89 addEntriesFromDictionary:v65];

            uint64_t v66 = +[NSNumber numberWithDouble:v64 - v48];
            [v89 setObject:v66 forKey:@"textProcessingDuration"];

            [v86 setObject:v89 forKeyedSubscript:@"data"];
            uint64_t v67 = qword_1000443C8;
            if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "PLM: Start training", buf, 2u);
            }
            v108[0] = _NSConcreteStackBlock;
            v108[1] = 3221225472;
            v108[2] = sub_10001F720;
            v108[3] = &unk_10003CBA0;
            v108[4] = *(void *)(a1 + 32);
            if (([v36 trainWithData:v84 shouldStop:v108] & 1) == 0)
            {
              uint64_t v68 = qword_1000443C8;
              if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "PLM: Stopped after training", buf, 2u);
              }
              ((void (*)(void *, id, void))v103[2])(v103, v86, 0);
              int v18 = 0;
              goto LABEL_114;
            }
            if ([*(id *)(a1 + 32) shouldStop])
            {
              int v82 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
              ((void (*)(void *, void, void *))v103[2])(v103, 0, v82);
              int v18 = 0;

LABEL_114:
              uint64_t v57 = v89;
              goto LABEL_115;
            }
            uint64_t v83 = [v36 metrics];
            if (v83) {
              [v86 setObject:v83 forKeyedSubscript:@"model"];
            }
            unint64_t v81 = [v36 handle];
            if (!v81)
            {
              uint64_t v72 = qword_1000443C8;
              if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "PLM: Failed to get handle", buf, 2u);
              }
              NSErrorUserInfoKey v126 = NSLocalizedDescriptionKey;
              ((void (*)(void *, const __CFString *))v91[2])(v91, @"Failed to get handle");
              id v85 = (id)objc_claimAutoreleasedReturnValue();
              id v127 = v85;
              uint64_t v73 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
              uint64_t v74 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:201 userInfo:v73];
              ((void (*)(void *, void, void *))v103[2])(v103, 0, v74);

              goto LABEL_111;
            }
            *(_DWORD *)id v140 = 0;
            id v106 = 0;
            v107[0] = _NSConcreteStackBlock;
            v107[1] = 3221225472;
            v107[2] = sub_10001F728;
            v107[3] = &unk_10003CBA0;
            v107[4] = *(void *)(a1 + 32);
            unsigned __int8 v69 = [v87 runEvaluationWithData:v84 handle:v81 shouldStop:v107 result:&v106 bestWeight:v140];
            id v85 = v106;
            if ([*(id *)(a1 + 32) shouldStop])
            {
              uint64_t v71 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
              ((void (*)(void *, void, void *))v103[2])(v103, 0, v71);
LABEL_107:

LABEL_111:
              int v18 = 0;
LABEL_112:

              goto LABEL_114;
            }
            if (v85) {
              [v86 setObject:v85 forKeyedSubscript:@"eval"];
            }
            if ((v69 & 1) == 0)
            {
              uint64_t v75 = qword_1000443C8;
              if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "PLM: Stopped after evaluation", buf, 2u);
              }
              int v18 = 0;
              ((void (*)(void *, id, void))v103[2])(v103, v86, 0);
              goto LABEL_112;
            }
            LODWORD(v70) = *(_DWORD *)v140;
            [v36 setWeight:v70];
            if ([v99 length])
            {
              if (([v36 writeToDirectory:v99] & 1) == 0)
              {
                unint64_t v77 = qword_1000443C8;
                if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v143 = v99;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "PLM: Write failure: %@", buf, 0xCu);
                }
                uint64_t v71 = +[NSString stringWithFormat:@"Write failure: %@", v99];
                NSErrorUserInfoKey v124 = NSLocalizedDescriptionKey;
                unint64_t v78 = ((void (*)(void *, void *))v91[2])(v91, v71);
                id v125 = v78;
                unint64_t v79 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
                unint64_t v80 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:3 userInfo:v79];
                ((void (*)(void *, void, void *))v103[2])(v103, 0, v80);

                goto LABEL_107;
              }
              int v18 = 1;
            }
            else
            {
              int v18 = 0;
            }
            uint64_t v76 = qword_1000443C8;
            if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v143 = v86;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "PLM: Done. Result: %@", buf, 0xCu);
            }
            ((void (*)(void *, id, void))v103[2])(v103, v86, 0);
            goto LABEL_112;
          }
          uint64_t v60 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "PLM: Cannot create evaluator", buf, 2u);
          }
          NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
          uint64_t v129 = ((void (*)(void *, const __CFString *))v91[2])(v91, @"Cannot create evaluator");
          id v86 = (id)v129;
          uint64_t v59 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
          uint64_t v61 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:201 userInfo:v59];
          ((void (*)(void *, void, void *))v103[2])(v103, 0, v61);

          id v87 = 0;
        }
        else
        {
          uint64_t v58 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "PLM: Cannot create model", buf, 2u);
          }
          NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
          uint64_t v131 = ((void (*)(void *, const __CFString *))v91[2])(v91, @"Cannot create model");
          id v87 = (id)v131;
          id v86 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          uint64_t v59 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:201 userInfo:v86];
          ((void (*)(void *, void, void *))v103[2])(v103, 0, v59);
        }
        int v18 = 0;
LABEL_116:

        uint64_t v44 = v86;
        goto LABEL_117;
      }
      id v25 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to get absolute path for path=%@ errorno=%d", v101, *__error()];
      uint64_t v26 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v140 = 138412290;
        id v141 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "PLM: %@", v140, 0xCu);
      }
    }
    id v100 = 0;
    goto LABEL_40;
  }
  id v97 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:4 userInfo:0];
  ((void (*)(void *, void))v103[2])(v103, 0);
LABEL_26:
  int v18 = 0;
LABEL_72:

  if (!v18 && [v99 length]) {
    +[_EARLmModel removeWithDirectory:v99];
  }
  unint64_t v42 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "PLM: Exiting...", buf, 2u);
  }
  xpc_transaction_exit_clean();
}

void sub_10001EF38(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  if (a2)
  {

    objc_begin_catch(a1);
    JUMPOUT(0x10001E3CCLL);
  }
  _Unwind_Resume(a1);
}

id sub_10001F510(uint64_t a1)
{
  uint64_t v2 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "PLM: Training timed out", v4, 2u);
  }
  return [*(id *)(a1 + 32) setShouldStop:1];
}

void sub_10001F584(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void sub_10001F5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10001F60C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[NSString stringWithFormat:@"language=%@ asset=%@: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), a2];
  return v2;
}

void sub_10001F660(uint64_t a1, void *a2, void *a3, void *a4, unsigned __int8 *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  [*(id *)(a1 + 32) addDocumentWithUUID:v12 content:v9 metadata:v10];
  if ([*(id *)(a1 + 32) roomForMoreData]) {
    unsigned __int8 v11 = [*(id *)(a1 + 40) shouldStop];
  }
  else {
    unsigned __int8 v11 = 1;
  }
  *a5 = v11;
}

void sub_10001F704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10001F720(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldStop];
}

id sub_10001F728(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldStop];
}

void sub_10001F7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001F810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SpeechModelTrainingConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10001F96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  int v18 = v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10001F9A4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      int v3 = 138412290;
      dispatch_time_t v4 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%@ cancelling instance", (uint8_t *)&v3, 0xCu);
    }
    [WeakRetained setShouldStop:1];
    [WeakRetained[3] cancel];
  }
}

void sub_10001FA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FD2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, NSErrorUserInfoKey a20)
{
  if (a2)
  {
    _Block_object_dispose(&a16, 8);
    id v23 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      id v24 = v23;
      *(void *)(v20 - 72) = NSLocalizedDescriptionKey;
      id v25 = +[NSString stringWithFormat:@"Exception in checkDataAmountQuickly: %@"];
      *(void *)(v20 - 64) = v25;
      uint64_t v26 = +[NSDictionary dictionaryWithObjects:v20 - 64 forKeys:v20 - 72 count:1];
      +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v26];
      objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a20 = NSLocalizedDescriptionKey;
      id v24 = +[NSString stringWithFormat:@"Exception in checkDataAmountQuickly"];
      *(void *)(v20 - 80) = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:v20 - 80 forKeys:&a20 count:1];
      +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v25];
      objc_claimAutoreleasedReturnValue();
    }

    objc_end_catch();
    JUMPOUT(0x10001FCE8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001FEB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) > *(void *)(result + 40)) {
    *a5 = 1;
  }
  return result;
}

void sub_100020578(id a1)
{
  uint64_t v1 = +[NSBundle bundleWithPath:@"/System/Library/TextInput/Plugins/MessagesDataKeyboardPlugin.bundle"];
  uint64_t v2 = (void *)qword_100044400;
  qword_100044400 = v1;

  id v3 = [(id)qword_100044400 classNamed:@"MessagesTextInputModelDataSource"];
  qword_100044408 = (uint64_t)v3;
  if (![v3 instancesRespondToSelector:"setNextRowID:"]
    || ![v3 instancesRespondToSelector:"nextRowID"]
    || ([v3 instancesRespondToSelector:"lastDatabaseRowID"] & 1) == 0)
  {
    dispatch_time_t v4 = qword_1000443F0;
    if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Incompatible Messages plugin data source", v5, 2u);
    }
    qword_100044408 = 0;
  }
}

void sub_100021028(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v11 eventBody];
    [v5 absoluteTimestamp];
    double v7 = v6;
    double v8 = *(double *)(a1 + 40);

    if (v7 <= v8)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [v11 eventBody];
      [v9 addObject:v10];
    }
  }
}

void sub_1000210F8(id a1, BPSCompletion *a2)
{
  uint64_t v2 = a2;
  if ([(BPSCompletion *)v2 state])
  {
    id v3 = (void *)qword_1000443F0;
    if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v4 = v3;
      id v5 = [(BPSCompletion *)v2 error];
      id v6 = [v5 description];
      int v7 = 136315138;
      id v8 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Biome Dictation: Error reading dictation event, reason: %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void sub_100021470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

char *sub_100021498(uint64_t a1, unsigned __int8 *a2, long long **a3)
{
  unint64_t v7 = sub_10001BD18((uint64_t)a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    id v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = (char *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = *((void *)v13 + 1);
          if (v14 == v8)
          {
            if (sub_1000216FC((unsigned __int8 *)v13 + 16, a2)) {
              return v13;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          uint64_t v13 = *(char **)v13;
        }
        while (v13);
      }
    }
  }
  uint64_t v13 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = v8;
  id v15 = v13 + 16;
  uint32_t v16 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    sub_1000219FC(v15, *(void **)v16, *((void *)v16 + 1));
  }
  else
  {
    long long v17 = *v16;
    *((void *)v13 + 4) = *((void *)v16 + 2);
    *(_OWORD *)id v15 = v17;
  }
  *((void *)v13 + 5) = 0;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_1000217A0(a1, v23);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v24 = *(void *)a1;
  id v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *(void *)uint64_t v13 = *v25;
LABEL_41:
    void *v25 = v13;
    goto LABEL_42;
  }
  *(void *)uint64_t v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v13;
  *(void *)(v24 + 8 * v3) = a1 + 16;
  if (*(void *)v13)
  {
    unint64_t v26 = *(void *)(*(void *)v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9) {
        v26 %= v9;
      }
    }
    else
    {
      v26 &= v9 - 1;
    }
    id v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return v13;
}

void sub_1000216D8(_Unwind_Exception *a1)
{
  sub_10002199C(0, v1);
  _Unwind_Resume(a1);
}

BOOL sub_1000216FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void sub_1000217A0(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint32_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    sub_100006FF8();
  }
  int v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  int v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    BOOL v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *int v8 = *v14;
          *BOOL v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          BOOL v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        int v8 = v14;
        BOOL v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_10002199C(char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *sub_1000219FC(unsigned char *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000071A4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int v5 = v8;
    int v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_100021FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v47 - 248), 8);

  _Block_object_dispose((const void *)(v47 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022110(uint64_t a1)
{
}

void sub_100022118(void *a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isEqualToString:&stru_10003D2D8] & 1) == 0)
  {
    int v8 = +[NSCharacterSet whitespaceCharacterSet];
    size_t v9 = [v7 componentsSeparatedByCharactersInSet:v8];

    if ([v9 count] == (id)2)
    {
      uint8x8_t v10 = [v9 objectAtIndex:0];
      unint64_t v11 = [v9 objectAtIndex:1];
      if (a3 > 3)
      {
        sub_1000070F4(__p, (char *)[v10 UTF8String]);
        uint64_t v17 = a1[4];
        uint64_t v18 = *(void *)(v17 + 64);
        unint64_t v21 = __p;
        *((void *)sub_100021498(v17 + 40, (unsigned __int8 *)__p, (long long **)&v21) + 5) = (int)v18;
        if (v20 < 0) {
          operator delete(__p[0]);
        }
      }
      else if ([v10 isEqualToString:@"<VocabSize>"])
      {
        *(void *)(*(void *)(a1[6] + 8) + 24) = (int)[v11 intValue];
      }
      else if ([v10 isEqualToString:@"<UnknownWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v11);
      }
      else if ([v10 isEqualToString:@"<BeginOfSentenceWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v11);
      }
      else if ([v10 isEqualToString:@"<EndOfSentenceWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), v11);
      }
    }
    else
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      uint8x8_t v12 = +[NSString stringWithFormat:@"Incorrect format of vocab file for line=%@", v7];
      size_t v23 = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v14 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v13];
      uint64_t v15 = *(void *)(a1[5] + 8);
      uint32_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      *a4 = 1;
    }
  }
}

void sub_1000223C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_100022448(uint64_t a1, unsigned __int8 *a2, long long **a3)
{
  unint64_t v7 = sub_10001BD18((uint64_t)a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    uint8x8_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (int i = *v12; i; int i = *(void **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (sub_1000216FC((unsigned __int8 *)i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  int i = operator new(0x30uLL);
  *(void *)int i = 0;
  *((void *)i + 1) = v8;
  uint64_t v15 = *a3;
  long long v16 = **a3;
  *((void *)i + 4) = *((void *)*a3 + 2);
  *((_OWORD *)i + 1) = v16;
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)uint64_t v15 = 0;
  *((void *)i + 5) = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_1000217A0(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)int i = *v24;
LABEL_38:
    *uint64_t v24 = i;
    goto LABEL_39;
  }
  *(void *)int i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }
    else
    {
      v25 &= v9 - 1;
    }
    uint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_10002267C(_Unwind_Exception *a1)
{
  sub_10002199C(1, v1);
  _Unwind_Resume(a1);
}

void sub_100022794(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    int8x8_t v4 = (char *)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        unint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        unint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        int8x8_t v4 = v6;
      }
      while (v6 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100022950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100022DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022DEC(uint64_t a1, unint64_t a2)
{
  int8x8_t v4 = *(void **)a1;
  unint64_t v3 = *(void **)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *(void *)a1) >> 3);
  unint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 3) >= v6)
    {
      bzero(*(void **)(a1 + 8), 24 * ((24 * v6 - 24) / 0x18) + 24);
      *(void *)(a1 + 8) = &v3[3 * ((24 * v6 - 24) / 0x18) + 3];
      return;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006FA8();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006FF8();
    }
    uint64_t v11 = 3 * v10;
    uint8x8_t v12 = (char *)operator new(24 * v10);
    uint64_t v13 = &v12[24 * v5];
    unint64_t v14 = &v12[8 * v11];
    size_t v15 = 24 * ((24 * v6 - 24) / 0x18) + 24;
    bzero(v13, v15);
    long long v16 = &v13[v15];
    if (v3 == v4)
    {
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (!v3) {
        return;
      }
    }
    else
    {
      do
      {
        float v17 = v13;
        *((void *)v13 - 1) = 0;
        long long v18 = *(_OWORD *)(v3 - 3);
        v3 -= 3;
        *(_OWORD *)(v13 - 24) = v18;
        v13 -= 24;
        *((void *)v17 - 1) = v3[2];
        *unint64_t v3 = 0;
        v3[1] = 0;
        v3[2] = 0;
      }
      while (v3 != v4);
      BOOL v19 = *(void **)a1;
      unint64_t v3 = *(void **)(a1 + 8);
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (v3 != v19)
      {
        unint64_t v20 = v3;
        do
        {
          size_t v22 = (void *)*(v20 - 3);
          v20 -= 3;
          unint64_t v21 = v22;
          if (v22)
          {
            *(v3 - 2) = v21;
            operator delete(v21);
          }
          unint64_t v3 = v20;
        }
        while (v20 != v19);
        unint64_t v3 = v19;
      }
      if (!v3) {
        return;
      }
    }
    operator delete(v3);
    return;
  }
  if (a2 < v5)
  {
    uint64_t v23 = &v4[3 * a2];
    if (v3 != v23)
    {
      uint64_t v24 = *(void **)(a1 + 8);
      do
      {
        unint64_t v26 = (void *)*(v24 - 3);
        v24 -= 3;
        unint64_t v25 = v26;
        if (v26)
        {
          *(v3 - 2) = v25;
          operator delete(v25);
        }
        unint64_t v3 = v24;
      }
      while (v24 != v23);
    }
    *(void *)(a1 + 8) = v23;
  }
}

void sub_100023008(char **a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  int8x8_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    BOOL v19 = &v3[4 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 2)
  {
    bzero(a1[1], 4 * v6);
    BOOL v19 = &v4[4 * v6];
LABEL_15:
    a1[1] = v19;
    return;
  }
  if (a2 >> 62) {
    sub_100006FA8();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 1;
  if (v8 >> 1 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = (char *)sub_1000070BC(v10);
  uint8x8_t v12 = *a1;
  uint64_t v13 = a1[1];
  unint64_t v14 = &v11[4 * v5];
  long long v16 = &v11[4 * v15];
  bzero(v14, 4 * v6);
  float v17 = &v14[4 * v6];
  while (v13 != v12)
  {
    int v18 = *((_DWORD *)v13 - 1);
    v13 -= 4;
    *((_DWORD *)v14 - 1) = v18;
    v14 -= 4;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
  {
    operator delete(v12);
  }
}

void sub_1000234AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000239C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100023DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10002431C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x8_t v4 = (void *)qword_100044418;
  if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = v4;
    unint64_t v6 = [v3 audioData];
    int v7 = 134218240;
    id v8 = [v6 length];
    __int16 v9 = 1024;
    unsigned int v10 = +[SRAudioDecoder totalFrames:v3];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SRAudioGenerator: Received audio chunk, audio length: %zu, frames: %u", (uint8_t *)&v7, 0x12u);
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void sub_100024428(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = 0;
    id v7 = [v5 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v58;
      do
      {
        for (int i = 0; i != v7; int i = (char *)i + 1)
        {
          if (*(void *)v58 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v57 + 1) + 8 * i) audioData];
          id v11 = [v10 length];

          v6 += (uint64_t)v11;
        }
        id v7 = [v5 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v7);
    }

    uint8x8_t v12 = qword_100044418;
    if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SRAudioGenerator: Speech synthesis is successful, uuid: %@, audio length: %zu", buf, 0x16u);
    }
    unint64_t v14 = [*(id *)(a1 + 40) firstObject];
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 asbd];
      unsigned int v16 = DWORD2(v54);

      if (DWORD2(v54) == 1869641075)
      {
        uint64_t v29 = qword_100044418;
        if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "SRAudioGenerator: Convert Opus audio to PCM", buf, 2u);
        }
        id v30 = *(id *)(a1 + 40);
        uint64_t v31 = [SRAudioDecoder alloc];
        id v67 = 0;
        *(_OWORD *)long long buf = xmmword_10002E5F0;
        *(_OWORD *)&uint8_t buf[16] = unk_10002E600;
        uint64_t v71 = 16;
        unsigned __int8 v32 = [(SRAudioDecoder *)v31 initWithStreamDescription:buf error:&v67];
        id v48 = v67;
        uint64_t v33 = objc_opt_new();
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v34 = v30;
        id v35 = [v34 countByEnumeratingWithState:&v63 objects:buf count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v64;
          while (2)
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v64 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8 * (void)j);
              id v62 = 0;
              uint64_t v39 = [(SRAudioDecoder *)v32 decodeAudio:v38 error:&v62];
              id v40 = v62;
              if (v40)
              {
                uint64_t v44 = v40;

                uint64_t v28 = 0;
                unint64_t v42 = v34;
                goto LABEL_45;
              }
              unint64_t v41 = [v39 audioData];
              [v33 appendData:v41];
            }
            id v35 = [v34 countByEnumeratingWithState:&v63 objects:buf count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        id v61 = 0;
        unint64_t v42 = [(SRAudioDecoder *)v32 endWithError:&v61];
        id v43 = v61;
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v47 = [v42 audioData];
          [v33 appendData:v47];

          uint64_t v28 = sub_100024AB8(v33, 0xBB80uLL);
          uint64_t v44 = 0;
        }
LABEL_45:

LABEL_48:
        if (v28 && [v28 length])
        {
          id v45 = *(id *)(a1 + 56);
          objc_sync_enter(v45);
          [*(id *)(a1 + 56) setObject:v28 forKeyedSubscript:*(void *)(a1 + 48)];
          objc_sync_exit(v45);

          dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_53:

          goto LABEL_54;
        }
LABEL_51:
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        uint64_t v46 = qword_100044418;
        if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "SRAudioGenerator: Audio conversion failed", buf, 2u);
        }
        goto LABEL_53;
      }
      if (DWORD2(v54) == 1819304813)
      {
        float v17 = qword_100044418;
        if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "SRAudioGenerator: Downsample PCM audio", buf, 2u);
        }
        int v18 = objc_opt_new();
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v19 = *(id *)(a1 + 40);
        id v20 = [v19 countByEnumeratingWithState:&v50 objects:v68 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v51;
          do
          {
            for (k = 0; k != v20; k = (char *)k + 1)
            {
              if (*(void *)v51 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)k) audioData];
              [v18 appendData:v23];
            }
            id v20 = [v19 countByEnumeratingWithState:&v50 objects:v68 count:16];
          }
          while (v20);
        }

        uint64_t v24 = [*(id *)(a1 + 40) firstObject];
        unint64_t v25 = v24;
        if (v24)
        {
          [v24 asbd];
          unint64_t v26 = (unint64_t)v49;
        }
        else
        {
          unint64_t v26 = 0;
        }
        uint64_t v28 = sub_100024AB8(v18, v26);

        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v56 = 0;
      long long v54 = 0u;
      long long v55 = 0u;
      unsigned int v16 = 0;
    }
    id v27 = qword_100044418;
    if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "SRAudioGenerator: Unrecognized codec: %lu", buf, 0xCu);
    }
    uint64_t v28 = 0;
    goto LABEL_51;
  }
  int8x8_t v4 = qword_100044418;
  if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SRAudioGenerator: Speech synthesis failed with error: %@", buf, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_54:
}

void sub_100024A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100024AB8(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (!a2) {
    a2 = 48000;
  }
  AudioConverterRef outAudioConverter = 0;
  *(void *)&inSourceFormat.mBitsPerChannel = 16;
  inSourceFormat.mSampleRate = (double)a2;
  *(void *)&inSourceFormat.mBytesPerFrame = 0x100000002;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_10002E5E0;
  *(void *)&inDestinationFormat.mBitsPerChannel = 16;
  inDestinationFormat.mSampleRate = 16000.0;
  *(void *)&inDestinationFormat.mBytesPerFrame = 0x100000002;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_10002E5E0;
  int8x8_t v4 = 0;
  if (!AudioConverterNew(&inSourceFormat, &inDestinationFormat, &outAudioConverter))
  {
    unint64_t v5 = a2 / 0x3E80;
    id v6 = [v3 mutableCopy];
    uint64_t inInputDataProcUserData = 1;
    int v15 = 1;
    unsigned int v16 = [v6 length];
    id v7 = v6;
    id v17 = [v7 mutableBytes];
    unint64_t v8 = [v7 length] / v5;
    __int16 v9 = malloc_type_malloc(v8, 0x493DB520uLL);
    bzero(v9, v8);
    *(void *)&outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mNumberChannels = 1;
    outOutputData.mBuffers[0].mDataByteSize = v8;
    outOutputData.mBuffers[0].mData = v9;
    UInt32 ioOutputDataPacketSize = v8 >> 1;
    OSStatus v10 = AudioConverterFillComplexBuffer(outAudioConverter, (AudioConverterComplexInputDataProc)sub_100024C6C, &inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    AudioConverterDispose(outAudioConverter);
    int8x8_t v4 = 0;
    if (!v10)
    {
      int8x8_t v4 = +[NSData dataWithBytes:outOutputData.mBuffers[0].mData length:outOutputData.mBuffers[0].mDataByteSize];
    }
    free(v9);
  }
  return v4;
}

uint64_t sub_100024C6C(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = *(_DWORD *)(a5 + 12);
  *(void *)(a3 + 16) = *(void *)(a5 + 16);
  *(_DWORD *)(a3 + 12) = v5;
  *a2 = v5 >> 1;
  return 0;
}

void sub_1000253D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1000259E0(void *a1, int a2)
{
  unint64_t v2 = a1[1];
  if (!v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (v2 <= a2) {
      unint64_t v4 = a2 % v2;
    }
  }
  else
  {
    unint64_t v4 = (v2 - 1) & a2;
  }
  unsigned int v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  for (uint64_t result = *v5; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2) {
        return result;
      }
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2) {
          v7 %= v2;
        }
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4) {
        return 0;
      }
    }
  }
  return result;
}

void *sub_100025A94(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    __int16 v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      OSStatus v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          OSStatus v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  OSStatus v10 = operator new(0x18uLL);
  *OSStatus v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  *((_DWORD *)v10 + 5) = 0;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_1000217A0(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  id v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *OSStatus v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  *OSStatus v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    id v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_100025C90(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100026220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000263D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SMTSimpleMmapBuffer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100026B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *__p, uint64_t a6, int a7, __int16 a8, char a9, char a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  std::ostream::sentry::~sentry();
  sub_100026CD4((uint64_t *)va);
  if (a10 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_100026CD4(void *a1)
{
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void sub_100026DA0(void *a1, float a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        uint8x8_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          __int16 v9 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v8), (void)v11);
          *(float *)&double v10 = a2;
          [v9 multiply:v10];

          uint8x8_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

void sub_100026EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float sub_100026EF4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v1;
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      float v6 = 0.0;
      do
      {
        for (int i = 0; i != v4; int i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint8x8_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v8 l2norm];
          float v10 = v9;

          float v6 = v6 + v10;
        }
        id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
    else
    {
      float v6 = 0.0;
    }
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

void sub_100027030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100028368()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100044430;
  uint64_t v7 = qword_100044430;
  if (!qword_100044430)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100028984;
    v3[3] = &unk_10003D240;
    v3[4] = &v4;
    sub_100028984((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100028434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002844C()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)qword_100044440;
  uint64_t v9 = qword_100044440;
  if (!qword_100044440)
  {
    id v1 = sub_10002876C();
    v7[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyPlayCount");
    qword_100044440 = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyPlayCount(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"SMTPhoneticMatchHelper.m", 20, @"%s", dlerror());

    __break(1u);
  }
}

void sub_10002859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000285B4()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)qword_100044448;
  uint64_t v9 = qword_100044448;
  if (!qword_100044448)
  {
    id v1 = sub_10002876C();
    v7[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyLastPlayedDate");
    qword_100044448 = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyLastPlayedDate(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"SMTPhoneticMatchHelper.m", 19, @"%s", dlerror());

    __break(1u);
  }
}

void sub_100028704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10002871C(uint64_t a1)
{
  uint64_t v2 = sub_10002876C();
  uint64_t result = dlsym(v2, "MPMediaItemPropertyLastPlayedDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100044448 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002876C()
{
  v4[0] = 0;
  if (!qword_100044438)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_1000288C0;
    v4[4] = &unk_10003D278;
    v4[5] = v4;
    long long v5 = off_10003D260;
    uint64_t v6 = 0;
    qword_100044438 = _sl_dlopen();
  }
  v0 = (void *)qword_100044438;
  if (!qword_100044438)
  {
    v0 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"SMTPhoneticMatchHelper.m", 17, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000288C0()
{
  uint64_t result = _sl_dlopen();
  qword_100044438 = result;
  return result;
}

void *sub_100028934(uint64_t a1)
{
  uint64_t v2 = sub_10002876C();
  uint64_t result = dlsym(v2, "MPMediaItemPropertyPlayCount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100044440 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100028984(uint64_t a1)
{
  sub_10002876C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100044430 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMPMediaQueryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SMTPhoneticMatchHelper.m", 18, @"Unable to find class %s", "MPMediaQuery");

    __break(1u);
  }
}

uint64_t start()
{
  os_log_t v0 = os_log_create("com.apple.speech.speechmodeltraining", "daemon");
  id v1 = (void *)qword_100044458;
  qword_100044458 = (uint64_t)v0;

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v6 = (void *)qword_100044458;
    if (os_log_type_enabled((os_log_t)qword_100044458, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = v6;
      int v8 = *__error();
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed™: %{darwin.errno}d", (uint8_t *)v9, 8u);
    }
    exit(1);
  }
  id v2 = NSTemporaryDirectory();
  +[SMTUtils cleanupTemporaryDirectory];
  id v3 = objc_opt_new();
  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corespeech.speechmodeltraining.xpc"];
  [v4 setDelegate:v3];
  [v4 resume];
  CFRunLoopRun();

  return 0;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t OpusDecoder.init(destinationFormat:)()
{
  return OpusDecoder.init(destinationFormat:)();
}

uint64_t dispatch thunk of OpusDecoder.end()()
{
  return dispatch thunk of OpusDecoder.end()();
}

uint64_t dispatch thunk of OpusDecoder.decode(audio:)()
{
  return dispatch thunk of OpusDecoder.decode(audio:)();
}

uint64_t type metadata accessor for OpusDecoder()
{
  return type metadata accessor for OpusDecoder();
}

uint64_t AudioData.sampleCount.getter()
{
  return AudioData.sampleCount.getter();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return _AudioConverterDispose(inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return _AudioConverterFillComplexBuffer(inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return _AudioConverterNew(inSourceFormat, inDestinationFormat, outAudioConverter);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRunLoopRun(void)
{
}

uint64_t INTypedInteractionWithInteraction()
{
  return _INTypedInteractionWithInteraction();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_extract()
{
  return _archive_read_extract();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_filename()
{
  return _archive_read_open_filename();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_all()
{
  return _archive_read_support_format_all();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

float expf(float a1)
{
  return _expf(a1);
}

void free(void *a1)
{
}

long double log(long double __x)
{
  return _log(__x);
}

float logf(float a1)
{
  return _logf(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

void objc_copyWeak(id *to, id *from)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
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

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return [a1 absoluteTimestamp];
}

id objc_msgSend_addOsym(void *a1, const char *a2, ...)
{
  return [a1 addOsym];
}

id objc_msgSend_albumArtist(void *a1, const char *a2, ...)
{
  return [a1 albumArtist];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return [a1 albumTitle];
}

id objc_msgSend_alignedSourceIndex(void *a1, const char *a2, ...)
{
  return [a1 alignedSourceIndex];
}

id objc_msgSend_alignedTargetIndex(void *a1, const char *a2, ...)
{
  return [a1 alignedTargetIndex];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appIntentsStream(void *a1, const char *a2, ...)
{
  return [a1 appIntentsStream];
}

id objc_msgSend_applyRegexEnumerations(void *a1, const char *a2, ...)
{
  return [a1 applyRegexEnumerations];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_asbd(void *a1, const char *a2, ...)
{
  return [a1 asbd];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_audioData(void *a1, const char *a2, ...)
{
  return [a1 audioData];
}

id objc_msgSend_beginOfSentenceIndex(void *a1, const char *a2, ...)
{
  return [a1 beginOfSentenceIndex];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildAlignedLFst(void *a1, const char *a2, ...)
{
  return [a1 buildAlignedLFst];
}

id objc_msgSend_buildGFsts(void *a1, const char *a2, ...)
{
  return [a1 buildGFsts];
}

id objc_msgSend_buildLFst(void *a1, const char *a2, ...)
{
  return [a1 buildLFst];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cleanupTemporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 cleanupTemporaryDirectory];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_combineFsts(void *a1, const char *a2, ...)
{
  return [a1 combineFsts];
}

id objc_msgSend_composeLGFsts(void *a1, const char *a2, ...)
{
  return [a1 composeLGFsts];
}

id objc_msgSend_composer(void *a1, const char *a2, ...)
{
  return [a1 composer];
}

id objc_msgSend_composersQuery(void *a1, const char *a2, ...)
{
  return [a1 composersQuery];
}

id objc_msgSend_confusionPairs(void *a1, const char *a2, ...)
{
  return [a1 confusionPairs];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correctedTokens(void *a1, const char *a2, ...)
{
  return [a1 correctedTokens];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dataPointer(void *a1, const char *a2, ...)
{
  return [a1 dataPointer];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_delta(void *a1, const char *a2, ...)
{
  return [a1 delta];
}

id objc_msgSend_deltaIsPartial(void *a1, const char *a2, ...)
{
  return [a1 deltaIsPartial];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distanceThreshold(void *a1, const char *a2, ...)
{
  return [a1 distanceThreshold];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drawNoise(void *a1, const char *a2, ...)
{
  return [a1 drawNoise];
}

id objc_msgSend_editMethod(void *a1, const char *a2, ...)
{
  return [a1 editMethod];
}

id objc_msgSend_endOfSentenceIndex(void *a1, const char *a2, ...)
{
  return [a1 endOfSentenceIndex];
}

id objc_msgSend_endOfSentenceToken(void *a1, const char *a2, ...)
{
  return [a1 endOfSentenceToken];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorType(void *a1, const char *a2, ...)
{
  return [a1 errorType];
}

id objc_msgSend_evaluate(void *a1, const char *a2, ...)
{
  return [a1 evaluate];
}

id objc_msgSend_evaluatePartialDelta(void *a1, const char *a2, ...)
{
  return [a1 evaluatePartialDelta];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_expDecayPriors(void *a1, const char *a2, ...)
{
  return [a1 expDecayPriors];
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

id objc_msgSend_fromMe(void *a1, const char *a2, ...)
{
  return [a1 fromMe];
}

id objc_msgSend_getLimit(void *a1, const char *a2, ...)
{
  return [a1 getLimit];
}

id objc_msgSend_getLocale(void *a1, const char *a2, ...)
{
  return [a1 getLocale];
}

id objc_msgSend_getProns(void *a1, const char *a2, ...)
{
  return [a1 getProns];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_intentClass(void *a1, const char *a2, ...)
{
  return [a1 intentClass];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return [a1 interaction];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return [a1 isMe];
}

id objc_msgSend_isPunctuationDeletion(void *a1, const char *a2, ...)
{
  return [a1 isPunctuationDeletion];
}

id objc_msgSend_isPunctuationEdit(void *a1, const char *a2, ...)
{
  return [a1 isPunctuationEdit];
}

id objc_msgSend_isPunctuationInsertion(void *a1, const char *a2, ...)
{
  return [a1 isPunctuationInsertion];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_l2norm(void *a1, const char *a2, ...)
{
  return [a1 l2norm];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastDatabaseRowID(void *a1, const char *a2, ...)
{
  return [a1 lastDatabaseRowID];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_leftContext(void *a1, const char *a2, ...)
{
  return [a1 leftContext];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return [a1 loadData];
}

id objc_msgSend_loadOovs(void *a1, const char *a2, ...)
{
  return [a1 loadOovs];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_maxAge(void *a1, const char *a2, ...)
{
  return [a1 maxAge];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_minAge(void *a1, const char *a2, ...)
{
  return [a1 minAge];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nbestAlignmentSourceBound(void *a1, const char *a2, ...)
{
  return [a1 nbestAlignmentSourceBound];
}

id objc_msgSend_nbestAlignmentTargetBound(void *a1, const char *a2, ...)
{
  return [a1 nbestAlignmentTargetBound];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextOutgoingMessageBatch(void *a1, const char *a2, ...)
{
  return [a1 nextOutgoingMessageBatch];
}

id objc_msgSend_normalizePriors(void *a1, const char *a2, ...)
{
  return [a1 normalizePriors];
}

id objc_msgSend_numDeletion(void *a1, const char *a2, ...)
{
  return [a1 numDeletion];
}

id objc_msgSend_numInsertion(void *a1, const char *a2, ...)
{
  return [a1 numInsertion];
}

id objc_msgSend_numSubstitution(void *a1, const char *a2, ...)
{
  return [a1 numSubstitution];
}

id objc_msgSend_numberOfDataPoints(void *a1, const char *a2, ...)
{
  return [a1 numberOfDataPoints];
}

id objc_msgSend_numberSamples(void *a1, const char *a2, ...)
{
  return [a1 numberSamples];
}

id objc_msgSend_orthography(void *a1, const char *a2, ...)
{
  return [a1 orthography];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_placeholderCount(void *a1, const char *a2, ...)
{
  return [a1 placeholderCount];
}

id objc_msgSend_playlistsQuery(void *a1, const char *a2, ...)
{
  return [a1 playlistsQuery];
}

id objc_msgSend_pluginShouldAddNoiseAndEncryptResult(void *a1, const char *a2, ...)
{
  return [a1 pluginShouldAddNoiseAndEncryptResult];
}

id objc_msgSend_podcastTitle(void *a1, const char *a2, ...)
{
  return [a1 podcastTitle];
}

id objc_msgSend_podcastsQuery(void *a1, const char *a2, ...)
{
  return [a1 podcastsQuery];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_prons(void *a1, const char *a2, ...)
{
  return [a1 prons];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_queryLimit(void *a1, const char *a2, ...)
{
  return [a1 queryLimit];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_recognizedTokens(void *a1, const char *a2, ...)
{
  return [a1 recognizedTokens];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rightContext(void *a1, const char *a2, ...)
{
  return [a1 rightContext];
}

id objc_msgSend_roomForMoreData(void *a1, const char *a2, ...)
{
  return [a1 roomForMoreData];
}

id objc_msgSend_rowID(void *a1, const char *a2, ...)
{
  return [a1 rowID];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_sequence(void *a1, const char *a2, ...)
{
  return [a1 sequence];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return [a1 shape];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldStop(void *a1, const char *a2, ...)
{
  return [a1 shouldStop];
}

id objc_msgSend_shuffleSamples(void *a1, const char *a2, ...)
{
  return [a1 shuffleSamples];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skipClassification(void *a1, const char *a2, ...)
{
  return [a1 skipClassification];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return [a1 sources];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_strides(void *a1, const char *a2, ...)
{
  return [a1 strides];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_suggestedFilename(void *a1, const char *a2, ...)
{
  return [a1 suggestedFilename];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_taskIsDeferred(void *a1, const char *a2, ...)
{
  return [a1 taskIsDeferred];
}

id objc_msgSend_textSequence(void *a1, const char *a2, ...)
{
  return [a1 textSequence];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_train(void *a1, const char *a2, ...)
{
  return [a1 train];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unknownWordIndex(void *a1, const char *a2, ...)
{
  return [a1 unknownWordIndex];
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

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_uttId(void *a1, const char *a2, ...)
{
  return [a1 uttId];
}

id objc_msgSend_uttLengthThreshold(void *a1, const char *a2, ...)
{
  return [a1 uttLengthThreshold];
}

id objc_msgSend_validationError(void *a1, const char *a2, ...)
{
  return [a1 validationError];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_vocab(void *a1, const char *a2, ...)
{
  return [a1 vocab];
}

id objc_msgSend_vocabSize(void *a1, const char *a2, ...)
{
  return [a1 vocabSize];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_wordFrequency(void *a1, const char *a2, ...)
{
  return [a1 wordFrequency];
}

id objc_msgSend_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:");
}