unint64_t sub_1DD30DC3C(uint64_t a1)
{
  unint64_t result;
  const char *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  char v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t Count;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t BatchLoadsToSkip;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  char *v37;
  std::runtime_error *exception;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  std::string v43;
  uint64_t vars8;

  result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 24))(*(void *)(*(void *)(a1 + 32) + 16));
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    return result;
  }
  v5 = result;
  if (*(void *)(a1 + 48) >= result)
  {
    v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, *(void *)(a1 + 56), *(void *)(a1 + 32), @"CKXORCReaderWriter.mm", 218, @"Invalid row: %llu/%llu", *(void *)(a1 + 48), v5);
  }
  v6 = (void *)(*(void *)(*(void *)(a1 + 32) + 24) + 16 * *(void *)(a1 + 64));
  v7 = *v6;
  v8 = v6[1];
  result = (*(uint64_t (**)(void))(*(void *)*v6 + 48))(*v6);
  v10 = *(void *)(v8 + 16);
  if (!v10 || (v11 = *(const char **)(a1 + 48), (unint64_t)v11 >= v10 + result))
  {
    while (1)
    {
      result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 48))(v7);
      v12 = *(void *)(a1 + 48);
      v14 = v12 >= result;
      v13 = v12 - result;
      v14 = !v14 || v13 >= *(void *)(v8 + 16);
      if (!v14) {
        break;
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)v7 + 40))(v7, v8);
    }
    goto LABEL_13;
  }
  if ((unint64_t)v11 < result)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 56))(v7);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 40))(v7, v8);
LABEL_13:
    v15 = 1;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v16 = objc_msgSend_options(*(void **)(a1 + 32), v11, v9);
    v21 = objc_msgSend_testExceptionDuringLoadBatch(v16, v17, v18);
    if (v21)
    {
      Count = objc_msgSend_loadCount(*(void **)(a1 + 32), v19, v20);
      v25 = objc_msgSend_options(*(void **)(a1 + 32), v23, v24);
      BatchLoadsToSkip = objc_msgSend_testExceptionDuringLoadBatchLoadsToSkip(v25, v26, v27);

      if (Count == BatchLoadsToSkip)
      {
        v31 = objc_msgSend_options(*(void **)(a1 + 32), v29, v30);
        objc_msgSend_testExceptionDuringLoadBatch(v31, v32, v33);
        v34 = objc_claimAutoreleasedReturnValue();
        v37 = (char *)objc_msgSend_UTF8String(v34, v35, v36);
        sub_1DD314888(&v43, v37);

        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        sub_1DD26D86C(exception, &v43);
        __cxa_throw(exception, (struct type_info *)&unk_1F3877E48, (void (*)(void *))std::runtime_error::~runtime_error);
      }
    }
    else
    {
    }
    v39 = *(void **)(a1 + 32);
    v40 = objc_msgSend_loadCount(v39, v29, v30) + 1;
    return MEMORY[0x1F4181798](v39, sel_setLoadCount_, v40);
  }
  return result;
}

void sub_1DD30DF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

void sub_1DD30E194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD30E424(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[4] + 24) + 16 * a1[6]);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 48))(v2);
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

void sub_1DD30E5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD30E884(uint64_t a1, const char *a2, uint64_t a3)
{
  lpsrc[1] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v6 = a1 + 32;
  uint64_t result = *(void **)(a1 + 32);
  unint64_t v5 = *(void *)(v6 + 8);
  uint64_t v7 = result[6];
  if (v5 >= (result[7] - v7) >> 3 || !*(void *)(v7 + 8 * v5))
  {
    v8 = objc_msgSend_helpers(result, a2, a3);
    v10 = objc_msgSend_topLevelIndexForStruct_(v8, v9, *(void *)(a1 + 40));

    sub_1DD271638(v47);
    lpsrc[0] = v10;
    sub_1DD31493C(v46, (uint64_t)lpsrc, 1);
    sub_1DD271734((uint64_t)v47, (uint64_t)v46);
    sub_1DD277088(v46);
    (*(void (**)(void *__return_ptr))(**(void **)(*(void *)(a1 + 32) + 16) + 224))(v46);
    uint64_t v11 = v46[0];
    v14 = objc_msgSend_options(*(void **)(a1 + 32), v12, v13);
    uint64_t v17 = objc_msgSend_batchSize(v14, v15, v16);
    (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)v11 + 32))(lpsrc, v11, v17);

    (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 24))(*(void *)(*(void *)(a1 + 32) + 16));
    v18 = objc_opt_new();
    while ((*(unsigned int (**)(void, void *))(*(void *)v46[0] + 40))(v46[0], lpsrc[0]))
    {
      uint64_t v19 = **((void **)__dynamic_cast(lpsrc[0], (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0)+ 10);
      if (*(void *)(v19 + 16))
      {
        unint64_t v20 = 0;
        do
        {
          uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v46[0] + 48))(v46[0]);
          if (*(unsigned char *)(*(void *)(v19 + 40) + v20)) {
            objc_msgSend_addIndex_(v18, v22, v20 + v21);
          }
          ++v20;
        }
        while (v20 < *(void *)(v19 + 16));
      }
    }
    uint64_t v23 = *(void *)(a1 + 40);
    v24 = (char **)(*(void *)(a1 + 32) + 48);
    v26 = *v24;
    v25 = *(char **)(*(void *)(a1 + 32) + 56);
    uint64_t v27 = v25 - *v24;
    unint64_t v28 = v27 >> 3;
    if (v23 + 1 > (unint64_t)(v27 >> 3)) {
      unint64_t v29 = v23 + 1;
    }
    else {
      unint64_t v29 = v27 >> 3;
    }
    if (v28 < v23 + 1)
    {
      unint64_t v30 = v29 - v28;
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 64);
      if (v29 - v28 <= (v31 - (uint64_t)v25) >> 3)
      {
        bzero(*(void **)(*(void *)(a1 + 32) + 56), 8 * v30);
        v24[1] = &v25[8 * v30];
      }
      else
      {
        if (v29 >> 61) {
          sub_1DD251DAC();
        }
        uint64_t v32 = v31 - (void)v26;
        if (v32 >> 2 > v29) {
          unint64_t v29 = v32 >> 2;
        }
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v33 = v29;
        }
        if (v33 >> 61) {
          sub_1DD251C54();
        }
        v34 = (char *)operator new(8 * v33);
        v35 = &v34[8 * v28];
        v36 = &v34[8 * v33];
        bzero(v35, 8 * v30);
        v37 = &v35[8 * v30];
        if (v25 == v26)
        {
          *v24 = v35;
          v24[1] = v37;
          v24[2] = v36;
        }
        else
        {
          do
          {
            uint64_t v38 = *((void *)v25 - 1);
            v25 -= 8;
            *(void *)v25 = 0;
            *((void *)v35 - 1) = v38;
            v35 -= 8;
          }
          while (v25 != v26);
          v25 = *v24;
          v39 = v24[1];
          *v24 = v35;
          v24[1] = v37;
          v24[2] = v36;
          while (v39 != v25)
          {
            v40 = (void *)*((void *)v39 - 1);
            v39 -= 8;
          }
        }
        if (v25) {
          operator delete(v25);
        }
      }
    }
    uint64_t v41 = *(void *)(a1 + 40);
    uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 48);
    v43 = *(void **)(v42 + 8 * v41);
    *(void *)(v42 + 8 * v41) = v18;

    v44 = lpsrc[0];
    lpsrc[0] = 0;
    if (v44) {
      (*(void (**)(void *))(*(void *)v44 + 8))(v44);
    }
    uint64_t v45 = v46[0];
    v46[0] = 0;
    if (v45) {
      (*(void (**)(uint64_t))(*(void *)v45 + 8))(v45);
    }
    return (void *)sub_1DD271694((uint64_t)v47);
  }
  return result;
}

