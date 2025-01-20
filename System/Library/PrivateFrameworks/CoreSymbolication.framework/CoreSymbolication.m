void start()
{
  _xpc_connection_s *mach_service;
  uint8_t buf[4];
  uint64_t v2;

  qword_1000100E8 = time(0);
  if (sub_1000014DC())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.coresymbolicationd", 0, 1uLL);
    qword_1000100E0 = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &stru_10000C4F0);
      sub_100002C50();
      xpc_connection_resume((xpc_connection_t)qword_1000100E0);
      dispatch_main();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to acquire mach service port, exiting\n", buf, 2u);
    }
    fwrite("Unable to acquire mach service port, exiting\n", 0x2DuLL, 1uLL, __stderrp);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v2 = qword_1000100D8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to open storage at %s\n", buf, 0xCu);
    }
    fprintf(__stderrp, "Unable to open storage at %s\n", (const char *)qword_1000100D8);
  }
  sub_100002C20();
  exit(1);
}

BOOL sub_1000014DC()
{
  v0 = off_100010000;
  if (off_100010000) {
    BOOL v1 = qword_1000100D8 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (!off_100010000)
    {
      v0 = "/private/var/root/Library/Caches/com.apple.coresymbolicationd";
      off_100010000 = "/private/var/root/Library/Caches/com.apple.coresymbolicationd";
    }
    size_t v2 = strlen(v0);
    size_t v16 = 128;
    if (sysctlbyname("kern.osversion", __s, &v16, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine os version, exiting\n", buf, 2u);
      }
      fwrite("Unable to determine os version, exiting\n", 0x28uLL, 1uLL, __stderrp);
    }
    size_t v3 = v2 + strlen(__s) + 2;
    v4 = (char *)malloc_type_malloc(v3, 0xD8B5DBA5uLL);
    *(_WORD *)&v4[strlcpy(v4, off_100010000, v3)] = 47;
    strlcat(v4, __s, v3);
    qword_1000100D8 = (uint64_t)v4;
    if (!v4 || (v0 = off_100010000) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Out of memory", buf, 2u);
      }
      fwrite("Out of memory", 0xDuLL, 1uLL, __stderrp);
      return 0;
    }
  }
  v5 = strdup(v0);
  for (i = v5 + 1; *i == 47; ++i)
  {
    unsigned char *i = 0;
    if (mkdir(v5, 0x1C0u) == -1 && *__error() != 17) {
      goto LABEL_25;
    }
    unsigned char *i = 47;
LABEL_21:
    ;
  }
  if (*i) {
    goto LABEL_21;
  }
  if (*(i - 1) != 47 && mkdir(v5, 0x1C0u) == -1) {
    __error();
  }
LABEL_25:
  free(v5);
  v7 = opendir(off_100010000);
  v8 = v7;
  if (v7)
  {
    int v9 = dirfd(v7);
    for (j = readdir(v8); j; j = readdir(v8))
    {
      d_name = j->d_name;
      if (!strncmp(j->d_name, "grow.", 5uLL)) {
        unlinkat(v9, d_name, 0);
      }
    }
    closedir(v8);
  }
  *(void *)__s = 0;
  v18 = __s;
  uint64_t v19 = 0x2000000000;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = sub_100002EA4;
  v14[3] = &unk_10000C538;
  v14[4] = __s;
  sub_100002DC0((uint64_t)v14);
  BOOL v12 = v18[24] != 0;
  _Block_object_dispose(__s, 8);
  return v12;
}

void sub_100001828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001848(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100001B64;
    handler[3] = &unk_10000C510;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        string = xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Top level listener XPC_ERROR_CONNECTION_INVALID: %s\n", buf, 0xCu);
      }
      v6 = __stderrp;
      xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
      fprintf(v6, "Top level listener XPC_ERROR_CONNECTION_INVALID: %s\n");
    }
    else
    {
      BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (a2 == &_xpc_error_termination_imminent)
      {
        if (v4)
        {
          *(_DWORD *)buf = 136315138;
          string = xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s\n", buf, 0xCu);
        }
        v7 = __stderrp;
        xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
        fprintf(v7, "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s\n");
      }
      else
      {
        if (v4)
        {
          *(_DWORD *)buf = 136315138;
          string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Top level listener error: %s\n", buf, 0xCu);
        }
        v5 = __stderrp;
        xpc_dictionary_get_string(a2, _xpc_error_key_description);
        fprintf(v5, "Top level listener error: %s\n");
      }
    }
    sub_100002DC0((uint64_t)&stru_10000C6D8);
    xpc_transaction_exit_clean();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Top level event: Unhandled xpc type\n", buf, 2u);
    }
    fwrite("Top level event: Unhandled xpc type\n", 0x24uLL, 1uLL, __stderrp);
  }
}

void **sub_100001B64(uint64_t a1, void *a2)
{
  sub_100001BE0(a2, *(_xpc_connection_s **)(a1 + 32), &v6);
  if (*(void *)(a1 + 32) && sub_100009AA8((uint64_t)&v6))
  {
    size_t v3 = *(_xpc_connection_s **)(a1 + 32);
    BOOL v4 = (void *)sub_100009AA8((uint64_t)&v6);
    xpc_connection_send_message(v3, v4);
  }
  return sub_100009A70(&v6);
}

void sub_100001BCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100009A70((void **)va);
  _Unwind_Resume(a1);
}

xpc_object_t *sub_100001BE0@<X0>(xpc_object_t object@<X1>, _xpc_connection_s *a2@<X0>, xpc_object_t *a3@<X8>)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    return sub_100009AD0(a3);
  }
  else
  {
    if (a2)
    {
      uid_t euid = xpc_connection_get_euid(a2);
      sub_100009B08(&v109, object, 1);
      sub_100009BB4(&v109, a3);
    }
    else
    {
      uid_t euid = geteuid();
      sub_100009B08(&v109, object, 1);
      sub_100009AD0(a3);
    }
    switch(xpc_dictionary_get_uint64(object, "cmd"))
    {
      case 2uLL:
        sub_100009A2C(&v106, &v109);
        __p = 0;
        v111 = 0;
        v112 = 0;
        sub_100009B68(&v106, "filters", &v117);
        if (sub_100009AB0(&v117) && sub_100009AC0((xpc_type_t *)&v117) == (xpc_type_t)&_xpc_type_array)
        {
          sub_100009A2C(&region, (void **)&v117);
          size_t v8 = sub_100009C14(&region);
          if (v8)
          {
            size_t v9 = 0;
            for (i = 0; i < v8; size_t v9 = ++i)
            {
              sub_100009C2C(&region, v9, &v115);
              if (sub_100009AC0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_array)
              {
                sub_100009A2C(&v114, &v115);
                sub_1000056BC(&v118, &v114);
                sub_100009AA4(&v114);
                if (euid) {
                  LODWORD(v120[0]) = euid;
                }
                v11 = v111;
                if (v111 >= v112)
                {
                  size_t v16 = (__n128 *)__p;
                  uint64_t v17 = 0x6DB6DB6DB6DB6DB7 * (((char *)v111 - (unsigned char *)__p) >> 3);
                  unint64_t v18 = v17 + 1;
                  if ((unint64_t)(v17 + 1) > 0x492492492492492) {
                    sub_1000034E8();
                  }
                  if (0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3) > v18) {
                    unint64_t v18 = 0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3);
                  }
                  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((char *)v112 - (unsigned char *)__p) >> 3)) >= 0x249249249249249) {
                    unint64_t v19 = 0x492492492492492;
                  }
                  else {
                    unint64_t v19 = v18;
                  }
                  if (v19)
                  {
                    char v20 = (char *)sub_100003590((uint64_t)&v112, v19);
                    size_t v16 = (__n128 *)__p;
                    v11 = v111;
                  }
                  else
                  {
                    char v20 = 0;
                  }
                  v21 = &v20[56 * v17];
                  __n128 v22 = v118;
                  __n128 v23 = v119;
                  long long v24 = *(_OWORD *)v120;
                  *((void *)v21 + 6) = v121;
                  *((__n128 *)v21 + 1) = v23;
                  *((_OWORD *)v21 + 2) = v24;
                  *(__n128 *)v21 = v22;
                  if (v11 == v16)
                  {
                    v29 = &v20[56 * v17];
                  }
                  else
                  {
                    v25 = &v20[56 * v17];
                    do
                    {
                      long long v26 = *(long long *)((char *)&v11[-4] + 8);
                      long long v27 = *(long long *)((char *)&v11[-3] + 8);
                      long long v28 = *(long long *)((char *)&v11[-2] + 8);
                      v29 = v25 - 56;
                      *(v25 - 8) = v11[-1].n128_i8[8];
                      *(_OWORD *)(v25 - 24) = v28;
                      *(_OWORD *)(v25 - 40) = v27;
                      *(_OWORD *)(v25 - 56) = v26;
                      v11 = (__n128 *)((char *)v11 - 56);
                      v25 -= 56;
                    }
                    while (v11 != v16);
                  }
                  v15 = (unint64_t *)(v21 + 56);
                  __p = v29;
                  v111 = (__n128 *)(v21 + 56);
                  v112 = (__n128 *)&v20[56 * v19];
                  if (v16) {
                    operator delete(v16);
                  }
                }
                else
                {
                  __n128 v12 = v118;
                  __n128 v13 = v119;
                  __n128 v14 = *(__n128 *)v120;
                  v111[3].n128_u64[0] = v121;
                  v11[1] = v13;
                  v11[2] = v14;
                  __n128 *v11 = v12;
                  v15 = &v11[3].n128_u64[1];
                }
                v111 = (__n128 *)v15;
              }
              sub_100009AA4(&v115);
            }
          }
          sub_100009A70(&region);
        }
        v30 = __p;
        uint64_t v31 = (uint64_t)v111;
        if (__p == v111)
        {
          v32 = (__n128 *)sub_100005418();
          sub_100005558(&v118, v32, 0, euid, 0, 7u, 0xFFFFu);
          v33 = v111;
          if (v111 >= v112)
          {
            v74 = (__n128 *)__p;
            uint64_t v75 = 0x6DB6DB6DB6DB6DB7 * (((char *)v111 - (unsigned char *)__p) >> 3);
            unint64_t v76 = v75 + 1;
            if ((unint64_t)(v75 + 1) > 0x492492492492492) {
              sub_1000034E8();
            }
            if (0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3) > v76) {
              unint64_t v76 = 0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((char *)v112 - (unsigned char *)__p) >> 3)) >= 0x249249249249249) {
              unint64_t v77 = 0x492492492492492;
            }
            else {
              unint64_t v77 = v76;
            }
            if (v77)
            {
              v78 = (char *)sub_100003590((uint64_t)&v112, v77);
              v74 = (__n128 *)__p;
              v33 = v111;
            }
            else
            {
              v78 = 0;
            }
            v84 = &v78[56 * v75];
            __n128 v85 = v118;
            __n128 v86 = v119;
            long long v87 = *(_OWORD *)v120;
            v88 = &v78[56 * v77];
            *((void *)v84 + 6) = v121;
            *((__n128 *)v84 + 1) = v86;
            *((_OWORD *)v84 + 2) = v87;
            *(__n128 *)v84 = v85;
            uint64_t v31 = (uint64_t)(v84 + 56);
            if (v33 == v74)
            {
              v92 = v84;
            }
            else
            {
              do
              {
                long long v89 = *(long long *)((char *)&v33[-4] + 8);
                long long v90 = *(long long *)((char *)&v33[-3] + 8);
                long long v91 = *(long long *)((char *)&v33[-2] + 8);
                v92 = v84 - 56;
                *(v84 - 8) = v33[-1].n128_i8[8];
                *(_OWORD *)(v84 - 24) = v91;
                *(_OWORD *)(v84 - 40) = v90;
                *(_OWORD *)(v84 - 56) = v89;
                v33 = (__n128 *)((char *)v33 - 56);
                v84 -= 56;
              }
              while (v33 != v74);
            }
            __p = v92;
            v111 = (__n128 *)v31;
            v112 = (__n128 *)v88;
            if (v74) {
              operator delete(v74);
            }
          }
          else
          {
            __n128 v34 = v118;
            __n128 v35 = v119;
            __n128 v36 = *(__n128 *)v120;
            v111[3].n128_u64[0] = v121;
            v33[1] = v35;
            v33[2] = v36;
            __n128 *v33 = v34;
            uint64_t v31 = (uint64_t)&v33[3].n128_i64[1];
          }
          v111 = (__n128 *)v31;
          v30 = __p;
        }
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 1174405120;
        v119.n128_u64[0] = (unint64_t)sub_100003390;
        v119.n128_u64[1] = (unint64_t)&unk_10000C5D8;
        v120[1] = 0;
        unint64_t v121 = 0;
        v120[0] = 0;
        sub_100003610(v120, v30, v31, 0x6DB6DB6DB6DB6DB7 * ((v31 - (uint64_t)v30) >> 3));
        v122 = a3;
        sub_100002DC0((uint64_t)&v118);
        if (v120[0])
        {
          v120[1] = v120[0];
          operator delete(v120[0]);
        }
        sub_100009AA4(&v117);
        if (__p)
        {
          v111 = (__n128 *)__p;
          operator delete(__p);
        }
        v37 = &v106;
        goto LABEL_140;
      case 3uLL:
        sub_100009A2C(&v105, &v109);
        __p = 0;
        v111 = 0;
        v112 = 0;
        sub_100009B68(&v105, "filters", &v117);
        if (sub_100009AB0(&v117) && sub_100009AC0((xpc_type_t *)&v117) == (xpc_type_t)&_xpc_type_array)
        {
          sub_100009A2C(&region, (void **)&v117);
          size_t v42 = sub_100009C14(&region);
          if (v42)
          {
            size_t v43 = 0;
            for (j = 0; j < v42; size_t v43 = ++j)
            {
              sub_100009C2C(&region, v43, &v115);
              if (sub_100009AC0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_array)
              {
                sub_100009A2C(&v114, &v115);
                sub_1000056BC(&v118, &v114);
                sub_100009AA4(&v114);
                if (euid) {
                  LODWORD(v120[0]) = euid;
                }
                v45 = v111;
                if (v111 >= v112)
                {
                  v50 = (__n128 *)__p;
                  uint64_t v51 = 0x6DB6DB6DB6DB6DB7 * (((char *)v111 - (unsigned char *)__p) >> 3);
                  unint64_t v52 = v51 + 1;
                  if ((unint64_t)(v51 + 1) > 0x492492492492492) {
                    sub_1000034E8();
                  }
                  if (0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3) > v52) {
                    unint64_t v52 = 0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3);
                  }
                  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((char *)v112 - (unsigned char *)__p) >> 3)) >= 0x249249249249249) {
                    unint64_t v53 = 0x492492492492492;
                  }
                  else {
                    unint64_t v53 = v52;
                  }
                  if (v53)
                  {
                    v54 = (char *)sub_100003590((uint64_t)&v112, v53);
                    v50 = (__n128 *)__p;
                    v45 = v111;
                  }
                  else
                  {
                    v54 = 0;
                  }
                  v55 = &v54[56 * v51];
                  __n128 v56 = v118;
                  __n128 v57 = v119;
                  long long v58 = *(_OWORD *)v120;
                  *((void *)v55 + 6) = v121;
                  *((__n128 *)v55 + 1) = v57;
                  *((_OWORD *)v55 + 2) = v58;
                  *(__n128 *)v55 = v56;
                  if (v45 == v50)
                  {
                    v63 = &v54[56 * v51];
                  }
                  else
                  {
                    v59 = &v54[56 * v51];
                    do
                    {
                      long long v60 = *(long long *)((char *)&v45[-4] + 8);
                      long long v61 = *(long long *)((char *)&v45[-3] + 8);
                      long long v62 = *(long long *)((char *)&v45[-2] + 8);
                      v63 = v59 - 56;
                      *(v59 - 8) = v45[-1].n128_i8[8];
                      *(_OWORD *)(v59 - 24) = v62;
                      *(_OWORD *)(v59 - 40) = v61;
                      *(_OWORD *)(v59 - 56) = v60;
                      v45 = (__n128 *)((char *)v45 - 56);
                      v59 -= 56;
                    }
                    while (v45 != v50);
                  }
                  v49 = (unint64_t *)(v55 + 56);
                  __p = v63;
                  v111 = (__n128 *)(v55 + 56);
                  v112 = (__n128 *)&v54[56 * v53];
                  if (v50) {
                    operator delete(v50);
                  }
                }
                else
                {
                  __n128 v46 = v118;
                  __n128 v47 = v119;
                  __n128 v48 = *(__n128 *)v120;
                  v111[3].n128_u64[0] = v121;
                  v45[1] = v47;
                  v45[2] = v48;
                  __n128 *v45 = v46;
                  v49 = &v45[3].n128_u64[1];
                }
                v111 = (__n128 *)v49;
              }
              sub_100009AA4(&v115);
            }
          }
          sub_100009A70(&region);
        }
        if (euid) {
          BOOL v64 = 0;
        }
        else {
          BOOL v64 = sub_100009B48(&v105, "should_delete_precached") == 1;
        }
        v66 = __p;
        uint64_t v67 = (uint64_t)v111;
        if (__p == v111)
        {
          v68 = (__n128 *)sub_100005418();
          sub_100005558(&v118, v68, 0, euid, 0, 7u, 0xFFFFu);
          v69 = v111;
          if (v111 >= v112)
          {
            v79 = (__n128 *)__p;
            uint64_t v80 = 0x6DB6DB6DB6DB6DB7 * (((char *)v111 - (unsigned char *)__p) >> 3);
            unint64_t v81 = v80 + 1;
            if ((unint64_t)(v80 + 1) > 0x492492492492492) {
              sub_1000034E8();
            }
            if (0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3) > v81) {
              unint64_t v81 = 0xDB6DB6DB6DB6DB6ELL * (((char *)v112 - (unsigned char *)__p) >> 3);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((char *)v112 - (unsigned char *)__p) >> 3)) >= 0x249249249249249) {
              unint64_t v82 = 0x492492492492492;
            }
            else {
              unint64_t v82 = v81;
            }
            if (v82)
            {
              v83 = (char *)sub_100003590((uint64_t)&v112, v82);
              v79 = (__n128 *)__p;
              v69 = v111;
            }
            else
            {
              v83 = 0;
            }
            v93 = &v83[56 * v80];
            __n128 v94 = v118;
            __n128 v95 = v119;
            long long v96 = *(_OWORD *)v120;
            v97 = &v83[56 * v82];
            *((void *)v93 + 6) = v121;
            *((__n128 *)v93 + 1) = v95;
            *((_OWORD *)v93 + 2) = v96;
            *(__n128 *)v93 = v94;
            uint64_t v67 = (uint64_t)(v93 + 56);
            if (v69 == v79)
            {
              v101 = v93;
            }
            else
            {
              do
              {
                long long v98 = *(long long *)((char *)&v69[-4] + 8);
                long long v99 = *(long long *)((char *)&v69[-3] + 8);
                long long v100 = *(long long *)((char *)&v69[-2] + 8);
                v101 = v93 - 56;
                *(v93 - 8) = v69[-1].n128_i8[8];
                *(_OWORD *)(v93 - 24) = v100;
                *(_OWORD *)(v93 - 40) = v99;
                *(_OWORD *)(v93 - 56) = v98;
                v69 = (__n128 *)((char *)v69 - 56);
                v93 -= 56;
              }
              while (v69 != v79);
            }
            __p = v101;
            v111 = (__n128 *)v67;
            v112 = (__n128 *)v97;
            if (v79) {
              operator delete(v79);
            }
          }
          else
          {
            __n128 v70 = v118;
            __n128 v71 = v119;
            __n128 v72 = *(__n128 *)v120;
            v111[3].n128_u64[0] = v121;
            v69[1] = v71;
            v69[2] = v72;
            __n128 *v69 = v70;
            uint64_t v67 = (uint64_t)&v69[3].n128_i64[1];
          }
          v111 = (__n128 *)v67;
          v66 = __p;
        }
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 1174405120;
        v119.n128_u64[0] = (unint64_t)sub_1000036E4;
        v119.n128_u64[1] = (unint64_t)&unk_10000C608;
        v120[1] = 0;
        unint64_t v121 = 0;
        v120[0] = 0;
        sub_100003610(v120, v66, v67, 0x6DB6DB6DB6DB6DB7 * ((v67 - (uint64_t)v66) >> 3));
        LOBYTE(v123) = v64;
        v122 = a3;
        sub_100002DC0((uint64_t)&v118);
        if (v120[0])
        {
          v120[1] = v120[0];
          operator delete(v120[0]);
        }
        sub_100009AA4(&v117);
        if (__p)
        {
          v111 = (__n128 *)__p;
          operator delete(__p);
        }
        v37 = &v105;
        goto LABEL_140;
      case 4uLL:
        sub_100009A2C(&v104, &v109);
        sub_100009B68(&v104, "entry", &__p);
        if (sub_100009AB0(&__p) && sub_100009AC0((xpc_type_t *)&__p) == (xpc_type_t)&_xpc_type_array)
        {
          v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
          v118.n128_u64[1] = 1174405120;
          v119.n128_u64[0] = (unint64_t)sub_1000037F8;
          v119.n128_u64[1] = (unint64_t)&unk_10000C638;
          sub_100009A2C(v120, &__p);
          LODWORD(v121) = euid;
          v120[1] = a3;
          sub_100002DC0((uint64_t)&v118);
          sub_100009AA4(v120);
        }
        sub_100009AA4(&__p);
        v37 = &v104;
        goto LABEL_140;
      case 5uLL:
        sub_100009A2C(&v103, &v109);
        region = 0;
        v117 = 0;
        sub_100009B68(&v103, "archive_shmem", &v115);
        if (sub_100009AA8((uint64_t)&v115)
          && sub_100009AC0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_shmem
          && (v73 = (void *)sub_100009AA8((uint64_t)&v115),
              v39 = (__n128 *)xpc_shmem_map(v73, &region),
              (v117 = v39) != 0))
        {
          v40 = region;
          v38 = (unsigned int *)region;
        }
        else
        {
          region = 0;
          v38 = (unsigned int *)sub_100009B58(&v103, "archive", (size_t *)&v117);
          v40 = region;
          v39 = v117;
        }
        __p = v40;
        v111 = v39;
        if (v38)
        {
          if ((unint64_t)v39 >= v38[1])
          {
            sub_100009B68(&v103, "entry", &v114);
            if (sub_100009AB0(&v114) && sub_100009AC0((xpc_type_t *)&v114) == (xpc_type_t)&_xpc_type_array)
            {
              sub_100009A2C(&v113, &v114);
              if (sub_100009C14(&v113) < 6)
              {
                sub_100009B40(a3, "write_errno", 6uLL);
              }
              else
              {
                v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
                v118.n128_u64[1] = 1174405120;
                v119.n128_u64[0] = (unint64_t)sub_100003DFC;
                v119.n128_u64[1] = (unint64_t)&unk_10000C668;
                sub_100009A2C(v120, &v114);
                uid_t v123 = euid;
                v120[1] = v38;
                unint64_t v121 = (unint64_t)v117;
                v122 = a3;
                sub_100002DC0((uint64_t)&v118);
                sub_100009AA4(v120);
              }
              sub_100009A70(&v113);
            }
            sub_100009AA4(&v114);
          }
          else
          {
            sub_100009B40(a3, "write_errno", 6uLL);
          }
        }
        sub_100004180((uint64_t)&__p);
        sub_100009AA4(&v115);
        v37 = &v103;
        goto LABEL_140;
      case 6uLL:
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 0x40000000;
        v119.n128_u64[0] = (unint64_t)sub_100003238;
        v119.n128_u64[1] = (unint64_t)&unk_10000C558;
        v120[0] = a3;
        sub_100002DC0((uint64_t)&v118);
        return sub_100009A70(&v109);
      case 7uLL:
        sub_100009A2C(&v108, &v109);
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 0x40000000;
        v119.n128_u64[0] = (unint64_t)sub_100003308;
        v119.n128_u64[1] = (unint64_t)&unk_10000C578;
        v120[0] = a3;
        sub_100002DC0((uint64_t)&v118);
        v37 = &v108;
        goto LABEL_140;
      case 8uLL:
        sub_100009A2C(&v107, &v109);
        global_queue = dispatch_get_global_queue(0, 0);
        dispatch_async(global_queue, &stru_10000C5B8);
        v37 = &v107;
        goto LABEL_140;
      case 9uLL:
        sub_100009A2C(&v102, &v109);
        v41 = (void *)sub_100009B48(&v102, "free_capacity");
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 0x40000000;
        v119.n128_u64[0] = (unint64_t)sub_1000041BC;
        v119.n128_u64[1] = (unint64_t)&unk_10000C698;
        v120[0] = v41;
        v120[1] = a3;
        sub_100002DC0((uint64_t)&v118);
        v37 = &v102;
