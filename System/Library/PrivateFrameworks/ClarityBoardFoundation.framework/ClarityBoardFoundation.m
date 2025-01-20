void sub_249EC7A94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_249EC7D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_249EC7F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249EC8734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249EC89A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_249EC8BF8()
{
  uint64_t v0 = sub_249ED2E58();
  __swift_allocate_value_buffer(v0, static Logger.common);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  id v1 = objc_msgSend(self, sel_commonLog);
  return sub_249ED2E68();
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  if (qword_269749008 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_249ED2E58();

  return __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269749008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_249ED2E58();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t variable initialization expression of OpenApplicationVerifierResult.error()
{
  return 0;
}

uint64_t variable initialization expression of OpenApplicationVerifierResult.pptTestURL@<X0>(uint64_t a1@<X8>)
{
  return sub_249EC8E0C(MEMORY[0x263F06EA8], a1);
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._navigationTitles()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._chromeVisible()
{
  return 1;
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._bottomBarTransitionProgress()
{
  return 0;
}

uint64_t variable initialization expression of LockState.lockStateChangedBlockIdentifier@<X0>(uint64_t a1@<X8>)
{
  return sub_249EC8E0C(MEMORY[0x263F07508], a1);
}

uint64_t sub_249EC8E0C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(a2, 1, 1, v3);
}

uint64_t variable initialization expression of LockState._isLocked()
{
  return 1;
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

uint64_t OpenApplicationVerifierRequest.verifierDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_249ED3188();
  sub_249ED2FA8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  sub_249ED2FA8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  sub_249ED2FA8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  sub_249ED2FA8();
  v4 = *(void (**)(uint64_t, uint64_t))(a2 + 40);
  v4(a1, a2);
  if (v5)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
    if (v6)
    {
      v7 = (void *)v6;
      sub_249ED3188();
      swift_bridgeObjectRelease();
      strcpy((char *)v13, "bundle id: ");
      HIDWORD(v13[1]) = -352321536;
      sub_249ED2FA8();
      swift_bridgeObjectRelease();
      sub_249ED2FA8();
      id v8 = objc_msgSend(v7, sel_description, v13[0]);
LABEL_9:
      id v11 = v8;
      sub_249ED2F78();

      sub_249ED2FA8();
      swift_bridgeObjectRelease();
      sub_249ED2FA8();

      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  v4(a1, a2);
  if (!v9)
  {
    v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
    if (!v10)
    {
      sub_249ED2FA8();
      goto LABEL_11;
    }
    v7 = v10;
    strcpy((char *)v13, "process id: ");
    BYTE5(v13[1]) = 0;
    HIWORD(v13[1]) = -5120;
    id v8 = objc_msgSend(v10, sel_description, v13[0]);
    goto LABEL_9;
  }
  strcpy((char *)v13, "bundle id: ");
  HIDWORD(v13[1]) = -352321536;
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  sub_249ED2FA8();
LABEL_10:
  swift_bridgeObjectRelease();
LABEL_11:
  sub_249ED3188();
  swift_bridgeObjectRelease();
  v13[0] = 0xD000000000000015;
  v13[1] = 0x8000000249ED44E0;
  (*(void (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  sub_249ED2FA8();
  swift_bridgeObjectRelease();
  return v14;
}

BOOL static OpenApplicationVerifierResult.ErrorCode.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t OpenApplicationVerifierResult.ErrorCode.hash(into:)()
{
  return sub_249ED32E8();
}

uint64_t OpenApplicationVerifierResult.ErrorCode.hashValue.getter()
{
  return sub_249ED32F8();
}

BOOL sub_249EC943C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249EC9450()
{
  return sub_249ED32F8();
}

uint64_t sub_249EC9498()
{
  return sub_249ED32E8();
}

uint64_t sub_249EC94C4()
{
  return sub_249ED32F8();
}

uint64_t OpenApplicationVerifierResult.Error.code.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.Error.code.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.Error.description.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OpenApplicationVerifierResult.Error.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.Error.description.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.error.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OpenApplicationVerifierResult.error.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.error.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.pptTestURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for OpenApplicationVerifierResult() + 20);

  return sub_249EC96F4(v3, a1);
}

uint64_t type metadata accessor for OpenApplicationVerifierResult()
{
  uint64_t result = qword_269749058;
  if (!qword_269749058) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_249EC96F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t OpenApplicationVerifierResult.pptTestURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for OpenApplicationVerifierResult() + 20);

  return sub_249EC97E4(a1, v3);
}

uint64_t sub_249EC97E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*OpenApplicationVerifierResult.pptTestURL.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifier.__allocating_init(userSelectedApplicationBundleIdentifiers:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = sub_249ECCE78(a1);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = v3;
  return v2;
}

uint64_t OpenApplicationVerifier.init(userSelectedApplicationBundleIdentifiers:)(uint64_t a1)
{
  uint64_t v2 = sub_249ECCE78(a1);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  return v1;
}

Swift::Bool __swiftcall OpenApplicationVerifier.shouldOpenApp(bundleIdentifier:)(Swift::String bundleIdentifier)
{
  object = bundleIdentifier._object;
  uint64_t countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  if (qword_269749010 != -1) {
    swift_once();
  }
  if (sub_249EC99F8(countAndFlagsBits, (uint64_t)object, qword_2697494A8) & 1) != 0 || (sub_249ED2FC8()) {
    return 1;
  }
  uint64_t v5 = *(void *)(v1 + 16);

  return sub_249EC99F8(countAndFlagsBits, (uint64_t)object, v5);
}

uint64_t sub_249EC99F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_249ED32D8();
    sub_249ED2F98();
    uint64_t v6 = sub_249ED32F8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_249ED3298() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_249ED3298() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_249EC9B30(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_249ED3148();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (uint64_t v6 = sub_249ED3078(),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_249ECE6E4(0, &qword_269749078);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_249ED3088();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_249ED3088();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

uint64_t OpenApplicationVerifier.verifyRequest(_:)(uint64_t a1, uint64_t a2)
{
  v3[28] = a2;
  v3[29] = v2;
  v3[27] = a1;
  uint64_t v4 = sub_249ED2E08();
  v3[30] = v4;
  v3[31] = *(void *)(v4 - 8);
  v3[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  sub_249ED2FF8();
  v3[35] = sub_249ED2FE8();
  uint64_t v6 = sub_249ED2FD8();
  return MEMORY[0x270FA2498](sub_249EC9DC8, v6, v5);
}

uint64_t sub_249EC9DC8()
{
  uint64_t v1 = (void *)v0[28];
  swift_release();
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v6 = v5;
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v7);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
  if (!v6)
  {
    if (!v10)
    {
LABEL_13:
      sub_249ECCF54(v0[28], (uint64_t)(v0 + 2));
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v14 = v0[28];
    swift_bridgeObjectRelease();
    sub_249ECCF54(v14, (uint64_t)(v0 + 2));
    goto LABEL_11;
  }
  if (!v10) {
    goto LABEL_10;
  }
  if (v4 == v9 && v6 == v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v12 = v0[28];
  char v13 = sub_249ED3298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_249ECCF54(v12, (uint64_t)(v0 + 2));
  if ((v13 & 1) == 0)
  {
LABEL_11:
    uint64_t v15 = v0[28];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
    sub_249ECCF54(v15, (uint64_t)(v0 + 7));
LABEL_17:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v16 = v0[28];
  uint64_t v17 = v0[5];
  uint64_t v18 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v17);
  char v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 56))(v17, v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  sub_249ECCF54(v16, (uint64_t)(v0 + 7));
  if ((v19 & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v20 = v0[10];
  uint64_t v21 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v20);
  char v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  if ((v22 & 1) == 0)
  {
    uint64_t v24 = v0[30];
    uint64_t v23 = v0[31];
    v25 = (char *)v0[27];
    uint64_t v26 = type metadata accessor for OpenApplicationVerifierResult();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(&v25[*(int *)(v26 + 20)], 1, 1, v24);
    *(void *)v25 = 0;
    *((void *)v25 + 1) = 0;
    *((void *)v25 + 2) = 0;
    goto LABEL_55;
  }
LABEL_18:
  v85 = v0 + 22;
  v27 = (void *)v0[28];
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[31] + 56);
  v28(v0[34], 1, 1, v0[30]);
  uint64_t v29 = v1[3];
  uint64_t v30 = v1[4];
  __swift_project_boxed_opaque_existential_1(v27, v29);
  char v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 32))(v29, v30);
  sub_249ECCF54((uint64_t)v27, (uint64_t)(v0 + 12));
  uint64_t v32 = v0[28];
  v84 = v28;
  if ((v31 & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 12));
    sub_249ECCF54(v32, (uint64_t)(v0 + 17));
    goto LABEL_26;
  }
  uint64_t v33 = v0[15];
  uint64_t v34 = v0[16];
  __swift_project_boxed_opaque_existential_1(v0 + 12, v33);
  uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
  LOBYTE(v33) = sub_249ECD200(v35, v36);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 12));
  sub_249ECCF54(v32, (uint64_t)(v0 + 17));
  if (v33)
  {
LABEL_26:
    uint64_t v46 = v0[28];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
    sub_249ECCF54(v46, (uint64_t)v85);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v85);
    if (v31) {
      goto LABEL_35;
    }
    int8x16_t v47 = (int8x16_t)xmmword_249ED3BB0;
    v48 = "Untrusted open application requests are not allowed in Assistive Access.";
LABEL_53:
    unint64_t v64 = (unint64_t)(v48 - 32) | 0x8000000000000000;
    goto LABEL_54;
  }
  uint64_t v37 = v0[20];
  uint64_t v38 = v0[21];
  __swift_project_boxed_opaque_existential_1(v0 + 17, v37);
  v39 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v38 + 48))(v37, v38);
  uint64_t v40 = v0[20];
  uint64_t v41 = v0[21];
  __swift_project_boxed_opaque_existential_1(v0 + 17, v40);
  uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 40))(v40, v41);
  uint64_t v44 = v43;
  if (v43)
  {
    uint64_t v45 = v42;
    if (qword_269749030 != -1) {
      swift_once();
    }
    if (sub_249EC99F8(v45, v44, qword_2697494C8))
    {
      swift_bridgeObjectRelease();

LABEL_32:
      uint64_t v52 = v0[28];
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
      sub_249ECCF54(v52, (uint64_t)v85);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v85);
      goto LABEL_35;
    }
  }
  if (v39)
  {
    uint64_t v49 = qword_269749028;
    id v50 = v39;
    if (v49 != -1) {
      swift_once();
    }
    char v51 = sub_249EC9B30(v50, qword_2697494C0);

    swift_bridgeObjectRelease();
    if (v51) {
      goto LABEL_32;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v53 = v0[28];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
  sub_249ECCF54(v53, (uint64_t)v85);
  uint64_t v54 = v0[25];
  uint64_t v55 = v0[26];
  __swift_project_boxed_opaque_existential_1(v85, v54);
  uint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v54, v55);
  LOBYTE(v54) = sub_249ECD32C(v56, v57);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v85);
  if ((v54 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    int8x16_t v47 = (int8x16_t)xmmword_249ED3BA0;
    v48 = "Not allowing open application request from unallowed client process.";
    goto LABEL_53;
  }
LABEL_35:
  uint64_t v58 = v1[3];
  uint64_t v59 = v1[4];
  __swift_project_boxed_opaque_existential_1((void *)v0[28], v58);
  uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 8))(v58, v59);
  if (v61)
  {
    uint64_t v62 = v60;
    uint64_t v63 = v61;
    if (qword_269749010 != -1) {
      swift_once();
    }
    if ((sub_249EC99F8(v62, v63, qword_2697494A8) & 1) == 0 && (sub_249ED2FC8() & 1) == 0)
    {
      char v77 = sub_249EC99F8(v62, v63, *(void *)(v0[29] + 16));
      swift_bridgeObjectRelease();
      unint64_t v64 = 0x8000000249ED4580;
      if (v77)
      {
        unint64_t v64 = 0;
        unint64_t v78 = -1;
      }
      else
      {
        unint64_t v78 = 0;
      }
      int8x16_t v47 = vbicq_s8((int8x16_t)xmmword_249ED3BC0, (int8x16_t)vdupq_n_s64(v78));
      goto LABEL_54;
    }
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  uint64_t v65 = v0[33];
  uint64_t v66 = v0[30];
  uint64_t v67 = v0[31];
  uint64_t v69 = v1[3];
  uint64_t v68 = v1[4];
  __swift_project_boxed_opaque_existential_1((void *)v0[28], v69);
  (*(void (**)(uint64_t, uint64_t))(v68 + 16))(v69, v68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v65, 1, v66) == 1)
  {
    sub_249ECE784(v0[33], &qword_269749040);
LABEL_52:
    int8x16_t v47 = (int8x16_t)xmmword_249ED3BD0;
    v48 = "System app URL requests only supported for PPT.";
    goto LABEL_53;
  }
  v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[31] + 32);
  v70(v0[32], v0[33], v0[30]);
  id v71 = objc_msgSend(self, sel_sharedApplication);
  v72 = (void *)sub_249ED2DF8();
  unsigned int v73 = objc_msgSend(v71, sel__shouldHandleTestURL_, v72);

  uint64_t v74 = v0[30];
  if (!v73)
  {
    (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
    goto LABEL_52;
  }
  uint64_t v75 = v0[34];
  uint64_t v76 = v0[32];
  sub_249ECE784(v75, &qword_269749040);
  v70(v75, v76, v74);
  v84(v75, 0, 1, v74);
LABEL_41:
  unint64_t v64 = 0;
  int8x16_t v47 = 0uLL;
LABEL_54:
  uint64_t v79 = v0[34];
  v80 = (int8x16_t *)v0[27];
  int8x16_t *v80 = v47;
  v80[1].i64[0] = v64;
  uint64_t v81 = type metadata accessor for OpenApplicationVerifierResult();
  sub_249ECE720(v79, (uint64_t)v80->i64 + *(int *)(v81 + 20), &qword_269749040);
LABEL_55:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v82 = (uint64_t (*)(void))v0[1];
  return v82();
}