void sub_1DD30EC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v17 = a15;
  a15 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  sub_1DD271694((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_1DD30EE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30EEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30F16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD30F3FC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 24))(*(void *)(*(void *)(a1 + 32) + 16));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1DD30F518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30F668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30F740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30F92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30FC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30FCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD30FE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD310248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3103F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3104FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3105AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD310910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD310A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD310BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD310E18(uint64_t a1, const char *a2, uint64_t a3)
{
  v4 = objc_msgSend_storage(*(void **)(a1 + 32), a2, a3);
  uint64_t v7 = objc_msgSend_fileURL(v4, v5, v6);

  if (!v7) {
    operator new();
  }
  v10 = objc_msgSend_storage(*(void **)(a1 + 32), v8, v9);
  uint64_t v13 = objc_msgSend_fileURL(v10, v11, v12);
  objc_msgSend_path(v13, v14, v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (char *)objc_msgSend_UTF8String(v16, v17, v18);
  sub_1DD314888(__p, v19);
  sub_1DD270984((uint64_t)__p, &v80);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = v80;
  uint64_t v80 = 0;
  uint64_t v22 = *(void *)(v20 + 24);
  *(void *)(v20 + 24) = v21;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  uint64_t v23 = v80;
  uint64_t v80 = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  if (v79 < 0) {
    operator delete(__p[0]);
  }

  v26 = objc_msgSend_helpers(*(void **)(a1 + 32), v24, v25);
  objc_msgSend_generateSchema(v26, v27, v28);
  id v29 = objc_claimAutoreleasedReturnValue();
  uint64_t v31 = (char *)objc_msgSend_cStringUsingEncoding_(v29, v30, 4);
  sub_1DD314888(__p, v31);
  sub_1DD28C248((uint64_t)__p, &v80);
  if (v79 < 0) {
    operator delete(__p[0]);
  }

  sub_1DD291254(__p);
  v34 = objc_msgSend_options(*(void **)(a1 + 32), v32, v33);
  uint64_t v37 = objc_msgSend_compressionKind(v34, v35, v36);

  if (v37)
  {
    if (v37 != 1) {
      goto LABEL_17;
    }
    int v40 = 5;
  }
  else
  {
    int v40 = 0;
  }
  sub_1DD291550((uint64_t)__p, v40);
LABEL_17:
  uint64_t v41 = objc_msgSend_options(*(void **)(a1 + 32), v38, v39);
  uint64_t v44 = objc_msgSend_compressionBlockSize(v41, v42, v43);
  sub_1DD291458((uint64_t)__p, v44);

  v47 = objc_msgSend_options(*(void **)(a1 + 32), v45, v46);
  uint64_t v50 = objc_msgSend_stripeSize(v47, v48, v49);
  sub_1DD29144C((uint64_t)__p, v50);

  sub_1DD291470((uint64_t)__p, 1024);
  v51 = sub_1DD269DC0();
  sub_1DD2914C4((uint64_t)__p, v51);
  sub_1DD2914AC((uint64_t)__p, 1.0);
  sub_1DD291488((uint64_t)__p, 0);
  if (!sub_1DD2915A0((uint64_t)__p))
  {
    v73 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v52, v53);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v73, v74, *(void *)(a1 + 40), *(void *)(a1 + 32), @"CKXORCReaderWriter.mm", 720, @"Expected dictionary to be enabled");
  }
  if (sub_1DD291594((uint64_t)__p))
  {
    v75 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v54, v55);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v75, v76, *(void *)(a1 + 40), *(void *)(a1 + 32), @"CKXORCReaderWriter.mm", 721, @"Expected indexes to be disabled");
  }
  sub_1DD292FDC(v80, *(void *)(*(void *)(a1 + 32) + 24), (uint64_t)__p, v77);
  uint64_t v56 = *(void *)(a1 + 32);
  uint64_t v57 = *(void *)v77;
  *(void *)v77 = 0;
  uint64_t v58 = *(void *)(v56 + 16);
  *(void *)(v56 + 16) = v57;
  if (v58) {
    (*(void (**)(uint64_t))(*(void *)v58 + 8))(v58);
  }
  uint64_t v59 = *(void *)v77;
  *(void *)v77 = 0;
  if (v59) {
    (*(void (**)(uint64_t))(*(void *)v59 + 8))(v59);
  }
  (*(void (**)(uint8_t *__return_ptr))(**(void **)(*(void *)(a1 + 32) + 16) + 16))(v77);
  uint64_t v62 = *(void *)(a1 + 32);
  uint64_t v63 = *(void *)v77;
  *(void *)v77 = 0;
  uint64_t v64 = *(void *)(v62 + 32);
  *(void *)(v62 + 32) = v63;
  if (v64) {
    (*(void (**)(uint64_t))(*(void *)v64 + 8))(v64);
  }
  uint64_t v65 = *(void *)v77;
  *(void *)v77 = 0;
  if (v65) {
    (*(void (**)(uint64_t))(*(void *)v65 + 8))(v65);
  }
  v66 = objc_msgSend_helpers(*(void **)(a1 + 32), v60, v61, *(void *)v77);
  uint64_t v69 = objc_msgSend_rootColumn(*(void **)(a1 + 32), v67, v68);
  objc_msgSend_configureColumnsWithRootColumn_(v66, v70, v69);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v71 = *MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v77 = 0;
    _os_log_debug_impl(&dword_1DD237000, v71, OS_LOG_TYPE_DEBUG, "Created ORC writer", v77, 2u);
  }
  sub_1DD29135C((uint64_t)__p);
  uint64_t result = v80;
  uint64_t v80 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

