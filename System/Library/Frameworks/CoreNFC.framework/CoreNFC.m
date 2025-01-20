void sub_2214BA4AC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x2214BA420);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2214BA500(_Unwind_Exception *a1)
{
}

void sub_2214BA50C(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x2214BA518);
}

void sub_2214C4E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2214C5128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2214C5C48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2214C7EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2214C8970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2214C8BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2214D623C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214D6C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214D72CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2214D7658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214D7BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_2214D8E8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214D9684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214D9DD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DA028(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DA4DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DA700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2214DAA28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DB3DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DBC24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DC46C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DC55C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DC660(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DCCA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DD1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_sync_exit(v31);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2214DD764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_2214DDC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_sync_exit(v29);
  _Unwind_Resume(a1);
}

void sub_2214DE2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  objc_sync_exit(v39);
  _Unwind_Resume(a1);
}

void sub_2214DEFE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214DF9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_2214DFD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_2214E0240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_2214E04E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void __CRASHING_DUE_TO_PRIVACY_VIOLATION__(uint64_t a1)
{
  qword_267F52EF0 = a1;
  abort();
}

void sub_2214E1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_2214E2640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2214E2EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214E2F68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214E34FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_2214E39E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214E3B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2214E3DC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214E3F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2214E410C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2214E4334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2214E4934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSessionDidBecomeActive(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSession(_:didInvalidateWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSession(_:didDetect:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_2214E4BF0(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (a2 >> 62) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    if (!v6)
    {
LABEL_22:
      uint64_t v17 = v3 + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
      if (MEMORY[0x223C83510](v17))
      {
        uint64_t v18 = *(void *)(v17 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v18 + 24))(a1, v7, ObjectType, v18);
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      else
      {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_2214E506C(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    uint64_t v21 = v3;
    unint64_t v22 = a1;
    uint64_t v8 = 0;
    uint64_t v7 = v23;
    while (v6 != v8)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v9 = (void *)MEMORY[0x223C829F0](v8, a2);
      }
      else
      {
        v9 = *(void **)(a2 + 8 * v8 + 32);
        swift_unknownObjectRetain();
      }
      id v10 = objc_msgSend(v9, sel_asNFCFeliCaTag);
      if (v10)
      {
        id v11 = v10;
        uint64_t v3 = 0;
      }
      else
      {
        id v12 = objc_msgSend(v9, sel_asNFCISO15693Tag);
        if (v12)
        {
          id v11 = v12;
          uint64_t v3 = 2;
        }
        else
        {
          id v13 = objc_msgSend(v9, sel_asNFCISO7816Tag);
          if (v13)
          {
            id v11 = v13;
            uint64_t v3 = 1;
          }
          else
          {
            id v14 = objc_msgSend(v9, sel_asNFCMiFareTag);
            if (!v14) {
              goto LABEL_32;
            }
            id v11 = v14;
            uint64_t v3 = 3;
          }
        }
      }
      swift_unknownObjectRelease();
      a1 = *(void *)(v23 + 16);
      unint64_t v15 = *(void *)(v23 + 24);
      if (a1 >= v15 >> 1) {
        sub_2214E506C(v15 > 1, a1 + 1, 1);
      }
      ++v8;
      *(void *)(v23 + 16) = a1 + 1;
      uint64_t v16 = v23 + 16 * a1;
      *(void *)(v16 + 32) = v11;
      *(unsigned char *)(v16 + 40) = v3;
      if (v6 == v8)
      {
        uint64_t v3 = v21;
        a1 = v22;
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2214FEB30();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_32:
  uint64_t result = sub_2214FEB20();
  __break(1u);
  return result;
}

id sub_2214E4F80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper()
{
  return self;
}

void type metadata accessor for NFCFeliCaEncryptionId(uint64_t a1)
{
}

void type metadata accessor for NFCISO15693ResponseFlag(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_2214E5024(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2214E506C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2214E50AC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2214E508C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2214E5284(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2214E50AC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52550);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2214FEB40();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2214E525C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2214E5284(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F525C8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2214FEB40();
  __break(1u);
  return result;
}

uint64_t NFCISO7816ResponseAPDU.statusWord1.getter()
{
  return *v0;
}

uint64_t NFCISO7816ResponseAPDU.statusWord1.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*NFCISO7816ResponseAPDU.statusWord1.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.statusWord2.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t NFCISO7816ResponseAPDU.statusWord2.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*NFCISO7816ResponseAPDU.statusWord2.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2214E547C(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t sub_2214E547C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2214E5490(a1, a2);
  }
  return a1;
}

uint64_t sub_2214E5490(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t NFCISO7816ResponseAPDU.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5520(*(void *)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_2214E5520(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2214E5534(a1, a2);
  }
  return a1;
}

uint64_t sub_2214E5534(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t (*NFCISO7816ResponseAPDU.payload.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.init(statusWord1:statusWord2:paylaod:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = result;
  *(unsigned char *)(a5 + 1) = a2;
  *(void *)(a5 + 8) = a3;
  *(void *)(a5 + 16) = a4;
  return result;
}

uint64_t NFCISO7816ResponseAPDU.init(statusWord1:statusWord2:payload:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = result;
  *(unsigned char *)(a5 + 1) = a2;
  *(void *)(a5 + 8) = a3;
  *(void *)(a5 + 16) = a4;
  return result;
}

void NFCISO7816Tag.sendCommand(apdu:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214E5850;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_2214E5858;
  v9[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_sendCommandAPDU_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_2214E56BC(uint64_t a1, unint64_t a2, unsigned __int8 a3, unsigned __int8 a4, id a5, void (*a6)(unint64_t *))
{
  id v7 = a5;
  if (a5)
  {
    id v19 = 0;
    unint64_t v20 = 0;
    unint64_t v18 = (unint64_t)a5;
    char v21 = 1;
    id v8 = a5;
    a6(&v18);
  }
  else
  {
    unint64_t v10 = 0xF000000000000000;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v14) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_14:
          __break(1u);
          JUMPOUT(0x2214E5808);
        }
        uint64_t v14 = (int)v14;
LABEL_8:
        if (v14 < 1)
        {
          id v7 = 0;
        }
        else
        {
          sub_2214E5490(a1, a2);
          id v7 = (id)a1;
          unint64_t v10 = a2;
        }
LABEL_11:
        unint64_t v18 = a3 | ((unint64_t)a4 << 8);
        id v19 = v7;
        unint64_t v20 = v10;
        char v21 = 0;
        sub_2214E547C((uint64_t)v7, v10);
        a6(&v18);
        sub_2214E5520((uint64_t)v7, v10);
        sub_2214E5520((uint64_t)v7, v10);
        break;
      case 2uLL:
        uint64_t v16 = *(void *)(a1 + 16);
        uint64_t v15 = *(void *)(a1 + 24);
        BOOL v17 = __OFSUB__(v15, v16);
        uint64_t v14 = v15 - v16;
        if (!v17) {
          goto LABEL_8;
        }
        goto LABEL_14;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v14 = BYTE6(a2);
        goto LABEL_8;
    }
  }
}

uint64_t sub_2214E5818()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2214E5850(uint64_t a1, unint64_t a2, unsigned __int8 a3, unsigned __int8 a4, void *a5)
{
  sub_2214E56BC(a1, a2, a3, a4, a5, *(void (**)(unint64_t *))(v5 + 16));
}

uint64_t sub_2214E5858(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  uint64_t v11 = sub_2214FE890();
  unint64_t v13 = v12;

  id v14 = a5;
  v9(v11, v13, a3, a4, a5);

  sub_2214E5534(v11, v13);

  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t destroy for NFCISO7816ResponseAPDU(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 >> 60 != 15) {
    return sub_2214E5534(*(void *)(result + 8), v1);
  }
  return result;
}

uint64_t _s7CoreNFC22NFCISO7816ResponseAPDUVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = (uint64_t *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v3;
  }
  else
  {
    uint64_t v5 = *v3;
    sub_2214E5490(*v3, *(void *)(a2 + 16));
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for NFCISO7816ResponseAPDU(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = (_OWORD *)(a1 + 8);
  unint64_t v4 = (uint64_t *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_2214E5490(*v4, *(void *)(a2 + 16));
      uint64_t v8 = *(void *)(a1 + 8);
      unint64_t v9 = *(void *)(a1 + 16);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v5;
      sub_2214E5534(v8, v9);
      return a1;
    }
    sub_2214E5A6C(a1 + 8);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *uint64_t v3 = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_2214E5490(*v4, *(void *)(a2 + 16));
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_2214E5A6C(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NFCISO7816ResponseAPDU(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  unint64_t v5 = (void *)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = *v5;
      *(void *)(a1 + 16) = v7;
      sub_2214E5534(v8, v6);
      return a1;
    }
    sub_2214E5A6C(a1 + 8);
  }
  *unint64_t v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCISO7816ResponseAPDU(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 12);
  }
  uint64_t v3 = *(void *)(a1 + 16) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    int v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCISO7816ResponseAPDU(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCISO7816ResponseAPDU()
{
  return &type metadata for NFCISO7816ResponseAPDU;
}

uint64_t sub_2214E5C14()
{
  uint64_t v0 = sub_2214FE920();
  __swift_allocate_value_buffer(v0, qword_267F53C90);
  __swift_project_value_buffer(v0, (uint64_t)qword_267F53C90);
  return sub_2214FE910();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void NFCMiFareTag.sendMiFareCommand(commandPacket:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = (void *)sub_2214FE880();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  v10[4] = sub_2214E5EDC;
  v10[5] = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2214E5EE4;
  v10[3] = &block_descriptor_0;
  unint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_sendMiFareCommand_completionHandler_, v7, v9);
  _Block_release(v9);
}

void sub_2214E5E28(int a1, int a2, id a3, void (*a4)(void))
{
  if (a3)
  {
    id v6 = a3;
    ((void (*)(id, void, uint64_t))a4)(a3, 0, 1);
  }
  else
  {
    a4();
  }
}

uint64_t sub_2214E5EA4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2214E5EDC(int a1, int a2, void *a3)
{
  sub_2214E5E28(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_2214E5EE4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a2;
  uint64_t v7 = sub_2214FE890();
  unint64_t v9 = v8;

  id v10 = a3;
  v5(v7, v9, a3);

  sub_2214E5534(v7, v9);

  return swift_release();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void NFCMiFareTag.sendMiFareISO7816Command(_:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214E61F0;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_2214E5858;
  v9[3] = &block_descriptor_6;
  unint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_sendMiFareISO7816Command_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_2214E6094(uint64_t a1, unint64_t a2, unsigned __int8 a3, unsigned __int8 a4, id a5, void (*a6)(unint64_t *))
{
  id v7 = a5;
  if (a5)
  {
    id v19 = 0;
    unint64_t v20 = 0;
    unint64_t v18 = (unint64_t)a5;
    char v21 = 1;
    id v8 = a5;
    a6(&v18);
  }
  else
  {
    unint64_t v10 = 0xF000000000000000;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v14) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_14:
          __break(1u);
          JUMPOUT(0x2214E61E0);
        }
        uint64_t v14 = (int)v14;
LABEL_8:
        if (v14 < 1)
        {
          id v7 = 0;
        }
        else
        {
          sub_2214E5490(a1, a2);
          id v7 = (id)a1;
          unint64_t v10 = a2;
        }
LABEL_11:
        unint64_t v18 = a3 | ((unint64_t)a4 << 8);
        id v19 = v7;
        unint64_t v20 = v10;
        char v21 = 0;
        sub_2214E547C((uint64_t)v7, v10);
        a6(&v18);
        sub_2214E5520((uint64_t)v7, v10);
        sub_2214E5520((uint64_t)v7, v10);
        break;
      case 2uLL:
        uint64_t v16 = *(void *)(a1 + 16);
        uint64_t v15 = *(void *)(a1 + 24);
        BOOL v17 = __OFSUB__(v15, v16);
        uint64_t v14 = v15 - v16;
        if (!v17) {
          goto LABEL_8;
        }
        goto LABEL_14;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v14 = BYTE6(a2);
        goto LABEL_8;
    }
  }
}

void sub_2214E61F0(uint64_t a1, unint64_t a2, unsigned __int8 a3, unsigned __int8 a4, void *a5)
{
  sub_2214E6094(a1, a2, a3, a4, a5, *(void (**)(unint64_t *))(v5 + 16));
}

uint64_t NFCPresentmentIntentAssertion.isValid.getter()
{
  unint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2214E6280(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

unsigned char *sub_2214E6280@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t NFCPresentmentIntentAssertion.deinit()
{
  uint64_t v1 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2214FE920();
  __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
  uint64_t v3 = sub_2214FE900();
  os_log_type_t v4 = sub_2214FEA60();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned __int8 v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl(&dword_2214B8000, v3, v4, "NFCPresentmentIntentAssertion.deinit", v5, 2u);
    MEMORY[0x223C83460](v5, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA10();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NFCPresentmentIntentAssertion.__deallocating_deinit()
{
  NFCPresentmentIntentAssertion.deinit();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_2214E63D0()
{
  *(void *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E6464, 0, 0);
}

uint64_t sub_2214E6464()
{
  v0[4] = *(void *)(v0[2] + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_2214E64FC;
  return sub_2214F8E3C();
}

uint64_t sub_2214E64FC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2214E664C, 0, 0);
  }
}

void sub_2214E664C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(os_unfair_lock_s **)(v0[2] + 24);
  uint64_t v3 = v2 + 4;
  os_log_type_t v4 = v2 + 5;
  os_unfair_lock_lock(v2 + 5);
  sub_2214E67F8(v3);
  if (v1)
  {
    os_unfair_lock_unlock(v4);
  }
  else
  {
    uint64_t v5 = v0[3];
    os_unfair_lock_unlock(v4);
    uint64_t v6 = sub_2214FE9E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    uint64_t v8 = swift_allocObject();
    swift_weakInit();
    unint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v8;
    v9[5] = v7;
    sub_2214E727C(v5, (uint64_t)&unk_267F52940, (uint64_t)v9);
    swift_release();
    sub_2214EBEA4(v5);
    swift_task_dealloc();
    unint64_t v10 = (void (*)(void))v0[1];
    v10();
  }
}

unsigned char *sub_2214E67F8(unsigned char *result)
{
  *__n128 result = 1;
  return result;
}

uint64_t sub_2214E6804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a4;
  v5[14] = a5;
  uint64_t v6 = sub_2214FE8F0();
  v5[15] = v6;
  v5[16] = *(void *)(v6 - 8);
  v5[17] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52950);
  v5[18] = v7;
  v5[19] = *(void *)(v7 - 8);
  v5[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E6924, 0, 0);
}

uint64_t sub_2214E6924()
{
  unint64_t v12 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[21] = Strong;
  if (Strong)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267F52958);
    sub_2214FEA20();
    swift_beginAccess();
    v0[22] = 0;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[23] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2214E6C1C;
    uint64_t v3 = v0[18];
    return MEMORY[0x270FA1F68](v0 + 24, 0, 0, v3);
  }
  else
  {
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2214FE920();
    __swift_project_value_buffer(v4, (uint64_t)qword_267F53C90);
    uint64_t v5 = sub_2214FE900();
    os_log_type_t v6 = sub_2214FEA70();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v11 = v8;
      *(_DWORD *)uint64_t v7 = 136315394;
      v0[11] = sub_2214F9A3C(0x29287472617473, 0xE700000000000000, &v11);
      sub_2214FEAA0();
      *(_WORD *)(v7 + 12) = 2048;
      v0[12] = 62;
      sub_2214FEAA0();
      _os_log_impl(&dword_2214B8000, v5, v6, "%s: %ld:Invalid state", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v8, -1, -1);
      MEMORY[0x223C83460](v7, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_2214E6C1C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2214E6D18, 0, 0);
}

void sub_2214E6D18()
{
  uint64_t v28 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 192);
  if (v1 != 2)
  {
    if (v1)
    {
      if (qword_267F524C0 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_2214FE920();
      __swift_project_value_buffer(v13, (uint64_t)qword_267F53C90);
      uint64_t v14 = sub_2214FE900();
      os_log_type_t v15 = sub_2214FEA50();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        v27[0] = v17;
        *(_DWORD *)uint64_t v16 = 136315394;
        *(void *)(v16 + 4) = sub_2214F9A3C(0x29287472617473, 0xE700000000000000, v27);
        *(_WORD *)(v16 + 12) = 2048;
        *(void *)(v16 + 14) = 79;
        _os_log_impl(&dword_2214B8000, v14, v15, "%s: %ld: cooldown completed", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C83460](v17, -1, -1);
        MEMORY[0x223C83460](v16, -1, -1);
      }

      id v18 = (id)NFSharedSignpostLog();
      if (!v18)
      {
        uint64_t v11 = *(void *)(v0 + 176);
LABEL_27:
        *(void *)(v0 + 176) = v11;
        v25 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v25;
        void *v25 = v0;
        v25[1] = sub_2214E6C1C;
        uint64_t v26 = *(void *)(v0 + 144);
        MEMORY[0x270FA1F68](v0 + 192, 0, 0, v26);
        return;
      }
      id v19 = v18;
      sub_2214FEA90();
      sub_2214FE8E0();
      sub_2214FE8D0();
      uint64_t v11 = *(void *)(v0 + 176);
    }
    else
    {
      if (qword_267F524C0 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_2214FE920();
      __swift_project_value_buffer(v5, (uint64_t)qword_267F53C90);
      os_log_type_t v6 = sub_2214FE900();
      os_log_type_t v7 = sub_2214FEA50();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = swift_slowAlloc();
        v27[0] = v9;
        *(_DWORD *)uint64_t v8 = 136315394;
        *(void *)(v8 + 4) = sub_2214F9A3C(0x29287472617473, 0xE700000000000000, v27);
        *(_WORD *)(v8 + 12) = 2048;
        *(void *)(v8 + 14) = 69;
        _os_log_impl(&dword_2214B8000, v6, v7, "%s: %ld: assertion expired", (uint8_t *)v8, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C83460](v9, -1, -1);
        MEMORY[0x223C83460](v8, -1, -1);
      }

      uint64_t Strong = swift_weakLoadStrong();
      uint64_t v11 = *(void *)(v0 + 176);
      if (Strong)
      {
        uint64_t v12 = *(void *)(Strong + 24);
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 20));
        sub_2214ED51C((unsigned char *)(v12 + 16));
        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 20));
        if (v11) {
          return;
        }
        swift_release();
        swift_release();
      }
      id v21 = (id)NFSharedSignpostLog();
      if (!v21) {
        goto LABEL_27;
      }
      id v19 = v21;
      sub_2214FEA90();
      sub_2214FE8E0();
      sub_2214FE8D0();
    }
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v22 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    goto LABEL_27;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
  swift_beginAccess();
  uint64_t v2 = swift_weakLoadStrong();
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 176);
    uint64_t v4 = *(void *)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v4 + 20));
    sub_2214E7274((unsigned char *)(v4 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
    if (v3) {
      return;
    }
    swift_release();
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v20 = *(void (**)(void))(v0 + 8);
  v20();
}

unsigned char *sub_2214E7274(unsigned char *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t sub_2214E727C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  os_log_type_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214ED25C(a1, (uint64_t)v7);
  uint64_t v8 = sub_2214FE9E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2214EBEA4((uint64_t)v7);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_2214FE9C0();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2214FE9D0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t static NFCPresentmentIntentAssertion.acquire()()
{
  v1[2] = v0;
  uint64_t v2 = sub_2214FE8F0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E7520, 0, 0);
}

uint64_t sub_2214E7520()
{
  id v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = v0[4];
    uint64_t v3 = v0[5];
    uint64_t v5 = v0[3];
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = swift_allocObject();
  v0[6] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527C0);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 20) = 0;
  *(unsigned char *)(v7 + 16) = 0;
  *(void *)(v6 + 24) = v7;
  type metadata accessor for NFCPresentmentSuppressionController(0);
  swift_allocObject();
  *(void *)(v6 + 16) = sub_2214F84F8();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2214E768C;
  return sub_2214E63D0();
}

uint64_t sub_2214E768C()
{
  uint64_t v2 = (void *)*v1;
  v2[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2214E77CC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(uint64_t))v2[1];
    uint64_t v4 = v2[6];
    return v3(v4);
  }
}

uint64_t sub_2214E77CC()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

BOOL static CardSession.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CardSession.Error.hash(into:)()
{
  return sub_2214FEBD0();
}

uint64_t CardSession.Error.hashValue.getter()
{
  return sub_2214FEBE0();
}

BOOL sub_2214E78C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2214E78D4()
{
  return sub_2214FEBD0();
}

uint64_t sub_2214E7900()
{
  return sub_2214ED250(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CardSession.APDU.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_2214E5490(v1, *(void *)(v0 + 80));
  return v1;
}

uint64_t CardSession.APDU.respond(response:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2214E7990, 0, 0);
}

uint64_t sub_2214E7990()
{
  unint64_t v1 = v0[3];
  switch(v1 >> 62)
  {
    case 1uLL:
      if ((int)v0[2] != (uint64_t)v0[2] >> 32) {
        goto LABEL_3;
      }
      return sub_2214FEB20();
    case 2uLL:
      if (*(void *)(v0[2] + 16) == *(void *)(v0[2] + 24)) {
        return sub_2214FEB20();
      }
      goto LABEL_3;
    case 3uLL:
      return sub_2214FEB20();
    default:
      if ((v1 & 0xFF000000000000) == 0) {
        return sub_2214FEB20();
      }
LABEL_3:
      uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v0[4] + 32) + **(int **)(v0[4] + 32));
      uint64_t v2 = (void *)swift_task_alloc();
      v0[5] = v2;
      *uint64_t v2 = v0;
      v2[1] = sub_2214E7B28;
      uint64_t v3 = v0[3];
      uint64_t v4 = v0[4];
      uint64_t v5 = v0[2];
      return v7(v5, v3, v4);
  }
}