id sub_249ECA62C(uint64_t a1, uint64_t a2, char a3)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_249ED2F68();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    sub_249ED2DE8();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_249ECA714()
{
  uint64_t result = sub_249ECA734();
  qword_2697494A8 = result;
  return result;
}

uint64_t sub_249ECA734()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749070);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249ED3BE0;
  *(void *)(inited + 32) = sub_249ED2F78();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = sub_249ED2F78();
  *(void *)(inited + 56) = v2;
  if (qword_269749018 != -1) {
    swift_once();
  }
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_249ECA808(v3);
  uint64_t v4 = sub_249ECCE78(inited);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_249ECA808(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_249ECAF14(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_249ED3278();
  __break(1u);
  return result;
}

uint64_t sub_249ECA95C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749070);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_249ED3BF0;
  *(void *)(v0 + 32) = sub_249ED2F78();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_249ED2F78();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_249ED2F78();
  *(void *)(v0 + 72) = v3;
  uint64_t result = sub_249ED2F78();
  *(void *)(v0 + 80) = result;
  *(void *)(v0 + 88) = v5;
  qword_2697494B0 = v0;
  return result;
}

uint64_t sub_249ECA9F8()
{
  if (qword_269749018 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2697494B0;
  uint64_t v1 = sub_249ED2F78();
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v0 = sub_249ECAF14(0, v0[2] + 1, 1, v0);
  }
  unint64_t v5 = v0[2];
  unint64_t v4 = v0[3];
  if (v5 >= v4 >> 1) {
    uint64_t v0 = sub_249ECAF14((void *)(v4 > 1), v5 + 1, 1, v0);
  }
  v0[2] = v5 + 1;
  id v6 = &v0[2 * v5];
  v6[4] = v1;
  v6[5] = v3;
  uint64_t result = swift_bridgeObjectRelease();
  qword_2697494B8 = (uint64_t)v0;
  return result;
}

