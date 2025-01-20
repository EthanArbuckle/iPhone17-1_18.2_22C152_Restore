uint64_t AppleSPUHIDDriverClass::SendCommand(AppleSPUHIDDriverClass *this, unsigned int a2, const void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a6)
{
  uint64_t v7;
  NSObject *v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t input[2];

  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  v7 = IOConnectCallMethod(*((_DWORD *)this + 12), 0, input, 1u, inputStruct, inputStructCnt, 0, 0, outputStruct, a6);
  if (v7)
  {
    v9 = *((void *)this + 7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v7)) {
        v10 = mach_error_string(v7);
      }
      else {
        v10 = "";
      }
      *(_DWORD *)buf = 136316418;
      v12 = "";
      v13 = 2080;
      v14 = "result == 0 ";
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v19 = 1024;
      v20 = 1215;
      v21 = 1024;
      v22 = v7;
      _os_log_impl(&dword_24075C000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v7;
}

uint64_t SPUDataQueue::init(SPUDataQueue *this, unsigned __int8 *a2, size_t a3, int a4, unsigned int a5)
{
  v8 = this;
  *((void *)this + 1) = a2;
  v9 = (char *)this + 8;
  *((_DWORD *)this + 12) = a3;
  *((void *)this + 2) = off_26F4E1AB8;
  *((void *)this + 3) = this;
  if (!a5)
  {
    sub_24075E6D8((uint64_t)this + 8, 481, 0, 0, 0);
    sub_24075E6D8((uint64_t)v9, 482, 0, 0, 0);
    this = (SPUDataQueue *)*((void *)v8 + 3);
  }
  *((_WORD *)v8 + 20) = a5 | ((_WORD)a5 << 8);
  (*(void (**)(SPUDataQueue *, void, uint64_t))(*(void *)this + 64))(this, 0, a5 + 7 + 2 * a5 - (a5 + 7) % a5);
  LOBYTE(v10) = *((unsigned char *)v8 + 40);
  unsigned int v11 = v10;
  int v12 = a3 - 7 - 3 * v10 + (v10 + 7) % v10;
  *((_DWORD *)v8 + 8) = v12;
  v13 = (_DWORD *)*((void *)v8 + 1);
  if (a4)
  {
    bzero(v13, a3);
    v13 = (_DWORD *)*((void *)v8 + 1);
    _DWORD *v13 = *((_DWORD *)v8 + 8);
    v13[1] = 458758;
    uint64_t v10 = *((unsigned __int8 *)v8 + 40);
    unsigned int v11 = *((unsigned __int8 *)v8 + 40);
    v14 = (_DWORD *)((char *)v13 + v10 + 7 - ((int)v10 + 7) % v11);
    _DWORD *v14 = 0;
    *(_DWORD *)((char *)v14 + v10) = 0;
  }
  else if (*v13 == v12)
  {
    uint64_t v10 = v10;
  }
  else
  {
    sub_24075E6D8((uint64_t)v9, 518, v12, *v13, 0);
    v13 = (_DWORD *)*((void *)v8 + 1);
    uint64_t v10 = *((unsigned __int8 *)v8 + 40);
    unsigned int v11 = *((unsigned __int8 *)v8 + 40);
  }
  *((_DWORD *)v8 + 9) = *(_DWORD *)((char *)v13 + v10 - ((int)v10 + 7) % v11 + 7);
  (*(void (**)(void, void, size_t))(**((void **)v8 + 3) + 72))(*((void *)v8 + 3), 0, a3);
  v15 = *(uint64_t (**)(void))(**((void **)v8 + 3) + 88);

  return v15();
}

uint64_t sub_24075D894(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 48))();
}

uint64_t sub_24075D8B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 56))();
}

uint64_t sub_24075D8DC(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64))(a1, a2);
}

uint64_t sub_24075D904(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 72))(a1, a2);
}

uint64_t sub_24075D92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 80))(a1, a2, a3, a4, a6);
}

uint64_t sub_24075D954(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 88))();
}

uint64_t sub_24075D978(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

uint64_t sub_24075D99C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 104))();
}