uint64_t sub_2214E7B28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

BOOL static CardSession.APDU.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 48) == *(void *)(a2 + 48) && *(void *)(a1 + 64) == *(void *)(a2 + 64);
}

uint64_t CardSession.APDU.deinit()
{
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 48));
  swift_release();
  swift_release();
  sub_2214E5534(*(void *)(v0 + 72), *(void *)(v0 + 80));
  return v0;
}

uint64_t CardSession.APDU.__deallocating_deinit()
{
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 48));
  swift_release();
  swift_release();
  sub_2214E5534(*(void *)(v0 + 72), *(void *)(v0 + 80));

  return MEMORY[0x270FA0228](v0, 88, 7);
}

BOOL sub_2214E7CF8(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)a1 + 48) == *(void *)(*(void *)a2 + 48)
      && *(void *)(*(void *)a1 + 64) == *(void *)(*(void *)a2 + 64);
}

uint64_t _s7CoreNFC29NFCPresentmentIntentAssertionC5ErrorO9hashValueSivg_0()
{
  return sub_2214FEBE0();
}

uint64_t sub_2214E7D74()
{
  return sub_2214FEBE0();
}

uint64_t sub_2214E7DB8()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2214E7DD8, 0, 0);
}

uint64_t sub_2214E7DD8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 24);
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2214E7DFC, v1, 0);
}

uint64_t sub_2214E7DFC()
{
  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(void *)(*(void *)(v0 + 24) + 112) != 0);
}

uint64_t static CardSession.isEligible.getter()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_267F52B98 + dword_267F52B98);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2214E7EC0;
  return v3();
}

uint64_t sub_2214E7EC0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_2214E7FBC()
{
  uint64_t v0 = swift_allocObject();
  *(unsigned char *)(v0 + 16) = 0;
  id v1 = objc_msgSend(self, sel_sharedHardwareManager);
  v5[4] = sub_2214EBB38;
  v5[5] = v0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_2214E80F8;
  v5[3] = &block_descriptor_1;
  uint64_t v2 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_areFeaturesSupported_expiry_completion_, 1, v2, 1.0);
  _Block_release(v2);

  swift_beginAccess();
  uint64_t v3 = *(unsigned __int8 *)(v0 + 16);
  swift_release();
  return v3;
}

void sub_2214E80F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, v6);
  swift_release();
}

uint64_t CardSession.__allocating_init()()
{
  swift_allocObject();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2214E8210;
  return CardSession.init()();
}

uint64_t sub_2214E8210(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t CardSession.init()()
{
  v1[2] = v0;
  uint64_t v2 = sub_2214FE8F0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F527F8);
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  v1[9] = v4;
  v1[10] = *(void *)(v4 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52800);
  v1[13] = v5;
  v1[14] = *(void *)(v5 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E8510, 0, 0);
}

uint64_t sub_2214E8510()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52808);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 20) = 0;
  *(unsigned char *)(v2 + 16) = 0;
  *(void *)(v1 + 16) = v2;
  uint64_t v3 = OBJC_IVAR____TtC7CoreNFC11CardSession__uiString;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52818);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 32) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0xE000000000000000;
  *(void *)(v1 + v3) = v4;
  uint64_t v7 = (uint64_t (*)(void))((char *)&dword_267F52B98 + dword_267F52B98);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2214E860C;
  return v7();
}

uint64_t sub_2214E860C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 160) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2214E870C, 0, 0);
}

uint64_t sub_2214E870C()
{
  if (*(unsigned char *)(v0 + 160) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 120);
    uint64_t v2 = *(void *)(v0 + 128);
    uint64_t v4 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 80);
    uint64_t v17 = *(void *)(v0 + 72);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v16 = *(void *)(v0 + 16);
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F8F580], v9);
    sub_2214FE9F0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
    type metadata accessor for CardSession.EventStream(0);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, v1, v4);
    *(void *)(v16 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStream) = v10;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v11(v16 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v5, v17);
    v11(v18, v5, v17);
    type metadata accessor for NFCCardSession(0);
    swift_allocObject();
    *(void *)(v16 + 24) = sub_2214EECD0(v18);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_2214E8A2C;
    return sub_2214E8D8C();
  }
  else
  {
    sub_2214EBB90();
    swift_allocError();
    unsigned char *v14 = 6;
    swift_willThrow();
    swift_release();
    swift_release();
    type metadata accessor for CardSession(0);
    swift_deallocPartialClassInstance();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t sub_2214E8A2C()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2214E8C9C;
  }
  else {
    uint64_t v2 = sub_2214E8B40;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2214E8B40()
{
  id v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = v0[4];
    uint64_t v3 = v0[5];
    uint64_t v5 = v0[3];
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = v0[16];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[14];
  (*(void (**)(void, void))(v0[10] + 8))(v0[12], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v10 = v0[2];
  return v9(v10);
}

uint64_t sub_2214E8C9C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2214E8D8C()
{
  v1[4] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E8EB0, 0, 0);
}

uint64_t sub_2214E8EB0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_2214E8F44;
  return sub_2214F3858();
}

uint64_t sub_2214E8F44()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2214E9090, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2214E9090()
{
  uint64_t v1 = *(void **)(v0 + 96);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
  if (swift_dynamicCast())
  {
    unint64_t v3 = 0xD00000000000001CLL;
    unint64_t v4 = 0x8000000221504920;
    unsigned int v5 = 0;
    switch(*(unsigned char *)(v0 + 104))
    {
      case 1:
      case 2:
      case 5:
        goto LABEL_5;
      case 3:
        unsigned int v5 = 2;
        goto LABEL_5;
      case 4:
        unsigned int v5 = 1;
        goto LABEL_5;
      case 6:
      case 9:
        unsigned int v5 = 4;
        goto LABEL_5;
      case 7:
        unsigned int v5 = 8;
        goto LABEL_5;
      case 0xA:
        unsigned int v5 = 5;
        goto LABEL_5;
      case 0xB:
        unsigned int v5 = 6;
        goto LABEL_5;
      default:
        uint64_t result = sub_2214FEB20();
        break;
    }
  }
  else
  {
    unsigned int v5 = 0;
LABEL_5:
    uint64_t v6 = *(void **)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v9 = *(void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v12 = *(void *)(v0 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t, unint64_t))(v12 + 16))(v9, *(void *)(v0 + 32) + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v11, v3, v4);
    *(void *)(v0 + 24) = v5 | 0x4000000000000000;
    sub_2214FEA00();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v10);
    sub_2214EBB90();
    swift_allocError();
    *uint64_t v13 = v5;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
  return result;
}

uint64_t sub_2214E9324()
{
  v1[10] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v4 = sub_2214FE8F0();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214E94A4, 0, 0);
}

uint64_t sub_2214E94A4()
{
  os_log_type_t v15 = v0;
  id v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = v0[18];
    uint64_t v3 = v0[19];
    uint64_t v5 = v0[17];
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = (os_unfair_lock_s **)(v0[10] + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  uint64_t v7 = (uint64_t *)&(*v6)[4];
  uint64_t v8 = *v6 + 8;
  swift_retain();
  os_unfair_lock_lock(v8);
  sub_2214EB998(v7, &v13);
  os_unfair_lock_unlock(v8);
  uint64_t v9 = v13;
  uint64_t v10 = v14;
  v0[20] = v14;
  swift_release();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[21] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_2214E9658;
  return sub_2214F5970(v9, v10);
}

uint64_t sub_2214E9658()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2214E98B0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2214E9774;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_2214E9774()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 80);
  swift_beginAccess();
  *(unsigned char *)(v0 + 185) = 1;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(swift_task_alloc() + 16) = v0 + 185;
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
  sub_2214EBC24((unsigned char *)(v3 + 16));
  if (v1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
    swift_task_dealloc();
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(void (**)(void))(v0 + 8);
    v4();
  }
}

uint64_t sub_2214E98B0()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 64) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
  if (swift_dynamicCast())
  {
    unsigned int v3 = 1;
    char v4 = 2;
    switch(*(unsigned char *)(v0 + 184))
    {
      case 1:
      case 2:
      case 5:
        goto LABEL_3;
      case 3:
        goto LABEL_5;
      case 4:
        goto LABEL_4;
      case 6:
      case 9:
        char v4 = 4;
        goto LABEL_5;
      case 7:
        char v4 = 8;
        goto LABEL_5;
      case 0xA:
        char v4 = 5;
        goto LABEL_5;
      case 0xB:
        char v4 = 6;
        goto LABEL_5;
      default:
        uint64_t result = sub_2214FEB20();
        break;
    }
  }
  else
  {
LABEL_3:
    unsigned int v3 = 0;
LABEL_4:
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, *(void *)(v0 + 80) + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v9);
    *(void *)(v0 + 72) = v3 | 0x4000000000000000;
    sub_2214FEA00();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    char v4 = v3;
LABEL_5:
    uint64_t v11 = *(void **)(v0 + 176);
    sub_2214EBB90();
    swift_allocError();
    *uint64_t v12 = v4;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  return result;
}

BOOL static CardSession.EmulationUIStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CardSession.EmulationUIStatus.hash(into:)()
{
  return sub_2214FEBD0();
}

BOOL sub_2214E9BD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2214E9BF0(unsigned char *a1)
{
  *(void *)(v2 + 40) = v1;
  uint64_t v4 = sub_2214FE8F0();
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 56) = *(void *)(v4 - 8);
  *(void *)(v2 + 64) = swift_task_alloc();
  *(unsigned char *)(v2 + 89) = *a1;
  return MEMORY[0x270FA2498](sub_2214E9CBC, 0, 0);
}

uint64_t sub_2214E9CBC()
{
  id v1 = (id)NFSharedSignpostLog();
  int v2 = *(unsigned __int8 *)(v0 + 89);
  if (v1)
  {
    unsigned int v3 = v1;
    uint64_t v4 = *(void *)(v0 + 56);
    sub_2214FEA90();
    sub_2214FE8E0();
    uint64_t v5 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    uint64_t v6 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 48);
    if (v2)
    {
      sub_2214FE8D0();

      (*v5)(v6, v7);
LABEL_5:
      char v8 = 0;
      goto LABEL_8;
    }
    sub_2214FE8D0();

    (*v5)(v6, v7);
  }
  else if (*(unsigned char *)(v0 + 89))
  {
    goto LABEL_5;
  }
  char v8 = 1;
LABEL_8:
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  void *v9 = v0;
  v9[1] = sub_2214E9E34;
  return sub_2214F6714(v8);
}

uint64_t sub_2214E9E34()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_2214EA040;
  }
  else {
    int v2 = sub_2214E9F48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_2214E9F48()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_beginAccess();
  *(unsigned char *)(v0 + 88) = 0;
  unsigned int v3 = *(os_unfair_lock_s **)(v2 + 16);
  *(void *)(swift_task_alloc() + 16) = v0 + 88;
  uint64_t v4 = v3 + 4;
  v3 += 5;
  os_unfair_lock_lock(v3);
  sub_2214ED538(v4);
  os_unfair_lock_unlock(v3);
  if (!v1)
  {
    swift_task_dealloc();
    swift_endAccess();
    swift_task_dealloc();
    uint64_t v5 = *(void (**)(void))(v0 + 8);
    v5();
  }
}

uint64_t sub_2214EA040()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214EA0A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 20));
  sub_2214EB9B8((unsigned char *)(v4 + 16), &v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
  BOOL v5 = v11;
  uint64_t result = swift_release();
  if (!v5)
  {
    uint64_t v7 = *(void *)(v1 + 24);
    uint64_t v8 = sub_2214FE9E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = 0;
    *(void *)(v9 + 24) = 0;
    *(void *)(v9 + 32) = v7;
    *(unsigned char *)(v9 + 40) = 0;
    swift_retain();
    sub_2214EB610((uint64_t)v3, (uint64_t)&unk_267F52AF0, v9);
    return swift_release();
  }
  return result;
}

uint64_t CardSession.EventStream.makeAsyncIterator()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52858);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52800);
  sub_2214FEA20();
  type metadata accessor for CardSession.EventStream.Iterator(0);
  uint64_t v4 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v4 + OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, v3, v0);
  return v4;
}

uint64_t sub_2214EA31C(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_2214EA33C, 0, 0);
}

uint64_t sub_2214EA33C()
{
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52858);
  void *v1 = v0;
  v1[1] = sub_2214EA408;
  uint64_t v3 = *(void *)(v0 + 40);
  return MEMORY[0x270FA1F70](v3, v2);
}

uint64_t sub_2214EA408()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t CardSession.EventStream.Iterator.deinit()
{
  return sub_2214EA804(&OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, &qword_267F52858);
}

uint64_t CardSession.EventStream.Iterator.__deallocating_deinit()
{
  return sub_2214EA878(&OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, &qword_267F52858);
}

uint64_t sub_2214EA534(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = *v1;
  return MEMORY[0x270FA2498](sub_2214EA33C, 0, 0);
}

uint64_t sub_2214EA55C(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v2;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v4 = sub_2214FE9C0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return MEMORY[0x270FA2498](sub_2214EA5F8, v4, v6);
}

uint64_t sub_2214EA5F8()
{
  *(void *)(v0 + 56) = **(void **)(v0 + 48);
  return MEMORY[0x270FA2498](sub_2214EA620, 0, 0);
}

uint64_t sub_2214EA620()
{
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52858);
  void *v1 = v0;
  v1[1] = sub_2214EA6EC;
  uint64_t v3 = *(void *)(v0 + 40);
  return MEMORY[0x270FA1F70](v3, v2);
}

uint64_t sub_2214EA6EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t CardSession.EventStream.deinit()
{
  return sub_2214EA804(&OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, &qword_267F52800);
}

uint64_t sub_2214EA804(void *a1, uint64_t *a2)
{
  uint64_t v3 = v2 + *a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v2;
}

uint64_t CardSession.EventStream.__deallocating_deinit()
{
  return sub_2214EA878(&OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, &qword_267F52800);
}

uint64_t sub_2214EA878(void *a1, uint64_t *a2)
{
  uint64_t v3 = v2 + *a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v2 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v2 + 52);

  return MEMORY[0x270FA0228](v2, v5, v6);
}

uint64_t sub_2214EA914@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52858);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52800);
  sub_2214FEA20();
  type metadata accessor for CardSession.EventStream.Iterator(0);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, v5, v2);
  uint64_t result = swift_release();
  *a1 = v6;
  return result;
}

uint64_t sub_2214EAA30@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (os_unfair_lock_s **)(*a1 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = (uint64_t *)&(*v3)[4];
  swift_retain();
  os_unfair_lock_lock(v4 + 8);
  sub_2214EB998(v5, v9);
  os_unfair_lock_unlock(v4 + 8);
  uint64_t v6 = v9[0];
  uint64_t v7 = v9[1];
  uint64_t result = swift_release();
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_2214EAAD4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  sub_2214EB998((uint64_t *)(v2 + 16), &v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  uint64_t v3 = v5;
  swift_release();
  return v3;
}

uint64_t sub_2214EAB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v18[0] = a1;
  v18[1] = a2;
  uint64_t v9 = *v8;
  uint64_t v17 = v18;
  uint64_t v10 = v9 + 4;
  BOOL v11 = v9 + 8;
  os_unfair_lock_lock(v9 + 8);
  sub_2214EBD58(v10);
  os_unfair_lock_unlock(v11);
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v12 = *(void *)(v3 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 20));
  sub_2214E6280((unsigned char *)(v12 + 16), v18);
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 20));
  LODWORD(a2) = LOBYTE(v18[0]);
  uint64_t result = swift_release();
  if (a2 == 1)
  {
    uint64_t v14 = sub_2214FE9E0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    void v15[4] = v3;
    swift_retain();
    sub_2214EB040((uint64_t)v7, (uint64_t)&unk_267F52878, (uint64_t)v15);
    swift_release();
    return sub_2214EBEA4((uint64_t)v7);
  }
  return result;
}

uint64_t sub_2214EAD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  return MEMORY[0x270FA2498](sub_2214EAD6C, 0, 0);
}

uint64_t sub_2214EAD6C()
{
  uint64_t v10 = v0;
  uint64_t v1 = (os_unfair_lock_s **)(v0[5] + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = (uint64_t *)&(*v1)[4];
  swift_retain();
  os_unfair_lock_lock(v2 + 8);
  sub_2214EB998(v3, &v8);
  os_unfair_lock_unlock(v2 + 8);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  v0[6] = v9;
  swift_release();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2214EAEA0;
  return sub_2214F3290(v4, v5);
}

uint64_t sub_2214EAEA0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2214EAFDC, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2214EAFDC()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214EB040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214ED25C(a1, (uint64_t)v6);
  uint64_t v7 = sub_2214FE9E0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2214EBEA4((uint64_t)v6);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_2214FE9D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v9 = sub_2214FE9C0();
  uint64_t v11 = v10;
  swift_unknownObjectRelease();
  if (v11 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v11;
  }
  return swift_task_create();
}

void (*sub_2214EB200(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  uint64_t v4 = (os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = (uint64_t *)&(*v4)[4];
  swift_retain();
  os_unfair_lock_lock(v5 + 8);
  sub_2214EB998(v6, v10);
  os_unfair_lock_unlock(v5 + 8);
  uint64_t v7 = v10[0];
  uint64_t v8 = v10[1];
  swift_release();
  v3[3] = v7;
  v3[4] = v8;
  return sub_2214EB2D0;
}

void sub_2214EB2D0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2214EAB6C(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2214EAB6C(*(void *)(*(void *)a1 + 24), v4);
  }

  free(v2);
}

uint64_t sub_2214EB348()
{
  return swift_retain();
}

uint64_t CardSession.deinit()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t CardSession.__deallocating_deinit()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t CardSession.APDU.debugDescription.getter()
{
  uint64_t v1 = v0;
  sub_2214FEAD0();
  swift_bridgeObjectRelease();
  sub_2214FE980();
  swift_bridgeObjectRelease();
  sub_2214FE980();
  uint64_t v3 = *(void *)(v0 + 72);
  unint64_t v2 = *(void *)(v1 + 80);
  sub_2214E5490(v3, v2);
  sub_2214FE870();
  sub_2214E5534(v3, v2);
  sub_2214FE980();
  swift_bridgeObjectRelease();
  sub_2214FE980();
  return 0x646E6F707365527BLL;
}

uint64_t sub_2214EB5EC()
{
  return CardSession.APDU.debugDescription.getter();
}

uint64_t sub_2214EB610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2214FE9E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2214FE9D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2214EBEA4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2214FE9C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2214EB7B4(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  *unint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2214EB7C4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2214EB8A0;
  return v6(a1);
}

uint64_t sub_2214EB8A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2214EB998@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

unsigned char *sub_2214EB9B8@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  int v2 = *result;
  if (v2 != 2) {
    *uint64_t result = 2;
  }
  *a2 = v2 == 2;
  return result;
}

