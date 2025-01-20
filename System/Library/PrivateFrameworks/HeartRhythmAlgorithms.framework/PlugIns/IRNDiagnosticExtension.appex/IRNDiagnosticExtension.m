void sub_100003FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void **a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,void **a27,uint64_t a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Block_object_dispose(&a29, 8);
  a27 = a11;
  sub_100006A68(&a27);

  _Unwind_Resume(a1);
}

__n128 sub_1000040EC(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_100004110(uint64_t a1)
{
  v1 = (void **)(a1 + 48);
  sub_100006A68(&v1);
}

void sub_10000413C(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSampleQuery);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  v5 = +[NSArray arrayWithObjects:&v12 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000042C4;
  v9[3] = &unk_1000103E8;
  id v10 = *(id *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = [v2 initWithSampleType:v3 predicate:v4 limit:0 sortDescriptors:v5 resultsHandler:v9];

  [*(id *)(a1 + 64) executeQuery:v7];
}

void sub_100004284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1000042C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v17 = a4;
  if (v17)
  {
    long long v8 = irn_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v17, "localizedDescription", v16);
      sub_10000C8F8(v9, (uint8_t *)&buf, v8);
    }
LABEL_4:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_5;
  }
  if (!objc_msgSend(v7, "count", v16))
  {
    long long v8 = irn_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HealthStore did not return any tachograms", (uint8_t *)&buf, 2u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    id v10 = irn_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "count of tachs = %{public}lu", (uint8_t *)&buf, 0xCu);
    }

    id v20 = [v7 count];
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v7;
    id v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v11)
    {
      uint64_t v19 = *(void *)v33;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v38 = 0x5812000000;
          v39 = sub_1000047AC;
          v40 = sub_1000047E4;
          v41 = "#0";
          memset(v42, 0, 24);
          id v43 = 0;
          v28[0] = 0;
          v28[1] = (void **)v28;
          v28[2] = (void **)0x4812000000;
          v28[3] = (void **)sub_100004860;
          v28[4] = (void **)sub_100004884;
          v28[5] = (void **)&unk_10000F7A9;
          v30 = 0;
          uint64_t v31 = 0;
          __p = 0;
          id v14 = objc_alloc((Class)HKHeartbeatSeriesQuery);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10000489C;
          v21[3] = &unk_1000103C0;
          v23 = v28;
          p_long long buf = &buf;
          v21[4] = v13;
          uint64_t v25 = *(void *)(a1 + 48);
          v26 = v36;
          id v27 = v20;
          id v22 = *(id *)(a1 + 32);
          id v15 = [v14 initWithHeartbeatSeries:v13 dataHandler:v21];
          [*(id *)(a1 + 40) executeQuery:v15];

          _Block_object_dispose(v28, 8);
          if (__p)
          {
            v30 = __p;
            operator delete(__p);
          }
          _Block_object_dispose(&buf, 8);

          v28[0] = (void **)v42;
          sub_100005D28(v28);
        }
        id v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(v36, 8);
  }
LABEL_5:
}

void sub_1000046E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Unwind_Resume(a1);
}

double sub_1000047AC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 48) = 0;
  double result = *(double *)(a2 + 72);
  *(double *)(a1 + 72) = result;
  uint64_t v3 = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  *(void *)(a1 + 80) = v3;
  return result;
}

void sub_1000047E4(uint64_t a1)
{
  v1 = (void **)(a1 + 48);

  id v2 = v1;
  sub_100005D28(&v2);
}

void **sub_100004820(void **a1)
{
  uint64_t v3 = a1;
  sub_100005D28(&v3);
  return a1;
}

__n128 sub_100004860(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_100004884(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_10000489C(uint64_t a1, void *a2, int a3, int a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a5;
  if (a3)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void *)(v13 + 48);
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v14 = v13 + 48;
    if (v16 != v15)
    {
      id v17 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
      v18 = v17 + 6;
      unint64_t v19 = v17[7];
      if (v19 >= v17[8])
      {
        uint64_t v20 = sub_100006B78(v18, v14);
      }
      else
      {
        sub_100006B24((uint64_t)v18, v14);
        uint64_t v20 = v19 + 24;
      }
      v17[7] = v20;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 48);
    }
  }
  v21 = *(void **)(*(void *)(a1 + 48) + 8);
  id v22 = (double *)v21[7];
  unint64_t v23 = v21[8];
  if ((unint64_t)v22 >= v23)
  {
    uint64_t v25 = (double *)v21[6];
    uint64_t v26 = v22 - v25;
    if ((unint64_t)(v26 + 1) >> 61) {
      sub_1000062F4();
    }
    unint64_t v27 = v23 - (void)v25;
    unint64_t v28 = (uint64_t)(v23 - (void)v25) >> 2;
    if (v28 <= v26 + 1) {
      unint64_t v28 = v26 + 1;
    }
    if (v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v28;
    }
    if (v29)
    {
      v30 = (char *)sub_100006D50((uint64_t)(v21 + 8), v29);
      uint64_t v25 = (double *)v21[6];
      id v22 = (double *)v21[7];
    }
    else
    {
      v30 = 0;
    }
    uint64_t v31 = (double *)&v30[8 * v26];
    long long v32 = &v30[8 * v29];
    *uint64_t v31 = a6;
    v24 = v31 + 1;
    while (v22 != v25)
    {
      uint64_t v33 = *((void *)v22-- - 1);
      *((void *)v31-- - 1) = v33;
    }
    v21[6] = v31;
    v21[7] = v24;
    v21[8] = v32;
    if (v25) {
      operator delete(v25);
    }
  }
  else
  {
    *id v22 = a6;
    v24 = v22 + 1;
  }
  v21[7] = v24;
  long long v34 = irn_get_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v52 = [*(id *)(a1 + 32) UUID];
    int v53 = 138412802;
    v54 = v52;
    __int16 v55 = 2048;
    double v56 = a6;
    __int16 v57 = 1024;
    int v58 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "uuid : %@, timeSinceSeriesStart : %f, done : %d", (uint8_t *)&v53, 0x1Cu);
  }
  if (a4)
  {
    uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v37 = *(void *)(v35 + 48);
    uint64_t v38 = *(void *)(v35 + 56);
    uint64_t v36 = v35 + 48;
    if (v37 != v38)
    {
      v39 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
      v40 = v39 + 6;
      unint64_t v41 = v39[7];
      if (v41 >= v39[8])
      {
        uint64_t v42 = sub_100006B78(v40, v36);
      }
      else
      {
        sub_100006B24((uint64_t)v40, v36);
        uint64_t v42 = v41 + 24;
      }
      v39[7] = v42;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 48);
    }
    uint64_t v43 = [*(id *)(a1 + 32) UUID];
    uint64_t v44 = *(void *)(*(void *)(a1 + 56) + 8);
    v45 = *(void **)(v44 + 80);
    *(void *)(v44 + 80) = v43;

    v46 = [*(id *)(a1 + 32) startDate];
    [v46 timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 72) = v47;

    v48 = *(uint64_t **)(*(void *)(a1 + 64) + 8);
    unint64_t v49 = v48[7];
    if (v49 >= v48[8])
    {
      uint64_t v50 = sub_100007000(v48 + 6, *(void *)(*(void *)(a1 + 56) + 8) + 48);
    }
    else
    {
      sub_100007110((uint64_t)(v48 + 8), (void *)v48[7], *(void *)(*(void *)(a1 + 56) + 8) + 48);
      uint64_t v50 = v49 + 40;
      v48[7] = v49 + 40;
    }
    v48[7] = v50;
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    v51 = irn_get_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      sub_10000C950(a1 + 72, a1, v51);
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == *(void *)(a1 + 80)) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }
}

void sub_100004C10(_Unwind_Exception *a1)
{
  *(void *)(v4 + 56) = v3;

  _Unwind_Resume(a1);
}

void sub_100005078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a36 < 0) {
    operator delete(a31);
  }

  _Unwind_Resume(a1);
}

void (__cdecl ***sub_100005168(void (__cdecl ***a1)(std::ofstream *__hidden this)))(std::ofstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  uint64_t v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 1);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_1000052FC(_Unwind_Exception *a1)
{
}