void sub_1DD3113B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17)
{
  sub_1DD29135C((uint64_t)&__p);
  uint64_t v19 = a17;
  a17 = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  _Unwind_Resume(a1);
}

void sub_1DD3115A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3115B8(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v3 + 24) > v2) {
    unint64_t v2 = *(void *)(v3 + 24);
  }
  *(void *)(v3 + 24) = v2;
  return result;
}

void sub_1DD3118E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

void *sub_1DD311B30(void *result, void *lpsrc)
{
  if (lpsrc)
  {
    unint64_t v2 = result;
    uint64_t result = __dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0);
    if (result)
    {
      unint64_t v3 = result[2];
      if (v3 < *(void *)(*(void *)(v2[4] + 32) + 16))
      {
        uint64_t v4 = result[12];
        uint64_t v5 = *(void *)(v4 + 8 * v3);
        uint64_t v6 = v4 + 8;
        do
          *(void *)(v6 + 8 * v3++) = v5;
        while (v3 < *(void *)(*(void *)(v2[4] + 32) + 16));
      }
    }
  }
  return result;
}

uint64_t sub_1DD311BF0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_options(*(void **)(a1 + 32), a2, a3);
  uint64_t v9 = objc_msgSend_testExceptionDuringCommitBatch(v4, v5, v6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_commitCount(*(void **)(a1 + 32), v7, v8);
    uint64_t v13 = objc_msgSend_options(*(void **)(a1 + 32), v11, v12);
    uint64_t v16 = objc_msgSend_testExceptionDuringCommitBatchCommitsToSkip(v13, v14, v15);

    if (v10 == v16)
    {
      uint64_t v19 = objc_msgSend_options(*(void **)(a1 + 32), v17, v18);
      objc_msgSend_testExceptionDuringCommitBatch(v19, v20, v21);
      id v22 = objc_claimAutoreleasedReturnValue();
      uint64_t v25 = (char *)objc_msgSend_UTF8String(v22, v23, v24);
      sub_1DD314888(&v29, v25);

      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1DD26D86C(exception, &v29);
      __cxa_throw(exception, (struct type_info *)&unk_1F3877E48, (void (*)(void *))std::runtime_error::~runtime_error);
    }
  }
  else
  {
  }
  uint64_t v27 = *(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 24);
  return v27();
}

void sub_1DD311D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD311D94(int a1, void *lpsrc)
{
  if (lpsrc)
  {
    unint64_t v2 = __dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F38782D0, 0);
    if (v2)
    {
      unint64_t v3 = v2;
      if (v2[2])
      {
        unint64_t v4 = 0;
        do
        {
          free(*(void **)(v3[12] + 8 * v4));
          *(void *)(v3[12] + 8 * v4++) = 0;
        }
        while (v4 < v3[2]);
      }
    }
  }
}

void sub_1DD311E38(int a1, void *lpsrc)
{
  if (lpsrc)
  {
    unint64_t v2 = __dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0);
    if (v2)
    {
      unint64_t v3 = 0;
      uint64_t v4 = v2[12];
      do
        *(void *)(v4 + 8 * v3++) = 0;
      while (v3 <= v2[2]);
    }
  }
}

uint64_t sub_1DD311EBC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_resetColumnNulls_inRange_, a2);
}

void sub_1DD311F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3121FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD312240(void *a1, void *a2, uint64_t a3)
{
  unint64_t v5 = a2[1];
  uint64_t v6 = (const char *)a1[5];
  if (v5 > (unint64_t)v6)
  {
    uint64_t v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, a1[6], a1[4], @"CKXORCReaderWriter.mm", 868, @"Previous column capacity %llu unexpectedly greater than batch capacity %llu", v5, a1[5]);
  }
  (*(void (**)(void *))(*a2 + 24))(a2);
  uint64_t v7 = a1[4];
  return MEMORY[0x1F4181798](v7, sel_resetColumnNulls_inRange_, a2);
}

void sub_1DD312310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD312428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD312890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3128FC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 <= *(void *)(a2 + 16)) {
    unint64_t v3 = *(void *)(a2 + 16);
  }
  *(void *)(v2 + 24) = v3;
  return result;
}

void sub_1DD312BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD312D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD312E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3130C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD313230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD313280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3134A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD31381C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3139D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD313BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD313EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD314130(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 32))(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v4();
  }
  return result;
}

void sub_1DD31428C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3143C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD314500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3145F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD314844(void *result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v4 = result[6];
  uint64_t v5 = *(void *)(result[4] + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v4 >= v6 + a3)
  {
    *(void *)(v5 + 24) = v6 + a3;
  }
  else
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = v4 + a2 - v6;
    *a4 = 1;
  }
  return result;
}