uint64_t sub_2214EB9DC(uint64_t a1, char a2, char a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 72);
    unint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 16);
    type metadata accessor for CardSession.APDU();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)(a1 + 24);
    *(void *)(v10 + 40) = v8;
    *(void *)(v10 + 48) = v5;
    *(void *)(v10 + 72) = v6;
    *(void *)(v10 + 80) = v7;
    sub_2214E5490(v6, v7);
    swift_retain_n();
    swift_retain_n();
    sub_2214E5490(v6, v7);
    uint64_t v11 = sub_2214FE8A0();
    swift_release();
    swift_release();
    sub_2214E5534(v6, v7);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    type metadata accessor for CardSession.APDU();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = nullsub_1;
    *(void *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = &unk_267F52920;
    *(void *)(v10 + 40) = 0;
    *(void *)(v10 + 48) = v5;
    *(_OWORD *)(v10 + 72) = xmmword_221500FF0;
  }
  *(void *)(v10 + 64) = v11;
  *(unsigned char *)(v10 + 56) = a2 & 1;
  return v10;
}

uint64_t sub_2214EBB28()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2214EBB38(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_2214EBB90()
{
  unint64_t result = qword_267F52B70;
  if (!qword_267F52B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52B70);
  }
  return result;
}

uint64_t type metadata accessor for CardSession(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F528B0);
}

uint64_t type metadata accessor for CardSession.EventStream(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F528E0);
}

unsigned char *sub_2214EBC24(unsigned char *result)
{
  *unint64_t result = **(unsigned char **)(v1 + 16);
  return result;
}

uint64_t sub_2214EBC34()
{
  return objectdestroy_16Tm(41);
}

uint64_t sub_2214EBC3C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2214ED500;
  return sub_2214F4224(a1, v4, v5, v6, v7);
}

uint64_t type metadata accessor for CardSession.EventStream.Iterator(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F528F8);
}

uint64_t sub_2214EBD20(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2214EBD58(void *a1)
{
  uint64_t v3 = *(uint64_t **)(v1 + 16);
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2214EBDA4()
{
  return objectdestroy_16Tm(40);
}

uint64_t objectdestroy_16Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2214EBDF8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2214ED500;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_2214EAD6C, 0, 0);
}

uint64_t sub_2214EBEA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2214EBF08()
{
  unint64_t result = qword_267F52880;
  if (!qword_267F52880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52880);
  }
  return result;
}

unint64_t sub_2214EBF60()
{
  unint64_t result = qword_267F52888;
  if (!qword_267F52888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52888);
  }
  return result;
}

unint64_t sub_2214EBFB8()
{
  unint64_t result = qword_267F52890[0];
  if (!qword_267F52890[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267F52890);
  }
  return result;
}

uint64_t sub_2214EC00C()
{
  return MEMORY[0x263F8E4E0];
}

unint64_t sub_2214EC01C()
{
  unint64_t result = qword_267F528A8;
  if (!qword_267F528A8)
  {
    type metadata accessor for CardSession.EventStream.Iterator(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F528A8);
  }
  return result;
}

uint64_t sub_2214EC078(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2214EAB6C(v1, v2);
}

uint64_t type metadata accessor for NFCPresentmentIntentAssertion()
{
  return self;
}

uint64_t method lookup function for NFCPresentmentIntentAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NFCPresentmentIntentAssertion);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCPresentmentIntentAssertion.Error()
{
  return &type metadata for NFCPresentmentIntentAssertion.Error;
}

uint64_t sub_2214EC11C()
{
  return type metadata accessor for CardSession(0);
}

void sub_2214EC124()
{
  sub_2214ED00C(319, &qword_267F52AB0, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CardSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CardSession);
}

uint64_t dispatch thunk of CardSession.isEmulationInProgress.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 144) + **(int **)(*(void *)v0 + 144));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2214ED4FC;
  return v4();
}

uint64_t dispatch thunk of static CardSession.isSupported.getter()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of CardSession.__allocating_init()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v0 + 160) + **(int **)(v0 + 160));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2214EC3E0;
  return v4();
}

uint64_t sub_2214EC3E0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of CardSession.startEmulation()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 176) + **(int **)(*(void *)v0 + 176));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2214ED500;
  return v4();
}

uint64_t dispatch thunk of CardSession.stopEmulation(status:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 184) + **(int **)(*(void *)v1 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2214EC6D4;
  return v6(a1);
}

uint64_t sub_2214EC6D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of CardSession.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CardSession.alertMessage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of CardSession.alertMessage.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of CardSession.alertMessage.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of CardSession.eventStream.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t getEnumTagSinglePayload for CardSession.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CardSession.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2214EC9F8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CardSession.Error()
{
  return &type metadata for CardSession.Error;
}

unint64_t *initializeBufferWithCopyOfBuffer for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2214ECA64(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_2214ECA64(unint64_t result)
{
  if (!(result >> 62)) {
    return swift_retain();
  }
  return result;
}

unint64_t destroy for CardSession.Event(unint64_t *a1)
{
  return sub_2214ECA7C(*a1);
}

unint64_t sub_2214ECA7C(unint64_t result)
{
  if (!(result >> 62)) {
    return swift_release();
  }
  return result;
}

unint64_t *assignWithCopy for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2214ECA64(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_2214ECA7C(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_2214ECA7C(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for CardSession.Event(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xE && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 14);
  }
  unsigned int v3 = (((*(void *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xD) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CardSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xD)
  {
    *(void *)unint64_t result = a2 - 14;
    if (a3 >= 0xE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_2214ECBA8(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return *a1 + 2;
  }
}

void *sub_2214ECBC0(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_2214ECBD0(void *result, uint64_t a2)
{
  if (a2 < 2) {
    *unint64_t result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  }
  else {
    *unint64_t result = (a2 - 2) | 0x8000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for CardSession.Event()
{
  return &type metadata for CardSession.Event;
}

uint64_t type metadata accessor for CardSession.APDU()
{
  return self;
}

uint64_t method lookup function for CardSession.APDU(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CardSession.APDU);
}

uint64_t getEnumTagSinglePayload for NFCPresentmentSuppressionController.Event(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7CoreNFC29NFCPresentmentIntentAssertionC5ErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2214ECDA0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_2214ECDC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2214ECDD0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.EmulationUIStatus()
{
  return &type metadata for CardSession.EmulationUIStatus;
}

uint64_t sub_2214ECDEC()
{
  return type metadata accessor for CardSession.EventStream(0);
}

void sub_2214ECDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t method lookup function for CardSession.EventStream(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CardSession.EventStream);
}

uint64_t sub_2214ECE2C()
{
  return type metadata accessor for CardSession.EventStream.Iterator(0);
}

void sub_2214ECE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2214ECE54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(void, ValueMetadata *))
{
  sub_2214ED00C(319, a4, a5);
  if (v5 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CardSession.EventStream.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CardSession.EventStream.Iterator);
}

uint64_t dispatch thunk of CardSession.EventStream.Iterator.next()(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_2214EC6D4;
  return v6(a1);
}

void sub_2214ED00C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for CardSession.Event);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for CardSession.SessionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CardSession.SessionState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2214ED1B8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_2214ED1E0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.SessionState()
{
  return &type metadata for CardSession.SessionState;
}

unint64_t sub_2214ED1FC()
{
  unint64_t result = qword_267F52918;
  if (!qword_267F52918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52918);
  }
  return result;
}

uint64_t sub_2214ED250(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2214ED25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2214ED2C4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2214ED500;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F52928 + dword_267F52928);
  return v6(a1, v4);
}

uint64_t sub_2214ED37C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214ED3B4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2214ED3FC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2214ED500;
  return sub_2214E6804(a1, v4, v5, v7, v6);
}

uint64_t sub_2214ED4BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

unsigned char *sub_2214ED51C(unsigned char *a1)
{
  return sub_2214E7274(a1);
}

unsigned char *sub_2214ED538(unsigned char *a1)
{
  return sub_2214EBC24(a1);
}

uint64_t sub_2214ED554(void *a1)
{
  uint64_t v2 = (void *)sub_2214FE860();
  id v3 = objc_msgSend(v2, sel_domain);
  uint64_t v4 = sub_2214FE960();
  uint64_t v6 = v5;

  uint64_t v7 = sub_2214FE940();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v4 != v7 || v8 != v6)
  {
    char v10 = sub_2214FEB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_11;
    }
LABEL_9:

    return 6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  unint64_t v11 = (unint64_t)objc_msgSend(v2, sel_code);

  if ((v11 & 0x8000000000000000) == 0 && !HIDWORD(v11)) {
    return v11;
  }
  uint64_t result = sub_2214FEB10();
  __break(1u);
  return result;
}

uint64_t sub_2214ED6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for XPCSession()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2214ED710(void *a1)
{
  return sub_2214ED720(a1);
}

uint64_t sub_2214ED718(void *a1)
{
  return sub_2214ED720(a1);
}

uint64_t sub_2214ED720(void *a1)
{
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2214FE920();
  __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
  id v3 = a1;
  id v4 = a1;
  uint64_t v5 = sub_2214FE900();
  os_log_type_t v6 = sub_2214FEA70();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = v9;
    *(_DWORD *)uint64_t v7 = 136315650;
    sub_2214F9A3C(0xD000000000000015, 0x8000000221504C80, &v15);
    sub_2214FEAA0();
    *(_WORD *)(v7 + 12) = 2048;
    sub_2214FEAA0();
    *(_WORD *)(v7 + 22) = 2112;
    id v10 = a1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    sub_2214FEAA0();
    *uint64_t v8 = v14;

    _os_log_impl(&dword_2214B8000, v5, v6, "%s:%ld: xpcError=%@", (uint8_t *)v7, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F529E0);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v9, -1, -1);
    MEMORY[0x223C83460](v7, -1, -1);
  }
  else
  {
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
  swift_allocError();
  *unint64_t v11 = a1;
  id v12 = a1;
  return swift_continuation_throwingResumeWithError();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_2214ED9E4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2214EDA4C(char a1)
{
  return sub_2214EE1B4(a1, 0xD000000000000010, 0x8000000221505210, 25, "%s:%ld: fieldChange=%{BOOL}d");
}

uint64_t sub_2214EDC14()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v11[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2214FE920();
  __swift_project_value_buffer(v4, (uint64_t)qword_267F53C90);
  uint64_t v5 = sub_2214FE900();
  os_log_type_t v6 = sub_2214FEA60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v11[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v10 = sub_2214F9A3C(0xD000000000000014, 0x80000002215051F0, v11);
    sub_2214FEAA0();
    *(_WORD *)(v7 + 12) = 2048;
    uint64_t v10 = 34;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v5, v6, "%s:%ld:", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v8, -1, -1);
    MEMORY[0x223C83460](v7, -1, -1);
  }

  v11[0] = 0;
  v11[1] = 0;
  char v12 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2214EDECC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2214FE920();
  __swift_project_value_buffer(v4, (uint64_t)qword_267F53C90);
  uint64_t v5 = sub_2214FE900();
  os_log_type_t v6 = sub_2214FEA60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(void *)&long long v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v11 = sub_2214F9A3C(0xD000000000000019, 0x80000002215051D0, (uint64_t *)&v12);
    sub_2214FEAA0();
    *(_WORD *)(v7 + 12) = 2048;
    uint64_t v11 = 39;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v5, v6, "%s:%ld:", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v8, -1, -1);
    MEMORY[0x223C83460](v7, -1, -1);
  }

  long long v12 = xmmword_2215014E0;
  char v13 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2214EE18C(char a1)
{
  return sub_2214EE1B4(a1, 0xD000000000000012, 0x80000002215051B0, 44, "%s:%ld: fieldPresent=%{BOOL}d");
}

uint64_t sub_2214EE1B4(char a1, uint64_t a2, unint64_t a3, uint64_t a4, const char *a5)
{
  unint64_t v25 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  long long v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2214FE920();
  __swift_project_value_buffer(v13, (uint64_t)qword_267F53C90);
  uint64_t v14 = sub_2214FE900();
  os_log_type_t v15 = sub_2214FEA60();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = a4;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v10;
    uint64_t v19 = v18;
    v27[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315650;
    uint64_t v23 = a5;
    uint64_t v26 = sub_2214F9A3C(a2, v25, v27);
    sub_2214FEAA0();
    *(_WORD *)(v17 + 12) = 2048;
    uint64_t v26 = v22;
    sub_2214FEAA0();
    *(_WORD *)(v17 + 22) = 1024;
    LODWORD(v26) = a1 & 1;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v14, v15, v23, (uint8_t *)v17, 0x1Cu);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    uint64_t v10 = v24;
    MEMORY[0x223C83460](v20, -1, -1);
    MEMORY[0x223C83460](v17, -1, -1);
  }

  v27[0] = a1 & 1;
  v27[1] = 0;
  char v28 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2214EE4C8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = a1;
    int v9 = sub_2214ED554(a1);
    BOOL v11 = v9 != 32 && v9 != 8;
    uint64_t v12 = OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation;
    if (*(void *)(v2
                   + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation))
    {
      sub_2214F7B70();
      uint64_t v13 = swift_allocError();
      unsigned char *v14 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
      swift_allocError();
      *os_log_type_t v15 = v13;
      swift_continuation_throwingResumeWithError();
    }
    *(void *)(v2 + v12) = 0;
    *(void *)&long long v17 = v11;
    *((void *)&v17 + 1) = 0x2000000000000000;
    char v18 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
    sub_2214FEA00();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    long long v17 = xmmword_2215014F0;
    char v18 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
    sub_2214FEA00();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t result = *(void *)(v2
                       + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation);
    if (result) {
      return swift_continuation_throwingResume();
    }
  }
  return result;
}

uint64_t sub_2214EE850(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = a1;
  int v7 = sub_2214ED554(a1);
  uint64_t v8 = 2;
  if (v7 == 5) {
    uint64_t v8 = 3;
  }
  if (v7 == 48) {
    uint64_t v8 = 4;
  }
  v10[1] = v8;
  v10[2] = 0x3000000000000000;
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_2214FEA10();
}

id sub_2214EEB44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NFCCardSessionDelegate(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2214EEBEC()
{
  return type metadata accessor for NFCCardSessionDelegate(0);
}

uint64_t type metadata accessor for NFCCardSessionDelegate(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F52A08);
}

void sub_2214EEC14()
{
  sub_2214F7124(319, &qword_267F52A18, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *sub_2214EECD0(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B90);
  uint64_t v2 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B40);
  uint64_t v9 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388]();
  char v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v1[14] = 0;
  v1[15] = 0;
  v1[16] = 0;
  *(void *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer) = 0;
  *(void *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationTimeLimit) = 0x404E000000000000;
  *(void *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = 0;
  uint64_t v12 = (char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  uint64_t v13 = *(void *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, v24, v23);
  uint64_t v14 = v22;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v22);
  sub_2214FE9F0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStream, v11, v21);
  os_log_type_t v15 = (char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation, v8, v5);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v8, v15, v5);
  long long v17 = (objc_class *)type metadata accessor for NFCCardSessionDelegate(0);
  char v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = 0;
  v16(&v18[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation], v8, v5);
  v25.receiver = v18;
  v25.super_class = v17;
  id v19 = objc_msgSendSuper2(&v25, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v1[17] = v19;
  sub_2214F1700();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v24, v23);
  return v1;
}

uint64_t sub_2214EF08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[31] = a3;
  v4[32] = v3;
  v4[29] = a1;
  v4[30] = a2;
  uint64_t v5 = sub_2214FE8F0();
  v4[33] = v5;
  v4[34] = *(void *)(v5 - 8);
  v4[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214EF150, v3, 0);
}

uint64_t sub_2214EF150()
{
  uint64_t v22 = v0;
  id v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = v0[34];
    uint64_t v3 = v0[35];
    uint64_t v5 = v0[33];
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = v0[32];
  uint64_t v7 = *(void *)(v6 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  if (!v7
    || (uint64_t v8 = v0[31], *(void *)(v8 + 48) == *(void *)(v7 + 48))
    && *(void *)(v8 + 64) == *(void *)(v7 + 64)
    && *(unsigned char *)(v7 + 56) != 1)
  {
    uint64_t v16 = *(void *)(v6 + 112);
    v0[36] = v16;
    if (v16)
    {
      unint64_t v17 = v0[30];
      uint64_t v18 = v0[29];
      swift_unknownObjectRetain();
      sub_2214E5490(v18, v17);
      swift_retain();
      swift_retain();
      return MEMORY[0x270FA2498](sub_2214EF51C, 0, 0);
    }
    else
    {
      sub_2214EBB90();
      swift_allocError();
      unsigned char *v19 = 0;
      swift_willThrow();
      swift_task_dealloc();
      uint64_t v20 = (uint64_t (*)(void))v0[1];
      return v20();
    }
  }
  else
  {
    uint64_t v9 = qword_267F524C0;
    swift_retain();
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2214FE920();
    __swift_project_value_buffer(v10, (uint64_t)qword_267F53C90);
    char v11 = sub_2214FE900();
    os_log_type_t v12 = sub_2214FEA60();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v21[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      v0[27] = sub_2214F9A3C(0xD00000000000001FLL, 0x8000000221505170, v21);
      sub_2214FEAA0();
      *(_WORD *)(v13 + 12) = 2048;
      v0[28] = 221;
      sub_2214FEAA0();
      _os_log_impl(&dword_2214B8000, v11, v12, "%s:%ld: Unexpected APDU)", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v14, -1, -1);
      MEMORY[0x223C83460](v13, -1, -1);
    }

    v21[0] = 0;
    v21[1] = 0xE000000000000000;
    sub_2214FEAD0();
    swift_bridgeObjectRelease();
    return sub_2214FEB20();
  }
}

uint64_t sub_2214EF51C()
{
  id v1 = v0;
  uint64_t v2 = v0 + 2;
  uint64_t v3 = (void *)v0[36];
  uint64_t v4 = v0[32];
  uint64_t v16 = v0[31];
  uint64_t v6 = v0[29];
  unint64_t v5 = v0[30];
  v0[2] = v0;
  v0[3] = sub_2214EF7C4;
  uint64_t v7 = swift_continuation_init();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v0[14] = sub_2214F8018;
  v0[15] = v8;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2214ED9E4;
  v0[13] = &block_descriptor_113;
  uint64_t v9 = _Block_copy(v0 + 10);
  swift_release();
  id v10 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);
  sub_2214FEAC0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52B00);
  swift_dynamicCast();
  char v11 = (void *)v1[26];
  os_log_type_t v12 = (void *)sub_2214FE880();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v7;
  v13[3] = v4;
  void v13[4] = v16;
  v13[5] = v6;
  v13[6] = v5;
  v1[20] = sub_2214F7F44;
  v1[21] = v13;
  v1[16] = MEMORY[0x263EF8330];
  v1[17] = 1107296256;
  v1[18] = sub_2214FA280;
  v1[19] = &block_descriptor_119;
  uint64_t v14 = _Block_copy(v1 + 16);
  sub_2214E5490(v6, v5);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_sendAPDU_completion_, v12, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();

  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2214EF7C4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 296) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 256);
    swift_willThrow();
    uint64_t v4 = sub_2214EF9D8;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = sub_2214EF8F0;
    uint64_t v5 = 0;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2214EF8F0()
{
  uint64_t v1 = v0[32];
  sub_2214E5534(v0[29], v0[30]);
  swift_release();
  swift_release();
  return MEMORY[0x270FA2498](sub_2214EF96C, v1, 0);
}