uint64_t SPUDataQueue::clear(SPUDataQueue *this)
{
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  uint64_t v2 = *((void *)this + 2);
  (*(void (**)(void, void, uint64_t))(v2 + 16))(*((void *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  v3 = (int *)*((void *)this + 1);
  uint64_t v4 = *((unsigned __int8 *)this + 40);
  uint64_t v5 = v4 + 7 - ((int)v4 + 7) % *((unsigned __int8 *)this + 40);
  v6 = (int *)((char *)v3 + v5);
  _DWORD *v6 = 0;
  *(_DWORD *)((char *)v6 + v4) = 0;
  *((_DWORD *)this + 9) = 0;
  unsigned int v7 = *((_DWORD *)this + 8);
  if (v7 != *v3)
  {
    sub_24075E6D8((uint64_t)this + 8, 555, v7, *v3, 0);
    unsigned int v7 = *((_DWORD *)this + 8);
    LODWORD(v4) = *((unsigned __int8 *)this + 40);
    LODWORD(v5) = v4 + 7 - ((int)v4 + 7) % v4;
  }
  (*(void (**)(void, void, void))(v2 + 16))(*((void *)this + 3), (v5 + 2 * v4), v7);
  bzero((void *)(*((void *)this + 1)- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ *((unsigned __int8 *)this + 40)+ 7+ 2 * *((unsigned __int8 *)this + 40)), *((unsigned int *)this + 8));
  (*(void (**)(void, void, void))(v2 + 24))(*((void *)this + 3), (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40), *((unsigned int *)this + 8));
  (*(void (**)(void, void, uint64_t))(v2 + 24))(*((void *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  v8 = *(void (**)(void))(v2 + 40);
  if (v8) {
    v8(*((void *)this + 3));
  }
  v9 = *(uint64_t (**)(SPUDataQueue *))(*(void *)this + 40);

  return v9(this);
}

uint64_t SPUDataQueue::enqueue_msg(uint64_t a1, unsigned int a2, unsigned int a3, void *__src, unsigned int a5)
{
  v56[31] = *MEMORY[0x263EF8340];
  if (a5 <= 0x10)
  {
    memcpy(__dst, __src, 16 * a5);
    (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
    uint64_t v54 = a1 + 8;
    if (*(void *)(a1 + 8))
    {
      uint64_t v10 = a5;
      uint64_t v11 = *(void *)(a1 + 16);
      unsigned int v12 = 0;
      if (a5)
      {
        v13 = v56;
        uint64_t v14 = a5;
        do
        {
          unint64_t v16 = *v13;
          v13 += 2;
          int v15 = v16;
          if (v16 > 0x400000) {
            goto LABEL_27;
          }
          v12 += v15;
        }
        while (--v14);
      }
      unsigned int v52 = a2;
      unint64_t v17 = *(unsigned __int8 *)(a1 + 41);
      (*(void (**)(void, void, uint64_t))(v11 + 16))(*(void *)(a1 + 24), 0, *(unsigned __int8 *)(a1 + 40)+ 7- (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40));
      unint64_t v18 = *(unsigned int *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 8);
      uint64_t v20 = *(unsigned __int8 *)(a1 + 40);
      v21 = (unsigned int *)(v20 + 7 - ((int)v20 + 7) % *(unsigned __int8 *)(a1 + 40) + v19);
      unsigned int v22 = *v21;
      uint64_t v53 = *(unsigned int *)((char *)v21 + v20);
      int v49 = *(_DWORD *)(v19 + 4);
      if (!*(unsigned char *)(a1 + 40)) {
        sub_24075E6D8(v54, 630, 0, 0, 0);
      }
      if (!*(unsigned char *)(a1 + 41)) {
        sub_24075E6D8(v54, 631, 0, 0, 0);
      }
      if (!v18) {
        sub_24075E6D8(v54, 632, 0, 0, 0);
      }
      unint64_t v23 = (v17 + v12 + 15) / v17 * v17;
      if (v22 >= v18) {
        sub_24075E6D8(v54, 633, v22, v18, 0);
      }
      uint64_t v51 = v11;
      unsigned int v24 = v53;
      if (v53 >= v18) {
        sub_24075E6D8(v54, 634, v53, v18, 0);
      }
      if ((int)v53 + (int)v23 > v18 && v22 != 0) {
        unsigned int v25 = 0;
      }
      else {
        unsigned int v25 = v53;
      }
      if (v53 < v22)
      {
        BOOL v26 = 0;
      }
      else
      {
        unsigned int v24 = v25;
        BOOL v26 = (int)v53 + (int)v23 > v18 && v22 != 0;
      }
      unsigned int v27 = v24 + v23;
      if (v24 + v23 >= v22 || v27 > v18)
      {
        if (v24 < v22) {
          goto LABEL_27;
        }
        if (v27 >= v18)
        {
          uint64_t v5 = 0;
          if (v27 != v18 || !v22) {
            goto LABEL_57;
          }
        }
      }
      BOOL v46 = v26;
      unsigned int v47 = v24 + v23;
      v28 = (unsigned int *)(*(void *)(a1 + 8)
                           + v24
                           - (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)
                           + *(unsigned __int8 *)(a1 + 40)
                           + 7
                           + 2 * *(unsigned __int8 *)(a1 + 40));
      unsigned int v45 = v49 & 0xFFFF0000;
      unsigned int v48 = a3;
      if ((v49 & 0xFFFF0000) == 0x70000)
      {
        unsigned int *v28 = 542134081;
        v28[1] = v12;
        v28[2] = v52;
        v28[3] = a3;
      }
      else
      {
        unsigned int *v28 = v12;
        v28[1] = v52;
        v28[2] = a3;
        v28[3] = 542134081;
      }
      uint64_t v50 = v23;
      int v29 = v23 - 16;
      v30 = v28 + 4;
      if (a5)
      {
        v31 = v56;
        v32 = (char *)(v28 + 4);
        do
        {
          size_t v33 = *v31;
          memcpy(v32, (const void *)*(v31 - 1), *v31);
          v32 += v33;
          v31 += 2;
          --v10;
        }
        while (v10);
      }
      if (v29 != v12) {
        bzero((char *)v30 + v12, v29 - v12);
      }
      (*(void (**)(void, void, uint64_t))(v51 + 24))(*(void *)(a1 + 24), v24+ (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40), v50);
      if (v46
        && v53
         - (*(unsigned __int8 *)(a1 + 41) + 15) % *(unsigned __int8 *)(a1 + 41)
         + (unint64_t)*(unsigned __int8 *)(a1 + 41)
         + 15 <= v18)
      {
        v34 = (unsigned int *)(*(void *)(a1 + 8)
                             + v53
                             - (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)
                             + *(unsigned __int8 *)(a1 + 40)
                             + 7
                             + 2 * *(unsigned __int8 *)(a1 + 40));
        if (v45 == 458752)
        {
          v34[1] = v12;
          v34[2] = v52;
          v34[3] = v48;
          unsigned int v12 = 542134081;
        }
        else
        {
          v34[2] = v48;
          v34[3] = 542134081;
          v34[1] = v52;
        }
        unsigned int *v34 = v12;
        (*(void (**)(void, void, uint64_t))(v51 + 24))(*(void *)(a1 + 24), v53+ (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41)+ 15- (*(unsigned __int8 *)(a1 + 41) + 15) % *(unsigned __int8 *)(a1 + 41));
      }
      if (v47 == v18) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = v47;
      }
      v36 = *(void (**)(void))(v51 + 40);
      if (v36) {
        v36(*(void *)(a1 + 24));
      }
      uint64_t v37 = *(unsigned __int8 *)(a1 + 40);
      uint64_t v38 = ((int)v37 + 7) % *(unsigned __int8 *)(a1 + 40);
      uint64_t v39 = v37 + 7 + v37;
      *(_DWORD *)(v39 + *(void *)(a1 + 8) - v38) = v35;
      (*(void (**)(void, void))(v51 + 24))(*(void *)(a1 + 24), (v39 - v38));
      v40 = *(void (**)(void))(v51 + 40);
      if (v40) {
        v40(*(void *)(a1 + 24));
      }
      (*(void (**)(void, void))(v51 + 16))(*(void *)(a1 + 24), (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40));
      uint64_t v41 = *(unsigned __int8 *)(a1 + 40) + 7;
      uint64_t v42 = *(void *)(a1 + 8) - v41 % *(unsigned __int8 *)(a1 + 40);
      uint64_t v43 = *(unsigned int *)(v42 + v41);
      if (v43 >= v18) {
        sub_24075E6D8(v54, 753, *(_DWORD *)(v42 + v41), v18, 0);
      }
      if (v35 >= v18) {
        sub_24075E6D8(v54, 754, v35, v18, 0);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(v51 + 32))(*(void *)(a1 + 24), v53, v35, v43, v52, v48, 542134081);
      uint64_t v5 = 1;
      goto LABEL_57;
    }
LABEL_27:
    uint64_t v5 = 0;
LABEL_57:
    (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
    return v5;
  }
  return 0;
}

uint64_t SPUDataQueue::dequeue_all(SPUDataQueue *this, void (*a2)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int), void *a3)
{
  v6 = (char *)this + 8;
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  while (sub_24075E79C((uint64_t)v6, &v14, &v13, (_DWORD *)&v12 + 1, &v12, &v11))
  {
    a2(a3, HIDWORD(v12), v14, v13, v12);
    uint64_t v7 = *((void *)this + 2);
    *(_DWORD *)(*((void *)this + 1)
              - (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)
              + *((unsigned __int8 *)this + 40)
              + 7) = *((_DWORD *)this + 9);
    (*(void (**)(void))(v7 + 24))(*((void *)this + 3));
    v8 = *(void (**)(void))(v7 + 40);
    if (v8) {
      v8(*((void *)this + 3));
    }
  }
  v9 = *(uint64_t (**)(SPUDataQueue *))(*(void *)this + 40);

  return v9(this);
}

uint64_t SPUDataQueue::dequeue_all_read_only(SPUDataQueue *this, void (*a2)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int), void *a3)
{
  v6 = (char *)this + 8;
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  for (uint64_t i = 0; sub_24075E79C((uint64_t)v6, &v12, &v11, (_DWORD *)&i + 1, &i, &v9); a2(a3, HIDWORD(i), v12, v11, i))
    ;
  uint64_t v7 = *(uint64_t (**)(SPUDataQueue *))(*(void *)this + 40);

  return v7(this);
}

BOOL SPUDataQueue::update_read_pointer(SPUDataQueue *this, unsigned int a2)
{
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  uint64_t v4 = (unsigned int *)*((void *)this + 1);
  unsigned int v5 = *v4;
  if (*v4 > a2)
  {
    uint64_t v6 = *((void *)this + 2);
    *(unsigned int *)((char *)v4
                    + *((unsigned __int8 *)this + 40)
                    - (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)
                    + 7) = a2;
    (*(void (**)(void))(v6 + 24))(*((void *)this + 3));
    uint64_t v7 = *(void (**)(void))(v6 + 40);
    if (v7) {
      v7(*((void *)this + 3));
    }
  }
  (*(void (**)(SPUDataQueue *))(*(void *)this + 40))(this);
  return v5 > a2;
}

BOOL SPUDataQueue::is_empty(SPUDataQueue *this)
{
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  (*(void (**)(void, void, uint64_t))(*((void *)this + 2) + 16))(*((void *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  uint64_t v2 = *((unsigned __int8 *)this + 40);
  v3 = (_DWORD *)(v2 + 7 - ((int)v2 + 7) % *((unsigned __int8 *)this + 40) + *((void *)this + 1));
  BOOL v4 = *v3 == *(_DWORD *)((char *)v3 + v2);
  (*(void (**)(SPUDataQueue *))(*(void *)this + 40))(this);
  return v4;
}

uint64_t SPUDataQueue::get_extended_info(SPUDataQueue *this, int a2, unint64_t *a3)
{
  (*(void (**)(SPUDataQueue *))(*(void *)this + 32))(this);
  uint64_t v6 = *((void *)this + 2);
  switch(a2)
  {
    case 0:
      (*(void (**)(void, void))(v6 + 16))(*((void *)this + 3), (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40));
      uint64_t v7 = *((unsigned __int8 *)this + 40) + 7;
      uint64_t v8 = *((void *)this + 1) - v7 % *((unsigned __int8 *)this + 40);
      goto LABEL_5;
    case 1:
      (*(void (**)(void, void))(v6 + 16))(*((void *)this + 3), *((unsigned __int8 *)this + 40)+ (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40));
      uint64_t v7 = *((unsigned __int8 *)this + 40) + 7;
      uint64_t v8 = *((void *)this + 1) - v7 % *((unsigned __int8 *)this + 40) + *((unsigned __int8 *)this + 40);
LABEL_5:
      unint64_t v10 = *(unsigned int *)(v8 + v7);
      goto LABEL_9;
    case 2:
      (*(void (**)(void, void, uint64_t))(v6 + 16))(*((void *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
      unint64_t v10 = *((unsigned int *)this + 8);
      goto LABEL_9;
    case 3:
      unint64_t v10 = *((unsigned __int8 *)this + 40);
      goto LABEL_9;
    case 4:
      unint64_t v10 = *((unsigned int *)this + 9);
LABEL_9:
      *a3 = v10;
      uint64_t v9 = 1;
      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  (*(void (**)(SPUDataQueue *))(*(void *)this + 40))(this);
  return v9;
}

uint64_t sub_24075E6B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

uint64_t sub_24075E6D8(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v10[0] = a3;
  v10[1] = a4;
  v10[2] = a5;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(uint64_t (**)(void, const char *, uint64_t, uint64_t, _DWORD *))(v5 + 56);
  if (v6) {
    return v6(*(void *)(a1 + 16), "iop_ringbuffer.h", a2, 3, v10);
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(v5 + 48);
  uint64_t v9 = *(void *)(a1 + 16);

  return v8(v9, "iop_ringbuffer.h", a2);
}

BOOL sub_24075E79C(uint64_t a1, void *a2, void *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v12 = *(void *)(a1 + 8);
  (*(void (**)(void, void, uint64_t))(v12 + 16))(*(void *)(a1 + 16), 0, *(unsigned __int8 *)(a1 + 32)+ 7- (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32));
  uint64_t v13 = *(void *)a1;
  int v14 = *(_DWORD *)(*(void *)a1 + 4);
  uint64_t v35 = a2;
  if (!v14)
  {
    sub_24075E6D8(a1, 805, 0, 0, 0);
    uint64_t v13 = *(void *)a1;
    int v14 = *(_DWORD *)(*(void *)a1 + 4);
  }
  unint64_t v15 = *(unsigned int *)(a1 + 24);
  unsigned __int8 v16 = *(unsigned char *)(a1 + 32);
  unsigned int v17 = *(_DWORD *)(v13 - (v16 + 7) % v16 + v16 + v16 + 7);
  unint64_t v18 = *(void (**)(void))(v12 + 40);
  if (v18)
  {
    v18(*(void *)(a1 + 16));
    unsigned __int8 v16 = *(unsigned char *)(a1 + 32);
  }
  uint64_t v19 = *(unsigned int *)(a1 + 28);
  if (!v16) {
    sub_24075E6D8(a1, 820, 0, 0, 0);
  }
  if (*(unsigned char *)(a1 + 33))
  {
    if (v15) {
      goto LABEL_9;
    }
  }
  else
  {
    sub_24075E6D8(a1, 821, 0, 0, 0);
    if (v15) {
      goto LABEL_9;
    }
  }
  sub_24075E6D8(a1, 822, 0, 0, 0);
LABEL_9:
  if (v19 >= v15) {
    sub_24075E6D8(a1, 823, v19, v15, 0);
  }
  if (v17 >= v15) {
    sub_24075E6D8(a1, 824, v17, v15, 0);
  }
  if (v19 != v17)
  {
    size_t v33 = a6;
    v34 = a3;
    v32 = a5;
    if (v19 + 16 <= v15) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    (*(void (**)(void, void, uint64_t))(v12 + 16))(*(void *)(a1 + 16), v20+ (*(unsigned __int8 *)(a1 + 32) + 7) / *(unsigned __int8 *)(a1 + 32) * *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33)+ 15- (*(unsigned __int8 *)(a1 + 33) + 15) % *(unsigned __int8 *)(a1 + 33));
    uint64_t v21 = *(void *)a1
        + v20
        - (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)
        + *(unsigned __int8 *)(a1 + 32)
        + 7
        + 2 * *(unsigned __int8 *)(a1 + 32);
    unsigned int v22 = v14 & 0xFFFF0000;
    BOOL v23 = (v14 & 0xFFFF0000) == 458752;
    uint64_t v24 = *(unsigned int *)(v21 + 4 * ((v14 & 0xFFFF0000) == 458752));
    if (v24 > v15) {
      sub_24075E6D8(a1, 852, *(_DWORD *)(v21 + 4 * v23), v15, 0);
    }
    unint64_t v25 = (v24 + (unint64_t)*(unsigned __int8 *)(a1 + 33) + 15)
        / *(unsigned __int8 *)(a1 + 33)
        * *(unsigned __int8 *)(a1 + 33);
    if (v24)
    {
      if (v25)
      {
LABEL_22:
        if (v15 < v25) {
          sub_24075E6D8(a1, 858, v25, v15, 0);
        }
        v31 = a4;
        if ((int)v20 + (int)v25 > v15)
        {
          if (v17 >= v20) {
            sub_24075E6D8(a1, 865, v17, v20, 0);
          }
          LODWORD(v20) = 0;
        }
        unsigned int v26 = v20 + v25;
        if (v20 < v17 && v26 > v17) {
          sub_24075E6D8(a1, 869, v20, v17, v25);
        }
        (*(void (**)(void, void, void))(v12 + 16))(*(void *)(a1 + 16), v20+ (*(unsigned __int8 *)(a1 + 32) + 7)/ *(unsigned __int8 *)(a1 + 32)* *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32), v25);
        unsigned int v27 = (_DWORD *)(*(void *)a1
                       + v20
                       - (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)
                       + *(unsigned __int8 *)(a1 + 32)
                       + 7
                       + 2 * *(unsigned __int8 *)(a1 + 32));
        *uint64_t v35 = v27 + 4;
        void *v34 = v24;
        if (v22 == 458752)
        {
          _DWORD *v31 = v27[2];
          v28 = v27 + 3;
        }
        else
        {
          _DWORD *v31 = v27[1];
          v28 = v27 + 2;
          v27 += 3;
        }
        _DWORD *v32 = *v28;
        *size_t v33 = *v27;
        if (v26 == v15) {
          int v29 = 0;
        }
        else {
          int v29 = v20 + v25;
        }
        *(_DWORD *)(a1 + 28) = v29;
        return v19 != v17;
      }
    }
    else
    {
      sub_24075E6D8(a1, 856, 0, 0, 0);
      if (v25) {
        goto LABEL_22;
      }
    }
    sub_24075E6D8(a1, 857, 0, 0, 0);
    goto LABEL_22;
  }
  return v19 != v17;
}

uint64_t hexdump(uint64_t result, unint64_t a2)
{
  int v17 = result;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2)
  {
    unint64_t v2 = a2;
    uint64_t v3 = MEMORY[0x263EF8318];
    uint64_t v4 = result;
    do
    {
      if (v2 >= 0x10) {
        uint64_t v5 = 16;
      }
      else {
        uint64_t v5 = v2;
      }
      unsigned int v6 = v5 - 1;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      *(_OWORD *)__str = 0u;
      long long v20 = 0u;
      uint64_t v7 = 0;
      uint64_t v8 = &__str[snprintf(__str, 0x100uLL, "%08x: ", v4 - v17)];
      do
      {
        v8 += snprintf(v8, 0x100uLL, "%02x ", *(unsigned __int8 *)(v4 + v7));
        if (v7 == 7) {
          *(_WORD *)v8++ = 32;
        }
        ++v7;
      }
      while (v5 != v7);
      if (v5 <= 0xF)
      {
        do
        {
          *(_DWORD *)uint64_t v8 = 2105376;
          if (v6 == 6)
          {
            *(_WORD *)(v8 + 3) = 32;
            v8 += 4;
          }
          else
          {
            v8 += 3;
          }
          ++v6;
        }
        while (v6 < 0xF);
      }
      uint64_t v9 = 0;
      *(_DWORD *)uint64_t v8 = 2128928;
      unint64_t v10 = v8 + 3;
      do
      {
        unsigned int v11 = *(char *)(v4 + v9);
        if ((v11 & 0x80000000) != 0) {
          int v12 = __maskrune(*(char *)(v4 + v9), 0x40000uLL);
        }
        else {
          int v12 = *(_DWORD *)(v3 + 4 * v11 + 60) & 0x40000;
        }
        if (v12) {
          char v13 = v11;
        }
        else {
          char v13 = 46;
        }
        *unint64_t v10 = v13;
        v10[1] = 0;
        if (v9 == 7)
        {
          *(_WORD *)(v10 + 1) = 32;
          v10 += 2;
        }
        else
        {
          ++v10;
        }
        ++v9;
      }
      while (v5 != v9);
      size_t v14 = strlen(__str);
      unint64_t v15 = sub_240762038(MEMORY[0x263F8C100], (uint64_t)__str, v14);
      std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
      unsigned __int8 v16 = std::locale::use_facet(&v18, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
      std::locale::~locale(&v18);
      std::ostream::put();
      result = std::ostream::flush();
      if (v2 <= 0xF) {
        break;
      }
      v4 += v9;
      v2 -= 16;
    }
    while (v2);
  }
  return result;
}

void sub_24075EE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12)
{
}

uint64_t sub_24075EE30(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_24075EE48()
{
  return 0;
}

uint64_t sub_24075EE54(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 24);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 24) = 0;
  }
  *(_DWORD *)(a1 + 20) = 0;
  return 0;
}

uint64_t sub_24075EE9C(AppleSPUHIDDeviceClass *a1, __CFRunLoop *a2, const __CFString *a3)
{
  return 0;
}

uint64_t sub_24075EEB8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a3;
  BOOL inputStruct = a3 != 0;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 24), 1u, input, 1u, &inputStruct, 1uLL, 0, 0, 0, 0);
}

uint64_t sub_24075EF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 88) = a2;
  *(void *)(a1 + 96) = a3;
  return 0;
}

uint64_t sub_24075EF58()
{
  return 0;
}

void AppleSPUHIDDeviceClass::alloc(AppleSPUHIDDeviceClass *this, const __CFAllocator *a2)
{
  uint64_t v3 = (AppleSPUHIDDeviceClass *)CFAllocatorAllocate(this, 160, 0);

  AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(v3, this);
}

void AppleSPUHIDDeviceClass::operator delete(CFAllocatorRef *ptr)
{
}

void sub_24075EFCC(void *a1)
{
}

void AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(AppleSPUHIDDeviceClass *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUHIDDeviceClass::vtbl;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 1;
  *((_DWORD *)this + 6) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInAddInstanceForFactory(v3);
  *((void *)this + 19) = os_log_create("AOP", "AppleSPUHIDDeviceClass");
}

void AppleSPUHIDDeviceClass::~AppleSPUHIDDeviceClass(void **this)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInRemoveInstanceForFactory(v2);
  os_release(this[19]);
}

uint64_t AppleSPUHIDDeviceClass::QueryInterface(AppleSPUHIDDeviceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 1u, 0x64u, 0x69u, 0xD8u, 0x77u, 0x3Bu, 0x46u, 0xACu, 0x90u, 0x9Eu, 0xF9u, 0xCu, 0x4Au, 0x6Eu, 0x75u, 0x77u);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v8))|| (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    uint64_t v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t AppleSPUHIDDeviceClass::AddRef(AppleSPUHIDDeviceClass *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUHIDDeviceClass::Release(AppleSPUHIDDeviceClass *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDDeviceClass::~AppleSPUHIDDeviceClass((void **)this);
    AppleSPUHIDDeviceClass::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Probe(AppleSPUHIDDeviceClass *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::Start(AppleSPUHIDDeviceClass *this, const __CFDictionary *a2, io_service_t service)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 5) = service;
  uint64_t v4 = IOServiceOpen(service, *MEMORY[0x263EF8960], 0x61736864u, (io_connect_t *)this + 6);
  if (v4)
  {
    CFAllocatorRef v6 = *((void *)this + 19);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4)) {
        CFUUIDRef v7 = mach_error_string(v4);
      }
      else {
        CFUUIDRef v7 = "";
      }
      int v8 = 136316418;
      CFUUIDRef v9 = "";
      __int16 v10 = 2080;
      unsigned int v11 = "result == 0 ";
      __int16 v12 = 2080;
      char v13 = v7;
      __int16 v14 = 2080;
      unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v16 = 1024;
      int v17 = 483;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_24075C000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v8, 0x36u);
    }
  }
  return v4;
}

