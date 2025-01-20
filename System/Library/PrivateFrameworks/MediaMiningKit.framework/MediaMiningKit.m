uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D21528F0()
{
  sub_1D2153414();
  uint64_t result = sub_1D21BD830();
  qword_1EBD346B0 = result;
  return result;
}

id CLSVisualUnderstandingServiceClient.__allocating_init(visionCacheURL:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return CLSVisualUnderstandingServiceClient.init(visionCacheURL:)(a1);
}

id CLSVisualUnderstandingServiceClient.init(visionCacheURL:)(uint64_t a1)
{
  uint64_t v3 = sub_1D21BD7F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D21BD790();
  MEMORY[0x1F4188790]();
  v7 = v1;
  sub_1D21BD780();
  uint64_t v8 = sub_1D21BD750();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v6, a1, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v11 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  id v10 = (id)(v4 + 104);
  v11(v6, *MEMORY[0x1E4F70350], v3);
  sub_1D21BD800();
  swift_allocObject();
  uint64_t v12 = v17;
  uint64_t v13 = sub_1D21BD7E0();
  if (v12)
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    type metadata accessor for CLSVisualUnderstandingServiceClient();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v7[OBJC_IVAR___CLSVisualUnderstandingServiceClient_vuService] = v13;

    v14 = (objc_class *)type metadata accessor for CLSVisualUnderstandingServiceClient();
    v16.receiver = v7;
    v16.super_class = v14;
    id v10 = objc_msgSendSuper2(&v16, sel_init);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  return v10;
}

uint64_t type metadata accessor for CLSVisualUnderstandingServiceClient()
{
  return self;
}

uint64_t sub_1D2152D04@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD34590);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD34598);
  MEMORY[0x1F4188790]();
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D21BD7B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1) {
    sub_1D21BD7C0();
  }
  else {
    sub_1D21BD7D0();
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1D2153344((uint64_t)v7, &qword_1EBD34598);
    os_log_type_t v12 = sub_1D21BD820();
    if (qword_1EBD346B8 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_1EBD346B0;
    if (os_log_type_enabled((os_log_t)qword_1EBD346B0, v12))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 67109120;
      v19[3] = a1 & 1;
      sub_1D21BD840();
      _os_log_impl(&dword_1D2150000, v13, v12, "VU Device Owner is nil. Did ignore contact linking: %{BOOL}d", v14, 8u);
      MEMORY[0x1D2602850](v14, -1, -1);
    }
    uint64_t v15 = sub_1D21BD770();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_1D21BD7A0();
    uint64_t v17 = sub_1D21BD770();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v5, 1, v17) == 1)
    {
      sub_1D2153344((uint64_t)v5, &qword_1EBD34590);
      sub_1D21BD820();
      if (qword_1EBD346B8 != -1) {
        swift_once();
      }
      sub_1D21BD810();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a2, 1, 1, v17);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a2, v5, v17);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v17);
    }
  }
}

id CLSVisualUnderstandingServiceClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CLSVisualUnderstandingServiceClient.init()()
{
}

id CLSVisualUnderstandingServiceClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CLSVisualUnderstandingServiceClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D2153344(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t method lookup function for CLSVisualUnderstandingServiceClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CLSVisualUnderstandingServiceClient);
}

uint64_t dispatch thunk of CLSVisualUnderstandingServiceClient.__allocating_init(visionCacheURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CLSVisualUnderstandingServiceClient.deviceOwnerPersonUUID(ignoreContactsLinking:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

unint64_t sub_1D2153414()
{
  unint64_t result = qword_1EBD345A0;
  if (!qword_1EBD345A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBD345A0);
  }
  return result;
}

void sub_1D2153A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D2154124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v53 - 160), 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1D2154764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1D215669C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
}

void sub_1D2156990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2156C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2156F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D215731C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D21575D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2157894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D2157B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D2157DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D2157EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2158314(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21584F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2158644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2158AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__101(uint64_t a1)
{
}

void sub_1D21593C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_sync_exit(v26);
  _Unwind_Resume(a1);
}