LABEL_140:
        sub_100009A70(v37);
        break;
      default:
        return sub_100009A70(&v109);
    }
    return sub_100009A70(&v109);
  }
}

void sub_100002A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, void *a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,int a26,void *a27,void *__p,uint64_t a29,uint64_t a30,void *a31,__int16 a32,char a33,char a34,int a35,__int16 a36,char a37,char a38,int a39,__int16 a40,char a41,char a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52)
{
  sub_100009AA4(v53);
  sub_100009A70(&a31);
  sub_100009AA4(&a32);
  sub_100004180((uint64_t)&__p);
  sub_100009AA4(&a36);
  sub_100009A70(&a12);
  sub_100009A70(v52);
  sub_100009A70(&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_100002C20()
{
  sub_100002DC0((uint64_t)&stru_10000C6D8);

  return xpc_transaction_exit_clean();
}

void sub_100002C50()
{
  v0 = dlopen("/System/Library/PrivateFrameworks/CacheDelete.framework/CacheDelete", 1);
  if (v0)
  {
    BOOL v1 = (unsigned int (*)(const __CFString *, Block_layout *, Block_layout *, Block_layout *, Block_layout *))dlsym(v0, "CacheDeleteRegisterInfoCallbacks");
    if (v1)
    {
      if (!v1(@"com.apple.coresymbolicationd.cache-delete", &stru_10000C718, &stru_10000C758, &stru_10000C798, &stru_10000C758))return; {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      }
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to register with deleted", v5, 2u);
      }
      size_t v2 = __stderrp;
      size_t v3 = "Failed to register with deleted";
      size_t v4 = 31;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to load symbols from CacheDelete framework", v6, 2u);
      }
      size_t v2 = __stderrp;
      size_t v3 = "Failed to load symbols from CacheDelete framework";
      size_t v4 = 49;
    }
    fwrite(v3, v4, 1uLL, v2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Unable to load CacheDelete framework\n", buf, 2u);
  }
}

uint64_t sub_100002DC0(uint64_t a1)
{
  pthread_mutex_lock(&stru_100010008);
  (*(void (**)(uint64_t, uint64_t *))(a1 + 16))(a1, &qword_100010100);
  if (qword_100010100) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = qword_1000100E0 == 0;
  }
  if (!v2)
  {
    xpc_connection_cancel((xpc_connection_t)qword_1000100E0);
    qword_1000100E0 = 0;
  }
  return pthread_mutex_unlock(&stru_100010008);
}

void sub_100002E38(_Unwind_Exception *a1)
{
}

uint64_t sub_100002E54(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_1000061CC();
    operator delete();
  }
  return result;
}

void sub_100002EA4()
{
}

void sub_1000031F4()
{
}

void sub_100003224(void *a1)
{
}

void sub_100003238(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = 0;
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  sub_100006220(*a2, (_DWORD *)&v7 + 1, &v7, &v6, (uint64_t *)&v5);
  time_t v3 = time(0);
  double v4 = difftime(v3, qword_1000100E8);
  sub_100009B40(*(xpc_object_t **)(a1 + 32), "version", HIDWORD(v7));
  sub_100009B40(*(xpc_object_t **)(a1 + 32), "capacity", v7);
  sub_100009B40(*(xpc_object_t **)(a1 + 32), "count", v6);
  sub_100009B40(*(xpc_object_t **)(a1 + 32), "bytes_total", v5);
  sub_100009B50(*(xpc_object_t **)(a1 + 32), "uptime", v4);
}

void sub_100003308(uint64_t a1, pthread_mutex_t **a2)
{
  if (*a2 && sub_100005CDC(*a2)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  double v4 = *(xpc_object_t **)(a1 + 32);

  sub_100009B40(v4, "is_valid", v3);
}

void sub_100003360(id a1)
{
  sub_100002DC0((uint64_t)&stru_10000C6D8);

  xpc_transaction_exit_clean();
}

void **sub_100003390(void **result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009BE0(&v12);
    sub_100006790(*a2, (uint64_t *)v3 + 4, (uint64_t)&v10);
    double v4 = v10;
    uint64_t v5 = v11;
    if (v10 != v11)
    {
      do
      {
        sub_1000057A0(v4, &v9);
        unsigned int v6 = (void *)sub_100009AA8((uint64_t)&v9);
        sub_100009C1C(&v12, v6);
        sub_100009AA4(&v9);
        double v4 = (int8x16_t *)((char *)v4 + 56);
      }
      while (v4 != v5);
      double v4 = v10;
    }
    if (v4)
    {
      v11 = v4;
      operator delete(v4);
    }
    uint64_t v7 = (xpc_object_t *)v3[7];
    size_t v8 = (void *)sub_100009AA8((uint64_t)&v12);
    sub_100009B60(v7, "results", v8);
    return sub_100009A70(&v12);
  }
  return result;
}

void sub_100003460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, uint64_t a13, void *a14)
{
}

void *sub_1000034A0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  BOOL v2 = (void *)(a1 + 32);
  v2[2] = 0;
  return sub_100003610(v2, *(const void **)(a2 + 32), *(void *)(a2 + 40), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3));
}