void *sub_1DD314888(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1DD239EFC();
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

void *sub_1DD31493C(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  if (a3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 8 * a3;
    uint64_t v7 = a1;
    do
    {
      uint64_t v8 = operator new(0x18uLL);
      uint64_t v9 = *(void *)(a2 + 8 * v5);
      v8[1] = a1;
      v8[2] = v9;
      void *v8 = v7;
      v7[1] = v8;
      *a1 = v8;
      a1[2] = ++v5;
      uint64_t v7 = v8;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_1DD3149BC(_Unwind_Exception *a1)
{
  sub_1DD277088(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3149D0(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    size_t v4 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v4();
  }
  return result;
}

void sub_1DD314A68(void *a1)
{
  if (a1)
  {
    sub_1DD314A68(*a1);
    sub_1DD314A68(a1[1]);
    operator delete(a1);
  }
}

uint64_t *sub_1DD314AB4(uint64_t *result, unint64_t *a2, uint64_t a3)
{
  size_t v4 = result;
  uint64_t v6 = (uint64_t **)(result + 1);
  uint64_t v5 = (uint64_t *)result[1];
  if (!v5)
  {
    uint64_t v10 = (uint64_t **)(result + 1);
    goto LABEL_15;
  }
  unint64_t v8 = a2[1];
  unint64_t v7 = a2[2];
  unint64_t v9 = *a2;
  do
  {
    while (1)
    {
      uint64_t v10 = (uint64_t **)v5;
      unint64_t v11 = v5[5];
      if (v8 >= v11)
      {
        if (v8 > v11) {
          goto LABEL_5;
        }
        uint64_t v12 = v10[6];
        if (v7 >= (unint64_t)v12) {
          break;
        }
      }
LABEL_10:
      uint64_t v5 = *v10;
      uint64_t v6 = v10;
      if (!*v10) {
        goto LABEL_15;
      }
    }
    if (v7 <= (unint64_t)v12)
    {
      uint64_t v13 = v10[4];
      if (v9 < (unint64_t)v13) {
        goto LABEL_10;
      }
      if ((unint64_t)v13 >= v9) {
        return result;
      }
    }
LABEL_5:
    uint64_t v5 = v10[1];
  }
  while (v5);
  uint64_t v6 = v10 + 1;
LABEL_15:
  v14 = operator new(0x38uLL);
  v14[2] = *(_OWORD *)a3;
  *((void *)v14 + 6) = *(void *)(a3 + 16);
  *(void *)v14 = 0;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = v10;
  *uint64_t v6 = (uint64_t *)v14;
  uint64_t v15 = *(void *)*v4;
  if (v15)
  {
    uint64_t *v4 = v15;
    uint64_t v16 = *v6;
  }
  else
  {
    uint64_t v16 = (uint64_t *)v14;
  }
  uint64_t result = sub_1DD269534((uint64_t *)v4[1], v16);
  ++v4[2];
  return result;
}

void sub_1DD314C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD314D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD314F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3151B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3156F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1DD315960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315998(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend_backingStore(*(void **)(a1 + 32), a2, a3);
  unint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_msgSend_listInstance(v7, v4, v5);
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  unint64_t v8 = objc_msgSend_structProxyForListInstance_atIndex_(v6, v4, (uint64_t)v9, *(void *)(a1 + 56));

  (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void sub_1DD315A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DD315CC0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend_backingStore(*(void **)(a1 + 32), a2, a3);
  unint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_msgSend_listInstance(v7, v4, v5);
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  unint64_t v8 = objc_msgSend_appendedStructProxyForListInstance_(v6, v4, (uint64_t)v18);

  if (v8)
  {
    unint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = objc_msgSend_index(v11, v9, v10);
    objc_msgSend_setIndex_(v11, v13, v12 + 1);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v17 = objc_msgSend_index(*(void **)(a1 + 32), v15, v16);
    (*(void (**)(uint64_t, void *, uint64_t))(v14 + 16))(v14, v8, v17);
  }
}

void sub_1DD315D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD315F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3160A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD31616C(void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v4 = (*(void *)&v2 - 1) & a2;
  }
  uint64_t v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  uint64_t result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }
        else
        {
          v7 &= *(void *)&v2 - 1;
        }
        if (v7 != v4) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void sub_1DD31621C(id *a1)
{
  if (a1)
  {
    v1 = a1;
    do
    {
      int8x8_t v2 = (id *)*v1;

      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void *sub_1DD316260(uint64_t *a1, unint64_t a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v7 = a1[1];
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
    unint64_t v9 = *(void ***)(*a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
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
  uint64_t v12 = a1 + 2;
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v5;
  i[2] = *a3;
  i[3] = 0;
  float v13 = (float)(unint64_t)(a1[3] + 1);
  float v14 = *((float *)a1 + 8);
  if (v7 && (float)(v14 * (float)v7) >= v13)
  {
    unint64_t v5 = v3;
    goto LABEL_64;
  }
  BOOL v15 = 1;
  if (v7 >= 3) {
    BOOL v15 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v16 = v15 | (2 * v7);
  unint64_t v17 = vcvtps_u32_f32(v13 / v14);
  if (v16 <= v17) {
    int8x8_t prime = (int8x8_t)v17;
  }
  else {
    int8x8_t prime = (int8x8_t)v16;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = a1[1];
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v25 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
    if (v7 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
    {
      unint64_t v25 = std::__next_prime(v25);
    }
    else
    {
      uint64_t v27 = 1 << -(char)__clz(v25 - 1);
      if (v25 >= 2) {
        unint64_t v25 = v27;
      }
    }
    if (*(void *)&prime <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = a1[1];
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      v34 = (void *)*a1;
      *a1 = 0;
      if (v34) {
        operator delete(v34);
      }
      unint64_t v7 = 0;
      a1[1] = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    sub_1DD251C54();
  }
  uint64_t v19 = operator new(8 * *(void *)&prime);
  uint64_t v20 = (void *)*a1;
  *a1 = (uint64_t)v19;
  if (v20) {
    operator delete(v20);
  }
  uint64_t v21 = 0;
  a1[1] = (uint64_t)prime;
  do
    *(void *)(*a1 + 8 * v21++) = 0;
  while (*(void *)&prime != v21);
  id v22 = (void *)*v12;
  if (*v12)
  {
    unint64_t v23 = v22[1];
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&prime) {
        v23 %= *(void *)&prime;
      }
    }
    else
    {
      v23 &= *(void *)&prime - 1;
    }
    *(void *)(*a1 + 8 * v23) = v12;
    uint64_t v28 = (void *)*v22;
    if (*v22)
    {
      do
      {
        unint64_t v29 = v28[1];
        if (v24.u32[0] > 1uLL)
        {
          if (v29 >= *(void *)&prime) {
            v29 %= *(void *)&prime;
          }
        }
        else
        {
          v29 &= *(void *)&prime - 1;
        }
        if (v29 != v23)
        {
          if (!*(void *)(*a1 + 8 * v29))
          {
            *(void *)(*a1 + 8 * v29) = v22;
            goto LABEL_56;
          }
          void *v22 = *v28;
          *uint64_t v28 = **(void **)(*a1 + 8 * v29);
          **(void **)(*a1 + 8 * v29) = v28;
          uint64_t v28 = v22;
        }
        unint64_t v29 = v23;
LABEL_56:
        id v22 = v28;
        uint64_t v28 = (void *)*v28;
        unint64_t v23 = v29;
      }
      while (v28);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v5) {
      v5 %= v7;
    }
  }
  else
  {
    v5 &= v7 - 1;
  }
LABEL_64:
  uint64_t v30 = *a1;
  uint64_t v31 = *(void **)(*a1 + 8 * v5);
  if (v31)
  {
    void *i = *v31;
LABEL_72:
    *uint64_t v31 = i;
    goto LABEL_73;
  }
  void *i = *v12;
  void *v12 = i;
  *(void *)(v30 + 8 * v5) = v12;
  if (*i)
  {
    unint64_t v32 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7) {
        v32 %= v7;
      }
    }
    else
    {
      v32 &= v7 - 1;
    }
    uint64_t v31 = (void *)(*a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_1DD31663C(_Unwind_Exception *a1)
{
  sub_1DD316654(1, v1);
  _Unwind_Resume(a1);
}

void sub_1DD316654(char a1, id *a2)
{
  if (a1)
  {
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void sub_1DD316CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD316CD4(uint64_t a1, void *a2, uint64_t a3)
{
  id cf = a2;
  if (objc_msgSend_scope(cf, v5, v6) == *(void *)(a1 + 48))
  {
    objc_msgSend_commit(cf, v7, v8);
    CFIndex v9 = CFGetRetainCount(cf);
    uint64_t v12 = *(void **)(a1 + 32);
    if (v9 > 2)
    {
      uint64_t v14 = objc_msgSend_totalProxiesRetainedOutOfScope(*(void **)(a1 + 32), v10, v11);
      objc_msgSend_setTotalProxiesRetainedOutOfScope_(v12, v15, v14 + 1);
    }
    else
    {
      objc_msgSend__putBackProxyWithoutCheckingScope_(*(void **)(a1 + 32), v10, (uint64_t)cf);
    }
    objc_msgSend_addIndex_(*(void **)(a1 + 40), v13, a3);
  }
}

uint64_t sub_1DD316D80(uint64_t result)
{
  return result;
}

uint64_t sub_1DD317120(int a1, Class aClass, objc_class *a3)
{
  unint64_t v4 = NSStringFromClass(aClass);
  unint64_t v5 = NSStringFromClass(a3);
  uint64_t v7 = objc_msgSend_compare_(v4, v6, (uint64_t)v5);

  return v7;
}

void sub_1DD317184(uint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v5 = objc_msgSend_cachedProxies(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)a2);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = NSStringFromClass((Class)a2);
  uint64_t v11 = objc_msgSend_count(v13, v9, v10);
  objc_msgSend_appendFormat_(v7, v12, @"  %@: %lu\n", v8, v11);
}

void sub_1DD317224(uint64_t a1, void *a2)
{
  unint64_t v3 = NSNumber;
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v8 = objc_msgSend_scope(v5, v6, v7);
  objc_msgSend_numberWithInteger_(v3, v9, v8);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)v25);
  uint64_t v14 = objc_msgSend_integerValue(v11, v12, v13);
  unint64_t v16 = objc_msgSend_numberWithInteger_(v3, v15, v14 + 1);
  unint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = NSNumber;
  uint64_t v21 = objc_msgSend_scope(v5, v19, v20);

  unint64_t v23 = objc_msgSend_numberWithInteger_(v18, v22, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v24, (uint64_t)v16, v23);
}

void sub_1DD317310(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v7 = objc_msgSend_integerValue(a3, v5, v6);
  objc_msgSend_appendFormat_(v4, v8, @"  %@: %ld\n", v9, v7);
}

void sub_1DD31833C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v6 = objc_msgSend_atoms(v3, v4, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DD31843C;
  v8[3] = &unk_1E6CBAFD0;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = v12;
  objc_msgSend_enumerate_(v6, v7, (uint64_t)v8);

  _Block_object_dispose(v12, 8);
}

void sub_1DD318424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD31843C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v42 = v3;
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = objc_msgSend_atomType(v5, v3, v4);
  id v3 = v42;
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = objc_msgSend_atomType(v42, v42, v4);
  uint64_t v11 = objc_msgSend_atomType(*(void **)(a1 + 32), v9, v10);
  uint64_t v14 = objc_msgSend_unsignedIntegerValue(v11, v12, v13);

  id v3 = v42;
  if (v8 == v14)
  {
LABEL_4:
    BOOL v15 = objc_msgSend_timestamp(v3, v3, v4);
    uint64_t v18 = objc_msgSend_distributedSiteIdentifier(v15, v16, v17);
    uint64_t v21 = objc_msgSend_modifier(v18, v19, v20);
    if (v21)
    {
      uint8x8_t v24 = (void *)v21;
      uint64_t v25 = objc_msgSend_siteIdentifierModifier(*(void **)(a1 + 32), v22, v23);
      if (v25)
      {
        uint64_t v28 = (void *)v25;
        unint64_t v29 = objc_msgSend_timestamp(v42, v26, v27);
        unint64_t v32 = objc_msgSend_distributedSiteIdentifier(v29, v30, v31);
        v35 = objc_msgSend_modifier(v32, v33, v34);
        uint64_t v38 = objc_msgSend_siteIdentifierModifier(*(void **)(a1 + 32), v36, v37);
        char isEqual = objc_msgSend_isEqual_(v35, v39, (uint64_t)v38);

        if ((isEqual & 1) == 0) {
          goto LABEL_11;
        }
LABEL_10:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
LABEL_11:
  return MEMORY[0x1F41817F8]();
}

void sub_1DD318728(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_atoms(a2, (const char *)a2, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1DD3187E0;
  v9[3] = &unk_1E6CBB020;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v11 = v5;
  v9[4] = v6;
  id v10 = v7;
  objc_msgSend_appendWithProxyBlock_(v4, v8, (uint64_t)v9);
}

void sub_1DD3187E0(uint64_t a1, void *a2)
{
  id v9 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (objc_msgSend_formatVersion(*(void **)(a1 + 32), v3, v4) <= 2 && *(void *)(a1 + 40))
  {
    uint64_t v7 = objc_msgSend_location(v9, v5, v6);
    objc_msgSend_copyFromMergeableValueID_(v7, v8, *(void *)(a1 + 40));
  }
}

void sub_1DD318CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD318D14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD318D24(uint64_t a1)
{
}

void sub_1DD318D2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = sub_1DD319144;
  v68[3] = &unk_1E6CBB070;
  long long v69 = *(_OWORD *)(a1 + 56);
  uint64_t v70 = a4;
  uint64_t v8 = (void (**)(void, void, void))MEMORY[0x1E01B2450](v68);
  id v11 = objc_msgSend_timestamp(v7, v9, v10);
  uint64_t v14 = objc_msgSend_timestamp(v11, v12, v13);

  uint64_t v17 = objc_msgSend_timestamp(v7, v15, v16);
  uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v18, @"Atom %lu is missing timestamp", a3);
  ((void (**)(void, BOOL, void *))v8)[2](v8, v17 != 0, v19);

  int v22 = *(unsigned __int8 *)(a1 + 72);
  if (v22 == 3)
  {
    uint64_t v23 = objc_msgSend_timestamp(v7, v20, v21);
    uint8x8_t v26 = objc_msgSend_distributedSiteIdentifier(v23, v29, v30);
    uint64_t v28 = objc_msgSend_identifier(v26, v31, v32);
    uint64_t v34 = objc_msgSend_stringWithFormat_(NSString, v33, @"Atom %lu is missing site identifier", a3);
    ((void (**)(void, BOOL, void *))v8)[2](v8, v28 != 0, v34);
  }
  else
  {
    if (v22 != 2) {
      goto LABEL_6;
    }
    uint64_t v23 = objc_msgSend_timestamp(v7, v20, v21);
    uint8x8_t v26 = objc_msgSend_siteIdentifier(v23, v24, v25);
    uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v27, @"Atom %lu is missing site identifier", a3);
    ((void (**)(void, BOOL, void *))v8)[2](v8, v26 != 0, v28);
  }

LABEL_6:
  v35 = objc_msgSend_contents(*(void **)(a1 + 32), v20, v21);
  int v37 = objc_msgSend_atomStateForTimestamp_(v35, v36, (uint64_t)v14);

  uint64_t v38 = NSString;
  uint64_t v41 = objc_msgSend_contents(*(void **)(a1 + 32), v39, v40);
  uint64_t v43 = objc_msgSend_stringWithFormat_(v38, v42, @"Timestamp %@ for atom %lu not included in contents vector %@", v14, a3, v41);
  ((void (**)(void, BOOL, void *))v8)[2](v8, v37 != 0, v43);

  if (v37 == 3)
  {
    uint64_t v46 = objc_msgSend_stringWithFormat_(NSString, v44, @"Atom %lu with timestamp %@ is marked as missing", a3, v14);
    ((void (**)(void, void, void *))v8)[2](v8, 0, v46);
  }
  else
  {
    if (v37 != 2) {
      goto LABEL_11;
    }
    uint64_t v46 = objc_msgSend_value(v7, v44, v45);
    v48 = objc_msgSend_stringWithFormat_(NSString, v47, @"Atom %lu with timestamp %@ is marked as tombstoned, but has value", a3, v14);
    ((void (**)(void, BOOL, void *))v8)[2](v8, v46 == 0, v48);
  }
LABEL_11:
  uint64_t v49 = objc_msgSend_references(v7, v44, v45);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_1DD319258;
  v63[3] = &unk_1E6CBB098;
  uint64_t v50 = v8;
  id v65 = v50;
  uint64_t v66 = a3;
  char v67 = *(unsigned char *)(a1 + 72);
  id v64 = *(id *)(a1 + 40);
  objc_msgSend_enumerate_(v49, v51, (uint64_t)v63);

  if (v14)
  {
    v54 = *(void **)(a1 + 48);
    uint64_t v55 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v56 = objc_msgSend_clockValue(v14, v52, v53);
    uint64_t v58 = objc_msgSend_indexSetWithIndex_(v55, v57, v56);
    uint64_t v61 = objc_msgSend_siteIdentifierObject(v14, v59, v60);
    objc_msgSend_addClockValuesInIndexSet_forSiteIdentifier_(v54, v62, (uint64_t)v58, v61);
  }
}

void sub_1DD319144(uint64_t a1, char a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) && (a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = a3;
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a3;
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v7, (uint64_t)v14, &v13, 1);
    uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(v4, v9, @"CKDSErrorDomain", 3, v8);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    **(unsigned char **)(a1 + 48) = 1;
  }
}

void sub_1DD319258(uint64_t a1, void *a2, uint64_t a3)
{
  id v50 = a2;
  id v7 = objc_msgSend_timestamp(v50, v5, v6);
  uint64_t v10 = objc_msgSend_timestamp(v7, v8, v9);

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v14 = objc_msgSend_timestamp(v50, v12, v13);
  uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v15, @"Reference %lu in atom %lu is missing timestamp", a3, *(void *)(a1 + 48));
  (*(void (**)(uint64_t, BOOL, void *))(v11 + 16))(v11, v14 != 0, v16);

  if (!(*(void *)(a1 + 48) | a3))
  {
    uint64_t v19 = objc_msgSend_timestamp(v50, v17, v18);
    int v22 = objc_msgSend_siteIdentifier(v19, v20, v21);
    if (v22)
    {
    }
    else
    {
      uint64_t v25 = objc_msgSend_timestamp(v50, v23, v24);
      uint64_t v28 = objc_msgSend_clock(v25, v26, v27);

      if (!v28) {
        goto LABEL_12;
      }
    }
  }
  int v29 = *(unsigned __int8 *)(a1 + 56);
  if (v29 == 3)
  {
    uint64_t v37 = *(void *)(a1 + 40);
    uint64_t v31 = objc_msgSend_timestamp(v50, v17, v18);
    uint64_t v34 = objc_msgSend_distributedSiteIdentifier(v31, v38, v39);
    uint64_t v36 = objc_msgSend_identifier(v34, v40, v41);
    uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v42, @"Reference %lu in atom %lu is missing site identifier", a3, *(void *)(a1 + 48));
    (*(void (**)(uint64_t, BOOL, void *))(v37 + 16))(v37, v36 != 0, v43);
  }
  else
  {
    if (v29 != 2) {
      goto LABEL_10;
    }
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = objc_msgSend_timestamp(v50, v17, v18);
    uint64_t v34 = objc_msgSend_siteIdentifier(v31, v32, v33);
    uint64_t v36 = objc_msgSend_stringWithFormat_(NSString, v35, @"Reference %lu in atom %lu is missing site identifier", a3, *(void *)(a1 + 48));
    (*(void (**)(uint64_t, BOOL, void *))(v30 + 16))(v30, v34 != 0, v36);
  }

LABEL_10:
  uint64_t v44 = objc_msgSend_location(v50, v17, v18);

  if (!v44)
  {
    uint64_t v46 = *(void *)(a1 + 40);
    uint64_t v47 = objc_msgSend_includesTimestamp_(*(void **)(a1 + 32), v45, (uint64_t)v10);
    uint64_t v49 = objc_msgSend_stringWithFormat_(NSString, v48, @"Timestamp %@ for reference %lu in atom %lu is not present in vectors", v10, a3, *(void *)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, void *))(v46 + 16))(v46, v47, v49);
  }
LABEL_12:
}

void sub_1DD319A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD319A78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_atoms(a2, (const char *)a2, a3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DD319B08;
  v6[3] = &unk_1E6CBB0E8;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend_enumerate_(v4, v5, (uint64_t)v6);
}

void sub_1DD319B08(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend_location(a2, (const char *)a2, a3);
  uint64_t v9 = objc_msgSend_mergeableValueID(v6, v7, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
}

void sub_1DD319E18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DD319E30(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend_atoms(a2, (const char *)a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = objc_msgSend_count(v6, v4, v5);
}

void sub_1DD319E8C(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend_atoms(a2, (const char *)a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = objc_msgSend_count(v6, v4, v5);
}

void sub_1DD319F98(uint64_t a1, void *a2)
{
  id v42 = a2;
  uint64_t v5 = objc_msgSend_timestamp(v42, v3, v4);
  uint64_t v8 = objc_msgSend_distributedSiteIdentifier(v5, v6, v7);
  uint64_t v11 = objc_msgSend_identifier(v8, v9, v10);
  uint64_t v14 = v11;
  if (v11)
  {
    id v15 = v11;
  }
  else
  {
    uint64_t v16 = objc_msgSend_timestamp(v42, v12, v13);
    objc_msgSend_siteIdentifier(v16, v17, v18);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v21 = objc_msgSend_timestamp(v42, v19, v20);
  uint64_t v24 = objc_msgSend_distributedSiteIdentifier(v21, v22, v23);
  uint64_t v27 = objc_msgSend_modifier(v24, v25, v26);

  id v28 = objc_alloc(MEMORY[0x1E4F19F80]);
  uint64_t v30 = objc_msgSend_initWithIdentifier_modifier_(v28, v29, (uint64_t)v15, v27);
  uint64_t v31 = *(void **)(a1 + 32);
  uint64_t v32 = (void *)MEMORY[0x1E4F28D60];
  v35 = objc_msgSend_timestamp(v42, v33, v34);
  uint64_t v38 = objc_msgSend_clock(v35, v36, v37);
  uint64_t v40 = objc_msgSend_indexSetWithIndex_(v32, v39, v38);
  objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v31, v41, (uint64_t)v40, 1, v30);
}

void sub_1DD31A4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD31A51C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  uint64_t v8 = objc_msgSend_timestamp(v5, v6, v7);
  uint64_t v11 = objc_msgSend_timestamp(v8, v9, v10);

  if (*(unsigned char *)(a1 + 72)) {
    objc_msgSend_descriptionWithStringSiteIdentifiers(v11, v12, v13);
  }
  else {
  uint64_t v14 = objc_msgSend_description(v11, v12, v13);
  }
  uint64_t v19 = objc_msgSend_mergeableValueID(*(void **)(a1 + 32), v15, v16);
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v23 = *(void **)(v20 + 40);
  int v22 = (void **)(v20 + 40);
  uint64_t v21 = v23;
  if (v23) {
    BOOL v24 = v19 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  if (v24)
  {
    if (v21 == v19) {
      goto LABEL_12;
    }
LABEL_16:
    id v27 = v19;
    id v28 = *v22;
    const char *v22 = v19;

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    if (a3) {
      objc_msgSend_appendFormat_(*(void **)(a1 + 40), v17, @"\n  },\n");
    }
    goto LABEL_19;
  }
  char isEqual = objc_msgSend_isEqual_(v21, v17, (uint64_t)v19);
  if ((isEqual & 1) == 0)
  {
    int v22 = (void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!a3)
  {
    *(void *)(v26 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
LABEL_19:
    int v29 = *(void **)(a1 + 40);
    uint64_t v30 = objc_msgSend_name(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v17, v18);
    objc_msgSend_appendFormat_(v29, v31, @"  ValueID %@ {\n", v30);

    goto LABEL_20;
  }
  if (*(void *)(v26 + 24)) {
    objc_msgSend_appendFormat_(*(void **)(a1 + 40), v17, @",\n");
  }
LABEL_20:
  objc_msgSend_appendFormat_(*(void **)(a1 + 40), v17, @"    Atom {\n");
  objc_msgSend_appendFormat_(*(void **)(a1 + 40), v32, @"      Timestamp: %@\n", v14);
  uint64_t v33 = *(void **)(a1 + 40);
  uint64_t v36 = objc_msgSend_atomType(v5, v34, v35);
  objc_msgSend_appendFormat_(v33, v37, @"      Type: %lu\n", v36);
  uint64_t v40 = objc_msgSend_references(v5, v38, v39);
  uint64_t v56 = MEMORY[0x1E4F143A8];
  uint64_t v57 = 3221225472;
  uint64_t v58 = sub_1DD31A820;
  uint64_t v59 = &unk_1E6CBB188;
  id v60 = *(id *)(a1 + 40);
  objc_msgSend_enumerate_(v40, v41, (uint64_t)&v56);

  uint64_t v44 = objc_msgSend_value(v5, v42, v43);

  if (v44)
  {
    uint64_t v47 = objc_msgSend_atomValueDescriptionBlock(*(void **)(a1 + 32), v45, v46);

    id v50 = *(void **)(a1 + 40);
    if (v47)
    {
      objc_msgSend_atomValueDescriptionBlock(*(void **)(a1 + 32), v48, v49);
      v51 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v51)[2](v51, v5);
    }
    else
    {
      objc_msgSend_value(v5, v48, v49);
      v51 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v51, v52, v53);
    v54 = };
    objc_msgSend_appendFormat_(v50, v55, @"      Value: %@\n", v54, v56, v57, v58, v59);
  }
  objc_msgSend_appendFormat_(*(void **)(a1 + 40), v45, @"    }");
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void sub_1DD31A820(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  objc_msgSend_timestamp(a2, (const char *)a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_timestamp(v9, v5, v6);
  objc_msgSend_appendFormat_(v4, v8, @"      Reference %lu: %@\n", a3, v7);
}

void sub_1DD31AEC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD31AF74;
  v7[3] = &unk_1E6CBB1D8;
  id v8 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  objc_msgSend_appendAtomWithBlock_(v4, v6, (uint64_t)v7);
}

void sub_1DD31AF74(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend_copyFromReadProxy_(v4, v5, v3);
  objc_msgSend_location(v4, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_copyFromMergeableValueID_(v9, v8, *(void *)(a1 + 40));
}

void sub_1DD31B518(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD31B5B0;
  v7[3] = &unk_1E6CBB228;
  id v8 = v3;
  id v5 = v3;
  objc_msgSend_appendAtomWithBlock_(v4, v6, (uint64_t)v7);
}

uint64_t sub_1DD31B5B0(uint64_t a1, void *a2)
{
  return objc_msgSend_copyFromReadProxy_(a2, (const char *)a2, *(void *)(a1 + 32));
}

uint64_t sub_1DD31B698(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1DD31C0E8(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = 40;
  if (a3 < *(void *)(a1 + 48) >> 1) {
    uint64_t v6 = 32;
  }
  id v7 = *(id *)(a1 + v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD31C1BC;
  v11[3] = &unk_1E6CBB1D8;
  id v12 = v5;
  id v13 = v7;
  id v8 = v7;
  id v9 = v5;
  objc_msgSend_appendAtomWithBlock_(v8, v10, (uint64_t)v11);
}

void sub_1DD31C1BC(uint64_t a1, void *a2)
{
  objc_msgSend_copyFromReadProxy_(a2, (const char *)a2, *(void *)(a1 + 32));
  id v5 = objc_msgSend_timestamp(*(void **)(a1 + 32), v3, v4);
  id v8 = objc_msgSend_distributedSiteIdentifier(v5, v6, v7);
  uint64_t v11 = objc_msgSend_identifier(v8, v9, v10);
  uint64_t v14 = v11;
  if (v11)
  {
    id v46 = v11;
  }
  else
  {
    uint64_t v15 = objc_msgSend_timestamp(*(void **)(a1 + 32), v12, v13);
    objc_msgSend_siteIdentifier(v15, v16, v17);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v20 = objc_msgSend_timestamp(*(void **)(a1 + 32), v18, v19);
  uint64_t v23 = objc_msgSend_distributedSiteIdentifier(v20, v21, v22);
  uint64_t v26 = objc_msgSend_modifier(v23, v24, v25);

  id v27 = objc_alloc(MEMORY[0x1E4F19F80]);
  int v29 = objc_msgSend_initWithIdentifier_modifier_(v27, v28, (uint64_t)v46, v26);
  uint64_t v32 = objc_msgSend_vectors(*(void **)(a1 + 40), v30, v31);
  uint64_t v35 = objc_msgSend_contents(v32, v33, v34);
  uint64_t v36 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v39 = objc_msgSend_timestamp(*(void **)(a1 + 32), v37, v38);
  uint64_t v42 = objc_msgSend_clock(v39, v40, v41);
  uint64_t v44 = objc_msgSend_indexSetWithIndex_(v36, v43, v42);
  objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v35, v45, (uint64_t)v44, 1, v29);
}

uint64_t sub_1DD31CA20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CA44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CA68()
{
  sub_1DD25BBA8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD31CA9C()
{
  sub_1DD25BBA8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD31CAD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CAF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CB1C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_1DD31CB54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CB78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CB9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1DD31CBC0()
{
  sub_1DD25BBA8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1F417E380](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E438](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E440](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1F417E450](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E620](this, __pos, __n1, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::stoll(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EC18](__str, __idx, *(void *)&__base);
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
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1F417EE58](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE90](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
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

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
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

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}