uint64_t sub_100005334(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      id v10 = (char *)sub_100007C74((char *)a1);
      sub_100007FB0(&v13, v10);
      id v11 = std::string::insert(&v13, 0, "cannot use emplace_back() with ");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
      long long v14 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      sub_10000788C(311, (uint64_t)&v14, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
    sub_100005DD4(a1);
  }
  v5 = *(uint64_t **)(a1 + 8);
  unint64_t v6 = v5[1];
  if (v6 >= v5[2])
  {
    uint64_t v7 = sub_1000092C8(v5, a2);
  }
  else
  {
    *(unsigned char *)unint64_t v6 = *(unsigned char *)a2;
    *(void *)(v6 + 8) = *(void *)(a2 + 8);
    sub_100005DD4(a2);
    *(unsigned char *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    sub_100005DD4(v6);
    uint64_t v7 = v6 + 16;
  }
  v5[1] = v7;
  return v7 - 16;
}

void sub_10000547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t **sub_1000054DC(uint64_t **a1)
{
  return a1;
}

double sub_100005510@<D0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)sub_100007C74((char *)a1);
      sub_100007FB0(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)id v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      sub_10000788C(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    long long v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *long long v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    sub_100005DD4(a1);
  }
  v9 = sub_1000093BC(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  sub_10000966C(v17, a1);
  sub_1000095E0((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_100005660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double sub_1000056C0@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)sub_100007C74((char *)a1);
      sub_100007FB0(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)id v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      sub_10000788C(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    long long v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *long long v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    sub_100005DD4(a1);
  }
  v9 = sub_1000096BC(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  sub_10000966C(v17, a1);
  sub_1000095E0((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_100005810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double sub_100005870@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)sub_100007C74((char *)a1);
      sub_100007FB0(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)id v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      sub_10000788C(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    long long v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *long long v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    sub_100005DD4(a1);
  }
  v9 = sub_100009848(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  sub_10000966C(v17, a1);
  sub_1000095E0((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_1000059C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

uint64_t *sub_100005A20(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  v5 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v6 = *((void *)v5 + 3);
  *((void *)v5 + 3) = 0;
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_1000104C0;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)off_100010510;
  v7[1].__shared_owners_ = (uint64_t)a1;
  long long v12 = v7 + 1;
  std::string v13 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v8 = (const std::ios_base *)((char *)a1 + *(void *)(v4 - 24));
  std::ios_base::fmtflags fmtflags = v8[1].__fmtflags_;
  if (fmtflags == -1)
  {
    std::ios_base::getloc(v8);
    char v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
    std::ios_base::fmtflags fmtflags = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v14);
    v8[1].__fmtflags_ = fmtflags;
  }
  sub_10000AB6C((uint64_t)v15, (uint64_t)&v12, (char)fmtflags, 0);
  if (v13) {
    sub_10000AAF8(v13);
  }
  sub_10000AAF8(v7);
  sub_1000099E0(v15, a2, v6 > 0, 0, v6 & ~(v6 >> 63), 0);
  sub_10000C4F4((uint64_t)v15);
  return a1;
}

void sub_100005C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, char a12)
{
  std::locale::~locale(&a11);
  sub_10000AAF8(v12);
  sub_10000AAF8(v12);
  _Unwind_Resume(a1);
}

void *sub_100005C48(void *a1)
{
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void sub_100005D14(void *a1)
{
}

void sub_100005D28(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_100005D7C((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100005D7C(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t sub_100005DD4(uint64_t result)
{
  switch(*(unsigned char *)result)
  {
    case 1:
      if (*(void *)(result + 8)) {
        return result;
      }
      v1 = "m_type != value_t::object or m_value.object != nullptr";
      int v2 = 1220;
      break;
    case 2:
      if (*(void *)(result + 8)) {
        return result;
      }
      v1 = "m_type != value_t::array or m_value.array != nullptr";
      int v2 = 1221;
      break;
    case 3:
      if (*(void *)(result + 8)) {
        return result;
      }
      v1 = "m_type != value_t::string or m_value.string != nullptr";
      int v2 = 1222;
      break;
    case 8:
      if (*(void *)(result + 8)) {
        return result;
      }
      v1 = "m_type != value_t::binary or m_value.binary != nullptr";
      int v2 = 1223;
      break;
    default:
      return result;
  }
  __assert_rtn("assert_invariant", "json.hpp", v2, v1);
}

void sub_100005EB0(uint64_t **a1, int a2)
{
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  unint64_t v26 = 0;
  int v3 = a2 - 1;
  if (a2 == 1)
  {
    sub_100006200(&v24, (*a1)[2]);
    uint64_t v4 = (uint64_t)(*a1 + 1);
    v5 = (void *)**a1;
    if (v5 != (void *)v4)
    {
      unint64_t v6 = v25;
      do
      {
        if (v6 >= v26)
        {
          unint64_t v6 = sub_100006798(&v24, (uint64_t)(v5 + 7));
        }
        else
        {
          *(unsigned char *)unint64_t v6 = *((unsigned char *)v5 + 56);
          *(void *)(v6 + 8) = v5[8];
          sub_100005DD4((uint64_t)(v5 + 7));
          *((unsigned char *)v5 + 56) = 0;
          v5[8] = 0;
          sub_100005DD4(v6);
          v6 += 16;
        }
        unint64_t v25 = v6;
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            long long v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            long long v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            v5 = v8;
          }
          while (!v9);
        }
        v5 = v8;
      }
      while (v8 != (void *)v4);
    }
  }
  else if (a2 == 2)
  {
    sub_100006200(&v24, ((*a1)[1] - **a1) >> 4);
    sub_1000066F4((uint64_t)&v22, **a1, (*a1)[1], &v24);
  }
  for (unint64_t i = v25; v24 != v25; unint64_t i = v25)
  {
    char v12 = *(unsigned char *)(i - 16);
    uint64_t v11 = i - 16;
    LOBYTE(v22) = v12;
    int v23 = *(uint64_t **)(v11 + 8);
    sub_100005DD4(v11);
    *(unsigned char *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    sub_100005DD4((uint64_t)&v22);
    sub_10000688C((uint64_t)&v24, v25 - 16);
    if (v22 == 1)
    {
      std::string v13 = v23;
      std::locale v14 = v23 + 1;
      std::string::size_type v15 = (void *)*v23;
      if ((uint64_t *)*v23 != v23 + 1)
      {
        unint64_t v16 = v25;
        do
        {
          if (v16 >= v26)
          {
            unint64_t v16 = sub_100006798(&v24, (uint64_t)(v15 + 7));
          }
          else
          {
            *(unsigned char *)unint64_t v16 = *((unsigned char *)v15 + 56);
            *(void *)(v16 + 8) = v15[8];
            sub_100005DD4((uint64_t)(v15 + 7));
            *((unsigned char *)v15 + 56) = 0;
            v15[8] = 0;
            sub_100005DD4(v16);
            v16 += 16;
          }
          unint64_t v25 = v16;
          id v17 = (void *)v15[1];
          if (v17)
          {
            do
            {
              std::string v18 = v17;
              id v17 = (void *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              std::string v18 = (void *)v15[2];
              BOOL v9 = *v18 == (void)v15;
              std::string::size_type v15 = v18;
            }
            while (!v9);
          }
          std::string::size_type v15 = v18;
        }
        while (v18 != v14);
        std::string v13 = v23;
      }
      sub_1000068F0((uint64_t)v13, (char *)v13[1]);
      *std::string v13 = (uint64_t)(v13 + 1);
      v13[2] = 0;
      v13[1] = 0;
    }
    else if (v22 == 2)
    {
      sub_1000066F4((uint64_t)&v27, *v23, v23[1], &v24);
      sub_100006294(v23);
    }
    sub_100005DD4((uint64_t)&v22);
    sub_100005EB0(&v23, v22);
  }
  switch(v3)
  {
    case 0:
      sub_1000068F0((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_41;
    case 1:
      int v22 = (void **)*a1;
      sub_1000069C4(&v22);
      goto LABEL_41;
    case 2:
      unint64_t v19 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0) {
        goto LABEL_42;
      }
      uint64_t v20 = (void *)*v19;
      break;
    case 7:
      unint64_t v19 = *a1;
      v21 = (void *)**a1;
      if (!v21) {
        goto LABEL_42;
      }
      v19[1] = (uint64_t)v21;
      uint64_t v20 = v21;
      break;
    default:
      goto LABEL_43;
  }
  operator delete(v20);
LABEL_41:
  unint64_t v19 = *a1;
LABEL_42:
  operator delete(v19);
LABEL_43:
  int v22 = (void **)&v24;
  sub_1000069C4(&v22);
}

uint64_t sub_100006200(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      sub_1000062F4();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_100006414(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    sub_10000630C(a1, v7);
    return sub_100006660((uint64_t)v7);
  }
  return result;
}

void sub_100006280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100006660((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100006294(void *result)
{
  v1 = result;
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  if (v2 != *result)
  {
    uint64_t v4 = v2 - 16;
    uint64_t v5 = (unsigned __int8 *)(v2 - 16);
    do
    {
      sub_100005DD4(v4);
      unsigned int v6 = *v5;
      v5 -= 16;
      uint64_t result = (void *)sub_100005EB0(v4 + 8, v6);
      BOOL v7 = v4 == v3;
      uint64_t v4 = (uint64_t)v5;
    }
    while (!v7);
  }
  v1[1] = v3;
  return result;
}

void sub_1000062F4()
{
}

uint64_t sub_10000630C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100006480((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_100006384(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000063E0(exception, a1);
}

void sub_1000063CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000063E0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100006414(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_10000644C();
  }
  return operator new(16 * a2);
}

void sub_10000644C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_100006480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  char v15 = 0;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3 - 16;
    do
    {
      *(unsigned char *)(v7 - 16) = *(unsigned char *)v9;
      uint64_t v10 = v7 - 16;
      *(void *)(v10 + 8) = *(void *)(v9 + 8);
      sub_100005DD4(v9);
      *(unsigned char *)uint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      sub_100005DD4(v10);
      uint64_t v7 = *((void *)&v17 + 1) - 16;
      *((void *)&v17 + 1) -= 16;
      BOOL v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  sub_100006548((uint64_t)v14);
  return v12;
}

uint64_t sub_100006548(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100006580((uint64_t *)a1);
  }
  return a1;
}

void sub_100006580(uint64_t *a1)
{
  v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_1000065F8(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_1000065F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (unint64_t i = *(uint64_t ***)(a2 + 32); i != *(uint64_t ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    sub_100005DD4((uint64_t)i);
    sub_100005EB0(i + 1, *(unsigned __int8 *)i);
    unint64_t i = (uint64_t **)(*(void *)(a2 + 32) + 16);
  }
}

uint64_t sub_100006660(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_100006698(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    do
    {
      *(void *)(v4 + 16) = v2 - 16;
      sub_100005DD4(v2 - 16);
      uint64_t result = sub_100005EB0(v2 - 8, *(unsigned __int8 *)(v2 - 16));
      uint64_t v2 = *(void *)(v4 + 16);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t sub_1000066F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    unint64_t v7 = a4[1];
    do
    {
      if (v7 >= a4[2])
      {
        unint64_t v7 = sub_100006798(a4, v5);
      }
      else
      {
        *(unsigned char *)unint64_t v7 = *(unsigned char *)v5;
        *(void *)(v7 + 8) = *(void *)(v5 + 8);
        sub_100005DD4(v5);
        *(unsigned char *)uint64_t v5 = 0;
        *(void *)(v5 + 8) = 0;
        sub_100005DD4(v7);
        v7 += 16;
      }
      a4[1] = v7;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t sub_100006798(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    sub_1000062F4();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  uint64_t v10 = (char *)sub_100006414(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  sub_100005DD4(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  sub_100005DD4(v11);
  v15[2] = v11 + 16;
  sub_10000630C(a1, v15);
  uint64_t v13 = a1[1];
  sub_100006660((uint64_t)v15);
  return v13;
}

void sub_100006878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100006660((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000688C(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 16;
    uint64_t v6 = (unsigned __int8 *)(v4 - 16);
    do
    {
      sub_100005DD4(v5);
      unsigned int v7 = *v6;
      v6 -= 16;
      uint64_t result = sub_100005EB0(v5 + 8, v7);
      BOOL v8 = v5 == a2;
      uint64_t v5 = (uint64_t)v6;
    }
    while (!v8);
  }
  *(void *)(v3 + 8) = a2;
  return result;
}

void sub_1000068F0(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_1000068F0(a1, *(void *)a2);
    sub_1000068F0(a1, *((void *)a2 + 1));
    sub_100005DD4((uint64_t)(a2 + 56));
    sub_100005EB0(a2 + 64, a2[56]);
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_100006968(uint64_t a1, uint64_t a2)
{
  sub_100005DD4(a2 + 24);
  sub_100005EB0((uint64_t **)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

void sub_1000069C4(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (uint64_t)(v4 - 16);
      unsigned int v7 = v4 - 16;
      do
      {
        sub_100005DD4(v6);
        unsigned int v8 = *v7;
        v7 -= 16;
        sub_100005EB0(v6 + 8, v8);
        BOOL v9 = v6 == (void)v2;
        uint64_t v6 = (uint64_t)v7;
      }
      while (!v9);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100006A68(void ***a1)
{
  uint64_t v2 = (void ***)*a1;
  if (*v2)
  {
    sub_100006ABC((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100006ABC(uint64_t a1, void **a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 5;

      uint64_t v6 = v5;
      sub_100005D28(&v6);
      uint64_t v4 = v5;
    }
    while (v5 != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void *sub_100006B24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  uint64_t result = sub_100006C90(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_100006B70(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_100006B78(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_1000062F4();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_100006E00(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  sub_100006C90(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  v15 += 24;
  sub_100006D88(a1, v14);
  uint64_t v12 = a1[1];
  sub_100006F6C((uint64_t)v14);
  return v12;
}

void sub_100006C7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100006F6C((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100006C90(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100006D0C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100006CF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100006D0C(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000062F4();
  }
  uint64_t result = (char *)sub_100006D50((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_100006D50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000644C();
  }
  return operator new(8 * a2);
}

uint64_t sub_100006D88(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100006E48((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_100006E00(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_10000644C();
  }
  return operator new(24 * a2);
}

uint64_t sub_100006E48(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_100006EEC((uint64_t)v11);
  return v9;
}

uint64_t sub_100006EEC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100006F24(a1);
  }
  return a1;
}

void sub_100006F24(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t sub_100006F6C(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100006FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t sub_100007000(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x666666666666666) {
    sub_1000062F4();
  }
  if (0x999999999999999ALL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0x999999999999999ALL * ((a1[2] - *a1) >> 3);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 3) >= 0x333333333333333) {
    unint64_t v6 = 0x666666666666666;
  }
  else {
    unint64_t v6 = v4;
  }
  long long v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)sub_100007400((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7;
  uint64_t v11 = &v7[40 * v3];
  long long v13 = &v7[40 * v6];
  sub_100007110((uint64_t)(a1 + 2), v11, a2);
  char v12 = v11 + 40;
  sub_100007388(a1, &v10);
  uint64_t v8 = a1[1];
  sub_100007620((uint64_t)&v10);
  return v8;
}

void sub_1000070FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007620((uint64_t)va);
  _Unwind_Resume(a1);
}

id sub_100007110(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  sub_100007170(a2, *(void *)a3, *(void *)(a3 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3));
  a2[3] = *(void *)(a3 + 24);
  id result = *(id *)(a3 + 32);
  a2[4] = result;
  return result;
}

void *sub_100007170(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    sub_1000071F8(result, a4);
    id result = sub_10000724C((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1000071D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_100005D28(&a9);
  _Unwind_Resume(a1);
}

char *sub_1000071F8(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1000062F4();
  }
  id result = (char *)sub_100006E00((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_10000724C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      sub_100006C90(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_100007300((uint64_t)v8);
  return v4;
}

void sub_1000072EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100007300(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100007338(a1);
  }
  return a1;
}

void sub_100007338(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      uint64_t v5 = *(void **)(v3 - 24);
      v3 -= 24;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t sub_100007388(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100007448((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_100007400(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_10000644C();
  }
  return operator new(40 * a2);
}

uint64_t sub_100007448(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      long long v8 = *(_OWORD *)(a3 - 5);
      a3 -= 5;
      *(_OWORD *)(v7 - 40) = v8;
      *(void *)(v7 - 24) = a3[2];
      a3[1] = 0;
      a3[2] = 0;
      *a3 = 0;
      *(void *)(v7 - 16) = a3[3];
      uint64_t v9 = a3[4];
      a3[4] = 0;
      *(void *)(v7 - 8) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 40;
      *((void *)&v15 + 1) -= 40;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_100007500((uint64_t)v12);
  return v10;
}

uint64_t sub_100007500(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100007538((uint64_t *)a1);
  }
  return a1;
}

void sub_100007538(uint64_t *a1)
{
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_1000075B0(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_1000075B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (unint64_t i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {

    uint64_t v6 = i;
    sub_100005D28(&v6);
    unint64_t i = (void **)(*(void *)(a2 + 32) + 40);
  }
}

uint64_t sub_100007620(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100007658(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v5 = (void **)(i - 40);
    *(void *)(a1 + 16) = i - 40;

    uint64_t v6 = v5;
    sub_100005D28(&v6);
  }
}

uint64_t sub_1000076C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    int v13 = 1;
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 32 * a3;
  uint64_t v11 = (unsigned char **)(a2 + 16);
  while (1)
  {
    uint64_t v12 = *v11;
    if (**v11 != 2
      || *(void *)(*((void *)v12 + 1) + 8) - **((void **)v12 + 1) != 32
      || *(unsigned char *)sub_100007B44((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10) {
      goto LABEL_7;
    }
  }
  int v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    if (a5 != 1) {
      LOBYTE(v13) = 1;
    }
    if ((v13 & 1) == 0)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      sub_100007FB0(v20, "cannot create object from initializer list");
      sub_10000788C(301, (uint64_t)v20, exception);
    }
    int v13 = v14;
  }
LABEL_17:
  uint64_t v15 = a2 + 32 * a3;
  if (v13)
  {
    *(unsigned char *)a1 = 1;
    uint64_t v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    *uint64_t v16 = v16 + 1;
    *(void *)(a1 + 8) = v16;
    sub_100007A24(a2, v15, a1);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v19 = v15;
    v20[0] = a2;
    *(void *)(a1 + 8) = sub_100007AD8(v20, &v19);
  }
  sub_100005DD4(a1);
  return a1;
}

void sub_100007854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void sub_10000788C(int a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_100007FB0(&__p, "type_error");
  sub_100007C9C(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    uint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    uint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  uint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)uint64_t v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    uint64_t v11 = (char *)v15;
  }
  else {
    uint64_t v11 = (char *)v15[0];
  }
  sub_100007E20((uint64_t)a3, a1, v11);
  *a3 = off_100010470;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_100007988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000079D0(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100010498;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
}

uint64_t sub_100007A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_10000807C(v5, (uint64_t)v7);
      sub_100008E28(*(uint64_t ***)(a3 + 8), *(const void ***)(*v8 + 8), *(void *)(*v8 + 8), *v8 + 16);
      sub_100005DD4((uint64_t)v7);
      sub_100005EB0(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_100007AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  sub_100005DD4((uint64_t)&a9);
  sub_100005EB0(v9, a9);
  _Unwind_Resume(a1);
}

void *sub_100007AD8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = 0;
  sub_100008F3C(v4, v5, v6, v7);
  return v4;
}

void sub_100007B30(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100007B44(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1 != 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    uint64_t v5 = (char *)sub_100007C74((char *)a1);
    sub_100007FB0(&v8, v5);
    uint64_t v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v10 = v6->__r_.__value_.__r.__words[2];
    long long v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    sub_10000788C(305, (uint64_t)&v9, exception);
  }
  return **(void **)(a1 + 8) + 16 * a2;
}

void sub_100007C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *sub_100007C74(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 9) {
    return "number";
  }
  else {
    return (&off_100010558)[v1];
  }
}

void sub_100007C9C(int a1@<W1>, std::string *a2@<X8>)
{
  std::operator+<char>();
  uint64_t v4 = std::string::append(&v12, ".");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_100007DBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 41) < 0) {
    operator delete(*(void **)(v26 - 64));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007E20(uint64_t a1, int a2, char *a3)
{
  *(void *)a1 = off_100010498;
  *(_DWORD *)(a1 + 8) = a2;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 16), a3);
  return a1;
}

void sub_100007E70(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_100007E84(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100010498;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
  operator delete();
}

const char *sub_100007EEC(const std::runtime_error *a1)
{
  return std::runtime_error::what(a1 + 1);
}

void sub_100007EF4(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100010498;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
}

void sub_100007F48(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100010498;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
  operator delete();
}

void *sub_100007FB0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100008064();
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

void sub_100008064()
{
}

uint64_t sub_10000807C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)a2 = *(unsigned char *)v3;
    *(void *)(a2 + 8) = *(void *)(v3 + 8);
    sub_100005DD4(v3);
    *(unsigned char *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    return sub_100005DD4(a2);
  }
  else
  {
    return sub_100008100(a2, v3);
  }
}

uint64_t sub_100008100(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = 0;
  sub_100005DD4(a2);
  switch(*(unsigned char *)a1)
  {
    case 1:
      size_t v4 = sub_1000081D4(*(const void ****)(a2 + 8));
      goto LABEL_8;
    case 2:
      size_t v4 = sub_100008A28(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      size_t v4 = sub_100008C9C(*(void *)(a2 + 8));
      goto LABEL_8;
    case 4:
      size_t v4 = (uint64_t *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      size_t v4 = *(uint64_t **)(a2 + 8);
      goto LABEL_8;
    case 8:
      size_t v4 = sub_100008D08(*(void *)(a2 + 8));
LABEL_8:
      *(void *)(a1 + 8) = v4;
      break;
    default:
      break;
  }
  sub_100005DD4(a1);
  return a1;
}

uint64_t *sub_1000081D4(const void ***a1)
{
  uint64_t v2 = (uint64_t *)operator new(0x18uLL);
  sub_100008220(v2, a1);
  return v2;
}

void sub_10000820C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_100008220(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_100008278(a1, *a2, a2 + 1);
  return a1;
}

void sub_100008260(_Unwind_Exception *a1)
{
  sub_1000068F0(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_100008278(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    size_t v4 = a2;
    size_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_100008304(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          size_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      size_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_100008304(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  uint64_t v6 = (uint64_t **)sub_100008388(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_100008534((uint64_t)a1, a4, (uint64_t)&v8);
    sub_1000085B8(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **sub_100008388(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  uint64_t v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_1000086B0((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!sub_1000086B0((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      std::string v14 = (const void **)a2[1];
      do
      {
        uint64_t v15 = v14;
        std::string v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      std::string v18 = (const void **)a2;
      do
      {
        uint64_t v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        std::string v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_1000086B0((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    std::string v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      std::string v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    int64_t v16 = a2;
    do
    {
      std::string v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      int64_t v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (sub_1000086B0((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:
  return (const void **)sub_100008610((uint64_t)a1, a3, a5);
}

char *sub_100008534@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = sub_10000871C(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_10000859C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1000089CC(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000085B8(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_100008834(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *sub_100008610(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!sub_1000086B0(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_1000086B0(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL sub_1000086B0(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

char *sub_10000871C(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100008794(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  sub_100008100(__dst + 24, (char *)a2 + 24);
  return __dst;
}

void sub_100008778(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008794(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100008064();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_100008834(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      long long v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            std::string *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_1000089CC(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_100006968(*(void *)a1, (uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void *sub_100008A28(uint64_t *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  sub_100008A84(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_100008A70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100008A84(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    sub_100008B0C(result, a4);
    uint64_t result = (void *)sub_100008B50((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100008AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000069C4(&a9);
  _Unwind_Resume(a1);
}

char *sub_100008B0C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_1000062F4();
  }
  uint64_t result = (char *)sub_100006414((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t sub_100008B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_100008100(v4, v6);
      v6 += 16;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_100008BF4((uint64_t)v8);
  return v4;
}

void sub_100008BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100008BF4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100008C40(*(void *)a1, **(void **)(a1 + 16), **(void **)(a1 + 16), **(void **)(a1 + 8), **(void **)(a1 + 8));
  }
  return a1;
}

void sub_100008C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 != a5)
  {
    uint64_t v6 = a3 - 16;
    uint64_t v7 = (unsigned __int8 *)(a3 - 16);
    do
    {
      sub_100005DD4(v6);
      int v8 = *v7;
      v7 -= 16;
      sub_100005EB0((uint64_t **)(v6 + 8), v8);
      BOOL v9 = v6 == a5;
      uint64_t v6 = (uint64_t)v7;
    }
    while (!v9);
  }
}

void *sub_100008C9C(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  int v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_100008794(v2, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v2 = *(_OWORD *)a1;
    v2[2] = *(void *)(a1 + 16);
  }
  return v3;
}

void sub_100008CF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100008D08(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  sub_100008D68(v2, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_100008D54(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100008D68(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100008DE4(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100008DC8(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100008DE4(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_1000062F4();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *sub_100008E28(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t **)sub_100008610((uint64_t)a1, &v10, a2);
  uint64_t result = *v7;
  if (!*v7)
  {
    sub_100008EB0((uint64_t)a1, a3, a4, (uint64_t)&v9);
    sub_1000085B8(a1, v10, v7, v9);
    return v9;
  }
  return result;
}

uint64_t sub_100008EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  size_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  v8[2] = *(_OWORD *)a2;
  *((void *)v8 + 6) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  char v9 = *(unsigned char *)a3;
  *((void *)v8 + 8) = *(void *)(a3 + 8);
  *((unsigned char *)v8 + 56) = v9;
  uint64_t v10 = (uint64_t)v8 + 56;
  sub_100005DD4(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  uint64_t result = sub_100005DD4(v10);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void *sub_100008F3C(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100008B0C(result, a4);
    uint64_t result = (void *)sub_100008FC4((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100008FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000069C4(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100008FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_100009068(v4, v6);
      v6 += 32;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_100008BF4((uint64_t)v8);
  return v4;
}

void sub_100009054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100009068(uint64_t a1, uint64_t a2)
{
  sub_10000807C(a2, (uint64_t)v4);
  *(unsigned char *)a1 = v4[0];
  *(void *)(a1 + 8) = v5;
  sub_100005DD4((uint64_t)v4);
  v4[0] = 0;
  size_t v5 = 0;
  sub_100005DD4(a1);
  sub_100005DD4((uint64_t)v4);
  sub_100005EB0(&v5, v4[0]);
  return a1;
}

uint64_t sub_1000090E4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 2;
  int v3 = *(uint64_t **)a2;
  size_t v5 = *(uint64_t **)(a2 + 8);
  uint64_t v6 = v3;
  *(void *)(a1 + 8) = sub_100009134(&v6, &v5);
  return sub_100005DD4(a1);
}

void *sub_100009134(uint64_t **a1, uint64_t **a2)
{
  uint64_t v4 = operator new(0x18uLL);
  size_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = *a2 - *a1;
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = 0;
  sub_1000091A0(v4, v5, v6, v7);
  return v4;
}

void sub_10000918C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1000091A0(void *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100008B0C(result, a4);
    uint64_t result = (void *)sub_100009228((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100009208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000069C4(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100009228(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(void *)(v4 + 8) = 0;
      uint64_t v7 = *v6++;
      *(unsigned char *)uint64_t v4 = 7;
      *(void *)(v4 + 8) = v7;
      sub_100005DD4(v4);
      sub_100005DD4(v4);
      uint64_t v4 = v12 + 16;
      v12 += 16;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_100008BF4((uint64_t)v9);
  return v4;
}

uint64_t sub_1000092C8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    sub_1000062F4();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  char v10 = (char *)sub_100006414(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  sub_100005DD4(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  sub_100005DD4(v11);
  v15[2] = v11 + 16;
  sub_10000630C(a1, v15);
  uint64_t v13 = a1[1];
  sub_100006660((uint64_t)v15);
  return v13;
}

void sub_1000093A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100006660((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000093BC(uint64_t **a1, char *a2, char **a3)
{
  sub_100009468((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)sub_100008610((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      sub_1000089CC((uint64_t)&v10, v6);
    }
  }
  else
  {
    sub_1000085B8(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_100009444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_1000089CC((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100009468@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = sub_1000094F4(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1000094D8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1000089CC(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_1000094F4(void *a1, char *a2, char **a3)
{
  unint64_t v5 = sub_100007FB0(a1, a2);
  sub_100009548((uint64_t)(v5 + 3), a3);
  return a1;
}

void sub_10000952C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100009548(uint64_t a1, char **a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = sub_100009594(a2);
  sub_100005DD4(a1);
  sub_100005DD4(a1);
  return a1;
}

void *sub_100009594(char **a1)
{
  uint64_t v2 = operator new(0x18uLL);
  sub_100007FB0(v2, *a1);
  return v2;
}

void sub_1000095CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 **sub_1000095E0(unsigned __int8 **result)
{
  uint64_t v1 = *result;
  if (!*result) {
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  }
  int v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

void *sub_10000966C(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2) {
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  }
  return result;
}

uint64_t *sub_1000096BC(uint64_t **a1, char *a2, uint64_t *a3)
{
  sub_100009768((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)sub_100008610((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      sub_1000089CC((uint64_t)&v10, v6);
    }
  }
  else
  {
    sub_1000085B8(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_100009744(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_1000089CC((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100009768@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = sub_1000097F4(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1000097D8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1000089CC(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_1000097F4(void *a1, char *a2, uint64_t *a3)
{
  unint64_t v5 = sub_100007FB0(a1, a2);
  v5[4] = 0;
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 24) = 7;
  uint64_t v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  sub_100005DD4((uint64_t)(v5 + 3));
  sub_100005DD4(v7);
  return a1;
}

uint64_t *sub_100009848(uint64_t **a1, char *a2, uint64_t a3)
{
  sub_1000098F4((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)sub_100008610((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      sub_1000089CC((uint64_t)&v10, v6);
    }
  }
  else
  {
    sub_1000085B8(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_1000098D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_1000089CC((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000098F4@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = sub_100009980(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_100009964(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1000089CC(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_100009980(void *a1, char *a2, uint64_t a3)
{
  unint64_t v5 = sub_100007FB0(a1, a2);
  *((unsigned char *)v5 + 24) = *(unsigned char *)a3;
  uint64_t v6 = (uint64_t)(v5 + 3);
  v5[4] = *(void *)(a3 + 8);
  sub_100005DD4(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  sub_100005DD4(v6);
  return a1;
}

uint64_t sub_1000099E0(void ***a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  switch(*(unsigned char *)a2)
  {
    case 0:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 1:
      uint64_t v12 = (uint64_t)**a1;
      if (!*(void *)(*(void *)(a2 + 8) + 16))
      {
        v45 = *(uint64_t (**)(void))(v12 + 8);
        goto LABEL_52;
      }
      if (a3)
      {
        (*(void (**)(void))(v12 + 8))();
        unsigned int v13 = a6 + a5;
        std::string v14 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v15 = (unint64_t)a1[77];
          if (v15 >= v13) {
            goto LABEL_7;
          }
        }
        else
        {
          unint64_t v15 = *((unsigned __int8 *)a1 + 631);
          if (v13 <= v15)
          {
LABEL_7:
            int64_t v16 = *(void **)(a2 + 8);
            BOOL v17 = (void *)*v16;
            if (v16[2] == 1)
            {
              std::string v18 = (void *)*v16;
            }
            else
            {
              unint64_t v67 = 0;
              do
              {
                v68 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  v68 = (void ***)*v14;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v68, (a6 + a5));
                ((void (*)(void))***a1)();
                sub_10000AD60((uint64_t)a1, v17 + 4, a4);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
                sub_1000099E0(a1, v17 + 7, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v69 = (void *)v17[1];
                if (v69)
                {
                  do
                  {
                    std::string v18 = v69;
                    v69 = (void *)*v69;
                  }
                  while (v69);
                }
                else
                {
                  do
                  {
                    std::string v18 = (void *)v17[2];
                    BOOL v51 = *v18 == (void)v17;
                    BOOL v17 = v18;
                  }
                  while (!v51);
                }
                ++v67;
                int64_t v16 = *(void **)(a2 + 8);
                BOOL v17 = v18;
              }
              while (v67 < v16[2] - 1);
            }
            v70 = v16 + 1;
            if (v18 == v70) {
              sub_10000CA8C();
            }
            v71 = (void *)v18[1];
            if (v71)
            {
              do
              {
                v72 = v71;
                v71 = (void *)*v71;
              }
              while (v71);
            }
            else
            {
              v74 = v18;
              do
              {
                v72 = (void *)v74[2];
                BOOL v51 = *v72 == (void)v74;
                v74 = v72;
              }
              while (!v51);
            }
            if (v72 != v70) {
              sub_10000CAB8();
            }
            v75 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              v75 = (void ***)*v14;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v75, (a6 + a5));
            ((void (*)(void))***a1)();
            sub_10000AD60((uint64_t)a1, v18 + 4, a4);
            ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
            sub_1000099E0(a1, v18 + 7, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            v66 = (void (*)(void))(**a1)[1];
            goto LABEL_121;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v15, 32);
        goto LABEL_7;
      }
      (*(void (**)(void))v12)();
      uint64_t v46 = *(void *)(a2 + 8);
      uint64_t v47 = *(void **)v46;
      if (*(void *)(v46 + 16) != 1)
      {
        unint64_t v48 = 0;
        do
        {
          ((void (*)(void, uint64_t))***a1)(*a1, 34);
          sub_10000AD60((uint64_t)a1, v47 + 4, a4);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
          sub_1000099E0(a1, v47 + 7, 0, a4, a5, a6);
          ((void (*)(void))***a1)();
          unint64_t v49 = (void *)v47[1];
          uint64_t v50 = v47;
          if (v49)
          {
            do
            {
              uint64_t v47 = v49;
              unint64_t v49 = (void *)*v49;
            }
            while (v49);
          }
          else
          {
            do
            {
              uint64_t v47 = (void *)v50[2];
              BOOL v51 = *v47 == (void)v50;
              uint64_t v50 = v47;
            }
            while (!v51);
          }
          ++v48;
          uint64_t v46 = *(void *)(a2 + 8);
        }
        while (v48 < *(void *)(v46 + 16) - 1);
      }
      v52 = (void *)(v46 + 8);
      if (v47 == v52) {
        sub_10000CAE4();
      }
      int v53 = (void *)v47[1];
      if (v53)
      {
        do
        {
          v54 = v53;
          int v53 = (void *)*v53;
        }
        while (v53);
      }
      else
      {
        v73 = v47;
        do
        {
          v54 = (void *)v73[2];
          BOOL v51 = *v54 == (void)v73;
          v73 = v54;
        }
        while (!v51);
      }
      if (v54 != v52) {
        sub_10000CB10();
      }
      ((void (*)(void, uint64_t))***a1)(*a1, 34);
      sub_10000AD60((uint64_t)a1, v47 + 4, a4);
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
      sub_1000099E0(a1, v47 + 7, 0, a4, a5, a6);
LABEL_122:
      uint64_t v11 = (uint64_t (*)(void))***a1;
LABEL_123:
      return v11();
    case 2:
      uint64_t v19 = (void (**)(void))**a1;
      if (**(void **)(a2 + 8) != *(void *)(*(void *)(a2 + 8) + 8))
      {
        if (!a3)
        {
          (*v19)();
          __int16 v55 = *(uint64_t **)(a2 + 8);
          uint64_t v57 = *v55;
          uint64_t v56 = v55[1];
          if (v57 == v56 - 16)
          {
            uint64_t v58 = v57;
          }
          else
          {
            uint64_t v58 = v57;
            do
            {
              sub_1000099E0(a1, v58, 0, a4, a5, a6);
              ((void (*)(void))***a1)();
              v58 += 16;
              v59 = *(uint64_t **)(a2 + 8);
              uint64_t v56 = v59[1];
            }
            while (v58 != v56 - 16);
            uint64_t v57 = *v59;
          }
          if (v57 == v56) {
            sub_10000CB68();
          }
          sub_1000099E0(a1, v58, 0, a4, a5, a6);
          goto LABEL_108;
        }
        v19[1]();
        unsigned int v20 = a6 + a5;
        v21 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v22 = (unint64_t)a1[77];
          if (v22 >= v20) {
            goto LABEL_13;
          }
        }
        else
        {
          unint64_t v22 = *((unsigned __int8 *)a1 + 631);
          if (v20 <= v22)
          {
LABEL_13:
            int v23 = *(uint64_t **)(a2 + 8);
            uint64_t v25 = *v23;
            uint64_t v24 = v23[1];
            if (v25 != v24 - 16)
            {
              do
              {
                uint64_t v26 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  uint64_t v26 = (void ***)*v21;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v26, (a6 + a5));
                sub_1000099E0(a1, v25, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v25 += 16;
                char v27 = *(uint64_t **)(a2 + 8);
                uint64_t v24 = v27[1];
              }
              while (v25 != v24 - 16);
              uint64_t v25 = *v27;
            }
            if (v25 == v24) {
              sub_10000CB3C();
            }
            unint64_t v28 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              unint64_t v28 = (void ***)*v21;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v28, (a6 + a5));
            sub_1000099E0(a1, *(void *)(*(void *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            if (*((char *)a1 + 631) < 0) {
              v21 = (void *)*v21;
            }
            ((void (*)(void, void *, void))(**a1)[1])(*a1, v21, a6);
LABEL_108:
            uint64_t v11 = (uint64_t (*)(void))***a1;
            goto LABEL_123;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v22, 32);
        goto LABEL_13;
      }
      v45 = (uint64_t (*)(void))v19[1];
LABEL_52:
      return v45();
    case 3:
      ((void (*)(void))***a1)();
      sub_10000AD60((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      uint64_t v11 = (uint64_t (*)(void))***a1;
      goto LABEL_123;
    case 4:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 5:
      unint64_t v29 = *(void *)(a2 + 8);
      return sub_10000B4BC((uint64_t (****)(void))a1, v29);
    case 6:
      unint64_t v31 = *(void *)(a2 + 8);
      return sub_10000B6EC((uint64_t (****)(void))a1, v31);
    case 7:
      double v32 = *(double *)(a2 + 8);
      return sub_10000B87C((char *)a1, v32);
    case 8:
      uint64_t v33 = (void (*)(void))(**a1)[1];
      if (a3)
      {
        v33();
        uint64_t v34 = (a6 + a5);
        uint64_t v35 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v36 = (unint64_t)a1[77];
          if (v36 >= v34)
          {
            uint64_t v37 = (uint64_t (***)(void))*a1;
            goto LABEL_73;
          }
        }
        else
        {
          unint64_t v36 = *((unsigned __int8 *)a1 + 631);
          if (v34 <= v36)
          {
            uint64_t v37 = (uint64_t (***)(void))*a1;
            uint64_t v38 = a1 + 76;
            goto LABEL_74;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v36, 32);
        uint64_t v37 = (uint64_t (***)(void))*a1;
        uint64_t v38 = a1 + 76;
        if ((*((char *)a1 + 631) & 0x80000000) == 0)
        {
LABEL_74:
          ((void (*)(uint64_t (***)(void), void ***, uint64_t))(*v37)[1])(v37, v38, v34);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\"bytes\": [", 10);
          v60 = *(unsigned __int8 ***)(a2 + 8);
          v62 = *v60;
          v61 = v60[1];
          if (v62 != v61)
          {
            if (v62 != v61 - 1)
            {
              do
              {
                unsigned int v63 = *v62++;
                sub_10000B3E0((uint64_t)a1, v63);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ", ", 2);
              }
              while (v62 != (unsigned __int8 *)(*(void *)(*(void *)(a2 + 8) + 8) - 1));
            }
            sub_10000B3E0((uint64_t)a1, *v62);
          }
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "],\n", 3);
          v64 = a1 + 76;
          if (*((char *)a1 + 631) < 0) {
            v64 = (void ***)*v35;
          }
          ((void (*)(void, void ***, uint64_t))(**a1)[1])(*a1, v64, v34);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\"subtype\": ", 11);
          uint64_t v65 = *(void *)(a2 + 8);
          if (*(unsigned char *)(v65 + 25)) {
            sub_10000B3E0((uint64_t)a1, *(unsigned __int8 *)(v65 + 24));
          }
          else {
            ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "null", 4);
          }
          ((void (*)(void, uint64_t))***a1)(*a1, 10);
          v66 = (void (*)(void))(**a1)[1];
LABEL_121:
          v66();
          goto LABEL_122;
        }
LABEL_73:
        uint64_t v38 = (void ***)*v35;
        goto LABEL_74;
      }
      v33();
      v39 = *(unsigned __int8 ***)(a2 + 8);
      unint64_t v41 = *v39;
      v40 = v39[1];
      if (v41 != v40)
      {
        while (v41 != v40 - 1)
        {
          unsigned int v42 = *v41++;
          sub_10000B3E0((uint64_t)a1, v42);
          ((void (*)(void, uint64_t))***a1)(*a1, 44);
          v40 = *(unsigned __int8 **)(*(void *)(a2 + 8) + 8);
        }
        sub_10000B3E0((uint64_t)a1, *v41);
      }
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "],\"subtype\":", 12);
      uint64_t v43 = *(void *)(a2 + 8);
      if (*(unsigned char *)(v43 + 25))
      {
        sub_10000B3E0((uint64_t)a1, *(unsigned __int8 *)(v43 + 24));
        uint64_t v44 = (uint64_t (*)(void))***a1;
        return v44();
      }
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
LABEL_83:
      return v11();
    case 9:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    default:
      sub_10000CA60();
  }
}

void sub_10000AA34(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000104C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10000AA54(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000104C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10000AAA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t sub_10000AAD0(uint64_t a1)
{
  return std::ostream::put(*(void *)(a1 + 8));
}

uint64_t sub_10000AAD8(uint64_t a1)
{
  return std::ostream::write(*(void *)(a1 + 8));
}

void sub_10000AAE4()
{
}

void sub_10000AAF8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_10000AB6C(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v7 = localeconv();
  *(void *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep) {
    LOBYTE(thousands_sep) = *thousands_sep;
  }
  *(unsigned char *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point) {
    LOBYTE(decimal_point) = *decimal_point;
  }
  *(_OWORD *)(a1 + 90) = 0u;
  *(unsigned char *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(unsigned char *)(a1 + 602) = a3;
  uint64_t v10 = (int8x16_t *)operator new(0x208uLL);
  *(void *)(a1 + 608) = v10;
  *(void *)(a1 + 624) = 0x8000000000000208;
  int8x16_t v11 = vdupq_n_s8(a3);
  *(void *)(a1 + 616) = 512;
  *uint64_t v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_10000AC9C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_10000AAF8(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000ACB4(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100008064();
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

uint64_t sub_10000AD60(uint64_t result, uint64_t *a2, int a3)
{
  char v46 = 0;
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = a2[1];
  }
  if (!v4) {
    return result;
  }
  size_t v7 = (void *)result;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v47[0] = 0;
  uint64_t v12 = result + 90;
  do
  {
    if (v3) {
      unsigned int v13 = (uint64_t *)*a2;
    }
    else {
      unsigned int v13 = a2;
    }
    int v14 = *((unsigned __int8 *)v13 + v8);
    uint64_t result = sub_10000B92C(&v46, v47, v14);
    if (result == 1)
    {
      int v16 = *((_DWORD *)v7 + 158);
      if ((v16 - 1) >= 2)
      {
        if (!v16)
        {
          char v45 = 3;
          *(_DWORD *)__str = 0;
          snprintf(__str, 3uLL, "%.2X", v14);
          exception = __cxa_allocate_exception(0x20uLL);
          std::to_string(&v38, v8);
          unint64_t v28 = std::string::insert(&v38, 0, "invalid UTF-8 byte at index ");
          long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v39.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = std::string::append(&v39, ": 0x");
          long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          v40.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          if (v45 >= 0) {
            double v32 = __str;
          }
          else {
            double v32 = *(char **)__str;
          }
          if (v45 >= 0) {
            std::string::size_type v33 = v45;
          }
          else {
            std::string::size_type v33 = v44;
          }
          uint64_t v34 = std::string::append(&v40, v32, v33);
          long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          std::string::size_type v42 = v34->__r_.__value_.__r.__words[2];
          long long v41 = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          sub_10000788C(316, (uint64_t)&v41, exception);
        }
        sub_10000CBC0();
      }
      uint64_t v17 = v9 != 0;
      if (v16 == 1)
      {
        uint64_t v18 = v12 + v10;
        if (a3)
        {
          *(_DWORD *)uint64_t v18 = 1717990748;
          *(_WORD *)(v18 + 4) = 25702;
          v10 += 6;
        }
        else
        {
          v10 += 3;
          *(_WORD *)uint64_t v18 = -16401;
          *(unsigned char *)(v18 + 2) = -67;
        }
        if ((unint64_t)(v10 - 500) <= 0xC)
        {
          uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
          uint64_t v10 = 0;
        }
      }
      uint64_t v9 = 0;
      v8 -= v17;
      char v46 = 0;
      uint64_t v11 = v10;
    }
    else if (result)
    {
      if ((a3 & 1) == 0)
      {
        if (*((char *)a2 + 23) >= 0) {
          uint64_t v19 = a2;
        }
        else {
          uint64_t v19 = (uint64_t *)*a2;
        }
        *(unsigned char *)(v12 + v11++) = *((unsigned char *)v19 + v8);
      }
      ++v9;
    }
    else
    {
      switch(v47[0])
      {
        case 8u:
          __int16 v15 = 25180;
          goto LABEL_43;
        case 9u:
          __int16 v15 = 29788;
          goto LABEL_43;
        case 0xAu:
          __int16 v15 = 28252;
          goto LABEL_43;
        case 0xBu:
          goto LABEL_29;
        case 0xCu:
          __int16 v15 = 26204;
          goto LABEL_43;
        case 0xDu:
          __int16 v15 = 29276;
          goto LABEL_43;
        default:
          if (v47[0] == 34)
          {
            __int16 v15 = 8796;
            goto LABEL_43;
          }
          if (v47[0] == 92)
          {
            __int16 v15 = 23644;
LABEL_43:
            *(_WORD *)(v12 + v11) = v15;
            v11 += 2;
            goto LABEL_44;
          }
LABEL_29:
          if (v47[0] > 0x7E) {
            int v20 = a3;
          }
          else {
            int v20 = 0;
          }
          if (v47[0] < 0x20 || v20)
          {
            uint64_t v24 = (char *)(v12 + v11);
            if (HIWORD(v47[0]))
            {
              uint64_t result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v47[0] >> 10) - 10304), v47[0] & 0x3FF | 0xDC00);
              v11 += 12;
            }
            else
            {
              uint64_t result = snprintf(v24, 7uLL, "\\u%04x", v47[0]);
              v11 += 6;
            }
          }
          else
          {
            if (*((char *)a2 + 23) >= 0) {
              v21 = a2;
            }
            else {
              v21 = (uint64_t *)*a2;
            }
            *(unsigned char *)(v12 + v11++) = *((unsigned char *)v21 + v8);
          }
LABEL_44:
          if ((unint64_t)(v11 - 500) > 0xC)
          {
            uint64_t v9 = 0;
            uint64_t v10 = v11;
          }
          else
          {
            uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v11);
            uint64_t v11 = 0;
            uint64_t v10 = 0;
            uint64_t v9 = 0;
          }
          break;
      }
    }
    ++v8;
    int v22 = *((char *)a2 + 23);
    unsigned int v3 = v22 >> 31;
    unint64_t v23 = a2[1];
    if (v22 >= 0) {
      unint64_t v23 = *((unsigned __int8 *)a2 + 23);
    }
  }
  while (v8 < v23);
  if (v46)
  {
    int v26 = *((_DWORD *)v7 + 158);
    switch(v26)
    {
      case 1:
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
        uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 2:
        uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 0:
        char v45 = 3;
        *(_DWORD *)__str = 0;
        unint64_t v36 = (uint64_t *)*a2;
        if (v22 >= 0) {
          unint64_t v36 = a2;
        }
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v36 + v23 - 1));
        uint64_t v37 = __cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        sub_10000788C(316, (uint64_t)&v41, v37);
      default:
        sub_10000CB94();
    }
    return v25();
  }
  else if (v11)
  {
    uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
    return v25();
  }
  return result;
}

void sub_10000B308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 97) < 0) {
        operator delete(*(void **)(v41 - 120));
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t sub_10000B3E0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return (***(uint64_t (****)(void, uint64_t))a1)(*(void *)a1, 48);
  }
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)(a1 + 17) = word_10000DDE0[(a2 - 100 * ((41 * a2) >> 12))];
      uint64_t v5 = a1 + 17;
      unsigned int v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v5 = a1 + 16 + v3;
  if (a2 < 0xA)
  {
LABEL_10:
    *(unsigned char *)(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
  }
  *(_WORD *)(v5 - 2) = word_10000DDE0[a2];
  return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
}

uint64_t sub_10000B4BC(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1 + 2;
    if ((v2 & 0x8000000000000000) != 0)
    {
      *uint64_t v3 = 45;
      unint64_t v2 = -(uint64_t)v2;
      if (v2 >= 0xA)
      {
        int v7 = 4;
        unint64_t v11 = v2;
        while (1)
        {
          if (v11 <= 0x63)
          {
            v7 -= 2;
            goto LABEL_26;
          }
          if (v11 <= 0x3E7) {
            break;
          }
          if (v11 >> 4 < 0x271) {
            goto LABEL_26;
          }
          v7 += 4;
          BOOL v10 = v11 >= 0x186A0;
          v11 /= 0x2710uLL;
          if (!v10)
          {
            v7 -= 3;
            goto LABEL_26;
          }
        }
        --v7;
      }
      else
      {
        int v7 = 1;
      }
LABEL_26:
      unsigned int v8 = v7 + 1;
    }
    else
    {
      if (v2 < 0xA)
      {
        uint64_t v4 = (char *)a1 + 17;
        goto LABEL_35;
      }
      unsigned int v8 = 4;
      unint64_t v9 = v2;
      while (1)
      {
        if (v9 <= 0x63)
        {
          v8 -= 2;
          goto LABEL_27;
        }
        if (v9 <= 0x3E7) {
          break;
        }
        if (v9 >> 4 < 0x271) {
          goto LABEL_27;
        }
        v8 += 4;
        BOOL v10 = v9 >= 0x186A0;
        v9 /= 0x2710uLL;
        if (!v10)
        {
          v8 -= 3;
          goto LABEL_27;
        }
      }
      --v8;
    }
LABEL_27:
    if (v8 >= 0x3F) {
      sub_10000CBEC();
    }
    uint64_t v4 = &v3[v8];
    if (v2 < 0x64)
    {
      unint64_t v12 = v2;
    }
    else
    {
      do
      {
        unint64_t v12 = v2 / 0x64;
        *((_WORD *)v4 - 1) = word_10000DEA8[v2 % 0x64];
        v4 -= 2;
        unint64_t v13 = v2 >> 4;
        v2 /= 0x64uLL;
      }
      while (v13 > 0x270);
    }
    if (v12 >= 0xA)
    {
      *((_WORD *)v4 - 1) = word_10000DEA8[v12];
LABEL_36:
      int v14 = (**a1)[1];
      return v14();
    }
    LOBYTE(v2) = v12;
LABEL_35:
    *(v4 - 1) = v2 + 48;
    goto LABEL_36;
  }
  uint64_t v5 = ***a1;
  return v5();
}

uint64_t sub_10000B6EC(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    if (a2 >= 0xA)
    {
      unsigned int v6 = 4;
      unint64_t v7 = a2;
      while (1)
      {
        if (v7 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_15;
        }
        if (v7 <= 0x3E7) {
          break;
        }
        if (v7 >> 4 < 0x271) {
          goto LABEL_15;
        }
        unint64_t v8 = v7 >> 5;
        v7 /= 0x2710uLL;
        v6 += 4;
        if (v8 <= 0xC34)
        {
          v6 -= 3;
          goto LABEL_15;
        }
      }
      --v6;
LABEL_15:
      if (v6 >= 0x3F) {
        sub_10000CBEC();
      }
      uint64_t v3 = (uint64_t)a1 + v6 + 16;
      if (a2 < 0x64)
      {
        unint64_t v9 = a2;
      }
      else
      {
        do
        {
          unint64_t v9 = v2 / 0x64;
          *(_WORD *)(v3 - 2) = word_10000DF70[v2 % 0x64];
          v3 -= 2;
          unint64_t v10 = v2 >> 4;
          v2 /= 0x64uLL;
        }
        while (v10 > 0x270);
      }
      if (v9 >= 0xA)
      {
        *(_WORD *)(v3 - 2) = word_10000DF70[v9];
LABEL_24:
        unint64_t v11 = (**a1)[1];
        return v11();
      }
      LOBYTE(v2) = v9;
    }
    else
    {
      uint64_t v3 = (uint64_t)a1 + 17;
    }
    *(unsigned char *)(v3 - 1) = v2 + 48;
    goto LABEL_24;
  }
  uint64_t v4 = ***a1;
  return v4();
}

uint64_t sub_10000B87C(char *a1, double a2)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    unsigned int v6 = "null";
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = sub_10000B9BC(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v5 = *(void *)a1;
    unsigned int v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
}

uint64_t sub_10000B92C(unsigned char *a1, unsigned int *a2, int a3)
{
  unsigned int v3 = byte_10000DC50[a3];
  if (*a1) {
    unsigned int v4 = a3 & 0x3F | (*a2 << 6);
  }
  else {
    unsigned int v4 = (0xFFu >> v3) & a3;
  }
  *a2 = v4;
  unint64_t v5 = 16 * *a1 + v3 + 256;
  if (v5 >= 0x190) {
    __assert_rtn("decode", "serializer.hpp", 892, "index < 400");
  }
  uint64_t v6 = byte_10000DC50[v5];
  *a1 = v6;
  return v6;
}

char *sub_10000B9BC(char *a1, uint64_t a2, double a3)
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000CCC8();
  }
  unsigned int v3 = a1;
  if ((*(void *)&a3 & 0x8000000000000000) != 0)
  {
    a3 = -a3;
    *a1 = 45;
    unsigned int v3 = a1 + 1;
  }
  if (a3 == 0.0)
  {
    *(_WORD *)unsigned int v3 = 11824;
    uint64_t result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    unint64_t v5 = a2 - (void)v3;
    if (a2 - (uint64_t)v3 <= 16) {
      sub_10000CC18();
    }
    uint64_t v6 = 0;
    sub_10000BA90((uint64_t)v3, (int *)&v6 + 1, &v6, a3);
    if (SHIDWORD(v6) >= 18) {
      sub_10000CC44();
    }
    if (v5 <= 0x15) {
      sub_10000CC70();
    }
    if (v5 == 22) {
      sub_10000CC9C();
    }
    return sub_10000BB14(v3, SHIDWORD(v6), v6, -4, 15);
  }
  return result;
}

uint64_t sub_10000BA90(uint64_t a1, int *a2, _DWORD *a3, double a4)
{
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000CD20();
  }
  if (a4 <= 0.0) {
    sub_10000CCF4();
  }
  sub_10000BD44((uint64_t)v9, a4);
  return sub_10000BE6C(a1, a2, a3, v9[2], v9[3], v9[0], v9[1], v7, v9[4], v9[5]);
}

char *sub_10000BB14(char *__src, int a2, int a3, int a4, int a5)
{
  if ((a4 & 0x80000000) == 0) {
    sub_10000CD4C();
  }
  if (a5 <= 0) {
    sub_10000CD78();
  }
  uint64_t v7 = a3 + (uint64_t)a2;
  if ((a3 & 0x80000000) == 0 && (int)v7 <= a5)
  {
    memset(&__src[a2], 48, a3);
    __src[v7] = 46;
    uint64_t result = &__src[v7 + 2];
    __src[(int)v7 + 1] = 48;
    return result;
  }
  if ((int)v7 < 1 || (int)v7 > a5)
  {
    if ((int)v7 > a4 && (int)v7 <= 0)
    {
      size_t v10 = -(int)v7;
      memmove(&__src[v10 + 2], __src, a2);
      *(_WORD *)__src = 11824;
      memset(__src + 2, 48, v10);
      return &__src[v10 + 2 + a2];
    }
    if (a2 == 1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      memmove(__src + 2, __src + 1, a2 - 1);
      __src[1] = 46;
      uint64_t v11 = a2 + 1;
    }
    unint64_t v12 = &__src[v11];
    *unint64_t v12 = 101;
    if ((int)v7 <= -999) {
      sub_10000CDA4();
    }
    if ((int)v7 >= 1001) {
      sub_10000CDD0();
    }
    if ((int)v7 >= 1) {
      char v13 = 43;
    }
    else {
      char v13 = 45;
    }
    if ((int)v7 - 1 >= 0) {
      unsigned int v14 = v7 - 1;
    }
    else {
      unsigned int v14 = 1 - v7;
    }
    v12[1] = v13;
    if (v14 > 9)
    {
      if (v14 > 0x63)
      {
        v12[2] = (unsigned __int16)v14 / 0x64u + 48;
        unsigned __int8 v17 = (unsigned __int16)v14 % 0x64u;
        void v12[3] = (v17 / 0xAu) | 0x30;
        v12[4] = (v17 % 0xAu) | 0x30;
        uint64_t v16 = 2;
        return &v12[v16 + 3];
      }
      v12[2] = v14 / 0xAu + 48;
      char v15 = (v14 % 0xAu) | 0x30;
    }
    else
    {
      v12[2] = 48;
      char v15 = v14 + 48;
    }
    void v12[3] = v15;
    uint64_t v16 = 1;
    return &v12[v16 + 3];
  }
  if ((a3 & 0x80000000) == 0) {
    sub_10000CDFC();
  }
  unint64_t v9 = &__src[v7];
  memmove(v9 + 1, v9, a2 - (unint64_t)v7);
  char *v9 = 46;
  return &__src[a2 + 1];
}

uint64_t sub_10000BD44@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000CE54();
  }
  if (a2 <= 0.0) {
    sub_10000CE28();
  }
  uint64_t v4 = *(void *)&a2 >> 52;
  uint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  uint64_t v6 = 2 * v5;
  uint64_t v7 = *(void *)&a2 >> 53;
  uint64_t v8 = 4 * v5;
  int v9 = (*(void *)&a2 >> 52) - 1077;
  uint64_t v10 = 0x10000000000000;
  if ((*(void *)&a2 & 0xFFFFFFFFFFFFFLL) != 0)
  {
    uint64_t v8 = 2 * v5;
    int v9 = (*(void *)&a2 >> 52) - 1076;
    uint64_t v10 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  }
  BOOL v11 = v7 == 0;
  if (v7) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 2 * v5;
  }
  if (v11) {
    int v9 = (*(void *)&a2 >> 52) - 1076;
  }
  else {
    uint64_t v5 = v10;
  }
  uint64_t v3 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v4)
  {
    unint64_t v13 = (*(void *)&a2 >> 52) - 1076;
  }
  else
  {
    uint64_t v12 = 2 * v3;
    int v9 = -1075;
    unint64_t v13 = 4294966221;
  }
  if (v4)
  {
    unint64_t v14 = (*(void *)&a2 >> 52) - 1075;
  }
  else
  {
    uint64_t v6 = 2 * v3;
    unint64_t v14 = 4294966222;
  }
  if (v4) {
    uint64_t v15 = v5;
  }
  else {
    uint64_t v15 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  }
  uint64_t v24 = v12 - 1;
  int v25 = v9;
  uint64_t v16 = sub_10000BF58(v6 | 1, v13);
  int v18 = v17;
  unint64_t v19 = sub_10000BFB0(&v24, v17);
  int v21 = v20;
  uint64_t result = sub_10000BF58(v15, v14);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v23;
  *(void *)(a1 + 16) = v19;
  *(_DWORD *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = v16;
  *(_DWORD *)(a1 + 40) = v18;
  return result;
}

uint64_t sub_10000BE6C(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v31[0] = a4;
  v31[1] = a5;
  v30[0] = a6;
  v30[1] = a7;
  v29[0] = a9;
  v29[1] = a10;
  if (a10 != a5) {
    sub_10000CEAC();
  }
  if (a10 != a7) {
    sub_10000CE80();
  }
  uint64_t v13 = sub_10000C020(a10);
  int v15 = v14;
  uint64_t v27 = v13;
  int v28 = v16;
  unint64_t v17 = sub_10000C0D8(v30, &v27);
  uint64_t v19 = v18;
  unint64_t v20 = sub_10000C0D8(v31, &v27);
  unsigned int v22 = v21;
  unint64_t v23 = sub_10000C0D8(v29, &v27);
  *a3 = -v15;
  return sub_10000C138(a1, a2, a3, v20 + 1, v22, v17, v19, v25, v23 - 1, v24);
}

uint64_t sub_10000BF58(uint64_t result, unint64_t a2)
{
  if (!result) {
    __assert_rtn("normalize", "to_chars.hpp", 143, "x.f != 0");
  }
  for (; (result & 0x8000000000000000) == 0; a2 = (a2 - 1) | a2 & 0xFFFFFFFF00000000)
    result *= 2;
  return result;
}

unint64_t sub_10000BFB0(uint64_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 2) - a2;
  if (v2 < 0)
  {
    uint64_t v5 = "delta >= 0";
    int v6 = 162;
    goto LABEL_6;
  }
  uint64_t v3 = *a1;
  unint64_t result = *a1 << v2;
  if (result >> v2 != v3)
  {
    uint64_t v5 = "((x.f << delta) >> delta) == x.f";
    int v6 = 163;
LABEL_6:
    __assert_rtn("normalize_to", "to_chars.hpp", v6, v5);
  }
  return result;
}

uint64_t sub_10000C020(int a1)
{
  if (a1 <= -1501) {
    sub_10000CED8();
  }
  if (a1 >= 1501) {
    sub_10000CF04();
  }
  int v1 = 78913 * (-61 - a1) / 0x40000;
  if (a1 < -61) {
    ++v1;
  }
  if (v1 <= -315) {
    sub_10000CF30();
  }
  unsigned int v2 = (int)((v1 + 307 + (((__int16)(v1 + 307) >> 28) & 7)) << 16) >> 19;
  if (v2 >= 0x4F) {
    sub_10000CFB4();
  }
  uint64_t v3 = (void *)((char *)&unk_10000E038 + 16 * (unsigned __int16)v2);
  int v4 = v3[1] + a1;
  if (v4 <= -125) {
    sub_10000CF5C();
  }
  if (v4 >= -95) {
    sub_10000CF88();
  }
  return *v3;
}

unint64_t sub_10000C0D8(void *a1, void *a2)
{
  uint64_t v2 = HIDWORD(*a1);
  uint64_t v3 = HIDWORD(*a2);
  unint64_t v4 = v3 * (unint64_t)*a1;
  unint64_t v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t sub_10000C138(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  v47[0] = a4;
  v47[1] = a5;
  v46[0] = a6;
  v46[1] = a7;
  unint64_t v44 = a9;
  uint64_t v45 = a10;
  if ((int)a10 <= -61) {
    sub_10000CFE0();
  }
  if ((int)a10 >= -31) {
    sub_10000D00C();
  }
  unint64_t v13 = sub_10000C3D4((uint64_t)&v44, (uint64_t)v47);
  uint64_t v14 = sub_10000C3D4((uint64_t)&v44, (uint64_t)v46);
  int v15 = -(int)v45;
  unint64_t v16 = v44 >> -(char)v45;
  if (!v16) {
    sub_10000D038();
  }
  unint64_t v17 = v14;
  unint64_t v18 = 1 << v15;
  uint64_t v19 = (1 << v15) - 1;
  unint64_t v20 = v19 & v44;
  if (v16 <= 0x3B9AC9FF)
  {
    if (v16 <= 0x5F5E0FF)
    {
      if (v16 <= 0x98967F)
      {
        if (v16 <= 0xF423F)
        {
          unsigned int v23 = v16 >> 5;
          unsigned int v24 = v16 >> 4;
          if (v16 <= 9) {
            int v25 = 1;
          }
          else {
            int v25 = 10;
          }
          if (v16 <= 9) {
            int v26 = 1;
          }
          else {
            int v26 = 2;
          }
          if (v16 <= 0x63) {
            int v27 = v26;
          }
          else {
            int v27 = 3;
          }
          if (v16 <= 0x63) {
            int v28 = v25;
          }
          else {
            int v28 = 100;
          }
          if (v16 <= 0x3E7) {
            int v29 = v27;
          }
          else {
            int v29 = 4;
          }
          if (v16 <= 0x3E7) {
            int v30 = v28;
          }
          else {
            int v30 = 1000;
          }
          if (v24 <= 0x270) {
            int v31 = v29;
          }
          else {
            int v31 = 5;
          }
          if (v24 <= 0x270) {
            int v32 = v30;
          }
          else {
            int v32 = 10000;
          }
          if (v23 <= 0xC34) {
            int v22 = v31;
          }
          else {
            int v22 = 6;
          }
          if (v23 > 0xC34) {
            unsigned int v21 = 100000;
          }
          else {
            unsigned int v21 = v32;
          }
        }
        else
        {
          unsigned int v21 = 1000000;
          int v22 = 7;
        }
      }
      else
      {
        unsigned int v21 = 10000000;
        int v22 = 8;
      }
    }
    else
    {
      unsigned int v21 = 100000000;
      int v22 = 9;
    }
  }
  else
  {
    unsigned int v21 = 1000000000;
    int v22 = 10;
  }
  unsigned int v33 = v22 + 1;
  do
  {
    unsigned int v34 = v16 / v21;
    if (v16 / v21 >= 0xA) {
      sub_10000D064();
    }
    unint64_t v16 = v16 % v21;
    uint64_t v35 = *a2;
    *a2 = v35 + 1;
    *(unsigned char *)(a1 + v35) = v34 + 48;
    if ((v16 << v15) + v20 <= v13)
    {
      *a3 = *a3 + v33 - 2;
      unint64_t v18 = (unint64_t)v21 << v15;
      int v40 = *a2;
      uint64_t v41 = a1;
      unint64_t v42 = v13;
      v20 += v16 << v15;
      return sub_10000C444(v41, v40, v17, v42, v20, v18);
    }
    v21 /= 0xAu;
    --v33;
  }
  while (v33 > 1);
  if (v20 <= v13) {
    sub_10000D0E8();
  }
  int v36 = 0;
  do
  {
    if (v20 >= 0x199999999999999ALL) {
      sub_10000D090();
    }
    unint64_t v37 = (10 * v20) >> v15;
    if (v37 >= 0xA) {
      sub_10000D0BC();
    }
    uint64_t v38 = *a2;
    *a2 = v38 + 1;
    *(unsigned char *)(a1 + v38) = v37 + 48;
    uint64_t v39 = 5 * v13;
    unint64_t v20 = (10 * v20) & v19;
    v13 *= 10;
    v17 *= 10;
    --v36;
  }
  while (v20 > 2 * v39);
  *a3 += v36;
  int v40 = *a2;
  uint64_t v41 = a1;
  unint64_t v42 = v13;
  return sub_10000C444(v41, v40, v17, v42, v20, v18);
}

uint64_t sub_10000C3D4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8))
  {
    unint64_t v4 = "x.e == y.e";
    int v5 = 66;
LABEL_6:
    __assert_rtn("sub", "to_chars.hpp", v5, v4);
  }
  BOOL v2 = *(void *)a1 >= *(void *)a2;
  uint64_t result = *(void *)a1 - *(void *)a2;
  if (!v2)
  {
    unint64_t v4 = "x.f >= y.f";
    int v5 = 67;
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_10000C444(uint64_t result, int a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a2 <= 0) {
    sub_10000D114();
  }
  if (a3 > a4) {
    sub_10000D140();
  }
  if (a4 < a5) {
    sub_10000D16C();
  }
  if (!a6) {
    sub_10000D198();
  }
  if (a5 < a3 && a4 - a5 >= a6)
  {
    uint64_t v6 = (a2 - 1);
    uint64_t v7 = -(uint64_t)a5;
    unint64_t v8 = a6 + a5;
    do
    {
      if (v8 >= a3 && a3 + v7 <= v8 - a3) {
        break;
      }
      int v9 = *(unsigned __int8 *)(result + v6);
      if (v9 == 48) {
        sub_10000D1C4();
      }
      *(unsigned char *)(result + v6) = v9 - 1;
      if (v8 >= a3) {
        break;
      }
      unint64_t v10 = a4 - a6 + v7;
      v7 -= a6;
      v8 += a6;
    }
    while (v10 >= a6);
  }
  return result;
}

uint64_t sub_10000C4F4(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0) {
    operator delete(*(void **)(a1 + 608));
  }
  BOOL v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_10000AAF8(v2);
  }
  return a1;
}

void *sub_10000C534(void *a1, uint64_t a2, uint64_t a3)
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
      unint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_10000C6D8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_10000C670(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x10000C650);
}

void sub_10000C6C4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000C6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_10000ACB4(__p, v12, __c);
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

void sub_10000C844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id irn_get_log()
{
  if (qword_1000141C0 != -1) {
    dispatch_once(&qword_1000141C0, &stru_1000105C8);
  }
  v0 = (void *)qword_1000141C8;
  return v0;
}

void sub_10000C8B4(id a1)
{
  qword_1000141C8 = (uint64_t)os_log_create("com.apple.HeartRhythmAlgorithms", "diagnostics");
  _objc_release_x1();
}

void sub_10000C8F8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HKQuery returned with error : %{public}@", buf, 0xCu);
}

void sub_10000C950(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  uint64_t v4 = *(void *)(a2 + 80);
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "processedTachoCount : %lu, totalTachoCount : %lu", (uint8_t *)&v5, 0x16u);
}

void sub_10000C9E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to create directory: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CA60()
{
}

void sub_10000CA8C()
{
  __assert_rtn("dump", "serializer.hpp", 138, "i != val.m_value.object->cend()");
}

void sub_10000CAB8()
{
  __assert_rtn("dump", "serializer.hpp", 139, "std::next(i) == val.m_value.object->cend()");
}

void sub_10000CAE4()
{
  __assert_rtn("dump", "serializer.hpp", 166, "i != val.m_value.object->cend()");
}

void sub_10000CB10()
{
  __assert_rtn("dump", "serializer.hpp", 167, "std::next(i) == val.m_value.object->cend()");
}

void sub_10000CB3C()
{
}

void sub_10000CB68()
{
}

void sub_10000CB94()
{
}

void sub_10000CBC0()
{
}

void sub_10000CBEC()
{
}

void sub_10000CC18()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1082, "last - first >= std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000CC44()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1092, "len <= std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000CC70()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1100, "last - first >= 2 + (-kMinExp - 1) + std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000CC9C()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1101, "last - first >= std::numeric_limits<FloatType>::max_digits10 + 6");
}

void sub_10000CCC8()
{
}

void sub_10000CCF4()
{
}

void sub_10000CD20()
{
}

void sub_10000CD4C()
{
}

void sub_10000CD78()
{
}

void sub_10000CDA4()
{
}

void sub_10000CDD0()
{
}

void sub_10000CDFC()
{
}

void sub_10000CE28()
{
}

void sub_10000CE54()
{
}

void sub_10000CE80()
{
  __assert_rtn("grisu2", "to_chars.hpp", 828, "m_plus.e == v.e");
}

void sub_10000CEAC()
{
  __assert_rtn("grisu2", "to_chars.hpp", 827, "m_plus.e == m_minus.e");
}

void sub_10000CED8()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 466, "e >= -1500");
}

void sub_10000CF04()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 467, "e <= 1500");
}

void sub_10000CF30()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 472, "index >= 0");
}

void sub_10000CF5C()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 476, "kAlpha <= cached.e + e + 64");
}

void sub_10000CF88()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 477, "kGamma >= cached.e + e + 64");
}

void sub_10000CFB4()
{
}

void sub_10000CFE0()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 601, "M_plus.e >= kAlpha");
}

void sub_10000D00C()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 602, "M_plus.e <= kGamma");
}

void sub_10000D038()
{
}

void sub_10000D064()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 659, "d <= 9");
}

void sub_10000D090()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 757, "p2 <= (std::numeric_limits<std::uint64_t>::max)() / 10");
}

void sub_10000D0BC()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 766, "d <= 9");
}

void sub_10000D0E8()
{
}

void sub_10000D114()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 545, "len >= 1");
}

void sub_10000D140()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 546, "dist <= delta");
}

void sub_10000D16C()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 547, "rest <= delta");
}

void sub_10000D198()
{
}

void sub_10000D1C4()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 573, "buf[len - 1] != '0'");
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
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

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

lconv *localeconv(void)
{
  return _localeconv();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}