void sub_1000034D0(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

void sub_1000034E8()
{
}

void sub_100003500(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000355C(exception, a1);
}

void sub_100003548(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000355C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100003590(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    sub_1000035DC();
  }
  return operator new(56 * a2);
}

void sub_1000035DC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  BOOL v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100003610(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unsigned int v6 = result;
    uint64_t result = sub_10000368C(result, a4);
    uint64_t v7 = v6[1];
    uint64_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8 - 7);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100003670(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000368C(void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    sub_1000034E8();
  }
  uint64_t result = (char *)sub_100003590((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

void **sub_1000036E4(void **result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009BE0(&v12);
    sub_100006DD4(*a2, (uint64_t)(v3 + 4), *((unsigned __int8 *)v3 + 64), &v10);
    uint64_t v4 = v10;
    uint64_t v5 = v11;
    if (v10 != v11)
    {
      do
      {
        sub_1000057A0(v4, &v9);
        unsigned int v6 = (void *)sub_100009AA8((uint64_t)&v9);
        sub_100009C1C(&v12, v6);
        sub_100009AA4(&v9);
        uint64_t v4 = (int8x16_t *)((char *)v4 + 56);
      }
      while (v4 != v5);
      uint64_t v4 = v10;
    }
    if (v4)
    {
      v11 = v4;
      operator delete(v4);
    }
    uint64_t v7 = (xpc_object_t *)v3[7];
    uint64_t v8 = (void *)sub_100009AA8((uint64_t)&v12);
    sub_100009B60(v7, "results", v8);
    return sub_100009A70(&v12);
  }
  return result;
}

void sub_1000037B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, uint64_t a13, void *a14)
{
}

uint64_t sub_1000037F8(uint64_t result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009A2C(&v4, (void **)(result + 32));
    sub_1000056BC(v5, &v4);
    sub_100009AA4(&v4);
    if (*(_DWORD *)(v3 + 48)) {
      int v6 = *(_DWORD *)(v3 + 48);
    }
    uint64_t result = sub_10000644C(*a2, (uint64_t)v5);
    if (result)
    {
      uint64_t result = sub_1000063FC(*a2, (uint64_t)v5);
      if (result) {
        return sub_1000038D0(*(xpc_object_t **)(v3 + 40), a2, (uint64_t)v5);
      }
    }
  }
  return result;
}

void sub_1000038B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100009AA4(va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000038D0(xpc_object_t *a1, uint64_t *a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(*a2 + 64);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v24 = *(unsigned int *)(a3 + 36);
  uint64_t v8 = v7 & 0x3FFF;
  size_t v9 = ((v7 + v24 + 0x3FFF) & 0xFFFFFFFFFFFFC000) - (v7 & 0xFFFFFFFFFFFFC000);
  v23[1] = v9;
  v23[2] = v8;
  v10 = (char *)mmap(0, v9, 1, 1, v6, v7 & 0xFFFFFFFFFFFFC000);
  v23[0] = v10;
  if (v10 == (char *)-1) {
    goto LABEL_12;
  }
  v11 = v10;
  __n128 v12 = (int32x4_t *)&v10[v8];
  if (v12 == (int32x4_t *)-1) {
    goto LABEL_12;
  }
  if (!v12->i32[1] || (__int32 v13 = v12[3].i32[0], v13 != sub_100003ACC(v12)) || !sub_100003AE8(v12))
  {
    size_t v16 = operator new(0x38uLL);
    v21 = (char *)v16 + 56;
    __n128 v22 = (char *)v16 + 56;
    long long v17 = *(_OWORD *)(a3 + 16);
    *size_t v16 = *(_OWORD *)a3;
    v16[1] = v17;
    v16[2] = *(_OWORD *)(a3 + 32);
    *((unsigned char *)v16 + 48) = *(unsigned char *)(a3 + 48);
    char v20 = v16;
    sub_100006DD4(*a2, (uint64_t)&v20, 1u, __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    sub_100009B40(a1, "write_errno", 6uLL);
    if (v20)
    {
      v21 = v20;
      operator delete(v20);
    }
    goto LABEL_12;
  }
  xpc_object_t v14 = xpc_shmem_create(v11, v9);
  if (!v14)
  {
LABEL_12:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  sub_100009B60(a1, "shmem", v14);
  sub_100009B40(a1, "major_version", *(unsigned __int16 *)(a3 + 44));
  sub_100009B40(a1, "minor_version", *(unsigned __int16 *)(a3 + 46));
  xpc_release(v14);
  uint64_t v15 = 1;
LABEL_13:
  sub_100003DC0((uint64_t)v23);
  return v15;
}

void sub_100003A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
}

void **sub_100003AB8(uint64_t a1, uint64_t a2)
{
  return sub_100009A2C((void **)(a1 + 32), (void **)(a2 + 32));
}

uint64_t sub_100003AC4(uint64_t a1)
{
  return sub_100009AA4(a1 + 32);
}

uint64_t sub_100003ACC(int32x4_t *a1)
{
  return vaddvq_s32(vaddq_s32(vaddq_s32(*a1, a1[1]), a1[2]));
}

BOOL sub_100003AE8(_DWORD *a1)
{
  BOOL v2 = a1 + 24;
  unint64_t v3 = (unint64_t)a1
     + 32 * a1[2]
     + 24 * a1[3]
     + (24 * a1[4])
     + (unint64_t)(4 * a1[4])
     + (36 * a1[5])
     + (20 * a1[6])
     + a1[22]
     + a1[20]
     + 96;
  unint64_t v4 = sub_100003C68(a1);
  unint64_t v5 = sub_100003CD0(a1);
  if (v5)
  {
    if (v5 < v3 || v5 >= v4) {
      return 0;
    }
  }
  unint64_t v7 = sub_100003D48(a1);
  if (v7)
  {
    if (v7 < v3 || v7 >= v4) {
      return 0;
    }
  }
  v10 = (char *)v2 + 32 * a1[2] + (24 * a1[3]);
  int v11 = a1[4];
  __n128 v12 = &v10[24 * v11];
  __int32 v13 = &v12[(36 * a1[5]) + (unint64_t)(20 * a1[6])];
  uint64_t v14 = a1[22];
  uint64_t v15 = (unsigned int *)&v13[v14];
  if (v14)
  {
    size_t v16 = (unsigned int *)&v12[(36 * a1[5]) + (unint64_t)(20 * a1[6])];
    do
    {
      unint64_t v17 = (unint64_t)&v13[-*v16];
      if (v17 >= (unint64_t)v12 || v17 < (unint64_t)v10) {
        return 0;
      }
      ++v16;
      v13 += 4;
    }
    while (v16 != v15);
  }
  uint64_t v19 = (4 * v11);
  if (!v19) {
    return 1;
  }
  char v20 = (unsigned int *)((char *)v15 + v19);
  v21 = v15 + 1;
  do
  {
    __n128 v22 = (char *)v15 - *(v21 - 1);
    BOOL result = v22 < v12 && v22 >= v10;
    BOOL v24 = !result || v21++ == v20;
    ++v15;
  }
  while (!v24);
  return result;
}

unint64_t sub_100003C68(_DWORD *a1)
{
  return (unint64_t)a1
       + 32 * a1[2]
       + 24 * a1[3]
       + (24 * a1[4])
       + (unint64_t)(4 * a1[4])
       + (36 * a1[5])
       + (20 * a1[6])
       + a1[22]
       + a1[20]
       + a1[21]
       + 96;
}

unint64_t sub_100003CD0(_DWORD *a1)
{
  uint64_t v1 = a1[10];
  if (v1) {
    return (unint64_t)a1
  }
         + v1
         + (32 * a1[2])
         + (24 * a1[3])
         + (24 * a1[4])
         + (4 * a1[4])
         + (36 * a1[5])
         + (20 * a1[6])
         + a1[22]
         + a1[20]
         + 96;
  else {
    return 0;
  }
}

unint64_t sub_100003D48(_DWORD *a1)
{
  uint64_t v1 = a1[11];
  if (v1) {
    return (unint64_t)a1
  }
         + v1
         + (32 * a1[2])
         + (24 * a1[3])
         + (24 * a1[4])
         + (4 * a1[4])
         + (36 * a1[5])
         + (20 * a1[6])
         + a1[22]
         + a1[20]
         + 96;
  else {
    return 0;
  }
}

uint64_t sub_100003DC0(uint64_t a1)
{
  BOOL v2 = *(void **)a1;
  if (v2 != (void *)-1) {
    munmap(v2, *(void *)(a1 + 8));
  }
  return a1;
}

void sub_100003DFC(uint64_t a1, uint64_t *a2)
{
  if (*a2)
  {
    sub_100009A2C(&v9, (void **)(a1 + 32));
    sub_1000056BC(v12, &v9);
    sub_100009AA4(&v9);
    if (*(_DWORD *)(a1 + 64) || v13 == -1) {
      int v13 = *(_DWORD *)(a1 + 64);
    }
    int v4 = sub_100007018(*a2, (long long *)v12[0].i8, *(int32x4_t **)(a1 + 40), *(void *)(a1 + 48));
    if (v4 == 3)
    {
      if ((byte_1000100F8 & 1) == 0)
      {
        snprintf(__str, 0x400uLL, "%s/grow.XXXXXXX", off_100010000);
        int v5 = mkstemp(__str);
        uint64_t v11 = 0;
        if (v5 != -1)
        {
          pthread_mutex_lock((pthread_mutex_t *)*a2);
          operator new();
        }
        byte_1000100F8 = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to grow coresymbolicationd storage; will not attempt again unless daemon respawns\n",
            buf,
            2u);
        }
        fwrite("Unable to grow coresymbolicationd storage; will not attempt again unless daemon respawns\n",
          0x59uLL,
          1uLL,
          __stderrp);
        uint64_t v6 = v11;
        uint64_t v11 = 0;
        if (v6)
        {
          sub_1000061CC();
          operator delete();
        }
      }
      int v4 = sub_100007018(*a2, (long long *)v12[0].i8, *(int32x4_t **)(a1 + 40), *(void *)(a1 + 48));
    }
    sub_100009B40(*(xpc_object_t **)(a1 + 56), "write_errno", v4);
    if (!v4)
    {
      if (sub_1000038D0(*(xpc_object_t **)(a1 + 56), a2, (uint64_t)v12))
      {
        unint64_t v7 = *(xpc_object_t **)(a1 + 56);
        sub_1000057A0(v12, __str);
        uint64_t v8 = (void *)sub_100009AA8((uint64_t)__str);
        sub_100009B60(v7, "results", v8);
        sub_100009AA4(__str);
      }
    }
  }
}

void sub_1000040F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  if (a2) {
    sub_100003224(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100004180(uint64_t a1)
{
  BOOL v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    munmap(v2, *(void *)(a1 + 8));
  }
  return a1;
}

void sub_1000041BC(uint64_t a1, uint64_t *a2)
{
  if (*a2)
  {
    sub_100006EF4(*a2, *(void *)(a1 + 32), __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    sub_100009B40(*(xpc_object_t **)(a1 + 40), "success", 1uLL);
  }
}

void sub_10000421C(id a1, void *a2)
{
}

__CFDictionary *__cdecl sub_100004228(id a1, int a2, __CFDictionary *a3)
{
  int v4 = sub_10000431C(a3);
  if (sub_100004694((uint64_t)v4))
  {
    uint64_t v8 = 0;
    size_t v9 = &v8;
    uint64_t v10 = 0x2000000000;
    uint64_t v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_1000047C4;
    v7[3] = &unk_10000C7C0;
    v7[4] = &v8;
    sub_100002DC0((uint64_t)v7);
    unint64_t v5 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    unint64_t v5 = 0;
  }
  free(v4);
  return sub_1000043DC(a3, v5);
}

void sub_100004304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_10000431C(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"CACHE_DELETE_VOLUME");
  if (!Value) {
    return 0;
  }
  CFStringRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID()) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(v4);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  uint64_t v8 = (char *)malloc_type_calloc(1uLL, MaximumSizeForEncoding + 1, 0x98AB91C8uLL);
  if (v8) {
    CFStringGetCString(v4, v8, MaximumSizeForEncoding, 0x8000100u);
  }
  return v8;
}

CFDictionaryRef sub_1000043DC(const void *a1, unint64_t a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFStringRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a1, @"CACHE_DELETE_VOLUME");
  if (!Value) {
    return 0;
  }
  uint64_t v6 = Value;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 < 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = a2;
  }
  uint64_t valuePtr = v7;
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)off_10000C808;
  values[0] = v6;
  values[1] = v8;
  CFDictionaryRef v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v8);
  return v9;
}

__CFDictionary *__cdecl sub_1000044DC(id a1, int a2, __CFDictionary *a3)
{
  CFTypeID v4 = sub_10000431C(a3);
  uint64_t valuePtr = 0;
  if (v4)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"CACHE_DELETE_AMOUNT");
    if (Value)
    {
      CFNumberRef v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      if (v7 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
        {
          uint64_t v8 = valuePtr;
          if (sub_100004694((uint64_t)v4))
          {
            uint64_t v19 = 0;
            char v20 = &v19;
            uint64_t v21 = 0x2000000000;
            uint64_t v22 = 0;
            *(void *)buf = _NSConcreteStackBlock;
            uint64_t v14 = 0x40000000;
            uint64_t v15 = sub_1000049C4;
            size_t v16 = &unk_10000C820;
            unint64_t v17 = &v19;
            uint64_t v18 = v8;
            sub_100002DC0((uint64_t)buf);
            unint64_t v9 = v20[3];
            _Block_object_dispose(&v19, 8);
          }
          else
          {
            unint64_t v9 = 0;
          }
LABEL_10:
          free(v4);
          unint64_t v10 = v9;
          return sub_1000043DC(a3, v10);
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Bad value or no value for CACHE_DELETE_AMOUNT_KEY", buf, 2u);
  }
  fwrite("Bad value or no value for CACHE_DELETE_AMOUNT_KEY", 0x31uLL, 1uLL, __stderrp);
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  if (v4) {
    goto LABEL_10;
  }
  return sub_1000043DC(a3, v10);
}

void sub_100004678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100004694(uint64_t a1)
{
  if (a1)
  {
    *(void *)buf = 0;
    CFTypeID v5 = buf;
    uint64_t v6 = 0x2000000000;
    char v7 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 0x40000000;
    v3[2] = sub_1000047FC;
    v3[3] = &unk_10000C7E8;
    v3[4] = buf;
    v3[5] = a1;
    sub_100002DC0((uint64_t)v3);
    BOOL v1 = v5[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CacheDelete request with no volume", buf, 2u);
    }
    fwrite("CacheDelete request with no volume", 0x22uLL, 1uLL, __stderrp);
    return 0;
  }
  return v1;
}

void sub_1000047AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000047C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (*a2)
  {
    uint64_t result = sub_1000062B4(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t sub_1000047FC(uint64_t result, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v2 = result;
    uint64_t result = *(unsigned int *)(*(void *)a2 + 64);
    if ((result & 0x80000000) == 0)
    {
      if (fstat(result, &v12))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          unint64_t v3 = __error();
          CFTypeID v4 = strerror(*v3);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to stat coresymbolicationd cache: %s", (uint8_t *)&buf, 0xCu);
        }
        CFTypeID v5 = __stderrp;
        uint64_t v6 = __error();
        strerror(*v6);
        return fprintf(v5, "Failed to stat coresymbolicationd cache: %s");
      }
      else
      {
        uint64_t result = stat(*(const char **)(v2 + 40), &buf);
        if (result)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = *(void *)(v2 + 40);
            uint64_t v8 = __error();
            unint64_t v9 = strerror(*v8);
            *(_DWORD *)int v13 = 136315394;
            uint64_t v14 = v7;
            __int16 v15 = 2080;
            size_t v16 = v9;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to stat volume %s: %s", v13, 0x16u);
          }
          unint64_t v10 = __stderrp;
          uint64_t v11 = __error();
          strerror(*v11);
          return fprintf(v10, "Failed to stat volume %s: %s");
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = v12.st_dev == buf.st_dev;
        }
      }
    }
  }
  return result;
}

size_t sub_1000049C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v10 = 0;
  int v9 = 0;
  unint64_t v8 = 0;
  if (*a2)
  {
    sub_100006220(*a2, (_DWORD *)&v10 + 1, &v10, &v9, (uint64_t *)&v8);
    sub_100006EF4(*a2, *(void *)(a1 + 40), __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v6[0] = 0;
    size_t result = sub_100006220(*a2, (_DWORD *)&v10 + 1, &v10, &v9, v6);
    unint64_t v5 = v8 - v6[0];
    if (v8 < v6[0]) {
      unint64_t v5 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Compaction failed during CacheDelete purge", (uint8_t *)v6, 2u);
    }
    return fwrite("Compaction failed during CacheDelete purge", 0x2AuLL, 1uLL, __stderrp);
  }
  return result;
}