uint64_t AppleSPUHIDDeviceClass::Stop(AppleSPUHIDDeviceClass *this)
{
  io_connect_t v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 6) = 0;
  }
  *((_DWORD *)this + 5) = 0;
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::Open(AppleSPUHIDDeviceClass *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = IOConnectCallMethod(*((_DWORD *)this + 6), 4u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2)) {
        CFUUIDRef v5 = mach_error_string(v2);
      }
      else {
        CFUUIDRef v5 = "";
      }
      *(_DWORD *)buf = 136316418;
      CFUUIDRef v7 = "";
      __int16 v8 = 2080;
      CFUUIDRef v9 = "result == 0 ";
      __int16 v10 = 2080;
      unsigned int v11 = v5;
      __int16 v12 = 2080;
      char v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v14 = 1024;
      int v15 = 510;
      __int16 v16 = 1024;
      int v17 = v2;
      _os_log_impl(&dword_24075C000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Close(AppleSPUHIDDeviceClass *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = IOConnectCallMethod(*((_DWORD *)this + 6), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2)) {
        CFUUIDRef v5 = mach_error_string(v2);
      }
      else {
        CFUUIDRef v5 = "";
      }
      *(_DWORD *)buf = 136316418;
      CFUUIDRef v7 = "";
      __int16 v8 = 2080;
      CFUUIDRef v9 = "result == 0 ";
      __int16 v10 = 2080;
      unsigned int v11 = v5;
      __int16 v12 = 2080;
      char v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v14 = 1024;
      int v15 = 523;
      __int16 v16 = 1024;
      int v17 = v2;
      _os_log_impl(&dword_24075C000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Reset(AppleSPUHIDDeviceClass *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 0, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2)) {
        CFUUIDRef v5 = mach_error_string(v2);
      }
      else {
        CFUUIDRef v5 = "";
      }
      int v6 = 136316418;
      CFUUIDRef v7 = "";
      __int16 v8 = 2080;
      CFUUIDRef v9 = "result == 0 ";
      __int16 v10 = 2080;
      unsigned int v11 = v5;
      __int16 v12 = 2080;
      char v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v14 = 1024;
      int v15 = 536;
      __int16 v16 = 1024;
      int v17 = v2;
      _os_log_impl(&dword_24075C000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v6, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::SetLVBoost(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  uint64_t v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 2u, input, 1u, 0, 0);
  if (v3)
  {
    CFUUIDRef v5 = *((void *)this + 19);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v3)) {
        int v6 = mach_error_string(v3);
      }
      else {
        int v6 = "";
      }
      int v7 = 136316418;
      __int16 v8 = "";
      __int16 v9 = 2080;
      __int16 v10 = "result == 0 ";
      __int16 v11 = 2080;
      __int16 v12 = v6;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v15 = 1024;
      int v16 = 551;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_24075C000, v5, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v7, 0x36u);
    }
  }
  return v3;
}