uint64_t sub_2214EF96C()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214EF9D8()
{
  sub_2214E5534(v0[29], v0[30]);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

void sub_2214EFA6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a1)
  {
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2214FE920();
    __swift_project_value_buffer(v7, (uint64_t)qword_267F53C90);
    id v8 = a1;
    id v9 = a1;
    id v10 = sub_2214FE900();
    os_log_type_t v11 = sub_2214FEA60();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v33 = v13;
      *(_DWORD *)uint64_t v12 = 136315650;
      sub_2214F9A3C(0xD00000000000001FLL, 0x8000000221505170, &v33);
      sub_2214FEAA0();
      *(_WORD *)(v12 + 12) = 2048;
      sub_2214FEAA0();
      *(_WORD *)(v12 + 22) = 2080;
      id v14 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B78);
      uint64_t v15 = sub_2214FE970();
      sub_2214F9A3C(v15, v16, &v33);
      sub_2214FEAA0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2214B8000, v10, v11, "%s:%ld: error=%s", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v13, -1, -1);
      MEMORY[0x223C83460](v12, -1, -1);
    }
    else
    {
    }
    sub_2214EBB90();
    uint64_t v29 = swift_allocError();
    unsigned char *v30 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
    swift_allocError();
    uint64_t *v31 = v29;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    uint64_t v20 = swift_retain();
    uint64_t v21 = sub_2214EB9DC(v20, 1, 1);
    swift_release();
    *(void *)(a3 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = v21;
    swift_release();
    swift_continuation_throwingResume();
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_2214FE920();
    __swift_project_value_buffer(v22, (uint64_t)qword_267F53C90);
    sub_2214E5490(a5, a6);
    sub_2214E5490(a5, a6);
    oslog = sub_2214FE900();
    os_log_type_t v23 = sub_2214FEA60();
    if (os_log_type_enabled(oslog, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v33 = v25;
      *(_DWORD *)uint64_t v24 = 136315650;
      sub_2214F9A3C(0xD00000000000001FLL, 0x8000000221505170, &v33);
      sub_2214FEAA0();
      *(_WORD *)(v24 + 12) = 2048;
      sub_2214FEAA0();
      *(_WORD *)(v24 + 22) = 2080;
      sub_2214E5490(a5, a6);
      uint64_t v26 = sub_2214FE870();
      unint64_t v28 = v27;
      sub_2214E5534(a5, a6);
      sub_2214F9A3C(v26, v28, &v33);
      sub_2214FEAA0();
      swift_bridgeObjectRelease();
      sub_2214E5534(a5, a6);
      sub_2214E5534(a5, a6);
      _os_log_impl(&dword_2214B8000, oslog, v23, "%s:%ld: sent=%s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v25, -1, -1);
      MEMORY[0x223C83460](v24, -1, -1);
    }
    else
    {
      sub_2214E5534(a5, a6);
      sub_2214E5534(a5, a6);
    }
  }
}

uint64_t sub_2214EFFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = a5;
  return MEMORY[0x270FA2498](sub_2214EFFC4, 0, 0);
}

uint64_t sub_2214EFFC4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 88) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_2214F0084, Strong, 0);
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_2214F0084()
{
  *(void *)(v0 + 96) = *(void *)(*(void *)(v0 + 88) + 112);
  return MEMORY[0x270FA2498](sub_2214F00AC, 0, 0);
}

uint64_t sub_2214F00AC()
{
  id v10 = v0;
  if (v0[12])
  {
    uint64_t v1 = v0[11];
    return MEMORY[0x270FA2498](sub_2214F02F4, v1, 0);
  }
  else
  {
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2214FE920();
    __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
    uint64_t v3 = sub_2214FE900();
    os_log_type_t v4 = sub_2214FEA60();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v9 = v6;
      *(_DWORD *)uint64_t v5 = 136315394;
      v0[5] = sub_2214F9A3C(0xD000000000000021, 0x80000002215050D0, &v9);
      sub_2214FEAA0();
      *(_WORD *)(v5 + 12) = 2048;
      v0[6] = 256;
      sub_2214FEAA0();
      _os_log_impl(&dword_2214B8000, v3, v4, "%s:%ld: Emulation has not started", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v6, -1, -1);
      MEMORY[0x223C83460](v5, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_2214F02F4()
{
  *(void *)(v0 + 104) = *(void *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  swift_retain();
  return MEMORY[0x270FA2498](sub_2214F0370, 0, 0);
}

uint64_t sub_2214F0370()
{
  uint64_t v12 = v0;
  uint64_t v1 = v0[13];
  if (!v1)
  {
LABEL_5:
    swift_release();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  if (*(void *)(v1 + 48) != v0[10] || (*(unsigned char *)(v1 + 56) & 1) != 0)
  {
    swift_release();
    goto LABEL_5;
  }
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2214FE920();
  __swift_project_value_buffer(v4, (uint64_t)qword_267F53C90);
  uint64_t v5 = sub_2214FE900();
  os_log_type_t v6 = sub_2214FEA60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[7] = sub_2214F9A3C(0xD000000000000021, 0x80000002215050D0, &v11);
    sub_2214FEAA0();
    *(_WORD *)(v7 + 12) = 2048;
    v0[8] = 265;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v5, v6, "%s:%ld: Stopping emulation", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v8, -1, -1);
    MEMORY[0x223C83460](v7, -1, -1);
  }

  uint64_t v9 = swift_task_alloc();
  v0[14] = v9;
  *(void *)uint64_t v9 = v0;
  *(void *)(v9 + 8) = sub_2214F060C;
  uint64_t v10 = v0[11];
  *(void *)(v9 + 160) = v10;
  *(unsigned char *)(v9 + 184) = 0;
  return MEMORY[0x270FA2498](sub_2214F6738, v10, 0);
}

uint64_t sub_2214F060C()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2214F0790;
  }
  else {
    uint64_t v2 = sub_2214F0720;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2214F0720()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F0790()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F0800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2214FE9E0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2214FE9D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2214EBEA4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2214FE9C0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2214F0980(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_2214FE8F0();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214F0AA4, v2, 0);
}

uint64_t sub_2214F0AA4()
{
  id v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = v0[12];
    uint64_t v3 = v0[13];
    uint64_t v5 = v0[11];
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = v0[7];
  uint64_t v7 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU;
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  if (v8 && (*(unsigned char *)(v8 + 56) & 1) == 0)
  {
    swift_retain();
    sub_2214FEAD0();
    swift_bridgeObjectRelease();
    v0[4] = 276;
    sub_2214FEB50();
    sub_2214FE980();
    swift_bridgeObjectRelease();
    sub_2214FE980();
    return sub_2214FEB20();
  }
  else
  {
    uint64_t v10 = v0[9];
    uint64_t v9 = v0[10];
    uint64_t v21 = v0[8];
    uint64_t v12 = v0[5];
    unint64_t v11 = v0[6];
    uint64_t v13 = swift_allocObject();
    swift_weakInit();
    v0[2] = 0;
    sub_2214E5490(v12, v11);
    swift_retain();
    swift_retain();
    MEMORY[0x223C83470](v0 + 2, 8);
    uint64_t v14 = v0[2];
    type metadata accessor for CardSession.APDU();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_2214F7E30;
    *(void *)(v15 + 24) = v6;
    *(void *)(v15 + 32) = &unk_267F52B58;
    *(void *)(v15 + 40) = v13;
    *(void *)(v15 + 48) = v14;
    *(void *)(v15 + 72) = v12;
    *(void *)(v15 + 80) = v11;
    sub_2214E5490(v12, v11);
    swift_retain();
    swift_retain();
    uint64_t v16 = sub_2214FE8A0();
    swift_release();
    swift_release();
    sub_2214E5534(v12, v11);
    *(void *)(v15 + 64) = v16;
    *(unsigned char *)(v15 + 56) = 0;
    swift_release();
    uint64_t v17 = swift_retain();
    uint64_t v18 = sub_2214EB9DC(v17, 0, 1);
    swift_release();
    *(void *)(v6 + v7) = v18;
    swift_release();
    v0[3] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
    sub_2214FEA00();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v21);
    swift_task_dealloc();
    swift_task_dealloc();
    id v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_2214F0E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  return MEMORY[0x270FA2498](sub_2214F0E38, 0, 0);
}

uint64_t sub_2214F0E38()
{
  uint64_t v14 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[11] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[12] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2214F10B8;
    uint64_t v3 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[7];
    return sub_2214EF08C(v5, v3, v4);
  }
  else
  {
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2214FE920();
    __swift_project_value_buffer(v7, (uint64_t)qword_267F53C90);
    uint64_t v8 = sub_2214FE900();
    os_log_type_t v9 = sub_2214FEA60();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      v0[5] = sub_2214F9A3C(0xD000000000000015, 0x8000000221505100, &v13);
      sub_2214FEAA0();
      *(_WORD *)(v10 + 12) = 2048;
      v0[6] = 281;
      sub_2214FEAA0();
      _os_log_impl(&dword_2214B8000, v8, v9, "%s:%ld:", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v11, -1, -1);
      MEMORY[0x223C83460](v10, -1, -1);
    }

    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_2214F10B8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2214F1230;
  }
  else {
    uint64_t v2 = sub_2214F11CC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2214F11CC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F1230()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F1294(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2214FE9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v5;
  v6[5] = a1;
  sub_2214F0800((uint64_t)v3, (uint64_t)&unk_267F52B68, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_2214F13B0()
{
  v1[5] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214F1474, v0, 0);
}

uint64_t sub_2214F1474()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + 112);
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2214FE920();
  __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
  uint64_t v3 = sub_2214FE900();
  os_log_type_t v4 = sub_2214FEA60();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136315650;
    *(void *)(v0 + 24) = sub_2214F9A3C(0xD000000000000018, 0x8000000221505060, &v12);
    sub_2214FEAA0();
    *(_WORD *)(v5 + 12) = 2048;
    *(void *)(v0 + 32) = 298;
    sub_2214FEAA0();
    *(_WORD *)(v5 + 22) = 1024;
    *(_DWORD *)(v0 + 72) = v1 != 0;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v3, v4, "%s:%ld: disconnected, emuStarted=%{BOOL}d", (uint8_t *)v5, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v6, -1, -1);
    MEMORY[0x223C83460](v5, -1, -1);
  }

  if (v1)
  {
    uint64_t v8 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 48);
    *(void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = 0;
    swift_release();
    *(void *)(v0 + 16) = 0x8000000000000002;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
    sub_2214FEA00();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_2214F1700()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2214FE9E0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2214EBEA4((uint64_t)v3);
  }
  else
  {
    sub_2214FE9D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2214FE9C0();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2214F1920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a4;
  uint64_t v5 = sub_2214FE8F0();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  v4[18] = v7;
  v4[19] = *(void *)(v7 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B38);
  v4[22] = v8;
  v4[23] = *(void *)(v8 - 8);
  v4[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214F1B10, 0, 0);
}

uint64_t sub_2214F1B10()
{
  *(unsigned char *)(v0 + 59) = 0;
  *(void *)(v0 + 200) = (id)NFSharedSignpostLog();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B40);
  sub_2214FEA20();
  *(void *)(v0 + 208) = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  swift_beginAccess();
  *(unsigned char *)(v0 + 60) = 0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2214F1C34;
  uint64_t v2 = *(void *)(v0 + 176);
  return MEMORY[0x270FA1F68](v0 + 40, 0, 0, v2);
}

uint64_t sub_2214F1C34()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2214F1D30, 0, 0);
}

uint64_t sub_2214F1D30()
{
  uint64_t v74 = v0;
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = *(void *)(v0 + 48);
  *(void *)(v0 + 224) = v1;
  *(void *)(v0 + 232) = v2;
  int v3 = *(unsigned __int8 *)(v0 + 56);
  *(unsigned char *)(v0 + 61) = v3;
  if ((~v2 & 0x3000000000000000) != 0 || v3 != 255)
  {
    switch((v2 >> 60) & 3 | (4 * (v3 & 1u)))
    {
      case 1uLL:
        uint64_t v9 = *(void **)(v0 + 200);
        if (v9)
        {
          uint64_t v11 = *(void *)(v0 + 104);
          uint64_t v10 = *(void *)(v0 + 112);
          uint64_t v12 = *(void *)(v0 + 96);
          sub_2214F7CE8(v1, v2, v3);
          id v13 = v9;
          sub_2214FEA90();
          sub_2214FE8E0();
          sub_2214FE8D0();

          (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
        }
        else
        {
          sub_2214F71AC(v1, v2, v3 & 1, sub_2214E5490);
        }
        if (qword_267F524C0 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_2214FE920();
        __swift_project_value_buffer(v50, (uint64_t)qword_267F53C90);
        sub_2214F71AC(v1, v2, v3 & 1, sub_2214E5490);
        sub_2214F71AC(v1, v2, v3 & 1, sub_2214E5490);
        v51 = sub_2214FE900();
        os_log_type_t v52 = sub_2214FEA60();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = swift_slowAlloc();
          uint64_t v72 = swift_slowAlloc();
          uint64_t v73 = v72;
          *(_DWORD *)uint64_t v53 = 136315650;
          *(void *)(v53 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v73);
          *(_WORD *)(v53 + 12) = 2048;
          *(void *)(v53 + 14) = 332;
          *(_WORD *)(v53 + 22) = 2080;
          sub_2214F71AC(v1, v2, v3 & 1, sub_2214E5490);
          uint64_t v54 = sub_2214FE870();
          unint64_t v56 = v55;
          sub_2214F7C98(v1, v2, v3);
          *(void *)(v53 + 24) = sub_2214F9A3C(v54, v56, &v73);
          swift_bridgeObjectRelease();
          sub_2214F7C98(v1, v2, v3);
          sub_2214F7C98(v1, v2, v3);
          _os_log_impl(&dword_2214B8000, v51, v52, "%s:%ld: capdu=%s", (uint8_t *)v53, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x223C83460](v72, -1, -1);
          MEMORY[0x223C83460](v53, -1, -1);
        }
        else
        {
          sub_2214F7C98(v1, v2, v3);
          sub_2214F7C98(v1, v2, v3);
        }

        v57 = (void *)swift_task_alloc();
        *(void *)(v0 + 248) = v57;
        void *v57 = v0;
        v57[1] = sub_2214F2DC8;
        return sub_2214F0980(v1, v2 & 0xCFFFFFFFFFFFFFFFLL);
      case 2uLL:
        if (qword_267F524C0 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_2214FE920();
        __swift_project_value_buffer(v14, (uint64_t)qword_267F53C90);
        uint64_t v15 = sub_2214FE900();
        os_log_type_t v16 = sub_2214FEA60();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = swift_slowAlloc();
          uint64_t v18 = swift_slowAlloc();
          uint64_t v73 = v18;
          *(_DWORD *)uint64_t v17 = 136315650;
          *(void *)(v17 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v73);
          *(_WORD *)(v17 + 12) = 2048;
          *(void *)(v17 + 14) = 362;
          *(_WORD *)(v17 + 22) = 2080;
          *(unsigned char *)(v0 + 58) = v1;
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B48);
          uint64_t v19 = sub_2214FE970();
          *(void *)(v17 + 24) = sub_2214F9A3C(v19, v20, &v73);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2214B8000, v15, v16, "%s:%ld: started, error=%s", (uint8_t *)v17, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x223C83460](v18, -1, -1);
          MEMORY[0x223C83460](v17, -1, -1);
        }

        char v21 = *(unsigned char *)(v0 + 60);
        if (v1 == 12 && (*(unsigned char *)(v0 + 60) & 1) == 0)
        {
          uint64_t v23 = *(void *)(v0 + 152);
          uint64_t v22 = *(void *)(v0 + 160);
          uint64_t v24 = *(void *)(v0 + 144);
          *(void *)(v0 + 64) = 0x8000000000000000;
          sub_2214FEA00();
          (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
          char v21 = 1;
        }
        goto LABEL_56;
      case 3uLL:
        uint64_t v25 = *(void **)(v0 + 200);
        if (v25)
        {
          uint64_t v27 = *(void *)(v0 + 104);
          uint64_t v26 = *(void *)(v0 + 112);
          uint64_t v28 = *(void *)(v0 + 96);
          id v29 = v25;
          sub_2214FEA90();
          sub_2214FE8E0();
          sub_2214FE8D0();

          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
        }
        if (qword_267F524C0 != -1) {
          swift_once();
        }
        uint64_t v30 = sub_2214FE920();
        __swift_project_value_buffer(v30, (uint64_t)qword_267F53C90);
        v31 = sub_2214FE900();
        os_log_type_t v32 = sub_2214FEA60();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          uint64_t v34 = swift_slowAlloc();
          uint64_t v73 = v34;
          *(_DWORD *)uint64_t v33 = 136315650;
          *(void *)(v33 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v73);
          *(_WORD *)(v33 + 12) = 2048;
          *(void *)(v33 + 14) = 374;
          *(_WORD *)(v33 + 22) = 2080;
          *(unsigned char *)(v0 + 57) = v1;
          uint64_t v35 = sub_2214FE970();
          *(void *)(v33 + 24) = sub_2214F9A3C(v35, v36, &v73);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2214B8000, v31, v32, "%s:%ld: invalidated, error=%s", (uint8_t *)v33, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x223C83460](v34, -1, -1);
          MEMORY[0x223C83460](v33, -1, -1);
        }

        uint64_t v37 = swift_task_alloc();
        *(void *)(v0 + 264) = v37;
        *(void *)uint64_t v37 = v0;
        *(void *)(v37 + 8) = sub_2214F311C;
        uint64_t v7 = *(void *)(v0 + 88);
        *(void *)(v37 + 224) = v7;
        *(unsigned char *)(v37 + 264) = v1;
        uint64_t v8 = sub_2214F4308;
        goto LABEL_24;
      case 4uLL:
        v38 = (unsigned char *)(v0 + 59);
        v39 = *(void **)(v0 + 200);
        if (v1 | v2)
        {
          if (v39)
          {
            uint64_t v41 = *(void *)(v0 + 104);
            uint64_t v40 = *(void *)(v0 + 112);
            uint64_t v42 = *(void *)(v0 + 96);
            id v43 = v39;
            sub_2214FEA90();
            sub_2214FE8E0();
            sub_2214FE8D0();

            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
          }
          if (qword_267F524C0 != -1) {
            swift_once();
          }
          uint64_t v44 = sub_2214FE920();
          __swift_project_value_buffer(v44, (uint64_t)qword_267F53C90);
          v45 = sub_2214FE900();
          os_log_type_t v46 = sub_2214FEA60();
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v47 = swift_slowAlloc();
            uint64_t v48 = swift_slowAlloc();
            uint64_t v73 = v48;
            *(_DWORD *)uint64_t v47 = 136315650;
            *(void *)(v47 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v73);
            *(_WORD *)(v47 + 12) = 2048;
            *(void *)(v47 + 14) = 353;
            *(_WORD *)(v47 + 22) = 1024;
            *(_DWORD *)(v47 + 24) = *v38;
            _os_log_impl(&dword_2214B8000, v45, v46, "%s:%ld: disconnected, currentFieldState=%{BOOL}d", (uint8_t *)v47, 0x1Cu);
            swift_arrayDestroy();
            MEMORY[0x223C83460](v48, -1, -1);
            MEMORY[0x223C83460](v47, -1, -1);
          }

          if (*v38)
          {
            *(unsigned char *)(v0 + 59) = 0;
            v49 = (void *)swift_task_alloc();
            *(void *)(v0 + 256) = v49;
            void *v49 = v0;
            v49[1] = sub_2214F2FA8;
            return sub_2214F13B0();
          }
        }
        else
        {
          if (v39)
          {
            uint64_t v59 = *(void *)(v0 + 104);
            uint64_t v58 = *(void *)(v0 + 112);
            uint64_t v60 = *(void *)(v0 + 96);
            id v61 = v39;
            sub_2214FEA90();
            sub_2214FE8E0();
            sub_2214FE8D0();

            (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
          }
          if (qword_267F524C0 != -1) {
            swift_once();
          }
          uint64_t v62 = sub_2214FE920();
          __swift_project_value_buffer(v62, (uint64_t)qword_267F53C90);
          v63 = sub_2214FE900();
          os_log_type_t v64 = sub_2214FEA60();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            uint64_t v73 = v66;
            *(_DWORD *)uint64_t v65 = 136315650;
            *(void *)(v65 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v73);
            *(_WORD *)(v65 + 12) = 2048;
            *(void *)(v65 + 14) = 340;
            *(_WORD *)(v65 + 22) = 1024;
            *(_DWORD *)(v65 + 24) = *v38;
            _os_log_impl(&dword_2214B8000, v63, v64, "%s:%ld: connected, currentFieldState=%{BOOL}d", (uint8_t *)v65, 0x1Cu);
            swift_arrayDestroy();
            MEMORY[0x223C83460](v66, -1, -1);
            MEMORY[0x223C83460](v65, -1, -1);
          }

          if (*v38 != 1)
          {
            uint64_t v68 = *(void *)(v0 + 152);
            uint64_t v67 = *(void *)(v0 + 160);
            uint64_t v69 = *(void *)(v0 + 144);
            *(unsigned char *)(v0 + 59) = 1;
            *(void *)(v0 + 80) = 0x8000000000000001;
            sub_2214FEA00();
            (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
          }
        }
        char v21 = *(unsigned char *)(v0 + 60);
LABEL_56:
        *(unsigned char *)(v0 + 60) = v21;
        v70 = (void *)swift_task_alloc();
        *(void *)(v0 + 216) = v70;
        void *v70 = v0;
        v70[1] = sub_2214F1C34;
        uint64_t v71 = *(void *)(v0 + 176);
        uint64_t result = MEMORY[0x270FA1F68](v0 + 40, 0, 0, v71);
        break;
      default:
        uint64_t v7 = *(void *)(v0 + 88);
        uint64_t v8 = sub_2214F2AC8;
LABEL_24:
        return MEMORY[0x270FA2498](v8, v7, 0);
    }
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 200);
    (*(void (**)(void, void))(*(void *)(v0 + 184) + 8))(*(void *)(v0 + 192), *(void *)(v0 + 176));

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  return result;
}