char *sub_100004AD4(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 == 1)
  {
    unint64_t v5 = (char *)malloc_type_malloc(2uLL, 0x780D56C1uLL);
    uint64_t v6 = v5;
    uint64_t v7 = a1;
    goto LABEL_17;
  }
  size_t v3 = v2;
  if (v2)
  {
    uint64_t v8 = 0;
    do
    {
      size_t v9 = v2 + v8;
      int v10 = a1[v2 - 1 + v8--];
    }
    while (v9 != 1 && v10 != 47);
    if (v2 + v8)
    {
      if (v8 == -1)
      {
        uint64_t v6 = (char *)malloc_type_malloc(v2, 0xBAF419B6uLL);
        strlcpy(v6, a1, v3);
        return v6;
      }
      uint64_t v11 = &a1[v2];
      unint64_t v5 = (char *)malloc_type_malloc(-v8, 0x505CB428uLL);
      uint64_t v6 = v5;
      uint64_t v7 = &v11[v8 + 1];
    }
    else
    {
      if (v10 == 47) {
        stat v12 = a1 + 1;
      }
      else {
        stat v12 = a1;
      }
      unint64_t v5 = (char *)malloc_type_malloc(&a1[v2] - v12 + 1, 0x22F42F5FuLL);
      uint64_t v6 = v5;
      uint64_t v7 = v12;
    }
LABEL_17:
    strcpy(v5, v7);
    return v6;
  }

  return strdup(a1);
}

BOOL sub_100004C00(const char *a1, BOOL *a2)
{
  int v3 = stat(a1, &v5);
  if (a2 && !v3) {
    *a2 = (v5.st_mode & 0xF000) == 0x4000;
  }
  return v3 == 0;
}

BOOL sub_100004C54(int a1, int a2)
{
  return (CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() & (a2 ^ a1)) != 0
      && (CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() & ~a2 & a1) == 0;
}

void sub_100004CA0()
{
}

uint64_t sub_100004CB8(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  CFTypeID v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_100004E28(_Unwind_Exception *a1)
{
}

uint64_t sub_100004E50(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void *sub_100004F54(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_1000050F8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100005090(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100005070);
}

void sub_1000050E4(_Unwind_Exception *a1)
{
}

uint64_t sub_1000050F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_100005280(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_100005264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100005280(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004CA0();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t sub_10000532C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000053CC(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004CA0();
  }
  stat v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t sub_1000053CC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

uint64_t *sub_100005418()
{
  return &qword_100010048;
}

BOOL sub_100005424(void *a1)
{
  if (qword_100010048 == *a1 && unk_100010050 == a1[1]) {
    return 1;
  }
  if (*(unsigned char *)a1) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t v4 = v3;
    if (v3 == 15) {
      break;
    }
    ++v3;
  }
  while (!*((unsigned char *)a1 + v4 + 1));
  return v4 > 0xE;
}

double sub_100005484(int8x16_t *a1)
{
  *(void *)&double result = vmvnq_s8(*a1).u64[0];
  return result;
}

uint64_t sub_100005498(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x24;
  if (v5 == 1) {
    snprintf(__str, __size, "%02hhX%02hhX%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  }
  return v5;
}

__n128 sub_100005558(__n128 *a1, __n128 *a2, unint64_t a3, unsigned __int32 a4, unsigned __int32 a5, unsigned __int16 a6, unsigned __int16 a7)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = 0;
  a1[1].n128_u64[1] = a3;
  a1[2].n128_u32[0] = a4;
  a1[2].n128_u32[1] = 0;
  a1[2].n128_u32[2] = a5;
  a1[2].n128_u16[6] = a6;
  a1[2].n128_u16[7] = a7;
  a1[3].n128_u8[0] = 0;
  return result;
}

int8x16_t *sub_10000557C(int8x16_t *a1, void **a2)
{
  sub_100009A2C(&v7, a2);
  *a1 = *(int8x16_t *)sub_100009C90(&v7, 0);
  a1[1].i64[0] = sub_100009C80(&v7, 1uLL);
  a1[1].i64[1] = sub_100009C80(&v7, 2uLL);
  a1[2].i32[0] = sub_100009C80(&v7, 3uLL);
  a1[2].i32[1] = sub_100009C80(&v7, 4uLL);
  a1[2].i32[2] = sub_100009C80(&v7, 5uLL);
  if (sub_100009C14(&v7) < 8)
  {
    a1[2].i32[3] = 1;
    a1[3].i8[0] = 0;
  }
  else
  {
    a1[2].i16[6] = sub_100009C80(&v7, 6uLL);
    a1[2].i16[7] = sub_100009C80(&v7, 7uLL);
    BOOL v3 = sub_100009C14(&v7) == 9 && sub_100009C80(&v7, 8uLL) != 0;
    a1[3].i8[0] = v3;
    if (a1[2].i16[6] == 3)
    {
      sub_100005484(a1);
      a1->i64[0] = v4;
      a1->i64[1] = v5;
    }
  }
  sub_100009A70(&v7);
  return a1;
}

void sub_1000056A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100009A70((void **)va);
  _Unwind_Resume(a1);
}

BOOL sub_1000056C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 48) != 0) != (*(unsigned char *)(a2 + 48) != 0)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 32);
  if (v4 != -1)
  {
    int v5 = *(_DWORD *)(a2 + 32);
    if (v5 != -2 && v4 != v5) {
      return 0;
    }
  }
  uint64_t v7 = *(void *)(a1 + 24);
  if (v7 && v7 != *(void *)(a2 + 24)) {
    return 0;
  }
  int v9 = *(_DWORD *)(a1 + 40);
  if (v9)
  {
    if (v9 != *(_DWORD *)(a2 + 40)) {
      return 0;
    }
  }
  if (!sub_100005424((void *)a1) && (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))) {
    return 0;
  }
  int v11 = *(unsigned __int16 *)(a1 + 44);
  if (v11 != 0xFFFF && v11 != *(unsigned __int16 *)(a2 + 44)) {
    return 0;
  }
  int v13 = *(unsigned __int16 *)(a1 + 46);
  return v13 == 0xFFFF || v13 == *(unsigned __int16 *)(a2 + 46);
}

void **sub_1000057A0@<X0>(int8x16_t *a1@<X0>, void *a2@<X8>)
{
  sub_100009BE0(&v7);
  if (a1[2].i16[6] == 3)
  {
    sub_100005484(a1);
    v8[0] = v4;
    v8[1] = v5;
    sub_100009C88(&v7, 0xFFFFFFFFFFFFFFFFLL, (const unsigned __int8 *)v8);
  }
  else
  {
    sub_100009C88(&v7, 0xFFFFFFFFFFFFFFFFLL, (const unsigned __int8 *)a1);
  }
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[1].u64[0]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[1].u64[1]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[0]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[1]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[2]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u16[6]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u16[7]);
  sub_100009C78(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[3].u8[0]);
  sub_100009A60(a2, &v7);
  return sub_100009A70(&v7);
}

void sub_1000058D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

BOOL sub_1000058F0(uint64_t a1)
{
  BOOL result = 0;
  if (!sub_100005424((void *)a1))
  {
    if (*(_DWORD *)(a1 + 40))
    {
      if (*(void *)(a1 + 24))
      {
        if (*(_DWORD *)(a1 + 32) != -1 && (*(_WORD *)(a1 + 16) & 0x3FFF) == 0)
        {
          int v3 = *(_DWORD *)(a1 + 36);
          if (v3)
          {
            if ((v3 & 0x3FFF) == 0) {
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000595C(uint64_t a1, int a2, char *a3)
{
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = 850045863;
  *(_DWORD *)(a1 + 64) = -1;
  uint64_t v4 = (int *)(a1 + 64);
  BOOL v5 = a2 == 0;
  *(void *)(a1 + 88) = -1;
  *(void *)(a1 + 72) = 0;
  size_t v6 = (off_t *)(a1 + 72);
  *(void *)(a1 + 80) = 0;
  if (a2) {
    int v7 = 16777218;
  }
  else {
    int v7 = 0x1000000;
  }
  if (v5) {
    int v8 = 1;
  }
  else {
    int v8 = 3;
  }
  int v13 = v8;
  int v9 = open(a3, v7, 384);
  int *v4 = v9;
  if (v9 != -1 && !fstat(v9, &v12) && (v12.st_mode & 0xF000) == 0x8000)
  {
    unint64_t st_size = v12.st_size;
    off_t *v6 = v12.st_size;
    if (st_size >= 0x4000 && (st_size & 0x3FFF) == 0) {
      operator new();
    }
  }
  sub_100005D34(a1);
  return a1;
}

void sub_100005BCC(_Unwind_Exception *a1)
{
  sub_1000061D0(v1, 0);
  _Unwind_Resume(a1);
}

void sub_100005C14()
{
}

void sub_100005CB8()
{
}

BOOL sub_100005CDC(pthread_mutex_t *a1)
{
  pthread_mutex_lock(a1);
  BOOL v2 = sub_100007AA0((uint64_t)a1);
  pthread_mutex_unlock(a1);
  return v2;
}

void sub_100005D1C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100005D34(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 != -1)
  {
    close(v2);
    *(_DWORD *)(a1 + 64) = -1;
  }
  if (*(void *)(a1 + 80)) {
    sub_1000061D0((uint64_t *)(a1 + 80), 0);
  }
  *(void *)(a1 + 88) = -1;
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100005D94(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100005DB4(uint64_t a1, char *a2, unsigned int a3)
{
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = 850045863;
  *(_DWORD *)(a1 + 64) = -1;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = -1;
  unlink(a2);
  int v6 = open(a2, 16778754, 384);
  *(_DWORD *)(a1 + 64) = v6;
  if (v6 == -1 || (sub_100005F40(a1, a3) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v7 = __error();
      int v8 = strerror(*v7);
      *(_DWORD *)stat buf = 136315394;
      uint64_t v14 = a2;
      __int16 v15 = 2080;
      size_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Attempt to create [%s] failed. %s\n", buf, 0x16u);
    }
    int v9 = __stderrp;
    int v10 = __error();
    int v11 = strerror(*v10);
    fprintf(v9, "Attempt to create [%s] failed. %s\n", a2, v11);
    sub_100005D34(a1);
  }
  return a1;
}

void sub_100005F24(_Unwind_Exception *a1)
{
  sub_1000061D0((uint64_t *)(v1 + 80), 0);
  _Unwind_Resume(a1);
}

uint64_t sub_100005F40(uint64_t a1, unsigned int a2)
{
  off_t v2 = (56 * a2 + 16407) & 0x7FFFFFC000;
  *(void *)(a1 + 72) = v2;
  if (!ftruncate(*(_DWORD *)(a1 + 64), v2)) {
    operator new();
  }
  return 0;
}

void sub_10000602C()
{
}

uint64_t sub_100006054(uint64_t a1, int a2, unsigned int a3)
{
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = 850045863;
  *(_DWORD *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = -1;
  if ((sub_100005F40(a1, a3) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = __error();
      BOOL v5 = strerror(*v4);
      *(_DWORD *)stat buf = 136315138;
      int v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Attempt to initialize fd failed. %s\n", buf, 0xCu);
    }
    int v6 = __stderrp;
    int v7 = __error();
    int v8 = strerror(*v7);
    fprintf(v6, "Attempt to initialize fd failed. %s\n", v8);
    sub_100005D34(a1);
  }
  return a1;
}

void sub_100006174(_Unwind_Exception *a1)
{
  sub_1000061D0((uint64_t *)(v1 + 80), 0);
  _Unwind_Resume(a1);
}

uint64_t sub_100006194(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000061D0(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_100003DC0(result);
    operator delete();
  }
  return result;
}

uint64_t sub_100006220(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, uint64_t *a5)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v10 = *(_DWORD **)(a1 + 88);
  *a2 = v10[1];
  *a3 = v10[2];
  *a4 = v10[3];
  *a5 = sub_10000632C(a1);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return 1;
}

void sub_10000629C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000062B4(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = sub_10000632C(a1);
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 88) + 8);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v2 - ((56 * v3 + 16407) & 0x7FFFFFC000);
}

void sub_100006314(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000632C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  uint64_t v2 = (56 * *(unsigned int *)(v1 + 8) + 16407) & 0x7FFFFFC000;
  memset(v8, 0, sizeof(v8));
  int v9 = 1065353216;
  uint64_t v3 = *(unsigned int *)(v1 + 12);
  if (v3)
  {
    uint64_t v4 = 56 * v3;
    uint64_t v5 = v1 + 40;
    do
    {
      unint64_t v7 = *(void *)v5;
      if (!sub_100008314(v8, &v7))
      {
        unint64_t v7 = *(void *)v5;
        sub_1000083C8((uint64_t)v8, &v7, &v7);
        v2 += *(unsigned int *)(v5 + 20);
      }
      v5 += 56;
      v4 -= 56;
    }
    while (v4);
  }
  sub_1000082C8((uint64_t)v8);
  return v2;
}

void sub_1000063E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000082C8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_1000063FC(uint64_t a1, uint64_t a2)
{
  v4.unint64_t st_size = 0;
  fstat(*(_DWORD *)(a1 + 64), &v4);
  return *(void *)(a2 + 16) + (unint64_t)*(unsigned int *)(a2 + 36) <= v4.st_size;
}

uint64_t sub_10000644C(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  sub_100005554(a2, __s, 0x28uLL);
  sub_100004CB8((uint64_t)&v25);
  stat v4 = sub_100004F54(&v25, (uint64_t)"match_archive -- UUID: ", 23);
  size_t v5 = strlen(__s);
  int v6 = sub_100004F54(v4, (uint64_t)__s, v5);
  sub_100004F54(v6, (uint64_t)", uid: ", 7);
  unint64_t v7 = (void *)std::ostream::operator<<();
  sub_100004F54(v7, (uint64_t)", offset: ", 10);
  int v8 = (void *)std::ostream::operator<<();
  sub_100004F54(v8, (uint64_t)", size: ", 8);
  std::ostream::operator<<();
  sub_10000532C((uint64_t)v26, __p);
  if (v24 >= 0) {
    int v9 = __p;
  }
  else {
    int v9 = (void **)__p[0];
  }
  sub_100009D30(v22, v9);
  BOOL v10 = sub_100005424((void *)a2);
  char v11 = *(_DWORD *)(a2 + 32) == -1 || v10;
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = *(void *)(a1 + 88);
    unsigned int v13 = *(_DWORD *)(v12 + 12);
    if (v13)
    {
      uint64_t v14 = (unint64_t *)(v12 + 24 + 56 * v13);
      char v28 = 0;
      for (unsigned int i = sub_100007D20((unint64_t *)(v12 + 24), v14, (unint64_t *)a2); i != v14; i += 7)
      {
        if (*i != *(void *)a2 || i[1] != *(void *)(a2 + 8)) {
          break;
        }
        if (sub_1000056C0(a2, (uint64_t)i))
        {
          long long v19 = *(_OWORD *)i;
          long long v20 = *((_OWORD *)i + 1);
          long long v21 = *((_OWORD *)i + 2);
          *(unsigned char *)(a2 + 48) = *((unsigned char *)i + 48);
          *(_OWORD *)(a2 + 16) = v20;
          *(_OWORD *)(a2 + 32) = v21;
          *(_OWORD *)a2 = v19;
          uint64_t v17 = 1;
          goto LABEL_19;
        }
      }
    }
  }
  uint64_t v17 = 0;
LABEL_19:
  sub_100009D8C(v22);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  if (v27 < 0) {
    operator delete((void *)v26[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v17;
}

void sub_10000671C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  sub_100009D8C(&a10);
  if (a17 < 0) {
    operator delete(__p);
  }
  sub_100004E50((uint64_t)&a18);
  pthread_mutex_unlock(v18);
  _Unwind_Resume(a1);
}

uint64_t sub_100006790@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v6 = *(void *)(a1 + 88);
  unsigned int v7 = *(_DWORD *)(v6 + 12);
  if (v7)
  {
    int v8 = (long long *)(v6 + 24);
    uint64_t v9 = v6 + 24 + 56 * v7;
    unsigned int v13 = (void **)a3;
    do
    {
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      while (v10 != v11)
      {
        if (sub_1000056C0(v10, (uint64_t)v8))
        {
          sub_100007DB8(&v13, v8);
          break;
        }
        v10 += 56;
      }
      int v8 = (long long *)((char *)v8 + 56);
    }
    while (v8 != (long long *)v9);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100006848(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v2);
  sub_100009D90(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000686C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int v41 = *(_DWORD *)(*(void *)(a1 + 88) + 12);
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  sub_1000091A4((uint64_t)v48, a4);
  uint64_t v42 = a1;
  uint64_t v9 = sub_100008830((long long *)a2, (uint64_t)a3, (uint64_t)v48);
  sub_10000923C(v48);
  memset(v44, 0, sizeof(v44));
  int v45 = 1065353216;
  for (unsigned int i = (void *)a2; (long long *)a2 != v9; a2 += 56)
  {
    unint64_t v47 = *(void *)(a2 + 16);
    sub_1000083C8((uint64_t)v44, &v47, &v47);
    uint64_t v11 = (long long *)a5[1];
    unint64_t v10 = a5[2];
    if ((unint64_t)v11 >= v10)
    {
      size_t v16 = (long long *)*a5;
      uint64_t v17 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v11 - *a5) >> 3);
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) > 0x492492492492492) {
        sub_1000034E8();
      }
      unint64_t v19 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - (void)v16) >> 3);
      if (2 * v19 > v18) {
        unint64_t v18 = 2 * v19;
      }
      if (v19 >= 0x249249249249249) {
        unint64_t v20 = 0x492492492492492;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        long long v21 = (char *)sub_100003590((uint64_t)(a5 + 2), v20);
        size_t v16 = (long long *)*a5;
        uint64_t v11 = (long long *)a5[1];
      }
      else
      {
        long long v21 = 0;
      }
      uint64_t v22 = &v21[56 * v17];
      long long v23 = *(_OWORD *)a2;
      long long v24 = *(_OWORD *)(a2 + 16);
      long long v25 = *(_OWORD *)(a2 + 32);
      *((void *)v22 + 6) = *(void *)(a2 + 48);
      *((_OWORD *)v22 + 1) = v24;
      *((_OWORD *)v22 + 2) = v25;
      *(_OWORD *)uint64_t v22 = v23;
      if (v11 == v16)
      {
        v30 = &v21[56 * v17];
      }
      else
      {
        long long v26 = &v21[56 * v17];
        do
        {
          long long v27 = *(long long *)((char *)v11 - 56);
          long long v28 = *(long long *)((char *)v11 - 40);
          long long v29 = *(long long *)((char *)v11 - 24);
          v30 = v26 - 56;
          *(v26 - 8) = *((unsigned char *)v11 - 8);
          *(_OWORD *)(v26 - 24) = v29;
          *(_OWORD *)(v26 - 40) = v28;
          *(_OWORD *)(v26 - 56) = v27;
          uint64_t v11 = (long long *)((char *)v11 - 56);
          v26 -= 56;
        }
        while (v11 != v16);
      }
      uint64_t v15 = (uint64_t)(v22 + 56);
      *a5 = (uint64_t)v30;
      a5[1] = (uint64_t)(v22 + 56);
      a5[2] = (uint64_t)&v21[56 * v20];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      long long v12 = *(_OWORD *)a2;
      long long v13 = *(_OWORD *)(a2 + 16);
      long long v14 = *(_OWORD *)(a2 + 32);
      *((void *)v11 + 6) = *(void *)(a2 + 48);
      v11[1] = v13;
      v11[2] = v14;
      long long *v11 = v12;
      uint64_t v15 = (uint64_t)v11 + 56;
    }
    a5[1] = v15;
  }
  sub_100006C60(v42, a5);
  __n128 v46 = v44;
  if (v9 == a3)
  {
LABEL_32:
    v38 = i;
  }
  else
  {
    uint64_t v31 = (char *)a3 - (char *)v9;
    v32 = v9;
    while (1)
    {
      unint64_t v47 = *((void *)v32 + 2);
      if (!sub_1000096C0(v44, &v47)) {
        break;
      }
      v32 = (long long *)((char *)v32 + 56);
      v31 -= 56;
      if (v32 == a3) {
        goto LABEL_32;
      }
    }
    v33 = (long long *)((char *)a3 - 56);
    do
    {
      if (v32 == v33)
      {
        a3 = v32;
        goto LABEL_32;
      }
      unint64_t v47 = *((void *)v33 + 2);
      v33 = (long long *)((char *)v33 - 56);
      v31 -= 56;
    }
    while (!sub_1000096C0(v44, &v47));
    uint64_t v34 = 0x6DB6DB6DB6DB6DB7 * (v31 >> 3) + 1;
    if (v31 < 113)
    {
      __n128 v35 = 0;
      uint64_t v37 = 0;
    }
    else
    {
      __n128 v35 = sub_100008990(0x6DB6DB6DB6DB6DB7 * (v31 >> 3) + 1);
      uint64_t v37 = v36;
    }
    v38 = i;
    a3 = sub_1000092C0(v32, (long long *)((char *)v33 + 56), &v46, v34, (unint64_t)v35, v37);
    if (v35) {
      operator delete(v35);
    }
  }
  sub_100007F24(v9, a3, (void **)a5);
  unsigned int v39 = v41 + 1227133513 * ((unint64_t)(a5[1] - *a5) >> 3);
  *(_DWORD *)(*(void *)(v42 + 88) + 12) = v39;
  memmove(v38, a3, 56 * v39);
  return sub_1000082C8((uint64_t)v44);
}

void sub_100006C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  if (v21) {
    operator delete(v21);
  }
  sub_1000082C8((uint64_t)&a13);
  long long v23 = *(void **)v20;
  if (*(void *)v20)
  {
    *(void *)(v20 + 8) = v23;
    operator delete(v23);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100006C60(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = result;
    do
    {
      bzero(v14, 0x18uLL);
      uint64_t v15 = *(void *)(v2 + 16);
      uint64_t v16 = *(unsigned int *)(v2 + 36);
      uint64_t result = fcntl(*(_DWORD *)(v4 + 64), 99, v14);
      if (result)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v6 = v15;
          uint64_t v5 = v16;
          unsigned int v7 = __error();
          int v8 = strerror(*v7);
          *(_DWORD *)stat buf = 134218498;
          uint64_t v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = v5;
          __int16 v21 = 2080;
          uint64_t v22 = v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to execute PUNCHHOLE at offset %lld with size %lld. Reason = %s", buf, 0x20u);
        }
        uint64_t v9 = __stderrp;
        uint64_t v10 = v15;
        uint64_t v11 = v16;
        long long v12 = __error();
        long long v13 = strerror(*v12);
        uint64_t result = fprintf(v9, "Failed to execute PUNCHHOLE at offset %lld with size %lld. Reason = %s", v10, v11, v13);
      }
      v2 += 56;
    }
    while (v2 != v3);
  }
  return result;
}