uint64_t AppleSPUHIDDeviceClass::SetGrapeCS(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  uint64_t v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 3u, input, 1u, 0, 0);
  if (v3)
  {
    CFUUIDRef v5 = *((void *)this + 19);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v3)) {
        int v6 = mach_error_string(v3);
      }
      else {
        int v6 = "";
      }
      int v7 = 136316418;
      __int16 v8 = "";
      __int16 v9 = 2080;
      __int16 v10 = "result == 0 ";
      __int16 v11 = 2080;
      __int16 v12 = v6;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v15 = 1024;
      int v16 = 566;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_24075C000, v5, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v7, 0x36u);
    }
  }
  return v3;
}

uint64_t AppleSPUHIDDeviceClass::SetAggregateDictionaryCallback(AppleSPUHIDDeviceClass *this, void (*a2)(void *, void *, unint64_t), void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v6 = MEMORY[0x2455F7470](*((unsigned int *)this + 6), 1, *((unsigned int *)this + 26), 0);
  if (v6)
  {
    uint64_t v9 = v6;
    __int16 v11 = *((void *)this + 19);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      return v9;
    }
    if (mach_error_string(v9)) {
      __int16 v12 = mach_error_string(v9);
    }
    else {
      __int16 v12 = "";
    }
    *(_DWORD *)buf = 136316418;
    __int16 v17 = "";
    __int16 v18 = 2080;
    int v19 = "result == 0 ";
    __int16 v20 = 2080;
    long long v21 = v12;
    __int16 v22 = 2080;
    long long v23 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v24 = 1024;
    int v25 = 583;
    __int16 v26 = 1024;
    int v27 = v9;
LABEL_17:
    _os_log_impl(&dword_24075C000, v11, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return v9;
  }
  uint64_t v7 = MEMORY[0x2455F7460](*((unsigned int *)this + 6), 1, *MEMORY[0x263EF8960], &v15, &v14, 1);
  if (v7)
  {
    uint64_t v9 = v7;
    __int16 v11 = *((void *)this + 19);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      return v9;
    }
    if (mach_error_string(v9)) {
      __int16 v13 = mach_error_string(v9);
    }
    else {
      __int16 v13 = "";
    }
    *(_DWORD *)buf = 136316418;
    __int16 v17 = "";
    __int16 v18 = 2080;
    int v19 = "result == 0 ";
    __int16 v20 = 2080;
    long long v21 = v13;
    __int16 v22 = 2080;
    long long v23 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v24 = 1024;
    int v25 = 587;
    __int16 v26 = 1024;
    int v27 = v9;
    goto LABEL_17;
  }
  uint64_t v8 = v14;
  *((void *)this + 14) = v15;
  *((void *)this + 15) = v8;
  if (!*((void *)this + 18)) {
    sub_24076253C();
  }
  uint64_t v9 = 0;
  *((void *)this + 16) = a2;
  *((void *)this + 17) = a3;
  return v9;
}