uint64_t sub_249ECAAFC()
{
  sub_249ED2F78();
  sub_249ED2F78();
  sub_249ED2F78();
  unint64_t v9 = MEMORY[0x263F8EE78];
  sub_249ED31E8();
  uint64_t v0 = self;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = (void *)sub_249ED2F68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v1);
  swift_bridgeObjectRelease();

  sub_249ED31C8();
  sub_249ED31F8();
  sub_249ED3208();
  sub_249ED31D8();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = (void *)sub_249ED2F68();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v3);
  swift_bridgeObjectRelease();

  sub_249ED31C8();
  sub_249ED31F8();
  sub_249ED3208();
  sub_249ED31D8();
  swift_bridgeObjectRetain_n();
  unint64_t v5 = (void *)sub_249ED2F68();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v5);
  swift_bridgeObjectRelease();

  sub_249ED31C8();
  sub_249ED31F8();
  sub_249ED3208();
  sub_249ED31D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_249ECCFB8(v9);
  uint64_t result = swift_release();
  qword_2697494C0 = v7;
  return result;
}

uint64_t sub_249ECAD6C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749070);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249ED3C00;
  *(void *)(inited + 32) = sub_249ED2F78();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = sub_249ED2F78();
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = sub_249ED2F78();
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 80) = sub_249ED2F78();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 96) = sub_249ED2F78();
  *(void *)(inited + 104) = v5;
  *(void *)(inited + 112) = sub_249ED2F78();
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 128) = sub_249ED2F78();
  *(void *)(inited + 136) = v7;
  *(void *)(inited + 144) = sub_249ED2F78();
  *(void *)(inited + 152) = v8;
  *(void *)(inited + 160) = sub_249ED2F78();
  *(void *)(inited + 168) = v9;
  *(void *)(inited + 176) = sub_249ED2F78();
  *(void *)(inited + 184) = v10;
  uint64_t v11 = sub_249ECCE78(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_2697494C8 = v11;
  return result;
}