uint64_t sub_100006DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, void *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v8 = *(void *)(a1 + 88);
  unsigned int v9 = *(_DWORD *)(v8 + 12);
  if (v9)
  {
    v14[0] = off_10000C890;
    v14[1] = a2;
    v14[2] = a3;
    v14[3] = v14;
    sub_10000686C(a1, v8 + 24, (long long *)(v8 + 24 + 56 * v9), (uint64_t)v14, (uint64_t *)&v12);
    uint64_t v10 = v13;
    *(_OWORD *)a4 = v12;
    a4[2] = v10;
    uint64_t v13 = 0;
    long long v12 = 0uLL;
    sub_10000923C(v14);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100006EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_10000923C((uint64_t *)va);
  pthread_mutex_unlock(v4);
  _Unwind_Resume(a1);
}

uint64_t sub_100006EF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 88);
    unsigned int v7 = *(_DWORD *)(v6 + 12);
    if (v7)
    {
      uint64_t v12 = 0;
      v13[0] = off_10000C920;
      v13[1] = a2;
      v13[2] = &v12;
      v13[3] = v13;
      sub_10000686C(a1, v6 + 24, (long long *)(v6 + 24 + 56 * v7), (uint64_t)v13, (uint64_t *)&v10);
      uint64_t v8 = v11;
      *(_OWORD *)a3 = v10;
      a3[2] = v8;
      uint64_t v11 = 0;
      long long v10 = 0uLL;
      sub_10000923C(v13);
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100006FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_10000923C((uint64_t *)va);
  pthread_mutex_unlock(v6);
  _Unwind_Resume(a1);
}

uint64_t sub_100007018(uint64_t a1, long long *a2, int32x4_t *a3, size_t a4)
{
  if (sub_100005424(a2) || *((_DWORD *)a2 + 8) == -1) {
    return 1;
  }
  uint64_t v8 = 1;
  if (a4 >= 0x60 && a3 && *((void *)a2 + 3))
  {
    if (a3->i32[1])
    {
      __int32 v9 = a3[3].i32[0];
      if (v9 == sub_100003ACC(a3) && sub_100003AE8(a3))
      {
        pthread_mutex_lock((pthread_mutex_t *)a1);
        uint64_t v10 = *(void *)(a1 + 88);
        unsigned int v11 = *(_DWORD *)(v10 + 12);
        uint64_t v12 = (unint64_t *)(v10 + 24);
        if (v11)
        {
          unsigned int v13 = *((_DWORD *)a2 + 8);
          long long v14 = sub_100007F88(v12, (unint64_t *)(v10 + 56 * v11 + 24), (unint64_t *)a2);
          uint64_t v12 = v14;
          uint64_t v16 = v15;
          char v17 = 1;
          if (v14 == v15)
          {
            __int16 v19 = v14;
          }
          else
          {
            uint64_t v18 = v15;
            __int16 v19 = v14;
            while (1)
            {
              unsigned int v20 = *((_DWORD *)v19 + 8);
              if (v20 == -2) {
                break;
              }
              if (v20 >= v13)
              {
                if (v20 == v13)
                {
                  if (*((unsigned __int16 *)v19 + 22) != *((unsigned __int16 *)a2 + 22)) {
                    goto LABEL_26;
                  }
                  if (sub_1000074B0(a3, *((unsigned __int16 *)a2 + 23), (uint64_t)v19, *(_DWORD *)(a1 + 64)))
                  {
                    *((unsigned char *)v19 + 48) = 1;
                    goto LABEL_26;
                  }
                  goto LABEL_53;
                }
                if (v17)
                {
                  if (sub_100007654(a3, a4, (uint64_t)v19, *(_DWORD *)(a1 + 64)))
                  {
                    char v17 = 0;
                    *((void *)a2 + 2) = v19[2];
                    *((_DWORD *)a2 + 9) = *((_DWORD *)v19 + 9);
                  }
                }
                else
                {
                  __int16 v19 = v18;
                }
                goto LABEL_26;
              }
              if ((v17 & 1) != 0 && sub_100007654(a3, a4, (uint64_t)v19, *(_DWORD *)(a1 + 64)))
              {
                char v17 = 0;
                *((void *)a2 + 2) = v19[2];
                *((_DWORD *)a2 + 9) = *((_DWORD *)v19 + 9);
              }
              uint64_t v18 = v19 + 7;
              __int16 v19 = v18;
              if (v18 == v16)
              {
                __int16 v19 = v16;
                goto LABEL_26;
              }
            }
            if (*((_DWORD *)a2 + 8) != -2
              || (int v39 = sub_1000074B0(a3, *((unsigned __int16 *)a2 + 23), (uint64_t)v19, *(_DWORD *)(a1 + 64)),
                  __int16 v19 = v12,
                  !v39))
            {
LABEL_53:
              uint64_t v8 = 2;
              goto LABEL_54;
            }
          }
LABEL_26:
          if (*(_DWORD *)(*(void *)(a1 + 88) + 12) < *(_DWORD *)(*(void *)(a1 + 88) + 8))
          {
            if ((v17 & 1) == 0) {
              goto LABEL_38;
            }
            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v16 = (unint64_t *)(v10 + 24);
          __int16 v19 = (unint64_t *)(v10 + 24);
          if (*(_DWORD *)(v10 + 8))
          {
LABEL_28:
            unint64_t v22 = (a4 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
            off_t v23 = *(void *)(a1 + 72) + v22;
            if (ftruncate(*(_DWORD *)(a1 + 64), v23))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                long long v24 = __error();
                long long v25 = strerror(*v24);
                *(_DWORD *)stat buf = 134218242;
                off_t v42 = v23;
                __int16 v43 = 2080;
                v44 = v25;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Call to extend file size to %lld failed. %s\n", buf, 0x16u);
              }
              long long v26 = __stderrp;
              long long v27 = __error();
              long long v28 = strerror(*v27);
              fprintf(v26, "Call to extend file size to %lld failed. %s\n", v23, v28);
LABEL_45:
              ftruncate(*(_DWORD *)(a1 + 64), *(void *)(a1 + 72));
              uint64_t v8 = 4;
              goto LABEL_54;
            }
            BOOL v29 = sub_10000771C(a3, *(_DWORD *)(a1 + 64), *(void *)(a1 + 72));
            BOOL v30 = v29;
            if (v29)
            {
              *((void *)a2 + 2) = *(void *)(a1 + 72);
              *((_DWORD *)a2 + 9) = v22;
              *(void *)(a1 + 72) = v23;
              fsync(*(_DWORD *)(a1 + 64));
            }
            if (!v22 || !a3->i64[0])
            {
              putchar(10);
              v40 = sub_100004AD4("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/MMapArchiveFileSystem.cpp");
              sub_100009DB8(v40);
              abort();
            }
            if (!v30) {
              goto LABEL_45;
            }
LABEL_38:
            if (*((_DWORD *)a2 + 8) == -2 && v12 != v16)
            {
              do
              {
                *((unsigned char *)v12 + 48) = 1;
                v12 += 7;
              }
              while (v12 != v16);
            }
            uint64_t v31 = *(void *)(a1 + 88);
            unsigned int v32 = *(_DWORD *)(v31 + 12);
            memmove(v19 + 7, v19, v31 + 56 * v32 - (void)v19 + 24);
            uint64_t v8 = 0;
            uint64_t v33 = *(void *)(a1 + 88);
            int v34 = *(_DWORD *)(v33 + 16);
            if ((v34 + 1) > 1) {
              int v35 = v34 + 1;
            }
            else {
              int v35 = 1;
            }
            *(_DWORD *)(v33 + 16) = v35;
            *((_DWORD *)a2 + 10) = v35;
            long long v36 = *a2;
            long long v37 = a2[1];
            long long v38 = a2[2];
            v19[6] = *((void *)a2 + 6);
            *((_OWORD *)v19 + 1) = v37;
            *((_OWORD *)v19 + 2) = v38;
            *(_OWORD *)__int16 v19 = v36;
            *(_DWORD *)(*(void *)(a1 + 88) + 12) = v32 + 1;
            goto LABEL_54;
          }
        }
        uint64_t v8 = 3;
LABEL_54:
        pthread_mutex_unlock((pthread_mutex_t *)a1);
        return v8;
      }
      return 6;
    }
    else
    {
      return 5;
    }
  }
  return v8;
}