uint64_t AppleSPUHIDDeviceClass::ScheduleWithDispatchQueue(AppleSPUHIDDeviceClass *this, dispatch_queue_t queue)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mach_port_t NotificationPort = *((_DWORD *)this + 26);
  if (!NotificationPort)
  {
    mach_port_t NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 26) = NotificationPort;
  }
  CFUUIDRef v5 = dispatch_source_create(MEMORY[0x263EF83C8], NotificationPort, 0, queue);
  *((void *)this + 18) = v5;
  if (v5)
  {
    dispatch_set_context(v5, this);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)this + 18), (dispatch_function_t)AppleSPUHIDDeviceClass::queueSignal);
    dispatch_resume(*((dispatch_object_t *)this + 18));
    return 0;
  }
  else
  {
    uint64_t v6 = 3758097086;
    uint64_t v8 = *((void *)this + 19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      __int16 v10 = "";
      __int16 v11 = 2080;
      __int16 v12 = "_source";
      __int16 v13 = 2080;
      uint64_t v14 = "";
      __int16 v15 = 2080;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v17 = 1024;
      int v18 = 616;
      __int16 v19 = 1024;
      int v20 = 0;
      _os_log_impl(&dword_24075C000, v8, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v9, 0x36u);
    }
  }
  return v6;
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, void *a2)
{
}

uint64_t AppleSPUHIDDeviceClass::UnscheduleFromDispatchQueue(AppleSPUHIDDeviceClass *this, dispatch_queue_s *a2)
{
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::SendCommand(AppleSPUHIDDeviceClass *this, unsigned int a2, const void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a6)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 6), 6u, input, 1u, inputStruct, inputStructCnt, 0, 0, outputStruct, a6);
  if (v7)
  {
    int v9 = *((void *)this + 19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v7)) {
        __int16 v10 = mach_error_string(v7);
      }
      else {
        __int16 v10 = "";
      }
      *(_DWORD *)buf = 136316418;
      __int16 v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "result == 0 ";
      __int16 v15 = 2080;
      int v16 = v10;
      __int16 v17 = 2080;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v19 = 1024;
      int v20 = 655;
      __int16 v21 = 1024;
      int v22 = v7;
      _os_log_impl(&dword_24075C000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v7;
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2) {
    IODataQueueWaitForAvailableData(*((IODataQueueMemory **)this + 14), *((_DWORD *)this + 26));
  }
  uint64_t v3 = (IODataQueueMemory *)*((void *)this + 14);
  if (v3)
  {
    uint32_t dataSize = 7;
    while (IODataQueueDataAvailable(v3))
    {
      IOReturn v4 = IODataQueueDequeue(*((IODataQueueMemory **)this + 14), data, &dataSize);
      if (v4)
      {
        mach_error_t v8 = v4;
        int v9 = *((void *)this + 19);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if (mach_error_string(v8)) {
            __int16 v10 = mach_error_string(v8);
          }
          else {
            __int16 v10 = "";
          }
          uint32_t v13 = 136316418;
          uint64_t v14 = "";
          __int16 v15 = 2080;
          int v16 = "result == 0 ";
          __int16 v17 = 2080;
          int v18 = v10;
          __int16 v19 = 2080;
          int v20 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
          __int16 v21 = 1024;
          int v22 = 693;
          __int16 v23 = 1024;
          mach_error_t v24 = v8;
          _os_log_impl(&dword_24075C000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v13, 0x36u);
        }
        return;
      }
      (*((void (**)(void, unsigned char *, uint64_t))this + 16))(*((void *)this + 17), data, 1);
      uint64_t v3 = (IODataQueueMemory *)*((void *)this + 14);
    }
  }
  CFUUIDRef v5 = (IODataQueueMemory *)*((void *)this + 9);
  if (v5 && IODataQueueDataAvailable(v5))
  {
    do
    {
      uint32_t v13 = *((_DWORD *)this + 12);
      IOReturn v6 = IODataQueueDequeue(*((IODataQueueMemory **)this + 9), *((void **)this + 7), &v13);
      if (v6)
      {
        if (v6 == -536870181) {
          IODataQueueDequeue(*((IODataQueueMemory **)this + 9), 0, 0);
        }
      }
      else
      {
        uint64_t v7 = (void (*)(void, void))*((void *)this + 11);
        if (v7) {
          v7(*((void *)this + 7), v13);
        }
      }
    }
    while (IODataQueueDataAvailable(*((IODataQueueMemory **)this + 9)));
  }
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, __CFMachPort *a2, void *a3, AppleSPUHIDDeviceClass *a4, void *a5)
{
}