uint64_t sub_2214F2AC8()
{
  *(void *)(v0 + 240) = *(void *)(*(void *)(v0 + 88) + 112);
  return MEMORY[0x270FA2498](sub_2214F2AF0, 0, 0);
}

uint64_t sub_2214F2AF0()
{
  uint64_t v21 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2214FE920();
  __swift_project_value_buffer(v1, (uint64_t)qword_267F53C90);
  unint64_t v2 = sub_2214FE900();
  os_log_type_t v3 = sub_2214FEA60();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 240);
    int v5 = *(_DWORD *)(v0 + 224);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v20 = v7;
    *(_DWORD *)uint64_t v6 = 136316162;
    *(void *)(v6 + 4) = sub_2214F9A3C(0xD00000000000001BLL, 0x8000000221504FA0, &v20);
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = 319;
    *(_WORD *)(v6 + 22) = 1024;
    *(_DWORD *)(v6 + 24) = v5 & 1;
    *(_WORD *)(v6 + 28) = 1024;
    *(_DWORD *)(v6 + 30) = v4 != 0;
    *(_WORD *)(v6 + 34) = 1024;
    *(_DWORD *)(v6 + 36) = *(unsigned __int8 *)(v0 + 59);
    _os_log_impl(&dword_2214B8000, v2, v3, "%s:%ld: RF=%{BOOL}d, emuStarted=%{BOOL}d, currentFieldState=%{BOOL}d", (uint8_t *)v6, 0x28u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v7, -1, -1);
    MEMORY[0x223C83460](v6, -1, -1);
  }

  if (*(unsigned char *)(v0 + 59) != (*(_DWORD *)(v0 + 224) & 1))
  {
    uint64_t v8 = *(void *)(v0 + 224) & 1;
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v13 = *(void *)(v0 + 128);
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v14 = *(void *)(v0 + 120);
    uint64_t v15 = *(void *)(v0 + 88) + *(void *)(v0 + 208);
    *(unsigned char *)(v0 + 59) = *(void *)(v0 + 224) & 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    unint64_t v16 = 0x8000000000000001;
    if (!v8) {
      unint64_t v16 = 0x8000000000000002;
    }
    *(void *)(v0 + 72) = v16;
    sub_2214FEA00();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_2214F1C34;
  uint64_t v18 = *(void *)(v0 + 176);
  return MEMORY[0x270FA1F68](v0 + 40, 0, 0, v18);
}

uint64_t sub_2214F2DC8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2214F2EC4, 0, 0);
}

uint64_t sub_2214F2EC4()
{
  uint64_t v2 = *(void *)(v0 + 224);
  unint64_t v1 = *(void *)(v0 + 232);
  unsigned __int8 v3 = *(unsigned char *)(v0 + 61);
  sub_2214F7C98(v2, v1, v3);
  sub_2214F7C98(v2, v1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2214F1C34;
  uint64_t v5 = *(void *)(v0 + 176);
  return MEMORY[0x270FA1F68](v0 + 40, 0, 0, v5);
}

uint64_t sub_2214F2FA8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 216) = v3;
  *unsigned __int8 v3 = v2;
  v3[1] = sub_2214F1C34;
  uint64_t v4 = *(void *)(v1 + 176);
  return MEMORY[0x270FA1F68](v1 + 40, 0, 0, v4);
}

uint64_t sub_2214F311C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 216) = v3;
  *unsigned __int8 v3 = v2;
  v3[1] = sub_2214F1C34;
  uint64_t v4 = *(void *)(v1 + 176);
  return MEMORY[0x270FA1F68](v1 + 40, 0, 0, v4);
}

uint64_t sub_2214F3290(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  return MEMORY[0x270FA2498](sub_2214F32B4, v2, 0);
}

uint64_t sub_2214F32B4()
{
  uint64_t v1 = *(void *)(v0[22] + 112);
  v0[23] = v1;
  if (v1)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    return MEMORY[0x270FA2498](sub_2214F336C, 0, 0);
  }
  else
  {
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
}

uint64_t sub_2214F336C()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = (void *)v0[23];
  v0[2] = v0;
  v0[3] = sub_2214F35AC;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  v0[14] = sub_2214F7BD4;
  v0[15] = v4;
  uint64_t v5 = MEMORY[0x263EF8330];
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2214ED9E4;
  v0[13] = &block_descriptor_81;
  uint64_t v6 = _Block_copy(v0 + 10);
  swift_release();
  id v7 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);
  sub_2214FEAC0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52B00);
  swift_dynamicCast();
  uint64_t v8 = (void *)v0[10];
  uint64_t v9 = (void *)sub_2214FE950();
  v0[14] = nullsub_1;
  v0[15] = 0;
  v0[10] = v5;
  v0[11] = 1107296256;
  v0[12] = sub_2214F3814;
  v0[13] = &block_descriptor_84;
  uint64_t v10 = _Block_copy(v0 + 10);
  objc_msgSend(v8, sel_updateUIString_completion_, v9, v10);
  _Block_release(v10);

  swift_continuation_throwingResume();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_2214F35AC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 192) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 176);
    swift_willThrow();
    uint64_t v4 = sub_2214F37A4;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = sub_2214F36D8;
    uint64_t v5 = 0;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2214F36D8()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2214F3740, v1, 0);
}

uint64_t sub_2214F3740()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F37A4()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F3814(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_2214F3858()
{
  *(void *)(v1 + 160) = v0;
  return MEMORY[0x270FA2498](sub_2214F3878, v0, 0);
}

uint64_t sub_2214F3878()
{
  if (*(void *)(*(void *)(v0 + 160) + 128)) {
    return sub_2214FEB20();
  }
  sub_2214F76A4();
  swift_getObjectType();
  uint64_t v3 = sub_2214FE9C0();
  return MEMORY[0x270FA2498](sub_2214F3968, v3, v2);
}

uint64_t sub_2214F3968()
{
  uint64_t v1 = v0[20];
  v0[2] = v0;
  v0[3] = sub_2214F3AF4;
  uint64_t v2 = swift_continuation_init();
  uint64_t v3 = *(void *)(v1 + 136);
  *(void *)(v3
            + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation) = v2;
  id v4 = objc_msgSend(self, sel_sharedHardwareManager);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v1;
  v0[14] = sub_2214F790C;
  v0[15] = v5;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2214F3FC0;
  v0[13] = &block_descriptor_74;
  uint64_t v6 = _Block_copy(v0 + 10);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_queueCardFieldDetectSession_completionHandler_, v3, v6);
  _Block_release(v6);

  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2214F3AF4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 168) = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 160);
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_2214F3C40, v4, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v2 + 8);
    return v5();
  }
}

uint64_t sub_2214F3C40()
{
  uint64_t v1 = *(void **)(v0 + 168);
  id v2 = v1;
  char v3 = 0;
  switch(sub_2214ED554(v1))
  {
    case 2u:
      char v3 = 6;
      goto LABEL_10;
    case 8u:
    case 0x20u:
      goto LABEL_10;
    case 0xEu:
      char v3 = 8;
      goto LABEL_10;
    case 0x24u:
      swift_getErrorValue();
      sub_2214FEB70();
      return sub_2214FEB20();
    case 0x32u:
      char v3 = 7;
      goto LABEL_10;
    case 0x3Au:
      char v3 = 9;
      goto LABEL_10;
    case 0x45u:
      char v3 = 10;
      goto LABEL_10;
    case 0x46u:
      char v3 = 11;
      goto LABEL_10;
    default:
      char v3 = 1;
LABEL_10:
      sub_2214F7B70();
      swift_allocError();
      uint64_t v5 = *(void **)(v0 + 168);
      *uint64_t v6 = v3;
      swift_willThrow();

      uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
      return v7();
  }
}

void sub_2214F3ECC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
    swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    *(void *)(a4 + 128) = a1;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    id v8 = objc_msgSend(self, sel_sharedHardwareManager);
    objc_msgSend(v8, sel_addNFCHardwareManagerCallbacksListener_, *(void *)(a4 + 136));
  }
}

uint64_t sub_2214F3FC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_2214F4040(char a1, id a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = a2;
    id v6 = a2;
    int v7 = sub_2214ED554(a2);
    if (v7 == 14 || v7 == 32 || v7 == 57)
    {
      sub_2214FEB20();
      __break(1u);
    }
    else
    {
      **(unsigned char **)(*(void *)(a3 + 64) + 40) = 0;
      swift_continuation_resume();
    }
  }
  else
  {
    **(unsigned char **)(*(void *)(a3 + 64) + 40) = a1 & 1;
    swift_continuation_resume();
  }
}

void sub_2214F41AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2214F4224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v7 = byte_22150169E[a5];
  uint64_t v8 = swift_task_alloc();
  *(void *)(v5 + 16) = v8;
  *(void *)uint64_t v8 = v5;
  *(void *)(v8 + 8) = sub_2214ED500;
  *(void *)(v8 + 224) = a4;
  *(unsigned char *)(v8 + 264) = v7;
  return MEMORY[0x270FA2498](sub_2214F4308, a4, 0);
}

uint64_t sub_2214F42E4(char a1)
{
  *(void *)(v2 + 224) = v1;
  *(unsigned char *)(v2 + 264) = a1;
  return MEMORY[0x270FA2498](sub_2214F4308, v1, 0);
}

uint64_t sub_2214F4308()
{
  uint64_t v22 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2214FE920();
  __swift_project_value_buffer(v1, (uint64_t)qword_267F53C90);
  swift_retain();
  uint64_t v2 = sub_2214FE900();
  os_log_type_t v3 = sub_2214FEA60();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 224);
  if (v4)
  {
    char v20 = *(unsigned char *)(v0 + 264);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v21 = v7;
    *(_DWORD *)uint64_t v6 = 136316162;
    *(void *)(v0 + 144) = sub_2214F9A3C(0xD000000000000013, 0x8000000221504EE0, &v21);
    sub_2214FEAA0();
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v0 + 144) = 484;
    sub_2214FEAA0();
    *(_WORD *)(v6 + 22) = 1024;
    *(_DWORD *)(v0 + 144) = *(void *)(v5 + 128) != 0;
    sub_2214FEAA0();
    *(_WORD *)(v6 + 28) = 1024;
    *(_DWORD *)(v0 + 144) = *(void *)(v5 + 112) != 0;
    sub_2214FEAA0();
    swift_release();
    *(_WORD *)(v6 + 34) = 2080;
    *(unsigned char *)(v0 + 144) = v20;
    uint64_t v8 = sub_2214FE970();
    *(void *)(v0 + 144) = sub_2214F9A3C(v8, v9, &v21);
    sub_2214FEAA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2214B8000, v2, v3, "%s:%ld: fdSession=%{BOOL}d, cardSession=%{BOOL}d, reason=%s", (uint8_t *)v6, 0x2Cu);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v7, -1, -1);
    MEMORY[0x223C83460](v6, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v11 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
  objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer), sel_stopTimer);
  uint64_t v12 = *(void **)(v10 + v11);
  *(void *)(v10 + v11) = 0;

  uint64_t v13 = *(void *)(v10 + 128);
  *(void *)(v0 + 232) = v13;
  if (v13)
  {
    uint64_t v14 = sub_2214F466C;
LABEL_10:
    uint64_t v17 = v14;
    swift_unknownObjectRetain();
    return MEMORY[0x270FA2498](v17, 0, 0);
  }
  uint64_t v15 = *(void *)(v0 + 224);
  uint64_t v16 = *(void *)(v15 + 112);
  *(void *)(v0 + 248) = v16;
  if (v16)
  {
    uint64_t v14 = sub_2214F4B68;
    goto LABEL_10;
  }
  sub_2214F5018(v15, *(unsigned char *)(v0 + 264));
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_2214F466C()
{
  uint64_t v1 = (void *)v0[29];
  v0[2] = v0;
  v0[3] = sub_2214F489C;
  uint64_t v2 = swift_continuation_init();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  v0[22] = sub_2214F7894;
  v0[23] = v3;
  uint64_t v4 = MEMORY[0x263EF8330];
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 1107296256;
  v0[20] = sub_2214ED9E4;
  v0[21] = &block_descriptor_49;
  uint64_t v5 = _Block_copy(v0 + 18);
  swift_release();
  id v6 = objc_msgSend(v1, sel_remoteObjectProxyWithErrorHandler_, v5);
  _Block_release(v5);
  sub_2214FEAC0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52AF8);
  swift_dynamicCast();
  uint64_t v7 = (void *)v0[18];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  v0[22] = sub_2214F78AC;
  v0[23] = v8;
  v0[18] = v4;
  v0[19] = 1107296256;
  v0[20] = sub_2214F3814;
  v0[21] = &block_descriptor_55;
  unint64_t v9 = _Block_copy(v0 + 18);
  swift_release();
  objc_msgSend(v7, sel_endSession_, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2214F489C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 240) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 224);
    swift_willThrow();
    uint64_t v4 = sub_2214F4AE4;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = sub_2214F49C8;
    uint64_t v5 = 0;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2214F49C8()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_2214F4A30, v1, 0);
}

uint64_t sub_2214F4A30()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v1 + 112);
  *(void *)(v0 + 248) = v2;
  if (v2)
  {
    swift_unknownObjectRetain();
    return MEMORY[0x270FA2498](sub_2214F4B68, 0, 0);
  }
  else
  {
    sub_2214F5018(v1, *(unsigned char *)(v0 + 264));
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_2214F4AE4()
{
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 224);
  char v3 = *(unsigned char *)(v0 + 264);
  swift_unknownObjectRelease();
  sub_2214F5018(v2, v3);

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2214F4B68()
{
  uint64_t v1 = (void *)v0[31];
  v0[10] = v0;
  v0[11] = sub_2214F4D98;
  uint64_t v2 = swift_continuation_init();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  v0[22] = sub_2214F8018;
  v0[23] = v3;
  uint64_t v4 = MEMORY[0x263EF8330];
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 1107296256;
  v0[20] = sub_2214ED9E4;
  v0[21] = &block_descriptor_62;
  uint64_t v5 = _Block_copy(v0 + 18);
  swift_release();
  id v6 = objc_msgSend(v1, sel_remoteObjectProxyWithErrorHandler_, v5);
  _Block_release(v5);
  sub_2214FEAC0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52B00);
  swift_dynamicCast();
  uint64_t v7 = (void *)v0[18];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  v0[22] = sub_2214F801C;
  v0[23] = v8;
  v0[18] = v4;
  v0[19] = 1107296256;
  v0[20] = sub_2214F3814;
  v0[21] = &block_descriptor_68;
  unint64_t v9 = _Block_copy(v0 + 18);
  swift_release();
  objc_msgSend(v7, sel_endSession_, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v0 + 10);
}

uint64_t sub_2214F4D98()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 256) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 224);
    swift_willThrow();
    uint64_t v4 = sub_2214F4F94;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = sub_2214F4EC4;
    uint64_t v5 = 0;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2214F4EC4()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_2214F4F30, v1, 0);
}

uint64_t sub_2214F4F30()
{
  sub_2214F5018(*(void *)(v0 + 224), *(unsigned char *)(v0 + 264));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2214F4F94()
{
  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 224);
  char v3 = *(unsigned char *)(v0 + 264);
  swift_unknownObjectRelease();
  sub_2214F5018(v2, v3);

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_2214F5018(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2214FE8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52840);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a1 + 112) = 0;
  swift_unknownObjectRelease();
  *(void *)(a1 + 128) = 0;
  swift_unknownObjectRelease();
  uint64_t v12 = 0x4000000000000000;
  switch(a2)
  {
    case 1:
    case 2:
    case 5:
      break;
    case 3:
      uint64_t v12 = 0x4000000000000002;
      break;
    case 4:
      uint64_t v12 = 0x4000000000000001;
      break;
    case 6:
    case 9:
      uint64_t v12 = 0x4000000000000004;
      break;
    case 7:
      uint64_t v12 = 0x4000000000000008;
      break;
    case 10:
      uint64_t v12 = 0x4000000000000005;
      break;
    case 11:
      uint64_t v12 = 0x4000000000000006;
      break;
    default:
      sub_2214FEB20();
      __break(1u);
      JUMPOUT(0x2214F533CLL);
  }
  v15[1] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  sub_2214FEA00();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2214FEA10();
  id result = (id)NFSharedSignpostLog();
  if (result)
  {
    uint64_t v14 = result;
    sub_2214FEA90();
    sub_2214FE8E0();
    sub_2214FE8D0();

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

id sub_2214F536C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2214FE930();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214F764C();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F060], v2);
  swift_retain();
  uint64_t v6 = (void *)sub_2214FEA80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v7 = objc_allocWithZone(MEMORY[0x263F8C6B0]);
  aBlock[4] = sub_2214F7644;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2214F3814;
  aBlock[3] = &block_descriptor_2;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();
  id v9 = objc_msgSend(v7, sel_initWithCallback_queue_, v8, v6);

  _Block_release(v8);
  uint64_t v10 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer);
  *(void *)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer) = v9;

  id result = *(id *)(v1 + v10);
  if (result) {
    return objc_msgSend(result, sel_startTimer_, 60.0);
  }
  return result;
}

uint64_t sub_2214F5550(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2214FE9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  unint64_t v5 = sub_2214F76A4();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = v5;
  v6[4] = a1;
  swift_retain_n();
  sub_2214EB610((uint64_t)v3, (uint64_t)&unk_267F52AE0, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_2214F565C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 32) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52850);
  *(void *)(v4 + 40) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2214F56F4, a4, 0);
}