void sub_100007464(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000074B0(_DWORD *a1, unsigned int a2, uint64_t a3, int a4)
{
  if (*(_WORD *)(a3 + 44) == 7)
  {
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v19 = *(unsigned int *)(a3 + 36);
    uint64_t v8 = v7 & 0x3FFF;
    size_t v17 = ((v7 + v19 + 0x3FFF) & 0xFFFFFFFFFFFFC000) - (v7 & 0xFFFFFFFFFFFFC000);
    uint64_t v18 = v8;
    __int32 v9 = (char *)mmap(0, v17, 1, 1, a4, v7 & 0xFFFFFFFFFFFFC000);
    uint64_t v16 = v9;
    if (v9 == (char *)-1) {
      goto LABEL_26;
    }
    uint64_t v10 = &v9[v8];
    if (v10 == (char *)-1) {
      goto LABEL_26;
    }
    if (*(unsigned __int16 *)(a3 + 46) < a2
      || sub_100003CD0(a1) && !sub_100003CD0(v10)
      || a1[3] > *((_DWORD *)v10 + 3)
      || a1[4] > *((_DWORD *)v10 + 4)
      || a1[6] > *((_DWORD *)v10 + 6)
      || a1[20] && (a1[7] & 0x1000) != 0 && !*((_DWORD *)v10 + 20))
    {
      goto LABEL_10;
    }
    uint64_t v12 = sub_100008188(a1);
    if (v12 && *((_DWORD *)v12 + 1)) {
      unsigned int v13 = *((_DWORD *)v12 + 2) >= 0x14u ? (int *)(v12 + 16) : 0;
    }
    else {
      unsigned int v13 = 0;
    }
    long long v14 = sub_100008188(v10);
    if (!v14 || !*((_DWORD *)v14 + 1)) {
      goto LABEL_26;
    }
    uint64_t v11 = 0;
    if (!v13 || *((_DWORD *)v14 + 2) < 0x14u) {
      goto LABEL_27;
    }
    if (sub_100004C54(*v13, *((_DWORD *)v14 + 4))) {
LABEL_10:
    }
      uint64_t v11 = 1;
    else {
LABEL_26:
    }
      uint64_t v11 = 0;
LABEL_27:
    sub_100003DC0((uint64_t)&v16);
    return v11;
  }
  return 1;
}

void sub_100007640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sub_100007654(const void *a1, size_t a2, uint64_t a3, int a4)
{
  if (((a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000) != *(_DWORD *)(a3 + 36)) {
    return 0;
  }
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v13 = v6 & 0x3FFF;
  unint64_t v14 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
  size_t v12 = ((((a2 + 0x3FFF) | 0x3FFF) + v6) & 0xFFFFFFFFFFFFC000) - (v6 & 0xFFFFFFFFFFFFC000);
  uint64_t v11 = (char *)mmap(0, v12, 1, 1, a4, v6 & 0xFFFFFFFFFFFFC000);
  uint64_t v7 = &v11[v13];
  if (v11 == (char *)-1 || v7 + 1 == 0)
  {
    sub_100003DC0((uint64_t)&v11);
    return 0;
  }
  BOOL v9 = memcmp(a1, v7, a2) == 0;
  sub_100003DC0((uint64_t)&v11);
  return v9;
}

BOOL sub_10000771C(int32x4_t *__buf, int __fd, off_t a3)
{
  uint64_t v3 = __buf;
  off_t v11 = a3;
  if ((__buf[1].i8[13] & 0x10) != 0 || !__buf[5].i32[0])
  {
    size_t v10 = __buf->u32[1];
    return sub_1000081FC(__buf, v10, __fd, &v11);
  }
  uint64_t v5 = __buf->u32[1];
  BOOL result = sub_1000081FC(__buf, 4uLL, __fd, &v11);
  if (result)
  {
    int __bufa = v3->i32[1] - v3[5].i32[0];
    BOOL result = sub_1000081FC(&__bufa, 4uLL, __fd, &v11);
    if (result)
    {
      BOOL result = sub_1000081FC(&v3->u64[1], 0x28uLL, __fd, &v11);
      if (result)
      {
        int v13 = sub_100003ACC(v3) - v3[5].i32[0];
        BOOL result = sub_1000081FC(&v13, 4uLL, __fd, &v11);
        if (result)
        {
          BOOL result = sub_1000081FC((char *)v3[3].i64 + 4, 0x18uLL, __fd, &v11);
          if (result)
          {
            uint64_t v12 = 0;
            BOOL v7 = sub_1000081FC(&v12, 8uLL, __fd, &v11);
            BOOL result = 0;
            if (v7)
            {
              unint64_t v8 = (36 * v3[1].i32[1])
                 + (unint64_t)(20 * v3[1].i32[2])
                 + v3[5].u32[2];
              unint64_t v9 = (unint64_t)v3[6].u64
                 + 32 * v3->i32[2]
                 + 24 * v3->i32[3]
                 + (24 * v3[1].i32[0])
                 + (unint64_t)(4 * v3[1].i32[0])
                 + v8;
              BOOL result = sub_1000081FC((char *)v3[5].i64 + 4, (32 * v3->i32[2])+ (unint64_t)(24 * v3->i32[3])+ (24 * v3[1].i32[0])+ (unint64_t)(4 * v3[1].i32[0])+ v8+ 12, __fd, &v11);
              if (result)
              {
                __stat buf = (int32x4_t *)(v9 + v3[5].u32[0]);
                size_t v10 = &v3->i8[v5] - (__int8 *)__buf;
                return sub_1000081FC(__buf, v10, __fd, &v11);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000078C8(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  *a3 = 0;
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(unsigned int *)(v3 + 12);
  if ((v4 - 1) >= *(_DWORD *)(*(void *)(*a2 + 88) + 8)) {
    return 1;
  }
  uint64_t v8 = 56 * v4;
  for (unsigned int i = (unsigned char *)(v3 + 72); ; i += 56)
  {
    if (*i) {
      goto LABEL_11;
    }
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *((void *)i - 4);
    uint64_t v22 = *((unsigned int *)i - 3);
    size_t v20 = ((v11 + v22 + 0x3FFF) & 0xFFFFFFFFFFFFC000) - (v11 & 0xFFFFFFFFFFFFC000);
    uint64_t v21 = v11 & 0x3FFF;
    uint64_t v12 = (char *)mmap(0, v20, 1, 1, v10, v11 & 0xFFFFFFFFFFFFC000);
    uint64_t v19 = v12;
    if (v12 == (char *)-1 || &v12[v21] == (char *)-1) {
      break;
    }
    long long v13 = *((_OWORD *)i - 3);
    uint64_t v14 = *(void *)i;
    long long v15 = *((_OWORD *)i - 1);
    v23[1] = *((_OWORD *)i - 2);
    v23[2] = v15;
    uint64_t v24 = v14;
    v23[0] = v13;
    int v16 = sub_100007018(*a2, v23, (int32x4_t *)&v12[v21], DWORD1(v15));
    *a3 = v16;
    if (v16)
    {
      if (v16 != 5) {
        break;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "coresymbolicationd: compact operation encountered empty archive:", (uint8_t *)v18, 2u);
      }
    }
    sub_100003DC0((uint64_t)&v19);
LABEL_11:
    v8 -= 56;
    if (!v8) {
      return 1;
    }
  }
  sub_100003DC0((uint64_t)&v19);
  return 0;
}

void sub_100007A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100003DC0((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_100007AA0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 == -1 || fstat(v2, &v30) || (v30.st_mode & 0xF000) != 0x8000) {
    return 0;
  }
  BOOL result = 0;
  unint64_t v4 = *(void *)(a1 + 72);
  if ((v4 & 0x3FFF) == 0 && v4 >= 0x4000 && v4 <= v30.st_size)
  {
    if (!*(void *)(a1 + 80)) {
      return 0;
    }
    uint64_t v5 = *(_DWORD **)(a1 + 88);
    if (v5 == (_DWORD *)-1) {
      return 0;
    }
    if (*v5 != -22168898) {
      return 0;
    }
    if (v5[1] != 1) {
      return 0;
    }
    unsigned int v6 = v5[2];
    if (!v6) {
      return 0;
    }
    unsigned int v7 = v5[3];
    if (v7 > v6) {
      return 0;
    }
    unint64_t v8 = (56 * v6 + 16407) & 0x7FFFFFC000;
    if (v8 > v4) {
      return 0;
    }
    if (v7)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      while (1)
      {
        uint64_t v11 = v5;
        uint64_t v12 = &v5[v9];
        long long v13 = &v5[v9 + 6];
        BOOL result = sub_1000058F0((uint64_t)v13);
        if (!result) {
          break;
        }
        uint64_t v5 = *(_DWORD **)(a1 + 88);
        if (v12[16] > v5[4]) {
          return 0;
        }
        unint64_t v14 = *(void *)&v11[v9 + 10];
        if (v14 < v8 || v14 + v11[v9 + 15] > *(void *)(a1 + 72)) {
          return 0;
        }
        if (v11[v9 + 14] == -2)
        {
          if (v10)
          {
            long long v15 = &v5[14 * v10 - 14];
            uint64_t v17 = *((void *)v15 + 3);
            uint64_t v16 = *((void *)v15 + 4);
            BOOL v18 = *v13 == v17 && v13[1] == v16;
            if (v18) {
              return 0;
            }
          }
          unsigned int v19 = v5[3];
          if (v10 < v19 - 1 && *v13 == *(void *)&v5[v9 + 20] && v13[1] == *(void *)&v5[v9 + 22]) {
            return 0;
          }
        }
        else
        {
          unsigned int v19 = v5[3];
        }
        ++v10;
        v9 += 14;
        if (v10 >= v19)
        {
          if (v19 < 2) {
            return 1;
          }
          uint64_t v21 = v5 + 32;
          uint64_t v22 = v19 - 1;
          do
          {
            unint64_t v23 = bswap64(*((void *)v21 - 13));
            unint64_t v24 = bswap64(*((void *)v21 - 6));
            if (v23 == v24 && (unint64_t v23 = bswap64(*((void *)v21 - 12)), v24 = bswap64(*((void *)v21 - 5)), v23 == v24))
            {
              int v25 = 0;
            }
            else if (v23 < v24)
            {
              int v25 = -1;
            }
            else
            {
              int v25 = 1;
            }
            unsigned int v26 = *((_DWORD *)v21 - 18);
            unsigned int v27 = *((_DWORD *)v21 - 4);
            BOOL v18 = v25 == 0;
            BOOL v28 = v25 < 0;
            if (v18) {
              BOOL v28 = v26 < v27;
            }
            if (!v28)
            {
              BOOL v29 = *v21 || *(v21 - 56) != 0;
              BOOL result = 0;
              if (!v29 || v27 != v26) {
                break;
              }
            }
            v21 += 56;
            BOOL result = 1;
            --v22;
          }
          while (v22);
          return result;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

unint64_t *sub_100007D20(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  if (a2 != a1)
  {
    unint64_t v3 = 0x6DB6DB6DB6DB6DB7 * (a2 - a1);
    a2 = a1;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &a2[7 * (v3 >> 1)];
      unint64_t v6 = bswap64(*v5);
      unint64_t v7 = bswap64(*a3);
      if (v6 == v7 && (unint64_t v6 = bswap64(v5[1]), v7 = bswap64(a3[1]), v6 == v7))
      {
        int v8 = 0;
      }
      else if (v6 < v7)
      {
        int v8 = -1;
      }
      else
      {
        int v8 = 1;
      }
      uint64_t v9 = v5 + 7;
      v3 += ~v4;
      if (v8 < 0) {
        a2 = v9;
      }
      else {
        unint64_t v3 = v4;
      }
    }
    while (v3);
  }
  return a2;
}

void ***sub_100007DB8(void ***a1, long long *a2)
{
  unint64_t v4 = *a1;
  uint64_t v5 = (char *)(*a1)[1];
  unint64_t v6 = *a1;
  uint64_t v9 = (char *)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  int v8 = v9;
  if (v5 >= v9)
  {
    uint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((v5 - (unsigned char *)*v4) >> 3);
    unint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > 0x492492492492492) {
      sub_1000034E8();
    }
    unint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((v8 - (unsigned char *)*v4) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x249249249249249) {
      unint64_t v17 = 0x492492492492492;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      BOOL v18 = (char *)sub_100003590(v7, v17);
    }
    else {
      BOOL v18 = 0;
    }
    unsigned int v19 = &v18[56 * v14];
    size_t v20 = &v18[56 * v17];
    long long v21 = *a2;
    long long v22 = a2[1];
    long long v23 = a2[2];
    *((void *)v19 + 6) = *((void *)a2 + 6);
    *((_OWORD *)v19 + 1) = v22;
    *((_OWORD *)v19 + 2) = v23;
    *(_OWORD *)unsigned int v19 = v21;
    long long v13 = v19 + 56;
    int v25 = (char *)*v4;
    unint64_t v24 = (char *)v4[1];
    if (v24 != *v4)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 56);
        long long v27 = *(_OWORD *)(v24 - 40);
        long long v28 = *(_OWORD *)(v24 - 24);
        *(v19 - 8) = *(v24 - 8);
        *(_OWORD *)(v19 - 24) = v28;
        *(_OWORD *)(v19 - 40) = v27;
        *(_OWORD *)(v19 - 56) = v26;
        v19 -= 56;
        v24 -= 56;
      }
      while (v24 != v25);
      unint64_t v24 = (char *)*v4;
    }
    pthread_mutex_t *v4 = v19;
    v4[1] = v13;
    v4[2] = v20;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    long long v10 = *a2;
    long long v11 = a2[1];
    long long v12 = a2[2];
    *((void *)v5 + 6) = *((void *)a2 + 6);
    *((_OWORD *)v5 + 1) = v11;
    *((_OWORD *)v5 + 2) = v12;
    *(_OWORD *)uint64_t v5 = v10;
    long long v13 = v5 + 56;
  }
  v4[1] = v13;
  return a1;
}

long long *sub_100007F24(long long *a1, long long *a2, void **a3)
{
  unint64_t v3 = a1;
  unint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  unint64_t v4 = a2;
  do
  {
    sub_100007DB8(&v6, v3);
    unint64_t v3 = (long long *)((char *)v3 + 56);
  }
  while (v3 != v4);
  return v4;
}

unint64_t *sub_100007F88(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = a2;
  if (a2 != a1)
  {
    uint64_t v5 = a1;
    unint64_t v6 = 0x6DB6DB6DB6DB6DB7 * (a2 - a1);
    while (1)
    {
      unint64_t v7 = v6 >> 1;
      int v8 = &v5[7 * (v6 >> 1)];
      unint64_t v9 = bswap64(*v8);
      unint64_t v10 = bswap64(*a3);
      if (v9 == v10 && (unint64_t v9 = bswap64(v8[1]), v10 = bswap64(a3[1]), v9 == v10)
        || (v9 < v10 ? (int v11 = -1) : (int v11 = 1), (v11 & 0x80000000) == 0))
      {
        unint64_t v12 = bswap64(*a3);
        unint64_t v13 = bswap64(*v8);
        if (v12 == v13 && (unint64_t v12 = bswap64(a3[1]), v13 = bswap64(v8[1]), v12 == v13)
          || (v12 < v13 ? (int v14 = -1) : (int v14 = 1), (v14 & 0x80000000) == 0))
        {
          uint64_t v5 = sub_100007D20(v5, v8, a3);
          sub_1000080F0(v8 + 7, v3, a3);
          return v5;
        }
        unint64_t v3 = v8;
      }
      else
      {
        uint64_t v5 = v8 + 7;
        unint64_t v7 = v6 + ~v7;
      }
      unint64_t v6 = v7;
      if (!v7) {
        return v5;
      }
    }
  }
  return a2;
}

unint64_t *sub_1000080F0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  if (a2 != a1)
  {
    unint64_t v3 = 0x6DB6DB6DB6DB6DB7 * (a2 - a1);
    a2 = a1;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &a2[7 * (v3 >> 1)];
      unint64_t v6 = bswap64(*a3);
      unint64_t v7 = bswap64(*v5);
      if (v6 == v7 && (unint64_t v6 = bswap64(a3[1]), v7 = bswap64(v5[1]), v6 == v7))
      {
        int v8 = 0;
      }
      else if (v6 < v7)
      {
        int v8 = -1;
      }
      else
      {
        int v8 = 1;
      }
      unint64_t v9 = v5 + 7;
      v3 += ~v4;
      if (v8 < 0) {
        unint64_t v3 = v4;
      }
      else {
        a2 = v9;
      }
    }
    while (v3);
  }
  return a2;
}

char *sub_100008188(_DWORD *a1)
{
  BOOL result = (char *)sub_100003C68(a1);
  unint64_t v3 = (char *)a1 + a1[1];
  BOOL v4 = v3 > result;
  unint64_t v5 = v3 - result;
  if (!v4 || v5 < 0xC || *(_DWORD *)result != 12648430 || !*((_DWORD *)result + 1)) {
    return 0;
  }
  LODWORD(v6) = *((_DWORD *)result + 2);
  if (v6 <= 0xC) {
    uint64_t v6 = 12;
  }
  else {
    uint64_t v6 = v6;
  }
  if (v5 != v6) {
    return 0;
  }
  return result;
}

BOOL sub_1000081FC(void *__buf, size_t __nbyte, int __fd, off_t *a4)
{
  if (!__nbyte) {
    return 1;
  }
  size_t v6 = __nbyte;
  off_t v8 = *a4;
  do
  {
    int v9 = 4;
    do
    {
      ssize_t v10 = pwrite(__fd, __buf, v6, v8);
      BOOL v11 = v10 != -1;
      if (v10 == -1 && *__error() != 4) {
        return 0;
      }
    }
    while (*__error() == 4 && v9-- != 0);
    if (v10 == -1) {
      break;
    }
    off_t v8 = *a4 + v10;
    *a4 = v8;
    v6 -= v10;
  }
  while (v6);
  return v11;
}

uint64_t sub_1000082C8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
    }
    while (v3);
  }
  BOOL v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100008314(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  size_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  BOOL result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      BOOL result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_1000083C8(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    int v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unsigned int i = *v9; i; unsigned int i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
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
      }
    }
  }
  unsigned int i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
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
    sub_1000085E4(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
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
  unsigned int v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *unsigned int v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
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
    unsigned int v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1000085D0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1000085E4(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_1000086D4(a1, prime);
    }
  }
}

void sub_1000086D4(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1000035DC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    ssize_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

long long *sub_100008830(long long *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a1;
  if (a1 != (long long *)a2)
  {
    uint64_t v5 = a2;
    for (uint64_t i = a2 - (void)a1; ; i -= 56)
    {
      uint64_t v7 = *(void *)(a3 + 24);
      if (!v7) {
LABEL_17:
      }
        sub_100008E1C();
      if (((*(uint64_t (**)(uint64_t, long long *))(*(void *)v7 + 48))(v7, v3) & 1) == 0) {
        break;
      }
      unint64_t v3 = (long long *)((char *)v3 + 56);
      if (v3 == (long long *)v5) {
        return (long long *)v5;
      }
    }
    while (1)
    {
      v5 -= 56;
      if (v3 == (long long *)v5) {
        break;
      }
      uint64_t v8 = *(void *)(a3 + 24);
      if (!v8) {
        goto LABEL_17;
      }
      i -= 56;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v8 + 48))(v8, v5))
      {
        uint64_t v9 = 0x6DB6DB6DB6DB6DB7 * (i >> 3) + 1;
        if (i < 113)
        {
          ssize_t v10 = 0;
          uint64_t v12 = 0;
        }
        else
        {
          ssize_t v10 = sub_100008990(0x6DB6DB6DB6DB6DB7 * (i >> 3) + 1);
          uint64_t v12 = v11;
        }
        unint64_t v3 = sub_100008A04((uint64_t)v3, v5, a3, v9, (unint64_t)v10, v12);
        if (v10) {
          operator delete(v10);
        }
        return v3;
      }
    }
  }
  return v3;
}