uint64_t AppleSPUHIDDeviceClass::ScheduleWithRunLoop(AppleSPUHIDDeviceClass *this, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  Boolean shouldFreeInfo = 0;
  uint64_t NotificationPort = *((unsigned int *)this + 26);
  if (!NotificationPort)
  {
    uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 26) = NotificationPort;
    if (!NotificationPort)
    {
      uint64_t v14 = 3758097086;
      int v16 = *((void *)this + 19);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        return v14;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = "";
      __int16 v26 = 2080;
      int v27 = "_port";
      __int16 v28 = 2080;
      long long v29 = "";
      __int16 v30 = 2080;
      long long v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v32 = 1024;
      int v33 = 739;
      __int16 v34 = 1024;
      int v35 = 0;
      goto LABEL_26;
    }
  }
  uint64_t v7 = MEMORY[0x2455F7470](*((unsigned int *)this + 6), 0, NotificationPort, 0);
  if (v7)
  {
    uint64_t v14 = v7;
    int v16 = *((void *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    if (mach_error_string(v14)) {
      __int16 v17 = mach_error_string(v14);
    }
    else {
      __int16 v17 = "";
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = "";
    __int16 v26 = 2080;
    int v27 = "result == 0 ";
    __int16 v28 = 2080;
    long long v29 = v17;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v32 = 1024;
    int v33 = 743;
    __int16 v34 = 1024;
    int v35 = v14;
LABEL_26:
    _os_log_impl(&dword_24075C000, v16, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return v14;
  }
  uint64_t v8 = MEMORY[0x2455F7460](*((unsigned int *)this + 6), 0, *MEMORY[0x263EF8960], &v23, &v22, 1);
  if (v8)
  {
    uint64_t v14 = v8;
    int v16 = *((void *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    if (mach_error_string(v14)) {
      int v18 = mach_error_string(v14);
    }
    else {
      int v18 = "";
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = "";
    __int16 v26 = 2080;
    int v27 = "result == 0 ";
    __int16 v28 = 2080;
    long long v29 = v18;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v32 = 1024;
    int v33 = 747;
    __int16 v34 = 1024;
    int v35 = v14;
    goto LABEL_26;
  }
  *((_DWORD *)this + 12) = 4096;
  int v9 = malloc_type_malloc(0x1000uLL, 0x1804928DuLL);
  *((void *)this + 7) = v9;
  if (!v9)
  {
    __int16 v19 = *((void *)this + 19);
    uint64_t v14 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = "";
    __int16 v26 = 2080;
    int v27 = "_spiDataContext.buffer";
    __int16 v28 = 2080;
    long long v29 = "";
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v32 = 1024;
    int v33 = 752;
    __int16 v34 = 1024;
    int v35 = 0;
    _os_log_impl(&dword_24075C000, v19, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return 0;
  }
  *((_DWORD *)this + 16) = *((_DWORD *)this + 6);
  uint64_t v10 = v22;
  *((void *)this + 9) = v23;
  *((void *)this + 10) = v10;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = this;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  __int16 v12 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], *((_DWORD *)this + 26), (CFMachPortCallBack)AppleSPUHIDDeviceClass::queueSignal, &context, &shouldFreeInfo);
  *((void *)this + 5) = v12;
  if (!v12)
  {
    uint64_t v14 = 3758097086;
    int v16 = *((void *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = "";
    __int16 v26 = 2080;
    int v27 = "_spiDataContext.port";
    __int16 v28 = 2080;
    long long v29 = "";
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v32 = 1024;
    int v33 = 763;
    __int16 v34 = 1024;
    int v35 = 0;
    goto LABEL_26;
  }
  RunLoopSource = CFMachPortCreateRunLoopSource(v11, v12, 0);
  *((void *)this + 4) = RunLoopSource;
  CFRunLoopAddSource(a2, RunLoopSource, a3);
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::UnscheduleWithRunLoop(AppleSPUHIDDeviceClass *this, CFRunLoopRef rl, const __CFString *a3)
{
  IOReturn v4 = (__CFRunLoopSource *)*((void *)this + 4);
  if (v4)
  {
    CFRunLoopRemoveSource(rl, v4, a3);
    CFRelease(*((CFTypeRef *)this + 4));
  }
  CFUUIDRef v5 = (__CFMachPort *)*((void *)this + 5);
  if (v5)
  {
    CFMachPortInvalidate(v5);
    CFRelease(*((CFTypeRef *)this + 5));
  }
  IOReturn v6 = (void *)*((void *)this + 7);
  if (v6) {
    free(v6);
  }
  mach_port_name_t v7 = *((_DWORD *)this + 26);
  uint64_t v8 = (unsigned int *)MEMORY[0x263EF8960];
  if (v7) {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v7, 1u, -1);
  }
  MEMORY[0x2455F7480](*((unsigned int *)this + 6), 0, *v8, *((void *)this + 9));
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::SetRawSPIMode(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  BOOL inputStruct = a2 != 0;
  return IOConnectCallMethod(*((_DWORD *)this + 6), 1u, input, 1u, &inputStruct, 1uLL, 0, 0, 0, 0);
}

uint64_t AppleSPUHIDDeviceClass::SetRawSPICallback(AppleSPUHIDDeviceClass *this, void (*a2)(void *, unsigned int), void *a3)
{
  *((void *)this + 1AppleSPUHIDDeviceClass::queueSignal(this, 1) = a2;
  *((void *)this + 12) = a3;
  return 0;
}

uint64_t sub_2407606F0(uint64_t a1, CFUUIDBytes a2, void **a3)
{
  return AppleSPUHIDDriverClass::QueryInterface(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3);
}

uint64_t sub_2407606F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t result = (*(_DWORD *)(v1 + 40) + 1);
  *(_DWORD *)(v1 + 40) = result;
  return result;
}

uint64_t sub_24076070C(uint64_t a1)
{
  return AppleSPUHIDDriverClass::Release(*(AppleSPUHIDDriverClass **)(a1 + 8));
}

uint64_t sub_240760714()
{
  return 0;
}

uint64_t sub_24076071C(uint64_t a1, const __CFDictionary *a2, io_service_t a3)
{
  return AppleSPUHIDDriverClass::Start(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3);
}

uint64_t sub_240760724(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  io_connect_t v2 = *(_DWORD *)(v1 + 48);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(v1 + 48) = 0;
  }
  *(_DWORD *)(v1 + 44) = 0;
  return 0;
}

uint64_t sub_24076075C(uint64_t a1, char a2)
{
  return AppleSPUHIDDriverClass::Open(*(AppleSPUHIDDriverClass **)(a1 + 8), a2);
}

uint64_t sub_240760764(uint64_t a1)
{
  return AppleSPUHIDDriverClass::Close(*(AppleSPUHIDDriverClass **)(a1 + 8));
}

uint64_t sub_24076076C(uint64_t a1, void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a5)
{
  return AppleSPUHIDDriverClass::SendCommand(*(AppleSPUHIDDriverClass **)(a1 + 8), 0x20u, inputStruct, inputStructCnt, outputStruct, a5);
}

uint64_t sub_240760788(uint64_t a1, const __CFArray **a2)
{
  return AppleSPUHIDDriverClass::CopyEventMultiple(*(AppleSPUHIDDriverClass **)(a1 + 8), a2);
}

uint64_t sub_240760790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AppleSPUHIDDriverClass::ApplyToHistorical(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_240760798(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned int *a4)
{
  return AppleSPUHIDDriverClass::AopTimeToCalendar(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3, a4);
}

uint64_t sub_2407607A0(uint64_t a1, unsigned int a2, const void *a3, size_t a4, void *a5, unint64_t *a6)
{
  return AppleSPUHIDDriverClass::SendCommand(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3, a4, a5, a6);
}

void AppleSPUHIDDriverClass::alloc(AppleSPUHIDDriverClass *this, const __CFAllocator *a2)
{
  uint64_t v3 = (AppleSPUHIDDriverClass *)CFAllocatorAllocate(this, 80, 0);

  AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(v3, this);
}

void AppleSPUHIDDriverClass::operator delete(CFAllocatorRef *ptr)
{
}

void AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(AppleSPUHIDDriverClass *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUHIDDriverClass::vtbl_v1;
  *((void *)this + AppleSPUHIDDeviceClass::queueSignal(this, 1) = this;
  *((void *)this + 2) = &AppleSPUHIDDriverClass::vtbl_v2;
  *((void *)this + 3) = this;
  *((void *)this + 4) = a2;
  *((void *)this + 5) = 1;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 7) = 0;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInAddInstanceForFactory(v3);
  *((void *)this + 7) = os_log_create("AOP", "AppleSPUHIDDeviceClass");
}

void AppleSPUHIDDriverClass::~AppleSPUHIDDriverClass(void **this)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInRemoveInstanceForFactory(v2);
  os_release(this[7]);
}

uint64_t AppleSPUHIDDriverClass::QueryInterface(AppleSPUHIDDriverClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Eu, 0xBEu, 0xBAu, 0x6Eu, 9u, 0x1Eu, 0x45u, 0x2Eu, 0x82u, 0xEAu, 0x29u, 0x79u, 0x81u, 0x6Fu, 0xB1u, 0xB5u);
  if (CFEqual(v5, v7))
  {
    uint64_t v8 = 0;
    ++*((_DWORD *)this + 10);
  }
  else
  {
    CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0x59u, 0x79u, 0x99u, 0x3Cu, 0x85u, 0xF5u, 0x4Du, 0x59u, 0x85u, 0x93u, 0xFFu, 0x92u, 0x15u, 0xDAu, 0x47u, 0xADu);
    if (CFEqual(v5, v9)
      || (CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v10))|| (v11 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u),
          CFEqual(v5, v11)))
    {
      uint64_t v8 = 0;
      ++*((_DWORD *)this + 10);
      this = (AppleSPUHIDDriverClass *)((char *)this + 16);
    }
    else
    {
      this = 0;
      uint64_t v8 = 2147483652;
    }
  }
  *a3 = this;
  CFRelease(v5);
  return v8;
}

uint64_t AppleSPUHIDDriverClass::AddRef(AppleSPUHIDDriverClass *this)
{
  uint64_t v1 = (*((_DWORD *)this + 10) + 1);
  *((_DWORD *)this + 10) = v1;
  return v1;
}

uint64_t AppleSPUHIDDriverClass::Release(AppleSPUHIDDriverClass *this)
{
  int v1 = *((_DWORD *)this + 10);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 10) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDDriverClass::~AppleSPUHIDDriverClass((void **)this);
    AppleSPUHIDDriverClass::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDDriverClass::Probe(AppleSPUHIDDriverClass *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t AppleSPUHIDDriverClass::Start(AppleSPUHIDDriverClass *this, const __CFDictionary *a2, io_service_t service)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 1AppleSPUHIDDeviceClass::queueSignal(this, 1) = service;
  uint64_t v4 = IOServiceOpen(service, *MEMORY[0x263EF8960], 0x61736864u, (io_connect_t *)this + 12);
  if (v4)
  {
    CFAllocatorRef v6 = *((void *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4)) {
        CFUUIDRef v7 = mach_error_string(v4);
      }
      else {
        CFUUIDRef v7 = "";
      }
      int v8 = 136316418;
      CFUUIDRef v9 = "";
      __int16 v10 = 2080;
      CFUUIDRef v11 = "result == 0 ";
      __int16 v12 = 2080;
      uint32_t v13 = v7;
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v16 = 1024;
      int v17 = 1138;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_24075C000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v8, 0x36u);
    }
  }
  return v4;
}

uint64_t AppleSPUHIDDriverClass::Stop(AppleSPUHIDDriverClass *this)
{
  io_connect_t v2 = *((_DWORD *)this + 12);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 12) = 0;
  }
  *((_DWORD *)this + 1AppleSPUHIDDeviceClass::queueSignal(this, 1) = 0;
  return 0;
}