uint64_t OpenApplicationVerifier.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OpenApplicationVerifier.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void *sub_249ECAF14(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269749070);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_249ECD10C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_249ECB024(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_249ECB0F8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_249ECE830((uint64_t)v12, *a3);
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
      sub_249ECE830((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_249ECB0F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_249ED30B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_249ECB2B4(a5, a6);
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
  uint64_t v8 = sub_249ED31B8();
  if (!v8)
  {
    sub_249ED3228();
    __break(1u);
LABEL_17:
    uint64_t result = sub_249ED3278();
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

uint64_t sub_249ECB2B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_249ECB34C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_249ECB52C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_249ECB52C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_249ECB34C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_249ECB4C4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_249ED3198();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_249ED3228();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_249ED2FB8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_249ED3278();
    __break(1u);
LABEL_14:
    uint64_t result = sub_249ED3228();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_249ECB4C4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_249ECB52C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697490B0);
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
  uint64_t result = sub_249ED3278();
  __break(1u);
  return result;
}

uint64_t sub_249ECB67C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_249ED32D8();
  swift_bridgeObjectRetain();
  sub_249ED2F98();
  uint64_t v8 = sub_249ED32F8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_249ED3298() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_249ED3298() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_249ECC2C8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_249ECB82C(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_249ED3128();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_249ECE6E4(0, &qword_269749078);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_249ED3118();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_249ECBACC(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_249ECBFA4();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_249ECC244((uint64_t)v8, v22);
    *unint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_249ED3078();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_249ECE6E4(0, &qword_269749078);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_249ED3088();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_249ED3088();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_249ECC464((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_249ECBACC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269749088);
    uint64_t v2 = sub_249ED3178();
    uint64_t v14 = v2;
    sub_249ED3108();
    if (sub_249ED3138())
    {
      sub_249ECE6E4(0, &qword_269749078);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_249ECBFA4();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_249ED3078();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_249ED3138());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_249ECBCC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490B8);
  uint64_t v3 = sub_249ED3168();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_249ED32D8();
      sub_249ED2F98();
      uint64_t result = sub_249ED32F8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_249ECBFA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749088);
  uint64_t v3 = sub_249ED3168();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_249ED3078();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_249ECC244(uint64_t a1, uint64_t a2)
{
  sub_249ED3078();
  unint64_t result = sub_249ED30F8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_249ECC2C8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_249ECBCC4();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_249ECC5EC();
      goto LABEL_22;
    }
    sub_249ECC94C();
  }
  uint64_t v11 = *v4;
  sub_249ED32D8();
  sub_249ED2F98();
  unint64_t result = sub_249ED32F8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_249ED3298(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_249ED32A8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_249ED3298();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_249ECC464(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_249ECBFA4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_249ECC7A0();
      goto LABEL_14;
    }
    sub_249ECCBFC();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_249ED3078();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_249ECE6E4(0, &qword_269749078);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_249ED3088();

    if (v12)
    {
LABEL_13:
      sub_249ED32A8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_249ED3088();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_249ECC5EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_249ED3158();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_249ECC7A0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749088);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_249ED3158();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_249ECC94C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490B8);
  uint64_t v3 = sub_249ED3168();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_249ED32D8();
    swift_bridgeObjectRetain();
    sub_249ED2F98();
    uint64_t result = sub_249ED32F8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_249ECCBFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749088);
  uint64_t v3 = sub_249ED3168();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_249ED3078();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_249ECCE78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_249ED3008();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_249ECB67C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_249ECCF54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_249ECCFB8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_249ED3238();
    swift_bridgeObjectRelease();
  }
  sub_249ECE6E4(0, &qword_269749078);
  sub_249ECE67C();
  uint64_t result = sub_249ED3008();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_249ED3238();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x24C5B4C80](i, a1);
        sub_249ECB82C(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_249ECB82C(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_249ECD10C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_249ED3278();
  __break(1u);
  return result;
}

uint64_t sub_249ECD200(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (qword_269749020 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_2697494B8;
  uint64_t v5 = *(void *)(qword_2697494B8 + 16);
  if (!v5) {
    return 0;
  }
  BOOL v6 = *(void *)(qword_2697494B8 + 32) == a1 && *(void *)(qword_2697494B8 + 40) == a2;
  if (v6 || (sub_249ED3298() & 1) != 0) {
    return 1;
  }
  if (v5 == 1) {
    return 0;
  }
  if (*(void *)(v4 + 48) == a1 && *(void *)(v4 + 56) == a2) {
    return 1;
  }
  uint64_t result = sub_249ED3298();
  if (result) {
    return 1;
  }
  if (v5 == 2) {
    return 0;
  }
  id v9 = (void *)(v4 + 72);
  for (uint64_t i = 2; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_249ED3298() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v5) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_249ECD32C(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  if (!_AXSAutomationEnabled())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_249ECE6E4(0, &qword_269749090);
  swift_bridgeObjectRetain();
  id v4 = sub_249ECA62C(a1, a2, 0);
  if (!v4)
  {
    if (qword_269749008 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_249ED2E58();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.common);
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_249ED2E48();
    os_log_type_t v12 = sub_249ED3018();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v17[0] = v14;
      *(_DWORD *)unint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v16[0] = sub_249ECB024(a1, a2, v17);
      sub_249ED30A8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_249EC5000, v11, v12, "LSBundleRecord for %s is nil", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5B5410](v14, -1, -1);
      MEMORY[0x24C5B5410](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  id v6 = v4;
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v6, sel_entitlements);
  uint64_t v8 = (void *)sub_249ED2F68();
  sub_249ECE6E4(0, &qword_2697490A0);
  id v9 = objc_msgSend(v7, sel_objectForKey_ofClass_, v8, swift_getObjCClassFromMetadata());

  if (v9)
  {
    sub_249ED30C8();
    swift_unknownObjectRelease();
  }
  else
  {

    memset(v16, 0, sizeof(v16));
  }
  sub_249ECE720((uint64_t)v16, (uint64_t)v17, &qword_2697490A8);
  if (!v17[3])
  {
    sub_249ECE784((uint64_t)v17, &qword_2697490A8);
    return 0;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v15;
  }
  return result;
}

unint64_t sub_249ECD88C()
{
  unint64_t result = qword_269749050;
  if (!qword_269749050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269749050);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for OpenApplicationVerifierResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    id v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_249ED2E08();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_249ED2E08();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    id v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  id v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_249ED2E08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  id v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_249ED2E08();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_249ED2E08();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_249ED2E08();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249ECE0B8);
}

uint64_t sub_249ECE0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249ECE18C);
}