void sub_100008978(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008990(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x249249249249249) {
    unint64_t v1 = 0x249249249249249;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    BOOL result = operator new(56 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

long long *sub_100008A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v7 = a2;
  uint64_t v8 = a1;
  if (a4 == 3)
  {
    uint64_t v17 = *(void *)(a3 + 24);
    if (v17)
    {
      uint64_t v18 = (long long *)(v8 + 56);
      if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v17 + 48))(v17, v8 + 56))
      {
        long long v50 = *(_OWORD *)(v8 + 72);
        long long v49 = *(_OWORD *)(v8 + 88);
        long long v51 = *v18;
        uint64_t v52 = *(void *)(v8 + 104);
        long long v54 = *(_OWORD *)(v7 + 16);
        long long v53 = *(_OWORD *)(v7 + 32);
        long long v55 = *(_OWORD *)v7;
        *(unsigned char *)(v8 + 104) = *(unsigned char *)(v7 + 48);
        *(_OWORD *)(v8 + 72) = v54;
        *(_OWORD *)(v8 + 88) = v53;
        long long *v18 = v55;
        *(unsigned char *)(v7 + 48) = v52;
        *(_OWORD *)uint64_t v7 = v51;
        *(_OWORD *)(v7 + 16) = v50;
        *(_OWORD *)(v7 + 32) = v49;
        uint64_t v56 = *(void *)(v8 + 48);
        long long v58 = *(_OWORD *)(v8 + 16);
        long long v57 = *(_OWORD *)(v8 + 32);
        long long v59 = *(_OWORD *)v8;
        long long v60 = *(_OWORD *)(v8 + 72);
        *(_OWORD *)uint64_t v8 = *v18;
        *(_OWORD *)(v8 + 16) = v60;
        *(_OWORD *)(v8 + 32) = *(_OWORD *)(v8 + 88);
        *(unsigned char *)(v8 + 48) = *(unsigned char *)(v8 + 104);
        long long *v18 = v59;
        *(_OWORD *)(v8 + 72) = v58;
        *(_OWORD *)(v8 + 88) = v57;
        uint64_t v7 = v8 + 56;
        *(unsigned char *)(v8 + 104) = v56;
        return (long long *)v7;
      }
      uint64_t v19 = *(void *)(v8 + 48);
      long long v21 = *(_OWORD *)(v8 + 16);
      long long v20 = *(_OWORD *)(v8 + 32);
      long long v22 = *(_OWORD *)v8;
      long long v23 = *(_OWORD *)(v8 + 72);
      *(_OWORD *)uint64_t v8 = *v18;
      *(_OWORD *)(v8 + 16) = v23;
      *(_OWORD *)(v8 + 32) = *(_OWORD *)(v8 + 88);
      *(unsigned char *)(v8 + 48) = *(unsigned char *)(v8 + 104);
      long long *v18 = v22;
      *(_OWORD *)(v8 + 72) = v21;
      *(_OWORD *)(v8 + 88) = v20;
      *(unsigned char *)(v8 + 104) = v19;
      long long v11 = *(_OWORD *)(v8 + 72);
      long long v10 = *(_OWORD *)(v8 + 88);
      long long v12 = *v18;
      uint64_t v13 = *(void *)(v8 + 104);
      long long v25 = *(_OWORD *)(v7 + 16);
      long long v24 = *(_OWORD *)(v7 + 32);
      long long v26 = *(_OWORD *)v7;
      *(unsigned char *)(v8 + 104) = *(unsigned char *)(v7 + 48);
      *(_OWORD *)(v8 + 72) = v25;
      *(_OWORD *)(v8 + 88) = v24;
      long long *v18 = v26;
      goto LABEL_7;
    }
    goto LABEL_33;
  }
  if (a4 == 2)
  {
    long long v11 = *(_OWORD *)(a1 + 16);
    long long v10 = *(_OWORD *)(a1 + 32);
    long long v12 = *(_OWORD *)a1;
    uint64_t v13 = *(void *)(a1 + 48);
    long long v15 = *(_OWORD *)(a2 + 16);
    long long v14 = *(_OWORD *)(a2 + 32);
    long long v16 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v15;
    *(_OWORD *)(a1 + 32) = v14;
    *(_OWORD *)a1 = v16;
LABEL_7:
    *(unsigned char *)(v7 + 48) = v13;
    *(_OWORD *)uint64_t v7 = v12;
    *(_OWORD *)(v7 + 16) = v11;
    *(_OWORD *)(v7 + 32) = v10;
    return (long long *)v7;
  }
  if (a6 < a4)
  {
    if (a4 >= 0) {
      uint64_t v29 = a4;
    }
    else {
      uint64_t v29 = a4 + 1;
    }
    uint64_t v30 = *(void *)(a3 + 24);
    if (v30)
    {
      uint64_t v31 = v29 >> 1;
      v74 = (long long *)(v8 + 56 * (v29 >> 1));
      uint64_t v32 = 56 * (v29 >> 1) - 56;
      uint64_t v33 = v29 >> 1;
      while (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v30 + 48))(v30, v8 + v32) & 1) == 0)
      {
        if (!v32) {
          goto LABEL_28;
        }
        --v33;
        uint64_t v30 = *(void *)(a3 + 24);
        v32 -= 56;
        if (!v30) {
          goto LABEL_33;
        }
      }
      uint64_t v8 = sub_100008A04(v8, v8 + v32, a3, v33, a5, a6);
LABEL_28:
      uint64_t v61 = *(void *)(a3 + 24);
      if (v61)
      {
        long long v62 = (long long *)(v7 + 56);
        uint64_t v63 = a4 - v31;
        BOOL v64 = v74;
        while ((*(unsigned int (**)(uint64_t, long long *))(*(void *)v61 + 48))(v61, v64))
        {
          BOOL v64 = (long long *)((char *)v64 + 56);
          if (v64 == (long long *)v7) {
            return sub_100008EA4((long long *)v8, v74, v62);
          }
          --v63;
          uint64_t v61 = *(void *)(a3 + 24);
          if (!v61) {
            goto LABEL_33;
          }
        }
        long long v62 = (long long *)sub_100008A04(v64, v7, a3, v63, a5, a6);
        return sub_100008EA4((long long *)v8, v74, v62);
      }
    }
LABEL_33:
    sub_100008E1C();
  }
  long long v34 = *(_OWORD *)a1;
  long long v35 = *(_OWORD *)(a1 + 16);
  long long v36 = *(_OWORD *)(a1 + 32);
  *(void *)(a5 + 48) = *(void *)(a1 + 48);
  *(_OWORD *)(a5 + 16) = v35;
  *(_OWORD *)(a5 + 32) = v36;
  *(_OWORD *)a5 = v34;
  unint64_t v37 = a5 + 56;
  uint64_t v38 = a1 + 56;
  if (a1 + 56 == a2)
  {
    long long v65 = *(_OWORD *)a2;
    long long v66 = *(_OWORD *)(a2 + 16);
    long long v67 = *(_OWORD *)(a2 + 32);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v66;
    *(_OWORD *)(a1 + 32) = v67;
    *(_OWORD *)a1 = v65;
LABEL_37:
    uint64_t v68 = 0;
    do
    {
      uint64_t v69 = v38 + v68;
      long long v70 = *(_OWORD *)(a5 + v68);
      long long v71 = *(_OWORD *)(a5 + v68 + 16);
      long long v72 = *(_OWORD *)(a5 + v68 + 32);
      *(unsigned char *)(v69 + 48) = *(unsigned char *)(a5 + v68 + 48);
      *(_OWORD *)(v69 + 16) = v71;
      *(_OWORD *)(v69 + 32) = v72;
      *(_OWORD *)uint64_t v69 = v70;
      v68 += 56;
    }
    while (a5 + v68 < v37);
    return (long long *)v38;
  }
  do
  {
    uint64_t v39 = *(void *)(a3 + 24);
    if (!v39) {
      goto LABEL_33;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v39 + 48))(v39, v38))
    {
      long long v40 = *(_OWORD *)v38;
      long long v41 = *(_OWORD *)(v38 + 16);
      long long v42 = *(_OWORD *)(v38 + 32);
      *(unsigned char *)(v8 + 48) = *(unsigned char *)(v38 + 48);
      *(_OWORD *)(v8 + 16) = v41;
      *(_OWORD *)(v8 + 32) = v42;
      *(_OWORD *)uint64_t v8 = v40;
      v8 += 56;
    }
    else
    {
      long long v43 = *(_OWORD *)v38;
      long long v44 = *(_OWORD *)(v38 + 16);
      long long v45 = *(_OWORD *)(v38 + 32);
      *(void *)(v37 + 48) = *(void *)(v38 + 48);
      *(_OWORD *)(v37 + 16) = v44;
      *(_OWORD *)(v37 + 32) = v45;
      *(_OWORD *)unint64_t v37 = v43;
      v37 += 56;
    }
    v38 += 56;
  }
  while (v38 != v7);
  long long v46 = *(_OWORD *)v7;
  long long v47 = *(_OWORD *)(v7 + 16);
  long long v48 = *(_OWORD *)(v7 + 32);
  *(unsigned char *)(v8 + 48) = *(unsigned char *)(v7 + 48);
  *(_OWORD *)(v8 + 16) = v47;
  *(_OWORD *)(v8 + 32) = v48;
  *(_OWORD *)uint64_t v8 = v46;
  uint64_t v38 = v8 + 56;
  uint64_t v7 = v8 + 56;
  if (v37 > a5) {
    goto LABEL_37;
  }
  return (long long *)v7;
}

void sub_100008E1C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_10000C868;
}

void sub_100008E6C(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

long long *sub_100008EA4(long long *__src, long long *a2, long long *a3)
{
  BOOL v3 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if ((long long *)((char *)__src + 56) == a2)
    {
      long long v7 = *__src;
      long long v9 = __src[1];
      long long v11 = __src[2];
      uint64_t v13 = *((void *)__src + 6);
      int64_t v5 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2 - 7);
      BOOL v3 = (long long *)((char *)__src + v5);
      *BOOL v3 = v7;
      v3[1] = v9;
      v3[2] = v11;
      *((unsigned char *)v3 + 48) = v13;
    }
    else if ((long long *)((char *)a2 + 56) == a3)
    {
      BOOL v3 = (long long *)((char *)__src + 56);
      long long v8 = *(long long *)((char *)a3 - 56);
      long long v10 = *(long long *)((char *)a3 - 40);
      long long v12 = *(long long *)((char *)a3 - 24);
      uint64_t v14 = *((void *)a3 - 1);
      if ((long long *)((char *)a3 - 56) != __src) {
        memmove((char *)__src + 56, __src, (char *)a3 - 56 - (char *)__src - 7);
      }
      *__src = v8;
      __src[1] = v10;
      __src[2] = v12;
      *((unsigned char *)__src + 48) = v14;
    }
    else
    {
      return sub_100008FF4(__src, a2, a3);
    }
  }
  return v3;
}