uint64_t AppleSPUHIDDriverClass::Open(AppleSPUHIDDriverClass *this, char a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = IOConnectCallMethod(*((_DWORD *)this + 12), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CFAllocatorRef v6 = *((void *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4)) {
        CFUUIDRef v7 = mach_error_string(v4);
      }
      else {
        CFUUIDRef v7 = "";
      }
      *(_DWORD *)buf = 136316418;
      CFUUIDRef v9 = "";
      __int16 v10 = 2080;
      CFUUIDRef v11 = "result == 0 ";
      __int16 v12 = 2080;
      uint32_t v13 = v7;
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v16 = 1024;
      int v17 = 1165;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_24075C000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
    if (*((void *)this + 8)) {
      MEMORY[0x2455F7480](*((unsigned int *)this + 12), 0, *MEMORY[0x263EF8960]);
    }
  }
  else if ((a2 & 1) != 0 {
         && MEMORY[0x2455F7460](*((unsigned int *)this + 12), 0, *MEMORY[0x263EF8960], (char *)this + 64, (char *)this + 72, 1))
  }
  {
    *((void *)this + 8) = 0;
    *((void *)this + 9) = 0;
  }
  return v4;
}

uint64_t AppleSPUHIDDriverClass::Close(AppleSPUHIDDriverClass *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*((void *)this + 8)) {
    MEMORY[0x2455F7480](*((unsigned int *)this + 12), 0, *MEMORY[0x263EF8960]);
  }
  uint64_t v2 = IOConnectCallMethod(*((_DWORD *)this + 12), 4u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2)) {
        CFUUIDRef v5 = mach_error_string(v2);
      }
      else {
        CFUUIDRef v5 = "";
      }
      *(_DWORD *)buf = 136316418;
      CFUUIDRef v7 = "";
      __int16 v8 = 2080;
      CFUUIDRef v9 = "result == 0 ";
      __int16 v10 = 2080;
      CFUUIDRef v11 = v5;
      __int16 v12 = 2080;
      uint32_t v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v14 = 1024;
      int v15 = 1200;
      __int16 v16 = 1024;
      int v17 = v2;
      _os_log_impl(&dword_24075C000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDriverClass::CopyEventMultiple(AppleSPUHIDDriverClass *this, const __CFArray **a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 11))
  {
    uint64_t v6 = 3758097112;
    __int16 v8 = *((void *)this + 7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    int v11 = 136316418;
    __int16 v12 = "";
    __int16 v13 = 2080;
    __int16 v14 = "_service";
    __int16 v15 = 2080;
    __int16 v16 = "";
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v19 = 1024;
    int v20 = 1228;
    __int16 v21 = 1024;
    int v22 = 0;
LABEL_13:
    _os_log_impl(&dword_24075C000, v8, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v11, 0x36u);
    return v6;
  }
  if (!*((_DWORD *)this + 12))
  {
    uint64_t v6 = 3758097112;
    __int16 v8 = *((void *)this + 7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    int v11 = 136316418;
    __int16 v12 = "";
    __int16 v13 = 2080;
    __int16 v14 = "_connect";
    __int16 v15 = 2080;
    __int16 v16 = "";
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v19 = 1024;
    int v20 = 1229;
    __int16 v21 = 1024;
    int v22 = 0;
    goto LABEL_13;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable)
  {
    __int16 v8 = *((void *)this + 7);
    uint64_t v6 = 3758097085;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    int v11 = 136316418;
    __int16 v12 = "";
    __int16 v13 = 2080;
    __int16 v14 = "events";
    __int16 v15 = 2080;
    __int16 v16 = "";
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v19 = 1024;
    int v20 = 1232;
    __int16 v21 = 1024;
    int v22 = 0;
    goto LABEL_13;
  }
  CFMutableArrayRef v5 = Mutable;
  uint64_t v6 = AppleSPUHIDDriverClass::ApplyToHistorical((uint64_t)this, MEMORY[0x263EFF368], (uint64_t)Mutable);
  if (v6)
  {
    CFUUIDRef v9 = *((void *)this + 7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v6)) {
        __int16 v10 = mach_error_string(v6);
      }
      else {
        __int16 v10 = "";
      }
      int v11 = 136316418;
      __int16 v12 = "";
      __int16 v13 = 2080;
      __int16 v14 = "result == 0 ";
      __int16 v15 = 2080;
      __int16 v16 = v10;
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v19 = 1024;
      int v20 = 1237;
      __int16 v21 = 1024;
      int v22 = v6;
      _os_log_impl(&dword_24075C000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v11, 0x36u);
    }
    CFRelease(v5);
  }
  else
  {
    *a2 = v5;
  }
  return v6;
}

