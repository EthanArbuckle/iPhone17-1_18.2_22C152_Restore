@interface SentencePieceWrapper
- (BOOL)load:(id)a3;
- (SentencePieceWrapper)init;
- (id)decode:(id)a3;
- (id)encode:(id)a3;
- (id)encodingAndUTF8Spans:(const char *)a3;
@end

@implementation SentencePieceWrapper

- (id)decode:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  __p = 0;
  v37 = 0;
  v38 = 0;
  v34[0] = 0;
  v34[1] = 0;
  uint64_t v35 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = a3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v30, (uint64_t)v39, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v4);
        }
        int v13 = objc_msgSend_intValue(*(void **)(*((void *)&v30 + 1) + 8 * i), (const char *)v6, v7, v8, v9);
        int v14 = v13;
        v15 = v37;
        if (v37 >= v38)
        {
          v17 = (char *)__p;
          uint64_t v18 = (v37 - (unsigned char *)__p) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            sub_236913FC4();
          }
          uint64_t v20 = v38 - (unsigned char *)__p;
          if ((v38 - (unsigned char *)__p) >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v6 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v6 = v19;
          }
          if (v6)
          {
            v21 = (char *)sub_236914FFC((uint64_t)&v38, v6);
            v17 = (char *)__p;
            v15 = v37;
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[4 * v18];
          *(_DWORD *)v22 = v14;
          v16 = v22 + 4;
          while (v15 != v17)
          {
            int v23 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v22 - 1) = v23;
            v22 -= 4;
          }
          __p = v22;
          v37 = v16;
          v38 = &v21[4 * v6];
          if (v17) {
            operator delete(v17);
          }
        }
        else
        {
          *(_DWORD *)v37 = v13;
          v16 = v15 + 4;
        }
        v37 = v16;
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, (const char *)v6, (uint64_t)&v30, (uint64_t)v39, 16);
    }
    while (v10);
  }

  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->sp + 168))(&v29);
  sub_236944CE4(&v29);
  if (v35 >= 0) {
    objc_msgSend_stringWithUTF8String_(NSString, v24, (uint64_t)v34, v25, v26);
  }
  else {
  v27 = objc_msgSend_stringWithUTF8String_(NSString, v24, (uint64_t)v34[0], v25, v26);
  }
  if (SHIBYTE(v35) < 0) {
    operator delete(v34[0]);
  }
  if (__p)
  {
    v37 = (char *)__p;
    operator delete(__p);
  }

  return v27;
}

- (id)encodingAndUTF8Spans:(const char *)a3
{
  if (a3)
  {
    memset(v41, 0, sizeof(v41));
    sub_23691A304(v41);
    sp = self->sp;
    size_t v6 = strlen(a3);
    uint64_t v7 = sub_23691A4CC(v41);
    (*(void (**)(void **__return_ptr, void *, const char *, size_t, uint64_t))(*(void *)sp + 232))(__p, sp, a3, v6, v7);
    nullsub_1(__p);
    sub_236944CE4((uint64_t *)__p);
    uint64_t v8 = sub_23691A4C0((uint64_t)v41);
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v40 = 0;
        sub_23691A42C((uint64_t)v41, __p);
        uint64_t v40 = *((void *)__p[0] + i);
        __p[1] = __p[0];
        operator delete(__p[0]);
        v12 = NSNumber;
        uint64_t v13 = sub_23691A408((uint64_t)&v40);
        v17 = objc_msgSend_numberWithUnsignedInt_(v12, v14, v13, v15, v16);
        objc_msgSend_addObject_(v9, v18, (uint64_t)v17, v19, v20);

        v21 = (void *)MEMORY[0x263F08D40];
        unsigned int v22 = sub_23691A414((uint64_t)&v40);
        int v23 = sub_23691A420((uint64_t)&v40);
        int v24 = sub_23691A414((uint64_t)&v40);
        v27 = objc_msgSend_valueWithRange_(v21, v25, v22, (v23 - v24), v26);
        objc_msgSend_addObject_(v10, v28, (uint64_t)v27, v29, v30);
      }
    }
    id v31 = objc_alloc(MEMORY[0x263F61EA8]);
    second = objc_msgSend_initWithFirst_second_(v31, v32, (uint64_t)v9, (uint64_t)v10, v33);

    sub_23691A350(v41);
  }
  else
  {
    id v35 = objc_alloc(MEMORY[0x263F61EA8]);
    second = objc_msgSend_initWithFirst_second_(v35, v36, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v37);
  }
  return second;
}

- (id)encode:(id)a3
{
  int v23 = 0;
  int v24 = 0;
  uint64_t v25 = 0;
  id v4 = a3;
  uint64_t v8 = (const char *)objc_msgSend_cStringUsingEncoding_(v4, v5, 4, v6, v7);
  uint64_t v9 = v8;
  if (v8)
  {
    size_t v10 = strlen(v8);
    (*(void (**)(uint64_t *__return_ptr, void *, const char *, size_t, unsigned int **))(*(void *)self->sp
                                                                                                 + 144))(&v22, self->sp, v9, v10, &v23);
    sub_236944CE4(&v22);
    int v14 = objc_opt_new();
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    if (v23 != v24)
    {
      do
      {
        v17 = objc_msgSend_numberWithInt_(NSNumber, v11, *v15, v12, v13);
        objc_msgSend_addObject_(v14, v18, (uint64_t)v17, v19, v20);

        ++v15;
      }
      while (v15 != v16);
      uint64_t v15 = v23;
    }
    if (v15)
    {
      int v24 = v15;
      operator delete(v15);
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (BOOL)load:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  id v4 = a3;
  uint64_t v8 = (char *)objc_msgSend_cStringUsingEncoding_(v4, v5, 4, v6, v7);
  sub_236919B40(__p, v8);
  uint64_t v12 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->sp + 16))(&v12);
  if (sub_236944FEC(&v12) && *sub_236944FEC(&v12) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = sub_236944FEC(&v12);
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2080;
    uint64_t v18 = v11;
    _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SentencePieceWrapper: error loading %@ file: %s", buf, 0x16u);
  }
  uint64_t v9 = v12;
  sub_236944CE4(&v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }

  return v9 == 0;
}

- (SentencePieceWrapper)init
{
}

@end