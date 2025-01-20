uint64_t destroy for AnyDecodableKeys()
{
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for AnyDecodableKeys(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDecodableKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1BBBF8CA8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.FMNResponseFields(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC21C14);
}

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.FMNResponseFields(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC21CC8);
}

uint64_t getEnumTagSinglePayload for FMNRedirectHostStore(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FMNRedirectHostStore(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1BBBF8D78()
{
  uint64_t result = sub_1BBC37B78();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for FMNAuthenticationProvider()
{
  return self;
}

void sub_1BBBF8E40(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BBC380D8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1BBBF8E94()
{
  sub_1BBC37DC8();
  if (v0 <= 0x3F)
  {
    sub_1BBBF8E40(319, qword_1EB9F68E0, MEMORY[0x1E4F27990]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t type metadata accessor for FMNServerInteractionController()
{
  return self;
}

uint64_t sub_1BBBF8FB0()
{
  uint64_t result = sub_1BBC37C18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BBBF9068()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BBBF9130(char *a1)
{
  char v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 56) = v2;
  return result;
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 41, 7);
}

uint64_t objectdestroy_2Tm_0()
{
  uint64_t v1 = sub_1BBC37C18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v6 + 16, v5);
}

uint64_t objectdestroy_13Tm()
{
  swift_release();

  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t objectdestroy_79Tm()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t FMNHTTPRequest.deinit()
{
  sub_1BBBF9364(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  uint64_t v2 = sub_1BBC37B78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1BBBF9364(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 88);
  if (*(void *)(v0 + 152)) {
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 128);
  }
  uint64_t v1 = *(void **)(v0 + 168);
  if (v1)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 176);
    swift_release();
  }
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 240, 7);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v1, a1, 7);
}

uint64_t objectdestroyTm_0(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 24);
  swift_release();

  return MEMORY[0x1F4186498](v1, a1, 7);
}

uint64_t objectdestroyTm_1()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6380);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC038C4();
  sub_1BBC38288();
  if (!v1)
  {
    uint64_t v0 = sub_1BBC029B4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v0;
}

uint64_t FMNHTTPRequest.init(hostName:scheme:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = a6;
  uint64_t v9 = sub_1BBC37B78();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v6 + 48) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(unsigned char *)(v6 + 56) = 14;
  sub_1BBC37B68();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v6 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents, v12, v9);
  swift_beginAccess();
  sub_1BBC37B58();
  MEMORY[0x1C1862EA0](a1, a2);
  sub_1BBC37B48();
  swift_endAccess();
  return v6;
}

void *FMNAuthenticationProvider.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BBC38058();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1BBC38068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[2] = 1;
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC68], v4);
  sub_1BBC37D48();
  v14[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6D90, (uint64_t *)&unk_1EB9F6D80);
  sub_1BBC38128();
  v0[3] = sub_1BBC38098();
  id v8 = objc_msgSend(self, sel_mainBundle);
  id v9 = objc_msgSend(v8, sel_bundleIdentifier);

  if (v9)
  {
    uint64_t v10 = sub_1BBC37E98();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  v1[4] = v10;
  v1[5] = v12;
  v1[6] = 0;
  v1[7] = 0;
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  return v1;
}

uint64_t sub_1BBBF9B84(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    uint64_t v6 = (void *)sub_1BBC37C78();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1BBC054C4((uint64_t)v6, v10);

  return swift_release();
}

uint64_t sub_1BBBF9C4C(uint64_t a1, unint64_t a2, char *a3, void *a4)
{
  return sub_1BBBFF2E0(a1, a2, a3, a4, *(void (**)(uint64_t *))(v4 + 24), *(void *)(v4 + 32));
}

uint64_t sub_1BBBF9C7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1BBBF9CA4()
{
  return sub_1BBBF9CD4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1BBBF9CAC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BBBF9CD4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1BBBF9CFC()
{
  sub_1BBBF9D08((void *)(v0 + 16), *(uint64_t **)(v0 + 72));
}

void sub_1BBBF9D08(void *a1, uint64_t *a2)
{
  sub_1BBBF9E60(&v13);
  uint64_t v4 = v14;
  if (!v14) {
    return;
  }
  uint64_t v5 = v13;
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1 + 1, v8);
  if (v6 == (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9) && v7 == v10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      sub_1BBC1D5B8(v5, v4);
      return;
    }
  }
  swift_bridgeObjectRetain();
  sub_1BBC1D5B8(v5, v4);
  *a2 = v5;
  a2[1] = v4;

  swift_bridgeObjectRelease();
}

void sub_1BBBF9E60(void *a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v3 = (void *)sub_1BBC37E88();
  id v4 = objc_msgSend(v2, sel_dataForKey_, v3);

  if (v4)
  {
    uint64_t v5 = sub_1BBC37C78();
    unint64_t v7 = v6;

    sub_1BBC1D5FC();
    sub_1BBC37A78();
    sub_1BBC025A4(v5, v7);
    *a1 = v8;
    a1[1] = v9;
    a1[2] = v10;
    a1[3] = v11;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
}

uint64_t sub_1BBBF9F9C()
{
  return sub_1BBBF9FA8(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1BBBF9FA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1BBBFAFA4(a3), (v8 & 1) != 0))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(v6 + 56);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = *(_OWORD *)(v10 + 16 * v9);
    swift_retain();
    char v12 = sub_1BBC26C4C;
  }
  else
  {
    char v12 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v13 = *a1;
  *a1 = (uint64_t)v12;
  a1[1] = v11;
  return sub_1BBBFA06C(v13);
}

uint64_t sub_1BBBFA06C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 88);
  if (*(void *)(v0 + 152)) {
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 128);
  }
  uint64_t v1 = *(void **)(v0 + 168);
  if (v1)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 176);
    swift_release();
  }
  swift_weakDestroy();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 248);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 288);
  id v2 = *(void **)(v0 + 328);
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 336);
    swift_release();
  }
  swift_release();

  return MEMORY[0x1F4186498](v0, 400, 7);
}

uint64_t objectdestroy_17Tm_0()
{
  uint64_t v1 = sub_1BBC37C18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

void sub_1BBBFA230(uint64_t a1@<X8>)
{
}

void sub_1BBBFA248(uint64_t a1@<X8>)
{
  sub_1BBBFA264(*(void *)(v1 + 16), a1);
}

void sub_1BBBFA264(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session;
  swift_beginAccess();
  sub_1BBC01EFC(v4, (uint64_t)&v6, &qword_1EB9F6578);
  if (v7)
  {
    sub_1BBBFAC58(&v6, a2);
  }
  else
  {
    sub_1BBBFDF14((uint64_t)&v6, &qword_1EB9F6578);
    sub_1BBBFA3C4();
    if (!v2)
    {
      sub_1BBBFA360((uint64_t)&v6, a2);
      sub_1BBBFA360((uint64_t)&v6, (uint64_t)v5);
      swift_beginAccess();
      sub_1BBBFFB60((uint64_t)v5, v4, &qword_1EB9F6578);
      swift_endAccess();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
    }
  }
}

uint64_t sub_1BBBFA360(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1BBBFA3C4()
{
  id v1 = objc_msgSend(self, sel_defaultSessionConfiguration);
  id v2 = objc_msgSend(self, sel_mainBundle);
  id v3 = objc_msgSend(v2, sel_bundleIdentifier);

  if (v3)
  {
    sub_1BBC37E98();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
  }
  id v4 = objc_allocWithZone(MEMORY[0x1E4F4EF78]);
  uint64_t v5 = (void *)sub_1BBC37E88();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithIdentifier_, v5);

  objc_msgSend(v1, sel_set_appleIDContext_, v6);
  objc_msgSend(v1, sel_setURLCache_, 0);
  objc_msgSend(v1, sel_setRequestCachePolicy_, 1);
  objc_msgSend(v1, sel_setHTTPCookieStorage_, 0);
  objc_msgSend(v1, sel_setHTTPCookieAcceptPolicy_, 1);
  objc_msgSend(v1, sel_setURLCredentialStorage_, 0);
  (*(void (**)(id, uint64_t))(**(void **)(v0
                                                    + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_urlSessionFactory)
                                      + 104))(v1, v0);
}

uint64_t sub_1BBBFA5C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v41)(long long *__return_ptr, char *);
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void v48[3];
  char *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  long long v55;
  uint64_t v56;
  long long v57[2];
  char *v58;

  v53 = (void *)a3;
  v51 = a1;
  v52 = a2;
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v58 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v49 = (char *)v48 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  char v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = *(void (**)(void))(v5 + 56);
  v54 = (uint64_t)v48 - v14;
  *(void *)&v55 = v4;
  v13();
  uint64_t v15 = v3[5];
  v56 = v5;
  v50 = v3;
  if (v15
    && (v48[2] = v3[4],
        uint64_t v17 = v3[6],
        uint64_t v16 = v3[7],
        id v18 = objc_msgSend(self, sel_sharedInstance),
        unsigned int v19 = objc_msgSend(v18, sel_isInternalBuild),
        v18,
        uint64_t v5 = v56,
        v19))
  {
    v48[0] = v16;
    v48[1] = v17;
    id v20 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
    swift_bridgeObjectRetain();
    v21 = (void *)sub_1BBC37E88();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v20, sel_initWithSuiteName_, v21);

    if (v22)
    {
      v23 = (void *)sub_1BBC37E88();
      unsigned int v24 = objc_msgSend(v22, sel_BOOLForKey_, v23);

      if (v24)
      {
        v25 = v49;
        sub_1BBC37BC8();
        uint64_t v26 = v54;
        sub_1BBBFABBC(v54);
        uint64_t v5 = v56;
        uint64_t v27 = v55;
        (*(void (**)(uint64_t, char *, void))(v56 + 32))(v26, v25, v55);
        uint64_t v28 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v26 = v54;
    sub_1BBBFABBC(v54);
    uint64_t v28 = 1;
    uint64_t v5 = v56;
  }
  else
  {
    uint64_t v26 = v54;
    sub_1BBBFABBC(v54);
    uint64_t v28 = 1;
  }
  uint64_t v27 = v55;
LABEL_9:
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13)(v26, v28, 1, v27);
  sub_1BBBFAC70(v26, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v27) == 1)
  {
    sub_1BBBFABBC((uint64_t)v12);
    id v29 = objc_msgSend(self, sel_sessionWithConfiguration_delegate_delegateQueue_, v51, v52, 0);
    uint64_t v30 = sub_1BBBFAC1C(0, &qword_1EB9F6848);
    v31 = v53;
    v53[3] = v30;
    v31[4] = &protocol witness table for NSURLSession;
    void *v31 = v29;
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    v32 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();

    return sub_1BBBFABBC(v26);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v58, v12, v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v34 = swift_allocObject();
    v55 = xmmword_1BBC38DE0;
    *(_OWORD *)(v34 + 16) = xmmword_1BBC38DE0;
    uint64_t v35 = sub_1BBC37BB8();
    uint64_t v37 = v36;
    uint64_t v38 = MEMORY[0x1E4FBB1A0];
    *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v39 = sub_1BBC04664();
    *(void *)(v34 + 64) = v39;
    *(void *)(v34 + 32) = v35;
    *(void *)(v34 + 40) = v37;
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    v40 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();

    v41 = (void (*)(long long *__return_ptr, char *))v50[2];
    if (v41)
    {
      v42 = v58;
      v41(v57, v58);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v42, v27);
      sub_1BBBFABBC(v26);
      return sub_1BBBFAC58(v57, (uint64_t)v53);
    }
    else
    {
      v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = v55;
      v44 = v58;
      v45 = sub_1BBC37BB8();
      *(void *)(v43 + 56) = v38;
      *(void *)(v43 + 64) = v39;
      *(void *)(v43 + 32) = v45;
      *(void *)(v43 + 40) = v46;
      v47 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();
      swift_bridgeObjectRelease();

      sub_1BBC1D8D8();
      swift_allocError();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v44, v27);
      return sub_1BBBFABBC(v26);
    }
  }
}

uint64_t sub_1BBBFABBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBBFAC1C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BBBFAC58(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1BBBFAC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AnyDecodableKeys(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1BBBFAD0C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1BBBFAD50()
{
  sub_1BBBFAD5C(v0[2], v0[3], v0[4], v0[5]);
}

void sub_1BBBFAD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1C1863FE0](v7);
  if (v8)
  {
    uint64_t v9 = (char *)v8;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a3;
    *(void *)(v10 + 24) = a4;
    uint64_t v11 = &v9[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers];
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *(void *)v11;
    *(void *)uint64_t v11 = 0x8000000000000000;
    sub_1BBBFAE64((uint64_t)sub_1BBC26DE8, v10, a2, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v11 = v13;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
}

uint64_t sub_1BBBFAE64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BBBFAFA4(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1BBC0B298();
LABEL_7:
    id v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      unsigned int v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_release();
      *unsigned int v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    v21 = (void *)(v18[7] + 16 * v12);
    void *v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1BBBFB084(result, a4 & 1);
  uint64_t result = sub_1BBBFAFA4(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    id v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1BBC38508();
  __break(1u);
  return result;
}

unint64_t sub_1BBBFAFA4(uint64_t a1)
{
  uint64_t v2 = sub_1BBC38568();

  return sub_1BBBFAFE8(a1, v2);
}

unint64_t sub_1BBBFAFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1BBBFB084(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6860);
  uint64_t result = sub_1BBC38248();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
    v31 = v3;
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v13) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v13) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v13)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v31;
                goto LABEL_40;
              }
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v29;
              }
              uint64_t v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v13) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      long long v32 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_1BBC38568();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v17 == v25;
          if (v17 == v25) {
            unint64_t v17 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v14 + 8 * v17);
        }
        while (v27 == -1);
        unint64_t v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v7 + 48) + 8 * v18) = v28;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BBBFB338()
{
  id v1 = *(void (**)(uint64_t, void))(v0 + 16);
  uint64_t v2 = swift_retain();
  v1(v2, 0);

  return swift_release();
}

void sub_1BBBFB394(uint64_t a1, void *a2)
{
  sub_1BBC0596C(a1, a2, *(unsigned __int8 *)(v2 + 16), *(NSObject **)(v2 + 24), *(void *)(v2 + 32));
}

void sub_1BBBFB3A0()
{
  sub_1BBBFB3B0(*(void *)(v0 + 16), *(void (**)(uint64_t, void *))(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

void sub_1BBBFB3B0(uint64_t a1, void (*a2)(uint64_t, void *), uint64_t a3, unsigned __int8 a4)
{
  int64_t v8 = (void *)sub_1BBBFD58C();
  id v40 = objc_msgSend(v8, sel_aa_primaryAppleAccount);

  if (v40)
  {
    id v9 = objc_msgSend(v40, sel_aa_personID);
    if (!v9)
    {
      sub_1BBC38028();
      if (qword_1EB9F6DC8 != -1) {
        swift_once();
      }
      sub_1BBC37D08();
      sub_1BBC14810();
      int64_t v23 = (void *)swift_allocError();
      *char v24 = 1;
      a2(0, v23);

      goto LABEL_22;
    }
    uint64_t v10 = v9;
    uint64_t v38 = sub_1BBC37E98();
    uint64_t v12 = v11;

    unsigned __int8 v42 = a4;
    uint64_t v39 = (uint64_t)sub_1BBBFB9F4(v40, &v42);
    uint64_t v14 = v13;
    uint64_t v37 = v15;
    uint64_t v17 = v16;
    id v18 = objc_msgSend(self, sel_sharedInstance);
    unsigned int v19 = objc_msgSend(v18, sel_isInternalBuild);

    if (v19)
    {
      if (FMNAccountType.rawValue.getter() == 1885957478 && v20 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v25 = sub_1BBC38448();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0) {
          goto LABEL_19;
        }
      }
      id v26 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
      uint64_t v27 = (void *)sub_1BBC37E88();
      id v28 = objc_msgSend(v26, sel_initWithSuiteName_, v27);

      if (v28)
      {
        uint64_t v29 = (void *)sub_1BBC37E88();
        id v30 = objc_msgSend(v28, sel_stringForKey_, v29);

        if (v30)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = sub_1BBC37E98();
          uint64_t v14 = v31;

          sub_1BBC38028();
          if (qword_1EB9F6DC8 != -1) {
            swift_once();
          }
          sub_1BBC37D08();
LABEL_20:
          if (v17)
          {
            type metadata accessor for FMNAuthenticationCredential();
            uint64_t v32 = swift_allocObject();
            *(void *)(v32 + 16) = v39;
            *(void *)(v32 + 24) = v14;
            *(void *)(v32 + 32) = v38;
            *(void *)(v32 + 40) = v12;
            *(void *)(v32 + 48) = v37;
            *(void *)(v32 + 56) = v17;
            *(unsigned char *)(v32 + 64) = a4;
            *(void *)(a1 + 56) = v32;
            swift_retain_n();
            swift_release();
            a2(v32, 0);
            swift_release_n();
LABEL_22:
            v33 = v40;
            goto LABEL_24;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1BBC38028();
          if (qword_1EB9F6DC8 != -1) {
            swift_once();
          }
          sub_1BBC37D08();
          sub_1BBC14810();
          uint64_t v21 = swift_allocError();
          *uint64_t v36 = 2;
          a2(0, (void *)v21);

          goto LABEL_31;
        }
      }
    }
LABEL_19:
    if (!v14)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BBC38028();
      if (qword_1EB9F6DC8 != -1) {
        swift_once();
      }
      sub_1BBC37D08();
      unsigned __int8 v41 = a4;
      sub_1BBC14810();
      uint64_t v34 = (void *)swift_allocError();
      *uint64_t v35 = 4;
      swift_retain();
      sub_1BBC14864(v40, (char *)&v41, v34, a1, a2, a3);
      swift_release();

      v33 = v34;
      goto LABEL_32;
    }
    goto LABEL_20;
  }
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  sub_1BBC14810();
  uint64_t v21 = swift_allocError();
  *unint64_t v22 = 0;
  a2(0, (void *)v21);
LABEL_31:
  v33 = (void *)v21;
LABEL_32:

LABEL_24:
}

id sub_1BBBFB9F4(void *a1, unsigned __int8 *a2)
{
  id v139 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v136 = (char *)&v133 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v135 = (uint64_t)&v133 - v7;
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v134 = (uint64_t)&v133 - v9;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v133 = (char *)&v133 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v133 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v133 - v16;
  MEMORY[0x1F4188790](v15);
  unsigned int v19 = (char *)&v133 - v18;
  uint64_t v20 = sub_1BBC37C18();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v137 = v20;
  uint64_t v138 = v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  char v25 = (char *)&v133 - v24;
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  id v28 = (char *)&v133 - v27;
  uint64_t v29 = MEMORY[0x1F4188790](v26);
  uint64_t v31 = (char *)&v133 - v30;
  uint64_t v32 = MEMORY[0x1F4188790](v29);
  uint64_t v34 = (char *)&v133 - v33;
  uint64_t v35 = MEMORY[0x1F4188790](v32);
  uint64_t v37 = (char *)&v133 - v36;
  MEMORY[0x1F4188790](v35);
  id v40 = (char *)&v133 - v39;
  uint64_t v41 = *a2;
  id result = 0;
  switch(v41)
  {
    case 1:
      id v48 = v139;
      id v49 = objc_msgSend(v139, sel_aa_fmfAccount, 0, 0);
      v50 = (void *)sub_1BBBFD58C();
      id v51 = objc_msgSend(v50, sel_credentialForAccount_, v49);

      id result = objc_msgSend(v48, sel_dataclassProperties);
      if (!result)
      {
        __break(1u);
        goto LABEL_161;
      }
      v52 = result;
      *(void *)&long long v141 = sub_1BBC37E98();
      *((void *)&v141 + 1) = v53;
      swift_bridgeObjectRetain();
      id v54 = objc_msgSend(v52, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();

      if (v54)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145)
      {
        sub_1BBBFAC1C(0, &qword_1EB9F68B0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_119;
        }
        v107 = v140;
        swift_bridgeObjectRelease();
        *(void *)&long long v141 = 0x6E74736F48707061;
        *((void *)&v141 + 1) = 0xEB00000000656D61;
        id v108 = objc_msgSend(v107, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
        swift_unknownObjectRelease();
        if (v108)
        {
          sub_1BBC38118();

          swift_unknownObjectRelease();
        }
        else
        {

          long long v141 = 0u;
          long long v142 = 0u;
        }
        sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
        if (v145)
        {
          swift_dynamicCast();
          goto LABEL_119;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
LABEL_119:
      if (!v51) {
        goto LABEL_157;
      }
      id v128 = objc_msgSend(v51, sel_credentialItemForKey_, *MEMORY[0x1E4F178F8]);
      if (v128) {
        goto LABEL_152;
      }
      goto LABEL_156;
    case 2:
      id v55 = v139;
      id v49 = objc_msgSend(v139, sel_aa_fmipAccount, 0, 0);
      v56 = (void *)sub_1BBBFD58C();
      id v51 = objc_msgSend(v56, sel_credentialForAccount_, v49);

      id result = objc_msgSend(v55, sel_dataclassProperties);
      if (!result)
      {
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
        return result;
      }
      v57 = result;
      *(void *)&long long v141 = sub_1BBC37E98();
      *((void *)&v141 + 1) = v58;
      swift_bridgeObjectRetain();
      id v59 = objc_msgSend(v57, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();

      if (v59)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (!v145)
      {
        swift_bridgeObjectRelease();
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
        goto LABEL_150;
      }
      sub_1BBBFAC1C(0, &qword_1EB9F68B0);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_144;
      }
      v109 = v140;
      swift_bridgeObjectRelease();
      uint64_t v143 = 0x656D616E74736F68;
      unint64_t v144 = 0xE800000000000000;
      id v110 = objc_msgSend(v109, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();
      if (v110)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145) {
        swift_dynamicCast();
      }
      else {
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
      }
      *(void *)&long long v141 = 0x6E74736F48707061;
      *((void *)&v141 + 1) = 0xEB00000000656D61;
      id v129 = objc_msgSend(v109, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();
      if (v129)
      {
        sub_1BBC38118();

        swift_unknownObjectRelease();
      }
      else
      {

        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145)
      {
        if (swift_dynamicCast()) {
LABEL_144:
        }
          swift_bridgeObjectRelease();
      }
      else
      {
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
      }
LABEL_150:
      if (!v51) {
        goto LABEL_157;
      }
      id v128 = objc_msgSend(v51, sel_credentialItemForKey_, *MEMORY[0x1E4F17908]);
      if (v128) {
        goto LABEL_152;
      }
      goto LABEL_156;
    case 3:
      id v60 = v139;
      id v49 = objc_msgSend(v139, sel_aa_fmipAccount, 0, 0);
      v61 = (void *)sub_1BBBFD58C();
      id v51 = objc_msgSend(v61, sel_credentialForAccount_, v49);

      id result = objc_msgSend(v60, sel_dataclassProperties);
      if (!result) {
        goto LABEL_162;
      }
      v62 = result;
      *(void *)&long long v141 = sub_1BBC37E98();
      *((void *)&v141 + 1) = v63;
      swift_bridgeObjectRetain();
      id v64 = objc_msgSend(v62, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();

      if (v64)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (!v145)
      {
        swift_bridgeObjectRelease();
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
        goto LABEL_154;
      }
      sub_1BBBFAC1C(0, &qword_1EB9F68B0);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_148;
      }
      v111 = v140;
      swift_bridgeObjectRelease();
      uint64_t v143 = 0x656D616E74736F68;
      unint64_t v144 = 0xE800000000000000;
      id v112 = objc_msgSend(v111, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();
      if (v112)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145) {
        swift_dynamicCast();
      }
      else {
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
      }
      *(void *)&long long v141 = 0x6E74736F48707061;
      *((void *)&v141 + 1) = 0xEB00000000656D61;
      id v130 = objc_msgSend(v111, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();
      if (v130)
      {
        sub_1BBC38118();

        swift_unknownObjectRelease();
      }
      else
      {

        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145)
      {
        if (swift_dynamicCast()) {
LABEL_148:
        }
          swift_bridgeObjectRelease();
      }
      else
      {
        sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
      }
LABEL_154:
      if (!v51) {
        goto LABEL_157;
      }
      id v128 = objc_msgSend(v51, sel_credentialItemForKey_, *MEMORY[0x1E4F17910]);
      if (!v128) {
        goto LABEL_156;
      }
      goto LABEL_152;
    case 4:
      id v88 = v139;
      id v89 = objc_msgSend(v139, sel_credential, 0, 0);
      v90 = v89;
      if (v89
        && (id v91 = objc_msgSend(v89, sel_credentialItemForKey_, *MEMORY[0x1E4F17988])) != 0)
      {
        v92 = v91;
        uint64_t v74 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v74 = 0;
      }
      sub_1BBC143B4(v88);

      return (id)v74;
    case 5:
    case 11:
    case 13:
      id v43 = objc_msgSend(v139, sel_credential, 0, 0);
      if (!v43) {
        goto LABEL_35;
      }
      v44 = v43;
      id v45 = objc_msgSend(v43, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
      if (v45)
      {
        v46 = v45;
        uint64_t v47 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v47 = 0;
      }
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = v41;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, (uint64_t)v17);
      uint64_t v106 = v137;
      uint64_t v105 = v138;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v138 + 48))(v17, 1, v137) == 1)
      {
        sub_1BBBFDF14((uint64_t)v17, (uint64_t *)&unk_1EB9F6558);
        sub_1BBC38018();
        if (qword_1EB9F6DC8 != -1) {
          swift_once();
        }
        sub_1BBC37D08();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v37, v17, v106);
        sub_1BBC37BF8();

        (*(void (**)(char *, uint64_t))(v105 + 8))(v37, v106);
      }
      return (id)v47;
    case 6:
      id v65 = objc_msgSend(v139, sel_credential, 0, 0);
      if (!v65) {
        goto LABEL_35;
      }
      v66 = v65;
      id v67 = objc_msgSend(v65, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
      if (v67)
      {
        v68 = v67;
        uint64_t v69 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v69 = 0;
      }
      uint64_t v116 = v137;
      uint64_t v115 = v138;
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = 6;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, (uint64_t)v14);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v115 + 48))(v14, 1, v116) == 1)
      {
        sub_1BBBFDF14((uint64_t)v14, (uint64_t *)&unk_1EB9F6558);
        sub_1BBC38018();
        if (qword_1EB9F6DC8 != -1) {
          swift_once();
        }
        sub_1BBC37D08();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v34, v14, v116);
        sub_1BBC37BF8();

        (*(void (**)(char *, uint64_t))(v115 + 8))(v34, v116);
      }
      return (id)v69;
    case 7:
      id v93 = objc_msgSend(v139, sel_credential, 0, 0);
      if (!v93) {
        goto LABEL_35;
      }
      v71 = v93;
      id v94 = objc_msgSend(v93, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
      if (v94)
      {
        v95 = v94;
        uint64_t v74 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v74 = 0;
      }
      uint64_t v126 = v137;
      uint64_t v125 = v138;
      uint64_t v127 = (uint64_t)v133;
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = 7;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, v127);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v125 + 48))(v127, 1, v126) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v125 + 32))(v31, v127, v126);
        sub_1BBC37BF8();

        (*(void (**)(char *, uint64_t))(v125 + 8))(v31, v126);
        return (id)v74;
      }
      sub_1BBBFDF14(v127, (uint64_t *)&unk_1EB9F6558);
      sub_1BBC38018();
      if (qword_1EB9F6DC8 != -1) {
        goto LABEL_159;
      }
      goto LABEL_105;
    case 8:
      id v70 = objc_msgSend(v139, sel_credential, 0, 0);
      if (!v70) {
        goto LABEL_35;
      }
      v71 = v70;
      id v72 = objc_msgSend(v70, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
      if (v72)
      {
        v73 = v72;
        uint64_t v74 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v74 = 0;
      }
      uint64_t v118 = v137;
      uint64_t v117 = v138;
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = 8;
      uint64_t v119 = v134;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, v134);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48))(v119, 1, v118) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v117 + 32))(v28, v119, v118);
        sub_1BBC37BF8();

        (*(void (**)(char *, uint64_t))(v117 + 8))(v28, v118);
        return (id)v74;
      }
      sub_1BBBFDF14(v119, (uint64_t *)&unk_1EB9F6558);
      sub_1BBC38018();
      if (qword_1EB9F6DC8 != -1) {
        goto LABEL_159;
      }
      goto LABEL_105;
    case 9:
      id v75 = objc_msgSend(v139, sel_credential, 0, 0);
      if (!v75) {
        goto LABEL_35;
      }
      v71 = v75;
      id v76 = objc_msgSend(v75, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
      if (v76)
      {
        v77 = v76;
        uint64_t v74 = sub_1BBC37E98();
      }
      else
      {
        uint64_t v74 = 0;
      }
      uint64_t v121 = v137;
      uint64_t v120 = v138;
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = 9;
      uint64_t v122 = v135;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, v135);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v120 + 48))(v122, 1, v121) == 1)
      {
        sub_1BBBFDF14(v122, (uint64_t *)&unk_1EB9F6558);
        sub_1BBC38018();
        if (qword_1EB9F6DC8 != -1) {
LABEL_159:
        }
          swift_once();
LABEL_105:
        sub_1BBC37D08();
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v120 + 32))(v25, v122, v121);
        sub_1BBC37BF8();

        (*(void (**)(char *, uint64_t))(v120 + 8))(v25, v121);
      }
      return (id)v74;
    case 10:
      uint64_t v96 = v38;
      id v97 = objc_msgSend(v139, sel_aa_fmipAccount, 0, 0);
      v98 = (void *)sub_1BBBFD58C();
      id v99 = objc_msgSend(v98, sel_credentialForAccount_, v97);

      if (v99)
      {
        id v100 = objc_msgSend(v99, sel_credentialItemForKey_, *MEMORY[0x1E4F17908]);
        uint64_t v102 = v137;
        uint64_t v101 = v138;
        uint64_t v103 = (uint64_t)v136;
        if (v100)
        {
          v104 = v100;
          uint64_t v69 = sub_1BBC37E98();
        }
        else
        {
          uint64_t v69 = 0;
        }
      }
      else
      {
        uint64_t v69 = 0;
        uint64_t v102 = v137;
        uint64_t v101 = v138;
        uint64_t v103 = (uint64_t)v136;
      }
      type metadata accessor for FMNAuthenticationProvider();
      LOBYTE(v143) = 10;
      static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, v103);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48))(v103, 1, v102) == 1)
      {
        sub_1BBBFDF14(v103, (uint64_t *)&unk_1EB9F6558);
        sub_1BBC38018();
        if (qword_1EB9F6DC8 != -1) {
          swift_once();
        }
        sub_1BBC37D08();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v96, v103, v102);
        sub_1BBC37BF8();

        (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v96, v102);
      }
      return (id)v69;
    case 12:
      id v78 = objc_msgSend(v139, sel_credential, 0, 0);
      if (v78)
      {
        v79 = v78;
        id v80 = objc_msgSend(v78, sel_credentialItemForKey_, *MEMORY[0x1E4F17978]);
        if (v80)
        {
          v81 = v80;
          uint64_t v82 = sub_1BBC37E98();
        }
        else
        {
          uint64_t v82 = 0;
        }
        uint64_t v124 = v137;
        uint64_t v123 = v138;
        type metadata accessor for FMNAuthenticationProvider();
        LOBYTE(v143) = 12;
        static FMNAuthenticationProvider.configurationURL(accountType:)(&v143, (uint64_t)v19);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v123 + 48))(v19, 1, v124) == 1)
        {
          sub_1BBBFDF14((uint64_t)v19, (uint64_t *)&unk_1EB9F6558);
          sub_1BBC38018();
          if (qword_1EB9F6DC8 != -1) {
            swift_once();
          }
          sub_1BBC37D08();
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v123 + 32))(v40, v19, v124);
          sub_1BBC37BF8();

          (*(void (**)(char *, uint64_t))(v123 + 8))(v40, v124);
        }
        return (id)v82;
      }
      else
      {
LABEL_35:
        sub_1BBC38018();
        if (qword_1EB9F6DC8 != -1) {
          swift_once();
        }
        sub_1BBC37D08();
        return 0;
      }
    case 14:
      return result;
    default:
      id v83 = v139;
      id v49 = objc_msgSend(v139, sel_aa_fmfAccount, 0, 0);
      v84 = (void *)sub_1BBBFD58C();
      id v51 = objc_msgSend(v84, sel_credentialForAccount_, v49);

      id result = objc_msgSend(v83, sel_dataclassProperties);
      if (!result) {
        goto LABEL_163;
      }
      v85 = result;
      *(void *)&long long v141 = sub_1BBC37E98();
      *((void *)&v141 + 1) = v86;
      swift_bridgeObjectRetain();
      id v87 = objc_msgSend(v85, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
      swift_unknownObjectRelease();

      if (v87)
      {
        sub_1BBC38118();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
      }
      sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
      if (v145)
      {
        sub_1BBBFAC1C(0, &qword_1EB9F68B0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_132;
        }
        v113 = v140;
        swift_bridgeObjectRelease();
        *(void *)&long long v141 = 0x6E74736F48707061;
        *((void *)&v141 + 1) = 0xEB00000000656D61;
        id v114 = objc_msgSend(v113, sel___swift_objectForKeyedSubscript_, sub_1BBC384E8());
        swift_unknownObjectRelease();
        if (v114)
        {
          sub_1BBC38118();

          swift_unknownObjectRelease();
        }
        else
        {

          long long v141 = 0u;
          long long v142 = 0u;
        }
        sub_1BBBFD524((uint64_t)&v141, (uint64_t)&v143);
        if (v145)
        {
          swift_dynamicCast();
          goto LABEL_132;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      sub_1BBBFDF14((uint64_t)&v143, &qword_1EB9F68A8);
LABEL_132:
      if (v51)
      {
        id v128 = objc_msgSend(v51, sel_credentialItemForKey_, *MEMORY[0x1E4F17900]);
        if (v128)
        {
LABEL_152:
          v131 = v128;
          uint64_t v132 = sub_1BBC37E98();

          return (id)v132;
        }
LABEL_156:
      }
      else
      {
LABEL_157:
      }
      return 0;
  }
}

uint64_t sub_1BBBFD524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBFD58C()
{
  id v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
LABEL_5:
    id v5 = v1;
    return (uint64_t)v2;
  }
  id v3 = objc_msgSend(self, sel_defaultStore);
  if (v3)
  {
    uint64_t v4 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v3;
    id v2 = v3;

    id v1 = 0;
    goto LABEL_5;
  }
  uint64_t result = sub_1BBC38228();
  __break(1u);
  return result;
}

void sub_1BBBFD658()
{
  sub_1BBBFD660((void *)(v0 + 16));
}

void sub_1BBBFD660(void *a1)
{
  sub_1BBBF9E60(&v14);
  uint64_t v2 = v15;
  if (v15)
  {
    uint64_t v3 = v14;
    uint64_t v4 = v16;
    uint64_t v5 = v17;
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    __swift_project_boxed_opaque_existential_1(a1 + 1, v6);
    if (v4 == (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7) && v5 == v8)
    {
      sub_1BBC1D5B8(v3, v2);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = sub_1BBC38448();
      sub_1BBC1D5B8(v3, v2);
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
        uint64_t v11 = (void *)sub_1BBC380B8();
        sub_1BBC38028();
        sub_1BBC37CF8();

        id v12 = objc_msgSend(self, sel_standardUserDefaults);
        id v13 = (id)sub_1BBC37E88();
        objc_msgSend(v12, sel_removeObjectForKey_, v13);
      }
    }
  }
}

uint64_t sub_1BBBFD85C()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1BBBFD890(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(1, 0);
}

uint64_t sub_1BBBFD8C4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1BBBFD8E0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BBBFD910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a5;
  *(void *)(v10 + 24) = a6;
  sub_1BBBFA360(a1, (uint64_t)v15);
  sub_1BBBFA360(a2, (uint64_t)v16);
  sub_1BBBFA360((uint64_t)v15, (uint64_t)v13);
  sub_1BBBFA360((uint64_t)v16, (uint64_t)v14);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = sub_1BBC01694;
  v11[3] = v10;
  swift_retain();
  swift_retain();
  sub_1BBBFDA48((uint64_t)v13, (uint64_t)v14, sub_1BBC01688, v11, 0, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v15, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  return swift_release();
}

uint64_t sub_1BBBFDA48(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, NSObject *a6)
{
  uint64_t v7 = v6;
  uint64_t v33 = a3;
  uint64_t v34 = a5;
  uint64_t v36 = a4;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v30);
  uint64_t v31 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1BBC37B78();
  uint64_t v32 = *(void *)(v37 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v37);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v35 = (uint64_t)&v29 - v15;
  sub_1BBBFA360(a1, (uint64_t)v47);
  sub_1BBBFA360(a2, (uint64_t)v48);
  sub_1BBBFA360((uint64_t)v47, (uint64_t)v41);
  sub_1BBBFA360((uint64_t)v48, (uint64_t)v42);
  sub_1BBBFAC58(v41, (uint64_t)v44);
  sub_1BBBFAC58(v42, (uint64_t)v43);
  sub_1BBBFA360((uint64_t)v44, (uint64_t)v40);
  uint64_t v16 = a6;
  if (!a6) {
    uint64_t v16 = sub_1BBBFE790(v40);
  }
  swift_retain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  uint64_t v17 = sub_1BBBFE298(v16, (uint64_t)v39);
  MEMORY[0x1F4188790](v17);
  *(&v29 - 2) = v7;
  *(&v29 - 1) = (uint64_t)v16;
  uint64_t v38 = v16;
  type metadata accessor for FMNHttpClient();
  sub_1BBC38078();
  uint64_t v18 = *(void **)&v41[0];
  sub_1BBBFA360((uint64_t)v47, (uint64_t)v41);
  sub_1BBBFA360((uint64_t)v48, (uint64_t)v42);
  unsigned int v19 = sub_1BBBFE02C((uint64_t)v18, (uint64_t)v39, (uint64_t)v41, v34, v33, v36);
  uint64_t v21 = v20;
  sub_1BBBFDF14((uint64_t)v41, &qword_1EB9F6630);
  uint64_t v22 = v45;
  uint64_t v23 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
  uint64_t v24 = v35;
  sub_1BBC05B9C((uint64_t)v14, (uint64_t)v39, v35);
  char v25 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v26 = v14;
  uint64_t v27 = v37;
  v25(v26, v37);
  uint64_t v34 = (uint64_t)v19;
  uint64_t v36 = v18;
  sub_1BBC03918(v43, v24, (uint64_t)v19, v21);
  swift_release();

  swift_release();
  v25((char *)v24, v27);
  sub_1BBBFDF14((uint64_t)v39, &qword_1EB9F6620);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
  sub_1BBBFDF14((uint64_t)v47, &qword_1EB9F6630);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
}

uint64_t sub_1BBBFDF14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BBBFDF70(uint64_t a1)
{
  return a1;
}

uint64_t destroy for FMNRedirectHostStore(id *a1)
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(a1 + 1));

  return swift_release();
}

uint64_t type metadata accessor for FMNHttpClient()
{
  return self;
}

uint64_t (*sub_1BBBFE02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6))(uint64_t a1)
{
  uint64_t v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A20);
  swift_allocObject();
  uint64_t v12 = sub_1BBC37E28();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a5;
  *(void *)(v13 + 24) = a6;
  swift_retain();
  sub_1BBC37DD8();
  swift_release();
  swift_release();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  *(void *)(v14 + 24) = a6;
  swift_retain();
  sub_1BBC37DE8();
  swift_release();
  swift_release();
  uint64_t v15 = *(void *)(v6 + 16);
  uint64_t v16 = *(void *)(v7 + 24);
  sub_1BBC01EFC(a3, (uint64_t)v25, &qword_1EB9F6630);
  uint64_t v17 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1BBC01EFC(v17, (uint64_t)v24, &qword_1EB9F6628);
  sub_1BBC01EFC(a2, (uint64_t)v23, &qword_1EB9F6620);
  swift_unknownObjectWeakInit();
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  long long v30 = v25[1];
  long long v31 = v25[2];
  long long v32 = v25[3];
  long long v33 = v25[4];
  long long v29 = v25[0];
  sub_1BBC01F60((uint64_t)v24, (uint64_t)&v34, &qword_1EB9F6628);
  sub_1BBC01F60((uint64_t)v23, (uint64_t)v35, &qword_1EB9F6620);
  swift_weakInit();
  v35[8] = a4;
  swift_unknownObjectRetain();
  dispatch_group_t v18 = sub_1BBC0169C(a5, a6, v12);
  sub_1BBBFDF14((uint64_t)v26, &qword_1EB9F67E8);
  unsigned int v19 = (void *)swift_allocObject();
  v19[2] = v7;
  v19[3] = v18;
  v19[4] = v12;
  swift_retain();
  return sub_1BBC009AC;
}

uint64_t sub_1BBBFE298@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    swift_beginAccess();
    sub_1BBC01EFC(v2 + 48, (uint64_t)&v10, &qword_1EB9F6620);
    if ((void)v10)
    {
      sub_1BBC06128((uint64_t)&v10, (uint64_t)&v8);
      swift_retain();
      sub_1BBBFDF14((uint64_t)&v10, &qword_1EB9F6620);
      sub_1BBBFA360((uint64_t)&v9, (uint64_t)v7);
      sub_1BBBFDF70((uint64_t)&v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F63A8);
      type metadata accessor for FMNAuthenticationCredential();
      if (swift_dynamicCast())
      {
        char v5 = _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0((void *)v10, a1);
        swift_release();
        if (v5)
        {
          swift_release();
          return sub_1BBC01EFC(v2 + 48, a2, &qword_1EB9F6620);
        }
      }
    }
    else
    {
      swift_retain();
      sub_1BBBFDF14((uint64_t)&v10, &qword_1EB9F6620);
    }
    *((void *)&v11 + 1) = type metadata accessor for FMNAuthenticationCredential();
    *(void *)&long long v12 = &protocol witness table for FMNAuthenticationCredential;
    *(void *)&long long v10 = a1;
    swift_retain();
    sub_1BBC065F0(&v10, &v8);
    sub_1BBC01F60((uint64_t)&v8, (uint64_t)&v10, &qword_1EB9F6620);
    if ((void)v10)
    {
      sub_1BBC06128((uint64_t)&v10, (uint64_t)&v8);
      FMNRedirectHostStore.clearRedirectedHostKeychainItemsIfNeeded()();
      swift_release();
      sub_1BBBFDF70((uint64_t)&v8);
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  sub_1BBC01EFC((uint64_t)&v10, (uint64_t)&v8, &qword_1EB9F6620);
  swift_beginAccess();
  sub_1BBBFFB60((uint64_t)&v8, v2 + 48, &qword_1EB9F6620);
  swift_endAccess();
  return sub_1BBC01F60((uint64_t)&v10, a2, &qword_1EB9F6620);
}

uint64_t sub_1BBBFE4C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BBBFE508(*(void *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_1BBBFE508(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1BBC37D88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = (void *)v2[5];
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBF0], v4);
  id v9 = v8;
  LOBYTE(v8) = sub_1BBC37DA8();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    long long v11 = (void *)v2[4];
    if (v11)
    {
      if (a1)
      {
        *((void *)&v22 + 1) = type metadata accessor for FMNAuthenticationCredential();
        uint64_t v23 = &protocol witness table for FMNAuthenticationCredential;
        *(void *)&long long v21 = a1;
      }
      else
      {
        uint64_t v23 = 0;
        long long v21 = 0u;
        long long v22 = 0u;
      }
      uint64_t v12 = (uint64_t)v11 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
      swift_beginAccess();
      id v13 = v11;
      swift_retain();
      sub_1BBBFFB60((uint64_t)&v21, v12, &qword_1EB9F6628);
      swift_endAccess();
      return (uint64_t)v13;
    }
    else
    {
      if (a1)
      {
        *((void *)&v22 + 1) = type metadata accessor for FMNAuthenticationCredential();
        uint64_t v23 = &protocol witness table for FMNAuthenticationCredential;
        *(void *)&long long v21 = a1;
      }
      else
      {
        uint64_t v23 = 0;
        long long v21 = 0u;
        long long v22 = 0u;
      }
      uint64_t v14 = v2[17];
      objc_allocWithZone((Class)type metadata accessor for FMNHttpClient());
      swift_retain();
      swift_retain();
      uint64_t v15 = (char *)sub_1BBC0701C((uint64_t)&v21, v14);
      swift_release();
      uint64_t v16 = (uint64_t *)&v15[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler];
      swift_beginAccess();
      uint64_t v17 = *v16;
      *uint64_t v16 = (uint64_t)sub_1BBBFD890;
      v16[1] = 0;
      sub_1BBBFA06C(v17);
      dispatch_group_t v18 = (void *)v2[4];
      v2[4] = v15;
      unsigned int v19 = v15;

      return (uint64_t)v19;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for FMNAuthenticationCredential()
{
  return self;
}

NSObject *sub_1BBBFE790(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(v2 + 8))(v4, v1, v2);
  return sub_1BBBFE8D4(v4);
}

NSObject *sub_1BBBFE8D4(char *a1)
{
  uint64_t v3 = v1;
  uint64_t v30 = sub_1BBC37D78();
  uint64_t v28 = *(void *)(v30 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v30);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  id v9 = (char *)v25 - v8;
  char v10 = *a1;
  sub_1BBC060E8();
  long long v11 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  uint64_t v12 = dispatch_group_create();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  dispatch_group_enter(v12);
  if (!*(void *)(v3 + 16))
  {
    sub_1BBC10C20();
    swift_allocError();
    *long long v22 = 6;
    swift_willThrow();

LABEL_6:
    swift_release();
    return v12;
  }
  v25[0] = v13 + 16;
  v25[1] = v2;
  uint64_t v14 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  v29[0] = v10;
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = v12;
  *(void *)(v15 + 32) = v13;
  uint64_t v16 = v9;
  uint64_t v17 = *(void (**)(unsigned char *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t))(v14 + 8);
  dispatch_group_t v18 = v12;
  uint64_t v27 = v13;
  unsigned int v19 = v18;
  swift_retain();
  swift_unknownObjectRetain();
  v17(v29, sub_1BBBFB394, v15, ObjectType, v14);
  swift_release();
  sub_1BBC37D68();
  MEMORY[0x1C1863110](v7, 9.0);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v21 = v30;
  v20(v7, v30);
  uint64_t v12 = v19;
  if (sub_1BBC38038())
  {
    sub_1BBC10C20();
    swift_allocError();
    unsigned char *v23 = 4;
    swift_willThrow();

    swift_unknownObjectRelease();
    v20(v16, v21);
    goto LABEL_6;
  }
  v20(v16, v21);
  swift_unknownObjectRelease();

  swift_beginAccess();
  uint64_t v12 = *(NSObject **)(v27 + 16);
  swift_retain();
  swift_release();
  return v12;
}

uint64_t sub_1BBBFEC18(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (((a1 + 15) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  unint64_t v7 = (*(void *)(v5 + 56) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v7 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_0Tm(v7);
  }
  uint64_t v8 = (id *)((v7 + 47) & 0xFFFFFFFFFFFFFFF8);
  if ((unint64_t)*v8 >= 0xFFFFFFFF)
  {

    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v8 + 1));
    swift_release();
  }

  return swift_weakDestroy();
}

uint64_t sub_1BBBFED08(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1BBC37D28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  long long v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = sub_1BBC37D58();
  uint64_t v12 = *(void *)(v21[0] - 8);
  MEMORY[0x1F4188790](v21[0]);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = *a1;
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  if (*(void *)(v4 + 56))
  {
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = v4;
    uint64_t v26 = sub_1BBBFB338;
    uint64_t v27 = v16;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v23 = 1107296256;
    uint64_t v17 = &block_descriptor_1;
  }
  else
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v4;
    *(void *)(v18 + 24) = a2;
    *(void *)(v18 + 32) = a3;
    *(unsigned char *)(v18 + 40) = v15;
    uint64_t v26 = sub_1BBBFB3A0;
    uint64_t v27 = (void *)v18;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v23 = 1107296256;
    uint64_t v17 = &block_descriptor_6;
  }
  uint64_t v24 = sub_1BBBFAD0C;
  char v25 = v17;
  unsigned int v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1BBC37D48();
  v21[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v14, v11, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, void))(v12 + 8))(v14, v21[0]);
  return swift_release();
}

uint64_t sub_1BBBFF0B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBFF0FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBFF14C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBFF190()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))();
}

uint64_t sub_1BBBFF1D4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t sub_1BBBFF218@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  swift_beginAccess();
  uint64_t v4 = sub_1BBC37B78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BBBFF29C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 56);
  return result;
}

uint64_t sub_1BBBFF2E0(uint64_t a1, unint64_t a2, char *a3, void *a4, void (*a5)(uint64_t *), uint64_t a6)
{
  unint64_t v90 = a2;
  uint64_t v92 = a1;
  id v93 = a5;
  id v91 = a3;
  uint64_t v8 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (uint64_t *)((char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1BBC37ED8();
  MEMORY[0x1F4188790](v21 - 8);
  uint64_t v23 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    *uint64_t v16 = (uint64_t)a4;
    swift_storeEnumTagMultiPayload();
    id v24 = a4;
    char v25 = v16;
LABEL_8:
    v93(v25);
    return sub_1BBBFDF14((uint64_t)v16, &qword_1EB9F6A30);
  }
  id v83 = v23;
  uint64_t v84 = v17;
  uint64_t v81 = v18;
  uint64_t v82 = (uint64_t *)v10;
  v85 = v20;
  uint64_t v86 = v13;
  uint64_t v87 = v14;
  uint64_t v88 = a6;
  id v27 = v91;
  uint64_t v26 = v92;
  unint64_t v28 = v90;
  if (!v91 || (self, (uint64_t v29 = swift_dynamicCastObjCClass()) == 0))
  {
    sub_1BBC26630();
    uint64_t v33 = swift_allocError();
    *uint64_t v34 = 5;
    *uint64_t v16 = v33;
    swift_storeEnumTagMultiPayload();
    char v25 = v16;
    goto LABEL_8;
  }
  if (v28 >> 60 == 15)
  {
    sub_1BBC26630();
    uint64_t v30 = swift_allocError();
    unsigned char *v31 = 6;
    *uint64_t v16 = v30;
    swift_storeEnumTagMultiPayload();
    id v32 = v27;
    v93(v16);

    return sub_1BBBFDF14((uint64_t)v16, &qword_1EB9F6A30);
  }
  uint64_t v36 = (void *)v29;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v37 = swift_allocObject();
  long long v80 = xmmword_1BBC38DE0;
  *(_OWORD *)(v37 + 16) = xmmword_1BBC38DE0;
  id v38 = v27;
  sub_1BBC0C0E4(v26, v28);
  id v39 = objc_msgSend(v36, sel_allHeaderFields);
  uint64_t v40 = sub_1BBC37E48();

  *(void *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6820);
  *(void *)(v37 + 64) = sub_1BBBFF14C(&qword_1EB9F6828, &qword_1EB9F6820);
  *(void *)(v37 + 32) = v40;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v41 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  id v42 = objc_msgSend(v36, sel_allHeaderFields);
  uint64_t v43 = sub_1BBC37E48();

  unint64_t v44 = sub_1BBBFFBC4(v43);
  swift_bridgeObjectRelease();
  id v78 = v16;
  id v79 = v38;
  uint64_t v77 = v8;
  if (v44) {
    unint64_t v45 = v44;
  }
  else {
    unint64_t v45 = sub_1BBC054D8(MEMORY[0x1E4FBC860]);
  }
  uint64_t v46 = v81;
  uint64_t v47 = v82;
  uint64_t v48 = v89;
  uint64_t v49 = v92;
  id v91 = (char *)objc_msgSend(v36, sel_statusCode);
  v50 = (void (*)(char *, unint64_t))sub_1BBC049EC((uint64_t)v91);
  if (v50)
  {
    uint64_t v51 = (uint64_t)v50;
    v50(v91, v45);
    sub_1BBBFA06C(v51);
  }
  v52 = (void *)(v48 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers);
  swift_beginAccess();
  void *v52 = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  uint64_t v53 = MEMORY[0x1E4FBB1A0];
  if ((unint64_t)(v91 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = v80;
    id v94 = v91;
    sub_1BBC225C0();
    uint64_t v55 = sub_1BBC38108();
    uint64_t v89 = v56;
    *(void *)(v54 + 56) = v53;
    *(void *)(v54 + 64) = sub_1BBC04664();
    uint64_t v57 = v89;
    *(void *)(v54 + 32) = v55;
    *(void *)(v54 + 40) = v57;
    uint64_t v58 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();
  }
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = v80;
  sub_1BBC37EC8();
  uint64_t v60 = v53;
  uint64_t v61 = v49;
  unint64_t v62 = v28;
  uint64_t v63 = sub_1BBC37EB8();
  unint64_t v65 = v64;
  *(void *)(v59 + 56) = v60;
  *(void *)(v59 + 64) = sub_1BBC04664();
  uint64_t v66 = 7104878;
  if (v65) {
    uint64_t v66 = v63;
  }
  unint64_t v67 = 0xE300000000000000;
  if (v65) {
    unint64_t v67 = v65;
  }
  *(void *)(v59 + 32) = v66;
  *(void *)(v59 + 40) = v67;
  v68 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  uint64_t v69 = swift_bridgeObjectRetain();
  id v70 = v85;
  FMNServerInteractionController.InternalServerMetadata.init(headers:)(v69, v85);
  uint64_t v71 = (uint64_t)v86;
  sub_1BBC00048((uint64_t)v70, (uint64_t)v86, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  id v72 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
  uint64_t v73 = v84;
  v72(v71, 0, 1, v84);
  uint64_t v74 = (uint64_t)v47 + *(int *)(v77 + 28);
  v72(v74, 1, 1, v73);
  *uint64_t v47 = v61;
  v47[1] = v62;
  v47[2] = (uint64_t)v91;
  v47[3] = v45;
  sub_1BBC02290(v61, v62);
  sub_1BBBFFB60(v71, v74, &qword_1EB9F68D0);
  uint64_t v75 = (uint64_t)v78;
  sub_1BBBFFADC((uint64_t)v47, (uint64_t)v78);
  swift_storeEnumTagMultiPayload();
  v93((uint64_t *)v75);

  sub_1BBC054C4(v61, v62);
  sub_1BBBFDF14(v75, &qword_1EB9F6A30);
  return sub_1BBC04718((uint64_t)v70, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
}

uint64_t sub_1BBBFFADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FMNServerInteractionController.FMNResponseFields(uint64_t a1)
{
  return sub_1BBC02538(a1, qword_1EB9F68B8);
}

uint64_t sub_1BBBFFB60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_1BBBFFBC4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6858);
    uint64_t v1 = (void *)sub_1BBC38258();
  }
  else
  {
    uint64_t v1 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  unint64_t v4 = v2 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      uint64_t v10 = (v4 - 1) & v4;
      unint64_t v11 = __clz(__rbit64(v4)) | (v6 << 6);
      int64_t v12 = v6;
    }
    else
    {
      int64_t v13 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v22)
      {
LABEL_36:
        sub_1BBC22614();
        return (unint64_t)v1;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v6 + 1;
      if (!v14)
      {
        int64_t v12 = v6 + 2;
        if (v6 + 2 >= v22) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v6 + 3;
          if (v6 + 3 >= v22) {
            goto LABEL_36;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v6 + 4;
            if (v6 + 4 >= v22) {
              goto LABEL_36;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v6 + 5;
              if (v6 + 5 >= v22) {
                goto LABEL_36;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_41;
                  }
                  if (v12 >= v22) {
                    goto LABEL_36;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v6 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1BBBFFFEC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v31);
    sub_1BBBFFF90(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    uint64_t v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_1BBBFFFEC((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_1BBBFDF14((uint64_t)v28, &qword_1EB9F6850);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_1BBC22614();
      swift_release();
      return 0;
    }
    sub_1BBBFFF90((uint64_t)v29 + 8, (uint64_t)v27);
    sub_1BBBFDF14((uint64_t)v28, &qword_1EB9F6850);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_1BBC03458(v25, v26);
    if (v16)
    {
      uint64_t v7 = 16 * result;
      uint64_t v8 = (uint64_t *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v25;
      v8[1] = v26;
      uint64_t v9 = (uint64_t *)(v1[7] + v7);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v9 = v25;
      v9[1] = v26;
      goto LABEL_8;
    }
    if (v1[2] >= v1[3]) {
      break;
    }
    *(void *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v17 = (uint64_t *)(v1[6] + 16 * result);
    *uint64_t v17 = v25;
    v17[1] = v26;
    uint64_t v18 = (uint64_t *)(v1[7] + 16 * result);
    *uint64_t v18 = v25;
    v18[1] = v26;
    uint64_t v19 = v1[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_39;
    }
    v1[2] = v21;
LABEL_8:
    int64_t v6 = v12;
    unint64_t v4 = v10;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1BBBFFF90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BBBFFFEC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BBC00048(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t initializeWithCopy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37DC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1BBC37CE8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  int64_t v15 = (void *)(a1 + v13);
  char v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *int64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a1 + v14;
  uint64_t v19 = a2 + v14;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t FMNServerInteractionController.InternalServerMetadata.init(headers:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v67 = &v64[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1BBC37CE8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v66 = &v64[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A18);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = &v64[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_1BBC37DC8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  int64_t v15 = &v64[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(void *)(a1 + 16)) {
    goto LABEL_58;
  }
  unint64_t result = sub_1BBC03458(0xD000000000000012, 0x80000001BBC3B470);
  if ((v17 & 1) == 0) {
    goto LABEL_58;
  }
  uint64_t v18 = (uint64_t *)(*(void *)(a1 + 56) + 16 * result);
  uint64_t v20 = *v18;
  unint64_t v19 = v18[1];
  uint64_t v21 = HIBYTE(v19) & 0xF;
  uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
  if (!((v19 & 0x2000000000000000) != 0 ? HIBYTE(v19) & 0xF : v20 & 0xFFFFFFFFFFFFLL)) {
    goto LABEL_58;
  }
  if ((v19 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BBC1FEE4(v20, v19, 10);
    int v65 = v42;
    swift_bridgeObjectRelease();
    if ((v65 & 1) == 0) {
      goto LABEL_38;
    }
LABEL_58:
    (*(void (**)(unsigned char *, void, uint64_t))(v13 + 104))(a2, *MEMORY[0x1E4F97E18], v12);
    goto LABEL_59;
  }
  if ((v19 & 0x2000000000000000) != 0)
  {
    v68[0] = v20;
    v68[1] = v19 & 0xFFFFFFFFFFFFFFLL;
    if (v20 == 43)
    {
      if (!v21) {
        goto LABEL_77;
      }
      if (v21 == 1) {
        goto LABEL_37;
      }
      if ((BYTE1(v20) - 48) > 9u) {
        goto LABEL_34;
      }
      if (v21 != 2)
      {
        if ((BYTE2(v20) - 48) > 9u) {
          goto LABEL_34;
        }
        uint64_t v26 = 10 * (BYTE1(v20) - 48) + (BYTE2(v20) - 48);
        uint64_t v27 = v21 - 3;
        if (v21 != 3)
        {
          unint64_t v28 = (unsigned __int8 *)v68 + 3;
          while (1)
          {
            unsigned int v29 = *v28 - 48;
            if (v29 > 9) {
              goto LABEL_34;
            }
            uint64_t v30 = 10 * v26;
            if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
              goto LABEL_34;
            }
            uint64_t v26 = v30 + v29;
            if (__OFADD__(v30, v29)) {
              goto LABEL_34;
            }
            LOBYTE(v21) = 0;
            ++v28;
            if (!--v27) {
              goto LABEL_37;
            }
          }
        }
      }
    }
    else
    {
      if (v20 == 45)
      {
        if (v21)
        {
          if (v21 != 1)
          {
            if ((BYTE1(v20) - 48) > 9u) {
              goto LABEL_34;
            }
            if (v21 == 2)
            {
              LOBYTE(v21) = 0;
              goto LABEL_37;
            }
            if ((BYTE2(v20) - 48) > 9u) {
              goto LABEL_34;
            }
            uint64_t v37 = -10 * (BYTE1(v20) - 48) - (BYTE2(v20) - 48);
            uint64_t v38 = v21 - 3;
            if (v21 != 3)
            {
              id v39 = (unsigned __int8 *)v68 + 3;
              while (1)
              {
                unsigned int v40 = *v39 - 48;
                if (v40 > 9) {
                  goto LABEL_34;
                }
                uint64_t v41 = 10 * v37;
                if ((unsigned __int128)(v37 * (__int128)10) >> 64 != (10 * v37) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v37 = v41 - v40;
                if (__OFSUB__(v41, v40)) {
                  goto LABEL_34;
                }
                LOBYTE(v21) = 0;
                ++v39;
                if (!--v38) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_37:
          if ((v21 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_58;
        }
        __break(1u);
LABEL_77:
        __break(1u);
        return result;
      }
      if (!v21 || (v20 - 48) > 9u)
      {
LABEL_34:
        LOBYTE(v21) = 1;
        goto LABEL_37;
      }
      if (v21 != 1)
      {
        if ((BYTE1(v20) - 48) > 9u) {
          goto LABEL_34;
        }
        uint64_t v32 = 10 * (v20 - 48) + (BYTE1(v20) - 48);
        uint64_t v33 = v21 - 2;
        if (v21 != 2)
        {
          uint64_t v34 = (unsigned __int8 *)v68 + 2;
          while (1)
          {
            unsigned int v35 = *v34 - 48;
            if (v35 > 9) {
              goto LABEL_34;
            }
            uint64_t v36 = 10 * v32;
            if ((unsigned __int128)(v32 * (__int128)10) >> 64 != (10 * v32) >> 63) {
              goto LABEL_34;
            }
            uint64_t v32 = v36 + v35;
            if (__OFADD__(v36, v35)) {
              goto LABEL_34;
            }
            LOBYTE(v21) = 0;
            ++v34;
            if (!--v33) {
              goto LABEL_37;
            }
          }
        }
      }
    }
LABEL_36:
    LOBYTE(v21) = 0;
    goto LABEL_37;
  }
  if ((v20 & 0x1000000000000000) != 0) {
    id v24 = (unsigned __int8 *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    id v24 = (unsigned __int8 *)sub_1BBC38218();
  }
  sub_1BBC21D74(v24, v22, 10);
  if (v25) {
    goto LABEL_58;
  }
LABEL_38:
  sub_1BBC37DB8();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    (*(void (**)(unsigned char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4F97E18], v12);
    sub_1BBBFDF14((uint64_t)v11, &qword_1EB9F6A18);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v13 + 32))(a2, v15, v12);
  }
  else
  {
    long long v31 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v13 + 32);
    v31(v15, v11, v12);
    v31(a2, v15, v12);
  }
LABEL_59:
  if (!*(void *)(a1 + 16)) {
    goto LABEL_63;
  }
  sub_1BBC03458(0xD000000000000014, 0x80000001BBC3B490);
  if ((v43 & 1) == 0) {
    goto LABEL_63;
  }
  swift_bridgeObjectRetain();
  uint64_t v44 = (uint64_t)v67;
  sub_1BBC37CC8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v44, 1, v6) == 1)
  {
    sub_1BBBFDF14(v44, &qword_1EB9F68D8);
LABEL_63:
    unint64_t v45 = &a2[*(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 20)];
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v45, 1, 1, v6);
    goto LABEL_64;
  }
  uint64_t v61 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 32);
  unint64_t v62 = v66;
  v61(v66, v44, v6);
  uint64_t v63 = &a2[*(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 20)];
  v61(v63, (uint64_t)v62, v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v63, 0, 1, v6);
LABEL_64:
  if (*(void *)(a1 + 16) && (unint64_t v46 = sub_1BBC03458(0xD000000000000015, 0x80000001BBC3B4B0), (v47 & 1) != 0))
  {
    uint64_t v48 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v46);
    uint64_t v50 = *v48;
    uint64_t v49 = v48[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v50 = 0;
    uint64_t v49 = 0;
  }
  uint64_t v51 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v52 = &a2[*(int *)(v51 + 24)];
  void *v52 = v50;
  v52[1] = v49;
  if (*(void *)(a1 + 16) && (unint64_t v53 = sub_1BBC03458(0xD000000000000013, 0x80000001BBC3B4D0), (v54 & 1) != 0))
  {
    uint64_t v55 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v53);
    uint64_t v56 = *v55;
    unint64_t v57 = v55[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t result = sub_1BBC1FC94(v56, v57);
    char v59 = v58 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t result = 0;
    char v59 = 1;
  }
  uint64_t v60 = &a2[*(int *)(v51 + 28)];
  *(void *)uint64_t v60 = result;
  v60[8] = v59;
  return result;
}

uint64_t sub_1BBC009AC(uint64_t a1)
{
  return sub_1BBC009B8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1BBC009B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BBC38028();
  sub_1BBC060E8();
  uint64_t v7 = (void *)sub_1BBC380B8();
  sub_1BBC37D08();

  return sub_1BBC00A58(a1, a3, a4);
}

uint64_t sub_1BBC00A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = a1;
  uint64_t v36 = a3;
  uint64_t v3 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (void **)((char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1BBC37D78();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  int64_t v15 = (char *)&v33 - v14;
  sub_1BBC060E8();
  char v16 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  sub_1BBC37D68();
  MEMORY[0x1C1863110](v13, 9.0);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v34 = v9;
  v33(v13, v9);
  sub_1BBC38038();
  sub_1BBC01EFC(v35, (uint64_t)v8, &qword_1EB9F6A30);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_1BBBFFADC((uint64_t)v8, (uint64_t)v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_1BBC38DE0;
    uint64_t v24 = *v5;
    unint64_t v25 = v5[1];
    uint64_t v26 = 0;
    switch(v25 >> 62)
    {
      case 1uLL:
        LODWORD(v26) = HIDWORD(v24) - v24;
        if (!__OFSUB__(HIDWORD(v24), v24))
        {
          uint64_t v26 = (int)v26;
          goto LABEL_8;
        }
        __break(1u);
        goto LABEL_11;
      case 2uLL:
        uint64_t v29 = v24 + 16;
        uint64_t v28 = *(void *)(v24 + 16);
        uint64_t v27 = *(void *)(v29 + 8);
        BOOL v30 = __OFSUB__(v27, v28);
        uint64_t v26 = v27 - v28;
        if (!v30) {
          goto LABEL_8;
        }
LABEL_11:
        __break(1u);
        return result;
      case 3uLL:
        goto LABEL_8;
      default:
        uint64_t v26 = BYTE6(v25);
LABEL_8:
        uint64_t v31 = MEMORY[0x1E4FBB5C8];
        *(void *)(result + 56) = MEMORY[0x1E4FBB550];
        *(void *)(result + 64) = v31;
        *(void *)(result + 32) = v26;
        uint64_t v32 = (void *)sub_1BBC380B8();
        sub_1BBC38028();
        sub_1BBC37CF8();
        swift_bridgeObjectRelease();

        sub_1BBC37E18();
        sub_1BBC011E0((uint64_t)v5);
        return ((uint64_t (*)(char *, uint64_t))v33)(v15, v34);
    }
  }
  char v17 = *v8;
  sub_1BBC38018();
  uint64_t v18 = (void *)sub_1BBC380B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1BBC38DE0;
  swift_getErrorValue();
  uint64_t v20 = sub_1BBC38518();
  uint64_t v22 = v21;
  *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v19 + 64) = sub_1BBC04664();
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 40) = v22;
  sub_1BBC37D08();

  swift_bridgeObjectRelease();
  sub_1BBC37E08();

  return ((uint64_t (*)(char *, uint64_t))v33)(v15, v34);
}

uint64_t sub_1BBC00E64(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC00F28(a1, (uint64_t)v6);
  swift_storeEnumTagMultiPayload();
  a2(v6);
  return sub_1BBBFDF14((uint64_t)v6, &qword_1EB9F6A30);
}

uint64_t sub_1BBC00F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC00F8C(uint64_t a1, void (*a2)(void **))
{
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (void **)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (void **)((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BBC01EFC(a1, (uint64_t)v13, &qword_1EB9F6A30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = *v13;
    *uint64_t v10 = *v13;
    (*(void (**)(void **, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F97E08], v7);
    id v15 = v14;
    a2(v10);

    return (*(uint64_t (**)(void **, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_1BBBFFADC((uint64_t)v13, (uint64_t)v6);
    sub_1BBC00F28((uint64_t)v6, (uint64_t)v10);
    (*(void (**)(void **, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F97E10], v7);
    a2(v10);
    (*(void (**)(void **, uint64_t))(v8 + 8))(v10, v7);
    return sub_1BBC011E0((uint64_t)v6);
  }
}

uint64_t sub_1BBC011E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BBC0123C(uint64_t a1, void (*a2)(void, unint64_t, id))
{
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (void *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (id *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  int v11 = (*(uint64_t (**)(id *, uint64_t))(v8 + 88))(v10, v7);
  if (v11 == *MEMORY[0x1E4F97E10])
  {
    (*(void (**)(id *, uint64_t))(v8 + 96))(v10, v7);
    sub_1BBBFFADC((uint64_t)v10, (uint64_t)v6);
    unint64_t v12 = v6[2];
    if (v12 - 300 > 0xFFFFFFFFFFFFFF9BLL)
    {
      id v25 = 0;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
      uint64_t v13 = swift_allocObject();
      long long v28 = xmmword_1BBC38DE0;
      *(_OWORD *)(v13 + 16) = xmmword_1BBC38DE0;
      unint64_t v30 = v12;
      sub_1BBC225C0();
      uint64_t v14 = sub_1BBC38108();
      uint64_t v16 = v15;
      *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v13 + 64) = sub_1BBC04664();
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = v16;
      sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
      uint64_t v17 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();
      swift_bridgeObjectRelease();

      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6868);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v28;
      *(void *)(inited + 32) = sub_1BBC37E98();
      *(void *)(inited + 40) = v19;
      unint64_t v30 = 0;
      unint64_t v31 = 0xE000000000000000;
      sub_1BBC381D8();
      swift_bridgeObjectRelease();
      unint64_t v30 = 0xD00000000000001BLL;
      unint64_t v31 = 0x80000001BBC3CA60;
      unint64_t v29 = v12;
      sub_1BBC38368();
      sub_1BBC37F18();
      swift_bridgeObjectRelease();
      unint64_t v20 = v31;
      *(void *)(inited + 48) = v30;
      *(void *)(inited + 56) = v20;
      unint64_t v21 = sub_1BBC054D8(inited);
      sub_1BBC1F928(v21);
      swift_bridgeObjectRelease();
      id v22 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      uint64_t v23 = (void *)sub_1BBC37E88();
      uint64_t v24 = (void *)sub_1BBC37E38();
      swift_bridgeObjectRelease();
      id v25 = objc_msgSend(v22, sel_initWithDomain_code_userInfo_, v23, 500, v24);
    }
    a2(*v6, v6[1], v25);

    sub_1BBC046B8((uint64_t)v6, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
  }
  else if (v11 == *MEMORY[0x1E4F97E08])
  {
    (*(void (**)(id *, uint64_t))(v8 + 96))(v10, v7);
    id v26 = *v10;
    id v27 = *v10;
    a2(0, 0xF000000000000000, v26);
  }
  else
  {
    sub_1BBC38438();
    __break(1u);
  }
}

uint64_t sub_1BBC01688(uint64_t a1)
{
  return sub_1BBC01690(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1BBC01694(uint64_t a1)
{
  sub_1BBC0123C(a1, *(void (**)(void, unint64_t, id))(v1 + 16));
}

dispatch_group_t sub_1BBC0169C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  char v47 = a1;
  uint64_t v45 = sub_1BBC37D28();
  uint64_t v54 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  unint64_t v53 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v50 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_t v10 = dispatch_group_create();
  sub_1BBC01EFC(v4, (uint64_t)&v68, &qword_1EB9F67E8);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_1BBC01F60((uint64_t)&v68, v11 + 24, &qword_1EB9F67E8);
  sub_1BBC01EFC(v4 + 24, (uint64_t)v67, &qword_1EB9F6630);
  sub_1BBC01EFC(v4 + 144, (uint64_t)v66, &qword_1EB9F6620);
  sub_1BBC01EFC(v4, (uint64_t)&v68, &qword_1EB9F67E8);
  long long v63 = v67[2];
  long long v64 = v67[3];
  long long v65 = v67[4];
  long long v61 = v67[0];
  long long v62 = v67[1];
  sub_1BBC01F60((uint64_t)v66, (uint64_t)v60, &qword_1EB9F6620);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  sub_1BBC01F60((uint64_t)&v68, v12 + 24, &qword_1EB9F67E8);
  v43[3] = a3;
  *(void *)(v12 + 240) = a3;
  long long v13 = v63;
  long long v14 = v64;
  long long v15 = v61;
  *(_OWORD *)(v12 + 264) = v62;
  *(_OWORD *)(v12 + 280) = v13;
  long long v16 = v65;
  *(_OWORD *)(v12 + 296) = v14;
  *(_OWORD *)(v12 + 312) = v16;
  *(_OWORD *)(v12 + 248) = v15;
  sub_1BBC01F60((uint64_t)v60, v12 + 328, &qword_1EB9F6620);
  *(void *)(v12 + 384) = v47;
  *(void *)(v12 + 392) = a2;
  uint64_t v44 = a2;
  long long v55 = xmmword_1BBC39270;
  char v47 = v56;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1BBC10B30;
  *(void *)(v17 + 24) = v11;
  v56[0] = 401;
  v56[1] = sub_1BBC10BD0;
  v56[2] = v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1BBC10B70;
  *(void *)(v18 + 24) = v12;
  uint64_t v57 = 330;
  char v58 = sub_1BBC10EDC;
  uint64_t v59 = v18;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1BBC10BD0;
  *(void *)(v19 + 24) = v17;
  uint64_t v46 = v4;
  uint64_t v20 = MEMORY[0x1C1863FE0](v4);
  uint64_t v48 = v11;
  dispatch_group_t v49 = v10;
  if (v20)
  {
    unint64_t v21 = (void *)v20;
    v43[2] = *(void *)(v20 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = v22;
    v23[3] = 401;
    v43[1] = v22;
    v23[4] = sub_1BBC10BD8;
    v23[5] = v19;
    id v72 = sub_1BBC10E90;
    uint64_t v73 = v23;
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 1107296256;
    id v70 = sub_1BBBFAD0C;
    uint64_t v71 = &block_descriptor_49;
    v43[0] = _Block_copy(&v68);
    uint64_t v24 = v10;
    swift_retain_n();
    id v25 = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v26 = v50;
    sub_1BBC37D48();
    *(void *)&v67[0] = MEMORY[0x1E4FBC860];
    sub_1BBC01FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBC025FC();
    id v27 = v53;
    uint64_t v28 = v45;
    sub_1BBC38128();
    unint64_t v29 = (const void *)v43[0];
    MEMORY[0x1C1863400](0, v26, v27, v43[0]);
    _Block_release(v29);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v28);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v52);
    swift_release();

    swift_release();
    swift_release();
    swift_release();
    uint64_t v31 = v57;
    unint64_t v30 = v58;
    uint64_t v18 = v59;
  }
  else
  {
    uint64_t v32 = v10;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    unint64_t v30 = sub_1BBC10EDC;
    uint64_t v31 = 330;
    uint64_t v28 = v45;
  }
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v30;
  *(void *)(v33 + 24) = v18;
  uint64_t v34 = MEMORY[0x1C1863FE0](v46);
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v46 = *(void *)(v34 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    uint64_t v36 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v37 = (void *)swift_allocObject();
    v37[2] = v36;
    v37[3] = v31;
    uint64_t v45 = v36;
    v37[4] = sub_1BBC10EF0;
    v37[5] = v33;
    id v72 = sub_1BBBFAD50;
    uint64_t v73 = v37;
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 1107296256;
    id v70 = sub_1BBBFAD0C;
    uint64_t v71 = &block_descriptor_41;
    uint64_t v44 = _Block_copy(&v68);
    swift_retain_n();
    swift_retain();
    swift_retain();
    uint64_t v38 = v50;
    sub_1BBC37D48();
    *(void *)&v67[0] = MEMORY[0x1E4FBC860];
    sub_1BBC01FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    uint64_t v39 = v28;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBC025FC();
    unsigned int v40 = v53;
    sub_1BBC38128();
    uint64_t v41 = v44;
    MEMORY[0x1C1863400](0, v38, v40, v44);
    _Block_release(v41);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v39);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v52);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_retain();
  }
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A28);
  swift_arrayDestroy();
  return v49;
}

uint64_t sub_1BBC01EFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BBC01F60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BBC01FC4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeWithCopy for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1BBC02290(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 28);
  dispatch_group_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t v13 = *((void *)v12 - 1);
  long long v14 = *(unsigned int (**)(char *, uint64_t, int *))(v13 + 48);
  swift_bridgeObjectRetain();
  if (v14(v11, 1, v12))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_1BBC37DC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v10, v11, v16);
    uint64_t v17 = v12[5];
    uint64_t v18 = &v10[v17];
    uint64_t v19 = &v11[v17];
    uint64_t v20 = sub_1BBC37CE8();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v23 = v12[6];
    uint64_t v24 = &v10[v23];
    id v25 = &v11[v23];
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    uint64_t v27 = v12[7];
    uint64_t v28 = &v10[v27];
    unint64_t v29 = &v11[v27];
    v28[8] = v29[8];
    *(void *)uint64_t v28 = *(void *)v29;
    unint64_t v30 = *(void (**)(char *, void, uint64_t, int *))(v13 + 56);
    swift_bridgeObjectRetain();
    v30(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC20BAC);
}

uint64_t sub_1BBC02290(uint64_t a1, unint64_t a2)
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

uint64_t destroy for FMNServerInteractionController.FMNResponseFields(uint64_t a1, uint64_t a2)
{
  sub_1BBC025A4(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = sub_1BBC37DC8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
    uint64_t v8 = v4 + *(int *)(v5 + 20);
    uint64_t v9 = sub_1BBC37CE8();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    return swift_bridgeObjectRelease();
  }
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

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1BBC02538(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for FMNServerInteractionController.InternalServerMetadata(uint64_t a1)
{
  return sub_1BBC02538(a1, qword_1EB9F6970);
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC20A84);
}

uint64_t sub_1BBC025A4(uint64_t a1, unint64_t a2)
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

unint64_t sub_1BBC025FC()
{
  unint64_t result = qword_1EB9F6840;
  if (!qword_1EB9F6840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB9F6830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6840);
  }
  return result;
}

uint64_t sub_1BBC02658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (_OWORD *)((swift_unknownObjectWeakTakeInit() + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (_OWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = ((unint64_t)v6 + v10 + 16) & ~v10;
  uint64_t v12 = ((unint64_t)v7 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 32) + 7;
  unint64_t v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  long long v16 = *(_OWORD *)v15;
  long long v17 = *(_OWORD *)(v15 + 16);
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  *(_OWORD *)unint64_t v14 = v16;
  *(_OWORD *)(v14 + 16) = v17;
  unint64_t v18 = (v14 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  long long v21 = *(_OWORD *)(v19 + 16);
  long long v20 = *(_OWORD *)(v19 + 32);
  long long v22 = *(_OWORD *)v19;
  *(void *)(v18 + 48) = *(void *)(v19 + 48);
  *(_OWORD *)(v18 + 16) = v21;
  *(_OWORD *)(v18 + 32) = v20;
  *(_OWORD *)unint64_t v18 = v22;
  *(void *)((swift_weakTakeInit() + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)((((v19 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BBC02770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (_OWORD *)((swift_unknownObjectWeakCopyInit() + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (_OWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v11 = v9 + 16;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = ((unint64_t)v6 + v12 + 16) & ~v12;
  uint64_t v14 = ((unint64_t)v7 + v12 + 16) & ~v12;
  swift_unknownObjectRetain();
  v10(v13, v14, v8);
  uint64_t v15 = *(void *)(v11 + 48) + 7;
  unint64_t v16 = (v15 + v13) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v15 + v14) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = *(void *)(v17 + 24);
  if (v18 < 0xFFFFFFFF)
  {
    long long v19 = *(_OWORD *)v17;
    long long v20 = *(_OWORD *)(v17 + 16);
    *(void *)(v16 + 32) = *(void *)(v17 + 32);
    *(_OWORD *)unint64_t v16 = v19;
    *(_OWORD *)(v16 + 16) = v20;
  }
  else
  {
    *(void *)(v16 + 24) = v18;
    *(void *)(v16 + 32) = *(void *)(v17 + 32);
    (**(void (***)(unint64_t, unint64_t))(v18 - 8))(v16, v17);
  }
  unint64_t v21 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v17 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = *(void **)v22;
  if (*(void *)v22 < 0xFFFFFFFFuLL)
  {
    long long v27 = *(_OWORD *)v22;
    long long v28 = *(_OWORD *)(v22 + 16);
    long long v29 = *(_OWORD *)(v22 + 32);
    *(void *)(v21 + 48) = *(void *)(v22 + 48);
    *(_OWORD *)(v21 + 16) = v28;
    *(_OWORD *)(v21 + 32) = v29;
    *(_OWORD *)unint64_t v21 = v27;
  }
  else
  {
    *(void *)unint64_t v21 = v23;
    uint64_t v24 = *(void *)(v22 + 32);
    *(void *)(v21 + 32) = v24;
    *(void *)(v21 + 40) = *(void *)(v22 + 40);
    id v25 = **(void (***)(unint64_t, unint64_t, uint64_t))(v24 - 8);
    id v26 = v23;
    v25(v21 + 8, v22 + 8, v24);
    *(void *)(v21 + 48) = *(void *)(v22 + 48);
    swift_retain();
  }
  *(void *)((swift_weakCopyInit() + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)((((v22 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
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

uint64_t sub_1BBC029B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6380);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  void v44[3] = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BBC382F8();
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  v44[5] = v2;
  v44[1] = v5;
  v44[2] = v3 + 8;
  uint64_t v7 = (unsigned char *)(v5 + 56);
  uint64_t v8 = (void *)MEMORY[0x1E4FBC868];
  v44[4] = v1;
  while (1)
  {
    uint64_t v45 = v6;
    uint64_t v9 = *((void *)v7 - 3);
    uint64_t v10 = *((void *)v7 - 2);
    uint64_t v11 = *((void *)v7 - 1);
    char v12 = *v7;
    uint64_t v50 = v9;
    uint64_t v51 = v10;
    uint64_t v52 = v11;
    char v53 = v12;
    swift_bridgeObjectRetain();
    uint64_t v13 = v46;
    char v14 = sub_1BBC382B8();
    if (v13)
    {

      uint64_t v15 = sub_1BBC382A8();
      uint64_t v46 = 0;
      uint64_t v49 = MEMORY[0x1E4FBB1A0];
      *(void *)&long long v48 = v15;
      *((void *)&v48 + 1) = v25;
      sub_1BBC038B4(&v48, &v47);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v54 = v8;
      unint64_t v27 = sub_1BBC03458(v9, v10);
      unint64_t v29 = v27;
      uint64_t v30 = v8[2];
      BOOL v31 = (v28 & 1) == 0;
      uint64_t v32 = v30 + v31;
      if (__OFADD__(v30, v31)) {
        goto LABEL_35;
      }
      char v33 = v28;
      if (v8[3] >= v32)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v8 = v54;
          if ((v28 & 1) == 0) {
            goto LABEL_20;
          }
        }
        else
        {
          sub_1BBC0AEF4();
          uint64_t v8 = v54;
          if ((v33 & 1) == 0) {
            goto LABEL_20;
          }
        }
      }
      else
      {
        sub_1BBC035B4(v32, isUniquelyReferenced_nonNull_native);
        unint64_t v34 = sub_1BBC03458(v9, v10);
        if ((v33 & 1) != (v35 & 1)) {
          goto LABEL_38;
        }
        unint64_t v29 = v34;
        uint64_t v8 = v54;
        if ((v33 & 1) == 0)
        {
LABEL_20:
          v8[(v29 >> 6) + 8] |= 1 << v29;
          uint64_t v37 = (uint64_t *)(v8[6] + 16 * v29);
          *uint64_t v37 = v9;
          v37[1] = v10;
          sub_1BBC038B4(&v47, (_OWORD *)(v8[7] + 32 * v29));
          uint64_t v38 = v8[2];
          BOOL v39 = __OFADD__(v38, 1);
          uint64_t v40 = v38 + 1;
          if (v39) {
            goto LABEL_37;
          }
LABEL_27:
          v8[2] = v40;
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      uint64_t v36 = (_OWORD *)(v8[7] + 32 * v29);
      goto LABEL_24;
    }
    uint64_t v46 = 0;
    uint64_t v49 = MEMORY[0x1E4FBB390];
    LOBYTE(v48) = v14 & 1;
    sub_1BBC038B4(&v48, &v47);
    swift_bridgeObjectRetain();
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v54 = v8;
    unint64_t v18 = sub_1BBC03458(v9, v10);
    uint64_t v19 = v8[2];
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      break;
    }
    char v22 = v17;
    if (v8[3] >= v21)
    {
      if (v16)
      {
        uint64_t v8 = v54;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
      }
      else
      {
        sub_1BBC0AEF4();
        uint64_t v8 = v54;
        if ((v22 & 1) == 0) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      sub_1BBC035B4(v21, v16);
      unint64_t v23 = sub_1BBC03458(v9, v10);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_38;
      }
      unint64_t v18 = v23;
      uint64_t v8 = v54;
      if ((v22 & 1) == 0)
      {
LABEL_26:
        v8[(v18 >> 6) + 8] |= 1 << v18;
        uint64_t v41 = (uint64_t *)(v8[6] + 16 * v18);
        *uint64_t v41 = v9;
        v41[1] = v10;
        sub_1BBC038B4(&v47, (_OWORD *)(v8[7] + 32 * v18));
        uint64_t v42 = v8[2];
        BOOL v39 = __OFADD__(v42, 1);
        uint64_t v40 = v42 + 1;
        if (v39) {
          goto LABEL_36;
        }
        goto LABEL_27;
      }
    }
    uint64_t v36 = (_OWORD *)(v8[7] + 32 * v18);
LABEL_24:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v36);
    sub_1BBC038B4(&v47, v36);
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 += 32;
    uint64_t v6 = v45 - 1;
    if (v45 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v8;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  __break(1u);
LABEL_37:
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
LABEL_38:
  uint64_t result = sub_1BBC38508();
  __break(1u);
  return result;
}

uint64_t initializeWithCopy for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1BBC03458(uint64_t a1, uint64_t a2)
{
  sub_1BBC38578();
  sub_1BBC37F08();
  uint64_t v4 = sub_1BBC38598();

  return sub_1BBC034D0(a1, a2, v4);
}

unint64_t sub_1BBC034D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BBC38448() & 1) == 0)
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
      while (!v14 && (sub_1BBC38448() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1BBC035B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6378);
  uint64_t v6 = sub_1BBC38248();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      char v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1BBC038B4(v24, v35);
      }
      else
      {
        sub_1BBBFFF90((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1BBC38578();
      sub_1BBC37F08();
      uint64_t result = sub_1BBC38598();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1BBC038B4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_1BBC038B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1BBC038C4()
{
  unint64_t result = qword_1EB9F6368;
  if (!qword_1EB9F6368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6368);
  }
  return result;
}

void sub_1BBC03918(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v6 = MEMORY[0x1F4188790](v49);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  long long v48 = (char *)&v40 - v9;
  uint64_t v10 = sub_1BBC37B78();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  int64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BBC37C18();
  uint64_t v50 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  long long v47 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  uint64_t v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  char v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 56))(v16, v17);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (v18)
  {
    uint64_t v21 = &v57[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
    swift_beginAccess();
    sub_1BBC01EFC((uint64_t)v21, (uint64_t)v54, &qword_1EB9F6628);
    uint64_t v20 = v55;
    if (v55)
    {
      uint64_t v22 = v56;
      __swift_project_boxed_opaque_existential_1(v54, v55);
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v20, v22);
      uint64_t v20 = v23;
      sub_1BBBFDF14((uint64_t)v54, &qword_1EB9F6628);
    }
    else
    {
      sub_1BBBFDF14((uint64_t)v54, &qword_1EB9F6628);
      uint64_t v19 = 0;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  if (v20)
  {
    uint64_t v24 = sub_1BBC37B38();
    uint64_t v45 = v14;
    v54[0] = v24;
    v54[1] = v25;
    v53[0] = (void *)16421;
    v53[1] = (void *)0xE200000000000000;
    uint64_t v51 = v19;
    uint64_t v52 = v20;
    sub_1BBC05470();
    uint64_t v44 = v11;
    uint64_t v26 = v10;
    uint64_t v27 = MEMORY[0x1E4FBB1A0];
    sub_1BBC380F8();
    swift_bridgeObjectRelease();
    sub_1BBC37B48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1BBC38DE0;
    sub_1BBC37B08();
    uint64_t v29 = sub_1BBC37EE8();
    uint64_t v31 = v30;
    *(void *)(v28 + 56) = v27;
    uint64_t v10 = v26;
    uint64_t v11 = v44;
    *(void *)(v28 + 64) = sub_1BBC04664();
    *(void *)(v28 + 32) = v29;
    *(void *)(v28 + 40) = v31;
    uint64_t v14 = v45;
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    uint64_t v32 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();
  }
  sub_1BBC37B08();
  uint64_t v33 = v50;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v8, 1, v14) == 1)
  {
    sub_1BBBFDF14((uint64_t)v8, (uint64_t *)&unk_1EB9F6558);
    sub_1BBC26630();
    swift_allocError();
    *unint64_t v34 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v35 = (uint64_t)v47;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v47, v8, v14);
    uint64_t v36 = swift_bridgeObjectRelease();
    MEMORY[0x1F4188790](v36);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6568);
    uint64_t v37 = v46;
    sub_1BBC37D18();
    if (v37)
    {
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v14);
    }
    else
    {
      uint64_t v38 = swift_release();
      v53[0] = 0;
      BOOL v39 = (void *)MEMORY[0x1C18639D0](v38);
      sub_1BBC03F84(v41, v35, v57, v53, v54, v42, v43);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v54);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v14);
    }
  }
}

uint64_t sub_1BBC03F34()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BBC03F84(void *a1, uint64_t a2, unsigned char *a3, void **a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v74 = a7;
  uint64_t v73 = a6;
  id v72 = a5;
  uint64_t v75 = a4;
  v85 = a3;
  uint64_t v82 = a2;
  uint64_t v8 = sub_1BBC37A48();
  uint64_t v78 = *(void *)(v8 - 8);
  uint64_t v79 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v76 = (uint64_t)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v77 = (uint64_t)&v71 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v84 = (char *)&v71 - v13;
  uint64_t v14 = sub_1BBC37C18();
  uint64_t v80 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = v17;
  uint64_t v18 = type metadata accessor for FMNRequest(0);
  uint64_t v19 = (int *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  uint64_t v22 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v23);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 40))(&v88, v23, v22);
  int v87 = v88;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v82, v14);
  uint64_t v24 = a1[3];
  uint64_t v25 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v24);
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v25);
  uint64_t v28 = v27;
  uint64_t v29 = (uint64_t)&v85[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
  swift_beginAccess();
  sub_1BBC01EFC(v29, (uint64_t)v86, &qword_1EB9F6628);
  uint64_t v31 = a1[3];
  uint64_t v30 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v31);
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 16))(v31, v30);
  unsigned char *v21 = v87;
  (*(void (**)(unsigned char *, char *, uint64_t))(v15 + 32))(&v21[v19[7]], v81, v80);
  uint64_t v33 = (uint64_t *)&v21[v19[8]];
  uint64_t *v33 = v26;
  v33[1] = v28;
  sub_1BBC04984((uint64_t)v86, (uint64_t)&v21[v19[10]]);
  *(void *)&v21[v19[9]] = v32;
  uint64_t v34 = a1[3];
  uint64_t v35 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v34);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 48))(v34, v35))
  {
    uint64_t v36 = v77;
    uint64_t v37 = v85;
    uint64_t v38 = v83;
    sub_1BBC25574(v77);
    BOOL v39 = v37;
    if (v38)
    {
LABEL_3:
      uint64_t v40 = (uint64_t)v21;
      return sub_1BBC04718(v40, type metadata accessor for FMNRequest);
    }
  }
  else
  {
    uint64_t v36 = v76;
    uint64_t v41 = v83;
    sub_1BBC04C14(v76);
    BOOL v39 = v85;
    if (v41) {
      goto LABEL_3;
    }
  }
  v85 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v84, v36, v79);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v42 = swift_allocObject();
  long long v83 = xmmword_1BBC38DE0;
  *(_OWORD *)(v42 + 16) = xmmword_1BBC38DE0;
  uint64_t v43 = a1[3];
  uint64_t v44 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v43);
  unint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
  uint64_t v47 = v45;
  unint64_t v48 = v46;
  switch(v46 >> 62)
  {
    case 1uLL:
      unint64_t v50 = HIDWORD(v45);
      uint64_t result = sub_1BBC025A4(v45, v46);
      LODWORD(v49) = v50 - v47;
      if (!__OFSUB__(v50, v47))
      {
        uint64_t v49 = (int)v49;
        goto LABEL_13;
      }
      __break(1u);
      return result;
    case 2uLL:
      uint64_t v53 = *(void *)(v45 + 16);
      uint64_t v52 = *(void *)(v45 + 24);
      sub_1BBC025A4(v45, v46);
      uint64_t v49 = v52 - v53;
      if (!__OFSUB__(v52, v53)) {
        goto LABEL_13;
      }
      __break(1u);
      goto LABEL_12;
    case 3uLL:
LABEL_12:
      sub_1BBC025A4(v47, v48);
      uint64_t v49 = 0;
      goto LABEL_13;
    default:
      sub_1BBC025A4(v45, v46);
      uint64_t v49 = BYTE6(v48);
LABEL_13:
      uint64_t v54 = MEMORY[0x1E4FBB5C8];
      *(void *)(v42 + 56) = MEMORY[0x1E4FBB550];
      *(void *)(v42 + 64) = v54;
      *(void *)(v42 + 32) = v49;
      sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
      uint64_t v55 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();
      swift_bridgeObjectRelease();

      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = v83;
      uint64_t v57 = v84;
      uint64_t v58 = sub_1BBC05664();
      uint64_t v60 = v59;
      *(void *)(v56 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v56 + 64) = sub_1BBC04664();
      *(void *)(v56 + 32) = v58;
      *(void *)(v56 + 40) = v60;
      long long v61 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();
      swift_bridgeObjectRelease();

      uint64_t v62 = v72[3];
      uint64_t v63 = v72[4];
      __swift_project_boxed_opaque_existential_1(v72, v62);
      long long v64 = (void *)swift_allocObject();
      uint64_t v65 = v73;
      v64[2] = v39;
      v64[3] = v65;
      v64[4] = v74;
      uint64_t v66 = *(uint64_t (**)(char *, uint64_t (*)(uint64_t, unint64_t, char *, void *), void *, uint64_t, uint64_t))(v63 + 8);
      id v67 = v39;
      swift_retain();
      uint64_t v68 = v66(v57, sub_1BBBF9C78, v64, v62, v63);
      swift_release();
      uint64_t v69 = v75;
      id v70 = *v75;
      *uint64_t v75 = (void *)v68;

      if (*v69) {
        objc_msgSend(*v69, sel_resume);
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v84, v79);
      uint64_t v40 = (uint64_t)v85;
      break;
  }
  return sub_1BBC04718(v40, type metadata accessor for FMNRequest);
}

unint64_t sub_1BBC04664()
{
  unint64_t result = qword_1EB9F6810;
  if (!qword_1EB9F6810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6810);
  }
  return result;
}

uint64_t sub_1BBC046B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BBC04718(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for FMNRequest(uint64_t a1)
{
  return sub_1BBC02538(a1, qword_1EB9F6580);
}

id sub_1BBC04798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t v7 = (void *)sub_1BBC379C8();
  v11[4] = a2;
  v11[5] = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1BBBF9B84;
  v11[3] = &block_descriptor_3;
  uint64_t v8 = _Block_copy(v11);
  swift_retain();
  id v9 = objc_msgSend(v6, sel_dataTaskWithRequest_completionHandler_, v7, v8);

  _Block_release(v8);
  swift_release();
  return v9;
}

uint64_t destroy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37DC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1BBC37CE8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return swift_bridgeObjectRelease();
}

void FMNRequestContentRepresentable.method.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1BBC04984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC049EC(uint64_t a1)
{
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue];
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = v12;
  v4[3] = v1;
  v4[4] = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_1BBBF9F9C;
  *(void *)(v5 + 24) = v4;
  v11[4] = sub_1BBBF9CA4;
  v11[5] = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1BBBF9C7C;
  v11[3] = &block_descriptor_61;
  uint64_t v6 = _Block_copy(v11);
  uint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12[0];
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_1BBC04B5C(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_1BBC025A4(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease();
  uint64_t result = a1 + a2[8];
  if (*(void *)(result + 24))
  {
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  }
  return result;
}

uint64_t sub_1BBC04C14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1BBC37C18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (int *)type metadata accessor for FMNRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3 + v9[5], v5);
  sub_1BBC379E8();
  sub_1BBC379B8();
  sub_1BBC37A08();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (!v11) {
    sub_1BBC37A38();
  }
  sub_1BBC37A08();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13) {
    sub_1BBC37A38();
  }
  sub_1BBC055FC(v3 + v9[8], (uint64_t)&v42);
  uint64_t v47 = v3;
  uint64_t v41 = v9;
  if (!v43)
  {
    uint64_t v40 = v2;
    sub_1BBBFDF14((uint64_t)&v42, &qword_1EB9F6628);
    goto LABEL_29;
  }
  sub_1BBBFAC58(&v42, (uint64_t)v44);
  uint64_t v14 = v45;
  uint64_t v15 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 56))(v14, v15);
  if (!*(void *)(result + 16))
  {
    swift_bridgeObjectRelease();
    sub_1BBC1B054();
    swift_allocError();
    *uint64_t v38 = 1;
    swift_willThrow();
    uint64_t v39 = sub_1BBC37A48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(a1, v39);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  }
  uint64_t v40 = v2;
  int64_t v17 = 0;
  uint64_t v18 = result + 64;
  uint64_t v19 = 1 << *(unsigned char *)(result + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  uint64_t v21 = v20 & *(void *)(result + 64);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  while (1)
  {
    if (v21)
    {
      v21 &= v21 - 1;
      goto LABEL_11;
    }
    int64_t v23 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v23 >= v22) {
      goto LABEL_27;
    }
    uint64_t v24 = *(void *)(v18 + 8 * v23);
    ++v17;
    if (!v24)
    {
      int64_t v17 = v23 + 1;
      if (v23 + 1 >= v22) {
        goto LABEL_27;
      }
      uint64_t v24 = *(void *)(v18 + 8 * v17);
      if (!v24)
      {
        int64_t v17 = v23 + 2;
        if (v23 + 2 >= v22) {
          goto LABEL_27;
        }
        uint64_t v24 = *(void *)(v18 + 8 * v17);
        if (!v24) {
          break;
        }
      }
    }
LABEL_26:
    uint64_t v21 = (v24 - 1) & v24;
LABEL_11:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BBC37A38();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v22) {
    goto LABEL_27;
  }
  uint64_t v24 = *(void *)(v18 + 8 * v25);
  if (v24)
  {
    int64_t v17 = v25;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v17 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      goto LABEL_54;
    }
    if (v17 >= v22) {
      break;
    }
    uint64_t v24 = *(void *)(v18 + 8 * v17);
    ++v25;
    if (v24) {
      goto LABEL_26;
    }
  }
LABEL_27:
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  uint64_t v3 = v47;
  id v9 = v41;
LABEL_29:
  uint64_t v26 = *(void *)(v3 + v9[7]);
  uint64_t v29 = *(void *)(v26 + 64);
  uint64_t v28 = v26 + 64;
  uint64_t v27 = v29;
  uint64_t v30 = 1 << *(unsigned char *)(*(void *)(v3 + v9[7]) + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  uint64_t v32 = v31 & v27;
  int64_t v33 = (unint64_t)(v30 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  while (2)
  {
    if (v32)
    {
      v32 &= v32 - 1;
LABEL_33:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BBC37A38();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  int64_t v35 = v34 + 1;
  if (__OFADD__(v34, 1))
  {
    __break(1u);
    goto LABEL_52;
  }
  if (v35 >= v33) {
    goto LABEL_49;
  }
  uint64_t v36 = *(void *)(v28 + 8 * v35);
  ++v34;
  if (v36) {
    goto LABEL_48;
  }
  int64_t v34 = v35 + 1;
  if (v35 + 1 >= v33) {
    goto LABEL_49;
  }
  uint64_t v36 = *(void *)(v28 + 8 * v34);
  if (v36) {
    goto LABEL_48;
  }
  int64_t v34 = v35 + 2;
  if (v35 + 2 >= v33) {
    goto LABEL_49;
  }
  uint64_t v36 = *(void *)(v28 + 8 * v34);
  if (v36)
  {
LABEL_48:
    uint64_t v32 = (v36 - 1) & v36;
    goto LABEL_33;
  }
  int64_t v37 = v35 + 3;
  if (v37 >= v33)
  {
LABEL_49:
    swift_release();
    sub_1BBC02290(*(void *)(v47 + v41[6]), *(void *)(v47 + v41[6] + 8));
    return sub_1BBC37A28();
  }
  uint64_t v36 = *(void *)(v28 + 8 * v37);
  if (v36)
  {
    int64_t v34 = v37;
    goto LABEL_48;
  }
  while (1)
  {
    int64_t v34 = v37 + 1;
    if (__OFADD__(v37, 1)) {
      break;
    }
    if (v34 >= v33) {
      goto LABEL_49;
    }
    uint64_t v36 = *(void *)(v28 + 8 * v34);
    ++v37;
    if (v36) {
      goto LABEL_48;
    }
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

unint64_t sub_1BBC051EC()
{
  return sub_1BBC05210();
}

unint64_t sub_1BBC05210()
{
  uint64_t v1 = sub_1BBC37ED8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  unint64_t v5 = *(void *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 32);
  unint64_t v17 = v5;
  swift_bridgeObjectRetain();
  sub_1BBC37F18();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37EC8();
  uint64_t v6 = sub_1BBC37EA8();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  if (v8 >> 60 == 15)
  {
    sub_1BBC38018();
    sub_1BBC060E8();
    id v9 = (void *)sub_1BBC380B8();
    uint64_t v10 = MEMORY[0x1E4FBC860];
    sub_1BBC37D08();

    uint64_t inited = v10;
  }
  else
  {
    sub_1BBC37C68();
    sub_1BBC054C4(v6, v8);
    uint64_t v16 = 0x206369736142;
    unint64_t v17 = 0xE600000000000000;
    sub_1BBC37F18();
    swift_bridgeObjectRelease();
    uint64_t v12 = v16;
    unint64_t v13 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6868);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BBC38DE0;
    strcpy((char *)(inited + 32), "Authorization");
    *(_WORD *)(inited + 46) = -4864;
    *(void *)(inited + 48) = v12;
    *(void *)(inited + 56) = v13;
  }
  return sub_1BBC054D8(inited);
}

unint64_t sub_1BBC05470()
{
  unint64_t result = qword_1EB9F6800;
  if (!qword_1EB9F6800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6800);
  }
  return result;
}

uint64_t sub_1BBC054C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1BBC025A4(a1, a2);
  }
  return a1;
}

unint64_t sub_1BBC054D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6858);
  uint64_t v2 = (void *)sub_1BBC38258();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BBC03458(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1BBC055FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC05664()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37A48();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v0, v8);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_1BBC379F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1BBBFDF14((uint64_t)v3, (uint64_t *)&unk_1EB9F6558);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1BBC37BB8();
    uint64_t v15 = 0x203A4C5255;
    unint64_t v16 = 0xE500000000000000;
    sub_1BBC37F18();
    swift_bridgeObjectRelease();
    sub_1BBC37F18();
    swift_bridgeObjectRelease();
    sub_1BBC37F18();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v12 = sub_1BBC379D8();
  if (v12)
  {
    uint64_t v13 = *(void *)(v12 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v15 = v13;
  sub_1BBC38368();
  uint64_t v15 = 0x3A73726564616548;
  unint64_t v16 = 0xE900000000000020;
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v17;
}

void sub_1BBC0596C(uint64_t a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  if (FMNAccountType.rawValue.getter() == 1701736302 && v9 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    goto LABEL_13;
  }
  char v11 = sub_1BBC38448();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_11;
  }
  if (!a2)
  {
    sub_1BBC060E8();
    unint64_t v18 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();

    if (!a1) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  id v12 = a2;
  sub_1BBC38018();
  sub_1BBC060E8();
  uint64_t v13 = (void *)sub_1BBC380B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BBC38DE0;
  swift_getErrorValue();
  uint64_t v15 = sub_1BBC38518();
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v14 + 64) = sub_1BBC04664();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  sub_1BBC37D08();

  swift_bridgeObjectRelease();
  if (a1)
  {
LABEL_8:
    swift_beginAccess();
    *(void *)(a5 + 16) = a1;
    swift_retain();
    swift_release();
  }
LABEL_13:
  dispatch_group_leave(a4);
}

void sub_1BBC05B9C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_1BBC37B78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, a1, v7);
  sub_1BBC01EFC(a2, (uint64_t)v42, &qword_1EB9F6620);
  uint64_t v8 = v42[0];
  if (v42[0])
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    sub_1BBC06128((uint64_t)v42, (uint64_t)v38);
    uint64_t v9 = swift_allocObject();
    long long v10 = v38[1];
    *(_OWORD *)(v9 + 16) = v38[0];
    *(_OWORD *)(v9 + 32) = v10;
    *(_OWORD *)(v9 + 48) = v38[2];
    *(void *)(v9 + 64) = v39;
    *(void *)(v9 + 72) = &v40;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_1BBBF9CFC;
    *(void *)(v11 + 24) = v9;
    v37[4] = sub_1BBBF9CA4;
    v37[5] = v11;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 1107296256;
    v37[2] = sub_1BBBF9C7C;
    v37[3] = &block_descriptor;
    id v12 = _Block_copy(v37);
    swift_retain();
    swift_release();
    dispatch_sync(v8, v12);
    _Block_release(v12);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
      goto LABEL_14;
    }
    uint64_t v14 = v40;
    uint64_t v15 = v41;
    swift_release();
    sub_1BBBFDF70((uint64_t)v42);
    if (v15)
    {
      MEMORY[0x1C1862EA0](v14, v15);
      sub_1BBC38028();
      if (qword_1E9F858C0 == -1)
      {
LABEL_5:
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = xmmword_1BBC38DE0;
        sub_1BBC01FC4((unint64_t *)&qword_1EB9F6550, MEMORY[0x1E4F26ED8]);
        uint64_t v17 = sub_1BBC38368();
        uint64_t v19 = v18;
        *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v16 + 64) = sub_1BBC04664();
        *(void *)(v16 + 32) = v17;
        *(void *)(v16 + 40) = v19;
        sub_1BBC37D08();
        swift_bridgeObjectRelease();
        return;
      }
LABEL_14:
      swift_once();
      goto LABEL_5;
    }
  }
  else
  {
    sub_1BBBFDF14((uint64_t)v42, &qword_1EB9F6620);
  }
  uint64_t v20 = *(void *)(v3 + 32);
  if (!v20) {
    goto LABEL_11;
  }
  uint64_t v21 = v20 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1BBC01EFC(v21, (uint64_t)v42, &qword_1EB9F6628);
  uint64_t v22 = v43;
  if (!v43)
  {
    sub_1BBBFDF14((uint64_t)v42, &qword_1EB9F6628);
LABEL_11:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_1BBC38DE0;
    v42[0] = sub_1BBC37B18();
    v42[1] = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F63A0);
    uint64_t v34 = sub_1BBC37EE8();
    uint64_t v36 = v35;
    *(void *)(v32 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v32 + 64) = sub_1BBC04664();
    *(void *)(v32 + 32) = v34;
    *(void *)(v32 + 40) = v36;
    sub_1BBC060E8();
    uint64_t v31 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    goto LABEL_12;
  }
  uint64_t v23 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 72))(v22, v23);
  uint64_t v26 = v25;
  sub_1BBBFDF14((uint64_t)v42, &qword_1EB9F6628);
  MEMORY[0x1C1862EA0](v24, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1BBC38DE0;
  sub_1BBC01FC4((unint64_t *)&qword_1EB9F6550, MEMORY[0x1E4F26ED8]);
  uint64_t v28 = sub_1BBC38368();
  uint64_t v30 = v29;
  *(void *)(v27 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v27 + 64) = sub_1BBC04664();
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v30;
  sub_1BBC060E8();
  uint64_t v31 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
LABEL_12:
  swift_bridgeObjectRelease();
}

unint64_t sub_1BBC060E8()
{
  unint64_t result = qword_1EB9F6DC0;
  if (!qword_1EB9F6DC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9F6DC0);
  }
  return result;
}

uint64_t sub_1BBC06128(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t initializeWithCopy for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  id v10 = v4;
  v9(v5, v6, v8);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t sub_1BBC06224()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  swift_beginAccess();
  BOOL v6 = v4 == a2[2] && v5 == a2[3];
  if (v6 || (char v7 = 0, (sub_1BBC38448() & 1) != 0))
  {
    if ((swift_beginAccess(), v8 = a1[4], uint64_t v9 = a1[5], swift_beginAccess(), v8 == a2[4]) && v9 == a2[5]
      || (char v7 = 0, (sub_1BBC38448() & 1) != 0))
    {
      if ((swift_beginAccess(), uint64_t v10 = a1[6], v11 = a1[7], swift_beginAccess(), v10 == a2[6]) && v11 == a2[7]
        || (char v7 = 0, (sub_1BBC38448() & 1) != 0))
      {
        swift_beginAccess();
        swift_beginAccess();
        unint64_t v12 = FMNAccountType.rawValue.getter();
        uint64_t v14 = v13;
        if (v12 == FMNAccountType.rawValue.getter() && v14 == v15) {
          char v7 = 1;
        }
        else {
          char v7 = sub_1BBC38448();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  return v7 & 1;
}

unint64_t FMNAccountType.rawValue.getter()
{
  unint64_t result = 6712678;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x707041666D66;
      break;
    case 2:
      unint64_t result = 1885957478;
      break;
    case 3:
      unint64_t result = 0x6972695370696D66;
      break;
    case 4:
      unint64_t result = 0x7075746573;
      break;
    case 5:
      unint64_t result = 0x6150686372616573;
      break;
    case 6:
      unint64_t result = 0x4C676E6972696170;
      break;
    case 7:
      unint64_t result = 0x726F737365636361;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x7373656363413277;
      break;
    case 0xA:
    case 0xC:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xB:
      unint64_t result = 0x6F4C657275636573;
      break;
    case 0xD:
      unint64_t result = 0x726168536D657469;
      break;
    case 0xE:
      unint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC065F0@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1BBC38058();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = sub_1BBC38068();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCC68], v6);
  sub_1BBC37D48();
  v11[1] = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6D90, (uint64_t *)&unk_1EB9F6D80);
  sub_1BBC38128();
  *a2 = sub_1BBC38098();
  sub_1BBBFAC58(a1, (uint64_t)(a2 + 1));
  sub_1BBC37A98();
  swift_allocObject();
  uint64_t result = sub_1BBC37A88();
  a2[6] = result;
  return result;
}

uint64_t sub_1BBC06870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37D28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBC37D58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *v3;
  sub_1BBC06128((uint64_t)v3, (uint64_t)v20);
  uint64_t v14 = swift_allocObject();
  long long v15 = v20[1];
  *(_OWORD *)(v14 + 16) = v20[0];
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = v20[2];
  *(void *)(v14 + 64) = v21;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = a3;
  uint64_t v16 = _Block_copy(aBlock);
  sub_1BBC37D48();
  v18[2] = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

Swift::Void __swiftcall FMNRedirectHostStore.clearRedirectedHostKeychainItemsIfNeeded()()
{
}

uint64_t sub_1BBC06B4C(void *a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v28 = a1;
  uint64_t v5 = sub_1BBC37D28();
  uint64_t v31 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1BBC37D38();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  uint64_t v16 = (uint64_t *)(a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (*v16)
  {
    uint64_t v18 = v16[1];
    sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
    uint64_t v27 = v5;
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCB48], v11);
    _Block_copy(a3);
    sub_1BBC0700C(v17);
    uint64_t v26 = sub_1BBC380A8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v17;
    v19[3] = v18;
    uint64_t v20 = v28;
    v19[4] = v28;
    v19[5] = sub_1BBBFD8C4;
    v19[6] = v15;
    aBlock[4] = sub_1BBBFD8DC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBFAD0C;
    aBlock[3] = &block_descriptor_52;
    uint64_t v21 = _Block_copy(aBlock);
    sub_1BBC0700C(v17);
    id v22 = v20;
    swift_retain();
    sub_1BBC37D48();
    uint64_t v32 = MEMORY[0x1E4FBC860];
    sub_1BBC06FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
    uint64_t v23 = v27;
    sub_1BBC38128();
    uint64_t v24 = (void *)v26;
    MEMORY[0x1C1863400](0, v10, v7, v21);
    _Block_release(v21);

    sub_1BBBFA06C(v17);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v23);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    swift_release();
  }
  else
  {
    _Block_copy(a3);
    a3[2](a3, 1, 0);
  }
  return swift_release();
}

uint64_t sub_1BBC06FC4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBC0700C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

id sub_1BBC0701C(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v23 = a1;
  uint64_t v3 = sub_1BBC38058();
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1BBC38068();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = &v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = &v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback];
  *(void *)uint64_t v10 = 0xD00000000000001ELL;
  *((void *)v10 + 1) = 0x80000001BBC3CDD0;
  *(void *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_httpSuccessCodeMin] = 200;
  *(void *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_httpSuccessCodeMax] = 299;
  uint64_t v11 = (uint64_t)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(void *)(v11 + 32) = 0;
  *(void *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers] = MEMORY[0x1E4FBC868];
  uint64_t v21 = OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue;
  v20[1] = sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCC68], v5);
  uint64_t v12 = v2;
  sub_1BBC37D48();
  uint64_t v25 = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6D90, (uint64_t *)&unk_1EB9F6D80);
  sub_1BBC38128();
  *(void *)&v2[v21] = sub_1BBC38098();
  uint64_t v13 = &v12[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session];
  *((void *)v13 + 4) = 0;
  *(_OWORD *)uint64_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  uint64_t v14 = OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_sessionLock;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6540);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = 0;
  *(void *)&v12[v14] = v15;
  *(void *)&v12[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_urlSessionFactory] = v22;
  swift_beginAccess();
  swift_retain();
  uint64_t v16 = v23;
  sub_1BBC073DC(v23, v11);
  swift_endAccess();

  uint64_t v17 = (objc_class *)type metadata accessor for FMNHttpClient();
  v24.receiver = v12;
  v24.super_class = v17;
  id v18 = objc_msgSendSuper2(&v24, sel_init);
  sub_1BBBFDF14(v16, &qword_1EB9F6628);
  return v18;
}

uint64_t sub_1BBC073DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t FMNServerInteractionController.init(authenticationProvider:mockingPreferences:urlSessionFactory:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v28 = a4;
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v27 = sub_1BBC38068();
  uint64_t v7 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBC38058();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v12 = *a3;
  uint64_t v24 = a3[1];
  uint64_t v13 = a3[2];
  uint64_t v14 = a3[3];
  uint64_t v25 = v13;
  uint64_t v26 = v12;
  *(void *)(v4 + 32) = 0;
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  sub_1BBC37D48();
  uint64_t v31 = MEMORY[0x1E4FBC860];
  sub_1BBC077F0((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBC0772C();
  sub_1BBC38128();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCC58], v27);
  uint64_t v15 = v24;
  uint64_t v16 = v25;
  uint64_t v17 = sub_1BBC38098();
  uint64_t v18 = v26;
  uint64_t v19 = v28;
  uint64_t v20 = v29;
  *(void *)(v5 + 40) = v17;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_OWORD *)(v5 + 80) = 0u;
  uint64_t v21 = v30;
  *(void *)(v5 + 16) = v20;
  *(void *)(v5 + 24) = v21;
  *(void *)(v5 + 96) = 0;
  *(void *)(v5 + 104) = v18;
  *(void *)(v5 + 112) = v15;
  *(void *)(v5 + 120) = v16;
  *(void *)(v5 + 128) = v14;
  if (v19)
  {
    *(void *)(v5 + 136) = v19;
  }
  else
  {
    type metadata accessor for FMNURLSessionFactory();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = sub_1BBC1EE10;
    v22[3] = 0;
    v22[4] = v18;
    v22[5] = v15;
    v22[6] = v16;
    v22[7] = v14;
    *(void *)(v5 + 136) = v22;
    sub_1BBC07788(v18, v15);
  }
  return v5;
}

unint64_t sub_1BBC0772C()
{
  unint64_t result = qword_1EB9F6D90;
  if (!qword_1EB9F6D90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB9F6D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6D90);
  }
  return result;
}

uint64_t sub_1BBC07788(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for FMNURLSessionFactory()
{
  return self;
}

uint64_t sub_1BBC077F0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBC078E8(uint64_t a1)
{
  return sub_1BBC00E64(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t dispatch thunk of FMNServerInteractionController.sendRequest(endpoint:content:source:responseHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t getEnumTagSinglePayload for FMNMockingPreferences(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

unsigned char *sub_1BBC07980(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMNAccountType()
{
  return &type metadata for FMNAccountType;
}

ValueMetadata *type metadata accessor for FMNMockingPreferences()
{
  return &type metadata for FMNMockingPreferences;
}

uint64_t type metadata accessor for FMNHTTPRequest()
{
  uint64_t result = qword_1EB9F63B8;
  if (!qword_1EB9F63B8) {
    return swift_getSingletonMetadata();
  }
  return result;
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1BBC07A60(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_1BBC07ABC()
{
  sub_1BBC060E8();
  uint64_t result = sub_1BBC380C8();
  qword_1EB9F70D8 = result;
  return result;
}

void sub_1BBC07B10()
{
  sub_1BBBF8E40(319, &qword_1EB9F69B0, (void (*)(uint64_t))type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1BBC07BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t type metadata accessor for FMNHTTPClientStatusCodeHandler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t storeEnumTagSinglePayload for FMNMockingPreferences(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNRedirectHostStore()
{
  return &type metadata for FMNRedirectHostStore;
}

ValueMetadata *type metadata accessor for AnyDecodableKeys()
{
  return &type metadata for AnyDecodableKeys;
}

unint64_t sub_1BBC07C68()
{
  unint64_t result = qword_1EB9F6360;
  if (!qword_1EB9F6360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6360);
  }
  return result;
}

unint64_t sub_1BBC07CBC()
{
  unint64_t result = qword_1EB9F6358;
  if (!qword_1EB9F6358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6358);
  }
  return result;
}

uint64_t AnyDecodableKeys.stringValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnyDecodableKeys.stringValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AnyDecodableKeys.stringValue.modify())()
{
  return nullsub_1;
}

FMNetworking::AnyDecodableKeys __swiftcall AnyDecodableKeys.init(stringValue:)(Swift::String stringValue)
{
  *(Swift::String *)uint64_t v1 = stringValue;
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 1;
  result.stringValue = stringValue;
  return result;
}

uint64_t AnyDecodableKeys.intValue.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t AnyDecodableKeys.intValue.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*AnyDecodableKeys.intValue.modify())()
{
  return nullsub_1;
}

FMNetworking::AnyDecodableKeys_optional __swiftcall AnyDecodableKeys.init(intValue:)(Swift::Int intValue)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_1BBC38368();
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = v5;
  *(void *)(v3 + 16) = intValue;
  *(unsigned char *)(v3 + 24) = 0;
  result.value.intValue.value = v6;
  result.value.stringValue._object = v5;
  result.value.stringValue._countAndFlagsBits = v4;
  result.value.intValue.is_nil = v7;
  return result;
}

uint64_t sub_1BBC07E48()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1BBC07E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BBC38368();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_1BBC07EB0(uint64_t a1)
{
  unint64_t v2 = sub_1BBC038C4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC07EEC(uint64_t a1)
{
  unint64_t v2 = sub_1BBC038C4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t KeyedDecodingContainer.decode(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  long long v64 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v54 - v7;
  uint64_t v9 = sub_1BBC382F8();
  if (!MEMORY[0x1C1863360](v9, v3))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  v54[0] = v5;
  uint64_t v10 = 0;
  uint64_t v62 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v63 = (void (**)(char *, long long *, uint64_t))(v4 + 16);
  uint64_t v11 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v57 = a1;
  uint64_t v58 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v55 = v8;
  uint64_t v56 = v1;
  uint64_t v59 = v3;
  uint64_t v60 = v4;
  uint64_t v61 = v9;
  while (1)
  {
    char v14 = sub_1BBC37FC8();
    sub_1BBC37FA8();
    if ((v14 & 1) == 0) {
      break;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v8, v9+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v10, v3);
    uint64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_37;
    }
LABEL_7:
    uint64_t v65 = v15;
    (*v62)(v64, v8, v3);
    uint64_t v16 = v66;
    char v17 = sub_1BBC382B8();
    if (v16)
    {

      uint64_t v31 = sub_1BBC382A8();
      uint64_t v33 = v32;
      uint64_t v66 = 0;
      uint64_t v34 = sub_1BBC385D8();
      uint64_t v36 = v35;
      uint64_t v70 = MEMORY[0x1E4FBB1A0];
      *(void *)&long long v69 = v31;
      *((void *)&v69 + 1) = v33;
      sub_1BBC038B4(&v69, v68);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v67 = v11;
      unint64_t v38 = sub_1BBC03458(v34, v36);
      unint64_t v24 = v38;
      uint64_t v40 = v11[2];
      BOOL v41 = (v39 & 1) == 0;
      uint64_t v42 = v40 + v41;
      if (__OFADD__(v40, v41)) {
        goto LABEL_39;
      }
      char v43 = v39;
      if (v11[3] >= v42)
      {
        uint64_t v8 = v55;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_1BBC0AEF4();
        }
      }
      else
      {
        sub_1BBC035B4(v42, isUniquelyReferenced_nonNull_native);
        unint64_t v44 = sub_1BBC03458(v34, v36);
        uint64_t v8 = v55;
        if ((v43 & 1) != (v45 & 1)) {
          goto LABEL_43;
        }
        unint64_t v24 = v44;
      }
      uint64_t v9 = v61;
      uint64_t v11 = v67;
      if ((v43 & 1) == 0)
      {
        v67[(v24 >> 6) + 8] |= 1 << v24;
        unint64_t v50 = (uint64_t *)(v11[6] + 16 * v24);
        uint64_t *v50 = v34;
        v50[1] = v36;
        sub_1BBC038B4(v68, (_OWORD *)(v11[7] + 32 * v24));
        uint64_t v51 = v11[2];
        BOOL v48 = __OFADD__(v51, 1);
        uint64_t v49 = v51 + 1;
        if (v48) {
          goto LABEL_41;
        }
LABEL_29:
        void v11[2] = v49;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    else
    {
      char v18 = v17;
      uint64_t v66 = 0;
      uint64_t v19 = sub_1BBC385D8();
      uint64_t v21 = v20;
      uint64_t v70 = MEMORY[0x1E4FBB390];
      LOBYTE(v69) = v18 & 1;
      sub_1BBC038B4(&v69, v68);
      char v22 = swift_isUniquelyReferenced_nonNull_native();
      id v67 = v11;
      unint64_t v24 = sub_1BBC03458(v19, v21);
      uint64_t v25 = v11[2];
      BOOL v26 = (v23 & 1) == 0;
      uint64_t v27 = v25 + v26;
      if (__OFADD__(v25, v26)) {
        goto LABEL_38;
      }
      char v28 = v23;
      if (v11[3] >= v27)
      {
        if ((v22 & 1) == 0) {
          sub_1BBC0AEF4();
        }
      }
      else
      {
        sub_1BBC035B4(v27, v22);
        unint64_t v29 = sub_1BBC03458(v19, v21);
        if ((v28 & 1) != (v30 & 1)) {
          goto LABEL_43;
        }
        unint64_t v24 = v29;
      }
      uint64_t v9 = v61;
      uint64_t v11 = v67;
      if ((v28 & 1) == 0)
      {
        v67[(v24 >> 6) + 8] |= 1 << v24;
        uint64_t v46 = (uint64_t *)(v11[6] + 16 * v24);
        uint64_t *v46 = v19;
        v46[1] = v21;
        sub_1BBC038B4(v68, (_OWORD *)(v11[7] + 32 * v24));
        uint64_t v47 = v11[2];
        BOOL v48 = __OFADD__(v47, 1);
        uint64_t v49 = v47 + 1;
        if (v48) {
          goto LABEL_40;
        }
        goto LABEL_29;
      }
    }
    uint64_t v12 = (_OWORD *)(v11[7] + 32 * v24);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
    sub_1BBC038B4(v68, v12);
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v59;
    (*v58)(v64, v59);
    uint64_t v4 = v60;
    uint64_t v13 = v65;
    ++v10;
    if (v13 == MEMORY[0x1C1863360](v9, v3))
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v11;
    }
  }
  uint64_t v52 = sub_1BBC381E8();
  if (v54[0] != 8) {
    goto LABEL_42;
  }
  *(void *)&long long v69 = v52;
  (*v63)(v8, &v69, v3);
  swift_unknownObjectRelease();
  uint64_t v15 = v10 + 1;
  if (!__OFADD__(v10, 1)) {
    goto LABEL_7;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  __break(1u);
LABEL_41:
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_1BBC38508();
  __break(1u);
  return result;
}

char *KeyedDecodingContainer.decode(_:forKey:)()
{
  sub_1BBC38278();
  if (!v1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v3, v4);
    uint64_t v0 = UnkeyedDecodingContainer.decode(_:)();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
  }
  return v0;
}

char *UnkeyedDecodingContainer.decode(_:)()
{
  uint64_t v1 = v0;
  char v2 = sub_1BBC383B8();
  uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
  if ((v2 & 1) == 0)
  {
    uint64_t v5 = MEMORY[0x1E4FBB390];
    uint64_t v6 = MEMORY[0x1E4FBB3D0];
    do
    {
      char v7 = sub_1BBC38398();
      if (v1)
      {

        sub_1BBC383A8();
        uint64_t v1 = 0;
        uint64_t v12 = v6;
        *(void *)&long long v11 = v8;
      }
      else
      {
        uint64_t v12 = v5;
        LOBYTE(v11) = v7 & 1;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_1BBC0B750(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v10 = *((void *)v3 + 2);
      unint64_t v9 = *((void *)v3 + 3);
      if (v10 >= v9 >> 1) {
        uint64_t v3 = sub_1BBC0B750((char *)(v9 > 1), v10 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v10 + 1;
      sub_1BBC038B4(&v11, &v3[32 * v10 + 32]);
    }
    while ((sub_1BBC383B8() & 1) == 0);
  }
  return v3;
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6380);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC038C4();
  uint64_t v6 = sub_1BBC38378();
  if (!v1)
  {
    uint64_t v0 = sub_1BBC029B4(v6);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v0;
}

uint64_t KeyedEncodingContainerProtocol<>.encode(_:)(uint64_t a1)
{
  return sub_1BBC0BDF8(a1, (void (*)(void, void, _OWORD *))sub_1BBC0BDD8);
}

uint64_t sub_1BBC08CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D8);
  uint64_t v33 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v32 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v30 - v12;
  sub_1BBBFFF90(a3, (uint64_t)v43);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    LOBYTE(v37) = 1;
    sub_1BBC0C178();
    sub_1BBC384A8();
    goto LABEL_5;
  }
  uint64_t v31 = v9;
  uint64_t v30 = v4;
  if (swift_dynamicCast())
  {
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    LOBYTE(v37) = 1;
    sub_1BBC0C178();
    sub_1BBC384C8();
    goto LABEL_5;
  }
  uint64_t v15 = a1;
  if (swift_dynamicCast())
  {
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    LOBYTE(v37) = 1;
    sub_1BBC0C178();
    sub_1BBC38498();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    LOBYTE(v37) = 1;
    sub_1BBC0C178();
    sub_1BBC384B8();
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6370);
  if (swift_dynamicCast())
  {
    uint64_t v16 = v38;
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    LOBYTE(v37) = 1;
    sub_1BBC0C178();
    sub_1BBC038C4();
    uint64_t v17 = v31;
    uint64_t v18 = sub_1BBC38478();
    MEMORY[0x1F4188790](v18);
    *(&v30 - 2) = (uint64_t)v13;
    sub_1BBC0BDF8(v16, (void (*)(void, void, _OWORD *))sub_1BBC0C1D4);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v17);
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D0);
  if (swift_dynamicCast())
  {
    v19._rawValue = v42;
    uint64_t v38 = a1;
    uint64_t v39 = a2;
    uint64_t v40 = 0;
    char v41 = 1;
    sub_1BBC0C178();
    sub_1BBC38468();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v34, v37);
    UnkeyedEncodingContainer.encode(_:)(v19);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v34);
    goto LABEL_15;
  }
  sub_1BBBFFF90((uint64_t)v43, (uint64_t)&v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68A8);
  swift_dynamicCast();
  if (v37)
  {
    sub_1BBBFDF14((uint64_t)&v34, &qword_1EB9F68A8);
    uint64_t v20 = sub_1BBC38208();
    swift_allocError();
    uint64_t v22 = v21;
    uint64_t v30 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85920) + 48);
    sub_1BBBFFF90(a3, v22);
    uint64_t v23 = v33;
    unint64_t v24 = v32;
    uint64_t v25 = a4;
    uint64_t v26 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v32, v25, v31);
    sub_1BBC0C178();
    uint64_t v27 = sub_1BBC38488();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85930);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BBC38DE0;
    *(void *)(inited + 56) = &type metadata for AnyDecodableKeys;
    *(void *)(inited + 64) = sub_1BBC038C4();
    uint64_t v29 = swift_allocObject();
    *(void *)(inited + 32) = v29;
    *(void *)(v29 + 16) = v15;
    *(void *)(v29 + 24) = a2;
    *(void *)(v29 + 32) = 0;
    *(unsigned char *)(v29 + 40) = 1;
    uint64_t v34 = v27;
    sub_1BBC0BC68((void *)inited);
    sub_1BBC381F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x1E4FBBAA0], v20);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
  }
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v40 = 0;
  char v41 = 1;
  sub_1BBC0C178();
  sub_1BBC384D8();
LABEL_5:
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
}

uint64_t sub_1BBC09398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v30 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBFFF90(v14, (uint64_t)v37);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = a2;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    sub_1BBC384A8();
    goto LABEL_14;
  }
  uint64_t v28 = a2;
  uint64_t v27 = v6;
  uint64_t v29 = a6;
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = v28;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    sub_1BBC384C8();
    goto LABEL_14;
  }
  uint64_t v15 = a1;
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = v28;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    sub_1BBC38498();
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v16 = a5;
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = v28;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    sub_1BBC384B8();
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6370);
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = v28;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    KeyedEncodingContainerProtocol.encode(_:forKey:)(v31[0]);
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D0);
  if (swift_dynamicCast())
  {
    uint64_t v33 = a1;
    uint64_t v34 = v28;
    uint64_t v35 = 0;
    LOBYTE(v36) = 1;
    KeyedEncodingContainerProtocol.encode(_:forKey:)(v31[0]);
    goto LABEL_13;
  }
  sub_1BBBFFF90((uint64_t)v37, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68A8);
  swift_dynamicCast();
  if (v36)
  {
    sub_1BBBFDF14((uint64_t)&v33, &qword_1EB9F68A8);
    uint64_t v18 = sub_1BBC38208();
    swift_allocError();
    uint64_t v20 = v19;
    uint64_t v27 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85920) + 48);
    sub_1BBBFFF90(a3, v20);
    uint64_t v21 = v38;
    uint64_t v22 = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v30, a4, v16);
    uint64_t v23 = sub_1BBC38488();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85930);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BBC38DE0;
    *(void *)(inited + 56) = &type metadata for AnyDecodableKeys;
    *(void *)(inited + 64) = sub_1BBC038C4();
    uint64_t v25 = swift_allocObject();
    *(void *)(inited + 32) = v25;
    uint64_t v26 = v28;
    *(void *)(v25 + 16) = v15;
    *(void *)(v25 + 24) = v26;
    *(void *)(v25 + 32) = 0;
    *(unsigned char *)(v25 + 40) = 1;
    uint64_t v33 = v23;
    sub_1BBC0BC68((void *)inited);
    sub_1BBC381F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x1E4FBBAA0], v18);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v37);
  }
  v31[0] = a1;
  v31[1] = v28;
  _OWORD v31[2] = 0;
  char v32 = 1;
  sub_1BBC384D8();
LABEL_14:
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v37);
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_1BBC038C4();
    uint64_t v7 = sub_1BBC38478();
    MEMORY[0x1F4188790](v7);
    v8[-2] = v6;
    sub_1BBC0BDF8(a1, (void (*)(void, void, _OWORD *))sub_1BBC0C00C);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)(uint64_t result)
{
  if (result)
  {
    v1._rawValue = (void *)result;
    sub_1BBC38468();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
    UnkeyedEncodingContainer.encode(_:)(v1);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> UnkeyedEncodingContainer.encode(_:)(Swift::OpaquePointer a1)
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  uint64_t v6 = *((void *)a1._rawValue + 2);
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v14 = v7;
  if (v6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7 + 32;
    while (1)
    {
      sub_1BBBFFF90(v9, (uint64_t)v10 + 8);
      *(void *)&v12[0] = v8;
      sub_1BBC038B4((_OWORD *)((char *)v10 + 8), (_OWORD *)((char *)v12 + 8));
      v10[0] = v12[0];
      v10[1] = v12[1];
      uint64_t v11 = v13;
      sub_1BBC09C50(*(void **)&v12[0], (uint64_t)v10 + 8, v4, v5);
      if (v3) {
        break;
      }
      ++v8;
      sub_1BBBFDF14((uint64_t)v10, &qword_1E9F858E0);
      v9 += 32;
      if (v6 == v8) {
        goto LABEL_7;
      }
    }
    sub_1BBBFDF14((uint64_t)v10, &qword_1E9F858E0);
  }
LABEL_7:
  swift_bridgeObjectRelease();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned char *v5;
  unsigned char v6[16];
  unsigned char *v7;

  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v6[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BBC038C4();
  sub_1BBC383C8();
  uint64_t v7 = v5;
  sub_1BBC0BDF8((uint64_t)a1._rawValue, (void (*)(void, void, _OWORD *))sub_1BBC0C1D4);
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1BBC09C50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v8 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBFFF90(a2, (uint64_t)v33);
  if (swift_dynamicCast())
  {
    sub_1BBC383F8();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
  }
  uint64_t v29 = a4;
  uint64_t v30 = v4;
  uint64_t v26 = a2;
  uint64_t v27 = v10;
  uint64_t v11 = v34;
  uint64_t v28 = v8;
  if (swift_dynamicCast())
  {
    sub_1BBC38418();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
  }
  if (swift_dynamicCast())
  {
    sub_1BBC383E8();
LABEL_8:
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
  }
  if (swift_dynamicCast())
  {
    sub_1BBC38408();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6370);
  uint64_t v13 = a3;
  if (swift_dynamicCast())
  {
    UnkeyedEncodingContainer.encode(_:)(v32[0]);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858D0);
  if (swift_dynamicCast())
  {
    UnkeyedEncodingContainer.encode(_:)(v32[0]);
    goto LABEL_8;
  }
  sub_1BBBFFF90((uint64_t)v33, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68A8);
  swift_dynamicCast();
  uint64_t v14 = v29;
  if (v32[3]._rawValue)
  {
    sub_1BBBFDF14((uint64_t)v32, &qword_1EB9F68A8);
    v32[0]._rawValue = v11;
    uint64_t v15 = sub_1BBC38368();
    uint64_t v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85918);
    uint64_t inited = swift_initStackObject();
    uint64_t v30 = inited;
    *(_OWORD *)(inited + 16) = xmmword_1BBC38DE0;
    *(void *)(inited + 32) = v15;
    *(void *)(inited + 40) = v17;
    *(void *)(inited + 48) = v11;
    *(unsigned char *)(inited + 56) = 0;
    uint64_t v19 = sub_1BBC38208();
    swift_allocError();
    uint64_t v21 = v20;
    uint64_t v34 = (void *)(v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85920) + 48));
    sub_1BBBFFF90(v26, v21);
    uint64_t v22 = v28;
    uint64_t v23 = v27;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v27, v13, v14);
    unint64_t v24 = (void *)sub_1BBC383D8();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v14);
    uint64_t v25 = (void *)sub_1BBC0A250(v30);
    swift_bridgeObjectRelease();
    v32[0]._rawValue = v24;
    sub_1BBC0BC68(v25);
    sub_1BBC381F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x1E4FBBAA0], v19);
    swift_willThrow();
  }
  else
  {
    sub_1BBC38428();
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
}

uint64_t sub_1BBC0A250(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x1E4FBC860];
    sub_1BBC0BD68(0, v1, 0);
    uint64_t v2 = v16;
    uint64_t v4 = (unsigned char *)(a1 + 56);
    do
    {
      uint64_t v6 = *((void *)v4 - 3);
      uint64_t v5 = *((void *)v4 - 2);
      uint64_t v7 = *((void *)v4 - 1);
      char v8 = *v4;
      uint64_t v16 = v2;
      unint64_t v10 = *(void *)(v2 + 16);
      unint64_t v9 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
      {
        sub_1BBC0BD68((void *)(v9 > 1), v10 + 1, 1);
        uint64_t v2 = v16;
      }
      uint64_t v14 = &type metadata for AnyDecodableKeys;
      unint64_t v15 = sub_1BBC038C4();
      uint64_t v11 = swift_allocObject();
      *(void *)&long long v13 = v11;
      *(void *)(v11 + 16) = v6;
      *(void *)(v11 + 24) = v5;
      *(void *)(v11 + 32) = v7;
      *(unsigned char *)(v11 + 40) = v8;
      *(void *)(v2 + 16) = v10 + 1;
      sub_1BBBFAC58(&v13, v2 + 40 * v10 + 32);
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_1BBC0A374(uint64_t a1)
{
  sub_1BBC37C18();
  sub_1BBC0C0F8(&qword_1E9F858F8);
  uint64_t v2 = sub_1BBC37E68();

  return sub_1BBC0AD48(a1, v2);
}

uint64_t sub_1BBC0A3F8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6858);
  char v42 = a2;
  uint64_t v6 = sub_1BBC38248();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    char v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BBC38578();
    sub_1BBC37F08();
    uint64_t result = sub_1BBC38598();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BBC0A720(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1BBC37C18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v53 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858F0);
  int v52 = a2;
  uint64_t v9 = sub_1BBC38248();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v47 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  char v45 = v2;
  int64_t v46 = (unint64_t)(v11 + 63) >> 6;
  BOOL v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v54 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v49 = v6;
  uint64_t v50 = v8;
  uint64_t v57 = v5;
  uint64_t v18 = v53;
  uint64_t v51 = v10;
  while (1)
  {
    if (v14)
    {
      unint64_t v21 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v22 = v21 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v46) {
      break;
    }
    unint64_t v24 = v47;
    unint64_t v25 = v47[v23];
    ++v17;
    if (!v25)
    {
      int64_t v17 = v23 + 1;
      if (v23 + 1 >= v46) {
        goto LABEL_34;
      }
      unint64_t v25 = v47[v17];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v46)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v45;
          if ((v52 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v47[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v17 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v46) {
              goto LABEL_34;
            }
            unint64_t v25 = v47[v17];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v26;
      }
    }
LABEL_21:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v17 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v8 + 48) + v27 * v22;
    int64_t v56 = v17;
    if (v52)
    {
      (*v54)(v18, v28, v57);
      BOOL v29 = (uint64_t *)(*(void *)(v8 + 56) + 32 * v22);
      unint64_t v30 = v29[1];
      uint64_t v55 = *v29;
      uint64_t v31 = (void *)v29[2];
      char v32 = (void *)v29[3];
    }
    else
    {
      (*v48)(v18, v28, v57);
      uint64_t v33 = (uint64_t *)(*(void *)(v8 + 56) + 32 * v22);
      unint64_t v30 = v33[1];
      uint64_t v31 = (void *)v33[2];
      char v32 = (void *)v33[3];
      uint64_t v55 = *v33;
      sub_1BBC0C0E4(v55, v30);
      id v34 = v31;
      id v35 = v32;
    }
    uint64_t v10 = v51;
    sub_1BBC0C0F8(&qword_1E9F858F8);
    uint64_t result = sub_1BBC37E68();
    uint64_t v36 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v15 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v37) & ~*(void *)(v15 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v18 = v53;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      uint64_t v18 = v53;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v15 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v19 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v54)(*(void *)(v10 + 48) + v27 * v19, v18, v57);
    uint64_t v20 = (void *)(*(void *)(v10 + 56) + 32 * v19);
    int64_t v17 = v56;
    *uint64_t v20 = v55;
    v20[1] = v30;
    void v20[2] = v31;
    _OWORD v20[3] = v32;
    ++*(void *)(v10 + 16);
    uint64_t v6 = v49;
    uint64_t v8 = v50;
  }
  swift_release();
  uint64_t v3 = v45;
  unint64_t v24 = v47;
  if ((v52 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v8 + 32);
  if (v43 >= 64) {
    bzero(v24, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v43;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

_OWORD *sub_1BBC0AB88(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1BBC03458(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1BBC0AEF4();
      goto LABEL_7;
    }
    sub_1BBC035B4(v15, a4 & 1);
    unint64_t v21 = sub_1BBC03458(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1BBC38508();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    return sub_1BBC038B4(a1, v19);
  }
LABEL_13:
  sub_1BBC0ACDC(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1BBC0ACDC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1BBC038B4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_1BBC0AD48(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1BBC0C0F8(&qword_1E9F85900);
      char v15 = sub_1BBC37E78();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_1BBC0AEF4()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6378);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBC38238();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *int64_t v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1BBBFFF90(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_1BBC038B4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    int64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BBC0B0DC()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6858);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBC38238();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BBC0B298()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6860);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBC38238();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_1BBC0B444()
{
  uint64_t v41 = sub_1BBC37C18();
  uint64_t v43 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  unint64_t v40 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F858F0);
  id v35 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBC38238();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v44 = v3;
  if (!v4)
  {
    uint64_t result = (char *)swift_release();
    uint64_t v34 = v44;
    uint64_t v33 = v35;
LABEL_25:
    uint64_t *v33 = v34;
    return result;
  }
  uint64_t v5 = v3;
  uint64_t result = (char *)(v3 + 64);
  unint64_t v7 = (char *)(v2 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  uint64_t v36 = v2 + 64;
  if (v5 != v2 || result >= &v7[8 * v8])
  {
    uint64_t result = (char *)memmove(result, v7, 8 * v8);
    uint64_t v5 = v44;
  }
  int64_t v9 = 0;
  *(void *)(v5 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v42 = v2;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  uint64_t v13 = v44;
  uint64_t v39 = v43 + 16;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v43 + 32;
  uint64_t v14 = v43;
  unint64_t v15 = v40;
  uint64_t v16 = v41;
  while (1)
  {
    if (v12)
    {
      uint64_t v45 = (v12 - 1) & v12;
      int64_t v46 = v9;
      unint64_t v17 = __clz(__rbit64(v12)) | (v9 << 6);
      uint64_t v18 = v42;
      goto LABEL_9;
    }
    int64_t v29 = v9 + 1;
    uint64_t v18 = v42;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v29 >= v37) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v36 + 8 * v29);
    int64_t v31 = v9 + 1;
    if (!v30)
    {
      int64_t v31 = v9 + 2;
      if (v9 + 2 >= v37) {
        goto LABEL_23;
      }
      unint64_t v30 = *(void *)(v36 + 8 * v31);
      if (!v30) {
        break;
      }
    }
LABEL_22:
    uint64_t v45 = (v30 - 1) & v30;
    int64_t v46 = v31;
    unint64_t v17 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v14 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v18 + 48) + v19, v16);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 32 * v17;
    int64_t v22 = (uint64_t *)(v20 + 32 * v17);
    uint64_t v23 = *v22;
    unint64_t v24 = v22[1];
    int64_t v25 = (void *)v22[2];
    unint64_t v26 = (void *)v22[3];
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v13 + 48) + v19, v15, v16);
    int64_t v27 = (uint64_t *)(*(void *)(v13 + 56) + v21);
    *int64_t v27 = v23;
    v27[1] = v24;
    v27[2] = (uint64_t)v25;
    v27[3] = (uint64_t)v26;
    sub_1BBC0C0E4(v23, v24);
    id v28 = v25;
    uint64_t result = v26;
    unint64_t v12 = v45;
    int64_t v9 = v46;
  }
  uint64_t v32 = v9 + 3;
  if (v9 + 3 >= v37)
  {
LABEL_23:
    uint64_t result = (char *)swift_release();
    uint64_t v33 = v35;
    uint64_t v34 = v44;
    goto LABEL_25;
  }
  unint64_t v30 = *(void *)(v36 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v9 + 3;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v37) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v36 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_1BBC0B750(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85948);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1BBC0B858(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85930);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85928);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_1BBC0B990(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85910);
  uint64_t v10 = *(void *)(type metadata accessor for HAREntry() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for HAREntry() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_1BBC0BB64(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85908);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1BBC0BC68(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = sub_1BBC0B858(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85928);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void *sub_1BBC0BD68(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BBC15EA0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1BBC0BDD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BBC09398(a1, a2, a3, v3[4], v3[2], v3[3]);
}

uint64_t sub_1BBC0BDF8(uint64_t a1, void (*a2)(void, void, _OWORD *))
{
  unint64_t v24 = a2;
  uint64_t v18 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v19 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v6)
  {
    unint64_t v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_5:
    int64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1BBBFFF90(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v23);
    *(void *)&long long v22 = v13;
    *((void *)&v22 + 1) = v12;
    long long v20 = v22;
    v21[0] = v23[0];
    v21[1] = v23[1];
    long long v14 = v22;
    swift_bridgeObjectRetain();
    v24(v14, *((void *)&v14 + 1), v21);
    uint64_t result = sub_1BBBFDF14((uint64_t)&v20, &qword_1E9F85940);
    if (v2) {
      return swift_release();
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v8 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v8);
  if (v16)
  {
LABEL_19:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
    goto LABEL_5;
  }
  int64_t v17 = v8 + 1;
  if (v8 + 1 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 2;
  if (v8 + 2 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 3;
  if (v8 + 3 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 4;
  if (v8 + 4 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16)
  {
LABEL_18:
    int64_t v8 = v17;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v19) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v18 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1BBC0C00C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BBC08CBC(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t assignWithCopy for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

void type metadata accessor for AuthChallengeDisposition(uint64_t a1)
{
}

uint64_t sub_1BBC0C0E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1BBC02290(a1, a2);
  }
  return a1;
}

uint64_t sub_1BBC0C0F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BBC37C18();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBC0C140()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 41, 7);
}

unint64_t sub_1BBC0C178()
{
  unint64_t result = qword_1E9F85938;
  if (!qword_1E9F85938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9F858D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85938);
  }
  return result;
}

uint64_t sub_1BBC0C1D4()
{
  return sub_1BBC0C00C();
}

uint64_t FMNMockClientURLResponse.init(data:response:error:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

void destroy for FMNMockClientURLResponse(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >> 60 != 15) {
    sub_1BBC025A4(*(void *)a1, v2);
  }

  uint64_t v3 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for FMNMockClientURLResponse(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_1BBC02290(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  unint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a2[3];
  *(void *)(a1 + 16) = v6;
  id v8 = v6;
  id v9 = v7;
  *(void *)(a1 + 24) = v7;
  return a1;
}

uint64_t *assignWithCopy for FMNMockClientURLResponse(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *a2;
      sub_1BBC02290(*a2, a2[1]);
      uint64_t v7 = *a1;
      unint64_t v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_1BBC025A4(v7, v8);
      goto LABEL_8;
    }
    sub_1BBC0C398((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *a2;
  sub_1BBC02290(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  id v9 = (void *)a1[2];
  unint64_t v10 = (void *)a2[2];
  a1[2] = (uint64_t)v10;
  id v11 = v10;

  uint64_t v12 = (void *)a1[3];
  uint64_t v13 = (void *)a2[3];
  id v14 = v13;
  a1[3] = (uint64_t)v13;

  return a1;
}

uint64_t sub_1BBC0C398(uint64_t a1)
{
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

uint64_t *assignWithTake for FMNMockClientURLResponse(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_1BBC025A4(v6, v4);
      goto LABEL_6;
    }
    sub_1BBC0C398((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  unint64_t v8 = (void *)a1[3];
  a1[3] = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for FMNMockClientURLResponse(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMNMockClientURLResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNMockClientURLResponse()
{
  return &type metadata for FMNMockClientURLResponse;
}

uint64_t static HeaderKeyName.authorization.getter()
{
  return 0x7A69726F68747541;
}

uint64_t sub_1BBC0C568(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC0C5C8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BBC0C614(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0C668())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0C6BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC0C71C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BBC0C768(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0C7BC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0C810(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC0C870()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BBC0C8BC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0C910())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0C964@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 64);
  return result;
}

uint64_t sub_1BBC0C9A8(char *a1)
{
  char v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 64) = v2;
  return result;
}

uint64_t (*sub_1BBC0C9E8())()
{
  return j__swift_endAccess;
}

uint64_t static FMNAuthenticationCredential.FMNAuthenticationCredentialError.== infix(_:_:)()
{
  return 1;
}

uint64_t FMNAuthenticationCredential.FMNAuthenticationCredentialError.hash(into:)()
{
  return sub_1BBC38588();
}

uint64_t FMNAuthenticationCredential.FMNAuthenticationCredentialError.hashValue.getter()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC0CAB4()
{
  return 1;
}

uint64_t sub_1BBC0CABC()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC0CB00()
{
  return sub_1BBC38588();
}

uint64_t sub_1BBC0CB28()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC0CB78(unsigned __int8 *a1, char *a2)
{
  return sub_1BBC0CD78(*a1, *a2);
}

uint64_t sub_1BBC0CB84(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000001BBC3B470;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v6 = "x-apple-request-uuid";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v6 = "x-responding-instance";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000013;
      uint64_t v6 = "x-apple-server-time";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001BBC3B470;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000014;
      unint64_t v8 = "x-apple-request-uuid";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000015;
      unint64_t v8 = "x-responding-instance";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000013;
      unint64_t v8 = "x-apple-server-time";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1BBC38448();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1BBC0CCE0()
{
  unint64_t v0 = FMNAccountType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == FMNAccountType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BBC38448();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BBC0CD78(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE90000000000006ELL;
  uint64_t v3 = 0x656B6F5468747561;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656B6F5468747561;
  unint64_t v6 = 0xE90000000000006ELL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x64496E6F73726570;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x656D614E74736F68;
      break;
    case 3:
      uint64_t v5 = 0x54746E756F636361;
      unint64_t v6 = 0xEB00000000657079;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x64496E6F73726570) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x656D614E74736F68;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xEB00000000657079;
      if (v5 == 0x54746E756F636361) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1BBC38448();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1BBC0CF20(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000016;
  }
  else {
    unint64_t v3 = 0xD000000000000017;
  }
  if (v2) {
    unint64_t v4 = 0x80000001BBC3B410;
  }
  else {
    unint64_t v4 = 0x80000001BBC3B430;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000016;
  }
  else {
    unint64_t v5 = 0xD000000000000017;
  }
  if (a2) {
    unint64_t v6 = 0x80000001BBC3B430;
  }
  else {
    unint64_t v6 = 0x80000001BBC3B410;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1BBC38448();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1BBC0CFCC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 5522759;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 5522759;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1414745936;
      break;
    case 2:
      uint64_t v5 = 5526864;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x4554454C4544;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1414745936) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 5526864;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x4554454C4544) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1BBC38448();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1BBC0D11C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1954047348;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1954047348;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x65707954656D696DLL;
      break;
    case 2:
      uint64_t v5 = 1702521203;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x746E656D6D6F63;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x676E69646F636E65;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x65707954656D696DLL) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 1702521203) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x746E656D6D6F63;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x676E69646F636E65) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1BBC38448();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1BBC0D2C0()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC0D3A8()
{
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC0D478()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC0D55C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BBC0E354();
  *a1 = result;
  return result;
}

void sub_1BBC0D58C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE90000000000006ELL;
  uint64_t v3 = 0x656B6F5468747561;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x64496E6F73726570;
      goto LABEL_3;
    case 2:
      *a1 = 0x656D614E74736F68;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x54746E756F636361;
      a1[1] = 0xEB00000000657079;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1BBC0D634()
{
  uint64_t result = 0x656B6F5468747561;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x64496E6F73726570;
      break;
    case 2:
      uint64_t result = 0x656D614E74736F68;
      break;
    case 3:
      uint64_t result = 0x54746E756F636361;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC0D6D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BBC0E354();
  *a1 = result;
  return result;
}

uint64_t sub_1BBC0D6F8()
{
  return 0;
}

void sub_1BBC0D704(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1BBC0D710(uint64_t a1)
{
  unint64_t v2 = sub_1BBC0DC80();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC0D74C(uint64_t a1)
{
  unint64_t v2 = sub_1BBC0DC80();

  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1BBC0D788(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6378);
  uint64_t v2 = sub_1BBC38258();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1BBC0EBC8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1BBC03458(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1BBC038B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t FMNAuthenticationCredential.__allocating_init(accountType:authToken:personId:hostName:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = swift_allocObject();
  char v15 = *a1;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = a4;
  *(void *)(result + 40) = a5;
  *(void *)(result + 48) = a6;
  *(void *)(result + 56) = a7;
  *(unsigned char *)(result + 64) = v15;
  return result;
}

uint64_t FMNAuthenticationCredential.init(accountType:authToken:personId:hostName:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v8 = *a1;
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  *(void *)(v7 + 32) = a4;
  *(void *)(v7 + 40) = a5;
  *(void *)(v7 + 48) = a6;
  *(void *)(v7 + 56) = a7;
  *(unsigned char *)(v7 + 64) = v8;
  return v7;
}

uint64_t FMNAuthenticationCredential.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  FMNAuthenticationCredential.init(from:)(a1);
  return v2;
}

uint64_t FMNAuthenticationCredential.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85950);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC0DC80();
  sub_1BBC385B8();
  if (!v2)
  {
    char v27 = 0;
    uint64_t v9 = sub_1BBC382A8();
    uint64_t v11 = v10;
    char v26 = 1;
    uint64_t v21 = sub_1BBC382A8();
    uint64_t v22 = v12;
    char v25 = 2;
    uint64_t v19 = sub_1BBC382A8();
    uint64_t v20 = v13;
    char v24 = 3;
    v14._countAndFlagsBits = sub_1BBC382A8();
    FMNAccountType.init(rawValue:)(v14);
    char v16 = v23;
    if (v23 != 15)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      *(void *)(v3 + 16) = v9;
      *(void *)(v3 + 24) = v11;
      uint64_t v17 = v22;
      *(void *)(v3 + 32) = v21;
      *(void *)(v3 + 40) = v17;
      uint64_t v18 = v20;
      *(void *)(v3 + 48) = v19;
      *(void *)(v3 + 56) = v18;
      *(unsigned char *)(v3 + 64) = v16;
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BBC0DCD4();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  type metadata accessor for FMNAuthenticationCredential();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return v3;
}

unint64_t sub_1BBC0DC80()
{
  unint64_t result = qword_1E9F85958;
  if (!qword_1E9F85958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85958);
  }
  return result;
}

unint64_t sub_1BBC0DCD4()
{
  unint64_t result = qword_1E9F85960;
  if (!qword_1E9F85960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85960);
  }
  return result;
}

uint64_t sub_1BBC0DD28(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85968);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC0DC80();
  sub_1BBC385C8();
  swift_beginAccess();
  char v14 = 0;
  swift_bridgeObjectRetain();
  sub_1BBC38328();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v13 = 1;
    swift_bridgeObjectRetain();
    sub_1BBC38328();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v12 = 2;
    swift_bridgeObjectRetain();
    sub_1BBC38328();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v11 = *(unsigned char *)(v3 + 64);
    FMNAccountType.rawValue.getter();
    char v11 = 3;
    sub_1BBC38328();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t FMNAuthenticationCredential.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FMNAuthenticationCredential.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 65, 7);
}

uint64_t sub_1BBC0E020()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BBC0E070(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0E0C8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0E120(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0E178())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0E1D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v3 + 64);
  return result;
}

uint64_t sub_1BBC0E218(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC0E270())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC0E2C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for FMNAuthenticationCredential();
  uint64_t v5 = swift_allocObject();
  uint64_t result = FMNAuthenticationCredential.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_1BBC0E320(void *a1)
{
  return sub_1BBC0DD28(a1);
}

uint64_t sub_1BBC0E348(void **a1, void **a2)
{
  return _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1BBC0E354()
{
  unint64_t v0 = sub_1BBC38268();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_1BBC0E3A4()
{
  unint64_t result = qword_1E9F85970;
  if (!qword_1E9F85970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85970);
  }
  return result;
}

uint64_t sub_1BBC0E3F8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBC0E448@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBC0E498@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBC0E4E8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 64);
  return result;
}

uint64_t sub_1BBC0E530(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 64) = v2;
  return result;
}

ValueMetadata *type metadata accessor for HeaderKeyName()
{
  return &type metadata for HeaderKeyName;
}

uint64_t method lookup function for FMNAuthenticationCredential(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNAuthenticationCredential);
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authHeaders.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.__allocating_init(accountType:authToken:personId:hostName:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationCredential.FMNAuthenticationCredentialError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FMNAuthenticationCredential.FMNAuthenticationCredentialError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BBC0E8D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC0E900()
{
  return 0;
}

ValueMetadata *type metadata accessor for FMNAuthenticationCredential.FMNAuthenticationCredentialError()
{
  return &type metadata for FMNAuthenticationCredential.FMNAuthenticationCredentialError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationCredential.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMNAuthenticationCredential.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1BBC0EA80);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_1BBC0EAA8(unsigned __int8 *a1)
{
  return *a1;
}

ValueMetadata *type metadata accessor for FMNAuthenticationCredential.CodingKeys()
{
  return &type metadata for FMNAuthenticationCredential.CodingKeys;
}

unint64_t sub_1BBC0EAC4()
{
  unint64_t result = qword_1E9F85978;
  if (!qword_1E9F85978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85978);
  }
  return result;
}

unint64_t sub_1BBC0EB1C()
{
  unint64_t result = qword_1E9F85980;
  if (!qword_1E9F85980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85980);
  }
  return result;
}

unint64_t sub_1BBC0EB74()
{
  unint64_t result = qword_1E9F85988;
  if (!qword_1E9F85988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85988);
  }
  return result;
}

uint64_t sub_1BBC0EBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC0EC34(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v36 = a3;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v32);
  uint64_t v33 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1BBC37B78();
  uint64_t v35 = *(void *)(v37 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v37);
  char v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v34 = (uint64_t)&v31 - v15;
  sub_1BBBFA360(a1, (uint64_t)v48);
  sub_1BBBFA360(a2, (uint64_t)v49);
  sub_1BBBFA360((uint64_t)v48, (uint64_t)v42);
  sub_1BBBFA360((uint64_t)v49, (uint64_t)v43);
  sub_1BBBFAC58(v42, (uint64_t)v45);
  sub_1BBBFAC58(v43, (uint64_t)v44);
  char v16 = sub_1BBBFE790(v45);
  sub_1BBBFE298(v16, (uint64_t)v41);
  uint64_t v39 = v6;
  unint64_t v40 = v16;
  uint64_t v38 = v16;
  type metadata accessor for FMNHttpClient();
  sub_1BBC38078();
  uint64_t v17 = *(void **)&v42[0];
  sub_1BBBFA360((uint64_t)v48, (uint64_t)v42);
  sub_1BBBFA360((uint64_t)v49, (uint64_t)v43);
  uint64_t v18 = sub_1BBC0F098((uint64_t)v17, (uint64_t)v41, (uint64_t)v42, a5, v36, a4);
  uint64_t v20 = v19;
  sub_1BBBFDF14((uint64_t)v42, &qword_1E9F85998);
  uint64_t v21 = v46;
  uint64_t v22 = v47;
  __swift_project_boxed_opaque_existential_1(v45, v46);
  char v23 = *(void (**)(uint64_t, uint64_t))(v22 + 16);
  uint64_t v24 = v22;
  uint64_t v25 = v35;
  v23(v21, v24);
  uint64_t v26 = v34;
  sub_1BBC05B9C((uint64_t)v14, (uint64_t)v41, v34);
  char v27 = *(void (**)(char *, uint64_t))(v25 + 8);
  id v28 = v14;
  uint64_t v29 = v37;
  v27(v28, v37);
  uint64_t v36 = v18;
  sub_1BBC245DC(v44, v26, (uint64_t)v18, v20);
  swift_release();

  swift_release();
  v27((char *)v26, v29);
  sub_1BBBFDF14((uint64_t)v41, &qword_1EB9F6620);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  sub_1BBBFDF14((uint64_t)v48, &qword_1E9F85998);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v45);
}

uint64_t (*sub_1BBC0F098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6))(uint64_t)
{
  uint64_t v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A20);
  swift_allocObject();
  uint64_t v12 = sub_1BBC37E28();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a5;
  *(void *)(v13 + 24) = a6;
  swift_retain();
  sub_1BBC37DD8();
  swift_release();
  swift_release();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  *(void *)(v14 + 24) = a6;
  swift_retain();
  sub_1BBC37DE8();
  swift_release();
  swift_release();
  uint64_t v15 = *(void *)(v6 + 16);
  uint64_t v16 = *(void *)(v7 + 24);
  sub_1BBC01EFC(a3, (uint64_t)v25, &qword_1E9F85998);
  uint64_t v17 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1BBC01EFC(v17, (uint64_t)v24, &qword_1EB9F6628);
  sub_1BBC01EFC(a2, (uint64_t)v23, &qword_1EB9F6620);
  swift_unknownObjectWeakInit();
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  long long v30 = v25[1];
  long long v31 = v25[2];
  long long v32 = v25[3];
  long long v33 = v25[4];
  long long v29 = v25[0];
  sub_1BBC01F60((uint64_t)v24, (uint64_t)&v34, &qword_1EB9F6628);
  sub_1BBC01F60((uint64_t)v23, (uint64_t)v35, &qword_1EB9F6620);
  swift_weakInit();
  v35[8] = a4;
  swift_unknownObjectRetain();
  dispatch_group_t v18 = sub_1BBC0F49C(a5, a6, v12);
  sub_1BBBFDF14((uint64_t)v26, &qword_1E9F859A0);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v7;
  v19[3] = v18;
  v19[4] = v12;
  swift_retain();
  return sub_1BBC10E98;
}

uint64_t sub_1BBC0F304(void *a1, void (*a2)(void *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (void *)((char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BBC38018();
  sub_1BBC060E8();
  uint64_t v7 = (void *)sub_1BBC380B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BBC38DE0;
  v15[1] = a1;
  id v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6350);
  uint64_t v10 = sub_1BBC37EE8();
  uint64_t v12 = v11;
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 64) = sub_1BBC04664();
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v12;
  sub_1BBC37D08();

  swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  swift_storeEnumTagMultiPayload();
  id v13 = a1;
  a2(v6);
  return sub_1BBBFDF14((uint64_t)v6, &qword_1EB9F6A30);
}

dispatch_group_t sub_1BBC0F49C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v47 = a1;
  uint64_t v45 = sub_1BBC37D28();
  uint64_t v54 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v53 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v50 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_t v10 = dispatch_group_create();
  sub_1BBC01EFC(v4, (uint64_t)&v68, &qword_1E9F859A0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_1BBC01F60((uint64_t)&v68, v11 + 24, &qword_1E9F859A0);
  sub_1BBC01EFC(v4 + 24, (uint64_t)v67, &qword_1E9F85998);
  sub_1BBC01EFC(v4 + 144, (uint64_t)v66, &qword_1EB9F6620);
  sub_1BBC01EFC(v4, (uint64_t)&v68, &qword_1E9F859A0);
  long long v63 = v67[2];
  long long v64 = v67[3];
  long long v65 = v67[4];
  long long v61 = v67[0];
  long long v62 = v67[1];
  sub_1BBC01F60((uint64_t)v66, (uint64_t)v60, &qword_1EB9F6620);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  sub_1BBC01F60((uint64_t)&v68, v12 + 24, &qword_1E9F859A0);
  v43[3] = a3;
  *(void *)(v12 + 240) = a3;
  long long v13 = v63;
  long long v14 = v64;
  long long v15 = v61;
  *(_OWORD *)(v12 + 264) = v62;
  *(_OWORD *)(v12 + 280) = v13;
  long long v16 = v65;
  *(_OWORD *)(v12 + 296) = v14;
  *(_OWORD *)(v12 + 312) = v16;
  *(_OWORD *)(v12 + 248) = v15;
  sub_1BBC01F60((uint64_t)v60, v12 + 328, &qword_1EB9F6620);
  *(void *)(v12 + 384) = v47;
  *(void *)(v12 + 392) = a2;
  uint64_t v44 = a2;
  long long v55 = xmmword_1BBC39270;
  uint64_t v47 = v56;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1BBC10D44;
  *(void *)(v17 + 24) = v11;
  v56[0] = 401;
  v56[1] = sub_1BBC10EDC;
  v56[2] = v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1BBC10D84;
  *(void *)(v18 + 24) = v12;
  uint64_t v57 = 330;
  uint64_t v58 = sub_1BBC10EDC;
  uint64_t v59 = v18;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1BBC10EDC;
  *(void *)(v19 + 24) = v17;
  uint64_t v46 = v4;
  uint64_t v20 = MEMORY[0x1C1863FE0](v4);
  uint64_t v48 = v11;
  dispatch_group_t v49 = v10;
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    long long v43[2] = *(void *)(v20 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    char v23 = (void *)swift_allocObject();
    _OWORD v23[2] = v22;
    v23[3] = 401;
    v43[1] = v22;
    v23[4] = sub_1BBC10EF0;
    v23[5] = v19;
    id v72 = sub_1BBC10E90;
    uint64_t v73 = v23;
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 1107296256;
    uint64_t v70 = sub_1BBBFAD0C;
    uint64_t v71 = &block_descriptor_109;
    v43[0] = _Block_copy(&v68);
    uint64_t v24 = v10;
    swift_retain_n();
    uint64_t v25 = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v26 = v50;
    sub_1BBC37D48();
    *(void *)&v67[0] = MEMORY[0x1E4FBC860];
    sub_1BBC01FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBC025FC();
    uint64_t v27 = v53;
    uint64_t v28 = v45;
    sub_1BBC38128();
    long long v29 = (const void *)v43[0];
    MEMORY[0x1C1863400](0, v26, v27, v43[0]);
    _Block_release(v29);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v28);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v52);
    swift_release();

    swift_release();
    swift_release();
    swift_release();
    uint64_t v31 = v57;
    long long v30 = v58;
    uint64_t v18 = v59;
  }
  else
  {
    long long v32 = v10;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    long long v30 = sub_1BBC10EDC;
    uint64_t v31 = 330;
    uint64_t v28 = v45;
  }
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v30;
  *(void *)(v33 + 24) = v18;
  uint64_t v34 = MEMORY[0x1C1863FE0](v46);
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v46 = *(void *)(v34 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    uint64_t v36 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v37 = (void *)swift_allocObject();
    v37[2] = v36;
    v37[3] = v31;
    uint64_t v45 = v36;
    v37[4] = sub_1BBC10EF0;
    v37[5] = v33;
    id v72 = sub_1BBC10E90;
    uint64_t v73 = v37;
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 1107296256;
    uint64_t v70 = sub_1BBBFAD0C;
    uint64_t v71 = &block_descriptor_101;
    uint64_t v44 = _Block_copy(&v68);
    swift_retain_n();
    swift_retain();
    swift_retain();
    uint64_t v38 = v50;
    sub_1BBC37D48();
    *(void *)&v67[0] = MEMORY[0x1E4FBC860];
    sub_1BBC01FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    uint64_t v39 = v28;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBC025FC();
    unint64_t v40 = v53;
    sub_1BBC38128();
    uint64_t v41 = v44;
    MEMORY[0x1C1863400](0, v38, v40, v44);
    _Block_release(v41);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v39);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v52);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_retain();
  }
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A28);
  swift_arrayDestroy();
  return v49;
}

uint64_t sub_1BBC0FCFC()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  swift_release();

  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BBC0FD44()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC0FD54(void *a1)
{
  return sub_1BBC0F304(a1, *(void (**)(void *))(v1 + 16));
}

void sub_1BBC0FD60(int a1, int a2, dispatch_group_t group, uint64_t a4, uint64_t a5, uint64_t a6)
{
  dispatch_group_enter(group);
  sub_1BBC060E8();
  uint64_t v9 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  sub_1BBC01EFC(a4 + 104, (uint64_t)&v40, &qword_1EB9F6628);
  if (v41)
  {
    sub_1BBBFAC58(&v40, (uint64_t)v42);
    if (*(void *)(a4 + 8))
    {
      uint64_t v38 = *(void *)(a4 + 16);
      uint64_t v10 = v43;
      uint64_t v11 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      uint64_t v39 = a6;
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
      swift_unknownObjectRetain();
      uint64_t v37 = v12(v10, v11);
      uint64_t v14 = v13;
      uint64_t v15 = v43;
      uint64_t v16 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
      uint64_t v19 = v18;
      uint64_t v21 = v43;
      uint64_t v20 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 72))(v21, v20);
      uint64_t v24 = v23;
      uint64_t v26 = v43;
      uint64_t v25 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v25 + 64))(&v40, v26, v25);
      char v27 = v40;
      type metadata accessor for FMNAuthenticationCredential();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v37;
      *(void *)(v28 + 24) = v14;
      *(void *)(v28 + 32) = v17;
      *(void *)(v28 + 40) = v19;
      *(void *)(v28 + 48) = v22;
      *(void *)(v28 + 56) = v24;
      *(unsigned char *)(v28 + 64) = v27;
      uint64_t ObjectType = swift_getObjectType();
      sub_1BBC10C20();
      long long v30 = (void *)swift_allocError();
      unsigned char *v31 = 2;
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = group;
      uint64_t v33 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 16);
      uint64_t v34 = group;
      v33(v28, v30, v39, v32, ObjectType, v38);
      swift_release();

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      uint64_t v36 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();

      dispatch_group_leave(group);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v42);
  }
  else
  {
    sub_1BBBFDF14((uint64_t)&v40, &qword_1EB9F6628);
    uint64_t v35 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();

    dispatch_group_leave(group);
  }
}

uint64_t sub_1BBC100A4(int a1, uint64_t a2, dispatch_group_t group, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10, uint64_t *a11, void (*a12)(BOOL, uint64_t, void *, unsigned char *, unsigned char *, uint64_t, uint64_t, NSObject *))
{
  dispatch_group_enter(group);
  uint64_t host_8 = a8;
  uint64_t v40 = a7;
  if (*(void *)(a2 + 16) && (unint64_t v18 = sub_1BBC03458(0xD000000000000010, 0x80000001BBC3B6F0), (v19 & 1) != 0))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v18);
    uint64_t v21 = *v20;
    uint64_t v22 = (void *)v20[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  dispatch_group_t v42 = group;
  sub_1BBC38028();
  if (qword_1E9F858C0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1BBC38DE0;
  uint64_t host = v21;
  v46[0] = v21;
  v46[1] = v22;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F63A0);
  uint64_t v24 = sub_1BBC37EE8();
  uint64_t v26 = v25;
  *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v23 + 64) = sub_1BBC04664();
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 40) = v26;
  sub_1BBC37D08();
  swift_bridgeObjectRelease();
  char v27 = a10;
  sub_1BBC01EFC(a4, (uint64_t)v46, a10);
  sub_1BBC01EFC(a6, (uint64_t)v45, a11);
  sub_1BBC01EFC(v40, (uint64_t)v44, &qword_1EB9F6620);
  if (v22)
  {
    sub_1BBC01EFC(a4 + 144, (uint64_t)v43, &qword_1EB9F6620);
    uint64_t v28 = v43[0];
    swift_retain();
    swift_retain();
    dispatch_group_t v29 = v42;
    long long v30 = v42;
    if (v28)
    {
      v31._countAndFlagsBits = host;
      v31._object = v22;
      FMNRedirectHostStore.saveRedirectedHost(host:)(v31);
      sub_1BBBFDF70((uint64_t)v43);
    }
    else
    {
      sub_1BBBFDF14((uint64_t)v43, &qword_1EB9F6620);
    }
    a12(*(void *)(a4 + 208) < 1, a5, v46, v45, v44, host_8, a9, v30);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    swift_retain();
    dispatch_group_t v29 = v42;
    uint64_t v32 = v42;
    sub_1BBC38018();
    sub_1BBC060E8();
    uint64_t v33 = (void *)sub_1BBC380B8();
    sub_1BBC37D08();

    uint64_t v34 = swift_allocObject();
    uint64_t v35 = MEMORY[0x1E4FBB390];
    *(_OWORD *)(v34 + 16) = xmmword_1BBC38DE0;
    uint64_t v36 = MEMORY[0x1E4FBB3C8];
    *(void *)(v34 + 56) = v35;
    *(void *)(v34 + 64) = v36;
    *(unsigned char *)(v34 + 32) = 0;
    sub_1BBC38028();
    char v27 = a10;
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();
    dispatch_group_leave(v32);
    swift_release();
  }
  sub_1BBBFDF14((uint64_t)v46, v27);
  sub_1BBBFDF14((uint64_t)v45, a11);
  sub_1BBBFDF14((uint64_t)v44, &qword_1EB9F6620);

  return swift_release();
}

void sub_1BBC1046C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, NSObject *a8)
{
  if (qword_1E9F858C0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BBC38DE0;
  uint64_t v15 = MEMORY[0x1E4FBB3C8];
  *(void *)(v14 + 56) = MEMORY[0x1E4FBB390];
  *(void *)(v14 + 64) = v15;
  *(unsigned char *)(v14 + 32) = a1 & 1;
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    goto LABEL_16;
  }
  sub_1BBC10C20();
  uint64_t v16 = (void *)swift_allocError();
  *uint64_t v17 = 5;
  sub_1BBC37E08();

  uint64_t v18 = *(void *)(a3 + 208);
  uint64_t v19 = v18 + 1;
  if (!__OFADD__(v18, 1))
  {
    sub_1BBC01EFC(a4, (uint64_t)v26, &qword_1E9F85998);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85998);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6630);
    if (swift_dynamicCast())
    {
      sub_1BBBFDF14((uint64_t)v24, &qword_1EB9F6630);
      sub_1BBC01EFC(a4, (uint64_t)v24, &qword_1E9F85998);
      if (swift_dynamicCast())
      {
        sub_1BBBFAC58(v23, (uint64_t)v26);
        sub_1BBBFAC58((long long *)((char *)&v23[2] + 8), (uint64_t)v27);
        if (swift_weakLoadStrong())
        {
          sub_1BBBFA360((uint64_t)v26, (uint64_t)v24);
          sub_1BBBFA360((uint64_t)v27, (uint64_t)v25);
          sub_1BBBFA360((uint64_t)v24, (uint64_t)v23);
          sub_1BBBFA360((uint64_t)v25, (uint64_t)&v23[2] + 8);
          sub_1BBBFA360((uint64_t)v23, (uint64_t)v21);
          sub_1BBBFA360((uint64_t)&v23[2] + 8, (uint64_t)v22);
          sub_1BBBFDA48((uint64_t)v21, (uint64_t)v22, a6, a7, v19, 0);
          sub_1BBBFDF14((uint64_t)v23, &qword_1EB9F6630);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
          swift_release();
          sub_1BBBFDF14((uint64_t)v26, &qword_1EB9F6630);
LABEL_12:
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v24);
LABEL_16:
          dispatch_group_leave(a8);
          return;
        }
        uint64_t v20 = &qword_1EB9F6630;
        goto LABEL_15;
      }
      memset(v23, 0, sizeof(v23));
      sub_1BBBFDF14((uint64_t)v23, &qword_1E9F859A8);
    }
    sub_1BBC01EFC(a4, (uint64_t)v24, &qword_1E9F85998);
    sub_1BBBFAC58(v24, (uint64_t)v26);
    sub_1BBBFAC58(v25, (uint64_t)v27);
    if (swift_weakLoadStrong())
    {
      sub_1BBBFA360((uint64_t)v26, (uint64_t)v24);
      sub_1BBBFA360((uint64_t)v27, (uint64_t)v25);
      sub_1BBBFA360((uint64_t)v24, (uint64_t)v23);
      sub_1BBBFA360((uint64_t)v25, (uint64_t)&v23[2] + 8);
      sub_1BBBFA360((uint64_t)v23, (uint64_t)v21);
      sub_1BBBFA360((uint64_t)&v23[2] + 8, (uint64_t)v22);
      sub_1BBC0EC34(v21, v22, a6, a7, v19);
      sub_1BBBFDF14((uint64_t)v23, &qword_1E9F85998);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
      swift_release();
      sub_1BBBFDF14((uint64_t)v26, &qword_1E9F85998);
      goto LABEL_12;
    }
    uint64_t v20 = &qword_1E9F85998;
LABEL_15:
    sub_1BBBFDF14((uint64_t)v26, v20);
    goto LABEL_16;
  }
  __break(1u);
}

void sub_1BBC1089C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8)
{
  if (qword_1E9F858C0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BBC38DE0;
  uint64_t v15 = MEMORY[0x1E4FBB3C8];
  *(void *)(v14 + 56) = MEMORY[0x1E4FBB390];
  *(void *)(v14 + 64) = v15;
  *(unsigned char *)(v14 + 32) = a1 & 1;
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();
  if (a1)
  {
    sub_1BBC10C20();
    uint64_t v16 = (void *)swift_allocError();
    *uint64_t v17 = 5;
    sub_1BBC37E08();

    uint64_t v18 = *(void *)(a3 + 208);
    uint64_t v19 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      JUMPOUT(0x1BBC10B1CLL);
    }
    sub_1BBC01EFC(a4, (uint64_t)v24, &qword_1EB9F6630);
    sub_1BBBFAC58(v24, (uint64_t)v26);
    sub_1BBBFAC58(v25, (uint64_t)v27);
    if (swift_weakLoadStrong())
    {
      sub_1BBBFA360((uint64_t)v26, (uint64_t)v24);
      sub_1BBBFA360((uint64_t)v27, (uint64_t)v25);
      sub_1BBBFA360((uint64_t)v24, (uint64_t)v22);
      sub_1BBBFA360((uint64_t)v25, (uint64_t)v23);
      sub_1BBBFA360((uint64_t)v22, (uint64_t)v20);
      sub_1BBBFA360((uint64_t)v23, (uint64_t)v21);
      sub_1BBBFDA48(v20, v21, a6, a7, v19, 0);
      sub_1BBBFDF14((uint64_t)v22, &qword_1EB9F6630);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
      swift_release();
      sub_1BBBFDF14((uint64_t)v26, &qword_1EB9F6630);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v24);
    }
    else
    {
      sub_1BBBFDF14((uint64_t)v26, &qword_1EB9F6630);
    }
  }
  dispatch_group_leave(a8);
}

void sub_1BBC10B30(int a1, int a2)
{
  sub_1BBC0FD60(a1, a2, *(dispatch_group_t *)(v2 + 16), v2 + 24, (uint64_t)&unk_1F14FAF20, (uint64_t)sub_1BBC10C74);
}

uint64_t sub_1BBC10B70(int a1, uint64_t a2)
{
  return sub_1BBC10DAC(a1, a2, &qword_1EB9F67E8, &qword_1EB9F6630, (void (*)(BOOL, uint64_t, void *, unsigned char *, unsigned char *, uint64_t, uint64_t, NSObject *))sub_1BBC1089C);
}

uint64_t sub_1BBC10B98()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC10BD0(void *a1, void *a2)
{
  return sub_1BBC243C8(a1, a2, *(uint64_t (**)(void, void))(v2 + 16));
}

uint64_t sub_1BBC10BD8(uint64_t a1, uint64_t a2)
{
  return sub_1BBC25F1C(a1, a2, *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_1BBC10BE0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t sub_1BBC10C20()
{
  unint64_t result = qword_1EB9F6398;
  if (!qword_1EB9F6398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6398);
  }
  return result;
}

void sub_1BBC10C74(void *a1)
{
  sub_1BBC2EDB8(a1, *(NSObject **)(v1 + 16));
}

uint64_t sub_1BBC10C7C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC10CB4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t objectdestroy_11Tm()
{
  swift_release();

  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BBC10D44(int a1, int a2)
{
  sub_1BBC0FD60(a1, a2, *(dispatch_group_t *)(v2 + 16), v2 + 24, (uint64_t)&unk_1F14FB1A0, (uint64_t)sub_1BBC10E94);
}

uint64_t sub_1BBC10D84(int a1, uint64_t a2)
{
  return sub_1BBC10DAC(a1, a2, &qword_1E9F859A0, &qword_1E9F85998, (void (*)(BOOL, uint64_t, void *, unsigned char *, unsigned char *, uint64_t, uint64_t, NSObject *))sub_1BBC1046C);
}

uint64_t sub_1BBC10DAC(int a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void (*a5)(BOOL, uint64_t, void *, unsigned char *, unsigned char *, uint64_t, uint64_t, NSObject *))
{
  return sub_1BBC100A4(a1, a2, *(dispatch_group_t *)(v5 + 16), v5 + 24, *(void *)(v5 + 240), v5 + 248, v5 + 328, *(void *)(v5 + 384), *(void *)(v5 + 392), a3, a4, a5);
}

uint64_t objectdestroy_37Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBC10E40()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC10E78@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBFE4C8(a1);
}

uint64_t FMNServerCommand.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BBC37C18();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t FMNServerCommand.data.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FMNServerCommand() + 20);
  uint64_t v2 = *(void *)v1;
  sub_1BBC02290(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for FMNServerCommand()
{
  uint64_t result = qword_1E9F859B0;
  if (!qword_1E9F859B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FMNServerCommand.headers.getter()
{
  type metadata accessor for FMNServerCommand();

  return swift_bridgeObjectRetain();
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerCommand(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBC37C18();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_1BBC02290(*v10, v12);
    *uint64_t v9 = v11;
    v9[1] = v12;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FMNServerCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_1BBC025A4(*(void *)(a1 + *(int *)(a2 + 20)), *(void *)(a1 + *(int *)(a2 + 20) + 8));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_1BBC02290(*v9, v11);
  *uint64_t v8 = v10;
  v8[1] = v11;
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_1BBC02290(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  *uint64_t v8 = v10;
  v8[1] = v11;
  sub_1BBC025A4(v12, v13);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_1BBC025A4(v8, v9);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC1143C);
}

uint64_t sub_1BBC1143C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC11510);
}

uint64_t sub_1BBC11510(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBC37C18();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1BBC115CC()
{
  uint64_t result = sub_1BBC37C18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1BBC11670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *v4;
  uint64_t v8 = (void *)sub_1BBC379C8();
  uint64_t v9 = (void *)sub_1BBC37BD8();
  v13[4] = a3;
  v13[5] = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1BBBF9B84;
  v13[3] = &block_descriptor_0;
  unint64_t v10 = _Block_copy(v13);
  swift_retain();
  id v11 = objc_msgSend(v7, sel_uploadTaskWithRequest_fromFile_completionHandler_, v8, v9, v10);

  _Block_release(v10);
  swift_release();
  return v11;
}

id sub_1BBC1176C()
{
  return objc_msgSend(*v0, sel_finishTasksAndInvalidate);
}

FMNetworking::FMNAccountType_optional __swiftcall FMNAccountType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  BOOL v3 = rawValue._countAndFlagsBits == 6712678 && rawValue._object == (void *)0xE300000000000000;
  if (v3 || (object = rawValue._object, uint64_t countAndFlagsBits = rawValue._countAndFlagsBits, (sub_1BBC38448() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else if (countAndFlagsBits == 0x707041666D66 && object == (void *)0xE600000000000000 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else if (countAndFlagsBits == 1885957478 && object == (void *)0xE400000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 2;
  }
  else if (countAndFlagsBits == 0x6972695370696D66 && object == (void *)0xE800000000000000 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 3;
  }
  else if (countAndFlagsBits == 0x7075746573 && object == (void *)0xE500000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 4;
  }
  else if (countAndFlagsBits == 0x6150686372616573 && object == (void *)0xEB00000000797472 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 5;
  }
  else if (countAndFlagsBits == 0x4C676E6972696170 && object == (void *)0xEB000000006B636FLL {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 6;
  }
  else if (countAndFlagsBits == 0x726F737365636361 && object == (void *)0xE900000000000079 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 7;
  }
  else if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000001BBC3BA20 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 8;
  }
  else if (countAndFlagsBits == 0x7373656363413277 && object == (void *)0xEB0000000079726FLL {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 9;
  }
  else if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x80000001BBC3BA40 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 10;
  }
  else if (countAndFlagsBits == 0x6F4C657275636573 && object == (void *)0xEF736E6F69746163 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 11;
  }
  else if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x80000001BBC3BA60 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 12;
  }
  else if (countAndFlagsBits == 0x726168536D657469 && object == (void *)0xEB00000000676E69 {
         || (sub_1BBC38448() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 13;
  }
  else if (countAndFlagsBits == 1701736302 && object == (void *)0xE400000000000000)
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 14;
  }
  else
  {
    char v8 = sub_1BBC38448();
    result.value = swift_bridgeObjectRelease();
    if (v8) {
      char v7 = 14;
    }
    else {
      char v7 = 15;
    }
  }
  *uint64_t v2 = v7;
  return result;
}

unint64_t FMNAccountType.description.getter()
{
  unint64_t result = 6712678;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x707041666D66;
      break;
    case 2:
      unint64_t result = 1885957478;
      break;
    case 3:
      unint64_t result = 0x6972695370696D66;
      break;
    case 4:
      unint64_t result = 0x7075746573;
      break;
    case 5:
      unint64_t result = 0x6150686372616573;
      break;
    case 6:
      unint64_t result = 0x4C676E6972696170;
      break;
    case 7:
      unint64_t result = 0x726F737365636361;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x7373656363413277;
      break;
    case 0xA:
    case 0xC:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xB:
      unint64_t result = 0x6F4C657275636573;
      break;
    case 0xD:
      unint64_t result = 0x726168536D657469;
      break;
    case 0xE:
      unint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC11FC0()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC12028()
{
  FMNAccountType.rawValue.getter();
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC1208C()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC120F0()
{
  return sub_1BBC0CCE0();
}

FMNetworking::FMNAccountType_optional sub_1BBC120FC(Swift::String *a1)
{
  return FMNAccountType.init(rawValue:)(*a1);
}

unint64_t sub_1BBC12108@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = FMNAccountType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL static FMNAuthenticationProviderError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FMNAuthenticationProviderError.hash(into:)()
{
  return sub_1BBC38588();
}

uint64_t FMNAuthenticationProviderError.hashValue.getter()
{
  return sub_1BBC38598();
}

BOOL sub_1BBC121BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BBC121D0()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC12218()
{
  return sub_1BBC38588();
}

uint64_t sub_1BBC12244()
{
  return sub_1BBC38598();
}

FMNetworking::FMNAuthenticationOverride_optional __swiftcall FMNAuthenticationOverride.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1BBC38268();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t FMNAuthenticationOverride.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000017;
  }
}

uint64_t sub_1BBC1232C(char *a1, char *a2)
{
  return sub_1BBC0CF20(*a1, *a2);
}

uint64_t sub_1BBC12338()
{
  return sub_1BBC1DFD0();
}

uint64_t sub_1BBC12340()
{
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC123B4()
{
  return sub_1BBC1E1F0();
}

FMNetworking::FMNAuthenticationOverride_optional sub_1BBC123BC(Swift::String *a1)
{
  return FMNAuthenticationOverride.init(rawValue:)(*a1);
}

void sub_1BBC123C8(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000016;
  }
  else {
    unint64_t v2 = 0xD000000000000017;
  }
  unint64_t v3 = 0x80000001BBC3B410;
  if (*v1) {
    unint64_t v3 = 0x80000001BBC3B430;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1BBC1240C()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_1BBC12440(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1BBC12480())()
{
  return j__swift_endAccess;
}

uint64_t FMNAuthenticationProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  FMNAuthenticationProvider.init()();
  return v0;
}

void sub_1BBC1250C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  if (a2)
  {
    sub_1BBC14810();
    uint64_t v4 = (void *)swift_allocError();
    *char v5 = 4;
    ((void (*)(void, void *))a3)(0, v4);
  }
  else
  {
    a3();
  }
}

uint64_t sub_1BBC125A0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_1BBC37D28();
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1BBC37D58();
  uint64_t v13 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a1;
  v16[6] = a2;
  aBlock[4] = sub_1BBC13B94;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_12;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  id v18 = a2;
  sub_1BBC37D48();
  uint64_t v23 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v21);
  return swift_release();
}

void sub_1BBC128E4(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)(a1 + 56) = 0;
  swift_release();
  uint64_t v10 = (void *)sub_1BBBFD58C();
  id v11 = objc_msgSend(v10, sel_aa_primaryAppleAccount);

  if (v11)
  {
    swift_beginAccess();
    char v14 = *(unsigned char *)(a4 + 64);
    swift_retain();
    sub_1BBC14DE0(v11, &v14, a5, a1, a2, a3);
    swift_release();
  }
  else
  {
    sub_1BBC38028();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    sub_1BBC37D08();
    sub_1BBC14810();
    uint64_t v12 = (void *)swift_allocError();
    *uint64_t v13 = 0;
    a2();
  }
}

uint64_t sub_1BBC12A7C(void *a1, uint64_t (*a2)(void *))
{
  if (a1)
  {
    sub_1BBC38018();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1BBC38DE0;
    id v5 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85C40);
    uint64_t v6 = sub_1BBC37EE8();
    uint64_t v8 = v7;
    *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v4 + 64) = sub_1BBC04664();
    *(void *)(v4 + 32) = v6;
    *(void *)(v4 + 40) = v8;
    sub_1BBC37D08();
    swift_bridgeObjectRelease();
  }
  return a2(a1);
}

void sub_1BBC12BB0(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1BBC12C1C(uint64_t a1, void (*a2)(void, void *), uint64_t a3, char a4)
{
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 16);
  BOOL v10 = __OFSUB__(v9, 1);
  uint64_t v11 = v9 - 1;
  if (!v10)
  {
    *(void *)(a1 + 16) = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a3;
    *(void *)(v12 + 32) = a1;
    *(unsigned char *)(v12 + 40) = a4;
    swift_beginAccess();
    if (*(void *)(a1 + 40))
    {
      swift_retain_n();
      swift_retain_n();
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_1BBC37E88();
      id v14 = objc_msgSend(self, sel_bundleWithIdentifier_, v13);

      if (v14)
      {
        sub_1BBC37B88();
        uint64_t v15 = self;
        uint64_t v16 = (void *)sub_1BBC37E88();
        swift_bridgeObjectRelease();
        uint64_t v17 = (void *)sub_1BBC37E88();
        swift_bridgeObjectRelease();
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = sub_1BBC15418;
        *(void *)(v18 + 24) = v12;
        aBlock[4] = sub_1BBC15428;
        aBlock[5] = v18;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1BBC12BB0;
        aBlock[3] = &block_descriptor_58;
        uint64_t v19 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v15, sel_renewCredentialsWithBundleId_force_reason_completion_, v16, 0, v17, v19, 0xE000000000000000);
        _Block_release(v19);
        swift_release();
        swift_release();

        return swift_release();
      }
      swift_bridgeObjectRelease();
      sub_1BBC14810();
      uint64_t v20 = (void *)swift_allocError();
      *uint64_t v22 = 8;
    }
    else
    {
      sub_1BBC14810();
      uint64_t v20 = (void *)swift_allocError();
      unsigned char *v21 = 8;
      swift_retain_n();
      swift_retain_n();
    }
    sub_1BBC38018();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1BBC38DE0;
    aBlock[0] = v20;
    id v24 = v20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85C40);
    uint64_t v25 = sub_1BBC37EE8();
    uint64_t v27 = v26;
    *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v23 + 64) = sub_1BBC04664();
    *(void *)(v23 + 32) = v25;
    *(void *)(v23 + 40) = v27;
    sub_1BBC37D08();
    swift_bridgeObjectRelease();
    a2(0, v20);

    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BBC13074(void *a1, uint64_t (*a2)(void, void *), uint64_t a3, uint64_t a4, char a5)
{
  if (a1)
  {
    sub_1BBC38018();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1BBC38DE0;
    id v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85C40);
    uint64_t v10 = sub_1BBC37EE8();
    uint64_t v12 = v11;
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 64) = sub_1BBC04664();
    *(void *)(v8 + 32) = v10;
    *(void *)(v8 + 40) = v12;
    sub_1BBC37D08();
    swift_bridgeObjectRelease();
    return a2(0, a1);
  }
  else
  {
    sub_1BBC38028();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    sub_1BBC37D08();
    char v15 = a5;
    return sub_1BBBFED08(&v15, (uint64_t)a2, a3);
  }
}

void static FMNAuthenticationProvider.configurationURL(accountType:)(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*a1)
  {
    case 5:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      uint64_t v10 = 0xD000000000000017;
      uint64_t v11 = "icloud_acsn_gateway_url";
      goto LABEL_9;
    case 6:
    case 7:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      id v9 = "icloud_fmip_al_service";
      goto LABEL_14;
    case 8:
      uint64_t v12 = (void *)MEMORY[0x1C18639D0](v5);
      sub_1BBC135B0(0xD000000000000021, 0x80000001BBC3BBD0, (uint64_t)v7);
      uint64_t v13 = sub_1BBC37C18();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) == 1)
      {
        sub_1BBBFDF14((uint64_t)v7, (uint64_t *)&unk_1EB9F6558);
        sub_1BBC37C08();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v7, v13);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
      }
      return;
    case 9:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      uint64_t v10 = 0xD000000000000015;
      uint64_t v11 = "fmadminws_gateway_url";
      goto LABEL_9;
    case 0xA:
    case 0xB:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      uint64_t v10 = 0xD000000000000019;
      uint64_t v11 = "findmyservice_gateway_url";
      goto LABEL_9;
    case 0xC:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      uint64_t v10 = 0xD000000000000017;
      uint64_t v11 = "findmy_owner_device_url";
LABEL_9:
      unint64_t v15 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      uint64_t v16 = a2;
      goto LABEL_15;
    case 0xD:
      uint64_t v8 = (void *)MEMORY[0x1C18639D0](v5);
      id v9 = "findmy_key_sharing_url";
LABEL_14:
      unint64_t v15 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      uint64_t v16 = a2;
      uint64_t v10 = 0xD000000000000016;
LABEL_15:
      sub_1BBC135B0(v10, v15, v16);
      break;
    default:
      uint64_t v17 = sub_1BBC37C18();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
      v18(a2, 1, 1, v17);
      break;
  }
}

id sub_1BBC135B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(self, sel_defaultStore);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v10 = result;
  id v11 = objc_msgSend(result, sel_aa_primaryAppleAccount);

  if (!v11)
  {
    sub_1BBC38018();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1BBC38DE0;
    *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v19 + 64) = sub_1BBC04664();
    *(void *)(v19 + 32) = a1;
    *(void *)(v19 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1BBC37D08();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v12 = (void *)sub_1BBC37E88();
  id v13 = objc_msgSend(v11, sel_propertiesForDataclass_, v12);

  if (!v13 || (uint64_t v14 = sub_1BBC37E48(), v13, v15 = sub_1BBBFFBC4(v14), swift_bridgeObjectRelease(), !v15))
  {
    sub_1BBC38018();
    if (qword_1EB9F6DC8 == -1) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  if (!*(void *)(v15 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    sub_1BBC38018();
    if (qword_1EB9F6DC8 == -1)
    {
LABEL_17:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1BBC38DE0;
      *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v20 + 64) = sub_1BBC04664();
      *(void *)(v20 + 32) = a1;
      *(void *)(v20 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1BBC37D08();
      swift_bridgeObjectRelease();

LABEL_18:
      uint64_t v21 = sub_1BBC37C18();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a3, 1, 1, v21);
    }
LABEL_20:
    swift_once();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  sub_1BBC03458(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BBC37C08();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_1BBC37C18();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) == 1)
  {
    sub_1BBBFDF14((uint64_t)v8, (uint64_t *)&unk_1EB9F6558);
    goto LABEL_16;
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a3, v8, v17);
  return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a3, 0, 1, v17);
}

uint64_t FMNAuthenticationProvider.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t FMNAuthenticationProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1BBC13B38()
{
  return objectdestroyTm(40);
}

uint64_t sub_1BBC13B44()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1BBC13B94()
{
  sub_1BBC128E4(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

unint64_t sub_1BBC13BA8()
{
  unint64_t result = qword_1E9F859C0;
  if (!qword_1E9F859C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F859C0);
  }
  return result;
}

unint64_t sub_1BBC13C00()
{
  unint64_t result = qword_1E9F859C8;
  if (!qword_1E9F859C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F859C8);
  }
  return result;
}

unint64_t sub_1BBC13C58()
{
  unint64_t result = qword_1E9F859D0;
  if (!qword_1E9F859D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F859D0);
  }
  return result;
}

uint64_t sub_1BBC13CAC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return result;
}

uint64_t sub_1BBC13CF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_1BBC13D38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t getEnumTagSinglePayload for FMNAccountType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMNAccountType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x1BBC13EE4);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationProviderError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMNAuthenticationProviderError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x1BBC14068);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNAuthenticationProviderError()
{
  return &type metadata for FMNAuthenticationProviderError;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationOverride(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FMNAuthenticationOverride(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1BBC141FCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1BBC14224(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FMNAuthenticationOverride()
{
  return &type metadata for FMNAuthenticationOverride;
}

uint64_t dispatch thunk of FMNAuthenticationProviding.credential(accountType:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of FMNAuthenticationProviding.credentialDidFail(credential:error:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t method lookup function for FMNAuthenticationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNAuthenticationProvider);
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.credential(accountType:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.credentialDidFail(credential:error:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

id sub_1BBC143B4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F859D8);
  MEMORY[0x1F4188790](v2 - 8);
  unsigned int v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  MEMORY[0x1F4188790](v5 - 8);
  BOOL v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37C18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_dataclassProperties);
  if (!result) {
    return result;
  }
  id v13 = result;
  uint64_t v14 = (void *)sub_1BBC37E88();
  id v15 = objc_msgSend(v13, sel_valueForKey_, v14);

  if (v15)
  {
    sub_1BBC38118();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  sub_1BBBFD524((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {
LABEL_16:

    uint64_t v20 = &qword_1EB9F68A8;
    uint64_t v21 = v30;
    goto LABEL_17;
  }
  sub_1BBBFAC1C(0, &qword_1EB9F68B0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  char v16 = v27;
  uint64_t v17 = (void *)sub_1BBC37E88();
  uint64_t v18 = v16;
  id v19 = objc_msgSend(v16, sel_valueForKey_, v17);

  if (v19)
  {
    sub_1BBC38118();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  sub_1BBBFD524((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {

    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  sub_1BBC37C08();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {

    uint64_t v20 = (uint64_t *)&unk_1EB9F6558;
    uint64_t v21 = v7;
LABEL_17:
    sub_1BBBFDF14((uint64_t)v21, v20);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  sub_1BBC37AF8();
  uint64_t v22 = sub_1BBC37B78();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v4, 1, v22) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    uint64_t v20 = &qword_1E9F859D8;
    uint64_t v21 = v4;
    goto LABEL_17;
  }
  uint64_t v24 = sub_1BBC37B18();
  uint64_t v26 = v25;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v22);
  if (v26) {
    return (id)v24;
  }
  else {
    return 0;
  }
}

unint64_t sub_1BBC14810()
{
  unint64_t result = qword_1E9F859E0;
  if (!qword_1E9F859E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F859E0);
  }
  return result;
}

uint64_t sub_1BBC14864(void *a1, char *a2, void *a3, uint64_t a4, void (*a5)(void, void *), uint64_t a6)
{
  id v33 = a1;
  uint64_t v11 = sub_1BBC37D28();
  uint64_t v32 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BBC37D58();
  uint64_t v30 = *(void *)(v14 - 8);
  uint64_t v31 = v14;
  MEMORY[0x1F4188790](v14);
  char v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = a6;
  char v18 = *a2;
  swift_beginAccess();
  if (*(uint64_t *)(a4 + 16) < 1)
  {
    swift_retain();
    goto LABEL_7;
  }
  uint64_t v29 = v11;
  LOBYTE(aBlock[0]) = v18;
  if (FMNAccountType.rawValue.getter() == 1701736302 && v19 == 0xE400000000000000)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  char v20 = sub_1BBC38448();
  swift_retain();
  swift_bridgeObjectRelease();
  if (v20)
  {
LABEL_7:
    sub_1BBC38028();
    if (qword_1EB9F6DC8 == -1) {
      goto LABEL_8;
    }
LABEL_17:
    swift_once();
    goto LABEL_8;
  }
  aBlock[0] = a3;
  id v24 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6350);
  if (swift_dynamicCast() && !(_BYTE)v34)
  {
    sub_1BBC38028();
    if (qword_1EB9F6DC8 == -1) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v33, sel_aa_isManagedAppleID))
  {
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    *(void *)(v25 + 24) = sub_1BBC15430;
    *(void *)(v25 + 32) = v17;
    *(unsigned char *)(v25 + 40) = v18;
    aBlock[4] = sub_1BBC15440;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBFAD0C;
    aBlock[3] = &block_descriptor_68;
    uint64_t v26 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    sub_1BBC37D48();
    uint64_t v34 = MEMORY[0x1E4FBC860];
    sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
    uint64_t v27 = v29;
    sub_1BBC38128();
    MEMORY[0x1C1863400](0, v16, v13, v26);
    _Block_release(v26);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v27);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
    swift_release();
    return swift_release();
  }
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    goto LABEL_17;
  }
LABEL_8:
  sub_1BBC37D08();
  sub_1BBC14810();
  uint64_t v21 = (void *)swift_allocError();
  *uint64_t v22 = 4;
  a5(0, v21);

  return swift_release();
}

uint64_t sub_1BBC14DE0(void *a1, char *a2, void *a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  id v34 = a1;
  uint64_t v31 = sub_1BBC37D28();
  uint64_t v11 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  id v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BBC37D58();
  uint64_t v32 = *(void *)(v14 - 8);
  uint64_t v33 = v14;
  MEMORY[0x1F4188790](v14);
  char v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = a6;
  char v18 = *a2;
  swift_beginAccess();
  if (*(uint64_t *)(a4 + 16) < 1)
  {
    swift_retain();
    goto LABEL_7;
  }
  uint64_t v30 = v11;
  LOBYTE(aBlock[0]) = v18;
  if (FMNAccountType.rawValue.getter() == 1701736302 && v19 == 0xE400000000000000)
  {
    swift_retain();
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1BBC38028();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    sub_1BBC37D08();
    sub_1BBC14810();
    uint64_t v22 = (void *)swift_allocError();
    char v23 = 6;
LABEL_10:
    char *v21 = v23;
    a5();

    return swift_release();
  }
  char v20 = sub_1BBC38448();
  swift_retain();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_7;
  }
  aBlock[0] = a3;
  id v25 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6350);
  if (!swift_dynamicCast() || (_BYTE)v35)
  {
    if (!objc_msgSend(v34, sel_aa_isManagedAppleID))
    {
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = a4;
      *(void *)(v26 + 24) = sub_1BBC153D0;
      *(void *)(v26 + 32) = v17;
      *(unsigned char *)(v26 + 40) = v18;
      aBlock[4] = sub_1BBC15400;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1BBBFAD0C;
      aBlock[3] = &block_descriptor_49_0;
      uint64_t v27 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      sub_1BBC37D48();
      uint64_t v35 = MEMORY[0x1E4FBC860];
      sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
      sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
      uint64_t v28 = v31;
      sub_1BBC38128();
      MEMORY[0x1C1863400](0, v16, v13, v27);
      _Block_release(v27);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v28);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v33);
      swift_release();
      return swift_release();
    }
    sub_1BBC38028();
    if (qword_1EB9F6DC8 != -1) {
      swift_once();
    }
    sub_1BBC37D08();
    sub_1BBC14810();
    uint64_t v22 = (void *)swift_allocError();
    char v23 = 7;
    goto LABEL_10;
  }
  sub_1BBC38028();
  if (qword_1EB9F6DC8 != -1) {
    swift_once();
  }
  sub_1BBC37D08();
  ((void (*)(void *))a5)(a3);
  return swift_release();
}

uint64_t sub_1BBC15398()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC153D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

uint64_t sub_1BBC15400()
{
  return sub_1BBC12C1C(*(void *)(v0 + 16), *(void (**)(void, void *))(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_1BBC15410()
{
  return objectdestroyTm(41);
}

uint64_t sub_1BBC15418(void *a1)
{
  return sub_1BBC13074(a1, *(uint64_t (**)(void, void *))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40));
}

uint64_t sub_1BBC15428(void *a1)
{
  return sub_1BBC12A7C(a1, *(uint64_t (**)(void *))(v1 + 16));
}

void sub_1BBC15430(uint64_t a1, uint64_t a2)
{
  sub_1BBC1250C(a1, a2, *(void (**)(void))(v2 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for FMNHTTPArchiveReader(uint64_t a1)
{
  uint64_t v2 = sub_1BBC37C18();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC156E4);
}

uint64_t sub_1BBC156E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC15764);
}

uint64_t sub_1BBC15764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FMNHTTPArchiveReader()
{
  uint64_t result = qword_1E9F859E8;
  if (!qword_1E9F859E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBC15820()
{
  uint64_t result = sub_1BBC37C18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1BBC158AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BBC37A58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v6 = swift_allocObject();
  long long v17 = xmmword_1BBC38DE0;
  *(_OWORD *)(v6 + 16) = xmmword_1BBC38DE0;
  uint64_t v7 = sub_1BBC37BB8();
  uint64_t v9 = v8;
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 64) = sub_1BBC04664();
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  sub_1BBC060E8();
  uint64_t v10 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  v16[1] = v1;
  uint64_t v11 = sub_1BBC37C38();
  unint64_t v13 = v12;
  sub_1BBC37A98();
  swift_allocObject();
  sub_1BBC37A88();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F26C98], v2);
  sub_1BBC37A68();
  sub_1BBC15E4C();
  sub_1BBC37A78();
  swift_release();
  sub_1BBC025A4(v11, v13);
  uint64_t v14 = v18[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18[0] = v14;
  swift_bridgeObjectRetain();
  sub_1BBC161AC(v18);
  swift_bridgeObjectRelease();
  return v18[0];
}

uint64_t sub_1BBC15C38()
{
  uint64_t v24 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v24 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    uint64_t v6 = *(v2 - 3);
    uint64_t v5 = *(v2 - 2);
    uint64_t v8 = *(v2 - 1);
    uint64_t v7 = *v2;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = sub_1BBC03458(v6, v5);
    uint64_t v12 = v3[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (v3[3] >= v14)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v10) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_1BBC0B0DC();
        if (v15) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_1BBC0A3F8(v14, isUniquelyReferenced_nonNull_native);
      unint64_t v16 = sub_1BBC03458(v6, v5);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_21;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_3:
        uint64_t v4 = (void *)(v3[7] + 16 * v11);
        swift_bridgeObjectRelease();
        *uint64_t v4 = v8;
        v4[1] = v7;
        goto LABEL_4;
      }
    }
    v3[(v11 >> 6) + 8] |= 1 << v11;
    char v18 = (uint64_t *)(v3[6] + 16 * v11);
    *char v18 = v6;
    v18[1] = v5;
    uint64_t v19 = (void *)(v3[7] + 16 * v11);
    *uint64_t v19 = v8;
    v19[1] = v7;
    uint64_t v20 = v3[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_20;
    }
    v3[2] = v22;
    swift_bridgeObjectRetain();
LABEL_4:
    v2 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (!--v1)
    {
      sub_1BBC15E20((uint64_t)&v24);
      return (uint64_t)v3;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_1BBC38508();
  __break(1u);
  return result;
}

uint64_t sub_1BBC15E20(uint64_t a1)
{
  return a1;
}

unint64_t sub_1BBC15E4C()
{
  unint64_t result = qword_1E9F859F8;
  if (!qword_1E9F859F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F859F8);
  }
  return result;
}

void *sub_1BBC15EA0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85930);
    char v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85928);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_1BBC15FD8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    BOOL v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85910);
  uint64_t v10 = *(void *)(type metadata accessor for HAREntry() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for HAREntry() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1BBC161AC(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for HAREntry() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_1BBC17438(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_1BBC16254(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1BBC16254(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for HAREntry();
  uint64_t v129 = *(void *)(v4 - 8);
  uint64_t v130 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v126 = (uint64_t)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v136 = (uint64_t)&v121 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v133 = (uint64_t)&v121 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v132 = (uint64_t)&v121 - v11;
  uint64_t v12 = a1[1];
  uint64_t result = sub_1BBC38358();
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_144;
    }
    if (v12) {
      return sub_1BBC16BDC(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_143;
  }
  uint64_t v123 = result;
  if (v12 > 1)
  {
    uint64_t v15 = v14 >> 1;
    uint64_t result = sub_1BBC37FB8();
    *(void *)(result + 16) = v15;
    uint64_t v16 = *(unsigned __int8 *)(v129 + 80);
    uint64_t v122 = result;
    unint64_t v128 = result + ((v16 + 32) & ~v16);
LABEL_13:
    uint64_t v18 = 0;
    uint64_t v19 = MEMORY[0x1E4FBC860];
    uint64_t v135 = a1;
    while (1)
    {
      uint64_t v21 = v18;
      uint64_t v22 = v18 + 1;
      if (v18 + 1 >= v12)
      {
        uint64_t v39 = v18 + 1;
      }
      else
      {
        uint64_t v124 = v2;
        uint64_t v23 = *a1;
        uint64_t v24 = *(void *)(v129 + 72);
        uint64_t v25 = *a1 + v24 * v22;
        uint64_t v127 = v18;
        uint64_t v26 = v132;
        sub_1BBC1744C(v25, v132);
        uint64_t v27 = v133;
        sub_1BBC1744C(v23 + v24 * v127, v133);
        LODWORD(v134) = sub_1BBC37C88();
        sub_1BBC174B0(v27);
        uint64_t v28 = v26;
        uint64_t v21 = v127;
        uint64_t result = sub_1BBC174B0(v28);
        uint64_t v29 = v21 + 2;
        uint64_t v131 = v23;
        uint64_t v137 = v24;
        if (v21 + 2 >= v12)
        {
          uint64_t v32 = v21 + 2;
          uint64_t v38 = v24;
          if ((v134 & 1) == 0) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v30 = v24 * v22;
          uint64_t v31 = v23;
          uint64_t v32 = v29;
          uint64_t v33 = v24 * v29;
          do
          {
            uint64_t v34 = v12;
            uint64_t v35 = v132;
            sub_1BBC1744C(v31 + v33, v132);
            uint64_t v36 = v133;
            sub_1BBC1744C(v31 + v30, v133);
            int v37 = sub_1BBC37C88();
            sub_1BBC174B0(v36);
            uint64_t result = sub_1BBC174B0(v35);
            if ((v134 ^ v37))
            {
              a1 = v135;
              uint64_t v21 = v127;
              uint64_t v12 = v34;
              uint64_t v38 = v137;
              if ((v134 & 1) == 0) {
                goto LABEL_38;
              }
              goto LABEL_25;
            }
            uint64_t v38 = v137;
            v31 += v137;
            ++v32;
            uint64_t v12 = v34;
          }
          while (v34 != v32);
          uint64_t v32 = v34;
          a1 = v135;
          uint64_t v21 = v127;
          if ((v134 & 1) == 0)
          {
LABEL_38:
            uint64_t v39 = v32;
            goto LABEL_39;
          }
        }
LABEL_25:
        if (v32 < v21) {
          goto LABEL_145;
        }
        uint64_t v39 = v32;
        if (v21 >= v32)
        {
LABEL_39:
          uint64_t v2 = v124;
          if (v39 >= v12) {
            goto LABEL_59;
          }
        }
        else
        {
          uint64_t v134 = v12;
          uint64_t v121 = v19;
          uint64_t v40 = 0;
          uint64_t v41 = v38 * (v32 - 1);
          uint64_t v42 = v32 * v38;
          uint64_t v43 = v21 * v38;
          do
          {
            if (v21 != v39 + v40 - 1)
            {
              uint64_t v44 = v131;
              if (!v131) {
                goto LABEL_150;
              }
              unint64_t v45 = v131 + v43;
              sub_1BBC1750C(v131 + v43, v126);
              if (v43 < v41 || v45 >= v44 + v42)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v43 != v41)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              uint64_t result = sub_1BBC1750C(v126, v44 + v41);
              a1 = v135;
              uint64_t v39 = v32;
              uint64_t v38 = v137;
            }
            ++v21;
            --v40;
            v41 -= v38;
            v42 -= v38;
            v43 += v38;
          }
          while (v21 < v39 + v40);
          uint64_t v19 = v121;
          uint64_t v2 = v124;
          uint64_t v21 = v127;
          uint64_t v12 = v134;
          if (v39 >= v134) {
            goto LABEL_59;
          }
        }
        if (__OFSUB__(v39, v21)) {
          goto LABEL_142;
        }
        if (v39 - v21 < v123)
        {
          if (__OFADD__(v21, v123)) {
            goto LABEL_146;
          }
          if (v21 + v123 >= v12) {
            uint64_t v46 = v12;
          }
          else {
            uint64_t v46 = v21 + v123;
          }
          if (v46 < v21)
          {
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
            return result;
          }
          if (v39 != v46)
          {
            uint64_t v127 = v21;
            uint64_t v121 = v19;
            uint64_t v124 = v2;
            uint64_t v125 = v46;
            uint64_t v47 = *(void *)(v129 + 72);
            uint64_t v48 = v47 * (v39 - 1);
            uint64_t v131 = v47;
            uint64_t v49 = v39 * v47;
            do
            {
              uint64_t v51 = 0;
              uint64_t v52 = v127;
              uint64_t v134 = v39;
              while (1)
              {
                uint64_t v137 = v52;
                uint64_t v53 = *a1;
                uint64_t v54 = v49;
                uint64_t v55 = v49 + v51 + *a1;
                int64_t v56 = a1;
                uint64_t v57 = v132;
                sub_1BBC1744C(v55, v132);
                uint64_t v58 = v48;
                uint64_t v59 = v48 + v51 + v53;
                uint64_t v60 = v133;
                sub_1BBC1744C(v59, v133);
                LOBYTE(v53) = sub_1BBC37C88();
                sub_1BBC174B0(v60);
                uint64_t result = sub_1BBC174B0(v57);
                if ((v53 & 1) == 0) {
                  break;
                }
                uint64_t v61 = *v56;
                if (!*v56) {
                  goto LABEL_148;
                }
                uint64_t v49 = v54;
                uint64_t v48 = v58;
                uint64_t v62 = v61 + v58 + v51;
                sub_1BBC1750C(v61 + v54 + v51, v136);
                swift_arrayInitWithTakeFrontToBack();
                uint64_t result = sub_1BBC1750C(v136, v62);
                v51 -= v131;
                uint64_t v52 = v137 + 1;
                uint64_t v50 = v134;
                a1 = v135;
                if (v134 == v137 + 1) {
                  goto LABEL_52;
                }
              }
              uint64_t v50 = v134;
              a1 = v56;
              uint64_t v48 = v58;
              uint64_t v49 = v54;
LABEL_52:
              uint64_t v39 = v50 + 1;
              v48 += v131;
              v49 += v131;
            }
            while (v39 != v125);
            uint64_t v39 = v125;
            uint64_t v2 = v124;
            uint64_t v19 = v121;
            uint64_t v21 = v127;
          }
        }
      }
LABEL_59:
      if (v39 < v21) {
        goto LABEL_137;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v134 = v39;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1BBC17244(0, *(void *)(v19 + 16) + 1, 1, (char *)v19);
        uint64_t v19 = result;
      }
      unint64_t v64 = *(void *)(v19 + 16);
      unint64_t v63 = *(void *)(v19 + 24);
      unint64_t v20 = v64 + 1;
      if (v64 >= v63 >> 1)
      {
        uint64_t result = (uint64_t)sub_1BBC17244((char *)(v63 > 1), v64 + 1, 1, (char *)v19);
        uint64_t v19 = result;
      }
      *(void *)(v19 + 16) = v20;
      uint64_t v65 = v19 + 32;
      uint64_t v66 = (uint64_t *)(v19 + 32 + 16 * v64);
      uint64_t v67 = v134;
      uint64_t *v66 = v21;
      v66[1] = v67;
      if (v64)
      {
        while (1)
        {
          unint64_t v68 = v20 - 1;
          if (v20 >= 4)
          {
            unint64_t v73 = v65 + 16 * v20;
            uint64_t v74 = *(void *)(v73 - 64);
            uint64_t v75 = *(void *)(v73 - 56);
            BOOL v79 = __OFSUB__(v75, v74);
            uint64_t v76 = v75 - v74;
            if (v79) {
              goto LABEL_126;
            }
            uint64_t v78 = *(void *)(v73 - 48);
            uint64_t v77 = *(void *)(v73 - 40);
            BOOL v79 = __OFSUB__(v77, v78);
            uint64_t v71 = v77 - v78;
            char v72 = v79;
            if (v79) {
              goto LABEL_127;
            }
            unint64_t v80 = v20 - 2;
            uint64_t v81 = (uint64_t *)(v65 + 16 * (v20 - 2));
            uint64_t v83 = *v81;
            uint64_t v82 = v81[1];
            BOOL v79 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v79) {
              goto LABEL_128;
            }
            BOOL v79 = __OFADD__(v71, v84);
            uint64_t v85 = v71 + v84;
            if (v79) {
              goto LABEL_130;
            }
            if (v85 >= v76)
            {
              uint64_t v103 = (uint64_t *)(v65 + 16 * v68);
              uint64_t v105 = *v103;
              uint64_t v104 = v103[1];
              BOOL v79 = __OFSUB__(v104, v105);
              uint64_t v106 = v104 - v105;
              if (v79) {
                goto LABEL_136;
              }
              BOOL v96 = v71 < v106;
              goto LABEL_96;
            }
          }
          else
          {
            if (v20 != 3)
            {
              uint64_t v97 = *(void *)(v19 + 32);
              uint64_t v98 = *(void *)(v19 + 40);
              BOOL v79 = __OFSUB__(v98, v97);
              uint64_t v90 = v98 - v97;
              char v91 = v79;
              goto LABEL_90;
            }
            uint64_t v70 = *(void *)(v19 + 32);
            uint64_t v69 = *(void *)(v19 + 40);
            BOOL v79 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            char v72 = v79;
          }
          if (v72) {
            goto LABEL_129;
          }
          unint64_t v80 = v20 - 2;
          uint64_t v86 = (uint64_t *)(v65 + 16 * (v20 - 2));
          uint64_t v88 = *v86;
          uint64_t v87 = v86[1];
          BOOL v89 = __OFSUB__(v87, v88);
          uint64_t v90 = v87 - v88;
          char v91 = v89;
          if (v89) {
            goto LABEL_131;
          }
          uint64_t v92 = (uint64_t *)(v65 + 16 * v68);
          uint64_t v94 = *v92;
          uint64_t v93 = v92[1];
          BOOL v79 = __OFSUB__(v93, v94);
          uint64_t v95 = v93 - v94;
          if (v79) {
            goto LABEL_133;
          }
          if (__OFADD__(v90, v95)) {
            goto LABEL_135;
          }
          if (v90 + v95 >= v71)
          {
            BOOL v96 = v71 < v95;
LABEL_96:
            if (v96) {
              unint64_t v68 = v80;
            }
            goto LABEL_98;
          }
LABEL_90:
          if (v91) {
            goto LABEL_132;
          }
          id v99 = (uint64_t *)(v65 + 16 * v68);
          uint64_t v101 = *v99;
          uint64_t v100 = v99[1];
          BOOL v79 = __OFSUB__(v100, v101);
          uint64_t v102 = v100 - v101;
          if (v79) {
            goto LABEL_134;
          }
          if (v102 < v90) {
            goto LABEL_15;
          }
LABEL_98:
          unint64_t v107 = v68 - 1;
          if (v68 - 1 >= v20)
          {
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
            goto LABEL_147;
          }
          uint64_t v108 = *a1;
          if (!*a1) {
            goto LABEL_149;
          }
          uint64_t v109 = v19;
          id v110 = (uint64_t *)(v65 + 16 * v107);
          uint64_t v111 = *v110;
          id v112 = (void *)(v65 + 16 * v68);
          uint64_t v113 = v112[1];
          uint64_t result = sub_1BBC16E2C(v108 + *(void *)(v129 + 72) * *v110, v108 + *(void *)(v129 + 72) * *v112, v108 + *(void *)(v129 + 72) * v113, v128);
          if (v2) {
            goto LABEL_119;
          }
          if (v113 < v111) {
            goto LABEL_123;
          }
          if (v68 > *(void *)(v109 + 16)) {
            goto LABEL_124;
          }
          *id v110 = v111;
          *(void *)(v65 + 16 * v107 + 8) = v113;
          unint64_t v114 = *(void *)(v109 + 16);
          if (v68 >= v114) {
            goto LABEL_125;
          }
          uint64_t v19 = v109;
          unint64_t v20 = v114 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v65 + 16 * v68), v112 + 2, 16 * (v114 - 1 - v68));
          *(void *)(v109 + 16) = v114 - 1;
          a1 = v135;
          if (v114 <= 2) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v20 = 1;
LABEL_15:
      uint64_t v12 = a1[1];
      uint64_t v18 = v134;
      if (v134 >= v12)
      {
        uint64_t v17 = v122;
        goto LABEL_108;
      }
    }
  }
  uint64_t v17 = MEMORY[0x1E4FBC860];
  unint64_t v128 = MEMORY[0x1E4FBC860]
       + ((*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80));
  if (v12 == 1)
  {
    uint64_t v122 = MEMORY[0x1E4FBC860];
    goto LABEL_13;
  }
  unint64_t v20 = *(void *)(MEMORY[0x1E4FBC860] + 16);
  uint64_t v19 = MEMORY[0x1E4FBC860];
LABEL_108:
  uint64_t v122 = v17;
  if (v20 >= 2)
  {
    uint64_t v115 = *a1;
    do
    {
      unint64_t v116 = v20 - 2;
      if (v20 < 2) {
        goto LABEL_138;
      }
      if (!v115) {
        goto LABEL_151;
      }
      uint64_t v117 = *(void *)(v19 + 32 + 16 * v116);
      uint64_t v118 = *(void *)(v19 + 32 + 16 * (v20 - 1) + 8);
      uint64_t result = sub_1BBC16E2C(v115 + *(void *)(v129 + 72) * v117, v115 + *(void *)(v129 + 72) * *(void *)(v19 + 32 + 16 * (v20 - 1)), v115 + *(void *)(v129 + 72) * v118, v128);
      if (v2) {
        break;
      }
      if (v118 < v117) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1BBC17424(v19);
        uint64_t v19 = result;
      }
      if (v116 >= *(void *)(v19 + 16)) {
        goto LABEL_140;
      }
      uint64_t v119 = (void *)(v19 + 32 + 16 * v116);
      *uint64_t v119 = v117;
      v119[1] = v118;
      unint64_t v120 = *(void *)(v19 + 16);
      if (v20 > v120) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove((void *)(v19 + 32 + 16 * (v20 - 1)), (const void *)(v19 + 32 + 16 * v20), 16 * (v120 - v20));
      *(void *)(v19 + 16) = v120 - 1;
      unint64_t v20 = v120 - 1;
    }
    while (v120 > 2);
  }
LABEL_119:
  swift_bridgeObjectRelease();
  *(void *)(v122 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC16BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = type metadata accessor for HAREntry();
  uint64_t v7 = MEMORY[0x1F4188790](v25);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v27 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v27 - 1);
    uint64_t v26 = v16;
    uint64_t v29 = v16 * v27;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v24;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_1BBC1744C(v29 + v17 + *a4, (uint64_t)v15);
      sub_1BBC1744C(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_1BBC37C88();
      sub_1BBC174B0((uint64_t)v11);
      uint64_t result = sub_1BBC174B0((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = v20 + v30 + v17;
      sub_1BBC1750C(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_1BBC1750C(v28, v21);
      v17 -= v26;
      if (v27 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBC16E2C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v35 = type metadata accessor for HAREntry();
  uint64_t v8 = MEMORY[0x1F4188790](v35);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v15 = *(void *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_59;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_60;
  }
  uint64_t v17 = (uint64_t)(a2 - a1) / v15;
  unint64_t v38 = a1;
  unint64_t v37 = a4;
  if (v17 >= v16 / v15)
  {
    uint64_t v19 = v16 / v15 * v15;
    if (a4 < a2 || a2 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v26 = a4 + v19;
    unint64_t v36 = a4 + v19;
    unint64_t v38 = a2;
    unint64_t v34 = a1;
    if (v19 >= 1 && a1 < a2)
    {
      uint64_t v28 = -v15;
      do
      {
        unint64_t v29 = a3 + v28;
        sub_1BBC1744C(v26 + v28, (uint64_t)v13);
        unint64_t v30 = a2 + v28;
        sub_1BBC1744C(a2 + v28, (uint64_t)v10);
        char v31 = sub_1BBC37C88();
        sub_1BBC174B0((uint64_t)v10);
        sub_1BBC174B0((uint64_t)v13);
        if (v31)
        {
          if (a3 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 += v28;
        }
        else
        {
          unint64_t v32 = v36;
          v36 += v28;
          if (a3 < v32 || v29 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != v32)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v30 = a2;
        }
        unint64_t v26 = v36;
        if (v36 <= a4) {
          break;
        }
        a2 = v30;
        a3 += v28;
      }
      while (v30 > v34);
    }
  }
  else
  {
    uint64_t v18 = v17 * v15;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v36 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_1BBC1744C(a2, (uint64_t)v13);
        sub_1BBC1744C(a4, (uint64_t)v10);
        char v22 = sub_1BBC37C88();
        sub_1BBC174B0((uint64_t)v10);
        sub_1BBC174B0((uint64_t)v13);
        unint64_t v23 = v38;
        if (v22)
        {
          unint64_t v24 = a2 + v15;
          if (v38 < a2 || v38 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v37 + v15;
          if (v38 < v37 || v38 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 != v37)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v37 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v38 = v23 + v15;
        a4 = v37;
        if (v37 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_1BBC17340(&v38, &v37, (uint64_t *)&v36);
  return 1;
}

char *sub_1BBC17244(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A00);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BBC17340(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for HAREntry();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1BBC17424(uint64_t a1)
{
  return sub_1BBC17244(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_1BBC17438(void *a1)
{
  return sub_1BBC15FD8(0, a1[2], 0, a1);
}

uint64_t sub_1BBC1744C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC174B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBC1750C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BBC17570(unsigned char *a1@<X8>)
{
}

void FMNFileUploadRepresentable.method.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t FMNFileUploadRepresentable.requiresBodySignature.getter()
{
  return 0;
}

uint64_t FMNFileUploadRepresentable.requiresDSIDURL.getter()
{
  return 0;
}

unint64_t FMNFileUploadRepresentable.headerDictionary.getter()
{
  return sub_1BBC054D8(MEMORY[0x1E4FBC860]);
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.fileURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.requiresBodySignature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.requiresDSIDURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t FMNMockingPreferences.domain.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMNMockingPreferences.filePath.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

FMNetworking::FMNMockingPreferences __swiftcall FMNMockingPreferences.init(domain:filePath:)(Swift::String domain, Swift::String filePath)
{
  *uint64_t v2 = domain;
  v2[1] = filePath;
  result.filePath = filePath;
  result.domain = domain;
  return result;
}

uint64_t destroy for FMNMockingPreferences()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FMNMockingPreferences(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FMNMockingPreferences(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for FMNMockingPreferences(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BBC177DC()
{
  sub_1BBC060E8();
  uint64_t result = sub_1BBC380C8();
  qword_1E9F89C40 = result;
  return result;
}

void sub_1BBC1783C(unsigned char *a1@<X8>)
{
}

uint64_t FMNRequestContentRepresentable.requiresBodySignature.getter()
{
  return 0;
}

uint64_t FMNRequestContentRepresentable.requiresDSIDURL.getter()
{
  return 0;
}

unint64_t FMNRequestContentRepresentable.headerDictionary.getter()
{
  return sub_1BBC054D8(MEMORY[0x1E4FBC860]);
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.requiresBodySignature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.requiresDSIDURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t FMNResponseSerializableCodingStrategy.dateDecodingStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBC01EFC(v1, a1, &qword_1E9F85A08);
}

uint64_t FMNResponseSerializableCodingStrategy.dateEncodingStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  return sub_1BBC01EFC(v1 + *(int *)(v3 + 20), a1, &qword_1E9F85A10);
}

uint64_t type metadata accessor for FMNResponseSerializableCodingStrategy()
{
  uint64_t result = qword_1E9F85A20;
  if (!qword_1E9F85A20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FMNResponseSerializableCodingStrategy.init(dateDecodingStrategy:dateEncodingStrategy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1BBC01F60(a1, a3, &qword_1E9F85A08);
  uint64_t v5 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  return sub_1BBC01F60(a2, a3 + *(int *)(v5 + 20), &qword_1E9F85A10);
}

uint64_t sub_1BBC17A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return static FMNResponseSerializable.decode(data:)(a1, a2, a3, a4, a5);
}

uint64_t static FMNResponseSerializable.decode(data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v36[4] = a2;
  v36[3] = a1;
  v36[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A18);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1BBC37A58();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)v36 - v18;
  sub_1BBC37A98();
  swift_allocObject();
  v36[0] = sub_1BBC37A88();
  unint64_t v20 = *(void (**)(uint64_t, uint64_t))(a4 + 48);
  v36[2] = a4;
  v20(a3, a4);
  uint64_t v21 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v9, 1, v21) == 1)
  {
    sub_1BBBFDF14((uint64_t)v9, &qword_1E9F85A18);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_4:
    uint64_t v22 = sub_1BBBFDF14((uint64_t)v12, &qword_1E9F85A08);
    goto LABEL_6;
  }
  sub_1BBC01EFC((uint64_t)v9, (uint64_t)v12, &qword_1E9F85A08);
  sub_1BBC18B64((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  sub_1BBC37A68();
  uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
LABEL_6:
  unint64_t v23 = (void *)MEMORY[0x1C18639D0](v22);
  unint64_t v24 = (void *)v36[5];
  sub_1BBC37A78();
  if (!v24) {
    return swift_release();
  }
  swift_release();
  sub_1BBC38018();
  sub_1BBC060E8();
  unint64_t v25 = (void *)sub_1BBC380B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1BBC39270;
  uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
  swift_getMetatypeMetadata();
  uint64_t v27 = sub_1BBC37EE8();
  uint64_t v29 = v28;
  uint64_t v30 = MEMORY[0x1E4FBB1A0];
  *(void *)(v26 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v31 = sub_1BBC04664();
  *(void *)(v26 + 64) = v31;
  *(void *)(v26 + 32) = v27;
  *(void *)(v26 + 40) = v29;
  uint64_t MetatypeMetadata = (uint64_t)v24;
  id v32 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6350);
  uint64_t v33 = sub_1BBC37EE8();
  *(void *)(v26 + 96) = v30;
  *(void *)(v26 + 104) = v31;
  *(void *)(v26 + 72) = v33;
  *(void *)(v26 + 80) = v34;
  sub_1BBC37D08();

  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t FMNResponseSerializable.dictionaryValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v8 = MEMORY[0x1E4FBC868];
  unint64_t v6 = (void *)MEMORY[0x1C18639D0]();
  sub_1BBC18BC0(v3, &v8, a1, a2);
  return v8;
}

uint64_t FMNResponseSerializable.data.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A18);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBC37AA8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v20 - v15;
  sub_1BBC37AE8();
  swift_allocObject();
  sub_1BBC37AD8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  uint64_t v17 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v6, 1, v17) == 1)
  {
    sub_1BBBFDF14((uint64_t)v6, &qword_1E9F85A18);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  else
  {
    sub_1BBC01EFC((uint64_t)&v6[*(int *)(v17 + 20)], (uint64_t)v9, &qword_1E9F85A10);
    sub_1BBC18B64((uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
      sub_1BBC37AB8();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
      goto LABEL_6;
    }
  }
  sub_1BBBFDF14((uint64_t)v9, &qword_1E9F85A10);
LABEL_6:
  uint64_t v18 = sub_1BBC37AC8();
  swift_release();
  return v18;
}

void KeyedDecodingContainer.compactDecode<A>(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1C18639D0]();
  sub_1BBC18630();
  if (v3)
  {
  }
  else
  {
    uint64_t v6 = v20[1];
    uint64_t v7 = (void *)MEMORY[0x1C18639D0]();
    sub_1BBC18720(v20);
    uint64_t v8 = v20[0];
    uint64_t v9 = type metadata accessor for OptionalDecodable();
    uint64_t v10 = MEMORY[0x1C1863350](v6, v9);
    uint64_t v11 = MEMORY[0x1C1863350](v8, a3);
    if (v10 == v11)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1BBC39740;
      v20[0] = a3;
      swift_getMetatypeMetadata();
      uint64_t v14 = sub_1BBC37EE8();
      uint64_t v16 = v15;
      *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v13 + 64) = sub_1BBC04664();
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = v16;
      swift_bridgeObjectRelease();
      uint64_t v17 = MEMORY[0x1E4FBB550];
      uint64_t v18 = MEMORY[0x1E4FBB5C8];
      *(void *)(v13 + 96) = MEMORY[0x1E4FBB550];
      *(void *)(v13 + 104) = v18;
      *(void *)(v13 + 72) = v10;
      *(void *)(v13 + 136) = v17;
      *(void *)(v13 + 144) = v18;
      *(void *)(v13 + 112) = v12;
      sub_1BBC060E8();
      uint64_t v19 = (void *)sub_1BBC380B8();
      sub_1BBC38028();
      sub_1BBC37CF8();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1BBC18630()
{
  return sub_1BBC382E8();
}

uint64_t sub_1BBC18720@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for OptionalDecodable();
  sub_1BBC37FF8();
  swift_getWitnessTable();
  uint64_t result = sub_1BBC37F98();
  *a1 = result;
  return result;
}

uint64_t sub_1BBC187DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v27 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v25 = v7;
  uint64_t v26 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for OptionalDecodable();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v20 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v12 = sub_1BBC385A8();
  if (v3)
  {
    uint64_t v13 = (uint64_t)a1;
  }
  else
  {
    uint64_t v21 = v11;
    uint64_t v22 = a1;
    uint64_t v23 = v9;
    uint64_t v24 = v8;
    uint64_t v14 = (void *)MEMORY[0x1C18639D0](v12);
    __swift_project_boxed_opaque_existential_1(v29, v29[3]);
    uint64_t v15 = v26;
    sub_1BBC38458();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v29);
    uint64_t v16 = v27;
    uint64_t v17 = v21;
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v21, v15, a2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v17, 0, 1, a2);
    uint64_t v18 = (uint64_t)v22;
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v28, v17, v24);
    uint64_t v13 = v18;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(v13);
}

uint64_t sub_1BBC18B44@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1BBC187DC(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_1BBC18B64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBC18BC0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v15[4] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  unint64_t v7 = v6;
  uint64_t v8 = self;
  uint64_t v9 = (void *)sub_1BBC37C58();
  v15[0] = 0;
  id v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, v15);

  if (v10)
  {
    id v11 = v15[0];
    sub_1BBC38118();
    sub_1BBC025A4(v5, v7);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6370);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      *a2 = v14;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v13 = v15[0];
    sub_1BBC37B98();

    swift_willThrow();
    return sub_1BBC025A4(v5, v7);
  }
  return result;
}

uint64_t type metadata accessor for OptionalDecodable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNResponseSerializableCodingStrategy(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBC37A58();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    id v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1BBC37AA8();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t destroy for FMNResponseSerializableCodingStrategy(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37A58();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_1BBC37AA8();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

char *initializeWithCopy for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37A58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_1BBC37AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithCopy for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37A58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_1BBC37AA8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *initializeWithTake for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37A58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_1BBC37AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithTake for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37A58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_1BBC37AA8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNResponseSerializableCodingStrategy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC19AD4);
}

uint64_t sub_1BBC19AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for FMNResponseSerializableCodingStrategy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC19BE8);
}

uint64_t sub_1BBC19BE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A08);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85A10);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_1BBC19CF4()
{
  sub_1BBC19DF4(319, &qword_1E9F85A30, MEMORY[0x1E4F26CB0]);
  if (v0 <= 0x3F)
  {
    sub_1BBC19DF4(319, qword_1E9F85A38, MEMORY[0x1E4F26D28]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1BBC19DF4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BBC380D8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t dispatch thunk of static FMNResponseSerializable.decode(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of FMNResponseSerializable.dictionaryValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FMNResponseSerializable.data.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static FMNResponseSerializable.codingStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1BBC19EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1BBC19EB4()
{
  uint64_t result = sub_1BBC380D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BBC19F44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1BBC1A080(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_1BBC1A144(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1BBC1A23C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_1BBC1A3A8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1BBC1A4A0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_1BBC1A60C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_1BBC1A7AC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x1BBC1A9E8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_1BBC1AA10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BBC380D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

FMNetworking::FMNRequestMethod_optional __swiftcall FMNRequestMethod.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BBC38268();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t FMNRequestMethod.rawValue.getter()
{
  uint64_t result = 5522759;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1414745936;
      break;
    case 2:
      uint64_t result = 5526864;
      break;
    case 3:
      uint64_t result = 0x4554454C4544;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC1AB50(unsigned __int8 *a1, char *a2)
{
  return sub_1BBC0CFCC(*a1, *a2);
}

unint64_t sub_1BBC1AB60()
{
  unint64_t result = qword_1E9F85AC0;
  if (!qword_1E9F85AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85AC0);
  }
  return result;
}

uint64_t sub_1BBC1ABB4()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1AC70()
{
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC1AD14()
{
  return sub_1BBC38598();
}

FMNetworking::FMNRequestMethod_optional sub_1BBC1ADCC(Swift::String *a1)
{
  return FMNRequestMethod.init(rawValue:)(*a1);
}

void sub_1BBC1ADD8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 5522759;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1414745936;
      goto LABEL_3;
    case 2:
      *a1 = 5526864;
      a1[1] = 0xE300000000000000;
      break;
    case 3:
      *a1 = 0x4554454C4544;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of FMNRequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of FMNRequestCredential.accountType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

unsigned char *storeEnumTagSinglePayload for FMNRequestMethod(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1BBC1AFFCLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNRequestMethod()
{
  return &type metadata for FMNRequestMethod;
}

BOOL sub_1BBC1B03C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_1BBC1B054()
{
  unint64_t result = qword_1E9F85AC8;
  if (!qword_1E9F85AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85AC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskSerializationError()
{
  return &type metadata for TaskSerializationError;
}

void *sub_1BBC1B0C0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBC37C18();
    unsigned int v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    v8((void *)((char *)a1 + v9), (void *)((char *)a2 + v9), v7);
    uint64_t v10 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    BOOL v11 = (char *)a1 + v10;
    unsigned int v12 = (char *)a2 + v10;
    uint64_t v13 = *((void *)v12 + 3);
    swift_bridgeObjectRetain();
    if (v13)
    {
      uint64_t v14 = *((void *)v12 + 4);
      *((void *)v11 + 3) = v13;
      *((void *)v11 + 4) = v14;
      (**(void (***)(char *, char *, uint64_t))(v13 - 8))(v11, v12, v13);
    }
    else
    {
      long long v16 = *((_OWORD *)v12 + 1);
      *(_OWORD *)BOOL v11 = *(_OWORD *)v12;
      *((_OWORD *)v11 + 1) = v16;
      *((void *)v11 + 4) = *((void *)v12 + 4);
    }
  }
  return a1;
}

uint64_t sub_1BBC1B220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37C18();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 24), v4);
  swift_bridgeObjectRelease();
  uint64_t result = a1 + *(int *)(a2 + 32);
  if (*(void *)(result + 24))
  {
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  }
  return result;
}

uint64_t sub_1BBC1B2E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  uint64_t v9 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void *)(v11 + 24);
  swift_bridgeObjectRetain();
  if (v12)
  {
    uint64_t v13 = *(void *)(v11 + 32);
    *(void *)(v10 + 24) = v12;
    *(void *)(v10 + 32) = v13;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8))(v10, v11, v12);
  }
  else
  {
    long long v14 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *(_OWORD *)(v10 + 16) = v14;
    *(void *)(v10 + 32) = *(void *)(v11 + 32);
  }
  return a1;
}

uint64_t sub_1BBC1B3F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  v7(a1 + a3[6], a2 + a3[6], v6);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (long long *)(a2 + v8);
  uint64_t v11 = *((void *)v10 + 3);
  if (!*(void *)(a1 + v8 + 24))
  {
    if (v11)
    {
      *(void *)(v9 + 24) = v11;
      *(void *)(v9 + 32) = *((void *)v10 + 4);
      (**(void (***)(uint64_t, long long *))(v11 - 8))(v9, v10);
      return a1;
    }
LABEL_7:
    long long v12 = *v10;
    long long v13 = v10[1];
    *(void *)(v9 + 32) = *((void *)v10 + 4);
    *(_OWORD *)uint64_t v9 = v12;
    *(_OWORD *)(v9 + 16) = v13;
    return a1;
  }
  if (!v11)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v9);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, (uint64_t *)v10);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *int v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *int v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_1BBC1B770(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  uint64_t v9 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  long long v12 = *(_OWORD *)(v11 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *(_OWORD *)(v10 + 16) = v12;
  *(void *)(v10 + 32) = *(void *)(v11 + 32);
  return a1;
}

uint64_t sub_1BBC1B834(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  if (*(void *)(a1 + v9 + 24)) {
    __swift_destroy_boxed_opaque_existential_0Tm(a1 + v9);
  }
  long long v11 = *(_OWORD *)(a2 + v9 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a2 + v9);
  *(_OWORD *)(v10 + 16) = v11;
  *(void *)(v10 + 32) = *(void *)(a2 + v9 + 32);
  return a1;
}

uint64_t sub_1BBC1B914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC1B928);
}

uint64_t sub_1BBC1B928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1BBC1B9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC1B9FC);
}

uint64_t sub_1BBC1B9FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBC37C18();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for FMNFileUploadRequest(uint64_t a1)
{
  return sub_1BBC02538(a1, (uint64_t *)&unk_1E9F85AD0);
}

uint64_t sub_1BBC1BAD8()
{
  uint64_t result = sub_1BBC37C18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *_s12FMNetworking22TaskSerializationErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1BBC1BC54);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNRequest.SerializationError()
{
  return &type metadata for FMNRequest.SerializationError;
}

uint64_t *sub_1BBC1BC8C(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1BBC37C18();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    long long v12 = (uint64_t *)((char *)v4 + v11);
    long long v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = *v13;
    unint64_t v15 = v13[1];
    sub_1BBC02290(*v13, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = *(uint64_t *)((char *)a2 + v16);
    uint64_t *v12 = v14;
    v12[1] = v15;
    *(uint64_t *)((char *)v4 + v16) = v18;
    int v19 = (char *)v4 + v17;
    uint64_t v20 = (char *)a2 + v17;
    uint64_t v21 = *((void *)v20 + 3);
    swift_bridgeObjectRetain();
    if (v21)
    {
      uint64_t v22 = *((void *)v20 + 4);
      *((void *)v19 + 3) = v21;
      *((void *)v19 + 4) = v22;
      (**(void (***)(char *, char *, uint64_t))(v21 - 8))(v19, v20, v21);
    }
    else
    {
      long long v24 = *((_OWORD *)v20 + 1);
      *(_OWORD *)int v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v24;
      *((void *)v19 + 4) = *((void *)v20 + 4);
    }
  }
  return v4;
}

unsigned char *sub_1BBC1BDF8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BBC37C18();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t *)&a1[v10];
  long long v12 = (uint64_t *)&a2[v10];
  uint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  sub_1BBC02290(*v12, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = *(void *)&a2[v15];
  *uint64_t v11 = v13;
  v11[1] = v14;
  *(void *)&a1[v15] = v17;
  uint64_t v18 = &a1[v16];
  int v19 = &a2[v16];
  uint64_t v20 = *((void *)v19 + 3);
  swift_bridgeObjectRetain();
  if (v20)
  {
    uint64_t v21 = *((void *)v19 + 4);
    *((void *)v18 + 3) = v20;
    *((void *)v18 + 4) = v21;
    (**(void (***)(unsigned char *, unsigned char *, uint64_t))(v20 - 8))(v18, v19, v20);
  }
  else
  {
    long long v22 = *((_OWORD *)v19 + 1);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v22;
    *((void *)v18 + 4) = *((void *)v19 + 4);
  }
  return a1;
}

unsigned char *sub_1BBC1BF14(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BBC37C18();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t *)&a1[v10];
  long long v12 = (uint64_t *)&a2[v10];
  uint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  sub_1BBC02290(*v12, v14);
  uint64_t v15 = *v11;
  unint64_t v16 = v11[1];
  *uint64_t v11 = v13;
  v11[1] = v14;
  sub_1BBC025A4(v15, v16);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (uint64_t)&a1[v17];
  int v19 = &a2[v17];
  uint64_t v20 = *((void *)v19 + 3);
  if (!*(void *)&a1[v17 + 24])
  {
    if (v20)
    {
      *(void *)(v18 + 24) = v20;
      *(void *)(v18 + 32) = *((void *)v19 + 4);
      (**(void (***)(uint64_t, unsigned char *))(v20 - 8))(v18, v19);
      return a1;
    }
LABEL_7:
    long long v21 = *(_OWORD *)v19;
    long long v22 = *((_OWORD *)v19 + 1);
    *(void *)(v18 + 32) = *((void *)v19 + 4);
    *(_OWORD *)uint64_t v18 = v21;
    *(_OWORD *)(v18 + 16) = v22;
    return a1;
  }
  if (!v20)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v18);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v18, (uint64_t *)v19);
  return a1;
}

unsigned char *sub_1BBC1C06C(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BBC37C18();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  uint64_t v11 = a3[8];
  long long v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)long long v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  return a1;
}

unsigned char *sub_1BBC1C128(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BBC37C18();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void *)&a1[v10];
  unint64_t v12 = *(void *)&a1[v10 + 8];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  sub_1BBC025A4(v11, v12);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  long long v14 = &a1[v13];
  if (*(void *)&a1[v13 + 24]) {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&a1[v13]);
  }
  long long v15 = *(_OWORD *)&a2[v13 + 16];
  *(_OWORD *)long long v14 = *(_OWORD *)&a2[v13];
  *((_OWORD *)v14 + 1) = v15;
  *((void *)v14 + 4) = *(void *)&a2[v13 + 32];
  return a1;
}

uint64_t sub_1BBC1C20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC1C220);
}

uint64_t sub_1BBC1C220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1BBC1C2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC1C2F8);
}

uint64_t sub_1BBC1C2F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBC37C18();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

unint64_t sub_1BBC1C3BC()
{
  unint64_t result = qword_1E9F85AE0;
  if (!qword_1E9F85AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85AE0);
  }
  return result;
}

unint64_t sub_1BBC1C414()
{
  unint64_t result = qword_1E9F85AE8;
  if (!qword_1E9F85AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85AE8);
  }
  return result;
}

Swift::String_optional __swiftcall FMNRedirectHostStore.redirectedHost()()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v2 = *v0;
  sub_1BBC06128(v1, (uint64_t)v13);
  uint64_t v3 = swift_allocObject();
  long long v4 = v13[1];
  *(_OWORD *)(v3 + 16) = v13[0];
  *(_OWORD *)(v3 + 32) = v4;
  *(_OWORD *)(v3 + 48) = v13[2];
  *(void *)(v3 + 64) = v14;
  *(void *)(v3 + 72) = &v15;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_1BBBF9CFC;
  *(void *)(v5 + 24) = v3;
  aBlock[4] = sub_1BBBF9CAC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBF9C7C;
  aBlock[3] = &block_descriptor_9;
  uint64_t v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync(v2, v6);
  _Block_release(v6);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  uint64_t v7 = swift_release();
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = v15;
    uint64_t v10 = v16;
    swift_release();
    uint64_t v7 = v9;
    uint64_t v8 = v10;
  }
  result.value._object = v8;
  result.value._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t sub_1BBC1C5F4()
{
  if (*v0) {
    return 0x64496E6F73726570;
  }
  else {
    return 1953722216;
  }
}

uint64_t sub_1BBC1C628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC1D480(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BBC1C650(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1BBC1C65C(uint64_t a1)
{
  unint64_t v2 = sub_1BBC1CB68();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC1C698(uint64_t a1)
{
  unint64_t v2 = sub_1BBC1CB68();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t FMNRedirectedHost.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85AF0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  v10[1] = *(void *)(v1 + 24);
  _OWORD v10[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC1CB68();
  sub_1BBC385C8();
  char v12 = 0;
  uint64_t v8 = v10[3];
  sub_1BBC38328();
  if (!v8)
  {
    char v11 = 1;
    sub_1BBC38328();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t FMNRedirectedHost.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85B00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC1CB68();
  sub_1BBC385B8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = sub_1BBC382A8();
  uint64_t v11 = v10;
  char v19 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1BBC382A8();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC1CA50@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return FMNRedirectedHost.init(from:)(a1, a2);
}

uint64_t sub_1BBC1CA68(void *a1)
{
  return FMNRedirectedHost.encode(to:)(a1);
}

uint64_t FMNRedirectHostStore.credential.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBFA360(v1 + 8, a1);
}

uint64_t sub_1BBC1CA8C()
{
  return objectdestroyTm_0(72);
}

Swift::Void __swiftcall FMNRedirectHostStore.clearRedirectedHostKeychainItems()()
{
}

void sub_1BBC1CABC()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (id)sub_1BBC37E88();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);
}

uint64_t sub_1BBC1CB50()
{
  return objectdestroyTm_0(80);
}

uint64_t sub_1BBC1CB58()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1BBC1CB68()
{
  unint64_t result = qword_1E9F85AF8;
  if (!qword_1E9F85AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85AF8);
  }
  return result;
}

uint64_t sub_1BBC1CBBC()
{
  return objectdestroyTm_0(72);
}

void sub_1BBC1CBC4()
{
}

Swift::Void __swiftcall FMNRedirectHostStore.saveRedirectedHost(host:)(Swift::String host)
{
  uint64_t v2 = v1;
  object = host._object;
  uint64_t countAndFlagsBits = host._countAndFlagsBits;
  uint64_t v5 = sub_1BBC37D28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBC37D58();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *v2;
  sub_1BBC06128((uint64_t)v2, (uint64_t)v18);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = countAndFlagsBits;
  *(void *)(v13 + 24) = object;
  long long v14 = v18[1];
  *(_OWORD *)(v13 + 32) = v18[0];
  *(_OWORD *)(v13 + 48) = v14;
  *(_OWORD *)(v13 + 64) = v18[2];
  *(void *)(v13 + 80) = v19;
  aBlock[4] = sub_1BBC1D190;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_21;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_1BBC37D48();
  void v16[2] = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v12, v8, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
}

uint64_t sub_1BBC1CEA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3[4];
  uint64_t v6 = a3[5];
  __swift_project_boxed_opaque_existential_1(a3 + 1, v5);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
  swift_bridgeObjectRetain();
  v7(v5, v6);
  sub_1BBC37AE8();
  swift_allocObject();
  sub_1BBC37AD8();
  sub_1BBC1D564();
  uint64_t v8 = sub_1BBC37AC8();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BBC38DE0;
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v11 + 64) = sub_1BBC04664();
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  id v13 = objc_msgSend(self, sel_standardUserDefaults);
  long long v14 = (void *)sub_1BBC37C58();
  uint64_t v15 = (void *)sub_1BBC37E88();
  objc_msgSend(v13, sel_setValue_forKey_, v14, v15);

  sub_1BBC025A4(v8, v10);
  return swift_release();
}

uint64_t sub_1BBC1D140()
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  swift_release();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1BBC1D190()
{
  return sub_1BBC1CEA8(v0[2], v0[3], v0 + 4);
}

ValueMetadata *type metadata accessor for FMNRedirectedHost()
{
  return &type metadata for FMNRedirectedHost;
}

uint64_t assignWithCopy for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  __swift_destroy_boxed_opaque_existential_0Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_release();
  return a1;
}

unsigned char *storeEnumTagSinglePayload for FMNRedirectedHost.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BBC1D340);
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

ValueMetadata *type metadata accessor for FMNRedirectedHost.CodingKeys()
{
  return &type metadata for FMNRedirectedHost.CodingKeys;
}

unint64_t sub_1BBC1D37C()
{
  unint64_t result = qword_1E9F85B08;
  if (!qword_1E9F85B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B08);
  }
  return result;
}

unint64_t sub_1BBC1D3D4()
{
  unint64_t result = qword_1E9F85B10;
  if (!qword_1E9F85B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B10);
  }
  return result;
}

unint64_t sub_1BBC1D42C()
{
  unint64_t result = qword_1E9F85B18;
  if (!qword_1E9F85B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B18);
  }
  return result;
}

uint64_t sub_1BBC1D480(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953722216 && a2 == 0xE400000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64496E6F73726570 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_1BBC1D564()
{
  unint64_t result = qword_1E9F85B20;
  if (!qword_1E9F85B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B20);
  }
  return result;
}

uint64_t sub_1BBC1D5B8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1BBC1D5FC()
{
  unint64_t result = qword_1E9F85B28;
  if (!qword_1E9F85B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B28);
  }
  return result;
}

uint64_t FMNPreferenceKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BBC38268();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t FMNPreferenceKey.rawValue.getter()
{
  return 0x53656C6946657355;
}

uint64_t sub_1BBC1D6E8()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1D748()
{
  return sub_1BBC37F08();
}

uint64_t sub_1BBC1D76C()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1D7C8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BBC38268();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1BBC1D81C(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 14) = -4864;
}

uint64_t FMNURLSessionFactory.mockSessionCreationBlock.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1BBC0700C(v1);
  return v1;
}

__n128 FMNURLSessionFactory.__allocating_init(mockSessionCreationBlock:preferences:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  __n128 result = *(__n128 *)a3;
  long long v8 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)a3;
  *(_OWORD *)(v6 + 48) = v8;
  return result;
}

uint64_t FMNURLSessionFactory.init(mockSessionCreationBlock:preferences:)(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  long long v4 = a3[1];
  *(_OWORD *)(v3 + 32) = *a3;
  *(_OWORD *)(v3 + 48) = v4;
  return v3;
}

unint64_t sub_1BBC1D8D8()
{
  unint64_t result = qword_1E9F85B30;
  if (!qword_1E9F85B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B30);
  }
  return result;
}

void sub_1BBC1D92C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BBC37C18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + 40))
  {
    sub_1BBBFAC70(a1, (uint64_t)v5);
    unint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    if (v10(v5, 1, v6) == 1)
    {
      sub_1BBBFABBC((uint64_t)v5);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      char v11 = sub_1BBC37BA8();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v11 & 1) == 0)
      {
        __break(1u);
        return;
      }
    }
    id v12 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
    swift_bridgeObjectRetain();
    id v13 = (void *)sub_1BBC37E88();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v12, sel_initWithSuiteName_, v13);

    if (v10((char *)a1, 1, v6) == 1)
    {
      if (!v14) {
        return;
      }
      id v15 = v14;
      unint64_t v16 = (void *)sub_1BBC37E88();
      objc_msgSend(v15, sel_removeObjectForKey_, v16);
    }
    else
    {
      if (!v14) {
        return;
      }
      id v17 = v14;
      unint64_t v16 = (void *)sub_1BBC37E88();
      objc_msgSend(v17, sel_setBool_forKey_, 1, v16);
    }
  }
}

uint64_t *FMNURLSessionFactory.deinit()
{
  sub_1BBBFA06C(v0[2]);
  sub_1BBC1D5B8(v0[4], v0[5]);
  return v0;
}

uint64_t FMNURLSessionFactory.__deallocating_deinit()
{
  sub_1BBBFA06C(v0[2]);
  sub_1BBC1D5B8(v0[4], v0[5]);

  return MEMORY[0x1F4186488](v0, 64, 7);
}

unint64_t sub_1BBC1DC4C()
{
  unint64_t result = qword_1E9F85B38;
  if (!qword_1E9F85B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B38);
  }
  return result;
}

uint64_t dispatch thunk of FMNetworkingURLSession.dataTask(with:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of FMNetworkingURLSession.uploadTask(with:fromFile:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of FMNetworkingURLSession.finishTasksAndInvalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for FMNPreferenceKey()
{
  return &type metadata for FMNPreferenceKey;
}

uint64_t method lookup function for FMNURLSessionFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNURLSessionFactory);
}

uint64_t dispatch thunk of FMNURLSessionFactory.__allocating_init(mockSessionCreationBlock:preferences:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FMNURLSessionFactory.session(_:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of FMNURLSessionFactory.fileServer(fileURL:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

unsigned char *_s12FMNetworking16FMNPreferenceKeyOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BBC1DE18);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNURLSessionFactory.URLSessionFactoryError()
{
  return &type metadata for FMNURLSessionFactory.URLSessionFactoryError;
}

unint64_t sub_1BBC1DE54()
{
  unint64_t result = qword_1E9F85B40;
  if (!qword_1E9F85B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B40);
  }
  return result;
}

id MockURLDataTask.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockURLDataTask();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MockURLDataTask()
{
  return self;
}

uint64_t method lookup function for MockURLDataTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MockURLDataTask);
}

unint64_t FMNetworkingPreferenceDomain.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_1BBC1DFD0()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1E058()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1E134()
{
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC1E1F0()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC1E274()
{
  return sub_1BBC38598();
}

BOOL static FMNServerInteractionController.FMNServerInteractionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FMNServerInteractionController.FMNServerInteractionError.hash(into:)()
{
  return sub_1BBC38588();
}

uint64_t FMNServerInteractionController.FMNServerInteractionError.hashValue.getter()
{
  return sub_1BBC38598();
}

FMNetworking::FMNServerInteractionController::InternalServerMetadata::HeaderKeys_optional __swiftcall FMNServerInteractionController.InternalServerMetadata.HeaderKeys.init(rawValue:)(Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_1BBC38268();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *objc_super v2 = v5;
  return result;
}

unint64_t FMNServerInteractionController.InternalServerMetadata.HeaderKeys.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC1E4B4(unsigned __int8 *a1, char *a2)
{
  return sub_1BBC0CB84(*a1, *a2);
}

uint64_t sub_1BBC1E4C0()
{
  return sub_1BBC1E058();
}

uint64_t sub_1BBC1E4C8()
{
  return sub_1BBC1E134();
}

uint64_t sub_1BBC1E4D0()
{
  return sub_1BBC1E274();
}

FMNetworking::FMNServerInteractionController::InternalServerMetadata::HeaderKeys_optional sub_1BBC1E4D8(Swift::String *a1)
{
  return FMNServerInteractionController.InternalServerMetadata.HeaderKeys.init(rawValue:)(*a1);
}

unint64_t sub_1BBC1E4E4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = FMNServerInteractionController.InternalServerMetadata.HeaderKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t FMNServerInteractionController.InternalServerMetadata.errorCode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BBC37DC8();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t FMNServerInteractionController.InternalServerMetadata.requestUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  return sub_1BBC01EFC(v1 + *(int *)(v3 + 20), a1, &qword_1EB9F68D8);
}

uint64_t FMNServerInteractionController.InternalServerMetadata.respondingInstance.getter()
{
  uint64_t v1 = *(void *)(v0
                 + *(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMNServerInteractionController.InternalServerMetadata.dateEpoch.getter()
{
  return *(void *)(v0
                   + *(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 28));
}

uint64_t FMNServerInteractionController.InternalServerMetadata.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BBC37CE8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v11 - v7;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_1BBC381D8();
  sub_1BBC37F18();
  uint64_t v9 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  sub_1BBC01EFC(v0 + *(int *)(v9 + 20), (uint64_t)v3, &qword_1EB9F68D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1BBC37CD8();
    sub_1BBC37CB8();
    sub_1BBBFDF14((uint64_t)v3, &qword_1EB9F68D8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  }
  sub_1BBC077F0(&qword_1EB9F6388, MEMORY[0x1E4F27990]);
  sub_1BBC38368();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_1BBC37F18();
  swift_bridgeObjectRetain();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37F18();
  sub_1BBC37DC8();
  sub_1BBC077F0(&qword_1EB9F6390, MEMORY[0x1E4F97E20]);
  sub_1BBC38368();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  return v11[0];
}

uint64_t FMNServerInteractionController.FMNResponseFields.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1BBC02290(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t FMNServerInteractionController.FMNResponseFields.statusCode.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t FMNServerInteractionController.FMNResponseFields.responseHeaders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMNServerInteractionController.FMNResponseFields.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  return sub_1BBC01EFC(v1 + *(int *)(v3 + 28), a1, &qword_1EB9F68D0);
}

uint64_t FMNServerInteractionController.FMNResponseFields.metadata.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FMNServerInteractionController.FMNResponseFields(0) + 28);

  return sub_1BBC1EA5C(a1, v3);
}

uint64_t sub_1BBC1EA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*FMNServerInteractionController.FMNResponseFields.metadata.modify())()
{
  return nullsub_1;
}

uint64_t FMNServerInteractionController.FMNResponseFields.init(data:statusCode:responseHeaders:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = (uint64_t)a6 + *(int *)(type metadata accessor for FMNServerInteractionController.FMNResponseFields(0) + 28);
  uint64_t v13 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;

  return sub_1BBC1EA5C(a5, v12);
}

uint64_t FMNServerInteractionController.FMNResponseFields.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_1BBC381D8();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "statusCode: ");
  BYTE5(v8[1]) = 0;
  HIWORD(v8[1]) = -5120;
  v7[1] = *(void *)(v0 + 16);
  sub_1BBC38368();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37F18();
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  sub_1BBC01EFC(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_1EB9F68D0);
  uint64_t v5 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) == 1)
  {
    sub_1BBBFDF14((uint64_t)v3, &qword_1EB9F68D0);
  }
  else
  {
    FMNServerInteractionController.InternalServerMetadata.description.getter();
    sub_1BBC046B8((uint64_t)v3, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  }
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37F18();
  swift_bridgeObjectRetain();
  sub_1BBC37E58();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8[0];
}

uint64_t FMNServerInteractionController.mockingPreferences.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[13];
  uint64_t v3 = v1[14];
  uint64_t v4 = v1[15];
  uint64_t v5 = v1[16];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_1BBC07788(v2, v3);
}

uint64_t sub_1BBC1EE10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1BBC37C18();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  uint64_t v8 = type metadata accessor for FMNMockClientURLSession();
  swift_allocObject();
  uint64_t result = FMNMockClientURLSession.init(httpArchiveFileURL:)((uint64_t)v6);
  a2[3] = v8;
  a2[4] = (uint64_t)&protocol witness table for FMNMockClientURLSession;
  *a2 = result;
  return result;
}

uint64_t FMNServerInteractionController.__allocating_init(authenticationProvider:mockingPreferences:urlSessionFactory:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  FMNServerInteractionController.init(authenticationProvider:mockingPreferences:urlSessionFactory:)(a1, a2, a3, a4);
  return v8;
}

uint64_t FMNServerInteractionController.deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6878);
  sub_1BBC38078();
  swift_unknownObjectRelease();

  sub_1BBBFDF14(v0 + 48, &qword_1EB9F6620);
  sub_1BBC1D5B8(*(void *)(v0 + 104), *(void *)(v0 + 112));
  swift_release();
  return v0;
}

uint64_t sub_1BBC1F018@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(void **)(result + 32);
  if (v3)
  {
    MEMORY[0x1F4188790](result);
    id v4 = v3;
    swift_retain();
    sub_1BBC37D18();

    uint64_t result = swift_release();
  }
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_1BBC1F0FC@<X0>(BOOL *a1@<X8>)
{
  return sub_1BBC1F018(v1, a1);
}

uint64_t FMNServerInteractionController.__deallocating_deinit()
{
  FMNServerInteractionController.deinit();

  return MEMORY[0x1F4186488](v0, 144, 7);
}

uint64_t sub_1BBC1F14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1BBBFA360(a1, (uint64_t)v13);
  sub_1BBBFA360(a2, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a6;
  swift_retain();
  sub_1BBC0EC34((uint64_t)v11, (uint64_t)v12, sub_1BBC01688, v9, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v13, &qword_1E9F85998);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

uint64_t sub_1BBC1F23C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC1F274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1BBBFA360(a1, (uint64_t)v16);
  sub_1BBBFA360(a2, (uint64_t)v17);
  sub_1BBBFA360((uint64_t)v16, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v17, (uint64_t)v15);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  sub_1BBBFA360((uint64_t)v15, (uint64_t)v13);
  sub_1BBBFA360((uint64_t)v12, (uint64_t)v10);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a4;
  v8[3] = a5;
  swift_retain();
  sub_1BBC0EC34((uint64_t)v10, (uint64_t)v11, sub_1BBC22658, v8, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v12, &qword_1E9F85998);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  sub_1BBBFDF14((uint64_t)v16, &qword_1E9F85998);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_1BBC1F3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), void *a5, uint64_t a6)
{
  sub_1BBBFA360(a1, (uint64_t)v13);
  sub_1BBBFA360(a2, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  sub_1BBC0EC34((uint64_t)v11, (uint64_t)v12, a4, a5, a6);
  sub_1BBBFDF14((uint64_t)v13, &qword_1E9F85998);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

uint64_t sub_1BBC1F484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_1BBBFA360(a1, (uint64_t)v14);
  sub_1BBBFA360(a2, (uint64_t)v15);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  sub_1BBBFA360((uint64_t)v15, (uint64_t)v13);
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = a6;
  v10[3] = a7;
  swift_retain();
  sub_1BBBFDA48((uint64_t)v12, (uint64_t)v13, sub_1BBC22658, v10, 0, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v14, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
}

uint64_t sub_1BBC1F578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1BBBFA360(a1, (uint64_t)v17);
  sub_1BBBFA360(a2, (uint64_t)v18);
  sub_1BBBFA360((uint64_t)v17, (uint64_t)v15);
  sub_1BBBFA360((uint64_t)v18, (uint64_t)v16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  sub_1BBBFA360((uint64_t)v15, (uint64_t)v13);
  sub_1BBBFA360((uint64_t)v16, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_1BBC22638;
  v9[3] = v8;
  swift_retain();
  swift_retain();
  sub_1BBBFDA48((uint64_t)v11, (uint64_t)v12, sub_1BBC22658, v9, 0, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v13, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  swift_release();
  sub_1BBBFDF14((uint64_t)v17, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
}

uint64_t sub_1BBC1F710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1BBBFA360(a1, (uint64_t)v16);
  sub_1BBBFA360(a2, (uint64_t)v17);
  sub_1BBBFA360((uint64_t)v16, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v17, (uint64_t)v15);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  sub_1BBBFA360((uint64_t)v15, (uint64_t)v13);
  sub_1BBBFA360((uint64_t)v12, (uint64_t)v10);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a4;
  v8[3] = a5;
  swift_retain();
  sub_1BBBFDA48((uint64_t)v10, (uint64_t)v11, sub_1BBC22658, v8, 0, 0);
  swift_release();
  sub_1BBBFDF14((uint64_t)v12, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  sub_1BBBFDF14((uint64_t)v16, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_1BBC1F86C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  sub_1BBBFA360(a1, (uint64_t)v13);
  sub_1BBBFA360(a2, (uint64_t)v14);
  sub_1BBBFA360((uint64_t)v13, (uint64_t)v11);
  sub_1BBBFA360((uint64_t)v14, (uint64_t)v12);
  sub_1BBBFDA48((uint64_t)v11, (uint64_t)v12, a4, a5, a6, 0);
  sub_1BBBFDF14((uint64_t)v13, &qword_1EB9F6630);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

unint64_t sub_1BBC1F928(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6378);
    uint64_t v2 = (void *)sub_1BBC38258();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v11 = MEMORY[0x1E4FBB1A0];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1BBC22614();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    long long v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1BBC038B4(v6, v7);
    sub_1BBC038B4(v7, v40);
    sub_1BBC038B4(v40, &v38);
    unint64_t result = sub_1BBC03458(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      id v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1BBC038B4(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1BBC038B4(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1BBC1FC94(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_1BBC38218();
      }
      uint64_t v7 = (uint64_t)sub_1BBC21D74(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        unint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_1BBC1FEE4(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

unsigned __int8 *sub_1BBC1FEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1BBC37F78();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1BBC21FF0();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_1BBC38218();
  }
LABEL_7:
  uint64_t v11 = sub_1BBC21D74(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1BBC1FFD0()
{
  unint64_t result = qword_1E9F85B50;
  if (!qword_1E9F85B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B50);
  }
  return result;
}

unint64_t sub_1BBC20028()
{
  unint64_t result = qword_1E9F85B58;
  if (!qword_1E9F85B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B58);
  }
  return result;
}

uint64_t method lookup function for FMNServerInteractionController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNServerInteractionController);
}

uint64_t dispatch thunk of FMNServerInteractionController.__allocating_init(authenticationProvider:mockingPreferences:urlSessionFactory:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FMNServerInteractionController.upload(endpoint:content:source:responseHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryUpload(consolidatedContent:redirectedHostStore:responseHandler:retryCount:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of FMNServerInteractionController.sendRequest(endpoint:content:source:credential:responseHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryRequest(consolidatedContent:redirectedHostStore:responseHandler:retryCount:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryRequest(with:redirectedHostStore:responseHandler:retryCount:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.FMNServerInteractionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMNServerInteractionController.FMNServerInteractionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1BBC20300);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNServerInteractionController.FMNServerInteractionError()
{
  return &type metadata for FMNServerInteractionController.FMNServerInteractionError;
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerInteractionController.InternalServerMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBC37DC8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1BBC37CE8();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    unsigned int v20 = (char *)a1 + v16;
    uint64_t v21 = (char *)a2 + v16;
    v20[8] = v21[8];
    *(void *)unsigned int v20 = *(void *)v21;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37DC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1BBC37CE8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  *(unsigned char *)(v20 + 8) = *((unsigned char *)v21 + 8);
  *(void *)uint64_t v20 = v22;
  return a1;
}

uint64_t initializeWithTake for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37DC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1BBC37CE8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  return a1;
}

uint64_t assignWithTake for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBC37DC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1BBC37CE8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  return a1;
}

uint64_t sub_1BBC20A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37DC8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_1BBC20BAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1BBC37DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

unsigned char *storeEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata.HeaderKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1BBC20D90);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNServerInteractionController.InternalServerMetadata.HeaderKeys()
{
  return &type metadata for FMNServerInteractionController.InternalServerMetadata.HeaderKeys;
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1BBC02290(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    int v13 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
    uint64_t v14 = *((void *)v13 - 1);
    int v15 = *(unsigned int (**)(char *, uint64_t, int *))(v14 + 48);
    swift_bridgeObjectRetain();
    if (v15(v12, 1, v13))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
      memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v18 = sub_1BBC37DC8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v11, v12, v18);
      uint64_t v19 = v13[5];
      uint64_t v20 = &v11[v19];
      uint64_t v21 = &v12[v19];
      uint64_t v22 = sub_1BBC37CE8();
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
        memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      uint64_t v25 = v13[6];
      char v26 = &v11[v25];
      uint64_t v27 = &v12[v25];
      uint64_t v28 = *((void *)v27 + 1);
      *(void *)char v26 = *(void *)v27;
      *((void *)v26 + 1) = v28;
      uint64_t v29 = v13[7];
      uint64_t v30 = &v11[v29];
      int64_t v31 = &v12[v29];
      v30[8] = v31[8];
      *(void *)uint64_t v30 = *(void *)v31;
      uint64_t v32 = *(void (**)(char *, void, uint64_t, int *))(v14 + 56);
      swift_bridgeObjectRetain();
      v32(v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t *assignWithCopy for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1BBC02290(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1BBC025A4(v8, v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  int v13 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t v14 = *((void *)v13 - 1);
  int v15 = *(uint64_t (**)(char *, uint64_t, int *))(v14 + 48);
  LODWORD(v7) = v15(v11, 1, v13);
  int v16 = v15(v12, 1, v13);
  if (!v7)
  {
    if (v16)
    {
      sub_1BBC046B8((uint64_t)v11, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
      goto LABEL_7;
    }
    uint64_t v25 = sub_1BBC37DC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(v11, v12, v25);
    uint64_t v26 = v13[5];
    uint64_t v27 = &v11[v26];
    uint64_t v28 = &v12[v26];
    uint64_t v29 = sub_1BBC37CE8();
    uint64_t v30 = *(void *)(v29 - 8);
    int64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    uint64_t v51 = v27;
    LODWORD(v27) = v31(v27, 1, v29);
    int v32 = v31(v28, 1, v29);
    if (v27)
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v51, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v51, 0, 1, v29);
        goto LABEL_18;
      }
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8) - 8) + 64);
      uint64_t v34 = v51;
    }
    else
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v51, v28, v29);
        goto LABEL_18;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v51, v29);
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8) - 8) + 64);
      uint64_t v34 = v51;
    }
    memcpy(v34, v28, v33);
LABEL_18:
    uint64_t v43 = v13[6];
    uint64_t v44 = &v11[v43];
    unint64_t v45 = &v12[v43];
    *(void *)uint64_t v44 = *(void *)v45;
    *((void *)v44 + 1) = *((void *)v45 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v46 = v13[7];
    uint64_t v47 = &v11[v46];
    uint64_t v48 = &v12[v46];
    uint64_t v49 = *(void *)v48;
    v47[8] = v48[8];
    *(void *)uint64_t v47 = v49;
    return a1;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    memcpy(v11, v12, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  uint64_t v17 = sub_1BBC37DC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v11, v12, v17);
  uint64_t v18 = v13[5];
  uint64_t v19 = &v11[v18];
  uint64_t v20 = &v12[v18];
  uint64_t v21 = sub_1BBC37CE8();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v35 = v13[6];
  uint64_t v36 = &v11[v35];
  uint64_t v37 = &v12[v35];
  *(void *)uint64_t v36 = *(void *)v37;
  *((void *)v36 + 1) = *((void *)v37 + 1);
  uint64_t v38 = v13[7];
  uint64_t v39 = &v11[v38];
  uint64_t v40 = &v12[v38];
  uint64_t v41 = *(void *)v40;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = v41;
  uint64_t v42 = *(void (**)(char *, void, uint64_t, int *))(v14 + 56);
  swift_bridgeObjectRetain();
  v42(v11, 0, 1, v13);
  return a1;
}

_OWORD *initializeWithTake for FMNServerInteractionController.FMNResponseFields(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t v9 = *((void *)v8 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_1BBC37DC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v6, v7, v11);
    uint64_t v12 = v8[5];
    int v13 = &v6[v12];
    uint64_t v14 = &v7[v12];
    uint64_t v15 = sub_1BBC37CE8();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    *(_OWORD *)&v6[v8[6]] = *(_OWORD *)&v7[v8[6]];
    uint64_t v18 = v8[7];
    uint64_t v19 = &v6[v18];
    uint64_t v20 = &v7[v18];
    v19[8] = v20[8];
    *(void *)uint64_t v19 = *(void *)v20;
    (*(void (**)(char *, void, uint64_t, int *))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t *assignWithTake for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1BBC025A4(v6, v7);
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  uint64_t v13 = *((void *)v12 - 1);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, int *))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1BBC046B8((uint64_t)v10, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
      goto LABEL_7;
    }
    uint64_t v25 = sub_1BBC37DC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v10, v11, v25);
    uint64_t v26 = v12[5];
    uint64_t v27 = &v10[v26];
    uint64_t v28 = &v11[v26];
    uint64_t v29 = sub_1BBC37CE8();
    uint64_t v30 = *(void *)(v29 - 8);
    int64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    uint64_t v47 = v27;
    LODWORD(v27) = v31(v27, 1, v29);
    int v32 = v31(v28, 1, v29);
    if (v27)
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v47, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v47, 0, 1, v29);
        goto LABEL_18;
      }
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8) - 8) + 64);
      uint64_t v34 = v47;
    }
    else
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 40))(v47, v28, v29);
        goto LABEL_18;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v47, v29);
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8) - 8) + 64);
      uint64_t v34 = v47;
    }
    memcpy(v34, v28, v33);
LABEL_18:
    uint64_t v38 = v12[6];
    uint64_t v39 = &v10[v38];
    uint64_t v40 = &v11[v38];
    uint64_t v42 = *(void *)v40;
    uint64_t v41 = *((void *)v40 + 1);
    *(void *)uint64_t v39 = v42;
    *((void *)v39 + 1) = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = v12[7];
    uint64_t v44 = &v10[v43];
    unint64_t v45 = &v11[v43];
    *(void *)uint64_t v44 = *(void *)v45;
    v44[8] = v45[8];
    return a1;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    memcpy(v10, v11, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  uint64_t v17 = sub_1BBC37DC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v10, v11, v17);
  uint64_t v18 = v12[5];
  uint64_t v19 = &v10[v18];
  uint64_t v20 = &v11[v18];
  uint64_t v21 = sub_1BBC37CE8();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D8);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(_OWORD *)&v10[v12[6]] = *(_OWORD *)&v11[v12[6]];
  uint64_t v35 = v12[7];
  uint64_t v36 = &v10[v35];
  uint64_t v37 = &v11[v35];
  v36[8] = v37[8];
  *(void *)uint64_t v36 = *(void *)v37;
  (*(void (**)(char *, void, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1BBC21C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1BBC21CC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F68D0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

unsigned __int8 *sub_1BBC21D74(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (int64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1BBC21FF0()
{
  unint64_t v0 = sub_1BBC37F88();
  uint64_t v4 = sub_1BBC22070(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1BBC22070(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1BBC221C8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1BBC222C8(v9, 0);
      unint64_t v12 = sub_1BBC22330((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1BBC38218();
LABEL_4:
        JUMPOUT(0x1C1863270);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1C1863270](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1C1863270]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1BBC221C8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_1BBC22544(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1BBC22544(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

void *sub_1BBC222C8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85B60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_1BBC22330(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1BBC22544(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1BBC37F58();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1BBC38218();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_1BBC22544(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1BBC37F28();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1BBC22544(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1BBC37F68();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x1C18632B0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_1BBC225C0()
{
  unint64_t result = qword_1EB9F63B0;
  if (!qword_1EB9F63B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F63B0);
  }
  return result;
}

uint64_t sub_1BBC22614()
{
  return swift_release();
}

uint64_t sub_1BBC2261C()
{
  return sub_1BBC24478(*(void *)(v0 + 16));
}

unint64_t sub_1BBC2265C(char a1)
{
  unint64_t result = 6712678;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x707041666D66;
      break;
    case 2:
      unint64_t result = 1885957478;
      break;
    case 3:
      unint64_t result = 0x6972695370696D66;
      break;
    case 4:
      unint64_t result = 0x7075746573;
      break;
    case 5:
      unint64_t result = 0x6150686372616573;
      break;
    case 6:
      unint64_t result = 0x4C676E6972696170;
      break;
    case 7:
      unint64_t result = 0x726F737365636361;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x7373656363413277;
      break;
    case 10:
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0x6F4C657275636573;
      break;
    case 13:
      unint64_t result = 0x726168536D657469;
      break;
    case 14:
      unint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC22838@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_1BBC055FC(v1 + 16, a1);
}

uint64_t sub_1BBC22884(uint64_t a1)
{
  swift_beginAccess();
  sub_1BBC228D8(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t sub_1BBC228D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1BBC22940())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC22994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37B78();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 160))(v6);
}

uint64_t sub_1BBC22A80(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  swift_beginAccess();
  uint64_t v4 = sub_1BBC37B78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1BBC22B0C())()
{
  return j_j__swift_endAccess;
}

uint64_t FMNHTTPRequest.__allocating_init(hostName:scheme:path:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(void *)(v4 + 48) = 0;
  *(unsigned char *)(v4 + 56) = 14;
  sub_1BBC37B68();
  swift_beginAccess();
  sub_1BBC37B58();
  MEMORY[0x1C1862EA0](a1, a2);
  sub_1BBC37B48();
  swift_endAccess();
  return v4;
}

uint64_t sub_1BBC22C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 168))(v7);
  swift_bridgeObjectRetain();
  MEMORY[0x1C1862EA0](a1, a2);
  return v5(v7, 0);
}

unint64_t sub_1BBC22CD4()
{
  uint64_t v1 = sub_1BBC37B78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_1BBC381D8();
  uint64_t v5 = swift_bridgeObjectRelease();
  unint64_t v12 = 0xD000000000000011;
  unint64_t v13 = 0x80000001BBC3CAB0;
  (*(void (**)(uint64_t))(*(void *)v0 + 152))(v5);
  sub_1BBC22F7C();
  sub_1BBC38368();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  sub_1BBC37F18();
  unint64_t v7 = v12;
  unint64_t v6 = v13;
  unint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_1BBC381D8();
  uint64_t v8 = swift_bridgeObjectRelease();
  strcpy((char *)v14, "accountType: ");
  v14[7] = -4864;
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)v0 + 128))(&v12, v8);
  sub_1BBC2265C(v12);
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1BBC37F18();
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)v0 + 104))(&v12, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6628);
  sub_1BBC37EE8();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  unint64_t v12 = v7;
  unint64_t v13 = v6;
  swift_bridgeObjectRetain();
  sub_1BBC37F18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_1BBC22F7C()
{
  unint64_t result = qword_1EB9F6550;
  if (!qword_1EB9F6550)
  {
    sub_1BBC37B78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F6550);
  }
  return result;
}

uint64_t FMNHTTPRequest.__deallocating_deinit()
{
  sub_1BBBF9364(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  uint64_t v2 = sub_1BBC37B78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

unint64_t sub_1BBC2307C()
{
  return sub_1BBC22CD4();
}

uint64_t sub_1BBC230A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 104))();
}

uint64_t sub_1BBC230E4(uint64_t a1, uint64_t a2)
{
  sub_1BBC055FC(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 112))(v4);
}

void *sub_1BBC23140@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 128))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1BBC2319C(char *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(*(void *)v2 + 136))(&v4);
}

uint64_t sub_1BBC231F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 152))();
}

uint64_t sub_1BBC2323C()
{
  return type metadata accessor for FMNHTTPRequest();
}

uint64_t method lookup function for FMNHTTPRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNHTTPRequest);
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of FMNHTTPRequest.__allocating_init(hostName:scheme:path:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FMNHTTPRequest.redirect(host:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of FMNHTTPRequest.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

id FMNHttpClient.__allocating_init(credential:urlSessionFactory:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_1BBC0701C(a1, a2);
  swift_release();
  return v6;
}

uint64_t sub_1BBC2342C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1BBC37C18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for FMNFileUploadRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3 + v9[6], v5);
  sub_1BBC379E8();
  sub_1BBC379B8();
  sub_1BBC01EFC(v3 + v9[8], (uint64_t)&v38, &qword_1EB9F6628);
  if (!v39)
  {
    uint64_t v43 = v2;
    sub_1BBBFDF14((uint64_t)&v38, &qword_1EB9F6628);
    goto LABEL_27;
  }
  sub_1BBBFAC58(&v38, (uint64_t)v40);
  uint64_t v10 = v41;
  uint64_t v11 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v10, v11);
  if (!*(void *)(result + 16))
  {
    swift_bridgeObjectRelease();
    sub_1BBC26D94();
    swift_allocError();
    *uint64_t v34 = 1;
    swift_willThrow();
    uint64_t v35 = sub_1BBC37A48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(a1, v35);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  }
  uint64_t v36 = v9;
  uint64_t v37 = v3;
  uint64_t v43 = v2;
  int64_t v13 = 0;
  uint64_t v14 = result + 64;
  uint64_t v15 = 1 << *(unsigned char *)(result + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  uint64_t v17 = v16 & *(void *)(result + 64);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v17 &= v17 - 1;
      goto LABEL_7;
    }
    int64_t v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v19 >= v18) {
      goto LABEL_25;
    }
    uint64_t v20 = *(void *)(v14 + 8 * v19);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v19 + 1;
      if (v19 + 1 >= v18) {
        goto LABEL_25;
      }
      uint64_t v20 = *(void *)(v14 + 8 * v13);
      if (!v20)
      {
        int64_t v13 = v19 + 2;
        if (v19 + 2 >= v18) {
          goto LABEL_25;
        }
        uint64_t v20 = *(void *)(v14 + 8 * v13);
        if (!v20)
        {
          int64_t v13 = v19 + 3;
          if (v19 + 3 >= v18) {
            goto LABEL_25;
          }
          uint64_t v20 = *(void *)(v14 + 8 * v13);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v17 = (v20 - 1) & v20;
LABEL_7:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BBC37A38();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v18) {
    goto LABEL_25;
  }
  uint64_t v20 = *(void *)(v14 + 8 * v21);
  if (v20)
  {
    int64_t v13 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_54;
    }
    if (v13 >= v18) {
      break;
    }
    uint64_t v20 = *(void *)(v14 + 8 * v13);
    ++v21;
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_25:
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  uint64_t v9 = v36;
  uint64_t v3 = v37;
LABEL_27:
  uint64_t v22 = *(void *)(v3 + v9[7]);
  uint64_t v25 = *(void *)(v22 + 64);
  uint64_t v24 = v22 + 64;
  uint64_t v23 = v25;
  uint64_t v26 = 1 << *(unsigned char *)(*(void *)(v3 + v9[7]) + 32);
  uint64_t v27 = -1;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  uint64_t v28 = v27 & v23;
  int64_t v29 = (unint64_t)(v26 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v30 = 0;
  while (2)
  {
    if (v28)
    {
      v28 &= v28 - 1;
LABEL_31:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BBC37A38();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  int64_t v31 = v30 + 1;
  if (__OFADD__(v30, 1))
  {
    __break(1u);
    goto LABEL_52;
  }
  if (v31 >= v29) {
    return swift_release();
  }
  uint64_t v32 = *(void *)(v24 + 8 * v31);
  ++v30;
  if (v32) {
    goto LABEL_48;
  }
  int64_t v30 = v31 + 1;
  if (v31 + 1 >= v29) {
    return swift_release();
  }
  uint64_t v32 = *(void *)(v24 + 8 * v30);
  if (v32) {
    goto LABEL_48;
  }
  int64_t v30 = v31 + 2;
  if (v31 + 2 >= v29) {
    return swift_release();
  }
  uint64_t v32 = *(void *)(v24 + 8 * v30);
  if (v32) {
    goto LABEL_48;
  }
  int64_t v30 = v31 + 3;
  if (v31 + 3 >= v29) {
    return swift_release();
  }
  uint64_t v32 = *(void *)(v24 + 8 * v30);
  if (v32)
  {
LABEL_48:
    uint64_t v28 = (v32 - 1) & v32;
    goto LABEL_31;
  }
  int64_t v33 = v31 + 4;
  if (v33 >= v29) {
    return swift_release();
  }
  uint64_t v32 = *(void *)(v24 + 8 * v33);
  if (v32)
  {
    int64_t v30 = v33;
    goto LABEL_48;
  }
  while (1)
  {
    int64_t v30 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v30 >= v29) {
      return swift_release();
    }
    uint64_t v32 = *(void *)(v24 + 8 * v30);
    ++v33;
    if (v32) {
      goto LABEL_48;
    }
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t static FMNHttpClient.StatusCode.unauthorized.getter()
{
  return 401;
}

uint64_t static FMNHttpClient.StatusCode.redirected.getter()
{
  return 330;
}

uint64_t sub_1BBC2394C@<X0>(void *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1BBC26CC0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v6;
  return sub_1BBC0700C(v4);
}

uint64_t sub_1BBC239EC(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t v4 = *a1;
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  swift_retain();
  a3(v4, sub_1BBC26C4C, v7);

  return swift_release();
}

uint64_t sub_1BBC23A84(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1BBC26C88;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1BBC0700C(v3);
  return sub_1BBBFA06C(v8);
}

uint64_t sub_1BBC23B4C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, void *))
{
  uint64_t v10 = a1;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[0] = sub_1BBC26C90;
  v9[1] = v7;
  swift_retain();
  a4(&v10, v9);

  return swift_release();
}

uint64_t sub_1BBC23BF0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1BBC0700C(*v1);
  return v2;
}

uint64_t sub_1BBC23C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_1BBBFA06C(v6);
}

uint64_t (*sub_1BBC23CAC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBC23D08(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC23D74()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BBC23DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBC23E2C())()
{
  return j__swift_endAccess;
}

id FMNHttpClient.init(credential:urlSessionFactory:)(uint64_t a1, uint64_t a2)
{
  id v2 = sub_1BBC0701C(a1, a2);
  swift_release();
  return v2;
}

id FMNHttpClient.__deallocating_deinit()
{
  swift_retain();
  sub_1BBC37D18();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMNHttpClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BBC240B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1BBC37D28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1BBC37D58();
  uint64_t v12 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v4 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = v15;
  void v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_1BBBFAD50;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_3;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBC37D48();
  uint64_t v21 = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_1BBC243C8(void *a1, void *a2, uint64_t (*a3)(void, void))
{
  return a3(*a1, *a2);
}

uint64_t sub_1BBC243F8()
{
  return swift_release();
}

uint64_t sub_1BBC24478(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session;
  swift_beginAccess();
  sub_1BBC01EFC(v1, (uint64_t)&v8, &qword_1EB9F6578);
  if (*((void *)&v9 + 1))
  {
    sub_1BBBFA360((uint64_t)&v8, (uint64_t)v5);
    sub_1BBBFDF14((uint64_t)&v8, &qword_1EB9F6578);
    uint64_t v2 = v6;
    uint64_t v3 = v7;
    __swift_project_boxed_opaque_existential_1(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  }
  else
  {
    sub_1BBBFDF14((uint64_t)&v8, &qword_1EB9F6578);
  }
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  swift_beginAccess();
  sub_1BBBFFB60((uint64_t)&v8, v1, &qword_1EB9F6578);
  return swift_endAccess();
}

uint64_t sub_1BBC24594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BBC2524C(a1, a2, a3, a4, (uint64_t)&unk_1F14FC050, (uint64_t)sub_1BBC26E5C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBC245DC);
}

void sub_1BBC245DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v6 = MEMORY[0x1F4188790](v49);
  long long v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v48 = (char *)&v40 - v9;
  uint64_t v10 = sub_1BBC37B78();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BBC37C18();
  uint64_t v50 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v47 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  uint64_t v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  char v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 56))(v16, v17);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (v18)
  {
    uint64_t v21 = &v57[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
    swift_beginAccess();
    sub_1BBC01EFC((uint64_t)v21, (uint64_t)v54, &qword_1EB9F6628);
    uint64_t v20 = v55;
    if (v55)
    {
      uint64_t v22 = v56;
      __swift_project_boxed_opaque_existential_1(v54, v55);
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v20, v22);
      uint64_t v20 = v23;
      sub_1BBBFDF14((uint64_t)v54, &qword_1EB9F6628);
    }
    else
    {
      sub_1BBBFDF14((uint64_t)v54, &qword_1EB9F6628);
      uint64_t v19 = 0;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  if (v20)
  {
    uint64_t v24 = sub_1BBC37B38();
    uint64_t v45 = v14;
    v54[0] = v24;
    v54[1] = v25;
    v53[0] = (void *)16421;
    v53[1] = (void *)0xE200000000000000;
    uint64_t v51 = v19;
    uint64_t v52 = v20;
    sub_1BBC05470();
    uint64_t v44 = v11;
    uint64_t v26 = v10;
    uint64_t v27 = MEMORY[0x1E4FBB1A0];
    sub_1BBC380F8();
    swift_bridgeObjectRelease();
    sub_1BBC37B48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1BBC38DE0;
    sub_1BBC37B08();
    uint64_t v29 = sub_1BBC37EE8();
    uint64_t v31 = v30;
    *(void *)(v28 + 56) = v27;
    uint64_t v10 = v26;
    uint64_t v11 = v44;
    *(void *)(v28 + 64) = sub_1BBC04664();
    *(void *)(v28 + 32) = v29;
    *(void *)(v28 + 40) = v31;
    uint64_t v14 = v45;
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    uint64_t v32 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();
  }
  sub_1BBC37B08();
  uint64_t v33 = v50;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v8, 1, v14) == 1)
  {
    sub_1BBBFDF14((uint64_t)v8, (uint64_t *)&unk_1EB9F6558);
    sub_1BBC26630();
    swift_allocError();
    *uint64_t v34 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v35 = (uint64_t)v47;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v47, v8, v14);
    uint64_t v36 = swift_bridgeObjectRelease();
    MEMORY[0x1F4188790](v36);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6568);
    uint64_t v37 = v46;
    sub_1BBC37D18();
    if (v37)
    {
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v14);
    }
    else
    {
      uint64_t v38 = swift_release();
      v53[0] = 0;
      uint64_t v39 = (void *)MEMORY[0x1C18639D0](v38);
      sub_1BBC24BF8(v41, v35, v57, v53, v54, v42, v43);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v54);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v14);
    }
  }
}

uint64_t sub_1BBC24BF8(void *a1, uint64_t a2, void *a3, void **a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = a7;
  uint64_t v59 = a6;
  uint64_t v58 = a5;
  uint64_t v61 = a4;
  char v72 = a3;
  uint64_t v68 = a2;
  uint64_t v8 = sub_1BBC37A48();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v62 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  unint64_t v63 = (char *)&v58 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v70 = (char *)&v58 - v13;
  uint64_t v14 = sub_1BBC37C18();
  uint64_t v71 = *(void *)(v14 - 8);
  uint64_t v15 = v71;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v67 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v58 - v18;
  uint64_t v20 = type metadata accessor for FMNFileUploadRequest(0);
  uint64_t v21 = (int *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  uint64_t v24 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v25);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v24 + 40))(&v74, v25, v24);
  LODWORD(v66) = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v68, v14);
  uint64_t v26 = a1[3];
  uint64_t v27 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v26);
  uint64_t v28 = v67;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
  uint64_t v29 = (uint64_t)v72 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1BBC01EFC(v29, (uint64_t)v73, &qword_1EB9F6628);
  uint64_t v30 = a1[3];
  uint64_t v31 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v30);
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
  v23[v21[7]] = (char)v66;
  uint64_t v33 = &v23[v21[8]];
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
  uint64_t v66 = v19;
  v34(v33, v19, v14);
  uint64_t v68 = v14;
  v34(v23, v28, v14);
  sub_1BBC04984((uint64_t)v73, (uint64_t)&v23[v21[10]]);
  *(void *)&v23[v21[9]] = v32;
  uint64_t v35 = a1[3];
  uint64_t v36 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v35);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v36 + 48))(v35, v36)) {
    uint64_t v37 = (uint64_t)v63;
  }
  else {
    uint64_t v37 = (uint64_t)v62;
  }
  uint64_t v38 = v69;
  sub_1BBC2342C(v37);
  if (v38) {
    return sub_1BBC04718((uint64_t)v23, type metadata accessor for FMNFileUploadRequest);
  }
  uint64_t v69 = 0;
  (*(void (**)(void))(v64 + 32))();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_1BBC38DE0;
  uint64_t v41 = sub_1BBC05664();
  uint64_t v43 = v42;
  *(void *)(v40 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v40 + 64) = sub_1BBC04664();
  *(void *)(v40 + 32) = v41;
  *(void *)(v40 + 40) = v43;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v44 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  uint64_t v45 = a1[3];
  uint64_t v46 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v45);
  uint64_t v47 = v66;
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v46);
  uint64_t v48 = v58[3];
  uint64_t v49 = v58[4];
  __swift_project_boxed_opaque_existential_1(v58, v48);
  uint64_t v50 = (void *)swift_allocObject();
  uint64_t v51 = v72;
  uint64_t v52 = v59;
  v50[2] = v72;
  v50[3] = v52;
  v50[4] = v60;
  uint64_t v53 = *(uint64_t (**)(char *, char *, uint64_t (*)(uint64_t, unint64_t, char *, void *), void *, uint64_t, uint64_t))(v49 + 16);
  id v54 = v51;
  swift_retain();
  uint64_t v55 = v53(v70, v47, sub_1BBBF9C78, v50, v48, v49);
  swift_release();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v68);
  uint64_t v56 = v61;
  uint64_t v57 = *v61;
  void *v61 = (void *)v55;

  if (*v56) {
    objc_msgSend(*v56, sel_resume);
  }
  (*(void (**)(char *, uint64_t))(v64 + 8))(v70, v65);
  return sub_1BBC04718((uint64_t)v23, type metadata accessor for FMNFileUploadRequest);
}

uint64_t sub_1BBC25204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BBC2524C(a1, a2, a3, a4, (uint64_t)&unk_1F14FC078, (uint64_t)sub_1BBC26684, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBC03918);
}

uint64_t sub_1BBC2524C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  swift_retain();
  a7(a1, a2, a6, v13);
  return swift_release();
}

uint64_t sub_1BBC252E8(uint64_t a1, void (*a2)(void **))
{
  uint64_t v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (void **)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6A30);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (void **)((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BBC01EFC(a1, (uint64_t)v13, &qword_1EB9F6A30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = *v13;
    *uint64_t v10 = *v13;
    (*(void (**)(void **, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F97E08], v7);
    id v15 = v14;
    a2(v10);

    return (*(uint64_t (**)(void **, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_1BBBFFADC((uint64_t)v13, (uint64_t)v6);
    sub_1BBC00048((uint64_t)v6, (uint64_t)v10, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
    (*(void (**)(void **, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F97E10], v7);
    a2(v10);
    (*(void (**)(void **, uint64_t))(v8 + 8))(v10, v7);
    return sub_1BBC04718((uint64_t)v6, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
  }
}

uint64_t sub_1BBC25574@<X0>(uint64_t a1@<X8>)
{
  uint64_t v89 = a1;
  uint64_t v2 = sub_1BBC37ED8();
  int64_t v90 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BBC37A48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v10 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  uint64_t result = sub_1BBC04C14((uint64_t)v8);
  if (v1) {
    return result;
  }
  int64_t v12 = v90;
  uint64_t v86 = v9;
  uint64_t v87 = 0;
  uint64_t v88 = v6;
  uint64_t v13 = (NSString *)sub_1BBC37E88();
  Class v14 = NSClassFromString(v13);

  if (v14) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v88 + 32))(v89, v8, v5);
  }
  id v15 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  uint64_t v16 = sub_1BBC379D8();
  uint64_t v17 = v5;
  uint64_t v18 = v8;
  if (!v16) {
    goto LABEL_11;
  }
  if (!*(void *)(v16 + 16) || (sub_1BBC03458(0x7A69726F68747541, 0xED00006E6F697461), (v19 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v85 = v17;
  sub_1BBC37EC8();
  uint64_t v20 = sub_1BBC37EA8();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v17 = v85;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v2);
  if (v22 >> 60 == 15)
  {
LABEL_11:
    sub_1BBC26630();
    swift_allocError();
    unsigned char *v25 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v18, v17);
  }
  uint64_t v84 = v20;
  uint64_t v23 = sub_1BBC37A18();
  if (v24 >> 60 == 15)
  {
    sub_1BBC054C4(v84, v22);
    uint64_t v17 = v85;
    goto LABEL_11;
  }
  uint64_t v26 = v23;
  unint64_t v27 = v24;
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA58]), sel_init);
  unint64_t v83 = v22;
  uint64_t v29 = (void *)sub_1BBC37C58();
  objc_msgSend(v28, sel_appendData_, v29);

  uint64_t v82 = v26;
  unint64_t v81 = v27;
  uint64_t v30 = (void *)sub_1BBC37C58();
  objc_msgSend(v28, sel_appendData_, v30);

  id v80 = v28;
  id v31 = objc_msgSend(v28, sel_fm_sha256Hash);
  uint64_t v32 = sub_1BBC37C78();
  unint64_t v34 = v33;

  uint64_t v35 = dispatch_group_create();
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = 0;
  uint64_t v37 = (id *)(v36 + 16);
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = MEMORY[0x1E4FBC868];
  dispatch_group_enter(v35);
  id v39 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v79 = v32;
  unint64_t v78 = v34;
  int64_t v90 = sub_1BBC37C58();
  uint64_t v40 = (void *)swift_allocObject();
  _OWORD v40[2] = v35;
  void v40[3] = v36;
  v40[4] = v38;
  aBlock[4] = sub_1BBC26D84;
  aBlock[5] = v40;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBC264E0;
  aBlock[3] = &block_descriptor_92;
  uint64_t v41 = _Block_copy(aBlock);
  uint64_t v42 = v35;
  uint64_t v77 = v36;
  swift_retain();
  uint64_t v76 = v38;
  uint64_t v43 = v38 + 16;
  swift_retain();
  swift_release();
  uint64_t v44 = (void *)v90;
  objc_msgSend(v39, sel_signatureHeadersWithData_completion_, v90, v41);
  uint64_t v45 = v41;
  uint64_t v46 = v37;
  _Block_release(v45);

  uint64_t v75 = v42;
  sub_1BBC38048();
  swift_beginAccess();
  uint64_t v47 = v89;
  if (!*(void *)(*(void *)v43 + 16))
  {
    LODWORD(v90) = sub_1BBC38018();
    uint64_t v48 = (void *)sub_1BBC380B8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_1BBC39270;
    swift_beginAccess();
    id v91 = *v46;
    id v50 = v91;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85C40);
    uint64_t v51 = sub_1BBC37EE8();
    uint64_t v52 = v46;
    uint64_t v54 = v53;
    uint64_t v55 = MEMORY[0x1E4FBB1A0];
    *(void *)(v49 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v56 = sub_1BBC04664();
    *(void *)(v49 + 64) = v56;
    *(void *)(v49 + 32) = v51;
    *(void *)(v49 + 40) = v54;
    uint64_t v86 = v43;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_1BBC37E58();
    uint64_t v59 = v58;
    swift_bridgeObjectRelease();
    *(void *)(v49 + 96) = v55;
    *(void *)(v49 + 104) = v56;
    *(void *)(v49 + 72) = v57;
    *(void *)(v49 + 80) = v59;
    uint64_t v46 = v52;
    sub_1BBC37D08();

    swift_bridgeObjectRelease();
    uint64_t v60 = *v52;
    uint64_t v61 = *v52;
    uint64_t v62 = (uint64_t)*v52;
    if (!*v52)
    {
      sub_1BBC26630();
      uint64_t v62 = swift_allocError();
      *unint64_t v63 = 3;
      uint64_t v61 = *v52;
    }
    void *v52 = (void *)v62;
    id v64 = v60;

    uint64_t v43 = v86;
    uint64_t v47 = v89;
  }
  swift_beginAccess();
  if (*v46)
  {
    aBlock[8] = 3;
    sub_1BBC38368();
    sub_1BBC37A38();
    swift_bridgeObjectRelease();
  }
  uint64_t v65 = *(void *)v43 + 64;
  uint64_t v66 = 1 << *(unsigned char *)(*(void *)v43 + 32);
  uint64_t v67 = -1;
  if (v66 < 64) {
    uint64_t v67 = ~(-1 << v66);
  }
  uint64_t v68 = v67 & *(void *)(*(void *)v43 + 64);
  int64_t v90 = (unint64_t)(v66 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v69 = 0;
  while (1)
  {
    if (v68)
    {
      v68 &= v68 - 1;
      goto LABEL_23;
    }
    int64_t v70 = v69 + 1;
    if (__OFADD__(v69, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    uint64_t v71 = v88;
    if (v70 >= v90) {
      goto LABEL_39;
    }
    uint64_t v72 = *(void *)(v65 + 8 * v70);
    ++v69;
    if (!v72)
    {
      int64_t v69 = v70 + 1;
      if (v70 + 1 >= v90) {
        goto LABEL_39;
      }
      uint64_t v72 = *(void *)(v65 + 8 * v69);
      if (!v72)
      {
        int64_t v69 = v70 + 2;
        if (v70 + 2 >= v90) {
          goto LABEL_39;
        }
        uint64_t v72 = *(void *)(v65 + 8 * v69);
        if (!v72) {
          break;
        }
      }
    }
LABEL_38:
    uint64_t v68 = (v72 - 1) & v72;
LABEL_23:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BBC37A38();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v73 = v70 + 3;
  if (v73 >= v90)
  {
LABEL_39:
    swift_release();
    sub_1BBC054C4(v84, v83);
    sub_1BBC054C4(v82, v81);

    sub_1BBC025A4(v79, v78);
    (*(void (**)(uint64_t, char *, uint64_t))(v71 + 32))(v47, v18, v85);
    swift_release();
    return swift_release();
  }
  uint64_t v72 = *(void *)(v65 + 8 * v73);
  if (v72)
  {
    int64_t v69 = v73;
    goto LABEL_38;
  }
  while (1)
  {
    int64_t v69 = v73 + 1;
    if (__OFADD__(v73, 1)) {
      break;
    }
    if (v69 >= v90) {
      goto LABEL_39;
    }
    uint64_t v72 = *(void *)(v65 + 8 * v69);
    ++v73;
    if (v72) {
      goto LABEL_38;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1BBC25F1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t *))
{
  uint64_t v4 = a2;
  uint64_t v5 = a1;
  return a3(&v5, &v4);
}

id FMNHttpClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void FMNHttpClient.init()()
{
}

uint64_t FMNHttpClient.urlSession(_:didReceive:completionHandler:)(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t, void), uint64_t a4)
{
  id v31 = a3;
  uint64_t v32 = a4;
  uint64_t v29 = a2;
  uint64_t v5 = sub_1BBC37D28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBC37D58();
  uint64_t v30 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BBC37D38();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  id v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (uint64_t *)(v4 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (!*v16) {
    return v31(1, 0);
  }
  uint64_t v28 = v9;
  uint64_t v18 = v16[1];
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FBCB48], v12);
  swift_retain();
  uint64_t v27 = sub_1BBC380A8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  char v19 = (void *)swift_allocObject();
  void v19[2] = v17;
  v19[3] = v18;
  uint64_t v20 = v29;
  unint64_t v21 = v31;
  uint64_t v22 = v32;
  v19[4] = v29;
  v19[5] = v21;
  v19[6] = v22;
  aBlock[4] = sub_1BBBFD8DC;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_17;
  uint64_t v23 = _Block_copy(aBlock);
  sub_1BBC0700C(v17);
  id v24 = v20;
  swift_retain();
  sub_1BBC37D48();
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1BBC06FC4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  uint64_t v25 = (void *)v27;
  MEMORY[0x1C1863400](0, v11, v8, v23);
  _Block_release(v23);

  sub_1BBBFA06C(v17);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v28);
  return swift_release();
}

void sub_1BBC2640C(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t *)(a5 + 16);
  swift_beginAccess();
  uint64_t v10 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = a2;
  id v11 = a2;

  if (a1)
  {
    uint64_t v12 = a1;
  }
  else
  {
    swift_beginAccess();
    uint64_t v12 = *v9;
    swift_bridgeObjectRetain();
  }
  swift_beginAccess();
  *uint64_t v9 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dispatch_group_leave(a3);
}

uint64_t sub_1BBC264E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_1BBC37E48();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC26580()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC265B8()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBC265F8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1BBC26630()
{
  unint64_t result = qword_1E9F85B90;
  if (!qword_1E9F85B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85B90);
  }
  return result;
}

uint64_t sub_1BBC26684(uint64_t a1)
{
  return sub_1BBC252E8(a1, *(void (**)(void **))(v1 + 16));
}

uint64_t sub_1BBC266AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of FMNRequestConfigurating.accountType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestConfigurating.urlComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for FMNHttpClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNHttpClient);
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FMNHttpClient.__allocating_init(credential:urlSessionFactory:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of FMNHttpClient.registerHandler(for:handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of FMNHttpClient.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of FMNHttpClient.upload(requestContent:urlComponents:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of FMNHttpClient.fetch(requestContent:urlComponents:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

ValueMetadata *type metadata accessor for FMNHttpClient.ErrorCode()
{
  return &type metadata for FMNHttpClient.ErrorCode;
}

ValueMetadata *type metadata accessor for FMNHttpClient.StatusCode()
{
  return &type metadata for FMNHttpClient.StatusCode;
}

unsigned char *storeEnumTagSinglePayload for FMNHttpClient.ClientError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1BBC26B38);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNHttpClient.ClientError()
{
  return &type metadata for FMNHttpClient.ClientError;
}

unint64_t sub_1BBC26B74()
{
  unint64_t result = qword_1E9F85C38;
  if (!qword_1E9F85C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85C38);
  }
  return result;
}

uint64_t sub_1BBC26BC8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC26C04()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBC26C3C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC26C4C(uint64_t a1, uint64_t a2)
{
  int v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_1BBC26C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BBC23B4C(a1, a2, a3, *(void (**)(uint64_t *, void *))(v3 + 16));
}

uint64_t sub_1BBC26C90(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1BBC26CC0(uint64_t *a1, uint64_t *a2)
{
  return sub_1BBC239EC(a1, a2, *(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))(v2 + 16));
}

uint64_t sub_1BBC26CCC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC26D04()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBC26D3C()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BBC26D84(uint64_t a1, void *a2)
{
  sub_1BBC2640C(a1, a2, *(NSObject **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

unint64_t sub_1BBC26D94()
{
  unint64_t result = qword_1E9F85C50;
  if (!qword_1E9F85C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85C50);
  }
  return result;
}

uint64_t sub_1BBC26DE8(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1BBC26E18()
{
  return sub_1BBC2261C();
}

ValueMetadata *type metadata accessor for HARv1dot2()
{
  return &type metadata for HARv1dot2;
}

uint64_t *sub_1BBC26E88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBC37CA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    id v11 = (char *)a2 + v8;
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = *((void *)v11 + 3);
    *((void *)v10 + 2) = *((void *)v11 + 2);
    *((void *)v10 + 3) = v13;
    uint64_t v14 = *((void *)v11 + 5);
    *((void *)v10 + 4) = *((void *)v11 + 4);
    *((void *)v10 + 5) = v14;
    uint64_t v15 = *((void *)v11 + 7);
    *((void *)v10 + 6) = *((void *)v11 + 6);
    *((void *)v10 + 7) = v15;
    *((void *)v10 + 8) = *((void *)v11 + 8);
    *(_OWORD *)(v10 + 72) = *(_OWORD *)(v11 + 72);
    uint64_t v16 = *((void *)v11 + 12);
    *((void *)v10 + 11) = *((void *)v11 + 11);
    *((void *)v10 + 12) = v16;
    uint64_t v17 = (char *)a1 + v9;
    uint64_t v18 = (char *)a2 + v9;
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    uint64_t v19 = *((void *)v18 + 3);
    *((void *)v17 + 2) = *((void *)v18 + 2);
    *((void *)v17 + 3) = v19;
    uint64_t v20 = *((void *)v18 + 5);
    *((void *)v17 + 4) = *((void *)v18 + 4);
    *((void *)v17 + 5) = v20;
    uint64_t v21 = *((void *)v18 + 7);
    *((void *)v17 + 6) = *((void *)v18 + 6);
    *((void *)v17 + 7) = v21;
    uint64_t v22 = *((void *)v18 + 9);
    *((void *)v17 + 8) = *((void *)v18 + 8);
    *((void *)v17 + 9) = v22;
    *((_OWORD *)v17 + 5) = *((_OWORD *)v18 + 5);
    uint64_t v23 = *((void *)v18 + 13);
    *((void *)v17 + 12) = *((void *)v18 + 12);
    *((void *)v17 + 13) = v23;
    *((void *)v17 + 14) = *((void *)v18 + 14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1BBC2706C(uint64_t a1)
{
  uint64_t v2 = sub_1BBC37CA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC2715C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v24 = a1;
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  uint64_t v11 = *(void *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = v11;
  uint64_t v12 = *(void *)(v10 + 24);
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(void *)(v9 + 24) = v12;
  uint64_t v13 = *(void *)(v10 + 40);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(void *)(v9 + 40) = v13;
  uint64_t v14 = *(void *)(v10 + 56);
  *(void *)(v9 + 48) = *(void *)(v10 + 48);
  *(void *)(v9 + 56) = v14;
  *(void *)(v9 + 64) = *(void *)(v10 + 64);
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
  uint64_t v15 = *(void *)(v10 + 96);
  *(void *)(v9 + 88) = *(void *)(v10 + 88);
  *(void *)(v9 + 96) = v15;
  uint64_t v16 = a1 + v8;
  uint64_t v17 = a2 + v8;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  uint64_t v18 = *(void *)(v17 + 24);
  *(void *)(v16 + 16) = *(void *)(v17 + 16);
  *(void *)(v16 + 24) = v18;
  uint64_t v19 = *(void *)(v17 + 40);
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  *(void *)(v16 + 40) = v19;
  uint64_t v20 = *(void *)(v17 + 56);
  *(void *)(v16 + 48) = *(void *)(v17 + 48);
  *(void *)(v16 + 56) = v20;
  uint64_t v21 = *(void *)(v17 + 72);
  *(void *)(v16 + 64) = *(void *)(v17 + 64);
  *(void *)(v16 + 72) = v21;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v17 + 80);
  uint64_t v22 = *(void *)(v17 + 104);
  *(void *)(v16 + 96) = *(void *)(v17 + 96);
  *(void *)(v16 + 104) = v22;
  *(void *)(v16 + 112) = *(void *)(v17 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v24;
}

uint64_t sub_1BBC272F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[9] = v9[9];
  v8[10] = v9[10];
  v8[11] = v9[11];
  v8[12] = v9[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *(void *)(a2 + v10);
  v11[1] = *(void *)(a2 + v10 + 8);
  void v11[2] = *(void *)(a2 + v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[3] = v12[3];
  v11[4] = v12[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[5] = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v11[6] = v12[6];
  v11[7] = v12[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[8] = v12[8];
  v11[9] = v12[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[10] = v12[10];
  v11[11] = v12[11];
  v11[12] = v12[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[13] = v12[13];
  v11[14] = v12[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BBC27540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 96) = *(void *)(v10 + 96);
  long long v12 = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  *(_OWORD *)(v9 + 80) = v12;
  long long v13 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v13;
  uint64_t v14 = a1 + v8;
  uint64_t v15 = a2 + v8;
  long long v16 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(v15 + 64);
  *(_OWORD *)(v14 + 80) = v16;
  *(_OWORD *)(v14 + 96) = *(_OWORD *)(v15 + 96);
  *(void *)(v14 + 112) = *(void *)(v15 + 112);
  long long v17 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v17;
  long long v18 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(v14 + 48) = v18;
  return a1;
}

uint64_t sub_1BBC2760C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *(void *)uint64_t v8 = *(void *)(a2 + v7);
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(void *)(v8 + 24) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v9 + 40);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(v8 + 40) = v12;
  swift_bridgeObjectRelease();
  *(void *)(v8 + 48) = *(void *)(v9 + 48);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
  uint64_t v13 = *(void *)(v9 + 96);
  *(void *)(v8 + 88) = *(void *)(v9 + 88);
  *(void *)(v8 + 96) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + 32);
  *(void *)(v15 + 24) = *(void *)(v16 + 24);
  *(void *)(v15 + 32) = v17;
  swift_bridgeObjectRelease();
  *(void *)(v15 + 40) = *(void *)(v16 + 40);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(v16 + 56);
  *(void *)(v15 + 48) = *(void *)(v16 + 48);
  *(void *)(v15 + 56) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v16 + 72);
  *(void *)(v15 + 64) = *(void *)(v16 + 64);
  *(void *)(v15 + 72) = v19;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v16 + 80);
  *(void *)(v15 + 96) = *(void *)(v16 + 96);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v16 + 112);
  *(void *)(v15 + 104) = *(void *)(v16 + 104);
  *(void *)(v15 + 112) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BBC27794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBC277A8);
}

uint64_t sub_1BBC277A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBC37CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1BBC2786C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBC27880);
}

uint64_t sub_1BBC27880(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBC37CA8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for HAREntry()
{
  uint64_t result = qword_1E9F85CC0;
  if (!qword_1E9F85CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBC2798C()
{
  uint64_t result = sub_1BBC37CA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BBC27A2C()
{
  uint64_t v0 = sub_1BBC37ED8();
  __swift_allocate_value_buffer(v0, qword_1E9F89C48);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F89C48);
  return sub_1BBC37EC8();
}

uint64_t sub_1BBC27A78(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85CD0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC28A0C();
  sub_1BBC385C8();
  long long v8 = *(_OWORD *)(v2 + 16);
  v10[0] = *(_OWORD *)v2;
  v10[1] = v8;
  _OWORD v10[2] = *(_OWORD *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 48);
  sub_1BBC28A60();
  sub_1BBC38348();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1BBC27BD8()
{
  return 6778732;
}

uint64_t sub_1BBC27BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1BBC38448();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_1BBC27C70(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1BBC27C7C(uint64_t a1)
{
  unint64_t v2 = sub_1BBC28A0C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC27CB8(uint64_t a1)
{
  unint64_t v2 = sub_1BBC28A0C();

  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1BBC27CF4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBC2A1E4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1BBC27D44(void *a1)
{
  return sub_1BBC27A78(a1);
}

uint64_t sub_1BBC27D5C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85D70);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2B21C();
  sub_1BBC385C8();
  LOBYTE(v11[0]) = 0;
  sub_1BBC38328();
  if (!v2)
  {
    *(void *)&v11[0] = *(void *)(v3 + 16);
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85D80);
    sub_1BBC2B6E8(&qword_1E9F85D88, &qword_1E9F85D90);
    sub_1BBC38348();
    long long v9 = *(_OWORD *)(v3 + 40);
    v11[0] = *(_OWORD *)(v3 + 24);
    v11[1] = v9;
    char v12 = 2;
    sub_1BBC2B270();
    sub_1BBC38348();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BBC27F5C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85D20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2A3D4();
  sub_1BBC385C8();
  LOBYTE(v20) = 0;
  sub_1BBC37CA8();
  sub_1BBC2B77C(&qword_1E9F85D28, MEMORY[0x1E4F27928]);
  sub_1BBC38348();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for HAREntry();
    unint64_t v10 = (long long *)(v3 + *(int *)(v9 + 20));
    long long v11 = v10[1];
    uint64_t v12 = *((void *)v10 + 4);
    long long v20 = *v10;
    long long v21 = v11;
    *(void *)uint64_t v22 = v12;
    *(_OWORD *)&v22[8] = *(long long *)((char *)v10 + 40);
    *(_OWORD *)&v22[24] = *(long long *)((char *)v10 + 56);
    *(_OWORD *)&unsigned char v22[40] = *(long long *)((char *)v10 + 72);
    *(_OWORD *)&v22[56] = *(long long *)((char *)v10 + 88);
    char v24 = 1;
    sub_1BBC2A4D0();
    sub_1BBC38348();
    uint64_t v13 = (long long *)(v3 + *(int *)(v9 + 24));
    uint64_t v14 = *((void *)v13 + 2);
    uint64_t v15 = *((void *)v13 + 3);
    uint64_t v16 = *((void *)v13 + 14);
    long long v20 = *v13;
    *(void *)&long long v21 = v14;
    *((void *)&v21 + 1) = v15;
    long long v17 = v13[3];
    *(_OWORD *)uint64_t v22 = v13[2];
    *(_OWORD *)&v22[16] = v17;
    long long v18 = v13[5];
    *(_OWORD *)&v22[32] = v13[4];
    *(_OWORD *)&v22[48] = v18;
    *(_OWORD *)&v22[64] = v13[6];
    uint64_t v23 = v16;
    char v24 = 2;
    sub_1BBC2A524();
    sub_1BBC38348();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BBC281C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v4 = sub_1BBC37CA8();
  uint64_t v31 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v32 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85CF8);
  uint64_t v30 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for HAREntry();
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2A3D4();
  sub_1BBC385B8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v11 = v30;
  uint64_t v28 = a1;
  uint64_t v27 = v10;
  uint64_t v12 = v31;
  LOBYTE(v34) = 0;
  sub_1BBC2B77C(&qword_1E9F85D08, MEMORY[0x1E4F27928]);
  uint64_t v13 = v32;
  sub_1BBC382E8();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v27, v13, v4);
  char v38 = 1;
  sub_1BBC2A428();
  sub_1BBC382E8();
  long long v14 = v35;
  uint64_t v15 = *(void *)v36;
  uint64_t v16 = v8;
  uint64_t v17 = *(int *)(v8 + 20);
  uint64_t v18 = (uint64_t)v27;
  uint64_t v19 = &v27[v17];
  *(_OWORD *)uint64_t v19 = v34;
  *((_OWORD *)v19 + 1) = v14;
  *((void *)v19 + 4) = v15;
  *(_OWORD *)(v19 + 40) = *(_OWORD *)&v36[8];
  *(_OWORD *)(v19 + 56) = *(_OWORD *)&v36[24];
  *(_OWORD *)(v19 + 72) = *(_OWORD *)&v36[40];
  *(_OWORD *)(v19 + 88) = *(_OWORD *)&v36[56];
  char v38 = 2;
  sub_1BBC2A47C();
  sub_1BBC382E8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v33);
  long long v20 = v35;
  uint64_t v21 = v37;
  uint64_t v22 = v18 + *(int *)(v16 + 24);
  *(_OWORD *)uint64_t v22 = v34;
  *(_OWORD *)(v22 + 16) = v20;
  long long v23 = *(_OWORD *)&v36[16];
  *(_OWORD *)(v22 + 32) = *(_OWORD *)v36;
  *(_OWORD *)(v22 + 48) = v23;
  long long v24 = *(_OWORD *)&v36[48];
  *(_OWORD *)(v22 + 64) = *(_OWORD *)&v36[32];
  *(_OWORD *)(v22 + 80) = v24;
  *(_OWORD *)(v22 + 96) = *(_OWORD *)&v36[64];
  *(void *)(v22 + 112) = v21;
  sub_1BBC1744C(v18, v29);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v28);
  return sub_1BBC174B0(v18);
}

uint64_t sub_1BBC28654()
{
  return *(void *)&aVersion_0[8 * *v0];
}

uint64_t sub_1BBC2866C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2B2C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BBC28694(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1BBC286A0(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2B21C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC286DC(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2B21C();

  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1BBC28718@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBC2B41C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1BBC28768(void *a1)
{
  return sub_1BBC27D5C(a1);
}

uint64_t sub_1BBC28780()
{
  if (*v0) {
    return 0x6E6F6973726576;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1BBC287B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2B7C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BBC287DC(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2D804();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC28818(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2D804();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BBC28854@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BBC296EC(a1, &qword_1E9F85EF0, (void (*)(void))sub_1BBC2D804, a2);
}

uint64_t sub_1BBC28890(void *a1)
{
  return sub_1BBC29160(a1, *v1, v1[1], v1[2], v1[3], &qword_1E9F85EA8, (void (*)(void *, uint64_t, uint64_t))sub_1BBC2D804);
}

uint64_t sub_1BBC288D4()
{
  uint64_t v1 = 0x74736575716572;
  if (*v0 != 1) {
    uint64_t v1 = 0x65736E6F70736572;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4464657472617473;
  }
}

uint64_t sub_1BBC2893C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2B8A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BBC28964(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2A3D4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC289A0(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2A3D4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BBC289DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BBC281C8(a1, a2);
}

uint64_t sub_1BBC289F4(void *a1)
{
  return sub_1BBC27F5C(a1);
}

unint64_t sub_1BBC28A0C()
{
  unint64_t result = qword_1E9F85CD8;
  if (!qword_1E9F85CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85CD8);
  }
  return result;
}

unint64_t sub_1BBC28A60()
{
  unint64_t result = qword_1E9F85CE0;
  if (!qword_1E9F85CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85CE0);
  }
  return result;
}

uint64_t sub_1BBC28AB4(char a1)
{
  uint64_t result = 0x646F6874656DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 7107189;
      break;
    case 2:
      uint64_t result = 0x7372655670747468;
      break;
    case 3:
      uint64_t result = 0x7365696B6F6F63;
      break;
    case 4:
      uint64_t result = 0x73726564616568;
      break;
    case 5:
      uint64_t result = 0x7274537972657571;
      break;
    case 6:
      uint64_t result = 0x6953726564616568;
      break;
    case 7:
      uint64_t result = 0x657A695379646F62;
      break;
    case 8:
      uint64_t result = 0x746E656D6D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC28BDC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2C170();
  sub_1BBC385C8();
  LOBYTE(v11) = 0;
  sub_1BBC38328();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_1BBC38328();
    LOBYTE(v11) = 2;
    sub_1BBC38328();
    uint64_t v11 = v3[6];
    HIBYTE(v10) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85E00);
    sub_1BBC2DED0(&qword_1E9F85E08, &qword_1E9F85E00);
    sub_1BBC38348();
    uint64_t v11 = v3[7];
    HIBYTE(v10) = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DD8);
    sub_1BBC2C8A0(&qword_1E9F85E10, (void (*)(void))sub_1BBC2C9B8);
    sub_1BBC38348();
    uint64_t v11 = v3[8];
    HIBYTE(v10) = 5;
    sub_1BBC38348();
    LOBYTE(v11) = 6;
    sub_1BBC38338();
    LOBYTE(v11) = 7;
    sub_1BBC38338();
    LOBYTE(v11) = 8;
    sub_1BBC38318();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BBC28F0C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85E20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2C84C();
  sub_1BBC385C8();
  LOBYTE(v12[0]) = 0;
  sub_1BBC38338();
  if (!v2)
  {
    LOBYTE(v12[0]) = 1;
    sub_1BBC38328();
    LOBYTE(v12[0]) = 2;
    sub_1BBC38328();
    *(void *)&v12[0] = *(void *)(v3 + 40);
    char v14 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DD8);
    sub_1BBC2C8A0(&qword_1E9F85E10, (void (*)(void))sub_1BBC2C9B8);
    sub_1BBC38348();
    long long v9 = *(_OWORD *)(v3 + 96);
    _OWORD v12[2] = *(_OWORD *)(v3 + 80);
    v12[3] = v9;
    uint64_t v13 = *(void *)(v3 + 112);
    long long v10 = *(_OWORD *)(v3 + 64);
    v12[0] = *(_OWORD *)(v3 + 48);
    v12[1] = v10;
    char v14 = 4;
    sub_1BBC2CA0C();
    sub_1BBC38348();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BBC29160(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, void (*a7)(void *, uint64_t, uint64_t))
{
  v18[2] = a3;
  v18[0] = a4;
  v18[1] = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a7(v13, v14, v15);
  sub_1BBC385C8();
  char v20 = 0;
  uint64_t v16 = v18[3];
  sub_1BBC38328();
  if (!v16)
  {
    char v19 = 1;
    sub_1BBC38328();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1BBC292D4()
{
  return sub_1BBC28AB4(*v0);
}

uint64_t sub_1BBC292DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2BA24(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BBC29304(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_1BBC29310(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2C170();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC2934C(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2C170();

  return MEMORY[0x1F41862B0](a1, v2);
}

__n128 sub_1BBC29388@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBC2BDF8(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v8;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1BBC293E8(void *a1)
{
  return sub_1BBC28BDC(a1);
}

uint64_t sub_1BBC29400()
{
  uint64_t result = 0x737574617473;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6554737574617473;
      break;
    case 2:
      uint64_t result = 0x7372655670747468;
      break;
    case 3:
      uint64_t result = 0x73726564616568;
      break;
    case 4:
      uint64_t result = 0x746E65746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC294B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2C1C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BBC294DC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1BBC294E8(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2C84C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC29524(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2C84C();

  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1BBC29560@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBC2C400(a1, (uint64_t *)v8);
  if (!v2)
  {
    long long v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(void *)(a2 + 112) = v14;
    long long v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    double result = *(double *)&v9;
    long long v7 = v10;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }
  return result;
}

uint64_t sub_1BBC295C8(void *a1)
{
  return sub_1BBC28F0C(a1);
}

uint64_t sub_1BBC295E0()
{
  if (*v0) {
    return 0x65756C6176;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1BBC29610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BBC2CA60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BBC29638(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2CD54();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC29674(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2CD54();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BBC296B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BBC296EC(a1, &qword_1E9F85E30, (void (*)(void))sub_1BBC2CD54, a2);
}

uint64_t sub_1BBC296EC@<X0>(void *a1@<X0>, uint64_t *a2@<X3>, void (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t result = sub_1BBC2CB3C(a1, a2, a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
    a4[2] = v8;
    a4[3] = v9;
  }
  return result;
}

uint64_t sub_1BBC29728(void *a1)
{
  return sub_1BBC29160(a1, *v1, v1[1], v1[2], v1[3], &qword_1E9F85E40, (void (*)(void *, uint64_t, uint64_t))sub_1BBC2CD54);
}

uint64_t sub_1BBC2976C(unsigned __int8 *a1, char *a2)
{
  return sub_1BBC0D11C(*a1, *a2);
}

uint64_t sub_1BBC29778()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC2985C()
{
  sub_1BBC37F08();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBC29928()
{
  return sub_1BBC38598();
}

uint64_t sub_1BBC29A08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BBC2D858();
  *a1 = result;
  return result;
}

void sub_1BBC29A38(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1954047348;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x65707954656D696DLL;
      goto LABEL_3;
    case 2:
      *a1 = 1702521203;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x746E656D6D6F63;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x676E69646F636E65;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1BBC29AE0()
{
  uint64_t result = 1954047348;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x65707954656D696DLL;
      break;
    case 2:
      uint64_t result = 1702521203;
      break;
    case 3:
      uint64_t result = 0x746E656D6D6F63;
      break;
    case 4:
      uint64_t result = 0x676E69646F636E65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBC29B78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BBC2D858();
  *a1 = result;
  return result;
}

uint64_t sub_1BBC29BA0(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2DD68();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BBC29BDC(uint64_t a1)
{
  unint64_t v2 = sub_1BBC2DD68();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BBC29C18(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85ED0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2DD68();
  sub_1BBC385C8();
  sub_1BBC2DE10(v3, (uint64_t)v33);
  sub_1BBC2DE10((uint64_t)v33, (uint64_t)&v34);
  uint64_t v9 = v35;
  uint64_t v27 = v6;
  if (!v35)
  {
    uint64_t v14 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v13 = 0xF000000000000000;
    goto LABEL_7;
  }
  if (qword_1E9F858C8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1BBC37ED8();
  __swift_project_value_buffer(v10, (uint64_t)qword_1E9F89C48);
  uint64_t v11 = sub_1BBC37EA8();
  unint64_t v13 = v12;
  uint64_t v26 = v11;
  if (v12 >> 60 == 15)
  {
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    uint64_t v25 = 0;
LABEL_7:
    int v36 = 1;
    goto LABEL_16;
  }
  uint64_t v15 = v11;
  switch(v12 >> 62)
  {
    case 1uLL:
      LODWORD(v16) = HIDWORD(v11) - v11;
      if (__OFSUB__(HIDWORD(v11), v11))
      {
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x1BBC2A13CLL);
      }
      uint64_t v16 = (int)v16;
LABEL_13:
      uint64_t v25 = v16;
LABEL_15:
      sub_1BBC02290(v15, v13);
      uint64_t v20 = sub_1BBC37C68();
      uint64_t v21 = v15;
      uint64_t v9 = v20;
      uint64_t v14 = v22;
      sub_1BBC054C4(v21, v13);
      int v36 = 0;
      break;
    case 2uLL:
      uint64_t v18 = *(void *)(v11 + 16);
      uint64_t v17 = *(void *)(v11 + 24);
      BOOL v19 = __OFSUB__(v17, v18);
      uint64_t v16 = v17 - v18;
      if (!v19) {
        goto LABEL_13;
      }
      goto LABEL_20;
    case 3uLL:
      sub_1BBC054C4(v11, v12);
      uint64_t v25 = 0;
      goto LABEL_15;
    default:
      sub_1BBC054C4(v11, v12);
      uint64_t v16 = BYTE6(v13);
      goto LABEL_13;
  }
LABEL_16:
  uint64_t v28 = v9;
  uint64_t v29 = v14;
  char v37 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F63A0);
  sub_1BBC2DED0(&qword_1E9F85ED8, &qword_1EB9F63A0);
  sub_1BBC38348();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v5);
    sub_1BBC054C4(v26, v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1BBC2DE10(v3 + 16, (uint64_t)v32);
    sub_1BBC2DE10((uint64_t)v32, (uint64_t)&v28);
    char v37 = 1;
    sub_1BBC2DE78((uint64_t)v32);
    sub_1BBC38348();
    sub_1BBC2DEA4((uint64_t)v32);
    uint64_t v28 = v25;
    LOBYTE(v29) = v36;
    char v37 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85EE0);
    sub_1BBC2DED0(&qword_1E9F85EE8, &qword_1E9F85EE0);
    sub_1BBC38348();
    sub_1BBC2DE10(v3 + 40, (uint64_t)v31);
    sub_1BBC2DE10((uint64_t)v31, (uint64_t)&v28);
    char v37 = 3;
    sub_1BBC2DE78((uint64_t)v31);
    sub_1BBC38348();
    sub_1BBC2DEA4((uint64_t)v31);
    sub_1BBC2DE10(v3 + 56, (uint64_t)v30);
    sub_1BBC2DE10((uint64_t)v30, (uint64_t)&v28);
    char v37 = 4;
    sub_1BBC2DE78((uint64_t)v30);
    sub_1BBC38348();
    sub_1BBC054C4(v26, v13);
    sub_1BBC2DEA4((uint64_t)v30);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v8, v5);
  }
}

__n128 sub_1BBC2A14C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBC2D8A4(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_1BBC2A1A0(void *a1)
{
  return sub_1BBC29C18(a1);
}

uint64_t sub_1BBC2A1E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85CE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC28A0C();
  sub_1BBC385B8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  sub_1BBC2A380();
  sub_1BBC382E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = v15;
  uint64_t v10 = v18;
  uint64_t v11 = v19;
  long long v13 = v16;
  long long v14 = v17;
  uint64_t result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  *(void *)a2 = v9;
  *(_OWORD *)(a2 + 8) = v13;
  *(_OWORD *)(a2 + 24) = v14;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v11;
  return result;
}

unint64_t sub_1BBC2A380()
{
  unint64_t result = qword_1E9F85CF0;
  if (!qword_1E9F85CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85CF0);
  }
  return result;
}

unint64_t sub_1BBC2A3D4()
{
  unint64_t result = qword_1E9F85D00;
  if (!qword_1E9F85D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D00);
  }
  return result;
}

unint64_t sub_1BBC2A428()
{
  unint64_t result = qword_1E9F85D10;
  if (!qword_1E9F85D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D10);
  }
  return result;
}

unint64_t sub_1BBC2A47C()
{
  unint64_t result = qword_1E9F85D18;
  if (!qword_1E9F85D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D18);
  }
  return result;
}

unint64_t sub_1BBC2A4D0()
{
  unint64_t result = qword_1E9F85D30;
  if (!qword_1E9F85D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D30);
  }
  return result;
}

unint64_t sub_1BBC2A524()
{
  unint64_t result = qword_1E9F85D38;
  if (!qword_1E9F85D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D38);
  }
  return result;
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

ValueMetadata *type metadata accessor for HARHeader()
{
  return &type metadata for HARHeader;
}

ValueMetadata *type metadata accessor for HAREntry.CodingKeys()
{
  return &type metadata for HAREntry.CodingKeys;
}

ValueMetadata *type metadata accessor for HARv1dot2.CodingKeys()
{
  return &type metadata for HARv1dot2.CodingKeys;
}

uint64_t _s12FMNetworking6HARLogVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s12FMNetworking6HARLogVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s12FMNetworking6HARLogVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FMNetworking6HARLogVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FMNetworking6HARLogVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1BBC2A874(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARLog()
{
  return &type metadata for HARLog;
}

uint64_t destroy for HARResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HARResponse(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for HARResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HARResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARResponse()
{
  return &type metadata for HARResponse;
}

uint64_t destroy for HARRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HARRequest(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for HARRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HARRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARRequest()
{
  return &type metadata for HARRequest;
}

unint64_t sub_1BBC2B010()
{
  unint64_t result = qword_1E9F85D40;
  if (!qword_1E9F85D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D40);
  }
  return result;
}

unint64_t sub_1BBC2B068()
{
  unint64_t result = qword_1E9F85D48;
  if (!qword_1E9F85D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D48);
  }
  return result;
}

unint64_t sub_1BBC2B0C0()
{
  unint64_t result = qword_1E9F85D50;
  if (!qword_1E9F85D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D50);
  }
  return result;
}

unint64_t sub_1BBC2B118()
{
  unint64_t result = qword_1E9F85D58;
  if (!qword_1E9F85D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D58);
  }
  return result;
}

unint64_t sub_1BBC2B170()
{
  unint64_t result = qword_1E9F85D60;
  if (!qword_1E9F85D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D60);
  }
  return result;
}

unint64_t sub_1BBC2B1C8()
{
  unint64_t result = qword_1E9F85D68;
  if (!qword_1E9F85D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D68);
  }
  return result;
}

unint64_t sub_1BBC2B21C()
{
  unint64_t result = qword_1E9F85D78;
  if (!qword_1E9F85D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D78);
  }
  return result;
}

unint64_t sub_1BBC2B270()
{
  unint64_t result = qword_1E9F85D98;
  if (!qword_1E9F85D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85D98);
  }
  return result;
}

uint64_t sub_1BBC2B2C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656972746E65 && a2 == 0xE700000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7461657263 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1BBC2B41C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2B21C();
  sub_1BBC385B8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v16 = 0;
    uint64_t v9 = sub_1BBC382A8();
    uint64_t v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85D80);
    char v15 = 1;
    sub_1BBC2B6E8(&qword_1E9F85DA8, &qword_1E9F85DB0);
    swift_bridgeObjectRetain();
    sub_1BBC382E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = v14[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
    a2[3] = 0xD000000000000010;
    a2[4] = 0x80000001BBC3CE10;
    a2[5] = 3157553;
    a2[6] = 0xE300000000000000;
  }
  return result;
}

uint64_t sub_1BBC2B6E8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9F85D80);
    sub_1BBC2B77C(a2, (void (*)(uint64_t))type metadata accessor for HAREntry);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBC2B77C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBC2B7C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1BBC2B8A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4464657472617473 && a2 == 0xEF656D6954657461;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1BBC2BA24(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x646F6874656DLL && a2 == 0xE600000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372655670747468 && a2 == 0xEB000000006E6F69 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7365696B6F6F63 && a2 == 0xE700000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73726564616568 && a2 == 0xE700000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7274537972657571 && a2 == 0xEB00000000676E69 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6953726564616568 && a2 == 0xEA0000000000657ALL || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x657A695379646F62 && a2 == 0xE800000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x746E656D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_1BBC2BDF8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2C170();
  sub_1BBC385B8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    char v33 = 0;
    uint64_t v9 = sub_1BBC382A8();
    uint64_t v11 = v10;
    uint64_t v28 = v9;
    char v32 = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1BBC382A8();
    uint64_t v29 = v13;
    uint64_t v27 = v12;
    char v31 = 2;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1BBC382A8();
    uint64_t v26 = v14;
    char v30 = 8;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1BBC38298();
    uint64_t v17 = v16;
    uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v24 = v15;
    v18(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v20 = v26;
    swift_bridgeObjectRelease();
    uint64_t v21 = v29;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v28;
    a2[1] = v11;
    a2[2] = v27;
    a2[3] = v21;
    a2[4] = v25;
    a2[5] = v20;
    a2[6] = v19;
    a2[7] = v19;
    a2[8] = v19;
    a2[9] = -1;
    uint64_t v23 = v24;
    a2[10] = -1;
    a2[11] = v23;
    a2[12] = v17;
  }
  return result;
}

unint64_t sub_1BBC2C170()
{
  unint64_t result = qword_1E9F85DC0;
  if (!qword_1E9F85DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85DC0);
  }
  return result;
}

uint64_t sub_1BBC2C1C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x737574617473 && a2 == 0xE600000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6554737574617473 && a2 == 0xEA00000000007478 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372655670747468 && a2 == 0xEB000000006E6F69 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73726564616568 && a2 == 0xE700000000000000 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1BBC2C400@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2C84C();
  sub_1BBC385B8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  LOBYTE(v37) = 0;
  uint64_t v9 = sub_1BBC382D8();
  LOBYTE(v37) = 1;
  uint64_t v10 = sub_1BBC382A8();
  uint64_t v12 = v11;
  uint64_t v35 = v10;
  uint64_t v36 = v9;
  LOBYTE(v37) = 2;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1BBC382A8();
  uint64_t v15 = v14;
  uint64_t v33 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85DD8);
  char v46 = 3;
  sub_1BBC2C8A0(&qword_1E9F85DE0, (void (*)(void))sub_1BBC2C910);
  uint64_t v34 = v15;
  swift_bridgeObjectRetain();
  sub_1BBC382E8();
  uint64_t v16 = v37;
  char v46 = 4;
  sub_1BBC2C964();
  swift_bridgeObjectRetain();
  sub_1BBC382E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = v38;
  uint64_t v31 = v39;
  uint64_t v32 = v37;
  uint64_t v18 = v16;
  uint64_t v19 = v40;
  uint64_t v20 = v43;
  uint64_t v29 = v42;
  uint64_t v30 = v41;
  uint64_t v21 = v45;
  uint64_t v28 = v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = v34;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v24 = v35;
  *a2 = v36;
  a2[1] = v24;
  uint64_t v25 = v33;
  a2[2] = v12;
  a2[3] = v25;
  a2[4] = v22;
  a2[5] = v18;
  a2[6] = v32;
  a2[7] = v17;
  a2[8] = v31;
  a2[9] = v19;
  uint64_t v26 = v29;
  a2[10] = v30;
  a2[11] = v26;
  uint64_t v27 = v28;
  a2[12] = v20;
  a2[13] = v27;
  a2[14] = v21;
  return result;
}

unint64_t sub_1BBC2C84C()
{
  unint64_t result = qword_1E9F85DD0;
  if (!qword_1E9F85DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85DD0);
  }
  return result;
}

uint64_t sub_1BBC2C8A0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9F85DD8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BBC2C910()
{
  unint64_t result = qword_1E9F85DE8;
  if (!qword_1E9F85DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85DE8);
  }
  return result;
}

unint64_t sub_1BBC2C964()
{
  unint64_t result = qword_1E9F85DF0;
  if (!qword_1E9F85DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85DF0);
  }
  return result;
}

unint64_t sub_1BBC2C9B8()
{
  unint64_t result = qword_1E9F85E18;
  if (!qword_1E9F85E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E18);
  }
  return result;
}

unint64_t sub_1BBC2CA0C()
{
  unint64_t result = qword_1E9F85E28;
  if (!qword_1E9F85E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E28);
  }
  return result;
}

uint64_t sub_1BBC2CA60(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1BBC38448() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1BBC38448();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1BBC2CB3C(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v13 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  a3();
  sub_1BBC385B8();
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    uint64_t v10 = v13;
    char v15 = 0;
    uint64_t v9 = sub_1BBC382A8();
    char v14 = 1;
    swift_bridgeObjectRetain();
    sub_1BBC382A8();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v9;
}

unint64_t sub_1BBC2CD54()
{
  unint64_t result = qword_1E9F85E38;
  if (!qword_1E9F85E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E38);
  }
  return result;
}

ValueMetadata *type metadata accessor for HARHeader.CodingKeys()
{
  return &type metadata for HARHeader.CodingKeys;
}

ValueMetadata *type metadata accessor for HARResponse.CodingKeys()
{
  return &type metadata for HARResponse.CodingKeys;
}

uint64_t getEnumTagSinglePayload for HARRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HARRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BBC2CF30);
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

ValueMetadata *type metadata accessor for HARRequest.CodingKeys()
{
  return &type metadata for HARRequest.CodingKeys;
}

uint64_t _s12FMNetworking8HAREntryV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12FMNetworking8HAREntryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BBC2D0C4);
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

ValueMetadata *type metadata accessor for HARLog.CodingKeys()
{
  return &type metadata for HARLog.CodingKeys;
}

ValueMetadata *type metadata accessor for HARCreator()
{
  return &type metadata for HARCreator;
}

uint64_t destroy for HARContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HARContent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HARContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARContent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HARContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARContent()
{
  return &type metadata for HARContent;
}

unint64_t sub_1BBC2D3E8()
{
  unint64_t result = qword_1E9F85E48;
  if (!qword_1E9F85E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E48);
  }
  return result;
}

unint64_t sub_1BBC2D440()
{
  unint64_t result = qword_1E9F85E50;
  if (!qword_1E9F85E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E50);
  }
  return result;
}

unint64_t sub_1BBC2D498()
{
  unint64_t result = qword_1E9F85E58;
  if (!qword_1E9F85E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E58);
  }
  return result;
}

unint64_t sub_1BBC2D4F0()
{
  unint64_t result = qword_1E9F85E60;
  if (!qword_1E9F85E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E60);
  }
  return result;
}

unint64_t sub_1BBC2D548()
{
  unint64_t result = qword_1E9F85E68;
  if (!qword_1E9F85E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E68);
  }
  return result;
}

unint64_t sub_1BBC2D5A0()
{
  unint64_t result = qword_1E9F85E70;
  if (!qword_1E9F85E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E70);
  }
  return result;
}

unint64_t sub_1BBC2D5F8()
{
  unint64_t result = qword_1E9F85E78;
  if (!qword_1E9F85E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E78);
  }
  return result;
}

unint64_t sub_1BBC2D650()
{
  unint64_t result = qword_1E9F85E80;
  if (!qword_1E9F85E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E80);
  }
  return result;
}

unint64_t sub_1BBC2D6A8()
{
  unint64_t result = qword_1E9F85E88;
  if (!qword_1E9F85E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E88);
  }
  return result;
}

unint64_t sub_1BBC2D700()
{
  unint64_t result = qword_1E9F85E90;
  if (!qword_1E9F85E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E90);
  }
  return result;
}

unint64_t sub_1BBC2D758()
{
  unint64_t result = qword_1E9F85E98;
  if (!qword_1E9F85E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85E98);
  }
  return result;
}

unint64_t sub_1BBC2D7B0()
{
  unint64_t result = qword_1E9F85EA0;
  if (!qword_1E9F85EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85EA0);
  }
  return result;
}

unint64_t sub_1BBC2D804()
{
  unint64_t result = qword_1E9F85EB0;
  if (!qword_1E9F85EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85EB0);
  }
  return result;
}

uint64_t sub_1BBC2D858()
{
  unint64_t v0 = sub_1BBC38268();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_1BBC2D8A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v4 = sub_1BBC37ED8();
  uint64_t v38 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F85EB8);
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBC2DD68();
  sub_1BBC385B8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v36 = (uint64_t)v6;
  uint64_t v37 = v4;
  uint64_t v10 = v39;
  uint64_t v11 = v40;
  char v45 = 0;
  uint64_t v12 = sub_1BBC38298();
  uint64_t v14 = v13;
  uint64_t v15 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v15;
  if (v14)
  {
    uint64_t v19 = sub_1BBC37C48();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    if (v21 >> 60 == 15)
    {
      sub_1BBC2DDBC();
      swift_allocError();
      swift_willThrow();
      (*(void (**)(char *))(v10 + 8))(v17);
      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    }
    if (qword_1E9F858C8 != -1) {
      swift_once();
    }
    uint64_t v35 = a1;
    uint64_t v22 = v37;
    uint64_t v23 = __swift_project_value_buffer(v37, (uint64_t)qword_1E9F89C48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v36, v23, v22);
    uint64_t v38 = sub_1BBC37EB8();
    uint64_t v14 = v24;
    sub_1BBC054C4(v19, v21);
  }
  else
  {
    uint64_t v38 = v12;
    uint64_t v35 = a1;
  }
  char v44 = 1;
  uint64_t v25 = sub_1BBC38298();
  uint64_t v27 = v26;
  uint64_t v40 = (uint64_t *)v25;
  char v43 = 2;
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_1BBC382D8();
  char v42 = 3;
  uint64_t v36 = sub_1BBC38298();
  uint64_t v37 = v28;
  char v41 = 4;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_1BBC38298();
  uint64_t v31 = v30;
  uint64_t v32 = v29;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v35);
  swift_bridgeObjectRelease();
  uint64_t v33 = v37;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v11 = v38;
  v11[1] = v14;
  _OWORD v11[2] = (uint64_t)v40;
  v11[3] = v27;
  uint64_t v34 = v36;
  v11[4] = v39;
  v11[5] = v34;
  void v11[6] = v33;
  v11[7] = v32;
  v11[8] = v31;
  return result;
}

unint64_t sub_1BBC2DD68()
{
  unint64_t result = qword_1E9F85EC0;
  if (!qword_1E9F85EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85EC0);
  }
  return result;
}

unint64_t sub_1BBC2DDBC()
{
  unint64_t result = qword_1E9F85EC8;
  if (!qword_1E9F85EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85EC8);
  }
  return result;
}

uint64_t sub_1BBC2DE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F63A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC2DE78(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BBC2DEA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BBC2DED0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *_s12FMNetworking9HARv1dot2V10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BBC2DFCCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HARContent.ContentError()
{
  return &type metadata for HARContent.ContentError;
}

uint64_t _s12FMNetworking11HARResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s12FMNetworking11HARResponseV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1BBC2E160);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARContent.CodingKeys()
{
  return &type metadata for HARContent.CodingKeys;
}

unsigned char *_s12FMNetworking9HARHeaderV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1BBC2E264);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HARCreator.CodingKeys()
{
  return &type metadata for HARCreator.CodingKeys;
}

unint64_t sub_1BBC2E2A0()
{
  unint64_t result = qword_1E9F85EF8;
  if (!qword_1E9F85EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85EF8);
  }
  return result;
}

unint64_t sub_1BBC2E2F8()
{
  unint64_t result = qword_1E9F85F00;
  if (!qword_1E9F85F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F00);
  }
  return result;
}

unint64_t sub_1BBC2E350()
{
  unint64_t result = qword_1E9F85F08;
  if (!qword_1E9F85F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F08);
  }
  return result;
}

unint64_t sub_1BBC2E3A8()
{
  unint64_t result = qword_1E9F85F10;
  if (!qword_1E9F85F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F10);
  }
  return result;
}

unint64_t sub_1BBC2E400()
{
  unint64_t result = qword_1E9F85F18;
  if (!qword_1E9F85F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F18);
  }
  return result;
}

unint64_t sub_1BBC2E458()
{
  unint64_t result = qword_1E9F85F20;
  if (!qword_1E9F85F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F20);
  }
  return result;
}

unint64_t sub_1BBC2E4B0()
{
  unint64_t result = qword_1E9F85F28;
  if (!qword_1E9F85F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F28);
  }
  return result;
}

uint64_t sub_1BBC2E50C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = *(_DWORD *)(*(void *)(*(void *)(a3 + 16) - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = v4 + ((unsigned __int16)((v3 & 0xF8) + 23) & (unsigned __int16)~(v3 & 0xF8) & 0x1F8);
  swift_retain();
  return v5;
}

uint64_t sub_1BBC2E57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (void *)((swift_unknownObjectWeakCopyAssign() + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v7 = (void *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v7[1];
  *unsigned int v6 = *v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v6[1] = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = ((unint64_t)v6 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)v7 + v11 + 16) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 40) + 7;
  unint64_t v15 = (v14 + v12) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v14 + v13) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = *(void *)(v16 + 24);
  if (*(void *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      *(void *)(v15 + 24) = v17;
      *(void *)(v15 + 32) = *(void *)(v16 + 32);
      (**(void (***)(unint64_t, unint64_t))(v17 - 8))(v15, v16);
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v15, (uint64_t *)v16);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v15);
  }
  long long v18 = *(_OWORD *)v16;
  long long v19 = *(_OWORD *)(v16 + 16);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(_OWORD *)unint64_t v15 = v18;
  *(_OWORD *)(v15 + 16) = v19;
LABEL_8:
  unint64_t v20 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void **)v20;
  uint64_t v23 = *(void **)v21;
  if (*(void *)v20 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v23 >= 0xFFFFFFFF)
    {
      *(void *)unint64_t v20 = v23;
      uint64_t v25 = *(void *)(v21 + 32);
      *(void *)(v20 + 32) = v25;
      *(void *)(v20 + 40) = *(void *)(v21 + 40);
      uint64_t v26 = **(void (***)(unint64_t, unint64_t, uint64_t))(v25 - 8);
      id v27 = v23;
      v26(v20 + 8, v21 + 8, v25);
      *(void *)(v20 + 48) = *(void *)(v21 + 48);
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    long long v28 = *(_OWORD *)v21;
    long long v29 = *(_OWORD *)(v21 + 16);
    long long v30 = *(_OWORD *)(v21 + 32);
    *(void *)(v20 + 48) = *(void *)(v21 + 48);
    *(_OWORD *)(v20 + 16) = v29;
    *(_OWORD *)(v20 + 32) = v30;
    *(_OWORD *)unint64_t v20 = v28;
    goto LABEL_15;
  }
  if ((unint64_t)v23 < 0xFFFFFFFF)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v20 + 8);
    swift_release();
    goto LABEL_14;
  }
  *(void *)unint64_t v20 = v23;
  id v24 = v23;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v20 + 8), (uint64_t *)(v21 + 8));
  *(void *)(v20 + 48) = *(void *)(v21 + 48);
  swift_retain();
  swift_release();
LABEL_15:
  *(void *)((swift_weakCopyAssign() + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)((((v21 + 63) & 0xFFFFFFFFFFFFFFF8)
                                                                                 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BBC2E814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (void *)((swift_unknownObjectWeakTakeAssign() + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v7 = (void *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v7[1];
  *unsigned int v6 = *v7;
  swift_unknownObjectRelease();
  v6[1] = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = ((unint64_t)v6 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)v7 + v11 + 16) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 24) + 7;
  unint64_t v15 = (v14 + v12) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v14 + v13) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v15 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_0Tm(v15);
  }
  long long v17 = *(_OWORD *)v16;
  long long v18 = *(_OWORD *)(v16 + 16);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(_OWORD *)unint64_t v15 = v17;
  *(_OWORD *)(v15 + 16) = v18;
  unint64_t v19 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = *(void **)v19;
  if (*(void *)v19 < 0xFFFFFFFFuLL) {
    goto LABEL_7;
  }
  if (*(void *)v20 < 0xFFFFFFFFuLL)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v19 + 8);
    swift_release();
LABEL_7:
    long long v24 = *(_OWORD *)v20;
    long long v25 = *(_OWORD *)(v20 + 16);
    long long v26 = *(_OWORD *)(v20 + 32);
    *(void *)(v19 + 48) = *(void *)(v20 + 48);
    *(_OWORD *)(v19 + 16) = v25;
    *(_OWORD *)(v19 + 32) = v26;
    *(_OWORD *)unint64_t v19 = v24;
    goto LABEL_8;
  }
  *(void *)unint64_t v19 = *(void *)v20;

  __swift_destroy_boxed_opaque_existential_0Tm(v19 + 8);
  long long v22 = *(_OWORD *)(v20 + 8);
  long long v23 = *(_OWORD *)(v20 + 24);
  *(void *)(v19 + 40) = *(void *)(v20 + 40);
  *(_OWORD *)(v19 + 24) = v23;
  *(_OWORD *)(v19 + 8) = v22;
  *(void *)(v19 + 48) = *(void *)(v20 + 48);
  swift_release();
LABEL_8:
  *(void *)((swift_weakTakeAssign() + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)((((v20 + 63) & 0xFFFFFFFFFFFFFFF8)
                                                                                 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BBC2E9CC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((((((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 24) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
             + 47) & 0xFFFFFFFFFFFFFFF8)
           + 63) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BBC2EB54);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  long long v17 = (unint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  if (v5 > 0x7FFFFFFE) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v17 + v6 + 16) & ~v6);
  }
  unint64_t v18 = *v17;
  if (v18 >= 0xFFFFFFFF) {
    LODWORD(v18) = -1;
  }
  if ((v18 + 1) >= 2) {
    return v18;
  }
  else {
    return 0;
  }
}

void sub_1BBC2EB68(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((((((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 24) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
            + 47) & 0xFFFFFFFFFFFFFFF8)
          + 63) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v18 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
            if (v7 > 0x7FFFFFFE)
            {
              unint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
              v19(((unint64_t)v18 + v9 + 16) & ~v9);
            }
            else if (a2 > 0x7FFFFFFE)
            {
              *unint64_t v18 = 0;
              v18[1] = 0;
              *(_DWORD *)unint64_t v18 = a2 - 0x7FFFFFFF;
            }
            else
            {
              *unint64_t v18 = a2;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 24) & ~v9) + 7) & 0xFFFFFFF8)
             + 47) & 0xFFFFFFF8)
           + 63) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 24) & ~v9) + 7) & 0xFFFFFFF8)
           + 47) & 0xFFFFFFF8)
         + 63) & 0xFFFFFFF8)
       + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
    int v16 = v15;
  else {
    int v16 = 1;
  }
  if (((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 24) & ~v9) + 7) & 0xFFFFFFF8)
           + 47) & 0xFFFFFFF8)
         + 63) & 0xFFFFFFF8)
       + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1BBC2ED90);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

void sub_1BBC2EDB8(void *a1, NSObject *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BBC38DE0;
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9F85C40);
  uint64_t v6 = sub_1BBC37EE8();
  uint64_t v8 = v7;
  *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v4 + 64) = sub_1BBC04664();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v8;
  sub_1BBC060E8();
  uint64_t v9 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  dispatch_group_leave(a2);
}

uint64_t static FMNAPSTokenProvidingError.== infix(_:_:)()
{
  return 1;
}

uint64_t FMNAPSTokenProvidingError.hash(into:)()
{
  return sub_1BBC38588();
}

uint64_t FMNAPSTokenProvidingError.hashValue.getter()
{
  return sub_1BBC38598();
}

id sub_1BBC2EF20()
{
  uint64_t v1 = OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection;
  int v2 = *(void **)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    swift_unknownObjectUnownedInit();
    id v3 = sub_1BBC2EFAC();
    swift_unknownObjectUnownedDestroy();
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_1BBC32CF0(v4);
  }
  sub_1BBC32D00(v2);
  return v3;
}

id sub_1BBC2EFAC()
{
  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  id v1 = *(id *)&Strong[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
  id v2 = v1;

  if (!v1)
  {
    sub_1BBC37E98();
    id v3 = (void *)swift_unknownObjectUnownedLoadStrong();
    swift_bridgeObjectRetain();

    uint64_t v4 = (char *)swift_unknownObjectUnownedLoadStrong();
    id v5 = *(id *)&v4[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];

    id v6 = objc_allocWithZone(MEMORY[0x1E4F4E1E8]);
    uint64_t v7 = (void *)sub_1BBC37E88();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_1BBC37E88();
    swift_bridgeObjectRelease();
    id v1 = objc_msgSend(v6, sel_initWithEnvironmentName_namedDelegatePort_queue_, v7, v8, v5);

    if (v1)
    {
      uint64_t v9 = (void *)swift_unknownObjectUnownedLoadStrong();
      id v10 = v1;
      objc_msgSend(v10, sel_setDelegate_, v9);
    }
    unsigned int v11 = (char *)swift_unknownObjectUnownedLoadStrong();
    unsigned int v12 = *(void **)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
    *(void *)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = v1;
    id v13 = v1;
  }
  return v1;
}

id FMNPushNotificatonHandler.__allocating_init(topic:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBC37E98();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for FMNPushNotificatonHandler());
  return FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(a1, a2, v4, v6);
}

id FMNPushNotificatonHandler.__allocating_init(topic:namedDelegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(a1, a2, a3, a4);
}

uint64_t type metadata accessor for FMNPushNotificatonHandler()
{
  return self;
}

id FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v5 = sub_1BBC38058();
  MEMORY[0x1F4188790](v5);
  uint64_t v6 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1BBC38068();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue;
  v20[1] = sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCC68], v7);
  unsigned int v11 = v4;
  sub_1BBC37D48();
  uint64_t v27 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6D90, (uint64_t *)&unk_1EB9F6D80);
  sub_1BBC38128();
  *(void *)&v4[v21] = sub_1BBC38098();
  *(void *)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_pendingTopicTokenFutures] = MEMORY[0x1E4FBC870];
  unsigned int v12 = &v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken];
  *(void *)unsigned int v12 = 0;
  *((void *)v12 + 1) = 0;
  id v13 = &v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;
  *(void *)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = 0;
  *(void *)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection] = 1;
  int v14 = &v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  uint64_t v15 = v23;
  *(void *)int v14 = v22;
  *((void *)v14 + 1) = v15;
  int v16 = &v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_namedDelegatePort];
  uint64_t v17 = v25;
  *(void *)int v16 = v24;
  *((void *)v16 + 1) = v17;

  unint64_t v18 = (objc_class *)type metadata accessor for FMNPushNotificatonHandler();
  v26.receiver = v11;
  v26.super_class = v18;
  return objc_msgSendSuper2(&v26, sel_init);
}

id FMNPushNotificatonHandler.__deallocating_deinit()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
  if (v1)
  {
    *(void *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = 0;
    objc_msgSend(v1, sel_shutdown);
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FMNPushNotificatonHandler();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1BBC2F688()
{
  uint64_t v1 = sub_1BBC37D28();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BBC37D58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_1BBC32CE8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_33;
  id v10 = _Block_copy(aBlock);
  unsigned int v11 = v0;
  sub_1BBC37D48();
  v13[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v8, v4, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_1BBC2F948(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken + 8))
  {
    uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken);
  }
  else
  {
    if (!*(void *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken + 8)) {
      return;
    }
    uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken);
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_pendingTopicTokenFutures);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v20 = a1;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BBC38158();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
    sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
    sub_1BBC38008();
    uint64_t v4 = v23;
    uint64_t v21 = v24;
    uint64_t v5 = v25;
    uint64_t v6 = v26;
    unint64_t v7 = v27;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v21 = v4 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v4 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
  }
  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  if (v4 < 0) {
    goto LABEL_14;
  }
  while (1)
  {
    if (v7)
    {
      uint64_t v12 = (v7 - 1) & v7;
      unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
      uint64_t v14 = v6;
      goto LABEL_31;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      return;
    }
    if (v15 >= v11) {
      goto LABEL_34;
    }
    unint64_t v16 = *(void *)(v21 + 8 * v15);
    uint64_t v14 = v6 + 1;
    if (!v16)
    {
      uint64_t v14 = v6 + 2;
      if (v6 + 2 >= v11) {
        goto LABEL_34;
      }
      unint64_t v16 = *(void *)(v21 + 8 * v14);
      if (!v16)
      {
        uint64_t v14 = v6 + 3;
        if (v6 + 3 >= v11) {
          goto LABEL_34;
        }
        unint64_t v16 = *(void *)(v21 + 8 * v14);
        if (!v16)
        {
          uint64_t v14 = v6 + 4;
          if (v6 + 4 >= v11) {
            goto LABEL_34;
          }
          unint64_t v16 = *(void *)(v21 + 8 * v14);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_30:
    uint64_t v12 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v14 << 6);
LABEL_31:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v13);
    swift_retain();
    if (!v18) {
      goto LABEL_34;
    }
    while (1)
    {
      uint64_t v22 = v2;
      sub_1BBC37E18();
      swift_release();
      uint64_t v6 = v14;
      unint64_t v7 = v12;
      if ((v4 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_14:
      if (sub_1BBC38188())
      {
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v14 = v6;
        uint64_t v12 = v7;
        if (v22) {
          continue;
        }
      }
      goto LABEL_34;
    }
  }
  uint64_t v17 = v6 + 5;
  while (v11 != v17)
  {
    unint64_t v16 = *(void *)(v21 + 8 * v17++);
    if (v16)
    {
      uint64_t v14 = v17 - 1;
      goto LABEL_30;
    }
  }
LABEL_34:
  sub_1BBC22614();
  swift_bridgeObjectRelease();
  unint64_t v19 = *(void **)(v20 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection);
  if (v19)
  {
    *(void *)(v20 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection) = 0;
    objc_msgSend(v19, sel_shutdown);
  }
}

uint64_t sub_1BBC2FC90()
{
  uint64_t v1 = sub_1BBC37D28();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BBC37D58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8];
  v15[0] = *(void *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  int64_t v11 = (void *)swift_allocObject();
  _OWORD v11[2] = v0;
  v11[3] = v9;
  v11[4] = v10;
  aBlock[4] = sub_1BBC32E50;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_61_0;
  uint64_t v12 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  unint64_t v13 = v0;
  sub_1BBC37D48();
  v15[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v8, v4, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_1BBC2FF6C()
{
  id v0 = sub_1BBC2EF20();
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = (id)sub_1BBC37E88();
    objc_msgSend(v1, sel_requestTokenForTopic_identifier_, v2, 0);
  }
}

id FMNPushNotificatonHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void FMNPushNotificatonHandler.init()()
{
}

uint64_t FMNPushNotificatonHandler.topicToken()()
{
  uint64_t v1 = sub_1BBC37D28();
  uint64_t v16 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1BBC37D58();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC2FC90();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  swift_allocObject();
  uint64_t v7 = sub_1BBC37E28();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v0;
  *(void *)(v8 + 24) = v7;
  id v9 = v0;
  swift_retain();
  sub_1BBC37DF8();
  swift_release();
  swift_release();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v7;
  aBlock[4] = sub_1BBC307B0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_4;
  int64_t v11 = _Block_copy(aBlock);
  id v12 = v9;
  swift_retain();
  sub_1BBC37D48();
  uint64_t v17 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v6, v3, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  swift_release();
  return v7;
}

uint64_t sub_1BBC303E8(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v6 = sub_1BBC37D28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBC37D58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(void *)&a3[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  aBlock[4] = sub_1BBC32E04;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_55;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = a3;
  swift_retain();
  sub_1BBC37D48();
  v18[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t sub_1BBC306BC(uint64_t a1, uint64_t a2)
{
  return sub_1BBC303E8(a1, a2, *(char **)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1BBC306C4()
{
  return swift_release();
}

uint64_t sub_1BBC30728(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  swift_retain();
  sub_1BBC31EE4(&v4, a2);
  swift_endAccess();
  swift_release();
  return sub_1BBC2F688();
}

uint64_t sub_1BBC307B0()
{
  return sub_1BBC30728(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t FMNPushNotificatonHandler.topicToken(_:)(uint64_t a1, uint64_t a2)
{
  FMNPushNotificatonHandler.topicToken()();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_1BBC37DF8();
  swift_release();
  swift_release();

  return swift_release();
}

void sub_1BBC3084C(uint64_t *a1, id a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (a2)
  {
    id v4 = a2;
    id v5 = a2;
    uint64_t v6 = (uint64_t)v4;
  }
  else
  {
    uint64_t v7 = a1[1];
    if (v7)
    {
      a3(*a1, v7, 0);
      return;
    }
    sub_1BBC32DAC();
    uint64_t v6 = swift_allocError();
    id v4 = (id)v6;
  }
  a3(v6, 0, 1);
}

void sub_1BBC308FC(uint64_t *a1, void *a2)
{
  sub_1BBC3084C(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1BBC30904()
{
  return FMNPushNotificatonHandler.topicToken()();
}

uint64_t sub_1BBC30928(uint64_t a1, uint64_t a2)
{
  FMNPushNotificatonHandler.topicToken()();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_1BBC37DF8();
  swift_release();
  swift_release();

  return swift_release();
}

void FMNPushNotificatonHandler.connection(_:didReceivePublicToken:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

void FMNPushNotificatonHandler.connection(_:didReceiveToken:forTopic:identifier:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

uint64_t sub_1BBC30A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken);
  *uint64_t v3 = a2;
  v3[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_1BBC2F688();
}

void FMNPushNotificatonHandler.connection(_:didReceiveMessageForTopic:userInfo:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BBC38DE0;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8);
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 64) = sub_1BBC04664();
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v2;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  swift_bridgeObjectRetain();
  id v4 = (id)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();
}

uint64_t sub_1BBC30E60()
{
  uint64_t v1 = *v0;
  if ((*v0 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    char v2 = sub_1BBC38198();
    swift_release();
    if (v2)
    {
      uint64_t v3 = sub_1BBC31068();
      swift_bridgeObjectRelease();
      return v3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
  uint64_t v4 = sub_1BBC37E68();
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v7 = ~v5;
  sub_1BBBFF14C(&qword_1EB9F64E8, (uint64_t *)&unk_1EB9F64F0);
  while ((sub_1BBC37E78() & 1) == 0)
  {
    unint64_t v6 = (v6 + 1) & v7;
    if (((*(void *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v0;
  uint64_t v11 = *v0;
  *uint64_t v0 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_1BBC31230();
    uint64_t v10 = v11;
  }
  uint64_t v3 = *(void *)(*(void *)(v10 + 48) + 8 * v6);
  sub_1BBC319FC(v6);
  *uint64_t v0 = v11;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1BBC31068()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_1BBC38168();
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = sub_1BBC31BE4(v2, v1);
  uint64_t v10 = v3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
  uint64_t v4 = sub_1BBC37E68();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if ((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v7 = ~v5;
    sub_1BBBFF14C(&qword_1EB9F64E8, (uint64_t *)&unk_1EB9F64F0);
    while ((sub_1BBC37E78() & 1) == 0)
    {
      unint64_t v6 = (v6 + 1) & v7;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
      {
        swift_release();
        __break(1u);
        break;
      }
    }
    swift_release();
    uint64_t v8 = *(void *)(*(void *)(v3 + 48) + 8 * v6);
    sub_1BBC319FC(v6);
    if (sub_1BBC37E78())
    {
      *uint64_t v0 = v10;
      return v8;
    }
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_1BBC31230()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBC381A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BBC313DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6500);
  uint64_t v3 = sub_1BBC381B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v25 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v26 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v26) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v26) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v26) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
    sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
    uint64_t result = sub_1BBC37E68();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v25 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v26) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BBC316D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6500);
  uint64_t v3 = sub_1BBC381B8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    long long v28 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v27 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v27) {
          goto LABEL_33;
        }
        unint64_t v15 = v28[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v27) {
            goto LABEL_33;
          }
          unint64_t v15 = v28[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v27) {
              goto LABEL_33;
            }
            unint64_t v15 = v28[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v27)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v28 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v28[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v27) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v28[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = v2;
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
      sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
      uint64_t result = sub_1BBC37E68();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v17;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_1BBC319FC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1BBC38138();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
      do
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
        uint64_t v10 = sub_1BBC37E68() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_16:
            uint64_t v13 = *(void *)(v3 + 48);
            int64_t v14 = (void *)(v13 + 8 * v2);
            unint64_t v15 = (void *)(v13 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v14 >= v15 + 1))
            {
              *int64_t v14 = *v15;
              int64_t v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1BBC31BE4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6500);
    uint64_t v2 = sub_1BBC381C8();
    uint64_t v14 = v2;
    sub_1BBC38158();
    for (; sub_1BBC38188(); ++*(void *)(v2 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
      swift_dynamicCast();
      if (*(void *)(v2 + 24) <= *(void *)(v2 + 16))
      {
        sub_1BBC316D0();
        uint64_t v2 = v14;
      }
      sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
      uint64_t result = sub_1BBC37E68();
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
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

unint64_t sub_1BBC31E04(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
  sub_1BBC37E68();
  unint64_t result = sub_1BBC38148();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_1BBC31EE4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
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
    swift_retain();
    uint64_t v8 = sub_1BBC38178();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
      swift_dynamicCast();
      *a1 = v18;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1BBC38168();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v16 = sub_1BBC31BE4(v7, result + 1);
    uint64_t v20 = v16;
    if (*(void *)(v16 + 24) <= *(void *)(v16 + 16))
    {
      swift_retain();
      sub_1BBC316D0();
      uint64_t v17 = v20;
    }
    else
    {
      uint64_t v17 = v16;
      swift_retain();
    }
    sub_1BBC31E04(a2, v17);
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
  uint64_t v10 = sub_1BBC37E68();
  uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    uint64_t v15 = swift_retain();
    sub_1BBC321C8(v15, v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v13 = ~v11;
  sub_1BBBFF14C(&qword_1EB9F64E8, (uint64_t *)&unk_1EB9F64F0);
  while ((sub_1BBC37E78() & 1) == 0)
  {
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_11;
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t sub_1BBC321C8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1BBC316D0();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1BBC31230();
      goto LABEL_12;
    }
    sub_1BBC313DC();
  }
  uint64_t v8 = *v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F64F0);
  sub_1BBBFF14C((unint64_t *)&unk_1EB9F64D8, (uint64_t *)&unk_1EB9F64F0);
  uint64_t result = sub_1BBC37E68();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = ~v9;
    sub_1BBBFF14C(&qword_1EB9F64E8, (uint64_t *)&unk_1EB9F64F0);
    do
    {
      uint64_t result = sub_1BBC37E78();
      if (result) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v10;
    }
    while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v11 + 48) + 8 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (!v13)
  {
    *(void *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1BBC384F8();
  __break(1u);
  return result;
}

void sub_1BBC32390(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1BBC37D28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    uint64_t v24 = sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    BOOL v13 = (void *)v24;
  }
  else
  {
    uint64_t v24 = v10;
    id v23 = (id)sub_1BBC37C58();
    id v14 = objc_msgSend(v23, sel_fm_hexString);
    uint64_t v15 = v5;
    uint64_t v16 = sub_1BBC37E98();
    uint64_t v18 = v17;

    uint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v2;
    v19[3] = v16;
    v19[4] = v18;
    aBlock[4] = sub_1BBC32D5C;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBFAD0C;
    aBlock[3] = &block_descriptor_49_1;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = v2;
    sub_1BBC37D48();
    uint64_t v25 = MEMORY[0x1E4FBC860];
    sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
    sub_1BBC38128();
    MEMORY[0x1C1863400](0, v12, v7, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v24);
    swift_release();
  }
}

void sub_1BBC32730(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1BBC37D28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1BBC38DE0;
    uint64_t v15 = *(void *)&v2[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
    uint64_t v14 = *(void *)&v2[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8];
    *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v13 + 64) = sub_1BBC04664();
    *(void *)(v13 + 32) = v15;
    *(void *)(v13 + 40) = v14;
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)v27;
  }
  else
  {
    uint64_t v27 = v10;
    id v26 = (id)sub_1BBC37C58();
    id v17 = objc_msgSend(v26, sel_fm_hexString);
    uint64_t v18 = v5;
    uint64_t v19 = sub_1BBC37E98();
    uint64_t v21 = v20;

    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v2;
    v22[3] = v19;
    v22[4] = v21;
    aBlock[4] = sub_1BBC32D4C;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBFAD0C;
    aBlock[3] = &block_descriptor_43;
    id v23 = _Block_copy(aBlock);
    uint64_t v24 = v2;
    sub_1BBC37D48();
    uint64_t v28 = MEMORY[0x1E4FBC860];
    sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
    sub_1BBBFF14C((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
    sub_1BBC38128();
    MEMORY[0x1C1863400](0, v12, v7, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v27);
    swift_release();
  }
}

unint64_t sub_1BBC32B34()
{
  unint64_t result = qword_1E9F85F78;
  if (!qword_1E9F85F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85F78);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FMNAPSTokenProvidingError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BBC32C24);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNAPSTokenProvidingError()
{
  return &type metadata for FMNAPSTokenProvidingError;
}

uint64_t dispatch thunk of FMNAPSTokenProviding.topicToken()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNAPSTokenProviding.topicToken(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for FMNPushNotificatonHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNPushNotificatonHandler);
}

uint64_t dispatch thunk of FMNPushNotificatonHandler.__allocating_init(topic:namedDelegatePort:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t sub_1BBC32CB0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BBC32CE8()
{
  sub_1BBC2F948(*(void *)(v0 + 16));
}

void sub_1BBC32CF0(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_1BBC32D00(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_1BBC32D10()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBC32D4C()
{
  return sub_1BBC30A90(v0[2], v0[3], v0[4]);
}

uint64_t sub_1BBC32D5C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)(v0[2] + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken);
  *uint64_t v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

unint64_t sub_1BBC32DAC()
{
  unint64_t result = qword_1E9F85FF0;
  if (!qword_1E9F85FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F85FF0);
  }
  return result;
}

uint64_t sub_1BBC32E04()
{
  return sub_1BBC306C4();
}

uint64_t objectdestroy_39Tm()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BBC32E50()
{
}

uint64_t FMNMockClientURLSession.__allocating_init(httpArchiveFileURL:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  FMNMockClientURLSession.init(httpArchiveFileURL:)(a1);
  return v2;
}

uint64_t (*static FMNMockClientURLSession.mockSessionCreationBlock(httpArchiveFileURL:)(uint64_t a1))()
{
  uint64_t v2 = sub_1BBC37C18();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  return sub_1BBC334CC;
}

uint64_t sub_1BBC32FE8(uint64_t a1)
{
  uint64_t v2 = sub_1BBC37C18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1BBC38DE0;
  uint64_t v7 = sub_1BBC37BB8();
  uint64_t v9 = v8;
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 64) = sub_1BBC04664();
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v10 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  type metadata accessor for FMNMockClientURLSession();
  uint64_t v11 = swift_allocObject();
  FMNMockClientURLSession.init(httpArchiveFileURL:)((uint64_t)v5);
  return v11;
}

uint64_t FMNMockClientURLSession.init(httpArchiveFileURL:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[0] = a1;
  uint64_t v3 = sub_1BBC38058();
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = sub_1BBC37D58();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1BBC38068();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue;
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCC68], v5);
  sub_1BBC37D48();
  v13[1] = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F6DA0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6D80);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6D90, (uint64_t *)&unk_1EB9F6D80);
  sub_1BBC38128();
  *(void *)(v1 + v9) = sub_1BBC38098();
  *(void *)(v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL) = 0;
  uint64_t v10 = v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  uint64_t v11 = sub_1BBC37C18();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 32))(v10, v13[0], v11);
  return v2;
}

uint64_t sub_1BBC3343C()
{
  uint64_t v1 = sub_1BBC37C18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1BBC334CC()
{
  uint64_t v1 = *(void *)(sub_1BBC37C18() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1BBC32FE8(v2);
}

uint64_t FMNMockClientURLSession.httpArchiveFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  uint64_t v4 = sub_1BBC37C18();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id sub_1BBC335A0(uint64_t a1, uint64_t a2, void (*a3)(void, unint64_t, void, void *))
{
  sub_1BBC33638();
  uint64_t v4 = (void *)swift_allocError();
  *uint64_t v5 = 3;
  a3(0, 0xF000000000000000, 0, v4);

  id v6 = objc_allocWithZone(MEMORY[0x1E4F29118]);

  return objc_msgSend(v6, sel_init);
}

unint64_t sub_1BBC33638()
{
  unint64_t result = qword_1E9F86008;
  if (!qword_1E9F86008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F86008);
  }
  return result;
}

id sub_1BBC3368C(uint64_t a1, void (*a2)(void, unint64_t, void, void *), uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37C18();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v30 - v13;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v15 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  sub_1BBC379F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1BBBFABBC((uint64_t)v7);
    sub_1BBC33638();
    uint64_t v16 = (void *)swift_allocError();
    *id v17 = 1;
    a2(0, 0xF000000000000000, 0, v16);

    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F290F8]), sel_init);
  }
  else
  {
    uint64_t v31 = (void (*)(void, void, void, void))a2;
    uint64_t v32 = v14;
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v19(v14, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    unint64_t v21 = (v10 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = v33;
    uint64_t v30 = a3;
    uint64_t v23 = swift_allocObject();
    v19((char *)(v23 + v20), v12, v8);
    *(void *)(v23 + v21) = v22;
    uint64_t v24 = (void *)(v23 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v25 = v30;
    *uint64_t v24 = v31;
    v24[1] = v25;
    id v26 = (objc_class *)type metadata accessor for MockURLDataTask();
    uint64_t v27 = (char *)objc_allocWithZone(v26);
    uint64_t v28 = (uint64_t (**)())&v27[OBJC_IVAR____TtC12FMNetworking15MockURLDataTask_executionBlock];
    *uint64_t v28 = sub_1BBC33C0C;
    v28[1] = (uint64_t (*)())v23;
    v34.receiver = v27;
    v34.super_class = v26;
    swift_retain();
    swift_retain();
    id v18 = objc_msgSendSuper2(&v34, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v32, v8);
  }
  return v18;
}

uint64_t sub_1BBC339E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v21[1] = a2;
  uint64_t v7 = sub_1BBC37C18();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BBC38DE0;
  uint64_t v12 = sub_1BBC37BB8();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v11 + 64) = sub_1BBC04664();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v15 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v10, v7);
  uint64_t v19 = (void *)(v18 + v17);
  *uint64_t v19 = a3;
  v19[1] = a4;
  swift_retain();
  sub_1BBC341FC(a1, (uint64_t)sub_1BBC36078, v18);
  return swift_release();
}

uint64_t sub_1BBC33C0C()
{
  return sub_1BBC35D78(sub_1BBC339E8);
}

uint64_t sub_1BBC33C24(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  uint64_t v36 = a2;
  uint64_t v42 = sub_1BBC37D28();
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  char v41 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BBC37D58();
  uint64_t v43 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v40 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37C18();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = sub_1BBC37D38();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a1;
  unint64_t v16 = a1[1];
  uint64_t v17 = a1[3];
  objc_super v34 = (void *)a1[2];
  uint64_t v35 = (void *)v17;
  sub_1BBBFAC1C(0, (unint64_t *)&unk_1EB9F6DB0);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCB48], v11);
  uint64_t v37 = sub_1BBC380A8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v8);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v18, (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  unint64_t v21 = (void *)(v20 + v19);
  uint64_t v22 = v39;
  void *v21 = v38;
  v21[1] = v22;
  uint64_t v23 = (uint64_t *)(v20 + ((v19 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t *v23 = v15;
  v23[1] = v16;
  uint64_t v25 = v34;
  uint64_t v24 = v35;
  _OWORD v23[2] = (uint64_t)v34;
  void v23[3] = (uint64_t)v24;
  aBlock[4] = sub_1BBC361F4;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_33_0;
  id v26 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBC0C0E4(v15, v16);
  id v27 = v25;
  id v28 = v24;
  long long v29 = v40;
  sub_1BBC37D48();
  uint64_t v46 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  uint64_t v30 = v41;
  uint64_t v31 = v42;
  sub_1BBC38128();
  uint64_t v32 = (void *)v37;
  MEMORY[0x1C1863400](0, v29, v30, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v44);
  return swift_release();
}

uint64_t sub_1BBC340E0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BBC38DE0;
  uint64_t v13 = sub_1BBC37BB8();
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v12 + 64) = sub_1BBC04664();
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  unint64_t v16 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  return a2(a4, a5, a6, a7);
}

uint64_t sub_1BBC341FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v6 = sub_1BBC37D28();
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBC37D58();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BBC37C18();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void *)(v3 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v17 = (v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v18 + v16, v15, v12);
  unint64_t v19 = (void *)(v18 + v17);
  uint64_t v20 = v25;
  *unint64_t v19 = v24;
  v19[1] = v20;
  aBlock[4] = sub_1BBC35EF4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_21_0;
  unint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBC37D48();
  uint64_t v30 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v11, v8, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

void sub_1BBC3459C(uint64_t a1, uint64_t a2, void (*a3)(long long *), void (*a4)(long long *))
{
  uint64_t v8 = sub_1BBC37C18();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL);
  if (!v11)
  {
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    uint64_t v27 = (void *)sub_1BBC380B8();
    sub_1BBC38028();
    sub_1BBC37CF8();

    uint64_t v28 = a1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
    unint64_t v29 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = a1;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v30 + v29, (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    uint64_t v31 = (void (**)(long long *))(v30 + ((v10 + v29 + 7) & 0xFFFFFFFFFFFFFFF8));
    char *v31 = a3;
    v31[1] = a4;
    swift_retain();
    swift_retain();
    sub_1BBC34A28(v28, (uint64_t)sub_1BBC35F10, v30);
    swift_release();
    return;
  }
  if (!*(void *)(v11 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_1BBC0A374(a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1BBC38018();
    sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
    uint64_t v32 = (void *)sub_1BBC380B8();
    sub_1BBC37D08();

    sub_1BBC33638();
    uint64_t v33 = swift_allocError();
    *objc_super v34 = 2;
    long long v35 = xmmword_1BBC3B2A0;
    uint64_t v36 = 0;
    uint64_t v37 = v33;
    a3(&v35);
    sub_1BBC054C4(0, 0xF000000000000000);
    uint64_t v26 = (void *)v33;
    goto LABEL_8;
  }
  uint64_t v14 = (uint64_t *)(*(void *)(v11 + 56) + 32 * v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  uint64_t v18 = (void *)v14[2];
  unint64_t v17 = (void *)v14[3];
  sub_1BBC0C0E4(*v14, v16);
  id v19 = v18;
  id v20 = v17;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1BBC38DE0;
  uint64_t v22 = sub_1BBC37BB8();
  uint64_t v24 = v23;
  *(void *)(v21 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v21 + 64) = sub_1BBC04664();
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v24;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v25 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  uint64_t v36 = v18;
  uint64_t v37 = (uint64_t)v17;
  a3(&v35);
  sub_1BBC054C4(v15, v16);

  uint64_t v26 = v17;
LABEL_8:
}

uint64_t sub_1BBC34980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v7 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  return sub_1BBC341FC(a2, a3, a4);
}

uint64_t sub_1BBC34A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v26 = sub_1BBC37D28();
  uint64_t v29 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBC37D58();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1BBC37C18();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void *)(v3 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, v11);
  *(void *)(v17 + v16) = v4;
  uint64_t v18 = (void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v19 = v24;
  *uint64_t v18 = v23;
  v18[1] = v19;
  aBlock[4] = sub_1BBC35D60;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBFAD0C;
  aBlock[3] = &block_descriptor_5;
  id v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBC37D48();
  uint64_t v30 = MEMORY[0x1E4FBC860];
  sub_1BBBFF0B4((unint64_t *)&unk_1EB9F67F0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6830);
  sub_1BBBFF0FC((unint64_t *)&qword_1EB9F6840, (uint64_t *)&unk_1EB9F6830);
  uint64_t v21 = v26;
  sub_1BBC38128();
  MEMORY[0x1C1863400](0, v10, v7, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  return swift_release();
}

uint64_t sub_1BBC34DD4(char *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v101 = a4;
  uint64_t v102 = a3;
  uint64_t v100 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (char *)v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  unint64_t v114 = (char *)v98 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v98 - v11;
  uint64_t v123 = sub_1BBC37C18();
  uint64_t v13 = *(void *)(v123 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v123);
  uint64_t v108 = (char *)v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v106 = (char *)v98 - v17;
  MEMORY[0x1F4188790](v16);
  id v110 = (char *)v98 - v18;
  uint64_t v122 = type metadata accessor for HAREntry();
  uint64_t v121 = *(void *)(v122 - 8);
  MEMORY[0x1F4188790](v122);
  uint64_t v119 = (uint64_t)v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for FMNHTTPArchiveReader();
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v22 = (char *)v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v23 = swift_allocObject();
  long long v124 = xmmword_1BBC38DE0;
  *(_OWORD *)(v23 + 16) = xmmword_1BBC38DE0;
  uint64_t v24 = sub_1BBC37BB8();
  uint64_t v26 = v25;
  *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v23 + 64) = sub_1BBC04664();
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 40) = v26;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  uint64_t v27 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v105 = v13 + 16;
  uint64_t v104 = v28;
  v28(v22, a1, v123);
  id v99 = v22;
  uint64_t v29 = sub_1BBC158AC();
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = v124;
  uint64_t v31 = v29[2];
  uint64_t v32 = MEMORY[0x1E4FBB5C8];
  *(void *)(v30 + 56) = MEMORY[0x1E4FBB550];
  *(void *)(v30 + 64) = v32;
  *(void *)(v30 + 32) = v31;
  uint64_t v33 = (void *)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();
  swift_bridgeObjectRelease();

  uint64_t v34 = v29[2];
  if (!v34)
  {
    swift_bridgeObjectRelease();
    uint64_t v95 = (void *)MEMORY[0x1E4FBC868];
LABEL_33:
    *(void *)(v100 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL) = v95;
    uint64_t v96 = swift_bridgeObjectRelease();
    v102(v96);
    return sub_1BBC35E28((uint64_t)v99, (uint64_t (*)(void))type metadata accessor for FMNHTTPArchiveReader);
  }
  unint64_t v35 = (*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
  v98[1] = v29;
  uint64_t v36 = (uint64_t)v29 + v35;
  uint64_t v117 = *(void *)(v121 + 72);
  uint64_t v121 = v13 + 48;
  uint64_t v113 = (void (**)(char *, uint64_t, uint64_t))(v13 + 32);
  id v112 = (void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v103 = v13;
  uint64_t v118 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  unint64_t v107 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v37 = (uint64_t)v114;
  unint64_t v116 = v12;
  uint64_t v38 = v119;
  uint64_t v109 = v8;
  while (1)
  {
    sub_1BBC1744C(v36, v38);
    uint64_t v39 = v38 + *(int *)(v122 + 24);
    if (*(void *)(v39 + 56))
    {
      uint64_t v40 = qword_1E9F858C8;
      swift_bridgeObjectRetain();
      if (v40 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_1BBC37ED8();
      __swift_project_value_buffer(v41, (uint64_t)qword_1E9F89C48);
      *(void *)&long long v124 = sub_1BBC37EA8();
      unint64_t v43 = v42;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(void *)&long long v124 = 0;
      unint64_t v43 = 0xF000000000000000;
    }
    sub_1BBC37C08();
    uint64_t v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))v121;
    uint64_t v45 = v123;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v121)(v12, 1, v123) == 1)
    {
      sub_1BBBFABBC((uint64_t)v12);
LABEL_4:
      (*v118)(v37, 1, 1, v45);
      sub_1BBC054C4(v124, v43);
LABEL_5:

      uint64_t v38 = v119;
      sub_1BBC35E28(v119, (uint64_t (*)(void))type metadata accessor for HAREntry);
      sub_1BBBFABBC(v37);
      goto LABEL_6;
    }
    uint64_t v46 = *v113;
    unint64_t v120 = v43;
    uint64_t v47 = v110;
    uint64_t v111 = v46;
    v46(v110, (uint64_t)v12, v45);
    uint64_t v48 = *(void *)(v39 + 16);
    uint64_t v49 = *(void *)(v39 + 24);
    uint64_t v50 = *(void *)(v39 + 112);
    long long v115 = *(_OWORD *)v39;
    long long v126 = v115;
    uint64_t v127 = v48;
    uint64_t v128 = v49;
    long long v51 = *(_OWORD *)(v39 + 48);
    long long v129 = *(_OWORD *)(v39 + 32);
    long long v130 = v51;
    long long v52 = *(_OWORD *)(v39 + 80);
    long long v131 = *(_OWORD *)(v39 + 64);
    long long v132 = v52;
    long long v133 = *(_OWORD *)(v39 + 96);
    uint64_t v134 = v50;
    swift_bridgeObjectRetain();
    sub_1BBC15C38();
    id v53 = objc_allocWithZone(MEMORY[0x1E4F28D20]);
    uint64_t v54 = (void *)sub_1BBC37BD8();
    uint64_t v55 = (void *)sub_1BBC37E88();
    swift_bridgeObjectRelease();
    unint64_t v56 = (void *)sub_1BBC37E38();
    uint64_t v37 = (uint64_t)v114;
    swift_bridgeObjectRelease();
    uint64_t v57 = v53;
    uint64_t v58 = (uint64_t)v109;
    id v59 = objc_msgSend(v57, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v54, (void)v115, v55, v56);

    uint64_t v45 = v123;
    uint64_t v60 = *v112;
    uint64_t v61 = v47;
    unint64_t v43 = v120;
    (*v112)(v61, v45);
    if (!v59) {
      goto LABEL_4;
    }
    id v62 = objc_msgSend(v59, sel_URL);
    if (v62)
    {
      unint64_t v63 = v62;
      sub_1BBC37BE8();

      uint64_t v64 = 0;
    }
    else
    {
      uint64_t v64 = 1;
    }
    uint64_t v65 = v123;
    (*v118)(v58, v64, 1, v123);
    sub_1BBC35E88(v58, v37);
    if (v44((char *)v37, 1, v65) == 1)
    {
      sub_1BBC054C4(v124, v43);

      goto LABEL_5;
    }
    uint64_t v66 = v106;
    v111(v106, v37, v65);
    unint64_t v67 = v43;
    uint64_t v68 = (uint64_t)v108;
    v104(v108, v66, v65);
    sub_1BBC0C0E4(v124, v67);
    id v69 = v59;
    id v70 = 0;
    uint64_t v71 = v107;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v125 = v71;
    unint64_t v74 = sub_1BBC0A374(v68);
    uint64_t v75 = v71[2];
    BOOL v76 = (v73 & 1) == 0;
    uint64_t v77 = v75 + v76;
    if (__OFADD__(v75, v76)) {
      break;
    }
    char v78 = v73;
    if (v71[3] >= v77)
    {
      uint64_t v81 = v123;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1BBC0B444();
        uint64_t v81 = v123;
      }
      uint64_t v37 = (uint64_t)v114;
    }
    else
    {
      sub_1BBC0A720(v77, isUniquelyReferenced_nonNull_native);
      unint64_t v79 = sub_1BBC0A374((uint64_t)v108);
      if ((v78 & 1) != (v80 & 1)) {
        goto LABEL_36;
      }
      unint64_t v74 = v79;
      uint64_t v37 = (uint64_t)v114;
      uint64_t v81 = v123;
    }
    uint64_t v82 = v125;
    unint64_t v107 = v125;
    if (v78)
    {
      unint64_t v83 = v69;
      uint64_t v84 = (uint64_t *)(v125[7] + 32 * v74);
      uint64_t v86 = (void *)v84[2];
      uint64_t v85 = (void *)v84[3];
      sub_1BBC054C4(*v84, v84[1]);

      uint64_t v87 = v85;
      uint64_t v81 = v123;

      uint64_t v88 = v124;
      unint64_t v89 = v120;
      uint64_t *v84 = v124;
      v84[1] = v89;
      v84[2] = (uint64_t)v59;
      v84[3] = 0;
    }
    else
    {
      v125[(v74 >> 6) + 8] |= 1 << v74;
      v104((char *)(v82[6] + *(void *)(v103 + 72) * v74), v108, v81);
      int64_t v90 = (void *)(v82[7] + 32 * v74);
      uint64_t v88 = v124;
      unint64_t v91 = v120;
      void *v90 = v124;
      v90[1] = v91;
      v90[2] = v59;
      v90[3] = 0;
      uint64_t v92 = v82[2];
      BOOL v93 = __OFADD__(v92, 1);
      uint64_t v94 = v92 + 1;
      if (v93) {
        goto LABEL_35;
      }
      unint64_t v83 = v69;
      v82[2] = v94;
      unint64_t v89 = v120;
    }
    swift_bridgeObjectRelease();
    v60(v108, v81);
    sub_1BBC054C4(v88, v89);

    v60(v106, v81);
    uint64_t v38 = v119;
    sub_1BBC35E28(v119, (uint64_t (*)(void))type metadata accessor for HAREntry);
LABEL_6:
    uint64_t v12 = v116;
    v36 += v117;
    if (!--v34)
    {
      swift_bridgeObjectRelease();
      uint64_t v95 = v107;
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  uint64_t result = sub_1BBC38508();
  __break(1u);
  return result;
}

uint64_t FMNMockClientURLSession.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  uint64_t v2 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FMNMockClientURLSession.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  uint64_t v2 = sub_1BBC37C18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

id sub_1BBC35A48(uint64_t a1, void (*a2)(void, unint64_t, void, void *), uint64_t a3)
{
  return sub_1BBC3368C(a1, a2, a3);
}

uint64_t sub_1BBC35A6C()
{
  return type metadata accessor for FMNMockClientURLSession();
}

uint64_t type metadata accessor for FMNMockClientURLSession()
{
  uint64_t result = qword_1E9F86010;
  if (!qword_1E9F86010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBC35AC0()
{
  uint64_t result = sub_1BBC37C18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FMNMockClientURLSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNMockClientURLSession);
}

uint64_t dispatch thunk of FMNMockClientURLSession.__allocating_init(httpArchiveFileURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.uploadTask(with:fromFile:completionHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.dataTask(with:completionHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.finishTasksAndInvalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

unsigned char *storeEnumTagSinglePayload for FMNMockClientURLSession.FMNClientError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1BBC35CCCLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNMockClientURLSession.FMNClientError()
{
  return &type metadata for FMNMockClientURLSession.FMNClientError;
}

unint64_t sub_1BBC35D08()
{
  unint64_t result = qword_1E9F86020;
  if (!qword_1E9F86020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F86020);
  }
  return result;
}

uint64_t sub_1BBC35D60()
{
  return sub_1BBC35D78((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBC34DD4);
}

uint64_t sub_1BBC35D78(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_1BBC37C18() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v1 + v3;
  uint64_t v6 = *(void *)(v1 + v4);
  uint64_t v7 = (uint64_t *)(v1 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];

  return a1(v5, v6, v8, v9);
}

uint64_t sub_1BBC35E28(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BBC35E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBC35EF4()
{
  return sub_1BBC35F28((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBC3459C);
}

uint64_t sub_1BBC35F10()
{
  return sub_1BBC35F28(sub_1BBC34980);
}

uint64_t sub_1BBC35F28(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_1BBC37C18() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + v3;
  uint64_t v6 = (uint64_t *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];

  return a1(v4, v5, v7, v8);
}

uint64_t sub_1BBC35FD0()
{
  uint64_t v1 = sub_1BBC37C18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1BBC36078(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_1BBC37C18() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4;
  unint64_t v6 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];

  return sub_1BBC33C24(a1, v5, v7, v8);
}

uint64_t sub_1BBC36118()
{
  uint64_t v1 = sub_1BBC37C18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  uint64_t v6 = v0 + v5;
  unint64_t v7 = *(void *)(v0 + v5 + 8);
  if (v7 >> 60 != 15) {
    sub_1BBC025A4(*(void *)v6, v7);
  }

  return MEMORY[0x1F4186498](v0, v5 + 32, v3 | 7);
}

uint64_t sub_1BBC361F4()
{
  uint64_t v1 = *(void *)(sub_1BBC37C18() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0 + v2;
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + v3);
  uint64_t v6 = *(void *)(v0 + v3 + 8);
  unint64_t v7 = (uint64_t *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  uint64_t v10 = v7[2];
  uint64_t v11 = v7[3];

  return sub_1BBC340E0(v4, v5, v6, v8, v9, v10, v11);
}

uint64_t FMNHTTPArchiveWriter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FMNHTTPArchiveWriter.init()()
{
  return v0;
}

uint64_t sub_1BBC362C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v76 = sub_1BBC37ED8();
  uint64_t v4 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  uint64_t v75 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v65 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F86028);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = type metadata accessor for HAREntry();
  uint64_t v15 = *(void *)(v91 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v91);
  uint64_t v84 = (uint64_t)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v78 = (uint64_t)&v65 - v18;
  uint64_t v19 = sub_1BBC37AA8();
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v22 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v70 = v23;
  id v69 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v21)
  {
    id v62 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_29;
  }
  uint64_t v66 = v19;
  uint64_t v86 = v11;
  uint64_t v68 = v2;
  uint64_t v74 = *MEMORY[0x1E4F18F90];
  char v73 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  int64_t v90 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v77 = v15;
  uint64_t v72 = (uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  uint64_t v67 = a1;
  uint64_t v24 = (void **)(a1 + 48);
  long long v71 = xmmword_1BBC3B3C0;
  uint64_t v87 = v22;
  uint64_t v85 = v9;
  do
  {
    uint64_t v25 = *v24;
    if (!*v24) {
      goto LABEL_4;
    }
    long long v88 = *(_OWORD *)v24;
    uint64_t v89 = (uint64_t)*(v24 - 2);
    unint64_t v98 = (unint64_t)*(v24 - 1);
    id v26 = objc_msgSend(v25, sel_URL);
    if (v26)
    {
      uint64_t v27 = v26;
      sub_1BBC37BE8();

      uint64_t v28 = sub_1BBC37C18();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 0, 1, v28);
    }
    else
    {
      uint64_t v28 = sub_1BBC37C18();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 1, 1, v28);
    }
    uint64_t v29 = (uint64_t)v86;
    sub_1BBC35E88((uint64_t)v9, (uint64_t)v86);
    sub_1BBC37C18();
    uint64_t v30 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v29, 1, v28) == 1)
    {
      sub_1BBBFDF14(v29, (uint64_t *)&unk_1EB9F6558);
      uint64_t v9 = v85;
LABEL_4:
      (*v90)(v14, 1, 1, v91);
LABEL_5:
      sub_1BBBFDF14((uint64_t)v14, &qword_1E9F86028);
      goto LABEL_6;
    }
    uint64_t v83 = sub_1BBC37BB8();
    uint64_t v32 = v31;
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v28);
    id v33 = objc_msgSend(v25, sel_statusCode);
    unint64_t v34 = v98;
    if (v98 >> 60 == 15)
    {
      uint64_t v35 = v91;
      (*v90)(v14, 1, 1, v91);
      swift_bridgeObjectRelease();
      int v36 = (*v72)(v14, 1, v35);
      uint64_t v9 = v85;
      if (v36 == 1) {
        goto LABEL_5;
      }
    }
    else
    {
      id v81 = v33;
      uint64_t v82 = v32;
      uint64_t v80 = sub_1BBC37E98();
      uint64_t v38 = v37;
      uint64_t v39 = v89;
      sub_1BBC02290(v89, v34);
      if (qword_1E9F858C8 != -1) {
        swift_once();
      }
      uint64_t v40 = v76;
      uint64_t v41 = __swift_project_value_buffer(v76, (uint64_t)qword_1E9F89C48);
      (*v73)(v75, v41, v40);
      uint64_t v42 = sub_1BBC37EB8();
      unint64_t v44 = v43;
      if (v43)
      {
        uint64_t v92 = v42;
        unint64_t v93 = v43;
        uint64_t v45 = v42;
        sub_1BBC05470();
        swift_bridgeObjectRetain();
        uint64_t v46 = v45;
        uint64_t v79 = sub_1BBC380E8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v79 = -1;
        uint64_t v46 = v42;
      }
      unint64_t v47 = v98;
      uint64_t v92 = v39;
      unint64_t v93 = v98;
      long long v94 = v88;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_1BBC37448();
      sub_1BBC37C98();
      sub_1BBC054C4(v39, v47);
      uint64_t v49 = v91;
      uint64_t v50 = &v14[*(int *)(v91 + 20)];
      *(void *)uint64_t v50 = 1414745936;
      uint64_t v51 = v83;
      *((void *)v50 + 1) = 0xE400000000000000;
      *((void *)v50 + 2) = v51;
      uint64_t v52 = v80;
      *((void *)v50 + 3) = v82;
      *((void *)v50 + 4) = v52;
      *((void *)v50 + 5) = v38;
      uint64_t v53 = MEMORY[0x1E4FBC860];
      *((void *)v50 + 6) = MEMORY[0x1E4FBC860];
      *((void *)v50 + 7) = v53;
      *((void *)v50 + 8) = v53;
      *((void *)v50 + 9) = -1;
      *((void *)v50 + 11) = 0;
      *((void *)v50 + 12) = 0;
      *((void *)v50 + 10) = -1;
      uint64_t v54 = &v14[*(int *)(v49 + 24)];
      *(void *)uint64_t v54 = v81;
      *((void *)v54 + 1) = 0;
      *((void *)v54 + 2) = 0xE000000000000000;
      *((void *)v54 + 3) = v52;
      *((void *)v54 + 4) = v38;
      *((void *)v54 + 5) = v48;
      *((void *)v54 + 6) = v46;
      *((void *)v54 + 7) = v44;
      *((void *)v54 + 8) = 0;
      *((void *)v54 + 9) = 0;
      *((void *)v54 + 11) = 0;
      *((void *)v54 + 12) = 0;
      *((void *)v54 + 10) = v79;
      *(_OWORD *)(v54 + 104) = v71;
      ((void (*)(char *, void, uint64_t))*v90)(v14, 0, 1);
      uint64_t v9 = v85;
    }
    uint64_t v55 = v78;
    sub_1BBC1750C((uint64_t)v14, v78);
    sub_1BBC1750C(v55, v84);
    if (swift_isUniquelyReferenced_nonNull_native()) {
      unint64_t v56 = v87;
    }
    else {
      unint64_t v56 = (void *)sub_1BBC0B990(0, v87[2] + 1, 1, v87);
    }
    unint64_t v58 = v56[2];
    unint64_t v57 = v56[3];
    uint64_t v59 = v77;
    if (v58 >= v57 >> 1)
    {
      size_t v61 = sub_1BBC0B990(v57 > 1, v58 + 1, 1, v56);
      uint64_t v59 = v77;
      unint64_t v56 = (void *)v61;
    }
    v56[2] = v58 + 1;
    unint64_t v60 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    uint64_t v87 = v56;
    sub_1BBC1750C(v84, (uint64_t)v56 + v60 + *(void *)(v59 + 72) * v58);
LABEL_6:
    v24 += 4;
    --v21;
  }
  while (v21);
  swift_bridgeObjectRelease();
  uint64_t v19 = v66;
  id v62 = v87;
LABEL_29:
  sub_1BBC37AE8();
  swift_allocObject();
  sub_1BBC37AD8();
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, *MEMORY[0x1E4F26D10], v19);
  sub_1BBC37AB8();
  uint64_t v92 = 3288625;
  unint64_t v93 = 0xE300000000000000;
  *(void *)&long long v94 = v62;
  *((void *)&v94 + 1) = 0xD000000000000010;
  unint64_t v95 = 0x80000001BBC3CE10;
  uint64_t v96 = 3157553;
  unint64_t v97 = 0xE300000000000000;
  sub_1BBC36BEC();
  uint64_t v63 = sub_1BBC37AC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  return v63;
}

unint64_t sub_1BBC36BEC()
{
  unint64_t result = qword_1E9F86030;
  if (!qword_1E9F86030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F86030);
  }
  return result;
}

uint64_t sub_1BBC36C40(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = sub_1BBC37ED8();
  uint64_t v4 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  id v69 = (char *)v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F6558);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v63 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F86028);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for HAREntry();
  uint64_t v15 = MEMORY[0x1F4188790](v83);
  uint64_t v78 = (uint64_t)v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v72 = (uint64_t)v63 - v18;
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19)
  {
    size_t v61 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_29;
  }
  v63[1] = a2;
  uint64_t v20 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v67 = *MEMORY[0x1E4F18F90];
  uint64_t v66 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v82 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v71 = v17;
  uint64_t v65 = (uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  v63[0] = a1;
  uint64_t v21 = (void **)(a1 + 48);
  long long v64 = xmmword_1BBC3B3C0;
  uint64_t v80 = v20;
  uint64_t v68 = v9;
  uint64_t v76 = v11;
  do
  {
    uint64_t v22 = *v21;
    if (!*v21) {
      goto LABEL_4;
    }
    long long v81 = *(_OWORD *)v21;
    uint64_t v23 = (uint64_t)*(v21 - 2);
    unint64_t v24 = (unint64_t)*(v21 - 1);
    id v25 = objc_msgSend(v22, sel_URL, v63[0]);
    if (v25)
    {
      id v26 = v25;
      sub_1BBC37BE8();

      uint64_t v27 = sub_1BBC37C18();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 0, 1, v27);
    }
    else
    {
      uint64_t v27 = sub_1BBC37C18();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 1, 1, v27);
    }
    sub_1BBC35E88((uint64_t)v9, (uint64_t)v11);
    sub_1BBC37C18();
    uint64_t v28 = (uint64_t)v11;
    uint64_t v29 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v28, 1, v27) == 1)
    {
      sub_1BBBFDF14(v28, (uint64_t *)&unk_1EB9F6558);
      uint64_t v11 = (char *)v28;
LABEL_4:
      (*v82)(v14, 1, 1, v83);
LABEL_5:
      sub_1BBBFDF14((uint64_t)v14, &qword_1E9F86028);
      goto LABEL_6;
    }
    uint64_t v79 = v23;
    uint64_t v30 = v14;
    uint64_t v31 = v9;
    uint64_t v77 = sub_1BBC37BB8();
    uint64_t v33 = v32;
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v27);
    id v34 = objc_msgSend(v22, sel_statusCode);
    if (v24 >> 60 == 15)
    {
      uint64_t v35 = v30;
      int v36 = v30;
      uint64_t v37 = v83;
      (*v82)(v36, 1, 1, v83);
      swift_bridgeObjectRelease();
      int v38 = (*v65)(v35, 1, v37);
      uint64_t v11 = v76;
      uint64_t v9 = v31;
      uint64_t v14 = v35;
      if (v38 == 1) {
        goto LABEL_5;
      }
    }
    else
    {
      id v74 = v34;
      uint64_t v75 = v33;
      uint64_t v73 = sub_1BBC37E98();
      uint64_t v40 = v39;
      sub_1BBC02290(v79, v24);
      if (qword_1E9F858C8 != -1) {
        swift_once();
      }
      uint64_t v41 = v70;
      uint64_t v42 = __swift_project_value_buffer(v70, (uint64_t)qword_1E9F89C48);
      (*v66)(v69, v42, v41);
      uint64_t v43 = sub_1BBC37EB8();
      uint64_t v45 = v43;
      unint64_t v46 = v44;
      uint64_t v14 = v30;
      if (v44)
      {
        uint64_t v84 = v43;
        unint64_t v85 = v44;
        sub_1BBC05470();
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_1BBC380E8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v47 = -1;
      }
      uint64_t v48 = v79;
      uint64_t v84 = v79;
      unint64_t v85 = v24;
      long long v86 = v81;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_1BBC37448();
      sub_1BBC37C98();
      sub_1BBC054C4(v48, v24);
      uint64_t v50 = v83;
      uint64_t v51 = &v14[*(int *)(v83 + 20)];
      *(void *)uint64_t v51 = 1414745936;
      uint64_t v52 = v77;
      *((void *)v51 + 1) = 0xE400000000000000;
      *((void *)v51 + 2) = v52;
      uint64_t v53 = v73;
      *((void *)v51 + 3) = v75;
      *((void *)v51 + 4) = v53;
      *((void *)v51 + 5) = v40;
      uint64_t v54 = MEMORY[0x1E4FBC860];
      *((void *)v51 + 6) = MEMORY[0x1E4FBC860];
      *((void *)v51 + 7) = v54;
      *((void *)v51 + 8) = v54;
      *((void *)v51 + 9) = -1;
      *((void *)v51 + 11) = 0;
      *((void *)v51 + 12) = 0;
      *((void *)v51 + 10) = -1;
      uint64_t v55 = &v14[*(int *)(v50 + 24)];
      *(void *)uint64_t v55 = v74;
      *((void *)v55 + 1) = 0;
      *((void *)v55 + 2) = 0xE000000000000000;
      *((void *)v55 + 3) = v53;
      *((void *)v55 + 4) = v40;
      *((void *)v55 + 5) = v49;
      *((void *)v55 + 6) = v45;
      *((void *)v55 + 7) = v46;
      *((void *)v55 + 8) = 0;
      *((void *)v55 + 9) = 0;
      *((void *)v55 + 11) = 0;
      *((void *)v55 + 12) = 0;
      *((void *)v55 + 10) = v47;
      *(_OWORD *)(v55 + 104) = v64;
      ((void (*)(char *, void, uint64_t))*v82)(v14, 0, 1);
      uint64_t v9 = v68;
      uint64_t v11 = v76;
    }
    uint64_t v56 = v72;
    sub_1BBC1750C((uint64_t)v14, v72);
    sub_1BBC1750C(v56, v78);
    if (swift_isUniquelyReferenced_nonNull_native()) {
      unint64_t v57 = v80;
    }
    else {
      unint64_t v57 = (void *)sub_1BBC0B990(0, v80[2] + 1, 1, v80);
    }
    unint64_t v59 = v57[2];
    unint64_t v58 = v57[3];
    if (v59 >= v58 >> 1) {
      unint64_t v57 = (void *)sub_1BBC0B990(v58 > 1, v59 + 1, 1, v57);
    }
    v57[2] = v59 + 1;
    unint64_t v60 = (*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
    uint64_t v80 = v57;
    sub_1BBC1750C(v78, (uint64_t)v57 + v60 + *(void *)(v71 + 72) * v59);
LABEL_6:
    v21 += 4;
    --v19;
  }
  while (v19);
  swift_bridgeObjectRelease();
  size_t v61 = v80;
LABEL_29:
  uint64_t v84 = 3288625;
  unint64_t v85 = 0xE300000000000000;
  *(void *)&long long v86 = v61;
  *((void *)&v86 + 1) = 0xD000000000000010;
  unint64_t v87 = 0x80000001BBC3CE10;
  uint64_t v88 = 3157553;
  unint64_t v89 = 0xE300000000000000;
  sub_1BBC376C0((uint64_t)&v84);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease_n();
}

uint64_t FMNHTTPArchiveWriter.deinit()
{
  return v0;
}

uint64_t FMNHTTPArchiveWriter.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1BBC37448()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  id v2 = objc_msgSend(v1, sel_allHeaderFields);
  uint64_t v3 = sub_1BBC37E48();

  unint64_t v4 = sub_1BBBFFBC4(v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4) {
    return MEMORY[0x1E4FBC860];
  }
  int64_t v6 = 0;
  uint64_t v7 = *(void *)(v4 + 64);
  unint64_t v27 = v4 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v28 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if ((v9 & v7) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v12 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v6 << 6))
  {
    uint64_t v17 = 16 * i;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + v17);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = (uint64_t *)(*(void *)(v4 + 56) + v17);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1BBC0BB64(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
      uint64_t v11 = result;
    }
    unint64_t v25 = *(void *)(v11 + 16);
    unint64_t v24 = *(void *)(v11 + 24);
    if (v25 >= v24 >> 1)
    {
      uint64_t result = (uint64_t)sub_1BBC0BB64((char *)(v24 > 1), v25 + 1, 1, (char *)v11);
      uint64_t v11 = result;
    }
    *(void *)(v11 + 16) = v25 + 1;
    id v26 = (void *)(v11 + 32 * v25);
    v26[4] = v20;
    v26[5] = v19;
    v26[6] = v23;
    v26[7] = v22;
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v14 >= v28) {
      goto LABEL_28;
    }
    unint64_t v15 = *(void *)(v27 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v27 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v28) {
          goto LABEL_28;
        }
        unint64_t v15 = *(void *)(v27 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v28)
  {
LABEL_28:
    swift_release();
    return v11;
  }
  unint64_t v15 = *(void *)(v27 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v28) {
      goto LABEL_28;
    }
    unint64_t v15 = *(void *)(v27 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1BBC376C0(uint64_t a1)
{
  uint64_t v2 = sub_1BBC37AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBC37AE8();
  swift_allocObject();
  sub_1BBC37AD8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F26D10], v2);
  sub_1BBC37AB8();
  long long v6 = *(_OWORD *)(a1 + 16);
  v11[1] = *(_OWORD *)a1;
  _OWORD v11[2] = v6;
  v11[3] = *(_OWORD *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  sub_1BBC36BEC();
  uint64_t v7 = sub_1BBC37AC8();
  unint64_t v9 = v8;
  swift_release();
  sub_1BBC37C28();
  return sub_1BBC025A4(v7, v9);
}

uint64_t type metadata accessor for FMNHTTPArchiveWriter()
{
  return self;
}

uint64_t method lookup function for FMNHTTPArchiveWriter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FMNHTTPArchiveWriter);
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.encodeResponses(mockResponses:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.saveResponses(mockResponses:fileURL:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_1BBC379B8()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_1BBC379C8()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1BBC379D8()
{
  return MEMORY[0x1F40E2EB8]();
}

uint64_t sub_1BBC379E8()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1BBC379F8()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1BBC37A08()
{
  return MEMORY[0x1F40E2F10]();
}

uint64_t sub_1BBC37A18()
{
  return MEMORY[0x1F40E2F30]();
}

uint64_t sub_1BBC37A28()
{
  return MEMORY[0x1F40E2F40]();
}

uint64_t sub_1BBC37A38()
{
  return MEMORY[0x1F40E2F50]();
}

uint64_t sub_1BBC37A48()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1BBC37A58()
{
  return MEMORY[0x1F40E3008]();
}

uint64_t sub_1BBC37A68()
{
  return MEMORY[0x1F40E3020]();
}

uint64_t sub_1BBC37A78()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1BBC37A88()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1BBC37A98()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1BBC37AA8()
{
  return MEMORY[0x1F40E30F0]();
}

uint64_t sub_1BBC37AB8()
{
  return MEMORY[0x1F40E3108]();
}

uint64_t sub_1BBC37AC8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1BBC37AD8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1BBC37AE8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1BBC37AF8()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1BBC37B08()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1BBC37B18()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1BBC37B28()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1BBC37B38()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1BBC37B48()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1BBC37B58()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1BBC37B68()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1BBC37B78()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1BBC37B88()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1BBC37B98()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BBC37BA8()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1BBC37BB8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1BBC37BC8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1BBC37BD8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BBC37BE8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1BBC37BF8()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1BBC37C08()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1BBC37C18()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BBC37C28()
{
  return MEMORY[0x1F41192B0]();
}

uint64_t sub_1BBC37C38()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1BBC37C48()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1BBC37C58()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BBC37C68()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1BBC37C78()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BBC37C88()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1BBC37C98()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BBC37CA8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BBC37CB8()
{
  return MEMORY[0x1F41192C0]();
}

uint64_t sub_1BBC37CC8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1BBC37CD8()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1BBC37CE8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BBC37CF8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BBC37D08()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1BBC37D18()
{
  return MEMORY[0x1F41192C8]();
}

uint64_t sub_1BBC37D28()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BBC37D38()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1BBC37D48()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BBC37D58()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BBC37D68()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BBC37D78()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BBC37D88()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BBC37D98()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BBC37DA8()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BBC37DB8()
{
  return MEMORY[0x1F414A0D0]();
}

uint64_t sub_1BBC37DC8()
{
  return MEMORY[0x1F414A0D8]();
}

uint64_t sub_1BBC37DD8()
{
  return MEMORY[0x1F414A0E0]();
}

uint64_t sub_1BBC37DE8()
{
  return MEMORY[0x1F414A0E8]();
}

uint64_t sub_1BBC37DF8()
{
  return MEMORY[0x1F414A0F0]();
}

uint64_t sub_1BBC37E08()
{
  return MEMORY[0x1F414A0F8]();
}

uint64_t sub_1BBC37E18()
{
  return MEMORY[0x1F414A100]();
}

uint64_t sub_1BBC37E28()
{
  return MEMORY[0x1F414A108]();
}

uint64_t sub_1BBC37E38()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BBC37E48()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BBC37E58()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1BBC37E68()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BBC37E78()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BBC37E88()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BBC37E98()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BBC37EA8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1BBC37EB8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1BBC37EC8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BBC37ED8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BBC37EE8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BBC37EF8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1BBC37F08()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BBC37F18()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BBC37F28()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1BBC37F38()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1BBC37F58()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1BBC37F68()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1BBC37F78()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1BBC37F88()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1BBC37F98()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1BBC37FA8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BBC37FB8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1BBC37FC8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BBC37FD8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1BBC37FE8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BBC37FF8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BBC38008()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1BBC38018()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BBC38028()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BBC38038()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1BBC38048()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1BBC38058()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BBC38068()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BBC38078()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1BBC38088()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BBC38098()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BBC380A8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1BBC380B8()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1BBC380C8()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BBC380D8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BBC380E8()
{
  return MEMORY[0x1F40E6C00]();
}

uint64_t sub_1BBC380F8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1BBC38108()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1BBC38118()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BBC38128()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BBC38138()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BBC38148()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1BBC38158()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BBC38168()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1BBC38178()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1BBC38188()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BBC38198()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1BBC381A8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BBC381B8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BBC381C8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1BBC381D8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BBC381E8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BBC381F8()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1BBC38208()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1BBC38218()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BBC38228()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BBC38238()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BBC38248()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BBC38258()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BBC38268()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BBC38278()
{
  return MEMORY[0x1F41854D0]();
}

uint64_t sub_1BBC38288()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1BBC38298()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1BBC382A8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BBC382B8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1BBC382C8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1BBC382D8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1BBC382E8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BBC382F8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1BBC38308()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BBC38318()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1BBC38328()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BBC38338()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1BBC38348()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BBC38358()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1BBC38368()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BBC38378()
{
  return MEMORY[0x1F4185780]();
}

uint64_t sub_1BBC38388()
{
  return MEMORY[0x1F41857C0]();
}

uint64_t sub_1BBC38398()
{
  return MEMORY[0x1F41857C8]();
}

uint64_t sub_1BBC383A8()
{
  return MEMORY[0x1F41857D0]();
}

uint64_t sub_1BBC383B8()
{
  return MEMORY[0x1F4185818]();
}

uint64_t sub_1BBC383C8()
{
  return MEMORY[0x1F4185878]();
}

uint64_t sub_1BBC383D8()
{
  return MEMORY[0x1F4185888]();
}

uint64_t sub_1BBC383E8()
{
  return MEMORY[0x1F41858B0]();
}

uint64_t sub_1BBC383F8()
{
  return MEMORY[0x1F41858B8]();
}

uint64_t sub_1BBC38408()
{
  return MEMORY[0x1F41858C0]();
}

uint64_t sub_1BBC38418()
{
  return MEMORY[0x1F41858D0]();
}

uint64_t sub_1BBC38428()
{
  return MEMORY[0x1F4185900]();
}

uint64_t sub_1BBC38438()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1BBC38448()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BBC38458()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1BBC38468()
{
  return MEMORY[0x1F4185C38]();
}

uint64_t sub_1BBC38478()
{
  return MEMORY[0x1F4185C40]();
}

uint64_t sub_1BBC38488()
{
  return MEMORY[0x1F4185C48]();
}

uint64_t sub_1BBC38498()
{
  return MEMORY[0x1F4185C58]();
}

uint64_t sub_1BBC384A8()
{
  return MEMORY[0x1F4185C60]();
}

uint64_t sub_1BBC384B8()
{
  return MEMORY[0x1F4185C68]();
}

uint64_t sub_1BBC384C8()
{
  return MEMORY[0x1F4185C70]();
}

uint64_t sub_1BBC384D8()
{
  return MEMORY[0x1F4185C80]();
}

uint64_t sub_1BBC384E8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1BBC384F8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BBC38508()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BBC38518()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1BBC38528()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BBC38538()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BBC38548()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BBC38558()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BBC38568()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1BBC38578()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BBC38588()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BBC38598()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BBC385A8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1BBC385B8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BBC385C8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BBC385D8()
{
  return MEMORY[0x1F4186288]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1F41868A8]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1F41868B0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1F41868D0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1F41868D8]();
}