uint64_t sub_2214F56F4()
{
  uint64_t v13 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2214FE920();
  __swift_project_value_buffer(v1, (uint64_t)qword_267F53C90);
  uint64_t v2 = sub_2214FE900();
  os_log_type_t v3 = sub_2214FEA50();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[2] = sub_2214F9A3C(0xD000000000000015, 0x8000000221504EA0, &v12);
    sub_2214FEAA0();
    *(_WORD *)(v4 + 12) = 2048;
    v0[3] = 515;
    sub_2214FEAA0();
    _os_log_impl(&dword_2214B8000, v2, v3, "%s:%ld: Session expired", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v5, -1, -1);
    MEMORY[0x223C83460](v4, -1, -1);
  }

  uint64_t v6 = v0[4];
  if (*(void *)(v6 + 112))
  {
    uint64_t v7 = v0[5];
    uint64_t v8 = sub_2214FE9E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = 0;
    *(void *)(v9 + 24) = 0;
    *(void *)(v9 + 32) = v6;
    *(unsigned char *)(v9 + 40) = 2;
    swift_retain();
    sub_2214EB610(v7, (uint64_t)&unk_267F52AF0, v9);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2214F5970(uint64_t a1, uint64_t a2)
{
  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  return MEMORY[0x270FA2498](sub_2214F5994, v2, 0);
}

uint64_t sub_2214F5994()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0[13];
  if (*(void *)(v1 + 112)) {
    return sub_2214FEB20();
  }
  if (*(void *)(v1 + 128))
  {
    swift_bridgeObjectRetain();
    os_log_type_t v3 = (void *)sub_2214FE950();
    swift_bridgeObjectRelease();
    v0[14] = objc_msgSend(self, sel_configWithInitialUIText_, v3);

    sub_2214F76A4();
    swift_getObjectType();
    uint64_t v5 = sub_2214FE9C0();
    return MEMORY[0x270FA2498](sub_2214F5CC4, v5, v4);
  }
  else
  {
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2214FE920();
    __swift_project_value_buffer(v6, (uint64_t)qword_267F53C90);
    uint64_t v7 = sub_2214FE900();
    os_log_type_t v8 = sub_2214FEA50();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      v0[10] = sub_2214F9A3C(0xD00000000000001ELL, 0x8000000221505250, &v13);
      sub_2214FEAA0();
      *(_WORD *)(v9 + 12) = 2048;
      v0[10] = 535;
      sub_2214FEAA0();
      _os_log_impl(&dword_2214B8000, v7, v8, "%s:%ld: Session has been invalidated", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v10, -1, -1);
      MEMORY[0x223C83460](v9, -1, -1);
    }

    sub_2214F7B70();
    swift_allocError();
    *uint64_t v11 = 2;
    swift_willThrow();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_2214F5CC4()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  v0[2] = v0;
  v0[3] = sub_2214F5D68;
  uint64_t v3 = swift_continuation_init();
  sub_2214F622C(v3, v2, v1);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2214F5D68()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 120) = v2;
  uint64_t v3 = *(void *)(v1 + 104);
  if (v2)
  {
    swift_willThrow();
    uint64_t v4 = sub_2214F5F00;
  }
  else
  {
    uint64_t v4 = sub_2214F5E98;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2214F5E98()
{
  uint64_t v1 = *(void **)(v0 + 112);
  sub_2214F536C();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2214F5F00()
{
  uint64_t v1 = *(void **)(v0 + 120);

  id v2 = v1;
  switch(sub_2214ED554(v1))
  {
    case 2u:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 6;
      goto LABEL_10;
    case 8u:
    case 0x20u:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      *uint64_t v4 = 0;
      goto LABEL_11;
    case 0xEu:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 8;
      goto LABEL_10;
    case 0x32u:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 7;
      goto LABEL_10;
    case 0x3Au:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 9;
      goto LABEL_10;
    case 0x45u:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 10;
      goto LABEL_10;
    case 0x46u:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 11;
      goto LABEL_10;
    default:
      uint64_t v3 = *(void **)(v0 + 120);
      sub_2214F7B70();
      swift_allocError();
      char v6 = 1;
LABEL_10:
      *uint64_t v5 = v6;
LABEL_11:
      swift_willThrow();

      uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
      return v7();
  }
}

void sub_2214F622C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a2 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation, v5);
  uint64_t v10 = (objc_class *)type metadata accessor for NFCCardSessionDelegate(0);
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = 0;
  v9(&v11[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation], (uint64_t)v8, v5);
  v29.receiver = v11;
  v29.super_class = v10;
  id v12 = objc_msgSendSuper2(&v29, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = *(void **)(a2 + 120);
  *(void *)(a2 + 120) = v12;

  uint64_t v14 = *(char **)(a2 + 120);
  if (v14)
  {
    *(void *)&v14[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = a1;
    uint64_t v15 = self;
    uint64_t v16 = v14;
    id v17 = objc_msgSend(v15, sel_sharedHardwareManager);
    uint64_t v18 = (void *)swift_allocObject();
    void v18[2] = a1;
    v18[3] = a2;
    v18[4] = v16;
    uint64_t v26 = sub_2214F7FF4;
    uint64_t v27 = v18;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v23 = 1107296256;
    uint64_t v24 = sub_2214F666C;
    uint64_t v25 = &block_descriptor_148;
    uint64_t v19 = _Block_copy(&aBlock);
    char v20 = v16;
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_queueCardSession_sessionConfig_completionHandler_, v20, v21, v19);
    _Block_release(v19);
  }
  else
  {
    unint64_t aBlock = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_2214FEAD0();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD00000000000001FLL;
    unint64_t v23 = 0x80000002215052A0;
    uint64_t v28 = 546;
    sub_2214FEB50();
    sub_2214FE980();
    swift_bridgeObjectRelease();
    sub_2214FE980();
    sub_2214FEB20();
    __break(1u);
  }
}

void sub_2214F6578(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
    swift_allocError();
    *os_log_type_t v8 = a4;
    id v9 = a4;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    *(void *)(a6 + 112) = a1;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    id v11 = objc_msgSend(self, sel_sharedHardwareManager);
    objc_msgSend(v11, sel_addNFCHardwareManagerCallbacksListener_, a7);
  }
}

uint64_t sub_2214F666C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = *(void (**)(uint64_t, uint64_t, id, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v10 = a4;
  id v11 = a5;
  v9(a2, a3, v10, a5);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_2214F6714(char a1)
{
  *(void *)(v2 + 160) = v1;
  *(unsigned char *)(v2 + 184) = a1;
  return MEMORY[0x270FA2498](sub_2214F6738, v1, 0);
}

uint64_t sub_2214F6738()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = *(void *)(v1 + 112);
  v0[21] = v2;
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
    uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer);
    swift_unknownObjectRetain();
    objc_msgSend(v4, sel_stopTimer);
    uint64_t v5 = *(void **)(v1 + v3);
    *(void *)(v1 + v3) = 0;

    return MEMORY[0x270FA2498](sub_2214F6814, 0, 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2214F6814()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = v0;
  uint64_t v3 = v0 + 16;
  uint64_t v4 = (const void *)(v0 + 80);
  uint64_t v5 = *(void **)(v0 + 168);
  uint64_t v6 = *(unsigned __int8 *)(v0 + 184);
  v1[2] = v2;
  v1[3] = sub_2214F6A5C;
  uint64_t v7 = swift_continuation_init();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v1[14] = sub_2214F8018;
  v1[15] = v8;
  uint64_t v9 = MEMORY[0x263EF8330];
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 1107296256;
  v1[12] = sub_2214ED9E4;
  v1[13] = &block_descriptor_128;
  id v10 = _Block_copy(v4);
  swift_release();
  id v11 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_2214FEAC0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52B00);
  swift_dynamicCast();
  id v12 = (void *)v1[10];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v7;
  v1[14] = sub_2214F7F9C;
  v1[15] = v13;
  v1[10] = v9;
  v1[11] = 1107296256;
  v1[12] = sub_2214FA280;
  v1[13] = &block_descriptor_134;
  uint64_t v14 = _Block_copy(v4);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v12, sel_stopEmulationWithStatus_completion_, v6, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v3);
}

uint64_t sub_2214F6A5C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 160);
  if (v2)
  {
    swift_willThrow();
    uint64_t v4 = sub_2214F6C08;
  }
  else
  {
    uint64_t v4 = sub_2214F6B8C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2214F6B8C()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_unknownObjectRelease();
  *(void *)(v1 + 112) = 0;
  swift_unknownObjectRelease();
  uint64_t v2 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2214F6C08()
{
  uint64_t v1 = *(void **)(v0 + 176);
  id v2 = v1;
  int v3 = sub_2214ED554(v1);
  if (v3 == 54)
  {
    sub_2214F7B70();
    swift_allocError();
    char v6 = 2;
  }
  else
  {
    if (v3 == 32)
    {
      sub_2214F7B70();
      swift_allocError();
      *uint64_t v4 = 0;
      goto LABEL_7;
    }
    sub_2214F7B70();
    swift_allocError();
    char v6 = 1;
  }
  *uint64_t v5 = v6;
LABEL_7:
  swift_willThrow();

  swift_unknownObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void sub_2214F6D1C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  v7[4] = sub_2214F801C;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214F3814;
  v7[3] = &block_descriptor_141;
  char v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(a2, sel_endSession_, v6);
  _Block_release(v6);
}

uint64_t sub_2214F6DE8()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_2214F6F28()
{
  sub_2214F6DE8();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2214F6F54()
{
  return type metadata accessor for NFCCardSession(0);
}

uint64_t type metadata accessor for NFCCardSession(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F52A58);
}

void sub_2214F6F7C()
{
  sub_2214F7124(319, &qword_267F52AA8, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_2214F7124(319, &qword_267F52A18, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F)
    {
      sub_2214F7124(319, &qword_267F52AB0, (uint64_t)&type metadata for CardSession.Event, MEMORY[0x263F8F590]);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2214F7124(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t destroy for NFCCardSession.Event(uint64_t a1)
{
  return sub_2214F71AC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), sub_2214E5534);
}

uint64_t sub_2214F71AC(uint64_t result, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  if (a3) {
    int v4 = 4;
  }
  else {
    int v4 = 0;
  }
  if (((a2 >> 60) & 3 | v4) == 1) {
    return a4(result, a2 & 0xCFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t _s7CoreNFC14NFCCardSessionC5EventOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2214F71AC(*(void *)a2, v4, v5, sub_2214E5490);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NFCCardSession.Event(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2214F71AC(*(void *)a2, v4, v5, sub_2214E5490);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2214F71AC(v6, v7, v8, sub_2214E5534);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NFCCardSession.Event(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2214F71AC(v4, v5, v6, sub_2214E5534);
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCCardSession.Event(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1020);
  }
  unsigned int v3 = ((*(void *)(a1 + 8) >> 60) & 3 | (4 * *(unsigned __int8 *)(a1 + 16))) ^ 0x3FF;
  if (v3 >= 0x3FB) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCCardSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 1020;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (-a2 & 3) << 60;
      *(unsigned char *)(result + 16) = -a2 >> 2;
    }
  }
  return result;
}

uint64_t sub_2214F73CC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    int v1 = 4;
  }
  else {
    int v1 = 0;
  }
  unsigned int v2 = (*(void *)(a1 + 8) >> 60) & 3 | v1;
  if (v2 <= 3) {
    return v2;
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_2214F73FC(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_2214F740C(uint64_t result, uint64_t a2)
{
  if (a2 < 4)
  {
    *(void *)(result + 8) = *(void *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *(void *)__n128 result = (a2 - 4);
    *(void *)(result + 8) = 0;
  }
  *(unsigned char *)(result + 16) = a2 > 3;
  return result;
}

ValueMetadata *type metadata accessor for NFCCardSession.Event()
{
  return &type metadata for NFCCardSession.Event;
}

uint64_t getEnumTagSinglePayload for NFCCardSession.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NFCCardSession.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2214F75A8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCCardSession.Error()
{
  return &type metadata for NFCCardSession.Error;
}

unint64_t sub_2214F75E4()
{
  unint64_t result = qword_267F52AB8;
  if (!qword_267F52AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52AB8);
  }
  return result;
}

uint64_t sub_2214F7638()
{
  return v0;
}

uint64_t sub_2214F7644()
{
  return sub_2214F5550(v0);
}

unint64_t sub_2214F764C()
{
  unint64_t result = qword_267F52AC0;
  if (!qword_267F52AC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F52AC0);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_2214F76A4()
{
  unint64_t result = qword_267F52AD8;
  if (!qword_267F52AD8)
  {
    type metadata accessor for NFCCardSession(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52AD8);
  }
  return result;
}

uint64_t sub_2214F76FC()
{
  return objectdestroy_16Tm(40);
}

uint64_t sub_2214F7704(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_2214ED500;
  return sub_2214F565C(a1, v4, v5, v6);
}

uint64_t sub_2214F77B8()
{
  return objectdestroy_16Tm(41);
}

uint64_t sub_2214F77C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_2214EC6D4;
  return sub_2214F4224(a1, v4, v5, v6, v7);
}

uint64_t sub_2214F7884()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7894(void *a1)
{
  return sub_2214ED718(a1);
}

uint64_t sub_2214F789C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F78AC()
{
  return swift_continuation_throwingResume();
}

uint64_t sub_2214F78B4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F78C4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F78D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2214F790C(uint64_t a1, void *a2)
{
  sub_2214F3ECC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2214F7914()
{
  return MEMORY[0x270FA2498](sub_2214F7930, 0, 0);
}

uint64_t sub_2214F7930()
{
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_2214F7A98;
  uint64_t v1 = swift_continuation_init();
  id v2 = objc_msgSend(self, sel_sharedHardwareManager);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  v0[14] = sub_2214F8010;
  v0[15] = v3;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2214F41AC;
  v0[13] = &block_descriptor_154;
  uint64_t v4 = _Block_copy(v0 + 10);
  swift_release();
  objc_msgSend(v2, sel_isCardSessionEligibleWithCompletionHandler_, v4);
  _Block_release(v4);

  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2214F7A98()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)v0 + 128);
  id v2 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 8);
  return v2(v1);
}

unint64_t sub_2214F7B70()
{
  unint64_t result = qword_267F52B18;
  if (!qword_267F52B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52B18);
  }
  return result;
}

uint64_t sub_2214F7BC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7BD4(void *a1)
{
  return sub_2214ED710(a1);
}

uint64_t sub_2214F7BDC()
{
  return objectdestroy_16Tm(40);
}

uint64_t sub_2214F7BE4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_2214ED500;
  return sub_2214F1920(a1, v4, v5, v6);
}

uint64_t sub_2214F7C98(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if ((~a2 & 0x3000000000000000) != 0 || a3 != 255) {
    return sub_2214F71AC(result, a2, a3 & 1, sub_2214E5534);
  }
  return result;
}

uint64_t sub_2214F7CE8(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if ((~a2 & 0x3000000000000000) != 0 || a3 != 255) {
    return sub_2214F71AC(result, a2, a3 & 1, sub_2214E5490);
  }
  return result;
}

uint64_t sub_2214F7D38()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *int v8 = v4;
  v8[1] = sub_2214ED500;
  v8[9] = a3;
  v8[10] = v3;
  v8[7] = a1;
  v8[8] = a2;
  return MEMORY[0x270FA2498](sub_2214F0E38, 0, 0);
}

uint64_t sub_2214F7E30(uint64_t a1)
{
  return sub_2214F1294(a1);
}

uint64_t sub_2214F7E38()
{
  return objectdestroy_16Tm(48);
}

uint64_t sub_2214F7E40()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2214EC6D4;
  v4[9] = v2;
  v4[10] = v3;
  return MEMORY[0x270FA2498](sub_2214EFFC4, 0, 0);
}

uint64_t sub_2214F7EEC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7EFC()
{
  swift_release();
  swift_release();
  sub_2214E5534(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_2214F7F44(void *a1)
{
  sub_2214EFA6C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_2214F7F54()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7F64()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2214F7F9C(uint64_t a1)
{
  sub_2214F6D1C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2214F7FA4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F7FB4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2214F7FF4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2214F6578(a1, a2, a3, a4, v4[2], v4[3], v4[4]);
}

uint64_t sub_2214F8000()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2214F8010(char a1, void *a2)
{
  sub_2214F4040(a1, a2, *(void *)(v2 + 16));
}

id sub_2214F82A8()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA10();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2214F83F4()
{
  return type metadata accessor for AssertionNotification(0);
}

uint64_t type metadata accessor for AssertionNotification(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F52C60);
}

void sub_2214F844C()
{
  sub_2214F93C4(319, &qword_267F52C70, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_2214F84F8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52CC8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_267F52958);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(void *)(v0 + 120) = 0;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  sub_2214FE9F0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStream, v12, v9);
  uint64_t v13 = v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation, v8, v5);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, v5);
  uint64_t v15 = (objc_class *)type metadata accessor for AssertionNotification(0);
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  v14(&v16[OBJC_IVAR____TtC7CoreNFC21AssertionNotification_eventStreamContinuation], (uint64_t)v8, v5);
  v19.receiver = v16;
  v19.super_class = v15;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)(v0 + 112) = v17;
  return v0;
}

uint64_t sub_2214F87F4()
{
  uint64_t v1 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2214FE920();
  __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
  uint64_t v3 = sub_2214FE900();
  os_log_type_t v4 = sub_2214FEA60();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2214B8000, v3, v4, "NFCPresentmentSuppressionController.deinit", v5, 2u);
    MEMORY[0x223C83460](v5, -1, -1);
  }

  uint64_t v6 = v1 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA10();
  int v8 = *(void **)(v1 + 120);
  if (v8)
  {
    uint64_t v9 = self;
    id v10 = v8;
    id v11 = objc_msgSend(v9, sel_sharedHardwareManager);
    v16[4] = sub_2214F8A5C;
    v16[5] = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_2214FA280;
    v16[3] = &block_descriptor_18;
    id v12 = _Block_copy(v16);
    objc_msgSend(v11, sel_releasePresentmentSuppression_completion_, v10, v12);
    _Block_release(v12);
  }
  uint64_t v13 = v1 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStream;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_267F52958);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_defaultActor_destroy();
  return v1;
}