uint64_t AppleSPUHIDDriverClass::ApplyToHistorical(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  v31[0] = a2;
  v31[1] = a3;
  mach_timebase_info v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  if (!*(_DWORD *)(a1 + 44))
  {
    uint64_t v23 = *(NSObject **)(a1 + 56);
    uint64_t v20 = 3758097112;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "";
    __int16 v39 = 2080;
    v40 = "_service";
    __int16 v41 = 2080;
    uint64_t v42 = "";
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v45 = 1024;
    int v46 = 1356;
    __int16 v47 = 1024;
    *(_DWORD *)unsigned int v48 = 0;
    goto LABEL_33;
  }
  if (!*(_DWORD *)(a1 + 48))
  {
    uint64_t v23 = *(NSObject **)(a1 + 56);
    uint64_t v20 = 3758097112;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "";
    __int16 v39 = 2080;
    v40 = "_connect";
    __int16 v41 = 2080;
    uint64_t v42 = "";
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v45 = 1024;
    int v46 = 1357;
    __int16 v47 = 1024;
    *(_DWORD *)unsigned int v48 = 0;
    goto LABEL_33;
  }
  if (!*(void *)(a1 + 64))
  {
    uint64_t v23 = *(NSObject **)(a1 + 56);
    uint64_t v20 = 3758097095;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "";
    __int16 v39 = 2080;
    v40 = "_historical_addr";
    __int16 v41 = 2080;
    uint64_t v42 = "";
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v45 = 1024;
    int v46 = 1358;
    __int16 v47 = 1024;
    *(_DWORD *)unsigned int v48 = 0;
    goto LABEL_33;
  }
  if (!*(void *)(a1 + 72))
  {
    uint64_t v23 = *(NSObject **)(a1 + 56);
    uint64_t v20 = 3758097095;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "";
    __int16 v39 = 2080;
    v40 = "_historical_size";
    __int16 v41 = 2080;
    uint64_t v42 = "";
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    __int16 v45 = 1024;
    int v46 = 1359;
    __int16 v47 = 1024;
    *(_DWORD *)unsigned int v48 = 0;
LABEL_33:
    _os_log_impl(&dword_24075C000, v23, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
LABEL_22:
    __int16 v21 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_24075C000, v21, OS_LOG_TYPE_DEFAULT, "AppleSPUHIDDriverClass::ApplyToHistorical -> %x", buf, 8u);
    }
    return v20;
  }
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = IOServiceMatching("AppleSPUTimesync");
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"timesync", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDictionaryRef v9 = CFProperty;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"spu");
    CFNumberGetValue(Value, kCFNumberLongLongType, &v34);
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v9, @"ap");
    CFNumberGetValue(v11, kCFNumberLongLongType, &v33);
    uint64_t v12 = mach_timebase_info(&v32);
    if (v12)
    {
      uint64_t v20 = v12;
      uint64_t v25 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (mach_error_string(v20)) {
          __int16 v26 = mach_error_string(v20);
        }
        else {
          __int16 v26 = "";
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "";
        __int16 v39 = 2080;
        v40 = "result == 0 ";
        __int16 v41 = 2080;
        uint64_t v42 = v26;
        __int16 v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
        __int16 v45 = 1024;
        int v46 = 1369;
        __int16 v47 = 1024;
        *(_DWORD *)unsigned int v48 = v20;
        _os_log_impl(&dword_24075C000, v25, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
      }
      CFNumberRef v16 = 0;
      io_service_t v14 = 0;
    }
    else
    {
      CFDictionaryRef v13 = IOServiceMatching("AppleSPU");
      io_service_t v14 = IOServiceGetMatchingService(v4, v13);
      CFNumberRef v15 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v14, @"slaveAlignment", v7, 0);
      if (v15)
      {
        CFNumberRef v16 = v15;
        CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
        int v17 = valuePtr;
        if (!valuePtr) {
          int v17 = 64;
        }
        int valuePtr = v17;
        uint64_t v18 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 48), 1u, 0, 0, 0, 0);
        if (v18)
        {
          uint64_t v20 = v18;
          __int16 v28 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            if (mach_error_string(v20)) {
              long long v29 = mach_error_string(v20);
            }
            else {
              long long v29 = "";
            }
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = "";
            __int16 v39 = 2080;
            v40 = "result == 0 ";
            __int16 v41 = 2080;
            uint64_t v42 = v29;
            __int16 v43 = 2080;
            v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
            __int16 v45 = 1024;
            int v46 = 1380;
            __int16 v47 = 1024;
            *(_DWORD *)unsigned int v48 = v20;
            _os_log_impl(&dword_24075C000, v28, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          }
        }
        else
        {
          *(void *)buf = &unk_26F4E1B98;
          *(_DWORD *)&v48[2] = 0;
          unint64_t v30 = 0;
          int v19 = *(_DWORD *)(a1 + 48);
          SPUDataQueue::init((SPUDataQueue *)buf, *(unsigned __int8 **)(a1 + 64), *(void *)(a1 + 72), 0, valuePtr);
          *(_DWORD *)&v48[2] = v19;
          LODWORD(v35) = *(_DWORD *)(a1 + 48);
          SPUDataQueue::dequeue_all_read_only((SPUDataQueue *)buf, (void (*)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int))AppleSPUHIDDriverClass::ApplyToHistoricalCallback, v31);
          SPUDataQueue::get_extended_info((SPUDataQueue *)buf, 4, &v30);
          uint64_t input = v30;
          if (IOConnectCallScalarMethod(*(mach_port_t *)&v48[2], 6u, &input, 1u, 0, 0)) {
            uint64_t v20 = 3758097090;
          }
          else {
            uint64_t v20 = 0;
          }
          IOConnectCallScalarMethod(*(_DWORD *)(a1 + 48), 2u, 0, 0, 0, 0);
        }
      }
      else
      {
        uint64_t v20 = 3758097086;
        int v27 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "";
          __int16 v39 = 2080;
          v40 = "alignRef";
          __int16 v41 = 2080;
          uint64_t v42 = "";
          __int16 v43 = 2080;
          v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
          __int16 v45 = 1024;
          int v46 = 1374;
          __int16 v47 = 1024;
          *(_DWORD *)unsigned int v48 = 0;
          _os_log_impl(&dword_24075C000, v27, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
        }
        CFNumberRef v16 = 0;
      }
    }
    CFRelease(v9);
    if (MatchingService) {
LABEL_16:
    }
      IOObjectRelease(MatchingService);
  }
  else
  {
    uint64_t v20 = 3758097086;
    mach_error_t v24 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "";
      __int16 v39 = 2080;
      v40 = "timesyncDict";
      __int16 v41 = 2080;
      uint64_t v42 = "";
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v45 = 1024;
      int v46 = 1364;
      __int16 v47 = 1024;
      *(_DWORD *)unsigned int v48 = 0;
      _os_log_impl(&dword_24075C000, v24, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
    io_service_t v14 = 0;
    CFNumberRef v16 = 0;
    if (MatchingService) {
      goto LABEL_16;
    }
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v14) {
    IOObjectRelease(v14);
  }
  if (v20) {
    goto LABEL_22;
  }
  return v20;
}

void AppleSPUHIDDriverClass::ApplyToHistoricalCallback(AppleSPUHIDDriverClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  int v5 = *(unsigned __int16 *)(a3 + 22);
  if (v5 == 194)
  {
    uint64_t AccelerometerEvent = IOHIDEventCreateAccelerometerEvent();
    if (!AccelerometerEvent) {
      return;
    }
    VendorDefinedEvent = (const void *)AccelerometerEvent;
    IOHIDEventSetIntegerValue();
  }
  else
  {
    if (v5 != 196) {
      return;
    }
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
    if (!VendorDefinedEvent) {
      return;
    }
  }
  (*(void (**)(void, const void *))this)(*((void *)this + 1), VendorDefinedEvent);

  CFRelease(VendorDefinedEvent);
}

BOOL sub_240761C64(uint64_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 6u, &input, 1u, 0, 0) == 0;
}

uint64_t AppleSPUHIDDriverClass::AopTimeToCalendar(AppleSPUHIDDriverClass *this, uint64_t a2, unint64_t *a3, unsigned int *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t valuePtr = 0;
  mach_port_t v8 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v9 = IOServiceMatching("AppleSPUTimesync");
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"timesync", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDictionaryRef v12 = CFProperty;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"spu");
    CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
    CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v12, @"calendar");
    CFNumberGetValue(v14, kCFNumberLongLongType, &v19);
    unint64_t v15 = (v19 - valuePtr + 1000 * a2) / 0x3E8uLL;
    *a3 = (v19 - valuePtr + 1000 * a2) / 0x3B9ACA00uLL;
    *a4 = v15 - 1000000 * ((unint64_t)((v15 * (unsigned __int128)0x431BDE82D7B635uLL) >> 64) >> 10);
    CFRelease(v12);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 3758097086;
    uint64_t v18 = *((void *)this + 7);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v22 = "";
      __int16 v23 = 2080;
      mach_error_t v24 = "timesyncDict";
      __int16 v25 = 2080;
      __int16 v26 = "";
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      __int16 v29 = 1024;
      int v30 = 1433;
      __int16 v31 = 1024;
      int v32 = 0;
      _os_log_impl(&dword_24075C000, v18, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v16;
}

void AppleSPULibFactory(const __CFAllocator *a1, const void *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x7Au, 0xCFu, 0x53u, 0x32u, 0x1Au, 0x35u, 0x48u, 0x93u, 0x87u, 0xCBu, 0xBAu, 0x64u, 0xE1u, 0x88u, 0x7Fu, 0xAEu);
  if (CFEqual(a2, v5))
  {
    uint64_t v6 = (AppleSPUHIDDeviceClass *)CFAllocatorAllocate(a1, 160, 0);
    AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(v6, a1);
  }
  else
  {
    CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(v4, 0x3Bu, 0xC5u, 0xCCu, 0x87u, 0x84u, 0x5Eu, 0x48u, 0xABu, 0xA9u, 0xC2u, 0x94u, 0x36u, 0, 0x1Bu, 0xA6u, 0x8Au);
    if (CFEqual(a2, v7))
    {
      mach_port_t v8 = (AppleSPUHIDDriverClass *)CFAllocatorAllocate(a1, 80, 0);
      AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(v8, a1);
    }
  }
}

void sub_240761FEC()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_240762568();
  }
}

void *sub_240762038(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2455F75C0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      __int16 v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!sub_2407621DC(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2455F75D0](v13);
  return a1;
}

void sub_240762174(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2455F75D0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x240762154);
}

void sub_2407621C8(_Unwind_Exception *a1)
{
}

uint64_t sub_2407621DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_240762364(__p, v12, __c);
      CFDictionaryRef v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_240762348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_240762364(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_240762410();
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

void sub_240762410()
{
}

void sub_240762428(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_240762484(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2650D3E20, MEMORY[0x263F8C060]);
}

void sub_240762470(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_240762484(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2407624B8(uint64_t a1, const char *a2, int a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x100uLL, "%s:%d [ringbuffer=%p, lc_rdptr=%d]", a2, a3, *(const void **)(a1 + 8), *(_DWORD *)(a1 + 36));
  size_t v4 = strlen(__str);
  IOConnectCallMethod(*(_DWORD *)(a1 + 52), 5u, 0, 0, __str, v4 + 1, 0, 0, 0, 0);
  abort();
}

void sub_24076253C()
{
}

void sub_240762568()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_24075C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: dequeue_all shouldn't be called by SPUDataQueueAccessor.", v0, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x270EF3FE0](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

IOReturn IODataQueueWaitForAvailableData(IODataQueueMemory *dataQueue, mach_port_t notificationPort)
{
  return MEMORY[0x270EF3FF8](dataQueue, *(void *)&notificationPort);
}

uint64_t IOHIDEventCreateAccelerometerEvent()
{
  return MEMORY[0x270EF4200]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x270EF42F0]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x270EF43D0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}