void sub_1D21596AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215A420(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215A74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D215ABB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D215AEC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215AF48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215AFF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B048(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B0D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B22C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B2D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B34C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D215B48C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B540(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B5DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B700(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B930(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215B9B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215BAE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215BCD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215BD70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215BE74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215BEF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215C048(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215C1B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D215C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D215C2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D215C34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t CLSDeviceIs2GBOrLess()
{
  if (CLSDeviceIs2GBOrLess_onceToken != -1) {
    dispatch_once(&CLSDeviceIs2GBOrLess_onceToken, &__block_literal_global_216);
  }
  return CLSDeviceIs2GBOrLess_sDeviceIs2GBOrLess;
}

void __CLSDeviceIs2GBOrLess_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28F80] processInfo];
  CLSDeviceIs2GBOrLess_sDeviceIs2GBOrLess = (unint64_t)[v0 physicalMemory] < 0x80000001;
}

__CFString *CLSHolidayCalendarEventRuleRequiredTraitsCategoryStringForCategory(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_1F28DF9D8;
  }
  else {
    return off_1E690EA50[a1];
  }
}

void sub_1D215E8C8(_Unwind_Exception *a1)
{
}

void sub_1D215FF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2161378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2163304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__778(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__779(uint64_t a1)
{
}

void sub_1D2163E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2164380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21648FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2164E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2165870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21666C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D21668F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2166C18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2166E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__907(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__908(uint64_t a1)
{
}

void sub_1D216825C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D2168384(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D21692A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2169754(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2169800(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D216990C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2169CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D216B114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__989(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__990(uint64_t a1)
{
}

id _sortedPeopleByScores(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [v3 count];
    if (v5 == [v4 count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = ___sortedPeopleByScores_block_invoke;
      v8[3] = &unk_1E690ED58;
      id v9 = v3;
      id v10 = v4;
      id v6 = v3;
      id v3 = [v6 sortedArrayUsingComparator:v8];
    }
  }

  return v3;
}

id _familyPresentationStringsForPersons(void *a1)
{
  id v1 = a1;
  objc_super v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___familyPresentationStringsForPersons_block_invoke;
  v13[3] = &unk_1E690ED08;
  id v14 = v2;
  id v3 = v2;
  [v1 enumerateObjectsUsingBlock:v13];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___familyPresentationStringsForPersons_block_invoke_2;
  v10[3] = &unk_1E690ED30;
  id v11 = v1;
  id v5 = v4;
  id v12 = v5;
  id v6 = v1;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
  v7 = v12;
  id v8 = v5;

  return v8;
}

id _flattenPresentationStringFromTokens(void *a1)
{
  id v1 = a1;
  objc_super v2 = [MEMORY[0x1E4F28E78] string];
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      if (v3)
      {
        uint64_t v4 = [v1 count] - 1;
        id v5 = @", ";
        if (v3 != v4 || (v6 = [v1 count:@", "] - 1, id v5 = @" and ", v3 == v6)) {
          [v2 appendString:v5];
        }
      }
      v7 = [v1 objectAtIndexedSubscript:v3];
      [v2 appendString:v7];

      ++v3;
    }
    while (v3 < [v1 count]);
  }

  return v2;
}

void ___familyPresentationStringsForPersons_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 relationship];
  if (+[CLSPersonIdentity isParentRelationship:v4]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v5];
  [v6 setObject:v3 forKey:v7];
}

void ___familyPresentationStringsForPersons_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = _numberOfRelationshipForPersons([v4 relationship], *(void **)(a1 + 32));
  uint64_t v6 = *(void **)(a1 + 40);
  if (v5 < 2) {
    [v4 presentationString];
  }
  else {
  id v7 = [v4 pluralPresentationString];
  }

  [v6 addObject:v7];
}

uint64_t _numberOfRelationshipForPersons(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    unint64_t v8 = a1 & 0xFFFFFFFFFFFFFFFBLL;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((v8 & [*(id *)(*((void *)&v11 + 1) + 8 * i) relationship]) != 0) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t ___sortedPeopleByScores_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) indexOfObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  if (v7 < [*(id *)(a1 + 40) count] && v8 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    id v9 = [*(id *)(a1 + 40) objectAtIndex:v7];
    [v9 doubleValue];
    double v11 = v10;

    long long v12 = [*(id *)(a1 + 40) objectAtIndex:v8];
    [v12 doubleValue];
    double v14 = v13;

    if (v11 < v14)
    {
      uint64_t v15 = 1;
      goto LABEL_11;
    }
    if (v11 > v14)
    {
      uint64_t v15 = -1;
      goto LABEL_11;
    }
  }
  uint64_t v16 = [v5 fullName];

  if (v16)
  {
    uint64_t v17 = [v5 fullName];
    uint64_t v18 = [v6 fullName];
    uint64_t v15 = [v17 compare:v18];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v17 = [v5 fullName];
    uint64_t v18 = [v19 numberWithUnsignedInteger:v17];
    v20 = (void *)MEMORY[0x1E4F28ED0];
    v21 = [v6 fullName];
    v22 = [v20 numberWithUnsignedInteger:v21];
    uint64_t v15 = [v18 compare:v22];
  }
LABEL_11:

  return v15;
}

void sub_1D216C618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D216D87C(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__1090(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1091(uint64_t a1)
{
}

void sub_1D216DC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D216E3D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D216E650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21709FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1D2171C3C(_Unwind_Exception *a1)
{
}

void sub_1D2172774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2172918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1297(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1298(uint64_t a1)
{
}

void sub_1D2172B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2172DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21732EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2173620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21739C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2173F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2175D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2176444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D217665C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2176740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2177698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D2178220(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_1D2178A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21791D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_1D21795E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

double CLSCosineSimilarityBetweenSceneprints(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 elementCount];
  float v6 = 0.0;
  if (v5 == [v4 elementCount])
  {
    id v7 = [v3 descriptorData];
    unint64_t v8 = (float *)[v7 bytes];

    id v9 = [v4 descriptorData];
    double v10 = (float *)[v9 bytes];

    if (v8)
    {
      if (v10)
      {
        if (v5)
        {
          float v11 = 0.0;
          float v12 = 0.0;
          do
          {
            float v13 = *v8++;
            float v14 = v13;
            float v15 = *v10++;
            float v6 = v6 + (float)(v14 * v15);
            float v12 = v12 + (float)(v14 * v14);
            float v11 = v11 + (float)(v15 * v15);
            --v5;
          }
          while (v5);
          if (v12 > 0.0 && v11 > 0.0) {
            float v6 = v6 / sqrtf(v12 * v11);
          }
        }
      }
    }
  }

  return v6;
}

double CLSEuclidianDistanceBetweenSceneprints(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 requestRevision];
  if (v5 != [v4 requestRevision])
  {
    float v13 = +[CLSLogging sharedLogging];
    float v14 = [v13 loggingConnection];

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    float v15 = "Cannot compute euclidian distance between sceneprints with different revisions.";
    uint64_t v16 = buf;
LABEL_10:
    _os_log_impl(&dword_1D2150000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
    goto LABEL_13;
  }
  vDSP_Length v6 = [v3 elementCount];
  uint64_t v7 = [v3 elementType];
  if (v7 != [v4 elementType] || v6 != objc_msgSend(v4, "elementCount"))
  {
    uint64_t v17 = +[CLSLogging sharedLogging];
    float v14 = [v17 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D2150000, v14, OS_LOG_TYPE_ERROR, "Cannot compute euclidian distance between sceneprints with different formats", v22, 2u);
    }
    goto LABEL_13;
  }
  id v8 = [v3 descriptorData];
  id v9 = (const float *)[v8 bytes];

  id v10 = [v4 descriptorData];
  float v11 = (const float *)[v10 bytes];

  if (!v9 || !v11)
  {
    v19 = +[CLSLogging sharedLogging];
    float v14 = [v19 loggingConnection];

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v21 = 0;
    float v15 = "Cannot compute euclidian distance between sceneprints with empty feature prints";
    uint64_t v16 = (uint8_t *)&v21;
    goto LABEL_10;
  }
  float __C = 3.4028e38;
  vDSP_distancesq(v9, 1, v11, 1, &__C, v6);
  if (__C >= 3.4028e38)
  {
LABEL_14:
    double v12 = 1.79769313e308;
    goto LABEL_15;
  }
  double v12 = sqrtf(__C / (float)v6);
LABEL_15:

  return v12;
}

void sub_1D217D3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void _CLSReachabilityCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"CLSReachabilityChangedNotification", a3);
}

void sub_1D217EFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D217FA9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D2181898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21819D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2181C04(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2181C90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2182330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2182478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21824F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2184D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id obj)
{
}

void sub_1D2184FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D218504C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2185DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void statsPrint(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = (objc_class *)NSString;
  id v10 = a1;
  float v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  puts((const char *)[v12 UTF8String]);
}

void sub_1D2188160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D218AD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3483(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3484(uint64_t a1)
{
}

void sub_1D218DAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3961(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3962(uint64_t a1)
{
}

void sub_1D218E4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1D218F0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1D2190F94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D21916C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *PGDescriptionForLocationOfInterestType(uint64_t a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 1) {
    uint64_t v1 = @"Work";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Home";
  }
}

void sub_1D2192E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D2193200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4528(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4529(uint64_t a1)
{
}

void sub_1D21936AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2194D40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CLSRoutineServiceStatisticsMakeDefault@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x220], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t _maxTaxonomyNodeLevel(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA80] setWithObject:v1];
  uint64_t v3 = 0;
  while (1)
  {
    if ([v2 count] == 1)
    {
      id v4 = [v2 anyObject];
      char v5 = [v4 isRoot];

      if (v5) {
        break;
      }
    }
    vDSP_Length v6 = [MEMORY[0x1E4F1CA80] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v2;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) parents];
          [v6 unionSet:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    ++v3;

    uint64_t v2 = v6;
  }

  return v3;
}

void sub_1D219C658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219C71C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219C954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219C9FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219CB64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219CC94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219CD70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219CE4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219CF28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D2A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D3CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D4F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D588(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D634(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D7C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219D94C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219DABC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219DC24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219DF40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219E0B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219E178(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219E24C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219E2FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D219E3F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t NSDateComponentsEqualToDateComponents(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 2) != 0)
  {
    uint64_t v8 = [v5 era];
    uint64_t v7 = v8 == [v6 era];
    if ((a3 & 4) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 1;
    if ((a3 & 4) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = [v5 year];
  if (v9 == [v6 year]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_8:
  if ((a3 & 8) != 0)
  {
    uint64_t v13 = [v5 month];
    if (v13 == [v6 month]) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 0;
    }
    if ((a3 & 0x10) == 0)
    {
LABEL_10:
      if ((a3 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_35;
    }
  }
  else if ((a3 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  uint64_t v14 = [v5 day];
  if (v14 == [v6 day]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x20) == 0)
  {
LABEL_11:
    if ((a3 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v15 = [v5 hour];
  if (v15 == [v6 hour]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x40) == 0)
  {
LABEL_12:
    if ((a3 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v16 = [v5 minute];
  if (v16 == [v6 minute]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x80) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_43:
  uint64_t v17 = [v5 second];
  if (v17 == [v6 second]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x200) == 0)
  {
LABEL_14:
    if ((a3 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_47:
  uint64_t v18 = [v5 weekday];
  if (v18 == [v6 weekday]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x400) == 0)
  {
LABEL_15:
    if ((a3 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_55;
  }
LABEL_51:
  uint64_t v19 = [v5 weekdayOrdinal];
  if (v19 == [v6 weekdayOrdinal]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x800) == 0)
  {
LABEL_16:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_59;
  }
LABEL_55:
  uint64_t v20 = [v5 quarter];
  if (v20 == [v6 quarter]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x1000) == 0)
  {
LABEL_17:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_59:
  uint64_t v21 = [v5 weekOfMonth];
  if (v21 == [v6 weekOfMonth]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x2000) == 0)
  {
LABEL_18:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_67;
  }
LABEL_63:
  uint64_t v22 = [v5 weekOfYear];
  if (v22 == [v6 weekOfYear]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x4000) == 0)
  {
LABEL_19:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_71;
  }
LABEL_67:
  uint64_t v23 = [v5 yearForWeekOfYear];
  if (v23 == [v6 yearForWeekOfYear]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x8000) == 0)
  {
LABEL_20:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_71:
  uint64_t v24 = [v5 nanosecond];
  if (v24 == [v6 nanosecond]) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((a3 & 0x100000) == 0)
  {
LABEL_21:
    if ((a3 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_75:
  v25 = [v5 calendar];
  v26 = [v6 calendar];
  if (v25 == v26) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }

  if ((a3 & 0x200000) != 0)
  {
LABEL_22:
    uint64_t v10 = [v5 timeZone];
    uint64_t v11 = [v6 timeZone];
    if (v10 == v11) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 0;
    }
  }
LABEL_26:

  return v7;
}

id CLSFullMethodName(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();

  id v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = 45;
  if ((id)v4 == v3) {
    uint64_t v7 = 43;
  }
  uint64_t v8 = [v5 stringWithFormat:@"%c[%@ %@]", v7, v4, v6];

  return v8;
}

id CLSAbstractMethodException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = CLSFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: must override selector sent to %p", v4, v3];

  uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

void sub_1D219F8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D21A1AAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D21A235C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A23EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A247C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A2E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__5704(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5705(uint64_t a1)
{
}

void sub_1D21A38B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21A415C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A48C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A5A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21A6588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21A6734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A6B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A7384(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A7658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A77A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21A7E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21A8328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CLSQueryPerformerProtocolStatisticsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

double CLSQueryPerformerProtocolStatisticsMakeDefault@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void CLSPrintQueryPerformerProtocolStatisticsDescription(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"[GEO] %@ | [Locations]: %lu | [Cached Locations]: %lu | [Resolved Locations]: %lu | [Requests]: %lu | [Batch Size]: %lu", a1, *a2, a2[2], a2[1], a2[3], a2[4]];
  id v3 = +[CLSLogging sharedLogging];
  uint64_t v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1D2150000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

uint64_t CLSQueryPerformerProtocolStatisticsDescription(uint64_t a1, void *a2)
{
  return [NSString stringWithFormat:@"[GEO] %@ | [Locations]: %lu | [Cached Locations]: %lu | [Resolved Locations]: %lu | [Requests]: %lu | [Batch Size]: %lu", a1, *a2, a2[2], a2[1], a2[3], a2[4]];
}

void sub_1D21A8FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D21AA178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21AA230(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21AA444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21AA704(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *CLSDescriptionForTransportationMode(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6910248[a1];
  }
}

double *CLSCalculateRangeCoordinateForCoordinateWithQueryAccuracy(double *result, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  double v7 = a5 * 0.0174532925;
  double v8 = a6 * 0.0174532925;
  double v9 = a7 / 6378137.0;
  double v10 = (v7 + v9) * 57.2957795;
  double v11 = (v8 - v9) * 57.2957795;
  double v12 = (v7 - v9) * 57.2957795;
  double v13 = (v8 + v9) * 57.2957795;
  if (v12 <= v10) {
    double v14 = v12;
  }
  else {
    double v14 = v10;
  }
  *double result = v14;
  if (v12 <= v10) {
    double v12 = v10;
  }
  if (v13 <= v11) {
    double v15 = v13;
  }
  else {
    double v15 = v11;
  }
  *a2 = v15;
  *a3 = v12;
  if (v13 <= v11) {
    double v16 = v11;
  }
  else {
    double v16 = v13;
  }
  *a4 = v16;
  return result;
}

void CLSCalculateRangeCoordinateForRegion(void *a1, double *a2, double *a3, double *a4, double *a5)
{
  id v9 = a1;
  [v9 radius];
  double v11 = v10 / 20.0;
  [v9 center];
  double v13 = v12;
  double v15 = v14;

  double v16 = (v11 / 6378137.0 + v13 * 0.0174532925) * 57.2957795;
  double v17 = (v15 * 0.0174532925 - v11 / 6378137.0) * 57.2957795;
  double v18 = (v13 * 0.0174532925 - v11 / 6378137.0) * 57.2957795;
  double v19 = (v11 / 6378137.0 + v15 * 0.0174532925) * 57.2957795;
  if (v18 <= v16) {
    double v20 = (v13 * 0.0174532925 - v11 / 6378137.0) * 57.2957795;
  }
  else {
    double v20 = (v11 / 6378137.0 + v13 * 0.0174532925) * 57.2957795;
  }
  *a2 = v20;
  if (v18 <= v16) {
    double v18 = (v11 / 6378137.0 + v13 * 0.0174532925) * 57.2957795;
  }
  if (v19 <= v17) {
    double v21 = (v11 / 6378137.0 + v15 * 0.0174532925) * 57.2957795;
  }
  else {
    double v21 = (v15 * 0.0174532925 - v11 / 6378137.0) * 57.2957795;
  }
  *a3 = v21;
  *a4 = v18;
  if (v19 <= v17) {
    double v19 = (v15 * 0.0174532925 - v11 / 6378137.0) * 57.2957795;
  }
  *a5 = v19;
}

uint64_t CLSCommonCalculateBoundingBoxCenter(double *a1, double *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = 0;
  if (a1 && a2)
  {
    *a1 = (a3 + a4) * 0.5;
    if (a5 <= a6)
    {
      double v7 = (a5 + a6) * 0.5;
    }
    else
    {
      double v7 = (a6 + 360.0 - a5) * 0.5 + a5;
      if (v7 > 180.0) {
        double v7 = v7 + -360.0;
      }
    }
    *a2 = v7;
    return 1;
  }
  return v6;
}

void CLSCommonCalculateDistanceRadius(int a1, double a2, double a3, double a4, double a5)
{
  double v7 = (a2 + a4) * 0.0174532925;
  if (a3 < 0.0) {
    a3 = a3 + 360.0;
  }
  if (a5 < 0.0) {
    a5 = a5 + 360.0;
  }
  double v8 = a5 - a3;
  if (v8 <= 180.0)
  {
    if (v8 < -180.0) {
      double v8 = v8 + 360.0;
    }
  }
  else
  {
    double v8 = v8 + -360.0;
  }
  double v9 = v7 * 0.5;
  double v10 = (a4 - a2) * 0.0174532925;
  unsigned int v11 = (int)v8;
  if ((int)v8 < 0) {
    unsigned int v11 = -v11;
  }
  int v12 = (int)a4 - (int)a2;
  if (v12 < 0) {
    int v12 = (int)a2 - (int)a4;
  }
  double v13 = v8 * 0.0174532925;
  if (v12 > 2 || v11 > 2)
  {
    if (a1) {
      sin(v9);
    }
    long double v14 = sin(v10 * 0.5);
    long double v15 = v14 * v14;
    double v16 = cos(a2 * 0.0174532925);
    long double v17 = v16 * cos(a4 * 0.0174532925);
    long double v18 = sin(v13 * 0.5);
    double v19 = v15 + v17 * (v18 * v18);
    double v20 = 1.0 - v19;
    if (v19 < 0.0) {
      double v19 = 0.0;
    }
    if (v20 < 0.0) {
      double v20 = 0.0;
    }
    atan2(sqrt(v19), sqrt(v20));
  }
  else
  {
    __sincos_stret(v9);
  }
}

void CLSCentroidForCoordinates(double a1, double a2, double a3, CLLocationDegrees a4, CLLocationDegrees a5, double a6)
{
  BOOL v12 = CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1);
  v27.latitude = a4;
  v27.longitude = a5;
  BOOL v13 = CLLocationCoordinate2DIsValid(v27);
  if ((v12 || v13) && v12 && v13)
  {
    double v14 = a3 + a6;
    if (a3 + a6 != 0.0)
    {
      __double2 v15 = __sincos_stret(a4 * 0.0174532925);
      __double2 v16 = __sincos_stret(a1 * 0.0174532925);
      double v17 = a2 * 0.0174532925;
      double v18 = a3 / v14;
      double v19 = a6 / v14;
      __double2 v20 = __sincos_stret(v17);
      __double2 v21 = __sincos_stret(a5 * 0.0174532925);
      long double v22 = v19 * (v15.__cosval * v21.__cosval) + v16.__cosval * v20.__cosval * v18;
      long double v23 = v19 * (v15.__cosval * v21.__sinval) + v16.__cosval * v20.__sinval * v18;
      long double v24 = v15.__sinval * v19 + v16.__sinval * v18;
      double v25 = atan2(v23, v22);
      long double v26 = atan2(v24, sqrt(v23 * v23 + v22 * v22));
      CLLocationCoordinate2DMake(v26 * 57.2957795, v25 * 57.2957795);
    }
  }
}

void sub_1D21ACC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_1D21AD3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D21AD654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21AF3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6466(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6467(uint64_t a1)
{
}

void sub_1D21B0308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CLSBenchmarkGetMemory(void *a1, void *a2)
{
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  long long v11 = 0u;
  *(_OWORD *)host_info_out = 0u;
  *(_OWORD *)double v9 = 0u;
  long long v10 = 0u;
  mach_msg_type_number_t host_info_outCnt = 15;
  host_t v4 = MEMORY[0x1D2602270]();
  mach_error_t v5 = host_statistics(v4, 2, host_info_out, &host_info_outCnt);
  if (v5) {
    mach_error("can't get host_vm_info???\n", v5);
  }
  mach_msg_type_number_t host_info_outCnt = 12;
  host_t v6 = MEMORY[0x1D2602270]();
  mach_error_t v7 = host_info(v6, 1, v9, &host_info_outCnt);
  if (v7) {
    mach_error("can't get host_basic_info???\n", v7);
  }
  *a2 = *MEMORY[0x1E4F14B00] * host_info_out[0];
  *a1 = *((void *)&v11 + 1);
}

void sub_1D21B81D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21B8884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7441(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7442(uint64_t a1)
{
}

void sub_1D21B9634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21BB97C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21BBA1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21BBABC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21BBB4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21BBBDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D21BBC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D21BC060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D21BC9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

id readGenresFromDictionaryInBundleWithKey(void *a1, void *a2)
{
  id v3 = a2;
  host_t v4 = [a1 URLForResource:@"musicTaggedGenres" withExtension:@"plist"];
  uint64_t v8 = 0;
  mach_error_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v8];
  host_t v6 = [v5 objectForKeyedSubscript:v3];

  return v6;
}

uint64_t sub_1D21BD730()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D21BD740()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1D21BD750()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D21BD760()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1D21BD770()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D21BD780()
{
  return MEMORY[0x1F4126880]();
}

uint64_t sub_1D21BD790()
{
  return MEMORY[0x1F4126888]();
}

uint64_t sub_1D21BD7A0()
{
  return MEMORY[0x1F41269E8]();
}

uint64_t sub_1D21BD7B0()
{
  return MEMORY[0x1F41269F0]();
}

uint64_t sub_1D21BD7C0()
{
  return MEMORY[0x1F41269F8]();
}

uint64_t sub_1D21BD7D0()
{
  return MEMORY[0x1F4126A00]();
}

uint64_t sub_1D21BD7E0()
{
  return MEMORY[0x1F4126A08]();
}

uint64_t sub_1D21BD7F0()
{
  return MEMORY[0x1F4126A10]();
}

uint64_t sub_1D21BD800()
{
  return MEMORY[0x1F4126A18]();
}

uint64_t sub_1D21BD810()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1D21BD820()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1D21BD830()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1D21BD840()
{
  return MEMORY[0x1F41847C0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1F40DB590]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t GEOSpatialLookupAllCategories()
{
  return MEMORY[0x1F411C3C0]();
}

uint64_t NLStringEmbeddingCopyNeighborsWithDistances()
{
  return MEMORY[0x1F4114050]();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return MEMORY[0x1F4114080]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
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

uint64_t PLIsChinaSKU()
{
  return MEMORY[0x1F413FE28]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F30](target, runLoop, runLoopMode);
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

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}