long long *sub_100008FF4(long long *a1, long long *a2, long long *a3)
{
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0x6DB6DB6DB6DB6DB7 * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = (uint64_t)a1 + v4;
        long long v7 = *(long long *)((char *)a1 + v4 + 16);
        long long v6 = *(long long *)((char *)a1 + v4 + 32);
        uint64_t v8 = (uint64_t)a2 + v4;
        long long v9 = *(long long *)((char *)a1 + v4);
        uint64_t v10 = *(void *)((char *)a1 + v4 + 48);
        long long v12 = *(long long *)((char *)a2 + v4 + 16);
        long long v11 = *(long long *)((char *)a2 + v4 + 32);
        long long v13 = *(long long *)((char *)a2 + v4);
        *(unsigned char *)(v5 + 48) = *((unsigned char *)a2 + v4 + 48);
        *(_OWORD *)(v5 + 16) = v12;
        *(_OWORD *)(v5 + 32) = v11;
        *(_OWORD *)uint64_t v5 = v13;
        *(unsigned char *)(v8 + 48) = v10;
        *(_OWORD *)uint64_t v8 = v9;
        *(_OWORD *)(v8 + 16) = v7;
        *(_OWORD *)(v8 + 32) = v6;
        if ((long long *)((char *)a1 + v4 + 56) == a2) {
          break;
        }
        v4 += 56;
      }
      while ((long long *)(v8 + 56) != a3);
    }
  }
  else
  {
    uint64_t v14 = 0x6DB6DB6DB6DB6DB7 * (((char *)a3 - (char *)a2) >> 3);
    uint64_t v15 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      uint64_t v16 = v15;
      uint64_t v15 = v14;
      uint64_t v14 = v16 % v14;
    }
    while (v14);
    if (v15)
    {
      uint64_t v17 = (long long *)((char *)a1 + 56 * v15);
      do
      {
        long long v18 = *(long long *)((char *)v17 - 56);
        long long v19 = *(long long *)((char *)v17 - 40);
        long long v20 = *(long long *)((char *)v17 - 24);
        uint64_t v21 = *((void *)v17 - 1);
        uint64_t v17 = (long long *)((char *)v17 - 56);
        long long v33 = v18;
        long long v34 = v19;
        long long v35 = v20;
        char v36 = v21;
        long long v22 = (long long *)((char *)v17 + 8 * (((char *)a2 - (char *)a1) >> 3));
        long long v23 = v17;
        do
        {
          long long v24 = v23;
          long long v23 = v22;
          long long v25 = *v22;
          long long v26 = v22[1];
          long long v27 = v22[2];
          *((unsigned char *)v24 + 48) = *((unsigned char *)v22 + 48);
          v24[1] = v26;
          v24[2] = v27;
          *long long v24 = v25;
          uint64_t v28 = 0x6DB6DB6DB6DB6DB7 * (((char *)a3 - (char *)v22) >> 3);
          BOOL v29 = __OFSUB__(v3, v28);
          uint64_t v31 = v3 - v28;
          char v30 = (v31 < 0) ^ v29;
          long long v22 = (long long *)((char *)a1 + 56 * v31);
          if (v30) {
            long long v22 = (long long *)((char *)v23 + 8 * (((char *)a2 - (char *)a1) >> 3));
          }
        }
        while (v22 != v17);
        *((unsigned char *)v23 + 48) = v36;
        v23[1] = v34;
        v23[2] = v35;
        *long long v23 = v33;
      }
      while (v17 != a1);
    }
    return (long long *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

uint64_t sub_1000091A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *sub_10000923C(void *a1)
{
  int8x8_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

long long *sub_1000092C0(long long *a1, long long *a2, void **a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  long long v7 = a2;
  uint64_t v8 = a1;
  if (a4 == 3)
  {
    uint64_t v17 = (long long *)((char *)a1 + 56);
    long long v18 = *a3;
    v81[0] = *((void *)v8 + 9);
    if (!sub_1000096C0(v18, v81))
    {
      long long v51 = *(long long *)((char *)v8 + 72);
      long long v50 = *(long long *)((char *)v8 + 88);
      long long v52 = *v17;
      uint64_t v53 = *((void *)v8 + 13);
      long long v55 = v7[1];
      long long v54 = v7[2];
      long long v56 = *v7;
      *((unsigned char *)v8 + 104) = *((unsigned char *)v7 + 48);
      *(long long *)((char *)v8 + 72) = v55;
      *(long long *)((char *)v8 + 88) = v54;
      *uint64_t v17 = v56;
      *((unsigned char *)v7 + 48) = v53;
      long long *v7 = v52;
      v7[1] = v51;
      v7[2] = v50;
      uint64_t v57 = *((void *)v8 + 6);
      long long v59 = v8[1];
      long long v58 = v8[2];
      long long v60 = *v8;
      long long v61 = *(long long *)((char *)v8 + 72);
      long long *v8 = *v17;
      v8[1] = v61;
      _OWORD v8[2] = *(long long *)((char *)v8 + 88);
      *((unsigned char *)v8 + 48) = *((unsigned char *)v8 + 104);
      *uint64_t v17 = v60;
      *(long long *)((char *)v8 + 72) = v59;
      *(long long *)((char *)v8 + 88) = v58;
      long long v7 = (long long *)((char *)v8 + 56);
      *((unsigned char *)v8 + 104) = v57;
      return v7;
    }
    uint64_t v19 = *((void *)v8 + 6);
    long long v21 = v8[1];
    long long v20 = v8[2];
    long long v22 = *v8;
    long long v23 = *(long long *)((char *)v8 + 72);
    long long *v8 = *v17;
    v8[1] = v23;
    _OWORD v8[2] = *(long long *)((char *)v8 + 88);
    *((unsigned char *)v8 + 48) = *((unsigned char *)v8 + 104);
    *uint64_t v17 = v22;
    *(long long *)((char *)v8 + 72) = v21;
    *(long long *)((char *)v8 + 88) = v20;
    *((unsigned char *)v8 + 104) = v19;
    long long v11 = *(long long *)((char *)v8 + 72);
    long long v10 = *(long long *)((char *)v8 + 88);
    long long v12 = *v17;
    uint64_t v13 = *((void *)v8 + 13);
    long long v25 = v7[1];
    long long v24 = v7[2];
    long long v26 = *v7;
    *((unsigned char *)v8 + 104) = *((unsigned char *)v7 + 48);
    *(long long *)((char *)v8 + 72) = v25;
    *(long long *)((char *)v8 + 88) = v24;
    *uint64_t v17 = v26;
    goto LABEL_6;
  }
  if (a4 == 2)
  {
    long long v11 = a1[1];
    long long v10 = a1[2];
    long long v12 = *a1;
    uint64_t v13 = *((void *)a1 + 6);
    long long v15 = a2[1];
    long long v14 = a2[2];
    long long v16 = *a2;
    *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
    a1[1] = v15;
    a1[2] = v14;
    *a1 = v16;
LABEL_6:
    *((unsigned char *)v7 + 48) = v13;
    long long *v7 = v12;
    v7[1] = v11;
    v7[2] = v10;
    return v7;
  }
  if (a6 >= a4)
  {
    long long v35 = *a1;
    long long v36 = a1[1];
    long long v37 = a1[2];
    *(void *)(a5 + 48) = *((void *)a1 + 6);
    *(_OWORD *)(a5 + 16) = v36;
    *(_OWORD *)(a5 + 32) = v37;
    *(_OWORD *)a5 = v35;
    unint64_t v38 = a5 + 56;
    uint64_t v39 = (long long *)((char *)a1 + 56);
    if ((long long *)((char *)a1 + 56) == a2)
    {
      long long v71 = *a2;
      long long v72 = a2[1];
      long long v73 = a2[2];
      *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
      a1[1] = v72;
      a1[2] = v73;
      *a1 = v71;
    }
    else
    {
      do
      {
        long long v40 = *a3;
        v81[0] = *((void *)v39 + 2);
        if (sub_1000096C0(v40, v81))
        {
          long long v41 = *v39;
          long long v42 = v39[1];
          long long v43 = v39[2];
          *((unsigned char *)v8 + 48) = *((unsigned char *)v39 + 48);
          v8[1] = v42;
          _OWORD v8[2] = v43;
          long long *v8 = v41;
          uint64_t v8 = (long long *)((char *)v8 + 56);
        }
        else
        {
          long long v44 = *v39;
          long long v45 = v39[1];
          long long v46 = v39[2];
          *(void *)(v38 + 48) = *((void *)v39 + 6);
          *(_OWORD *)(v38 + 16) = v45;
          *(_OWORD *)(v38 + 32) = v46;
          *(_OWORD *)unint64_t v38 = v44;
          v38 += 56;
        }
        uint64_t v39 = (long long *)((char *)v39 + 56);
      }
      while (v39 != v7);
      long long v47 = *v7;
      long long v48 = v7[1];
      long long v49 = v7[2];
      *((unsigned char *)v8 + 48) = *((unsigned char *)v7 + 48);
      v8[1] = v48;
      _OWORD v8[2] = v49;
      long long *v8 = v47;
      uint64_t v39 = (long long *)((char *)v8 + 56);
      long long v7 = (long long *)((char *)v8 + 56);
      if (v38 <= a5) {
        return v7;
      }
    }
    uint64_t v74 = 0;
    do
    {
      uint64_t v75 = (uint64_t)v39 + v74;
      long long v76 = *(_OWORD *)(a5 + v74);
      long long v77 = *(_OWORD *)(a5 + v74 + 16);
      long long v78 = *(_OWORD *)(a5 + v74 + 32);
      *(unsigned char *)(v75 + 48) = *(unsigned char *)(a5 + v74 + 48);
      *(_OWORD *)(v75 + 16) = v77;
      *(_OWORD *)(v75 + 32) = v78;
      *(_OWORD *)uint64_t v75 = v76;
      v74 += 56;
    }
    while (a5 + v74 < v38);
    return v39;
  }
  if (a4 >= 0) {
    uint64_t v29 = a4;
  }
  else {
    uint64_t v29 = a4 + 1;
  }
  uint64_t v30 = v29 >> 1;
  uint64_t v31 = (long long *)((char *)a1 + 56 * (v29 >> 1));
  uint64_t v32 = (char *)v31 - 56;
  long long v33 = *a3;
  v81[0] = *((void *)v31 - 5);
  if (sub_1000096C0(v33, v81))
  {
    uint64_t v34 = v30;
LABEL_25:
    BOOL v64 = (long long *)sub_1000092C0(v8, v32, a3, v34, a5, a6);
  }
  else
  {
    uint64_t v80 = v31;
    uint64_t v62 = 56 - 56 * v30;
    uint64_t v34 = v30;
    while (v62)
    {
      --v34;
      uint64_t v63 = *a3;
      v81[0] = *((void *)v32 - 5);
      v62 += 56;
      v32 -= 56;
      if (sub_1000096C0(v63, v81))
      {
        uint64_t v32 = (char *)v8 - v62;
        uint64_t v31 = v80;
        goto LABEL_25;
      }
    }
    BOOL v64 = v8;
    uint64_t v31 = v80;
  }
  uint64_t v65 = a4 - v30;
  long long v66 = *a3;
  v81[0] = *((void *)v8 + 7 * v30 + 2);
  if (sub_1000096C0(v66, v81))
  {
    long long v67 = (long long *)((char *)v7 + 56);
    uint64_t v68 = (uint64_t)v8 + 56 * v30 + 56;
    while ((long long *)v68 != v7)
    {
      --v65;
      uint64_t v69 = *a3;
      v81[0] = *(void *)(v68 + 16);
      v68 += 56;
      if (!sub_1000096C0(v69, v81))
      {
        long long v70 = (long long *)(v68 - 56);
        goto LABEL_36;
      }
    }
  }
  else
  {
    long long v70 = v31;
LABEL_36:
    long long v67 = (long long *)sub_1000092C0(v70, v7, a3, v65, a5, a6);
  }
  return sub_100008EA4(v64, v31, v67);
}

void *sub_1000096C0(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  long long v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  BOOL result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      BOOL result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void sub_100009778()
{
}

__n128 sub_10000978C(uint64_t a1)
{
  int8x8_t v2 = (char *)operator new(0x18uLL);
  *(void *)int8x8_t v2 = off_10000C890;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_1000097D8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_10000C890;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL sub_100009808(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32) == -2 && *(unsigned char *)(a1 + 16) == 0) {
    return 0;
  }
  unint64_t v3 = *(uint64_t **)(a1 + 8);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (*v3 == v5) {
    return 0;
  }
  do
  {
    BOOL result = sub_1000056C0(v4, a2);
    if (result) {
      break;
    }
    v4 += 56;
  }
  while (v4 != v5);
  return result;
}

uint64_t sub_100009878(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_1000098B8()
{
}

BOOL sub_1000098C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_100009918()
{
}

__n128 sub_10000992C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = off_10000C920;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_100009978(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_10000C920;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1000099A8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32) == -2) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (*v2 >= *(void *)(a1 + 8)) {
    return 0;
  }
  *v2 += *(unsigned int *)(a2 + 36);
  return 1;
}

uint64_t sub_1000099E0(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

_UNKNOWN **sub_100009A20()
{
}

void **sub_100009A2C(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    xpc_retain(v3);
  }
  return a1;
}

void *sub_100009A60(void *result, void *a2)
{
  *__n128 result = *a2;
  *a2 = 0;
  return result;
}

void **sub_100009A70(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

uint64_t sub_100009AA8(uint64_t a1)
{
  return *(void *)a1;
}

BOOL sub_100009AB0(void *a1)
{
  return *a1 != 0;
}

xpc_type_t sub_100009AC0(xpc_type_t *a1)
{
  xpc_type_t result = *a1;
  if (result) {
    return xpc_get_type(result);
  }
  return result;
}

xpc_object_t *sub_100009AD0(xpc_object_t *a1)
{
  *a1 = xpc_dictionary_create(0, 0, 0);
  return a1;
}

void *sub_100009B08(void *a1, xpc_object_t object, int a3)
{
  *a1 = object;
  if (object && a3) {
    xpc_retain(object);
  }
  return a1;
}

void sub_100009B40(xpc_object_t *a1, const char *a2, uint64_t a3)
{
}

uint64_t sub_100009B48(xpc_object_t *a1, const char *a2)
{
  return xpc_dictionary_get_uint64(*a1, a2);
}

void sub_100009B50(xpc_object_t *a1, const char *a2, double a3)
{
}

const void *sub_100009B58(xpc_object_t *a1, const char *a2, size_t *a3)
{
  return xpc_dictionary_get_data(*a1, a2, a3);
}

void sub_100009B60(xpc_object_t *a1, const char *a2, void *a3)
{
}

xpc_object_t sub_100009B68@<X0>(xpc_object_t *a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_dictionary_get_value(*a1, a2);
  *a3 = result;
  if (result)
  {
    return xpc_retain(result);
  }
  return result;
}

xpc_object_t sub_100009BB4@<X0>(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  xpc_object_t result = xpc_dictionary_create_reply(*a1);
  *a2 = result;
  return result;
}

xpc_object_t *sub_100009BE0(xpc_object_t *a1)
{
  *a1 = xpc_array_create(0, 0);
  return a1;
}

size_t sub_100009C14(xpc_object_t *a1)
{
  return xpc_array_get_count(*a1);
}

void sub_100009C1C(xpc_object_t *a1, xpc_object_t value)
{
}

xpc_object_t sub_100009C2C@<X0>(xpc_object_t *a1@<X0>, size_t a2@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_array_get_value(*a1, a2);
  *a3 = result;
  if (result)
  {
    return xpc_retain(result);
  }
  return result;
}

void sub_100009C78(xpc_object_t *a1, size_t a2, uint64_t a3)
{
}

uint64_t sub_100009C80(xpc_object_t *a1, size_t a2)
{
  return xpc_array_get_uint64(*a1, a2);
}

void sub_100009C88(xpc_object_t *a1, size_t a2, const unsigned __int8 *a3)
{
}

const uint8_t *sub_100009C90(xpc_object_t *a1, size_t a2)
{
  return xpc_array_get_uuid(*a1, a2);
}

uint64_t sub_100009C98(uint64_t a1, uint64_t a2)
{
  __uint64_t v8 = 0;
  pthread_threadid_np(0, &v8);
  pthread_mutex_lock(&stru_100010058);
  uint64_t v4 = qword_1000100A0;
  *(void *)(a1 + 8) = qword_1000100A0;
  __uint64_t v5 = v8;
  if (v4) {
    BOOL v6 = qword_1000100F0 == v8;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    qword_1000100A0 = a2;
    *(unsigned char *)a1 = 1;
    qword_1000100F0 = v5;
  }
  else
  {
    *(unsigned char *)a1 = 0;
  }
  pthread_mutex_unlock(&stru_100010058);
  return a1;
}

uint64_t sub_100009D34(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    pthread_mutex_lock(&stru_100010058);
    qword_1000100A0 = *(void *)(a1 + 8);
    pthread_mutex_unlock(&stru_100010058);
  }
  return a1;
}

void sub_100009D90(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

uint64_t sub_100009DB8(const char *a1)
{
  uint64_t result = printf("ASSERT(%s) %s %d, %s\n", "page_aligned_mmap_archive_size > 8 && *reinterpret_cast<const uint64_t *>(mmap_archive) != 0", a1, 951, "Empty archive");
  if (qword_1000100A0) {
    return printf("__crashreporter_info__: %s\n", (const char *)qword_1000100A0);
  }
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return _CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
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

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
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

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

int putchar(int a1)
{
  return _putchar(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uint64(xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uuid(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
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

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return _xpc_shmem_create(region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return _xpc_shmem_map(xshmem, region);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}