void sub_2214F8A5C(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_267F524C0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2214FE920();
    __swift_project_value_buffer(v3, (uint64_t)qword_267F53C90);
    id v4 = a1;
    id v5 = a1;
    oslog = sub_2214FE900();
    os_log_type_t v6 = sub_2214FEA60();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315650;
      sub_2214F9A3C(0x74696E696564, 0xE600000000000000, &v12);
      sub_2214FEAA0();
      *(_WORD *)(v7 + 12) = 2048;
      sub_2214FEAA0();
      *(_WORD *)(v7 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v9 = sub_2214FEB70();
      sub_2214F9A3C(v9, v10, &v12);
      sub_2214FEAA0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2214B8000, oslog, v6, "%s:%ld: %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x223C83460](v8, -1, -1);
      MEMORY[0x223C83460](v7, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_2214F8CC4()
{
  sub_2214F87F4();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2214F8CF0()
{
  return type metadata accessor for NFCPresentmentSuppressionController(0);
}

uint64_t type metadata accessor for NFCPresentmentSuppressionController(uint64_t a1)
{
  return sub_2214EBD20(a1, (uint64_t *)&unk_267F52C80);
}

void sub_2214F8D18()
{
  sub_2214F93C4(319, &qword_267F52C98, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_2214F93C4(319, &qword_267F52C70, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_2214F8E3C()
{
  *(void *)(v1 + 136) = v0;
  sub_2214F98D8();
  if (v0)
  {
    swift_getObjectType();
    uint64_t v2 = sub_2214FE9C0();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = 0;
  }
  return MEMORY[0x270FA2498](sub_2214F8ECC, v2, v4);
}

uint64_t sub_2214F8ECC()
{
  uint64_t v1 = v0[17];
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_2214F9048;
  uint64_t v2 = swift_continuation_init();
  id v3 = objc_msgSend(self, sel_sharedHardwareManager);
  uint64_t v4 = *(void *)(v1 + 112);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  v0[14] = sub_2214F9940;
  v0[15] = v5;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2214F984C;
  v0[13] = &block_descriptor_3;
  uint64_t v6 = _Block_copy(v0 + 10);
  swift_release();
  objc_msgSend(v3, sel_requestPresentmentSuppressionWithDelegate_completion_, v4, v6);
  _Block_release(v6);

  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2214F9048()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)v0;
  if (*(void *)(*(void *)v0 + 48))
  {
    swift_willThrow();
    id v3 = (uint64_t (*)(void))v2[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v1[17];
    v1[18] = v1[16];
    return MEMORY[0x270FA2498](sub_2214F9190, v5, 0);
  }
}

uint64_t sub_2214F9190()
{
  uint64_t v15 = v0;
  if (qword_267F524C0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_2214FE920();
  __swift_project_value_buffer(v2, (uint64_t)qword_267F53C90);
  id v3 = v1;
  uint64_t v4 = sub_2214FE900();
  os_log_type_t v5 = sub_2214FEA60();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[18];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v8 = 136315650;
    v0[10] = sub_2214F9A3C(0x2865726975716361, 0xE900000000000029, &v14);
    sub_2214FEAA0();
    *(_WORD *)(v8 + 12) = 2048;
    v0[10] = 98;
    sub_2214FEAA0();
    *(_WORD *)(v8 + 22) = 2048;
    v0[10] = objc_msgSend(v7, sel_unsignedLongLongValue);
    sub_2214FEAA0();

    _os_log_impl(&dword_2214B8000, v4, v5, "%s:%ld: handle=%llu", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C83460](v9, -1, -1);
    MEMORY[0x223C83460](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[17];
  id v11 = *(void **)(v10 + 120);
  *(void *)(v10 + 120) = v0[18];

  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

void sub_2214F93C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for NFCPresentmentSuppressionController.Event);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for NFCPresentmentSuppressionController.Event(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2214F94E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCPresentmentSuppressionController.Event()
{
  return &type metadata for NFCPresentmentSuppressionController.Event;
}

unint64_t sub_2214F951C()
{
  unint64_t result = qword_267F52CA0;
  if (!qword_267F52CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52CA0);
  }
  return result;
}

uint64_t sub_2214F9570(void *a1, id a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = a2;
    switch(sub_2214ED554(a2))
    {
      case 0xEu:
      case 0x20u:
        goto LABEL_12;
      case 0x45u:
      case 0x46u:
        sub_2214FA224();
        uint64_t v5 = swift_allocError();
        unsigned char *v9 = 0;
        goto LABEL_9;
      default:
        sub_2214FA224();
        uint64_t v5 = swift_allocError();
        *unsigned int v6 = 1;
LABEL_9:
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B20);
        swift_allocError();
        *uint64_t v10 = v5;
        uint64_t result = swift_continuation_throwingResumeWithError();
        break;
    }
  }
  else
  {
    if (!a1)
    {
LABEL_12:
      sub_2214FEB20();
      __break(1u);
      JUMPOUT(0x2214F9768);
    }
    **(void **)(*(void *)(a3 + 64) + 40) = a1;
    id v7 = a1;
    return swift_continuation_throwingResume();
  }
  return result;
}

void sub_2214F984C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_2214F98D8()
{
  unint64_t result = qword_267F52CA8;
  if (!qword_267F52CA8)
  {
    type metadata accessor for NFCPresentmentSuppressionController(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52CA8);
  }
  return result;
}

uint64_t sub_2214F9930()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214F9940(void *a1, void *a2)
{
  return sub_2214F9570(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2214F9960(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2214F999C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2214F99C4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2214F9A3C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2214FEAA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2214F9A3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2214F9B10(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2214FA1C8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2214FA1C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2214F9B10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2214FEAB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2214F9CCC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2214FEB00();
  if (!v8)
  {
    sub_2214FEB10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2214FEB40();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2214F9CCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2214F9D64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2214F9F44(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2214F9F44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2214F9D64(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2214F9EDC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2214FEAE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2214FEB10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2214FE990();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2214FEB40();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2214FEB10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2214F9EDC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52CB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2214F9F44(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52CB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2214FEB40();
  __break(1u);
  return result;
}

unsigned char **sub_2214FA094(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_2214FA0A4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2214FEB40();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_2214FA148@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2214FA1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2214FA224()
{
  unint64_t result = qword_267F52CB8;
  if (!qword_267F52CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F52CB8);
  }
  return result;
}

void sub_2214FA280(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t NFCTagReaderSession.upcastTag(_:)()
{
  return swift_unknownObjectRetain();
}

id NFCTagReaderSession.connectedTag.getter@<X0>(uint64_t a1@<X8>)
{
  id result = objc_msgSend(v1, sel_connectedTag);
  if (result)
  {
    id v4 = (void *)swift_unknownObjectRetain();
    sub_2214FCBEC(v4, a1);
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = -1;
  }
  return result;
}

id NFCTagReaderSession.init(pollingOption:delegate:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int64_t v7 = (objc_class *)type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper();
  int64_t v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a3;
  swift_unknownObjectWeakAssign();
  v14.receiver = v8;
  v14.super_class = v7;
  id v9 = objc_msgSendSuper2(&v14, sel_init);
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v11 = v9;
  id v12 = objc_msgSend(v10, sel_initWithPollingOption_swiftDelegate_queue_, a1, v11, a4);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t NFCTagReaderSession.connect(to:completionHandler:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  v7[4] = a2;
  v7[5] = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214FA280;
  v7[3] = &block_descriptor_4;
  uint64_t v5 = _Block_copy(v7);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_connectToTag_completionHandler_, v4, v5);
  _Block_release(v5);
  return swift_unknownObjectRelease();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t NFCFeliCaPollingResponse.manufactureParameter.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2214E5490(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t NFCFeliCaPollingResponse.manufactureParameter.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5534(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*NFCFeliCaPollingResponse.manufactureParameter.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaPollingResponse.requestData.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2214E547C(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t NFCFeliCaPollingResponse.requestData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5520(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NFCFeliCaPollingResponse.requestData.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaPollingResponse.init(manufactureParameter:requestData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t NFCFeliCaStatusFlag.statusFlag1.getter()
{
  return *(void *)v0;
}

uint64_t NFCFeliCaStatusFlag.statusFlag1.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaStatusFlag.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaStatusFlag.statusFlag2.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t NFCFeliCaStatusFlag.statusFlag2.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaStatusFlag.statusFlag2.modify())()
{
  return nullsub_1;
}

CoreNFC::NFCFeliCaStatusFlag __swiftcall NFCFeliCaStatusFlag.init(statusFlag1:statusFlag2:)(Swift::Int statusFlag1, Swift::Int statusFlag2)
{
  *uint64_t v2 = statusFlag1;
  v2[1] = statusFlag2;
  result.statusFlag2 = statusFlag2;
  result.statusFlag1 = statusFlag1;
  return result;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag1.getter()
{
  return *(void *)v0;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag1.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag2.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag2.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.statusFlag2.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.init(statusFlag1:statusFlag2:encryptionIdentifier:nodeKeyVersionListAES:nodeKeyVersionListDES:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.getter()
{
  return *(void *)v0;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.basicVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2214E547C(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.basicVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5520(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.basicVersion.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.optionVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2214E547C(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.optionVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5520(*(void *)(v2 + 32), *(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.optionVersion.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.init(statusFlag1:statusFlag2:basicVersion:optionVersion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

void NFCFeliCaTag.polling(systemCode:requestCode:timeSlot:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int64_t v7 = v6;
  id v12 = (void *)sub_2214FE880();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a5;
  *(void *)(v13 + 24) = a6;
  void v15[4] = sub_2214FAC94;
  v15[5] = v13;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  void v15[2] = sub_2214FAC9C;
  v15[3] = &block_descriptor_5;
  objc_super v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_pollingWithSystemCode_requestCode_timeSlot_completionHandler_, v12, a3, a4, v14);
  _Block_release(v14);
}

void sub_2214FAAC0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, id a5, void (*a6)(uint64_t *))
{
  id v7 = a5;
  if (a5)
  {
    uint64_t v18 = (uint64_t)a5;
    unint64_t v19 = 0;
    id v20 = 0;
    unint64_t v21 = 0;
    char v22 = 1;
    id v8 = a5;
    a6(&v18);
  }
  else
  {
    unint64_t v10 = 0xF000000000000000;
    switch(a4 >> 62)
    {
      case 1uLL:
        LODWORD(v14) = HIDWORD(a3) - a3;
        if (__OFSUB__(HIDWORD(a3), a3))
        {
          __break(1u);
LABEL_14:
          __break(1u);
          JUMPOUT(0x2214FAC4CLL);
        }
        uint64_t v14 = (int)v14;
LABEL_8:
        if (v14 < 1)
        {
          id v7 = 0;
        }
        else
        {
          sub_2214E5490(a3, a4);
          id v7 = (id)a3;
          unint64_t v10 = a4;
        }
LABEL_11:
        uint64_t v18 = a1;
        unint64_t v19 = a2;
        id v20 = v7;
        unint64_t v21 = v10;
        char v22 = 0;
        sub_2214E5490(a1, a2);
        sub_2214E547C((uint64_t)v7, v10);
        sub_2214E5490(a1, a2);
        sub_2214E547C((uint64_t)v7, v10);
        a6(&v18);
        sub_2214E5534(a1, a2);
        sub_2214E5520((uint64_t)v7, v10);
        sub_2214E5520((uint64_t)v7, v10);
        sub_2214E5534(a1, a2);
        sub_2214E5520((uint64_t)v7, v10);
        break;
      case 2uLL:
        uint64_t v16 = *(void *)(a3 + 16);
        uint64_t v15 = *(void *)(a3 + 24);
        BOOL v17 = __OFSUB__(v15, v16);
        uint64_t v14 = v15 - v16;
        if (!v17) {
          goto LABEL_8;
        }
        goto LABEL_14;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v14 = BYTE6(a4);
        goto LABEL_8;
    }
  }
}

uint64_t sub_2214FAC5C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2214FAC94(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  sub_2214FAAC0(a1, a2, a3, a4, a5, *(void (**)(uint64_t *))(v5 + 16));
}

uint64_t sub_2214FAC9C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  id v8 = a2;
  uint64_t v9 = sub_2214FE890();
  unint64_t v11 = v10;

  id v12 = a3;
  uint64_t v13 = sub_2214FE890();
  unint64_t v15 = v14;

  id v16 = a4;
  v7(v9, v11, v13, v15, a4);

  sub_2214E5534(v13, v15);
  sub_2214E5534(v9, v11);

  return swift_release();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void NFCFeliCaTag.requestService(nodeCodeList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (void *)sub_2214FE9A0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214FAE8C;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  void v9[2] = sub_2214FAEA8;
  v9[3] = &block_descriptor_11;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_requestServiceWithNodeCodeList_completionHandler_, v6, v8);
  _Block_release(v8);
}

void sub_2214FAE8C(int a1, void *a2)
{
  sub_2214FB018(a1, a2, *(void (**)(void))(v2 + 16));
}

void sub_2214FAEA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = sub_2214FE9B0();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

void NFCFeliCaTag.requestResponse(resultHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_2214FB090;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214FB098;
  v7[3] = &block_descriptor_17;
  id v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestResponseWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_2214FB018(int a1, id a2, void (*a3)(void))
{
  if (a2)
  {
    id v5 = a2;
    ((void (*)(id, uint64_t))a3)(a2, 1);
  }
  else
  {
    a3();
  }
}

void sub_2214FB090(int a1, void *a2)
{
  sub_2214FB018(a1, a2, *(void (**)(void))(v2 + 16));
}

void sub_2214FB098(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void NFCFeliCaTag.readWithoutEncryption(serviceCodeList:blockList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_2214FE9A0();
  id v8 = (void *)sub_2214FE9A0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v11[4] = sub_2214FB2C8;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  uint64_t v11[2] = sub_2214FB2D0;
  v11[3] = &block_descriptor_23;
  unint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler_, v7, v8, v10);
  _Block_release(v10);
}

void sub_2214FB230(void *a1, uint64_t a2, uint64_t a3, id a4, void (*a5)(id *))
{
  if (a4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id v8 = a4;
    char v11 = 1;
    id v7 = a4;
    a5(&v8);
  }
  else
  {
    id v8 = a1;
    uint64_t v9 = a2;
    uint64_t v10 = a3;
    char v11 = 0;
    swift_bridgeObjectRetain();
    a5(&v8);
    swift_bridgeObjectRelease();
  }
}

void sub_2214FB2C8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2214FB230(a1, a2, a3, a4, *(void (**)(id *))(v4 + 16));
}

void sub_2214FB2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v9 = sub_2214FE9B0();
  swift_retain();
  id v10 = a5;
  v8(a2, a3, v9, a5);
  swift_release();
  swift_bridgeObjectRelease();
}

void NFCFeliCaTag.writeWithoutEncryption(serviceCodeList:blockList:blockData:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = (void *)sub_2214FE9A0();
  uint64_t v9 = (void *)sub_2214FE9A0();
  id v10 = (void *)sub_2214FE9A0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  void v13[4] = sub_2214FB4BC;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2214FB4D8;
  v13[3] = &block_descriptor_29;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler_, v8, v9, v10, v12);
  _Block_release(v12);
}

void sub_2214FB4BC(void *a1, uint64_t a2, void *a3)
{
  sub_2214FBE50(a1, a2, a3, *(void (**)(id *))(v3 + 16));
}

void sub_2214FB4D8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

void NFCFeliCaTag.requestSystemCode(resultHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_2214FC9E0;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214FAEA8;
  v7[3] = &block_descriptor_35;
  id v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestSystemCodeWithCompletionHandler_, v6);
  _Block_release(v6);
}

void NFCFeliCaTag.requestServiceV2(nodeCodeList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)sub_2214FE9A0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214FB838;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  void v9[2] = sub_2214FB840;
  v9[3] = &block_descriptor_41;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_requestServiceV2WithNodeCodeList_completionHandler_, v6, v8);
  _Block_release(v8);
}

void sub_2214FB740(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, id a6, void (*a7)(id *))
{
  if (a6)
  {
    id v15 = a6;
    long long v16 = 0u;
    long long v17 = 0u;
    char v18 = 1;
    id v9 = a6;
    a7(&v15);

    return;
  }
  uint64_t v10 = a5;
  uint64_t v11 = a4;
  if (!*(void *)(a4 + 16))
  {
    uint64_t v11 = 0;
    if (*(void *)(a5 + 16)) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  if (!*(void *)(v10 + 16)) {
    goto LABEL_7;
  }
LABEL_5:
  swift_bridgeObjectRetain();
LABEL_8:
  id v15 = a1;
  *(void *)&long long v16 = a2;
  *((void *)&v16 + 1) = a3;
  *(void *)&long long v17 = v11;
  *((void *)&v17 + 1) = v10;
  char v18 = 0;
  a7(&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_2214FB838(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  sub_2214FB740(a1, a2, a3, a4, a5, a6, *(void (**)(id *))(v6 + 16));
}

void sub_2214FB840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v12 = sub_2214FE9B0();
  uint64_t v13 = sub_2214FE9B0();
  swift_retain();
  id v14 = a7;
  v11(a2, a3, a4, v12, v13, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void NFCFeliCaTag.requestSpecificationVersion(resultHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_2214FBC58;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214FBC80;
  v7[3] = &block_descriptor_47;
  uint64_t v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestSpecificationVersionWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_2214FBA04(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, id a7, void (*a8)(id *), uint64_t a9)
{
  id v10 = a7;
  if (a7)
  {
    id v28 = a7;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v31 = 0;
    char v32 = 1;
    id v11 = a7;
    a8(&v28);
  }
  else
  {
    unint64_t v13 = 0xF000000000000000;
    switch(a4 >> 62)
    {
      case 1uLL:
        LODWORD(v19) = HIDWORD(a3) - a3;
        if (__OFSUB__(HIDWORD(a3), a3))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          JUMPOUT(0x2214FBC38);
        }
        uint64_t v19 = (int)v19;
LABEL_8:
        if (v19 < 1)
        {
          id v10 = 0;
        }
        else
        {
          sub_2214E5490(a3, a4);
          id v10 = (id)a3;
          unint64_t v13 = a4;
        }
LABEL_11:
        unint64_t v23 = 0xF000000000000000;
        uint64_t v24 = 0;
        switch(a6 >> 62)
        {
          case 1uLL:
            LODWORD(v25) = HIDWORD(a5) - a5;
            if (__OFSUB__(HIDWORD(a5), a5)) {
              goto LABEL_23;
            }
            uint64_t v25 = (int)v25;
LABEL_16:
            if (v25 < 1)
            {
              uint64_t v24 = 0;
            }
            else
            {
              sub_2214E5490(a5, a6);
              uint64_t v24 = a5;
              unint64_t v23 = a6;
            }
LABEL_19:
            id v28 = a1;
            *(void *)&long long v29 = a2;
            *((void *)&v29 + 1) = v10;
            *(void *)&long long v30 = v13;
            *((void *)&v30 + 1) = v24;
            unint64_t v31 = v23;
            char v32 = 0;
            sub_2214E547C((uint64_t)v10, v13);
            sub_2214E547C(v24, v23);
            sub_2214E547C((uint64_t)v10, v13);
            sub_2214E547C(v24, v23);
            a8(&v28);
            sub_2214E5520((uint64_t)v10, v13);
            sub_2214E5520(v24, v23);
            sub_2214E5520(v24, v23);
            sub_2214E5520((uint64_t)v10, v13);
            sub_2214E5520((uint64_t)v10, v13);
            sub_2214E5520(v24, v23);
            break;
          case 2uLL:
            uint64_t v27 = *(void *)(a5 + 16);
            uint64_t v26 = *(void *)(a5 + 24);
            BOOL v22 = __OFSUB__(v26, v27);
            uint64_t v25 = v26 - v27;
            if (!v22) {
              goto LABEL_16;
            }
            goto LABEL_24;
          case 3uLL:
            goto LABEL_19;
          default:
            uint64_t v25 = BYTE6(a6);
            goto LABEL_16;
        }
        break;
      case 2uLL:
        uint64_t v21 = *(void *)(a3 + 16);
        uint64_t v20 = *(void *)(a3 + 24);
        BOOL v22 = __OFSUB__(v20, v21);
        uint64_t v19 = v20 - v21;
        if (!v22) {
          goto LABEL_8;
        }
        goto LABEL_22;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v19 = BYTE6(a4);
        goto LABEL_8;
    }
  }
}

void sub_2214FBC58(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, void *a7)
{
  sub_2214FBA04(a1, a2, a3, a4, a5, a6, a7, *(void (**)(id *))(v7 + 16), *(void *)(v7 + 24));
}

uint64_t sub_2214FBC80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  id v12 = a4;
  uint64_t v13 = sub_2214FE890();
  unint64_t v15 = v14;

  id v16 = a5;
  uint64_t v17 = sub_2214FE890();
  unint64_t v19 = v18;

  id v20 = a6;
  v11(a2, a3, v13, v15, v17, v19, a6);

  sub_2214E5534(v17, v19);
  sub_2214E5534(v13, v15);

  return swift_release();
}

void NFCFeliCaTag.resetMode(resultHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_2214FC9B8;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2214FB4D8;
  v7[3] = &block_descriptor_53;
  uint64_t v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_resetModeWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_2214FBE50(void *a1, uint64_t a2, id a3, void (*a4)(id *))
{
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = 0;
    char v9 = 1;
    id v6 = a3;
    a4(&v7);
  }
  else
  {
    id v7 = a1;
    uint64_t v8 = a2;
    char v9 = 0;
    a4(&v7);
  }
}

void NFCFeliCaTag.sendFeliCaCommand(commandPacket:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)sub_2214FE880();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  v10[4] = sub_2214E5EDC;
  v10[5] = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2214E5EE4;
  void v10[3] = &block_descriptor_59;
  char v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_sendFeliCaCommandPacket_completionHandler_, v7, v9);
  _Block_release(v9);
}

uint64_t initializeBufferWithCopyOfBuffer for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NFCFeliCaPollingResponse(uint64_t *a1)
{
  uint64_t result = sub_2214E5534(*a1, a1[1]);
  unint64_t v3 = a1[3];
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = a1[2];
    return sub_2214E5534(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for NFCFeliCaPollingResponse(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2214E5490(*a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  id v6 = a2 + 2;
  unint64_t v7 = a2[3];
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v6;
  }
  else
  {
    uint64_t v8 = *v6;
    sub_2214E5490(*v6, v7);
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t *assignWithCopy for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2214E5490(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2214E5534(v6, v7);
  uint64_t v8 = a2 + 2;
  unint64_t v9 = a2[3];
  if ((unint64_t)a1[3] >> 60 != 15)
  {
    if (v9 >> 60 != 15)
    {
      uint64_t v11 = *v8;
      sub_2214E5490(*v8, v9);
      uint64_t v12 = a1[2];
      unint64_t v13 = a1[3];
      a1[2] = v11;
      a1[3] = v9;
      sub_2214E5534(v12, v13);
      return a1;
    }
    sub_2214E5A6C((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v8;
    return a1;
  }
  uint64_t v10 = *v8;
  sub_2214E5490(*v8, v9);
  a1[2] = v10;
  a1[3] = v9;
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2214E5534(v4, v5);
  uint64_t v6 = (uint64_t *)(a2 + 16);
  unint64_t v7 = a1[3];
  if (v7 >> 60 != 15)
  {
    unint64_t v8 = *(void *)(a2 + 24);
    if (v8 >> 60 != 15)
    {
      uint64_t v9 = a1[2];
      a1[2] = *v6;
      a1[3] = v8;
      sub_2214E5534(v9, v7);
      return a1;
    }
    sub_2214E5A6C((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaPollingResponse(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaPollingResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaPollingResponse()
{
  return &type metadata for NFCFeliCaPollingResponse;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaStatusFlag(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaStatusFlag(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaStatusFlag()
{
  return &type metadata for NFCFeliCaStatusFlag;
}

uint64_t destroy for NFCFeliCaRequsetServiceV2Response()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NFCFeliCaRequsetServiceV2Response(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NFCFeliCaRequsetServiceV2Response(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NFCFeliCaRequsetServiceV2Response(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaRequsetServiceV2Response(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaRequsetServiceV2Response(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaRequsetServiceV2Response()
{
  return &type metadata for NFCFeliCaRequsetServiceV2Response;
}

uint64_t destroy for NFCFeliCaRequestSpecificationVersionResponse(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 24);
  if (v2 >> 60 != 15) {
    __n128 result = sub_2214E5534(*(void *)(result + 16), v2);
  }
  unint64_t v3 = *(void *)(v1 + 40);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(v1 + 32);
    return sub_2214E5534(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
  }
  else
  {
    uint64_t v6 = *v4;
    sub_2214E5490(*v4, *(void *)(a2 + 24));
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v5;
  }
  unint64_t v7 = (uint64_t *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
  }
  else
  {
    uint64_t v9 = *v7;
    sub_2214E5490(*v7, v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v8;
  }
  return a1;
}

void *assignWithCopy for NFCFeliCaRequestSpecificationVersionResponse(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = a1 + 2;
  unint64_t v5 = a2 + 2;
  unint64_t v6 = a2[3];
  if (a1[3] >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v7 = *v5;
      sub_2214E5490(*v5, a2[3]);
      a1[2] = v7;
      a1[3] = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
    sub_2214E5A6C((uint64_t)(a1 + 2));
LABEL_6:
    *uint64_t v4 = *(_OWORD *)v5;
    goto LABEL_8;
  }
  uint64_t v8 = *v5;
  sub_2214E5490(*v5, a2[3]);
  uint64_t v9 = a1[2];
  unint64_t v10 = a1[3];
  a1[2] = v8;
  a1[3] = v6;
  sub_2214E5534(v9, v10);
LABEL_8:
  uint64_t v11 = a2 + 4;
  unint64_t v12 = a2[5];
  if (a1[5] >> 60 != 15)
  {
    if (v12 >> 60 != 15)
    {
      uint64_t v14 = *v11;
      sub_2214E5490(*v11, v12);
      uint64_t v15 = a1[4];
      unint64_t v16 = a1[5];
      a1[4] = v14;
      a1[5] = v12;
      sub_2214E5534(v15, v16);
      return a1;
    }
    sub_2214E5A6C((uint64_t)(a1 + 4));
    goto LABEL_13;
  }
  if (v12 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v11;
    return a1;
  }
  uint64_t v13 = *v11;
  sub_2214E5490(*v11, v12);
  a1[4] = v13;
  a1[5] = v12;
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 16);
  unint64_t v5 = (_OWORD *)(a2 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v7 = *(void *)(a2 + 24);
  if (v7 >> 60 == 15)
  {
    sub_2214E5A6C(a1 + 16);
LABEL_4:
    *uint64_t v4 = *v5;
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)v5;
  *(void *)(a1 + 24) = v7;
  sub_2214E5534(v8, v6);
LABEL_6:
  uint64_t v9 = (void *)(a2 + 32);
  unint64_t v10 = *(void *)(a1 + 40);
  if (v10 >> 60 != 15)
  {
    unint64_t v11 = *(void *)(a2 + 40);
    if (v11 >> 60 != 15)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(void *)(a1 + 32) = *v9;
      *(void *)(a1 + 40) = v11;
      sub_2214E5534(v12, v10);
      return a1;
    }
    sub_2214E5A6C(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 12);
  }
  uint64_t v3 = *(void *)(a1 + 24) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    int v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaRequestSpecificationVersionResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaRequestSpecificationVersionResponse()
{
  return &type metadata for NFCFeliCaRequestSpecificationVersionResponse;
}

uint64_t NFCNDEFPayload.wellKnownTypeTextPayload()(uint64_t a1)
{
  unint64_t v2 = v1;
  v15[1] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52CD0);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = 0;
  id v6 = objc_msgSend(v2, sel_wellKnownTypeTextPayloadWithLocale_, v15);
  id v7 = v15[0];
  if (!v6)
  {
    id v12 = v15[0];
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = sub_2214FE8C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
    goto LABEL_6;
  }
  uint64_t v8 = v6;
  uint64_t v9 = sub_2214FE960();
  id v10 = v7;

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  sub_2214FE8B0();
  uint64_t v11 = sub_2214FE8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 0, 1, v11);
LABEL_6:
  sub_2214FCB84((uint64_t)v5, a1);

  return v9;
}

uint64_t sub_2214FCB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F52CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2214FCBEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_asNFCFeliCaTag);
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
LABEL_9:
    uint64_t result = swift_unknownObjectRelease();
    *(void *)a2 = v5;
    *(unsigned char *)(a2 + 8) = v6;
    return result;
  }
  id v7 = objc_msgSend(a1, sel_asNFCISO15693Tag);
  if (v7)
  {
    id v5 = v7;
    char v6 = 2;
    goto LABEL_9;
  }
  id v8 = objc_msgSend(a1, sel_asNFCISO7816Tag);
  if (v8)
  {
    id v5 = v8;
    char v6 = 1;
    goto LABEL_9;
  }
  id v9 = objc_msgSend(a1, sel_asNFCMiFareTag);
  if (v9)
  {
    id v5 = v9;
    char v6 = 3;
    goto LABEL_9;
  }
  uint64_t result = sub_2214FEB20();
  __break(1u);
  return result;
}

id NFCTag.isAvailable.getter()
{
  return objc_msgSend(*v0, sel_isAvailable);
}

uint64_t initializeBufferWithCopyOfBuffer for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for NFCTag()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCTag(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCTag(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2214FCE98(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2214FCEA0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCTag()
{
  return &type metadata for NFCTag;
}

uint64_t type metadata accessor for NFCAtomicWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t NFCISO15693SystemInfo.uniqueIdentifier.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2214E5490(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t NFCISO15693SystemInfo.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2214E5534(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.dataStorageFormatIdentifier.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t NFCISO15693SystemInfo.dataStorageFormatIdentifier.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.dataStorageFormatIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.applicationFamilyIdentifier.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t NFCISO15693SystemInfo.applicationFamilyIdentifier.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.applicationFamilyIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.blockSize.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t NFCISO15693SystemInfo.blockSize.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.blockSize.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.totalBlocks.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t NFCISO15693SystemInfo.totalBlocks.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.totalBlocks.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.icReference.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t NFCISO15693SystemInfo.icReference.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.icReference.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.init(uniqueIdentifier:dataStorageFormatIdentifier:applicationFamilyIdentifier:blockSize:totalBlocks:icReference:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = result;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

uint64_t NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.modify())()
{
  return nullsub_1;
}

CoreNFC::NFCISO15693MultipleBlockSecurityStatus __swiftcall NFCISO15693MultipleBlockSecurityStatus.init(blockSecurityStatus:)(CoreNFC::NFCISO15693MultipleBlockSecurityStatus blockSecurityStatus)
{
  v1->blockSecurityStatus._rawValue = blockSecurityStatus.blockSecurityStatus._rawValue;
  return blockSecurityStatus;
}

void NFCISO15693Tag.readSingleBlock(requestFlags:blockNumber:resultHandler:)(unsigned __int8 a1, unsigned __int8 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v11[4] = sub_2214FE828;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  uint64_t v11[2] = sub_2214E5EE4;
  v11[3] = &block_descriptor_6;
  id v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_readSingleBlockWithRequestFlags_blockNumber_completionHandler_, a1, a2, v10);
  _Block_release(v10);
}

uint64_t sub_2214FD1B8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void NFCISO15693Tag.readMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void NFCISO15693Tag.getSystemInfo(requestFlags:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214FD45C;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  void v9[2] = sub_2214FD484;
  v9[3] = &block_descriptor_16;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_getSystemInfoAndUIDWithRequestFlag_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_2214FD348(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, id a8, void (*a9)(uint64_t *), uint64_t a10)
{
  if (a8)
  {
    uint64_t v14 = (uint64_t)a8;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    char v18 = 1;
    id v11 = a8;
    a9(&v14);
  }
  else if (a2 >> 60 == 15)
  {
    sub_2214FEB20();
    __break(1u);
  }
  else
  {
    uint64_t v14 = a1;
    *(void *)&long long v15 = a2;
    *((void *)&v15 + 1) = a3;
    *(void *)&long long v16 = a4;
    *((void *)&v16 + 1) = a5;
    *(void *)&long long v17 = a6;
    *((void *)&v17 + 1) = a7;
    char v18 = 0;
    sub_2214E5490(a1, a2);
    a9(&v14);
    sub_2214E5520(a1, a2);
  }
}

void sub_2214FD45C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  sub_2214FD348(a1, a2, a3, a4, a5, a6, a7, a8, *(void (**)(uint64_t *))(v8 + 16), *(void *)(v8 + 24));
}

uint64_t sub_2214FD484(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v13 = a2;
  uint64_t v14 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v15 = v13;
    uint64_t v13 = (void *)sub_2214FE890();
    unint64_t v17 = v16;
  }
  else
  {
    swift_retain();
    unint64_t v17 = 0xF000000000000000;
  }
  id v18 = a8;
  v14(v13, v17, a3, a4, a5, a6, a7, a8);

  sub_2214E5520((uint64_t)v13, v17);

  return swift_release();
}

void NFCISO15693Tag.fastReadMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void NFCISO15693Tag.customCommand(requestFlags:customCommandCode:customRequestParameters:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (void *)sub_2214FE880();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  v14[4] = sub_2214FD6D8;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2214E5EE4;
  v14[3] = &block_descriptor_28;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler_, a1, a2, v11, v13);
  _Block_release(v13);
}

void sub_2214FD6D8(int a1, int a2, void *a3)
{
  sub_2214E5E28(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

void NFCISO15693Tag.extendedReadSingleBlock(requestFlags:blockNumber:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v11[4] = sub_2214FE828;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  uint64_t v11[2] = sub_2214E5EE4;
  v11[3] = &block_descriptor_34;
  id v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler_, a1, a2, v10);
  _Block_release(v10);
}

void NFCISO15693Tag.extendedWriteMultipleBlocks(requestFlags:blockRange:dataBlocks:completionHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = (void *)sub_2214FE9A0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  *(void *)(v14 + 24) = a6;
  v16[4] = sub_2214FD914;
  v16[5] = v14;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_2214FA280;
  v16[3] = &block_descriptor_40;
  id v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler_, a1, a2, a3, v13, v15);
  _Block_release(v15);
}

uint64_t sub_2214FD914()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void NFCISO15693Tag.authenticate(requestFlags:cryptoSuiteIdentifier:message:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
}

uint64_t sub_2214FD98C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  id v8 = a3;
  uint64_t v9 = sub_2214FE890();
  unint64_t v11 = v10;

  id v12 = a4;
  v7(a2, v9, v11, a4);

  sub_2214E5534(v9, v11);

  return swift_release();
}

void NFCISO15693Tag.keyUpdate(requestFlags:keyIdentifier:message:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
}

void sub_2214FDA8C(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, SEL *a11)
{
  unint64_t v16 = (void *)sub_2214FE880();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = a6;
  v19[4] = a9;
  v19[5] = v17;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1107296256;
  v19[2] = sub_2214FD98C;
  v19[3] = a10;
  id v18 = _Block_copy(v19);
  swift_retain();
  swift_release();
  objc_msgSend(v11, *a11, a1, a2, v16, v18);
  _Block_release(v18);
}

void NFCISO15693Tag.challenge(requestFlags:cryptoSuiteIdentifier:message:completionHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v11 = (void *)sub_2214FE880();
  void v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2214FA280;
  v13[3] = &block_descriptor_55_0;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler_, a1, a2, v11, v12);
  _Block_release(v12);
}

void NFCISO15693Tag.readBuffer(requestFlags:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_2214FDD78;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  void v9[2] = sub_2214FD98C;
  v9[3] = &block_descriptor_61;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_readBufferWithRequestFlags_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_2214FDD78(unsigned __int8 a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2214FE38C(a1, a2, a3, a4, *(void (**)(id, uint64_t, uint64_t, uint64_t))(v4 + 16), *(void *)(v4 + 24), (void (*)(uint64_t, uint64_t))sub_2214E5490, (void (*)(uint64_t, uint64_t))sub_2214E5534);
}

void NFCISO15693Tag.extendedGetMultipleBlockSecurityStatus(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  void v13[4] = sub_2214FE070;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2214FE078;
  v13[3] = &block_descriptor_67;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler_, a1, a2, a3, v12);
  _Block_release(v12);
}

void sub_2214FDEC4(unint64_t a1, void *a2, void (*a3)(void **), uint64_t a4)
{
  if (a2)
  {
    unint64_t v19 = a2;
    char v20 = 1;
    uint64_t v7 = a2;
    a3(&v19);

    return;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2214FEB30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  if (!v9) {
    goto LABEL_15;
  }
  unint64_t v19 = (void *)MEMORY[0x263F8EE78];
  sub_2214E508C(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = a4;
    id v18 = a3;
    uint64_t v11 = 0;
    unint64_t v10 = v19;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x223C829F0](v11, a1);
      }
      else {
        id v12 = *(id *)(a1 + 8 * v11 + 32);
      }
      uint64_t v13 = v12;
      id v14 = objc_msgSend(v12, sel_integerValue, v17, v18);

      unint64_t v19 = v10;
      unint64_t v16 = v10[2];
      unint64_t v15 = v10[3];
      if (v16 >= v15 >> 1)
      {
        sub_2214E508C(v15 > 1, v16 + 1, 1);
        unint64_t v10 = v19;
      }
      ++v11;
      v10[2] = v16 + 1;
      v10[v16 + 4] = v14;
    }
    while (v9 != v11);
    a3 = v18;
LABEL_15:
    unint64_t v19 = v10;
    char v20 = 0;
    a3(&v19);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void sub_2214FE070(unint64_t a1, void *a2)
{
  sub_2214FDEC4(a1, a2, *(void (**)(void **))(v2 + 16), *(void *)(v2 + 24));
}

void sub_2214FE078(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_2214FE780();
  uint64_t v5 = sub_2214FE9B0();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

void NFCISO15693Tag.extendedFastReadMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void sub_2214FE168(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a4;
  *(void *)(v17 + 24) = a5;
  v19[4] = a8;
  v19[5] = v17;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1107296256;
  v19[2] = sub_2214FAEA8;
  v19[3] = a9;
  id v18 = _Block_copy(v19);
  swift_retain();
  swift_release();
  objc_msgSend(v10, *a10, a1, a2, a3, v18);
  _Block_release(v18);
}

void NFCISO15693Tag.sendRequest(requestFlags:commandCode:data:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 >> 60 == 15) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = (void *)sub_2214FE880();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  v14[4] = sub_2214FE474;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2214FE4B8;
  v14[3] = &block_descriptor_79;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_sendRequestWithFlag_commandCode_data_completionHandler_, a1, a2, v11, v13);
  _Block_release(v13);
}

void sub_2214FE38C(unsigned __int8 a1, uint64_t a2, uint64_t a3, id a4, void (*a5)(id, uint64_t, uint64_t, uint64_t), uint64_t a6, void (*a7)(uint64_t, uint64_t), void (*a8)(uint64_t, uint64_t))
{
  if (a4)
  {
    id v10 = a4;
    a5(a4, 0, 0, 1);
  }
  else
  {
    unint64_t v13 = a1;
    a7(a2, a3);
    a5((id)v13, a2, a3, 0);
    a8(a2, a3);
  }
}

void sub_2214FE474(unsigned __int8 a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2214FE38C(a1, a2, a3, a4, *(void (**)(id, uint64_t, uint64_t, uint64_t))(v4 + 16), *(void *)(v4 + 24), (void (*)(uint64_t, uint64_t))sub_2214E547C, (void (*)(uint64_t, uint64_t))sub_2214E5520);
}

uint64_t sub_2214FE4B8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(uint64_t, void *, unint64_t, void *))(a1 + 32);
  if (a3)
  {
    swift_retain();
    id v8 = v5;
    uint64_t v5 = (void *)sub_2214FE890();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a4;
  v7(a2, v5, v10, a4);

  sub_2214E5520((uint64_t)v5, v10);

  return swift_release();
}

uint64_t destroy for NFCISO15693SystemInfo(uint64_t a1)
{
  return sub_2214E5534(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t initializeWithCopy for NFCISO15693SystemInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_2214E5490(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t *assignWithCopy for NFCISO15693SystemInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2214E5490(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2214E5534(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NFCISO15693SystemInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2214E5534(v4, v5);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCISO15693SystemInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCISO15693SystemInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCISO15693SystemInfo()
{
  return &type metadata for NFCISO15693SystemInfo;
}

ValueMetadata *type metadata accessor for NFCISO15693MultipleBlockSecurityStatus()
{
  return &type metadata for NFCISO15693MultipleBlockSecurityStatus;
}

unint64_t sub_2214FE780()
{
  unint64_t result = qword_267F52EE0;
  if (!qword_267F52EE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F52EE0);
  }
  return result;
}

uint64_t sub_2214FE860()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2214FE870()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_2214FE880()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2214FE890()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2214FE8A0()
{
  return MEMORY[0x270EF0278]();
}

uint64_t sub_2214FE8B0()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_2214FE8C0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2214FE8D0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2214FE8E0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2214FE8F0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2214FE900()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2214FE910()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2214FE920()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2214FE930()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2214FE940()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_2214FE950()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2214FE960()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2214FE970()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2214FE980()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2214FE990()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2214FE9A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2214FE9B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2214FE9C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2214FE9D0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2214FE9E0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2214FE9F0()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_2214FEA00()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2214FEA10()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2214FEA20()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2214FEA50()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2214FEA60()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2214FEA70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2214FEA80()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2214FEA90()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2214FEAA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2214FEAB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2214FEAC0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2214FEAD0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2214FEAE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2214FEAF0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2214FEB00()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2214FEB10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2214FEB20()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2214FEB30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2214FEB40()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2214FEB50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2214FEB60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2214FEB70()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2214FEB80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2214FEB90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2214FEBA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2214FEBB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2214FEBC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2214FEBD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2214FEBE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t NFLogGetLogger()
{
  return MEMORY[0x270F9A2C0]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x270F9A328]();
}

uint64_t NFSharedSignpostLog()
{
  return MEMORY[0x270F9A340]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x270F9A4A0](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}