uint64_t sub_249ECE18C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749040);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_249ECE238()
{
  sub_249ECE2D0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_249ECE2D0()
{
  if (!qword_269749068)
  {
    sub_249ED2E08();
    unint64_t v0 = sub_249ED3098();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269749068);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult.ErrorCode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OpenApplicationVerifierResult.ErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x249ECE494);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_249ECE4BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_249ECE4C4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OpenApplicationVerifierResult.ErrorCode()
{
  return &type metadata for OpenApplicationVerifierResult.ErrorCode;
}

uint64_t destroy for OpenApplicationVerifierResult.Error()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22ClarityBoardFoundation29OpenApplicationVerifierResultV5ErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OpenApplicationVerifierResult.Error(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OpenApplicationVerifierResult.Error(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult.Error(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OpenApplicationVerifierResult.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenApplicationVerifierResult.Error()
{
  return &type metadata for OpenApplicationVerifierResult.Error;
}

uint64_t type metadata accessor for OpenApplicationVerifier()
{
  return self;
}

unint64_t sub_249ECE67C()
{
  unint64_t result = qword_269749080;
  if (!qword_269749080)
  {
    sub_249ECE6E4(255, &qword_269749078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269749080);
  }
  return result;
}

uint64_t sub_249ECE6E4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_249ECE720(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_249ECE784(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_249ECE830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double static CLFSystemShellSwitcher.transitionDelayForSpeech.getter()
{
  return 3.0;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.navigationTitles()
{
  return sub_249ED2E88();
}

uint64_t ApplicationSceneClientSettings.navigationTitles.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_249ECE950@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_249ECE9D4()
{
  return sub_249ED2ED8();
}

uint64_t ApplicationSceneClientSettings.navigationTitles.setter()
{
  return sub_249ED2ED8();
}

uint64_t (*ApplicationSceneClientSettings.navigationTitles.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_249ED2EB8();
  return sub_249ECEB50;
}

uint64_t ApplicationSceneClientSettings.$navigationTitles.getter()
{
  return sub_249ECF3DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles, &qword_2697490D8);
}

uint64_t ApplicationSceneClientSettings.$navigationTitles.setter(uint64_t a1)
{
  return sub_249ECF460(a1, &qword_2697490E0, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles, &qword_2697490D8);
}

uint64_t (*ApplicationSceneClientSettings.$navigationTitles.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490D8);
  sub_249ED2E98();
  swift_endAccess();
  return sub_249ECEC94;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.chromeVisible()
{
  return sub_249ED2E88();
}

uint64_t ApplicationSceneClientSettings.chromeVisible.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_249ECED3C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_249ECEDC0()
{
  return sub_249ED2ED8();
}

uint64_t ApplicationSceneClientSettings.chromeVisible.setter()
{
  return sub_249ED2ED8();
}

uint64_t (*ApplicationSceneClientSettings.chromeVisible.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_249ED2EB8();
  return sub_249ECEB50;
}

uint64_t ApplicationSceneClientSettings.$chromeVisible.getter()
{
  return sub_249ECF3DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible, &qword_2697490F0);
}

uint64_t ApplicationSceneClientSettings.$chromeVisible.setter(uint64_t a1)
{
  return sub_249ECF460(a1, &qword_2697490F8, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible, &qword_2697490F0);
}

uint64_t (*ApplicationSceneClientSettings.$chromeVisible.modify(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  sub_249ED2E98();
  swift_endAccess();
  return sub_249ECEC94;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.bottomBarTransitionProgress()
{
  return sub_249ED2E88();
}

uint64_t ApplicationSceneClientSettings.bottomBarTransitionProgress.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_249ECF13C@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_249ECF1C8()
{
  return sub_249ED2ED8();
}

uint64_t ApplicationSceneClientSettings.bottomBarTransitionProgress.setter()
{
  return sub_249ED2ED8();
}

uint64_t (*ApplicationSceneClientSettings.bottomBarTransitionProgress.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_249ED2EB8();
  return sub_249ECEB50;
}

void sub_249ECF360(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t ApplicationSceneClientSettings.$bottomBarTransitionProgress.getter()
{
  return sub_249ECF3DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress, &qword_269749110);
}

uint64_t sub_249ECF3DC(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t ApplicationSceneClientSettings.$bottomBarTransitionProgress.setter(uint64_t a1)
{
  return sub_249ECF460(a1, &qword_269749118, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress, &qword_269749110);
}

uint64_t sub_249ECF460(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_249ED2EA8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*ApplicationSceneClientSettings.$bottomBarTransitionProgress.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749118);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_269749110);
  sub_249ED2E98();
  swift_endAccess();
  return sub_249ECEC94;
}

void sub_249ECF6A0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_249ED2EA8();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_249ED2EA8();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_249ECF810(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749110);
  uint64_t v3 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490D8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  int v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  uint64_t v24 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490C8);
  sub_249ED2E88();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  uint64_t v15 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  LOBYTE(v24) = 1;
  sub_249ED2E88();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15, v9, v6);
  uint64_t v16 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  uint64_t v24 = 0;
  char v25 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749100);
  sub_249ED2E88();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v16, v5, v21);
  unint64_t v17 = (void *)(v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings_sceneID);
  uint64_t v18 = v23;
  *unint64_t v17 = v22;
  v17[1] = v18;
  return v2;
}

void *sub_249ECFAC8()
{
  uint64_t result = (void *)sub_249ECFAF0(MEMORY[0x263F8EE78]);
  off_2697490C0 = result;
  return result;
}

unint64_t sub_249ECFAF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749150);
  uint64_t v2 = (void *)sub_249ED3268();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_249ED03E0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t static ApplicationSceneClientSettings.settingsForSceneID(_:)(uint64_t a1, uint64_t a2)
{
  if (qword_269749038 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_2697490C0;
  if (!*((void *)off_2697490C0 + 2)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_249ED03E0(a1, a2);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_endAccess();
    type metadata accessor for ApplicationSceneClientSettings();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_249ECF810(a1, a2);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = off_2697490C0;
    off_2697490C0 = (_UNKNOWN *)0x8000000000000000;
    sub_249ED0B48(v7, a1, a2, isUniquelyReferenced_nonNull_native);
    off_2697490C0 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v7;
  }
  uint64_t v7 = *(void *)(v4[7] + 8 * v5);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static ApplicationSceneClientSettings.removeSettingsForSceneID(_:)(uint64_t a1, uint64_t a2)
{
  if (qword_269749038 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_249ED0588(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t ApplicationSceneClientSettings.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ApplicationSceneClientSettings.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_249ED009C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ApplicationSceneClientSettings();
  uint64_t result = sub_249ED2E78();
  *a1 = result;
  return result;
}

uint64_t ApplicationSceneClientSettings.description.getter()
{
  return 0;
}

uint64_t sub_249ED03BC()
{
  return ApplicationSceneClientSettings.description.getter();
}

unint64_t sub_249ED03E0(uint64_t a1, uint64_t a2)
{
  sub_249ED32D8();
  sub_249ED2F98();
  uint64_t v4 = sub_249ED32F8();

  return sub_249ED04A4(a1, a2, v4);
}

uint64_t type metadata accessor for ApplicationSceneClientSettings()
{
  uint64_t result = qword_269749128;
  if (!qword_269749128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_249ED04A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_249ED3298() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_249ED3298() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_249ED0588(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_249ED03E0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_249ED0EE8();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_249ED0970(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_249ED0658(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749150);
  char v36 = a2;
  uint64_t v6 = sub_249ED3258();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_249ED32D8();
    sub_249ED2F98();
    uint64_t result = sub_249ED32F8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_249ED0970(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_249ED30E8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_249ED32D8();
        swift_bridgeObjectRetain();
        sub_249ED2F98();
        uint64_t v9 = sub_249ED32F8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_249ED0B48(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_249ED03E0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_249ED0EE8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_249ED0658(v15, a4 & 1);
  unint64_t v21 = sub_249ED03E0(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_249ED32B8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_249ED0CB8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_249ED0CC4()
{
  return type metadata accessor for ApplicationSceneClientSettings();
}

void sub_249ED0CCC()
{
  sub_249ED0E98(319, &qword_269749138, &qword_2697490C8);
  if (v0 <= 0x3F)
  {
    sub_249ED0E40();
    if (v1 <= 0x3F)
    {
      sub_249ED0E98(319, &qword_269749148, &qword_269749100);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_249ED0E40()
{
  if (!qword_269749140)
  {
    unint64_t v0 = sub_249ED2EE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269749140);
    }
  }
}

void sub_249ED0E98(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_249ED2EE8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_249ED0EE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749150);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_249ED3248();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v2 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    char v22 = (void *)(*(void *)(v4 + 48) + v17);
    *char v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t property wrapper backing initializer of LockState.isLocked()
{
  return sub_249ED2E88();
}

uint64_t LockState.isLocked.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_249ED1144@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_249ED11C8()
{
  return sub_249ED2ED8();
}

uint64_t LockState.isLocked.setter()
{
  return sub_249ED2ED8();
}

void (*LockState.isLocked.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_249ED2EB8();
  return sub_249ECF360;
}

uint64_t LockState.$isLocked.getter()
{
  return swift_endAccess();
}

uint64_t LockState.$isLocked.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  sub_249ED2EA8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*LockState.$isLocked.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  sub_249ED2E98();
  swift_endAccess();
  return sub_249ECF6A0;
}

uint64_t LockState.__allocating_init(mobileKeybagManager:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  LockState.init(mobileKeybagManager:)(a1);
  return v2;
}

uint64_t LockState.init(mobileKeybagManager:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  uint64_t v9 = sub_249ED2E38();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v19 = v10 + 56;
  v11(v8, 1, 1, v9);
  uint64_t v12 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  LOBYTE(aBlock[0]) = 1;
  sub_249ED2E88();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v12, v7, v4);
  *(void *)(v1 + 16) = a1;
  swift_unknownObjectRetain();
  sub_249ED206C();
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_249ED2288;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249ED1BC0;
  aBlock[3] = &block_descriptor;
  int64_t v14 = _Block_copy(aBlock);
  swift_release();
  id v15 = objc_msgSend(a1, sel_registerLockStateChangedBlock_, v14);
  _Block_release(v14);
  uint64_t v16 = (uint64_t)v20;
  sub_249ED2E28();
  swift_unknownObjectRelease();

  v11(v16, 0, 1, v9);
  uint64_t v17 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_249ED22A8(v16, v17);
  swift_endAccess();
  return v1;
}

uint64_t sub_249ED1900(uint64_t a1)
{
  uint64_t v2 = sub_249ED2F08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_249ED2F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249ED2BB0();
  uint64_t v10 = (void *)sub_249ED3038();
  aBlock[4] = sub_249ED2CA4;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249ED1BC0;
  aBlock[3] = &block_descriptor_12;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_249ED2F18();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_249ED2BF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749190);
  sub_249ED2C48();
  sub_249ED30D8();
  MEMORY[0x24C5B4B20](0, v9, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_249ED1B68()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_249ED206C();
    return swift_release();
  }
  return result;
}

uint64_t sub_249ED1BC0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t LockState.deinit()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_249ED2E38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_249ED2310(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249ED2378((uint64_t)v3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v9 = *(void **)(v1 + 16);
    uint64_t v10 = (void *)sub_249ED2E18();
    objc_msgSend(v9, sel_unregisterLockStateChangedBlockWithIdentifier_, v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_unknownObjectRelease();
  sub_249ED2378(v8);
  uint64_t v11 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return v1;
}

uint64_t LockState.__deallocating_deinit()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_249ED2E38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_249ED2310(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249ED2378((uint64_t)v3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v9 = *(void **)(v1 + 16);
    uint64_t v10 = (void *)sub_249ED2E18();
    objc_msgSend(v9, sel_unregisterLockStateChangedBlockWithIdentifier_, v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_unknownObjectRelease();
  sub_249ED2378(v8);
  uint64_t v11 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697490F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return swift_deallocClassInstance();
}

void sub_249ED206C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_249ED2EC8();
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + 16), sel_isLocked);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_249ED2ED8();
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v2 = (__CFString *)sub_249ED2F68();
  CFNotificationCenterPostNotification(v1, v2, 0, 0, 0);

  if (v7 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_249ED2EC8();
    swift_release();
    swift_release();
    if ((v6 & 1) == 0)
    {
      if (_AXSVoiceOverTouchEnabled())
      {
        id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829D8]), sel_init);
        objc_msgSend(v3, sel_notificationOccurred_, 0);
        if (*MEMORY[0x263F21970])
        {
          UIAccessibilityNotifications v4 = *MEMORY[0x263F83188];
          id v5 = (id)*MEMORY[0x263F21970];
          UIAccessibilityPostNotification(v4, v5);
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_249ED2250()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_249ED2288()
{
  return sub_249ED1900(v0);
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

uint64_t sub_249ED22A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_249ED2310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249ED2378(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269749160);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall LockState.unlock(with:)(Swift::String with)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = (void *)sub_249ED2F68();
  v9[0] = 0;
  unsigned int v4 = objc_msgSend(v2, sel_unlockWithPasscode_error_, v3, v9);

  if (v4)
  {
    id v5 = v9[0];
  }
  else
  {
    id v6 = v9[0];
    char v7 = (void *)sub_249ED2DE8();

    swift_willThrow();
    swift_getErrorValue();
    if (sub_249ED32C8() == -14) {
      sub_249ED24DC();
    }
  }
  sub_249ED206C();
  return v4;
}

id sub_249ED24DC()
{
  uint64_t v0 = sub_249ED2F08();
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_249ED2F28();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_249ED2EF8();
  uint64_t v7 = *(void *)(v6 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (uint64_t *)((char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_249ED2F48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - v15;
  id v17 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v17, sel_postNotificationName_object_, @"CLBLockBackoffBlockNotification", 0);

  sub_249ED2BB0();
  uint64_t v18 = (void *)sub_249ED3038();
  sub_249ED2F38();
  id result = objc_msgSend(*(id *)(v28 + 16), sel_backOffTime);
  if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v20 < 9.22337204e18)
  {
    *uint64_t v9 = (uint64_t)v20;
    (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F018], v6);
    MEMORY[0x24C5B4A30](v14, v9);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v28 = *(void *)(v11 + 8);
    ((void (*)(char *, uint64_t))v28)(v14, v10);
    aBlock[4] = sub_249ED297C;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249ED1BC0;
    aBlock[3] = &block_descriptor_9;
    uint64_t v21 = _Block_copy(aBlock);
    sub_249ED2F18();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_249ED2BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269749190);
    sub_249ED2C48();
    uint64_t v22 = v27;
    sub_249ED30D8();
    MEMORY[0x24C5B4B00](v16, v5, v2, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v2, v22);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
    return (id)((uint64_t (*)(char *, uint64_t))v28)(v16, v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_249ED297C()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v0, sel_postNotificationName_object_, @"CLBLockBackoffUnblockNotification", 0);
}

uint64_t sub_249ED29EC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LockState();
  uint64_t result = sub_249ED2E78();
  *a1 = result;
  return result;
}

uint64_t sub_249ED2A2C()
{
  return type metadata accessor for LockState();
}

uint64_t type metadata accessor for LockState()
{
  uint64_t result = qword_269749168;
  if (!qword_269749168) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_249ED2A80()
{
  sub_249ED2B58();
  if (v0 <= 0x3F)
  {
    sub_249ED0E40();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_249ED2B58()
{
  if (!qword_269749178)
  {
    sub_249ED2E38();
    unint64_t v0 = sub_249ED3098();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269749178);
    }
  }
}

unint64_t sub_249ED2BB0()
{
  unint64_t result = qword_269749180;
  if (!qword_269749180)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269749180);
  }
  return result;
}

unint64_t sub_249ED2BF0()
{
  unint64_t result = qword_269749188;
  if (!qword_269749188)
  {
    sub_249ED2F08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269749188);
  }
  return result;
}

unint64_t sub_249ED2C48()
{
  unint64_t result = qword_269749198;
  if (!qword_269749198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269749190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269749198);
  }
  return result;
}

uint64_t sub_249ED2CA4()
{
  return sub_249ED1B68();
}

uint64_t NSNotificationCenter.sendableNotifications(named:object:)()
{
  return sub_249ED3218();
}

uint64_t sub_249ED2D44(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249ED2D64, 0, 0);
}

uint64_t sub_249ED2D64()
{
  uint64_t v1 = *(void **)(v0 + 16);
  v1[3] = MEMORY[0x263F8D310];
  *uint64_t v1 = 0;
  v1[1] = 0xE000000000000000;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_249ED2D90()
{
  unint64_t result = qword_2697491B0;
  if (!qword_2697491B0)
  {
    sub_249ED3058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697491B0);
  }
  return result;
}

uint64_t sub_249ED2DE8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_249ED2DF8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_249ED2E08()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_249ED2E18()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_249ED2E28()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_249ED2E38()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_249ED2E48()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_249ED2E58()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_249ED2E68()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_249ED2E78()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_249ED2E88()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_249ED2E98()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_249ED2EA8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_249ED2EB8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_249ED2EC8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_249ED2ED8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_249ED2EE8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_249ED2EF8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_249ED2F08()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_249ED2F18()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_249ED2F28()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_249ED2F38()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_249ED2F48()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_249ED2F58()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_249ED2F68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_249ED2F78()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_249ED2F88()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_249ED2F98()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_249ED2FA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_249ED2FB8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_249ED2FC8()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_249ED2FD8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_249ED2FE8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_249ED2FF8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_249ED3008()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_249ED3018()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_249ED3028()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_249ED3038()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_249ED3048()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_249ED3058()
{
  return MEMORY[0x270EF1FF0]();
}

uint64_t sub_249ED3068()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_249ED3078()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_249ED3088()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_249ED3098()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_249ED30A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_249ED30B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_249ED30C8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_249ED30D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_249ED30E8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_249ED30F8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_249ED3108()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_249ED3118()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_249ED3128()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_249ED3138()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_249ED3148()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_249ED3158()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_249ED3168()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_249ED3178()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_249ED3188()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_249ED3198()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_249ED31A8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_249ED31B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_249ED31C8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_249ED31D8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_249ED31E8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_249ED31F8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_249ED3208()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_249ED3218()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_249ED3228()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_249ED3238()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_249ED3248()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_249ED3258()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_249ED3268()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_249ED3278()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_249ED3288()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_249ED3298()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_249ED32A8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_249ED32B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_249ED32C8()
{
  return MEMORY[0x270F9FB20]();
}

uint64_t sub_249ED32D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_249ED32E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_249ED32F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F10750]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x270F4AE28]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x270F4AE30]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x270F4AE50]();
}

uint64_t MKBUnlockDevice()
{
  return MEMORY[0x270F4AEB8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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